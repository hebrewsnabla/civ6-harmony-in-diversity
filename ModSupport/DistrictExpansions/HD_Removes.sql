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
update Buildings set PrereqTech = 'TECH_THE_WHEEL', Cost = 80, Maintenance = 1, Description='LOC_BUILDING_WATER_MILL_DESCRIPTION' where BuildingType = 'BUILDING_WATER_MILL';
update Buildings set PrereqDistrict = 'DISTRICT_CITY_CENTER', CitizenSlots = 0, RequiresAdjacentRiver = 1 where BuildingType = 'BUILDING_WATER_MILL';
delete from BuildingPrereqs where Building = 'BUILDING_WATER_MILL';
