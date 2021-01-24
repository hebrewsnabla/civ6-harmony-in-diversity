-------------------------------------
--  Temporary update database sql  --
-------------------------------------

insert or replace into Types
	(Type,								Kind)
values
	-- Pantheon 
	('BELIEF_SCHOLASTICISM',		'KIND_BELIEF'),
	('ABILITY_SCHOLASTICISM_BUFF',	'KIND_ABILITY');

insert or replace into Beliefs
	(BeliefType,						Name,										Description,											BeliefClassType)
values
	-- Pantheon
	('BELIEF_SCHOLASTICISM',			'LOC_BELIEF_SCHOLASTICISM_NAME',			'LOC_BELIEF_SCHOLASTICISM_DL_DESCRIPTION',			'BELIEF_CLASS_ENHANCER');


insert or replace into BeliefModifiers
	(BeliefType,						ModifierID)
values
	('BELIEF_SCHOLASTICISM',			'SCHOLASTICISM_COMBAT_STRENGTH'),
	('BELIEF_MONASTIC_ISOLATION',		'MONASTIC_ISOLATION_PRESSURE_REDUCTION');


insert or replace into Modifiers
	(ModifierId,											ModifierType,												SubjectRequirementSetId)
values
	('BELIEF_MONASTIC_ISOLATION',	-------------)
	('SCHOLASTICISM_COMBAT_STRENGTH',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_FOUNDED_RELIGION_REQUIREMENTS'),
	('SCHOLASTICISM_COMBAT_STRENGTH_MODIFIER',				'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',							NULL),
	('SCHOLASTICISM_COMBAT_STRENGTH_BUFF',					'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',							NULL);

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
values
	('SCHOLASTICISM_COMBAT_STRENGTH',						'ModifierId',			'SCHOLASTICISM_COMBAT_STRENGTH_MODIFIER'),
	('SCHOLASTICISM_COMBAT_STRENGTH_MODIFIER',				'AbilityType',			'ABILITY_SCHOLASTICISM_BUFF'),
	('SCHOLASTICISM_COMBAT_STRENGTH_BUFF',					'Amount',				7);

insert or replace into TypeTags
	(Type,													Tag)
values
	('ABILITY_SCHOLASTICISM_BUFF',							'CLASS_RELIGIOUS_ALL');


insert or replace into UnitAbilities
	(UnitAbilityType,										Inactive)
values
	('ABILITY_SCHOLASTICISM_BUFF',							1);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
	('ABILITY_SCHOLASTICISM_BUFF',							'SCHOLASTICISM_COMBAT_STRENGTH_BUFF');

	---Description is not added yet---