-------------------------------------
--     Technologies Adjustment     --
-------------------------------------

-- v4
update Technologies set Cost = 4800 where Cost = 4500;
-- 
update Technologies set Cost = 4200 where Cost = 4000;
update TechnologyRandomCosts set Cost = 4000 where Cost = 3700;
update TechnologyRandomCosts set Cost = 3800 where Cost = 3600;
-- 
update Technologies set Cost = 3400 where Cost = 3100;
update Technologies set Cost = 3200 where Cost = 3000;
-- 
update Technologies set Cost = 2800 where Cost = 2500;
update Technologies set Cost = 2600 where Cost = 2400;
-- 
update Technologies set Cost = 2180 where Cost = 1900;
update Technologies set Cost = 2000 where Cost = 1800;
-- 
update Technologies set Cost = 1660 where Cost = 1400;
update Technologies set Cost = 1500 where Cost = 1300;
-- 
update Technologies set Cost = 1100 where Cost = 950;
update Technologies set Cost = 960 where Cost = 850;
-- 
update Technologies set Cost = 600 where Cost = 550;
update Technologies set Cost = 480 where Cost = 450;
-- 
update Technologies set Cost = 300 where Cost = 280;
update Technologies set Cost = 180 where Cost = 160;
-- Ancient
update Technologies set Cost = 80 where Cost = 80;
update Technologies set Cost = 50 where Cost = 50;


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
