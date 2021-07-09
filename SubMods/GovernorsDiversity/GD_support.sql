-------------------------------------
--  Governors Adjustments Supports --
-------------------------------------

-- The New Global Parameters.
insert or replace into GlobalParameters (Name, Value) values
    ('LIANG_WONDER_GREAT_ENGINEER_PERCENTAGE', 10),
    ('MAGNUS_GENERAL_SERVICES_OFFICE_EFFECT_DISTANCE', 6);

------------------------------------------------------------------------------------------------------------------------------------------
-- Modifiers

-- need add to Types
insert or replace into Types
    (Type,                                                      Kind)
values
    ('MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER','KIND_MODIFIER'),
    ('MODIFIER_SINGLE_CITY_ENABLE_UNIT_FAITH_PURCHASE',         'KIND_MODIFIER'),
    ('MODIFIER_SINGLE_CITY_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER','KIND_MODIFIER'),
    ('MODIFIER_REYNA_ADJUST_DISTRICTS_YIELD_CHANGE',            'KIND_MODIFIER'),
    ('MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION',     'KIND_MODIFIER'),
    ('MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',          'KIND_MODIFIER');

insert into DynamicModifiers
    (ModifierType,                                              CollectionType,                     EffectType)
values 
    ('MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER','COLLECTION_PLAYER_DISTRICTS','EFFECT_ADJUST_DISTRICT_TOURISM_ADJACENCY_YIELD_MOFIFIER'),
    ('MODIFIER_SINGLE_CITY_ENABLE_UNIT_FAITH_PURCHASE',         'COLLECTION_OWNER',                 'EFFECT_ENABLE_UNIT_FAITH_PURCHASE'),
    ('MODIFIER_SINGLE_CITY_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER','COLLECTION_OWNER',              'EFFECT_ADJUST_ALL_BUILDING_PRODUCTION_MODIFIER'),
    ('MODIFIER_REYNA_ADJUST_DISTRICTS_YIELD_CHANGE',            'COLLECTION_CITY_DISTRICTS',        'EFFECT_ADJUST_DISTRICT_YIELD_CHANGE'),
    ('MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION',     'COLLECTION_OWNER',                 'EFFECT_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
    ('MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',          'COLLECTION_OWNER',                 'EFFECT_ADJUST_UNIT_PURCHASE_COST');

------------------------------------------------------------------------------------------------------------------------------------------
insert or replace into TypeTags(Type,Tag)
select UnitType, 'CLASS_MILITARY' from Units where FormationClass != 'FORMATION_CLASS_CIVILIAN' AND FormationClass != 'FORMATION_CLASS_SUPPORT';

insert or replace into Tags
    (Tag,               Vocabulary)
values
    ('CLASS_MILITARY',  'ABILITY_CLASS');

-- Unit Abilities
insert or replace into Types
    (Type,                                                      Kind)
values
    ('ABILITY_AMANI_FERR_PROMOTION',                            'KIND_ABILITY'),
    ('ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT',            'KIND_ABILITY'),
    ('ABILITY_BISHOP_EXTRA_MOVEMENT',                           'KIND_ABILITY'),
    ('ABILITY_BISHOP_TRAINED_UNIT_STRENGTH',                    'KIND_ABILITY'),
    ('ABILITY_BISHOP_TRAINED_UNIT_EXP',                         'KIND_ABILITY'),
    ('ABILITY_VICTOR_COMMANDER_STRENGTH',                       'KIND_ABILITY'),
    ('ABILITY_VICTOR_TRAINED_UNIT_EXP',                         'KIND_ABILITY'),
    ('ABILITY_VICTOR_TRAINED_UNIT_STRENGTH',                    'KIND_ABILITY');

insert or replace into TypeTags
    (Type,                                                              Tag)
values
    ('ABILITY_AMANI_FERR_PROMOTION',                                    'CLASS_SPY'),
    ('ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT',                    'CLASS_BUILDER'),
    ('ABILITY_BISHOP_EXTRA_MOVEMENT',                                   'CLASS_WARRIOR_MONK'),
    ('ABILITY_BISHOP_EXTRA_MOVEMENT',                                   'CLASS_RELIGIOUS_ALL'),
    ('ABILITY_BISHOP_TRAINED_UNIT_EXP',                                 'CLASS_WARRIOR_MONK'),
    ('ABILITY_BISHOP_TRAINED_UNIT_STRENGTH',                            'CLASS_WARRIOR_MONK'),
    ('ABILITY_VICTOR_COMMANDER_STRENGTH',                               'CLASS_MILITARY'),
    ('ABILITY_VICTOR_TRAINED_UNIT_EXP',                                 'CLASS_MILITARY'),
    ('ABILITY_VICTOR_TRAINED_UNIT_STRENGTH',                            'CLASS_MILITARY');

insert or replace into UnitAbilities (UnitAbilityType, Name, Description, Inactive) values
    ('ABILITY_AMANI_FERR_PROMOTION',
    'LOC_ABILITY_AMANI_FERR_PROMOTION_NAME',
    'LOC_ABILITY_AMANI_FERR_PROMOTION_DESCRIPTION',
    1),
    ('ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT',
    'LOC_ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT_NAME',
    'LOC_ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT_DESCRIPTION',
    1), 
    ('ABILITY_BISHOP_EXTRA_MOVEMENT',
    'LOC_ABILITY_BISHOP_EXTRA_MOVEMENT_NAME',
    'LOC_ABILITY_BISHOP_EXTRA_MOVEMENT_DESCRIPTION',
    1), 
    ('ABILITY_BISHOP_TRAINED_UNIT_STRENGTH',
    'LOC_ABILITY_BISHOP_TRAINED_UNIT_STRENGTH_NAME',
    'LOC_ABILITY_BISHOP_TRAINED_UNIT_STRENGTH_DESCRIPTION',
    1), 
    ('ABILITY_BISHOP_TRAINED_UNIT_EXP',
    'LOC_ABILITY_BISHOP_TRAINED_UNIT_EXP_NAME',
    'LOC_ABILITY_BISHOP_TRAINED_UNIT_EXP_DESCRIPTION',
    1),
    ('ABILITY_VICTOR_COMMANDER_STRENGTH',
    'LOC_ABILITY_VICTOR_COMMANDER_STRENGTH_NAME',
    'LOC_ABILITY_VICTOR_COMMANDER_STRENGTH_DESCRIPTION',
    1),
    ('ABILITY_VICTOR_TRAINED_UNIT_EXP',
    'LOC_ABILITY_VICTOR_TRAINED_UNIT_EXP_NAME',
    'LOC_ABILITY_VICTOR_TRAINED_UNIT_EXP_DESCRIPTION',
    1),
    ('ABILITY_VICTOR_TRAINED_UNIT_STRENGTH',
    'LOC_ABILITY_VICTOR_TRAINED_UNIT_STRENGTH_NAME',
    'LOC_ABILITY_VICTOR_TRAINED_UNIT_STRENGTH_DESCRIPTION',
    1);

insert or replace into UnitAbilityModifiers
    (UnitAbilityType,                                       ModifierId)
values
    -- 
    ('ABILITY_BYPASS_WALLS_PROMOTION_CLASS',                'BYPASS_WALLS_WARRIOR_MONK'),
    ('ABILITY_ENABLE_WALL_ATTACK_PROMOTION_CLASS',          'ENABLE_WALL_ATTACK_WARRIOR_MONK'),
    -- 
    ('ABILITY_AMANI_FERR_PROMOTION',                        'HETAIROI_FREE_PROMOTION'),
    ('ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT',        'LIANG_EXTRA_MOVEMENT'),
    ('ABILITY_BISHOP_EXTRA_MOVEMENT',                       'BISHOP_EXTRA_MOVEMENT'),
    ('ABILITY_BISHOP_TRAINED_UNIT_STRENGTH',                'BISHOP_TRAINED_UNIT_STRENGTH'),
    ('ABILITY_BISHOP_TRAINED_UNIT_EXP',                     'BISHOP_TRAINED_UNIT_EXP'),
    ('ABILITY_VICTOR_TRAINED_UNIT_EXP',                     'VICTOR_TRAINED_UNIT_EXP'),
    ('ABILITY_VICTOR_COMMANDER_STRENGTH',                   'VICTOR_COMMANDER_STRENGTH_BUFF'),
    ('ABILITY_VICTOR_TRAINED_UNIT_STRENGTH',                'VICTOR_TRAINED_UNIT_STRENGTH');

insert or replace into Modifiers
    (ModifierId,                                    ModifierType,                           Permanent)
values
    ('BYPASS_WALLS_WARRIOR_MONK',                   'MODIFIER_PLAYER_UNIT_ADJUST_BYPASS_WALLS_PROMOTION_CLASS',1),
    ('ENABLE_WALL_ATTACK_WARRIOR_MONK',             'MODIFIER_PLAYER_UNIT_ADJUST_ENABLE_WALL_ATTACK_PROMOTION_CLASS',1),
    -- 
    ('LIANG_EXTRA_MOVEMENT',                        'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',     1),
    ('BISHOP_EXTRA_MOVEMENT',                       'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',     1),
    ('BISHOP_TRAINED_UNIT_STRENGTH',                'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     1),
    ('BISHOP_TRAINED_UNIT_EXP',                     'MODIFIER_PLAYER_UNIT_ADJUST_UNIT_EXPERIENCE_MODIFIER',1),
    ('VICTOR_TRAINED_UNIT_EXP',                     'MODIFIER_PLAYER_UNIT_ADJUST_UNIT_EXPERIENCE_MODIFIER',1),
    ('VICTOR_COMMANDER_STRENGTH_BUFF',              'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     0),
    ('VICTOR_TRAINED_UNIT_STRENGTH',                'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     1);

insert or replace into ModifierArguments
    (ModifierId,                                    Name,       Value)
values
    ('BYPASS_WALLS_WARRIOR_MONK',                   'PromotionClass','PROMOTION_CLASS_MONK'),
    ('ENABLE_WALL_ATTACK_WARRIOR_MONK',             'PromotionClass','PROMOTION_CLASS_MONK'),
    -- 
    ('LIANG_EXTRA_MOVEMENT',                        'Amount',   1),
    ('BISHOP_EXTRA_MOVEMENT',                       'Amount',   1),
    ('BISHOP_TRAINED_UNIT_STRENGTH',                'Amount',   5),
    ('BISHOP_TRAINED_UNIT_EXP',                     'Amount',   100),
    ('VICTOR_TRAINED_UNIT_EXP',                     'Amount',   25),
    ('VICTOR_COMMANDER_STRENGTH_BUFF',              'Amount',   5),
    ('VICTOR_TRAINED_UNIT_STRENGTH',                'Amount',   2);

insert or replace into ModifierStrings
    (ModifierId,                                        Context,    Text)
values
    ('BISHOP_TRAINED_UNIT_STRENGTH',                    'Preview',  '+{1_Amount} {LOC_BISHOP_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
    -- ('BISHOP_TRAINED_UNIT_EXP',                         'Preview',  '+{1_Amount} {LOC_BISHOP_TRAINED_UNIT_EXP_PREVIEW_TEXT}'),
    -- ('VICTOR_TRAINED_UNIT_EXP',                         'Preview',  '+{1_Amount} {LOC_VICTOR_TRAINED_UNIT_EXP_PREVIEW_TEXT}'),
    ('VICTOR_COMMANDER_STRENGTH_BUFF',                  'Preview',  '+{1_Amount} {LOC_VICTOR_COMMANDER_STRENGTH_BUFF_PREVIEW_TEXT}'),
    ('VICTOR_TRAINED_UNIT_STRENGTH',                    'Preview',  '+{1_Amount} {LOC_VICTOR_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}');

------------------------------------------------------------------------------------------------------------------------------------------
-- Buildings
-- GeneralServicesOffice 总务厅, cost 250, unlocked by civil sevices, all yields (except faith) by 1.
insert or replace into Types
    (Type,                                  Kind)
values
    -- Buildings
    ('BUILDING_DUMMY_MAGNUS',               'KIND_BUILDING'),
    ('BUILDING_DUMMY_NO_MAGNUS',            'KIND_BUILDING'),
    ('BUILDING_GENERAL_SERVICE',            'KIND_BUILDING');

insert or replace into Buildings 
    (BuildingType,                      Name,                                   Cost,   Description,                                InternalOnly) 
values
    ('BUILDING_DUMMY_MAGNUS',           'LOC_BUILDING_DUMMY_MAGNUS_NAME',       1,      'LOC_BUILDING_DUMMY_MAGNUS_DESCRIPTION',    1),
    ('BUILDING_DUMMY_NO_MAGNUS',        'LOC_BUILDING_DUMMY_NO_MAGNUS_NAME',    1,      'LOC_BUILDING_DUMMY_NO_MAGNUS_DESCRIPTION', 1);

insert or replace into Buildings 
    (BuildingType,                      Name,                                   Cost,   Description,                                        
    PrereqTech,             PrereqCivic,                PrereqDistrict) 
values
    ('BUILDING_GENERAL_SERVICE',        'LOC_BUILDING_GENERAL_SERVICE_NAME',    250,    'LOC_BUILDING_GENERAL_SERVICE_DESCRIPTION',             
    NULL,                   'CIVIC_CIVIL_SERVICE',      'DISTRICT_CITY_CENTER');

insert or replace into Building_YieldChanges 
    (BuildingType,                      YieldType,              YieldChange)
values
    ('BUILDING_GENERAL_SERVICE',        'YIELD_FOOD',           1),
    ('BUILDING_GENERAL_SERVICE',        'YIELD_PRODUCTION',     1),
    ('BUILDING_GENERAL_SERVICE',        'YIELD_SCIENCE',        1),
    ('BUILDING_GENERAL_SERVICE',        'YIELD_CULTURE',        1),
    ('BUILDING_GENERAL_SERVICE',        'YIELD_FAITH',          1),
    ('BUILDING_GENERAL_SERVICE',        'YIELD_GOLD',           1);

-- If Magnus with promotion general service officier located, cities within 9 tiles can receive regional yield (2 of all yields except faith).
insert or replace into BuildingPrereqs
    (Building,                      PrereqBuilding)
values
    ('BUILDING_GENERAL_SERVICE',    'BUILDING_DUMMY_MAGNUS');

insert or replace into BuildingModifiers 
    (BuildingType,                  ModifierId)
values 
    ('BUILDING_GENERAL_SERVICE',    'GENERAL_SERVICE_REGIONAL_FOOD'),
    ('BUILDING_GENERAL_SERVICE',    'GENERAL_SERVICE_REGIONAL_PRODUCTION'),
    ('BUILDING_GENERAL_SERVICE',    'GENERAL_SERVICE_REGIONAL_SCIENCE'),
    ('BUILDING_GENERAL_SERVICE',    'GENERAL_SERVICE_REGIONAL_CULTURE'),
    ('BUILDING_GENERAL_SERVICE',    'GENERAL_SERVICE_REGIONAL_FAITH'),
    ('BUILDING_GENERAL_SERVICE',    'GENERAL_SERVICE_REGIONAL_GOLD');

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                               SubjectRequirementSetId)
values
    ('GENERAL_SERVICE_REGIONAL_FOOD',       'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'CITY_HAS_MAGNUS_WITHIN_RANGE'),
    ('GENERAL_SERVICE_REGIONAL_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'CITY_HAS_MAGNUS_WITHIN_RANGE'),
    ('GENERAL_SERVICE_REGIONAL_SCIENCE',    'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'CITY_HAS_MAGNUS_WITHIN_RANGE'),
    ('GENERAL_SERVICE_REGIONAL_CULTURE',    'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'CITY_HAS_MAGNUS_WITHIN_RANGE'),
    ('GENERAL_SERVICE_REGIONAL_FAITH',      'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'CITY_HAS_MAGNUS_WITHIN_RANGE'),
    ('GENERAL_SERVICE_REGIONAL_GOLD',       'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'CITY_HAS_MAGNUS_WITHIN_RANGE');

-- insert or replace into Modifiers
--  (ModifierId,                                                    ModifierType,
--  OwnerRequirementSetId,                                          SubjectRequirementSetId)
-- values
--  ('GENERAL_SERVICE_REGIONAL_FOOD',                               'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',
--  'CITY_HAS_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',   'HAS_GENERAL_SERVICE_WITHIN_9_TILES'),
--  ('GENERAL_SERVICE_REGIONAL_PRODUCTION',                         'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',
--  'CITY_HAS_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',   'HAS_GENERAL_SERVICE_WITHIN_9_TILES'),
--  ('GENERAL_SERVICE_REGIONAL_SCIENCE',                            'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',
--  'CITY_HAS_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',   'HAS_GENERAL_SERVICE_WITHIN_9_TILES'),
--  ('GENERAL_SERVICE_REGIONAL_CULTURE',                            'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',
--  'CITY_HAS_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',   'HAS_GENERAL_SERVICE_WITHIN_9_TILES'),
--  ('GENERAL_SERVICE_REGIONAL_GOLD',                               'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',
--  'CITY_HAS_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',   'HAS_GENERAL_SERVICE_WITHIN_9_TILES');

insert or replace into Modifiers
    (ModifierId,                                        ModifierType,                               SubjectStackLimit)
values
    ('GENERAL_SERVICE_REGIONAL_FOOD_MODIFIER',          'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1),
    ('GENERAL_SERVICE_REGIONAL_PRODUCTION_MODIFIER',    'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1),
    ('GENERAL_SERVICE_REGIONAL_SCIENCE_MODIFIER',       'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1),
    ('GENERAL_SERVICE_REGIONAL_CULTURE_MODIFIER',       'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1),
    ('GENERAL_SERVICE_REGIONAL_FAITH_MODIFIER',         'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1),
    ('GENERAL_SERVICE_REGIONAL_GOLD_MODIFIER',          'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1);

insert or replace into ModifierArguments
    (ModifierId,                                        Name,           Value)
values
    ('GENERAL_SERVICE_REGIONAL_FOOD',                   'ModifierId',   'GENERAL_SERVICE_REGIONAL_FOOD_MODIFIER'),
    ('GENERAL_SERVICE_REGIONAL_FOOD_MODIFIER',          'YieldType',    'YIELD_FOOD'),
    ('GENERAL_SERVICE_REGIONAL_FOOD_MODIFIER',          'Amount',       3),
    ('GENERAL_SERVICE_REGIONAL_PRODUCTION',             'ModifierId',   'GENERAL_SERVICE_REGIONAL_PRODUCTION_MODIFIER'),
    ('GENERAL_SERVICE_REGIONAL_PRODUCTION_MODIFIER',    'YieldType',    'YIELD_PRODUCTION'),
    ('GENERAL_SERVICE_REGIONAL_PRODUCTION_MODIFIER',    'Amount',       3),
    ('GENERAL_SERVICE_REGIONAL_SCIENCE',                'ModifierId',   'GENERAL_SERVICE_REGIONAL_SCIENCE_MODIFIER'),
    ('GENERAL_SERVICE_REGIONAL_SCIENCE_MODIFIER',       'YieldType',    'YIELD_SCIENCE'),
    ('GENERAL_SERVICE_REGIONAL_SCIENCE_MODIFIER',       'Amount',       3),
    ('GENERAL_SERVICE_REGIONAL_CULTURE',                'ModifierId',   'GENERAL_SERVICE_REGIONAL_CULTURE_MODIFIER'),
    ('GENERAL_SERVICE_REGIONAL_CULTURE_MODIFIER',       'YieldType',    'YIELD_CULTURE'),
    ('GENERAL_SERVICE_REGIONAL_CULTURE_MODIFIER',       'Amount',       3),
    ('GENERAL_SERVICE_REGIONAL_FAITH',                  'ModifierId',   'GENERAL_SERVICE_REGIONAL_FAITH_MODIFIER'),
    ('GENERAL_SERVICE_REGIONAL_FAITH_MODIFIER',         'YieldType',    'YIELD_FAITH'),
    ('GENERAL_SERVICE_REGIONAL_FAITH_MODIFIER',         'Amount',       3),
    ('GENERAL_SERVICE_REGIONAL_GOLD',                   'ModifierId',   'GENERAL_SERVICE_REGIONAL_GOLD_MODIFIER'),
    ('GENERAL_SERVICE_REGIONAL_GOLD_MODIFIER',          'YieldType',    'YIELD_GOLD'),
    ('GENERAL_SERVICE_REGIONAL_GOLD_MODIFIER',          'Amount',       3);

------------------------------------------------------------------------------------------------------------------------------------------
-- Requirements

-- PLOT IS IMPROVED
insert or replace into Requirements (RequirementId, RequirementType,    Inverse)    values
    ('REQUIRES_PLOT_IS_IMPROVED',   'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT', 0);
insert or replace into RequirementSetRequirements (RequirementSetId,    RequirementId)  values
    ('PLOT_IS_IMPROVED',    'REQUIRES_PLOT_IS_IMPROVED');
insert or replace into RequirementSets (RequirementSetId,   RequirementSetType) values
    ('PLOT_IS_IMPROVED',    'REQUIREMENTSET_TEST_ALL');

-- City Park
insert or replace into RequirementSets 
    (RequirementSetId,                                              RequirementSetType) 
values
    ('REQUIRE_PLOT_ADJACENT_TO_OWNER',                              'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION_AND_ADJACENT',   'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                              RequirementId)
values
    ('REQUIRE_PLOT_ADJACENT_TO_OWNER',                              'ADJACENT_TO_OWNER'),
    ('CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION_AND_ADJACENT',   'ADJACENT_TO_OWNER'),
    ('CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION_AND_ADJACENT',   'REQUIRES_CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION');

insert or replace into Requirements (RequirementId, RequirementType)
    select 'HD_REQUIRES_UNIT_IS_' || UnitType , 'REQUIREMENT_UNIT_TYPE_MATCHES' from Units;
insert or replace into RequirementArguments (RequirementId, Name, Value)    
    select 'HD_REQUIRES_UNIT_IS_' || UnitType , 'UnitType', UnitType from Units;
-- Buildings
insert or replace into RequirementArguments (RequirementId, Name, Value)
    select 'HD_REQUIRES_CITY_HAS_' || BuildingType, 'BuildingType', BuildingType from Buildings;
insert or replace into Requirements (RequirementId, RequirementType)
    select 'HD_REQUIRES_CITY_HAS_' || BuildingType, 'REQUIREMENT_CITY_HAS_BUILDING' from Buildings;

--UNIT_IS_RELIGIOUS_ALL
insert or replace into RequirementSetRequirements 
    (RequirementSetId,              RequirementId)  
values
    ('UNIT_IS_RELIGOUS_ALL',        'HD_REQUIRES_UNIT_IS_UNIT_MISSIONARY'),
    ('UNIT_IS_RELIGOUS_ALL',        'HD_REQUIRES_UNIT_IS_UNIT_APOSTLE'),
    ('UNIT_IS_RELIGOUS_ALL',        'HD_REQUIRES_UNIT_IS_UNIT_INQUISITOR'),
    ('UNIT_IS_RELIGOUS_ALL',        'HD_REQUIRES_UNIT_IS_UNIT_GURU'),
    ('UNIT_IS_RELIGOUS_ALL_AND_MONK','HD_REQUIRES_UNIT_IS_UNIT_MISSIONARY'),
    ('UNIT_IS_RELIGOUS_ALL_AND_MONK','HD_REQUIRES_UNIT_IS_UNIT_APOSTLE'),
    ('UNIT_IS_RELIGOUS_ALL_AND_MONK','HD_REQUIRES_UNIT_IS_UNIT_INQUISITOR'),
    ('UNIT_IS_RELIGOUS_ALL_AND_MONK','HD_REQUIRES_UNIT_IS_UNIT_GURU'),
    ('UNIT_IS_RELIGOUS_ALL_AND_MONK','HD_REQUIRES_UNIT_IS_UNIT_WARRIOR_MONK');

insert or replace into RequirementSets (RequirementSetId,   RequirementSetType) values
    ('UNIT_IS_RELIGOUS_ALL_AND_MONK','REQUIREMENTSET_TEST_ANY'),
    ('UNIT_IS_RELIGOUS_ALL',        'REQUIREMENTSET_TEST_ANY');

insert or replace into Requirements
    (RequirementId,                                 RequirementType)
values
    ('REQUIRES_WITHIN_NINE_TILES_FROM_OWNER',       'REQUIREMENT_PLOT_ADJACENT_TO_OWNER'),
    ('REQUIRES_WITHIN_FOUR_TILES_FROM_OWNER',       'REQUIREMENT_PLOT_ADJACENT_TO_OWNER');

insert or replace into RequirementArguments
    (RequirementId,                                 Name,               Value)
values
    ('REQUIRES_WITHIN_NINE_TILES_FROM_OWNER',       'MinDistance',      0),
    ('REQUIRES_WITHIN_NINE_TILES_FROM_OWNER',       'MaxDistance',      9),
    ('REQUIRES_WITHIN_FOUR_TILES_FROM_OWNER',       'MinDistance',      0),
    ('REQUIRES_WITHIN_FOUR_TILES_FROM_OWNER',       'MaxDistance',      4);

insert or replace into RequirementSets
    (RequirementSetId,                                          RequirementSetType)
values
    ('UNIT_WITHIN_NINE_TILES_REQUIREMENTS',                     'REQUIREMENTSET_TEST_ALL'),
    ('DISTRICT_IS_HOLY_SITE_WITHIN_FOUR_TILES_REQUIREMENTS',    'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                          RequirementId)
values
    ('UNIT_WITHIN_NINE_TILES_REQUIREMENTS',                     'REQUIRES_WITHIN_NINE_TILES_FROM_OWNER'),
    ('DISTRICT_IS_HOLY_SITE_WITHIN_FOUR_TILES_REQUIREMENTS',    'REQUIRES_PLOT_HAS_HOLY_SITE'),
    ('DISTRICT_IS_HOLY_SITE_WITHIN_FOUR_TILES_REQUIREMENTS',    'REQUIRES_WITHIN_FOUR_TILES_FROM_OWNER');

insert or replace into RequirementSets
    (RequirementSetId,                                              RequirementSetType)
values
    -- ('CITY_HAS_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',   'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_MAGNUS_WITHIN_RANGE',                                'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                              RequirementId)
values
    -- ('CITY_HAS_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',   'REQUIRES_CITY_HAS_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST'),
    ('CITY_HAS_MAGNUS_WITHIN_RANGE',                                'HD_REQUIRES_CITY_HAS_BUILDING_DUMMY_MAGNUS');

------------------------------------------------------------------------------------------------------------------------------------------
-- City Yields
-- Create 50 sets of modifiers through the loop below.
WITH RECURSIVE
  Indices(i) AS (SELECT 1 UNION ALL SELECT (i + 1) FROM Indices LIMIT 50)
INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent)
SELECT "YIELD_CREATOR_FOOD_" || i, 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FOOD_" || i || "_N", 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_PRODUCTION_" || i, 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_PRODUCTION_" || i || "_N", 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_GOLD_" || i, 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_GOLD_" || i || "_N", 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FAITH_" || i, 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FAITH_" || i || "_N", 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_SCIENCE_" || i, 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_SCIENCE_" || i || "_N", 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_CULTURE_" || i, 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_CULTURE_" || i || "_N", 'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE', 1, 1 FROM Indices;

WITH RECURSIVE
  Indices(i) AS (SELECT 1 UNION ALL SELECT (i + 1) FROM Indices LIMIT 50)
INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value)
SELECT "YIELD_CREATOR_FOOD_" || i, 'YieldType', 'YIELD_FOOD' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FOOD_" || i, 'Amount', i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FOOD_" || i || "_N", 'YieldType', 'YIELD_FOOD' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FOOD_" || i || "_N", 'Amount', -i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_PRODUCTION_" || i, 'YieldType', 'YIELD_PRODUCTION' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_PRODUCTION_" || i, 'Amount', i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_PRODUCTION_" || i || "_N", 'YieldType', 'YIELD_PRODUCTION' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_PRODUCTION_" || i || "_N", 'Amount', -i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_GOLD_" || i, 'YieldType', 'YIELD_GOLD' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_GOLD_" || i, 'Amount', i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_GOLD_" || i || "_N", 'YieldType', 'YIELD_GOLD' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_GOLD_" || i || "_N", 'Amount', -i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FAITH_" || i, 'YieldType', 'YIELD_FAITH' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FAITH_" || i, 'Amount', i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FAITH_" || i || "_N", 'YieldType', 'YIELD_FAITH' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_FAITH_" || i || "_N", 'Amount', -i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_SCIENCE_" || i, 'YieldType', 'YIELD_SCIENCE' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_SCIENCE_" || i, 'Amount', i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_SCIENCE_" || i || "_N", 'YieldType', 'YIELD_SCIENCE' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_SCIENCE_" || i || "_N", 'Amount', -i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_CULTURE_" || i, 'YieldType', 'YIELD_CULTURE' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_CULTURE_" || i, 'Amount', i FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_CULTURE_" || i || "_N", 'YieldType', 'YIELD_CULTURE' FROM Indices
UNION ALL
SELECT "YIELD_CREATOR_CULTURE_" || i || "_N", 'Amount', -i FROM Indices;
