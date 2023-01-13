-------------------------------------
--           Ethiopia DLC          --
-------------------------------------

--Ethiopia
--独石教堂基础信仰由+1变为+2, 拥有独石教堂的城市可以购买移民和工人

--insert or replace into Improvement_YieldChanges
--    (ImprovementType,                 YieldType,          YieldChange)
--values
--    ('IMPROVEMENT_ROCK_HEWN_CHURCH', 'YIELD_FAITH',       2);
insert or replace into Improvement_YieldChanges
	(ImprovementType,					YieldType,		YieldChange)
values
	('IMPROVEMENT_ROCK_HEWN_CHURCH',	'YIELD_FOOD',	1);
insert or replace into ImprovementModifiers
	(ImprovementType,				        ModifierId)
values
	('IMPROVEMENT_ROCK_HEWN_CHURCH',		'DUSHI_SETTLER_PURCHASE'),
	('IMPROVEMENT_ROCK_HEWN_CHURCH',		'DUSHI_BUILDER_PURCHASE');
insert or replace into Modifiers
	(ModifierId,				ModifierType,									SubjectStackLimit)
values
	('DUSHI_SETTLER_PURCHASE',	'MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',		1),
	('DUSHI_BUILDER_PURCHASE',	'MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',		1);

insert or replace into ModifierArguments
	(ModifierId,									Name,				Value)
values
	('DUSHI_BUILDER_PURCHASE',						'Tag',			'CLASS_BUILDER'),
	('DUSHI_SETTLER_PURCHASE',						'Tag',			'CLASS_SETTLER');
-- insert or replace into PolicyModifiers
--     (PolicyType,    ModifierId)
-- values
--     ('POLICY_GOV_AUTOCRACY',    'AUTOCRACY_DIP');

-- insert or replace into GovernmentModifiers
--     (GovernmentType,    ModifierId)
-- values
--     ('GOVERNMENT_AUTOCRACY',    'AUTOCRACY_DIP');

-- insert or replace into Modifiers
--     (ModifierId,        ModifierType,   SubjectRequirementSetId)
-- values
--     ('AUTOCRACY_DIP',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE', 'CITY_HAS_DIP_DISTRICT');

-- insert or replace into ModifierArguments
--     (ModifierId,            Name,       Value)
-- values
--     ('AUTOCRACY_DIP',       'Amount',   2);

insert or ignore into RequirementSetRequirements(RequirementSetId, RequirementId)values
    ('CITY_HAS_DIP_DISTRICT',   'REQUIRES_CITY_HAS_DISTRICT_DIPLOMATIC_QUARTER');
insert or ignore into RequirementSets(RequirementSetId, RequirementSetType)values
    ('CITY_HAS_DIP_DISTRICT',   'REQUIREMENTSET_TEST_ALL');

update Policies set Description = 'LOC_POLICY_CHARISMATIC_LEADER_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_CHARISMATIC_LEADER';
update Policies set Description = 'LOC_POLICY_DIPLOMATIC_LEAGUE_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_DIPLOMATIC_LEAGUE';
update Policies set Description = 'LOC_POLICY_GUNBOAT_DIPLOMACY_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_GUNBOAT_DIPLOMACY';

--外交区建筑提升政策卡收益
insert or replace into PolicyModifiers  
    (PolicyType,                    ModifierId)
values 
    ('POLICY_CHARISMATIC_LEADER',   'CHARISMATIC_LEADER_DIP_INFLUENCEPOINTS'),
    ('POLICY_CHARISMATIC_LEADER',   'CHARISMATIC_LEADER_CONSULATE_INFLUENCEPOINTS'),
    ('POLICY_CHARISMATIC_LEADER',   'CHARISMATIC_LEADER_CHANCERY_INFLUENCEPOINTS'),
    ('POLICY_DIPLOMATIC_LEAGUE',    'DIPLOMATIC_LEAGUE_DIP_INFLUENCEPOINTS'),
    ('POLICY_DIPLOMATIC_LEAGUE',    'DIPLOMATIC_LEAGUE_CONSULATE_INFLUENCEPOINTS'),
    ('POLICY_DIPLOMATIC_LEAGUE',    'DIPLOMATIC_LEAGUE_CHANCERY_INFLUENCEPOINTS'),
    ('POLICY_GUNBOAT_DIPLOMACY',    'GUNBOAT_DIPLOMACY_DIP_INFLUENCEPOINTS'),
    ('POLICY_GUNBOAT_DIPLOMACY',    'GUNBOAT_DIPLOMACY_CONSULATE_INFLUENCEPOINTS'),
    ('POLICY_GUNBOAT_DIPLOMACY',    'GUNBOAT_DIPLOMACY_CHANCERY_INFLUENCEPOINTS');

insert or replace into Modifiers    (ModifierId,        ModifierType,   SubjectRequirementSetId)
select ModifierId,  'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'CITY_HAS_DIP_DISTRICT' from PolicyModifiers 
where ModifierId = 'CHARISMATIC_LEADER_DIP_INFLUENCEPOINTS' or ModifierId = 'DIPLOMATIC_LEAGUE_DIP_INFLUENCEPOINTS' or ModifierId = 'GUNBOAT_DIPLOMACY_DIP_INFLUENCEPOINTS';
insert or replace into Modifiers    (ModifierId,        ModifierType,   SubjectRequirementSetId)
select ModifierId,  'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'BUILDING_IS_CONSULATE' from PolicyModifiers 
where ModifierId = 'CHARISMATIC_LEADER_CONSULATE_INFLUENCEPOINTS' or ModifierId = 'DIPLOMATIC_LEAGUE_CONSULATE_INFLUENCEPOINTS' or ModifierId = 'GUNBOAT_DIPLOMACY_CONSULATE_INFLUENCEPOINTS';
insert or replace into Modifiers    (ModifierId,        ModifierType,   SubjectRequirementSetId)
select ModifierId,  'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'BUILDING_IS_CHANCERY' from PolicyModifiers 
where ModifierId = 'CHARISMATIC_LEADER_CHANCERY_INFLUENCEPOINTS' or ModifierId = 'DIPLOMATIC_LEAGUE_CHANCERY_INFLUENCEPOINTS' or ModifierId = 'GUNBOAT_DIPLOMACY_CHANCERY_INFLUENCEPOINTS';

insert or replace into Modifiers
    (ModifierId,                                    ModifierType)
values
    ('CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP',  'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN');

insert or replace into ModifierArguments
    (ModifierId,                                        Name,           Value)
values
    ('CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP',      'Amount',       1),
    ('CHARISMATIC_LEADER_DIP_INFLUENCEPOINTS',          'ModifierId',   'CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP'),
    ('CHARISMATIC_LEADER_CONSULATE_INFLUENCEPOINTS',    'ModifierId',   'CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP'),
    ('CHARISMATIC_LEADER_CHANCERY_INFLUENCEPOINTS',     'ModifierId',   'CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP'),
    ('DIPLOMATIC_LEAGUE_DIP_INFLUENCEPOINTS',           'ModifierId',   'CONSULATE_INFLUENCEPOINTS'),
    ('DIPLOMATIC_LEAGUE_CONSULATE_INFLUENCEPOINTS',     'ModifierId',   'CONSULATE_INFLUENCEPOINTS'),
    ('DIPLOMATIC_LEAGUE_CHANCERY_INFLUENCEPOINTS',      'ModifierId',   'CONSULATE_INFLUENCEPOINTS'),
    ('GUNBOAT_DIPLOMACY_DIP_INFLUENCEPOINTS',           'ModifierId',   'CHANCERY_INFLUENCEPOINTS'),
    ('GUNBOAT_DIPLOMACY_CONSULATE_INFLUENCEPOINTS',     'ModifierId',   'CHANCERY_INFLUENCEPOINTS'),
    ('GUNBOAT_DIPLOMACY_CHANCERY_INFLUENCEPOINTS',      'ModifierId',   'CHANCERY_INFLUENCEPOINTS');

-- delete from DistrictModifiers where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER' and ModifierId = 'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN';
-- delete from DistrictModifiers where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER' and ModifierId = 'DIPLOMATIC_QUARTER_DELEGATION_FAVOR';
-- delete from DistrictModifiers where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER' and ModifierId = 'DIPLOMATIC_QUARTER_EMBASSY_FAVOR';
-----------------------------------------------------------------------
--领事馆/外交办间谍改动
insert or replace into BuildingModifiers
    (BuildingType,                          ModifierId)
values
    ('BUILDING_CHANCERY',                  'CHANCERY_OFFENSIVESPYTIME'),
    ('BUILDING_CHANCERY',                  'CHANCERY_SPYPRODUCTION'),
    ('BUILDING_CONSULATE',                 'CONSULATE_SPYPRODUCTION'),
    ('BUILDING_CONSULATE',                 'CONSULATE_SPY_UNLIMITED_PROMOTION');
insert or replace into Modifiers
    (ModifierId,                            ModifierType,                                                           SubjectRequirementSetId)
values
    ('CHANCERY_OFFENSIVESPYTIME',          'MODIFIER_PLAYER_UNITS_ADJUST_SPY_OFFENSIVE_OPERATION_TIME',            'PLAYER_HAS_BUILDING_CHANCERY_REQUIREMENTS'),
    ('CHANCERY_SPYPRODUCTION',             'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PRODUCTION',                        NULL),
    ('CONSULATE_SPYPRODUCTION',            'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',                         'PLAYER_HAS_BUILDING_CONSULATE_REQUIREMENTS'),
    ('CONSULATE_SPY_UNLIMITED_PROMOTION',  'MODIFIER_PLAYER_UNIT_GRANT_UNLIMITED_PROMOTION_CHOICES',               'PLAYER_HAS_BUILDING_CONSULATE_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                            Name,               Value)
values  
    ('CHANCERY_OFFENSIVESPYTIME',          'ReductionPercent', 25),
    ('CHANCERY_SPYPRODUCTION',             'UnitType',         'UNIT_SPY'),
    ('CHANCERY_SPYPRODUCTION',             'Amount',           50),
    ('CONSULATE_SPYPRODUCTION',            'UnitType',         'UNIT_SPY'),
    ('CONSULATE_SPYPRODUCTION',            'Amount',           50),
    ('CONSULATE_SPY_UNLIMITED_PROMOTION',  'UnitType',         'UNIT_SPY');

   
--外交办所有城市新手间谍升级探员
  
insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
values
    ('BUILDING_CHANCERY',           'CHANCERY_GRANT_SPY_FREE_PROMOTION');

insert or replace into Modifiers    
    (ModifierId,                                      ModifierType,                                            SubjectRequirementSetId, Permanent)
values
    ('CHANCERY_GRANT_SPY_FREE_PROMOTION',             'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',                NULL,                    0),
    ('CHANCERY_GRANT_SPY_FREE_PROMOTION_MODIFIER',    'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',  NULL,                    1);

insert or replace into ModifierArguments
    (ModifierId,                                           Name,                     Value)
values
    ('CHANCERY_GRANT_SPY_FREE_PROMOTION',                  'ModifierId',             'CHANCERY_GRANT_SPY_FREE_PROMOTION_MODIFIER'),
    ('CHANCERY_GRANT_SPY_FREE_PROMOTION_MODIFIER',         'AbilityType',            'ABILITY_CHANCERY_FERR_PROMOTION');

--间谍身上的外交办免费升级能力设置和tag说明

insert or replace into Types
    (Type,                                                      Kind)
values
    ('ABILITY_CHANCERY_FERR_PROMOTION',                         'KIND_ABILITY');

insert or replace into TypeTags
    (Type,                                                      Tag)
values
    ('ABILITY_CHANCERY_FERR_PROMOTION',                         'CLASS_SPY');

insert or replace into UnitAbilities (UnitAbilityType, Name, Description, Inactive) 
values
    ('ABILITY_CHANCERY_FERR_PROMOTION',
    'LOC_ABILITY_CHANCERY_FERR_PROMOTION_NAME',
    'LOC_ABILITY_CHANCERY_FERR_PROMOTION_DESCRIPTION',
    1);

insert or replace into UnitAbilityModifiers
    (UnitAbilityType,                                       ModifierId)
values
    ('ABILITY_CHANCERY_FERR_PROMOTION',                     'HETAIROI_FREE_PROMOTION');

--外交办额外间谍容量，本城赠送1个1级间谍
insert or replace into BuildingModifiers
    (BuildingType,                              ModifierId)
values
    ('BUILDING_CHANCERY',                       'CHANCERY_SPY_CAPACITY'),
    ('BUILDING_CHANCERY',                       'CHANCERY_ADD_SPY_WITH_PROMOTION');
insert or replace into Modifiers
    (ModifierId,                            ModifierType,                                         OwnerRequirementSetId,                              SubjectRequirementSetId)
values
    ('CHANCERY_SPY_CAPACITY',              'MODIFIER_PLAYER_GRANT_SPY',                           'PLAYER_HAS_BUILDING_CHANCERY_REQUIREMENTS',        NULL),
--  ('CHANCERY_ADD_SPY_WITH_PROMOTION',    'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',             'PLAYER_HAS_BUILDING_CHANCERY_REQUIREMENTS',        NULL),
    ('CHANCERY_ADD_SPY_WITH_PROMOTION',    'MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_WITH_MODIFIER', NULL,                                               NULL);

update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'CHANCERY_SPY_CAPACITY';
update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'CHANCERY_ADD_SPY_WITH_PROMOTION';
insert or replace into ModifierArguments
    (ModifierId,                        Name,                       Value)
values
    ('CHANCERY_SPY_CAPACITY',           'Amount',                   1),
    ('CHANCERY_ADD_SPY_WITH_PROMOTION', 'UnitPromotionClassType',   'PROMOTION_CLASS_SPY'),
    ('CHANCERY_ADD_SPY_WITH_PROMOTION', 'ModifierId',               'HETAIROI_FREE_PROMOTION'),
    ('CHANCERY_ADD_SPY_WITH_PROMOTION', 'UnitType',                 'UNIT_SPY'),
    ('CHANCERY_ADD_SPY_WITH_PROMOTION', 'Amount',                   1);

-----------------------------------------------------------------------
--外交区地基间谍容量

insert into DistrictModifiers
    (DistrictType,                      ModifierId)
values
    -- Diplomatic Quarter
    -- ('DISTRICT_DIPLOMATIC_QUARTER',     'DIPLOMATIC_QUARTER_DUPLICATE_FIRST_INFLUENCE');
    ('DISTRICT_DIPLOMATIC_QUARTER',       'DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY'); -- Moved to tier-1 building.

update Modifiers set RunOnce = 1, Permanent = 1, SubjectRequirementSetId = NULL where ModifierId = 'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN';

-- Diplomacy Quarter Buildings
insert or replace into BuildingModifiers
    (BuildingType,                          ModifierId)
values
    ('BUILDING_CHANCERY',                   'CHANCERY_ADD_VISIBILITY'),
    -- ('BUILDING_CONSULATE',                  'MODIFIER_MAJOR_PLAYER_TRADE_ROUTE_BY_CITY_STATE_BONUS_TYPE_MODIFIER'),
    ('BUILDING_CONSULATE',                  'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN'),
    ('BUILDING_CONSULATE',                  'CONSULATE_LEVY_DISCOUNT'),
    ('BUILDING_CHANCERY',                   'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN');
    -- ('BUILDING_CHANCERY',                   'WISSELBANKEN_ALLIANCEPOINTS');
    -- ('BUILDING_CONSULATE',                  'CONSULATE_LEVY_UNITUPGRADEDISCOUNT');
    -- ('BUILDING_CONSULATE',                   'DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY'),
    -- ('BUILDING_CONSULATE',                   'DIPLOMATIC_QUARTER_DELEGATION_FAVOR'),
    -- ('BUILDING_CONSULATE',                   'DIPLOMATIC_QUARTER_EMBASSY_FAVOR');

insert or replace into Modifiers    
    (ModifierId,                            ModifierType)
values
    ('CHANCERY_ADD_VISIBILITY',             'MODIFIER_PLAYER_ADD_DIPLO_VISIBILITY'),
    ('CONSULATE_LEVY_DISCOUNT',             'MODIFIER_PLAYER_ADJUST_LEVY_DISCOUNT_PERCENT'),
    ('CONSULATE_LEVY_UNITUPGRADEDISCOUNT',  'MODIFIER_PLAYER_ADJUST_LEVIED_UNIT_UPGRADE_DISCOUNT_PERCENT');

insert or replace into ModifierArguments
    (ModifierId,                            Name,               Value)
values
    ('CHANCERY_ADD_VISIBILITY',             'Amount',           1),
    ('CHANCERY_ADD_VISIBILITY',             'Source',           'SOURCE_CHANCERY'),
	('CHANCERY_ADD_VISIBILITY',             'SourceType',       'DIPLO_SOURCE_ALL_NAMES'),
    ('CONSULATE_LEVY_DISCOUNT',             'Percent',          20),
    ('CONSULATE_LEVY_UNITUPGRADEDISCOUNT',  'Amount',           20);

-- insert or replace into District_CitizenYieldChanges
-- 	(DistrictType,			YieldType,			YieldChange)
-- values
-- 	('DISTRICT_DIPLOMATIC_QUARTER','YIELD_SCIENCE',	2),
-- 	('DISTRICT_DIPLOMATIC_QUARTER','YIELD_CULTURE',	2);

-- insert or replace into Building_CitizenYieldChanges
-- 	(BuildingType,							YieldType,			YieldChange)
-- values
-- 	--diplomatic quarter
-- 	('BUILDING_CONSULATE',					'YIELD_CULTURE',	1),
-- 	('BUILDING_CONSULATE',					'YIELD_SCIENCE',	1),
-- 	('BUILDING_CONSULATE',					'YIELD_GOLD',		-1),
-- 	('BUILDING_CHANCERY',					'YIELD_CULTURE',	2),
-- 	('BUILDING_CHANCERY',					'YIELD_SCIENCE',	2),
-- 	('BUILDING_CHANCERY',					'YIELD_GOLD',		-2);

insert or replace into DiplomaticVisibilitySources
    (VisibilitySourceType,  Description,                ActionDescription,                  GossipString,                   PrereqTech)
values
    ('SOURCE_CHANCERY',     'LOC_VIZSOURCE_CHANCERY',   'LOC_VIZSOURCE_ACTION_CHANCERY',    'LOC_GOSSIP_SOURCE_CHANCERY',   'TECH_MATHEMATICS');


-- Influence Point Policy
-- update Policies set Description = 'LOC_POLICY_CHARISMATIC_LEADER_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_CHARISMATIC_LEADER'; 
-- update Policies set Description = 'LOC_POLICY_DIPLOMATIC_LEAGUE_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_DIPLOMATIC_LEAGUE';
-- update Policies set Description = 'LOC_POLICY_GUNBOAT_DIPLOMACY_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_GUNBOAT_DIPLOMACY';

-- 打草谷
-- insert or replace into TypeTags
--     (Type,                                  Tag)
-- values
--     ('UNIT_ETHIOPIAN_OROMO_CAVALRY',        'CLASS_DACAOGU');
 
-- insert or replace into BuildingModifiers 
--     (BuildingType,                              ModifierId)
-- values 
--     ('BUILDING_CITY_POLICY_DACAOGU',            'CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER');

-- insert or replace into Modifiers
--     (ModifierId,                                                                ModifierType)
-- values
--     ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER',    'MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT');

-- insert or replace into ModifierArguments
--     (ModifierId,                                                                Name,           Value)
-- values
--     ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER',    'Amount',       '-1'),
--     ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER',    'UnitType',     'UNIT_ETHIOPIAN_OROMO_CAVALRY');

----------------------------------------------------------------------------------------------------
-- 新外交区三级建筑
insert or ignore into Types
	(Type,								                                Kind)
values
	('TRAIT_CIVILIZATION_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',	'KIND_TRAIT');

insert or ignore into Traits
    (TraitType,Name,Description)
values
    ('TRAIT_CIVILIZATION_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',
    'LOC_TRAIT_CIVILIZATION_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_NAME',
    'LOC_TRAIT_CIVILIZATION_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_DESCRIPTION');

insert or ignore into CivilizationTraits
    (CivilizationType,          TraitType)
values
    ('CIVILIZATION_AMERICA',    'TRAIT_CIVILIZATION_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS');

insert or replace into BuildingModifiers
	(BuildingType,					                ModifierId)
values
    ('BUILDING_HD_REGIONAL_COUNCIL_CENTER',         'HD_RCC_DIPLOMATIC_SLOT'),
    ('BUILDING_HD_REGIONAL_COUNCIL_CENTER',         'HD_RCC_INFLUENCE_BONUS'),
    ('BUILDING_HD_REGIONAL_COUNCIL_CENTER',         'HD_RCC_DIPLOMATIC_VICTOR_POINTS'),
    ('BUILDING_HD_REGIONAL_COUNCIL_CENTER',         'HD_RCC_TOKENS'),
    ('BUILDING_HD_REGIONAL_COUNCIL_CENTER',         'HD_RCC_ALLIANCE_POINTS'),
    ('BUILDING_HD_REGIONAL_COUNCIL_CENTER',         'HD_RCC_DIPLOMATIC_VISIBLE'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_RCC_DIPLOMATIC_SLOT'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_INFLUENCE_BONUS'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_DIPLOMATIC_VICTOR_POINTS'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_RCC_ALLIANCE_POINTS'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_RCC_DIPLOMATIC_VISIBLE'),

    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_CS_ADD_SCIENCE'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_CS_ADD_CULTURE'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_CS_ADD_GOLD'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_CS_ADD_FAITH'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_CS_ADD_UNIT_PRODUCTION'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_CS_ADD_BUILDING_PRODUCTION'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_CS_ADD_DISTRICT_PRODUCTION'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WPH_CS_ADD_WONDER_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,					        ModifierType,			                                        SubjectRequirementSetId)
values
    ('HD_RCC_DIPLOMATIC_SLOT',              'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',     NULL),
    ('HD_RCC_INFLUENCE_BONUS',              'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS',                        NULL),
    ('HD_RCC_DIPLOMATIC_VICTOR_POINTS',     'MODIFIER_PLAYER_ADJUST_DIPLOMATIC_VICTORY_POINTS',             NULL),
    ('HD_RCC_TOKENS',                       'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',                        NULL),
    ('HD_RCC_ALLIANCE_POINTS',              'MODIFIER_PLAYER_ADJUST_ALLIANCE_POINTS',                       NULL),
    ('HD_RCC_DIPLOMATIC_VISIBLE',           'MODIFIER_PLAYER_ADD_DIPLO_VISIBILITY',                         NULL),

    ('HD_WPH_INFLUENCE_BONUS',              'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS',                        NULL),
    ('HD_WPH_DIPLOMATIC_VICTOR_POINTS',     'MODIFIER_PLAYER_ADJUST_DIPLOMATIC_VICTORY_POINTS',             NULL),

    ('HD_WPH_CS_ADD_SCIENCE',               'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',            'HD_SCIENTIFIC_SUZERAIN_3_REQUIREMENTS'),
    ('HD_WPH_CS_ADD_CULTURE',               'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',            'HD_CULTURAL_SUZERAIN_3_REQUIREMENTS'),
    ('HD_WPH_CS_ADD_GOLD',                  'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',            'HD_TRADE_SUZERAIN_3_REQUIREMENTS'),
    ('HD_WPH_CS_ADD_FAITH',                 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',            'HD_RELIGIOUS_SUZERAIN_3_REQUIREMENTS'),
    ('HD_WPH_CS_ADD_UNIT_PRODUCTION',       'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PRODUCTION_MODIFIER',       'HD_MILITARISTIC_SUZERAIN_3_REQUIREMENTS'),
    ('HD_WPH_CS_ADD_BUILDING_PRODUCTION',   'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION_MODIFIER',   'HD_INDUSTRIAL_SUZERAIN_3_REQUIREMENTS'),
    ('HD_WPH_CS_ADD_DISTRICT_PRODUCTION',   'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION_MODIFIER',   'HD_INDUSTRIAL_SUZERAIN_3_REQUIREMENTS'),
    ('HD_WPH_CS_ADD_WONDER_PRODUCTION',     'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_PRODUCTION',              'HD_INDUSTRIAL_SUZERAIN_3_REQUIREMENTS');

update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId in ('HD_RCC_DIPLOMATIC_VICTOR_POINTS','HD_RCC_TOKENS','HD_WPH_DIPLOMATIC_VICTOR_POINTS');

insert or replace into ModifierArguments
	(ModifierId,							Name,		            Value)
values
    ('HD_RCC_DIPLOMATIC_SLOT',              'GovernmentSlotType',   'SLOT_DIPLOMATIC'),
    ('HD_RCC_INFLUENCE_BONUS',              'BonusType',            'GOVERNMENTBONUS_ENVOYS'),
    ('HD_RCC_INFLUENCE_BONUS',              'Amount',               25),
    ('HD_RCC_DIPLOMATIC_VICTOR_POINTS',     'Amount',               1),
    ('HD_RCC_DIPLOMATIC_VICTOR_POINTS',     'Tooltip',              'LOC_DVP_TOOLTIP_OTHER_SOURCES'),
    ('HD_RCC_TOKENS',                       'Amount',               2),
    ('HD_RCC_ALLIANCE_POINTS',              'Amount',               8),
	('HD_RCC_DIPLOMATIC_VISIBLE',           'Amount',               1),
    ('HD_RCC_DIPLOMATIC_VISIBLE',           'Source',               'SOURCE_GOV_SPIES'),
   	('HD_RCC_DIPLOMATIC_VISIBLE',           'SourceType',           'DIPLO_SOURCE_ALL_NAMES'),

    ('HD_WPH_INFLUENCE_BONUS',              'BonusType',            'GOVERNMENTBONUS_ENVOYS'),
    ('HD_WPH_INFLUENCE_BONUS',              'Amount',               50),
    ('HD_WPH_DIPLOMATIC_VICTOR_POINTS',     'Amount',               3),
    ('HD_WPH_DIPLOMATIC_VICTOR_POINTS',     'Tooltip',              'LOC_DVP_TOOLTIP_OTHER_SOURCES'),

    ('HD_WPH_CS_ADD_SCIENCE',               'Amount',               10),
    ('HD_WPH_CS_ADD_SCIENCE',               'YieldType',            'YIELD_SCIENCE'),
    ('HD_WPH_CS_ADD_CULTURE',               'Amount',               10),
    ('HD_WPH_CS_ADD_CULTURE',               'YieldType',            'YIELD_CULTURE'),
    ('HD_WPH_CS_ADD_GOLD',                  'Amount',               10),
    ('HD_WPH_CS_ADD_GOLD',                  'YieldType',            'YIELD_GOLD'),
    ('HD_WPH_CS_ADD_FAITH',                 'Amount',               10),
    ('HD_WPH_CS_ADD_FAITH',                 'YieldType',            'YIELD_FAITH'),
    ('HD_WPH_CS_ADD_UNIT_PRODUCTION',       'Amount',               10),
    ('HD_WPH_CS_ADD_BUILDING_PRODUCTION',   'Amount',               10),
    ('HD_WPH_CS_ADD_DISTRICT_PRODUCTION',   'Amount',               10),
    ('HD_WPH_CS_ADD_WONDER_PRODUCTION',     'Amount',               10);

insert or replace into DiplomaticVisibilitySources
    (VisibilitySourceType,		Description,                ActionDescription,                  GossipString,					PrereqTech)
values
    ('SOURCE_GOV_SPIES',		'LOC_VIZSOURCE_GOV_SPIES',	'LOC_VIZSOURCE_ACTION_GOV_SPIES',   'LOC_GOSSIP_SOURCE_GOV_SPIES',	'TECH_MATHEMATICS');

insert or ignore into RequirementSets
	(RequirementSetId, 							            RequirementSetType)
values
    ('HD_SCIENTIFIC_SUZERAIN_3_REQUIREMENTS',               'REQUIREMENTSET_TEST_ALL'),
    ('HD_CULTURAL_SUZERAIN_3_REQUIREMENTS',                 'REQUIREMENTSET_TEST_ALL'),
    ('HD_TRADE_SUZERAIN_3_REQUIREMENTS',                    'REQUIREMENTSET_TEST_ALL'),
    ('HD_RELIGIOUS_SUZERAIN_3_REQUIREMENTS',                'REQUIREMENTSET_TEST_ALL'),
    ('HD_MILITARISTIC_SUZERAIN_3_REQUIREMENTS',             'REQUIREMENTSET_TEST_ALL'),
    ('HD_INDUSTRIAL_SUZERAIN_3_REQUIREMENTS',               'REQUIREMENTSET_TEST_ALL'),
    
    ('PLAYER_HAS_BUILDING_RCC_OR_WPH_REQUIREMENTS',         'REQUIREMENTSET_TEST_ANY'),
    ('CITY_HAS_BUILDING_RCC_OR_WPH_REQUIREMENTS',           'REQUIREMENTSET_TEST_ANY'),

	('ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC',		        'REQUIREMENTSET_TEST_ALL'),
    ('ALLIES_AT_WAR_WITH_TARGET_REQUIREMENTS_RCC',	        'REQUIREMENTSET_TEST_ALL'),
    ('RELIGIOUS_COMBAT_ENEMY_NOT_IN_ALLIED_RELIGION_RCC',	'REQUIREMENTSET_TEST_ALL'),
    ('ALLIANCE_CITY_HAS_TRADE_ROUTE_WITH_ALLY_RCC',	        'REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSetRequirements
	(RequirementSetId, 							            RequirementId)
values
    ('HD_SCIENTIFIC_SUZERAIN_3_REQUIREMENTS',               'HD_SCIENTIFIC_SUZERAIN_3_LEADER'),
    ('HD_CULTURAL_SUZERAIN_3_REQUIREMENTS',                 'HD_CULTURAL_SUZERAIN_3_LEADER'),
    ('HD_TRADE_SUZERAIN_3_REQUIREMENTS',                    'HD_TRADE_SUZERAIN_3_LEADER'),
    ('HD_RELIGIOUS_SUZERAIN_3_REQUIREMENTS',                'HD_RELIGIOUS_SUZERAIN_3_LEADER'),
    ('HD_MILITARISTIC_SUZERAIN_3_REQUIREMENTS',             'HD_MILITARISTIC_SUZERAIN_3_LEADER'),
    ('HD_INDUSTRIAL_SUZERAIN_3_REQUIREMENTS',               'HD_INDUSTRIAL_SUZERAIN_3_LEADER'),

    ('PLAYER_HAS_BUILDING_RCC_OR_WPH_REQUIREMENTS',         'REQUIRES_PLAYER_HAS_BUILDING_HD_REGIONAL_COUNCIL_CENTER'),
    ('PLAYER_HAS_BUILDING_RCC_OR_WPH_REQUIREMENTS',         'REQUIRES_PLAYER_HAS_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS'),
    ('CITY_HAS_BUILDING_RCC_OR_WPH_REQUIREMENTS',           'REQUIRES_CITY_HAS_BUILDING_HD_REGIONAL_COUNCIL_CENTER'),
    ('CITY_HAS_BUILDING_RCC_OR_WPH_REQUIREMENTS',           'REQUIRES_CITY_HAS_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS'),

	('ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC',		        'REQUIRES_TRADE_ROUTE_BETWEEN_ALLIES'),
	('ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC',		        'REQUIRES_PLAYER_HAS_BUILDING_RCC_OR_WPH'),
    ('ALLIES_AT_WAR_WITH_TARGET_REQUIREMENTS_RCC',	        'REQUIRES_ALLIES_AT_WAR_WITH_TARGET'),
    ('ALLIES_AT_WAR_WITH_TARGET_REQUIREMENTS_RCC',	        'REQUIRES_COMBAT_UNIT_VS_UNIT'),
    ('ALLIES_AT_WAR_WITH_TARGET_REQUIREMENTS_RCC',	        'REQUIRES_PLAYER_HAS_BUILDING_RCC_OR_WPH'),
    ('RELIGIOUS_COMBAT_ENEMY_NOT_IN_ALLIED_RELIGION_RCC',	'REQUIRES_RELIGIOUS_ENEMY_NOT_ALLIED_RELIGION'),
    ('RELIGIOUS_COMBAT_ENEMY_NOT_IN_ALLIED_RELIGION_RCC',	'REQUIRES_PLAYER_HAS_BUILDING_RCC_OR_WPH'),
    ('ALLIANCE_CITY_HAS_TRADE_ROUTE_WITH_ALLY_RCC',     	'REQUIRES_ALLIANCE_CITY_HAS_TRADE_ROUTE_WITH_ALLY'),
    ('ALLIANCE_CITY_HAS_TRADE_ROUTE_WITH_ALLY_RCC',     	'REQUIRES_PLAYER_HAS_BUILDING_RCC_OR_WPH');


insert or ignore into Requirements
	(RequirementId,								RequirementType)
values
    ('HD_SCIENTIFIC_SUZERAIN_3_LEADER',         'REQUIREMENT_PLAYER_IS_SUZERAIN_X_TYPE'),
    ('HD_CULTURAL_SUZERAIN_3_LEADER',           'REQUIREMENT_PLAYER_IS_SUZERAIN_X_TYPE'),
    ('HD_TRADE_SUZERAIN_3_LEADER',              'REQUIREMENT_PLAYER_IS_SUZERAIN_X_TYPE'),
    ('HD_RELIGIOUS_SUZERAIN_3_LEADER',          'REQUIREMENT_PLAYER_IS_SUZERAIN_X_TYPE'),
    ('HD_MILITARISTIC_SUZERAIN_3_LEADER',       'REQUIREMENT_PLAYER_IS_SUZERAIN_X_TYPE'),
    ('HD_INDUSTRIAL_SUZERAIN_3_LEADER',         'REQUIREMENT_PLAYER_IS_SUZERAIN_X_TYPE'),
    ('REQUIRES_PLAYER_HAS_BUILDING_RCC_OR_WPH',	'REQUIREMENT_REQUIREMENTSET_IS_MET');


insert or ignore into RequirementArguments
	(RequirementId,								Name,				Value)
values
    ('HD_SCIENTIFIC_SUZERAIN_3_LEADER',         'Amount',           3),
    ('HD_CULTURAL_SUZERAIN_3_LEADER',           'Amount',           3),
    ('HD_TRADE_SUZERAIN_3_LEADER',              'Amount',           3),
    ('HD_RELIGIOUS_SUZERAIN_3_LEADER',          'Amount',           3),
    ('HD_MILITARISTIC_SUZERAIN_3_LEADER',       'Amount',           3),
    ('HD_INDUSTRIAL_SUZERAIN_3_LEADER',         'Amount',           3),
    ('HD_SCIENTIFIC_SUZERAIN_3_LEADER',         'LeaderType',       'LEADER_MINOR_CIV_SCIENTIFIC'),
    ('HD_CULTURAL_SUZERAIN_3_LEADER',           'LeaderType',       'LEADER_MINOR_CIV_CULTURAL'),
    ('HD_TRADE_SUZERAIN_3_LEADER',              'LeaderType',       'LEADER_MINOR_CIV_TRADE'),
    ('HD_RELIGIOUS_SUZERAIN_3_LEADER',          'LeaderType',       'LEADER_MINOR_CIV_RELIGIOUS'),
    ('HD_MILITARISTIC_SUZERAIN_3_LEADER',       'LeaderType',       'LEADER_MINOR_CIV_MILITARISTIC'),
    ('HD_INDUSTRIAL_SUZERAIN_3_LEADER',         'LeaderType',       'LEADER_MINOR_CIV_INDUSTRIAL'),
    ('REQUIRES_PLAYER_HAS_BUILDING_RCC_OR_WPH',	'RequirementSetId',	'PLAYER_HAS_BUILDING_RCC_OR_WPH_REQUIREMENTS');

-----------------------------------------------------------------------
--外交办/区域议会中心/世界议会总部的间谍进攻/防守全局加成
insert or replace into BuildingModifiers 
    (BuildingType,                                  ModifierId) 
values
    ('BUILDING_CHANCERY',                           'CHANCERY_OFFENSE'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WORLD_PARLIAMENT_HEADQUARTERS_OFFENSE'),
    ('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',   'HD_WORLD_PARLIAMENT_HEADQUARTERS_DEFENSE'),
    ('BUILDING_HD_REGIONAL_COUNCIL_CENTER',         'HD_REGIONAL_COUNCIL_CENTER_DEFENSE');

insert or replace into Modifiers    
    (ModifierId,                                    ModifierType,                       SubjectRequirementSetId,    Permanent)
values
    ('CHANCERY_OFFENSE',                            'MODIFIER_PLAYER_ADJUST_SPY_BONUS',                     NULL,   0),
    ('HD_WORLD_PARLIAMENT_HEADQUARTERS_OFFENSE',    'MODIFIER_PLAYER_ADJUST_SPY_BONUS',                     NULL,   0),
    ('HD_WORLD_PARLIAMENT_HEADQUARTERS_DEFENSE',    'MODIFIER_PLAYER_ADJUST_SPY_BONUS',                     NULL,   0),
    ('HD_REGIONAL_COUNCIL_CENTER_DEFENSE',          'MODIFIER_PLAYER_ADJUST_SPY_BONUS',                     NULL,   0);
insert or replace into ModifierArguments
    (ModifierId,                                        Name,               Value)
values
    ('CHANCERY_OFFENSE',                                'Offense',          1),
    ('CHANCERY_OFFENSE',                                'Amount',           1),
    ('HD_WORLD_PARLIAMENT_HEADQUARTERS_OFFENSE',        'Offense',          1),
    ('HD_WORLD_PARLIAMENT_HEADQUARTERS_OFFENSE',        'Amount',           3),
    ('HD_WORLD_PARLIAMENT_HEADQUARTERS_DEFENSE',        'Offense',          0),
    ('HD_WORLD_PARLIAMENT_HEADQUARTERS_DEFENSE',        'Amount',           3), 
    ('HD_REGIONAL_COUNCIL_CENTER_DEFENSE',              'Offense',          0),
    ('HD_REGIONAL_COUNCIL_CENTER_DEFENSE',              'Amount',           3);




-----------------------------------------------------------------------

insert or replace into AllianceEffects
    (LevelRequirement,      AllianceType,             ModifierID)
values
    -- 经济同盟
    (1,                     'ALLIANCE_ECONOMIC',      'ALLIANCE_ADD_GOLD_TO_ORIGIN_TRADE_ROUTE_RCC'),
    (1,                     'ALLIANCE_ECONOMIC',      'ALLIANCE_ADD_GOLD_TO_DESTINATION_TRADE_ROUTE_RCC'),
    -- 军事同盟
    (1,                     'ALLIANCE_MILITARY',      'ALLIANCE_ADD_PRODUCTION_TO_ORIGIN_TRADE_ROUTE_RCC'),
    (1,                     'ALLIANCE_MILITARY',      'ALLIANCE_ADD_PRODUCTION_TO_DESTINATION_TRADE_ROUTE_RCC'),
    -- 宗教同盟
    (1,                     'ALLIANCE_RELIGIOUS',     'ALLIANCE_ADD_FAITH_TO_ORIGIN_TRADE_ROUTE_RCC'),
    (1,                     'ALLIANCE_RELIGIOUS',     'ALLIANCE_ADD_FAITH_TO_DESTINATION_TRADE_ROUTE_RCC'),
    -- 文化同盟
    (1,                     'ALLIANCE_CULTURAL',      'ALLIANCE_ADD_CULTURE_TO_ORIGIN_TRADE_ROUTE_RCC'),
    (1,                     'ALLIANCE_CULTURAL',      'ALLIANCE_ADD_CULTURE_TO_DESTINATION_TRADE_ROUTE_RCC'),
    -- 科技同盟
    (1,                     'ALLIANCE_RESEARCH',      'ALLIANCE_ADD_SCIENCE_TO_ORIGIN_TRADE_ROUTE_RCC'),
    (1,                     'ALLIANCE_RESEARCH',      'ALLIANCE_ADD_SCIENCE_TO_DESTINATION_TRADE_ROUTE_RCC');

insert or replace into Modifiers
    (ModifierId,	                                            ModifierType,                                           SubjectRequirementSetId)
values
    ('ALLIANCE_ADD_GOLD_TO_ORIGIN_TRADE_ROUTE_RCC',             'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC'),
    ('ALLIANCE_ADD_GOLD_TO_DESTINATION_TRADE_ROUTE_RCC',        'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC'),

    ('ALLIANCE_ADD_PRODUCTION_TO_ORIGIN_TRADE_ROUTE_RCC',       'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC'),
    ('ALLIANCE_ADD_PRODUCTION_TO_DESTINATION_TRADE_ROUTE_RCC',  'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC'),

    ('ALLIANCE_ADD_FAITH_TO_ORIGIN_TRADE_ROUTE_RCC',            'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC'),
    ('ALLIANCE_ADD_FAITH_TO_DESTINATION_TRADE_ROUTE_RCC',       'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC'),

    ('ALLIANCE_ADD_CULTURE_TO_ORIGIN_TRADE_ROUTE_RCC',          'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC'),
    ('ALLIANCE_ADD_CULTURE_TO_DESTINATION_TRADE_ROUTE_RCC',     'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC'),

    ('ALLIANCE_ADD_SCIENCE_TO_ORIGIN_TRADE_ROUTE_RCC',          'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC'),
    ('ALLIANCE_ADD_SCIENCE_TO_DESTINATION_TRADE_ROUTE_RCC',     'MODIFIER_ALLIANCE_TRADE_ROUTE_ADJUST_YIELD',           'ROUTE_BETWEEN_ALLIES_REQUIREMENTS_RCC');


insert or replace into ModifierArguments
    (ModifierId,	                                        Name,	                Value)
values
    ('ALLIANCE_ADD_GOLD_TO_ORIGIN_TRADE_ROUTE_RCC',         'Amount',               4),
    ('ALLIANCE_ADD_GOLD_TO_ORIGIN_TRADE_ROUTE_RCC',         'YieldType',            'YIELD_GOLD'),
    ('ALLIANCE_ADD_GOLD_TO_ORIGIN_TRADE_ROUTE_RCC',         'AffectOrigin',         1),
    ('ALLIANCE_ADD_GOLD_TO_DESTINATION_TRADE_ROUTE_RCC',    'Amount',               2),
    ('ALLIANCE_ADD_GOLD_TO_DESTINATION_TRADE_ROUTE_RCC',    'YieldType',            'YIELD_GOLD'),
    ('ALLIANCE_ADD_GOLD_TO_DESTINATION_TRADE_ROUTE_RCC',    'AffectDestination',    1),

    ('ALLIANCE_ADD_PRODUCTION_TO_ORIGIN_TRADE_ROUTE_RCC',           'Amount',               2),
    ('ALLIANCE_ADD_PRODUCTION_TO_ORIGIN_TRADE_ROUTE_RCC',         	'YieldType',            'YIELD_PRODUCTION'),
    ('ALLIANCE_ADD_PRODUCTION_TO_ORIGIN_TRADE_ROUTE_RCC',         	'AffectOrigin',         1),
    ('ALLIANCE_ADD_PRODUCTION_TO_DESTINATION_TRADE_ROUTE_RCC',    	'Amount',               1),
    ('ALLIANCE_ADD_PRODUCTION_TO_DESTINATION_TRADE_ROUTE_RCC',    	'YieldType',            'YIELD_PRODUCTION'),
    ('ALLIANCE_ADD_PRODUCTION_TO_DESTINATION_TRADE_ROUTE_RCC',    	'AffectDestination',    1),

    ('ALLIANCE_ADD_FAITH_TO_ORIGIN_TRADE_ROUTE_RCC',        'Amount',               2),
    ('ALLIANCE_ADD_FAITH_TO_ORIGIN_TRADE_ROUTE_RCC',        'YieldType',            'YIELD_FAITH'),
    ('ALLIANCE_ADD_FAITH_TO_ORIGIN_TRADE_ROUTE_RCC',        'AffectOrigin',         1),
    ('ALLIANCE_ADD_FAITH_TO_DESTINATION_TRADE_ROUTE_RCC',   'Amount',               1),
    ('ALLIANCE_ADD_FAITH_TO_DESTINATION_TRADE_ROUTE_RCC',   'YieldType',            'YIELD_FAITH'),
    ('ALLIANCE_ADD_FAITH_TO_DESTINATION_TRADE_ROUTE_RCC',   'AffectDestination',    1),

    ('ALLIANCE_ADD_CULTURE_TO_ORIGIN_TRADE_ROUTE_RCC',      'Amount',               2),
    ('ALLIANCE_ADD_CULTURE_TO_ORIGIN_TRADE_ROUTE_RCC',      'YieldType',            'YIELD_CULTURE'),
    ('ALLIANCE_ADD_CULTURE_TO_ORIGIN_TRADE_ROUTE_RCC',      'AffectOrigin',         1),
    ('ALLIANCE_ADD_CULTURE_TO_DESTINATION_TRADE_ROUTE_RCC', 'Amount',               1),
    ('ALLIANCE_ADD_CULTURE_TO_DESTINATION_TRADE_ROUTE_RCC', 'YieldType',            'YIELD_CULTURE'),
    ('ALLIANCE_ADD_CULTURE_TO_DESTINATION_TRADE_ROUTE_RCC', 'AffectDestination',    1),

    ('ALLIANCE_ADD_SCIENCE_TO_ORIGIN_TRADE_ROUTE_RCC',      'Amount',               2),
    ('ALLIANCE_ADD_SCIENCE_TO_ORIGIN_TRADE_ROUTE_RCC',      'YieldType',            'YIELD_SCIENCE'),
    ('ALLIANCE_ADD_SCIENCE_TO_ORIGIN_TRADE_ROUTE_RCC',      'AffectOrigin',         1),
    ('ALLIANCE_ADD_SCIENCE_TO_DESTINATION_TRADE_ROUTE_RCC', 'Amount',               1),
    ('ALLIANCE_ADD_SCIENCE_TO_DESTINATION_TRADE_ROUTE_RCC', 'YieldType',            'YIELD_SCIENCE'),
    ('ALLIANCE_ADD_SCIENCE_TO_DESTINATION_TRADE_ROUTE_RCC', 'AffectDestination',    1);

-- 适配独裁
/*
insert or replace into GovernmentModifiers
    (GovernmentType,            ModifierId)
values
    ('GOVERNMENT_AUTOCRACY',    'REGIONAL_COUNCIL_CENTER_TIER3');
insert or replace into PolicyModifiers
    (PolicyType,                ModifierId)
values
    ('POLICY_GOV_AUTOCRACY',    'REGIONAL_COUNCIL_CENTER_TIER3');
insert or replace into Modifiers
    (ModifierId,       					ModifierType,                                           SubjectRequirementSetId)
values
    ('REGIONAL_COUNCIL_CENTER_TIER3',  'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE', 'CITY_HAS_BUILDING_HD_REGIONAL_COUNCIL_CENTER_REQUIREMENTS');
insert or replace into ModifierArguments
    (ModifierId,           					Name,       Value)
values
    ('REGIONAL_COUNCIL_CENTER_TIER3',      'Amount',   2);
*/

----------------------------------------------------------------------------------------------------
-- Ethiopia citystate bonus for diplomacy buildings
/*
insert or replace into TraitModifiers (TraitType, ModifierId)
select TraitType, ModifierId||'_CONSULATE_ATTACH' from CityStateInfluenceBonus_HD where Level = 'LARGE';
insert or replace into TraitModifiers (TraitType, ModifierId)
select TraitType, ModifierId||'_CHANCERY_ATTACH' from CityStateInfluenceBonus_HD where Level = 'LARGEST';

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CONSULATE_ATTACH', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_'||Level||'_INFLUENCE'
from CityStateInfluenceBonus_HD where Level = 'LARGE';
insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CHANCERY_ATTACH', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_'||Level||'_INFLUENCE'
from CityStateInfluenceBonus_HD where Level = 'LARGEST';

insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE_ATTACH', 'ModifierId', ModifierId||'_CONSULATE'
from CityStateInfluenceBonus_HD where Level = 'LARGE';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY_ATTACH', 'ModifierId', ModifierId||'_CHANCERY'
from CityStateInfluenceBonus_HD where Level = 'LARGEST';

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CONSULATE', ModifierType, 'BUILDING_IS_CONSULATE'
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 0;
insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CONSULATE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'BUILDING_IS_CONSULATE'
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 1;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CHANCERY', ModifierType, 'BUILDING_IS_CHANCERY'
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 0;
insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CHANCERY', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'BUILDING_IS_CHANCERY'
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 1;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE', 'Amount', Amount
from CityStateInfluenceBonus_HD where Level = 'LARGE';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE', 'YieldType', YieldType
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 1;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE', 'BuildingType', 'BUILDING_CONSULATE'
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 1;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE', 'CityStatesOnly', 1
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 1;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY', 'Amount', Amount
from CityStateInfluenceBonus_HD where Level = 'LARGEST';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY', 'YieldType', YieldType
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 1;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY', 'BuildingType', 'BUILDING_CHANCERY'
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 1;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY', 'CityStatesOnly', 1
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 1;
*/
-----------------------------------------------------------------------
--美国间谍容量
insert or replace into TraitModifiers 
    (TraitType,                               ModifierId)          
values           
    ('TRAIT_CIVILIZATION_FOUNDING_FATHERS',   'HD_FOUNDING_FATHERS_BUILDING_CONSULATE_SPY_CAPACITY'),                    
    ('TRAIT_CIVILIZATION_FOUNDING_FATHERS',   'HD_FOUNDING_FATHERS_BUILDING_CHANCERY_SPY_CAPACITY'),                        
    ('TRAIT_CIVILIZATION_FOUNDING_FATHERS',   'HD_FOUNDING_FATHERS_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_SPY_CAPACITY'),
    ('TRAIT_CIVILIZATION_FOUNDING_FATHERS',   'HD_FOUNDING_FATHERS_DISTRICT_DIPLOMATIC_QUARTER_SPY_CAPACITY');

insert or replace into Modifiers
    (ModifierId,                                                                   ModifierType,                       OwnerRequirementSetId)
values
    ('HD_FOUNDING_FATHERS_BUILDING_CONSULATE_SPY_CAPACITY',                         'MODIFIER_PLAYER_GRANT_SPY',      'PLAYER_HAS_BUILDING_CONSULATE_REQUIREMENTS'),
    ('HD_FOUNDING_FATHERS_BUILDING_CHANCERY_SPY_CAPACITY',                          'MODIFIER_PLAYER_GRANT_SPY',      'PLAYER_HAS_BUILDING_CHANCERY_REQUIREMENTS'),             
    ('HD_FOUNDING_FATHERS_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_SPY_CAPACITY',  'MODIFIER_PLAYER_GRANT_SPY',      'PLAYER_HAS_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_REQUIREMENTS'), 
    ('HD_FOUNDING_FATHERS_DISTRICT_DIPLOMATIC_QUARTER_SPY_CAPACITY',                'MODIFIER_PLAYER_GRANT_SPY',      'PLAYER_HAS_DISTRICT_DIPLOMATIC_QUARTER_REQUIREMENTS');

update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'HD_FOUNDING_FATHERS_BUILDING_CONSULATE_SPY_CAPACITY';
update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'HD_FOUNDING_FATHERS_BUILDING_CHANCERY_SPY_CAPACITY';
update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'HD_FOUNDING_FATHERS_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_SPY_CAPACITY';
update Modifiers set RunOnce = 1, Permanent = 1 where ModifierId = 'HD_FOUNDING_FATHERS_DISTRICT_DIPLOMATIC_QUARTER_SPY_CAPACITY';
insert or replace into ModifierArguments
    (ModifierId,                                                                    Name,            Value)
values
    ('HD_FOUNDING_FATHERS_BUILDING_CONSULATE_SPY_CAPACITY',                         'Amount',        1),
    ('HD_FOUNDING_FATHERS_BUILDING_CHANCERY_SPY_CAPACITY',                          'Amount',        1),
    ('HD_FOUNDING_FATHERS_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_SPY_CAPACITY',  'Amount',        1),
    ('HD_FOUNDING_FATHERS_DISTRICT_DIPLOMATIC_QUARTER_SPY_CAPACITY',                'Amount',        1);
