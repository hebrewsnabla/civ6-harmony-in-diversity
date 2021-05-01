-------------------------------------
--            Khmer DLC            --
-------------------------------------

insert or replace into Building_CitizenYieldChanges
    (BuildingType,                          YieldType,          YieldChange)
values
    ('BUILDING_PRASAT',                     'YIELD_FAITH',      1); --ub (高棉)

insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
values
    ('BUILDING_PRASAT',             'TEMPLE_SETTLER_PURCHASE'),
    ('BUILDING_PRASAT',             'TEMPLE_FAITH_PERCENTAGE_BOOST');
