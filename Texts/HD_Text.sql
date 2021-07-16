--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                     Text)
values
    -- UI Texts
    ("LOC_UNITCOMMAND_SACRIFICE_NAME",                                        "Human Sacrifice"),
    ("LOC_UNITCOMMAND_SACRIFICE_DESCRIPTION",                                 "Sacrifice this unit to God, gain +10 [ICON_Culture] Culture and +10 [ICON_Faith] for each builder charge the unit has. Remove the unit."),
    ("LOC_UNITCOMMAND_SACRIFICE_DISABLED_TT",                                 "[COLOR_RED]Must at City Center[ENDCOLOR]"),
    ("LOC_FLYOVER_AZTEC_SACRIFICE",                                           "Human Sacrifice[COLOR:ResCultureLabelCS]+{1_Amount}[ENDCOLOR][ICON_Culture][COLOR:ResFaithLabelCS]+{1_Amount}[ENDCOLOR][ICON_Faith]"),
    -- Main
    ("LOC_TOOLTIP_REGIONAL_EFFECT_RANGE",                                     "{1_num}-tile regional effects: Its basic yields extend to each city center within {1_num} tiles. Multiple copies of this effect from the same type of building do not provide additional bonuses."),
    ("LOC_HAPPINESS_DELIGHTED_NAME",                                          "Delighted"),
    ("LOC_IMPROVEMENT_GOODY_BUILDER_NAME",                                    "Please Ignore"),
    ("LOC_LOYALTY_LEVEL_4_NAME",                                              "Unswervingly Loyal"),
    ("LOC_LOYALTY_LEVEL_4_DESCRIPTION",                                       "The citizens are Unswervingly Loyal to your civilization"),
    ("LOC_TURNS_BEFORE_DESTROY_HD",                                           "Completely destroy after {1_num} turns"),
    ("LOC_CANNOT_REMOVE_FEATURE_USING_RECONS",                                "Cannot remove features using Recon units"),
    ("LOC_VIZSOURCE_CHANCERY",                                                "Built Building Chancery"),
    ("LOC_VIZSOURCE_ACTION_CHANCERY",                                         "Build Building Chancery"),
    ("LOC_GOSSIP_SOURCE_CHANCERY",                                            "Your officier from Chancery informed that "),
    ("LOC_GOSSIP_SOURCE_GOV_SPIES",                                           "Your officier from GOV SPIES informed that "),
    ("LOC_VIZSOURCE_GOV_SPIES",                                               "Built Building GOV SPIES"),
    ("LOC_VIZSOURCE_ACTION_GOV_SPIES",                                        "Build Building GOV SPIES"),
    ("LOC_DISTRICT_LUXURY_GOLD",                                              "+{1_num} [ICON_Gold] Gold from the adjacent luxury resource."),
    ("LOC_DISTRICT_CANAL_GOLD",                                               "+{1_num} [ICON_Gold] Gold from the adjacent Canal."),
    ("LOC_DISTRICT_AERODROME_INDUSTRIAL_PRODUCTION",                          "+{1_num} [ICON_Production] Production from the adjacent Aerodrome."),
    ("LOC_DISTRICT_OIL_INDUSTRIAL_PRODUCTION",                                "+{1_num} [ICON_Production] Production from the adjacent Oil Well."),
    ("LOC_DISTRICT_SEAOIL_INDUSTRIAL_PRODUCTION",                             "+{1_num} [ICON_Production] Production from the adjacent Offshore Oil Rig."),
    ("LOC_DISTRICT_LUMBER_MILL_1_PRODUCTION",                                 "+{1_num} [ICON_Production] Production from the adjacent Lumber Mill."),
    ("LOC_UNIVERSITY_JUNGLE_SCIENCE",                                         "+{1_num} [ICON_Science] Science from the adjacent {1_num : plural 1?Jungle; other?Jungles;}."),
    ("LOC_DISTRICT_QUARRY_HALF_PRODUCTION",                                   "+{1_num} [ICON_Production] Production from the adjacent Quarries."),
    ("LOC_DISTRICT_CULTURE_DOUBLE_CITY_CENTER",                               "+{1_num} [ICON_CULTURE] Culture from adjacent City {1_Num : plural 2?Center; other?Centers;}."),
    ("LOC_DISTRICT_GOLD_CITY_CENTER",                                         "+{1_num} [ICON_Gold] Gold from adjacent City {1_Num : plural 1?Center; other?Centers;}."),
    ("LOC_DISTRICT_GOLD_HANSA",                                               "+{1_num} [ICON_Gold] Gold from adjacent Hansa {1_Num : plural 2?district; other?districts;}."),
    ("LOC_DISTRICT_GOLD_INDUSTRIAL_ZONE",                                     "+{1_num} [ICON_Gold] Gold from adjacent Industrial Zone {1_Num : plural 2?district; other?districts;}."),
    ("LOC_DISTRICT_COMMERCIAL_GOLD",                                          "+{1_num} [ICON_Gold] Gold from adjacent Commercial Hub {1_Num : plural 2?district; other?districts;}."),
    ("LOC_DISTRICT_SUGUBA_GOLD",                                              "+{1_num} [ICON_Gold] Gold from adjacent Suguba {1_Num : plural 2?district; other?districts;}."),
    ("LOC_DISTRICT_DESERT_SCIENCE",                                           "+{1_num} [ICON_Science] Science from adjacent Desert {1_Num : plural 1?Tile; other?Tiles;}."),
    ("LOC_DISTRICT_DESERT_HILLS_SCIENCE",                                     "+{1_num} [ICON_Science] Science from adjacent Desert hill {1_Num : plural 1?Tile; other?Tiles;}."),
    ("LOC_DISTRICT_HARBOR_INDUSTRIAL_PRODUCTION",                             "+{1_num} [ICON_Production] Production from adjacent Harbor {1_Num : plural 1?district; other?districts;}."),
    ("LOC_DISTRICT_ROYALDOCK_INDUSTRIAL_PRODUCTION",                          "+{1_num} [ICON_Production] Production from adjacent RoyalDock {1_Num : plural 1?district; other?districts;}."),
    ("LOC_DISTRICT_COTHON_INDUSTRIAL_PRODUCTION",                             "+{1_num} [ICON_Production] Production from adjacent Cothon {1_Num : plural 1?district; other?districts;}."),
    ("LOC_DISTRICT_RIVER_HANSA_PRODUCTION",                                   "+{1_num} [ICON_Production] Production from adjacent river."),
    ("LOC_DISTRICT_HARBOR_HANSA_PRODUCTION",                                  "+{1_num} [ICON_Production] Production from adjacent Harbor {1_Num : plural 2?district; other?districts;}."),
    ("LOC_DISTRICT_ROYALDOCK_HANSA_PRODUCTION",                               "+{1_num} [ICON_Production] Production from adjacent RoyalDock {1_Num : plural 2?district; other?districts;}."),
    ("LOC_DISTRICT_COTHON_HANSA_PRODUCTION",                                  "+{1_num} [ICON_Production] Production from adjacent Cothon {1_Num : plural 2?district; other?districts;}."),
    ("LOC_ALLIANCE_LV2_RESEARCH_EFFECT_1",                                    "Every 10 turns (on Standard), you unlock a [ICON_TechBoosted] Eureka for a tech that your ally has researched or boosted, but you have not.")
    ;

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                     Text)
values
    -- [MOD] Gift it to me
    ("zh_Hans_CN",  "LOC_GIFTITTOME_GIFT_THIS_UNIT",                                         "赠送单位（给当前位置领土的所有者）"),
    ("zh_Hans_CN",  "LOC_GIFTITTOME_GIFT_THIS_UNIT_DISABLED",                                "赠送单位[NEWLINE] - 需要在其他玩家的领土内[NEWLINE] - 宗教单位、开拓者和考古学家无法赠送给城邦[NEWLINE] - 征兵不能赠送[NEWLINE] - 匈牙利需要将单位与金币一起赠送给宗主的城邦[NEWLINE] - 不能赠送给与你处于战争状态的玩家[NEWLINE] - 已达到每回合赠送单位的上限：{1_MaxGifts}次[NEWLINE] - 单位血量必须超过90％"),
    ("zh_Hans_CN",  "LOC_HUD_UNIT_PANEL_ARE_YOU_SURE_GIFT",                                  "您确定要向其他玩家赠送（{2_GiftCount} / {3_MaxGiftCount}）你的{1_UnitName}吗？"),
    ("zh_Hans_CN",  "LOC_HUD_UNIT_PANEL_ARE_YOU_SURE_GIFT_PAY",                              "您确定要向城邦赠送（{3_GiftCount} / {4_MaxGiftCount}）您的{1_UnitName}和{2_Gold}金币吗？[NEWLINE]（匈牙利需要将黄金与单位一起赠送给宗主的城邦）"),
    ("zh_Hans_CN",  "LOC_GIFTITTOME_WARNING_HEADLINE",                                       "来自{1_LeaderName}的警告"),
    ("zh_Hans_CN",  "LOC_GIFTITTOME_WARNING_CONTENT",                                        "向我们的敌人赠送单位可能会导致外交行动。[NEWLINE]我们已经警告你了"),
    ("zh_Hans_CN",  "LOC_GIFTITTOME_INFO_HEADLINE",                                          "{1_LeaderName}给了你一个单位！"),
    ("zh_Hans_CN",  "LOC_GIFTITTOME_INFO_CONTENT",                                           "您收到了{1_UnitName}！"),
    -- UI texts 
    ("zh_Hans_CN",  "LOC_UNITCOMMAND_SACRIFICE_NAME",                                        "活人献祭"),
    ("zh_Hans_CN",  "LOC_UNITCOMMAND_SACRIFICE_DESCRIPTION",                                 "向神明献祭该单位，每有一次剩余劳动力获得10点 [ICON_Culture] 文化值和10点 [ICON_Faith] 信仰值，移除该单位。"),
    ("zh_Hans_CN",  "LOC_UNITCOMMAND_SACRIFICE_DISABLED_TT",                                 "[COLOR_RED]必须位于市中心[ENDCOLOR]"),
    ("zh_Hans_CN",  "LOC_FLYOVER_AZTEC_SACRIFICE",                                           "活人献祭[COLOR:ResCultureLabelCS]+{1_Amount}[ENDCOLOR][ICON_Culture][COLOR:ResFaithLabelCS]+{1_Amount}[ENDCOLOR][ICON_Faith]"),
    -- Main
    ("zh_Hans_CN",  "LOC_GOVERNMENT_INHERENT_BONUS",                                         "传承效果"), -- 官方好像在ui上面写反了。
    ("zh_Hans_CN",  "LOC_TOOLTIP_REGIONAL_EFFECT_RANGE",                                     "{1_num}环辐射：其基础产出延伸到{1_num}个单元格内的市中心，但多个同种建筑的辐射不叠加。"),
    ("zh_Hans_CN",  "LOC_TYPE_TRAIT_CITIZENSLOTS",                                           "{1_Amount: number +#,###;-#,###} [ICON_Citizen] 公民{1_Amount : plural 1?槽位; other?槽位;}"),
    ("zh_Hans_CN",  "LOC_HAPPINESS_DELIGHTED_NAME",                                          "愉悦"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_GOODY_BUILDER_NAME",                                    "请忽略"),
    ("zh_Hans_CN",  "LOC_LOYALTY_LEVEL_4_NAME",                                              "绝对忠诚"),
    ("zh_Hans_CN",  "LOC_LOYALTY_LEVEL_4_DESCRIPTION",                                       "您的公民绝对忠于您的文明。"),
    ("zh_Hans_CN",  "LOC_TURNS_BEFORE_DESTROY_HD",                                           "将在{1_num}回合后被彻底摧毁"),
    ("zh_Hans_CN",  "LOC_CANNOT_REMOVE_FEATURE_USING_RECONS",                                "侦察类单位不能移除地貌"),
    ("zh_Hans_CN",  "LOC_VIZSOURCE_CHANCERY",                                                "建造了外交办"),
    ("zh_Hans_CN",  "LOC_VIZSOURCE_ACTION_CHANCERY",                                         "建造外交办"),
    ("zh_Hans_CN",  "LOC_GOSSIP_SOURCE_CHANCERY",                                            "外交办的官员获悉"),
    ("zh_Hans_CN",  "LOC_GOSSIP_SOURCE_GOV_SPIES",                                           "情报局的官员获悉"),
    ("zh_Hans_CN",  "LOC_VIZSOURCE_GOV_SPIES",                                               "建造了情报局"),
    ("zh_Hans_CN",  "LOC_VIZSOURCE_ACTION_GOV_SPIES",                                        "建造情报局"),
    ("zh_Hans_CN",  "LOC_DISTRICT_LUXURY_GOLD",                                              "相邻奢侈品资源提供+{1_num} [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SHELLS_DESCRIPTION",                                      "与区域防御战斗时+10 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_UNIT_GAUL_GAESATAE_DESCRIPTION",                                    "高卢特色远古时代单位，替代勇士。此单位拥有更高花费。与基础战斗力更高的单位作战时+10 [ICON_Strength] 战斗力。与区域防御战斗时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_CANAL_GOLD",                                               "相邻运河提供+{1_num} [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_AERODROME_INDUSTRIAL_PRODUCTION",                          "相邻航空港提供+{1_num} [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_OIL_INDUSTRIAL_PRODUCTION",                                "相邻油井提供+{1_num} [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_SEAOIL_INDUSTRIAL_PRODUCTION",                             "相邻海上钻机平台提供+{1_num} [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_LUMBER_MILL_1_PRODUCTION",                                 "相邻伐木场提供+{1_num} [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_UNIVERSITY_JUNGLE_SCIENCE",                                         "+{1_num} [ICON_Science] 科技值来自相邻的雨林。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_QUARRY_HALF_PRODUCTION",                                   "+{1_num} [ICON_Production] 生产力来自相邻的采石场。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_CULTURE_DOUBLE_CITY_CENTER",                               "+{1_num} [ICON_CULTURE] 文化值来自相邻的市中心。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_GOLD_CITY_CENTER",                                         "+{1_num} [ICON_Gold] 金币来自相邻的市中心。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_GOLD_HANSA",                                               "+{1_num} [ICON_Gold] 金币来自相邻的商业同业工会。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_GOLD_INDUSTRIAL_ZONE",                                     "+{1_num} [ICON_Gold] 金币来自相邻的工业区。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_COMMERCIAL_GOLD",                                          "+{1_num} [ICON_Gold] 金币来自相邻的商业区。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_SUGUBA_GOLD",                                              "+{1_num} [ICON_Gold] 金币来自相邻的曼丁哥市场。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_DESERT_SCIENCE",                                           "+{1_num} [ICON_Science] 科技值来自相邻的沙漠单元格。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_DESERT_HILLS_SCIENCE",                                     "+{1_num} [ICON_Science] 科技值来自相邻的沙漠（丘陵）单元格。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_HARBOR_INDUSTRIAL_PRODUCTION",                             "+{1_num} [ICON_Production] 生产力来自相邻的港口。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_ROYALDOCK_INDUSTRIAL_PRODUCTION",                          "+{1_num} [ICON_Production] 生产力来自相邻的皇家海军船坞。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_COTHON_INDUSTRIAL_PRODUCTION",                             "+{1_num} [ICON_Production] 生产力来自相邻的U型港。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_RIVER_HANSA_PRODUCTION",                                   "+{1_num} [ICON_Production] 生产力来自相邻河流。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_HARBOR_HANSA_PRODUCTION",                                  "+{1_num} [ICON_Production] 生产力来自相邻的港口。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_ROYALDOCK_HANSA_PRODUCTION",                               "+{1_num} [ICON_Production] 生产力来自相邻的皇家海军船坞。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_COTHON_HANSA_PRODUCTION",                                  "+{1_num} [ICON_Production] 生产力来自相邻的U型港。"),
    ("zh_Hans_CN",  "LOC_ALLIANCE_LV2_RESEARCH_EFFECT_1",                                    "每10回合（标准游戏速度下）解锁1个您盟友已研究或提升，而您尚未研究之科技的 [ICON_TechBoosted] 尤里卡")
    ;

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                 Text)
values
    ("zh_Hans_CN",  "LOC_RESOURCE_GOLD_NAME",                                            "黄金"),
    ("zh_Hans_CN",  "LOC_PEDIA_RESOURCES_PAGE_RESOURCE_GOLD_CHAPTER_HISTORY_PARA_1",     "黄金是一种柔软、有光泽和延展性的金属，在历史上一直受到人们的珍视。这是一种稀有金属，它的稀有性大大增加了它的价值。尽管黄金有一些工业和医疗用途，但它主要用作铸币或装饰用途，装饰珠宝、杯子、器皿以及超级富豪和权贵的马桶。 ");

--------------------------------------------------------------------------------
-- projects
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                     Text)
values
    ("LOC_PROJECT_BREAD_AND_CIRCUSES_DESCRIPTION",                            "City project which increases the Loyalty pressure that this city exerts on itself and other cities nearby.[NEWLINE][NEWLINE]While active, each of your [ICON_Citizen] Citizens here exerts +1 Loyalty pressure to this city. This pressure also affects other cities within 9 tiles, but is 10% less effective per tile. Once completed, instantly gain +20 Loyalty in this city.[NEWLINE][NEWLINE]Requires: Entertainment Complex district."),
    ("LOC_PROJECT_CIRCUSES_AND_BREAD_HD_NAME",                                "circuses and bread"),
    ("LOC_PROJECT_CIRCUSES_AND_BREAD_HD_SHORT_NAME",                          "circuses and bread"),
    ("LOC_PROJECT_CIRCUSES_AND_BREAD_HD_DESCRIPTION",                         "City project which increases the Loyalty pressure that this city exerts on itself and other cities nearby.[NEWLINE][NEWLINE]While active, each of your [ICON_Citizen] Citizens here exerts +2 Loyalty pressure to this city. This pressure also affects other cities within 9 tiles, but is 10% less effective per tile. Once completed, instantly gain +20 Loyalty in this city."),
    ("LOC_PROJECT_ENDLESS_MONEY_HD_NAME",                                     "endless money"),
    ("LOC_PROJECT_ENDLESS_MONEY_HD_SHORT_NAME",                               "endless money"),
    ("LOC_PROJECT_ENDLESS_MONEY_HD_DESCRIPTION",                              "City project which provides a huge amount of [ICON_Gold] Gold every turn."),
    ("LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_NAME",                             "breeding good foals"),
    ("LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_SHORT_NAME",                       "breeding good foals"),
    ("LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_DESCRIPTION",                      "Stable project. Once completed, instantly gain +20 [ICON_RESOURCE_HORSES] Horses."),
    ("LOC_PROJECT_GRANT_RESOURCE_IRON_HD_NAME",                               "earthen blast furnace"),
    ("LOC_PROJECT_GRANT_RESOURCE_IRON_HD_SHORT_NAME",                         "earthen blast furnace"),
    ("LOC_PROJECT_GRANT_RESOURCE_IRON_HD_DESCRIPTION",                        "Barracks project. Once completed, instantly gain +20 [ICON_RESOURCE_IRON] Iron."),
    ("LOC_PROJECT_GRANT_RESOURCE_NITER_HD_NAME",                              "high explosives"),
    ("LOC_PROJECT_GRANT_RESOURCE_NITER_HD_SHORT_NAME",                        "high explosives"),
    ("LOC_PROJECT_GRANT_RESOURCE_NITER_HD_DESCRIPTION",                       "Armory project. Once completed, instantly gain +20 [ICON_RESOURCE_NITER] Niter."),
    ("LOC_PROJECT_GRANT_RESOURCE_COAL_HD_NAME",                               "specialty fuels"),
    ("LOC_PROJECT_GRANT_RESOURCE_COAL_HD_SHORT_NAME",                         "specialty fuels"),
    ("LOC_PROJECT_GRANT_RESOURCE_COAL_HD_DESCRIPTION",                        "Armory project. Once completed, instantly gain +20 [ICON_RESOURCE_COAL] Coal."),
    ("LOC_PROJECT_GRANT_RESOURCE_OIL_HD_NAME",                                "shale extraction"),
    ("LOC_PROJECT_GRANT_RESOURCE_OIL_HD_SHORT_NAME",                          "shale extraction"),
    ("LOC_PROJECT_GRANT_RESOURCE_OIL_HD_DESCRIPTION",                         "Military academy project. Once completed, instantly gain +20 [ICON_RESOURCE_OIL] Oil."),
    ("LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_NAME",                           "rare earth research"),
    ("LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_SHORT_NAME",                     "rare earth research"),
    ("LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_DESCRIPTION",                    "Military academy project. Once completed, instantly gain +20 [ICON_RESOURCE_ALUMINUM] Aluminum."),
    ("LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_NAME",                            "gas centrifugal"),
    ("LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_SHORT_NAME",                      "gas centrifugal"),
    ("LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_DESCRIPTION",                     "Military academy project. Once completed, instantly gain +20 [ICON_RESOURCE_URANIUM] Uranium.");

-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    ("zh_Hans_CN",  "LOC_PROJECT_BREAD_AND_CIRCUSES_DESCRIPTION",                            "城市项目，可增加此城市对自身和对附近其他城市施加的忠诚度压力。[NEWLINE][NEWLINE]项目启动后，每位 [ICON_Citizen] 公民每回合对此城所施加的忠诚度压力+1。此忠诚度压力还将影响9个单元格以内的其他城市，但每远离1个单元格，效果减弱10%。项目完成后此城立即+20忠诚度。[NEWLINE][NEWLINE]需要先建成“娱乐设施”区域。"),
    ("zh_Hans_CN",  "LOC_PROJECT_CIRCUSES_AND_BREAD_HD_NAME",                                "马戏与面包"),
    ("zh_Hans_CN",  "LOC_PROJECT_CIRCUSES_AND_BREAD_HD_SHORT_NAME",                          "马戏与面包"),
    ("zh_Hans_CN",  "LOC_PROJECT_CIRCUSES_AND_BREAD_HD_DESCRIPTION",                         "城市项目，可增加此城市对自身和对附近其他城市施加的忠诚度压力。[NEWLINE][NEWLINE]项目启动后，每位 [ICON_Citizen] 公民每回合对此城所施加的忠诚度压力+2。此忠诚度压力还将影响9个单元格以内的其他城市，但每远离1个单元格，效果减弱10%。项目完成后此城立即+20忠诚度。"),
    ("zh_Hans_CN",  "LOC_PROJECT_ENDLESS_MONEY_HD_NAME",                                     "多钱善贾"),
    ("zh_Hans_CN",  "LOC_PROJECT_ENDLESS_MONEY_HD_SHORT_NAME",                               "多钱善贾"),
    ("zh_Hans_CN",  "LOC_PROJECT_ENDLESS_MONEY_HD_DESCRIPTION",                              "城市项目，每回合提供巨额 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_NAME",                             "良驹育种"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_SHORT_NAME",                       "良驹育种"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_DESCRIPTION",                      "马厩项目，项目完成后提供20点 [ICON_RESOURCE_HORSES] 马。"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_IRON_HD_NAME",                               "土制高炉"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_IRON_HD_SHORT_NAME",                         "土制高炉"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_IRON_HD_DESCRIPTION",                        "兵营项目，项目完成后提供20点 [ICON_RESOURCE_IRON] 铁。"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_NITER_HD_NAME",                              "烈性炸药"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_NITER_HD_SHORT_NAME",                        "烈性炸药"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_NITER_HD_DESCRIPTION",                       "兵工厂项目，项目完成后提供20点 [ICON_RESOURCE_NITER] 硝石。"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_COAL_HD_NAME",                               "特种燃料"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_COAL_HD_SHORT_NAME",                         "特种燃料"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_COAL_HD_DESCRIPTION",                        "兵工厂项目，项目完成后提供20点 [ICON_RESOURCE_COAL] 煤。"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_OIL_HD_NAME",                                "页岩提取"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_OIL_HD_SHORT_NAME",                          "页岩提取"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_OIL_HD_DESCRIPTION",                         "军事学院项目，项目完成后提供20点 [ICON_RESOURCE_OIL] 石油。"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_NAME",                           "稀土研究"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_SHORT_NAME",                     "稀土研究"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_DESCRIPTION",                    "军事学院项目，项目完成后提供20点 [ICON_RESOURCE_ALUMINUM] 铝。"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_NAME",                            "气体离心"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_SHORT_NAME",                      "气体离心"),
    ("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_DESCRIPTION",                     "军事学院项目，项目完成后提供20点 [ICON_RESOURCE_URANIUM] 铀。");

--------------------------------------------------------------------------------   
-- error texts
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                     Text)
values
    ("LOC_CITY_YIELD_MODIFIER_PER_GOVERNOR_TITLE_TOOLTIP",                    "{Value : number +#;-#}% ({ActualValue : number +#.#;-#.#}) from [ICON_Governor] Governor with {1} {1 : plural 1?Promotion; other?Promotions;}");

-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                 Text)
values
    ("zh_Hans_CN",  "LOC_CITY_YIELD_FROM_TERRAIN_TOOLTIP",                               "{Value : number +#.#;-#.#}来自地形"),
    ("zh_Hans_CN",  "LOC_PLAYER_YIELD_FAITH_FROM_BELIEFS",                               "{Value : number +#.#;-#.#}来自信仰"),
    ("zh_Hans_CN",  "LOC_PLAYER_YIELD_CULTURE_FROM_TRIBUTARIES",                         "{Value : number +#.#;-#.#}来自您是领主的城邦"),
    ("zh_Hans_CN",  "LOC_CITY_YIELD_MODIFIER_PER_GOVERNOR_TITLE_TOOLTIP",                "{Value : number +#;-#}%（{ActualValue : number +#.#;-#.#}）来自拥有{1}次{1 : plural 1?升级; other?升级;}的 [ICON_Governor] 总督");