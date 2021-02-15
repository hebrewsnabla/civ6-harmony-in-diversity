-------------------------------------
--      Balance Adjustments        --
-------------------------------------

-- adjust purchase plot cost
update GlobalParameters set Value = 40 where Name = 'PLOT_BUY_BASE_COST';

-- adjust the population food consumption.
update GlobalParameters set Value = 3 where Name = 'CITY_FOOD_CONSUMPTION_PER_POPULATION';
update GlobalParameters set Value = 3 where Name = 'YIELD_FOOD_CITY_TERRAIN_REPLACE';
update GlobalParameters set Value = 1 where Name = 'YIELD_PRODUCTION_CITY_TERRAIN_REPLACE';

-- the distance to netural wonders
update GlobalParameters set Value = 5 where Name = 'START_DISTANCE_MAJOR_NATURAL_WONDER';
update GlobalParameters set Value = 5 where Name = 'START_DISTANCE_MINOR_NATURAL_WONDER';

-- ranged unit cause 75% damage to walls instead of 50% (but -17 strength still remains)
update GlobalParameters set Value = 75 where Name = 'COMBAT_DEFENSE_DAMAGE_PERCENT_RANGED';

-- Religion pressure
update GlobalParameters set Value = 2 where Name = 'RELIGION_SPREAD_ADJACENT_PER_TURN_PRESSURE';
update GlobalParameters set Value = 2 where Name = 'RELIGION_SPREAD_TRADE_ROUTE_PRESSURE_FOR_DESTINATION';
update GlobalParameters set Value = 2 where Name = 'RELIGION_SPREAD_TRADE_ROUTE_PRESSURE_FOR_ORIGIN';

-- Barbarian camp
-- the distance to barbarian camp
update GlobalParameters set Value = 6 where Name = 'BARBARIAN_CAMP_MINIMUM_DISTANCE_CITY';

-- let the barbarian camp start raid with higher threshold (20 turns after the camp being created).
update BarbarianTribes set RaidingBoldness = 40 where RaidingBehaviorTree = 'Barbarian Attack';
update BarbarianTribes set CityAttackBoldness = 20 where RaidingBehaviorTree = 'Barbarian City Assault';
update BarbarianTribes set ResourceRange = 2 where TribeType = 'TRIBE_CAVALRY';
update GlobalParameters set Value = -20 where Name = 'BARBARIAN_BOLDNESS_PER_CAMP_ATTACK';
-- AiFavoredItems, Default Barbarian, Chase Target

-- free amenity
update Buildings set Entertainment = 1 where BuildingType = 'BUILDING_PALACE';
update GlobalParameters set Value = 2 where Name = 'CITY_AMENITIES_FOR_FREE';
-- update GlobalParameters set Value = 1 where Name = 'CITY_AMENITIES_FOR_FREE';
-- update GlobalParameters set Value = 1 where Name = 'CITY_POP_PER_AMENITY';

-- district population require
-- update GlobalParameters set Value = 4 where Name = 'DISTRICT_POPULATION_REQUIRED_PER';
update GlobalParameters set Value = 3 where Name = 'DISTRICT_POPULATION_REQUIRED_PER';

-- Enable districts/wonders placement on GEOTHERMAL_FISSURE.
insert or replace into Features_XP2 (FeatureType, ValidWonderPlacement, ValidDistrictPlacement, ValidForReplacement) values 
	('FEATURE_GEOTHERMAL_FISSURE', 1, 1, 1);

-- change era minimum turns
update Eras_XP1 set GameEraMinimumTurns = 30 where not EraType = 'ERA_FUTURE';

-- Slower Barbarian tech.
update GlobalParameters set Value = 60 where Name = 'BARBARIAN_TECH_PERCENT';
-- no trade route quest for city states
delete from Quests where QuestType = 'QUEST_SEND_TRADE_ROUTE';
delete from Quests where QuestType = 'QUEST_CONVERT_CAPITAL_TO_RELIGION';

-- update BonusMinorStartingUnits set Quantity = 1 where Unit = 'UNIT_WARRIOR' and Era = 'ERA_ANCIENT' and MinDifficulty <> 'DIFFICULTY_EMPEROR';
-- update BonusMinorStartingUnits set DifficultyDelta = 0.5 where Unit = 'UNIT_WARRIOR' and Era = 'ERA_ANCIENT' and MinDifficulty = 'DIFFICULTY_EMPEROR';
-- update BonusMinorStartingUnits set DifficultyDelta = 0.5 where Unit = 'UNIT_WARRIOR' and Era = 'ERA_CLASSICAL' and MinDifficulty = 'DIFFICULTY_EMPEROR';

-- Loyalty pressure
-- update GlobalParameters set Value = 30 where Name = 'LOYALTY_PER_TURN_FROM_NEARBY_CITIZEN_PRESSURE_MAX_LOYALTY';

-- minor civs
updaTe GlobalParameters set Value = 50 where Name = 'IDENTITY_PER_TURN_FROM_CITY_STATES';

-- Bug Fix
update ModifierArguments set Value = 60 where ModifierId = 'MINOR_CIV_AYUTTHAYA_CULTURE_COMPLETE_BUILDING' and Name = 'BuildingProductionPercent';
update ModifierArguments set Value = 24 where ModifierId = 'CARDINAL_CITADEL_OF_GOD_FAITH_FINISH_BUILDINGS' and Name = 'BuildingProductionPercent';

update ModifierArguments set Value = 30 where ModifierId = 'TRAIT_GRANT_CULTURE_UNIT_TRAINED' and Name = 'UnitProductionPercent';
update ModifierArguments set Value = 24 where ModifierId = 'BASILIKOI_PAIDES_SCIENCE_TRAINED_UNIT' and Name = 'UnitProductionPercent';

update BarbarianAttackForces set SiegeTag = 'CLASS_HEAVY_CAVALRY' where AttackForceType = 'HighDifficultyCavalryAttack';
