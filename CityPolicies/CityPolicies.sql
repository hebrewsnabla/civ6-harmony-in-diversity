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
	(Type,										Kind)
values
	-- Buildings
	('BUILDING_CITY_POLICY_EMPTY',				'KIND_BUILDING'),
	('BUILDING_CITY_POLICY_LABOR',				'KIND_BUILDING'),
	-- Projects
	('PROJECT_CITY_POLICY_ENABLE_LABOR',		'KIND_PROJECT'),
	('PROJECT_CITY_POLICY_DISABLE_LABOR',		'KIND_PROJECT');

-- Use buildings as city policies, use projects to turn on and turn off the city policies.
insert or replace into Buildings (BuildingType, Name, Cost, Description) values
	('BUILDING_CITY_POLICY_EMPTY', 'LOC_BUILDING_CITY_POLICY_EMPTY_NAME', 1, 'LOC_BUILDING_CITY_POLICY_EMPTY_DESCRIPTION'),
	('BUILDING_CITY_POLICY_LABOR', 'LOC_BUILDING_CITY_POLICY_LABOR_NAME', 1, 'LOC_BUILDING_CITY_POLICY_LABOR_DESCRIPTION');

-- Make AI less likely to build the city policy buildings directly (though they should not see that directly).
insert or replace into AiListTypes (ListType) values
	('AI_LESS_CITY_POLICY_BUILDINGS');

insert or replace into AiLists
	(ListType,							LeaderType,					System)
values
	('AI_LESS_CITY_POLICY_BUILDINGS',	'TRAIT_LEADER_MAJOR_CIV',	'Buildings');

insert or replace into AiFavoredItems
	(ListType,					Item,									Favored,	Value)
values
	('AI_LESS_CITY_POLICY_BUILDINGS',	'BUILDING_CITY_POLICY_EMPTY',	0,			0),
	('AI_LESS_CITY_POLICY_BUILDINGS',	'BUILDING_CITY_POLICY_LABOR',	0,			0);

-- Building effect
insert or replace into BuildingModifiers 
	(BuildingType,					ModifierId)
values 
	('BUILDING_CITY_POLICY_LABOR',	'CITY_POLICY_LABOR_POP_FOOD_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_LABOR',	'CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER'),
	-- ('BUILDING_CITY_POLICY_LABOR',	'CITY_POLICY_LABOR_POP_CULTURE_MODIFIER'),
	('BUILDING_CITY_POLICY_LABOR',	'CITY_POLICY_LABOR_POP_PROD_MODIFIER'),
	('BUILDING_CITY_POLICY_LABOR',	'CITY_POLICY_LABOR_CITY_GROWTH_MODIFIER'),
	('BUILDING_CITY_POLICY_LABOR',	'CITY_POLICY_LABOR_CITY_AMENITIES');

-- Modifiers
insert or replace into Modifiers
	(ModifierId,								ModifierType)
values
	('CITY_POLICY_LABOR_POP_FOOD_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_POP_CULTURE_MODIFIER',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_POP_PROD_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_CITY_GROWTH_MODIFIER',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH'),
	('CITY_POLICY_LABOR_CITY_AMENITIES',		'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('CITY_POLICY_LABOR_POP_FOOD_MODIFIER',		'YieldType',	'YIELD_FOOD'),
	('CITY_POLICY_LABOR_POP_FOOD_MODIFIER',		'Amount',		'-1'),
	('CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER',	'YieldType',	'YIELD_SCIENCE'),
	('CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER',	'Amount',		'-0.2'),
	('CITY_POLICY_LABOR_POP_CULTURE_MODIFIER',	'YieldType',	'YIELD_CULTURE'),
	('CITY_POLICY_LABOR_POP_CULTURE_MODIFIER',	'Amount',		'-0.1'),
	('CITY_POLICY_LABOR_POP_PROD_MODIFIER',		'YieldType',	'YIELD_PRODUCTION'),
	('CITY_POLICY_LABOR_POP_PROD_MODIFIER',		'Amount',		'1.5'),
	('CITY_POLICY_LABOR_CITY_GROWTH_MODIFIER',	'Amount',		'-50'),
	('CITY_POLICY_LABOR_CITY_AMENITIES',		'Amount',		'-1');

-- Projects
-- Only need to set the prereq civic for the one start the city policy.
insert or replace into Projects (ProjectType, Name, ShortName, Description, Cost, PrereqCivic, AdvisorType) values
	-- enable labor city policy
	('PROJECT_CITY_POLICY_ENABLE_LABOR',
	'LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_DESCRIPTION',
	10,
	'CIVIC_CODE_OF_LAWS',
	'ADVISOR_GENERIC'
	),

	-- disable labor city policy
	('PROJECT_CITY_POLICY_DISABLE_LABOR',
	'LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_SHORT_NAME',
	'LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_DESCRIPTION',
	10,
	NULL, -- 'CIVIC_CODE_OF_LAWS',
	'ADVISOR_GENERIC'
	)
;

insert or replace into Projects_XP2
	(ProjectType,							RequiredBuilding,				CreateBuilding)
values
	('PROJECT_CITY_POLICY_ENABLE_LABOR',	'BUILDING_CITY_POLICY_EMPTY',	'BUILDING_CITY_POLICY_LABOR'),
	('PROJECT_CITY_POLICY_DISABLE_LABOR',	'BUILDING_CITY_POLICY_LABOR',	'BUILDING_CITY_POLICY_EMPTY');

insert or replace into Project_BuildingCosts
	(ProjectType,							ConsumedBuildingType)
values
	('PROJECT_CITY_POLICY_ENABLE_LABOR',	'BUILDING_CITY_POLICY_EMPTY'),
	('PROJECT_CITY_POLICY_DISABLE_LABOR',	'BUILDING_CITY_POLICY_LABOR');
