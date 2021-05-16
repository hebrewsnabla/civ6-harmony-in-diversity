--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                 Text)
values
    ("LOC_GAMEMODE_TESTING_NAME",         "Testing Mode"),
    ("LOC_GAMEMODE_TESTING_DESCRIPTION",  "Inner Testing Usage Only, please do not enable. Mode for Testing, current testing mode contains the AI settling bias adjustments."),
    ("LOC_GAMEMODE_TESTING_NAME",         "Tech Testing Mode"),
    ("LOC_GAMEMODE_TESTING_DESCRIPTION",  "Inner Testing Usage Only, please do not enable. Mode for Testing, current testing mode contains tech tree adjustments."),
    -- Maps
    ("LOC_MAP_TINY_ISLANDS_NAME",         "Tiny Islands"),
    ("LOC_MAP_TINY_ISLANDS_DESCRIPTION",  "Many tiny islands."),
    ("LOC_MAP_TINY_LAKES_NAME",           "Tiny Lakes"),
    ("LOC_MAP_TINY_LAKES_DESCRIPTION",    "Many tiny lakes.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                 Text)
values
    ("zh_Hans_CN",  "LOC_GAMEMODE_TESTING_NAME",         "测试模式"),
    ("zh_Hans_CN",  "LOC_GAMEMODE_TESTING_DESCRIPTION",  "内部测试专用，请勿开启。用于测试的模式，当前测试模式中调整了ai的坐城等倾向。"),
    ("zh_Hans_CN",  "LOC_GAMEMODE_TECHTEST_NAME",        "科技树测试模式"),
    ("zh_Hans_CN",  "LOC_GAMEMODE_TECHTEST_DESCRIPTION", "内部测试专用，请勿开启。用于测试的模式，当前测试模式中调整了科技树。"),
    -- ("zh_Hans_CN",  "LOC_WER_MOD_NOTE",                  "[NEWLINE][NEWLINE][COLOR_Red]来自mod“[ICON_Unit]Warfare Expanded Reloaded[ICON_Unit]”[ENDCOLOR]"),
    -- ("zh_Hans_CN",  "LOC_ADD_STEEL_N_THUNDER_UU_NAME",   "添加WE对ST特色单位的支持"),
    -- ("zh_Hans_CN",  "LOC_ADD_STEEL_N_THUNDER_UU_DESC",   "添加Warfare Expanded对SteelThunder特色单位的支持{LOC_WER_MOD_NOTE}"),
    -- Maps
    ("zh_Hans_CN",  "LOC_MAP_TINY_ISLANDS_NAME",         "米粒岛屿"),
    ("zh_Hans_CN",  "LOC_MAP_TINY_ISLANDS_DESCRIPTION",  "很多如米粒般大小的岛屿。"),
    ("zh_Hans_CN",  "LOC_MAP_TINY_LAKES_NAME",           "星罗棋布"),
    ("zh_Hans_CN",  "LOC_MAP_TINY_LAKES_DESCRIPTION",    "星罗棋布的湖泊。");
