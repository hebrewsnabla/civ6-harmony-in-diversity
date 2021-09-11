--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                    Text)
values
    -- Notification Log
    ("zh_Hans_CN",  "LOC_FF16_NOTIFICATION_LOG_TITLE",      "消息记录"),
    ("zh_Hans_CN",  "LOC_FF16_LOGSIZE_OPTION",              "面板尺寸:"),
    ("zh_Hans_CN",  "LOC_FF16_MAXLOGSIZE_OPTION",           "最多条数:"),
    ("zh_Hans_CN",  "LOC_FF16_LOGSIZE_AUTO",                "自动"),
    ("zh_Hans_CN",  "LOC_FF16_CLEARLOG_OPTION",             "过回合清空消息记录"),
    ("zh_Hans_CN",  "LOC_FF16_LOG_OPTIONS_TITLE",           "消息记录偏好设置"),
    ("zh_Hans_CN",  "LOC_FF16_NOTIFICATION_LOG_TOOLTIP",    "偏好设置"),
    ("zh_Hans_CN",  "LOC_FF16_LOG_ENTRY_SINGLE",            "有新的小道消息，右键清空记录。"),
    ("zh_Hans_CN",  "LOC_FF16_LOG_ENTRY_MULTIPLE",          "有新的小道消息，右键清空记录。"),
    -- Configure Minimal City Distance
    ("zh_Hans_CN",  "LOC_CMCD_NAME",                        "最小城市间距"),
    ("zh_Hans_CN",  "LOC_CMCD_DESCRIPTION",                 "建立城市时的最近距离限制"),
    ("zh_Hans_CN",  "LOC_CMCD_HEADER_NAME",                 "[COLOR_Production]设置最小城市间距[ENDCOLOR]"),
    ("zh_Hans_CN",  "LOC_CMCD_HEADER_DESCRIPTION",          "由DahakaMVl制作的 设置最小城市间距"),
    ("zh_Hans_CN",  "LOC_CMCD_FOOTER_NAME",                 "[COLOR_Production]设置最小城市间距 结束[ENDCOLOR]"),
    ("zh_Hans_CN",  "LOC_CMCD_FOOTER_DESCRIPTION",          "用于填充的假选项"),
    -- RadialMeasuringTool
    ("zh_Hans_CN",  "LOC_RMT_WND_TITLE",                    "半径测量工具"),
    ("zh_Hans_CN",  "LOC_RMT_LBL1",                         "点击地图上的位置来可视化半径内的地格"),
    ("zh_Hans_CN",  "LOC_RMT_RAD_LBL",                      "半径:"),
    ("zh_Hans_CN",  "LOC_RMT_ALT_RAD_PREFIX",               "在"),
    ("zh_Hans_CN",  "LOC_RMT_ALT_RAD_SUFIX",                "格内"),
    ("zh_Hans_CN",  "LOC_RMT_ALT_RAD_CB_TT",                "选中后采用在x格内的计数方式"),
    ("zh_Hans_CN",  "LOC_RMT_CB_MULTI",                     "多重半径高亮"),
    ("zh_Hans_CN",  "LOC_RMT_CB_CITY_ONLY",                 "只高亮市中心"),
    ("zh_Hans_CN",  "LOC_RMT_CB_BONUS_RES",                 "忽略加成资源"),
    ("zh_Hans_CN",  "LOC_RMT_MAX_CITY_RAD",                 "- 市民可工作范围"),
    ("zh_Hans_CN",  "LOC_RMT_KEY_CITY_CEN",                 "市中心"),
    ("zh_Hans_CN",  "LOC_RMT_KEY_RES",                      "资源"),
    ("zh_Hans_CN",  "LOC_RMT_CB_TRANSP",                    "使用透明的窗口背景"),
    ("zh_Hans_CN",  "LOC_RMT_CB_WND_POS",                   "窗口位置");

-- Greatest cities
--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                         Text)
values
    ("zh_Hans_CN",  "LOC_AKGC_CITIES_BUTTON",                                    "最伟大的城市"),
    ("zh_Hans_CN",  "LOC_AKGC_CITIES_TITLE",                                     "世界上最伟大的城市"),
    ("zh_Hans_CN",  "LOC_AKGC_CITIES_TITLE_HISTORIC",                            "由{1_author}统计的在{2_era}最伟大的城市"),
    ("zh_Hans_CN",  "LOC_AKGC_CITIES_TAB_WORLD",                                 "世界"),
    ("zh_Hans_CN",  "LOC_AKGC_CITIES_TAB_EMPIRE",                                "帝国"),
    ("zh_Hans_CN",  "LOC_AKGC_UNDISCOVERED_CITY",                                "未发现的城市"),
    ("zh_Hans_CN",  "LOC_AKGC_AWARD_HIGHEST_GoldPT",                             "最富有的城市 (每回合{1} [ICON_GOLD])"),
    ("zh_Hans_CN",  "LOC_AKGC_AWARD_HIGHEST_FaithPT",                            "最虔诚的城市 (每回合{1} [ICON_FAITH])"),
    ("zh_Hans_CN",  "LOC_AKGC_AWARD_HIGHEST_CulturePT",                          "最有文化的城市 (每回合{1} [ICON_CULTURE])"),
    ("zh_Hans_CN",  "LOC_AKGC_AWARD_HIGHEST_SciencePT",                          "受教育程度最高的城市 (每回合{1} [ICON_SCIENCE])"),
    ("zh_Hans_CN",  "LOC_AKGC_AWARD_HIGHEST_ProductionPT",                       "最工业化的城市 (每回合{1} [ICON_PRODUCTION])"),
    ("zh_Hans_CN",  "LOC_AKGC_AWARD_HIGHEST_Population",                         "最大的城市 ({1} [ICON_CITIZEN])"),
    ("zh_Hans_CN",  "LOC_AKGC_AWARD_HIGHEST_Defense",                            "最坚固的城市 ({1} [ICON_STRENGTH])"),
    ("zh_Hans_CN",  "LOC_AKGC_AWARD_HIGHEST_Happiness",                          "最幸福的城市 (+{1} [ICON_AMENITIES])"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMPOPULATION",                             "{1_score} 来自人口"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMWONDERS",                                "{1_score} 来自奇观"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMLAND",                                   "{1_score} 来自土地"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMAMENITIES",                              "{1_score} 来自宜居度"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMDISTRICTSANDBUILDINGS",                  "{1_score} 来自开发程度"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMDAMAGE",                                 "{1_score} 来自受损设施"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMTOPGPT",                                 "{1_score} 来自拥有最高的回合 [ICON_GOLD]"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMTOPFPT",                                 "{1_score} 来自拥有最高的回合 [ICON_FAITH]"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMTOPCPT",                                 "{1_score} 来自拥有最高的回合 [ICON_CULTURE]"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMTOPSPT",                                 "{1_score} 来自拥有最高的回合 [ICON_SCIENCE]"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMTOPPPT",                                 "{1_score} 来自拥有最高的回合 [ICON_PRODUCTION]"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_FROMHOLYCITY",                               "{1_relscore} 作为 {2_rel} 的圣城"),
    ("zh_Hans_CN",  "LOC_AKGC_SCORE_TOTAL",                                      "总计{1_score}分"),
    ("zh_Hans_CN",  "LOC_AKGC_CITYFOUNDEDUNKNOWN",                               "{1_civ}{2_occupied}"),
    ("zh_Hans_CN",  "LOC_AKGC_CITYFOUNDED",                                      "{1_civ}{2_occupied} 建立于{3_year}"),
    ("zh_Hans_CN",  "LOC_AKGC_CITYFOUNDEDBYSOMEONEELSE",                         "{1_civ}{2_occupied} 由 {4_origciv} 建立于{3_year}"),
    ("zh_Hans_CN",  "LOC_AKGC_CITYOCCUPIED",                                     " (已占领)"),
    ("zh_Hans_CN",  "LOC_AKGC_CITYRAZED",                                        " 已被夷平"),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_FOUNDED",                             "{1_year}: 由 {3_civ} 建立的 {2_city}"),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_CAPTURED",                            "{1_year}: 被 {2_civ} 征服"),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_RAZED",                               "{1_year}: 被 {2_civ} 夷平"),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_OCCUPIED",                            "{1_year}: 被 {2_civ} 占领"),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_LIBERATED",                           "{1_year}: 被 {2_civ} 解放"),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_TRADED",                              "{1_year}: 被交易给 {2_civ} "),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_DEFECTED",                            "{1_year}: 向 {2_civ} 叛变"),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_RENAMED",                             "{1_year}: 重命名为 {2_name} "),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_FOUNDEDONRUINS",                      "{1_year}: {3_civ}在{4_oldcity}的废墟上重建了{2_city}"),
    ("zh_Hans_CN",  "LOC_AKGC_CITY_HISTORY_UNKNOWN",                             "{1_year}: 未知事件{2_name}"),
    ("zh_Hans_CN",  "LOC_AKGC_ERADROPDOWN_CURRENTERA",                           "当前 {1_year}"),
    ("zh_Hans_CN",  "LOC_AKGC_ENDOFERARANK_NOTIFICATION_HEADER",                 "{1_era} 最伟大的城市"),
    ("zh_Hans_CN",  "LOC_AKGC_ENDOFERARANK_NOTIFICATION_TEXT",                   "{1_person} 完成了一个关于全世界城市的调查，并宣称 {2_civ} {3_city} 是 {4_era} 最伟大的城市。"),
    ("zh_Hans_CN",  "LOC_AKGC_ENDOFERARANK_UNKNOWNWINNER_NOTIFICATION_TEXT",     "{1_person} 完成了一个关于全世界城市的调查，并宣称我们的城市 {2_city} 是 {4_era} 第{3_rank}伟大的城市。"),
    ("zh_Hans_CN",  "LOC_AKGC_UNKNOWN_AUTHOR",                                   "一位无名学者"),
    ("zh_Hans_CN",  "LOC_AKGC_DEFAULTOPTIONS_NOTIFICATION_HEADER",               "最伟大的城市：选项设置提示"),
    ("zh_Hans_CN",  "LOC_AKGC_DEFAULTOPTIONS_NOTIFICATION_TEXT_ON",              "[NEWLINE]你可以点击此处访问选项界面，或点击“最伟大的城市”窗口左上角的齿轮图标。[NEWLINE][NEWLINE]已检测到伟大城市的奖励：[COLOR_GREEN]已启用[ENDCOLOR]时代结束时的奖励。[NEWLINE]"),
    ("zh_Hans_CN",  "LOC_AKGC_DEFAULTOPTIONS_NOTIFICATION_TEXT_OFF",             "[NEWLINE]你可以点击此处访问选项界面，或点击“最伟大的城市”窗口左上角的齿轮图标。[NEWLINE][NEWLINE]未检测到伟大城市的奖励：[COLOR_RED]未启用[ENDCOLOR]时代结束时的奖励。[NEWLINE]"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_GENERAL",                                      "通用设置"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_NumWorldCitiesToShow",                         "显示世界城市的数量"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_NumOwnCitiesToShow",                           "显示帝国内城市的数量"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_IncludeMinors",                                "包含城邦"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowWondersForDiscoveredCities",               "显示奇观"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowBestOfBonusesForDiscoveredCities",         "显示世界之最"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowScoreBreakdownForDiscoveredCities",        "显示分数明细"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowCityDetailsForDiscoveredCities",           "显示城市细节"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowWondersForUndiscoveredCities",             "显示奇观"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowBestOfBonusesForUndiscoveredCities",       "显示世界之最"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowScoreBreakdownForUndiscoveredCities",      "显示分数明细"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowCityDetailsForUndiscoveredCities",         "显示城市细节"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowCapitalForUndiscoveredCities",             "显示首都"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowHolyCityForUndiscoveredCities",            "显示圣城"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowCityNamesForUndiscoveredCities",           "显示名字"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ShowOwnerForUnmetCivs",                        "显示所有者"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_DebugMode",                                    "开启调试模式"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_GrantEndofEraAwards",                          "在每个时代结束时奖励最顶尖的城市"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ForDiscoveredCities",                          "已发现的城市"),
    ("zh_Hans_CN",  "LOC_AKGC_OPT_ForUndiscoverCities",                          "未发现的城市"),
    ("zh_Hans_CN",  "LOC_AKGC_COL_RANK",                                         "排名"),
    ("zh_Hans_CN",  "LOC_AKGC_COL_CITY",                                         "城市"),
    ("zh_Hans_CN",  "LOC_AKGC_COL_POPULATION",                                   "人口"),
    ("zh_Hans_CN",  "LOC_AKGC_COL_SPECIAL",                                      "特殊"),
    ("zh_Hans_CN",  "LOC_AKGC_COL_WONDERS",                                      "奇观"),
    ("zh_Hans_CN",  "LOC_AKGC_BUTTON_OPTIONS_TT",                                "选项"),
    ("zh_Hans_CN",  "LOC_AKGC_BUTTON_SETTINGSRESET",                             "重置"),
    ("zh_Hans_CN",  "LOC_AKGC_BUTTON_SETTINGSSAVE",                              "保存"),
    ("zh_Hans_CN",  "LOC_AKGC_BUTTON_SETTINGSCANCEL",                            "取消");

-- Extended Map Search
--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    ("zh_Hans_CN",  "LOC_MSE_WINDOW_TITLE",                                                 "地图搜索扩展"),
    ("zh_Hans_CN",  "LOC_MSE_BTN_REMOVE_LAST_WORD",                                         "退格"),
    ("zh_Hans_CN",  "LOC_MSE_BTN_REMOVE_LAST_WORD_TT",                                      "删除输入框的最后一个词。"),
    ("zh_Hans_CN",  "LOC_MSE_APPEND",                                                       "追加搜索项目"),
    ("zh_Hans_CN",  "LOC_MSE_APPEND_TT",                                                    "将右侧面板中选择的项目追加至输入框中，取消勾选则会直接替代。"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA",                                                  "搜索满足下列条件的单元格"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA_TT",                                               "只有满足下列勾选条件之一的地块才会被搜索。"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA_ME",                                               "我的领土内"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA_ME_TT",                                            "在我的领土内搜索。"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA_OTHER",                                            "其他人的领土内"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA_OTHER_TT",                                         "在其他人的领土内搜索。"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA_NONE",                                             "无主地块"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA_NONE_TT",                                          "在无主地块上搜索。"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA_PURCHASED_BY_ME",                                  "我的城市附近"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_AREA_PURCHASED_BY_ME_TT",                               "在我的城市的3个单元格内搜索。"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_OPTIONS_BTN",                                           "选项"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_OPTIONS_BTN_TT",                                        "设置地图搜索扩展的选项"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_OPTIONS_WND_TITLE",                                     "地图搜索扩展的选项"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_OPTIONS_COLOR_TITLE",                                   "地块高亮配色"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_OPTIONS_COLOR_FILL",                                    "地块高亮填充颜色"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_OPTIONS_COLOR_BORDER1",                                 "地块高亮边框颜色"),
    ("zh_Hans_CN",  "LOC_MSE_SEARCH_OPTIONS_COLOR_BORDER2",                                 "地块高亮内部阴影颜色"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_BLACK",                                                  "黑"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_BLACK_TRANS",                                            "透明黑"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_WHITE",                                                  "白"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_WHITE_TRANS",                                            "透明白"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_GREY",                                                   "灰"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_GREY_TRANS",                                             "透明灰"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_GREEN",                                                  "绿"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_GREEN_TRANS",                                            "透明绿"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_GREEN_DEFAULT",                                          "默认的绿色"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_BLUE",                                                   "蓝"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_BLUE_TRANS",                                             "透明蓝"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_RED",                                                    "红"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_RED_TRANS",                                              "透明红"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_YELLOW",                                                 "黄"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_YELLOW_TRANS",                                           "透明黄"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_CYAN",                                                   "天蓝"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_CYAN_TRANS",                                             "透明天蓝"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_MAGENTA",                                                "品红"),
    ("zh_Hans_CN",  "LOC_MSE_COLOR_MAGENTA_TRANS",                                          "透明品红"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEL_DEST_SEARCH_TT",                                       "选择的项目将进入搜索项目。单击改为进入过滤项目。"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEL_DEST_FILTER_TT",                                       "选择的项目将进入过滤项目。单击改为进入搜索项目。"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEL_RESOURCE_TT",                                          "显示资源"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEL_CITY_TT",                                              "显示城市"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEL_CIVILIZATION_TT",                                      "显示文明"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEL_IMPROVEMENT_TT",                                       "显示改良设施"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEL_UNIT_TT",                                              "显示单位"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEL_WONDER_TT",                                            "显示奇观"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_WINDOW_TITLE",                                             "选择搜索项目"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_WINDOW_TITLE_FILTER",                                      "选择过滤项目"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEARCH_TERMS_IMPROVEMENT_DOES_NOT_MATCH_RESOURCE_DESC",    "搜索因未正确改良而无法享受收益的资源"),
    ("zh_Hans_CN",  "LOC_MSE_EXT_SEARCH_TERMS_IMPROVEMENT_DOES_NOT_MATCH_RESOURCE",         "未正确改良的资源");

-- Custom Notifications
--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                Text)
values
    ("zh_Hans_CN",  "LOC_CN_BUTTON_TOOLTIP",            "自定义提示"),
    ("zh_Hans_CN",  "LOC_CN_TITLE",                     "自定义提示"),
    ("zh_Hans_CN",  "LOC_CN_CITY_POP_CHECKBOX",         "提示城市人口增长"),
    ("zh_Hans_CN",  "LOC_CN_CITY_BORDER_CHECKBOX",      "提示城市边界扩展"),
    ("zh_Hans_CN",  "LOC_CN_TRADE_DEAL_CHECKBOX",       "提示交易到期"),
    ("zh_Hans_CN",  "LOC_CN_RELIGION_CHECKBOX",         "提示宗教传播"),
    ("zh_Hans_CN",  "LOC_CN_CITY_POP_TITLE",            "城市人口增长"),
    ("zh_Hans_CN",  "LOC_CN_CITY_POP_MESSAGE",          "{1_CN_City_Name} 的人口增长了"),
    ("zh_Hans_CN",  "LOC_CN_CITY_POP_MESSAGE_1",        "村民选择了 {1_CN_City_Name} 作为他们的新家"),
    ("zh_Hans_CN",  "LOC_CN_RELIGION_TITLE",            "宗教传播"),
    ("zh_Hans_CN",  "LOC_CN_RELIGION_MESSAGE",          "{1_CN_Religion_Name} 现在是 {2_CN_City_Name} 的主流宗教了"),
    ("zh_Hans_CN",  "LOC_CN_RELIGION_MESSAGE_1",        "{1_CN_Religion_Name} 不再是 {2_CN_City_Name} 的主流宗教了"),
    ("zh_Hans_CN",  "LOC_CN_CITY_BORDER_TITLE",         "城市边界扩展"),
    ("zh_Hans_CN",  "LOC_CN_CITY_BORDER_MESSAGE",       "{1_CN_City_Name} 城市扩展了他的边界"),
    ("zh_Hans_CN",  "LOC_CN_TRADE_DEAL_TITLE",          "交易到期"),
    ("zh_Hans_CN",  "LOC_CN_TRADE_DEAL_MESSAGE",        "你与 {1_CN_Player_Name} 的交易到期了");

--------------------------------------------------------------------------------------------------------------------------
-- Policy Change Reminder
insert or replace into LocalizedText
    (Language,      Tag,                                Text)
values
    ("zh_Hans_CN",  "LOC_FF16_NEWPOLICY_TITLE",         "你有新的政策卡"),
    ("zh_Hans_CN",  "LOC_FF16_NEWPOLICY_DESC",          "有新的政策卡刚刚解锁。[NEWLINE]这回合改变政策与政体是免费的。[NEWLINE][NEWLINE]是否不修改继续回合？"),
    ("zh_Hans_CN",  "LOC_FF16_NEWPOLICY_CHANGE",        "改变政策"),
    ("zh_Hans_CN",  "LOC_FF16_NEWPOLICY_CONTINUE",      "下一回合");

--------------------------------------------------------------------------------------------------------------------------
-- Fix CN Trans
insert or replace into LocalizedText
    (Language,      Tag,                                        Text)
values
    ("zh_Hans_CN",  "LOC_CIVILIZATION_AYUTTHAYA_NAME",          "阿瑜陀耶"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_AYUTTHAYA_DESCRIPTION",   "阿瑜陀耶城邦");

--------------------------------------------------------------------------------------------------------------------------
-- Great Person Recruited Notification
insert or replace into LocalizedText
    (Language,      Tag,                                                                        Text)
values
    ("zh_Hans_CN",  "LOC_NOTIFICATION_OTHER_PLAYER_RECRUITED_GREATPERSON_MESSAGE",              "伟人被招募"),
    ("zh_Hans_CN",  "LOC_NOTIFICATION_OTHER_PLAYER_RECRUITED_GREATPERSON_SUMMARY",              "{1_recruiter} 已招募了 {2_greatPersonType} {3_greatPersonName}");
