-------------------------------------
--  Temporary update database sql  --
-------------------------------------

------------------------------------------------------------------------------------------------------
-- Saladin free Apostle when Great Prophet is created
insert or replace into Modifiers
	(ModifierId,											ModifierType,									RunOnce,	Permanent)
values
	('TRAIT_GREAT_PROPHET_FREE_APOSTLE',					'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',		1,			1);

insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	('TRAIT_GREAT_PROPHET_FREE_APOSTLE',					'UnitType',		'UNIT_APOSTLE'),
	('TRAIT_GREAT_PROPHET_FREE_APOSTLE',					'Amount',		1);