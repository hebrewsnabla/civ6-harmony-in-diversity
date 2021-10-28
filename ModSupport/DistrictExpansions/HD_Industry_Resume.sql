-------------------------------------
--       Resume for the Mod        --
-------------------------------------

insert or replace into Types
    (Type,                              Kind)
values
    ('BUILDING_IZ_WATER_MILL',          'KIND_BUILDING');

insert or replace into Buildings 
    (BuildingType,                  Name,                               Cost,   Maintenance,    CitizenSlots,
    PrereqTech,             PrereqDistrict,             PurchaseYield,  Description) 
values
    ('BUILDING_IZ_WATER_MILL',      'LOC_BUILDING_IZ_WATER_MILL_NAME',  100,    1,              1,
    'TECH_IRON_WORKING',   'DISTRICT_INDUSTRIAL_ZONE', 'YIELD_GOLD',   'LOC_BUILDING_IZ_WATER_MILL_DESCRIPTION');

insert or replace into Building_YieldChanges
    (BuildingType,              YieldType,          YieldChange)
values
    ('BUILDING_IZ_WATER_MILL',  'YIELD_PRODUCTION', 5);

insert or replace into Building_GreatPersonPoints
    (BuildingType,              GreatPersonClassType,           PointsPerTurn)
values
    ('BUILDING_IZ_WATER_MILL',  'GREAT_PERSON_CLASS_ENGINEER',  1);

update BuildingPrereqs set Building = 'BUILDING_IZ_WATER_MILL' where Building = 'BUILDING_WATER_MILL';
update BuildingPrereqs set PrereqBuilding = 'BUILDING_IZ_WATER_MILL' where PrereqBuilding = 'BUILDING_WATER_MILL';
update MutuallyExclusiveBuildings set Building = 'BUILDING_IZ_WATER_MILL' where Building = 'BUILDING_WATER_MILL';
update MutuallyExclusiveBuildings set MutuallyExclusiveBuilding = 'BUILDING_IZ_WATER_MILL' where MutuallyExclusiveBuilding = 'BUILDING_WATER_MILL';
update RequirementArguments set Value = 'BUILDING_IZ_WATER_MILL' where RequirementId = 'REQUIRES_CITY_HAS_WATER_MILL_JNR' and Name = 'BuildingType';
