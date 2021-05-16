-------------------------------------
--      All Testing Adjustments    --
-------------------------------------

-- TODO: 单位过期科技

-- Costs
update Units set Cost = 20 where UnitType = 'UNIT_SCOUT';
update Units set Cost = 25 where UnitType = 'UNIT_SLINGER';
update Units set Cost = 30 where UnitType = 'UNIT_WARRIOR';
update Units set Cost = 110 where UnitType = 'UNIT_MILITARY_ENGINEER';

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
update Units set Cost = 90, Maintenance = 3, BaseMoves = 3, Range = 1, Combat = 40, RangedCombat = 30, StrategicResource = NULL where UnitType = 'UNIT_SKIRMISHER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SKIRMISHER';
update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 1, Combat = 50, RangedCombat = 40, StrategicResource = NULL where UnitType = 'UNIT_ARQUEBUSIER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ARQUEBUSIER';
update Units set Cost = 210, Maintenance = 5, BaseMoves = 3, Range = 1, Combat = 60, RangedCombat = 50, StrategicResource = NULL where UnitType = 'UNIT_RANGER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_RANGER';
-- Special Cases: UNIT_MACHINE_GUN
update Units set Cost = 40, Maintenance = 1, BaseMoves = 2, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_BATTERING_RAM';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_BATTERING_RAM';
update Units set Cost = 75, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 0, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_SIEGE_TOWER';
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
update Units set Cost = 55, Maintenance = 1, BaseMoves = 3, Range = 0, Combat = 30, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_GALLEY';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GALLEY';
update Units set Cost = 110, Maintenance = 3, BaseMoves = 3, Range = 0, Combat = 45, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_COG';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_COG';
update Units set Cost = 140, Maintenance = 4, BaseMoves = 4, Range = 0, Combat = 50, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_CARAVEL';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CARAVEL';
update Units set Cost = 200, Maintenance = 4, BaseMoves = 4, Range = 0, Combat = 60, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_CORVETTE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_CORVETTE';
update Units set Cost = 300, Maintenance = 5, BaseMoves = 5, Range = 0, Combat = 70, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_IRONCLAD';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_IRONCLAD';
update Units set Cost = 450, Maintenance = 6, BaseMoves = 5, Range = 0, Combat = 80, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_TORPEDO_GUNBOAT';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_TORPEDO_GUNBOAT';
update Units set Cost = 670, Maintenance = 7, BaseMoves = 5, Range = 0, Combat = 90, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_DESTROYER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_DESTROYER';
update Units set Cost = 1000, Maintenance = 8, BaseMoves = 5, Range = 0, Combat = 100, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_MISSILE_DESTROYER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_MISSILE_DESTROYER';
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
update Units set Cost = 200, Maintenance = 4, BaseMoves = 4, Range = 2, Combat = 40, RangedCombat = 50, StrategicResource = NULL where UnitType = 'UNIT_PRIVATEER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_PRIVATEER';
update Units set Cost = 300, Maintenance = 5, BaseMoves = 4, Range = 2, Combat = 55, RangedCombat = 65, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_RAIDER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_RAIDER';
update Units set Cost = 450, Maintenance = 6, BaseMoves = 5, Range = 2, Combat = 65, RangedCombat = 75, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_SUBMARINE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_COAL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SUBMARINE';
update Units set Cost = 600, Maintenance = 7, BaseMoves = 5, Range = 2, Combat = 75, RangedCombat = 85, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_ATTACK_SUBMARINE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ATTACK_SUBMARINE';
update Units set Cost = 900, Maintenance = 8, BaseMoves = 5, Range = 2, Combat = 85, RangedCombat = 95, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_NUCLEAR_SUBMARINE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_URANIUM', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_NUCLEAR_SUBMARINE';
update Units set Cost = 750, Maintenance = 7, BaseMoves = 4, Range = 0, Combat = 70, RangedCombat = 0, StrategicResource = 'RESOURCE_OIL' where UnitType = 'UNIT_AIRCRAFT_CARRIER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_AIRCRAFT_CARRIER';
update Units set Cost = 1200, Maintenance = 8, BaseMoves = 5, Range = 0, Combat = 80, RangedCombat = 0, StrategicResource = 'RESOURCE_URANIUM' where UnitType = 'UNIT_SUPERCARRIER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_URANIUM', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SUPERCARRIER';
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
insert or replace into UnitAIInfos (UnitType, AiType) select 'UNIT_MACHINE_GUN', 'UNITTYPE_MELEE'
    where exists (select UnitType from Units where UnitType = 'UNIT_ARQUEBUSIER');

--------------------------------------------------------------------------------
-- TypeTags
delete from TypeTags where Tag = 'CLASS_AUTOMATIC_GUN';
delete from TypeTags where Type = 'UNIT_HELICOPTER' and Tag ='CLASS_ANTI_CAVALRY' or Tag ='CLASS_RANGED';
delete from TypeTags where Type = 'UNIT_MISSILE_CRUISER' and tag = 'CLASS_NAVAL_BOMBARD';
delete from TypeTags where Type = 'UNIT_MISSILE_DESTROYER' and tag = 'CLASS_NAVAL_RANGED';
-- UNIT_MECHANIZED_INFANTRY
delete from TypeTags where Type = 'UNIT_MECHANIZED_INFANTRY' and Tag ='CLASS_LIGHT_CAVALRY';
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

-- Upgrade
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

delete from Units where UnitType = 'UNIT_ANTI_TANK_RIFLE';
delete from Units where UnitType = 'UNIT_MISSILE_FRIGATE';
delete from Units where PromotionClass = 'PROMOTION_CLASS_AUTOMATIC_GUN';
delete from Units where PromotionClass = 'PROMOTION_CLASS_MARINE';
delete from Units where PromotionClass = 'PROMOTION_CLASS_NAVAL_BOMBARD';

-- UU
update UnitUpgrades set UpgradeUnit = 'UNIT_CROSSBOWMAN' where Unit = 'UNIT_MAYAN_HULCHE';

-- Deal with MandatoryObsoleteTech
