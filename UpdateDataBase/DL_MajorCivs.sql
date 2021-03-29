-------------------------------------
-- Major Civilizations Adjustments --
-------------------------------------

-- 所有文明赠送效果
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	-- ('TRAIT_LEADER_MAJOR_CIV',				'MACHIAVELLIANISM_OFFENSIVESPYTIME'),
	-- ('TRAIT_LEADER_MAJOR_CIV',				'TRAIT_FREE_ANCIENT_WALL_IN_CAPITAL'),
-- Wolin Ability for all.
	-- ('TRAIT_LEADER_MAJOR_CIV',				'MINOR_CIV_WOLIN_GREAT_GENERAL_INFLUENCE_BONUS_MODIFIER'),
	-- ('TRAIT_LEADER_MAJOR_CIV',				'MINOR_CIV_WOLIN_GREAT_ADMIRAL_INFLUENCE_BONUS_MODIFIER'),
-- 伟人赞助折扣
	('TRAIT_LEADER_MAJOR_CIV',				'TRAIT_PATRONAGE_DISCOUNT_FAITH_PERCENT'),
	('TRAIT_LEADER_MAJOR_CIV',				'TRAIT_PATRONAGE_DISCOUNT_GOLD_PERCENT'),
-- 贸易路线大使馆
	('TRAIT_LEADER_MAJOR_CIV',				'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS');
-- 贸易站鼓舞/尤里卡
	--('TRAIT_LEADER_MAJOR_CIV',				'TRAIT_TRADING_POST_CIVIC_BOOST'),
	--('TRAIT_LEADER_MAJOR_CIV',				'TRAIT_TRADING_POST_TECH_BOOST');

-- insert or replace into Modifiers
-- 	(ModifierId,								ModifierType,							RunOnce,	Permanent)
-- values
-- 	('TRAIT_FREE_ANCIENT_WALL_IN_CAPITAL',		'MODIFIER_GRANT_BUILDING_IN_CAPITAL',	0,			0);

insert or replace into Modifiers
	(ModifierId,								ModifierType)
values
	('TRAIT_PATRONAGE_DISCOUNT_FAITH_PERCENT',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_PATRONAGE_DISCOUNT_PERCENT'),
	('TRAIT_PATRONAGE_DISCOUNT_GOLD_PERCENT',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_PATRONAGE_DISCOUNT_PERCENT');

-- 因为伟人点整体提升过2倍，但赞助价格公式未找到修改途径，故提供整体-40%折扣，神谕的25%体现为-15%，文本不变。
insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	-- ('TRAIT_FREE_ANCIENT_WALL_IN_CAPITAL',		'BuildingType',	'BUILDING_WALLS'),
	('TRAIT_PATRONAGE_DISCOUNT_FAITH_PERCENT',	'YieldType',	'YIELD_FAITH'),
	('TRAIT_PATRONAGE_DISCOUNT_FAITH_PERCENT',	'Amount',		40),
	('TRAIT_PATRONAGE_DISCOUNT_GOLD_PERCENT',	'YieldType',	'YIELD_GOLD'),
	('TRAIT_PATRONAGE_DISCOUNT_GOLD_PERCENT',	'Amount',		40);
update ModifierArguments set Value = 15 where ModifierId = 'ORACLE_PATRONAGE_FAITH_DISCOUNT' and Name = 'Amount';

create table 'PopulationMaintenance'(
	'Pop' Int NOT NULL,
	'ImmortalMaintenance' TEXT NOT NULL,
	'DeityMaintenance' TEXT NOT NULL,
	PRIMARY KEY('Pop')
);

insert or replace into PopulationMaintenance
	(Pop,	ImmortalMaintenance,	DeityMaintenance)
values
	(1,		'0',					'0'),
	(2,		'0',					'0'),
	(3,		'0',					'0'),
	(4,		'0',					'0'),
	(5,		'0',					'0'),
	(6,		'0',					'-1'),
	(7,		'0',					'-1'),
	(8,		'0',					'-1'),
	(9,		'0',					'-1'),
	(10,	'0',					'-1'),
	(11,	'-1',					'-1'),
	(12,	'-1',					'-1'),
	(13,	'-1',					'-1'),
	(14,	'-1',					'-1'),
	(15,	'-1',					'-1'),
	(16,	'-1',					'-2'),
	(17,	'-1',					'-2'),
	(18,	'-1',					'-2'),
	(19,	'-1',					'-2'),
	(20,	'-1',					'-2'),
	(21,	'-2',					'-2'),
	(22,	'-2',					'-2'),
	(23,	'-2',					'-2'),
	(24,	'-2',					'-2'),
	(25,	'-2',					'-2'),
	(26,	'-2',					'-2'),
	(27,	'-2',					'-2'),
	(28,	'-2',					'-2'),
	(29,	'-2',					'-2'),
	(30,	'-2',					'-2'),
	(31,	'-2',					'-2');

insert or replace into TraitModifiers (TraitType, ModifierId)
	select 'TRAIT_LEADER_MAJOR_CIV', 'AT_LEAST_IMMORTAL_HUMAN_' || Pop || '_POPULATION_MAINTENANCE'
from PopulationMaintenance where Pop < 31;
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId)
	select 'AT_LEAST_IMMORTAL_HUMAN_' || Pop || '_POPULATION_MAINTENANCE', 'MODIFIER_PLAYER_CITIES_ADJUST_PLAYER_YIELD_CHANGE',
			'PLAYER_IS_AT_LEAST_IMMORTAL_DIFFICULTY_HUMAN', 'CITY_HAS_' || Pop || '_POPULATION'
from PopulationMaintenance where Pop < 31;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'AT_LEAST_IMMORTAL_HUMAN_' || Pop || '_POPULATION_MAINTENANCE', 'YieldType', 'YIELD_GOLD'
from PopulationMaintenance where Pop < 31;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'AT_LEAST_IMMORTAL_HUMAN_' || Pop || '_POPULATION_MAINTENANCE', 'Amount', ImmortalMaintenance
from PopulationMaintenance where Pop < 31;

insert or replace into TraitModifiers (TraitType, ModifierId)
	select 'TRAIT_LEADER_MAJOR_CIV', 'AT_LEAST_DEITY_HUMAN_' || Pop || '_POPULATION_MAINTENANCE'
from PopulationMaintenance where Pop < 31;
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId)
	select 'AT_LEAST_DEITY_HUMAN_' || Pop || '_POPULATION_MAINTENANCE', 'MODIFIER_PLAYER_CITIES_ADJUST_PLAYER_YIELD_CHANGE',
			'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN', 'CITY_HAS_' || Pop || '_POPULATION'
from PopulationMaintenance where Pop < 31;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'AT_LEAST_DEITY_HUMAN_' || Pop || '_POPULATION_MAINTENANCE', 'YieldType', 'YIELD_GOLD'
from PopulationMaintenance where Pop < 31;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'AT_LEAST_DEITY_HUMAN_' || Pop || '_POPULATION_MAINTENANCE', 'Amount', DeityMaintenance
from PopulationMaintenance where Pop < 31;

insert or replace into TraitModifiers (TraitType,	ModifierId) values
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_IMMORTAL_HUMAN_STARTING_GOLD'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_IMMORTAL_HUMAN_CITY_MAINTENANCE'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_IMMORTAL_HUMAN_31_POP_REVERSE_MAINTENANCE'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_IMMORTAL_HUMAN_31_POP_PER_POP_MAINTENANCE'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_HUMAN_STARTING_GOLD'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_HUMAN_CITY_MAINTENANCE'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_HUMAN_31_POP_REVERSE_MAINTENANCE'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_HUMAN_31_POP_PER_POP_MAINTENANCE');

insert or replace into Modifiers
	(ModifierId,													ModifierType,												
	OwnerRequirementSetId,											SubjectRequirementSetId)
values
	('AT_LEAST_IMMORTAL_HUMAN_STARTING_GOLD',						'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE',
	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN_AND_HAS_CITY',		NULL),
	('AT_LEAST_IMMORTAL_HUMAN_CITY_MAINTENANCE',					'MODIFIER_PLAYER_CITIES_ADJUST_PLAYER_YIELD_CHANGE',
	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN',					NULL),
	('AT_LEAST_IMMORTAL_HUMAN_31_POP_REVERSE_MAINTENANCE',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',
	'PLAYER_IS_AT_LEAST_IMMORTAL_DIFFICULTY_HUMAN',					'CITY_HAS_31_POPULATION'),
	('AT_LEAST_IMMORTAL_HUMAN_31_POP_PER_POP_MAINTENANCE',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
	'PLAYER_IS_AT_LEAST_IMMORTAL_DIFFICULTY_HUMAN',					'CITY_HAS_31_POPULATION'),
	('AT_LEAST_DEITY_HUMAN_STARTING_GOLD',							'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE',
	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN_AND_HAS_CITY',		NULL),
	('AT_LEAST_DEITY_HUMAN_CITY_MAINTENANCE',						'MODIFIER_PLAYER_CITIES_ADJUST_PLAYER_YIELD_CHANGE',
	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN',					NULL),
	('AT_LEAST_DEITY_HUMAN_31_POP_REVERSE_MAINTENANCE',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',
	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN',					'CITY_HAS_31_POPULATION'),
	('AT_LEAST_DEITY_HUMAN_31_POP_PER_POP_MAINTENANCE',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',
	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN',					'CITY_HAS_31_POPULATION');

insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	('AT_LEAST_IMMORTAL_HUMAN_STARTING_GOLD',				'YieldType',	'YIELD_GOLD'),
	('AT_LEAST_IMMORTAL_HUMAN_STARTING_GOLD',				'Amount',		1),
	('AT_LEAST_IMMORTAL_HUMAN_CITY_MAINTENANCE',			'YieldType',	'YIELD_GOLD'),
	('AT_LEAST_IMMORTAL_HUMAN_CITY_MAINTENANCE',			'Amount',		-1),
	('AT_LEAST_IMMORTAL_HUMAN_31_POP_REVERSE_MAINTENANCE',	'YieldType',	'YIELD_GOLD'),
	('AT_LEAST_IMMORTAL_HUMAN_31_POP_REVERSE_MAINTENANCE',	'Amount',		60),
	('AT_LEAST_IMMORTAL_HUMAN_31_POP_PER_POP_MAINTENANCE',	'YieldType',	'YIELD_GOLD'),
	('AT_LEAST_IMMORTAL_HUMAN_31_POP_PER_POP_MAINTENANCE',	'Amount',		-2),
	('AT_LEAST_DEITY_HUMAN_STARTING_GOLD',					'YieldType',	'YIELD_GOLD'),
	('AT_LEAST_DEITY_HUMAN_STARTING_GOLD',					'Amount',		1),
	('AT_LEAST_DEITY_HUMAN_CITY_MAINTENANCE',				'YieldType',	'YIELD_GOLD'),
	('AT_LEAST_DEITY_HUMAN_CITY_MAINTENANCE',				'Amount',		-1),
	('AT_LEAST_DEITY_HUMAN_31_POP_REVERSE_MAINTENANCE',		'YieldType',	'YIELD_GOLD'),
	('AT_LEAST_DEITY_HUMAN_31_POP_REVERSE_MAINTENANCE',		'Amount',		60),
	('AT_LEAST_DEITY_HUMAN_31_POP_PER_POP_MAINTENANCE',		'YieldType',	'YIELD_GOLD'),
	('AT_LEAST_DEITY_HUMAN_31_POP_PER_POP_MAINTENANCE',		'Amount',		-2);
