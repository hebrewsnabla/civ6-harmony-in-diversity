-------------------------------------
--            Poland DLC           --
-------------------------------------

insert or replace into Building_CitizenYieldChanges
    (BuildingType,                          YieldType,          YieldChange)
values
    ('BUILDING_SUKIENNICE',                 'YIELD_GOLD',       2); -- ub

insert or replace into Building_YieldChanges
    (BuildingType,                  YieldType,          YieldChange)
values
    ('BUILDING_SUKIENNICE',         'YIELD_GOLD',       5);

-- insert or replace into BuildingModifiers
--     (BuildingType,                          ModifierId)
-- values
--     ('BUILDING_SUKIENNICE',                  'MARKET_GOLD_PERCENTAGE_BOOST');
