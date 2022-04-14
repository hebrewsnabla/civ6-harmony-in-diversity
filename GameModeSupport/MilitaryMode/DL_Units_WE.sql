-------------------------------------
--      All Testing Adjustments    --
-------------------------------------

-- TODO: 单位过期科技

-- Costs
update Units set Cost = 20 where UnitType = 'UNIT_SCOUT';
update Units set Cost = 25 where UnitType = 'UNIT_SLINGER';
update Units set Cost = 30 where UnitType = 'UNIT_WARRIOR';
update Units set Cost = 110 where UnitType = 'UNIT_MILITARY_ENGINEER';

-- Melee
update Units set Cost = 60, Maintenance = 2, BaseMoves = 2, Range = 0, Combat = 35, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_SWORDSMAN';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SWORDSMAN';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 45, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_MAN_AT_ARMS';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MAN_AT_ARMS';
update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_MUSKETMAN';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MUSKETMAN';
update Units set Cost = 210, Maintenance = 5, BaseMoves = 2, Range = 0, Combat = 65, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_LINE_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_LINE_INFANTRY';
update Units set Cost = 310, Maintenance = 6, BaseMoves = 3, Range = 0, Combat = 75, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_WW1_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_WW1_INFANTRY';
-- Special Cases: UNIT_INFANTRY
update Units set Cost = 690, Maintenance = 8, BaseMoves = 3, Range = 0, Combat = 95, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_MODERN_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MODERN_INFANTRY';

-- Anti Cavalry
update Units set Cost = 45, Maintenance = 1, BaseMoves = 2, Range = 0, Combat = 25, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_SPEARMAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SPEARMAN';
update Units set Cost = 60, Maintenance = 2, BaseMoves = 2, Range = 0, Combat = 32, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_HEAVY_INFANTRY';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_HEAVY_INFANTRY';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 42, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_PIKEMAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_PIKEMAN';
update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 0, Combat = 52, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_PIKE_AND_SHOT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_PIKE_AND_SHOT';
update Units set Cost = 210, Maintenance = 5, BaseMoves = 2, Range = 0, Combat = 62, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_GUARDS';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GUARDS';
update Units set Cost = 310, Maintenance = 6, BaseMoves = 3, Range = 0, Combat = 72, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_AT_CREW';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_AT_CREW';
update Units set Cost = 460, Maintenance = 7, BaseMoves = 3, Range = 0, Combat = 82, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_ANTI_TANK_GUN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ANTI_TANK_GUN';
update Units set Cost = 690, Maintenance = 8, BaseMoves = 3, Range = 0, Combat = 92, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_MODERN_AT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MODERN_AT';

-- Ranged
update Units set Cost = 45, Maintenance = 1, BaseMoves = 2, Range = 2, Combat = 13, RangedCombat = 23, StrategicResource = NULL where UnitType = 'UNIT_ARCHER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ARCHER';
update Units set Cost = 60, Maintenance = 2, BaseMoves = 2, Range = 2, Combat = 20, RangedCombat = 30, StrategicResource = NULL where UnitType = 'UNIT_COMPOSITE_BOWMAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_COMPOSITE_BOWMAN';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 2, Combat = 30, RangedCombat = 40, StrategicResource = NULL where UnitType = 'UNIT_CROSSBOWMAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CROSSBOWMAN';
update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 2, Combat = 40, RangedCombat = 50, StrategicResource = NULL where UnitType = 'UNIT_CULVERIN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CULVERIN';
update Units set Cost = 210, Maintenance = 5, BaseMoves = 2, Range = 2, Combat = 50, RangedCombat = 60, StrategicResource = NULL where UnitType = 'UNIT_FIELD_CANNON';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_FIELD_CANNON';
update Units set Cost = 310, Maintenance = 6, BaseMoves = 3, Range = 2, Combat = 60, RangedCombat = 70, StrategicResource = NULL where UnitType = 'UNIT_FIELD_GUN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_FIELD_GUN';
update Units set Cost = 460, Maintenance = 7, BaseMoves = 3, Range = 2, Combat = 70, RangedCombat = 80, StrategicResource = NULL where UnitType = 'UNIT_FIELD_HOWITZER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_FIELD_HOWITZER';
update Units set Cost = 690, Maintenance = 8, BaseMoves = 3, Range = 2, Combat = 80, RangedCombat = 90, StrategicResource = NULL where UnitType = 'UNIT_FIELD_ARTILLERY';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_FIELD_ARTILLERY';

-- Light cavalry
update Units set Cost = 65, Maintenance = 2, BaseMoves = 4, Range = 0, Combat = 36, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_HORSEMAN';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_HORSEMAN';
update Units set Cost = 95, Maintenance = 3, BaseMoves = 4, Range = 0, Combat = 46, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_COURSER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_COURSER';
update Units set Cost = 150, Maintenance = 4, BaseMoves = 5, Range = 0, Combat = 56, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_STRADIOT';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_STRADIOT';
update Units set Cost = 220, Maintenance = 5, BaseMoves = 5, Range = 0, Combat = 66, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_CAVALRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_CAVALRY';
update Units set Cost = 330, Maintenance = 6, BaseMoves = 5, Range = 0, Combat = 76, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_MOUNTED_RIFLES';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MOUNTED_RIFLES';
update Units set Cost = 480, Maintenance = 7, BaseMoves = 5, Range = 0, Combat = 86, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_ARMORED_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ARMORED_INFANTRY';
-- Special Cases: UNIT_MECHANIZED_INFANTRY

-- Heavy cavalry
update Units set Cost = 55, Maintenance = 1, BaseMoves = 2, Range = 0, Combat = 30, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_HEAVY_CHARIOT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_HEAVY_CHARIOT';
update Units set Cost = 80, Maintenance = 2, BaseMoves = 4, Range = 0, Combat = 40, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_ARMORED_HORSEMAN';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ARMORED_HORSEMAN';
update Units set Cost = 150, Maintenance = 6, BaseMoves = 4, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_KNIGHT';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_KNIGHT';
update Units set Cost = 220, Maintenance = 8, BaseMoves = 4, Range = 0, Combat = 65, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_REITER';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_REITER';
update Units set Cost = 330, Maintenance = 10, BaseMoves = 4, Range = 0, Combat = 75, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_CUIRASSIER';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_CUIRASSIER';
update Units set Cost = 400, Maintenance = 10, BaseMoves = 4, Range = 0, Combat = 82, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_LANDSHIP';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_LANDSHIP';
-- Special Case: UNIT_TANK
update Units set Cost = 1080, Maintenance = 16, BaseMoves = 5, Range = 0, Combat = 105, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_MODERN_ARMOR';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_MODERN_ARMOR';

-- Bombard
update Units set Cost = 75, Maintenance = 2, BaseMoves = 2, Range = 2, Combat = 25, Bombard = 35, StrategicResource = NULL where UnitType = 'UNIT_CATAPULT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CATAPULT';
update Units set Cost = 120, Maintenance = 3, BaseMoves = 2, Range = 2, Combat = 35, Bombard = 45, StrategicResource = NULL where UnitType = 'UNIT_TREBUCHET';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_TREBUCHET';
update Units set Cost = 200, Maintenance = 6, BaseMoves = 2, Range = 2, Combat = 50, Bombard = 60, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_BOMBARD';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_BOMBARD';
update Units set Cost = 300, Maintenance = 7, BaseMoves = 2, Range = 2, Combat = 60, Bombard = 70, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_RIFLED_CANNON';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_RIFLED_CANNON';
update Units set Cost = 450, Maintenance = 9, BaseMoves = 3, Range = 2, Combat = 70, Bombard = 80, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_ARTILLERY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ARTILLERY';
update Units set Cost = 640, Maintenance = 10, BaseMoves = 3, Range = 3, Combat = 70, Bombard = 90, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_HEAVY_HOWITZER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_HEAVY_HOWITZER';
update Units set Cost = 960, Maintenance = 12, BaseMoves = 3, Range = 3, Combat = 80, Bombard = 100, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_ROCKET_ARTILLERY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ROCKET_ARTILLERY';

-- Recon
update Units set Cost = 90, Maintenance = 3, BaseMoves = 3, Range = 1, Combat = 40, RangedCombat = 30, StrategicResource = NULL where UnitType = 'UNIT_SKIRMISHER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SKIRMISHER';
update Units set Cost = 140, Maintenance = 4, BaseMoves = 3, Range = 1, Combat = 50, RangedCombat = 40, StrategicResource = NULL where UnitType = 'UNIT_ARQUEBUSIER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ARQUEBUSIER';
update Units set Cost = 210, Maintenance = 5, BaseMoves = 3, Range = 1, Combat = 60, RangedCombat = 50, StrategicResource = NULL where UnitType = 'UNIT_RANGER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_RANGER';
-- Special Cases: UNIT_MACHINE_GUN
-- Special Cases: UNIT_HELICOPTER

-- Support
update Units set Cost = 50, Maintenance = 1, BaseMoves = 2, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_BATTERING_RAM';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_BATTERING_RAM';
update Units set Cost = 80, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_SIEGE_TOWER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SIEGE_TOWER';
update Units set Cost = 220, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_MEDIC';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MEDIC';
update Units set Cost = 270, Maintenance = 3, BaseMoves = 4, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_SUPPLY_CONVOY';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SUPPLY_CONVOY';
update Units set Cost = 400, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_ANTIAIR_GUN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ANTIAIR_GUN';
update Units set Cost = 500, Maintenance = 4, BaseMoves = 3, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_MOBILE_SAM';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MOBILE_SAM';

update Units set Cost = 200, Maintenance = 2, BaseMoves = 2, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_OBSERVATION_BALLOON';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_OBSERVATION_BALLOON';
update Units set Cost = 250, Maintenance = 3, BaseMoves = 4, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_RECON_HELICOPTER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_RECON_HELICOPTER';
update Units set Cost = 200, Maintenance = 3, BaseMoves = 3, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_DRONE';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_DRONE';

-- Naval Melee
update Units set Cost = 55, Maintenance = 1, BaseMoves = 3, Range = 0, Combat = 30, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_GALLEY';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GALLEY';
update Units set Cost = 110, Maintenance = 3, BaseMoves = 3, Range = 0, Combat = 45, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_COG';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_COG';
update Units set Cost = 180, Maintenance = 4, BaseMoves = 4, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_CARAVEL';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CARAVEL';
-- update Units set Cost = 200, Maintenance = 4, BaseMoves = 4, Range = 0, Combat = 60, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_CORVETTE';
-- update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_CORVETTE';
update Units set Cost = 300, Maintenance = 5, BaseMoves = 5, Range = 0, Combat = 70, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_IRONCLAD';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_IRONCLAD';
update Units set Cost = 450, Maintenance = 6, BaseMoves = 5, Range = 0, Combat = 80, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_TORPEDO_GUNBOAT';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_TORPEDO_GUNBOAT';
update Units set Cost = 670, Maintenance = 7, BaseMoves = 5, Range = 0, Combat = 90, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_DESTROYER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_DESTROYER';
update Units set Cost = 1000, Maintenance = 8, BaseMoves = 5, Range = 0, Combat = 100, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_MISSILE_DESTROYER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MISSILE_DESTROYER';

-- Naval Ranged
update Units set Cost = 80, Maintenance = 2, BaseMoves = 3, Range = 1, Combat = 25, RangedCombat = 35, StrategicResource = NULL where UnitType = 'UNIT_QUADRIREME';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_QUADRIREME';
update Units set Cost = 120, Maintenance = 3, BaseMoves = 4, Range = 1, Combat = 35, RangedCombat = 45, StrategicResource = NULL where UnitType = 'UNIT_GALLEASS';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GALLEASS';
update Units set Cost = 220, Maintenance = 4, BaseMoves = 4, Range = 2, Combat = 50, RangedCombat = 60, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_FRIGATE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_FRIGATE';
update Units set Cost = 330, Maintenance = 5, BaseMoves = 4, Range = 2, Combat = 60, RangedCombat = 70, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_ARMORED_CRUISER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ARMORED_CRUISER';
update Units set Cost = 500, Maintenance = 6, BaseMoves = 5, Range = 3, Combat = 70, RangedCombat = 80, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_LIGHT_CRUISER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_LIGHT_CRUISER';
update Units set Cost = 500, Maintenance = 6, BaseMoves = 5, Range = 3, Combat = 70, RangedCombat = 80, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_BATTLESHIP';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_BATTLESHIP';
update Units set Cost = 720, Maintenance = 7, BaseMoves = 5, Range = 4, Combat = 75, RangedCombat = 85, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_BATTLECRUISER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_BATTLECRUISER';
update Units set Cost = 1080, Maintenance = 8, BaseMoves = 5, Range = 4, Combat = 75, RangedCombat = 95, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_MISSILE_CRUISER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MISSILE_CRUISER';

-- Naval Raider
update Units set Cost = 180, Maintenance = 4, BaseMoves = 4, Range = 2, Combat = 40, RangedCombat = 50, StrategicResource = NULL where UnitType = 'UNIT_PRIVATEER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_PRIVATEER';
update Units set Cost = 300, Maintenance = 5, BaseMoves = 4, Range = 2, Combat = 55, RangedCombat = 65, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_RAIDER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_RAIDER';
update Units set Cost = 450, Maintenance = 6, BaseMoves = 5, Range = 2, Combat = 65, RangedCombat = 75, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_SUBMARINE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SUBMARINE';
update Units set Cost = 600, Maintenance = 7, BaseMoves = 5, Range = 2, Combat = 75, RangedCombat = 85, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_ATTACK_SUBMARINE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ATTACK_SUBMARINE';
update Units set Cost = 900, Maintenance = 8, BaseMoves = 5, Range = 2, Combat = 85, RangedCombat = 95, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_NUCLEAR_SUBMARINE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_URANIUM', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_NUCLEAR_SUBMARINE';

-- Carrier
update Units set Cost = 750, Maintenance = 7, BaseMoves = 4, Range = 0, Combat = 70, RangedCombat = 0, StrategicResource = 'RESOURCE_OIL' where UnitType = 'UNIT_AIRCRAFT_CARRIER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_AIRCRAFT_CARRIER';
update Units set Cost = 1200, Maintenance = 8, BaseMoves = 5, Range = 0, Combat = 80, RangedCombat = 0, StrategicResource = 'RESOURCE_URANIUM' where UnitType = 'UNIT_SUPERCARRIER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_URANIUM', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SUPERCARRIER';
-- GDR
update Units set Cost = 1500 where UnitType = 'UNIT_GIANT_DEATH_ROBOT';

--------------------------------------------------------------------------------
-- Special Cases
-- UNIT_MACHINE_GUN: ranged vs recon
-- UNIT_MECHANIZED_INFANTRY: melee vs light_cavalry
-- UNIT_HELICOPTER: light_cavalry vs recon
-- UNIT_TANK: cavalry vs cavalry (+1 era)
-- UNIT_INFANTRY: melee vs melee (+1 era)
-- UNIT_SPEC_OPS: recon vs recon (+1 era)
update Units set Cost = 460, Maintenance = 7, BaseMoves = 3, Range = 2, Combat = 70, RangedCombat = 80, StrategicResource = NULL where UnitType = 'UNIT_MACHINE_GUN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MACHINE_GUN';
update Units set Cost = 690, Maintenance = 8, BaseMoves = 3, Range = 0, Combat = 95, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_MECHANIZED_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MECHANIZED_INFANTRY';
update Units set Cost = 460, Maintenance = 7, BaseMoves = 4, Range = 0, Combat = 96, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON', PrereqTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_HELICOPTER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_HELICOPTER';
update Units set Cost = 500, Maintenance = 10, BaseMoves = 4, Range = 0, Combat = 85, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_TANK';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_TANK';
update Units set Cost = 310, Maintenance = 6, BaseMoves = 3, Range = 0, Combat = 75, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_INFANTRY';
update Units set Cost = 460, Maintenance = 8, BaseMoves = 3, Range = 1, Combat = 80, RangedCombat = 70, StrategicResource = NULL where UnitType = 'UNIT_SPEC_OPS';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SPEC_OPS';

-- WE
update Units set Cost = 310, Maintenance = 6, BaseMoves = 3, Range = 1, Combat = 70, RangedCombat = 60, StrategicResource = NULL, PromotionClass = 'PROMOTION_CLASS_RECON'
    where UnitType = 'UNIT_MACHINE_GUN' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0
    where UnitType = 'UNIT_MACHINE_GUN' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units set Cost = 720, Maintenance = 8, BaseMoves = 6, Range = 0, Combat = 96, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON', PromotionClass = 'PROMOTION_CLASS_LIGHT_CAVALRY'
    where UnitType = 'UNIT_MECHANIZED_INFANTRY' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1
    where UnitType = 'UNIT_MECHANIZED_INFANTRY' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units set Cost = 460, Maintenance = 7, BaseMoves = 4, Range = 1, Combat = 80, RangedCombat = 70, StrategicResource = NULL, PromotionClass = 'PROMOTION_CLASS_RECON'
    where UnitType = 'UNIT_HELICOPTER' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0
    where UnitType = 'UNIT_HELICOPTER' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units set Cost = 700, Maintenance = 14, BaseMoves = 4, Range = 0, Combat = 95, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON'
    where UnitType = 'UNIT_TANK' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 2
    where UnitType = 'UNIT_TANK' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units set Cost = 460, Maintenance = 7, BaseMoves = 3, Range = 0, Combat = 85, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON'
    where UnitType = 'UNIT_INFANTRY' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1
    where UnitType = 'UNIT_INFANTRY' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update Units set Cost = 690, Maintenance = 8, BaseMoves = 4, Range = 1, Combat = 90, RangedCombat = 80, StrategicResource = NULL, PrereqTech = 'TECH_NANOTECHNOLOGY'
    where UnitType = 'UNIT_SPEC_OPS' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');

-- Promotion Class
update Units set PromotionClass = 'PROMOTION_CLASS_RANGED' where UnitType = 'UNIT_SLINGER';
update Units set PromotionClass = 'PROMOTION_CLASS_NAVAL_RANGED' where UnitType = 'UNIT_BRAZILIAN_MINAS_GERAES'; -- TODO: revert.
update Units set PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' where UnitType = 'UNIT_AT_CREW' or UnitType = 'UNIT_MODERN_AT';
update Units set PromotionClass = 'PROMOTION_CLASS_NAVAL_RANGED' where UnitType = 'UNIT_MISSILE_CRUISER';
    -- WE units
update Units set PromotionClass = 'PROMOTION_CLASS_RECON' where UnitType = 'UNIT_ARQUEBUSIER';
update Units set PromotionClass = 'PROMOTION_CLASS_NAVAL_MELEE' where UnitType = 'UNIT_MISSILE_DESTROYER';
update Units set PromotionClass = 'PROMOTION_CLASS_NAVAL_RAIDER' where UnitType = 'UNIT_ATTACK_SUBMARINE';

-- Prereq Tech
update Units set PrereqTech = 'TECH_MACHINERY' where UnitType = 'UNIT_SIEGE_TOWER';
update Units set PrereqTech = 'TECH_CHEMISTRY' where UnitType = 'UNIT_AT_CREW';
update Units set PrereqTech = 'TECH_COMBINED_ARMS' where UnitType = 'UNIT_DESTROYER';
update Units set PrereqTech = 'TECH_LASERS' where UnitType = 'UNIT_MISSILE_CRUISER';
    -- WE units
update Units set PrereqTech = 'TECH_CONSTRUCTION' where UnitType = 'UNIT_COMPOSITE_BOWMAN';
update Units set PrereqTech = 'TECH_REFINING' where UnitType = 'UNIT_LIGHT_CRUISER';
update Units set PrereqTech = 'TECH_COMPUTERS' where UnitType = 'UNIT_ATTACK_SUBMARINE';
update Units set PrereqTech = 'TECH_LASERS' where UnitType = 'UNIT_MISSILE_DESTROYER';

-------------------
-- Unit AI Infos --
-------------------
delete from UnitAIInfos where UnitType = 'UNIT_AT_CREW' and AiType = 'UNITTYPE_RANGED';
delete from UnitAIInfos where UnitType = 'UNIT_MODERN_AT' and AiType = 'UNITTYPE_RANGED';
delete from UnitAIInfos where UnitType = 'UNIT_ANTI_TANK_GUN' and AiType = 'UNITTYPE_RANGED';
delete from UnitAIInfos where UnitType = 'UNIT_ATTACK_SUBMARINE' and AiType = 'UNITTYPE_MELEE';

insert or ignore into UnitAIInfos
    (UnitType,              AiType)
values
    ('UNIT_HELICOPTER',    'UNITAI_EXPLORE'),
    ('UNIT_HELICOPTER',    'UNITTYPE_MELEE'),
    ('UNIT_AT_CREW',       'UNITAI_EXPLORE'),
    ('UNIT_AT_CREW',       'UNITTYPE_MELEE'),
    ('UNIT_MODERN_AT',     'UNITAI_EXPLORE'),
    ('UNIT_MODERN_AT',     'UNITTYPE_MELEE'),
    -- Recon
    ('UNIT_SKIRMISHER',    'UNITTYPE_MELEE'),
    ('UNIT_RANGER',        'UNITTYPE_MELEE'),
    ('UNIT_SPEC_OPS',      'UNITTYPE_MELEE');

insert or replace into UnitAIInfos (UnitType, AiType) select 'UNIT_GUARDS', 'UNITTYPE_ANTI_CAVALRY'
    where exists (select UnitType from Units where UnitType = 'UNIT_GUARDS');
insert or replace into UnitAIInfos (UnitType, AiType) select 'UNIT_ANTI_TANK_GUN', 'UNITTYPE_ANTI_CAVALRY'
    where exists (select UnitType from Units where UnitType = 'UNIT_ANTI_TANK_GUN');
insert or replace into UnitAIInfos (UnitType, AiType) select 'UNIT_ANTI_TANK_GUN', 'UNITTYPE_MELEE'
    where exists (select UnitType from Units where UnitType = 'UNIT_ANTI_TANK_GUN');

insert or replace into UnitAIInfos (UnitType, AiType) select 'UNIT_ARQUEBUSIER', 'UNITTYPE_MELEE'
    where exists (select UnitType from Units where UnitType = 'UNIT_ARQUEBUSIER');
insert or replace into UnitAIInfos (UnitType, AiType) select 'UNIT_ARQUEBUSIER', 'UNITAI_EXPLORE'
    where exists (select UnitType from Units where UnitType = 'UNIT_ARQUEBUSIER');
insert or replace into UnitAIInfos (UnitType, AiType) select 'UNIT_MACHINE_GUN', 'UNITTYPE_MELEE'
    where exists (select UnitType from Units where UnitType = 'UNIT_ARQUEBUSIER');
insert or replace into UnitAIInfos (UnitType, AiType) select 'UNIT_MACHINE_GUN', 'UNITAI_EXPLORE'
    where exists (select UnitType from Units where UnitType = 'UNIT_ARQUEBUSIER');

insert or replace into UnitAIInfos (UnitType, AiType) select 'UNIT_ATTACK_SUBMARINE', 'UNITTYPE_RANGED'
    where exists (select UnitType from Units where UnitType = 'UNIT_ATTACK_SUBMARINE');
--------------------------------------------------------------------------------
-- TypeTags
-- Errors by WE
delete from TypeTags where Type = 'UNIT_ARMORED_INFANTRY' and tag = 'CLASS_MELEE';
delete from TypeTags where Type = 'UNIT_MOUNTED_RIFLES' and tag = 'CLASS_MELEE';
delete from TypeTags where Type = 'UNIT_ANTI_TANK_GUN' and tag = 'CLASS_RANGED';
-- ??? by WE
delete from TypeTags where Type = 'UNIT_PIKE_AND_SHOT' and tag = 'CLASS_PIKE';
delete from TypeTags where Type = 'UNIT_MUSKETMAN' and tag = 'CLASS_SHOT';

-- Modifications
delete from TypeTags where Tag = 'CLASS_AUTOMATIC_GUN';
delete from TypeTags where Type = 'UNIT_HELICOPTER' and (Tag ='CLASS_ANTI_CAVALRY' or Tag ='CLASS_RANGED');
delete from TypeTags where Type = 'UNIT_MISSILE_CRUISER' and tag = 'CLASS_NAVAL_BOMBARD';
delete from TypeTags where Type = 'UNIT_MISSILE_DESTROYER' and tag = 'CLASS_NAVAL_RANGED';
delete from TypeTags where Type = 'UNIT_ATTACK_SUBMARINE' and tag = 'CLASS_NAVAL_MELEE';
delete from TypeTags where Type = 'UNIT_ATTACK_SUBMARINE' and tag = 'CLASS_ATTACK_SUBMARINE';
-- UNIT_MECHANIZED_INFANTRY
delete from TypeTags where Type = 'UNIT_MECHANIZED_INFANTRY' and Tag ='CLASS_MELEE'
    and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');

insert or ignore into TypeTags
    (Type,                      Tag)
values
    ('UNIT_SLINGER',            'CLASS_RANGED'),
    ('UNIT_AT_CREW',            'CLASS_ANTI_CAVALRY'),
    ('UNIT_MODERN_AT',          'CLASS_ANTI_CAVALRY'),
    ('UNIT_MISSILE_CRUISER',    'CLASS_NAVAL_RANGED');

-- UNIT_ARQUEBUSIER
insert or replace into TypeTags (Type, Tag) select 'UNIT_ARQUEBUSIER', 'CLASS_RECON'
    where exists (select UnitType from Units where UnitType = 'UNIT_ARQUEBUSIER');
-- UNIT_MACHINE_GUN
insert or replace into TypeTags (Type, Tag) select 'UNIT_MACHINE_GUN', 'CLASS_RECON'
    where exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
-- UNIT_HELICOPTER
insert or replace into TypeTags (Type, Tag) select 'UNIT_HELICOPTER', 'CLASS_RECON'
    where exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
-- UNIT_MISSILE_DESTROYER
insert or replace into TypeTags (Type, Tag) select 'UNIT_MISSILE_DESTROYER', 'CLASS_NAVAL_MELEE'
    where exists (select UnitType from Units where UnitType = 'UNIT_MISSILE_DESTROYER');
-- UNIT_ATTACK_SUBMARINE
insert or replace into TypeTags (Type, Tag) select 'UNIT_ATTACK_SUBMARINE', 'CLASS_NAVAL_RANGED'
    where exists (select UnitType from Units where UnitType = 'UNIT_ATTACK_SUBMARINE');
insert or replace into TypeTags (Type, Tag) select 'UNIT_ATTACK_SUBMARINE', 'CLASS_NAVAL_RAIDER'
    where exists (select UnitType from Units where UnitType = 'UNIT_ATTACK_SUBMARINE');

-- Upgrade
delete from UnitUpgrades where UpgradeUnit = 'UNIT_CORVETTE' or Unit = 'UNIT_CORVETTE';
insert or ignore into UnitUpgrades (Unit, UpgradeUnit) values ('UNIT_CARAVEL', 'UNIT_IRONCLAD');

update UnitUpgrades set UpgradeUnit = 'UNIT_ARCHER' where Unit = 'UNIT_SLINGER';
update UnitUpgrades set UpgradeUnit = 'UNIT_ANTI_TANK_GUN' where Unit = 'UNIT_AT_CREW' and exists (select UnitType from Units where UnitType = 'UNIT_ANTI_TANK_GUN');

update UnitUpgrades set UpgradeUnit = 'UNIT_MISSILE_CRUISER' where UpgradeUnit = 'UNIT_MISSILE_DESTROYER';
update UnitUpgrades set UpgradeUnit = 'UNIT_MISSILE_DESTROYER' where UpgradeUnit = 'UNIT_MISSILE_FRIGATE';

update UnitUpgrades set UpgradeUnit = 'UNIT_AT_CREW' where UpgradeUnit = 'UNIT_ANTI_TANK_RIFLE';
update UnitUpgrades set UpgradeUnit = 'UNIT_MODERN_AT' where UpgradeUnit = 'UNIT_HELICOPTER' and exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');

update UnitUpgrades set UpgradeUnit = 'UNIT_ARQUEBUSIER' where UpgradeUnit = 'UNIT_RANGER' and exists (select UnitType from Units where UnitType = 'UNIT_ARQUEBUSIER');
insert or replace into UnitUpgrades (Unit, UpgradeUnit) select 'UNIT_ARQUEBUSIER', 'UNIT_RANGER' where exists (select UnitType from Units where UnitType = 'UNIT_ARQUEBUSIER');
update UnitUpgrades set UpgradeUnit = 'UNIT_MACHINE_GUN' where UpgradeUnit = 'UNIT_SPEC_OPS' and exists (select UnitType from Units where UnitType = 'UNIT_MACHINE_GUN');
insert or replace into UnitUpgrades (Unit, UpgradeUnit) select 'UNIT_MACHINE_GUN', 'UNIT_HELICOPTER' where exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
insert or replace into UnitUpgrades (Unit, UpgradeUnit) select 'UNIT_HELICOPTER', 'UNIT_SPEC_OPS' where exists (select UnitType from Units where UnitType = 'UNIT_MODERN_INFANTRY');
update UnitUpgrades set UpgradeUnit = 'UNIT_ATTACK_SUBMARINE' where UpgradeUnit = 'UNIT_NUCLEAR_SUBMARINE' and exists (select UnitType from Units where UnitType = 'UNIT_ATTACK_SUBMARINE');
insert or replace into UnitUpgrades (Unit, UpgradeUnit) select 'UNIT_ATTACK_SUBMARINE', 'UNIT_NUCLEAR_SUBMARINE' where exists (select UnitType from Units where UnitType = 'UNIT_ATTACK_SUBMARINE');

-- Deletes
delete from Types where Type = 'UNIT_CORVETTE';
delete from Types where Type = 'UNIT_ANTI_TANK_RIFLE';
delete from Types where Type = 'UNIT_MISSILE_FRIGATE';
delete from Types where Type in (select UnitType from Units where PromotionClass = 'PROMOTION_CLASS_AUTOMATIC_GUN');
delete from Types where Type = 'PROMOTION_CLASS_AUTOMATIC_GUN' or Type = 'ABILITY_AUTOMATIC_GUN';
delete from TypeTags where Tag = 'CLASS_AUTOMATIC_GUN';

delete from Types where Type in (select UnitType from Units where PromotionClass = 'PROMOTION_CLASS_MARINE');
delete from Types where Type = 'PROMOTION_CLASS_MARINE' or Type = 'ABILITY_MARINE';
delete from TypeTags where Tag = 'CLASS_MARINE';

delete from Types where Type in (select UnitType from Units where PromotionClass = 'PROMOTION_CLASS_NAVAL_BOMBARD');
delete from Types where Type = 'PROMOTION_CLASS_NAVAL_BOMBARD' or Type = 'ABILITY_NAVAL_BOMBARD';
delete from TypeTags where Tag = 'CLASS_NAVAL_BOMBARD';

delete from PolicyModifiers where ModifierId like '%_FIRE_SUPPORT_PRODUCTION';
-- Revert WE: warships
delete from PolicyModifiers where ModifierId like '%_NAVAL_BOMBARD_PRODUCTION';
delete from PolicyModifiers where ModifierId like '%_MARINE_PRODUCTION';
delete from BuildingModifiers where ModifierId = 'VENETIAN_ARSENAL_EXTRANAVALBOMBARD' or ModifierId = 'VENETIAN_ARSENAL_EXTRAMARINE';
delete from TraitModifiers where ModifierId = 'TRAIT_NAVAL_BOMBARD_FAITH';

update ModifierArguments set Value = 'UNIT_BATTLESHIP'
where ModifierId = 'GREATPERSON_FRANZ_VON_HIPPER_ACTIVE' and Name = 'UnitType';

--------------------------------------------------------------------------------
-- Deal with MandatoryObsoleteTech
update Units set MandatoryObsoleteTech = NULL;
-- Offical Units
update Units set MandatoryObsoleteTech = 'TECH_GUNPOWDER' where UnitType = 'UNIT_WARRIOR';
update Units set MandatoryObsoleteTech = 'TECH_MACHINERY' where UnitType = 'UNIT_SLINGER';
update Units set MandatoryObsoleteTech = 'TECH_STIRRUPS' where UnitType = 'UNIT_SUMERIAN_WAR_CART';
update Units set MandatoryObsoleteTech = 'TECH_STEAM_POWER' where UnitType = 'UNIT_GALLEY';
update Units set MandatoryObsoleteTech = 'TECH_ELECTRICITY' where UnitType = 'UNIT_NORWEGIAN_LONGSHIP';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_ARCHER';
update Units set MandatoryObsoleteTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_SPEARMAN';
update Units set MandatoryObsoleteTech = 'TECH_COMBUSTION' where UnitType = 'UNIT_HEAVY_CHARIOT';
update Units set MandatoryObsoleteTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_GREEK_HOPLITE';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_SWORDSMAN';
update Units set MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_HORSEMAN';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_ROMAN_LEGION';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_KONGO_SHIELD_BEARER';
update Units set MandatoryObsoleteTech = 'TECH_STEEL' where UnitType = 'UNIT_CATAPULT';
update Units set MandatoryObsoleteTech = 'TECH_STEEL' where UnitType = 'UNIT_QUADRIREME';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_EGYPTIAN_CHARIOT_ARCHER';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_JAPANESE_SAMURAI';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_NORWEGIAN_BERSERKER';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_KNIGHT';
update Units set MandatoryObsoleteTech = 'TECH_COMBUSTION' where UnitType = 'UNIT_INDIAN_VARU';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_ARABIAN_MAMLUK';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_CROSSBOWMAN';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_CHINESE_CROUCHING_TIGER';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_PIKEMAN';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_MUSKETMAN';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_SPANISH_CONQUISTADOR';
update Units set MandatoryObsoleteTech = 'TECH_COMBINED_ARMS' where UnitType = 'UNIT_CARAVEL';
update Units set MandatoryObsoleteTech = 'TECH_GUIDANCE_SYSTEMS' where UnitType = 'UNIT_BOMBARD';
update Units set MandatoryObsoleteTech = 'TECH_LASERS' where UnitType = 'UNIT_FRIGATE';
update Units set MandatoryObsoleteTech = 'TECH_LASERS' where UnitType = 'UNIT_PRIVATEER';
update Units set MandatoryObsoleteTech = 'TECH_TELECOMMUNICATIONS' where UnitType = 'UNIT_ENGLISH_SEADOG';
update Units set MandatoryObsoleteTech = 'TECH_TELECOMMUNICATIONS' where UnitType = 'UNIT_FIELD_CANNON';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_MAN_AT_ARMS';
update Units set MandatoryObsoleteTech = 'TECH_SATELLITES' where UnitType = 'UNIT_LINE_INFANTRY';
update Units set MandatoryObsoleteTech = 'TECH_STEEL' where UnitType = 'UNIT_TREBUCHET';
update Units set MandatoryObsoleteTech = 'TECH_GUNPOWDER' where UnitType = 'UNIT_AZTEC_EAGLE_WARRIOR';
update Units set MandatoryObsoleteTech = 'TECH_LASERS' where UnitType = 'UNIT_INDONESIAN_JONG';
update Units set MandatoryObsoleteTech = 'TECH_GUIDANCE_SYSTEMS' where UnitType = 'UNIT_KHMER_DOMREY';
update Units set MandatoryObsoleteTech = 'TECH_COMBUSTION' where UnitType = 'UNIT_POLISH_HUSSAR';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_NUBIAN_PITATI';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_MACEDONIAN_HYPASPIST';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_MACEDONIAN_HETAIROI';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_PERSIAN_IMMORTAL';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_ZULU_IMPI';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_KOREAN_HWACHA';
update Units set MandatoryObsoleteTech = 'TECH_LASERS' where UnitType = 'UNIT_DE_ZEVEN_PROVINCIEN';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_MONGOLIAN_KESHIG';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_GEORGIAN_KHEVSURETI';
update Units set MandatoryObsoleteTech = 'TECH_COMBINED_ARMS' where UnitType = 'UNIT_PIKE_AND_SHOT';
update Units set MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_COURSER';
update Units set MandatoryObsoleteTech = 'TECH_COMBUSTION' where UnitType = 'UNIT_CUIRASSIER';
update Units set MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_HUNGARY_BLACK_ARMY';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_MALI_MANDEKALU_CAVALRY';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_MAORI_TOA';
update Units set MandatoryObsoleteTech = 'TECH_LASERS' where UnitType = 'UNIT_OTTOMAN_BARBARY_CORSAIR';
update Units set MandatoryObsoleteTech = 'TECH_STEAM_POWER' where UnitType = 'UNIT_PHOENICIA_BIREME';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_SULEIMAN_JANISSARY';
update Units set MandatoryObsoleteTech = 'TECH_COMBINED_ARMS' where UnitType = 'UNIT_SWEDEN_CAROLEAN';
update Units set MandatoryObsoleteTech = 'TECH_COMBUSTION' where UnitType = 'UNIT_AMERICAN_ROUGH_RIDER';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_MAYAN_HULCHE';
update Units set MandatoryObsoleteTech = 'TECH_STEEL' where UnitType = 'UNIT_BYZANTINE_DROMON';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_BYZANTINE_TAGMA';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_GAUL_GAESATAE';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN';
update Units set MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_ETHIOPIAN_OROMO_CAVALRY';
update Units set MandatoryObsoleteTech = 'TECH_GUNPOWDER' where UnitType = 'UNIT_BABYLONIAN_SABUM_KIBITTUM';
update Units set MandatoryObsoleteTech = 'TECH_COMBINED_ARMS' where UnitType = 'UNIT_PORTUGUESE_NAU';
-- STUU
update Units set MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_ROMAN_EQUITE';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_RUSSIAN_DRUZHINA';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_GREEK_PELTAST';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_FRENCH_GENDARME';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_SCYTHIAN_AMAZON';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_JAPANESE_SOHEI';
update Units set MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_ENGLISH_LONGBOWMAN';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_ARABIAN_CAMEL_ARCHER';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_SUMERIAN_PHALANX';
update Units set MandatoryObsoleteTech = 'TECH_SATELLITES' where UnitType = 'UNIT_INDIAN_SEPOY';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_EGYPTIAN_KHOPESH';
update Units set MandatoryObsoleteTech = 'TECH_ROCKETRY' where UnitType = 'UNIT_SPANISH_TERCIO';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_GERMAN_LANDSKNECHT';
update Units set MandatoryObsoleteTech = 'TECH_GUNPOWDER' where UnitType = 'UNIT_NORWEGIAN_ULFHEDNAR';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_AZTEC_JAGUAR';
update Units set MandatoryObsoleteTech = 'TECH_STEEL' where UnitType = 'UNIT_MACEDONIAN_BALLISTA';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_PERSIAN_CATAPHRACT';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_NUBIAN_AFRICAN_FOREST_ELEPHANT';
update Units set MandatoryObsoleteTech = 'TECH_STEAM_POWER' where UnitType = 'UNIT_KHMER_WAR_CANOE';
update Units set MandatoryObsoleteTech = 'TECH_COMBINED_ARMS' where UnitType = 'UNIT_KOREAN_TURTLE_SHIP';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_DUTCH_SCHUTTERIJ';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_GEORGIAN_TADZREULI';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_MAPUCHE_GUERILLA';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_SCOTTISH_GALLOWGLASS';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_MONGOLIAN_HUI_HUI_PAO';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_ZULU_ASSEGAI';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_HUNGARY_KALANDOZO';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_MALI_SOFA';
update Units set MandatoryObsoleteTech = 'TECH_COMPOSITES' where UnitType = 'UNIT_OTTOMAN_SIPAHI';
update Units set MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_PHOENICIA_NUMIDIAN_CAVALRY';
update Units set MandatoryObsoleteTech = 'TECH_LASERS' where UnitType = 'UNIT_ENGLISH_SHIP_OF_THE_LINE';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_ELEANOR_TEMPLAR';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_MAYAN_HOLKAN';
update Units set MandatoryObsoleteTech = 'TECH_SATELLITES' where UnitType = 'UNIT_COLOMBIAN_BRITISH_LEGION';
update Units set MandatoryObsoleteTech = 'TECH_COMBUSTION' where UnitType = 'UNIT_GAUL_CARRUS';
update Units set MandatoryObsoleteTech = 'TECH_SATELLITES' where UnitType = 'UNIT_ETHIOPIAN_MEHAL_SEFARI';
update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_BYZANTINE_VARANGIAN_GUARD';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_BABYLONIAN_BOWMAN';
-- WE: TODO
update Units set MandatoryObsoleteTech = 'TECH_SATELLITES' where UnitType = 'UNIT_ARMORED_INFANTRY';
update Units set MandatoryObsoleteTech = 'TECH_MACHINERY' where UnitType = 'UNIT_COMPOSITE_BOWMAN';
update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_CULVERIN';
update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_BALLISTICS' where UnitType = 'UNIT_FIELD_GUN';
update Units set MandatoryObsoleteTech = 'TECH_MILITARY_TACTICS' where UnitType = 'UNIT_HEAVY_INFANTRY';
update Units set MandatoryObsoleteTech = 'TECH_STIRRUPS' where UnitType = 'UNIT_ARMORED_HORSEMAN';
update Units set MandatoryObsoleteTech = 'TECH_RIFLING' where UnitType = 'UNIT_REITER';
update Units set MandatoryObsoleteTech = 'TECH_COMBINED_ARMS' where UnitType = 'UNIT_LANDSHIP';
update Units set MandatoryObsoleteTech = 'TECH_STEEL' where UnitType = 'UNIT_RIFLED_CANNON';
update Units set MandatoryObsoleteTech = 'TECH_GUIDANCE_SYSTEMS' where UnitType = 'UNIT_HEAVY_HOWITZER';
update Units set MandatoryObsoleteTech = 'TECH_CHEMISTRY' where UnitType = 'UNIT_GUARDS'; -- TECH_REPLACEABLE_PARTS
update Units set MandatoryObsoleteTech = 'TECH_PLASTICS' where UnitType = 'UNIT_WW1_INFANTRY';
update Units set MandatoryObsoleteTech = 'TECH_TELECOMMUNICATIONS' where UnitType = 'UNIT_FIELD_HOWITZER';
update Units set MandatoryObsoleteTech = 'TECH_MILITARY_SCIENCE' where UnitType = 'UNIT_STRADIOT';
-- update Units set MandatoryObsoleteTech = 'TECH_ROCKETRY' where UnitType = 'UNIT_ANTI_TANK_RIFLE';
-- update Units set MandatoryObsoleteTech = 'TECH_STEALTH_TECHNOLOGY' where UnitType = 'UNIT_ANTI_TANK_GUN';
update Units set MandatoryObsoleteTech = 'TECH_COMBINED_ARMS' where UnitType = 'UNIT_MOUNTED_RIFLES';
-- update Units set MandatoryObsoleteTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_ARQUEBUSIER';
-- update Units set MandatoryObsoleteTech = 'TECH_GUNPOWDER' where UnitType = 'UNIT_AXE_THROWER';
-- update Units set MandatoryObsoleteTech = 'TECH_MILITARY_TACTICS' where UnitType = 'UNIT_PELTAST';
-- update Units set MandatoryObsoleteTech = 'TECH_REPLACEABLE_PARTS' where UnitType = 'UNIT_GATLING_GUN';
update Units set MandatoryObsoleteTech = 'TECH_NANOTECHNOLOGY' where UnitType = 'UNIT_RECON_HELICOPTER';
-- update Units set MandatoryObsoleteTech = 'TECH_STEAM_POWER' where UnitType = 'UNIT_CORVETTE';
update Units set MandatoryObsoleteTech = 'TECH_SQUARE_RIGGING' where UnitType = 'UNIT_GALLEASS';
update Units set MandatoryObsoleteTech = 'TECH_CHEMISTRY' where UnitType = 'UNIT_ARMORED_CRUISER';
update Units set MandatoryObsoleteTech = 'TECH_ROBOTICS' where UnitType = 'UNIT_BATTLECRUISER';
-- update Units set MandatoryObsoleteTech = 'TECH_ASTRONOMY' where UnitType = 'UNIT_CARRACK';
-- update Units set MandatoryObsoleteTech = 'TECH_STEAM_POWER' where UnitType = 'UNIT_SHIP_OF_THE_LINE';
-- update Units set MandatoryObsoleteTech = 'TECH_CHEMISTRY' where UnitType = 'UNIT_PRE_DREADNOUGHT';
-- update Units set MandatoryObsoleteTech = 'TECH_PLASTICS' where UnitType = 'UNIT_INDUSTRIAL_MARINE';
-- update Units set MandatoryObsoleteTech = 'TECH_SATELLITES' where UnitType = 'UNIT_WW2_MARINE';
-- update Units set MandatoryObsoleteTech = 'TECH_EDUCATION' where UnitType = 'UNIT_GREEK_FIRE_SHIP';
update Units set MandatoryObsoleteTech = 'TECH_COMPUTERS' where UnitType = 'UNIT_TORPEDO_GUNBOAT';
update Units set MandatoryObsoleteTech = 'TECH_NUCLEAR_FISSION' where UnitType = 'UNIT_LIGHT_CRUISER';
-- update Units set MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_DREADNOUGHT';
update Units set MandatoryObsoleteTech = 'TECH_SYNTHETIC_MATERIALS' where UnitType = 'UNIT_RAIDER';
update Units set MandatoryObsoleteTech = 'TECH_CARTOGRAPHY' where UnitType = 'UNIT_COG';
-- update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_FLIGHT' where UnitType = 'UNIT_WW1_BOMBER';
-- update Units set MandatoryObsoleteTech = 'TECH_ADVANCED_FLIGHT' where UnitType = 'UNIT_WW1_GROUND_ATTACK';
-- update Units set MandatoryObsoleteTech = 'TECH_LASERS' where UnitType = 'UNIT_GROUND_ATTACK';
