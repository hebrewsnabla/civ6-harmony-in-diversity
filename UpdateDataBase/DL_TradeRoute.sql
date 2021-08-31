-------------------------------------
--  Trade Route Yield Adjustment   --
-------------------------------------

update District_TradeRouteYields set YieldChangeAsInternationalDestination = 3 where DistrictType = 'DISTRICT_GOVERNMENT' and YieldType = 'YIELD_GOLD';

-- Commercial hub for domestic traderoute yields (1 food + 1 production)
insert or replace into District_TradeRouteYields
	(DistrictType,				YieldType,			YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
values
	('DISTRICT_COMMERCIAL_HUB',	'YIELD_FOOD',		1,									0),
	('DISTRICT_SUGUBA',			'YIELD_FOOD',		1,									0);

insert or replace into DistrictModifiers (DistrictType, ModifierId)
select DistrictType, 'HD_ONE_GOLD_FROM_INCOMING_FOREIGN_ROUTES' from District_TradeRouteYields
where YieldChangeAsInternationalDestination != 0;

insert or replace into Modifiers
    (ModifierId,                                                    ModifierType)
values
    ('HD_ONE_GOLD_FROM_INCOMING_FOREIGN_ROUTES',                    'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS');

insert or replace into ModifierArguments
    (ModifierId,                                                    Name,                   Value)
values
    ('HD_ONE_GOLD_FROM_INCOMING_FOREIGN_ROUTES',                    'YieldType',            'YIELD_GOLD'),
    ('HD_ONE_GOLD_FROM_INCOMING_FOREIGN_ROUTES',                    'Amount',               1);
