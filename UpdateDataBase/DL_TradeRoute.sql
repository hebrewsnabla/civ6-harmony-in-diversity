-------------------------------------
--  Trade Route Yield Adjustment   --
-------------------------------------

--preserve food for both international and domestic traderoute yields
insert or replace into District_TradeRouteYields
	(DistrictType,				YieldType,			YieldChangeAsDomesticDestination,	YieldChangeAsInternationalDestination)
values
	('DISTRICT_PRESERVE',		'YIELD_FOOD',		1,									1),
	('DISTRICT_COMMERCIAL_HUB',	'YIELD_FOOD',		1,									0),
	('DISTRICT_SUGUBA',			'YIELD_FOOD',		1,									0);
