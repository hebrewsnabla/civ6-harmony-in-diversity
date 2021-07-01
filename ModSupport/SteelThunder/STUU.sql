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

-- UU
-- 美国
update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_AMERICAN_MINUTEMAN';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_AMERICAN_MINUTEMAN';
-- 阿拉伯
update Units set PrereqTech = 'TECH_CASTLES' where UnitType = 'UNIT_ARABIAN_CAMEL_ARCHER';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 4, Range = 2, Combat = 23, RangedCombat = 37, StrategicResource = NULL where UnitType = 'UNIT_ARABIAN_CAMEL_ARCHER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ARABIAN_CAMEL_ARCHER';
insert or replace into TypeTags (Type, Tag) values ('UNIT_ARABIAN_CAMEL_ARCHER', 'CLASS_HD_CAN_MOVE_AFTER_ATTACK');
-- 
update Units set PrereqTech = 'TECH_METAL_CASTING' where UnitType = 'UNIT_ARABIAN_GHAZI';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 46, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_ARABIAN_GHAZI';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ARABIAN_GHAZI';
-- 德国
update Units set Cost = 80, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 43, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_GERMAN_LANDSKNECHT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GERMAN_LANDSKNECHT';
update Units set Cost = 600, Maintenance = 15, BaseMoves = 4, Range = 0, Combat = 95, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_GERMAN_PANZER';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_GERMAN_PANZER';
-- 希腊
update Units set Cost = 45, Maintenance = 1, BaseMoves = 2, Range = 2, Combat = 13, RangedCombat = 23, StrategicResource = NULL where UnitType = 'UNIT_GREEK_PELTAST';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GREEK_PELTAST';
-- 苏美尔
update Units set Cost = 25, Maintenance = 1, BaseMoves = 2, Range = 0, Combat = 25, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_SUMERIAN_PHALANX';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SUMERIAN_PHALANX';
-- 埃及
update Units set Cost = 60, Maintenance = 2, BaseMoves = 2, Range = 0, Combat = 35, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_EGYPTIAN_KHOPESH';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_EGYPTIAN_KHOPESH';
-- -- 中国
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 2, Combat = 30, RangedCombat = 37, StrategicResource = NULL where UnitType = 'UNIT_CHINESE_CHOKONU';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_CHINESE_CHOKONU';
-- -- 西班牙
update Units set PrereqTech = 'TECH_MILITARY_TACTICS' where UnitType = 'UNIT_SPANISH_TERCIO';
update Units set Cost = 120, Maintenance = 4, BaseMoves = 2, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_SPANISH_TERCIO';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_SPANISH_TERCIO';
-- -- 罗马
update Units set Cost = 75, Maintenance = 2, BaseMoves = 2, Range = 2, Combat = 30, Bombard = 40, StrategicResource = NULL where UnitType = 'UNIT_ROMAN_ONAGER';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ROMAN_ONAGER';
-- -- 俄罗斯
update Units set PrereqTech = 'TECH_CASTLES' where UnitType = 'UNIT_RUSSIAN_DRUZHINA';
update Units set Cost = 95, Maintenance = 3, BaseMoves = 4, Range = 0, Combat = 49, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_RUSSIAN_DRUZHINA';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_RUSSIAN_DRUZHINA';
-- -- 挪威
-- update Units set Cost = 70 where UnitType = 'UNIT_NORWEGIAN_ULFHEDNAR';
-- -- 印度
update Units set Cost = 210, Maintenance = 5, BaseMoves = 2, Range = 0, Combat = 68, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_INDIAN_SEPOY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_INDIAN_SEPOY';
-- -- 英国
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 3, Combat = 30, RangedCombat = 40, StrategicResource = NULL where UnitType = 'UNIT_ENGLISH_LONGBOWMAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ENGLISH_LONGBOWMAN';
delete from TypeTags where Type = 'ABILITY_LONGBOWMAN' and Tag = 'CLASS_ENGLISH_LONGBOWMAN';
update Units set Cost = 220, Maintenance = 4, BaseMoves = 4, Range = 2, Combat = 50, RangedCombat = 60, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_ENGLISH_SHIP_OF_THE_LINE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ENGLISH_SHIP_OF_THE_LINE';
-- -- 日本
delete from TypeTags where Type = 'UNIT_JAPANESE_SOHEI' and Tag = 'CLASS_MELEE';
insert or replace into TypeTags (Type, Tag) values ('UNIT_JAPANESE_SOHEI', 'CLASS_ANTI_CAVALRY');

update Units set PromotionClass = 'PROMOTION_CLASS_ANTI_CAVALRY' where UnitType = 'UNIT_JAPANESE_SOHEI';
update Units set Cost = 80, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 42, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_JAPANESE_SOHEI';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_JAPANESE_SOHEI';

insert or replace into UnitReplaces
    (CivUniqueUnitType,                     ReplacesUnitType)
values
    ('UNIT_JAPANESE_SOHEI',                 'UNIT_PIKEMAN');
update UnitUpgrades set UpgradeUnit = 'UNIT_PIKE_AND_SHOT' where Unit = 'UNIT_JAPANESE_SOHEI';
-- -- 斯基泰
update UnitUpgrades set UpgradeUnit = 'UNIT_KNIGHT' where Unit = 'UNIT_SCYTHIAN_AMAZON';
update UnitReplaces set ReplacesUnitType = 'UNIT_HEAVY_CHARIOT' where CivUniqueUnitType = 'UNIT_SCYTHIAN_AMAZON';
insert or replace into TypeTags (Type, Tag) values ('UNIT_SCYTHIAN_AMAZON', 'CLASS_HEAVY_CHARIOT');
update Units set PrereqTech = 'TECH_HORSEBACK_RIDING' where UnitType = 'UNIT_SCYTHIAN_AMAZON';
update Units set Cost = 90, Maintenance = 2, BaseMoves = 4, Range = 0, Combat = 38, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_SCYTHIAN_AMAZON';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SCYTHIAN_AMAZON';
insert or replace into TraitModifiers (TraitType, ModifierId) values ('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY', 'TRAIT_EXTRA_SCYTHIAN_AMAZON');

insert or replace into Modifiers
    (ModifierId,                            ModifierType)
values
    ('TRAIT_EXTRA_SCYTHIAN_AMAZON',         'MODIFIER_PLAYER_UNITS_ADJUST_EXTRA_UNIT_COPY');

insert or replace into ModifierArguments
    (ModifierId,                            Name,       Value)
values
    ('TRAIT_EXTRA_SCYTHIAN_AMAZON',         'UnitType', 'UNIT_SCYTHIAN_AMAZON'),
    ('TRAIT_EXTRA_SCYTHIAN_AMAZON',         'Amount',   1);

-- -- 巴西
update Units set Cost = 180, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 65, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_BRAZILIAN_FATHERLAND_VOLUNTEER';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_BRAZILIAN_FATHERLAND_VOLUNTEER';
-- -- 法国
update Units set Cost = 150, Maintenance = 6, BaseMoves = 4, Range = 0, Combat = 58, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_FRENCH_GENDARME';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_FRENCH_GENDARME';
-- -- 刚果
-- ------ UNIT_KONGO_MEDICINE_MAN
-- -- 澳大利亚
update Units set Cost = 690, Maintenance = 8, BaseMoves = 3, Range = 0, Combat = 95, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_AUSTRALIAN_SASR';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_AUSTRALIAN_SASR';
-- -- 波兰
update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_POLISH_CHOSEN_INFANTRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_POLISH_CHOSEN_INFANTRY';
-- -- 阿兹特克
update Units set Cost = 60, Maintenance = 2, BaseMoves = 2, Range = 0, Combat = 35, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_AZTEC_JAGUAR';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_AZTEC_JAGUAR';
-- -- 马其顿
update Units set Cost = 45, Maintenance = 1, BaseMoves = 2, Range = 0, Combat = 28, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_MACEDONIAN_PEZHETAIROS';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MACEDONIAN_PEZHETAIROS';
-- -- 波斯
update Units set Cost = 70, Maintenance = 2, BaseMoves = 4, Range = 0, Combat = 42, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_PERSIAN_CATAPHRACT';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_PERSIAN_CATAPHRACT';
-- -- 努比亚
update Units set Cost = 100, Maintenance = 2, BaseMoves = 3, Range = 0, Combat = 40, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_NUBIAN_AFRICAN_FOREST_ELEPHANT';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_NUBIAN_AFRICAN_FOREST_ELEPHANT';
-- -- 祖鲁
update Units set Cost = 45, Maintenance = 1, BaseMoves = 2, Range = 2, Combat = 20, RangedCombat = 25, StrategicResource = NULL where UnitType = 'UNIT_ZULU_ASSEGAI';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_ZULU_ASSEGAI';
-- -- 苏格兰
update Units set PrereqTech = 'TECH_APPRENTICESHIP' where UnitType = 'UNIT_SCOTTISH_GALLOWGLASS';
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 48, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_SCOTTISH_GALLOWGLASS';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SCOTTISH_GALLOWGLASS';
-- -- 蒙古
update Units set Cost = 120, Maintenance = 3, BaseMoves = 2, Range = 2, Combat = 38, Bombard = 52, StrategicResource = NULL where UnitType = 'UNIT_MONGOLIAN_HUI_HUI_PAO';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MONGOLIAN_HUI_HUI_PAO';
-- -- 马普切
update Units set Cost = 80, Maintenance = 3, BaseMoves = 2, Range = 1, Combat = 44, RangedCombat = 33, StrategicResource = NULL where UnitType = 'UNIT_MAPUCHE_GUERILLA';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MAPUCHE_GUERILLA';
-- -- 朝鲜
update Units set Cost = 180, Maintenance = 4, BaseMoves = 4, Range = 0, Combat = 58, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_KOREAN_TURTLE_SHIP';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_KOREAN_TURTLE_SHIP';
-- -- 高棉
update Units set Cost = 55, Maintenance = 1, BaseMoves = 3, Range = 0, Combat = 35, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_KHMER_WAR_CANOE';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_KHMER_WAR_CANOE';
-- -- 格鲁吉亚
update Units set Cost = 150, Maintenance = 6, BaseMoves = 4, Range = 0, Combat = 55, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_GEORGIAN_TADZREULI';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_GEORGIAN_TADZREULI';
-- -- 荷兰
update Units set Cost = 140, Maintenance = 4, BaseMoves = 2, Range = 0, Combat = 58, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_DUTCH_SCHUTTERIJ';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_DUTCH_SCHUTTERIJ';
-- -- 克里
update Units set Cost = 220, Maintenance = 5, BaseMoves = 5, Range = 0, Combat = 60, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_CREE_OTEHTAPIW';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_CREE_OTEHTAPIW';
-- -- 印尼
update Units set Cost = 60, Maintenance = 2, BaseMoves = 2, Range = 0, Combat = 38, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_INDONESIAN_KRIS_SWORDSMAN';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_INDONESIAN_KRIS_SWORDSMAN';
-- -- 加拿大
update Units set Cost = 670, Maintenance = 7, BaseMoves = 5, Range = 0, Combat = 90, RangedCombat = 0, StrategicResource = 'RESOURCE_COAL' where UnitType = 'UNIT_CANADA_HMCS_HAIDA';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_OIL', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_CANADA_HMCS_HAIDA';
-- -- 匈牙利
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 2, Combat = 30, RangedCombat = 45, StrategicResource = NULL where UnitType = 'UNIT_HUNGARY_KALANDOZO';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_HUNGARY_KALANDOZO';
-- -- 印加
-- ------ UNIT_INCA_CHASQUI
-- -- 马里
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 2, Combat = 30, RangedCombat = 40, StrategicResource = NULL where UnitType = 'UNIT_MALI_SOFA';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MALI_SOFA';
-- -- 毛利
update Units set Cost = 210, Maintenance = 5, BaseMoves = 3, Range = 1, Combat = 55, RangedCombat = 50, StrategicResource = NULL where UnitType = 'UNIT_MAORI_TUPARA';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MAORI_TUPARA';
-- -- 奥斯曼
update Units set Cost = 150, Maintenance = 6, BaseMoves = 4, Range = 0, Combat = 57, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_OTTOMAN_SIPAHI';
update Units_XP2 set ResourceCost = 10, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 2 where UnitType = 'UNIT_OTTOMAN_SIPAHI';
-- -- 腓尼基
update Units set Cost = 65, Maintenance = 2, BaseMoves = 4, Range = 1, Combat = 30, RangedCombat = 31, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_PHOENICIA_NUMIDIAN_CAVALRY';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_PHOENICIA_NUMIDIAN_CAVALRY';
-- -- 瑞典
update Units set Cost = 220, Maintenance = 5, BaseMoves = 5, Range = 0, Combat = 68, RangedCombat = 0, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_SWEDEN_HAKKAPELIITTA';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SWEDEN_HAKKAPELIITTA';
-- -- 埃利诺
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 45, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_ELEANOR_TEMPLAR';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ELEANOR_TEMPLAR';
-- -- 玛雅
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 45, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_MAYAN_HOLKAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_MAYAN_HOLKAN';
-- -- 大哥伦比亚
update Units set Cost = 210, Maintenance = 5, BaseMoves = 2, Range = 0, Combat = 68, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_COLOMBIAN_BRITISH_LEGION';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_COLOMBIAN_BRITISH_LEGION';
-- -- 埃塞俄比亚
update Units set Cost = 210, Maintenance = 5, BaseMoves = 2, Range = 0, Combat = 68, RangedCombat = 0, StrategicResource = 'RESOURCE_NITER' where UnitType = 'UNIT_ETHIOPIAN_MEHAL_SEFARI';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_NITER', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_ETHIOPIAN_MEHAL_SEFARI';
-- -- 拜占庭
update Units set Cost = 90, Maintenance = 3, BaseMoves = 2, Range = 0, Combat = 49, RangedCombat = 0, StrategicResource = 'RESOURCE_IRON' where UnitType = 'UNIT_BYZANTINE_VARANGIAN_GUARD';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_IRON', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_BYZANTINE_VARANGIAN_GUARD';
-- -- 高卢
update Units set Cost = 55, Maintenance = 1, BaseMoves = 3, Range = 0, Combat = 35, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_GAUL_CARRUS';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_GAUL_CARRUS';
-- -- 巴比伦
update Units set Cost = 45, Maintenance = 1, BaseMoves = 2, Range = 2, Combat = 18, RangedCombat = 28, StrategicResource = NULL where UnitType = 'UNIT_BABYLONIAN_BOWMAN';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_BABYLONIAN_BOWMAN';
-- -- 越南
update Units set Cost = 270, Maintenance = 6, BaseMoves = 3, Range = 0, Combat = 78, RangedCombat = 0, StrategicResource = NULL where UnitType = 'UNIT_VIETNAMESE_VIETCONG';
update Units_XP2 set ResourceCost = 0, ResourceMaintenanceType = NULL, ResourceMaintenanceAmount = 0 where UnitType = 'UNIT_VIETNAMESE_VIETCONG';
-- 葡萄牙
update Units set PrereqTech = 'TECH_CASTLES' where UnitType = 'UNIT_SPANISH_JINETE';
update Units set Cost = 100, Maintenance = 3, BaseMoves = 4, Range = 1, Combat = 46, RangedCombat = 33, StrategicResource = 'RESOURCE_HORSES' where UnitType = 'UNIT_SPANISH_JINETE';
update Units_XP2 set ResourceCost = 5, ResourceMaintenanceType = 'RESOURCE_HORSES', ResourceMaintenanceAmount = 1 where UnitType = 'UNIT_SPANISH_JINETE';
