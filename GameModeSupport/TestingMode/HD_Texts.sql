--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                       Text)
values
    --melee
    ("LOC_TECH_SHIPBUILDING_DESCRIPTION",                                       "Allows all land units to embark. Unlocks Melee units upgrade: Amphibious[NEWLINE]No [ICON_Strength] Combat Strength and [ICON_Movement] Movement penalty when attacking from sea or river."),
    ("LOC_CIVIC_FEUDALISM_DL_DESCRIPTION",                                      "Plantation improvements receive +1 [ICON_Food] Food. Unlocks Melee units upgrade: +3 [ICON_Strength] Combat Strength for units fighting in Rainforest or Woods tiles."),
    --("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_NAME",                       "District Warfare"),
    ("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION",                  "+5 [ICON_Strength] Combat Strength when fighting in a district."),
    ("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",          "from District Warfare"),
    ("LOC_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",         "from fighting in Rainforest or Woods tiles"),
    ("LOC_BATTLE_LINE_COMBAT_HD_PREVIEW_DESCRIPTION",                           "from adjacent melee unit"),
    ("LOC_PROMOTION_BATTLECRY_DESCRIPTION",                                     "+5 [ICON_Strength] Combat Strength vs. melee, ranged and anti-cavalry units."),
    ("LOC_PROMOTION_TORTOISE_DESCRIPTION",                                      "+7 [ICON_Strength] Combat Strength when defending against ranged or city center attacks."),
    ("LOC_PROMOTION_BATTLE_LINE_HD_NAME",                                       "Battle Line"),
    ("LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                                "+2 [ICON_Strength] Combat Strength from adjacent melee unit."),
    ("LOC_PROMOTION_LONG_MARCH_HD_NAME",                                        "Long March"),
    ("LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                                 "Heals at the end of every turn, even after moving or attacking."),
    ("LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION",                                 "+7 [ICON_Strength] Combat Strength when fighting in a district.")
    ;

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    --melee
    ("zh_Hans_CN",  "LOC_TECH_SHIPBUILDING_DESCRIPTION",                                    "允许所有陆地单位上船。解锁近战单位升级：水陆两栖[NEWLINE]从海洋或河流进行攻击时，免除 [ICON_Strength] 战斗力和 [ICON_Movement] 移动力减益。"),
    ("zh_Hans_CN",  "LOC_CIVIC_FEUDALISM_DL_DESCRIPTION",                                   "种植园改良设施提供的 [ICON_Food] 食物+1。解锁近战单位升级：在森林或雨林中战斗时+3 [ICON_Strength] 战斗力"),
    --("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_NAME",                    "区域作战"),
    ("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION",               "在区域上战斗时+5 [ICON_Strength] 战斗力"),
    ("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",       "来自区域作战"),
    ("zh_Hans_CN",  "LOC_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",      "来自在森林或雨林中战斗"),
    ("zh_Hans_CN",  "LOC_BATTLE_LINE_COMBAT_HD_PREVIEW_DESCRIPTION",                        "来自相邻近战单位"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLECRY_DESCRIPTION",                                  "进攻近战、远程和抗骑兵单位时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_TORTOISE_DESCRIPTION",                                   "防御远程或城市攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_NAME",                                    "战线"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                             "+2 [ICON_Strength] 战斗力来自相邻的近战单位。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_NAME",                                     "长途行军"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                              "在每回合结束时（甚至是在移动或攻击后），自动恢复生命值。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION",                              "在区域上战斗时+7 [ICON_Strength] 战斗力")
    ;