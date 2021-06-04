--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                       Text)
values
    ("LOC_ABILITY_RECON_IGNORE_TERRIAN_COST_HD_DESCRIPTION",                    "Faster [ICON_Movement] Movement in Hills, Woods and Rainforest terrain."), -- , but -1 [ICON_Movement] Base Movement.
    ("LOC_PROMOTION_SENTRY_DESCRIPTION",                                        "+1 sight range, can see through Woods and Jungle."),
    ("LOC_PROMOTION_RECON_TRAVEL_LIGHT_NAME",                                   "Travel Light"),
    ("LOC_PROMOTION_RECON_TRAVEL_LIGHT_DESCRIPTION",                            "+1 [ICON_Movement] Movement, Ignore Zone of Control"),
    ("LOC_PROMOTION_SPYGLASS_DESCRIPTION",                                      "+1 sight range, reveal stealth units on the map within sight range."),
    ("LOC_PROMOTION_GUERRILLA_DESCRIPTION",                                     "Can move after attacking, +5 [ICON_Strength] when attacking."),
    -- ("LOC_GUERRILLA_ATTACK_BUFF_HD_PREVIEW_TEXT",                               "From Guerrilla when attacking"),
    ("LOC_PROMOTION_AMBUSH_DESCRIPTION",                                        "+5 [ICON_Strength] Combat Strength in all situations, only adjacent enemy units can reveal this unit."),
    ("LOC_PROMOTION_RECON_RAPID_FIRE_NAME",                                     "Rapid Fire"),
    ("LOC_PROMOTION_RECON_RAPID_FIRE_DESCRIPTION",                              "+1 additional attack per turn if [ICON_Movement] Movement allows."),
    ("LOC_PROMOTION_RECON_ACCURATE_NAME",                                       "Accurate"),
    ("LOC_PROMOTION_RECON_ACCURATE_DESCRIPTION",                                "+1 [ICON_Range] Range."),
    ("LOC_BUILDING_GOV_CONQUEST_DESCRIPTION",                                   "Capturing an enemy City grants 15% bonus [ICON_Production] Production in all Cities for 5 turns.[NEWLINE][ICON_Gold] Golds gained from capturing cities are +100%.[NEWLINE]Yields gained from pilaging and coastal raids are +100%.[NEWLINE]Awards +1 [ICON_Governor] Governor Title.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    ("zh_Hans_CN",  "LOC_ABILITY_RECON_IGNORE_TERRIAN_COST_HD_DESCRIPTION",                 "在丘陵、树林和雨林地形有更快的 [ICON_Movement] 移动力"), -- ，但-1 [ICON_Movement] 移动力
    ("zh_Hans_CN",  "LOC_PROMOTION_SENTRY_DESCRIPTION",                                     "+1视野范围，视野能穿过森林和丛林。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_TRAVEL_LIGHT_NAME",                                "轻装"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_TRAVEL_LIGHT_DESCRIPTION",                         "+1 [ICON_Movement] 移动力，忽略控制区。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SPYGLASS_DESCRIPTION",                                   "+1视野范围，显示视野范围内的隐形单位。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_GUERRILLA_DESCRIPTION",                                  "攻击后可移动，攻击时+5 [ICON_Strength] 战斗力。"),
    -- ("zh_Hans_CN",  "LOC_GUERRILLA_ATTACK_BUFF_HD_PREVIEW_TEXT",                            "进攻时，来自游击队"),
    ("zh_Hans_CN",  "LOC_PROMOTION_AMBUSH_DESCRIPTION",                                     "在所有情况下+5 [ICON_Strength] 战斗力，只有相邻敌军单位才能发现该单位。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_RAPID_FIRE_NAME",                                  "速射"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_RAPID_FIRE_DESCRIPTION",                           "如果 [ICON_Movement] 移动力允许，每回合+1额外攻击。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_ACCURATE_NAME",                                    "精准"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_ACCURATE_DESCRIPTION",                             "+1 [ICON_Range] 射程。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_CONQUEST_DESCRIPTION",                                "占领一座敌方城市后，所有城市将获得15%的 [ICON_Production] 生产力加成，效果持续5回合。[NEWLINE]占领城市获得的 [ICON_Gold] 金币收益+100%。[NEWLINE]掠夺和海岸扫荡的收益+100%。[NEWLINE]奖励1个 [ICON_Governor] 总督头衔。");


--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                       Text)
values
    --melee
    -- ("LOC_TECH_SHIPBUILDING_DESCRIPTION",                                       "Allows all land units to embark. Unlocks Melee units upgrade: No [ICON_Strength] Combat Strength and [ICON_Movement] Movement penalty when attacking from sea or river."),
    -- ("LOC_CIVIC_FEUDALISM_DL_DESCRIPTION",                                      "Plantation improvements receive +1 [ICON_Food] Food. Unlocks Melee units upgrade: +3 [ICON_Strength] Combat Strength for units fighting in Rainforest or Woods tiles."),
    --("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_NAME",                       "District Warfare"),
    ("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION",                  "+5 [ICON_Strength] Combat Strength when fighting in a district."),
    ("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",          "from District Warfare"),
    ("LOC_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",         "from fighting in Rainforest or Woods tiles"),
    --("LOC_BATTLE_LINE_COMBAT_HD_PREVIEW_DESCRIPTION",                           "from adjacent melee unit"),
    ("LOC_PROMOTION_BATTLECRY_DESCRIPTION",                                     "+5 [ICON_Strength] Combat Strength vs. melee, ranged and anti-cavalry units."),
    ("LOC_PROMOTION_TORTOISE_DESCRIPTION",                                      "+7 [ICON_Strength] Combat Strength when defending against ranged attacks."),
    ("LOC_PROMOTION_BATTLE_LINE_HD_NAME",                                       "Battle Line"),
    ("LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                                "+10 [ICON_Strength] Combat Strength if there is at least one adjacent friendly melee unit."),
    ("LOC_PROMOTION_LONG_MARCH_HD_NAME",                                        "Long March"),
    ("LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                                 "Heals at the end of every turn, even after moving or attacking."),
    ("LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION",                                 "+7 [ICON_Strength] Combat Strength when fighting in a district."),
    --ranged
    ("LOC_ABILITY_RANGED_GARRISON_DISTRICT_BONUS_HD_DESCRIPTION",               "+5 [ICON_Strength] Combat Strength when occupying either an improvement that provides [ICON_Strength] Defense Strength or a district."),
    ("LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_DESCRIPTION",            "-3 [ICON_Strength] Combat Strength when targets in Rainforest or Woods tiles."),
    ("LOC_RANGED_GARRISON_DISTRICT_BONUS_HD_PREVIEW_DESCRIPTION",               "from garrison"),
    ("LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_PREVIEW_DESCRIPTION",    "from targets in Rainforest or Woods tiles"),
    --("LOC_SNIPER_BONUS_VS_WOUNDED_UNITS_HD_PREVIEW_DESCRIPTION",                "from attacking wounded units"),
    --("LOC_SUPPRESSION_DEFNECE_BONUS_HD_PREVIEW_DESCRIPTION",                    "from Suppression"),
    ("LOC_PROMOTION_GARRISON_DESCRIPTION",                                      "+5 [ICON_Strength] Combat Strength when occupying either an improvement that provides [ICON_Strength] Defense Strength or a district. +5 Loyalty per turn when garrisoning in city centers."),
    ("LOC_PROMOTION_SNIPER_HD_NAME",                                            "Sniper"),
    ("LOC_PROMOTION_SNIPER_HD_DESCRIPTION",                                     "+7 [ICON_Strength] Combat Strength when attacking wounded units."),
    ("LOC_PROMOTION_SUPPRESSION_DESCRIPTION",                                   "Exercise zone of control. +10 [ICON_Strength] Combat Strength when defending melee combat."),
    ("LOC_PROMOTION_ARROW_STORM_DESCRIPTION",                                   "+7 [ICON_Strength] Combat Strength when attacking."),
    ("LOC_PROMOTION_EMPLACEMENT_DESCRIPTION",                                   "+10 [ICON_Strength] Combat Strength when defending against ranged attacks.")
    ;

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    --melee
    -- ("zh_Hans_CN",  "LOC_TECH_SHIPBUILDING_DESCRIPTION",                                    "允许所有陆地单位上船。解锁近战单位升级：从海洋或河流进行攻击时，免除 [ICON_Strength] 战斗力和 [ICON_Movement] 移动力减益。"),
    -- ("zh_Hans_CN",  "LOC_CIVIC_FEUDALISM_DL_DESCRIPTION",                                   "种植园改良设施提供的 [ICON_Food] 食物+1。解锁近战单位升级：在森林或雨林中战斗时+3 [ICON_Strength] 战斗力"),
    --("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_NAME",                    "区域作战"),
    ("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION",               "在区域上战斗时+5 [ICON_Strength] 战斗力"),
    ("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",       "来自区域作战"),
    ("zh_Hans_CN",  "LOC_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",      "来自在森林或雨林中战斗"),
    --("zh_Hans_CN",  "LOC_BATTLE_LINE_COMBAT_HD_PREVIEW_DESCRIPTION",                      "来自相邻近战单位"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLECRY_DESCRIPTION",                                  "进攻近战、远程和抗骑兵单位时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_TORTOISE_DESCRIPTION",                                   "防御远程攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_NAME",                                    "战线"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                             "与至少一个友方近战单位相邻时+10 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_NAME",                                     "长途行军"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                              "在每回合结束时（甚至是在移动或攻击后），自动恢复生命值。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION",                              "在区域上战斗时+7 [ICON_Strength] 战斗力"),
    --ranged
    ("zh_Hans_CN",  "LOC_ABILITY_RANGED_GARRISON_DISTRICT_BONUS_HD_DESCRIPTION",            "占领一个区域或一个提供 [ICON_Strength] 防御力的改良设施时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_DESCRIPTION",         "攻击森林或雨林中的目标时-3 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_RANGED_GARRISON_DISTRICT_BONUS_HD_PREVIEW_DESCRIPTION",            "来自驻军"),
    ("zh_Hans_CN",  "LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_PREVIEW_DESCRIPTION", "来自目标位于森林或雨林中"),
    --("zh_Hans_CN",  "LOC_SNIPER_BONUS_VS_WOUNDED_UNITS_HD_PREVIEW_DESCRIPTION",           "来自攻击受伤单位"),
    --("zh_Hans_CN",  "LOC_SUPPRESSION_DEFNECE_BONUS_HD_PREVIEW_DESCRIPTION",               "来自压制"), 
    ("zh_Hans_CN",  "LOC_PROMOTION_GARRISON_DESCRIPTION",                                   "占领一个区域或一个提供 [ICON_Strength] 防御力的改良设施时+5 [ICON_Strength] 战斗力。驻军时+5忠诚度。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SNIPER_HD_NAME",                                         "狙击"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SNIPER_HD_DESCRIPTION",                                  "攻击受伤单位时+7 [ICON_Strength] 战斗力"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SUPPRESSION_DESCRIPTION",                                "学会区域控制。防御近战攻击时+10 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ARROW_STORM_DESCRIPTION",                                "攻击时+7 [ICON_Strength] 战斗力"),
    ("zh_Hans_CN",  "LOC_PROMOTION_EMPLACEMENT_DESCRIPTION",                                "防御远程攻击时+10 [ICON_Strength] 战斗力。")
    ;
