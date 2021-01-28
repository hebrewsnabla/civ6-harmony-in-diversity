-------------------------------------
--  Temporary update database sql  --
-------------------------------------


delete from GovernmentModifiers where GovernmentType = 'GOVERNMENT_MONARCHY' and ModifierId = 'MONARCHY_WALLS_HOUSING';
delete from GovernmentModifiers where GovernmentType = 'GOVERNMENT_MONARCHY' and ModifierId = 'MONARCHY_CASTLE_HOUSING';
delete from GovernmentModifiers where GovernmentType = 'GOVERNMENT_MONARCHY' and ModifierId = 'MONARCHY_STARFORT_HOUSING';

delete from PolicyModifiers where PolicyType = 'POLICY_GOV_MONARCHY' and ModifierId = 'MONARCHY_WALLS_HOUSING';
delete from PolicyModifiers where PolicyType = 'POLICY_GOV_MONARCHY' and ModifierId = 'MONARCHY_CASTLE_HOUSING';
delete from PolicyModifiers where PolicyType = 'POLICY_GOV_MONARCHY' and ModifierId = 'MONARCHY_STARFORT_HOUSING';

insert or replace into GovernmentModifiers
	(GovernmentType,						ModifierId)
values
	('GOVERNMENT_MONARCHY',					'MONARCHY_CITYGROWTH_BONUS'),
	('GOVERNMENT_MONARCHY',					'MONARCHY_UNITPRODUCTION_BONUS'),
	('GOVERNMENT_MONARCHY',					'MONARCHY_GOLD_BONUS');

insert or replace into PolicyModifiers
	(PolicyType,							ModifierId)
values
	('POLICY_GOV_MONARCHY',					'MONARCHY_CITYGROWTH_BONUS'),
	('POLICY_GOV_MONARCHY',					'MONARCHY_UNITPRODUCTION_BONUS'),
	('POLICY_GOV_MONARCHY',					'MONARCHY_GOLD_BONUS');

insert or replace into Modifiers
	(ModifierId,							ModifierType,												SubjectRequirementSetId)
values
	('MONARCHY_CITYGROWTH_BONUS',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH',				'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
	('MONARCHY_UNITPRODUCTION_BONUS',		'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PRODUCTION_MODIFIER',	'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
	('MONARCHY_GOLD_BONUS',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'CITY_HAS_GARRISON_UNIT_REQUIERMENT');

insert or replace into ModifierArguments
	(ModifierId,							Name,														Value)
values
	('MONARCHY_CITYGROWTH_BONUS',			'Amount',													10),
	('MONARCHY_UNITPRODUCTION_BONUS',		'Amount',													20),
	('MONARCHY_GOLD_BONUS',					'YieldType',												'YIELD_GOLD'),
	('MONARCHY_GOLD_BONUS',					'Amount',													10);
