-------------------------------------
--  Trade Route Yield Adjustment   --
-------------------------------------

-- Commercial hub for domestic traderoute yields (1 food + 1 production)
insert or replace into District_TradeRouteYields
	(DistrictType,				YieldType,			YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
values
	('DISTRICT_COMMERCIAL_HUB',	'YIELD_FOOD',		1,									0),
	('DISTRICT_SUGUBA',			'YIELD_FOOD',		1,									0);
