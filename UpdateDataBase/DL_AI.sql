-------------------------------------
--      AI Related Adjustments     --
-------------------------------------

update MajorStartingUnits set NotStartTile = 0, OnDistrictCreated = 1, DifficultyDelta = 0.5
	where Unit = 'UNIT_WARRIOR' and Era = 'ERA_ANCIENT' and AiOnly = 1;
update MajorStartingUnits set NotStartTile = 0, OnDistrictCreated = 1, DifficultyDelta = 0.5
	where Unit = 'UNIT_SPEARMAN' and Era = 'ERA_CLASSICAL' and AiOnly = 1;
update MajorStartingUnits set DifficultyDelta = 0 where Unit = 'UNIT_SETTLER' and AiOnly = 1; -- and Era = 'ERA_ANCIENT' or Era = 'ERA_CLASSICAL';

insert into MajorStartingUnits (Unit, Era, Quantity, NotStartTile, OnDistrictCreated, AiOnly, MinDifficulty, DifficultyDelta) values
	('UNIT_SCOUT', 'ERA_ANCIENT', 1, 1, 0, 1, 'DIFFICULTY_EMPEROR', 0),
	('UNIT_SCOUT', 'ERA_CLASSICAL', 1, 1, 0, 1, 'DIFFICULTY_EMPEROR', 0)
;

-- AiFavoredItems
-- DefaultCitySpecialization
-- ClassicalYields, YIELD_SCIENCE, 150

-- -- 1. Decrease AI happiness pseudo yield to decrease the value of luxury when buy.
-- 2. Increase AI luxury pseudo yield to increase the value of luxury when sell.
-- 3. Higher improvement pseudo yield to increase the desire for build improvemnts.
-- 4. Make AI less favor to declare war on city states.
insert or replace into AiListTypes (ListType) values
	('DLAdjustPseudoYields'),
	('DLFewerWaronCityStates');

insert or replace into AiLists
	(ListType,					LeaderType,					System)
values
	('DLAdjustPseudoYields',	'TRAIT_LEADER_MAJOR_CIV',	'PseudoYields'),
	('DLFewerWaronCityStates',	'TRAIT_LEADER_MAJOR_CIV',	'DiplomaticActions');

insert or replace into AiFavoredItems
	(ListType,					Item,									Favored,	Value)
values
	-- ('DLAdjustPseudoYields',	'PSEUDOYIELD_HAPPINESS',				1,			-50),
	-- ('DLAdjustPseudoYields',	'PSEUDOYIELD_RESOURCE_LUXURY',			1,			300),
	('DLAdjustPseudoYields',	'PSEUDOYIELD_IMPROVEMENT',				1,			10),
	('DLFewerWaronCityStates',	'DIPLOACTION_DECLARE_WAR_MINOR_CIV',	0,			0),
	('AgressiveDiplomacy',		'DIPLOACTION_DECLARE_WAR_MINOR_CIV',	1,			0);

update PseudoYields set DefaultValue = 6 where PseudoYieldType = 'PSEUDOYIELD_RESOURCE_LUXURY';
update AiFavoredItems set Value = 50 where ListType = 'CatherineAltLuxuries';

-- update AiFavoredItems set Value = 50 where ListType = 'ScottishEnlightnmentBiases';

-- Debug.
-- delete from RequirementSetRequirements where
-- 	RequirementSetId = 'PLAYER_IS_HIGH_DIFFICULTY_AI' and RequirementId = 'REQUIRES_PLAYER_IS_AI';

-- For high difficulty AI.
insert or replace into TraitModifiers (TraitType,	ModifierId) values
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_HOUSING'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_HOUSING');
insert or replace into Modifiers (ModifierId,			ModifierType,									OwnerRequirementSetId) values
	('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_HOUSING',	'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',	'PLAYER_IS_AT_LEAST_EMPEROR_DIFFICULTY_AI'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_HOUSING',		'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI');
insert or replace into ModifierArguments (ModifierId,	Name,		Value) values
	('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_HOUSING',	'Amount',	1),
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_HOUSING',		'Amount',	1);

-- Production Scale: 60 + 20n
update ModifierArguments set Extra = 12
	where ModifierId = 'HIGH_DIFFICULTY_PRODUCTION_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_PRODUCTION_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select	'HIGH_DIFFICULTY_PRODUCTION_SCALING_AT_LEAST_' || EraType,
		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
		'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_PRODUCTION_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_PRODUCTION'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select	'HIGH_DIFFICULTY_PRODUCTION_SCALING_AT_LEAST_' || EraType, 'Amount',
		'LinearScaleFromDefaultHandicap', 0, 4
from Eras where not EraType = 'ERA_ANCIENT';

-- Science Scale: 25 + 15n
update ModifierArguments set Extra = 5
	where ModifierId = 'HIGH_DIFFICULTY_SCIENCE_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select	'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_' || EraType,
		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
		'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_SCIENCE'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select	'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_' || EraType, 'Amount',
		'LinearScaleFromDefaultHandicap', 0, 3
from Eras where not EraType = 'ERA_ANCIENT';

-- Culture Scale: 25 + 15n
update ModifierArguments set Extra = 5
	where ModifierId = 'HIGH_DIFFICULTY_CULTURE_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select	'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_' || EraType,
		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
		'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_CULTURE'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select	'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_' || EraType, 'Amount',
		'LinearScaleFromDefaultHandicap', 0, 3
from Eras where not EraType = 'ERA_ANCIENT';

-- Gold Scale: 25 + 15n
update ModifierArguments set Extra = 5
	where ModifierId = 'HIGH_DIFFICULTY_GOLD_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select	'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType,
		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
		'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_GOLD'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select	'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType, 'Amount',
		'LinearScaleFromDefaultHandicap', 0, 3
from Eras where not EraType = 'ERA_ANCIENT';

-- Faith Scale: 30 + 10n
update ModifierArguments set Extra = 6
	where ModifierId = 'HIGH_DIFFICULTY_FAITH_SCALING' and Name = 'Amount';
insert or replace into TraitModifiers (TraitType, ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select	'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType,
		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
		'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_FAITH'
from Eras where not EraType = 'ERA_ANCIENT';
insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
select	'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType, 'Amount',
		'LinearScaleFromDefaultHandicap', 0, 2
from Eras where not EraType = 'ERA_ANCIENT';
