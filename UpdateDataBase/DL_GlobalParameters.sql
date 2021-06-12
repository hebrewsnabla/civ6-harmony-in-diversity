-------------------------------------
--      Balance Adjustments        --
-------------------------------------

-- adjust purchase plot cost
update GlobalParameters set Value = 40 where Name = 'PLOT_BUY_BASE_COST';
-- update GlobalParameters set Value = 4 where Name = 'CITY_MAX_BUY_PLOT_RANGE';
update GlobalParameters set Value = 8 where Name = 'PLOT_INFLUENCE_MAX_ACQUIRE_DISTANCE';

-- adjust the population food consumption.
update GlobalParameters set Value = 3 where Name = 'CITY_FOOD_CONSUMPTION_PER_POPULATION';
update GlobalParameters set Value = 3 where Name = 'YIELD_FOOD_CITY_TERRAIN_REPLACE';
update GlobalParameters set Value = 1 where Name = 'YIELD_PRODUCTION_CITY_TERRAIN_REPLACE';

-- Map
update GlobalParameters set Value = 8 where Name = 'ICE_TILES_PERCENT';

-- the distance to netural wonders
update GlobalParameters set Value = 5 where Name = 'START_DISTANCE_MAJOR_NATURAL_WONDER';
update GlobalParameters set Value = 5 where Name = 'START_DISTANCE_MINOR_NATURAL_WONDER';

-- Trade Route duration: minimal > 12 (was 20), do not increase based on Era.
update GlobalParameters set Value = 12 where Name = 'TRADE_ROUTE_TURN_DURATION_BASE';
update Eras_XP2 set TradeRouteMinimumEndTurnChange = 0;

-- Start from Industrial Era.
update GlobalParameters set Value = 4 where Name = 'WORLD_CONGRESS_INITIAL_ERA';
update GlobalParameters set Value = 15 where Name = 'WORLD_CONGRESS_MAX_TIME_BETWEEN_MEETINGS';
update GlobalParameters set Value = 15 where Name = 'WORLD_CONGRESS_MIN_TIME_BETWEEN_SPECIAL_SESSIONS';

update GlobalParameters set Value = 15 where Name = 'DIPLOMACY_ALLIANCE_TIME_LIMIT';
update GlobalParameters set Value = 15 where Name = 'DIPLOMACY_DECLARED_FRIENDSHIP_TIME_LIMIT';
update GlobalParameters set Value = 15 where Name = 'DIPLOMACY_DEFENSIVE_PACT_TIME_LIMIT';
update GlobalParameters set Value = 15 where Name = 'DIPLOMACY_DENOUNCE_TIME_LIMIT';

update GlobalParameters set Value = 40 where Name = 'LEVY_MILITARY_PERCENT_OF_UNIT_PURCHASE_COST';

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
update GlobalParameters set Value = 1 where Name = 'CITY_AMENITIES_FOR_FREE';
-- update GlobalParameters set Value = 1 where Name = 'CITY_AMENITIES_FOR_FREE';
-- update GlobalParameters set Value = 1 where Name = 'CITY_POP_PER_AMENITY';

-- district population require
-- update GlobalParameters set Value = 4 where Name = 'DISTRICT_POPULATION_REQUIRED_PER';
update GlobalParameters set Value = 3 where Name = 'DISTRICT_POPULATION_REQUIRED_PER';
-- update the City Growth Formula.
update GlobalParameters set Value = 18 where Name = 'CITY_GROWTH_THRESHOLD';
update GlobalParameters set Value = 10 where Name = 'CITY_GROWTH_MULTIPLIER';
update GlobalParameters set Value = 1.6 where Name = 'CITY_GROWTH_EXPONENT';

-- Enable districts/wonders placement on GEOTHERMAL_FISSURE and REEF
insert or replace into Features_XP2 (FeatureType, ValidWonderPlacement, ValidDistrictPlacement, ValidForReplacement) values 
	('FEATURE_GEOTHERMAL_FISSURE', 1, 1, 1);
insert or replace into Features_XP2 (FeatureType, ValidWonderPlacement, ValidDistrictPlacement, ValidForReplacement) values 
	('FEATURE_REEF', 1, 1, 1);

-- change era minimum turns
update Eras_XP1 set GameEraMinimumTurns = 0 where not EraType = 'ERA_FUTURE';
update GlobalParameters set Value = 10 where Name = 'THRESHOLD_SHIFT_PER_PAST_GOLDEN_AGE';
update GlobalParameters set Value = -10 where Name = 'THRESHOLD_SHIFT_PER_PAST_DARK_AGE';
update GlobalParameters set Value = 2 where Name = 'THRESHOLD_SHIFT_PER_CITY';

-- Slower Barbarian tech.
update GlobalParameters set Value = 60 where Name = 'BARBARIAN_TECH_PERCENT';
-- no trade route quest for city states
delete from Quests where QuestType = 'QUEST_SEND_TRADE_ROUTE';
delete from Quests where QuestType = 'QUEST_CONVERT_CAPITAL_TO_RELIGION';

-- update BonusMinorStartingUnits set Quantity = 1 where Unit = 'UNIT_WARRIOR' and Era = 'ERA_ANCIENT' and MinDifficulty != 'DIFFICULTY_EMPEROR';
update BonusMinorStartingUnits set DifficultyDelta = 0.5 where Unit = 'UNIT_WARRIOR' and Era = 'ERA_ANCIENT' and MinDifficulty = 'DIFFICULTY_EMPEROR';
update BonusMinorStartingUnits set DifficultyDelta = 0.5 where Unit = 'UNIT_WARRIOR' and Era = 'ERA_CLASSICAL' and MinDifficulty = 'DIFFICULTY_EMPEROR';

-- Loyalty pressure
-- update GlobalParameters set Value = 30 where Name = 'LOYALTY_PER_TURN_FROM_NEARBY_CITIZEN_PRESSURE_MAX_LOYALTY';

-- minor civs
updaTe GlobalParameters set Value = 50 where Name = 'IDENTITY_PER_TURN_FROM_CITY_STATES';

-- Bug Fix
-- update ModifierArguments set Value = 60 where ModifierId = 'MINOR_CIV_AYUTTHAYA_CULTURE_COMPLETE_BUILDING' and Name = 'BuildingProductionPercent';
-- update ModifierArguments set Value = 24 where ModifierId = 'CARDINAL_CITADEL_OF_GOD_FAITH_FINISH_BUILDINGS' and Name = 'BuildingProductionPercent';

-- update ModifierArguments set Value = 30 where ModifierId = 'TRAIT_GRANT_CULTURE_UNIT_TRAINED' and Name = 'UnitProductionPercent';
-- update ModifierArguments set Value = 24 where ModifierId = 'BASILIKOI_PAIDES_SCIENCE_TRAINED_UNIT' and Name = 'UnitProductionPercent';

update BarbarianAttackForces set SiegeTag = 'CLASS_HEAVY_CAVALRY' where AttackForceType = 'HighDifficultyCavalryAttack';

--allow to level 2 for beating barb
updaTe GlobalParameters set Value = 3 where Name = 'EXPERIENCE_MAX_BARB_LEVEL';

--double trade alliance points 
updaTe GlobalParameters set Value = 2 where Name = 'ALLIANCE_POINTS_FOR_TRADE';

--research agreement time
update ModifierArguments set Value = 10 where ModifierId = 'ALLIANCE_RESEARCH_AGREEMENT';

-- The New Global Parameters.
insert or replace into GlobalParameters
    (Name,                                              Value)
values
    ('EXPANDED_INIT_VISION_RANGE',                      3),
    ('LIANG_WONDER_GREAT_ENGINEER_PERCENTAGE',          20),
    ('MAGNUS_GENERAL_SERVICES_OFFICE_EFFECT_DISTANCE',  6),
    ('GOLD_FOR_EVERY_ERA_SCORE',                        5),
    ('TURNS_BEFORE_DESTROY_AFTER_PILLAGE',              5),
    ('OCCUPATION_GOLD_PER_POP',                         30),
    ('GENERATE_NEW_GOODY_HUTS_FOR_EVERY',               3);
