-------------------------------------
--  Temporary update database sql  --
-------------------------------------


--主教座堂
insert or replace into BuildingModifiers
	(BuildingType,								ModifierId)
values
--鸽转瓶琴
	('BUILDING_GOV_FAITH',						'GOV_FAITH_INTO_SCIENCE'),
	('BUILDING_GOV_FAITH',						'GOV_FAITH_INTO_CULTURE'),
--宗教单位折扣
	('BUILDING_GOV_FAITH',						'GOV_FAITH_MISSIONARY_DISCOUNT'),
	('BUILDING_GOV_FAITH',						'GOV_FAITH_APOSTLE_DISCOUNT'),
	('BUILDING_GOV_FAITH',						'GOV_FAITH_INQUISITOR_DISCOUNT'),
--宗教单位加力
	('BUILDING_GOV_FAITH',						'GOV_FAITH_COMBAT_BUFF'),
--建成建筑返还信仰
	('BUILDING_GOV_FAITH',						'GOV_FAITH_FINISH_BUILDINGS');

insert or replace into Modifiers
	(ModifierId,								ModifierType)
values
--鸽转瓶琴
	('GOV_FAITH_INTO_SCIENCE',					'MODIFIER_PLAYER_CITIES_ADJUST_YIELD_MODIFIER_FROM_FAITH'),
	('GOV_FAITH_INTO_CULTURE',					'MODIFIER_PLAYER_CITIES_ADJUST_YIELD_MODIFIER_FROM_FAITH'),
--宗教单位折扣
	('GOV_FAITH_MISSIONARY_DISCOUNT',			'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST'),
	('GOV_FAITH_APOSTLE_DISCOUNT',				'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST'),
	('GOV_FAITH_INQUISITOR_DISCOUNT',			'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST'),
--宗教单位加力
	('GOV_FAITH_COMBAT_BUFF',					'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
--建成建筑返还信仰
	('GOV_FAITH_FINISH_BUILDINGS',				'MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_BUILDING_COST');

insert or replace into ModifierArguments
	(ModifierId,								Name,							Value)
values
--鸽转瓶琴
	('GOV_FAITH_INTO_SCIENCE',					'YieldType',					'YIELD_SCIENCE'),
	('GOV_FAITH_INTO_SCIENCE',					'Amount',						20),
	('GOV_FAITH_INTO_CULTURE',					'YieldType',					'YIELD_CULTURE'),
	('GOV_FAITH_INTO_CULTURE',					'Amount',						20),
--宗教单位折扣
	('GOV_FAITH_MISSIONARY_DISCOUNT',			'UnitType',						'UNIT_MISSIONARY'),
	('GOV_FAITH_MISSIONARY_DISCOUNT',			'Amount',						20),
	('GOV_FAITH_APOSTLE_DISCOUNT',				'UnitType',						'UNIT_APOSTLE'),
	('GOV_FAITH_APOSTLE_DISCOUNT',				'Amount',						20),
	('GOV_FAITH_INQUISITOR_DISCOUNT',			'UnitType',						'UNIT_INQUISITOR'),
	('GOV_FAITH_INQUISITOR_DISCOUNT',			'Amount',						20),
--宗教单位加力
	('GOV_FAITH_COMBAT_BUFF',					'AbilityType',					'ABILITY_GOV_FAITH_COMBAT_STRENGTH'),
--建成建筑返还信仰
	('GOV_FAITH_FINISH_BUILDINGS',				'YieldType',					'YIELD_FAITH'),
	('GOV_FAITH_FINISH_BUILDINGS',				'BuildingProductionPercent',	30),
	('GOV_FAITH_FINISH_BUILDINGS',				'IncludeWonder',				0);