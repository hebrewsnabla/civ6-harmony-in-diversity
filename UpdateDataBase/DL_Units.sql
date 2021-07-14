-------------------------------------
--         Units Adjustments       --
-------------------------------------
-- DL_RemoveGameCostEscalation
update Units set
	CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES',
	CostProgressionParam1 = 5,
	Cost = 40
where UnitType = 'UNIT_TRADER';

update Units set
	CostProgressionModel = 'NO_COST_PROGRESSION',
	CostProgressionParam1 = 0
 where UnitType = 'UNIT_LAHORE_NIHANG';

update Units set Cost = 75, CostProgressionParam1 = 5 where UnitType = 'UNIT_MISSIONARY';
update Units set Cost = 150, CostProgressionParam1 = 10 where UnitType = 'UNIT_APOSTLE';
update Units set Cost = 75, CostProgressionParam1 = 5 where UnitType = 'UNIT_INQUISITOR';
update Units set Cost = 120, CostProgressionParam1 = 10 where UnitType = 'UNIT_GURU';

update Units set Cost = 250 where UnitType = 'UNIT_ARCHAEOLOGIST';
-- add worker's basic building charges
update Units set BuildCharges = 4 where UnitType = 'UNIT_BUILDER';
update Units set BuildCharges = 3, BaseMoves = 3 where UnitType = 'UNIT_MILITARY_ENGINEER';

-- UNIT_MILITARY_ENGINEER
update Routes_XP2 set BuildWithUnitChargeCost = 0;
update District_BuildChargeProductions set PercentProductionPerCharge = 30;
--delete from Unit_BuildingPrereqs where Unit = 'UNIT_MILITARY_ENGINEER' and PrereqBuilding = 'BUILDING_ARMORY';
insert or replace into Route_ResourceCosts
    (RouteType,                 ResourceType,       BuildWithUnitCost)
values
    ('ROUTE_ANCIENT_ROAD',      'RESOURCE_HORSES',  1),
    ('ROUTE_MEDIEVAL_ROAD',     'RESOURCE_HORSES',  1),
    ('ROUTE_INDUSTRIAL_ROAD',   'RESOURCE_IRON',    1),
    ('ROUTE_MODERN_ROAD',       'RESOURCE_IRON',    1);

insert or replace into Route_ValidBuildUnits
    (RouteType,                 UnitType)
values
    ('ROUTE_ANCIENT_ROAD',      'UNIT_ROMAN_LEGION'),
    ('ROUTE_MEDIEVAL_ROAD',     'UNIT_ROMAN_LEGION');
/*
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
    ('BUILDING_ARMORY',				'ARMORY_MILITARY_ENGINEER_PURCHASE_DISCOUNT');

insert or replace into Modifiers
	(ModifierId,											ModifierType)
values
	('ARMORY_MILITARY_ENGINEER_PURCHASE_GOLD_DISCOUNT',		'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST');

insert or replace into ModifierArguments
	(ModifierId,									    Name,			Value)
values
	('ARMORY_MILITARY_ENGINEER_PURCHASE_GOLD_DISCOUNT',	'UnitType',	    'UNIT_MILITARY_ENGINEER'),
    ('ARMORY_MILITARY_ENGINEER_PURCHASE_GOLD_DISCOUNT',	'Amount',	    20);*/

-- update Units set PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES' where UnitType ='UNIT_INDONESIAN_JONG';

update Units set
	CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES',
	CostProgressionParam1 = 25,
	Cost = 200
where UnitType = 'UNIT_SPY';

-- Worrior monk and nihang can have siege_tower and Battering_ram bonus
update Units set ObsoleteCivic = null where UnitType = 'UNIT_SIEGE_TOWER';	
update Units set ObsoleteCivic = null where UnitType = 'UNIT_BATTERING_RAM';

update UnitUpgrades set UpgradeUnit = 'UNIT_OBSERVATION_BALLOON' where Unit = 'UNIT_SIEGE_TOWER';
update Units set PrereqTech = 'TECH_STEAM_POWER' where UnitType = 'UNIT_OBSERVATION_BALLOON';

-------------------------------------
-- Testing Adjustments for units   --
-------------------------------------

update Units set PrereqTech = 'TECH_CONSTRUCTION' where UnitType = 'UNIT_CATAPULT';
update Units set PrereqTech = 'TECH_CONSTRUCTION' where UnitType = 'UNIT_ROMAN_ONAGER'; -- ST
update Units set PrereqTech = 'TECH_CONSTRUCTION' where UnitType = 'UNIT_MACEDONIAN_BALLISTA'; -- ST
update Units set PrereqTech = 'TECH_APPRENTICESHIP' where UnitType = 'UNIT_AXE_THROWER'; -- WE
update Units set PrereqTech = 'TECH_GUNPOWDER' where UnitType = 'UNIT_REITER'; -- WE
update Units set PrereqTech = 'TECH_MILITARY_TACTICS' where UnitType = 'UNIT_ARQUEBUSIER'; -- WE
update Units set PrereqTech = 'TECH_MILITARY_TACTICS' where UnitType = 'UNIT_STRADIOT'; -- WE
update Units set PrereqTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_MAN_AT_ARMS';
update Units set PrereqTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_NORWEGIAN_BERSERKER';
update Units set PrereqTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_GEORGIAN_KHEVSURETI';
update Units set PrereqTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_ZULU_IMPI';
update Units set PrereqTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_PIKEMAN';
-- update Units set PrereqTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_GERMAN_LANDSKNECHT'; -- ST
-- update Units set PrereqTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_MAPUCHE_GUERILLA';   -- ST
update Units set PrereqTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_SCOTTISH_GALLOWGLASS';   -- ST
-- update Units set PrereqTech = 'TECH_MILITARY_TACTICS' where UnitType = 'UNIT_SWEDEN_CAROLEAN';
update Units set PrereqTech = 'TECH_MILITARY_TACTICS' where UnitType = 'UNIT_PIKE_AND_SHOT';
update Units set PrereqTech = 'TECH_SIEGE_TACTICS' where UnitType = 'UNIT_BOMBARD';

-- 调整单位过期科技。
update Units set MandatoryObsoleteTech = 'TECH_MILITARY_TACTICS' where MandatoryObsoleteTech = 'TECH_METAL_CASTING';

-- Special:
-- TODO: set LU as UU for Arabia, change player information.

-- Costs
update Units set Cost = 25 where UnitType = 'UNIT_SCOUT';
update Units set Cost = 25 where UnitType = 'UNIT_SLINGER';
update Units set Cost = 30 where UnitType = 'UNIT_WARRIOR';
update Units set Cost = 110 where UnitType = 'UNIT_MILITARY_ENGINEER';

-- Melee
update Units set Cost = 60, Maintenance = 2, BaseMoves = 2, Range = 0, Combat = 35, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_SWORDSMAN';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SWORDSMAN';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 45, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_MAN_AT_ARMS';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MAN_AT_ARMS';
update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_MUSKETMAN';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MUSKETMAN';
update Units set Cost = 210, Maintenance = 5, BaseMoves = 2, Range = 0, Combat = 65, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_LINE_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_LINE_INFANTRY';
-- update Units set Cost = 310, Maintenance = 6, BaseMoves = 3, Range = 0, Combat = 75, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_WW1_INFANTRY';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_WW1_INFANTRY';
-- Special Cases: UNIT_INFANTRY
update Units set Cost = 310, Maintenance = 6, BaseMoves = 3, Range = 0, Combat = 75, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_INFANTRY';
-- update Units set Cost = 690, Maintenance = 8, BaseMoves = 3, Range = 0, Combat = 95, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_MODERN_INFANTRY';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MODERN_INFANTRY';
update Units set Cost = 690, Maintenance = 8, BaseMoves = 3, Range = 0, Combat = 95, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_MECHANIZED_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MECHANIZED_INFANTRY';

-- Anti Cavalry
update Units set Cost = 45, Maintenance = 1, BaseMoves = 2, Range = 0, Combat = 25, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_SPEARMAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SPEARMAN';
-- update Units set Cost = 60, Maintenance = 2, BaseMoves = 2, Range = 0, Combat = 32, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_HEAVY_INFANTRY';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_HEAVY_INFANTRY';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 42, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_PIKEMAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_PIKEMAN';
update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 0, Combat = 52, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_PIKE_AND_SHOT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_PIKE_AND_SHOT';
-- update Units set Cost = 210, Maintenance = 5, BaseMoves = 2, Range = 0, Combat = 62, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_GUARDS';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GUARDS';
update Units set Cost = 310, Maintenance = 6, BaseMoves = 3, Range = 0, Combat = 72, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_AT_CREW';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_AT_CREW';
-- update Units set Cost = 460, Maintenance = 7, BaseMoves = 3, Range = 0, Combat = 82, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_ANTI_TANK_GUN';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ANTI_TANK_GUN';
update Units set Cost = 690, Maintenance = 8, BaseMoves = 3, Range = 0, Combat = 92, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_MODERN_AT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MODERN_AT';

-- Ranged
update Units set Cost = 45, Maintenance = 1, BaseMoves = 2, Range = 2, Combat = 13, RangedCombat = 23, StrategicResource = NULL where UnitType = 'UNIT_ARCHER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ARCHER';
-- update Units set Cost = 60, Maintenance = 2, BaseMoves = 2, Range = 2, Combat = 20, RangedCombat = 30, StrategicResource = NULL where UnitType = 'UNIT_COMPOSITE_BOWMAN';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_COMPOSITE_BOWMAN';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 2, Combat = 30, RangedCombat = 40, StrategicResource = NULL where UnitType = 'UNIT_CROSSBOWMAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CROSSBOWMAN';
-- update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 2, Combat = 40, RangedCombat = 50, StrategicResource = NULL where UnitType = 'UNIT_CULVERIN';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CULVERIN';
update Units set Cost = 210, Maintenance = 5, BaseMoves = 2, Range = 2, Combat = 50, RangedCombat = 60, StrategicResource = NULL where UnitType = 'UNIT_FIELD_CANNON';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_FIELD_CANNON';
-- update Units set Cost = 310, Maintenance = 6, BaseMoves = 3, Range = 2, Combat = 60, RangedCombat = 70, StrategicResource = NULL where UnitType = 'UNIT_FIELD_GUN';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_FIELD_GUN';
update Units set Cost = 460, Maintenance = 7, BaseMoves = 3, Range = 2, Combat = 70, RangedCombat = 80, StrategicResource = NULL where UnitType = 'UNIT_MACHINE_GUN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MACHINE_GUN';
-- update Units set Cost = 460, Maintenance = 7, BaseMoves = 3, Range = 2, Combat = 70, RangedCombat = 80, StrategicResource = NULL where UnitType = 'UNIT_FIELD_HOWITZER';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_FIELD_HOWITZER';
-- update Units set Cost = 690, Maintenance = 8, BaseMoves = 3, Range = 2, Combat = 80, RangedCombat = 90, StrategicResource = NULL where UnitType = 'UNIT_FIELD_ARTILLERY';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_FIELD_ARTILLERY';

-- Light cavalry
update Units set Cost = 65, Maintenance = 2, BaseMoves = 4, Range = 0, Combat = 36, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_HORSEMAN';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_HORSEMAN';
update Units set Cost = 95, Maintenance = 3, BaseMoves = 5, Range = 0, Combat = 46, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_COURSER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_COURSER';
-- update Units set Cost = 150, Maintenance = 4, BaseMoves = 5, Range = 0, Combat = 56, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_STRADIOT';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_STRADIOT';
update Units set Cost = 220, Maintenance = 5, BaseMoves = 5, Range = 0, Combat = 66, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_CAVALRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_CAVALRY';
-- update Units set Cost = 330, Maintenance = 6, BaseMoves = 5, Range = 0, Combat = 76, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_MOUNTED_RIFLES';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MOUNTED_RIFLES';
update Units set Cost = 460, Maintenance = 7, BaseMoves = 4, Range = 0, Combat = 96, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON', PrereqTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_HELICOPTER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_HELICOPTER';
-- update Units set Cost = 480, Maintenance = 7, BaseMoves = 5, Range = 0, Combat = 86, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_ARMORED_INFANTRY';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ARMORED_INFANTRY';
-- Special Cases: UNIT_MECHANIZED_INFANTRY

-- Heavy cavalry
update Units set Cost = 55, Maintenance = 1, BaseMoves = 2, Range = 0, Combat = 30, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_HEAVY_CHARIOT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_HEAVY_CHARIOT';
-- update Units set Cost = 80, Maintenance = 2, BaseMoves = 4, Range = 0, Combat = 40, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_ARMORED_HORSEMAN';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ARMORED_HORSEMAN';
update Units set Cost = 150, Maintenance = 6, BaseMoves = 4, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_KNIGHT';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_KNIGHT';
-- update Units set Cost = 220, Maintenance = 8, BaseMoves = 4, Range = 0, Combat = 65, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_REITER';
-- update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_REITER';
-- update Units set Cost = 330, Maintenance = 10, BaseMoves = 4, Range = 0, Combat = 75, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_CUIRASSIER';
-- update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_CUIRASSIER';
update Units set Cost = 300, Maintenance = 10, BaseMoves = 4, Range = 0, Combat = 73, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_CUIRASSIER';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_CUIRASSIER';
-- update Units set Cost = 400, Maintenance = 10, BaseMoves = 4, Range = 0, Combat = 82, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_LANDSHIP';
-- update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_LANDSHIP';
-- Special Case: UNIT_TANK
update Units set Cost = 500, Maintenance = 10, BaseMoves = 4, Range = 0, Combat = 85, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_TANK';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_TANK';
update Units set Cost = 1080, Maintenance = 16, BaseMoves = 5, Range = 0, Combat = 105, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_MODERN_ARMOR';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_MODERN_ARMOR';

-- Bombard
update Units set Cost = 75, Maintenance = 2, BaseMoves = 2, Range = 2, Combat = 25, Bombard = 35, StrategicResource = NULL where UnitType = 'UNIT_CATAPULT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CATAPULT';
update Units set Cost = 120, Maintenance = 3, BaseMoves = 2, Range = 2, Combat = 35, Bombard = 45, StrategicResource = NULL where UnitType = 'UNIT_TREBUCHET';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_TREBUCHET';
update Units set Cost = 200, Maintenance = 6, BaseMoves = 2, Range = 2, Combat = 50, Bombard = 60, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_BOMBARD';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_BOMBARD';
-- update Units set Cost = 300, Maintenance = 7, BaseMoves = 2, Range = 2, Combat = 60, Bombard = 70, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_RIFLED_CANNON';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_RIFLED_CANNON';
update Units set Cost = 450, Maintenance = 9, BaseMoves = 3, Range = 2, Combat = 70, Bombard = 80, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_ARTILLERY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ARTILLERY';
-- update Units set Cost = 640, Maintenance = 10, BaseMoves = 3, Range = 3, Combat = 70, Bombard = 90, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_HEAVY_HOWITZER';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_HEAVY_HOWITZER';
update Units set Cost = 960, Maintenance = 12, BaseMoves = 3, Range = 3, Combat = 80, Bombard = 100, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_ROCKET_ARTILLERY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ROCKET_ARTILLERY';

-- Recon
update Units set Cost = 90, Maintenance = 3, BaseMoves = 3, Range = 1, Combat = 40, RangedCombat = 30, StrategicResource = NULL where UnitType = 'UNIT_SKIRMISHER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SKIRMISHER';
-- update Units set Cost = 140, Maintenance = 4, BaseMoves = 3, Range = 1, Combat = 50, RangedCombat = 40, StrategicResource = NULL where UnitType = 'UNIT_ARQUEBUSIER';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ARQUEBUSIER';
update Units set Cost = 210, Maintenance = 5, BaseMoves = 3, Range = 1, Combat = 60, RangedCombat = 50, StrategicResource = NULL where UnitType = 'UNIT_RANGER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_RANGER';
-- Special Cases: UNIT_MACHINE_GUN
update Units set Cost = 460, Maintenance = 8, BaseMoves = 4, Range = 1, Combat = 80, RangedCombat = 70, StrategicResource = NULL where UnitType = 'UNIT_SPEC_OPS';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SPEC_OPS';
-- Special Cases: UNIT_HELICOPTER

-- Support
update Units set Cost = 60, Maintenance = 1, BaseMoves = 3, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_BATTERING_RAM';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_BATTERING_RAM';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 3, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_SIEGE_TOWER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SIEGE_TOWER';
update Units set Cost = 180, Maintenance = 3, BaseMoves = 3, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_MEDIC';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MEDIC';
update Units set Cost = 270, Maintenance = 3, BaseMoves = 4, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_SUPPLY_CONVOY';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SUPPLY_CONVOY';
update Units set Cost = 400, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_ANTIAIR_GUN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ANTIAIR_GUN';
update Units set Cost = 500, Maintenance = 4, BaseMoves = 3, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_MOBILE_SAM';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MOBILE_SAM';

update Units set Cost = 200, Maintenance = 3, BaseMoves = 3, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_OBSERVATION_BALLOON';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_OBSERVATION_BALLOON';
-- update Units set Cost = 250, Maintenance = 3, BaseMoves = 4, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_RECON_HELICOPTER';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_RECON_HELICOPTER';
update Units set Cost = 300, Maintenance = 4, BaseMoves = 4, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_DRONE';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_DRONE';

-- Naval Melee
update Units set Cost = 55, Maintenance = 1, BaseMoves = 3, Range = 0, Combat = 30, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_GALLEY';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GALLEY';
update Units set Cost = 110, Maintenance = 3, BaseMoves = 3, Range = 0, Combat = 45, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_DLV_COG';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_DLV_COG';
-- update Units set Cost = 110, Maintenance = 3, BaseMoves = 3, Range = 0, Combat = 45, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_COG';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_COG';
update Units set Cost = 180, Maintenance = 4, BaseMoves = 4, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_CARAVEL';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CARAVEL';
-- update Units set Cost = 200, Maintenance = 4, BaseMoves = 4, Range = 0, Combat = 60, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_CORVETTE';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_CORVETTE';
update Units set Cost = 300, Maintenance = 5, BaseMoves = 5, Range = 0, Combat = 70, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_IRONCLAD';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_IRONCLAD';
-- update Units set Cost = 450, Maintenance = 6, BaseMoves = 5, Range = 0, Combat = 80, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_TORPEDO_GUNBOAT';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_TORPEDO_GUNBOAT';
update Units set Cost = 670, Maintenance = 7, BaseMoves = 5, Range = 0, Combat = 90, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_DESTROYER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_DESTROYER';
-- update Units set Cost = 1000, Maintenance = 8, BaseMoves = 5, Range = 0, Combat = 100, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_MISSILE_DESTROYER';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MISSILE_DESTROYER';

-- Naval Ranged
update Units set Cost = 80, Maintenance = 2, BaseMoves = 3, Range = 1, Combat = 25, RangedCombat = 35, StrategicResource = NULL where UnitType = 'UNIT_QUADRIREME';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_QUADRIREME';
update Units set Cost = 120, Maintenance = 3, BaseMoves = 4, Range = 1, Combat = 35, RangedCombat = 45, StrategicResource = NULL where UnitType = 'UNIT_DLV_GALLEASS';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_DLV_GALLEASS';
-- update Units set Cost = 120, Maintenance = 3, BaseMoves = 4, Range = 1, Combat = 35, RangedCombat = 45, StrategicResource = NULL where UnitType = 'UNIT_GALLEASS';
-- update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GALLEASS';
update Units set Cost = 220, Maintenance = 4, BaseMoves = 4, Range = 2, Combat = 50, RangedCombat = 60, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_FRIGATE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_FRIGATE';
-- update Units set Cost = 330, Maintenance = 5, BaseMoves = 4, Range = 2, Combat = 60, RangedCombat = 70, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_ARMORED_CRUISER';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ARMORED_CRUISER';
-- update Units set Cost = 500, Maintenance = 6, BaseMoves = 5, Range = 3, Combat = 70, RangedCombat = 80, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_LIGHT_CRUISER';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_LIGHT_CRUISER';
update Units set Cost = 500, Maintenance = 6, BaseMoves = 5, Range = 3, Combat = 70, RangedCombat = 80, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_BATTLESHIP';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_BATTLESHIP';
-- update Units set Cost = 720, Maintenance = 7, BaseMoves = 5, Range = 4, Combat = 75, RangedCombat = 85, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_BATTLECRUISER';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_BATTLECRUISER';
update Units set Cost = 1080, Maintenance = 8, BaseMoves = 5, Range = 4, Combat = 75, RangedCombat = 95, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_MISSILE_CRUISER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MISSILE_CRUISER';

-- Naval Raider
update Units set Cost = 110, Maintenance = 3, BaseMoves = 4, Range = 1, Combat = 30, RangedCombat = 40, StrategicResource = NULL where UnitType = 'UNIT_DL_MEDIEVAL_PIRATE';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_DL_MEDIEVAL_PIRATE';
update Units set Cost = 180, Maintenance = 4, BaseMoves = 4, Range = 2, Combat = 40, RangedCombat = 50, StrategicResource = NULL where UnitType = 'UNIT_PRIVATEER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_PRIVATEER';
-- update Units set Cost = 300, Maintenance = 5, BaseMoves = 4, Range = 2, Combat = 55, RangedCombat = 65, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_RAIDER';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_RAIDER';
update Units set Cost = 450, Maintenance = 6, BaseMoves = 5, Range = 2, Combat = 65, RangedCombat = 75, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_SUBMARINE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SUBMARINE';
-- update Units set Cost = 600, Maintenance = 7, BaseMoves = 5, Range = 2, Combat = 75, RangedCombat = 85, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_ATTACK_SUBMARINE';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ATTACK_SUBMARINE';
update Units set Cost = 900, Maintenance = 8, BaseMoves = 5, Range = 2, Combat = 85, RangedCombat = 95, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_NUCLEAR_SUBMARINE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_URANIUM', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_NUCLEAR_SUBMARINE';

-- Carrier
update Units set Cost = 750, Maintenance = 7, BaseMoves = 4, Range = 0, Combat = 70, RangedCombat = 0, StrategicResource = 'RESOURCE_OIL' where UnitType = 'UNIT_AIRCRAFT_CARRIER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_AIRCRAFT_CARRIER';
-- update Units set Cost = 1200, Maintenance = 8, BaseMoves = 5, Range = 0, Combat = 80, RangedCombat = 0, StrategicResource = 'RESOURCE_URANIUM' where UnitType = 'UNIT_SUPERCARRIER';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_URANIUM', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SUPERCARRIER';
-- GDR
update Units set Cost = 1500 where UnitType = 'UNIT_GIANT_DEATH_ROBOT';

-- Promotions
update Units set BaseMoves = BaseMoves - 1 where PromotionClass = 'PROMOTION_CLASS_RECON';
-- update Units set BaseMoves = BaseMoves + 1 where PromotionClass = 'PROMOTION_CLASS_SIEGE';

--------------------------------------------------------------------------------------------------------------
-- New units
insert or replace into Types (Type,     Kind) values
    ('UNIT_HD_BARBARIAN_GALLEY',        'KIND_UNIT'),
    ('UNIT_HD_BARBARIAN_QUADRIREME',    'KIND_UNIT');

insert or replace into Units
    (UnitType,                      Name,                                           Description,
    BaseSightRange, BaseMoves,   Combat, RangedCombat,   Range,  Cost,  ZoneOfControl,  PurchaseYield, Domain,          PrereqTech,
    FormationClass,             PromotionClass,                 PseudoYieldType,                    AdvisorType)
values
    ('UNIT_HD_BARBARIAN_GALLEY',        'LOC_UNIT_HD_BARBARIAN_GALLEY_NAME',        'LOC_UNIT_HD_BARBARIAN_GALLEY_DESCRIPTION',
    2,              3,           20,     0,              0,      40,    1,              'YIELD_GOLD',  'DOMAIN_SEA',    'TECH_SAILING',
    'FORMATION_CLASS_NAVAL',    'PROMOTION_CLASS_NAVAL_RAIDER', 'PSEUDOYIELD_UNIT_NAVAL_COMBAT',    'ADVISOR_CONQUEST'),
    ('UNIT_HD_BARBARIAN_QUADRIREME',    'LOC_UNIT_HD_BARBARIAN_QUADRIREME_NAME',    'LOC_UNIT_HD_BARBARIAN_QUADRIREME_DESCRIPTION',
    2,              3,           20,     25,             1,      60,    1,              'YIELD_GOLD',  'DOMAIN_SEA',    'TECH_SAILING',
    'FORMATION_CLASS_NAVAL',    'PROMOTION_CLASS_NAVAL_RANGED', 'PSEUDOYIELD_UNIT_NAVAL_COMBAT',    'ADVISOR_CONQUEST');

update Units set TraitType = 'TRAIT_BARBARIAN_BUT_SHOWS_UP_IN_PEDIA'
    where UnitType = 'UNIT_HD_BARBARIAN_GALLEY' or UnitType = 'UNIT_HD_BARBARIAN_QUADRIREME';
update Technologies set BarbarianFree = 0 where TechnologyType = 'TECH_SHIPBUILDING';

-- UNIT_BARBARIAN_RAIDER
insert or replace into TypeTags
    (Type,                              Tag)
values
    -- ('UNIT_HD_BARBARIAN_GALLEY',        'CLASS_NAVAL_RAIDER'),
    -- ('UNIT_HD_BARBARIAN_GALLEY',        'CLASS_NAVAL_RANGED'),
    -- ('UNIT_HD_BARBARIAN_GALLEY',        'CLASS_STEALTH'),
    ('UNIT_HD_BARBARIAN_GALLEY',        'CLASS_NAVAL_RAIDER'),
    ('UNIT_HD_BARBARIAN_GALLEY',        'CLASS_REVEAL_STEALTH'),
    -- ('UNIT_HD_BARBARIAN_QUADRIREME',    'CLASS_NAVAL_RAIDER'),
    ('UNIT_HD_BARBARIAN_QUADRIREME',    'CLASS_NAVAL_RANGED');
    -- ('UNIT_HD_BARBARIAN_GALLEY',    'CLASS_STEALTH'),
    -- ('UNIT_HD_BARBARIAN_GALLEY',    'CLASS_REVEAL_STEALTH');

-- insert or replace into UnitUpgrades (Unit,  UpgradeUnit) values ('UNIT_HD_BARBARIAN_GALLEY',        'UNIT_GALLEY');
insert or replace into UnitUpgrades (Unit,  UpgradeUnit) values ('UNIT_HD_BARBARIAN_QUADRIREME',    'UNIT_QUADRIREME');
insert or replace into UnitUpgrades (Unit,  UpgradeUnit) values ('UNIT_HD_BARBARIAN_GALLEY',        'UNIT_PRIVATEER');
update UnitUpgrades set UpgradeUnit = 'UNIT_DL_MEDIEVAL_PIRATE' where Unit = 'UNIT_HD_BARBARIAN_GALLEY'
and exists (select UnitType from Units where UnitType = 'UNIT_DL_MEDIEVAL_PIRATE');

insert or replace into UnitAiInfos
    (UnitType,                          AiType)
values
    ('UNIT_HD_BARBARIAN_GALLEY',        'UNITAI_COMBAT'),
    ('UNIT_HD_BARBARIAN_GALLEY',        'UNITAI_EXPLORE'),
    ('UNIT_HD_BARBARIAN_GALLEY',        'UNITTYPE_MELEE'),
    ('UNIT_HD_BARBARIAN_GALLEY',        'UNITTYPE_NAVAL'),
    ('UNIT_HD_BARBARIAN_QUADRIREME',    'UNITAI_COMBAT'),
    ('UNIT_HD_BARBARIAN_QUADRIREME',    'UNITTYPE_RANGED'),
    ('UNIT_HD_BARBARIAN_QUADRIREME',    'UNITTYPE_NAVAL');

update BarbarianTribes set ScoutTag = 'CLASS_NAVAL_RAIDER', TurnsToWarriorSpawn = 15 where TribeType = 'TRIBE_NAVAL';
