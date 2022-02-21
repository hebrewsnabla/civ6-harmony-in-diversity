-- National_Wonders_Pack1

-- 大铁厂 ----------------------------------------------------------------------------------------------------------------------------------------------------
	-- 修改解锁条件和造价
update Buildings set AdjacentResource = 'RESOURCE_IRON', cost = 600, RegionalRange = 8 where BuildingType = 'NAT_WONDER_CL_IRONWORKS';
update Buildings set AdjacentResource = 'RESOURCE_IRON', cost = 600, RegionalRange = 8 where BuildingType = 'NAT_WONDER_CL_IRONWORKS_INTERNAL';
	-- 修改建造条件
update RequirementArguments set Value = 4 where RequirementId = 'REQ_CL_PLAYER_HAS_X_STRATEGIC_IMPROVEMENTS' and Name = 'Count';

	-- 修改本体产出
update Building_YieldChanges set YieldChange = 3 where BuildingType = 'NAT_WONDER_CL_IRONWORKS' and YieldType = 'YIELD_PRODUCTION';
update Building_YieldChanges set YieldChange = 3 where BuildingType = 'NAT_WONDER_CL_IRONWORKS_INTERNAL' and YieldType = 'YIELD_PRODUCTION';
	-- 修改特效
delete from BuildingModifiers where BuildingType = 'NAT_WONDER_CL_IRONWORKS' and ModifierId = 'CL_NAT_WONDER_ATTACH_STRATEGIC_YIELD_MODIFIER';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
select
	'NAT_WONDER_CL_IRONWORKS',		'HD_NAT_IRONWORKS_CITIES_PRODUCTION_' || ResourceType
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into Modifiers
	(ModifierId,											ModifierType,											OwnerRequirementSetId,								SubjectRequirementSetId)
select
	'HD_NAT_IRONWORKS_CITIES_PRODUCTION_' || ResourceType,	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'CITY_HAS_IMPROVED_' || substr(ResourceType, 10),	'HD_OBJECT_WITHIN_8_TILES'
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'HD_NAT_IRONWORKS_CITIES_PRODUCTION_' || ResourceType,	'YieldType',		'YIELD_PRODUCTION'
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'HD_NAT_IRONWORKS_CITIES_PRODUCTION_' || ResourceType,	'Amount',			2
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

-- 金融中心 ----------------------------------------------------------------------------------------------------------------------------------------------------
	-- 修改解锁条件和造价
update Buildings set PrereqTech = Null, PrereqCivic = 'CIVIC_CAPITALISM', cost = 1250 where BuildingType = 'NAT_WON_CL_FINANCE';
update Buildings set PrereqTech = Null, PrereqCivic = 'CIVIC_CAPITALISM', cost = 1250 where BuildingType = 'NAT_WON_CL_FINANCE_INTERNAL';
	-- 修改特效
update ModifierArguments set Value = 2 where ModifierId = 'CL_NAT_WONDER_ADJUST_TRADE_ROUTE_YIELD_INTERNATIONAL_01' and Name = 'Amount';
update ModifierArguments set Value = 4 where ModifierId = 'CL_NAT_WONDER_ADJUST_TRADE_ROUTE_YIELD_INTERNATIONAL_02' and Name = 'Amount';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('NAT_WON_CL_FINANCE',			'HD_NAT_FINANCE_GP_GOLD_DISCOUNT');

insert or replace into Modifiers
	(ModifierId,							ModifierType)
values
	('HD_NAT_FINANCE_GP_GOLD_DISCOUNT',		'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_PATRONAGE_DISCOUNT_PERCENT');

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('HD_NAT_FINANCE_GP_GOLD_DISCOUNT',		'YieldType',	'YIELD_GOLD'),
	('HD_NAT_FINANCE_GP_GOLD_DISCOUNT',		'Amount',		50);

	-- 公司模式
delete from BuildingModifiers where BuildingType = 'NAT_WON_CL_FINANCE' and ModifierId in
	(	'CL_NAT_WONDER_ATTACH_COMMERCIAL_YIELD_MODIFIER',
		'CL_NAT_WONDER_ATTACH_BANK_GOLD_TRADEROUTE_YIELD',
		'CL_NAT_WONDER_ATTACH_STOCKEXCHANGE_GOLD_TRADEROUTE_YIELD')
	and exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

update Buildings set Description = 'LOC_NAT_WON_CL_FINANCE_CORP_DESCRIPTION' where BuildingType = 'NAT_WON_CL_FINANCE'
	and exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');
update Buildings set Description = 'LOC_NAT_WON_CL_FINANCE_CORP_DESCRIPTION_INTERNAL' where BuildingType = 'NAT_WON_CL_FINANCE_INTERNAL'
	and exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
select
	'NAT_WON_CL_FINANCE',			'HD_NAT_FINANCE_CORP_TOURISM'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into Modifiers
	(ModifierId,					ModifierType)
select
	'HD_NAT_FINANCE_CORP_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,					Name,				Value)
select
	'HD_NAT_FINANCE_CORP_TOURISM',	'ImprovementType',	'IMPROVEMENT_CORPORATION'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,					Name,				Value)
select
	'HD_NAT_FINANCE_CORP_TOURISM',	'ScalingFactor',	300
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');
-------------
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
select
	'NAT_WON_CL_FINANCE',			'HD_NAT_FINANCE_PRODUCT_' || YieldType
from Yields
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into Modifiers
	(ModifierId,							ModifierType,										SubjectRequirementSetId)
select
	'HD_NAT_FINANCE_PRODUCT_' || YieldType,	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',	'HD_CITY_HAS_COMMERCIAL_TIER_3_BUILDING_REQUIREMENTS'
from Yields
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	'HD_NAT_FINANCE_PRODUCT_' || YieldType,	'GreatWorkObjectType',	'GREATWORKOBJECT_PRODUCT'
from Yields
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	'HD_NAT_FINANCE_PRODUCT_' || YieldType,	'YieldType',			YieldType
from Yields
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	'HD_NAT_FINANCE_PRODUCT_' || YieldType,	'ScalingFactor',		200
from Yields
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

-- 国际机场 ----------------------------------------------------------------------------------------------------------------------------------------------------
	-- 修改解锁条件和造价
update Buildings set cost = 1350, AdjacentDistrict = Null where BuildingType = 'NAT_WON_CL_AIRPORT';
update Buildings set cost = 1350, AdjacentDistrict = Null where BuildingType = 'NAT_WON_CL_AIRPORT_INTERNAL';
	-- 修改建造条件
update Modifiers set OwnerRequirementSetId = Null where ModifierId = 'CL_NAT_WONDER_ALLOW_BUILDING_AIRPORT';
	-- 修改特效
delete from BuildingModifiers where BuildingType = 'NAT_WON_CL_AIRPORT' and ModifierId != 'TRAIT_FREE_BUILDER_AFTER_FININSHING_WONDER';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('NAT_WON_CL_AIRPORT',			'HD_NAT_AIRPORT_3_TRADE'),
	('NAT_WON_CL_AIRPORT',			'HD_NAT_AIRPORT_DIPLO'),
	('NAT_WON_CL_AIRPORT',			'HD_NAT_AIRPORT_LUMBERMILL_TOURISM'),
	('NAT_WON_CL_AIRPORT',			'HD_NAT_AIRPORT_PLANTATION_TOURISM');

insert or replace into Modifiers
	(ModifierId,							ModifierType,									SubjectRequirementSetId)
values
	('HD_NAT_AIRPORT_3_TRADE',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	Null),
	('HD_NAT_AIRPORT_DIPLO',				'MODIFIER_PLAYER_ADD_DIPLO_VISIBILITY',			Null),
	('HD_NAT_AIRPORT_LUMBERMILL_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',		'HD_CITY_HAS_AIRPORT_OR_NATAIRPORT'),
	('HD_NAT_AIRPORT_PLANTATION_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',		'HD_CITY_HAS_AIRPORT_OR_NATAIRPORT');

insert or replace into ModifierArguments
	(ModifierId,							Name,				Value)
values
	('HD_NAT_AIRPORT_3_TRADE',				'Amount',			3),
	('HD_NAT_AIRPORT_DIPLO',				'Amount',			1),
	('HD_NAT_AIRPORT_DIPLO',				'Source',			'SOURCE_NAT_AIRPORT'),
	('HD_NAT_AIRPORT_DIPLO',				'SourceType',		'DIPLO_SOURCE_ALL_NAMES'),
	('HD_NAT_AIRPORT_LUMBERMILL_TOURISM',	'ImprovementType',	'IMPROVEMENT_LUMBER_MILL'),
	('HD_NAT_AIRPORT_LUMBERMILL_TOURISM',	'ScalingFactor',	150),
	('HD_NAT_AIRPORT_PLANTATION_TOURISM',	'ImprovementType',	'IMPROVEMENT_PLANTATION'),
	('HD_NAT_AIRPORT_PLANTATION_TOURISM',	'ScalingFactor',	150);

insert or replace into DiplomaticVisibilitySources
    (VisibilitySourceType,		Description,                	ActionDescription,                  	GossipString,                  	   PrereqTech)
values
    ('SOURCE_NAT_AIRPORT',		'LOC_VIZSOURCE_NAT_AIRPORT',	'LOC_VIZSOURCE_ACTION_NAT_AIRPORT',   	'LOC_GOSSIP_SOURCE_NAT_AIRPORT',   'TECH_ADVANCED_FLIGHT');

insert or replace into RequirementSets
	(RequirementSetId,						RequirementSetType)
values
	('HD_CITY_HAS_AIRPORT_OR_NATAIRPORT',	'REQUIREMENTSET_TEST_ANY'),
	('HD_PLAYER_HAS_NAT_AIRPORT', 			'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,						RequirementId)
values
	('HD_CITY_HAS_AIRPORT_OR_NATAIRPORT',	'REQUIRES_CITY_HAS_BUILDING_AIRPORT'),
	('HD_CITY_HAS_AIRPORT_OR_NATAIRPORT',	'REQUIRES_CITY_HAS_NAT_WON_CL_AIRPORT'),
	('HD_PLAYER_HAS_NAT_AIRPORT', 			'REQUIRES_PLAYER_HAS_NAT_AIRPOR');

insert or ignore into Requirements
	(RequirementId,							RequirementType)
values
	('REQUIRES_PLAYER_HAS_NAT_AIRPOR',		'REQUIREMENT_PLAYER_HAS_BUILDING');

insert or ignore into RequirementArguments
	(RequirementId,							Name,				Value)
values
	('REQUIRES_PLAYER_HAS_NAT_AIRPOR',		'BuildingType',		'NAT_WON_CL_AIRPORT');

insert or replace into DistrictModifiers (DistrictType, ModifierId)
select DistrictType, DistrictType || '_' || YieldType || '_FROM_OTHERS_NAT_AIRPORT'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select DistrictType || '_' || YieldType || '_FROM_OTHERS_NAT_AIRPORT',
    'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',
    'HD_PLAYER_HAS_NAT_AIRPORT'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FROM_OTHERS_NAT_AIRPORT', 'YieldType', YieldType
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FROM_OTHERS_NAT_AIRPORT', 'Amount', YieldChangeAsInternationalDestination
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

-- For International
insert or replace into DistrictModifiers (DistrictType, ModifierId)
select DistrictType, DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL_NAT_AIRPORT'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
select DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL_NAT_AIRPORT',
    'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',
    'HD_PLAYER_HAS_NAT_AIRPORT'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL_NAT_AIRPORT', 'YieldType', YieldType
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL_NAT_AIRPORT', 'Amount', YieldChangeAsInternationalDestination
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;
	-----------------------------
insert or replace into DistrictModifiers (DistrictType, ModifierId)
select DistrictType, DistrictType || '_' || YieldType || '_FROM_OTHERS_NAT_AIRPORT2'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId)
select DistrictType || '_' || YieldType || '_FROM_OTHERS_NAT_AIRPORT2',
    'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',
    'HD_PLAYER_HAS_NAT_AIRPORT',
    'HD_CITY_HAS_AIRPORT_OR_NATAIRPORT'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FROM_OTHERS_NAT_AIRPORT2', 'YieldType', YieldType
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FROM_OTHERS_NAT_AIRPORT2', 'Amount', YieldChangeAsInternationalDestination
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

-- For International
insert or replace into DistrictModifiers (DistrictType, ModifierId)
select DistrictType, DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL_NAT_AIRPORT2'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId)
select DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL_NAT_AIRPORT2',
    'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',
    'HD_PLAYER_HAS_NAT_AIRPORT',
    'HD_CITY_HAS_AIRPORT_OR_NATAIRPORT'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL_NAT_AIRPORT2', 'YieldType', YieldType
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL_NAT_AIRPORT2', 'Amount', YieldChangeAsInternationalDestination
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;