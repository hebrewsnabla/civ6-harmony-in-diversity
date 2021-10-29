-------------------------------------
--       Removes for the Mod       --
-------------------------------------

-------------------------------------
-- Aqueduct
-------------------------------------

-- Districts
delete from District_CitizenYieldChanges where DistrictType = 'DISTRICT_AQUEDUCT';
delete from District_CitizenYieldChanges where DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType='DISTRICT_AQUEDUCT');

delete from District_TradeRouteYields where DistrictType = 'DISTRICT_AQUEDUCT';
delete from District_TradeRouteYields where DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType='DISTRICT_AQUEDUCT');

delete from DistrictModifiers where ModifierId like 'JNR_AQUEDUCT_CONSTRUCTION_%';
delete from DistrictModifiers where ModifierId like 'JNR_ORCHARD_GOLD_ADJACENT_AGRICULTURE';
delete from DistrictModifiers where ModifierId like 'JNR_HAMMER_WORKS_PRODUCTION_DEFAULT';
delete from DistrictModifiers where ModifierId like 'JNR_SEWER_%';

-- Buildings
delete from BuildingPrereqs where Building = 'BUILDING_JNR_ORCHARD'
    or Building = 'BUILDING_JNR_HAMMER_WORKS' or Building = 'BUILDING_JNR_BATHHOUSE';
delete from Building_CitizenYieldChanges where BuildingType = 'BUILDING_JNR_ORCHARD'
    or BuildingType = 'BUILDING_JNR_HAMMER_WORKS' or BuildingType = 'BUILDING_JNR_BATHHOUSE';

delete from BuildingModifiers where BuildingType = 'BUILDING_JNR_ORCHARD'
    or BuildingType = 'BUILDING_JNR_HAMMER_WORKS' or BuildingType = 'BUILDING_JNR_BATHHOUSE';
delete from BuildingModifiers where ModifierId = 'JNR_SEWER_POWER_FUTURE';

delete from Types where Type = 'ABILITY_JNR_HARDENED_STEEL';

-- Policy
delete from Types where Type = 'POLICY_JNR_RESERVOIRS';

-- Modifiers
delete from Modifiers where ModifierId like 'JNR_AQUEDUCT_%';
delete from Modifiers where ModifierId like 'JNR_ORCHARD_%';
delete from Modifiers where ModifierId like 'JNR_HAMMER_WORKS_%';
delete from Modifiers where ModifierId like 'JNR_BATHHOUSE_%';
delete from Modifiers where ModifierId like 'JNR_SEWER_%';
delete from Modifiers where ModifierId like 'JNR_HARDENED_STEEL_%';
delete from ModifierArguments where ModifierId like 'JNR_AQUEDUCT_%';
delete from ModifierArguments where ModifierId like 'JNR_ORCHARD_%';
delete from ModifierArguments where ModifierId like 'JNR_HAMMER_WORKS_%';
delete from ModifierArguments where ModifierId like 'JNR_BATHHOUSE_%';
delete from ModifierArguments where ModifierId like 'JNR_SEWER_%';
delete from ModifierArguments where ModifierId like 'JNR_HARDENED_STEEL_%';

-------------------------------------
-- Industry
-------------------------------------
-- Districts
delete from District_Adjacencies where DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' and YieldChangeId like 'JNR_UC_%';
delete from District_Adjacencies where DistrictType = 'DISTRICT_HANSA' and YieldChangeId like 'JNR_UC_%';
delete from District_Adjacencies where (YieldChangeId = 'LumberMill_Production' or YieldChangeId = 'Mine_Production')
	and (DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' or (DistrictType in
		(select CivUniqueDistrictType from DistrictReplaces where CivUniqueDistrictType = 'DISTRICT_INDUSTRIAL_ZONE')));

-- Buildings
insert or ignore into BuildingReplaces (CivUniqueBuildingType,  ReplacesBuildingType)
values ('BUILDING_PALGUM',  'BUILDING_WATER_MILL');

update Buildings set PrereqTech = 'TECH_THE_WHEEL', Cost = 80, Maintenance = 1, Description='LOC_BUILDING_WATER_MILL_DESCRIPTION' where BuildingType = 'BUILDING_WATER_MILL';
update Buildings set PrereqDistrict = 'DISTRICT_CITY_CENTER', CitizenSlots = 0, RequiresAdjacentRiver = 1 where BuildingType = 'BUILDING_WATER_MILL';

update Buildings set PrereqDistrict = NULL where BuildingType = 'BUILDING_JNR_MILL_RACE';

update Buildings set RegionalRange = 6 where BuildingType = 'BUILDING_FACTORY';
insert or ignore into Building_YieldDistrictCopies
    (BuildingType,                          OldYieldType,           NewYieldType)
values
    ('BUILDING_FOSSIL_FUEL_POWER_PLANT',    'YIELD_PRODUCTION',     'YIELD_PRODUCTION');

-- Bonus
delete from BuildingModifiers where ModifierId = 'JNR_ALLINDUSTRIAL_BASE_TRADEROUTE_DOMESTIC_PRODUCTION';

update BuildingModifiers set BuildingType = 'BUILDING_WATER_MILL' where BuildingType = 'BUILDING_GRANARY' and ModifierId = 'WATERMILL_ADDRICEFOOD';
update BuildingModifiers set BuildingType = 'BUILDING_WATER_MILL' where BuildingType = 'BUILDING_GRANARY' and ModifierId = 'WATERMILL_ADDWHEATYIELD';
update BuildingModifiers set BuildingType = 'BUILDING_WATER_MILL' where BuildingType = 'BUILDING_GRANARY' and ModifierId = 'WATERMILL_ADDMAIZEYIELD';

delete from DistrictModifiers where ModifierId = 'JNR_WATER_MILL_PRODUCTION_RIVER';

-- Policy
delete from Types where Type = 'POLICY_JNR_STANDARDIZATION';

-- Great Person
delete from Types where Type = 'GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAMES_WATT' and ModifierId = 'JNR_GREATPERSON_FRESH_WATER_PRODUCTION';

-- Monopoly Deletes
delete from Types where Type = 'RESOURCE_JNR_MACHINES';
delete from Types where Type = 'RESOURCE_JNR_FERTILIZERS';
delete from Types where Type = 'RESOURCE_JNR_ELECTRONICS';
delete from Types where Type = 'RESOURCE_JNR_SOUVENIRS';
delete from Types where Type = 'RESOURCE_JNR_PHARMA';
delete from Types where Type = 'RESOURCE_JNR_PLASTICS';

delete from Types where Type = 'PROJECT_CREATE_PRODUCT_JNR_MACHINES';
delete from Types where Type = 'PROJECT_CREATE_PRODUCT_JNR_FERTILIZERS';
delete from Types where Type = 'PROJECT_CREATE_PRODUCT_JNR_ELECTRONICS';
delete from Types where Type = 'PROJECT_CREATE_PRODUCT_JNR_SOUVENIRS';
delete from Types where Type = 'PROJECT_CREATE_PRODUCT_JNR_PHARMA';
delete from Types where Type = 'PROJECT_CREATE_PRODUCT_JNR_PLASTICS';

delete from GreatWorks where GreatWorkType like 'GREATWORK_PRODUCT_JNR_%';

update Buildings set InternalOnly = 1, PrereqTech = NULL where BuildingType = 'BUILDING_JNR_MODE_MACHINES';
update Buildings set InternalOnly = 1, PrereqTech = NULL WHERE BuildingType = 'BUILDING_JNR_MODE_FERTILIZERS';
update Buildings set InternalOnly = 1, PrereqTech = NULL WHERE BuildingType = 'BUILDING_JNR_MODE_ELECTRONICS';
update Buildings set InternalOnly = 1, PrereqTech = NULL WHERE BuildingType = 'BUILDING_JNR_MODE_SOUVENIRS';
update Buildings set InternalOnly = 1, PrereqTech = NULL WHERE BuildingType = 'BUILDING_JNR_MODE_PHARMA';
update Buildings set InternalOnly = 1, PrereqTech = NULL WHERE BuildingType = 'BUILDING_JNR_MODE_PLASTICS';

delete from District_Adjacencies where YieldChangeId = 'JNR_UC_Industry_Production';
delete from District_Adjacencies where YieldChangeId = 'JNR_UC_Corporation_Production';
