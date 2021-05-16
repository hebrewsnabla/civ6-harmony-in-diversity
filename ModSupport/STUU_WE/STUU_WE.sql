-- ----------------------------------------------
-- # Steel & Thunder Unique Units Compatibility #
-- ----------------------------------------------
-- Unit Replaces
-- INSERT OR REPLACE INTO UnitReplaces 
-- (       CivUniqueUnitType,                      ReplacesUnitType) 
-- SELECT  'UNIT_ARABIAN_GHAZI',                   'UNIT_MAN_AT_ARMS'
-- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ARABIAN_GHAZI');

-- -- INSERT OR REPLACE INTO UnitReplaces
-- -- (       CivUniqueUnitType,                      ReplacesUnitType)
-- -- SELECT  'UNIT_RUSSIAN_DRUZHINA',                'UNIT_MEDIEVAL_HORSEMAN'
-- -- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_MEDIEVAL_HORSEMAN')
-- -- AND   EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_RUSSIAN_DRUZHINA');

-- -- INSERT OR REPLACE INTO UnitReplaces
-- -- (       CivUniqueUnitType,                      ReplacesUnitType)
-- -- SELECT  'UNIT_SPANISH_JINETE',                  'UNIT_MEDIEVAL_HORSEMAN'
-- -- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_MEDIEVAL_HORSEMAN')
-- -- AND   EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SPANISH_JINETE');

-- INSERT OR REPLACE INTO UnitReplaces
-- (       CivUniqueUnitType,                      ReplacesUnitType)
-- SELECT  'UNIT_BRAZILIAN_FATHERLAND_VOLUNTEER',  'UNIT_LINE_INFANTRY'
-- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_BRAZILIAN_FATHERLAND_VOLUNTEER');

-- INSERT OR REPLACE INTO UnitReplaces
-- (       CivUniqueUnitType,                      ReplacesUnitType)
-- SELECT  'UNIT_GREEK_ARMATOLOS',                 'UNIT_LINE_INFANTRY'
-- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_GREEK_ARMATOLOS');

-- INSERT OR REPLACE INTO UnitReplaces
-- (       CivUniqueUnitType,                      ReplacesUnitType)
-- SELECT  'UNIT_INDIAN_SEPOY',                    'UNIT_LINE_INFANTRY'
-- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_INDIAN_SEPOY');

-- -- Civilization & Scenario Pack Compatibility
-- INSERT OR REPLACE INTO UnitReplaces
-- (       CivUniqueUnitType,                      ReplacesUnitType)
-- SELECT  'UNIT_PERSIAN_CATAPHRACT',              'UNIT_ARMORED_HORSEMAN'
-- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_PERSIAN_CATAPHRACT');

-- -- R&F Compatibility
-- INSERT OR REPLACE INTO UnitReplaces
-- (       CivUniqueUnitType,                      ReplacesUnitType)
-- SELECT  'UNIT_SCOTTISH_GALLOWGLASS',            'UNIT_MAN_AT_ARMS'
-- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SCOTTISH_GALLOWGLASS');

-- INSERT OR REPLACE INTO UnitReplaces
-- (       CivUniqueUnitType,                      ReplacesUnitType)
-- SELECT  'UNIT_MONGOLIAN_HUI_HUI_PAO',           'UNIT_TREBUCHET'
-- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_MONGOLIAN_HUI_HUI_PAO');

-- -- GS Compatibility
-- INSERT OR REPLACE INTO UnitReplaces
-- (       CivUniqueUnitType,                      ReplacesUnitType)
-- SELECT  'UNIT_ELEANOR_TEMPLAR',                 'UNIT_MAN_AT_ARMS'
-- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ELEANOR_TEMPLAR');


-- -- # Unit Upgrades #
-- -- GS Compatibility
-- INSERT OR REPLACE INTO UnitUpgrades
-- (       Unit,                                   UpgradeUnit)
-- SELECT  'UNIT_CANADA_HMCS_HAIDA',               'UNIT_MISSILE_DESTROYER'
-- WHERE EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_CANADA_HMCS_HAIDA');

-- -- Unit Upgrades Changes
-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_TREBUCHET'
-- WHERE Unit = 'UNIT_ROMAN_ONAGER' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ROMAN_ONAGER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_TREBUCHET'
-- WHERE Unit = 'UNIT_MACEDONIAN_BALLISTA' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_MACEDONIAN_BALLISTA');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_MAN_AT_ARMS'
-- WHERE Unit = 'UNIT_NORWEGIAN_HIRDMAN' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_NORWEGIAN_HIRDMAN');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_MAN_AT_ARMS'
-- WHERE Unit = 'UNIT_EGYPTIAN_KHOPESH' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_EGYPTIAN_KHOPESH');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_MAN_AT_ARMS'
-- WHERE Unit = 'UNIT_AZTEC_JAGUAR' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_AZTEC_JAGUAR');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LINE_INFANTRY'
-- WHERE Unit = 'UNIT_JANISSARY' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_JANISSARY');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LINE_INFANTRY'
-- WHERE Unit = 'UNIT_POLISH_CHOSEN_INFANTRY' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_POLISH_CHOSEN_INFANTRY');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LINE_INFANTRY'
-- WHERE Unit = 'UNIT_AMERICAN_MINUTEMAN' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_AMERICAN_MINUTEMAN');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LANDSHIP'
-- WHERE Unit = 'UNIT_ENGLISH_IRONSIDE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ENGLISH_IRONSIDE');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_WW2_MARINE'
-- WHERE Unit = 'UNIT_FRENCH_MARINE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_FRENCH_MARINE');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_WW1_INFANTRY'
-- WHERE Unit = 'UNIT_GREEK_ARMATOLOS' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_GREEK_ARMATOLOS');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_AXE_THROWER'
-- WHERE Unit = 'UNIT_GREEK_PELTAST' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_GREEK_PELTAST');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ARMORED_INFANTRY'
-- WHERE Unit = 'UNIT_POLISH_UHLAN' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_POLISH_UHLAN');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ARMORED_INFANTRY'
-- WHERE Unit = 'UNIT_CREE_OTEHTAPIW' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_CREE_OTEHTAPIW');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LINE_INFANTRY'
-- WHERE Unit = 'UNIT_SPANISH_TERCIO' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SPANISH_TERCIO');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_WW1_INFANTRY'
-- WHERE Unit = 'UNIT_DUTCH_SCHUTTERIJ' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_DUTCH_SCHUTTERIJ');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_PRE_DREADNOUGHT'
-- WHERE Unit = 'UNIT_ENGLISH_SHIP_OF_THE_LINE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ENGLISH_SHIP_OF_THE_LINE');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_AXE_THROWER'
-- WHERE Unit = 'UNIT_ZULU_ASSEGAI' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ZULU_ASSEGAI');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_COG'
-- WHERE Unit = 'UNIT_KHMER_WAR_CANOE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_KHMER_WAR_CANOE');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_RAIDER'
-- WHERE Unit = 'UNIT_ENGLISH_SEADOG' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ENGLISH_SEADOG');

-- -- GS Compatibility
-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_EXPLORER'
-- WHERE Unit = 'UNIT_SCYTHIAN_AMAZON_SCOUT' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SCYTHIAN_AMAZON_SCOUT') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_EXPLORER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_SKIRMISHER'         
-- WHERE Unit = 'UNIT_SCYTHIAN_AMAZON_SCOUT' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SCYTHIAN_AMAZON_SCOUT') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SKIRMISHER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_MEDIEVAL_HORSEMAN'
-- WHERE Unit = 'UNIT_ROMAN_EQUITE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ROMAN_EQUITE') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_MEDIEVAL_HORSEMAN');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_COURSER'
-- WHERE Unit = 'UNIT_ROMAN_EQUITE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ROMAN_EQUITE') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_COURSER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_DLV_CUIRASSIER'
-- WHERE Unit = 'UNIT_SCYTHIAN_AMAZON' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SCYTHIAN_AMAZON') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_DLV_CUIRASSIER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_DLV_CUIRASSIER'
-- WHERE Unit = 'UNIT_FRENCH_GENDARME' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_FRENCH_GENDARME') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_DLV_CUIRASSIER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_DLV_CUIRASSIER'
-- WHERE Unit = 'UNIT_INDIAN_MUGHAL_SOWAR' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_INDIAN_MUGHAL_SOWAR') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_DLV_CUIRASSIER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_DLV_CUIRASSIER'
-- WHERE Unit = 'UNIT_GEORGIAN_TADZREULI' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_GEORGIAN_TADZREULI') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_DLV_CUIRASSIER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CUIRASSIER'
-- WHERE Unit = 'UNIT_SCYTHIAN_AMAZON' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SCYTHIAN_AMAZON') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_CUIRASSIER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CUIRASSIER'
-- WHERE Unit = 'UNIT_FRENCH_GENDARME' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_FRENCH_GENDARME') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_CUIRASSIER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CUIRASSIER'
-- WHERE Unit = 'UNIT_INDIAN_MUGHAL_SOWAR' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_INDIAN_MUGHAL_SOWAR') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_CUIRASSIER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_CUIRASSIER'
-- WHERE Unit = 'UNIT_GEORGIAN_TADZREULI' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_GEORGIAN_TADZREULI') AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_CUIRASSIER');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LANDSHIP'
-- WHERE Unit = 'UNIT_OTTOMAN_SIPAHI' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_OTTOMAN_SIPAHI');

-- -- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_HARQUEBUSIER'
-- -- WHERE Unit = 'UNIT_PHOENICIA_NUMIDIAN_CAVALRY' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_PHOENICIA_NUMIDIAN_CAVALRY');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_LIGHT_CRUISER'
-- WHERE Unit = 'UNIT_SWEDEN_KRONAN' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SWEDEN_KRONAN');

-- UPDATE UnitUpgrades SET UpgradeUnit = 'UNIT_ARMORED_INFANTRY'
-- WHERE Unit = 'UNIT_SWEDEN_HAKKAPELIITTA' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_SWEDEN_HAKKAPELIITTA');


-- -- Unit Replaces
-- UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_INDUSTRIAL_MARINE'
-- WHERE CivUniqueUnitType = 'UNIT_FRENCH_MARINE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_FRENCH_MARINE');

-- UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_PELTAST'
-- WHERE CivUniqueUnitType = 'UNIT_GREEK_PELTAST' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_GREEK_PELTAST');

-- UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_MODERN_INFANTRY'
-- WHERE CivUniqueUnitType = 'UNIT_AUSTRALIAN_SASR' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_AUSTRALIAN_SASR');

-- UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_PELTAST'
-- WHERE CivUniqueUnitType = 'UNIT_ZULU_ASSEGAI' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ZULU_ASSEGAI');

-- UPDATE UnitReplaces SET ReplacesUnitType = 'UNIT_SHIP_OF_THE_LINE'
-- WHERE CivUniqueUnitType = 'UNIT_ENGLISH_SHIP_OF_THE_LINE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ENGLISH_SHIP_OF_THE_LINE');


-- -- Units Changes
-- UPDATE Units SET PromotionClass = 'PROMOTION_CLASS_MARINE'
-- WHERE UnitType = 'UNIT_FRENCH_MARINE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_FRENCH_MARINE');

-- UPDATE Units SET Combat = 28, RangedCombat = 33, Range = 1, PrereqTech = 'TECH_IRON_WORKING'
-- WHERE UnitType = 'UNIT_GREEK_PELTAST' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_GREEK_PELTAST');

-- UPDATE Units SET Combat = 28, RangedCombat = 33, Range = 1, PrereqTech = 'TECH_IRON_WORKING'
-- WHERE UnitType = 'UNIT_ZULU_ASSEGAI' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ZULU_ASSEGAI');

-- UPDATE Units SET Combat = 75, RangedCombat = 85, Range = 1, PrereqTech = 'TECH_STEALTH_TECHNOLOGY', PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' 
-- WHERE UnitType = 'UNIT_AMERICAN_AH64_APACHE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_AMERICAN_AH64_APACHE');

-- UPDATE Units SET Bombard = 60, RangedCombat = 0, PrereqTech = 'TECH_ASTRONOMY', PromotionClass = 'PROMOTION_CLASS_NAVAL_BOMBARD' 
-- WHERE UnitType = 'UNIT_ENGLISH_SHIP_OF_THE_LINE' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_ENGLISH_SHIP_OF_THE_LINE');

-- UPDATE Units SET BaseMoves = 4, Cost = 600, Combat = 82, Bombard = 92, RangedCombat = 0, Maintenance = 7, PromotionClass = 'PROMOTION_CLASS_NAVAL_BOMBARD', PrereqTech = 'TECH_SYNTHETIC_MATERIALS', StrategicResource = null 
-- WHERE UnitType = 'UNIT_JAPANESE_YAMATO' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_JAPANESE_YAMATO');

-- UPDATE Units SET Combat = 88, PrereqTech = 'TECH_COMBINED_ARMS', MandatoryObsoleteTech = 'TECH_COMPOSITES'
-- WHERE UnitType = 'UNIT_GERMAN_PANZER' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_GERMAN_PANZER');

-- UPDATE Units SET Cost = 500, Combat = 88, PrereqTech = 'TECH_COMBINED_ARMS', MandatoryObsoleteTech = 'TECH_COMPOSITES'
-- WHERE UnitType = 'UNIT_RUSSIAN_T34' AND EXISTS (SELECT 1 FROM Units WHERE UnitType = 'UNIT_RUSSIAN_T34');
