-------------------------------------
--   Support Building Functions    --
-------------------------------------

-- Write the new building functions here.
insert or replace into BuildingModifiers
	(BuildingType					,ModifierId)
values
	('BUILDING_JNR_MBARI',			'Mbari_Gold'),
	('BUILDING_JNR_MBARI',			'Mbari_GoldPercent'),
	('BUILDING_JNR_MBARI',			'Mbari_TradeRoute');
insert or replace into Modifiers
	(ModifierId,					ModifierType)
values
	('Mbari_Gold',					'MODIFIER_BUILDING_YIELD_CHANGE'),
	('Mbari_GoldPercent',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('Mbari_TradeRoute',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY');
insert or replace into ModifierArguments
	(ModifierId,					Name,				Value)
values
	('Mbari_Gold',					'YieldType',		'YIELD_GOLD'),
	('Mbari_Gold',					'Amount',			6),
	('Mbari_Gold',					'BuildingType',		'BUILDING_JNR_MBARI'),
	('Mbari_GoldPercent',			'YieldType',		'YIELD_GOLD'),
	('Mbari_GoldPercent',			'Amount',			10),
	('Mbari_TradeRoute',			'Amount',			1);