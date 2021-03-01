-------------------------------------
--      Districts Adjustments      --
-------------------------------------

-- Add citizen great person points yields (NOTE: 1 represents 2 points).
insert into District_CitizenGreatPersonPoints
	(DistrictType,						GreatPersonClassType,				PointsPerTurn)
values
	("DISTRICT_CAMPUS",					"GREAT_PERSON_CLASS_SCIENTIST",		2),
	("DISTRICT_OBSERVATORY",			"GREAT_PERSON_CLASS_SCIENTIST",		2),
	("DISTRICT_SEOWON",					"GREAT_PERSON_CLASS_SCIENTIST",		2),
	("DISTRICT_COMMERCIAL_HUB",			"GREAT_PERSON_CLASS_MERCHANT",		2),
	("DISTRICT_SUGUBA",					"GREAT_PERSON_CLASS_MERCHANT",		2),
	("DISTRICT_ENCAMPMENT",				"GREAT_PERSON_CLASS_GENERAL",		2),
	("DISTRICT_THANH",					"GREAT_PERSON_CLASS_GENERAL",		2),
	("DISTRICT_IKANDA",					"GREAT_PERSON_CLASS_GENERAL",		2),
	("DISTRICT_HARBOR",					"GREAT_PERSON_CLASS_ADMIRAL",		2),
	("DISTRICT_COTHON",					"GREAT_PERSON_CLASS_ADMIRAL",		2),
	("DISTRICT_ROYAL_NAVY_DOCKYARD",	"GREAT_PERSON_CLASS_ADMIRAL",		2),
	("DISTRICT_HOLY_SITE",				"GREAT_PERSON_CLASS_PROPHET",		2),
	("DISTRICT_LAVRA",					"GREAT_PERSON_CLASS_PROPHET",		2),
	("DISTRICT_INDUSTRIAL_ZONE",		"GREAT_PERSON_CLASS_ENGINEER",		2),
	("DISTRICT_HANSA",					"GREAT_PERSON_CLASS_ENGINEER",		2),
	("DISTRICT_OPPIDUM",				"GREAT_PERSON_CLASS_ENGINEER",		2),
	("DISTRICT_THEATER",				"GREAT_PERSON_CLASS_WRITER",		2),
	("DISTRICT_THEATER",				"GREAT_PERSON_CLASS_ARTIST",		2),
	("DISTRICT_THEATER",				"GREAT_PERSON_CLASS_MUSICIAN",		2),
	("DISTRICT_ACROPOLIS",				"GREAT_PERSON_CLASS_WRITER",		2),
	("DISTRICT_ACROPOLIS",				"GREAT_PERSON_CLASS_ARTIST",		2),
	("DISTRICT_ACROPOLIS",				"GREAT_PERSON_CLASS_MUSICIAN",		2);

-- increase citizen slot for districts, remove the great person point.
update Districts set CitizenSlots = 1
 where DistrictType = 'DISTRICT_CAMPUS'
 	or DistrictType = 'DISTRICT_OBSERVATORY'
 	or DistrictType = 'DISTRICT_SEOWON'
 	or DistrictType = 'DISTRICT_COMMERCIAL_HUB'
 	or DistrictType = 'DISTRICT_SUGUBA'
 	or DistrictType = 'DISTRICT_ENCAMPMENT'
 	or DistrictType = 'DISTRICT_THANH'
 	or DistrictType = 'DISTRICT_IKANDA'
 	or DistrictType = 'DISTRICT_HARBOR'
 	or DistrictType = 'DISTRICT_COTHON'
 	or DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD'
 	or DistrictType = 'DISTRICT_HOLY_SITE'
 	or DistrictType = 'DISTRICT_LAVRA'
 	or DistrictType = 'DISTRICT_INDUSTRIAL_ZONE'
 	or DistrictType = 'DISTRICT_HANSA'
 	or DistrictType = 'DISTRICT_OPPIDUM'
 	or DistrictType = 'DISTRICT_THEATER'
 	or DistrictType = 'DISTRICT_ACROPOLIS';

-- remove the great person points as they are moved to the citizen yield.
update District_GreatPersonPoints set PointsPerTurn = 1 where
	DistrictType != 'DISTRICT_LAVRA' and DistrictType != 'DISTRICT_HOLY_SITE' and DistrictType != 'DISTRICT_ROYAL_NAVY_DOCKYARD';
-- delete from District_GreatPersonPoints where
-- 	DistrictType != 'DISTRICT_LAVRA' and DistrictType != 'DISTRICT_HOLY_SITE' and DistrictType != 'DISTRICT_ROYAL_NAVY_DOCKYARD';
-- update District_GreatPersonPoints set PointsPerTurn = 2
-- 	where DistrictType = 'DISTRICT_LAVRA' and GreatPersonClassType = 'GREAT_PERSON_CLASS_PROPHET';
update District_GreatPersonPoints set PointsPerTurn = 3
	where DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD' and GreatPersonClassType = 'GREAT_PERSON_CLASS_ADMIRAL';

update District_CitizenYieldChanges set YieldChange = 3 where DistrictType = 'DISTRICT_HOLY_SITE' or DistrictType = 'DISTRICT_LAVRA';

-- Happiness adjust
update Districts set Entertainment = 3 where DistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX';
update Districts set Entertainment = 4 where DistrictType = 'DISTRICT_STREET_CARNIVAL';
update Districts set Entertainment = 4 where DistrictType = 'DISTRICT_HIPPODROME';

update Districts set Entertainment = 3 where DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
update Districts set Entertainment = 4 where DistrictType = 'DISTRICT_WATER_STREET_CARNIVAL';

-- Unlock
update Districts set PrereqTech = 'TECH_SAILING' where
	DistrictType = 'DISTRICT_HARBOR' or DistrictType = 'DISTRICT_COTHON' or DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD';
-- Industrial Zone
update Districts set PrereqTech = 'TECH_IRON_WORKING' where
	DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' or DistrictType = 'DISTRICT_HANSA';
-- WATER_ENTERTAINMENT_COMPLEX
update Districts set PrereqCivic = 'CIVIC_CIVIL_ENGINEERING' where
	DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX' or DistrictType = 'DISTRICT_WATER_STREET_CARNIVAL';

update Districts set RequiresPopulation = 0 where DistrictType = 'DISTRICT_AERODROME';
-- Housing
-- update Districts set Housing = Housing + 1 where RequiresPopulation = 1;
update Districts set Housing = Housing + 1 where
	DistrictType = 'DISTRICT_HARBOR' or DistrictType = 'DISTRICT_COTHON' or DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD';

-- Commercial hub & habor trade route -- Removed
-- habor gives +25% production towards naval units. (cothon still gives 50% production)
-- Encampment gives +20% production towards land military units.
insert into DistrictModifiers
	(DistrictType,						ModifierId)
values
	-- Yield Modifiers
	('DISTRICT_HARBOR',					'HARBOR_ADD_FISHING_BOATS_FOOD'),
	('DISTRICT_COTHON',					'HARBOR_ADD_FISHING_BOATS_FOOD'),
	('DISTRICT_ROYAL_NAVY_DOCKYARD',	'HARBOR_ADD_FISHING_BOATS_FOOD'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_ADD_STONE_PRODUCTION'),
	('DISTRICT_IKANDA',					'ENCAMPMENT_ADD_STONE_PRODUCTION'),
	('DISTRICT_THANH',					'ENCAMPMENT_ADD_STONE_PRODUCTION'),
	-- ('DISTRICT_COMMERCIAL_HUB',		'COMMERCIAL_HUB_TRADE_ROUTE_CAPACITY'),
	-- ('DISTRICT_SUGUBA',				'COMMERCIAL_HUB_TRADE_ROUTE_CAPACITY'),
	-- ('DISTRICT_HARBOR',				'HARBOR_TRADE_ROUTE_CAPACITY'),
	-- ('DISTRICT_COTHON',				'HARBOR_TRADE_ROUTE_CAPACITY'),
	-- ('DISTRICT_ROYAL_NAVY_DOCKYARD',	'HARBOR_TRADE_ROUTE_CAPACITY'),
	('DISTRICT_HARBOR',					'HARBOR_CITY_NAVAL_UNIT_PRODUCTION'),
	('DISTRICT_ROYAL_NAVY_DOCKYARD',	'HARBOR_CITY_NAVAL_UNIT_PRODUCTION'),
	-- 
	('DISTRICT_HANSA',					'HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION'),
	-- 
	('DISTRICT_AERODROME',				'AERODROME_AIR_UNIT_PRODUCTION'),
	-- 
	('DISTRICT_AQUEDUCT',				'AQUEDUCT_ADD_FRESH_FARM_FOOD'),
	('DISTRICT_AQUEDUCT',				'AQUEDUCT_ADD_AQUEDUCT_FARM_FOOD'),
	('DISTRICT_AQUEDUCT',				'AQUEDUCT_REMOVE_FRESH_AND_AQUEDUCT_FARM_FOOD'),
	('DISTRICT_BATH',					'AQUEDUCT_ADD_FRESH_FARM_FOOD'),
	('DISTRICT_BATH',					'AQUEDUCT_ADD_AQUEDUCT_FARM_FOOD'),
	('DISTRICT_BATH',					'AQUEDUCT_REMOVE_FRESH_AND_AQUEDUCT_FARM_FOOD'),
	-- ('DISTRICT_AQUEDUCT',			'AQUEDUCT_ADD_RIVER_FARM_FOOD'),
	('DISTRICT_MBANZA',					'MBANZA_ADD_ADJACENT_JUNGLE_FOOD'),
	('DISTRICT_MBANZA',					'MBANZA_ADD_ADJACENT_FOREST_FOOD'),
	-- Mbanza enable purchase of builder and settler as Kongo cannot build holy site.
	('DISTRICT_MBANZA',					'SHRINE_BUILDER_PURCHASE'),
	('DISTRICT_MBANZA',					'TEMPLE_SETTLER_PURCHASE'),
	-- Encampment
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION'),
	('DISTRICT_THANH',					'ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION'),
	('DISTRICT_THANH',					'ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION'),
	('DISTRICT_IKANDA',					'IKANDA_CITY_MILITARY_UNIT_PRODUCTION'),
	('DISTRICT_IKANDA',					'IKANDA_CITY_NAVAL_UNIT_PRODUCTION'),
	('DISTRICT_DIPLOMATIC_QUARTER',		'DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY');

insert into Modifiers
	(ModifierId,									ModifierType)
values
	-- ('COMMERCIAL_HUB_TRADE_ROUTE_CAPACITY',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY'), 
	-- ('HARBOR_TRADE_ROUTE_CAPACITY',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY'),
	('HARBOR_CITY_NAVAL_UNIT_PRODUCTION',			'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	('AERODROME_AIR_UNIT_PRODUCTION',				'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	-- Encampment
	('ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION',	'MODIFIER_SINGLE_CITY_ADJUST_MILITARY_UNITS_PRODUCTION'),
	('ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION',		'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	('IKANDA_CITY_MILITARY_UNIT_PRODUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_MILITARY_UNITS_PRODUCTION'),
	('IKANDA_CITY_NAVAL_UNIT_PRODUCTION',			'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	('DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY',		'MODIFIER_PLAYER_GRANT_SPY');

insert into Modifiers
	(ModifierId,										ModifierType,									SubjectRequirementSetId)
values
	-- Yield Modifiers
	('HARBOR_ADD_FISHING_BOATS_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
	('ENCAMPMENT_ADD_STONE_PRODUCTION',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_STONE'),
	-- Aqueduct
	-- ('AQUEDUCT_ADD_RIVER_FARM_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'IS_FARM_ADJACENT_TO_RIVER');
	('AQUEDUCT_ADD_FRESH_FARM_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'IS_FARM_ADJACENT_TO_FRESH_WATER'),
	('AQUEDUCT_ADD_AQUEDUCT_FARM_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'IS_FARM_ADJACENT_TO_AQUEDUCT'),
	('AQUEDUCT_REMOVE_FRESH_AND_AQUEDUCT_FARM_FOOD',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'IS_FARM_ADJACENT_TO_FRESH_WATER_AND_AQUEDUCT'),
	-- 
	('HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'HANSA_ADJACENT_PRODUCTION_RESOURCE_REQUIREMENTS'),
	-- Mbanza
	('MBANZA_ADD_ADJACENT_JUNGLE_FOOD',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'MBANZA_ADJACENCY_FOOD_JUNGLE_REQUIREMENTS'),
	('MBANZA_ADD_ADJACENT_FOREST_FOOD',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'MBANZA_ADJACENCY_FOOD_FOREST_REQUIREMENTS');

insert into ModifierArguments
	(ModifierId,										Name,			Value)
values
	-- Yield Modifiers
	('HARBOR_ADD_FISHING_BOATS_FOOD',					'YieldType',	'YIELD_FOOD'),
	('HARBOR_ADD_FISHING_BOATS_FOOD',					'Amount',		1),
	('ENCAMPMENT_ADD_STONE_PRODUCTION',					'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_STONE_PRODUCTION',					'Amount',		1),
	-- Aqueduct
	-- ('AQUEDUCT_ADD_RIVER_FARM_FOOD',					'YieldType',	'YIELD_FOOD'),
	-- ('AQUEDUCT_ADD_RIVER_FARM_FOOD',					'Amount',		1),
	('AQUEDUCT_ADD_FRESH_FARM_FOOD',					'YieldType',	'YIELD_FOOD'),
	('AQUEDUCT_ADD_FRESH_FARM_FOOD',					'Amount',		1),
	('AQUEDUCT_ADD_AQUEDUCT_FARM_FOOD',					'YieldType',	'YIELD_FOOD'),
	('AQUEDUCT_ADD_AQUEDUCT_FARM_FOOD',					'Amount',		1),
	('AQUEDUCT_REMOVE_FRESH_AND_AQUEDUCT_FARM_FOOD',	'YieldType',	'YIELD_FOOD'),
	('AQUEDUCT_REMOVE_FRESH_AND_AQUEDUCT_FARM_FOOD',	'Amount',		-1),
	-- 
	('HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
	('HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION',			'Amount',		1),
	-- 
	('MBANZA_ADD_ADJACENT_JUNGLE_FOOD',					'YieldType',	'YIELD_FOOD'),
	('MBANZA_ADD_ADJACENT_JUNGLE_FOOD',					'Amount',		1),
	('MBANZA_ADD_ADJACENT_FOREST_FOOD',					'YieldType',	'YIELD_FOOD'),
	('MBANZA_ADD_ADJACENT_FOREST_FOOD',					'Amount',		1),
	-- ('COMMERCIAL_HUB_TRADE_ROUTE_CAPACITY',			'Amount',		1),
	-- ('HARBOR_TRADE_ROUTE_CAPACITY',					'Amount',		1),
	-- Military
	('HARBOR_CITY_NAVAL_UNIT_PRODUCTION',				'Domain',		'DOMAIN_SEA'),
	('HARBOR_CITY_NAVAL_UNIT_PRODUCTION',				'Amount',		25),
	('AERODROME_AIR_UNIT_PRODUCTION',					'Domain',		'DOMAIN_AIR'),
	('AERODROME_AIR_UNIT_PRODUCTION',					'Amount',		25),
	('ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION',		'Amount',		15),
	('ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION',			'Domain',		'DOMAIN_SEA'),
	('ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION',			'Amount',		-15),
	('IKANDA_CITY_MILITARY_UNIT_PRODUCTION',			'Amount',		30),
	('IKANDA_CITY_NAVAL_UNIT_PRODUCTION',				'Domain',		'DOMAIN_SEA'),
	('IKANDA_CITY_NAVAL_UNIT_PRODUCTION',				'Amount',		-30),
	('DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY',			'Amount',		1);

update ModifierArguments set Value = 3 where ModifierId = 'MBANZA_FOOD' and Name = 'Amount';
update ModifierArguments set Value = 5 where ModifierId = 'MBANZA_GOLD' and Name = 'Amount';

-- update Districts set Maintenance = Maintenance * 2 where InternalOnly = 0;
update Districts set Maintenance = 50 where DistrictType = 'DISTRICT_SPACEPORT';

update Districts set Appeal = 2 where DistrictType = 'DISTRICT_PRESERVE';