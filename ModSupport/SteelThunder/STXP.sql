-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

-- To Fix for Apr update.
insert or replace into UnitReplaces (CivUniqueUnitType, ReplacesUnitType) values ('UNIT_JAPANESE_SAMURAI', 'UNIT_MAN_AT_ARMS');
insert or replace into UnitReplaces (CivUniqueUnitType, ReplacesUnitType) values ('UNIT_ENGLISH_REDCOAT', 'UNIT_LINE_INFANTRY');
insert or replace into UnitReplaces (CivUniqueUnitType, ReplacesUnitType) values ('UNIT_FRENCH_GARDE_IMPERIALE', 'UNIT_LINE_INFANTRY');
-- UPDATE Units SET Combat = 41 WHERE UnitType = 'UNIT_ROMAN_LEGION';

/* Revert Unit Upgrade Changes */
update UnitUpgrades set UpgradeUnit = 'UNIT_TREBUCHET' where UpgradeUnit = 'UNIT_DLV_TREBUCHET';
update UnitUpgrades set UpgradeUnit = 'UNIT_LINE_INFANTRY' where UpgradeUnit = 'UNIT_DLV_RIFLEMAN';
update UnitUpgrades set UpgradeUnit = 'UNIT_MAN_AT_ARMS' where UpgradeUnit = 'UNIT_DLV_LONGSWORDSMAN';

delete from UnitReplaces where ReplacesUnitType = 'UNIT_DLV_TREBUCHET';
delete from UnitReplaces where ReplacesUnitType = 'UNIT_DLV_LONGSWORDSMAN';
delete from UnitReplaces where ReplacesUnitType = 'UNIT_DLV_RIFLEMAN';

delete from Types where Type = 'UNIT_DLV_RIFLEMAN';
delete from Types where Type = 'UNIT_DLV_TREBUCHET';
delete from Types where Type = 'UNIT_DLV_LONGSWORDSMAN';

-- Adaptation
delete from UnitReplaces where CivUniqueUnitType = 'UNIT_SUMERIAN_WAR_CART';
UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_DLV_COG' WHERE Unit = 'UNIT_PHOENICIA_BIREME';

delete from Types where Type = 'ABILITY_CITY_CENTER_NERF';
delete from Types where Type = 'ABILITY_PLUS_X_WHEN_DEFENDING';
delete from Types where Type = 'ABILITY_AUTOMATIC_GUNFIRE';
delete from Types where Type = 'ABILITY_PRE_GUNPOWDER_MELEE_ATTACK';

delete from UnitAbilityModifiers where UnitAbilityType = 'ABILITY_ANTI_CAVALRY' and ModifierId = 'PLUS_20_VS_HEAVY_CAVALRY_COMBAT_BONUS';
delete from UnitAbilityModifiers where UnitAbilityType = 'ABILITY_ANTI_CAVALRY' and ModifierId = 'PLUS_15_VS_LIGHT_CAVALRY_COMBAT_BONUS';
insert or ignore into UnitAbilityModifiers (UnitAbilityType, ModifierId) values ('ABILITY_ANTI_CAVALRY', 'ANTI_CAVALRY_COMBAT_BONUS');

update Units set PrereqTech = 'TECH_BUTTRESS' where UnitType = 'UNIT_DLV_COG';
update Units set PrereqTech = 'TECH_EDUCATION' where UnitType = 'UNIT_DLV_GALLEASS';
UPDATE ModifierArguments SET Value = 10 WHERE ModifierId = 'CONQUISTADOR_SPECIFIC_UNIT_COMBAT' AND Name = 'Amount';
