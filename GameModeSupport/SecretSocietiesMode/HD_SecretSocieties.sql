-------------------------------------
--  Secret Societies Adjustments   --
-------------------------------------
/*insert or replace into BeliefModifiers
	(BeliefType,							ModifierID)
values
    ('BELIEF_MONUMENT_TO_THE_GODS',			'MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_CULTURE'),
	('BELIEF_MONUMENT_TO_THE_GODS',			'MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_FAITH_PURCHASE'),
	('BELIEF_MONUMENT_TO_THE_GODS',			'MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PURCHASE_DISCOUNT'),
	('BELIEF_MONUMENT_TO_THE_GODS',			'MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PRODUCTION');


insert or replace into Modifiers
	(ModifierId,													    ModifierType,										SubjectRequirementSetId)
values
    ('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_CULTURE',					'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_CULTURE_MODIFIER',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'CITY_HAS_BUILDING_OLD_GOD_OBELISK'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_FAITH_PURCHASE',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_FAITH_PURCHASE_MODIFIER',	'MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE', NULL),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PURCHASE_DISCOUNT',			'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PURCHASE_DISCOUNT_MODIFIER',	'MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST',		NULL),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PRODUCTION',					'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PRODUCTION_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION',	NULL);


insert or replace into ModifierArguments
	(ModifierId,													        Name,					Value)
values
    ('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_CULTURE',						'ModifierId',			'MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_CULTURE_MODIFIER'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_CULTURE_MODIFIER',				'YieldType',			'YIELD_CULTURE'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_CULTURE_MODIFIER',				'Amount',				10),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_FAITH_PURCHASE',				    'ModifierId',			'MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_FAITH_PURCHASE_MODIFIER'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_FAITH_PURCHASE_MODIFIER',		'BuildingType',			'BUILDING_OLD_GOD_OBELISK'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PURCHASE_DISCOUNT',				'ModifierId',			'MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PURCHASE_DISCOUNT_MODIFIER'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PURCHASE_DISCOUNT_MODIFIER',	    'BuildingType',			'BUILDING_OLD_GOD_OBELISK'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PURCHASE_DISCOUNT_MODIFIER',	    'Amount',				20),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PRODUCTION',					    'ModifierId',			'MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PRODUCTION_MODIFIER'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PRODUCTION_MODIFIER',			'BuildingType',			'BUILDING_OLD_GOD_OBELISK'),
	('MONUMENT_TO_THE_GODS_OLD_GOD_OBELISK_PRODUCTION_MODIFIER',			'Amount',				50);*/

insert or replace into Building_CitizenYieldChanges
	(BuildingType,							YieldType,			YieldChange)
values
	('BUILDING_ALCHEMICAL_SOCIETY',			'YIELD_SCIENCE',	1),
	('BUILDING_ALCHEMICAL_SOCIETY',			'YIELD_GOLD',		-1),
	('BUILDING_GILDED_VAULT',				'YIELD_GOLD',		2);

update Buildings set RegionalRange = 3, Maintenance = 4, Cost = 250 where BuildingType = 'BUILDING_ALCHEMICAL_SOCIETY';
update Buildings set RegionalRange = 6, Maintenance = 4, Cost = 220 where BuildingType = 'BUILDING_GILDED_VAULT';

insert or replace into Building_YieldChanges
	(BuildingType,							YieldType,			YieldChange)
values
	('BUILDING_ALCHEMICAL_SOCIETY',			'YIELD_SCIENCE',	4),
	('BUILDING_ALCHEMICAL_SOCIETY',			'YIELD_PRODUCTION',	2),
	('BUILDING_GILDED_VAULT',				'YIELD_GOLD',		8);

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('BUILDING_ALCHEMICAL_SOCIETY',			'UNIVERSITY_SCIENCE_PERCENTAGE_BOOST'),
	('BUILDING_ALCHEMICAL_SOCIETY',			'UNIVERSITY_ADD_RAINFOREST_ADJACENCY'),
	('BUILDING_ALCHEMICAL_SOCIETY',			'UNIVERSITY_ADD_ADJACENT_RAINFOREST_SCIENCE'),
	('BUILDING_GILDED_VAULT',				'BANK_GOLD_PERCENTAGE_BOOST');