--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                             Text)
values
    ("LOC_IMPROVEMENT_JNR_OASIS_FARM_DESCRIPTION",    "Unlocks the Builder ability to construct an Oasis Garden.[NEWLINE][NEWLINE]+2 [ICON_Culture] Culture。+1 [ICON_AMENITIES] Amenity when Buttress being researched. [NEWLINE]Can only be built on Oases."),
    ("LOC_IMPROVEMENT_JNR_REED_HOME_DESCRIPTION",     "Unlocks the Builder ability to construct a Reed Home.[NEWLINE][NEWLINE]+1 [ICON_Production] Production. [NEWLINE][NEWLINE]Can only be built on Marsh. Can only be pillaged (never destroyed) by natural disasters."),
    ("LOC_CIVIC_GUILDS_DESCRIPTION",                  "Lumber Mills and Camps can be built on Rainforest. +1 [ICON_Science] Science from the Reed Home improvement."),
    ("LOC_TECH_SCIENTIFIC_THEORY_DESCRIPTION",        "+1 [ICON_Food] Food from the Plantation improvement. +1 [ICON_Science] Science from the Reed Home improvement.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                             Text)
values
    ("zh_Hans_CN",  "LOC_RESOURCE_JNR_PEAT_NAME",                    "泥炭"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_JNR_OASIS_FARM_NAME",           "绿洲花园"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_JNR_OASIS_FARM_DESCRIPTION",    "解锁建造者建造绿洲花园的能力。[NEWLINE][NEWLINE]+2 [ICON_Culture] 文化值。解锁扶壁后+1 [ICON_AMENITIES] 宜居度。[NEWLINE]只可建造在绿洲上。"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_JNR_REED_HOME_NAME",            "芦苇屋"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_JNR_REED_HOME_DESCRIPTION",     "解锁建造者建造芦苇屋的能力。[NEWLINE][NEWLINE]+1 [ICON_Production] 生产力。[NEWLINE][NEWLINE]只可建造在沼泽上。只会被自然灾害劫掠不会被摧毁。"),
    ("zh_Hans_CN",  "LOC_CIVIC_GUILDS_DESCRIPTION",                  "允许在雨林上建造伐木场和营地。芦苇屋+1 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_TECH_SCIENTIFIC_THEORY_DESCRIPTION",        "种植园改良设施提供+1 [ICON_Food] 食物。芦苇屋+1 [ICON_Science] 科技值。");