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
	('DLAdjustBuildings'),
	('DLAdjustDistricts'),
	('DLAdjustPseudoYields'),
	('DLFewerWaronCityStates');

insert or replace into AiLists
	(ListType,					LeaderType,					System)
values
	('DLAdjustBuildings',		'TRAIT_LEADER_MAJOR_CIV',	'Buildings'),
	('DLAdjustDistricts',		'TRAIT_LEADER_MAJOR_CIV',	'Districts'),
	('DLAdjustPseudoYields',	'TRAIT_LEADER_MAJOR_CIV',	'PseudoYields'),
	('DLFewerWaronCityStates',	'TRAIT_LEADER_MAJOR_CIV',	'DiplomaticActions');

insert or replace into AiFavoredItems
	(ListType,					Item,									Favored,	Value)
values
	('DLAdjustBuildings',		'BUILDING_GRANARY',						1,			0),
	('DLAdjustBuildings',		'BUILDING_WALLS',						1,			0),
	('DLAdjustBuildings',		'BUILDING_CASTLE',						1,			0),
	-- ('DLAdjustBuildings',	'BUILDING_STAR_FORT',					1,			0),
	('DLAdjustBuildings',		'BUILDING_GOV_TALL',					1,			0),
	('DLAdjustBuildings',		'BUILDING_GOV_CITYSTATES',				1,			0),
	('DLAdjustBuildings',		'BUILDING_GOV_FAITH',					1,			0),
	('DLAdjustBuildings',		'BUILDING_GOV_SPIES',					1,			0),
	-- ('DLAdjustBuildings',		'BUILDING_UNIVERSITY',					1,			0),
	-- ('DLAdjustBuildings',		'BUILDING_WORKSHOP',					1,			0),
	('DLAdjustDistricts',		'DISTRICT_GOVERNMENT',					1,			0),
	-- ('DLAdjustDistricts',		'DISTRICT_AQUEDUCT',					1,			0),
	-- ('DLAdjustPseudoYields',	'PSEUDOYIELD_HAPPINESS',				1,			-50),
	-- ('DLAdjustPseudoYields',	'PSEUDOYIELD_RESOURCE_LUXURY',			1,			300),
	('DLAdjustPseudoYields',	'PSEUDOYIELD_IMPROVEMENT',				1,			8),
	('DLFewerWaronCityStates',	'DIPLOACTION_DECLARE_WAR_MINOR_CIV',	0,			0),
	('AgressiveDiplomacy',		'DIPLOACTION_DECLARE_WAR_MINOR_CIV',	1,			0);

-- See also [MOD] Real Strategy
UPDATE PseudoYields SET DefaultValue = 150 WHERE PseudoYieldType = 'PSEUDOYIELD_CITY_ORIGINAL_CAPITAL'; -- 	200, lower value should save Minors a bit, Conquest will boost it anyway
UPDATE PseudoYields SET DefaultValue = 0.8 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_RELIGIOUS'; -- 1
UPDATE PseudoYields SET DefaultValue = 1.1 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_SETTLER'; -- 1 -- 1.4 seems to much, they build Settlers even with 0 army and undeveloped cities
UPDATE PseudoYields SET DefaultValue = 4.0 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_TRADE'; -- 1, AI+ 11 -- make sure they build them all

-- Changed based on Real Strategy
UPDATE PseudoYields SET DefaultValue = 1.2 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_COMBAT'; -- 1.0, AI+ 1.4, RS 1.1
UPDATE PseudoYields SET DefaultValue = 2.0 WHERE PseudoYieldType = 'PSEUDOYIELD_GOLDENAGE_POINT'; -- 1, R&F, RS unchanged
UPDATE PseudoYields SET DefaultValue = 4.0 WHERE PseudoYieldType = 'PSEUDOYIELD_GOVERNOR'; -- 2, R&F, RS unchanged
UPDATE PseudoYields SET DefaultValue = 1.0 WHERE PseudoYieldType = 'PSEUDOYIELD_WONDER'; -- 2, AI+ 0.55, RS 0.6
UPDATE PseudoYields SET DefaultValue = 5.0 WHERE PseudoYieldType = 'PSEUDOYIELD_DISTRICT'; -- 	4.0, AI+ = 6.7! RS 4.0
UPDATE PseudoYields SET DefaultValue = 8.0 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_SPY'; -- 20, RS not changed
UPDATE PseudoYields SET DefaultValue = -0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_DIPLOMATIC_GRIEVANCE'; -- -0.5, RS not changed
/*
These Pseudos affect the valuation of Civics and Technologies
However, each is applied to a separate tree respectively, and since the trees are separate they don't clash
Tweaking these probaby would result in a bit different ORDER of selecting civics and techs, but without the details
of the algorithm it is hard to predict results
I determined only that:
a) Each civic and tech has a residual valuation that can be seen when setting those Pseudos to 0
b) The pseudo default value is multiplied by a factor of 30..100 and added to the valuation
c) The bias value (from AiFavoredItems) affects this factor even further, so formula is: factor * def_value * ( 1 + bias_percentage )
UPDATE PseudoYields SET DefaultValue = 5 WHERE PseudoYieldType = 'PSEUDOYIELD_CIVIC';
UPDATE PseudoYields SET DefaultValue = 5 WHERE PseudoYieldType = 'PSEUDOYIELD_TECHNOLOGY';
*/

update PseudoYields set DefaultValue = 6 where PseudoYieldType = 'PSEUDOYIELD_RESOURCE_LUXURY';
update AiFavoredItems set Value = 50 where ListType = 'CatherineAltLuxuries';

-- update AiFavoredItems set Value = 50 where ListType = 'ScottishEnlightnmentBiases';

-- For different Leaders 
insert or replace into AiListTypes (ListType) values
	('AmbiorixBuildings'),
	('AmbiorixDistricts'),
	('AmbiorixYields'),
	('BarbarossaBuildings'),
	('BarbarossaDistricts'),
	('BarbarossaYields');

insert or replace into AiLists
	(ListType,					LeaderType,							System)
values
	('AmbiorixBuildings',		'TRAIT_LEADER_AMBIORIX',			'Buildings'),
	('AmbiorixDistricts',		'TRAIT_LEADER_AMBIORIX',			'Districts'),
	('AmbiorixYields',			'TRAIT_LEADER_AMBIORIX',			'Yields'),
	('BarbarossaBuildings',		'TRAIT_LEADER_HOLY_ROMAN_EMPEROR',	'Buildings'),
	('BarbarossaDistricts',		'TRAIT_LEADER_HOLY_ROMAN_EMPEROR',	'Districts'),
	('BarbarossaYields',		'TRAIT_LEADER_HOLY_ROMAN_EMPEROR',	'Yields');

insert or replace into AiFavoredItems
	(ListType,					Item,						Favored,	Value)
values
	('AmbiorixBuildings',		'BUILDING_WORKSHOP',		1,			0),
	('AmbiorixDistricts',		'DISTRICT_OPPIDUM',			1,			0),
	('GaulFavoredTechs',		'TECH_IRON_WORKING',		1,			0),
	('AmbiorixYields',			'YIELD_FAITH',				1,			-20),
	('AmbiorixYields',			'YIELD_FOOD',				1,			10),
	('AmbiorixYields',			'YIELD_PRODUCTION',			1,			10),
	('BarbarossaBuildings',		'BUILDING_WORKSHOP',		1,			0),
	('BarbarossaDistricts',		'DISTRICT_HANSA',			1,			0),
	('BarbarossaTechs',			'TECH_IRON_WORKING',		1,			0),
	('BarbarossaTechs',			'TECH_CURRENCY',			1,			0),
	('BarbarossaYields',		'YIELD_FAITH',				1,			-20),
	('BarbarossaYields',		'YIELD_GOLD',				1,			10),
	('BarbarossaYields',		'YIELD_PRODUCTION',			1,			10);

-- Debug.
-- delete from RequirementSetRequirements where
-- 	RequirementSetId = 'PLAYER_IS_HIGH_DIFFICULTY_AI' and RequirementId = 'REQUIRES_PLAYER_IS_AI';

-- For high difficulty AI.
insert or replace into TraitModifiers (TraitType,	ModifierId) values
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_HOUSING'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_HOUSING');
	-- ('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_CODE_OF_LAWS'),
	-- ('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_POTTERY'),
	-- ('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_ANIMAL_HUSBANDRY'),
	-- ('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_MINING');

insert or replace into Modifiers (ModifierId,				ModifierType,									OwnerRequirementSetId) values
	('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_HOUSING',		'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',	'PLAYER_IS_AT_LEAST_EMPEROR_DIFFICULTY_AI'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_HOUSING',			'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_CODE_OF_LAWS',		'MODIFIER_PLAYER_GRANT_RANDOM_CIVIC',			'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_POTTERY',			'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_ANIMAL_HUSBANDRY',	'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_MINING',			'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI');

insert or replace into ModifierArguments (ModifierId,		Name,		Value) values
	('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_HOUSING',		'Amount',	1),
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_HOUSING',			'Amount',	1),
	('AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_CODE_OF_LAWS',		'Amount',	1),
	('AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_POTTERY',			'TechType',	'TECH_POTTERY'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_ANIMAL_HUSBANDRY',	'TechType',	'TECH_ANIMAL_HUSBANDRY'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_MINING',			'TechType',	'TECH_MINING');

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

-- Science Scale: 40 + 10n
update ModifierArguments set Extra = 8
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
		'LinearScaleFromDefaultHandicap', 0, 2
from Eras where not EraType = 'ERA_ANCIENT';

-- Culture Scale: 40 + 10n
update ModifierArguments set Extra = 8
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
		'LinearScaleFromDefaultHandicap', 0, 2
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
