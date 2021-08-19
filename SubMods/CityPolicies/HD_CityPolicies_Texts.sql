--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                             Text)
values
    ("LOC_CITY_POLICY_NAME",                                          "City Policy"),
    ("LOC_HUD_CITY_CITY_POLICIES",                                    "City Policies"),
    ("LOC_HUD_CITY_NO_CITY_POLICIES",                                 "No City Policies exist."),
    ("LOC_BUILDING_CITY_POLICY_EMPTY_NAME",                           "No City Policy"),
    ("LOC_BUILDING_CITY_POLICY_EMPTY_DESCRIPTION",                    "No City Policy."),

    ("LOC_BUILDING_CITY_POLICY_LABOR_NAME",                           "Labor Policy"),
    ("LOC_BUILDING_CITY_POLICY_LABOR_DESCRIPTION",                    "Labor city policy undergoing, each [ICON_Citizen] Citizen provides 1.5 extra [ICON_Production] Production, but consume extra 1 [ICON_Food] Food. The city growth rate decreased by 75% and cause -1 [ICON_Amenities] Amenity. This policy can be disabled by a project."),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_DESCRIPTION",              "Enable the Labor city policy, Each [ICON_Citizen] Citizen provides 1.5 extra [ICON_Production] Production, but consume extra 1 [ICON_Food] Food. The city growth rate decreased by 75% and cause -1 [ICON_Amenities] Amenity. This policy can be disabled by another project."),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_NAME",                     "Enable Labor City Policy"),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_SHORT_NAME",               "Enable Labor"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_NAME",                    "Disable Labor City Policy"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_SHORT_NAME",              "Disable Labor"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_DESCRIPTION",             "Disable Labor city policy, the yields back to the normal. "),

    ("LOC_BUILDING_CITY_POLICY_DACAOGU_NAME",                         "Pillage Preparing Policy"),
    ("LOC_BUILDING_CITY_POLICY_DACAOGU_DESCRIPTION",                  "Pillage Preparing city policy undergoing, each trained light cavalry unit of Mediveal or eralier era in this city gains the ability that can pillage tiles using only 1 [ICON_Movement] Movement. Each [ICON_Citizen] Citizen consumes extra 1 [ICON_FOOD] Food. -100% Growth Rate and -1 [ICON_Amenities] Amenity to this city. If the city has at least 3 [ICON_Citizen] Citizens, receives another unit of the same kind when a light cavalry unit of Mediveal or eralier era being trained in this city, at the cost of one [ICON_Citizen] Citizen. This policy can be disabled by a project."),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_DACAOGU_DESCRIPTION",            "Enable the Pillage Preparing city policy. Once enabled, each trained light cavalry unit of Mediveal or eralier era in this city gains the ability that can pillage tiles using only 1 [ICON_Movement] Movement. Each [ICON_Citizen] Citizen consumes extra 1 [ICON_FOOD] Food. -100% Growth Rate and -1 [ICON_Amenities] Amenity to this city. If the city has at least 3 [ICON_Citizen] Citizens, receives another unit of the same kind when a light cavalry unit of Mediveal or eralier era being trained in this city, at the cost of one [ICON_Citizen] Citizen. This policy can be disabled by another project."),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_DACAOGU_NAME",                   "Enable Pillage Preparing City Policy"),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_DACAOGU_NSHORT_AME",             "Enable Pillage Preparing"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_DACAOGU_NAME",                  "Disable Pillage Preparing city policy"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_DACAOGU_SHORT_NAME",            "Disable Pillage Preparing"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_DACAOGU_DESCRIPTION",           "Disable Pillage Preparing city policy, the yields back to the normal. "),

    ("LOC_BUILDING_CITY_POLICY_AGRICULTURAL_TAX_NAME",                "Agricultural Tax Policy"),
    ("LOC_BUILDING_CITY_POLICY_AGRICULTURAL_TAX_DESCRIPTION",         "Agricultural Tax city policy undergoing, each Farm provides extra 2 [ICON_GOLD] Gold, but -1 [ICON_Food] Food.  This policy can be disabled by a project."),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX_DESCRIPTION",   "Enable the Agricultural Tax city policy, each Farm provides extra 2 [ICON_GOLD] Gold, but -1 [ICON_Food] Food. This policy can be disabled by a project."),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX_NAME",          "Enable Agricultural Tax City Policy"),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX_SHORT_NAME",    "Enable Agricultural Tax"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX_NAME",         "Disable Agricultural Tax City Policy"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX_SHORT_NAME",   "Disable Agricultural Tax"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX_DESCRIPTION",  "Disable Agricultural Tax city policy, the yields back to the normal. "),
    
    ("LOC_BUILDING_CITY_POLICY_INDUSTRAIL_TAX_NAME",                  "Industrial Tax Policy"),
    ("LOC_BUILDING_CITY_POLICY_INDUSTRAIL_TAX_DESCRIPTION",           "Industrial Tax city policy undergoing, each Mine or Quarry provides extra 2 [ICON_GOLD] Gold, but -1 [ICON_PRODUCTION] Production. This policy can be disabled by a project."),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX_DESCRIPTION",     "Enable the Industrial Tax city policy, each Mine or Quarry provides extra 2 [ICON_GOLD] Gold, but -1 [ICON_PRODUCTION] Production. This policy can be disabled by a project."),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX_NAME",            "Enable Industrial Tax City Policy"),
    ("LOC_PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX_SHORT_NAME",      "Enable Industrial Tax"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX_NAME",           "Disable Industrial Tax City Policy"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX_SHORT_NAME",     "Disable Industrial Tax"),
    ("LOC_PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX_DESCRIPTION",    "Disable Industrial Tax city policy, the yields back to the normal. ");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                             Text)
values
    ("zh_Hans_CN",  "LOC_CITY_POLICY_NAME",                                          "城市政策"),
    ("zh_Hans_CN",  "LOC_HUD_CITY_CITY_POLICIES",                                    "城市政策"),
    ("zh_Hans_CN",  "LOC_HUD_CITY_NO_CITY_POLICIES",                                 "尚未开启城市政策"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_EMPTY_NAME",                           "无城市政策"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_EMPTY_DESCRIPTION",                    "无城市政策。"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_LABOR_NAME",                           "徭役政策"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_LABOR_DESCRIPTION",                    "正在采用徭役城市政策，城市中每位 [ICON_Citizen] 公民提供1.5 [ICON_Production] 生产力，但额外增加1 [ICON_Food] 粮食消耗。城市余粮减少75%且-1 [ICON_Amenities] 宜居度。该政策可通过项目关闭。"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_DESCRIPTION",              "启用徭役城市政策，启用后城市中每位 [ICON_Citizen] 公民提供1.5 [ICON_Production] 生产力，但额外增加1 [ICON_Food] 粮食消耗。城市余粮减少75%且-1 [ICON_Amenities] 宜居度。该政策可通过另一个项目关闭。"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_NAME",                     "启用徭役城市政策"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_LABOR_SHORT_NAME",               "启用徭役"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_NAME",                    "停用徭役城市政策"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_SHORT_NAME",              "停用徭役"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_LABOR_DESCRIPTION",             "停用徭役城市政策，产出恢复正常。"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_DACAOGU_NAME",                         "打草谷政策"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_DACAOGU_DESCRIPTION",                  "正在采用打草谷政策，本城生产的中古及更早时代的轻骑兵获得劫掠地块只消耗1 [ICON_Movement] 移动力的能力。若本城有3 [ICON_Citizen] 人口或以上，则生产该类型的轻骑兵以后，额外获得一个免费的相同类型的单位，但减少一个 [ICON_Citizen] 人口。[NEWLINE]城市中每位公民 [ICON_Citizen] 额外消耗1 [ICON_Food] 食物。本城减少100%余粮，并-1 [ICON_Amenities] 宜居度。该政策可通过项目关闭。"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_DACAOGU_DESCRIPTION",            "启用打草谷政策，启用后本城生产的中古及更早时代的轻骑兵获得劫掠地块只消耗1 [ICON_Movement] 移动力的能力。若本城有3 [ICON_Citizen] 人口或以上，则生产该类型的轻骑兵以后，额外获得一个免费的相同类型的单位，但减少一个 [ICON_Citizen] 人口。[NEWLINE]城市中每位公民 [ICON_Citizen] 额外消耗1 [ICON_Food] 食物。本城减少100%余粮，并-1 [ICON_Amenities] 宜居度。该政策可通过另一个项目关闭。"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_DACAOGU_NAME",                   "启用打草谷政策"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_DACAOGU_SHORT_NAME",             "启用打草谷"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_DACAOGU_NAME",                  "停用打草谷城市政策"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_DACAOGU_SHORT_NAME",            "停用打草谷"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_DACAOGU_DESCRIPTION",           "停用打草谷城市政策，产出恢复正常。"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_AGRICULTURAL_TAX_NAME",                "农业税政策"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_AGRICULTURAL_TAX_DESCRIPTION",         "正在采用农业税政策，每个农场多2 [ICON_GOLD] 金币，但额外减少1 [ICON_Food] 粮食。该政策可通过项目关闭。"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX_DESCRIPTION",   "启用农业税政策，启用后每个农场多2 [ICON_GOLD] 金币，但额外减少1 [ICON_Food] 粮食。该政策可通过另一个项目关闭。"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX_NAME",          "启用农业税城市政策"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_AGRICULTURAL_TAX_SHORT_NAME",    "启用农业税"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX_NAME",         "停用农业税城市政策"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX_SHORT_NAME",   "停用农业税"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_AGRICULTURAL_TAX_DESCRIPTION",  "停用农业税城市政策，产出恢复正常。"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_INDUSTRAIL_TAX_NAME",                  "工业税政策"),
    ("zh_Hans_CN",  "LOC_BUILDING_CITY_POLICY_INDUSTRAIL_TAX_DESCRIPTION",           "正在采用工业税政策，每个矿山或采石场多2 [ICON_GOLD] 金币，但额外减少1 [ICON_PRODUCTION] 生产力。该政策可通过项目关闭。"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX_DESCRIPTION",     "启用工业税政策，启用后每个矿山或采石场多2 [ICON_GOLD] 金币，但额外减少1 [ICON_PRODUCTION] 生产力。该政策可通过另一个项目关闭。"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX_NAME",            "启用工业税城市政策"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_ENABLE_INDUSTRAIL_TAX_SHORT_NAME",      "启用工业税"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX_NAME",           "停用工业税城市政策"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX_SHORT_NAME",     "停用工业税"),
    ("zh_Hans_CN",  "LOC_PROJECT_CITY_POLICY_DISABLE_INDUSTRAIL_TAX_DESCRIPTION",    "停用工业税城市政策，产出恢复正常。");

