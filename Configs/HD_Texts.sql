--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                   Text)
values
    -- Options
    ("LOC_GAME_POSTPONE_WORLD_CONGRESS",                    "Postpone World Congress"),
    ("LOC_GAME_POSTPONE_WORLD_CONGRESS_DESCRIPTION",        "Postpone the world congress, starts in Industrial Era. Half the world congress interval."),
    ("LOC_GAME_CAPTURE_SETTLERS_AS_BUILDERS",               "Captured Settlers become Builders"),
    ("LOC_GAME_CAPTURE_SETTLERS_AS_BUILDERS_DESCRIPTION",   "Captured Settlers become Builders"),
    ("LOC_GAME_AI_GET_COPY_FOR_MILITARY_UNITS",             "AI Double Military Units"),
    ("LOC_GAME_AI_GET_COPY_FOR_MILITARY_UNITS_DESCRIPTION", "Whenever an AI trained a military unit, it will get a free copy of that.[NEWLINE]ONLY ENABLE WHEN YOU TRY TO CHALLENGE YOURSELF."),
    -- GameModes
    ("LOC_GAMEMODE_TESTING_NAME",                           "Testing Military Mode"),
    ("LOC_GAMEMODE_TESTING_DESCRIPTION",                    "Inner Testing Usage Only, please do not enable. Mode for Testing, current testing mode contains the military adjustments."),
    ("LOC_GAMEMODE_AITEST_NAME",                            "Testing AI Mode"),
    ("LOC_GAMEMODE_AITEST_DESCRIPTION",                     "Inner Testing Usage Only, please do not enable. Mode for Testing, current testing mode contains the AI adjustments."),
    ("LOC_GAMEMODE_TECHTEST_NAME",                          "Testing Tech Mode"),
    ("LOC_GAMEMODE_TECHTEST_DESCRIPTION",                   "Inner Testing Usage Only, please do not enable. Mode for Testing, current testing mode contains tech tree adjustments."),
    -- Maps
    ("LOC_MAP_TINY_ISLANDS_NAME",                           "Tiny Islands"),
    ("LOC_MAP_TINY_ISLANDS_DESCRIPTION",                    "Many tiny islands."),
    ("LOC_MAP_TINY_LAKES_NAME",                             "Tiny Lakes"),
    ("LOC_MAP_TINY_LAKES_DESCRIPTION",                      "Many tiny lakes.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                    Text)
values
    -- Options
    ("zh_Hans_CN",  "LOC_GAME_POSTPONE_WORLD_CONGRESS",                     "推迟世界议会"),
    ("zh_Hans_CN",  "LOC_GAME_POSTPONE_WORLD_CONGRESS_DESCRIPTION",         "推迟世界议会到工业时代开始。减半世界议会的周期。"),
    ("zh_Hans_CN",  "LOC_GAME_CAPTURE_SETTLERS_AS_BUILDERS",                "抢占的开拓者变为建造者"),
    ("zh_Hans_CN",  "LOC_GAME_CAPTURE_SETTLERS_AS_BUILDERS_DESCRIPTION",    "抢占的开拓者变为建造者"),
    ("zh_Hans_CN",  "LOC_GAME_AI_GET_COPY_FOR_MILITARY_UNITS",              "AI双倍军事单位"),
    ("zh_Hans_CN",  "LOC_GAME_AI_GET_COPY_FOR_MILITARY_UNITS_DESCRIPTION",  "每当ai训练一个军事单位，其会免费获得一个同样的单位。[NEWLINE]请谨慎开启。"),
    -- GameModes
    ("zh_Hans_CN",  "LOC_GAMEMODE_TESTING_NAME",                            "测试军事模式"),
    ("zh_Hans_CN",  "LOC_GAMEMODE_TESTING_DESCRIPTION",                     "内部测试专用，请勿开启。用于测试的模式，当前测试模式中调整了军事。"),
    ("zh_Hans_CN",  "LOC_GAMEMODE_AITEST_NAME",                             "测试AI模式"),
    ("zh_Hans_CN",  "LOC_GAMEMODE_AITEST_DESCRIPTION",                      "内部测试专用，请勿开启。用于测试的模式，当前测试模式中调整了ai。"),
    ("zh_Hans_CN",  "LOC_GAMEMODE_TECHTEST_NAME",                           "测试科技树模式"),
    ("zh_Hans_CN",  "LOC_GAMEMODE_TECHTEST_DESCRIPTION",                    "内部测试专用，请勿开启。用于测试的模式，当前测试模式中调整了科技树。"),
    -- ("zh_Hans_CN",  "LOC_ADD_STEEL_N_THUNDER_UU_NAME",                   "添加WE对ST特色单位的支持"),
    -- ("zh_Hans_CN",  "LOC_ADD_STEEL_N_THUNDER_UU_DESC",                   "添加Warfare Expanded对SteelThunder特色单位的支持{LOC_WER_MOD_NOTE}"),
    -- Maps
    ("zh_Hans_CN",  "LOC_MAP_TINY_ISLANDS_NAME",                            "米粒岛屿"),
    ("zh_Hans_CN",  "LOC_MAP_TINY_ISLANDS_DESCRIPTION",                     "很多如米粒般大小的岛屿。"),
    ("zh_Hans_CN",  "LOC_MAP_TINY_LAKES_NAME",                              "星罗棋布"),
    ("zh_Hans_CN",  "LOC_MAP_TINY_LAKES_DESCRIPTION",                       "星罗棋布的湖泊。");

    -- ("zh_Hans_CN",  "LOC_WER_MOD_NOTE",                         "[NEWLINE][NEWLINE][COLOR_Red]来自mod“[ICON_Unit]Warfare Expanded Reloaded[ICON_Unit]”[ENDCOLOR]"),