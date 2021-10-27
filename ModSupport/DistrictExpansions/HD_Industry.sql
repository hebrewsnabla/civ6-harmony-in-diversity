-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

-- Buildings
update Buildings set Cost = 90, PrereqTech = 'TECH_IRON_WORKING' where BuildingType = 'BUILDING_JNR_WIND_MILL';
update Buildings set Cost = 180 where BuildingType = 'BUILDING_WORKSHOP';
update Buildings set Cost = 180, Maintenance = 3, CitizenSlots = 1, PrereqTech = 'TECH_APPRENTICESHIP' where BuildingType = 'BUILDING_JNR_MANUFACTURY';
update Buildings set Cost = 330, Maintenance = 7, PrereqTech = 'TECH_INDUSTRIALIZATION' where BuildingType = 'BUILDING_JNR_CHEMICAL';

-- Yield
update Building_YieldChanges set YieldChange = 2 where BuildingType = 'BUILDING_JNR_WIND_MILL' and YieldType='YIELD_PRODUCTION';

-- Citizen
insert or replace into Building_CitizenYieldChanges
    (BuildingType,                  YieldType,          YieldChange)
values
    ('BUILDING_IZ_WATER_MILL',      'YIELD_PRODUCTION', 1),
    ('BUILDING_IZ_WATER_MILL',      'YIELD_GOLD',       -1),
    ('BUILDING_JNR_WIND_MILL',      'YIELD_PRODUCTION', 1),
    ('BUILDING_JNR_WIND_MILL',      'YIELD_GOLD',       -1),
    ('BUILDING_WORKSHOP',           'YIELD_PRODUCTION', 1),
    ('BUILDING_WORKSHOP',           'YIELD_GOLD',       -1),
    ('BUILDING_JNR_MANUFACTURY',    'YIELD_PRODUCTION', 1),
    ('BUILDING_JNR_MANUFACTURY',    'YIELD_GOLD',       -1),
    ('BUILDING_JNR_CHEMICAL',       'YIELD_PRODUCTION', 1),
    ('BUILDING_JNR_CHEMICAL',       'YIELD_GOLD',       -1),
    ('BUILDING_JNR_FREIGHT_YARD',   'YIELD_PRODUCTION', 1),
    ('BUILDING_JNR_FREIGHT_YARD',   'YIELD_GOLD',       -1);

-- Bonus
delete from BuildingModifiers where ModifierId like 'JNR_%' and (
    BuildingType = 'BUILDING_WATER_MILL' or
    BuildingType = 'BUILDING_JNR_WIND_MILL' or
    BuildingType = 'BUILDING_WORKSHOP' or
    BuildingType = 'BUILDING_FACTORY');

-- Special Bonus
delete from BuildingModifiers where BuildingType = 'BUILDING_COAL_POWER_PLANT' and ModifierId = 'JNR_COAL_POWER_PLANT_APPEAL_PENALTY';
delete from BuildingModifiers where BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT' and ModifierId = 'JNR_FOSSILE_FUEL_POWER_PLANT_APPEAL_PENALTY';
delete from BuildingModifiers where BuildingType = 'BUILDING_JNR_FREIGHT_YARD' and ModifierId = 'JNR_FREIGHT_YARD_RESOURCE_STOCKPILE_CAP';
delete from BuildingModifiers where BuildingType = 'BUILDING_ELECTRONICS_FACTORY' and ModifierId = 'JNR_FREIGHT_YARD_RESOURCE_STOCKPILE_CAP';

--------------------------------------------------------------
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

update Boosts set
    TriggerDescription = 'LOC_BOOST_TRIGGER_INDUSTRIALIZATION_XP2',
    TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_INDUSTRIALIZATION',
    BuildingType = 'BUILDING_WORKSHOP',
    NumItems = 3
where TechnologyType = 'TECH_INDUSTRIALIZATION';

update Boosts set
    TriggerDescription = 'LOC_BOOST_TRIGGER_CLASS_STRUGGLE',
    BuildingType = 'BUILDING_FACTORY',
    NumItems = 3
where CivicType = 'CIVIC_CLASS_STRUGGLE';

-- Great People
update GreatPersonIndividuals set ActionCharges = 3 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_IMHOTEP';
update ModifierArguments set Value = 70 where Name = 'Amount' and ModifierId = 'GREAT_PERSON_INDIVIDUAL_IMHOTEP_PRODUCTION_OTHER';
update ModifierArguments set Value = 140 where Name = 'Amount' and ModifierId = 'GREAT_PERSON_INDIVIDUAL_IMHOTEP_PRODUCTION_ANCIENT_CLASSICAL';

update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES';
update ModifierArguments set Value = 1 where Name = 'Amount' and ModifierId = 'JNR_GREATPERSON_EUREKA_STRENGTH';
