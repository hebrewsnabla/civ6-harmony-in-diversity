-------------------------------------
--       Adjacency Adjustments     --
-------------------------------------

-------------------------------------
-- Districts
delete from District_Adjacencies where (DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' or DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_INDUSTRIAL_ZONE')) and
	(YieldChangeId = 'LumberMill_HalfProduction' or YieldChangeId = 'Minel_HalfProduction' or YieldChangeId = 'Quarry_Production');
delete from District_Adjacencies where DistrictType = 'DISTRICT_HANSA' and
	(YieldChangeId = 'Resource_Production' or YieldChangeId = 'Commerical_Hub_Production');
delete from District_Adjacencies where (DistrictType = 'DISTRICT_HARBOR' or DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR')) and
	(YieldChangeId = 'Harbor_City_Gold' or YieldChangeId = 'RoyalDock_City_Gold' or YieldChangeId = 'SeaResource_Gold');

insert or replace into District_Adjacencies
	(DistrictType,					YieldChangeId)
select
	'DISTRICT_INDUSTRIAL_ZONE',		DistrictType||'_Industrial_Production'
from Districts where (DistrictType = 'DISTRICT_HARBOR') or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));

insert or replace into District_Adjacencies
	(DistrictType,					YieldChangeId)
values
	('DISTRICT_INDUSTRIAL_ZONE',	'Oil_Industrial_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'Sea_Oil_Industrial_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'Aerodrome_Industrial_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'HD_Mine_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',	'HD_Mine_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'HD_Quarry_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',	'HD_Quarry_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'HD_LumberMill_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',	'HD_LumberMill_Production'),
	('DISTRICT_COMMERCIAL_HUB',		'HD_Commercial_Canal_Gold'),
	('DISTRICT_COMMERCIAL_HUB',		'HD_Commercial_Luxury_Gold'),
	('DISTRICT_COMMERCIAL_HUB',		'District_Gold_Hansa'),
	('DISTRICT_COMMERCIAL_HUB',		'District_Gold_City_Center'),
	('DISTRICT_HARBOR',				'HD_Harbor_City_Gold'),
	('DISTRICT_HARBOR',				'HD_SeaResource_Gold'),
	('DISTRICT_THEATER',			'District_Culture_City_Center'),
	('DISTRICT_ENCAMPMENT',			'Strategic_Production2'),
	('DISTRICT_AQUEDUCT',			'Aqueduct_self_food'),
	-- UD
	('DISTRICT_BATH',				'Aqueduct_self_food'),
	('DISTRICT_ROYAL_NAVY_DOCKYARD','District_Gold_Industrial_Zone'),
	('DISTRICT_ACROPOLIS',			'District_Culture_Double_City_Center'),
	('DISTRICT_HANSA',				'Oil_Industrial_Production'),
	('DISTRICT_HANSA',				'Sea_Oil_Industrial_Production'),
	('DISTRICT_HANSA',				'Aerodrome_Industrial_Production'),
	('DISTRICT_HANSA',				'River_Hansa_Production'),
	('DISTRICT_HANSA',				'Bath_Production'),
	('DISTRICT_HANSA',				'HD_Commerical_Hub_Production'), -- TODO: Hansa & Suguba
	('DISTRICT_HANSA',				'HD_Commerical_Hub_Production_Late'), -- TODO: Hansa & Suguba
	('DISTRICT_HANSA',				'HD_Resource_Production'),
	('DISTRICT_HANSA',				'HD_Resource_Production_Late');

insert or replace into District_Adjacencies
	(DistrictType,					YieldChangeId)
select
	'DISTRICT_HANSA',				DistrictType||'_Hansa_Production'
from Districts where (DistrictType = 'DISTRICT_HARBOR') or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));

-- UD supports
insert or ignore into District_Adjacencies  (DistrictType,	YieldChangeId)
select b.CivUniqueDistrictType,	a.YieldChangeId from District_Adjacencies a, DistrictReplaces b
where a.DistrictType = b.ReplacesDistrictType 
	and b.CivUniqueDistrictType != 'DISTRICT_OBSERVATORY'
	and b.CivUniqueDistrictType != 'DISTRICT_SEOWON'
	and b.CivUniqueDistrictType != 'DISTRICT_HANSA';

delete from District_Adjacencies where DistrictType = 'DISTRICT_ACROPOLIS' and YieldChangeId = 'District_Culture_City_Center';
delete from District_Adjacencies where DistrictType = 'DISTRICT_OPPIDUM' and (
	YieldChangeId = 'Strategic_Production'
	or YieldChangeId = 'HD_Mine_HalfProduction'
	or YieldChangeId = 'HD_Quarry_HalfProduction'
	or YieldChangeId = 'HD_Quarry_Production');
	-- or YieldChangeId = 'HD_LumberMill_HalfProduction'
	-- or YieldChangeId = 'HD_LumberMill_Production'

-- Adjacency definition

-- Habor & Commercial
insert or replace into Adjacency_YieldChanges
	(ID,								Description,				YieldType,	YieldChange,	TilesRequired,	AdjacentSeaResource,	AdjacentDistrict)
values
	('HD_SeaResource_Gold',				'LOC_DISTRICT_SEARESOURCE_GOLD',		'YIELD_GOLD',	2,	1,	1,	NULL),
	('District_Gold_Industrial_Zone',	'LOC_DISTRICT_GOLD_INDUSTRIAL_ZONE',	'YIELD_GOLD',	2,	1,	0,	'DISTRICT_INDUSTRIAL_ZONE'),
	('District_Gold_Hansa',				'LOC_DISTRICT_GOLD_HANSA',				'YIELD_GOLD',	2,	1,	0,	'DISTRICT_HANSA'),
	-- ('HD_Commercial_Hub_Gold',			'LOC_DISTRICT_COMMERCIAL_GOLD', 		'YIELD_GOLD',	2,	1,	0,	'DISTRICT_COMMERCIAL_HUB'),
	-- ('HD_Suguba_Gold',					'LOC_DISTRICT_SUGUBA_GOLD', 			'YIELD_GOLD',	2,	1,	0,	'DISTRICT_SUGUBA'),
	('HD_Commercial_Canal_Gold',		'LOC_DISTRICT_CANAL_GOLD', 				'YIELD_GOLD',	3,	1,	0,	'DISTRICT_CANAL');

insert or replace into Adjacency_YieldChanges
	(ID,								Description,				YieldType, 		YieldChange,	TilesRequired,	AdjacentResourceClass)
values
	('HD_Commercial_Luxury_Gold',		'LOC_DISTRICT_LUXURY_GOLD', 'YIELD_GOLD',	2,				1,				'RESOURCECLASS_LUXURY');

-- City Center related
insert or replace into Adjacency_YieldChanges
	(ID,									Description,					YieldType,	YieldChange,	TilesRequired,	AdjacentDistrict)
values
	('HD_Harbor_City_Gold',					'LOC_DISTRICT_CITY_CENTER_GOLD',			'YIELD_GOLD',		2,	1,	'DISTRICT_CITY_CENTER'),
	('District_Gold_City_Center',			'LOC_DISTRICT_GOLD_CITY_CENTER',			'YIELD_GOLD',		1,	1,	'DISTRICT_CITY_CENTER'),
	('District_Culture_Double_City_Center',	'LOC_DISTRICT_CULTURE_DOUBLE_CITY_CENTER',	'YIELD_CULTURE',	2,	1,	'DISTRICT_CITY_CENTER');

insert or replace into Adjacency_YieldChanges
	(ID,						Description,						YieldType,		YieldChange,	Self)
values
	('Aqueduct_self_food',		'LOC_AQUEDUCT_SELF_FOOD',			'YIELD_FOOD',	1,				1);

-- Industry
update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_APPRENTICESHIP' where ID = 'Commerical_Hub_Production';
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'Aqueduct_Production';
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'Dam_Production';
update Adjacency_YieldChanges set YieldChange = 3 where ID = 'Canal_Production';

insert or replace into Adjacency_YieldChanges
	(ID,								Description,									YieldType,			YieldChange,	TilesRequired,
	AdjacentImprovement,			PrereqCivic,	PrereqTech,			ObsoleteCivic,	ObsoleteTech)
values
	('Oil_Industrial_Production',		'LOC_DISTRICT_OIL_INDUSTRIAL_PRODUCTION',		'YIELD_PRODUCTION',	1,				1,
	'IMPROVEMENT_OIL_WELL',			NULL,			NULL,				NULL,			NULL),
	('Sea_Oil_Industrial_Production',	'LOC_DISTRICT_SEAOIL_INDUSTRIAL_PRODUCTION',	'YIELD_PRODUCTION',	1,				1,
	'IMPROVEMENT_OFFSHORE_OIL_RIG',	NULL,			NULL,				NULL,			NULL),
	-- Mine, METAL CASTING
	('HD_Mine_HalfProduction',			'LOC_DISTRICT_MINE_HALF_PRODUCTION',			'YIELD_PRODUCTION',	1,				2,
	'IMPROVEMENT_MINE',				NULL,			NULL,				NULL,			'TECH_METAL_CASTING'),
	('HD_Mine_Production',				'LOC_DISTRICT_MINE_PRODUCTION',					'YIELD_PRODUCTION',	1,				1,
	'IMPROVEMENT_MINE',				NULL,			'TECH_METAL_CASTING',	NULL,	NULL),
	-- Quarry, APPRENTICESHIP
	('HD_Quarry_HalfProduction',		'LOC_DISTRICT_QUARRY_HALF_PRODUCTION',			'YIELD_PRODUCTION',	1,				2,
	'IMPROVEMENT_QUARRY',			NULL,			NULL,				NULL,			'TECH_APPRENTICESHIP'),
	('HD_Quarry_Production',			'LOC_DISTRICT_QUARRY_PRODUCTION',				'YIELD_PRODUCTION',	1,				1,
	'IMPROVEMENT_QUARRY',			NULL,			'TECH_APPRENTICESHIP',	NULL,			NULL),
	-- Lumbermill, CONSTRUCTION
	('HD_LumberMill_HalfProduction',	'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',			'YIELD_PRODUCTION',	1,				2,
	'IMPROVEMENT_LUMBER_MILL',		NULL,			NULL,				NULL,			'TECH_CONSTRUCTION'),
	('HD_LumberMill_Production',		'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',			'YIELD_PRODUCTION',	1,				1,
	'IMPROVEMENT_LUMBER_MILL',		NULL,			'TECH_CONSTRUCTION',		NULL,			NULL);

-- Industrial zone adjacent to harbor
insert or replace into Adjacency_YieldChanges
	(ID,									Description,					YieldType, YieldChange, TilesRequired, AdjacentDistrict)
select
	DistrictType||'_Industrial_Production',	'LOC_'||DistrictType||'_INDUSTRIAL_PRODUCTION', 'YIELD_PRODUCTION', 1, 1,	DistrictType
from Districts where DistrictType = 'DISTRICT_HARBOR' or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));

insert or replace into Adjacency_YieldChanges
	(ID,								Description,					YieldType, YieldChange, TilesRequired, AdjacentRiver, AdjacentDistrict, PrereqTech, ObsoleteTech)
values
	('Aerodrome_Industrial_Production',	'LOC_DISTRICT_AERODROME_INDUSTRIAL_PRODUCTION',	'YIELD_PRODUCTION', 2,	1,	0,	'DISTRICT_AERODROME',		NULL,	NULL),
	-- Hansa
	('River_Hansa_Production',			'LOC_DISTRICT_RIVER_HANSA_PRODUCTION', 			'YIELD_PRODUCTION', 2,	1,	1,	NULL,						NULL,	NULL),
	('HD_Commerical_Hub_Production',	'LOC_DISTRICT_COMMERCIAL_HUB_PRODUCTION',		'YIELD_PRODUCTION',	1,	1,	0,	'DISTRICT_COMMERCIAL_HUB',	NULL,	'TECH_APPRENTICESHIP'),
	('HD_Commerical_Hub_Production_Late', 'LOC_DISTRICT_COMMERCIAL_HUB_PRODUCTION',		'YIELD_PRODUCTION',	2,	1,	0,	'DISTRICT_COMMERCIAL_HUB',	'TECH_APPRENTICESHIP',	NULL);

-- Hansa adjacent to harbor
insert or replace into Adjacency_YieldChanges
	(ID,									Description,					YieldType, YieldChange, TilesRequired, AdjacentDistrict)
select
	DistrictType||'_Hansa_Production',	'LOC_'||DistrictType||'_INDUSTRIAL_PRODUCTION', 'YIELD_PRODUCTION', 2, 1,	DistrictType
from Districts where DistrictType = 'DISTRICT_HARBOR' or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));

-- Resource
insert or replace into Adjacency_YieldChanges
	(ID,							Description,	YieldType, YieldChange, TilesRequired, PrereqTech, ObsoleteTech, AdjacentResource)
values
	('HD_Resource_Production',		'LOC_DISTRICT_RESOURCE_PRODUCTION', 'YIELD_PRODUCTION', 1, 1, NULL, 'TECH_APPRENTICESHIP', 1),
	('HD_Resource_Production_Late',	'LOC_DISTRICT_RESOURCE_PRODUCTION', 'YIELD_PRODUCTION', 2, 1, 'TECH_APPRENTICESHIP', NULL, 1);

--军营地基相邻加成
--军营的相邻加成：战略资源+1、飞机场+2、火车站+2锤。各种军事设施+1锤（堡垒包括UI，飞机跑道，导弹井、隧道等军工开的改良）。【现在军营的战略资源+1相邻加成是直接复用的工业区的，不要直接改数值，要新写几个专门给军营用的相邻加成，且要适配UD】
insert or replace into District_Adjacencies
	(DistrictType,								YieldChangeId)
values
	('DISTRICT_ENCAMPMENT',						'Aerodrome_Industrial_Production'),
	('DISTRICT_IKANDA',							'Aerodrome_Industrial_Production'),
	
	('DISTRICT_ENCAMPMENT',						'Station_Production'),
	('DISTRICT_IKANDA',							'Station_Production'),
	
	('DISTRICT_ENCAMPMENT',						'HD_IMPROVEMENT_ROMAN_FORT'),
	('DISTRICT_IKANDA',							'HD_IMPROVEMENT_ROMAN_FORT'),
		
	('DISTRICT_ENCAMPMENT',						'HD_IMPROVEMENT_FORT'),
	('DISTRICT_IKANDA',							'HD_IMPROVEMENT_FORT'),
	
	('DISTRICT_ENCAMPMENT',						'HD_IMPROVEMENT_AIRSTRIP'),
	('DISTRICT_IKANDA',							'HD_IMPROVEMENT_AIRSTRIP'),
	
	('DISTRICT_ENCAMPMENT',						'HD_IMPROVEMENT_MOUNTAIN_TUNNEL'),
	('DISTRICT_IKANDA',							'HD_IMPROVEMENT_MOUNTAIN_TUNNEL'),
	
	('DISTRICT_ENCAMPMENT',						'HD_IMPROVEMENT_MISSILE_SILO'),
	('DISTRICT_IKANDA',							'HD_IMPROVEMENT_MISSILE_SILO'),
	
	('DISTRICT_ENCAMPMENT',						'HD_IMPROVEMENT_MAORI_PA'),
	('DISTRICT_IKANDA',							'HD_IMPROVEMENT_MAORI_PA');
delete from District_Adjacencies where YieldChangeId = 'Station_Production'
	and not exists (select ImprovementType from Improvements where ImprovementType = 'IMPROVEMENT_LEU_STATION');
	
insert or replace into Adjacency_YieldChanges
	(ID,									Description,									YieldType,				YieldChange,				TilesRequired,				AdjacentImprovement)
values
	('HD_IMPROVEMENT_ROMAN_FORT',			'LOC_HD_ENCAMPMENT_AFJACENCY_ROMAN_FORT',		'YIELD_PRODUCTION',		1,							1,							'IMPROVEMENT_ROMAN_FORT'),
	('HD_IMPROVEMENT_FORT',					'LOC_HD_ENCAMPMENT_AFJACENCY_FORT',				'YIELD_PRODUCTION',		1,							1,							'IMPROVEMENT_FORT'),
	('HD_IMPROVEMENT_AIRSTRIP',				'LOC_HD_ENCAMPMENT_AFJACENCY_AIRSTRIP',			'YIELD_PRODUCTION',		1,							1,							'IMPROVEMENT_AIRSTRIP'),
	('HD_IMPROVEMENT_MOUNTAIN_TUNNEL',		'LOC_HD_ENCAMPMENT_AFJACENCY_MOUNTAIN_TUNNEL',	'YIELD_PRODUCTION',		1,							1,							'IMPROVEMENT_MOUNTAIN_TUNNEL'),
	('HD_IMPROVEMENT_MISSILE_SILO',			'LOC_HD_ENCAMPMENT_AFJACENCY_MISSILE_SILO',		'YIELD_PRODUCTION',		1,							1,							'IMPROVEMENT_MISSILE_SILO'),
	('HD_IMPROVEMENT_MAORI_PA',				'LOC_HD_ENCAMPMENT_AFJACENCY_MAORI_PA',			'YIELD_PRODUCTION',		1,							1,							'IMPROVEMENT_MAORI_PA');

insert or ignore into Adjacency_YieldChanges
	(ID,									Description,							YieldType,				YieldChange,				TilesRequired,				AdjacentResourceClass)
values
	('Strategic_Production2',				'LOC_DISTRICT_STRATEGIC_PRODUCTION2',	'YIELD_PRODUCTION',		2,							1,							'RESOURCECLASS_STRATEGIC');

update Adjacency_YieldChanges set PrereqTech = 'TECH_BIOLOGY_HD' where ID = 'Farms_MechanizedAdjacency' or ID = 'Terrace_MechanizedAdjacency';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_BIOLOGY_HD' where ID = 'Farms_MedievalAdjacency' or ID = 'Terrace_MedievalAdjacency';

-- MBZ
insert or replace into Adjacency_YieldChanges
	(ID,				Description,			YieldType,			YieldChange,	Self)
values
	('MBANZA_FOOD',		'LOC_MBANZA_FOOD',		'YIELD_FOOD',		2,				1),
	('MBANZA_GOLD',		'LOC_MBANZA_GOLD',		'YIELD_GOLD',		2,				1);

insert or replace into Adjacency_YieldChanges
	(ID,				Description,				YieldType,				YieldChange,	TilesRequired,		AdjacentResourceClass)
values
	('MBANZA_BONUS',	'LOC_MBANZA_BONUS',			'YIELD_PRODUCTION',		1,				1,					'RESOURCECLASS_BONUS'),
	('MBANZA_LUXURY',	'LOC_MBANZA_LUXURY',		'YIELD_GOLD',			2,				1,					'RESOURCECLASS_LUXURY'),
	('MBANZA_STRATEGIC','LOC_MBANZA_STRATEGIC',		'YIELD_SCIENCE',		1,				1,					'RESOURCECLASS_STRATEGIC');

insert or replace into District_Adjacencies
	(DistrictType,			YieldChangeId)
values
	('DISTRICT_MBANZA',		'MBANZA_FOOD'),
	('DISTRICT_MBANZA',		'MBANZA_GOLD'),
	('DISTRICT_MBANZA',		'MBANZA_BONUS'),
	('DISTRICT_MBANZA',		'MBANZA_LUXURY'),
	('DISTRICT_MBANZA',		'MBANZA_STRATEGIC');