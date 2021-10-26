-------------------------------------
--       Resume for the Mod        --
-------------------------------------

insert or replace into Types
    (Type,                              Kind)
values
    ('BUILDING_IZ_WATER_MILL',          'KIND_BUILDING');

insert or replace into Buildings 
    (BuildingType,                  Name,                               Cost,
    PrereqTech,             PrereqDistrict,             PurchaseYield,  Description) 
values
    ('BUILDING_IZ_WATER_MILL',      'LOC_BUILDING_IZ_WATER_MILL_NAME',  150,
    'TECH_CONSTRUCTION',   'DISTRICT_INDUSTRIAL_ZONE', 'YIELD_GOLD',   'LOC_BUILDING_IZ_WATER_MILL_DESCRIPTION');
