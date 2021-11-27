-------------------------------------
--   Introduce city-level policy   --
-------------------------------------

insert or replace into Types
	(Type,										Kind)
values
	-- Modifier
	('GRANT_BUILDING_TO_ALL_CITIES_IGNORE',		'KIND_MODIFIER');

-- need to modify trajans ability.
update TraitModifiers set ModifierId = 'TRAIT_GRANT_BUILDING_MONUMENT_MODIFIER'
	where TraitType = 'TRAJANS_COLUMN_TRAIT' and ModifierId = 'TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING';

-- grant basic building to enable city policies
-- insrt into Trait Mofidiers
insert or replace into TraitModifiers
	(TraitType,					ModifierId)
values
	-- ('TRAJANS_COLUMN_TRAIT', 'TRAIT_ADJUST_NON_CAPITAL_FREE_CHEAPEST_BUILDING'),
	-- ('TRAJANS_COLUMN_TRAIT',	'TRAIT_GRANT_BUILDING_MONUMENT_MODIFIER'),
	('TRAIT_LEADER_MAJOR_CIV',	'TRAIT_GRANT_EMPTY_CITY_POLICY_MODIFIER'),
	('MINOR_CIV_DEFAULT_TRAIT',	'TRAIT_GRANT_EMPTY_CITY_POLICY_MODIFIER');

insert or replace into DynamicModifiers
	(ModifierType,							CollectionType,				EffectType)
values
	('GRANT_BUILDING_TO_ALL_CITIES_IGNORE', 'COLLECTION_PLAYER_CITIES', 'EFFECT_GRANT_BUILDING_IN_CITY_IGNORE');

insert or replace into Modifiers
	(ModifierId,								ModifierType)
values
	('TRAIT_GRANT_BUILDING_MONUMENT_MODIFIER', 'GRANT_BUILDING_TO_ALL_CITIES_IGNORE'),
	('TRAIT_GRANT_EMPTY_CITY_POLICY_MODIFIER', 'GRANT_BUILDING_TO_ALL_CITIES_IGNORE');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('TRAIT_GRANT_BUILDING_MONUMENT_MODIFIER', 'BuildingType', 'BUILDING_MONUMENT'),
	('TRAIT_GRANT_EMPTY_CITY_POLICY_MODIFIER', 'BuildingType', 'BUILDING_CITY_POLICY_EMPTY');

insert or replace into Types
	(Type,											Kind)
values
	-- Buildings
	('BUILDING_CITY_POLICY_EMPTY',					'KIND_BUILDING'),
	('BUILDING_CITY_POLICY_AGRICULTURAL_TAX',		'KIND_BUILDING'),
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',			'KIND_BUILDING'),	
	('BUILDING_CITY_POLICY_LABOR',					'KIND_BUILDING'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',				'KIND_BUILDING'),
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',				'KIND_BUILDING'),--xhh 修编历书
	-- Projects
	('PROJECT_CITY_POLICY_ENABLE_LABOR',			'KIND_PROJECT'),
	('PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX',	'KIND_PROJECT'),
	('PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX',	'KIND_PROJECT'),
	-- ('PROJECT_CITY_POLICY_ENABLE_DACAOGU',			'KIND_PROJECT'),
	('PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX','KIND_PROJECT'),
	('PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX',	'KIND_PROJECT'),
	-- ('PROJECT_CITY_POLICY_DISABLE_DACAOGU',			'KIND_PROJECT'),
	('PROJECT_CITY_POLICY_DISABLE_LABOR',			'KIND_PROJECT'),
	('PROJECT_CITY_POLICY_ENABLE_REVISION_ALMANAC',	'KIND_PROJECT'),--xhh 修编历书
	('PROJECT_CITY_POLICY_DISABLE_REVISION_ALMANAC',	'KIND_PROJECT');--xhh 修编历书

-- Use buildings as city policies, use projects to turn on and turn off the city policies.
insert or replace into Buildings (BuildingType, Name, Cost, Description) values
	('BUILDING_CITY_POLICY_EMPTY', 'LOC_BUILDING_CITY_POLICY_EMPTY_NAME', 1, 'LOC_BUILDING_CITY_POLICY_EMPTY_DESCRIPTION'),
	('BUILDING_CITY_POLICY_LABOR', 'LOC_BUILDING_CITY_POLICY_LABOR_NAME', 1, 'LOC_BUILDING_CITY_POLICY_LABOR_DESCRIPTION'),
	('BUILDING_CITY_POLICY_AGRICULTURAL_TAX', 'LOC_BUILDING_CITY_POLICY_AGRICULTURAL_TAX_NAME', 1, 'LOC_BUILDING_CITY_POLICY_AGRICULTURAL_TAX_DESCRIPTION'),
	-- ('BUILDING_CITY_POLICY_DACAOGU', 'LOC_BUILDING_CITY_POLICY_DACAOGU_NAME', 1, 'LOC_BUILDING_CITY_POLICY_DACAOGU_DESCRIPTION'),
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX', 'LOC_BUILDING_CITY_POLICY_INDUSTRAIL_TAX_NAME', 1, 'LOC_BUILDING_CITY_POLICY_INDUSTRAIL_TAX_DESCRIPTION'),
	('BUILDING_CITY_POLICY_REVISION_ALMANAC', 'LOC_BUILDING_CITY_POLICY_REVISION_ALMANAC_NAME', 1, 'LOC_BUILDING_CITY_POLICY_REVISION_ALMANAC_DESCRIPTION');--xhh 修编历书

-- Make AI less likely to build the city policy buildings directly (though they should not see that directly).
-- TODO: write the city policy buildings as mutually excluded.
insert or replace into AiListTypes (ListType) values
	('AI_LESS_CITY_POLICY_BUILDINGS');

insert or replace into AiLists
	(ListType,							LeaderType,					System)
values
	('AI_LESS_CITY_POLICY_BUILDINGS',	'TRAIT_LEADER_MAJOR_CIV',	'Buildings');

insert or replace into AiFavoredItems
	(ListType,					Item,												Favored,	Value)
values
	('AI_LESS_CITY_POLICY_BUILDINGS',	'BUILDING_CITY_POLICY_EMPTY',				0,			0),
	('AI_LESS_CITY_POLICY_BUILDINGS',	'BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		0,			0),
	('AI_LESS_CITY_POLICY_BUILDINGS',	'BUILDING_CITY_POLICY_AGRICULTURAL_TAX',	0,			0),
	-- ('AI_LESS_CITY_POLICY_BUILDINGS',	'BUILDING_CITY_POLICY_DACAOGU',				0,			0),
	('AI_LESS_CITY_POLICY_BUILDINGS',	'BUILDING_CITY_POLICY_LABOR',				0,			0),
	('AI_LESS_CITY_POLICY_BUILDINGS',	'BUILDING_CITY_POLICY_REVISION_ALMANAC',	0,			0);--xhh 修编历书

-- Building effect
insert or replace into BuildingModifiers 
	(BuildingType,								ModifierId)
values 
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_CITY_GROWTH_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_POP_FOOD_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_CITY_POP_HORSEMANREDUCED_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_CITY_POP_COURSERREDUCED_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_CITY_POP_HUNGARY_BLACK_ARMYREDUCED_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_CITY_AMENITIES'),
	-- --('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_CITY_TRAINED_CAVALRY_EXTRA_PILLAGE_YIELD'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_CITY_TRAINED_CAVALRY_PILLAGE_LESS_MOVEMENT'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'CITY_POLICY_DACAOGU_CITY_TRAINED_FREE_EXTRA_CAVALRY'),
	('BUILDING_CITY_POLICY_AGRICULTURAL_TAX',	'CITY_POLICY_AGRICULTURAL_TAX_FARM_GOLD_MODIFIER'),
	('BUILDING_CITY_POLICY_AGRICULTURAL_TAX',	'CITY_POLICY_AGRICULTURAL_TAX_FARM_FOOD_MODIFIER'),
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'CITY_POLICY_INDUSTRAIL_TAX_QUARRY_GOLD_MODIFIER'),
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'CITY_POLICY_INDUSTRAIL_TAX_MINE_GOLD_MODIFIER'),
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'CITY_POLICY_INDUSTRAIL_TAX_QUARRY_PRODUCTION_MODIFIER'),
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'CITY_POLICY_INDUSTRAIL_TAX_MINE_PRODUCTION_MODIFIER'),
	('BUILDING_CITY_POLICY_LABOR',				'CITY_POLICY_LABOR_POP_FOOD_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_LABOR',			'CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_LABOR',			'CITY_POLICY_LABOR_POP_CULTURE_MODIFIER'),
	('BUILDING_CITY_POLICY_LABOR',				'CITY_POLICY_LABOR_POP_PROD_MODIFIER'),
	('BUILDING_CITY_POLICY_LABOR',				'CITY_POLICY_LABOR_CITY_GROWTH_MODIFIER'),
	('BUILDING_CITY_POLICY_LABOR',				'CITY_POLICY_LABOR_CITY_AMENITIES'),
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'CITY_POLICY_REVISION_ALMANAC_DECREASE_GOLD'),--xhh 修编历书
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'CITY_POLICY_REVISION_ALMANAC_BONUS_RESOURCE_FARM_SCIENCE'),--xhh 修编历书
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'CITY_POLICY_REVISION_ALMANAC_LUXURY_RESOURCE_FARM_SCIENCE'),--xhh 修编历书
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'CITY_POLICY_REVISION_ALMANAC_RESOURCE_PLANTATION_SCIENCE');--xhh 修编历书

-- Modifiers
-- insert or replace into Modifiers
-- 	(ModifierId,													ModifierType,											Permanent)
-- values
-- 	('CITY_POLICY_DACAOGU_CITY_TRAINED_CAVALRY_PILLAGE_LESS_MOVEMENT','MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',1),
-- 	('CITY_POLICY_DACAOGU_CITY_TRAINED_CAVALRY_EXTRA_PILLAGE_YIELD','MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	1);

insert or replace into Modifiers
	(ModifierId,														ModifierType)
values
	-- ('CITY_POLICY_DACAOGU_CITY_GROWTH_MODIFIER',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH'),
	-- ('CITY_POLICY_DACAOGU_POP_FOOD_MODIFIER',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_HORSEMANREDUCED_MODIFIER',			'MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_COURSERREDUCED_MODIFIER',			'MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER','MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_HUNGARY_BLACK_ARMYREDUCED_MODIFIER',	'MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT'),
	-- ('CITY_POLICY_DACAOGU_CITY_AMENITIES',								'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT'),
	('CITY_POLICY_LABOR_POP_FOOD_MODIFIER',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_POP_CULTURE_MODIFIER',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_POP_PROD_MODIFIER',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_CITY_GROWTH_MODIFIER',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH'),
	('CITY_POLICY_LABOR_CITY_AMENITIES',								'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT'),
	('CITY_POLICY_REVISION_ALMANAC_DECREASE_GOLD',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE');--xhh 修编历书

-- The REQs might needed when standalone.
insert or replace into Modifiers
	(ModifierId,														ModifierType,												SubjectRequirementSetId)
values
	-- ('CITY_POLICY_DACAOGU_CITY_TRAINED_FREE_EXTRA_CAVALRY',				'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_UNIT_COPY_TAG',			'CITY_HAS_3_POPULATION'),
	('CITY_POLICY_AGRICULTURAL_TAX_FARM_GOLD_MODIFIER',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'REQUIREMENTS_PLOT_HAS_FARM'),	
	('CITY_POLICY_AGRICULTURAL_TAX_FARM_FOOD_MODIFIER',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'REQUIREMENTS_PLOT_HAS_FARM'),	
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_GOLD_MODIFIER',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'PLOT_HAS_QUARRY_REQUIREMENTS'),	
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_GOLD_MODIFIER',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'PLOT_HAS_MINE_REQUIREMENTS'),	
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_PRODUCTION_MODIFIER',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'PLOT_HAS_QUARRY_REQUIREMENTS'),
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_PRODUCTION_MODIFIER',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'PLOT_HAS_MINE_REQUIREMENTS'),
	('CITY_POLICY_REVISION_ALMANAC_BONUS_RESOURCE_FARM_SCIENCE',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_LUXURY_RESOURCE_FARM_SCIENCE',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'HD_PLOT_HAS_FARM_OVER_LUXURY_RESOURCES'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_RESOURCE_PLANTATION_SCIENCE',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'PLOT_HAS_PLANTATION_REQUIREMENTS');--xhh 修编历书

insert or replace into RequirementSets
	(RequirementSetId,								RequirementSetType)
values
	('HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES',       'REQUIREMENTSET_TEST_ALL'),
	('HD_PLOT_HAS_FARM_OVER_LUXURY_RESOURCES',      'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,								RequirementId)
values
	('HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES',       'REQUIRES_PLOT_HAS_BONUS'),
	('HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES',       'REQUIRES_PLOT_HAS_FARM'),
	('HD_PLOT_HAS_FARM_OVER_LUXURY_RESOURCES',      'REQUIRES_PLOT_HAS_LUXURY'),
	('HD_PLOT_HAS_FARM_OVER_LUXURY_RESOURCES',      'REQUIRES_PLOT_HAS_FARM');



insert or replace into ModifierArguments
	(ModifierId,															Name,			Value)
values
	-- ('CITY_POLICY_DACAOGU_CITY_TRAINED_FREE_EXTRA_CAVALRY',					'Tag',			'CLASS_DACAOGU'),
	-- ('CITY_POLICY_DACAOGU_CITY_TRAINED_FREE_EXTRA_CAVALRY',					'Amount',		'1'),
	-- ('CITY_POLICY_DACAOGU_CITY_AMENITIES',									'Amount',		'-1'),
	-- ('CITY_POLICY_DACAOGU_CITY_GROWTH_MODIFIER',							'Amount',		'-100'),
	-- ('CITY_POLICY_DACAOGU_POP_FOOD_MODIFIER',								'YieldType',	'YIELD_FOOD'),				
	-- ('CITY_POLICY_DACAOGU_POP_FOOD_MODIFIER',								'Amount',		'-1'),					
	-- ('CITY_POLICY_DACAOGU_CITY_POP_HORSEMANREDUCED_MODIFIER',				'Amount',		'-1'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_HORSEMANREDUCED_MODIFIER',				'UnitType',		'UNIT_HORSEMAN'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_COURSERREDUCED_MODIFIER',				'Amount',		'-1'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_COURSERREDUCED_MODIFIER',				'UnitType',		'UNIT_COURSER'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_HUNGARY_BLACK_ARMYREDUCED_MODIFIER',		'Amount',		'-1'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_HUNGARY_BLACK_ARMYREDUCED_MODIFIER',		'UnitType',		'UNIT_HUNGARY_BLACK_ARMY'),
	-- ('CITY_POLICY_DACAOGU_CITY_TRAINED_CAVALRY_EXTRA_PILLAGE_YIELD',		'AbilityType',	'ABILITY_TRAINED_LIGHT_CAVALRY_EXTRA_PILLAGE_YIELD'),
	-- ('CITY_POLICY_DACAOGU_CITY_TRAINED_CAVALRY_PILLAGE_LESS_MOVEMENT',		'AbilityType',	'ABILITY_TRAINED_LIGHT_CAVALRY_PILLAGE_LESS_MOVEMENT'),
	('CITY_POLICY_AGRICULTURAL_TAX_FARM_GOLD_MODIFIER',						'YieldType',	'YIELD_GOLD'),
	('CITY_POLICY_AGRICULTURAL_TAX_FARM_GOLD_MODIFIER',						'Amount',		'2'),
	('CITY_POLICY_AGRICULTURAL_TAX_FARM_FOOD_MODIFIER',						'YieldType',	'YIELD_FOOD'),
	('CITY_POLICY_AGRICULTURAL_TAX_FARM_FOOD_MODIFIER',						'Amount',		'-1'),
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_GOLD_MODIFIER',						'YieldType',	'YIELD_GOLD'),
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_GOLD_MODIFIER',						'Amount',		'2'),
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_GOLD_MODIFIER',						'YieldType',	'YIELD_GOLD'),
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_GOLD_MODIFIER',						'Amount',		'2'),
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_PRODUCTION_MODIFIER',				'YieldType',	'YIELD_PRODUCTION'),
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_PRODUCTION_MODIFIER',				'Amount',		'-1'),
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_PRODUCTION_MODIFIER',					'YieldType',	'YIELD_PRODUCTION'),
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_PRODUCTION_MODIFIER',					'Amount',		'-1'),
	('CITY_POLICY_LABOR_POP_FOOD_MODIFIER',									'YieldType',	'YIELD_FOOD'),
	('CITY_POLICY_LABOR_POP_FOOD_MODIFIER',									'Amount',		'-1'),
	('CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER',								'YieldType',	'YIELD_SCIENCE'),
	('CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER',								'Amount',		'-0.2'),
	('CITY_POLICY_LABOR_POP_CULTURE_MODIFIER',								'YieldType',	'YIELD_CULTURE'),
	('CITY_POLICY_LABOR_POP_CULTURE_MODIFIER',								'Amount',		'-0.1'),
	('CITY_POLICY_LABOR_POP_PROD_MODIFIER',									'YieldType',	'YIELD_PRODUCTION'),
	('CITY_POLICY_LABOR_POP_PROD_MODIFIER',									'Amount',		'1.5'),
	('CITY_POLICY_LABOR_CITY_GROWTH_MODIFIER',								'Amount',		'-75'),
	('CITY_POLICY_LABOR_CITY_AMENITIES',									'Amount',		'-1'),
	('CITY_POLICY_REVISION_ALMANAC_DECREASE_GOLD',							'YieldType',	'YIELD_GOLD'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_DECREASE_GOLD',							'Amount',		'-8'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_BONUS_RESOURCE_FARM_SCIENCE',			'YieldType',	'YIELD_SCIENCE'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_BONUS_RESOURCE_FARM_SCIENCE',			'Amount',		'1'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_LUXURY_RESOURCE_FARM_SCIENCE',			'YieldType',	'YIELD_SCIENCE'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_LUXURY_RESOURCE_FARM_SCIENCE',			'Amount',		'1'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_RESOURCE_PLANTATION_SCIENCE',			'YieldType',	'YIELD_SCIENCE'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_RESOURCE_PLANTATION_SCIENCE',			'Amount',		'1');--xhh 修编历书

-- Projects
-- Only need to set the prereq civic for the one start the city policy.
insert or replace into Projects (ProjectType, Name, ShortName, Description, Cost, PrereqCivic, PrereqTech, AdvisorType) values
	-- enable labor city policy
	-- ('PROJECT_CITY_POLICY_ENABLE_DACAOGU',
	-- 'LOC_PROJECT_CITY_POLICY_ENABLE_DACAOGU_NAME',
	-- 'LOC_PROJECT_CITY_POLICY_ENABLE_DACAOGU_SHORT_NAME',
	-- 'LOC_PROJECT_CITY_POLICY_ENABLE_DACAOGU_DESCRIPTION',
	-- 45,
	-- 'CIVIC_MILITARY_TRAINING',
	-- 'ADVISOR_GENERIC'
	-- ),
	('PROJECT_CITY_POLICY_ENABLE_LABOR',
	'LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_DESCRIPTION',
	10,
	'CIVIC_CODE_OF_LAWS',
	NULL,
	'ADVISOR_GENERIC'
	),
	('PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX',
	'LOC_PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX_DESCRIPTION',
	10,
	'CIVIC_STATE_WORKFORCE',
	NULL,
	'ADVISOR_GENERIC'
	),
	('PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX',
	'LOC_PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX_DESCRIPTION',
	10,
	'CIVIC_STATE_WORKFORCE',
	NULL,
	'ADVISOR_GENERIC'
	),
	-- disable labor city policy
	-- ('PROJECT_CITY_POLICY_DISABLE_DACAOGU',
	-- 'LOC_PROJECT_CITY_POLICY_DISABLE_DACAOGU_NAME',
	-- 'LOC_PROJECT_CITY_POLICY_DISABLE_DACAOGU_SHORT_NAME',
	-- 'LOC_PROJECT_CITY_POLICY_DISABLE_DACAOGU_DESCRIPTION',
	-- 10,
	-- NULL, -- 'CIVIC_CODE_OF_LAWS',
	-- NULL,
	-- 'ADVISOR_GENERIC'
	-- ),
	('PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX',
	'LOC_PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX_DESCRIPTION',
	10,
	NULL, -- 'CIVIC_CODE_OF_LAWS',
	NULL,
	'ADVISOR_GENERIC'
	),
	('PROJECT_CITY_POLICY_DISABLE_LABOR',
	'LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_DESCRIPTION',
	10,
	NULL, -- 'CIVIC_CODE_OF_LAWS',
	NULL,
	'ADVISOR_GENERIC'
	),
	('PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX',
	'LOC_PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX_DESCRIPTION',
	10,
	NULL, -- 'CIVIC_CODE_OF_LAWS',
	NULL,
	'ADVISOR_GENERIC'
	),
	('PROJECT_CITY_POLICY_ENABLE_REVISION_ALMANAC',
	'LOC_PROJECT_CITY_POLICY_ENABLE_REVISION_ALMANAC_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_REVISION_ALMANAC_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_REVISION_ALMANAC_DESCRIPTION',
	5,
	NULL,
	'TECH_CALENDAR_HD',
	'ADVISOR_TECHNOLOGY'
	),--xhh 修编历书
	('PROJECT_CITY_POLICY_DISABLE_REVISION_ALMANAC',
	'LOC_PROJECT_CITY_POLICY_DISABLE_REVISION_ALMANAC_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_REVISION_ALMANAC_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_REVISION_ALMANAC_DESCRIPTION',
	10,
	NULL,
	NULL,
	'ADVISOR_GENERIC'
	)--xhh 修编历书
;

insert or replace into Projects_XP2
	(ProjectType,											RequiredBuilding,							CreateBuilding)
values
	-- ('PROJECT_CITY_POLICY_ENABLE_DACAOGU',					'BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_DACAOGU'),
	('PROJECT_CITY_POLICY_ENABLE_LABOR',					'BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_LABOR'),
	('PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX',			'BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_AGRICULTURAL_TAX'),
	('PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX',			'BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_INDUSTRAIL_TAX'),
	-- ('PROJECT_CITY_POLICY_DISABLE_DACAOGU',					'BUILDING_CITY_POLICY_DACAOGU',				'BUILDING_CITY_POLICY_EMPTY'),
	('PROJECT_CITY_POLICY_DISABLE_LABOR',					'BUILDING_CITY_POLICY_LABOR',				'BUILDING_CITY_POLICY_EMPTY'),
	('PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX',		'BUILDING_CITY_POLICY_AGRICULTURAL_TAX',	'BUILDING_CITY_POLICY_EMPTY'),
	('PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX',			'BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'BUILDING_CITY_POLICY_EMPTY'),
	('PROJECT_CITY_POLICY_ENABLE_REVISION_ALMANAC',			'BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_REVISION_ALMANAC'),--xhh 修编历书
	('PROJECT_CITY_POLICY_DISABLE_REVISION_ALMANAC',		'BUILDING_CITY_POLICY_REVISION_ALMANAC',	'BUILDING_CITY_POLICY_EMPTY');--xhh 修编历书

insert or replace into Project_BuildingCosts
	(ProjectType,										ConsumedBuildingType)
values
	-- ('PROJECT_CITY_POLICY_ENABLE_DACAOGU',				'BUILDING_CITY_POLICY_EMPTY'),
	('PROJECT_CITY_POLICY_ENABLE_LABOR',				'BUILDING_CITY_POLICY_EMPTY'),
	('PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX',		'BUILDING_CITY_POLICY_EMPTY'),
	('PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX',		'BUILDING_CITY_POLICY_EMPTY'),
	('PROJECT_CITY_POLICY_DISABLE_LABOR',				'BUILDING_CITY_POLICY_LABOR'),
	-- ('PROJECT_CITY_POLICY_DISABLE_DACAOGU',				'BUILDING_CITY_POLICY_DACAOGU'),
	('PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX',	'BUILDING_CITY_POLICY_AGRICULTURAL_TAX'),	
	('PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX',		'BUILDING_CITY_POLICY_INDUSTRAIL_TAX'),
	('PROJECT_CITY_POLICY_ENABLE_REVISION_ALMANAC',		'BUILDING_CITY_POLICY_EMPTY'),--xhh 修编历书
	('PROJECT_CITY_POLICY_DISABLE_REVISION_ALMANAC',	'BUILDING_CITY_POLICY_REVISION_ALMANAC');--xhh 修编历书

--mutual  exclusive (breif ver)
insert or replace into MutuallyExclusiveBuildings
	(Building,									MutuallyExclusiveBuilding)
values
	('BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_AGRICULTURAL_TAX'),
	('BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_INDUSTRAIL_TAX'),
	-- ('BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_DACAOGU'),
	('BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_LABOR'),
	('BUILDING_CITY_POLICY_AGRICULTURAL_TAX',	'BUILDING_CITY_POLICY_EMPTY'),
	('BUILDING_CITY_POLICY_AGRICULTURAL_TAX',	'BUILDING_CITY_POLICY_INDUSTRAIL_TAX'),
	-- ('BUILDING_CITY_POLICY_AGRICULTURAL_TAX',	'BUILDING_CITY_POLICY_DACAOGU'),
	('BUILDING_CITY_POLICY_AGRICULTURAL_TAX',	'BUILDING_CITY_POLICY_LABOR'),
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'BUILDING_CITY_POLICY_AGRICULTURAL_TAX'),
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'BUILDING_CITY_POLICY_EMPTY'),
	-- ('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'BUILDING_CITY_POLICY_DACAOGU'),
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'BUILDING_CITY_POLICY_LABOR'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'BUILDING_CITY_POLICY_AGRICULTURAL_TAX'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'BUILDING_CITY_POLICY_EMPTY'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'BUILDING_CITY_POLICY_INDUSTRAIL_TAX'),
	-- ('BUILDING_CITY_POLICY_DACAOGU',			'BUILDING_CITY_POLICY_LABOR'),
	('BUILDING_CITY_POLICY_LABOR',				'BUILDING_CITY_POLICY_AGRICULTURAL_TAX'),
	('BUILDING_CITY_POLICY_LABOR',				'BUILDING_CITY_POLICY_EMPTY'),
	('BUILDING_CITY_POLICY_LABOR',				'BUILDING_CITY_POLICY_INDUSTRAIL_TAX'),
	-- ('BUILDING_CITY_POLICY_LABOR',				'BUILDING_CITY_POLICY_DACAOGU'),
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'BUILDING_CITY_POLICY_EMPTY'),--xhh 修编历书
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'BUILDING_CITY_POLICY_LABOR'),--xhh 修编历书
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'BUILDING_CITY_POLICY_AGRICULTURAL_TAX'),--xhh 修编历书
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'BUILDING_CITY_POLICY_INDUSTRAIL_TAX'),--xhh 修编历书
	('BUILDING_CITY_POLICY_EMPTY',				'BUILDING_CITY_POLICY_REVISION_ALMANAC'),--xhh 修编历书
	('BUILDING_CITY_POLICY_LABOR',				'BUILDING_CITY_POLICY_REVISION_ALMANAC'),--xhh 修编历书
	('BUILDING_CITY_POLICY_AGRICULTURAL_TAX',	'BUILDING_CITY_POLICY_REVISION_ALMANAC'),--xhh 修编历书
	('BUILDING_CITY_POLICY_INDUSTRAIL_TAX',		'BUILDING_CITY_POLICY_REVISION_ALMANAC');--xhh 修编历书
