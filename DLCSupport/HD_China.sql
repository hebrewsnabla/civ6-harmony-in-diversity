--朱棣
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_YONGLE';
insert or replace into Modifiers
	(ModifierId,								ModifierType)
values
	('JUDY_TRADE_ENVOY',						'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN'),
	('JUDY_TRADE_GOLD_INTERNATIONAL',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
	('JUDY_TRADE_GOLD_DOMESTIC',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
	('JUDY_TRADE_ADD',							'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('JUDY_TRADE_ENVOY',						'Amount',		1),
	('JUDY_TRADE_GOLD_INTERNATIONAL',			'Amount',		2),
	('JUDY_TRADE_GOLD_INTERNATIONAL',			'YieldType',	'YIELD_GOLD'),
	('JUDY_TRADE_GOLD_DOMESTIC',				'Amount',		2),
	('JUDY_TRADE_GOLD_DOMESTIC',				'YieldType',	'YIELD_GOLD'),
	('JUDY_TRADE_ADD',							'Amount',		1);
