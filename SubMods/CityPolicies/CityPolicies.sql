-------------------------------------
--   Introduce city-level policy   --
-------------------------------------

-- Modifier
insert or replace into Types
	(Type,										Kind)
values
	('GRANT_BUILDING_TO_ALL_CITIES_IGNORE',		'KIND_MODIFIER');

insert or replace into DynamicModifiers
	(ModifierType,							CollectionType,				EffectType)
values
	('GRANT_BUILDING_TO_ALL_CITIES_IGNORE', 'COLLECTION_PLAYER_CITIES', 'EFFECT_GRANT_BUILDING_IN_CITY_IGNORE');
-------------------------------------

-- grant basic building to enable city policies
insert or replace into TraitModifiers
	(TraitType,					ModifierId)
values
	('TRAIT_LEADER_MAJOR_CIV',	'TRAIT_GRANT_EMPTY_CITY_POLICY_MODIFIER'),
	('MINOR_CIV_DEFAULT_TRAIT',	'TRAIT_GRANT_EMPTY_CITY_POLICY_MODIFIER');

insert or replace into Modifiers
	(ModifierId,								ModifierType)
values
	('TRAIT_GRANT_EMPTY_CITY_POLICY_MODIFIER', 'GRANT_BUILDING_TO_ALL_CITIES_IGNORE');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('TRAIT_GRANT_EMPTY_CITY_POLICY_MODIFIER', 'BuildingType', 'BUILDING_CITY_POLICY_EMPTY');

-- 
create table 'CityPolicyMaster'(
	'CityPolicy' TEXT NOT NULL,
	'BuildingType' TEXT,
	'EnableProjectType' TEXT,
	'DisableProjectType' TEXT,
	'EnableCivicType' TEXT,
	'EnableTechType' TEXT,
	'EnableCost' INT NOT NULL,
	'DisableCost' INT NOT NULL,
	PRIMARY KEY('CityPolicy')
);

------【此处需要手动修改】------
insert or replace into CityPolicyMaster
	(CityPolicy,			EnableCost,	DisableCost)
values
	('EMPTY',				0,			0),
	('LABOR',				5,			10),
	('REVISION_ALMANAC',	5,			10),
	('AGRICULTURAL_TAX',	10,			10),
	('INDUSTRAIL_TAX',		10,			10),
	('FREIGHT',				5,			10),
	('THEOLOGICAL_SEMINAR',	5,			10),
	('FORGING_IRON',		10,			10);
insert or replace into CityPolicyMaster
	(CityPolicy,			EnableCost,	DisableCost)
select
	'DIPLOMATIC_MEETING',	10,			10
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_CONSULATE');

update CityPolicyMaster set EnableCivicType = 'CIVIC_CODE_OF_LAWS' where CityPolicy = 'LABOR';
update CityPolicyMaster set EnableTechType  = 'TECH_CALENDAR_HD' where CityPolicy = 'REVISION_ALMANAC';
update CityPolicyMaster set EnableCivicType = 'CIVIC_STATE_WORKFORCE' where CityPolicy = 'AGRICULTURAL_TAX';
update CityPolicyMaster set EnableCivicType = 'CIVIC_STATE_WORKFORCE' where CityPolicy = 'INDUSTRAIL_TAX';
update CityPolicyMaster set EnableTechType = 'TECH_MATHEMATICS' where CityPolicy = 'DIPLOMATIC_MEETING';
update CityPolicyMaster set EnableTechType = 'TECH_ANIMAL_HUSBANDRY' where CityPolicy = 'FREIGHT';
update CityPolicyMaster set EnableCivicType = 'CIVIC_MYSTICISM' where CityPolicy = 'THEOLOGICAL_SEMINAR';
update CityPolicyMaster set EnableTechType = 'TECH_IRON_WORKING' where CityPolicy = 'FORGING_IRON';
------【结束】------

update CityPolicyMaster set
	BuildingType 			= 'BUILDING_CITY_POLICY_' || CityPolicy,
	EnableProjectType 		= 'PROJECT_CITY_POLICY_ENABLE_' || CityPolicy,
	DisableProjectType 		= 'PROJECT_CITY_POLICY_DISABLE_' || CityPolicy;

insert or replace into Types (Type, Kind) select BuildingType, 'KIND_BUILDING' from CityPolicyMaster;
insert or replace into Types (Type, Kind) select EnableProjectType, 'KIND_PROJECT' from CityPolicyMaster where CityPolicy != 'EMPTY';
insert or replace into Types (Type, Kind) select DisableProjectType, 'KIND_PROJECT' from CityPolicyMaster where CityPolicy != 'EMPTY';

-- Use buildings as city policies, use projects to turn on and turn off the city policies.
insert or replace into Buildings (BuildingType,	Name,	Cost,	Description)
select BuildingType, 'LOC_'||BuildingType||'_NAME',		1, 		'LOC_'||BuildingType||'_DESCRIPTION'
from CityPolicyMaster;

insert or replace into Buildings_XP2 (BuildingType, Pillage)
select BuildingType, 0 from CityPolicyMaster;

------【此处需要手动修改】------
-- Building Yield
update Buildings set Maintenance = 8 where BuildingType = 'BUILDING_CITY_POLICY_REVISION_ALMANAC';
-- insert or replace into Building_YieldChanges
-- 	(BuildingType,								YieldType,			YieldChange)
-- values
-- 	('BUILDING_CITY_POLICY_FREIGHT',			'YIELD_PRODUCTION',	6),
-- 	('BUILDING_CITY_POLICY_FORGING_IRON',		'YIELD_PRODUCTION',	8);

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
	('BUILDING_CITY_POLICY_DIPLOMATIC_MEETING',	'CITY_POLICY_DIPLOMATIC_MEETING_BASE_REDUCE_FAVOR'),
	('BUILDING_CITY_POLICY_DIPLOMATIC_MEETING',	'CITY_POLICY_DIPLOMATIC_MEETING_TIER1_REDUCE_FAVOR'),
	('BUILDING_CITY_POLICY_DIPLOMATIC_MEETING',	'CITY_POLICY_DIPLOMATIC_MEETING_TIER2_REDUCE_FAVOR'),
	('BUILDING_CITY_POLICY_DIPLOMATIC_MEETING',	'CITY_POLICY_DIPLOMATIC_MEETING_BASE_INFLUENCE'),
	('BUILDING_CITY_POLICY_DIPLOMATIC_MEETING',	'CITY_POLICY_DIPLOMATIC_MEETING_TIER1_INFLUENCE'),
	('BUILDING_CITY_POLICY_DIPLOMATIC_MEETING',	'CITY_POLICY_DIPLOMATIC_MEETING_TIER2_INFLUENCE'),
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'CITY_POLICY_REVISION_ALMANAC_BONUS_RESOURCE_FARM_SCIENCE'),
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'CITY_POLICY_REVISION_ALMANAC_LUXURY_RESOURCE_FARM_SCIENCE'),
	('BUILDING_CITY_POLICY_REVISION_ALMANAC',	'CITY_POLICY_REVISION_ALMANAC_RESOURCE_PLANTATION_SCIENCE'),
	('BUILDING_CITY_POLICY_FREIGHT',			'CITY_POLICY_FREIGHT_PRODUCTION'),
	('BUILDING_CITY_POLICY_FREIGHT',			'CITY_POLICY_FREIGHT_FOOD'),
	('BUILDING_CITY_POLICY_THEOLOGICAL_SEMINAR','CITY_POLICY_THEOLOGICAL_SEMINAR_CULTURE'),
	('BUILDING_CITY_POLICY_THEOLOGICAL_SEMINAR','CITY_POLICY_THEOLOGICAL_SEMINAR_SCIENCE'),
	('BUILDING_CITY_POLICY_THEOLOGICAL_SEMINAR','CITY_POLICY_THEOLOGICAL_SEMINAR_FAITH'),
	('BUILDING_CITY_POLICY_THEOLOGICAL_SEMINAR','CITY_POLICY_THEOLOGICAL_SEMINAR_PRESSURE'),
	('BUILDING_CITY_POLICY_FORGING_IRON',		'CITY_POLICY_FORGING_IRON_PRODUCTION');

-- Modifiers
-- insert or replace into Modifiers
-- 	(ModifierId,													ModifierType,											Permanent)
-- values
-- 	('CITY_POLICY_DACAOGU_CITY_TRAINED_CAVALRY_PILLAGE_LESS_MOVEMENT','MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',1),
-- 	('CITY_POLICY_DACAOGU_CITY_TRAINED_CAVALRY_EXTRA_PILLAGE_YIELD','MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	1);

insert or replace into Modifiers
	(ModifierId,														ModifierType)
values
	('HD_GRANT_ZERO_FAVOR',												'MODIFIER_PLAYER_ADD_FAVOR'),
	-- ('CITY_POLICY_DACAOGU_CITY_GROWTH_MODIFIER',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH'),
	-- ('CITY_POLICY_DACAOGU_POP_FOOD_MODIFIER',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_HORSEMANREDUCED_MODIFIER',			'MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_COURSERREDUCED_MODIFIER',			'MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER','MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT'),
	-- ('CITY_POLICY_DACAOGU_CITY_POP_HUNGARY_BLACK_ARMYREDUCED_MODIFIER',	'MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT'),
	-- ('CITY_POLICY_DACAOGU_CITY_AMENITIES',								'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT'),
	('CITY_POLICY_LABOR_POP_FOOD_MODIFIER',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	-- ('CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	-- ('CITY_POLICY_LABOR_POP_CULTURE_MODIFIER',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_POP_PROD_MODIFIER',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('CITY_POLICY_LABOR_CITY_GROWTH_MODIFIER',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH'),
	('CITY_POLICY_LABOR_CITY_AMENITIES',								'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT');

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
	('CITY_POLICY_DIPLOMATIC_MEETING_BASE_REDUCE_FAVOR',				'MODIFIER_PLAYER_ADJUST_EXTRA_FAVOR_PER_TURN',				NULL),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER1_REDUCE_FAVOR',				'MODIFIER_PLAYER_ADJUST_EXTRA_FAVOR_PER_TURN',				'BUILDING_IS_CONSULATE'),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER2_REDUCE_FAVOR',				'MODIFIER_PLAYER_ADJUST_EXTRA_FAVOR_PER_TURN',				'BUILDING_IS_CHANCERY'),
	('CITY_POLICY_DIPLOMATIC_MEETING_BASE_INFLUENCE',					'MODIFIER_CITY_OWNER_ATTACH_MODIFIER',						'HD_PLAYER_HAS_FAVOR_REQUIREMENTS'),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER1_INFLUENCE',					'MODIFIER_CITY_OWNER_ATTACH_MODIFIER',						'HD_PLAYER_HAS_FAVOR_REQUIREMENTS'),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER2_INFLUENCE',					'MODIFIER_CITY_OWNER_ATTACH_MODIFIER',						'HD_PLAYER_HAS_FAVOR_REQUIREMENTS'),
	('CITY_POLICY_DIPLOMATIC_MEETING_BASE_INFLUENCE_MODIFIER',			'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',			NULL),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER1_INFLUENCE_MODIFIER',			'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',			'BUILDING_IS_CONSULATE'),	
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER2_INFLUENCE_MODIFIER',			'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',			'BUILDING_IS_CHANCERY'),
	('CITY_POLICY_REVISION_ALMANAC_BONUS_RESOURCE_FARM_SCIENCE',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_LUXURY_RESOURCE_FARM_SCIENCE',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'HD_PLOT_HAS_FARM_OVER_LUXURY_RESOURCES'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_RESOURCE_PLANTATION_SCIENCE',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'PLOT_HAS_PLANTATION_REQUIREMENTS'),--xhh 修编历书
	('CITY_POLICY_FREIGHT_PRODUCTION',									'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					'HD_PLAYER_HAS_HORSES_REQUIREMENTS'),--xhh 货运
	('CITY_POLICY_FREIGHT_FOOD',										'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					'HD_PLAYER_HAS_HORSES_REQUIREMENTS'),--xhh 货运
	('CITY_POLICY_THEOLOGICAL_SEMINAR_CULTURE',							'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					NULL),--time 神学研讨
	('CITY_POLICY_THEOLOGICAL_SEMINAR_SCIENCE',							'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					NULL),--time 神学研讨
	('CITY_POLICY_THEOLOGICAL_SEMINAR_FAITH',							'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					NULL),--time 神学研讨
	('CITY_POLICY_THEOLOGICAL_SEMINAR_PRESSURE',						'MODIFIER_SINGLE_CITY_RELIGION_PRESSURE',					NULL),--time 神学研讨
	('CITY_POLICY_FORGING_IRON_PRODUCTION',								'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					'HD_PLAYER_HAS_IRON_REQUIREMENTS');--xhh 锻铁

insert or ignore into RequirementSets
	(RequirementSetId,								RequirementSetType)
values
	('HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES',       'REQUIREMENTSET_TEST_ALL'),
	('HD_PLOT_HAS_FARM_OVER_LUXURY_RESOURCES',      'REQUIREMENTSET_TEST_ALL'),
	('HD_PLAYER_HAS_FAVOR_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,								RequirementId)
values
	('HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES',       'REQUIRES_PLOT_HAS_BONUS'),
	('HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES',       'REQUIRES_PLOT_HAS_FARM'),
	('HD_PLOT_HAS_FARM_OVER_BONUS_RESOURCES',       'REQUIRES_CITY_HAS_DISTRICT_AQUEDUCT'),
	('HD_PLOT_HAS_FARM_OVER_LUXURY_RESOURCES',      'REQUIRES_PLOT_HAS_LUXURY'),
	('HD_PLOT_HAS_FARM_OVER_LUXURY_RESOURCES',      'REQUIRES_PLOT_HAS_FARM'),
	('HD_PLOT_HAS_FARM_OVER_LUXURY_RESOURCES',      'REQUIRES_CITY_HAS_DISTRICT_AQUEDUCT'),
	('HD_PLAYER_HAS_FAVOR_REQUIREMENTS',     		'HD_REQUIRES_PLAYER_HAS_FAVOR');

insert or ignore into Requirements
	(RequirementId,									RequirementType)
values
	('HD_REQUIRES_PLAYER_HAS_FAVOR',				'REQUIREMENT_PLOT_PROPERTY_MATCHES');

insert or ignore into RequirementArguments
	(RequirementId,									Name,						Value)
values
    ('HD_REQUIRES_PLAYER_HAS_FAVOR', 				'PropertyName',     		'HD_HasDipFavor'),
    ('HD_REQUIRES_PLAYER_HAS_FAVOR', 				'PropertyMinimum',  		1);

insert or replace into ModifierArguments
	(ModifierId,															Name,			Value)
values
	('HD_GRANT_ZERO_FAVOR',													'Amount',		0),
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
	('CITY_POLICY_AGRICULTURAL_TAX_FARM_GOLD_MODIFIER',						'Amount',		2),
	('CITY_POLICY_AGRICULTURAL_TAX_FARM_FOOD_MODIFIER',						'YieldType',	'YIELD_FOOD'),
	('CITY_POLICY_AGRICULTURAL_TAX_FARM_FOOD_MODIFIER',						'Amount',		-1),
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_GOLD_MODIFIER',						'YieldType',	'YIELD_GOLD'),
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_GOLD_MODIFIER',						'Amount',		2),
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_GOLD_MODIFIER',						'YieldType',	'YIELD_GOLD'),
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_GOLD_MODIFIER',						'Amount',		2),
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_PRODUCTION_MODIFIER',				'YieldType',	'YIELD_PRODUCTION'),
	('CITY_POLICY_INDUSTRAIL_TAX_QUARRY_PRODUCTION_MODIFIER',				'Amount',		-1),
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_PRODUCTION_MODIFIER',					'YieldType',	'YIELD_PRODUCTION'),
	('CITY_POLICY_INDUSTRAIL_TAX_MINE_PRODUCTION_MODIFIER',					'Amount',		-1),
	('CITY_POLICY_LABOR_POP_FOOD_MODIFIER',									'YieldType',	'YIELD_FOOD'),
	('CITY_POLICY_LABOR_POP_FOOD_MODIFIER',									'Amount',		-1),
	-- ('CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER',								'YieldType',	'YIELD_SCIENCE'),
	-- ('CITY_POLICY_LABOR_POP_SCIENCE_MODIFIER',								'Amount',		-0.2),
	-- ('CITY_POLICY_LABOR_POP_CULTURE_MODIFIER',								'YieldType',	'YIELD_CULTURE'),
	-- ('CITY_POLICY_LABOR_POP_CULTURE_MODIFIER',								'Amount',		-0.1),
	('CITY_POLICY_LABOR_POP_PROD_MODIFIER',									'YieldType',	'YIELD_PRODUCTION'),
	('CITY_POLICY_LABOR_POP_PROD_MODIFIER',									'Amount',		1.5),
	('CITY_POLICY_LABOR_CITY_GROWTH_MODIFIER',								'Amount',		-75),
	('CITY_POLICY_LABOR_CITY_AMENITIES',									'Amount',		-1),
	('CITY_POLICY_DIPLOMATIC_MEETING_BASE_REDUCE_FAVOR',					'Amount',		-2),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER1_REDUCE_FAVOR',					'Amount',		-2),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER2_REDUCE_FAVOR',					'Amount',		-2),
	('CITY_POLICY_DIPLOMATIC_MEETING_BASE_INFLUENCE',						'ModifierId',	'CITY_POLICY_DIPLOMATIC_MEETING_BASE_INFLUENCE_MODIFIER'),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER1_INFLUENCE',						'ModifierId',	'CITY_POLICY_DIPLOMATIC_MEETING_TIER1_INFLUENCE_MODIFIER'),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER2_INFLUENCE',						'ModifierId',	'CITY_POLICY_DIPLOMATIC_MEETING_TIER2_INFLUENCE_MODIFIER'),
	('CITY_POLICY_DIPLOMATIC_MEETING_BASE_INFLUENCE_MODIFIER',				'Amount',		5),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER1_INFLUENCE_MODIFIER',				'Amount',		5),
	('CITY_POLICY_DIPLOMATIC_MEETING_TIER2_INFLUENCE_MODIFIER',				'Amount',		5),
	('CITY_POLICY_REVISION_ALMANAC_BONUS_RESOURCE_FARM_SCIENCE',			'YieldType',	'YIELD_FOOD,YIELD_PRODUCTION,YIELD_SCIENCE'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_BONUS_RESOURCE_FARM_SCIENCE',			'Amount',		'-1,1,1'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_LUXURY_RESOURCE_FARM_SCIENCE',			'YieldType',	'YIELD_FOOD,YIELD_PRODUCTION,YIELD_SCIENCE'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_LUXURY_RESOURCE_FARM_SCIENCE',			'Amount',		'-1,1,1'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_RESOURCE_PLANTATION_SCIENCE',			'YieldType',	'YIELD_GOLD,YIELD_PRODUCTION,YIELD_SCIENCE'),--xhh 修编历书
	('CITY_POLICY_REVISION_ALMANAC_RESOURCE_PLANTATION_SCIENCE',			'Amount',		'-2,1,1'),--xhh 修编历书
	('CITY_POLICY_FREIGHT_PRODUCTION',										'YieldType',	'YIELD_PRODUCTION'),--xhh 货运
	('CITY_POLICY_FREIGHT_PRODUCTION',										'Amount',		3),--xhh 货运
	('CITY_POLICY_FREIGHT_FOOD',										    'YieldType',	'YIELD_FOOD'),--xhh 货运
	('CITY_POLICY_FREIGHT_FOOD',										    'Amount',		2),--xhh 货运
	('CITY_POLICY_THEOLOGICAL_SEMINAR_CULTURE',								'YieldType',	'YIELD_CULTURE'),--time 神学研讨
	('CITY_POLICY_THEOLOGICAL_SEMINAR_CULTURE',								'Amount',		2),--time 神学研讨
	('CITY_POLICY_THEOLOGICAL_SEMINAR_SCIENCE',								'YieldType',	'YIELD_SCIENCE'),--time 神学研讨
	('CITY_POLICY_THEOLOGICAL_SEMINAR_SCIENCE',								'Amount',		2),--time 神学研讨
	('CITY_POLICY_THEOLOGICAL_SEMINAR_FAITH',								'YieldType',	'YIELD_FAITH'),--time 神学研讨
	('CITY_POLICY_THEOLOGICAL_SEMINAR_FAITH',								'Amount',		-4),--time 神学研讨
	('CITY_POLICY_THEOLOGICAL_SEMINAR_PRESSURE',							'Amount',		-50),--time 神学研讨
	('CITY_POLICY_FORGING_IRON_PRODUCTION',									'YieldType',	'YIELD_PRODUCTION'),--xhh 锻铁
	('CITY_POLICY_FORGING_IRON_PRODUCTION',									'Amount',		5);--xhh 锻铁

delete from BuildingModifiers where BuildingType = 'BUILDING_CITY_POLICY_DIPLOMATIC_MEETING'
	and not exists (select BuildingType from Buildings where BuildingType = 'BUILDING_CITY_POLICY_DIPLOMATIC_MEETING');
delete from Modifiers where ModifierId like 'CITY_POLICY_DIPLOMATIC_MEETING_%'
	and not exists (select BuildingType from Buildings where BuildingType = 'BUILDING_CITY_POLICY_DIPLOMATIC_MEETING');
delete from ModifierArguments where ModifierId like 'CITY_POLICY_DIPLOMATIC_MEETING_%'
	and not exists (select BuildingType from Buildings where BuildingType = 'BUILDING_CITY_POLICY_DIPLOMATIC_MEETING');

insert or replace into Building_ResourceCosts
	(BuildingType,							ResourceType,			StartProductionCost,		PerTurnMaintenanceCost)
values
	('BUILDING_CITY_POLICY_FREIGHT',		'RESOURCE_HORSES',		0,							2),
	('BUILDING_CITY_POLICY_FORGING_IRON',	'RESOURCE_IRON',		0,							2);
------【结束】------

-- Enable Projects
insert or replace into Projects
	(ProjectType, Name, ShortName, Description, Cost, PrereqCivic, PrereqTech, AdvisorType)
select
	EnableProjectType,
	'LOC_'||EnableProjectType||'_NAME',
	'LOC_'||EnableProjectType||'_SHORT_NAME',
	'LOC_'||EnableProjectType||'_DESCRIPTION',
	EnableCost,
	EnableCivicType,
	EnableTechType,
	'ADVISOR_GENERIC'
from CityPolicyMaster where CityPolicy != 'EMPTY';
-- Disable Projects
insert or replace into Projects
	(ProjectType, Name, ShortName, Description, Cost, PrereqCivic, PrereqTech, AdvisorType)
select
	DisableProjectType,
	'LOC_'||DisableProjectType||'_NAME',
	'LOC_'||DisableProjectType||'_SHORT_NAME',
	'LOC_'||DisableProjectType||'_DESCRIPTION',
	DisableCost,
	NULL,
	NULL,
	'ADVISOR_GENERIC'
from CityPolicyMaster where CityPolicy != 'EMPTY';

------【此处需要手动修改】------
update Projects set PrereqDistrict = 'DISTRICT_AQUEDUCT' where ProjectType = 'PROJECT_CITY_POLICY_ENABLE_REVISION_ALMANAC';
update Projects set PrereqDistrict = 'DISTRICT_DIPLOMATIC_QUARTER' where ProjectType = 'PROJECT_CITY_POLICY_ENABLE_DIPLOMATIC_MEETING';
update Projects set PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' where ProjectType = 'PROJECT_CITY_POLICY_ENABLE_FREIGHT';
update Projects set PrereqDistrict = 'DISTRICT_HOLY_SITE' where ProjectType = 'PROJECT_CITY_POLICY_ENABLE_THEOLOGICAL_SEMINAR';
update Projects set PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' where ProjectType = 'PROJECT_CITY_POLICY_ENABLE_FORGING_IRON';
------【结束】------

-- Enable
insert or replace into Project_BuildingCosts
	(ProjectType,			ConsumedBuildingType)
select
	EnableProjectType,		'BUILDING_CITY_POLICY_EMPTY'
from CityPolicyMaster where CityPolicy != 'EMPTY';
insert or replace into Projects_XP2
	(ProjectType,			RequiredBuilding,				CreateBuilding)
select
	EnableProjectType,		'BUILDING_CITY_POLICY_EMPTY',	BuildingType
from CityPolicyMaster where CityPolicy != 'EMPTY';

-- Disable
insert or replace into Projects_XP2
	(ProjectType,			RequiredBuilding,				CreateBuilding)
select
	DisableProjectType,		BuildingType,					'BUILDING_CITY_POLICY_EMPTY'
from CityPolicyMaster where CityPolicy != 'EMPTY';
insert or replace into Project_BuildingCosts
	(ProjectType,			ConsumedBuildingType)
select
	DisableProjectType,		BuildingType
from CityPolicyMaster where CityPolicy != 'EMPTY';

insert or replace into MutuallyExclusiveBuildings (Building, MutuallyExclusiveBuilding)
select a.BuildingType, b.BuildingType from CityPolicyMaster a, CityPolicyMaster b where a.BuildingType != b.BuildingType;
