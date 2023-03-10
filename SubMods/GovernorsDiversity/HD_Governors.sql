-------------------------------------
--      Governors Adjustments      --
-------------------------------------
-----------------------------------------------------------------------------------------------------------------------------------

-- Magnus
-- 调整顺序
update GovernorPromotions set Level = 1, column = 2, BaseAbility = 0 where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';
update GovernorPromotions set Level = 0, column = 1, BaseAbility = 1 where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION';
update GovernorPromotions set Level = 2, column = 1, BaseAbility = 0 where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';
update GovernorPromotions set Level = 3, column = 0, BaseAbility = 0 where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST';
update GovernorPromotions set Level = 3, column = 2, BaseAbility = 0 where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION';

update GovernorPromotionPrereqs set PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION'
	where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS';
update GovernorPromotionPrereqs set PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER'
	where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';
update GovernorPromotionPrereqs set
	GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER',
	PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION'
	where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION'
	and PrereqGovernorPromotion = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';

delete from GovernorPromotionPrereqs where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST';

insert or replace into GovernorPromotionPrereqs	(GovernorPromotionType, 			PrereqGovernorPromotion) values
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER',	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS'),
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER');

delete from GovernorPromotionSets where GovernorType = 'GOVERNOR_THE_RESOURCE_MANAGER';
insert or replace into GovernorPromotionSets (GovernorType, GovernorPromotion) values
	('GOVERNOR_THE_RESOURCE_MANAGER', 	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_EXPEDITION'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST'),
	('GOVERNOR_THE_RESOURCE_MANAGER', 	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION');

-- 删除原效果
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER';
-- delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS';
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER';
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST';
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION';

-- update ModifierArguments set Value = 30 where ModifierId = 'SURPLUS_LOGISTICS_EXTRA_GROWTH' and Name = 'Amount';
update ModifierArguments set Value = 4 where ModifierId = 'SURPLUS_LOGISTICS_TRADE_ROUTE_FOOD' and Name = 'Amount';

-- 新增效果
insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,											ModifierId)
values
	-- ('GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER',			'MAGNUS_WONDERS_BOOST'),
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER',			'MAGNUS_EXTRA_DISTRICT'),
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER',			'MAGNUS_FASTER_DISTRICT_CONSTRUCTION'),
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER',			'MAGNUS_FASTER_BUILDING_CONSTRUCTION'),
	-- ('GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS',		'SURPLUS_LOGISTICS_TRADE_ROUTE_PRODUCTION'),
	('GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER',			'MAGNUS_ADJUST_CITY_YIELD');
	--('GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION',	'VERTICAL_INTEGRATION_FOOD_REGIONAL_STACKING'),
	--('GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION',	'VERTICAL_INTEGRATION_GOLD_REGIONAL_STACKING'),
	--('GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION',	'VERTICAL_INTEGRATION_SCIENCE_REGIONAL_STACKING'),
	--('GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION',	'VERTICAL_INTEGRATION_CULTURE_REGIONAL_STACKING'),
	--('GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION',	'VERTICAL_INTEGRATION_FAITH_REGIONAL_STACKING');
insert or replace into Modifiers
	(ModifierId,													ModifierType)
values
	-- ('MAGNUS_WONDERS_BOOST',										'MODIFIER_SINGLE_CITY_ADJUST_WONDER_PRODUCTION'),
	('MAGNUS_EXTRA_DISTRICT',										'MODIFIER_SINGLE_CITY_EXTRA_DISTRICT'),
	('MAGNUS_FASTER_DISTRICT_CONSTRUCTION',							'MODIFIER_CITY_INCREASE_DISTRICT_PRODUCTION_RATE'),
	('MAGNUS_FASTER_BUILDING_CONSTRUCTION',							'MODIFIER_SINGLE_CITY_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER'),
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PRODUCTION',					'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS'),
	-- ('SURPLUS_LOGISTICS_TRADE_ROUTE_GOLD',							'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS'),
	('MAGNUS_ADJUST_CITY_YIELD',									'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('MAGNUS_PLACEHOLDER',											'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE');
	--('VERTICAL_INTEGRATION_FOOD_REGIONAL_STACKING',					'MODIFIER_CITY_ADJUST_ALLOWED_INCOMING_REGIONAL_STACKING'),
	--('VERTICAL_INTEGRATION_GOLD_REGIONAL_STACKING',					'MODIFIER_CITY_ADJUST_ALLOWED_INCOMING_REGIONAL_STACKING'),
	--('VERTICAL_INTEGRATION_SCIENCE_REGIONAL_STACKING',				'MODIFIER_CITY_ADJUST_ALLOWED_INCOMING_REGIONAL_STACKING'),
	--('VERTICAL_INTEGRATION_CULTURE_REGIONAL_STACKING',				'MODIFIER_CITY_ADJUST_ALLOWED_INCOMING_REGIONAL_STACKING'),
	--('VERTICAL_INTEGRATION_FAITH_REGIONAL_STACKING',				'MODIFIER_CITY_ADJUST_ALLOWED_INCOMING_REGIONAL_STACKING');	
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
values
	-- ('MAGNUS_WONDERS_BOOST',							'Amount',			20),
	('MAGNUS_EXTRA_DISTRICT',							'Amount',			1),
	('MAGNUS_FASTER_DISTRICT_CONSTRUCTION',				'Amount',			50),
	('MAGNUS_FASTER_BUILDING_CONSTRUCTION',				'Amount',			50),
	('MAGNUS_FASTER_BUILDING_CONSTRUCTION',				'IsWonder',			0),
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PRODUCTION',		'YieldType',		'YIELD_PRODUCTION'),
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PRODUCTION',		'Amount',			1),
	('SURPLUS_LOGISTICS_TRADE_ROUTE_PRODUCTION',		'Domestic',			1),
	('MAGNUS_ADJUST_CITY_YIELD',						'YieldType',		'YIELD_FOOD, YIELD_PRODUCTION'),
	('MAGNUS_ADJUST_CITY_YIELD',						'Amount',			'15,15'),
	('MAGNUS_PLACEHOLDER',								'YieldType',		'YIELD_GOLD'),
	('MAGNUS_PLACEHOLDER',								'Amount',			0);
	--('VERTICAL_INTEGRATION_FOOD_REGIONAL_STACKING',		'YieldType',		'YIELD_FOOD'),
	--('VERTICAL_INTEGRATION_GOLD_REGIONAL_STACKING',		'YieldType',		'YIELD_GOLD'),
	--('VERTICAL_INTEGRATION_SCIENCE_REGIONAL_STACKING',	'YieldType',		'YIELD_SCIENCE'),
	--('VERTICAL_INTEGRATION_CULTURE_REGIONAL_STACKING',	'YieldType',		'YIELD_CULTURE'),
	--('VERTICAL_INTEGRATION_FAITH_REGIONAL_STACKING',	'YieldType',		'YIELD_FAITH');
create temporary table HD_MagnusRegionalEffects (
	DistrictType text not null,
	YieldType text not null,
	Amount int,
	OwnerRequirementSetId text,
	AttachModifierId text,
	ModifierId text,
	primary key (DistrictType, YieldType, OwnerRequirementSetId)
);
insert or replace into HD_MagnusRegionalEffects
	(DistrictType,				OwnerRequirementSetId,											YieldType,			Amount)
values
	('DISTRICT_GOVERNMENT',		'NULL',															'YIELD_FOOD',		1),
	('DISTRICT_GOVERNMENT',		'CITY_HAS_DISTRICT_GOVERNMENT_TIER_1_BUILDING_REQUIREMENTS',	'YIELD_FOOD',		1),
	('DISTRICT_GOVERNMENT',		'CITY_HAS_DISTRICT_GOVERNMENT_TIER_2_BUILDING_REQUIREMENTS',	'YIELD_FOOD',		2),
	('DISTRICT_GOVERNMENT',		'CITY_HAS_DISTRICT_GOVERNMENT_TIER_3_BUILDING_REQUIREMENTS',	'YIELD_FOOD',		4);
insert or replace into HD_MagnusRegionalEffects
	(DistrictType,						OwnerRequirementSetId,									YieldType,			Amount)
select
	'DISTRICT_DIPLOMATIC_QUARTER',		'NULL',													'YIELD_CULTURE',	1
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into HD_MagnusRegionalEffects
	(DistrictType,						OwnerRequirementSetId,									YieldType,			Amount)
select
	'DISTRICT_DIPLOMATIC_QUARTER',		'CITY_HAS_' || BuildingType || '_REQUIREMENTS',			'YIELD_CULTURE',	1
from Buildings where PrereqDistrict = 'DISTRICT_DIPLOMATIC_QUARTER' and TraitType is null;
update HD_MagnusRegionalEffects set Amount = 2 where OwnerRequirementSetId = 'CITY_HAS_BUILDING_CHANCERY_REQUIREMENTS';
update HD_MagnusRegionalEffects set Amount = 4 where OwnerRequirementSetId = 'CITY_HAS_BUILDING_HD_REGIONAL_COUNCIL_CENTER_REQUIREMENTS';
-- Culture / Science buffs are also given by Government Plaza when Diplomatic Quater is not enabled.
insert or replace into HD_MagnusRegionalEffects
	(DistrictType,	OwnerRequirementSetId,	YieldType,			Amount)
select
	DistrictType,	OwnerRequirementSetId,	'YIELD_CULTURE',	Amount
from HD_MagnusRegionalEffects where YieldType = 'YIELD_FOOD' and not exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
-- Replace text
update GovernorPromotions set Description = 'LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_VIETNAM_DESCRIPTION' where GovernorPromotionType = 'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST' and exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
-- Copy buffs
insert or replace into HD_MagnusRegionalEffects
	(DistrictType,	OwnerRequirementSetId,	YieldType,				Amount)
select
	DistrictType,	OwnerRequirementSetId,	'YIELD_PRODUCTION',		Amount
from HD_MagnusRegionalEffects where YieldType = 'YIELD_FOOD';
insert or replace into HD_MagnusRegionalEffects
	(DistrictType,	OwnerRequirementSetId,	YieldType,				Amount)
select
	DistrictType,	OwnerRequirementSetId,	'YIELD_SCIENCE',		Amount
from HD_MagnusRegionalEffects where YieldType = 'YIELD_CULTURE';
-- Name Modifiers
update HD_MagnusRegionalEffects set ModifierId = 'MAGNUS_' || DistrictType || '_' || YieldType || '_' || OwnerRequirementSetId;
update HD_MagnusRegionalEffects set AttachModifierId = ModifierId || '_ATTACH';
update HD_MagnusRegionalEffects set OwnerRequirementSetId = null where OwnerRequirementSetId = 'NULL';
insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,										ModifierId)
select
	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST',		AttachModifierId
from HD_MagnusRegionalEffects;
insert or replace into Modifiers
	(ModifierId,		ModifierType,								SubjectRequirementSetId)
select
	AttachModifierId,	'MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER',	'DISTRICT_IS_' || DistrictType || '_REQUIREMENTS'
from HD_MagnusRegionalEffects;
insert or replace into ModifierArguments
	(ModifierId,		Name,			Value)
select
	AttachModifierId,	'ModifierId',	ModifierId
from HD_MagnusRegionalEffects;
insert or replace into Modifiers
	(ModifierId,		ModifierType,										OwnerRequirementSetId,	SubjectRequirementSetId)
select
	ModifierId,			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	OwnerRequirementSetId,	'HD_OBJECT_WITHIN_8_TILES'
from HD_MagnusRegionalEffects;
insert or replace into ModifierArguments
	(ModifierId,		Name,			Value)
select
	ModifierId,			'YieldType',	YieldType
from HD_MagnusRegionalEffects;
insert or replace into ModifierArguments
	(ModifierId,		Name,			Value)
select
	ModifierId,			'Amount',		Amount
from HD_MagnusRegionalEffects;
-----------------------------------------------------------------------------------------------------------------------------------

-- Reyna
-- 删除原效果
-- 基础土地征用
delete from GovernorPromotionModifiers where ModifierId = 'LAND_ACQUISITION_FASTER_PLOT_ANNEXING';
delete from GovernorPromotionModifiers where ModifierId = 'FOREIGN_EXCHANGE_GOLD_FROM_FOREIGN_TRADE_PASSING_THROUGH';
-- 右一林业管理（改名财政大臣）
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT';
-- 中二税务员（改名市舶榷务）
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR';
-- 左三发包人（改名金融中心）
delete from GovernorPromotionModifiers where ModifierId = 'CONTRACTOR_ENABLE_DISTRICT_PURCHASE';
-- 移除再生资源补贴升级
delete from GovernorPromotions where GovernorPromotionType = 'GOVERNOR_PROMOTION_MERCHANT_RENEWABLE_ENERGY';

-- 跨国公司取缔再生资源补贴
insert or replace into Types
	(Type, Kind)
values
	('GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP', 'KIND_GOVERNOR_PROMOTION');
-- Every governor promotion requires a modifier. Creating a dummy one.
insert or replace into Modifiers
	(ModifierId, ModifierType)
values
	('MULTINATIONAL_CORP_DUMMY', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL');

insert or replace into GovernorPromotions
	(GovernorPromotionType, Name, Description, Level, Column, BaseAbility)
values
	('GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP', 'LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_NAME', 'LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION', 3, 2, 0);

insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType, ModifierId)
values
	('GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP',	'MULTINATIONAL_CORP_DUMMY');

insert or replace into GovernorPromotionSets
	(GovernorType, GovernorPromotion)
values
	('GOVERNOR_THE_MERCHANT', 'GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP');

insert or replace into GovernorPromotionPrereqs
	(GovernorPromotionType, PrereqGovernorPromotion)
values
	('GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP', 'GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR');

-- 新增效果
-- 单城区域产出
-- insert or replace into Types
-- 	(Type,												Kind)
-- values
-- 	('MODIFIER_REYNA_ADJUST_DISTRICTS_YIELD_CHANGE',	'KIND_MODIFIER');
-- insert or replace into DynamicModifiers
-- 	(ModifierType,										CollectionType,										EffectType)
-- values
-- 	('MODIFIER_REYNA_ADJUST_DISTRICTS_YIELD_CHANGE',	'COLLECTION_CITY_DISTRICTS',						'EFFECT_ADJUST_DISTRICT_YIELD_CHANGE');

insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,								ModifierId)
values
-- 林业管理
	('GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT',	'REYNA_UNIT_DISCOUNT'),
	('GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT',	'REYNA_UNIT_EXTRA_DISCOUNT'),
-- 地产商人
	('GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION',	'REYNA_POPULATION_GOLD'),
--	('GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION',	'REYNA_TRADEROUTE'),
-- 港务局长
	('GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER',		'REYNA_EXTRA_DISTRICT'),
-- 市舶榷务
	('GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR',		'REYNA_TRADEROUTE');


insert or replace into Modifiers
	(ModifierId,										ModifierType,													SubjectRequirementSetId)
values
-- 林业管理
	('REYNA_UNIT_DISCOUNT',								'MODIFIER_SINGLE_CITY_ADJUST_ALL_UNITS_PURCHASE_COST',			NULL),
	('REYNA_UNIT_EXTRA_DISCOUNT',						'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',				NULL),
-- 地产商人
	('REYNA_POPULATION_GOLD',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',		null),
	('REYNA_TRADEROUTE',								'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',					null),
-- 港务局长
	('REYNA_EXTRA_DISTRICT',							'MODIFIER_SINGLE_CITY_EXTRA_DISTRICT',							'CITY_HAS_COMMERCIAL_AND_HARBOR'),
-- 市舶榷务
	('REYNA_CHEAPER_BUILDING_PURCHASE',					'MODIFIER_SINGLE_CITY_ADJUST_ALL_BUILDINGS_PURCHASE_COST',		null);

insert or replace into ModifierArguments
	(ModifierId,										Name,												Value)
values
-- 林业管理
	('REYNA_UNIT_DISCOUNT',								'Amount',											20),
	('REYNA_UNIT_DISCOUNT',								'IncludeCivilian',									1),
	('REYNA_UNIT_EXTRA_DISCOUNT',						'UnitType',											'UNIT_TRADER'),
	('REYNA_UNIT_EXTRA_DISCOUNT',						'Amount',											20),
-- 地产商人
	('REYNA_POPULATION_GOLD',							'YieldType',										'YIELD_GOLD'),
	('REYNA_POPULATION_GOLD',							'Amount',											3),
	('REYNA_TRADEROUTE',								'Amount',											3),
-- 港务局长
	('REYNA_EXTRA_DISTRICT',							'Amount',											1),
-- 市舶榷务
	('REYNA_CHEAPER_BUILDING_PURCHASE',					'Amount',											15);
-- 林业管理公司模式
insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,								ModifierId)
select
	'GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT',	'REYNA_UNIT_EXTRA_DISCOUNT1'
where exists (select UnitType from Units where UnitType = 'UNIT_LEU_INVESTOR');
insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,								ModifierId)
select
	'GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT',	'REYNA_UNIT_EXTRA_DISCOUNT2'
where exists (select UnitType from Units where UnitType = 'UNIT_LEU_TYCOON');

insert or replace into Modifiers
	(ModifierId,										ModifierType,													SubjectRequirementSetId)
select
	'REYNA_UNIT_EXTRA_DISCOUNT1',						'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',				NULL
where exists (select UnitType from Units where UnitType = 'UNIT_LEU_INVESTOR');
insert or replace into Modifiers
	(ModifierId,										ModifierType,													SubjectRequirementSetId)
select
	'REYNA_UNIT_EXTRA_DISCOUNT2',						'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',				NULL
where exists (select UnitType from Units where UnitType = 'UNIT_LEU_TYCOON');

insert or replace into ModifierArguments
	(ModifierId,										Name,												Value)
select
	'REYNA_UNIT_EXTRA_DISCOUNT1',						'UnitType',											'UNIT_LEU_INVESTOR'
where exists (select UnitType from Units where UnitType = 'UNIT_LEU_INVESTOR');
insert or replace into ModifierArguments
	(ModifierId,										Name,												Value)
select
	'REYNA_UNIT_EXTRA_DISCOUNT1',						'Amount',											20
where exists (select UnitType from Units where UnitType = 'UNIT_LEU_INVESTOR');

insert or replace into ModifierArguments
	(ModifierId,										Name,												Value)
select
	'REYNA_UNIT_EXTRA_DISCOUNT2',						'UnitType',											'UNIT_LEU_TYCOON'
where exists (select UnitType from Units where UnitType = 'UNIT_LEU_TYCOON');
insert or replace into ModifierArguments
	(ModifierId,										Name,												Value)
select
	'REYNA_UNIT_EXTRA_DISCOUNT2',						'Amount',											20
where exists (select UnitType from Units where UnitType = 'UNIT_LEU_TYCOON');
--跨国公司 金融中心
create temporary table HD_REYNA(
	BuildingType text not null,
	ModifierType text not null,
	GovernorPromotionType text not null,
	ModifierId text,
	primary key (BuildingType, ModifierType)
);
insert or replace into HD_REYNA
	(BuildingType,	ModifierType,															GovernorPromotionType)
select
	BuildingType,	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',						'GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR'
from Buildings where (PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' and TraitType is NULL) or (PrereqDistrict = 'DISTRICT_HARBOR' and TraitType is NULL) union all
select
	BuildingType,	'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',		'GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP'
from Buildings where (PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' and TraitType is NULL) or (PrereqDistrict = 'DISTRICT_HARBOR' and TraitType is NULL);
update HD_REYNA set ModifierId = 'REYNA_' || BuildingType || '_' || ModifierType;

insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,		ModifierId)
select
	GovernorPromotionType,		ModifierId
from HD_REYNA;
insert or replace into Modifiers
	(ModifierId,			ModifierType,			SubjectRequirementSetId)
select
	ModifierId,				ModifierType,			'CITY_HAS_' || BuildingType || '_REQUIREMENTS'
from HD_REYNA;
insert or replace into ModifierArguments
	(ModifierId,			Name,					Value)
select
	ModifierId,				'YieldType',			'YIELD_GOLD'
from HD_REYNA union all
select
	ModifierId,				'Amount',				8
from HD_REYNA where ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER' union all
select
	ModifierId,				'Amount',				6
from HD_REYNA where ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL';

-- 公司模式 跨国公司
update GovernorPromotions set Description = 'LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION_CORP'
	where GovernorPromotionType = 'GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP'
	and exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,				ModifierId)
select
	'GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP',	'MULTINATIONAL_CORP_PRODUCT_TOURISM'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into Modifiers
	(ModifierId,									ModifierType,							SubjectRequirementSetId)
select
	'MULTINATIONAL_CORP_PRODUCT_TOURISM',			'MODIFIER_SINGLE_CITY_ADJUST_TOURISM',	'HD_PLAYER_HAS_CIVIC_CAPITALISM'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,									Name,						Value)
select
	'MULTINATIONAL_CORP_PRODUCT_TOURISM',			'GreatWorkObjectType',		'GREATWORKOBJECT_PRODUCT'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,									Name,						Value)
select
	'MULTINATIONAL_CORP_PRODUCT_TOURISM',			'ScalingFactor',			200
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

-----------------------------------------------------------------------------------------------------------------------------------

--Victor
update Governors set TransitionStrength = 250 where GovernorType = 'GOVERNOR_THE_DEFENDER';

--delete from GovernorPromotions where GovernorPromotionType = 'GOVERNOR_PROMOTION_DEFENSE_LOGISTICS';
delete from GovernorPromotions where GovernorPromotionType = 'GOVERNOR_PROMOTION_AIR_DEFENSE_INITIATIVE';
delete from GovernorPromotions where GovernorPromotionType = 'GOVERNOR_PROMOTION_EMBRASURE';
delete from GovernorPromotions where GovernorPromotionType = 'GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT';

insert or replace into Types (Type,Kind) values
	('GOVERNOR_PROMOTION_CONSCRIPTION',			'KIND_GOVERNOR_PROMOTION'),
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'KIND_GOVERNOR_PROMOTION'),
	('GOVERNOR_PROMOTION_COMMANDER',			'KIND_GOVERNOR_PROMOTION');

insert or replace into GovernorPromotions
	(GovernorPromotionType,						Name,												Description,										Level,	Column,	BaseAbility)
values
	('GOVERNOR_PROMOTION_REDOUBT',				'LOC_GOVERNOR_PROMOTION_REDOUBT_NAME',				'LOC_GOVERNOR_PROMOTION_REDOUBT_DESCRIPTION',				0,	1,	1),
	('GOVERNOR_PROMOTION_GARRISON_COMMANDER',	'LOC_GOVERNOR_PROMOTION_GARRISON_COMMANDER_NAME',	'LOC_GOVERNOR_PROMOTION_GARRISON_COMMANDER_DESCRIPTION',	1,	0,	0),
	('GOVERNOR_PROMOTION_DEFENSE_LOGISTICS',	'LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_NAME',	'LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_DESCRIPTION',		1,	2,	0),
	('GOVERNOR_PROMOTION_CONSCRIPTION',			'LOC_GOVERNOR_PROMOTION_CONSCRIPTION_NAME',			'LOC_GOVERNOR_PROMOTION_CONSCRIPTION_DESCRIPTION',			2,	1,	0),
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'LOC_GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT_NAME',	'LOC_GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT_DESCRIPTION',	3,	0,	0),
	('GOVERNOR_PROMOTION_COMMANDER',			'LOC_GOVERNOR_PROMOTION_COMMANDER_NAME',			'LOC_GOVERNOR_PROMOTION_COMMANDER_DESCRIPTION',				3,	2,	0);

--level 0 promotion GOVERNOR_PROMOTION_REDOUBT
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_REDOUBT';
insert or replace into GovernorPromotionModifiers (GovernorPromotionType,ModifierId) values
	('GOVERNOR_PROMOTION_REDOUBT',	'DEFENDER_ADJUST_CITY_DEFENSE_STRENGTH'),
	('GOVERNOR_PROMOTION_REDOUBT',	'DEFENSE_LOGISTICS_SIEGE_PROTECTION'),
	-- ('GOVERNOR_PROMOTION_REDOUBT',	'PRESTIGE_IDENTITY_PRESSURE_TO_DOMESTIC_CITIES'),
	('GOVERNOR_PROMOTION_REDOUBT',	'VICTOR_ENCAMPMENT_PRODUCTION'),
	('GOVERNOR_PROMOTION_REDOUBT',	'VICTOR_ENCAMPMENT_BUILDINGS_PRODUCTION'),
	('GOVERNOR_PROMOTION_REDOUBT',	'VICTOR_HARBOR_PRODUCTION'),
	('GOVERNOR_PROMOTION_REDOUBT',	'VICTOR_HARBOR_BUILDINGS_PRODUCTION');
--维克多bug修复
insert or replace into Modifiers
	(ModifierId,                                            	ModifierType)
values
	('VICTOR_ENCAMPMENT_PRODUCTION',							'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION'),
	('VICTOR_ENCAMPMENT_BUILDINGS_PRODUCTION',					'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION'),
	('VICTOR_HARBOR_PRODUCTION',								'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION'),
	('VICTOR_HARBOR_BUILDINGS_PRODUCTION',						'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION');
insert or replace into ModifierArguments
	(ModifierId,                                            	Name,                   	Type,                Value)
values
	('VICTOR_ENCAMPMENT_PRODUCTION',							'DistrictType',				'ARGTYPE_IDENTITY',	'DISTRICT_ENCAMPMENT'),
	('VICTOR_ENCAMPMENT_PRODUCTION',							'Amount',					'ARGTYPE_IDENTITY',	30),
	('VICTOR_HARBOR_PRODUCTION',								'DistrictType',				'ARGTYPE_IDENTITY',	'DISTRICT_HARBOR'),
	('VICTOR_HARBOR_PRODUCTION',								'Amount',					'ARGTYPE_IDENTITY',	30),
	('VICTOR_ENCAMPMENT_BUILDINGS_PRODUCTION',					'DistrictType',				'ARGTYPE_IDENTITY',	'DISTRICT_ENCAMPMENT'),
	('VICTOR_ENCAMPMENT_BUILDINGS_PRODUCTION',					'Amount',					'ARGTYPE_IDENTITY',	30),
	('VICTOR_HARBOR_BUILDINGS_PRODUCTION',						'DistrictType',				'ARGTYPE_IDENTITY',	'DISTRICT_HARBOR'),
	('VICTOR_HARBOR_BUILDINGS_PRODUCTION',						'Amount',					'ARGTYPE_IDENTITY',	30);


--level 1 promotion GOVERNOR_PROMOTION_GARRISON_COMMANDER
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_GARRISON_COMMANDER';
insert or replace into GovernorPromotionModifiers (GovernorPromotionType,ModifierId) values
	('GOVERNOR_PROMOTION_GARRISON_COMMANDER',	'GARRISON_COMMANDER_ADJUST_CITY_COMBAT_BONUS'),
	('GOVERNOR_PROMOTION_GARRISON_COMMANDER',	'CITY_DEFENDER_ADJUST_ATTACKS_PER_TURN'),
	('GOVERNOR_PROMOTION_GARRISON_COMMANDER',	'LIMES_CASTLEPRODUCTION'),
	('GOVERNOR_PROMOTION_GARRISON_COMMANDER',	'LIMES_WALLSPRODUCTION'),
	('GOVERNOR_PROMOTION_GARRISON_COMMANDER',	'LIMES_STARFORTPRODUCTION'),
	('GOVERNOR_PROMOTION_GARRISON_COMMANDER',	'LIMES_TSIKHEPRODUCTION');

--level 1 promotion GOVERNOR_PROMOTION_DEFENSE_LOGISTICS
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_DEFENSE_LOGISTICS';
insert or replace into GovernorPromotionModifiers (GovernorPromotionType,ModifierId) values
	('GOVERNOR_PROMOTION_DEFENSE_LOGISTICS',	'BLACK_MARKETEER_STRATEGIC_RESOURCE_COST_DISCOUNT'),
	('GOVERNOR_PROMOTION_DEFENSE_LOGISTICS',	'DEFENSE_LOGISTICS_BONUS_STRATEGICS_ALL_CITIES');
-- update ModifierArguments set Value = 3 where ModifierId = 'DEFENSE_LOGISTICS_BONUS_STRATEGICS' and Name = 'Amount';

insert or replace into Modifiers	
	(ModifierId,										ModifierType)
values
	('DEFENSE_LOGISTICS_BONUS_STRATEGICS_ALL_CITIES',	'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_ACCUMULATION');

insert or replace into ModifierArguments
	(ModifierId,										Name,		Value)
values
	('DEFENSE_LOGISTICS_BONUS_STRATEGICS_ALL_CITIES',	'Amount',	2);

--level 2 promotion GOVERNOR_PROMOTION_EMBRASURE
-- delete from GovernorPromotionModifiers where ModifierId = 'CITY_DEFENDER_FREE_PROMOTIONS';
-- insert or replace into GovernorPromotionModifiers (GovernorPromotionType,ModifierId) values
-- 	('GOVERNOR_PROMOTION_EMBRASURE','CITY_DEFENDER_ADJUST_ATTACKS_PER_TURN'),
-- 	('GOVERNOR_PROMOTION_EMBRASURE','EMBRASURE_MILLITARY_ENGINEER_CHARGES'),
-- 	('GOVERNOR_PROMOTION_EMBRASURE','EMBRASURE_ADJUST_MILITARY_ENGINEER_PRODUCTION_MODIFIER'),
-- 	('GOVERNOR_PROMOTION_EMBRASURE','EMBRASURE_ADJUST_MILITARY_ENGINEER_PRODUCTION');

-- insert or replace into Modifiers	
-- 	(ModifierId,												ModifierType,							SubjectRequirementSetId)
-- values
-- 	('EMBRASURE_MILLITARY_ENGINEER_CHARGES',					'MODIFIER_SINGLE_CITY_BUILDER_CHARGES','UNIT_IS_MILITARY_ENGINEER'),
-- 	--('EMBRASURE_ADJUST_MILITARY_ENGINEER_PRODUCTION_MODIFIER',	'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',NULL),
-- 	('EMBRASURE_ADJUST_MILITARY_ENGINEER_PRODUCTION',			'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',NULL);

-- insert or replace into ModifierArguments
-- 	(ModifierId,										Name,		Value)
-- values
-- 	('EMBRASURE_MILLITARY_ENGINEER_CHARGES',			'Amount',	2),
-- 	('EMBRASURE_ADJUST_MILITARY_ENGINEER_PRODUCTION',	'ModifierId','TRAIT_ADJUST_MILITARY_ENGINEER_PRODUCTION');

--level 2 promotion GOVERNOR_PROMOTION_CONSCRIPTION
insert or replace into GovernorPromotionModifiers (GovernorPromotionType,ModifierId) values
	('GOVERNOR_PROMOTION_CONSCRIPTION',	'CITY_DEFENDER_FREE_PROMOTIONS'),
	('GOVERNOR_PROMOTION_CONSCRIPTION',	'VICTOR_SCIENCE_TRAINED_UNIT');
update Modifiers set SubjectRequirementSetId = 'HD_CITY_DEFENDER_PROMOTION_REQUIREMENTS' where ModifierId = 'CITY_DEFENDER_FREE_PROMOTIONS';

-- update Modifiers set Permanent = 0 where ModifierId = 'BASILIKOI_PAIDES_SCIENCE_TRAINED_UNIT';
-- update Modifiers set RunOnce = 0 where ModifierId = 'BASILIKOI_PAIDES_SCIENCE_TRAINED_UNIT';
-- update ModifierArguments set Value = 60 where ModifierId = 'BLACK_MARKETEER_STRATEGIC_RESOURCE_COST_DISCOUNT' and Name = 'Amount';

-- insert or replace into Modifiers	
-- 	(ModifierId,									ModifierType,											Permanent)
-- values
-- 	-- ('VICTOR_TRAINED_EXP',							'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',					0),
-- 	('VICTOR_TRAINED_EXP_MODIFIER',					'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	1),
-- 	-- ('CONSCRIPTION_GRANTS_UNIT_ABILITY',			'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',					0),
-- 	('CONSCRIPTION_GRANTS_UNIT_ABILITY_MODIFIER',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	1);

-- insert or replace into ModifierArguments
-- 	(ModifierId,									Name,			Value)
-- values
-- 	-- ('VICTOR_TRAINED_EXP',							'ModifierId',	'VICTOR_TRAINED_EXP_MODIFIER'),
-- 	('VICTOR_TRAINED_EXP_MODIFIER',					'AbilityType',	'ABILITY_VICTOR_TRAINED_UNIT_EXP'),
-- 	-- ('CONSCRIPTION_GRANTS_UNIT_ABILITY',			'ModifierId',	'CONSCRIPTION_GRANTS_UNIT_ABILITY_MODIFIER'),
-- 	('CONSCRIPTION_GRANTS_UNIT_ABILITY_MODIFIER',	'AbilityType',	'ABILITY_VICTOR_TRAINED_UNIT_STRENGTH');

-- Level 3 Commander promotion GOVERNOR_PROMOTION_COMMANDER
insert or replace into GovernorPromotionModifiers (GovernorPromotionType,ModifierId) values
	('GOVERNOR_PROMOTION_COMMANDER',	'COMMANDER_REGIONAL_COMBAT_STRENGTH');

insert or replace into Modifiers	
	(ModifierId,									ModifierType,							SubjectRequirementSetId)
values
	('COMMANDER_REGIONAL_COMBAT_STRENGTH',			'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',	'UNIT_WITHIN_NINE_TILES_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,								Name,						Value)
values
	('COMMANDER_REGIONAL_COMBAT_STRENGTH',		'AbilityType',				'ABILITY_VICTOR_COMMANDER_STRENGTH');

--level 3 promotion GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT
update ModifierArguments set Value = 100 where ModifierId = 'EDUCATOR_FASTER_MANHATTAN_PROJECT_RESEARCH' and Name = 'Amount';
update ModifierArguments set Value = 100 where ModifierId = 'EDUCATOR_FASTER_OPERATION_IVY_RESEARCH' and Name = 'Amount';	
update ModifierArguments set Value = 100 where ModifierId = 'EDUCATOR_FASTER_NUCLEAR_DEVICE_PRODUCTION' and Name = 'Amount';
update ModifierArguments set Value = 100 where ModifierId = 'EDUCATOR_FASTER_THERMONUCLEAR_DEVICE_PRODUCTION' and Name = 'Amount';	

insert or replace into GovernorPromotionModifiers (GovernorPromotionType,ModifierId) values
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'EDUCATOR_FASTER_MANHATTAN_PROJECT_RESEARCH'),
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'EDUCATOR_FASTER_OPERATION_IVY_RESEARCH'),
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'EDUCATOR_FASTER_NUCLEAR_DEVICE_PRODUCTION'),
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'EDUCATOR_FASTER_THERMONUCLEAR_DEVICE_PRODUCTION'),
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'VICTOR_AIR_UNITS_PRODUCTION'),
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'VICTOR_GDR_PRODUCTION'),
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'VICTOR_ALL_MILITARY_UNITS_PRODUCTION');

insert or replace into Modifiers	
	(ModifierId,									ModifierType)
values
	('VICTOR_SCIENCE_TRAINED_UNIT',					'MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_UNIT_COST'),
	('VICTOR_AIR_UNITS_PRODUCTION',					'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	('VICTOR_GDR_PRODUCTION',						'MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('VICTOR_ALL_MILITARY_UNITS_PRODUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_MILITARY_UNITS_PRODUCTION');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
values
	('VICTOR_SCIENCE_TRAINED_UNIT',				'UnitProductionPercent',	25),
	('VICTOR_SCIENCE_TRAINED_UNIT',				'YieldType',			'YIELD_SCIENCE'),
	('VICTOR_AIR_UNITS_PRODUCTION',				'Domain',				'DOMAIN_AIR'),
	('VICTOR_AIR_UNITS_PRODUCTION',				'Amount',				50),
	('VICTOR_ALL_MILITARY_UNITS_PRODUCTION',	'Amount',				30),
	('VICTOR_GDR_PRODUCTION',					'UnitPromotionClass',	'PROMOTION_CLASS_GIANT_DEATH_ROBOT'),
	('VICTOR_GDR_PRODUCTION',					'EraType',				'ERA_INFORMATION'),
	('VICTOR_GDR_PRODUCTION',					'Amount',				50);

insert or replace into GovernorPromotionSets
	(GovernorType,				GovernorPromotion)
values
	('GOVERNOR_THE_DEFENDER',	'GOVERNOR_PROMOTION_REDOUBT'),
	('GOVERNOR_THE_DEFENDER',	'GOVERNOR_PROMOTION_GARRISON_COMMANDER'),
	('GOVERNOR_THE_DEFENDER',	'GOVERNOR_PROMOTION_DEFENSE_LOGISTICS'),
	-- ('GOVERNOR_THE_DEFENDER',	'GOVERNOR_PROMOTION_EMBRASURE'),
	('GOVERNOR_THE_DEFENDER',	'GOVERNOR_PROMOTION_CONSCRIPTION'),
	-- ('GOVERNOR_THE_DEFENDER',	'GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT'),
	('GOVERNOR_THE_DEFENDER',	'GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT'),
	('GOVERNOR_THE_DEFENDER',	'GOVERNOR_PROMOTION_COMMANDER');

insert or replace into GovernorPromotionPrereqs
	(GovernorPromotionType,						PrereqGovernorPromotion)
values
	('GOVERNOR_PROMOTION_GARRISON_COMMANDER',	'GOVERNOR_PROMOTION_REDOUBT'),
	('GOVERNOR_PROMOTION_DEFENSE_LOGISTICS',	'GOVERNOR_PROMOTION_REDOUBT'),
	-- ('GOVERNOR_PROMOTION_EMBRASURE',			'GOVERNOR_PROMOTION_GARRISON_COMMANDER'),
	('GOVERNOR_PROMOTION_CONSCRIPTION',			'GOVERNOR_PROMOTION_GARRISON_COMMANDER'),
	('GOVERNOR_PROMOTION_CONSCRIPTION',			'GOVERNOR_PROMOTION_DEFENSE_LOGISTICS'),
	-- ('GOVERNOR_PROMOTION_EDUCATOR_ARMS_RACE_PROPONENT','GOVERNOR_PROMOTION_EMBRASURE'),
	('GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT',	'GOVERNOR_PROMOTION_CONSCRIPTION'),
	('GOVERNOR_PROMOTION_COMMANDER',			'GOVERNOR_PROMOTION_CONSCRIPTION');

-- 梁总督修改 by PineApple

-- update GovernorPromotionModifiers set ModifierId = 'AQUACULTURE_ADDITIONAL_PRODUCTION' where GovernorPromotionType = 'GOVERNOR_PROMOTION_AQUACULTURE';
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_AQUACULTURE';
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_WATER_WORKS';
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_ZONING_COMMISSIONER';

insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType, 									ModifierId)
values
	('GOVERNOR_PROMOTION_BUILDER_GUILDMASTER',					'GUILDMASTER_TRAINED_BUILDER_MOVEMENT'),
	-- ('GOVERNOR_PROMOTION_ZONING_COMMISSIONER',					'ZONING_COMMISSIONER_FASTER_BUILDING_CONSTRUCTION'),
	('GOVERNOR_PROMOTION_ZONING_COMMISSIONER',					'ARCHITECTURE_MASTER_WONDERS_BOOST'),
	('GOVERNOR_PROMOTION_AQUACULTURE',							'AQUACULTURE_ADDITIONAL_PRODUCTION'),
	('GOVERNOR_PROMOTION_AQUACULTURE',							'AQUACULTURE_POP_PRODUCTION'),
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE',			'REINFORCED_INFRASTRUCTURE_ENCAMPMENT_ADJACENCY'),
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE',			'REINFORCED_INFRASTRUCTURE_ENCAMPMENT_ADJACENCY_PRO'),
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE',			'REINFORCED_INFRASTRUCTURE_HOLY_SITE_ADJACENCY'),
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE',			'REINFORCED_INFRASTRUCTURE_CAMPUS_ADJACENCY'),
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE',			'REINFORCED_INFRASTRUCTURE_THEATER_ADJACENCY'),
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE',			'REINFORCED_INFRASTRUCTURE_INDUSTRIAL_ZONE_ADJACENCY'),
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE',			'REINFORCED_INFRASTRUCTURE_COMMERCIAL_HUB_ADJACENCY'),
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE',			'REINFORCED_INFRASTRUCTURE_HARBOR_ADJACENCY'),
	('GOVERNOR_PROMOTION_WATER_WORKS',							'WATER_WORKS_ALLOW_PLAYER_CITY_PARK'),
	('GOVERNOR_PROMOTION_WATER_WORKS',							'WATER_WORKS_IMPROVEMENT_TOURISM'),
	('GOVERNOR_PROMOTION_WATER_WORKS',							'WATER_WORKS_NATIONAL_PARK_TOURISM');

-- 总督升级连线修改
update GovernorPromotions set column = 1 where GovernorPromotionType = 'GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE';
update GovernorPromotions set level = 3, column = 0 where GovernorPromotionType = 'GOVERNOR_PROMOTION_WATER_WORKS';
update GovernorPromotions set column = 2 where GovernorPromotionType = 'GOVERNOR_PROMOTION_PARKS_RECREATION';

delete from GovernorPromotionPrereqs where PrereqGovernorPromotion ='GOVERNOR_PROMOTION_WATER_WORKS';
delete from GovernorPromotionPrereqs where PrereqGovernorPromotion ='GOVERNOR_PROMOTION_AQUACULTURE';

insert or replace into GovernorPromotionPrereqs 
	(GovernorPromotionType, 									PrereqGovernorPromotion) 
values
	('GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE',			'GOVERNOR_PROMOTION_AQUACULTURE'),
	('GOVERNOR_PROMOTION_WATER_WORKS',							'GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE');

-- 工会首领: 工人额外+1速
-- insert or replace into Modifiers
-- 	(ModifierId,												ModifierType,									Permanent,		SubjectRequirementSetId)
-- values
-- 	('GUILDMASTER_ADDITIONAL_BUILDER_MOVEMENT',					'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',			0,				NULL),
-- 	('GUILDMASTER_ADDITIONAL_BUILDER_MOVEMENT_UNIT_MODIFIER',	'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',		1,				'UNIT_IS_BUILDER');

-- insert or replace into ModifierArguments
-- 	(ModifierId,												Name,											Value)
-- values
-- 	('GUILDMASTER_ADDITIONAL_BUILDER_MOVEMENT',					'ModifierId',									'GUILDMASTER_ADDITIONAL_BUILDER_MOVEMENT_UNIT_MODIFIER'),
-- 	('GUILDMASTER_ADDITIONAL_BUILDER_MOVEMENT_UNIT_MODIFIER',	'Amount',										1);

insert or replace into Modifiers
	(ModifierId,										ModifierType,											Permanent,	SubjectRequirementSetId)
values
	('GUILDMASTER_TRAINED_BUILDER_MOVEMENT',			'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',					0,			NULL),
	('GUILDMASTER_TRAINED_BUILDER_MOVEMENT_MODIFIER',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	1,			'UNIT_IS_BUILDER');

insert or replace into ModifierArguments
 	(ModifierId,										Name,			Value)
values
 	('GUILDMASTER_TRAINED_BUILDER_MOVEMENT',			'ModifierId',	'GUILDMASTER_TRAINED_BUILDER_MOVEMENT_MODIFIER'),
 	('GUILDMASTER_TRAINED_BUILDER_MOVEMENT_MODIFIER',	'AbilityType',	'ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT');

-- 耕樵渔猎（原水产养殖）：改良地块+1锤
insert or replace into Modifiers
	(ModifierId,												ModifierType,												SubjectRequirementSetId)
values
	('AQUACULTURE_POP_PRODUCTION',								'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	NULL),
	('AQUACULTURE_ADDITIONAL_PRODUCTION',						'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'PLOT_IS_IMPROVED');

insert or replace into ModifierArguments
	(ModifierId,												Name,											Value)
values
	('AQUACULTURE_POP_PRODUCTION',								'YieldType',									'YIELD_PRODUCTION'),
	('AQUACULTURE_POP_PRODUCTION',								'Amount',										0.5),
	('AQUACULTURE_ADDITIONAL_PRODUCTION',						'YieldType',									'YIELD_PRODUCTION'), -- ,YIELD_FOOD
	('AQUACULTURE_ADDITIONAL_PRODUCTION',						'Amount',										'1'); -- ,1

-- 规划委员：建造区域、建筑+30%面板锤
-- update Modifiers set ModifierType = 'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER' 
-- 	where ModifierId = 'ZONING_COMMISSIONER_FASTER_DISTRICT_CONSTRUCTION';

-- insert or replace into Modifiers
-- 	(ModifierId,												ModifierType)
-- values
-- 	('ZONING_COMMISSIONER_FASTER_BUILDING_CONSTRUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_MODIFIER');

-- insert or replace into ModifierArguments
-- 	(ModifierId,												Name,											Value)
-- values
-- 	('ZONING_COMMISSIONER_FASTER_DISTRICT_CONSTRUCTION',		'Amount',										30),
-- 	('ZONING_COMMISSIONER_FASTER_BUILDING_CONSTRUCTION',		'Amount',										30);

--改为加速
-- update ModifierArguments set Value = 30 where ModifierId = 'ZONING_COMMISSIONER_FASTER_DISTRICT_CONSTRUCTION';
-- insert or replace into Modifiers
-- 	(ModifierId,												ModifierType)
-- values
-- 	('ZONING_COMMISSIONER_FASTER_BUILDING_CONSTRUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER');
-- insert or replace into ModifierArguments
--  	(ModifierId,											Name,		Value)
-- values
-- 	('ZONING_COMMISSIONER_FASTER_BUILDING_CONSTRUCTION',	'Amount',	30),
-- 	('ZONING_COMMISSIONER_FASTER_BUILDING_CONSTRUCTION',	'IsWonder',	0);

-- 梁左一：建筑大师，奇观加速20%，奇观完成返10%大工点数（lua实现）
insert or replace into Modifiers
	(ModifierId,									ModifierType)
values
	('ARCHITECTURE_MASTER_WONDERS_BOOST',			'MODIFIER_SINGLE_CITY_ADJUST_WONDER_PRODUCTION');

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	('ARCHITECTURE_MASTER_WONDERS_BOOST',			'Amount',		20);

-- 自来水工程：增加区域相邻额外100%
insert or replace into Modifiers
	(ModifierId,												ModifierType,										SubjectRequirementSetId)
values
	('REINFORCED_INFRASTRUCTURE_ENCAMPMENT_ADJACENCY',			'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_ENCAMPMENT'),
	('REINFORCED_INFRASTRUCTURE_HOLY_SITE_ADJACENCY',			'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_HOLY_SITE'),
	('REINFORCED_INFRASTRUCTURE_CAMPUS_ADJACENCY',				'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_CAMPUS'),
	('REINFORCED_INFRASTRUCTURE_THEATER_ADJACENCY',				'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_THEATER'),
	('REINFORCED_INFRASTRUCTURE_INDUSTRIAL_ZONE_ADJACENCY',		'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_INDUSTRIAL_ZONE'),
	('REINFORCED_INFRASTRUCTURE_COMMERCIAL_HUB_ADJACENCY',		'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_COMMERCIAL_HUB'),
	('REINFORCED_INFRASTRUCTURE_HARBOR_ADJACENCY',				'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_HARBOR');

insert or replace into ModifierArguments
	(ModifierId,												Name,											Value)
values
	('REINFORCED_INFRASTRUCTURE_ENCAMPMENT_ADJACENCY',			'YieldType',									'YIELD_PRODUCTION'),
	('REINFORCED_INFRASTRUCTURE_ENCAMPMENT_ADJACENCY',			'Amount',										100),
	('REINFORCED_INFRASTRUCTURE_HOLY_SITE_ADJACENCY',			'YieldType',									'YIELD_FAITH'),
	('REINFORCED_INFRASTRUCTURE_HOLY_SITE_ADJACENCY',			'Amount',										100),
	('REINFORCED_INFRASTRUCTURE_CAMPUS_ADJACENCY',				'YieldType',									'YIELD_SCIENCE'),
	('REINFORCED_INFRASTRUCTURE_CAMPUS_ADJACENCY',				'Amount',										100),
	('REINFORCED_INFRASTRUCTURE_THEATER_ADJACENCY',				'YieldType',									'YIELD_CULTURE'),
	('REINFORCED_INFRASTRUCTURE_THEATER_ADJACENCY',				'Amount',										100),
	('REINFORCED_INFRASTRUCTURE_INDUSTRIAL_ZONE_ADJACENCY',		'YieldType',									'YIELD_PRODUCTION'),
	('REINFORCED_INFRASTRUCTURE_INDUSTRIAL_ZONE_ADJACENCY',		'Amount',										100),
	('REINFORCED_INFRASTRUCTURE_COMMERCIAL_HUB_ADJACENCY',		'YieldType',									'YIELD_GOLD'),
	('REINFORCED_INFRASTRUCTURE_COMMERCIAL_HUB_ADJACENCY',		'Amount',										100),
	('REINFORCED_INFRASTRUCTURE_HARBOR_ADJACENCY',				'YieldType',									'YIELD_GOLD'),
	('REINFORCED_INFRASTRUCTURE_HARBOR_ADJACENCY',				'Amount',										100);

-- 市立公园：就职时一环全产出+1，可以修在泛滥平原上。
delete from ImprovementModifiers where ModifierId = 'CITY_PARK_WATER_AMENITY';
delete from ImprovementModifiers where ModifierId = 'CITY_PARK_GOVERNOR_CULTURE';
update Improvements set PrereqCivic = null where ImprovementType = 'IMPROVEMENT_CITY_PARK';

insert or replace into ImprovementModifiers
	(ImprovementType,											ModifierID)
values
	('IMPROVEMENT_CITY_PARK',									'CITY_PARK_GOVERNOR_FOOD'),
	('IMPROVEMENT_CITY_PARK',									'CITY_PARK_GOVERNOR_PRODUCTION'),
	('IMPROVEMENT_CITY_PARK',									'CITY_PARK_GOVERNOR_SCIENCE'),
	('IMPROVEMENT_CITY_PARK',									'CITY_PARK_GOVERNOR_CULTURE_NEW'),
	('IMPROVEMENT_CITY_PARK',									'CITY_PARK_GOVERNOR_FAITH'),
	('IMPROVEMENT_CITY_PARK',									'CITY_PARK_GOVERNOR_GOLD');

insert or replace into Modifiers
	(ModifierId,												ModifierType,									OwnerRequirementSetId,							SubjectRequirementSetId)
values
	('CITY_PARK_GOVERNOR_FOOD',									'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION',	'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('CITY_PARK_GOVERNOR_PRODUCTION',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION',	'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('CITY_PARK_GOVERNOR_SCIENCE',								'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION',	'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('CITY_PARK_GOVERNOR_CULTURE_NEW',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION',	'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('CITY_PARK_GOVERNOR_FAITH',								'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION',	'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('CITY_PARK_GOVERNOR_GOLD',									'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION',	'REQUIRE_PLOT_ADJACENT_TO_OWNER');

insert or replace into ModifierArguments
	(ModifierId,												Name,											Value)
values
	('CITY_PARK_GOVERNOR_FOOD',									'YieldType',									'YIELD_FOOD'),
	('CITY_PARK_GOVERNOR_FOOD',									'Amount',										1),
	('CITY_PARK_GOVERNOR_PRODUCTION',							'YieldType',									'YIELD_PRODUCTION'),
	('CITY_PARK_GOVERNOR_PRODUCTION',							'Amount',										1),
	('CITY_PARK_GOVERNOR_SCIENCE',								'YieldType',									'YIELD_SCIENCE'),
	('CITY_PARK_GOVERNOR_SCIENCE',								'Amount',										1),
	('CITY_PARK_GOVERNOR_CULTURE_NEW',							'YieldType',									'YIELD_CULTURE'),
	('CITY_PARK_GOVERNOR_CULTURE_NEW',							'Amount',										1),
	('CITY_PARK_GOVERNOR_FAITH',								'YieldType',									'YIELD_FAITH'),
	('CITY_PARK_GOVERNOR_FAITH',								'Amount',										1),
	('CITY_PARK_GOVERNOR_GOLD',									'YieldType',									'YIELD_GOLD'),
	('CITY_PARK_GOVERNOR_GOLD',									'Amount',										1);

insert or replace into Improvement_ValidFeatures
	(ImprovementType,											FeatureType)
values
	('IMPROVEMENT_CITY_PARK',									'FEATURE_FLOODPLAINS'),
	('IMPROVEMENT_CITY_PARK',									'FEATURE_FLOODPLAINS_GRASSLAND'),
	('IMPROVEMENT_CITY_PARK',									'FEATURE_FLOODPLAINS_PLAINS');

-- update Improvements set PrereqCivic = 'CIVIC_GUILDS' where ImprovementType = 'IMPROVEMENT_CITY_PARK';
-- update Improvements set PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES' where ImprovementType = 'IMPROVEMENT_CITY_PARK';

-- 世外天堂：代替自来水工程，本城所有改良设施和国家公园旅游业绩+200%
insert or replace into Modifiers
	(ModifierId,							ModifierType,								SubjectRequirementSetId,		RunOnce,	Permanent)
values
	('WATER_WORKS_ALLOW_PLAYER_CITY_PARK',	'MODIFIER_PLAYER_ADJUST_VALID_IMPROVEMENT',	'PLAYER_HAS_CIVIC_URBANIZATION',	1,	1);

insert or replace into Modifiers
	(ModifierId,												ModifierType)
values
	('WATER_WORKS_IMPROVEMENT_TOURISM',							'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_TOURISM'),
	('WATER_WORKS_NATIONAL_PARK_TOURISM',						'MODIFIER_SINGLE_CITY_ADJUST_NATIONAL_PARK_TOURISM');

insert or replace into ModifierArguments
	(ModifierId,												Name,											Value)
values
	('WATER_WORKS_ALLOW_PLAYER_CITY_PARK',						'ImprovementType',								'IMPROVEMENT_CITY_PARK'),
	('WATER_WORKS_IMPROVEMENT_TOURISM',							'Amount',										200),
	('WATER_WORKS_NATIONAL_PARK_TOURISM',						'Amount',										200);

-- fishery now available to all major civs without Liang
update Improvements set TraitType = NULL, PrereqTech = 'TECH_SHIPBUILDING' where ImprovementType = 'IMPROVEMENT_FISHERY';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_FISHERY';
update Improvements
set
    Housing             = 1,
    TilesRequired       = 2,
    SameAdjacentValid   = 0,
    AdjacentSeaResource = 0,
    Workable            = 1
where ImprovementType = 'IMPROVEMENT_FISHERY';

insert or ignore into ImprovementModifiers
	(ImprovementType,			ModifierId)
values
    ('IMPROVEMENT_FISHERY',		'FISHERY_HOUSING_WITH_SCIENTIFIC_THEORY'),
    ('IMPROVEMENT_FISHERY',		'FISHERY_EXTRA_GOLD_ON_FEATURE');
insert or ignore into Modifiers
	(ModifierID,									ModifierType,											SubjectRequirementSetId)
values
    ('FISHERY_HOUSING_WITH_SCIENTIFIC_THEORY',		'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_HOUSING',		'PLAYER_HAS_SCIENTIFIC_THEORY_REQUIREMENTS'),
	('FISHERY_EXTRA_GOLD_ON_FEATURE',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',				'PLOT_HAS_ANY_FEATURE');
insert or ignore into ModifierArguments
	(ModifierID,									Name,				Value)
values
    ('FISHERY_HOUSING_WITH_SCIENTIFIC_THEORY',		'Amount',		1),
    ('FISHERY_EXTRA_GOLD_ON_FEATURE',				'YieldType',	'YIELD_GOLD'),
    ('FISHERY_EXTRA_GOLD_ON_FEATURE',				'Amount',		4);
insert or replace into Improvement_BonusYieldChanges
	(Id,	ImprovementType,			YieldType,				BonusYieldChange,	PrereqCivic,					PrereqTech)
values
	(710,	'IMPROVEMENT_FISHERY',		'YIELD_GOLD',			2,					'CIVIC_NAVAL_TRADITION',		null),
	(711,	'IMPROVEMENT_FISHERY',		'YIELD_FOOD',			1,					null,							'TECH_CARTOGRAPHY'),
	(712,	'IMPROVEMENT_FISHERY',		'YIELD_PRODUCTION',		1,					'CIVIC_COLONIALISM',			null),
	(713,	'IMPROVEMENT_FISHERY',		'YIELD_GOLD',			2,					null,							'TECH_PLASTICS');
insert or ignore into Improvement_Adjacencies (ImprovementType, YieldChangeId) values
    ('IMPROVEMENT_FISHERY', 'Fishery_SeaResourceAdjacency');
update Adjacency_YieldChanges set YieldType = 'YIELD_GOLD', YieldChange = 2 where ID = 'Fishery_SeaResourceAdjacency';
insert or replace into Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) values
    ('IMPROVEMENT_FISHERY', 'YIELD_FOOD',       2),
    ('IMPROVEMENT_FISHERY', 'YIELD_PRODUCTION', 0),
    ('IMPROVEMENT_FISHERY', 'YIELD_GOLD',		0);
--bishop
--level 0 GOVERNOR_PROMOTION_CARDINAL_BISHOP
--LEVEL 1-0 GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR
--LEVEL 1-2 GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS
--LEVEL 2-1 GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD
--LEVEL 3-0 GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT
--LEVEL 3-2 GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT

update Governors set TransitionStrength = 150 where GovernorType = 'GOVERNOR_THE_CARDINAL';
update ModifierArguments set Value = 2 where ModifierId = 'BISHOP_FAITH_POP' and Name = 'Amount';
delete from GovernorPromotionModifiers where ModifierId = 'CARDINAL_BISHOP_FAITH_DISTRICT';
delete from GovernorPromotionModifiers where ModifierId = 'CARDINAL_CITADEL_OF_GOD_PRESSURE';
delete from GovernorPromotionModifiers where ModifierId = 'CARDINAL_CITADEL_OF_GOD_COMBAT';
delete from GovernorPromotionModifiers where ModifierId = 'CARDINAL_CITADEL_OF_GOD_FAITH_FINISH_BUILDINGS';
delete from GovernorPromotionModifiers where ModifierId = 'CARDINAL_GRAND_INQUISITOR_COMBAT';
delete from GovernorPromotionModifiers where ModifierId = 'CARDINAL_LAYING_ON_OF_HANDS_RELIGIOUS_HEAL';
delete from GovernorPromotionModifiers where ModifierId = 'CARDINAL_LAYING_ON_OF_HANDS_HEAL';
delete from GovernorPromotionModifiers where ModifierId = 'CARDINAL_FAITH_PURCHASE_DISTRICT';

insert or replace into GovernorPromotionModifiers 
	(GovernorPromotionType,								ModifierId) 
values
	('GOVERNOR_PROMOTION_CARDINAL_BISHOP',				'BISHOP_FAITH_POP'),
	('GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR',	'BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_MOVEMENT'),
	('GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR',	'BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_CHARGES'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR',	'BISHOP_APOSTLE_PURCHASE_DISCOUNT'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR',	'BISHOP_MISSIONARY_PURCHASE_DISCOUNT'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR',	'BISHOP_GURU_PURCHASE_DISCOUNT'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR',	'BISHOP_MONK_PURCHASE_DISCOUNT'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR',	'BISHOP_INQUISITOR_PURCHASE_DISCOUNT'),
	('GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS',	'BISHOP_HOLYSITE_DOUBLE_ADJACENCY_FOUR_TILES'),
	('GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS',	'BISHOP_HOLYSITE_ADJACENCY_CONVERT_TOURISM_FOUR_TILES'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS',	'BISHOP_PERCENTAGE_FAITH'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS',	'BISHOP_RELIC_FAITH1'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS',	'BISHOP_RELIC_TOURISM1'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS',	'BISHOP_PERCENTAGE_FAITH'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'BISHOP_CAMPUS_CONVERT_FAITH'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'BISHOP_THEATER_CONVERT_FAITH'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'BISHOP_INDUSTRIAL_ZONE_CONVERT_FAITH'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'BISHOP_COMMERCIAL_HUB_CONVERT_FAITH'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'BISHOP_HARBOR_CONVERT_FAITH'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'BISHOP_THANH_CONVERT_FAITH'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'BISHOP_HOLY_SITE_ADJACENCY_CONVERT_TOURISM'),
	('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'CARDINAL_EXTRA_DISTRICT'),
	('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'CARDINAL_FAITH_PURCHASE_HOLYSITE_BUILDINGS'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'CARDINAL_FAITH_PURCHASE_SHRINE'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'CARDINAL_FAITH_PURCHASE_TEMPLE'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'CARDINAL_FAITH_PURCHASE_STAVE_CHURCH'),
	-- ('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'CARDINAL_FAITH_PURCHASE_PRASAT'),
	('GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD',		'CARDINAL_FAITH_PURCHASE_DISTRICT'),
	('GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT',		'BISHOP_TRAINED_MONK_EXTRA_COMBAT_STRENGTH'),
	('GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT',		'BISHOP_TRAINED_MONK_FASTER_EXP'),
	('GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT',	'BISHOP_RELIC_FAITH1'),
	('GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT',	'BISHOP_RELIC_TOURISM2');

insert or replace into Modifiers	
	(ModifierId,												ModifierType,													Permanent,	SubjectRequirementSetId)
values
	('BISHOP_FAITH_POP',										'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',				0,	NULL),
	('BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_CHARGES',				'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',									0,	NULL),
	('BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_CHARGES_MODIFIER',	'MODIFIER_SINGLE_CITY_RELIGIOUS_SPREADS',								1,	'UNIT_IS_RELIGOUS_ALL'),
	('BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_MOVEMENT',			'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',									0,	NULL),
	('BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_MOVEMENT_MODIFIER',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',					1,	'UNIT_IS_RELIGOUS_ALL_AND_MONK'),
	-- ('BISHOP_APOSTLE_PURCHASE_DISCOUNT',						'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',						0,	NULL),
	-- ('BISHOP_MISSIONARY_PURCHASE_DISCOUNT',						'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',						0,	NULL),
	-- ('BISHOP_GURU_PURCHASE_DISCOUNT',							'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',						0,	NULL),
	-- ('BISHOP_MONK_PURCHASE_DISCOUNT',							'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',						0,	NULL),
	-- ('BISHOP_INQUISITOR_PURCHASE_DISCOUNT',						'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',						0,	NULL),
	('BISHOP_RELIC_FAITH1',										'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD',							0,	NULL),
	-- ('BISHOP_RELIC_TOURISM1',									'MODIFIER_SINGLE_CITY_ADJUST_TOURISM',									0,	NULL),
	('BISHOP_HOLYSITE_DOUBLE_ADJACENCY_FOUR_TILES',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',						0,	'DISTRICT_IS_HOLY_SITE_WITHIN_FOUR_TILES_REQUIREMENTS'),
	('BISHOP_HOLYSITE_ADJACENCY_CONVERT_TOURISM_FOUR_TILES',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',	0,	'DISTRICT_IS_HOLY_SITE_WITHIN_FOUR_TILES_REQUIREMENTS'),
	-- ('BISHOP_PERCENTAGE_FAITH',									'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',						0,	NULL),
	-- ('BISHOP_CAMPUS_CONVERT_FAITH',								'MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	0,	NULL),
	-- ('BISHOP_THEATER_CONVERT_FAITH',							'MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	0,	NULL),
	-- ('BISHOP_INDUSTRIAL_ZONE_CONVERT_FAITH',					'MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	0,	NULL),
	-- ('BISHOP_COMMERCIAL_HUB_CONVERT_FAITH',						'MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	0,	NULL),
	-- ('BISHOP_HARBOR_CONVERT_FAITH',								'MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	0,	NULL),
	-- ('BISHOP_THANH_CONVERT_FAITH',								'MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	0,	NULL),
	-- ('BISHOP_HOLY_SITE_ADJACENCY_CONVERT_TOURISM',				'MODIFIER_SINGLE_CITY_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',			0,	NULL),
	('CARDINAL_EXTRA_DISTRICT',									'MODIFIER_SINGLE_CITY_EXTRA_DISTRICT',									0,	NULL),
	('CARDINAL_FAITH_PURCHASE_HOLYSITE_BUILDINGS',				'MODIFIER_CITY_ENABLE_BUILDING_FAITH_PURCHASE',							0,	NULL),
	-- ('CARDINAL_FAITH_PURCHASE_SHRINE',							'MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',				0,	NULL),
	-- ('CARDINAL_FAITH_PURCHASE_TEMPLE',							'MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',				0,	NULL),
	-- ('CARDINAL_FAITH_PURCHASE_STAVE_CHURCH',					'MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',				0,	NULL),
	-- ('CARDINAL_FAITH_PURCHASE_PRASAT',							'MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',				0,	NULL),
	('BISHOP_TRAINED_MONK_EXTRA_COMBAT_STRENGTH',				'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',									0,	NULL),
	('BISHOP_TRAINED_MONK_FASTER_EXP',							'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',									0,	NULL),
	('BISHOP_TRAINED_MONK_EXTRA_COMBAT_STRENGTH_MODIFIER',		'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',					1,	NULL),
	('BISHOP_TRAINED_MONK_FASTER_EXP_MODIFIER',					'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',					1,	NULL),
	('BISHOP_RELIC_TOURISM2',									'MODIFIER_SINGLE_CITY_ADJUST_TOURISM',									0,	NULL);

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
values
	('BISHOP_FAITH_POP',									'YieldType',			'YIELD_FAITH'),
	('BISHOP_FAITH_POP',									'Amount',				1),
	('BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_CHARGES',			'ModifierId',			'BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_CHARGES_MODIFIER'),
	('BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_CHARGES_MODIFIER','Amount',				1),
	('BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_MOVEMENT',		'ModifierId',			'BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_MOVEMENT_MODIFIER'),
	('BISHOP_TRAINED_RELIGIOUS_UNIT_EXTRA_MOVEMENT_MODIFIER','AbilityType',			'ABILITY_BISHOP_EXTRA_MOVEMENT'),
	-- ('BISHOP_APOSTLE_PURCHASE_DISCOUNT',					'UnitType',				'UNIT_APOSTLE'),
	-- ('BISHOP_APOSTLE_PURCHASE_DISCOUNT',					'Amount',				10),
	-- ('BISHOP_MISSIONARY_PURCHASE_DISCOUNT',					'UnitType',				'UNIT_MISSIONARY'),
	-- ('BISHOP_MISSIONARY_PURCHASE_DISCOUNT',					'Amount',				10),
	-- ('BISHOP_GURU_PURCHASE_DISCOUNT',						'UnitType',				'UNIT_GURU'),
	-- ('BISHOP_GURU_PURCHASE_DISCOUNT',						'Amount',				10),
	-- ('BISHOP_MONK_PURCHASE_DISCOUNT',						'UnitType',				'UNIT_WARRIOR_MONK'),
	-- ('BISHOP_MONK_PURCHASE_DISCOUNT',						'Amount',				10),
	-- ('BISHOP_INQUISITOR_PURCHASE_DISCOUNT',					'UnitType',				'UNIT_INQUISITOR'),
	-- ('BISHOP_INQUISITOR_PURCHASE_DISCOUNT',					'Amount',				10),
	('BISHOP_RELIC_FAITH1',									'GreatWorkObjectType',	'GREATWORKOBJECT_RELIC'),
	('BISHOP_RELIC_FAITH1',									'YieldType',			'YIELD_FAITH'),
	('BISHOP_RELIC_FAITH1',									'ScalingFactor',		150),
	-- ('BISHOP_RELIC_TOURISM1',								'GreatWorkObjectType',	'GREATWORKOBJECT_RELIC'),
	-- ('BISHOP_RELIC_TOURISM1',								'ScalingFactor',		200),
	('BISHOP_HOLYSITE_DOUBLE_ADJACENCY_FOUR_TILES',			'YieldType',		'YIELD_FAITH'),
	('BISHOP_HOLYSITE_DOUBLE_ADJACENCY_FOUR_TILES',			'Amount',			100),
	('BISHOP_HOLYSITE_ADJACENCY_CONVERT_TOURISM_FOUR_TILES', 'YieldType',		'YIELD_FAITH'),
	('BISHOP_HOLYSITE_ADJACENCY_CONVERT_TOURISM_FOUR_TILES', 'Amount',			100),
	-- ('BISHOP_PERCENTAGE_FAITH',								'YieldType',			'YIELD_FAITH'),
	-- ('BISHOP_PERCENTAGE_FAITH',								'Amount',				15),
	-- ('BISHOP_CAMPUS_CONVERT_FAITH',							'YieldTypeToMirror',	'YIELD_SCIENCE'),
	-- ('BISHOP_CAMPUS_CONVERT_FAITH',							'YieldTypeToGrant',		'YIELD_FAITH'),
	-- ('BISHOP_THEATER_CONVERT_FAITH',						'YieldTypeToMirror',	'YIELD_CULTURE'),
	-- ('BISHOP_THEATER_CONVERT_FAITH',						'YieldTypeToGrant',		'YIELD_FAITH'),
	-- ('BISHOP_COMMERCIAL_HUB_CONVERT_FAITH',					'YieldTypeToMirror',	'YIELD_GOLD'),
	-- ('BISHOP_COMMERCIAL_HUB_CONVERT_FAITH',					'YieldTypeToGrant',		'YIELD_FAITH'),
	-- ('BISHOP_INDUSTRIAL_ZONE_CONVERT_FAITH',				'YieldTypeToMirror',	'YIELD_PRODUCTION'),
	-- ('BISHOP_INDUSTRIAL_ZONE_CONVERT_FAITH',				'YieldTypeToGrant',		'YIELD_FAITH'),
	-- ('BISHOP_HARBOR_CONVERT_FAITH',							'YieldTypeToMirror',	'YIELD_GOLD'),
	-- ('BISHOP_HARBOR_CONVERT_FAITH',							'YieldTypeToGrant',		'YIELD_FAITH'),
	-- ('BISHOP_THANH_CONVERT_FAITH',							'YieldTypeToMirror',	'YIELD_CULTURE'),
	-- ('BISHOP_THANH_CONVERT_FAITH',							'YieldTypeToGrant',		'YIELD_FAITH'),
	-- ('BISHOP_HOLY_SITE_ADJACENCY_CONVERT_TOURISM',			'YieldType',			'YIELD_FAITH'),
	-- ('BISHOP_HOLY_SITE_ADJACENCY_CONVERT_TOURISM',			'Amount',				100),
	('CARDINAL_EXTRA_DISTRICT',								'Amount',				1),
	('CARDINAL_FAITH_PURCHASE_HOLYSITE_BUILDINGS',			'DistrictType',			'DISTRICT_HOLY_SITE'),
	-- ('CARDINAL_FAITH_PURCHASE_SHRINE',						'BuildingType',			'BUILDING_SHRINE'),
	-- ('CARDINAL_FAITH_PURCHASE_TEMPLE',						'BuildingType',			'BUILDING_TEMPLE'),
	-- ('CARDINAL_FAITH_PURCHASE_STAVE_CHURCH',				'BuildingType',			'BUILDING_STAVE_CHURCH'), --If enabled, need DLC support
	-- ('CARDINAL_FAITH_PURCHASE_PRASAT',						'BuildingType',			'BUILDING_PRASAT'), --If enabled, need DLC support
	('BISHOP_TRAINED_MONK_EXTRA_COMBAT_STRENGTH',			'ModifierId',			'BISHOP_TRAINED_MONK_EXTRA_COMBAT_STRENGTH_MODIFIER'),
	('BISHOP_TRAINED_MONK_EXTRA_COMBAT_STRENGTH_MODIFIER',	'AbilityType',			'ABILITY_BISHOP_TRAINED_UNIT_STRENGTH'),	
	('BISHOP_TRAINED_MONK_FASTER_EXP',						'ModifierId',			'BISHOP_TRAINED_MONK_FASTER_EXP_MODIFIER'),
	('BISHOP_TRAINED_MONK_FASTER_EXP_MODIFIER',				'AbilityType',			'ABILITY_BISHOP_TRAINED_UNIT_EXP'),
	('BISHOP_RELIC_TOURISM2',								'GreatWorkObjectType',	'GREATWORKOBJECT_RELIC'),
	('BISHOP_RELIC_TOURISM2',								'ScalingFactor',		400);

--------------------------------------------------------------------------------------------------------------------------------
--Educator
update ModifierArguments set Value = 300 where ModifierId = 'CURATOR_DOUBLE_SCULPTURE_TOURISM' and Name = 'ScalingFactor';
update ModifierArguments set Value = 300 where ModifierId = 'CURATOR_DOUBLE_PORTRAIT_TOURISM' and Name = 'ScalingFactor';
update ModifierArguments set Value = 300 where ModifierId = 'CURATOR_DOUBLE_LANDSCAPE_TOURISM' and Name = 'ScalingFactor';
update ModifierArguments set Value = 300 where ModifierId = 'CURATOR_DOUBLE_RELIGIOUS_TOURISM' and Name = 'ScalingFactor';
update ModifierArguments set Value = 300 where ModifierId = 'CURATOR_DOUBLE_MUSIC_TOURISM' and Name = 'ScalingFactor';
update ModifierArguments set Value = 300 where ModifierId = 'CURATOR_DOUBLE_WRITING_TOURISM' and Name = 'ScalingFactor';

update ModifierArguments set Value = 1.2 where (ModifierId = 'RESEARCHER_SCIENCE_CITIZEN' or ModifierId = 'CONNOISSEUR_CULTURE_CITIZEN') and Name = 'Amount';
update ModifierArguments set Value = 20 where (ModifierId = 'LIBRARIAN_CULTURE_YIELD_BONUS' or ModifierId = 'LIBRARIAN_SCIENCE_YIELD_BONUS') and Name = 'Amount';

	-- 太空计划 改名 科教兴国
update GovernorPromotions set Description = 'LOC_GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE_DESCRIPTION_HD' where GovernorPromotionType = 'GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE';

insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,								ModifierId)
values
	('GOVERNOR_PROMOTION_MERCHANT_CURATOR',				'CURATOR_DOUBLE_ARTIFACT_TOURISM'),
	('GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE',	'EDUCATOR_CAMPUS_TIER1_SCIENCE'),
	('GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE',	'EDUCATOR_CAMPUS_TIER1_SCIENCE_MODIFIER'),
	('GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE',	'EDUCATOR_CAMPUS_TIER2_SCIENCE'),
	('GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE',	'EDUCATOR_CAMPUS_TIER2_SCIENCE_MODIFIER'),
	('GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE',	'EDUCATOR_CAMPUS_TIER3_SCIENCE'),
	('GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE',	'EDUCATOR_CAMPUS_TIER3_SCIENCE_MODIFIER');

insert or replace into Modifiers
	(ModifierId,									ModifierType,											SubjectRequirementSetId)
values
	('CURATOR_DOUBLE_ARTIFACT_TOURISM',				'MODIFIER_SINGLE_CITY_ADJUST_TOURISM',					Null),
	('EDUCATOR_CAMPUS_TIER1_SCIENCE',				'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',				'HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING_REQUIREMENTS'),
	('EDUCATOR_CAMPUS_TIER1_SCIENCE_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',		'HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING_REQUIREMENTS'),
	('EDUCATOR_CAMPUS_TIER2_SCIENCE',				'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',				'HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING_REQUIREMENTS'),
	('EDUCATOR_CAMPUS_TIER2_SCIENCE_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',		'HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING_REQUIREMENTS'),
	('EDUCATOR_CAMPUS_TIER3_SCIENCE',				'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',				'HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING_REQUIREMENTS'),
	('EDUCATOR_CAMPUS_TIER3_SCIENCE_MODIFIER',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',		'HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	('CURATOR_DOUBLE_ARTIFACT_TOURISM',				'GreatWorkObjectType',	'GREATWORKOBJECT_ARTIFACT'),
	('CURATOR_DOUBLE_ARTIFACT_TOURISM',				'ScalingFactor',		300),
	('EDUCATOR_CAMPUS_TIER1_SCIENCE',				'YieldType',	'YIELD_SCIENCE'),
	('EDUCATOR_CAMPUS_TIER1_SCIENCE',				'Amount',		5),
	('EDUCATOR_CAMPUS_TIER1_SCIENCE_MODIFIER',		'YieldType',	'YIELD_SCIENCE'),
	('EDUCATOR_CAMPUS_TIER1_SCIENCE_MODIFIER',		'Amount',		10),
	('EDUCATOR_CAMPUS_TIER2_SCIENCE',				'YieldType',	'YIELD_SCIENCE'),
	('EDUCATOR_CAMPUS_TIER2_SCIENCE',				'Amount',		5),
	('EDUCATOR_CAMPUS_TIER2_SCIENCE_MODIFIER',		'YieldType',	'YIELD_SCIENCE'),
	('EDUCATOR_CAMPUS_TIER2_SCIENCE_MODIFIER',		'Amount',		10),
	('EDUCATOR_CAMPUS_TIER3_SCIENCE',				'YieldType',	'YIELD_SCIENCE'),
	('EDUCATOR_CAMPUS_TIER3_SCIENCE',				'Amount',		5),
	('EDUCATOR_CAMPUS_TIER3_SCIENCE_MODIFIER',		'YieldType',	'YIELD_SCIENCE'),
	('EDUCATOR_CAMPUS_TIER3_SCIENCE_MODIFIER',		'Amount',		10);

-----------------------------------------------------------------------------------------------------------------------------------
-- Amani阿玛尼外交官
update ModifierArguments set Value = 3 where ModifierId = 'EMISSARY_IDENTITY_PRESSURE_TO_FOREIGN_CITIES' and Name = 'Amount';
--LEVEL 0 GOVERNOR_PROMOTION_AMBASSADOR_MESSENGER
--level 1-0 GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY 左一
--level 1-2 GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE 右一
--level 2-0 GOVERNOR_PROMOTION_LOCAL_INFORMANTS 左二
--level 2-2 GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR 右二
--level 3 GOVERNOR_PROMOTION_AMBASSADOR_PUPPETEER

-- 阿玛尼升级连线修改
insert into GovernorPromotionPrereqs
    (GovernorPromotionType,             						PrereqGovernorPromotion)
values
    ('GOVERNOR_PROMOTION_LOCAL_INFORMANTS',   					'GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE'),
    ('GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR',   		'GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY');


insert or replace into Governors_XP2 (GovernorType,AssignToMajor) values
	('GOVERNOR_THE_AMBASSADOR',1);
	
delete from GovernorPromotionModifiers where ModifierId = 'FOREIGN_INVESTOR_COPY_STRATEGICS_FOR_IMPORT';
insert or replace into GovernorPromotionModifiers 
	(GovernorPromotionType,								ModifierId) 
values
	('GOVERNOR_PROMOTION_AMBASSADOR_MESSENGER',			'MESSENGER_INFLUENCEPOINTS'),--阿玛尼基础影响力
	('GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY',			'AMANI_FAITH_PURCHASE_SPY'),
	('GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY',			'AMANI_FAITH_PURCHASE_SPY_DISCOUNT'),
	('GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY',			'AMANI_GRANT_SPY_FREE_PROMOTION'),
	('GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY',			'AMANI_SPY_CAPACITY'),
	('GOVERNOR_PROMOTION_LOCAL_INFORMANTS',				'MACHIAVELLIANISM_OFFENSIVESPYTIME'),
	('GOVERNOR_PROMOTION_LOCAL_INFORMANTS',				'LOCAL_INFORMANTS_OFFENSE'),
	('GOVERNOR_PROMOTION_AMBASSADOR_PUPPETEER',			'PUPPETEER_OFFENSE'),
	('GOVERNOR_PROMOTION_AMBASSADOR_PUPPETEER',			'PUPPETEER_DEFENSE'),
	('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE',			'FOREIGN_INVESTOR_COPY_STRATEGICS_FOR_IMPORT'),
	('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE',			'CONSULATE_LEVY_DISCOUNT'),
	('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE',			'BUILDING_GOV_CITYSTATES_UNIT_STRENGTH'),
	('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE',			'BUILDING_GOV_CITYSTATES_LEVERAGED_UNIT_STRENGTH'),
	('GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE',			'AMANI_EXTRA_ENVOY'),	
	('GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR',	'AMANI_HALF_RAJ_GOLD'),
	('GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR',	'AMANI_HALF_RAJ_SCIENCE'),
	('GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR',	'AMANI_HALF_RAJ_CULTURE'),
	('GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR',	'AMANI_HALF_RAJ_FAITH');
	-- ('GOVERNOR_PROMOTION_AMBASSADOR_PUPPETEER',			'MONARCHY_ENVOYS');

delete from GovernorPromotionModifiers where ModifierId = 'LOCAL_INFORMANTS_SPY_DEFENSE_BONUS';

insert or replace into Modifiers	
	(ModifierId,									ModifierType,						SubjectRequirementSetId,	Permanent)
values
	--('AMANI_CITYSTATES_LEVERAGED_UNIT_STRENGTH',	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER',				NULL,	0),
	('MESSENGER_INFLUENCEPOINTS',					'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',		'CITY_HAS_AMBASSADOR_MESSENGER_REQUIREMENTS',	0),		
	('AMANI_FAITH_PURCHASE_SPY',					'MODIFIER_SINGLE_CITY_ENABLE_UNIT_FAITH_PURCHASE',		NULL,	0),
	('AMANI_FAITH_PURCHASE_SPY_DISCOUNT',			'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',		NULL,	0),
	('AMANI_GRANT_SPY_FREE_PROMOTION',				'MODIFIER_SINGLE_CITY_ATTACH_MODIFIER',					NULL,	0),
	('AMANI_SPY_CAPACITY',							'MODIFIER_PLAYER_GRANT_SPY',							NULL,	0),	
	('AMANI_GRANT_SPY_FREE_PROMOTION_MODIFIER',		'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	NULL,	1),
	('LOCAL_INFORMANTS_OFFENSE',					'MODIFIER_PLAYER_ADJUST_SPY_BONUS',						NULL,	0),	
	('PUPPETEER_OFFENSE',							'MODIFIER_PLAYER_ADJUST_SPY_BONUS',						NULL,	0),	
	('PUPPETEER_DEFENSE',							'MODIFIER_PLAYER_ADJUST_SPY_BONUS',						NULL,	0),
	('AMANI_EXTRA_ENVOY',							'MODIFIER_GOVERNOR_ADJUST_CITY_ENVOYS',					NULL,	0),
	('AMANI_HALF_RAJ_GOLD',							'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE_PER_TRIBUTARY',	NULL,	0),
	('AMANI_HALF_RAJ_SCIENCE',						'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE_PER_TRIBUTARY',	NULL,	0),
	('AMANI_HALF_RAJ_CULTURE',						'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE_PER_TRIBUTARY',	NULL,	0),
	('AMANI_HALF_RAJ_FAITH',						'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE_PER_TRIBUTARY',	NULL,	0);

insert or replace into ModifierArguments
	(ModifierId,										Name,					Value)
values
	--('AMANI_CITYSTATES_LEVERAGED_UNIT_STRENGTH',		'ModifierId',				'AMANI_CITYSTATES_LEVERAGED_UNIT_STRENGTH_MODIFIER'),
	--('AMANI_CITYSTATES_LEVERAGED_UNIT_STRENGTH_MODIFIER','Amount',					4),
	('MESSENGER_INFLUENCEPOINTS',						'Amount',					5),	
	('AMANI_FAITH_PURCHASE_SPY',						'Tag',						'CLASS_SPY'),
	('AMANI_FAITH_PURCHASE_SPY_DISCOUNT',				'UnitType',					'UNIT_SPY'),	
	('AMANI_FAITH_PURCHASE_SPY_DISCOUNT',				'Amount',					50),
	('AMANI_GRANT_SPY_FREE_PROMOTION',					'ModifierId',				'AMANI_GRANT_SPY_FREE_PROMOTION_MODIFIER'),
	('AMANI_SPY_CAPACITY',								'Amount',					2),
	('AMANI_GRANT_SPY_FREE_PROMOTION_MODIFIER',			'AbilityType',				'ABILITY_AMANI_FERR_PROMOTION'),
	('LOCAL_INFORMANTS_OFFENSE',						'Offense',					1),
	('LOCAL_INFORMANTS_OFFENSE',						'Amount',					2),
	('PUPPETEER_OFFENSE',								'Offense',					1),
	('PUPPETEER_OFFENSE',								'Amount',					2),
	('PUPPETEER_DEFENSE',								'Offense',					0),
	('PUPPETEER_DEFENSE',								'Amount',					2),
	('AMANI_EXTRA_ENVOY',								'Amount',					1),
	('AMANI_HALF_RAJ_GOLD',								'YieldType',				'YIELD_GOLD'),
	('AMANI_HALF_RAJ_GOLD',								'Amount',					1),
	('AMANI_HALF_RAJ_SCIENCE',							'YieldType',				'YIELD_SCIENCE'),
	('AMANI_HALF_RAJ_SCIENCE',							'Amount',					1),
	('AMANI_HALF_RAJ_CULTURE',							'YieldType',				'YIELD_CULTURE'),
	('AMANI_HALF_RAJ_CULTURE',							'Amount',					1),
	('AMANI_HALF_RAJ_FAITH',							'YieldType',				'YIELD_FAITH'),
	('AMANI_HALF_RAJ_FAITH',							'Amount',					1);

-----------------------------------------------------------------------------------------------------------------------------------
-- Ibrahim
--3t就职一级：就职城市的每个人口为本城+1锤。获得单位造价25%的科技值。
--左一：建造军营建筑时额外+30%生产力。军营和军营每级建筑+3瓶。
--右一：10环内对区域+10力。
--中二：与本方和盟友的共同敌人作战时+5力。
--左二：在外国首都就职时，此文明对你不满每回合多降低5，此文明任何城市无法对您城市施加忠诚度压力。
--右二：建造军事单位加速20%。在任职城市内生产文艺复兴以后的近战和攻城单位时会额外赠送一个相同的单位。

update Governors set TransitionStrength = 150 where GovernorType = 'GOVERNOR_IBRAHIM';

-- 树调整
--level 0 GOVERNOR_PROMOTION_PASHA
--level 1-0 GOVERNOR_PROMOTION_HEAD_FALCONER
--LEVEL 1-2 GOVERNOR_PROMOTION_SERASKER
--level 2-1 GOVERNOR_PROMOTION_GRAND_VISIER
--level 3-0 GOVERNOR_PROMOTION_KHASS_ODA_BASHI
--level 3-2 GOVERNOR_PROMOTION_CAPOU_AGHA

--位置调整
update GovernorPromotions set Level = 2, Column = 1 where GovernorPromotionType = 'GOVERNOR_PROMOTION_GRAND_VISIER';
update GovernorPromotions set Level = 3, Column = 0 where GovernorPromotionType = 'GOVERNOR_PROMOTION_KHASS_ODA_BASHI';
update GovernorPromotions set Level = 3, Column = 2 where GovernorPromotionType = 'GOVERNOR_PROMOTION_CAPOU_AGHA';

--连线
delete from GovernorPromotionPrereqs where 
	   GovernorPromotionType = 'GOVERNOR_PROMOTION_PASHA'
	or GovernorPromotionType = 'GOVERNOR_PROMOTION_SERASKER' 
	or GovernorPromotionType = 'GOVERNOR_PROMOTION_KHASS_ODA_BASHI' 
	or GovernorPromotionType = 'GOVERNOR_PROMOTION_CAPOU_AGHA'
	or GovernorPromotionType = 'GOVERNOR_PROMOTION_GRAND_VISIER'
	or GovernorPromotionType = 'GOVERNOR_PROMOTION_HEAD_FALCONER';

insert into GovernorPromotionPrereqs
    (GovernorPromotionType,             	PrereqGovernorPromotion)
values
    ('GOVERNOR_PROMOTION_HEAD_FALCONER',   	'GOVERNOR_PROMOTION_PASHA'),
    ('GOVERNOR_PROMOTION_SERASKER',   		'GOVERNOR_PROMOTION_PASHA'),
	('GOVERNOR_PROMOTION_GRAND_VISIER',   	'GOVERNOR_PROMOTION_HEAD_FALCONER'),    
	('GOVERNOR_PROMOTION_GRAND_VISIER',   	'GOVERNOR_PROMOTION_SERASKER'),
	('GOVERNOR_PROMOTION_KHASS_ODA_BASHI',  'GOVERNOR_PROMOTION_GRAND_VISIER'),    
	('GOVERNOR_PROMOTION_CAPOU_AGHA',   	'GOVERNOR_PROMOTION_GRAND_VISIER');

--能力
delete from GovernorPromotionModifiers where GovernorPromotionType = 'GOVERNOR_PROMOTION_PASHA'
	or   GovernorPromotionType = 'GOVERNOR_PROMOTION_HEAD_FALCONER'
	or   GovernorPromotionType = 'GOVERNOR_PROMOTION_CAPOU_AGHA'
	or   GovernorPromotionType = 'GOVERNOR_PROMOTION_KHASS_ODA_BASHI'
	or   GovernorPromotionType = 'GOVERNOR_PROMOTION_GRAND_VISIER';
insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,         	 	ModifierId)
values
	('GOVERNOR_PROMOTION_PASHA',     		'SERASKER_POP_PRODUCTION'),
	('GOVERNOR_PROMOTION_PASHA',     		'HD_MILITARY_RESEARCH_UNIT_TRAIN_GRANT_SCIENCE_TIME'),
	('GOVERNOR_PROMOTION_HEAD_FALCONER',	'HEAD_FALCONER_ENCAMPMENT_BUILDINGS_PRODUCTION_MODIFIER'),
	('GOVERNOR_PROMOTION_HEAD_FALCONER',	'HEAD_FALCONER_ENCAMPMENT_SCIENCE_BONUS1'),
	('GOVERNOR_PROMOTION_HEAD_FALCONER',	'HEAD_FALCONER_BARRACKS_STABLE_SCIENCE_BONUS1'),
	('GOVERNOR_PROMOTION_HEAD_FALCONER',	'HEAD_FALCONER_ARMORY_SCIENCE_BONUS1'),
	('GOVERNOR_PROMOTION_HEAD_FALCONER',	'HEAD_FALCONER_MILITARY_ACADEMY_SCIENCE_BONUS1'),
	('GOVERNOR_PROMOTION_SERASKER',			'SERASKER_ADJUST_GOVERNOR_COMBAT_DISTRICT'),
	('GOVERNOR_PROMOTION_GRAND_VISIER',		'GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH'),
	('GOVERNOR_PROMOTION_KHASS_ODA_BASHI',	'GRAND_VIZIER_ADJUST_IGNORE_CULTURAL_IDENTITY'),
	('GOVERNOR_PROMOTION_KHASS_ODA_BASHI',	'CAPOU_AGHA_ADJUST_GRIEVANCES'),
	('GOVERNOR_PROMOTION_CAPOU_AGHA',		'PASHA_BONUS_UNIT_PRODUCTION'),
	('GOVERNOR_PROMOTION_CAPOU_AGHA',		'CAPOU_AGHA_EXTRA_MELEE_AND_SIEGE');

insert or replace into Modifiers	
	(ModifierId,												ModifierType,												SubjectRequirementSetId)
values
	('SERASKER_POP_PRODUCTION',									'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',	'PLAYER_IS_OTTOMAN'),
	('CAPOU_AGHA_EXTRA_MELEE_AND_SIEGE',						'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_UNIT_COPY_TAG',			'PLAYER_IS_OTTOMAN'),
	('GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH',					'MODIFIER_PLAYER_ALLIANCES_ATTACH_MODIFIER',				NULL),
	('HD_MILITARY_RESEARCH_UNIT_TRAIN_GRANT_SCIENCE_TIME',  	'MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_UNIT_COST',			NULL),
	('HEAD_FALCONER_ENCAMPMENT_BUILDINGS_PRODUCTION_MODIFIER',	'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION',			NULL),
	('HEAD_FALCONER_ENCAMPMENT_SCIENCE_BONUS1',					'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					'CITY_HAS_ENCAMPMENT'),
	('HEAD_FALCONER_BARRACKS_STABLE_SCIENCE_BONUS1',			'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					'BUILDING_IS_BARRACKS_STABLE_MILITARITIC_CITY_STATE'),
	('HEAD_FALCONER_ARMORY_SCIENCE_BONUS1',						'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					'BUILDING_IS_ARMORY'),
	('HEAD_FALCONER_MILITARY_ACADEMY_SCIENCE_BONUS1',			'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',					'BUILDING_IS_MILITARY_ACADEMY');

insert or replace into Modifiers	
	(ModifierId,										ModifierType,									SubjectRequirementSetId,					SubjectStackLimit)
values
	('GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH_MODIFIER',	'MODIFIER_ALLIANCE_COMBATS_UNIT_STRENGTHS',		'ALLIES_AT_WAR_WITH_TARGET_REQUIREMENTS',	1);

insert or replace into ModifierArguments
	(ModifierId,                                            	Name,                   	Value)
values
	('SERASKER_POP_PRODUCTION',									'YieldType',				'YIELD_PRODUCTION'),
	('SERASKER_POP_PRODUCTION',									'Amount',					1),
	('CAPOU_AGHA_EXTRA_MELEE_AND_SIEGE',						'Tag',						'CLASS_CAPOU_EXTRA'),
	('CAPOU_AGHA_EXTRA_MELEE_AND_SIEGE',						'Amount',					1),
	('GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH',					'ModifierId',				'GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH_MODIFIER'),
	('GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH_MODIFIER',			'Amount',					5),
	('HD_MILITARY_RESEARCH_UNIT_TRAIN_GRANT_SCIENCE_TIME',  	'YieldType',           		'YIELD_SCIENCE'),
	('HD_MILITARY_RESEARCH_UNIT_TRAIN_GRANT_SCIENCE_TIME',  	'UnitProductionPercent',	25),
	('HEAD_FALCONER_ENCAMPMENT_BUILDINGS_PRODUCTION_MODIFIER',	'DistrictType',				'DISTRICT_ENCAMPMENT'),
	('HEAD_FALCONER_ENCAMPMENT_BUILDINGS_PRODUCTION_MODIFIER',	'Amount',					30),
	('HEAD_FALCONER_ENCAMPMENT_SCIENCE_BONUS1',					'YieldType',				'YIELD_SCIENCE'),
	('HEAD_FALCONER_ENCAMPMENT_SCIENCE_BONUS1',					'Amount',					3),
	('HEAD_FALCONER_BARRACKS_STABLE_SCIENCE_BONUS1',			'YieldType',				'YIELD_SCIENCE'),
	('HEAD_FALCONER_BARRACKS_STABLE_SCIENCE_BONUS1',			'Amount',					3),
	('HEAD_FALCONER_ARMORY_SCIENCE_BONUS1',						'YieldType',				'YIELD_SCIENCE'),
	('HEAD_FALCONER_ARMORY_SCIENCE_BONUS1',						'Amount',					3),
	('HEAD_FALCONER_MILITARY_ACADEMY_SCIENCE_BONUS1',			'YieldType',				'YIELD_SCIENCE'),
	('HEAD_FALCONER_MILITARY_ACADEMY_SCIENCE_BONUS1',			'Amount',					3);

update ModifierArguments set Value = 10 where ModifierId = 'SERASKER_ADJUST_GOVERNOR_COMBAT_DISTRICT';
update ModifierArguments set Value = 5 where ModifierId = 'GRAND_VIZIER_ADJUST_IGNORE_CULTURAL_IDENTITY';


insert or replace into TypeTags	(Type,	Tag)
select UnitType,	'CLASS_CAPOU_EXTRA' from Units 
where (PromotionClass = 'PROMOTION_CLASS_MELEE' and Combat >= 55) or (PromotionClass = 'PROMOTION_CLASS_SIEGE' and Combat >= 45);

insert or replace into Tags
	(Tag,									Vocabulary)
values
	('CLASS_CAPOU_EXTRA',					'ABILITY_CLASS');

insert or replace into RequirementSets
	(RequirementSetId,						RequirementSetType)
values
	('PLAYER_IS_OTTOMAN',					'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,						RequirementId)
values
	('PLAYER_IS_OTTOMAN',					'PLAYER_IS_CIVILIZATION_OTTOMAN');

insert or replace into ModifierStrings
    (ModifierId,                                				Context,    Text)
values
    ('GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH_MODIFIER',			'Preview',  'LOC_GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH_MODIFIER_PREVIEW_TEXT');
