-- ----------------------------------------------
-- # Steel & Thunder Unique Units Compatibility #
-- ----------------------------------------------
-- Assume Military Testing Mode is Enabled.

-- General Fix
delete from UnitUpgrades where Unit = 'UNIT_BRAZILIAN_BANDEIRANTE';

insert or replace into UnitReplaces
    (CivUniqueUnitType,                     ReplacesUnitType)
values
    ('UNIT_ARABIAN_GHAZI',                  'UNIT_MAN_AT_ARMS'),
    ('UNIT_SCOTTISH_GALLOWGLASS',           'UNIT_MAN_AT_ARMS'),
    ('UNIT_ELEANOR_TEMPLAR',                'UNIT_MAN_AT_ARMS'),
    ('UNIT_MAYAN_HOLKAN',                   'UNIT_MAN_AT_ARMS'),
    ('UNIT_BYZANTINE_VARANGIAN_GUARD',      'UNIT_MAN_AT_ARMS'),

    ('UNIT_BRAZILIAN_FATHERLAND_VOLUNTEER', 'UNIT_LINE_INFANTRY'),
    ('UNIT_INDIAN_SEPOY',                   'UNIT_LINE_INFANTRY'),
    ('UNIT_COLOMBIAN_BRITISH_LEGION',       'UNIT_LINE_INFANTRY'),
    ('UNIT_ETHIOPIAN_MEHAL_SEFARI',         'UNIT_LINE_INFANTRY'),
    ('UNIT_MONGOLIAN_HUI_HUI_PAO',          'UNIT_TREBUCHET');

update UnitUpgrades set UpgradeUnit = 'UNIT_MAN_AT_ARMS' where Unit = 'UNIT_EGYPTIAN_KHOPESH' or Unit = 'UNIT_AZTEC_JAGUAR';
update UnitUpgrades set UpgradeUnit = 'UNIT_LINE_INFANTRY' where Unit = 'UNIT_POLISH_CHOSEN_INFANTRY' or Unit = 'UNIT_AMERICAN_MINUTEMAN';
update UnitUpgrades set UpgradeUnit = 'UNIT_TREBUCHET' where Unit = 'UNIT_ROMAN_ONAGER' or Unit = 'UNIT_MACEDONIAN_BALLISTA';

update UnitUpgrades set UpgradeUnit = 'UNIT_DLV_COG'
where Unit = 'UNIT_KHMER_WAR_CANOE' and exists (select 1 from Units where UnitType = 'UNIT_DLV_COG');

update UnitUpgrades set UpgradeUnit = 'UNIT_CUIRASSIER' where
    Unit = 'UNIT_SCYTHIAN_AMAZON' or Unit = 'UNIT_FRENCH_GENDARME' or Unit = 'UNIT_INDIAN_MUGHAL_SOWAR' or Unit = 'UNIT_GEORGIAN_TADZREULI' or Unit = 'UNIT_OTTOMAN_SIPAHI';

update UnitUpgrades set UpgradeUnit = 'UNIT_COURSER' where Unit = 'UNIT_PHOENICIA_NUMIDIAN_CAVALRY';

-- ----------------------------------------------
-- HD modifications
-- ----------------------------------------------
