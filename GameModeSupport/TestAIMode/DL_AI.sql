-- Moved to main

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
