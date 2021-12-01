--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                               Text)
values
    ("LOC_FEATURE_GEOTHERMAL_FISSURE_DESCRIPTION",      "The ground in this area, probably located near a boundary between two continents, has been ruptured by subterranean geothermal activity. Heated water and steam escape from the ground here, making it ideal to place structures such as Bathhouse, and Hungarian Thermal Baths nearby."),
    ("LOC_PEDIA_CONCEPTS_PAGE_ENVIRONMENTAL_EFFECTS_CHAPTER_GEOTHERMAL_FISSURES_PARA_1",      "Geothermal Fissures are a non-removable terrain feature which add +1 [ICON_Science] Science to the tile.  The Bathhouse grant +1 [ICON_Amenities] Amenity when placed adjacent to a Geothermal Fissure. The Hungarian Thermal Bath grant +2 [ICON_Amenities] Amenities and +3 [ICON_Tourism] Tourism. The Geothermal Power Plant improvement must be constructed over a Geothermal Fissure."),
    -- 
    ("LOC_PROJECT_REMOVE_DISTRICT_AQUEDUCT_NAME_JNR_UC", "Remove Cistern"),
    ("LOC_DISTRICT_AQUEDUCT_HD_DESCRIPTION",            "A district that provides this city with a source of fresh water from an adjacent River, Lake, Oasis, or Mountain. Cities that do not yet have existing fresh water receive up to 6 [ICON_Housing] Housing. Cities that already have existing fresh water will instead get +2 [ICON_Housing] Housing. If built adjacent to a Geothermal Fissure, +1 [ICON_Amenities] Amenity. Prevents [ICON_Food] Food loss during Drought. After Calendar is researched, all farms adjacent to fresh water or a Cistern gain +1 [ICON_FOOD] Food. [NEWLINE] Must be built adjacent to the City Center. Military Engineers can spend a charge to complete 30% of a Cistern's production. One per city."),
    ("LOC_DISTRICT_BATH_HD_DESCRIPTION",                "A district unique to Rome for city growth. Replaces the Cistern district and cheaper to build. Provides +2 [ICON_Housing] Housing and +1 [ICON_Amenities] Amenity. +50% construction speed for buildings inside Aqueduct. [NEWLINE][NEWLINE]It provides this city with a source of fresh water from an adjacent River, Lake, Oasis, or Mountain. Cities that do not yet have existing fresh water receive up to 6 [ICON_Housing] Housing. Cities that already have existing fresh water will instead get +2 [ICON_Housing] Housing.  Prevents [ICON_Food] Food loss during Drought. Must be built adjacent to the City Center. After Calendar is researched, all farms adjacent to fresh water or an Aqueduct +1 [ICON_FOOD] Food. [NEWLINE]Must be built adjacent to the City Center. Military Engineers can spend a charge to complete 30% of an Aqueduct's production. One per city."),
    ("LOC_BUILDING_JNR_ORCHARD_DESCRIPTION",            "+10% Growth rate in this city.[NEWLINE][NEWLINE]+1 [ICON_Food] Food and +2 [ICON_Gold] Gold from Plantations and Farms over resources in this city."),
    ("LOC_BUILDING_JNR_HAMMER_WORKS_DESCRIPTION",       "+10% Growth rate in this city.[NEWLINE][NEWLINE]+1 [ICON_Science] Science from Mines and Quarries in this city."),
    ("LOC_BUILDING_JNR_BATHHOUSE_DESCRIPTION",          "+10% Growth rate in this city.[NEWLINE][NEWLINE][ICON_Citizen] Citizens in this city provide +0.3 [ICON_Culture] Culture. If built adjacent to a Geothermal Fissure, +1 [ICON_Amenities] Amenity."),
    ("LOC_BUILDING_SEWER_DESCRIPTION",                  "+20% Growth rate in this city."),
    -- 
    ("LOC_CSE_AGRICULTURAL_TRAIT_MEDIUM_INFLUENCE_BONUS",   "+1 [ICON_FOOD] Food in every Cistern."),
    ("LOC_CSE_AGRICULTURAL_TRAIT_LARGE_INFLUENCE_BONUS",    "+2 [ICON_FOOD] Food in every {LOC_BUILDING_CONSULATE_COMMA}Orchard, Hammer Works and Bathhouse.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                Text)
values
    ("zh_Hans_CN",  "LOC_FEATURE_GEOTHERMAL_FISSURE_DESCRIPTION",       "通常位于两块大陆板块之间的地区，地表由于地热活动而被破坏。温泉与蒸汽会从此处奔腾而出，使其周围十分合适修建浴场和匈牙利温泉浴场。"),
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_ENVIRONMENTAL_EFFECTS_CHAPTER_GEOTHERMAL_FISSURES_PARA_1",       "地热裂缝是一种无法清除的地貌特征，其为单元格+1 [ICON_Science] 科技值。建造在地热裂缝旁的浴场+1 [ICON_Amenities] 宜居度。若为匈牙利温泉浴场，则+2 [ICON_Amenities] 宜居度、+3 [ICON_Tourism] 旅游业绩。地热发电厂改良设施必须建造在地热裂缝上。"),
    -- 
    ("zh_Hans_CN",  "LOC_PROJECT_REMOVE_DISTRICT_AQUEDUCT_NAME_JNR_UC", "移除 蓄水池"),
    ("zh_Hans_CN",  "LOC_DISTRICT_AQUEDUCT_NAME_JNR_UC",                "蓄水池"),
    ("zh_Hans_CN",  "LOC_DISTRICT_AQUEDUCT_HD_DESCRIPTION",             "区域从相邻河流、湖泊、绿洲或山脉引水，为该城市提供淡水资源。没有淡水资源的城市最多获得6个 [ICON_Housing] 住房。相反，已有淡水资源的城市 [ICON_Housing] 住房数量+2；干旱时可防止 [ICON_Food] 食物损失。研究历法科技后，本城所有淡水或相邻蓄水池的农田+1 [ICON_FOOD] 食物。必须修建在与市中心相邻的单元格中。军事工程师可消耗1次使用次数来完成蓄水池30%的修建进度。每个城市只允许建造1个。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_BATH_NAME_JNR_UC",                    "水渠"),
    ("zh_Hans_CN",  "LOC_DISTRICT_BATH_HD_DESCRIPTION",                 "促进城市发展的罗马特色区域。取代蓄水池，建造费用更低。提供+2 [ICON_Housing] 住房和+1 [ICON_Amenities] 宜居度，建造水渠中的建筑加速50%。[NEWLINE][NEWLINE]从相邻河流、湖泊、绿洲或山脉引水，为该城市提供淡水资源。尚未拥有淡水资源的城市最多获得6个 [ICON_Housing] 住房。已有淡水资源的城市则+2 [ICON_Housing] 住房。干旱时可防止 [ICON_Food] 食物损失。研究历法科技后，本城所有淡水或相邻水渠的农田+1 [ICON_FOOD] 食物。必须修建在与市中心相邻的单元格中。[NEWLINE]军事工程师可消耗1次使用次数来完成水渠30%的修建进度。每个城市只允许建造1个。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_ORCHARD_NAME",                    "果园"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_ORCHARD_DESCRIPTION",             "本城的余粮+10%。[NEWLINE][NEWLINE]本城的种植园和农场资源+1 [ICON_Food] 食物和+2 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_HAMMER_WORKS_NAME",               "水力锻锤"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_HAMMER_WORKS_DESCRIPTION",        "本城的余粮+10%。[NEWLINE][NEWLINE]本城矿山和采石场+1 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_BATHHOUSE_NAME",                  "浴场"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_BATHHOUSE_DESCRIPTION",           "本城的余粮+10%。[NEWLINE][NEWLINE]城市中每位 [ICON_Citizen] 公民 +0.3 [ICON_Culture] 文化值产出。若与地热裂缝相邻，提供+1 [ICON_Amenities] 宜居度。"),
    ("zh_Hans_CN",  "LOC_BUILDING_SEWER_DESCRIPTION",                   "本城的余粮+20%。"),
    -- 
    ("zh_Hans_CN",  "LOC_CSE_AGRICULTURAL_TRAIT_MEDIUM_INFLUENCE_BONUS",    "每座蓄水池+1 [ICON_Food] 食物。"),
    ("zh_Hans_CN",  "LOC_CSE_AGRICULTURAL_TRAIT_LARGE_INFLUENCE_BONUS",     "每座{LOC_BUILDING_CONSULATE_COMMA}果园、水力锻锤和浴场+2 [ICON_Food] 食物。");

UPDATE  LocalizedText
SET     Text = REPLACE(Text, '水渠', '蓄水池')
WHERE   Language = 'zh_Hans_CN' and (Tag IN (
        'LOC_TRAIT_CIVILIZATION_KHMER_BARAYS_EXPANSION2_DESCRIPTION',
        'LOC_RANDOM_EVENT_DROUGHT_DAMAGE',
        'LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION',
        'LOC_CLIMATE_DROUGHT_EVENT_DESCRIPTION_TOOLTIP',
        'LOC_GOVERNOR_PROMOTION_WATER_WORKS_DESCRIPTION',
        'LOC_DISTRICT_AQUEDUCT_PRODUCTION',
        'LOC_IMPROVEMENT_TERRACE_FARM_DESCRIPTION',
        'LOC_PEDIA_CONCEPTS_PAGE_CITIES_10_CHAPTER_CONTENT_PARA_2',
        'LOC_PEDIA_LEADERS_PAGE_LEADER_JAYAVARMAN_CHAPTER_DETAILED_BODY',
        'LOC_BUILDING_ANGKOR_WAT_DESCRIPTION',
        'LOC_BOOST_TRIGGER_MILITARY_ENGINEERING',
        'LOC_BOOST_TRIGGER_LONGDESC_ENGINEERING',
        'LOC_BOOST_TRIGGER_LONGDESC_MILITARY_ENGINEERING',
        'LOC_PEDIA_CONCEPTS_PAGE_CITIES_15_CHAPTER_CONTENT_PARA_2',
        'LOC_IMPROVEMENT_PLANTATION_HD_DESCRIPTION',
        'LOC_IMPROVEMENT_FARM_HD_DESCRIPTION',
        'LOC_TECH_CALENDAR_HD_DESCRIPTION',
        'LOC_TECH_IRRIGATION_DESCRIPTION',
        'LOC_PEDIA_CONCEPTS_PAGE_ENVIRONMENTAL_EFFECTS_CHAPTER_DROUGHTS_PARA_4',
        'LOC_CITY_POLICY_REVISION_ALMANAC_EFFECT'
)) and (exists (select Tag from EnglishText where Tag = 'LOC_DISTRICT_AQUEDUCT_NAME_JNR_UC'));

UPDATE  LocalizedText
SET     Text = REPLACE(Text, '浴场', '水渠')
WHERE   Language = 'zh_Hans_CN' and (Tag IN (
        'LOC_PEDIA_LEADERS_PAGE_LEADER_TRAJAN_CHAPTER_DETAILED_BODY',
        'LOC_TRAIT_CIVILIZATION_DISTRICT_BATH_NAME',
        'LOC_DISTRICT_BATH_PRODUCTION',
        'LOC_PEDIA_CONCEPTS_PAGE_ENVIRONMENTAL_EFFECTS_CHAPTER_DROUGHTS_PARA_4'
)) and (exists (select Tag from EnglishText where Tag = 'LOC_DISTRICT_AQUEDUCT_NAME_JNR_UC'));
