-- Remove Adjacencies
delete from District_Adjacencies where (DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' or DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_INDUSTRIAL_ZONE')) and
	(YieldChangeId = 'LumberMill_HalfProduction' or YieldChangeId = 'Minel_HalfProduction' or YieldChangeId = 'Quarry_Production');
delete from District_Adjacencies where DistrictType = 'DISTRICT_HANSA' and
	(YieldChangeId = 'Resource_Production' or YieldChangeId = 'Commerical_Hub_Production');
delete from District_Adjacencies where (DistrictType = 'DISTRICT_HARBOR' or DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR')) and
	(YieldChangeId = 'Harbor_City_Gold' or YieldChangeId = 'RoyalDock_City_Gold' or YieldChangeId = 'SeaResource_Gold');
-- Add new Adjacencies
with District_Adjacencies_Pre
	(DistrictType,						YieldChangeId)
as (values
	('DISTRICT_INDUSTRIAL_ZONE',		'Oil_Industrial_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'Sea_Oil_Industrial_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'Aerodrome_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_Mine_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_Mine_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_Quarry_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_Quarry_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_LumberMill_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_LumberMill_Production'),
	('DISTRICT_COMMERCIAL_HUB',			'Canal_Gold'),
	('DISTRICT_COMMERCIAL_HUB',			'HD_Commercial_Luxury_Gold'),
	('DISTRICT_COMMERCIAL_HUB',			'Hansa_Gold'),
	('DISTRICT_HARBOR',					'City_Center_Gold'),
	('DISTRICT_HARBOR',					'HD_SeaResource_Gold'),
	('DISTRICT_THEATER',				'District_Culture_City_Center'),
	('DISTRICT_AQUEDUCT',				'Aqueduct_self_food'),
	('DISTRICT_ENCAMPMENT',				'HD_Strategic_Production'),
	('DISTRICT_ENCAMPMENT',				'Government_Production'),
	('DISTRICT_ENCAMPMENT',				'Aerodrome_Production'),
	('DISTRICT_ENCAMPMENT',				'Roman_Fort_Production'),
	('DISTRICT_ENCAMPMENT',				'Fort_Production'),
	('DISTRICT_ENCAMPMENT',				'Airstrip_Production'),
	('DISTRICT_ENCAMPMENT',				'Mountain_Tunnel_Production'),
	('DISTRICT_ENCAMPMENT',				'Missle_Silo_Production'),
	('DISTRICT_ENCAMPMENT',				'Maori_Pa_Production'),
	('DISTRICT_HOLY_SITE',				'Neighborhood_Faith'),
	('DISTRICT_HOLY_SITE',				'Mbanza_Faith'),

	('DISTRICT_BATH',					'Aqueduct_self_food'),
	('DISTRICT_ROYAL_NAVY_DOCKYARD',	'Industrial_Zone_Gold'),
	('DISTRICT_ACROPOLIS',				'City_Center_Culture'),
	('DISTRICT_HANSA',					'Oil_Industrial_Production'),
	('DISTRICT_HANSA',					'Sea_Oil_Industrial_Production'),
	('DISTRICT_HANSA',					'Aerodrome_Production'),
	('DISTRICT_HANSA',					'River_Hansa_Production'),
	('DISTRICT_HANSA',					'Bath_Production'),
	('DISTRICT_HANSA',					'HD_Commerical_Hub_Production'),
	('DISTRICT_HANSA',					'HD_Suguba_Production'),
	('DISTRICT_HANSA',					'HD_Commerical_Hub_Production_Late'),
	('DISTRICT_HANSA',					'HD_Suguba_Production_Late'),
	('DISTRICT_HANSA',					'HD_Resource_Production'),
	('DISTRICT_HANSA',					'HD_Resource_Production_Late'),
	('DISTRICT_MBANZA',					'MBANZA_FOOD'),
	('DISTRICT_MBANZA',					'MBANZA_GOLD'),
	('DISTRICT_MBANZA',					'MBANZA_BONUS'),
	('DISTRICT_MBANZA',					'MBANZA_LUXURY'),
	('DISTRICT_MBANZA',					'MBANZA_STRATEGIC'),
	('DISTRICT_HIPPODROME',				'HD_Holy_Site_Culture'),
	('DISTRICT_HIPPODROME',				'HD_Encampment_Production'))
insert or replace into District_Adjacencies
	(DistrictType,	YieldChangeId)
select
	DistrictType,	YieldChangeId
from District_Adjacencies_Pre where DistrictType in (select DistrictType from Districts);

insert or replace into District_Adjacencies
	(DistrictType,					YieldChangeId)
select
	'DISTRICT_INDUSTRIAL_ZONE',		DistrictType || '_Industrial_Production'
from Districts where (DistrictType = 'DISTRICT_HARBOR') or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));
insert or replace into District_Adjacencies
	(DistrictType,						YieldChangeId)
select
	'DISTRICT_HANSA',					DistrictType || '_Hansa_Production'
from Districts where (DistrictType = 'DISTRICT_HARBOR') or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));
insert or replace into District_Adjacencies
	(DistrictType,						YieldChangeId)
select
	'DISTRICT_ENCAMPMENT',				'Station_Production'
where exists (select ImprovementType from Improvements where ImprovementType = 'IMPROVEMENT_LEU_STATION');
insert or replace into District_Adjacencies
	(DistrictType,						YieldChangeId)
select
	'DISTRICT_HOLY_SITE',				'Preserve_Faith'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_PRESERVE');
-- UD supports
insert or ignore into District_Adjacencies 
	(DistrictType,				YieldChangeId)
select
	b.CivUniqueDistrictType,	a.YieldChangeId 
from (District_Adjacencies a inner join DistrictReplaces b on a.DistrictType = b.ReplacesDistrictType)
	where b.CivUniqueDistrictType not in ('DISTRICT_OBSERVATORY', 'DISTRICT_SEOWON', 'DISTRICT_HANSA');

delete from District_Adjacencies where DistrictType = 'DISTRICT_ACROPOLIS' and YieldChangeId = 'District_Culture_City_Center';
delete from District_Adjacencies where DistrictType = 'DISTRICT_OPPIDUM' and YieldChangeId in
	('Strategic_Production', 'HD_Mine_HalfProduction', 'HD_Quarry_HalfProduction', 'HD_Quarry_Production');
update Adjacency_YieldChanges set YieldChange = 3 where ID = 'NaturalWonder_Faith';

-- Adjacency definition
-- Adjacent to district
insert or replace into Adjacency_YieldChanges
	(ID,									Description,									YieldType,			YieldChange,	AdjacentDistrict)
values
	('Industrial_Zone_Gold',				'LOC_DISTRICT_INDUSTRIAL_ZONE_GOLD',			'YIELD_GOLD',		2,				'DISTRICT_INDUSTRIAL_ZONE'),
	('Hansa_Gold',							'LOC_DISTRICT_HANSA_GOLD',						'YIELD_GOLD',		2,				'DISTRICT_HANSA'),
	('Canal_Gold',							'LOC_DISTRICT_CANAL_GOLD',						'YIELD_GOLD',		3,				'DISTRICT_CANAL'),
	('City_Center_Gold',					'LOC_DISTRICT_CITY_CENTER_GOLD',				'YIELD_GOLD',		2,				'DISTRICT_CITY_CENTER'),
	('City_Center_Culture',					'LOC_DISTRICT_CITY_CENTER_CULTURE',				'YIELD_CULTURE',	2,				'DISTRICT_CITY_CENTER'),
	('Aerodrome_Production',				'LOC_DISTRICT_AERODROME_PRODUCTION',			'YIELD_PRODUCTION', 2,				'DISTRICT_AERODROME'),
	('Neighborhood_Faith',					'LOC_DISTRICT_NEIGHBORHOOD_FAITH',				'YIELD_FAITH',		2,				'DISTRICT_NEIGHBORHOOD'),
	('Mbanza_Faith',						'LOC_DISTRICT_MBANZA_FAITH',					'YIELD_FAITH',		2,				'DISTRICT_MBANZA');
insert or replace into Adjacency_YieldChanges
	(ID,										Description,											YieldType,			YieldChange,	AdjacentDistrict)
select
	DistrictType || '_Industrial_Production',	'LOC_' || DistrictType || '_INDUSTRIAL_PRODUCTION',		'YIELD_PRODUCTION',	1,				DistrictType
from Districts where DistrictType = 'DISTRICT_HARBOR' or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));
insert or replace into Adjacency_YieldChanges
	(ID,										Description,											YieldType,			YieldChange,	AdjacentDistrict)
select
	DistrictType || '_Hansa_Production',		'LOC_' || DistrictType || '_INDUSTRIAL_PRODUCTION',		'YIELD_PRODUCTION',	2,				DistrictType
from Districts where DistrictType = 'DISTRICT_HARBOR' or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));

-- Harbor & Commercial
insert or replace into Adjacency_YieldChanges
	(ID,									Description,								YieldType,			YieldChange,	AdjacentSeaResource)
values
	('HD_SeaResource_Gold',					'LOC_DISTRICT_SEARESOURCE_GOLD',			'YIELD_GOLD',		2,				1);
insert or replace into Adjacency_YieldChanges
	(ID,									Description,								YieldType,			YieldChange,	AdjacentResourceClass)
values
	('HD_Commercial_Luxury_Gold',			'LOC_DISTRICT_LUXURY_GOLD',					'YIELD_GOLD',		2,				'RESOURCECLASS_LUXURY');

-- Aqueduct
insert or replace into Adjacency_YieldChanges
	(ID,									Description,								YieldType,			YieldChange,	Self)
values
	('Aqueduct_self_food',					'LOC_AQUEDUCT_SELF_FOOD',					'YIELD_FOOD',		1,				1);

-- Industrial Zone
update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_APPRENTICESHIP' where ID = 'Commerical_Hub_Production';
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'Aqueduct_Production';
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'Dam_Production';
update Adjacency_YieldChanges set YieldChange = 3 where ID = 'Canal_Production';
insert or replace into Adjacency_YieldChanges
	(ID,								Description,									YieldType,			YieldChange,	TilesRequired,	AdjacentImprovement,			PrereqTech,				ObsoleteTech)
values
	('Oil_Industrial_Production',		'LOC_DISTRICT_OIL_INDUSTRIAL_PRODUCTION',		'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_OIL_WELL',			null,					null),
	('Sea_Oil_Industrial_Production',	'LOC_DISTRICT_SEAOIL_INDUSTRIAL_PRODUCTION',	'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_OFFSHORE_OIL_RIG',	null,					null),
	('HD_Mine_HalfProduction',			'LOC_DISTRICT_MINE_HALF_PRODUCTION',			'YIELD_PRODUCTION',	1,				2,				'IMPROVEMENT_MINE',				null,					'TECH_METAL_CASTING'),
	('HD_Mine_Production',				'LOC_DISTRICT_MINE_PRODUCTION',					'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_MINE',				'TECH_METAL_CASTING',	null),
	('HD_Quarry_HalfProduction',		'LOC_DISTRICT_QUARRY_HALF_PRODUCTION',			'YIELD_PRODUCTION',	1,				2,				'IMPROVEMENT_QUARRY',			null,					'TECH_APPRENTICESHIP'),
	('HD_Quarry_Production',			'LOC_DISTRICT_QUARRY_PRODUCTION',				'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_QUARRY',			'TECH_APPRENTICESHIP',	null),
	('HD_LumberMill_HalfProduction',	'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',			'YIELD_PRODUCTION',	1,				2,				'IMPROVEMENT_LUMBER_MILL',		null,					'TECH_CONSTRUCTION'),
	('HD_LumberMill_Production',		'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',			'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_LUMBER_MILL',		'TECH_CONSTRUCTION',	null);
insert or replace into Adjacency_YieldChanges
	(ID,									Description,									YieldType,			YieldChange,	AdjacentRiver,	AdjacentDistrict, 			PrereqTech,				ObsoleteTech)
values
	('River_Hansa_Production',				'LOC_DISTRICT_RIVER_HANSA_PRODUCTION', 			'YIELD_PRODUCTION', 2,				1,				null,						null,					null),
	('HD_Commerical_Hub_Production',		'LOC_DISTRICT_COMMERCIAL_HUB_PRODUCTION',		'YIELD_PRODUCTION',	1,				0,				'DISTRICT_COMMERCIAL_HUB',	null,					'TECH_APPRENTICESHIP'),
	('HD_Suguba_Production',				'LOC_DISTRICT_SUGUBA_PRODUCTION',				'YIELD_PRODUCTION',	1,				0,				'DISTRICT_SUGUBA',			null,					'TECH_APPRENTICESHIP'),
	('HD_Commerical_Hub_Production_Late',	'LOC_DISTRICT_COMMERCIAL_HUB_PRODUCTION',		'YIELD_PRODUCTION',	2,				0,				'DISTRICT_COMMERCIAL_HUB',	'TECH_APPRENTICESHIP',	null),
	('HD_Suguba_Production_Late', 			'LOC_DISTRICT_SUGUBA_PRODUCTION',				'YIELD_PRODUCTION',	2,				0,				'DISTRICT_SUGUBA',			'TECH_APPRENTICESHIP',	null);
insert or replace into Adjacency_YieldChanges
	(ID,									Description,							YieldType,			YieldChange,	AdjacentResource,	PrereqTech,				ObsoleteTech)
values
	('HD_Resource_Production',				'LOC_DISTRICT_RESOURCE_PRODUCTION',		'YIELD_PRODUCTION',	1,				1,					null,					'TECH_APPRENTICESHIP'),
	('HD_Resource_Production_Late',			'LOC_DISTRICT_RESOURCE_PRODUCTION',		'YIELD_PRODUCTION',	2,				1,					'TECH_APPRENTICESHIP',	null);

-- Holy Site
update Adjacency_YieldChanges set TilesRequired = 1 where ID = 'Forest_Faith';
insert or replace into Adjacency_YieldChanges
	(ID,							Description,					YieldType,		YieldChange,	AdjacentDistrict)
select
	'Preserve_Faith',				'LOC_PRESERVE_FAITH',			'YIELD_FAITH',	1,				'DISTRICT_PRESERVE'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_PRESERVE');

-- Encampment
insert or replace into Adjacency_YieldChanges
	(ID,								Description,									YieldType,				YieldChange,	AdjacentImprovement)
values
	('Roman_Fort_Production',			'LOC_HD_ENCAMPMENT_ADJACENCY_ROMAN_FORT',		'YIELD_PRODUCTION',		1,				'IMPROVEMENT_ROMAN_FORT'),
	('Fort_Production',					'LOC_HD_ENCAMPMENT_ADJACENCY_FORT',				'YIELD_PRODUCTION',		1,				'IMPROVEMENT_FORT'),
	('Airstrip_Production',				'LOC_HD_ENCAMPMENT_ADJACENCY_AIRSTRIP',			'YIELD_PRODUCTION',		1,				'IMPROVEMENT_AIRSTRIP'),
	('Mountain_Tunnel_Production',		'LOC_HD_ENCAMPMENT_ADJACENCY_MOUNTAIN_TUNNEL',	'YIELD_PRODUCTION',		1,				'IMPROVEMENT_MOUNTAIN_TUNNEL'),
	('Missle_Silo_Production',			'LOC_HD_ENCAMPMENT_ADJACENCY_MISSILE_SILO',		'YIELD_PRODUCTION',		1,				'IMPROVEMENT_MISSILE_SILO'),
	('Maori_Pa_Production',				'LOC_HD_ENCAMPMENT_ADJACENCY_MAORI_PA',			'YIELD_PRODUCTION',		1,				'IMPROVEMENT_MAORI_PA');
insert or replace into Adjacency_YieldChanges
	(ID,								Description,									YieldType,				YieldChange,	AdjacentResourceClass)
values
	('HD_Strategic_Production',			'LOC_DISTRICT_STRATEGIC_PRODUCTION2',			'YIELD_PRODUCTION',		2,				'RESOURCECLASS_STRATEGIC');

-- Mbanza
insert or replace into Adjacency_YieldChanges
	(ID,				Description,				YieldType,				YieldChange,	Self)
values
	('MBANZA_FOOD',		'LOC_MBANZA_FOOD',			'YIELD_FOOD',			2,				1),
	('MBANZA_GOLD',		'LOC_MBANZA_GOLD',			'YIELD_GOLD',			2,				1);
insert or replace into Adjacency_YieldChanges
	(ID,				Description,				YieldType,				YieldChange,	AdjacentResourceClass)
values
	('MBANZA_BONUS',	'LOC_MBANZA_BONUS',			'YIELD_PRODUCTION',		1,				'RESOURCECLASS_BONUS'),
	('MBANZA_LUXURY',	'LOC_MBANZA_LUXURY',		'YIELD_GOLD',			2,				'RESOURCECLASS_LUXURY'),
	('MBANZA_STRATEGIC','LOC_MBANZA_STRATEGIC',		'YIELD_SCIENCE',		1,				'RESOURCECLASS_STRATEGIC');