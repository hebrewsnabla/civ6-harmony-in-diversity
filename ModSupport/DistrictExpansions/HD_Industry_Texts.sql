--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                               Text)
values
    ("LOC_BUILDING_JNR_MILL_RACE_NAME",                 "Adjacen to River"),
    ("LOC_BUILDING_IZ_WATER_MILL_NAME",                 "Hydraulic Artisans"),
    ("LOC_BUILDING_IZ_WATER_MILL_DESCRIPTION",          "Can only be built when the Industrial Zone is adjacent to River."),
    ("LOC_BUILDING_JNR_WIND_MILL_DESCRIPTION",          "+1 [ICON_Production] Production for improved tiles adjacent to sea or lakes."),
    ("LOC_BUILDING_JNR_MANUFACTURY_DESCRIPTION",        "+1 [ICON_Production] Production and +3 [ICON_Gold] Gold for bonus and luxury resources."),
    ("LOC_BUILDING_JNR_CHEMICAL_DESCRIPTION",           "+5% [ICON_Production] Production and +5 [ICON_SCIENCE] Science for each different improved Strategic resource in this city."),
    ("LOC_BUILDING_JNR_FREIGHT_YARD_DESCRIPTION",       "[ICON_Citizen] Citizens in this city provide +1 [ICON_Production] Production and +2 [ICON_Gold] Gold."),
    ("LOC_POLICY_INVENTION_DESCRIPTION_JNR_UC",         "+8 [ICON_GreatEngineer] Great Engineer points per turn. +4 [ICON_GreatEngineer] Great Engineer points per turn for every Workshop and Manufactury."),
    ("LOC_POLICY_SCIENCE_FOUNDATIONS_DL_DESCRIPTION",   "+4 [ICON_GreatScientist] Great Scientist points per turn for every University and +8 [ICON_GreatScientist] Great Scientist points per turn for every Research Lab. +4 [ICON_GreatEngineer] Great Engineer points per turn for every Factory and Chemical Plant, and +8 [ICON_GreatEngineer] Great Engineer points per turn for every Power Plant and Logistics Center."),
    ("LOC_JNR_GREATPERSON_EUREKA_STRENGTH",             "[ICON_TechBoosted] Eurekas provide 1% more of technologies."),
    ("LOC_JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS",      "Dams are already unlocked with the Mathematics technology. Dams receive a [ICON_PRODUCTION] Production standard adjacency from districts."),
    ("LOC_JNR_GREATPERSON_INDUSTRY_ZONE_RIVER_ADJACENCY", "Standard adjacency bonus for Industrial Zones if next to a river."),
    ("LOC_JNR_GREATPERSON_TECH_MACHINERY",              "Triggers [ICON_TechBoosted] Eureka for Machinery. If it is triggered, instead completes the tech."),
    ("LOC_GREATPERSON_IMHOTEP_ACTIVE_JNR_UC",           "Grants 55 [ICON_Production] Production towards wonder construction, doubled if the wonder is from the Ancient or Classical Era.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                        Text)
values
    -- Resume
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_MILL_RACE_NAME",                          "相邻河流"),
    ("zh_Hans_CN",  "LOC_BUILDING_IZ_WATER_MILL_NAME",                          "水力作坊"),
    ("zh_Hans_CN",  "LOC_BUILDING_IZ_WATER_MILL_DESCRIPTION",                   "只有工业区相邻河流时才能建造。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_WIND_MILL_NAME",                          "风车"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_WIND_MILL_DESCRIPTION",                   "已改良的相邻湖泊或海岸的单元格+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_MANUFACTURY_NAME",                        "手工工场"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_MANUFACTURY_DESCRIPTION",                 "本城的加成和奢侈资源+1 [ICON_Production] 生产力和+3 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_CHEMICAL_NAME",                           "化工厂"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_CHEMICAL_DESCRIPTION",                    "本城每拥有一种被改良的战略资源，获得+5 [ICON_Science] 科技值和+5% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_FREIGHT_YARD_NAME",                       "物流中心"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_FREIGHT_YARD_DESCRIPTION",                "本城每个 [ICON_Citizen] 公民额外产出+1 [ICON_Production] 生产力和+2 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_POLICY_INVENTION_DESCRIPTION_JNR_UC",                  "每回合的 [ICON_GreatEngineer] 大工程师点数+8。每有一座工作坊或手工工场，每回合的 [ICON_GreatEngineer] 大工程师点数便+4。"),
    ("zh_Hans_CN",  "LOC_POLICY_SCIENCE_FOUNDATIONS_DL_DESCRIPTION",            "每有一所大学，每回合的 [ICON_GreatScientist] 大科学家点数便+4；每有一所研究实验室，每回合的 [ICON_GreatScientist] 大科学家点数便+8。每有一座工厂或化工厂，每回合的 [ICON_GreatEngineer] 大工程师点数便+4；每有一座发电厂或物流中心，每回合的 [ICON_GreatEngineer] 大工程师点数便+8。"),
    ("zh_Hans_CN",  "LOC_POLICY_THIRD_ALTERNATIVE_DESCRIPTION_JNR_UC_PRD",      "每座军营建筑、航空港建筑、物流中心、燃煤发电厂、燃油发电厂和核电站产出的 [ICON_Culture] 文化值+1、[ICON_Gold] 金币+2。"),
    -- 
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT_NAME",          "转换为物流中心"),
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT_SHORT_NAME",    "转换为物流中心"),
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT_DESCRIPTION",   "将城市中的发电站变更为{LOC_BUILDING_JNR_FREIGHT_YARD_NAME}.[NEWLINE][NEWLINE]{LOC_BUILDING_JNR_FREIGHT_YARD_NAME}:[NEWLINE]{LOC_BUILDING_JNR_FREIGHT_YARD_DESCRIPTION}"),
    -- 
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES_NAME",          "阿基米德"),
    ("zh_Hans_CN",  "LOC_JNR_GREATPERSON_EUREKA_STRENGTH",                      "[ICON_TechBoosted] 尤里卡提供的科技值额外+1%。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING_NAME",             "李冰"),
    ("zh_Hans_CN",  "LOC_JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS",               "解锁科技“数学”即可建造堤坝。建造堤坝时加速25%，堤坝为所在城市的沿河地块+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_NAME",              "马钧"),
    ("zh_Hans_CN",  "LOC_JNR_GREATPERSON_INDUSTRY_ZONE_RIVER_ADJACENCY",        "工业区若沿河可获得一份标准相邻加成。"),
    ("zh_Hans_CN",  "LOC_JNR_GREATPERSON_TECH_MACHINERY",                       "为机械科技启动 [ICON_TechBoosted] 尤里卡。 若已被触发，则完成该科技。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_IMHOTEP_ACTIVE_JNR_UC",                    "建造奇观时提供55点 [ICON_Production] 生产力，对于远古和古典时代的奇观加倍。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_JAMES_WATT_ACTIVE_JNR_UC",                 "此城所有与淡水源、水渠、堤坝以及运河相邻的单元格+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU_NAME", "玛蒂娜·德·贝尔特罗");
