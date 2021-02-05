-------------------------------------
-- Major Civilizations Adjustments --
-------------------------------------

insert or replace into TraitModifiers (TraitType,	ModifierId) values
	-- ('TRAIT_LEADER_MAJOR_CIV',						'DEITY_HUMAN_STARTING_MONEY'),
	('TRAIT_LEADER_MAJOR_CIV',						'DEITY_HUMAN_CITY_MAINTENANCE'),
	('TRAIT_LEADER_MAJOR_CIV',						'DEITY_HUMAN_POPULATION_MAINTENANCE');

insert or replace into Modifiers (ModifierId,		ModifierType,												OwnerRequirementSetId) values
	-- ('DEITY_HUMAN_STARTING_MONEY',					'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE',						'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN_AND_HAS_CITY'),
	('DEITY_HUMAN_CITY_MAINTENANCE',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN'),
	('DEITY_HUMAN_POPULATION_MAINTENANCE',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN');

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	-- ('DEITY_HUMAN_STARTING_MONEY',					'YieldType',	'YIELD_GOLD'),
	-- ('DEITY_HUMAN_STARTING_MONEY',					'Amount',		6),
	('DEITY_HUMAN_CITY_MAINTENANCE',				'YieldType',	'YIELD_GOLD'),
	('DEITY_HUMAN_CITY_MAINTENANCE',				'Amount',		-4),
	('DEITY_HUMAN_POPULATION_MAINTENANCE',			'YieldType',	'YIELD_GOLD'),
	('DEITY_HUMAN_POPULATION_MAINTENANCE',			'Amount',		-1);
