-------------------------------------
--  Temporary update database sql  --
-------------------------------------
insert or replace into TraitModifiers
	(TraitType,						    	ModifierId)values
	('MINOR_CIV_VILNIUS_TRAIT', 	     'MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0'  );
insert or replace into Modifiers	
	(ModifierId,												ModifierType,										Permanent,	SubjectRequirementSetId)
values
	('MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					0,					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VILNIUS_ALLIANCE_LEVEL_0',						'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',		0,					'DISTRICT_IS_THEATER');	
insert or replace into ModifierArguments
	(ModifierId,												Name,						Value)
values
	('MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0',		'ModifierId',		'MINOR_CIV_VILNIUS_ALLIANCE_LEVEL_0'),
	('MINOR_CIV_VILNIUS_ALLIANCE_LEVEL_0',						'YieldType',		'YIELD_CULTURE'),	
	('MINOR_CIV_VILNIUS_ALLIANCE_LEVEL_0',						'Amount',			50);

	