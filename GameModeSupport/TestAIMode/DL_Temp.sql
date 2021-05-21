-------------------------------------
--     Temp Testing Adjustments    --
-------------------------------------

-- Production Scale: 85 + 15n
update ModifierArguments set Extra = 17
    where ModifierId = 'HIGH_DIFFICULTY_PRODUCTION_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_PRODUCTION_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select  'HIGH_DIFFICULTY_PRODUCTION_SCALING_AT_LEAST_' || EraType,
        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
        'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_PRODUCTION_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_PRODUCTION'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select  'HIGH_DIFFICULTY_PRODUCTION_SCALING_AT_LEAST_' || EraType, 'Amount',
        'LinearScaleFromDefaultHandicap', 0, 3
from Eras where not EraType = 'ERA_ANCIENT';

-- Science Scale: 40 + 15n
update ModifierArguments set Extra = 8
    where ModifierId = 'HIGH_DIFFICULTY_SCIENCE_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select  'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_' || EraType,
        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
        'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_SCIENCE'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select  'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_' || EraType, 'Amount',
        'LinearScaleFromDefaultHandicap', 0, 3
from Eras where not EraType = 'ERA_ANCIENT';

-- Culture Scale: 40 + 15n
update ModifierArguments set Extra = 8
    where ModifierId = 'HIGH_DIFFICULTY_CULTURE_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select  'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_' || EraType,
        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
        'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_CULTURE'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select  'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_' || EraType, 'Amount',
        'LinearScaleFromDefaultHandicap', 0, 3
from Eras where not EraType = 'ERA_ANCIENT';

-- Gold Scale: 40 + 15n
update ModifierArguments set Extra = 8
    where ModifierId = 'HIGH_DIFFICULTY_GOLD_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select  'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType,
        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
        'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_GOLD'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select  'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType, 'Amount',
        'LinearScaleFromDefaultHandicap', 0, 3
from Eras where not EraType = 'ERA_ANCIENT';

-- Faith Scale: 30 + 10n
update ModifierArguments set Extra = 6
    where ModifierId = 'HIGH_DIFFICULTY_FAITH_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select  'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType,
        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
        'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_FAITH'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select  'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType, 'Amount',
        'LinearScaleFromDefaultHandicap', 0, 2
from Eras where not EraType = 'ERA_ANCIENT';
