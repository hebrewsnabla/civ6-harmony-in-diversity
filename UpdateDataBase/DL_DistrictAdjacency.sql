-- Remove Adjacencies
-- Remove some adjacencies that will be added back right after, to make them better ordered in the game text.
delete from District_Adjacencies where (DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' or DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_INDUSTRIAL_ZONE')) and
	(YieldChangeId = 'LumberMill_HalfProduction' or YieldChangeId = 'Minel_HalfProduction' or YieldChangeId = 'Quarry_Production');
delete from District_Adjacencies where DistrictType = 'DISTRICT_HANSA' and
	(YieldChangeId = 'Resource_Production' or YieldChangeId = 'Commerical_Hub_Production');
-- Remove a non-repetition UD support, which will be added back with the UD support sql afterwards
delete from District_Adjacencies where DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD' and YieldChangeId = 'RoyalDock_City_Gold';
-- Real remove
delete from District_Adjacencies where DistrictType = 'DISTRICT_THANH' and YieldChangeId = 'District_Culture_Major';
delete from District_Adjacencies where DistrictType = 'DISTRICT_SEOWON' and YieldChangeId = 'NegativeDistrict_Science';
delete from District_Adjacencies where DistrictType = 'DISTRICT_OBSERVATORY' and YieldChangeId = 'Farm_Science';
delete from District_Adjacencies where DistrictType = 'DISTRICT_OBSERVATORY' and YieldChangeId = 'Plantation_Science';
-- Add new Adjacencies
with District_Adjacencies_Pre
	(DistrictType,						YieldChangeId)
as (values
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_Mine_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_Mine_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_Quarry_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_Quarry_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_LumberMill_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_LumberMill_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'Oil_Well_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'Offshore_Oil_Rig_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'Aerodrome_Production'),
	('DISTRICT_COMMERCIAL_HUB',			'Canal_Gold'),
	('DISTRICT_COMMERCIAL_HUB',			'Luxury_Gold'),
	('DISTRICT_COMMERCIAL_HUB',			'Hansa_Gold'),
	('DISTRICT_THEATER',				'District_Culture_City_Center'),
	('DISTRICT_AQUEDUCT',				'Aqueduct_Self_Food'),
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
	('DISTRICT_CAMPUS',					'City_Center_Science'),
	('DISTRICT_CAMPUS',					'Marsh_Science'),

	('DISTRICT_BATH',					'Aqueduct_Self_Food'),
	('DISTRICT_ROYAL_NAVY_DOCKYARD',	'Industrial_Zone_Gold'),
	('DISTRICT_ACROPOLIS',				'City_Center_Culture'),
	('DISTRICT_HANSA',					'River_Hansa_Production'),
	('DISTRICT_HANSA',					'Bath_Production'),
	('DISTRICT_HANSA',					'HD_Commerical_Hub_Production'),
	('DISTRICT_HANSA',					'HD_Suguba_Production'),
	('DISTRICT_HANSA',					'HD_Commerical_Hub_Production_Late'),
	('DISTRICT_HANSA',					'HD_Suguba_Production_Late'),
	('DISTRICT_HANSA',					'HD_Resource_Production'),
	('DISTRICT_HANSA',					'HD_Resource_Production_Late'),
	('DISTRICT_HANSA',					'Oil_Well_Production'),
	('DISTRICT_HANSA',					'Offshore_Oil_Rig_Production'),
	('DISTRICT_HANSA',					'Aerodrome_Production'),
	('DISTRICT_MBANZA',					'Mbanza_Self_Food'),
	('DISTRICT_MBANZA',					'Mbanza_Self_Gold'),
	('DISTRICT_MBANZA',					'Bonus_Production'),
	('DISTRICT_MBANZA',					'Luxury_Gold'),
	('DISTRICT_MBANZA',					'Strategic_Science'),
	('DISTRICT_HIPPODROME',				'Holy_Site_Culture'),
	('DISTRICT_HIPPODROME',				'Lavra_Culture'),
	('DISTRICT_THANH',					'District_Production'),
	('DISTRICT_OBSERVATORY',			'Luxury_Science'),
	('DISTRICT_OBSERVATORY',			'Luxury_Science_Late'),
	('DISTRICT_OBSERVATORY',			'Farm_Science_HD'),
	('DISTRICT_OBSERVATORY',			'Farm_Science_Late'))
insert or replace into District_Adjacencies
	(DistrictType,	YieldChangeId)
select
	DistrictType,	YieldChangeId
from District_Adjacencies_Pre where DistrictType in (select DistrictType from Districts);
-- Adjacent to UD support
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
	'DISTRICT_HIPPODROME',				DistrictType || '_Production'
from Districts where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_HIPPODROME') and (DistrictType = 'DISTRICT_ENCAMPMENT' or DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_ENCAMPMENT'));
-- DLC support
with District_Adjacencies_Pre
	(DistrictType,						YieldChangeId)
as (values
	('DISTRICT_COMMERCIAL_HUB',			'Diplomatic_Quater_Gold'),
	('DISTRICT_HARBOR',					'Diplomatic_Quater_Gold'),
	('DISTRICT_HOLY_SITE',				'Diplomatic_Quater_Faith'),
	('DISTRICT_CAMPUS',					'Diplomatic_Quater_Science'),
	('DISTRICT_THEATER',				'Diplomatic_Quater_Culture'),
	('DISTRICT_ENCAMPMENT',				'Diplomatic_Quater_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',		'Diplomatic_Quater_Production'))
insert or replace into District_Adjacencies
	(DistrictType,	YieldChangeId)
select
	DistrictType,	YieldChangeId
from District_Adjacencies_Pre where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
-- Mod support
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
-- UD support
insert or ignore into District_Adjacencies 
	(DistrictType,				YieldChangeId)
select
	b.CivUniqueDistrictType,	a.YieldChangeId 
from (District_Adjacencies a inner join DistrictReplaces b on a.DistrictType = b.ReplacesDistrictType)
	where b.CivUniqueDistrictType not in ('DISTRICT_OBSERVATORY', 'DISTRICT_SEOWON', 'DISTRICT_HANSA')
	or a.YieldChangeId like 'Diplomatic_Quater_%';

delete from District_Adjacencies where DistrictType = 'DISTRICT_ACROPOLIS' and YieldChangeId = 'District_Culture_City_Center';
delete from District_Adjacencies where DistrictType = 'DISTRICT_OPPIDUM' and YieldChangeId in
	('Strategic_Production', 'HD_Mine_HalfProduction', 'Quarry_HalfProduction', 'HD_Quarry_Production');

-- Adjacency update
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'SeaResource_Gold';
update Adjacency_YieldChanges set YieldChange = 3 where ID = 'NaturalWonder_Faith';
update Adjacency_YieldChanges set YieldChange = 3 where ID = 'Canal_Production';
update Adjacency_YieldChanges set TilesRequired = 1 where ID = 'Forest_Faith';
update Adjacency_YieldChanges set YieldChange = 1 where ID = 'Harbor_City_Gold';
update Adjacency_YieldChanges set TilesRequired = 1 where ID = 'District_Gold';

-- Adjacency definition
-- Adjacent to district (remember to support UD)
insert or replace into Adjacency_YieldChanges
	(ID,									Description,									YieldType,			YieldChange,	AdjacentDistrict)
values
	('Industrial_Zone_Gold',				'LOC_DISTRICT_INDUSTRIAL_ZONE_GOLD',			'YIELD_GOLD',		2,				'DISTRICT_INDUSTRIAL_ZONE'),
	('Hansa_Gold',							'LOC_DISTRICT_HANSA_GOLD',						'YIELD_GOLD',		2,				'DISTRICT_HANSA'),
	('Canal_Gold',							'LOC_DISTRICT_CANAL_GOLD',						'YIELD_GOLD',		3,				'DISTRICT_CANAL'),
	('City_Center_Culture',					'LOC_DISTRICT_CITY_CENTER_CULTURE',				'YIELD_CULTURE',	2,				'DISTRICT_CITY_CENTER'),
	('City_Center_Science',					'LOC_DISTRICT_CITY_CENTER_SCIENCE',				'YIELD_SCIENCE',	1,				'DISTRICT_CITY_CENTER'),
	('Aerodrome_Production',				'LOC_DISTRICT_AERODROME_PRODUCTION',			'YIELD_PRODUCTION', 2,				'DISTRICT_AERODROME'),
	('Neighborhood_Faith',					'LOC_DISTRICT_NEIGHBORHOOD_FAITH',				'YIELD_FAITH',		2,				'DISTRICT_NEIGHBORHOOD'),
	('Mbanza_Faith',						'LOC_DISTRICT_MBANZA_FAITH',					'YIELD_FAITH',		2,				'DISTRICT_MBANZA'),
	('Holy_Site_Culture',					'LOC_DISTRICT_HOLY_SITE_CULTURE',				'YIELD_CULTURE',	2,				'DISTRICT_HOLY_SITE'),
	('Lavra_Culture',						'LOC_DISTRICT_LAVRA_CULTURE',					'YIELD_CULTURE',	2,				'DISTRICT_LAVRA');
insert or replace into Adjacency_YieldChanges
	(ID,									Description,									YieldType,			YieldChange,	AdjacentDistrict)
select
	DistrictType || '_Production',			'LOC_' || DistrictType || '_PRODUCTION',		'YIELD_PRODUCTION',	2,				DistrictType
from Districts where (DistrictType = 'DISTRICT_ENCAMPMENT' or DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_ENCAMPMENT'));
insert or replace into Adjacency_YieldChanges
	(ID,										Description,											YieldType,			YieldChange,	AdjacentDistrict)
select
	DistrictType || '_Industrial_Production',	'LOC_' || DistrictType || '_INDUSTRIAL_PRODUCTION',		'YIELD_PRODUCTION',	1,				DistrictType
from Districts where DistrictType = 'DISTRICT_HARBOR' or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));
insert or replace into Adjacency_YieldChanges
	(ID,										Description,											YieldType,			YieldChange,	AdjacentDistrict)
select
	DistrictType || '_Hansa_Production',		'LOC_' || DistrictType || '_HANSA_PRODUCTION',			'YIELD_PRODUCTION',	2,				DistrictType
from Districts where DistrictType = 'DISTRICT_HARBOR' or (DistrictType in
	(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));
-- Adjacent to improvement
insert or replace into Adjacency_YieldChanges
	(ID,								Description,								YieldType,				YieldChange,	AdjacentImprovement)
values
	('Oil_Well_Production',				'LOC_DISTRICT_OIL_WELL_PRODUCTION',			'YIELD_PRODUCTION',		1,				'IMPROVEMENT_OIL_WELL'),
	('Offshore_Oil_Rig_Production',		'LOC_DISTRICT_OFFSHORE_OIL_RIG_PRODUCTION',	'YIELD_PRODUCTION',		1,				'IMPROVEMENT_OFFSHORE_OIL_RIG'),
	('Roman_Fort_Production',			'LOC_DISTRICT_ROMAN_FORT_PRODUCTION',		'YIELD_PRODUCTION',		1,				'IMPROVEMENT_ROMAN_FORT'),
	('Fort_Production',					'LOC_DISTRICT_FORT_PRODUCTION',				'YIELD_PRODUCTION',		1,				'IMPROVEMENT_FORT'),
	('Airstrip_Production',				'LOC_DISTRICT_AIRSTRIP_PRODUCTION',			'YIELD_PRODUCTION',		1,				'IMPROVEMENT_AIRSTRIP'),
	('Mountain_Tunnel_Production',		'LOC_DISTRICT_MOUNTAIN_TUNNEL_PRODUCTION',	'YIELD_PRODUCTION',		1,				'IMPROVEMENT_MOUNTAIN_TUNNEL'),
	('Missle_Silo_Production',			'LOC_DISTRICT_MISSILE_SILO_PRODUCTION',		'YIELD_PRODUCTION',		1,				'IMPROVEMENT_MISSILE_SILO'),
	('Maori_Pa_Production',				'LOC_DISTRICT_MAORI_PA_PRODUCTION',			'YIELD_PRODUCTION',		1,				'IMPROVEMENT_MAORI_PA');
-- Adjacent to resources class
insert or replace into Adjacency_YieldChanges
	(ID,								Description,								YieldType,				YieldChange,	AdjacentResourceClass)
values
	('Luxury_Gold',						'LOC_DISTRICT_LUXURY_GOLD',					'YIELD_GOLD',			2,				'RESOURCECLASS_LUXURY'),
	('HD_Strategic_Production',			'LOC_DISTRICT_HD_STRATEGIC_PRODUCTION',		'YIELD_PRODUCTION',		2,				'RESOURCECLASS_STRATEGIC'),
	('Bonus_Production',				'LOC_DISTRICT_BONUS_PRODUCTION',			'YIELD_PRODUCTION',		1,				'RESOURCECLASS_BONUS'),
	('Strategic_Science',				'LOC_DISTRICT_STRATEGIC_SCIENCE',			'YIELD_SCIENCE',		1,				'RESOURCECLASS_STRATEGIC');
-- Self (no adjacency requirements)
insert or replace into Adjacency_YieldChanges
	(ID,								Description,					YieldType,			YieldChange,	Self)
values
	('Aqueduct_Self_Food',				'LOC_DISTRICT_SELF_FOOD',		'YIELD_FOOD',		1,				1),
	('Mbanza_Self_Food',				'LOC_DISTRICT_SELF_FOOD',		'YIELD_FOOD',		2,				1),
	('Mbanza_Self_Gold',				'LOC_DISTRICT_SELF_GOLD',		'YIELD_GOLD',		2,				1);
-- With Prereq/Obsolete Tech/Civic
insert or replace into Adjacency_YieldChanges
	(ID,								Description,									YieldType,				YieldChange,	TilesRequired,	AdjacentImprovement,		PrereqTech,				ObsoleteTech)
values
	('HD_Mine_HalfProduction',			'LOC_DISTRICT_MINE_HALF_PRODUCTION',			'YIELD_PRODUCTION',		1,				2,				'IMPROVEMENT_MINE',			null,					'TECH_METAL_CASTING'),
	('HD_Mine_Production',				'LOC_DISTRICT_MINE_PRODUCTION',					'YIELD_PRODUCTION',		1,				1,				'IMPROVEMENT_MINE',			'TECH_METAL_CASTING',	null),
	('HD_Quarry_HalfProduction',		'LOC_DISTRICT_QUARRY_HALF_PRODUCTION',			'YIELD_PRODUCTION',		1,				2,				'IMPROVEMENT_QUARRY',		null,					'TECH_APPRENTICESHIP'),
	('HD_Quarry_Production',			'LOC_DISTRICT_QUARRY_PRODUCTION',				'YIELD_PRODUCTION',		1,				1,				'IMPROVEMENT_QUARRY',		'TECH_APPRENTICESHIP',	null),
	('HD_LumberMill_HalfProduction',	'LOC_DISTRICT_LUMBER_MILL_HALF_PRODUCTION',		'YIELD_PRODUCTION',		1,				2,				'IMPROVEMENT_LUMBER_MILL',	null,					'TECH_CONSTRUCTION'),
	('HD_LumberMill_Production',		'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',			'YIELD_PRODUCTION',		1,				1,				'IMPROVEMENT_LUMBER_MILL',	'TECH_CONSTRUCTION',	null);
insert or replace into Adjacency_YieldChanges
	(ID,									Description,								YieldType,				YieldChange,	AdjacentDistrict, 			PrereqTech,				ObsoleteTech)
values
	('HD_Commerical_Hub_Production',		'LOC_DISTRICT_COMMERCIAL_HUB_PRODUCTION',	'YIELD_PRODUCTION',		1,				'DISTRICT_COMMERCIAL_HUB',	null,					'TECH_APPRENTICESHIP'),
	('HD_Commerical_Hub_Production_Late',	'LOC_DISTRICT_COMMERCIAL_HUB_PRODUCTION',	'YIELD_PRODUCTION',		2,				'DISTRICT_COMMERCIAL_HUB',	'TECH_APPRENTICESHIP',	null),
	('HD_Suguba_Production',				'LOC_DISTRICT_SUGUBA_PRODUCTION',			'YIELD_PRODUCTION',		1,				'DISTRICT_SUGUBA',			null,					'TECH_APPRENTICESHIP'),
	('HD_Suguba_Production_Late', 			'LOC_DISTRICT_SUGUBA_PRODUCTION',			'YIELD_PRODUCTION',		2,				'DISTRICT_SUGUBA',			'TECH_APPRENTICESHIP',	null);
insert or replace into Adjacency_YieldChanges
	(ID,									Description,								YieldType,				YieldChange,	AdjacentResource,	PrereqTech,				ObsoleteTech)
values
	('HD_Resource_Production',				'LOC_DISTRICT_RESOURCE_PRODUCTION',			'YIELD_PRODUCTION',		1,				1,					null,					'TECH_APPRENTICESHIP'),
	('HD_Resource_Production_Late',			'LOC_DISTRICT_RESOURCE_PRODUCTION',			'YIELD_PRODUCTION',		2,				1,					'TECH_APPRENTICESHIP',	null);
insert or replace into Adjacency_YieldChanges
	(ID,						Description,                            YieldType,          YieldChange,    TilesRequired,  AdjacentImprovement,    AdjacentResourceClass,		PrereqTech,			ObsoleteTech,		PrereqCivic,		ObsoleteCivic)
values
	('Luxury_Science',			'LOC_DISTRICT_JNR_UC_Luxury_Science',   'YIELD_SCIENCE',    1,              1,              null,                   'RESOURCECLASS_LUXURY',		null,				'TECH_ASTRONOMY',	null,				null),
	('Luxury_Science_Late',		'LOC_DISTRICT_JNR_UC_Luxury_Science',   'YIELD_SCIENCE',    2,              1,              null,                   'RESOURCECLASS_LUXURY',		'TECH_ASTRONOMY',	null,				null,				null),
	('Farm_Science_HD',			'LOC_DISTRICT_FARM_SCIENCE',            'YIELD_SCIENCE',    1,              2,              'IMPROVEMENT_FARM',     'NO_RESOURCECLASS',			null,				null,				null,				'CIVIC_FEUDALISM'),
	('Farm_Science_Late',		'LOC_DISTRICT_FARM_SCIENCE',            'YIELD_SCIENCE',    1,              1,              'IMPROVEMENT_FARM',     'NO_RESOURCECLASS',			null,				null,				'CIVIC_FEUDALISM',	null);
-- Misc
insert or replace into Adjacency_YieldChanges
	(ID,									Description,								YieldType,				YieldChange,	AdjacentFeature,	AdjacentRiver)
values
	('River_Hansa_Production',				'LOC_DISTRICT_RIVER_HANSA_PRODUCTION', 		'YIELD_PRODUCTION', 	2,				null,				1),
	('Marsh_Science',						'LOC_DISTRICT_MARSH_SCIENCE', 				'YIELD_SCIENCE', 		1,				'FEATURE_MARSH',	0);
-- DLC Support
with Adjacency_YieldChanges_Pre
	(ID,								Description,									YieldType,			YieldChange,	AdjacentDistrict)
as (values
	('Preserve_Faith',					'LOC_DISTRICT_PRESERVE_FAITH',					'YIELD_FAITH',		1,				'DISTRICT_PRESERVE'),
	('Diplomatic_Quater_Gold',			'LOC_DISTRICT_DIPLOMATIC_QUATER_GOLD',			'YIELD_GOLD',		1,				'DISTRICT_DIPLOMATIC_QUARTER'),
	('Diplomatic_Quater_Faith',			'LOC_DISTRICT_DIPLOMATIC_QUATER_FAITH',			'YIELD_FAITH',		1,				'DISTRICT_DIPLOMATIC_QUARTER'),
	('Diplomatic_Quater_Science',		'LOC_DISTRICT_DIPLOMATIC_QUATER_SCIENCE',		'YIELD_SCIENCE',	1,				'DISTRICT_DIPLOMATIC_QUARTER'),
	('Diplomatic_Quater_Culture',		'LOC_DISTRICT_DIPLOMATIC_QUATER_CULTURE',		'YIELD_CULTURE',	1,				'DISTRICT_DIPLOMATIC_QUARTER'),
	('Diplomatic_Quater_Production',	'LOC_DISTRICT_DIPLOMATIC_QUATER_PRODUCTION',	'YIELD_PRODUCTION',	1,				'DISTRICT_DIPLOMATIC_QUARTER'))
insert or replace into Adjacency_YieldChanges
	(ID,	Description,	YieldType,	YieldChange,	AdjacentDistrict)
select
	ID,		Description,	YieldType,	YieldChange,	AdjacentDistrict
from Adjacency_YieldChanges_Pre where AdjacentDistrict in (select DistrictType from Districts);