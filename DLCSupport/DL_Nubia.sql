-------------------------------------
--			Nubia DLC			--
-------------------------------------	
insert or replace into Improvement_ValidTerrains 
	(ImprovementType,			TerrainType)
values
	('IMPROVEMENT_PYRAMID',		'TERRAIN_PLAINS'),
	('IMPROVEMENT_PYRAMID',		'TERRAIN_GRASS_HILLS'),
	('IMPROVEMENT_PYRAMID',		'TERRAIN_GRASS'),
	('IMPROVEMENT_PYRAMID',		'TERRAIN_PLAINS_HILLS');
insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType)
values
	('IMPROVEMENT_PYRAMID',		'FEATURE_FLOODPLAINS_GRASSLAND'),
	('IMPROVEMENT_PYRAMID',		'FEATURE_FLOODPLAINS_PLAINS');
update Improvement_YieldChanges set YieldChange = 1 where ImprovementType = 'IMPROVEMENT_PYRAMID' and YieldType = 'YIELD_FOOD';
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierId)
values
	('IMPROVEMENT_PYRAMID', 	'PYRAMID_DESERT_FOOD'),
	('IMPROVEMENT_PYRAMID', 	'PYRAMID_DESERT_FAITH');
insert or replace into Modifiers
	(ModifierId,					ModifierType,								SubjectRequirementSetId)
values
	('PYRAMID_DESERT_FOOD',			'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PETRA_YIELD_MODIFIER_REQUIREMENTS'),
	('PYRAMID_DESERT_FAITH',		'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PETRA_YIELD_MODIFIER_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
values
	('PYRAMID_DESERT_FAITH',		'YieldType',	'YIELD_FAITH'),
	('PYRAMID_DESERT_FAITH',		'Amount',		2),
	('PYRAMID_DESERT_FOOD',			'YieldType',	'YIELD_FOOD'),
	('PYRAMID_DESERT_FOOD',			'Amount',		2);
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'Pyramid_CommercialHubAdjacency' or ID = 'Pyramid_HarborAdjacency';
update Adjacency_YieldChanges set ObsoleteCivic = 'CIVIC_FEUDALISM' where ID like 'Pyramid_%Adjacency';
insert or replace into Improvement_Adjacencies
	(ImprovementType,			YieldChangeId)
values
	('IMPROVEMENT_PYRAMID',		'Pyramid_EncampmentAdjacency'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_GovernmentAdjacency'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_CityCenterAdjacency_Late'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_CampusAdjacency_Late'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_CommercialHubAdjacency_Late'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_HarborAdjacency_Late'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_HolySiteAdjacency_Late'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_IndustrialZoneAdjacency_Late'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_TheaterAdjacency_Late'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_EncampmentAdjacency_Late'),
	('IMPROVEMENT_PYRAMID',		'Pyramid_GovernmentAdjacency_Late');
insert or replace into Adjacency_YieldChanges
	(ID,										Description,	YieldType,			YieldChange,	AdjacentDistrict,				PrereqCivic,		ObsoleteCivic)
values
	('Pyramid_EncampmentAdjacency',				'Placeholder',	'YIELD_PRODUCTION',	1,				'DISTRICT_ENCAMPMENT',			null,				'CIVIC_FEUDALISM'),
	('Pyramid_GovernmentAdjacency',				'Placeholder',	'YIELD_CULTURE',	1,				'DISTRICT_GOVERNMENT',			null,				'CIVIC_FEUDALISM'),
	('Pyramid_CityCenterAdjacency_Late',		'Placeholder',	'YIELD_FOOD',		2,				'DISTRICT_CITY_CENTER',			'CIVIC_FEUDALISM',	null),
	('Pyramid_CampusAdjacency_Late',			'Placeholder',	'YIELD_SCIENCE',	2,				'DISTRICT_CAMPUS',				'CIVIC_FEUDALISM',	null),
	('Pyramid_CommercialHubAdjacency_Late',		'Placeholder',	'YIELD_GOLD',		4,				'DISTRICT_COMMERCIAL_HUB',		'CIVIC_FEUDALISM',	null),
	('Pyramid_HarborAdjacency_Late',			'Placeholder',	'YIELD_GOLD',		4,				'DISTRICT_HARBOR',				'CIVIC_FEUDALISM',	null),
	('Pyramid_HolySiteAdjacency_Late',			'Placeholder',	'YIELD_FAITH',		2,				'DISTRICT_HOLY_SITE',			'CIVIC_FEUDALISM',	null),
	('Pyramid_IndustrialZoneAdjacency_Late',	'Placeholder',	'YIELD_PRODUCTION',	2,				'DISTRICT_INDUSTRIAL_ZONE',		'CIVIC_FEUDALISM',	null),
	('Pyramid_TheaterAdjacency_Late',			'Placeholder',	'YIELD_CULTURE',	2,				'DISTRICT_THEATER',				'CIVIC_FEUDALISM',	null),
	('Pyramid_EncampmentAdjacency_Late',		'Placeholder',	'YIELD_PRODUCTION',	2,				'DISTRICT_ENCAMPMENT',			'CIVIC_FEUDALISM',	null),
	('Pyramid_GovernmentAdjacency_Late',		'Placeholder',	'YIELD_CULTURE',	2,				'DISTRICT_GOVERNMENT',			'CIVIC_FEUDALISM',	null);

delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_TA_SETI' and (ModifierId = 'TRAIT_LUXURY_MINE_GOLD' or ModifierId = 'TRAIT_BONUS_MINE_GOLD');
insert or replace into TraitModifiers
	(TraitType,					ModifierId)
values
	('TRAIT_CIVILIZATION_TA_SETI',  'HD_BONUS_MINE_GOLD'),
	('TRAIT_CIVILIZATION_TA_SETI',  'HD_LUXURY_MINE_GOLD');

insert or replace into Modifiers
	(ModifierId,									ModifierType,										SubjectRequirementSetId)
values
	('HD_BONUS_MINE_GOLD',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'PLOT_HAS_BONUS_MINE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,									Name,		Value)
values  
	('HD_BONUS_MINE_GOLD',						'YieldType',	'YIELD_GOLD'),
	('HD_BONUS_MINE_GOLD',						'Amount',	2);

-- update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_PYRAMID_DISTRICT_PRODUCTION_MODIFIER' and Name = 'Amount';

create TEMPORARY table 'Nubia_Resource'(
	'ResourceType' Text NOT NULL
);

create TEMPORARY table 'Nubia_Resource1'(
	'ResourceType' Text NOT NULL
);

insert or replace into Nubia_Resource
	(ResourceType)
select
	i.ResourceType
from Resources i, Improvement_ValidResources j
where i.ResourceType = j.ResourceType and (i.ResourceClassType = 'RESOURCECLASS_BONUS' or i.ResourceClassType = 'RESOURCECLASS_LUXURY') and j.ImprovementType = 'IMPROVEMENT_MINE';

insert or replace into Nubia_Resource1
	(ResourceType)
select
	i.ResourceType
from Resources i, Improvement_ValidResources j
where i.ResourceType = j.ResourceType and i.ResourceClassType = 'RESOURCECLASS_STRATEGIC' and j.ImprovementType = 'IMPROVEMENT_MINE';

insert or replace into TraitModifiers
	(TraitType,					ModifierId)
select
	'TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_' || ResourceType || '_MINE_GOLD_PERCENTAGE'
from Nubia_Resource;

insert or replace into Modifiers
	(ModifierId,													ModifierType,										SubjectRequirementSetId)
select
	'TRAIT_' || ResourceType || '_MINE_GOLD_PERCENTAGE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'HD_CITY_HAS_IMPROVED_' || ResourceType || '_REQUIRMENTS'
from Nubia_Resource;

insert or replace into ModifierArguments
	(ModifierId,													Name,		Value)
select
	'TRAIT_' || ResourceType || '_MINE_GOLD_PERCENTAGE',	'YieldType',	'YIELD_GOLD'
from Nubia_Resource;

insert or replace into ModifierArguments
	(ModifierId,													Name,		Value)
select
	'TRAIT_' || ResourceType || '_MINE_GOLD_PERCENTAGE',	'Amount',	10
from Nubia_Resource;

insert or replace into TraitModifiers (TraitType, ModifierId) select
	'TRAIT_CIVILIZATION_TA_SETI',	'TRAIT_'||ResourceType||'_MINE_PRODUCTION_RATIO'
from Nubia_Resource1;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) select
	'TRAIT_'||ResourceType||'_MINE_PRODUCTION_RATIO', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',  'HD_CITY_HAS_IMPROVED_' || ResourceType || '_REQUIRMENTS'
from Nubia_Resource1;

insert or replace into ModifierArguments (ModifierId, Name, Value) select
	'TRAIT_'||ResourceType||'_MINE_PRODUCTION_RATIO', 'YieldType',  'YIELD_PRODUCTION'
from Nubia_Resource1;

insert or replace into ModifierArguments (ModifierId, Name, Value) select
	'TRAIT_'||ResourceType||'_MINE_PRODUCTION_RATIO', 'Amount',  10
from Nubia_Resource1;

-- Jebel Barkal
update Buildings set RegionalRange = 0 where BuildingType = 'BUILDING_JEBEL_BARKAL';
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_JEBEL_BARKAL',		'ARTEMIS_MINE_PRODUCTION'),
	('BUILDING_JEBEL_BARKAL',		'ARTEMIS_MINE_FAITH'),
	('BUILDING_JEBEL_BARKAL',		'ARTEMIS_QUARRY_PRODUCTION'),
	('BUILDING_JEBEL_BARKAL',		'ARTEMIS_QUARRY_FAITH');
insert or replace into Modifiers
	(ModifierId,					ModifierType,								SubjectRequirementSetId)
values
	('ARTEMIS_MINE_PRODUCTION',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		'PLOT_HAS_MINE_WITH_6_TILES'),
	('ARTEMIS_MINE_FAITH',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		'PLOT_HAS_MINE_WITH_6_TILES'),
	('ARTEMIS_QUARRY_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		'PLOT_HAS_QUARRY_WITH_6_TILES'),
	('ARTEMIS_QUARRY_FAITH',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		'PLOT_HAS_QUARRY_WITH_6_TILES');
insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
values
	('ARTEMIS_MINE_PRODUCTION',		'YieldType',	'YIELD_PRODUCTION'),
	('ARTEMIS_MINE_PRODUCTION',		'Amount',		1),
	('ARTEMIS_MINE_FAITH',			'YieldType',	'YIELD_FAITH'),
	('ARTEMIS_MINE_FAITH',			'Amount',		1),
	('ARTEMIS_QUARRY_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('ARTEMIS_QUARRY_PRODUCTION',	'Amount',		1),
	('ARTEMIS_QUARRY_FAITH',		'YieldType',	'YIELD_FAITH'),
	('ARTEMIS_QUARRY_FAITH',		'Amount',		1);