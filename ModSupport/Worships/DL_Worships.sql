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
--Khalwat (Druze)
--建成第一个时获得“保护地球”市政的鼓舞，本城所有地块加一魅力，本城购买自然学家的花费减50%。

--unlock boost of Conservation
--lua needed(specific civic boost rather than eruka ) 
--+1 appeal to all tiles 
insert or replace into BuildingModifiers
	(BuildingType,				ModifierId)
values
	--('BUILDING_JNR_KHALWAT',	'UNLOCK_CONSERVATION_BOOST'),
	('BUILDING_JNR_KHALWAT',	'KHALWA_SINGLE_CITY_APPEAL_BONUS'),
	('BUILDING_JNR_KHALWAT',	'NATURALIST_DISCOUNT');

insert or replace into Modifiers
	(ModifierId,						ModifierType,								RunOnce,SubjectRequirementSetId)
values
	('KHALWA_SINGLE_CITY_APPEAL_BONUS',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL',			0,NULL),
	('UNLOCK_CONSERVATION_BOOST',		'MODIFIER_PLAYER_GRANT_SPECIFIC_CIVIC_BOOST',		1,NULL),
	('NATURALIST_DISCOUNT',				'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',	0,NULL);

insert or replace into ModifierArguments
	(ModifierId,						Name,				Value)
values
	('KHALWA_SINGLE_CITY_APPEAL_BONUS',	'Amount',			1),
	('NATURALIST_DISCOUNT',				'UnitType',			'UNIT_NATURALIST'),
	('NATURALIST_DISCOUNT',				'Amount',			50),
	('UNLOCK_CONSERVATION_BOOST',		'CivicType',		'CIVIC_CONSERVATION');

-- 塔祠，神道教神社和羽蛇神庙
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
-- 塔祠
	('BUILDING_JNR_CANDI',					'CANDI_CULTURE'),
	('BUILDING_JNR_CANDI',					'CANDI_FAITH'),
	('BUILDING_JNR_CANDI',					'CANDI_AMENITY'),
-- 神道教神社
	('BUILDING_JNR_JINJA',					'JNR_JINJA_COMBAT_STRENGTH'),
	('BUILDING_JNR_JINJA',					'JNR_JINJA_GRANT_FAITH'),
-- 羽蛇神庙
	--('BUILDING_JNR_TZACUALLI',				'JNR_TZACUALLI_CIVIC_BOOST'),
	--('BUILDING_JNR_TZACUALLI',				'JNR_TZACUALLI_TECHNOLOGY_BOOST')
	('BUILDING_JNR_TZACUALLI',				'JNR_TZACUALLI_CIVIC_BOOST_MDF'),
	('BUILDING_JNR_TZACUALLI',				'JNR_TZACUALLI_TECHNOLOGY_BOOST_MDF');
insert or replace into Modifiers
	(ModifierId,							ModifierType,										SubjectRequirementSetId,		SubjectStackLimit)
values
-- 塔祠
	('CANDI_CULTURE',						'MODIFIER_BUILDING_YIELD_CHANGE',					'PLOT_IS_OR_ADJACENT_TO_COAST',	Null),
	('CANDI_FAITH',							'MODIFIER_BUILDING_YIELD_CHANGE',					'PLOT_IS_OR_ADJACENT_TO_COAST',	Null),
	('CANDI_AMENITY',						'MODIFIER_SINGLE_CITY_ADJUST_ENTERTAINMENT',		'PLOT_IS_OR_ADJACENT_TO_COAST',	Null),
-- 神道教神社
	('JNR_JINJA_COMBAT_STRENGTH',			'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH',		'UNIT_IS_DOMAIN_LAND',			5),
	('JNR_JINJA_GRANT_FAITH',				'MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_UNIT_COST',	Null,							Null),
-- 羽蛇神庙
	--('JNR_TZACUALLI_CIVIC_BOOST',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',				Null,							Null),
	('JNR_TZACUALLI_CIVIC_BOOST_MDF',		'MODIFIER_PLAYER_ADJUST_CIVIC_BOOST',				Null,							10),
	--('JNR_TZACUALLI_TECHNOLOGY_BOOST',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',				Null,							Null),
	('JNR_TZACUALLI_TECHNOLOGY_BOOST_MDF',	'MODIFIER_PLAYER_ADJUST_TECHNOLOGY_BOOST',			Null,							10);
insert or replace into ModifierArguments
	(ModifierId,							Name,												Value)
values
-- 塔祠
	('CANDI_CULTURE',						'BuildingType',										'BUILDING_JNR_CANDI'),
	('CANDI_CULTURE',						'YieldType',										'YIELD_CULTURE'),
	('CANDI_CULTURE',						'Amount',											2),
	('CANDI_FAITH',							'BuildingType',										'BUILDING_JNR_CANDI'),
	('CANDI_FAITH',							'YieldType',										'YIELD_FAITH'),
	('CANDI_FAITH',							'Amount',											2),
	('CANDI_AMENITY',						'Amount',											1),
-- 神道教神社
	('JNR_JINJA_COMBAT_STRENGTH',			'Amount',											2),
	('JNR_JINJA_GRANT_FAITH',				'YieldType',										'YIELD_FAITH'),
	('JNR_JINJA_GRANT_FAITH',				'UnitProductionPercent',							30),
-- 羽蛇神庙
	--('JNR_TZACUALLI_CIVIC_BOOST',			'ModifierId',										'JNR_TZACUALLI_CIVIC_BOOST_MDF'),
	('JNR_TZACUALLI_CIVIC_BOOST_MDF',		'Amount',											1),
	--('JNR_TZACUALLI_TECHNOLOGY_BOOST',		'ModifierId',										'JNR_TZACUALLI_TECHNOLOGY_BOOST_MDF'),
	('JNR_TZACUALLI_TECHNOLOGY_BOOST_MDF',	'Amount',											1);
