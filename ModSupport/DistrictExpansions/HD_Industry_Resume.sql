-------------------------------------
--       Resume for the Mod        --
-------------------------------------

insert or replace into Types
    (Type,                              Kind)
values
    ('BUILDING_JNR_TOOLING_SHOP',       'KIND_BUILDING'),
    ('BUILDING_IZ_WATER_MILL',          'KIND_BUILDING');

insert or replace into Buildings 
    (BuildingType,                  Name,                                   Cost,   Maintenance,    CitizenSlots,
    PrereqTech,             PrereqDistrict,             PurchaseYield,  Description) 
values
    ('BUILDING_JNR_TOOLING_SHOP',   'LOC_BUILDING_JNR_TOOLING_SHOP_NAME',   45,     1,              1,
    'TECH_IRON_WORKING',    'DISTRICT_INDUSTRIAL_ZONE', 'YIELD_GOLD',   'LOC_BUILDING_JNR_TOOLING_SHOP_DESCRIPTION'),
    ('BUILDING_IZ_WATER_MILL',      'LOC_BUILDING_IZ_WATER_MILL_NAME',      90,    1,              1, -- ''
    'TECH_ENGINEERING',     'DISTRICT_INDUSTRIAL_ZONE', 'YIELD_GOLD',   'LOC_BUILDING_IZ_WATER_MILL_DESCRIPTION');

insert or replace into Building_YieldChanges
    (BuildingType,                  YieldType,          YieldChange)
values
    ('BUILDING_JNR_TOOLING_SHOP',   'YIELD_PRODUCTION', 2),
    ('BUILDING_IZ_WATER_MILL',      'YIELD_PRODUCTION', 5);

insert or replace into Building_GreatPersonPoints
    (BuildingType,              GreatPersonClassType,           PointsPerTurn)
values
    ('BUILDING_IZ_WATER_MILL',  'GREAT_PERSON_CLASS_ENGINEER',  1);

update BuildingPrereqs set Building = 'BUILDING_IZ_WATER_MILL' where Building = 'BUILDING_WATER_MILL';
update BuildingPrereqs set PrereqBuilding = 'BUILDING_IZ_WATER_MILL' where PrereqBuilding = 'BUILDING_WATER_MILL';
update MutuallyExclusiveBuildings set Building = 'BUILDING_IZ_WATER_MILL' where Building = 'BUILDING_WATER_MILL';
update MutuallyExclusiveBuildings set MutuallyExclusiveBuilding = 'BUILDING_IZ_WATER_MILL' where MutuallyExclusiveBuilding = 'BUILDING_WATER_MILL';
update RequirementArguments set Value = 'BUILDING_IZ_WATER_MILL' where RequirementId = 'REQUIRES_CITY_HAS_WATER_MILL_JNR' and Name = 'BuildingType';
insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)
values ('BUILDING_IS_INDUSTRIAL_TIER1_JNR', 'REQUIRES_CITY_HAS_BUILDING_JNR_TOOLING_SHOP');

-- Boosts
update Boosts set TechnologyType = 'TECH_ENGINEERING', TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_ENGINEERING'
    where TechnologyType = 'TECH_CONSTRUCTION' and TriggerDescription = 'LOC_BOOST_TRIGGER_ENGINEERING';
update Boosts set TechnologyType = 'TECH_APPRENTICESHIP', TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_APPRENTICESHIP'
    where TechnologyType = 'TECH_ENGINEERING' and TriggerDescription = 'LOC_BOOST_TRIGGER_APPRENTICESHIP';
update Boosts set TechnologyType = 'TECH_CONSTRUCTION', TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_CONSTRUCTION'
    where TechnologyType = 'TECH_APPRENTICESHIP' and TriggerDescription = 'LOC_BOOST_TRIGGER_CONSTRUCTION';

delete from Boosts where TechnologyType = 'TECH_PLASTICS';
update Boosts set TechnologyType = 'TECH_PLASTICS', TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_PLASTICS'
    where TechnologyType = 'TECH_COMBUSTION';
update Boosts set TechnologyType = 'TECH_COMBUSTION' where TechnologyType = 'TECH_REFINING';
update Boosts set TechnologyType = 'TECH_REFINING', TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_REFINING'
    where TechnologyType = 'TECH_ELECTRICITY';
insert or ignore into Boosts
    (TechnologyType,        Boost,  BoostClass,                             Unit1Type,          NumItems,
    TriggerDescription,                     TriggerLongDescription)
values
    ('TECH_ELECTRICITY',    34,     'BOOST_TRIGGER_OWN_X_UNITS_OF_TYPE',    'UNIT_PRIVATEER',   2,
    'LOC_BOOST_TRIGGER_ELECTRICITY_XP2',    'LOC_BOOST_TRIGGER_LONGDESC_ELECTRICITY');
