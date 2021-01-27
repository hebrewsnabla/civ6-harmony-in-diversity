-------------------------------------
--      Buildings Adjustments      --
-------------------------------------

-- update Building_CitizenYieldChanges set YieldChange = 1 where YieldType = 'YIELD_FAITH';
-- update Building_CitizenYieldChanges set YieldChange = 1 where YieldType = 'YIELD_PRODUCTION';;
-- update Building_CitizenYieldChanges set YieldChange = 1 where YieldType = 'YIELD_SCIENCE';
-- update Building_CitizenYieldChanges set YieldChange = 1 where YieldType = 'YIELD_CULTURE';
-- update Building_CitizenYieldChanges set YieldChange = 2 where BuildingType = 'BUILDING_STOCK_EXCHANGE' and YieldType = 'YIELD_GOLD';
-- update Building_CitizenYieldChanges set YieldChange = 1 where BuildingType = 'BUILDING_SEAPORT' and YieldType = 'YIELD_FOOD';

-- The total yields of the specialist is 2, 3, 4, 6 for each stage excepts.
-- The industrial zone yields 2, 4, 5, 6 for each stage.
-- The holy site yields 3, 4, 5, 6 for each stage.
-- each added specialist slot increase the gold requirement by the specialist by 1 (or 2) except the commercial hub and holy site.

insert or replace into Building_CitizenYieldChanges
	(BuildingType,							YieldType,			YieldChange)
values
	-- campus
	('BUILDING_LIBRARY',					'YIELD_SCIENCE',	1),
	('BUILDING_LIBRARY',					'YIELD_GOLD',		-1),
	('BUILDING_UNIVERSITY',					'YIELD_SCIENCE',	1),
	('BUILDING_UNIVERSITY',					'YIELD_GOLD',		-1),
	('BUILDING_MADRASA',					'YIELD_SCIENCE',	1), -- ub
	('BUILDING_MADRASA',					'YIELD_GOLD',		-1),
	-- campus: third level
	('BUILDING_RESEARCH_LAB',				'YIELD_SCIENCE',	2),
	('BUILDING_RESEARCH_LAB',				'YIELD_GOLD',		-2),
	-- theater
	('BUILDING_AMPHITHEATER',				'YIELD_CULTURE',	1),
	('BUILDING_AMPHITHEATER',				'YIELD_GOLD',		-1),
	('BUILDING_MARAE',						'YIELD_CULTURE',	1), -- ub
	('BUILDING_MARAE',						'YIELD_GOLD',		-1), -- ub
	('BUILDING_MUSEUM_ART',					'YIELD_CULTURE',	1),
	('BUILDING_MUSEUM_ART',					'YIELD_GOLD',		-1),
	('BUILDING_MUSEUM_ARTIFACT',			'YIELD_CULTURE',	1),
	('BUILDING_MUSEUM_ARTIFACT',			'YIELD_GOLD',		-1),
	-- theater: third level
	('BUILDING_FILM_STUDIO',				'YIELD_CULTURE',	2),
	('BUILDING_FILM_STUDIO',				'YIELD_GOLD',		-2),
	('BUILDING_BROADCAST_CENTER',			'YIELD_CULTURE',	2),
	('BUILDING_BROADCAST_CENTER',			'YIELD_GOLD',		-2),
	-- industrial zone
	('BUILDING_WORKSHOP',					'YIELD_PRODUCTION', 2),
	('BUILDING_WORKSHOP',					'YIELD_GOLD',		-2),
	('BUILDING_FACTORY',					'YIELD_PRODUCTION', 1),
	('BUILDING_FACTORY',					'YIELD_GOLD',		-1),
	('BUILDING_ELECTRONICS_FACTORY',		'YIELD_PRODUCTION', 1),
	('BUILDING_ELECTRONICS_FACTORY',		'YIELD_GOLD',		-1),
	-- industrial zone: third level
	('BUILDING_COAL_POWER_PLANT',			'YIELD_PRODUCTION', 1),
	('BUILDING_COAL_POWER_PLANT',			'YIELD_GOLD',		-1),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'YIELD_PRODUCTION', 1),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'YIELD_GOLD',		-1),
	('BUILDING_POWER_PLANT',				'YIELD_PRODUCTION', 1),
	('BUILDING_POWER_PLANT',				'YIELD_GOLD',		-1),
	-- holy site
	('BUILDING_SHRINE',						'YIELD_FAITH',		1),
	('BUILDING_TEMPLE',						'YIELD_FAITH',		1),
	('BUILDING_STAVE_CHURCH',				'YIELD_FAITH',		1), --ub（挪威）
	('BUILDING_PRASAT',						'YIELD_FAITH',		1), --ub (高棉)
	-- holy site: third level
	-- increase faith + 1
	-- harbor
	('BUILDING_LIGHTHOUSE',					'YIELD_FOOD',		1),
	('BUILDING_LIGHTHOUSE',					'YIELD_GOLD',		2),
	-- ('BUILDING_SHIPYARD',				'YIELD_FOOD',		1),
	('BUILDING_SHIPYARD',					'YIELD_GOLD',		2),
	-- harbor: third level
	('BUILDING_SEAPORT',					'YIELD_FOOD',		1),
	('BUILDING_SEAPORT',					'YIELD_GOLD',		2),
	-- encampment
	('BUILDING_BARRACKS',					'YIELD_PRODUCTION', 1),
	('BUILDING_BARRACKS',					'YIELD_GOLD',		-1),
	('BUILDING_BASILIKOI_PAIDES',			'YIELD_PRODUCTION', 1), -- ub
	('BUILDING_BASILIKOI_PAIDES',			'YIELD_GOLD',		-1), -- ub
	('BUILDING_STABLE',						'YIELD_PRODUCTION', 1),
	('BUILDING_STABLE',						'YIELD_GOLD',		-1),
	('BUILDING_ORDU',						'YIELD_PRODUCTION', 1), -- ub
	('BUILDING_ORDU',						'YIELD_GOLD',		-1), -- ub
	('BUILDING_ARMORY',						'YIELD_PRODUCTION', 1),
	('BUILDING_ARMORY',						'YIELD_GOLD',		-1),
	-- encampment: third level
	('BUILDING_MILITARY_ACADEMY',			'YIELD_PRODUCTION', 2),
	('BUILDING_MILITARY_ACADEMY',			'YIELD_GOLD',		-2),
	-- commercial hub
	('BUILDING_MARKET',						'YIELD_GOLD',		2),
	('BUILDING_SUKIENNICE',					'YIELD_GOLD',		2), -- ub
	('BUILDING_BANK',						'YIELD_GOLD',		2),
	('BUILDING_GRAND_BAZAAR',				'YIELD_GOLD',		2), -- ub
	-- commercial hub: third level
	('BUILDING_STOCK_EXCHANGE',				'YIELD_GOLD',		4);

-- building balance adjustments
update Buildings set Cost = 360 where BuildingType = 'BUILDING_HYDROELECTRIC_DAM';
update Buildings set Cost = 240 where BuildingType = 'BUILDING_FERRIS_WHEEL';

update Building_YieldChanges set YieldChange = 8
	where BuildingType = 'BUILDING_BANK' or BuildingType = 'BUILDING_GRAND_BAZAAR';

update Buildings set Entertainment = 2 where BuildingType = 'BUILDING_AQUARIUM' or BuildingType = 'BUILDING_ZOO';
update Buildings set Cost = 300 where BuildingType = 'BUILDING_THERMAL_BATH';

update Buildings set Cost = 50 where BuildingType = 'BUILDING_MONUMENT';
update Buildings set Cost = 60, Housing = 1 where BuildingType = 'BUILDING_GRANARY';

update Building_YieldChanges set YieldChange = 1
	where BuildingType = 'BUILDING_GRANARY' and YieldType = 'YIELD_FOOD';

update Buildings set Housing = 1 where BuildingType = 'BUILDING_WATER_MILL';
update Building_YieldChanges set YieldChange = 2
	where BuildingType = 'BUILDING_WATER_MILL' and YieldType = 'YIELD_PRODUCTION';
delete from Building_YieldChanges
	where BuildingType = 'BUILDING_WATER_MILL' and YieldType = 'YIELD_FOOD';

-- Unlock
update Buildings set PrereqCivic = 'CIVIC_CIVIL_ENGINEERING' where BuildingType = 'BUILDING_FERRIS_WHEEL';
update Buildings set PrereqTech = 'TECH_PRINTING', PrereqCivic = NULL where BuildingType = 'BUILDING_ZOO' or BuildingType = 'BUILDING_THERMAL_BATH';
-- Regional Range
update Buildings set RegionalRange = 6
 where BuildingType = 'BUILDING_UNIVERSITY'
	or BuildingType = 'BUILDING_MADRASA'
	or BuildingType = 'BUILDING_RESEARCH_LAB'
	or BuildingType = 'BUILDING_MUSEUM_ART'
	or BuildingType = 'BUILDING_MUSEUM_ARTIFACT'
	or BuildingType = 'BUILDING_FILM_STUDIO'
	or BuildingType = 'BUILDING_BROADCAST_CENTER'
	or BuildingType = 'BUILDING_BANK'
	or BuildingType = 'BUILDING_GRAND_BAZAAR'
	or BuildingType = 'BUILDING_STOCK_EXCHANGE'
;
update Buildings set RegionalRange = 4 where BuildingType = 'BUILDING_AMPHITHEATER' or BuildingType = 'BUILDING_MARAE';
update Buildings set RegionalRange = 4 where BuildingType = 'BUILDING_ARENA' or BuildingType = 'BUILDING_TLACHTLI';
update Buildings set RegionalRange = 6 where BuildingType = 'BUILDING_FERRIS_WHEEL';

-- Art Museum & Artifact Museum
update Building_YieldChanges set YieldChange = 4
	where BuildingType = 'BUILDING_MUSEUM_ART' or BuildingType = 'BUILDING_MUSEUM_ARTIFACT';

-- trade route
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'LIGHTHOUSE_TRADE_ROUTE_CAPACITY';

-- BuildingModifiers

delete from BuildingModifiers where BuildingType = 'BUILDING_GOV_TALL' and ModifierId = 'GOV_TALL_LOYALTY_DEBUFF';
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'GOV_TALL_AMENITY_BUFF';
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'GOV_TALL_HOUSING_BUFF';
update ModifierArguments set Value = 2 where ModifierId = 'GOV_TALL_AMENITY_BUFF';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_SHRINE',				'SHRINE_BUILDER_PURCHASE'),
	('BUILDING_TEMPLE',				'TEMPLE_SETTLER_PURCHASE'),
	('BUILDING_STAVE_CHURCH',		'TEMPLE_SETTLER_PURCHASE'),
	('BUILDING_PRASAT',				'TEMPLE_SETTLER_PURCHASE'),
	-- 
	('BUILDING_GRANARY',			'GRANARY_POP_FOOD_MODIFIER'),
	('BUILDING_LIBRARY',			'LIBRARY_POP_SCIENCE_MODIFIER'),
	-- 
	('BUILDING_GRANARY',			'GRANARY_ADD_BANANAS_FOOD'),
	('BUILDING_GRANARY',			'GRANARY_ADD_DEER_FOOD'),
	-- ('BUILDING_WATER_MILL',		'WATER_MILL_ADD_RIVER_FARM_FOOD'),
	('BUILDING_LIGHTHOUSE',			'LIGHTHOUSE_ADD_RESOURCE_FOOD'),
	('BUILDING_BARRACKS',			'BARRACKS_ADD_COPPER_PRODUCTION'),
	('BUILDING_BARRACKS',			'BARRACKS_ADD_IRON_PRODUCTION'),
	('BUILDING_BASILIKOI_PAIDES',	'BARRACKS_ADD_COPPER_PRODUCTION'), --ub
	('BUILDING_BASILIKOI_PAIDES',	'BARRACKS_ADD_IRON_PRODUCTION'), --ub
	('BUILDING_STABLE',				'STABLE_ADD_SHEEP_FOOD'),
	('BUILDING_STABLE',				'STABLE_ADD_SHEEP_PRODUCTION'),
	('BUILDING_STABLE',				'STABLE_ADD_CATTLE_FOOD'),
	('BUILDING_STABLE',				'STABLE_ADD_CATTLE_PRODUCTION'),
	('BUILDING_STABLE',				'STABLE_ADD_HORSES_PRODUCTION'),
	-- ('BUILDING_STABLE',			'STABLE_ADD_RESOURCE_PRODUCTION'),
	('BUILDING_ORDU',				'STABLE_ADD_SHEEP_FOOD'), --ub
	('BUILDING_ORDU',				'STABLE_ADD_SHEEP_PRODUCTION'), --ub
	('BUILDING_ORDU',				'STABLE_ADD_CATTLE_FOOD'), --ub
	('BUILDING_ORDU',				'STABLE_ADD_CATTLE_PRODUCTION'), --ub
	('BUILDING_ORDU',				'STABLE_ADD_HORSES_PRODUCTION'), --ub
	-- ('BUILDING_ORDU',			'STABLE_ADD_RESOURCE_PRODUCTION'), --ub
	('BUILDING_ARMORY',				'ARMORY_ADD_RESOURCE_PRODUCTION'),
	('BUILDING_FACTORY',			'FACTORY_ADD_RESOURCE_PRODUCTION'),
	('BUILDING_ELECTRONICS_FACTORY', 'FACTORY_ADD_RESOURCE_PRODUCTION'), --ub
	('BUILDING_MILITARY_ACADEMY',	'MILITARY_ACADEMY_ADD_RESOURCE_PRODUCTION'),
	-- 
	('BUILDING_HYDROELECTRIC_DAM',	'HYDROELECTRIC_DAM_ADD_RIVER_PRODUCTION'),
	-- Workshop
	('BUILDING_WORKSHOP',			'WORKSHOP_ADD_MINE_QUARRY_PRODUCTION'),
	-- enhence trained units
	('BUILDING_BARRACKS',			'BARRACKS_TRAINED_STRENGTH_MODIFIER'),
	('BUILDING_BASILIKOI_PAIDES',	'BASILIKOI_TRAINED_STRENGTH_MODIFIER'), --ub
	('BUILDING_AIRPORT',			'AIRPORT_TORISM_BOOST'),
	-- ('BUILDING_BASILIKOI_PAIDES', 'BASILIKOI_PAIDES_INCREASED_MOVEMENT_MODIFIER'),
	('BUILDING_STABLE',				'STABLE_TRAINED_STRENGTH_MODIFIER'),
	('BUILDING_ORDU',				'ORDU_TRAINED_STRENGTH_MODIFIER'); --ub

insert or replace into Modifiers
	(ModifierId,									ModifierType)
values
	('SHRINE_BUILDER_PURCHASE',						'MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE'),
	('TEMPLE_SETTLER_PURCHASE',						'MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE'),
	('GRANARY_POP_FOOD_MODIFIER',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	('LIBRARY_POP_SCIENCE_MODIFIER',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION');

insert or replace into Modifiers
	(ModifierId,									ModifierType,									SubjectRequirementSetId)
values
	--('AIRPORT_TOURISM_BOOST',						'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',		'HAS_AIRPORT_WITHIN_9_TILES'),
	--('AIRPORT_TOURISM_BOOST_MODIFIER',				'MODIFIER_SINGLE_CITY_ADJUST_TOURISM_LATE_ERAS',NULL),
	('AIRPORT_CULTURE_BOOST',						'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',		'HAS_AIRPORT_WITHIN_9_TILES'),
	('AIRPORT_CULTURE_BOOST_MODIFIER',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',NULL),
	('GRANARY_ADD_BANANAS_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_BANANAS'),
	('GRANARY_ADD_DEER_FOOD',						'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_DEER'),
	('WATER_MILL_ADD_RIVER_FARM_FOOD',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'IS_FARM_ADJACENT_TO_RIVER'),
	('LIGHTHOUSE_ADD_RESOURCE_FOOD',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_LIGHTHOUSE_RESOURCE'),
	('BARRACKS_ADD_COPPER_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_COPPER'),
	('BARRACKS_ADD_IRON_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_IRON'),
	('STABLE_ADD_SHEEP_FOOD',						'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_SHEEP'),
	('STABLE_ADD_SHEEP_PRODUCTION',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_SHEEP'),
	('STABLE_ADD_CATTLE_FOOD',						'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_CATTLE'),
	('STABLE_ADD_CATTLE_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_CATTLE'),
	('STABLE_ADD_HORSES_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_HORSES'),
	-- ('STABLE_ADD_RESOURCE_PRODUCTION',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_STABLE_RESOURCE'),
	('ARMORY_ADD_RESOURCE_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_ARMORY_RESOURCE'),
	('FACTORY_ADD_RESOURCE_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_FACTORY_RESOURCE'),
	('MILITARY_ACADEMY_ADD_RESOURCE_PRODUCTION',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_MILITARY_ACADEMY_RESOURCE'),
	('HYDROELECTRIC_DAM_ADD_RIVER_PRODUCTION',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS'),
	-- add improvements
	('WORKSHOP_ADD_MINE_QUARRY_PRODUCTION', 		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'PLOT_HAS_MINE_OR_QUARRY');

insert or replace into Modifiers
	(ModifierId,									ModifierType,												Permanent)
values
	('BARRACKS_TRAINED_STRENGTH_MODIFIER',			'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1),
	('BASILIKOI_TRAINED_STRENGTH_MODIFIER', 		'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1),
	('STABLE_TRAINED_STRENGTH_MODIFIER',			'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1),
	('ORDU_TRAINED_STRENGTH_MODIFIER',				'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',		1);

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	--('AIRPORT_TOURISM_BOOST',						'Modifier',		'AIRPORT_TOURISM_BOOST_MODIFIER'),
	--('AIRPORT_TOURISM_BOOST_MODIFIER',				'Modifier',		50),
	--('AIRPORT_TOURISM_BOOST_MODIFIER',				'MinimumEra',	'ERA_ANCIENT'),	
	('AIRPORT_CULTURE_BOOST',						'Modifier',		'AIRPORT_CULTURE_BOOST_MODIFIER'),
	('AIRPORT_CULTURE_BOOST_MODIFIER',				'Amount',		20),
	('AIRPORT_CULTURE_BOOST_MODIFIER',				'YieldType',	'YIELD_CULTURE'),
	('SHRINE_BUILDER_PURCHASE',						'Tag',			'CLASS_BUILDER'),
	('TEMPLE_SETTLER_PURCHASE',						'Tag',			'CLASS_SETTLER'),
	('GRANARY_POP_FOOD_MODIFIER',					'YieldType',	'YIELD_FOOD'),
	('GRANARY_POP_FOOD_MODIFIER',					'Amount',		'0.5'),
	('LIBRARY_POP_SCIENCE_MODIFIER',				'YieldType',	'YIELD_SCIENCE'),
	('LIBRARY_POP_SCIENCE_MODIFIER',				'Amount',		'0.5'),
	-- 
	('GRANARY_ADD_BANANAS_FOOD',					'YieldType',	'YIELD_FOOD'),
	('GRANARY_ADD_BANANAS_FOOD',					'Amount',		1),
	('GRANARY_ADD_DEER_FOOD',						'YieldType',	'YIELD_FOOD'),
	('GRANARY_ADD_DEER_FOOD',						'Amount',		1),
	('WATER_MILL_ADD_RIVER_FARM_FOOD',				'YieldType',	'YIELD_FOOD'),
	('WATER_MILL_ADD_RIVER_FARM_FOOD',				'Amount',		1),
	('LIGHTHOUSE_ADD_RESOURCE_FOOD',				'YieldType',	'YIELD_FOOD'),
	('LIGHTHOUSE_ADD_RESOURCE_FOOD',				'Amount',		1),
	('BARRACKS_ADD_COPPER_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('BARRACKS_ADD_COPPER_PRODUCTION',				'Amount',		1),
	('BARRACKS_ADD_IRON_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('BARRACKS_ADD_IRON_PRODUCTION',				'Amount',		1),
	('STABLE_ADD_SHEEP_FOOD',						'YieldType',	'YIELD_FOOD'),
	('STABLE_ADD_SHEEP_FOOD',						'Amount', 		1),
	('STABLE_ADD_SHEEP_PRODUCTION',					'YieldType',	'YIELD_PRODUCTION'),
	('STABLE_ADD_SHEEP_PRODUCTION',					'Amount', 		1),
	('STABLE_ADD_CATTLE_FOOD',						'YieldType',	'YIELD_FOOD'),
	('STABLE_ADD_CATTLE_FOOD',						'Amount', 		1),
	('STABLE_ADD_CATTLE_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('STABLE_ADD_CATTLE_PRODUCTION',				'Amount', 		1),
	('STABLE_ADD_HORSES_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('STABLE_ADD_HORSES_PRODUCTION',				'Amount',		2),
	-- ('STABLE_ADD_RESOURCE_PRODUCTION', 			'YieldType',	'YIELD_PRODUCTION'),
	-- ('STABLE_ADD_RESOURCE_PRODUCTION', 			'Amount', 		1),
	('ARMORY_ADD_RESOURCE_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('ARMORY_ADD_RESOURCE_PRODUCTION',				'Amount', 		1),
	('FACTORY_ADD_RESOURCE_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('FACTORY_ADD_RESOURCE_PRODUCTION',				'Amount', 		1),
	('MILITARY_ACADEMY_ADD_RESOURCE_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('MILITARY_ACADEMY_ADD_RESOURCE_PRODUCTION',	'Amount',		1),
	('HYDROELECTRIC_DAM_ADD_RIVER_PRODUCTION',		'YieldType',	'YIELD_PRODUCTION'),
	('HYDROELECTRIC_DAM_ADD_RIVER_PRODUCTION',		'Amount',		1),
	-- 
	('WORKSHOP_ADD_MINE_QUARRY_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
	('WORKSHOP_ADD_MINE_QUARRY_PRODUCTION',			'Amount',		1),
	-- enhence trained units
	('BARRACKS_TRAINED_STRENGTH_MODIFIER',			'AbilityType',	'ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH'),
	('BASILIKOI_TRAINED_STRENGTH_MODIFIER',			'AbilityType',	'ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH'),
	('STABLE_TRAINED_STRENGTH_MODIFIER',			'AbilityType',	'ABILITY_STABLE_TRAINED_UNIT_STRENGTH'),
	('ORDU_TRAINED_STRENGTH_MODIFIER',				'AbilityType',	'ABILITY_ORDU_TRAINED_UNIT_STRENGTH');

-- EFFECT_ADJUST_UNIT_COMBAT_STRENGTH
-- EFFECT_ADJUST_ATTACKER_STRENGTH_MODIFIER
-- EFFECT_ADJUST_DEFENDER_STRENGTH_MODIFIER

-- District building cost updates
-- Campus
update Buildings set Cost = 500 where BuildingType = 'BUILDING_RESEARCH_LAB';
-- Commercial hub
update Buildings set Cost = 250 where BuildingType = 'BUILDING_BANK';
update Buildings set Cost = 200 where BuildingType = 'BUILDING_GRAND_BAZAAR';
update Buildings set Cost = 500 where BuildingType = 'BUILDING_STOCK_EXCHANGE';
-- Theater
update Buildings set Cost = 500 where BuildingType = 'BUILDING_BROADCAST_CENTER';
-- Industrial Zone
update Buildings set Cost = 175 where BuildingType = 'BUILDING_WORKSHOP';
update Buildings set Cost = 300 where BuildingType = 'BUILDING_FACTORY';
update Buildings set Cost = 360 where BuildingType = 'BUILDING_COAL_POWER_PLANT';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT';
update Buildings set Cost = 500 where BuildingType = 'BUILDING_POWER_PLANT';

-- percentage boost, 5%, 10%, 10% + 10% (extra 10% with powered), 15% for religous buildings
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	-- Campus
	('BUILDING_LIBRARY',					'LIBRARY_SCIENCE_PERCENTAGE_BOOST'),
	('BUILDING_UNIVERSITY',					'UNIVERSITY_SCIENCE_PERCENTAGE_BOOST'),
	('BUILDING_MADRASA',					'UNIVERSITY_SCIENCE_PERCENTAGE_BOOST'),
	('BUILDING_RESEARCH_LAB',				'RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST'),
	('BUILDING_RESEARCH_LAB',				'POWERED_RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST'),
	-- Theater
	('BUILDING_AMPHITHEATER',				'AMPHITHEATER_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_MARAE',						'AMPHITHEATER_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_MUSEUM_ART',					'MUSEUM_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_MUSEUM_ARTIFACT',			'MUSEUM_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_BROADCAST_CENTER',			'BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_BROADCAST_CENTER',			'POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_FILM_STUDIO',				'BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_FILM_STUDIO',				'POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST'),
	-- Commercial hub
	('BUILDING_MARKET',						'MARKET_GOLD_PERCENTAGE_BOOST'),
	('BUILDING_SUKIENNICE',					'MARKET_GOLD_PERCENTAGE_BOOST'),
	('BUILDING_BANK',						'BANK_GOLD_PERCENTAGE_BOOST'),
	('BUILDING_GRAND_BAZAAR',				'BANK_GOLD_PERCENTAGE_BOOST'),
	('BUILDING_STOCK_EXCHANGE',				'STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST'),
	('BUILDING_STOCK_EXCHANGE',				'POWERED_STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST'),
	-- Holy site
	('BUILDING_SHRINE',						'SHRINE_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_TEMPLE',						'TEMPLE_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_STAVE_CHURCH',				'TEMPLE_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_PRASAT',						'TEMPLE_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_CATHEDRAL',					'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_GURDWARA',					'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_MEETING_HOUSE',				'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_MOSQUE',						'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_PAGODA',						'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_SYNAGOGUE',					'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_WAT',						'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_STUPA',						'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_DAR_E_MEHR',					'RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST'),
	-- Industrial Zone
	('BUILDING_WORKSHOP',					'WORKSHOP_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_WORKSHOP',					'WORKSHOP_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_FACTORY',					'FACTORY_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_FACTORY',					'FACTORY_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_ELECTRONICS_FACTORY',		'FACTORY_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_ELECTRONICS_FACTORY',		'FACTORY_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_POWER_PLANT',				'POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_POWER_PLANT',				'POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_COAL_POWER_PLANT',			'POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_COAL_POWER_PLANT',			'POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_FOSSIL_FUEL_POWER_PLANT',	'POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST');

insert or replace into Modifiers
	(ModifierId,											ModifierType)
values
	('LIBRARY_SCIENCE_PERCENTAGE_BOOST', 					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('UNIVERSITY_SCIENCE_PERCENTAGE_BOOST', 				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST', 				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	-- 
	('AMPHITHEATER_CULTURE_PERCENTAGE_BOOST', 				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('MUSEUM_CULTURE_PERCENTAGE_BOOST', 					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST', 			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	-- 
	('MARKET_GOLD_PERCENTAGE_BOOST', 						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('BANK_GOLD_PERCENTAGE_BOOST', 							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST', 				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	-- 
	('SHRINE_FAITH_PERCENTAGE_BOOST', 						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('TEMPLE_FAITH_PERCENTAGE_BOOST', 						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST', 			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'), -- 15%
	-- 
	('WORKSHOP_BUILDING_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_MODIFIER'),
	('WORKSHOP_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER'),
	('FACTORY_BUILDING_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_MODIFIER'),
	('FACTORY_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER'),
	('POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST',	'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_MODIFIER'), -- 20%
	('POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',	'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER'); -- 20%

insert or replace into Modifiers
	(ModifierId, 											ModifierType,									SubjectRequirementSetId)
values
	-- powered
	('POWERED_RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 'CITY_IS_POWERED'),
	('POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 'CITY_IS_POWERED'),
	('POWERED_STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER', 'CITY_IS_POWERED');


insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	-- Percentage boost
	('LIBRARY_SCIENCE_PERCENTAGE_BOOST',					'YieldType',	'YIELD_SCIENCE'),
	('LIBRARY_SCIENCE_PERCENTAGE_BOOST',					'Amount',		5),
	('UNIVERSITY_SCIENCE_PERCENTAGE_BOOST',					'YieldType',	'YIELD_SCIENCE'),
	('UNIVERSITY_SCIENCE_PERCENTAGE_BOOST',					'Amount',		10),
	('RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',				'YieldType',	'YIELD_SCIENCE'),
	('RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',				'Amount',		10),
	-- 
	('AMPHITHEATER_CULTURE_PERCENTAGE_BOOST',				'YieldType',	'YIELD_CULTURE'),
	('AMPHITHEATER_CULTURE_PERCENTAGE_BOOST',				'Amount',		5),
	('MUSEUM_CULTURE_PERCENTAGE_BOOST',						'YieldType',	'YIELD_CULTURE'),
	('MUSEUM_CULTURE_PERCENTAGE_BOOST',						'Amount',		10),
	('BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',			'YieldType',	'YIELD_CULTURE'),
	('BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',			'Amount',		10),
	-- 
	('MARKET_GOLD_PERCENTAGE_BOOST',						'YieldType',	'YIELD_GOLD'),
	('MARKET_GOLD_PERCENTAGE_BOOST',						'Amount',		5),
	('BANK_GOLD_PERCENTAGE_BOOST',							'YieldType',	'YIELD_GOLD'),
	('BANK_GOLD_PERCENTAGE_BOOST',							'Amount',		10),
	('STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',				'YieldType',	'YIELD_GOLD'),
	('STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',				'Amount',		10),
	-- 
	('SHRINE_FAITH_PERCENTAGE_BOOST',						'YieldType',	'YIELD_FAITH'),
	('SHRINE_FAITH_PERCENTAGE_BOOST',						'Amount',		5),
	('TEMPLE_FAITH_PERCENTAGE_BOOST',						'YieldType',	'YIELD_FAITH'),
	('TEMPLE_FAITH_PERCENTAGE_BOOST',						'Amount',		10),
	('RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST',			'YieldType',	'YIELD_FAITH'),
	('RELIGIOUS_BUILDING_FAITH_PERCENTAGE_BOOST',			'Amount',		15),
	-- 
	('WORKSHOP_BUILDING_PRODUCTION_PERCENTAGE_BOOST',		'Amount',		5),
	('WORKSHOP_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',		'Amount',		5),
	('FACTORY_BUILDING_PRODUCTION_PERCENTAGE_BOOST',		'Amount',		10),
	('FACTORY_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',		'Amount',		10),
	('POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST',	'Amount',		20),
	('POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',	'Amount',		20),
	-- powered
	('POWERED_RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',		'YieldType',	'YIELD_SCIENCE'),
	('POWERED_RESEARCH_LAB_SCIENCE_PERCENTAGE_BOOST',		'Amount',		10),
	('POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',	'YieldType',	'YIELD_CULTURE'),
	('POWERED_BROADCAST_CENTER_CULTURE_PERCENTAGE_BOOST',	'Amount',		10),
	('POWERED_STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',		'YieldType',	'YIELD_GOLD'),
	('POWERED_STOCK_EXCHANGE_GOLD_PERCENTAGE_BOOST',		'Amount',		10);

-- Maintainance
update Buildings set Maintenance = Maintenance * 2 where IsWonder = 0;
-- update Buildings set Maintenance = 0	where BuildingType = 'BUILDING_MONUMENT';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_GRANARY';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_WATER_MILL';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_PALGUM';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_WALLS';
-- update Buildings set Maintenance = 3	where BuildingType = 'BUILDING_CASTLE';
-- update Buildings set Maintenance = 5	where BuildingType = 'BUILDING_STAR_FORT';
-- update Buildings set Maintenance = 5	where BuildingType = 'BUILDING_TSIKHE';
-- update Buildings set Maintenance = 6	where BuildingType = 'BUILDING_SEWER';

-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_LIBRARY';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_UNIVERSITY';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_MADRASA';
-- update Buildings set Maintenance = 10	where BuildingType = 'BUILDING_RESEARCH_LAB';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_MARKET';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_SUKIENNICE';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_BANK';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_GRAND_BAZAAR';
-- update Buildings set Maintenance = 8	where BuildingType = 'BUILDING_STOCK_EXCHANGE';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_LIGHTHOUSE';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_SHIPYARD';
-- update Buildings set Maintenance = 10	where BuildingType = 'BUILDING_SEAPORT';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_BARRACKS';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_STABLE';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_BASILIKOI_PAIDES';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_ORDU';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_ARMORY';
-- update Buildings set Maintenance = 7	where BuildingType = 'BUILDING_MILITARY_ACADEMY';
-- update Buildings set Maintenance = 3	where BuildingType = 'BUILDING_WORKSHOP';
-- update Buildings set Maintenance = 7	where BuildingType = 'BUILDING_FACTORY';
-- update Buildings set Maintenance = 7	where BuildingType = 'BUILDING_ELECTRONICS_FACTORY';
-- update Buildings set Maintenance = 10	where BuildingType = 'BUILDING_COAL_POWER_PLANT';
-- update Buildings set Maintenance = 10	where BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT';
-- update Buildings set Maintenance = 10	where BuildingType = 'BUILDING_POWER_PLANT';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_SHRINE';
-- update Buildings set Maintenance = 2	where BuildingType = 'BUILDING_TEMPLE';
-- update Buildings set Maintenance = 2	where BuildingType = 'BUILDING_STAVE_CHURCH';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_CATHEDRAL';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_GURDWARA';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_MEETING_HOUSE';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_MOSQUE';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_PAGODA';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_SYNAGOGUE';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_WAT';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_STUPA';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_DAR_E_MEHR';
-- update Buildings set Maintenance = 2	where BuildingType = 'BUILDING_PRASAT';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_AMPHITHEATER';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_MARAE';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_MUSEUM_ART';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_MUSEUM_ARTIFACT';
-- update Buildings set Maintenance = 10	where BuildingType = 'BUILDING_BROADCAST_CENTER';
-- update Buildings set Maintenance = 10	where BuildingType = 'BUILDING_FILM_STUDIO';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_ARENA';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_TLACHTLI';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_ZOO';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_THERMAL_BATH';
-- update Buildings set Maintenance = 12	where BuildingType = 'BUILDING_STADIUM';
-- update Buildings set Maintenance = 5	where BuildingType = 'BUILDING_FERRIS_WHEEL';
-- update Buildings set Maintenance = 8	where BuildingType = 'BUILDING_AQUARIUM';
-- update Buildings set Maintenance = 12	where BuildingType = 'BUILDING_AQUATICS_CENTER';

-- update Buildings set Maintenance = 8	where BuildingType = 'BUILDING_HANGAR';
-- update Buildings set Maintenance = 12	where BuildingType = 'BUILDING_AIRPORT';
-- update Buildings set Maintenance = 6	where BuildingType = 'BUILDING_HYDROELECTRIC_DAM';
-- update Buildings set Maintenance = 2	where BuildingType = 'BUILDING_CONSULATE';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_CHANCERY';
-- update Buildings set Maintenance = 8	where BuildingType = 'BUILDING_FOOD_MARKET';
-- update Buildings set Maintenance = 10	where BuildingType = 'BUILDING_SHOPPING_MALL';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_GOV_TALL';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_GOV_WIDE';
-- update Buildings set Maintenance = 1	where BuildingType = 'BUILDING_GOV_CONQUEST';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_GOV_CITYSTATES';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_GOV_SPIES';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_GOV_FAITH';
-- update Buildings set Maintenance = 4	where BuildingType = 'BUILDING_QUEENS_BIBLIOTHEQUE';
-- update Buildings set Maintenance = 8	where BuildingType = 'BUILDING_GOV_MILITARY';
-- update Buildings set Maintenance = 8	where BuildingType = 'BUILDING_GOV_CULTURE';
-- update Buildings set Maintenance = 8	where BuildingType = 'BUILDING_GOV_SCIENCE';
