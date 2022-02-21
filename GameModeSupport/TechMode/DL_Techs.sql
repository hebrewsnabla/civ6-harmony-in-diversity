-------------------------------------
--     Technologies Adjustment     --
-------------------------------------

-- -- v4
-- update Technologies set Cost = 12000 where Cost = 4500;
-- -- 
-- update Technologies set Cost = 10000 where Cost = 4000;
-- update TechnologyRandomCosts set Cost = 9000 where Cost = 3700;
-- update TechnologyRandomCosts set Cost = 8000 where Cost = 3600;
-- -- 
-- update Technologies set Cost = 7200 where Cost = 3100;
-- update Technologies set Cost = 6600 where Cost = 3000;
-- -- 
-- update Technologies set Cost = 5400 where Cost = 2500;
-- update Technologies set Cost = 4200 where Cost = 2400;
-- -- 
-- update Technologies set Cost = 3300 where Cost = 1900;
-- update Technologies set Cost = 2700 where Cost = 1800;
-- -- 
-- update Technologies set Cost = 2100 where Cost = 1400;
-- update Technologies set Cost = 1800 where Cost = 1300;
-- -- 
-- update Technologies set Cost = 1500 where Cost = 950;
-- update Technologies set Cost = 1000 where Cost = 850;
-- -- 
-- update Technologies set Cost = 600 where Cost = 550;
-- update Technologies set Cost = 480 where Cost = 450;
-- -- 
-- update Technologies set Cost = 300 where Cost = 280;
-- update Technologies set Cost = 180 where Cost = 160;
-- -- Ancient
-- update Technologies set Cost = 80 where Cost = 80;
-- update Technologies set Cost = 50 where Cost = 50;


-------------------------------------
-- AI adjustments
-------------------------------------
-- For high difficulty AI.
insert or replace into TraitModifiers (TraitType,   ModifierId) values
    ('TRAIT_LEADER_MAJOR_CIV',                      'HD_HIGH_DIFFICULTY_FOOD_SCALING');

insert or replace into Modifiers (ModifierId,               ModifierType,                                   OwnerRequirementSetId) values
    ('HD_HIGH_DIFFICULTY_FOOD_SCALING',                     'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'PLAYER_IS_HIGH_DIFFICULTY_AI');

insert or replace into ModifierArguments (ModifierId,       Name,           Value) values
    ('HD_HIGH_DIFFICULTY_FOOD_SCALING',                     'YieldType',    'YIELD_FOOD');

insert or replace into ModifierArguments (ModifierId,   Name,       Type,                               Value,  Extra) values
    ('HD_HIGH_DIFFICULTY_FOOD_SCALING',                 'Amount',   'LinearScaleFromDefaultHandicap',   0,      2);

-- For Debug
-- delete from RequirementSetRequirements where RequirementSetId = 'PLAYER_IS_HIGH_DIFFICULTY_AI' and RequirementId = 'REQUIRES_PLAYER_IS_AI';

-- Production Scale: 85 + 15n
-- update ModifierArguments set Extra = 17
--     where ModifierId = 'HIGH_DIFFICULTY_PRODUCTION_SCALING' and Name = 'Amount';

-- Science Scale: 40 + 15n
-- update ModifierArguments set Extra = 3
--     where ModifierId like 'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_%' and Name = 'Amount';

-- Culture Scale: 40 + 15n
-- update ModifierArguments set Extra = 3
--     where ModifierId like 'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_%' and Name = 'Amount';

-- Gold Scale: 40 + 15n
-- update ModifierArguments set Extra = 8
--     where ModifierId = 'HIGH_DIFFICULTY_GOLD_SCALING' and Name = 'Amount';

-- Faith Scale: 30 + 10n
--种植园从灌溉前移到制陶(淡水粮保留在灌溉)
update Improvements set PrereqTech = 'TECH_POTTERY' where ImprovementType = 'IMPROVEMENT_PLANTATION';
update Modifiers set SubjectRequirementSetId = 'PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT_NO_FEUDALISM_NEW' where ModifierId = 'PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_FOOD';
insert or ignore into Requirements
    (RequirementId,                     RequirementType)
values
    ('REQUIRES_PLAYER_HAS_IRRIGATION',  'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
insert or ignore into RequirementArguments
    (RequirementId,                     Name,               Value)
values
    ('REQUIRES_PLAYER_HAS_IRRIGATION',  'TechnologyType',   'TECH_IRRIGATION');
insert or ignore into RequirementSets
    (RequirementSetId,                                                  RequirementSetType)
values
    ('PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT_NO_FEUDALISM_NEW',   'REQUIREMENTSET_TEST_ALL');
insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                                  RequirementId)
values
    ('PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT_NO_FEUDALISM_NEW',   'REQUIRES_PLOT_IS_FRESH_WATER'),
    ('PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT_NO_FEUDALISM_NEW',   'REQUIRES_NOT_ADJACENT_TO_AQUEDUCT'),
    ('PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT_NO_FEUDALISM_NEW',   'HD_REQUIRES_PLAYER_HAS_NO_CIVIC_FEUDALISM'),
    ('PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT_NO_FEUDALISM_NEW',   'REQUIRES_PLAYER_HAS_IRRIGATION');
--移除雨林前移到采矿
update Features set RemoveTech = 'TECH_MINING' where FeatureType = 'FEATURE_JUNGLE';
--市中心改为3粮2锤
update GlobalParameters set Value = 2 where Name = 'YIELD_PRODUCTION_CITY_TERRAIN_REPLACE';
--种树前移到工会，越南到神秘主义
update Features set AddCivic = 'CIVIC_GUILDS' where FeatureType = 'FEATURE_FOREST';
update ModifierArguments set Value = 'CIVIC_MYSTICISM' where ModifierId = 'TRAIT_PLANT_MEDIEVAL_WOODS' and Name = 'CivicType';