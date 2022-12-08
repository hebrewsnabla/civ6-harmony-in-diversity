delete from TraitModifiers where TraitType = 'TRAIT_LEADER_CAESAR' and ModifierId in ('TRAIT_CAESAR_GOLD_CAPTURED_CITY_STEEL', 'BARBARIAN_CAMP_GOLD_CAPTURED_CITY_STEEL');
update Modifiers set ModifierType = 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER' where ModifierId = 'TRAIT_CAESAR_GOLD_CAPTURED_CITY';
insert or replace into TraitModifiers
	(TraitType,					ModifierId)
values
	('TRAIT_LEADER_CAESAR',		'CAESAR_STRENGTH_ATTACH');
insert or replace into Modifiers
	(ModifierId,					ModifierType,										SubjectRequirementSetId,		RunOnce,		Permanent)
values
	('CAESAR_STRENGTH_ATTACH',		'MODIFIER_PLAYER_CAPTURED_CITY_ATTACH_MODIFIER',	null,							0,				0),
	('CAESAR_STRENGTH',				'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER',			'HD_OBJECT_WITHIN_3_TILES',		0,				1),
	('CAESAR_STRENGTH_MODIFIER',	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',				null,							0,				1);
insert or replace into ModifierArguments
	(ModifierId,					Name,				Value)
values
	('CAESAR_STRENGTH_ATTACH',		'ModifierId',		'CAESAR_STRENGTH'),
	('CAESAR_STRENGTH',				'ModifierId',		'CAESAR_STRENGTH_MODIFIER'),
	('CAESAR_STRENGTH_MODIFIER',	'Amount',			1);
insert or replace into ModifierStrings
	(ModifierId,					Context,			Text)
values
	('CAESAR_STRENGTH_MODIFIER',	'Preview',			'LOC_CAESAR_STRENGTH_MODIFIER');