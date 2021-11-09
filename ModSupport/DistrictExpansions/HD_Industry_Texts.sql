--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                               Text)
values
    ("LOC_BUILDING_JNR_MILL_RACE_NAME",                 "Adjacen to River"),
    ("LOC_BUILDING_JNR_TOOLING_SHOP_NAME",              "Tooling Shop"),
    -- ("LOC_BUILDING_JNR_TOOLING_SHOP_DESCRIPTION",       ""),
    ("LOC_BUILDING_IZ_WATER_MILL_NAME",                 "Hydraulic Artisans"),
    ("LOC_BUILDING_IZ_WATER_MILL_DESCRIPTION",          "Can only be built when the Industrial Zone is adjacent to River."),
    ("LOC_BUILDING_JNR_WIND_MILL_DESCRIPTION",          "+1 [ICON_Production] Production for Districts adjacent to sea or lakes."), -- improved tiles adjacent to sea or lakes.
    ("LOC_BUILDING_JNR_MANUFACTURY_DESCRIPTION",        "+1 [ICON_Production] Production and +3 [ICON_Gold] Gold for bonus and luxury resources."),
    ("LOC_BUILDING_JNR_CHEMICAL_DESCRIPTION",           "+5% [ICON_Production] Production and +5 [ICON_SCIENCE] Science for each different improved Strategic resource in this city."),
    ("LOC_BUILDING_JNR_FREIGHT_YARD_DESCRIPTION",       "[ICON_Citizen] Citizens in this city provide +1 [ICON_Production] Production and +2 [ICON_Gold] Gold."),
    ("LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION_UC_JNR",  "A building unique to Japan that replace Logistics Center, provide regional [ICON_Science] Science and [ICON_Culture] Culture yields. [ICON_Citizen] Citizens in this city provide +1 [ICON_Production] Production and +2 [ICON_Gold] Gold."),
    -- Boosts
    ("LOC_BOOST_TRIGGER_MASS_PRODUCTION_JNR_UC",        "Build 1 Manufactury."),
    ("LOC_BOOST_TRIGGER_LONGDESC_MASS_PRODUCTION_JNR_UC", "Handicraft workshops are growing in size, and more efficient production methods are being bred."),
    ("LOC_BOOST_TRIGGER_INDUSTRIALIZATION_JNR_UC",      "Build 2 Workshops."),
    ("LOC_BOOST_TRIGGER_CHEMISTRY_JNR_UC",              "Build 2 Chemical Plants."),
    ("LOC_BOOST_TRIGGER_LONGDESC_CHEMISTRY_JNR_UC",     "The booming chemical industry has also driven research in theoretical aspects of chemistry."),
    ("LOC_BOOST_TRIGGER_CLASS_STRUGGLE_JNR_UC",         "Build 2 Factories."),
    -- Great Person
    ("LOC_GREATPERSON_JNR_MANUFACTURY_CULTURE",         "Manufacturies provide +{Amount} [ICON_Culture] Culture."),
    -- Policies
    ("LOC_POLICY_INVENTION_DESCRIPTION_JNR_UC",         "+8 [ICON_GreatEngineer] Great Engineer points per turn. +4 [ICON_GreatEngineer] Great Engineer points per turn for every Workshop and Manufactury."),
    ("LOC_POLICY_SCIENCE_FOUNDATIONS_DL_DESCRIPTION",   "+4 [ICON_GreatScientist] Great Scientist points per turn for every University and +8 [ICON_GreatScientist] Great Scientist points per turn for every Research Lab. +4 [ICON_GreatEngineer] Great Engineer points per turn for every Factory and Chemical Plant, and +8 [ICON_GreatEngineer] Great Engineer points per turn for every Power Plant and Logistics Center."),
    -- Projects
    ("LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WATER_MILL_NAME",          "Convert to {LOC_BUILDING_IZ_WATER_MILL_NAME}"),
    ("LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WATER_MILL_SHORT_NAME",    "Convert to {LOC_BUILDING_IZ_WATER_MILL_NAME}"),
    ("LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WATER_MILL_DESCRIPTION",   "Convert {LOC_BUILDING_JNR_TOOLING_SHOP_NAME} to {LOC_BUILDING_IZ_WATER_MILL_NAME} in this city, requires the Industrial Zone adjacent to Rivers.[NEWLINE][NEWLINE]{LOC_BUILDING_IZ_WATER_MILL_NAME}:[NEWLINE]{LOC_BUILDING_IZ_WATER_MILL_DESCRIPTION}"),
    ("LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WIND_MILL_NAME",           "Convert to {LOC_BUILDING_JNR_WIND_MILL_NAME}"),
    ("LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WIND_MILL_SHORT_NAME",     "Convert to {LOC_BUILDING_JNR_WIND_MILL_NAME}"),
    ("LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WIND_MILL_DESCRIPTION",    "Convert {LOC_BUILDING_JNR_TOOLING_SHOP_NAME} to {LOC_BUILDING_JNR_WIND_MILL_NAME} in this city.[NEWLINE][NEWLINE]{LOC_BUILDING_JNR_WIND_MILL_NAME}:[NEWLINE]{LOC_BUILDING_JNR_WIND_MILL_DESCRIPTION}");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                        Text)
values
    -- Resume
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_MILL_RACE_NAME",                          "相邻河流"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_TOOLING_SHOP_NAME",                       "工具铺"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_JNR_TOOLING_SHOP_DESCRIPTION",                ""),
    ("zh_Hans_CN",  "LOC_BUILDING_IZ_WATER_MILL_NAME",                          "水力作坊"),
    ("zh_Hans_CN",  "LOC_BUILDING_IZ_WATER_MILL_DESCRIPTION",                   "只有工业区相邻河流时才能建造。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_WIND_MILL_NAME",                          "风车"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_WIND_MILL_DESCRIPTION",                   "相邻湖泊或海岸的区域+1 [ICON_Production] 生产力。"), --已改良的相邻湖泊或海岸的单元格+1 [ICON_Production] 生产力。
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_MANUFACTURY_NAME",                        "手工工场"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_MANUFACTURY_DESCRIPTION",                 "本城的加成和奢侈资源+1 [ICON_Production] 生产力和+3 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_CHEMICAL_NAME",                           "化工厂"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_CHEMICAL_DESCRIPTION",                    "本城每拥有一种被改良的战略资源，获得+5 [ICON_Science] 科技值和+5% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_FREIGHT_YARD_NAME",                       "物流中心"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_FREIGHT_YARD_DESCRIPTION",                "本城每个 [ICON_Citizen] 公民额外产出+1 [ICON_Production] 生产力和+2 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION_UC_JNR",      "日本特色建筑，取代物流中心，提供可辐射的 [ICON_Science] 科技和 [ICON_Culture] 文化值。 本城每个 [ICON_Citizen] 公民额外产出+1 [ICON_Production] 生产力和+2 [ICON_Gold] 金币。"),
    -- Boosts
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_MASS_PRODUCTION_JNR_UC",                 "建造1座手工工场。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_MASS_PRODUCTION_JNR_UC",        "手工工场规模日益增大，更为高效的生产方式也孕育而生。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_INDUSTRIALIZATION_JNR_UC",               "建造2座工作坊。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_CHEMISTRY_JNR_UC",                       "建造2座化工厂。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_CHEMISTRY_JNR_UC",              "化学工业的蓬勃发展也推动了化学理论方面的研究。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_CLASS_STRUGGLE_JNR_UC",                  "建造2座工厂。"),
    -- Great Person
    ("zh_Hans_CN",  "LOC_GREATPERSON_JNR_MANUFACTURY_CULTURE",                  "手工工场+{Amount} [ICON_Culture] 文化值。"),
    -- Policies
    ("zh_Hans_CN",  "LOC_POLICY_INVENTION_DESCRIPTION_JNR_UC",                  "每回合的 [ICON_GreatEngineer] 大工程师点数+8。每有一座工作坊或手工工场，每回合的 [ICON_GreatEngineer] 大工程师点数便+4。"),
    ("zh_Hans_CN",  "LOC_POLICY_SCIENCE_FOUNDATIONS_DL_DESCRIPTION",            "每有一所大学，每回合的 [ICON_GreatScientist] 大科学家点数便+4；每有一所研究实验室，每回合的 [ICON_GreatScientist] 大科学家点数便+8。每有一座工厂或化工厂，每回合的 [ICON_GreatEngineer] 大工程师点数便+4；每有一座发电厂或物流中心，每回合的 [ICON_GreatEngineer] 大工程师点数便+8。"),
    ("zh_Hans_CN",  "LOC_POLICY_THIRD_ALTERNATIVE_DESCRIPTION_JNR_UC_PRD",      "每座军营建筑、航空港建筑、物流中心、燃煤发电厂、燃油发电厂和核电站产出的 [ICON_Culture] 文化值+1、[ICON_Gold] 金币+2。"),
    -- Project
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WATER_MILL_NAME",          "转换为水力作坊"),
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WATER_MILL_SHORT_NAME",    "转换为水力作坊"),
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WATER_MILL_DESCRIPTION",   "将城市中的{LOC_BUILDING_JNR_TOOLING_SHOP_NAME}变更为{LOC_BUILDING_IZ_WATER_MILL_NAME}，需要工业区相邻河流。[NEWLINE][NEWLINE]{LOC_BUILDING_IZ_WATER_MILL_NAME}:[NEWLINE]{LOC_BUILDING_IZ_WATER_MILL_DESCRIPTION}"),
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WIND_MILL_NAME",           "转换为风车"),
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WIND_MILL_SHORT_NAME",     "转换为风车"),
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_TOOLING_SHOP_TO_WIND_MILL_DESCRIPTION",    "将城市中的{LOC_BUILDING_JNR_TOOLING_SHOP_NAME}变更为{LOC_BUILDING_JNR_WIND_MILL_NAME}。[NEWLINE][NEWLINE]{LOC_BUILDING_JNR_WIND_MILL_NAME}:[NEWLINE]{LOC_BUILDING_JNR_WIND_MILL_DESCRIPTION}"),
    -- 
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT_NAME",          "转换为物流中心"),
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT_SHORT_NAME",    "转换为物流中心"),
    ("zh_Hans_CN",  "LOC_PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT_DESCRIPTION",   "将城市中的发电站变更为{LOC_BUILDING_JNR_FREIGHT_YARD_NAME}.[NEWLINE][NEWLINE]{LOC_BUILDING_JNR_FREIGHT_YARD_NAME}:[NEWLINE]{LOC_BUILDING_JNR_FREIGHT_YARD_DESCRIPTION}");

-- City State Texts
--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                        Text)
values
    ("zh_Hans_CN",  "LOC_MINOR_CIV_INDUSTRIAL_TRAIT_MEDIUM_INFLUENCE_BONUS",    "建造奇观、建筑、区域时，每个工具铺、水力作坊和风车+2 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_MINOR_CIV_INDUSTRIAL_TRAIT_LARGE_INFLUENCE_BONUS",     "建造奇观、建筑、区域时，每个工作坊和手工工场+2 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_CSE_INDUSTRIAL_TRAIT_MEDIUM_INFLUENCE_BONUS",          "{LOC_MINOR_CIV_INDUSTRIAL_TRAIT_MEDIUM_INFLUENCE_BONUS}"),
    ("zh_Hans_CN",  "LOC_CSE_INDUSTRIAL_TRAIT_LARGE_INFLUENCE_BONUS",           "{LOC_MINOR_CIV_INDUSTRIAL_TRAIT_LARGE_INFLUENCE_BONUS}"),
    ("zh_Hans_CN",  "LOC_CSE_INDUSTRIAL_TRAIT_LARGEST_INFLUENCE_BONUS",         "建造奇观、建筑、区域时，每个工厂和化工厂+2 [ICON_Production] 生产力。");
