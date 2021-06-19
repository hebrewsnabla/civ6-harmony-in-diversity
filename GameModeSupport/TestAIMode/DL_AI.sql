-- Moved to main

-- --------------------------------------------------------------
-- -- Yield biases
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('DefaultYieldBias', 'YIELD_FOOD', 1, 10); -- new
-- UPDATE AiFavoredItems SET Value = 30 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_PRODUCTION'; -- 25
-- UPDATE AiFavoredItems SET Value = 10 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_SCIENCE'; -- 10
-- UPDATE AiFavoredItems SET Value = 15 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_CULTURE'; -- 10
UPDATE AiFavoredItems SET Value = 0 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_GOLD';  -- 20, RS:0
-- UPDATE AiFavoredItems SET Value = -20 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_FAITH'; -- -25

-- For high difficulty AI.
insert or replace into TraitModifiers (TraitType,   ModifierId) values
    ('TRAIT_LEADER_MAJOR_CIV',                      'AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_AMENITY'),
    ('TRAIT_LEADER_MAJOR_CIV',                      'AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_AMENITY'),
    ('TRAIT_LEADER_MAJOR_CIV',                      'HD_HIGH_DIFFICULTY_FOOD_SCALING');

insert or replace into Modifiers (ModifierId,               ModifierType,                                   OwnerRequirementSetId) values
    ('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_AMENITY',        'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',  'PLAYER_IS_AT_LEAST_EMPEROR_DIFFICULTY_AI'),
    ('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_AMENITY',          'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',  'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI'),
    ('HD_HIGH_DIFFICULTY_FOOD_SCALING',                     'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'PLAYER_IS_HIGH_DIFFICULTY_AI');

insert or replace into ModifierArguments (ModifierId,       Name,           Value) values
    ('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_AMENITY',        'Amount',       1),
    ('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_AMENITY',          'Amount',       1),
    ('HD_HIGH_DIFFICULTY_FOOD_SCALING',                     'YieldType',    'YIELD_FOOD');

insert or replace into ModifierArguments (ModifierId,   Name,       Type,                               Value,  Extra) values
    ('HD_HIGH_DIFFICULTY_FOOD_SCALING',                 'Amount',   'LinearScaleFromDefaultHandicap',   0,      2);

-- For Debug
-- delete from RequirementSetRequirements where RequirementSetId = 'PLAYER_IS_HIGH_DIFFICULTY_AI' and RequirementId = 'REQUIRES_PLAYER_IS_AI';
