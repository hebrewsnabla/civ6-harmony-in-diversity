-------------------------------------
--      Governors Adjustments      --
-------------------------------------

update GovernorPromotions set Level = 1, column = 2, BaseAbility = 0 where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';
update GovernorPromotions set Level = 0, column = 1, BaseAbility = 1 where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION';

update GovernorPromotionPrereqs set PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION'
	where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS';
update GovernorPromotionPrereqs set PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER'
	where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';
update GovernorPromotionPrereqs set
	GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER',
	PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION'
	where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION'
	and PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';

delete from GovernorPromotionSets where GovernorType = 'GOVERNOR_THE_RESOURCE_MANAGER';
insert or replace into GovernorPromotionSets (GovernorType, GovernorPromotion) values
	('GOVERNOR_THE_RESOURCE_MANAGER', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION');

-- Reyna
-- 删除原效果
-- 土地征用
delete from GovernorPromotionModifiers where ModifierId = 'LAND_ACQUISITION_FASTER_PLOT_ANNEXING';
delete from GovernorPromotionModifiers where ModifierId = 'FOREIGN_EXCHANGE_GOLD_FROM_FOREIGN_TRADE_PASSING_THROUGH';
-- 发包人
delete from GovernorPromotionModifiers where ModifierId = 'CONTRACTOR_ENABLE_DISTRICT_PURCHASE';

-- 新增效果
-- 单城区域产出
insert or replace into Types
	(Type,												Kind)
values
	('MODIFIER_REYNA_ADJUST_DISTRICTS_YIELD_CHANGE',	'KIND_MODIFIER');
insert or replace into DynamicModifiers
	(ModifierType,										CollectionType,										EffectType)
values
	('MODIFIER_REYNA_ADJUST_DISTRICTS_YIELD_CHANGE',	'COLLECTION_CITY_DISTRICTS',						'EFFECT_ADJUST_DISTRICT_YIELD_CHANGE');

insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,								ModifierId)
values
-- 地产商人
	('GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION',	'REAL_ESTATE_DEVELOPER_DISTRICT'),
	('GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION',	'REAL_ESTATE_DEVELOPER_IMPROVEMENT'),
-- 金融中心
	('GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR',			'REYNA_MARKET_PERCENTAGE_BOOST'),
	('GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR',			'REYNA_BANK_PERCENTAGE_BOOST'),
	('GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR',			'REYNA_STOCK_EXCHANGE_PERCENTAGE_BOOST'),
	('GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR',			'REYNA_LIGHTHOUSE_PERCENTAGE_BOOST'),
	('GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR',			'REYNA_SHIPYARD_PERCENTAGE_BOOST'),
	('GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR',			'REYNA_SEAPORT_PERCENTAGE_BOOST');

insert or replace into Modifiers
	(ModifierId,										ModifierType,										SubjectRequirementSetId)
values
-- 地产商人
	('REAL_ESTATE_DEVELOPER_DISTRICT',					'MODIFIER_REYNA_ADJUST_DISTRICTS_YIELD_CHANGE',		Null),
	('REAL_ESTATE_DEVELOPER_IMPROVEMENT',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_IS_IMPROVED'),
-- 金融中心
	('REYNA_MARKET',									'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				Null),
	('REYNA_BANK',										'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				Null),
	('REYNA_STOCK',										'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				Null),
	('REYNA_LIGHTHOUSE',								'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				Null),
	('REYNA_SHIPYARD',									'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				Null),
	('REYNA_SEAPORT',									'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',				Null),
	('REYNA_MARKET_PERCENTAGE_BOOST',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'BUILDING_IS_MARKET'),
	('REYNA_BANK_PERCENTAGE_BOOST',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'BUILDING_IS_BANK'),
	('REYNA_STOCK_EXCHANGE_PERCENTAGE_BOOST',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'BUILDING_IS_STOCK_EXCHANGE'),
	('REYNA_LIGHTHOUSE_PERCENTAGE_BOOST',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'BUILDING_IS_LIGHTHOUSE'),
	('REYNA_SHIPYARD_PERCENTAGE_BOOST',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'BUILDING_IS_SHIPYARD'),
	('REYNA_SEAPORT_PERCENTAGE_BOOST',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'BUILDING_IS_SEAPORT');

insert or replace into ModifierArguments
	(ModifierId,										Name,												Value)
values
-- 地产商人
	('REAL_ESTATE_DEVELOPER_DISTRICT',					'YieldType',										'YIELD_GOLD'),
	('REAL_ESTATE_DEVELOPER_DISTRICT',					'Amount',											3),
-- 金融中心
	('REYNA_MARKET',									'ModifierId',										'REYNA_MARKET_PERCENTAGE_BOOST'),
	('REYNA_BANK',										'ModifierId',										'REYNA_BANK_PERCENTAGE_BOOST'),
	('REYNA_STOCK',										'ModifierId',										'REYNA_STOCK_EXCHANGE_PERCENTAGE_BOOST'),
	('REYNA_LIGHTHOUSE',								'ModifierId',										'REYNA_LIGHTHOUSE_PERCENTAGE_BOOST'),
	('REYNA_SHIPYARD',									'ModifierId',										'REYNA_SHIPYARD_PERCENTAGE_BOOST'),
	('REYNA_SEAPORT',									'ModifierId',										'REYNA_SEAPORT_PERCENTAGE_BOOST'),
	('REYNA_MARKET_PERCENTAGE_BOOST',					'YieldType',										'YIELD_GOLD'),
	('REYNA_MARKET_PERCENTAGE_BOOST',					'Amount',											10),
	('REYNA_BANK_PERCENTAGE_BOOST',						'YieldType',										'YIELD_GOLD'),
	('REYNA_BANK_PERCENTAGE_BOOST',						'Amount',											10),
	('REYNA_STOCK_EXCHANGE_PERCENTAGE_BOOST',			'YieldType',										'YIELD_GOLD'),
	('REYNA_STOCK_EXCHANGE_PERCENTAGE_BOOST',			'Amount',											10),
	('REYNA_LIGHTHOUSE_PERCENTAGE_BOOST',				'YieldType',										'YIELD_GOLD'),
	('REYNA_LIGHTHOUSE_PERCENTAGE_BOOST',				'Amount',											10),
	('REYNA_SHIPYARD_PERCENTAGE_BOOST',					'YieldType',										'YIELD_GOLD'),
	('REYNA_SHIPYARD_PERCENTAGE_BOOST',					'Amount',											10),
	('REYNA_SEAPORT_PERCENTAGE_BOOST',					'YieldType',										'YIELD_GOLD'),
	('REYNA_SEAPORT_PERCENTAGE_BOOST',					'Amount',											10);

-- 调整效果
-- 税务员
update ModifierArguments set Value = 4 where ModifierId = 'TAX_COLLECTOR_ADJUST_CITIZEN_GPT' and Name = 'Amount';
-- 港务局长
update ModifierArguments set Value = 150 where ModifierId = 'HARBORMASTER_BONUS_COMMERCIAL_HUB_ADJACENCY' and Name = 'Amount';
update ModifierArguments set Value = 150 where ModifierId = 'HARBORMASTER_BONUS_HARBOR_ADJACENCY' and Name = 'Amount';