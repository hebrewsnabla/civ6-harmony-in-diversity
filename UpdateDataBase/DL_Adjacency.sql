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
	('DISTRICT_COMMERCIAL_HUB',		'HD_Commercial_Luxury_Gold_Late'),
	('DISTRICT_COMMERCIAL_HUB',		'District_Gold_Hansa'),
	-- ('DISTRICT_COMMERCIAL_HUB',		'District_Gold_City_Center'),
	('DISTRICT_HARBOR',				'HD_Harbor_City_Gold'),
	('DISTRICT_HARBOR',				'HD_SeaResource_Gold'),
	('DISTRICT_THEATER',			'District_Culture_City_Center'),
	('DISTRICT_ENCAMPMENT',			'Strategic_Production'),
	-- UD
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
	(ID,								Description,		YieldType, YieldChange, TilesRequired, PrereqCivic, ObsoleteCivic, AdjacentResourceClass)
values
	('HD_Commercial_Luxury_Gold',		'LOC_DISTRICT_LUXURY_GOLD', 'YIELD_GOLD',	1,	1,	NULL,	'CIVIC_MEDIEVAL_FAIRES',	'RESOURCECLASS_LUXURY'),
	('HD_Commercial_Luxury_Gold_Late',	'LOC_DISTRICT_LUXURY_GOLD',	'YIELD_GOLD',	2,	1,	'CIVIC_MEDIEVAL_FAIRES',	NULL,	'RESOURCECLASS_LUXURY');

-- City Center related
insert or replace into Adjacency_YieldChanges
	(ID,									Description,					YieldType,	YieldChange,	TilesRequired,	AdjacentDistrict)
values
	('HD_Harbor_City_Gold',					'LOC_DISTRICT_CITY_CENTER_GOLD',			'YIELD_GOLD',		1,	1,	'DISTRICT_CITY_CENTER'),
	('District_Gold_City_Center',			'LOC_DISTRICT_GOLD_CITY_CENTER',			'YIELD_GOLD',		1,	1,	'DISTRICT_CITY_CENTER'),
	('District_Culture_Double_City_Center',	'LOC_DISTRICT_CULTURE_DOUBLE_CITY_CENTER',	'YIELD_CULTURE',	2,	1,	'DISTRICT_CITY_CENTER');

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
	('HD_Mine_HalfProduction',			'LOC_DISTRICT_QUARRY_HALF_PRODUCTION',			'YIELD_PRODUCTION',	1,				2,
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

-------------------------------------
-- Improvements
insert or replace into Improvement_Adjacencies
	(ImprovementType,				YieldChangeId)
values
	-- TODO: Support UDs of Industry/Commercial/Harbor/Entertainment
	('IMPROVEMENT_LUMBER_MILL',		'Lumber_Mill_River_Production'),
	('IMPROVEMENT_LUMBER_MILL',		'Lumber_Mill_Industrial_Production'),
	('IMPROVEMENT_MINE',			'Mine_Industrial_Production'),
	('IMPROVEMENT_QUARRY',			'Quarry_Industrial_Production'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Commercial_Gold'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Suguba_Gold'),
	('IMPROVEMENT_PASTURE',			'Pasture_Commercial_Gold'),
	('IMPROVEMENT_PASTURE',			'Pasture_Suguba_Gold'),
	('IMPROVEMENT_CAMP',			'Camp_Commercial_Gold'),
	('IMPROVEMENT_CAMP',			'Camp_Suguba_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Harbor_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Royal_Navy_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Cothon_Gold');

update Adjacency_YieldChanges set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where ID = 'Farms_MedievalAdjacency';

insert or replace into Adjacency_YieldChanges
	(ID,								Description,	YieldType,			YieldChange,	TilesRequired,	AdjacentRiver,
	AdjacentDistrict, 				PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech)
values
	('Lumber_Mill_River_Production', 	'Placeholder', 'YIELD_PRODUCTION',	1,				1,				1,
	NULL,							NULL,			'TECH_BRONZE_WORKING',		NULL,			'TECH_MACHINERY'),
	('Lumber_Mill_Industrial_Production','Placeholder', 'YIELD_PRODUCTION',	1,				1,				0,
	'DISTRICT_INDUSTRIAL_ZONE',		NULL,			NULL,		NULL,			NULL),
	('Mine_Industrial_Production',		'Placeholder', 'YIELD_PRODUCTION',	1,				1,				0,
	'DISTRICT_INDUSTRIAL_ZONE',		NULL,			NULL,		NULL,			NULL),
	('Quarry_Industrial_Production',	'Placeholder', 'YIELD_PRODUCTION',	1,				1,				0,
	'DISTRICT_INDUSTRIAL_ZONE',		NULL,			NULL,		NULL,			NULL),
	('Plantation_Commercial_Gold', 		'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_COMMERCIAL_HUB',		NULL,			NULL,		NULL,			NULL),
	('Plantation_Suguba_Gold', 			'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_SUGUBA',				NULL,			NULL,		NULL,			NULL),
	
	('Pasture_Commercial_Gold', 		'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_COMMERCIAL_HUB',		NULL,			NULL,		NULL,			NULL),
	('Pasture_Suguba_Gold', 			'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_SUGUBA',				NULL,			NULL,		NULL,			NULL),

	('Camp_Commercial_Gold', 			'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_COMMERCIAL_HUB',	 	NULL,			NULL,		NULL,			NULL),
	('Camp_Suguba_Gold', 				'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_SUGUBA',				NULL,			NULL,		NULL,			NULL),
	('Fishing_Boats_Harbor_Gold', 		'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_HARBOR',				NULL,			NULL,		NULL,			NULL),
	('Fishing_Boats_Royal_Navy_Gold', 	'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_ROYAL_NAVY_DOCKYARD',	NULL,			NULL,		NULL,			NULL),
	('Fishing_Boats_Cothon_Gold', 		'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_COTHON',				NULL,			NULL,		NULL,			NULL),
	('BATEY_Street_Carnival_Culture', 	'Placeholder', 'YIELD_CULTURE',		1,				1,				0,
	'DISTRICT_STREET_CARNIVAL',		NULL,			NULL,		'CIVIC_HUMANISM',	NULL),
	('BATEY_Late_Street_Carnival_Culture', 	'Placeholder', 'YIELD_CULTURE',	2,				1,				0,
	'DISTRICT_STREET_CARNIVAL',		'CIVIC_HUMANISM',	NULL,	NULL,			NULL);

-- insert or replace into Adjacency_YieldChanges
-- 	(ID,							Description,							YieldType,			YieldChange,	TilesRequired,
-- 	AdjacentFeature,				PrereqCivic,	PrereqTech,					ObsoleteCivic,	ObsoleteTech)
-- values
-- 	('Geothermal_Science_Late',		'LOC_DISTRICT_GEOTHERMAL_SCIENCE_LATE',	'YIELD_SCIENCE',	2,				1,
-- 	'FEATURE_GEOTHERMAL_FISSURE',	NULL,			'TECH_SCIENTIFIC_THEORY',	NULL,			NULL),
-- 	('Reef_Science_Late',			'LOC_DISTRICT_REEF_SCIENCE_LATE',		'YIELD_SCIENCE',	2,				1,
-- 	'FEATURE_REEF',					NULL,			'TECH_BUTTRESS',			NULL,			NULL);

insert or replace into Adjacency_YieldChanges
	(ID, Description, YieldType, YieldChange, TilesRequired, OtherDistrictAdjacent, PrereqCivic)
values
	('Golf_District_Culture', 'placeholder', 'YIELD_CULTURE', 1, 1, 1, 'CIVIC_HUMANISM');

 -- Cree Mekewap change: Each bonus resource -> +1 Food 
-- By PineApple 20210330

update Adjacency_YieldChanges set PrereqCivic = NULL where ID = 'Mekewap_SecondBonusAdjacency';
delete from Adjacency_YieldChanges where ID = 'Mekewap_FirstBonusAdjacency';
delete from Improvement_Adjacencies where YieldChangeId = 'Mekewap_FirstBonusAdjacency';
