
--------------------------------------------------------------------------------
-- Language: en_US
-- update EnglishText set Text = Text || '[NEWLINE]TestMessage' where Tag in (select Description from Units where PromotionClass = 'PROMOTION_CLASS_RECON');
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Recon: Faster [ICON_Movement] Movement in Hills, Woods and Rainforest terrain.' where Language = 'en_US' and (
    Tag = 'LOC_UNIT_SCOUT_DESCRIPTION' or
    Tag = 'LOC_UNIT_RANGER_DESCRIPTION' or
    Tag = 'LOC_UNIT_SCOTTISH_HIGHLANDER_DESCRIPTION' or
    Tag = 'LOC_UNIT_CREE_OKIHTCITAW_DESCRIPTION' or
    Tag = 'LOC_UNIT_SPEC_OPS_DESCRIPTION' or
    Tag = 'LOC_UNIT_SKIRMISHER_DESCRIPTION' or
    Tag = 'LOC_UNIT_INCA_WARAKAQ_DESCRIPTION');

-- Melee: ability cancelled.
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Melee: +5 [ICON_Strength] when attacking Districts.' where Language = 'en_US' and (
--     Tag = 'LOC_UNIT_WARRIOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SWORDSMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ROMAN_LEGION_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KONGO_SHIELD_BEARER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_JAPANESE_SAMURAI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_NORWEGIAN_BERSERKER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MUSKETMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SPANISH_CONQUISTADOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ENGLISH_REDCOAT_DESCRIPTION' or
--     Tag = 'LOC_UNIT_FRENCH_GARDE_IMPERIALE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MECHANIZED_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAN_AT_ARMS_DESCRIPTION' or
--     Tag = 'LOC_UNIT_LINE_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_AZTEC_EAGLE_WARRIOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MACEDONIAN_HYPASPIST_DESCRIPTION' or
--     Tag = 'LOC_UNIT_PERSIAN_IMMORTAL_DESCRIPTION' or
--     Tag = 'LOC_UNIT_DIGGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_GEORGIAN_KHEVSURETI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAORI_TOA_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SULEIMAN_JANISSARY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_GAUL_GAESATAE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BABYLONIAN_SABUM_KIBITTUM_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SWEDEN_CAROLEAN_DESCRIPTION');

-- +5 [ICON_Strength] Combat Strength against Cavalry units, extra 
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Anti Cavalry: +10 [ICON_Strength] Combat Strength when defending cavalry units.' where Language = 'en_US' and (
    Tag = 'LOC_UNIT_SPEARMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_GREEK_HOPLITE_DESCRIPTION' or
    Tag = 'LOC_UNIT_PIKEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_AT_CREW_DESCRIPTION' or
    Tag = 'LOC_UNIT_MODERN_AT_DESCRIPTION' or
    Tag = 'LOC_UNIT_ZULU_IMPI_DESCRIPTION' or
    Tag = 'LOC_UNIT_PIKE_AND_SHOT_DESCRIPTION');

-- Ranged: ability cancelled.
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Ranged: -17 [ICON_Strength] Combat Strength when attacking districts or Naval units. +5 [ICON_Strength] Combat Strength when occupying either an improvement that provides [ICON_Strength] Defense Strength or a district. -3 [ICON_Strength] Combat Strength when targets in Rainforest or Woods tiles.' where Language = 'en_US' and (
--     Tag = 'LOC_UNIT_MORTAR_DESCRIPTION' or -- STXP
--     Tag = 'LOC_UNIT_SLINGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BARBARIAN_HORSE_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SCYTHIAN_HORSE_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_EGYPTIAN_CHARIOT_ARCHER_EXPANSION2_DESCRIPTION' or
--     Tag = 'LOC_UNIT_CROSSBOWMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_CHINESE_CROUCHING_TIGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_FIELD_CANNON_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MACHINE_GUN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_NUBIAN_PITATI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KOREAN_HWACHA_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MONGOLIAN_KESHIG_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAYAN_HULCHE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_VIETNAMESE_VOI_CHIEN_DESCRIPTION');

-- +1 [ICON_Movement] Movement if starting in flat tiles. 
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Heavy Cavalry: -5 [ICON_Strength] Combat Strength when attacking districts.' where Language = 'en_US' and (
    -- Tag = 'LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION' or
    Tag = 'LOC_UNIT_HEAVY_CHARIOT_DESCRIPTION' or
    Tag = 'LOC_UNIT_KNIGHT_DESCRIPTION' or
    Tag = 'LOC_UNIT_INDIAN_VARU_DESCRIPTION' or
    Tag = 'LOC_UNIT_ARABIAN_MAMLUK_DESCRIPTION' or
    Tag = 'LOC_UNIT_TANK_DESCRIPTION' or
    Tag = 'LOC_UNIT_MODERN_ARMOR_DESCRIPTION' or
    Tag = 'LOC_UNIT_POLISH_HUSSAR_EXPANSION2_DESCRIPTION' or
    Tag = 'LOC_UNIT_MACEDONIAN_HETAIROI_DESCRIPTION' or
    Tag = 'LOC_UNIT_CUIRASSIER_DESCRIPTION' or
    Tag = 'LOC_UNIT_MALI_MANDEKALU_CAVALRY_DESCRIPTION' or
    Tag = 'LOC_UNIT_AMERICAN_ROUGH_RIDER_EXPANSION2_DESCRIPTION' or
    Tag = 'LOC_UNIT_BYZANTINE_TAGMA_DESCRIPTION');

-- Pillaging costs only 1 [ICON_Movement] Movement point. 
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Light Cavalry: -7 [ICON_Strength] Combat Strength when attacking districts.' where Language = 'en_US' and (
    Tag = 'LOC_UNIT_BARBARIAN_HORSEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_HORSEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_CAVALRY_DESCRIPTION' or
    Tag = 'LOC_UNIT_RUSSIAN_COSSACK_DESCRIPTION' or
    Tag = 'LOC_UNIT_HELICOPTER_DESCRIPTION' or
    Tag = 'LOC_UNIT_MAPUCHE_MALON_RAIDER_DESCRIPTION' or
    Tag = 'LOC_UNIT_COURSER_DESCRIPTION' or
    Tag = 'LOC_UNIT_CANADA_MOUNTIE_DESCRIPTION' or
    Tag = 'LOC_UNIT_HUNGARY_BLACK_ARMY_DESCRIPTION' or
    Tag = 'LOC_UNIT_HUNGARY_HUSZAR_DESCRIPTION' or
    Tag = 'LOC_UNIT_COLOMBIAN_LLANERO_DESCRIPTION' or
    Tag = 'LOC_UNIT_ETHIOPIAN_OROMO_CAVALRY_EXPANSION2_DESCRIPTION');

-- Siege: temporary disable.
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Siege: +1 [ICON_Movement] Movement when adjacent to Light or Heavy Cavalry.' where Language = 'en_US' and (
--     Tag = 'LOC_UNIT_SELF_PROPELLED_ARTILLERY_DESCRIPTION' or -- STXP
--     Tag = 'LOC_UNIT_CATAPULT_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BOMBARD_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ARTILLERY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_TREBUCHET_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KHMER_DOMREY_DESCRIPTION');

-- Naval Melee: can transport units in the sea.
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Naval Melee: Formation units all inherit escort''s [ICON_Movement] Movement speed' where Language = 'en_US' and (
    Tag = 'LOC_UNIT_COG_DESCRIPTION' or -- STXP
    Tag = 'LOC_UNIT_GALLEY_DESCRIPTION' or
    Tag = 'LOC_UNIT_NORWEGIAN_LONGSHIP_DESCRIPTION' or
    Tag = 'LOC_UNIT_CARAVEL_DESCRIPTION' or
    Tag = 'LOC_UNIT_IRONCLAD_DESCRIPTION' or
    Tag = 'LOC_UNIT_DESTROYER_DESCRIPTION' or
    Tag = 'LOC_UNIT_PHOENICIA_BIREME_DESCRIPTION' or
    Tag = 'LOC_UNIT_PORTUGUESE_NAU_DESCRIPTION');

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]侦察：在丘陵、树林和雨林地形有更快的 [ICON_Movement] 移动力。' where Language = 'zh_Hans_CN' and (
    Tag = 'LOC_UNIT_SCOUT_DESCRIPTION' or
    Tag = 'LOC_UNIT_RANGER_DESCRIPTION' or
    Tag = 'LOC_UNIT_SCOTTISH_HIGHLANDER_DESCRIPTION' or
    Tag = 'LOC_UNIT_CREE_OKIHTCITAW_DESCRIPTION' or
    Tag = 'LOC_UNIT_SPEC_OPS_DESCRIPTION' or
    Tag = 'LOC_UNIT_SKIRMISHER_DESCRIPTION' or
    Tag = 'LOC_UNIT_INCA_WARAKAQ_DESCRIPTION');

-- 近战能力取消。
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]近战：攻击区域防御时+5 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
--     Tag = 'LOC_UNIT_WARRIOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SWORDSMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ROMAN_LEGION_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KONGO_SHIELD_BEARER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_JAPANESE_SAMURAI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_NORWEGIAN_BERSERKER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MUSKETMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SPANISH_CONQUISTADOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ENGLISH_REDCOAT_DESCRIPTION' or
--     Tag = 'LOC_UNIT_FRENCH_GARDE_IMPERIALE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MECHANIZED_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAN_AT_ARMS_DESCRIPTION' or
--     Tag = 'LOC_UNIT_LINE_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_AZTEC_EAGLE_WARRIOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MACEDONIAN_HYPASPIST_DESCRIPTION' or
--     Tag = 'LOC_UNIT_PERSIAN_IMMORTAL_DESCRIPTION' or
--     Tag = 'LOC_UNIT_DIGGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_GEORGIAN_KHEVSURETI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAORI_TOA_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SULEIMAN_JANISSARY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_GAUL_GAESATAE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BABYLONIAN_SABUM_KIBITTUM_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SWEDEN_CAROLEAN_DESCRIPTION');

-- 与骑兵单位作战时+5 [ICON_Strength] 战斗力，
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]抗骑兵：防御骑兵单位时额外+10 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
    Tag = 'LOC_UNIT_SPEARMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_GREEK_HOPLITE_DESCRIPTION' or
    Tag = 'LOC_UNIT_PIKEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_AT_CREW_DESCRIPTION' or
    Tag = 'LOC_UNIT_MODERN_AT_DESCRIPTION' or
    Tag = 'LOC_UNIT_ZULU_IMPI_DESCRIPTION' or
    Tag = 'LOC_UNIT_PIKE_AND_SHOT_DESCRIPTION');

-- 远程能力取消。
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]远程：攻击区域防御和海军单位时-17 [ICON_Strength] 战斗力。占领一个区域或一个提供 [ICON_Strength] 防御力的改良设施时+5 [ICON_Strength] 战斗力。攻击森林或雨林中的目标时-3 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
--     Tag = 'LOC_UNIT_SLINGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BARBARIAN_HORSE_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SCYTHIAN_HORSE_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_EGYPTIAN_CHARIOT_ARCHER_EXPANSION2_DESCRIPTION' or
--     Tag = 'LOC_UNIT_CROSSBOWMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_CHINESE_CROUCHING_TIGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_FIELD_CANNON_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MACHINE_GUN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_NUBIAN_PITATI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KOREAN_HWACHA_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MONGOLIAN_KESHIG_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAYAN_HULCHE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_VIETNAMESE_VOI_CHIEN_DESCRIPTION');

-- 重骑兵：如果在平坦地形开始回合，本回合+1 [ICON_Movement] 移动力。
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]攻击区域防御时-5 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
    -- Tag = 'LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION' or
    Tag = 'LOC_UNIT_HEAVY_CHARIOT_DESCRIPTION' or
    Tag = 'LOC_UNIT_KNIGHT_DESCRIPTION' or
    Tag = 'LOC_UNIT_INDIAN_VARU_DESCRIPTION' or
    Tag = 'LOC_UNIT_ARABIAN_MAMLUK_DESCRIPTION' or
    Tag = 'LOC_UNIT_TANK_DESCRIPTION' or
    Tag = 'LOC_UNIT_MODERN_ARMOR_DESCRIPTION' or
    Tag = 'LOC_UNIT_POLISH_HUSSAR_EXPANSION2_DESCRIPTION' or
    Tag = 'LOC_UNIT_MACEDONIAN_HETAIROI_DESCRIPTION' or
    Tag = 'LOC_UNIT_CUIRASSIER_DESCRIPTION' or
    Tag = 'LOC_UNIT_MALI_MANDEKALU_CAVALRY_DESCRIPTION' or
    Tag = 'LOC_UNIT_AMERICAN_ROUGH_RIDER_EXPANSION2_DESCRIPTION' or
    Tag = 'LOC_UNIT_BYZANTINE_TAGMA_DESCRIPTION');

-- 劫掠只消耗一点 [ICON_Movement] 移动力。
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]轻骑兵：攻击区域防御时-7 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
    Tag = 'LOC_UNIT_BARBARIAN_HORSEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_HORSEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_CAVALRY_DESCRIPTION' or
    Tag = 'LOC_UNIT_RUSSIAN_COSSACK_DESCRIPTION' or
    Tag = 'LOC_UNIT_HELICOPTER_DESCRIPTION' or
    Tag = 'LOC_UNIT_MAPUCHE_MALON_RAIDER_DESCRIPTION' or
    Tag = 'LOC_UNIT_COURSER_DESCRIPTION' or
    Tag = 'LOC_UNIT_CANADA_MOUNTIE_DESCRIPTION' or
    Tag = 'LOC_UNIT_HUNGARY_BLACK_ARMY_DESCRIPTION' or
    Tag = 'LOC_UNIT_HUNGARY_HUSZAR_DESCRIPTION' or
    Tag = 'LOC_UNIT_COLOMBIAN_LLANERO_DESCRIPTION' or
    Tag = 'LOC_UNIT_ETHIOPIAN_OROMO_CAVALRY_EXPANSION2_DESCRIPTION');

-- 攻城能力临时取消
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]攻城：若相邻轻重骑兵，则+1 [ICON_Movement] 移动力。' where Language = 'zh_Hans_CN' and (
--     Tag = 'LOC_UNIT_SELF_PROPELLED_ARTILLERY_DESCRIPTION' or -- STXP
--     Tag = 'LOC_UNIT_CATAPULT_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BOMBARD_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ARTILLERY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_TREBUCHET_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KHMER_DOMREY_DESCRIPTION');

-- 海军近战可以运兵
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]海军近战：所有编队单位将继承护卫队的 [ICON_Movement] 移动力。' where Language = 'zh_Hans_CN' and (
    Tag = 'LOC_UNIT_COG_DESCRIPTION' or -- STXP
    Tag = 'LOC_UNIT_GALLEY_DESCRIPTION' or
    Tag = 'LOC_UNIT_NORWEGIAN_LONGSHIP_DESCRIPTION' or
    Tag = 'LOC_UNIT_CARAVEL_DESCRIPTION' or
    Tag = 'LOC_UNIT_IRONCLAD_DESCRIPTION' or
    Tag = 'LOC_UNIT_DESTROYER_DESCRIPTION' or
    Tag = 'LOC_UNIT_PHOENICIA_BIREME_DESCRIPTION' or
    Tag = 'LOC_UNIT_PORTUGUESE_NAU_DESCRIPTION');