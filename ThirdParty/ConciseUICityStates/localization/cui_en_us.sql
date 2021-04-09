-- =============================================================================
-- CUI Ingame Text - [English] by [eudaimonia]
-- =============================================================================

INSERT OR REPLACE INTO LocalizedText (Language, Tag, Text) VALUES

-- =============================================================================
-- City Panel
("en_US", "LOC_CUI_CP_MANAGE_CITIZENS_TILES",                                   "Manage Citizens and Tiles"),

-- =============================================================================
-- City States Panel
("en_US", "LOC_CUI_CSP_ENVOYS_SUZERAIN",                                        "Envoys Sent: {1_num}, Suzerain of: {2_num}"),

-- =============================================================================
-- Deal Panel
("en_US", "LOC_CUI_DP_GOLD_EDIT_TOOLTIP",                                       "L-Click Add, R-Click Subtract"),
("en_US", "LOC_CUI_DP_THEY_HAVE_ITEM_TOOLTIP",                                  "They already have"),
("en_US", "LOC_CUI_DP_WE_HAVE_ITEM_TOOLTIP",                                    "We already have"),
("en_US", "LOC_CUI_DP_WE_HAVE_ONLY_ONE_TOOLTIP",                                "We only have one"),

-- =============================================================================
-- Diplomatic Banner
("en_US", "LOC_CUI_DB_CITY",                                                    "Cities: {1_num}"),
("en_US", "LOC_CUI_DB_RELIGION",                                                "Religion: {1_name}"),
("en_US", "LOC_CUI_DB_NONE",                                                    "None"),
("en_US", "LOC_CUI_DB_PEACE_DEAL_AVAILABLE",                                    "[Peace Deal is Available]"),
("en_US", "LOC_CUI_DB_PEACE_DEAL_NOT_AVAILABLE",                                "[Peace Deal: {1_Remaining}[ICON_TURN]]"),
("en_US", "LOC_CUI_DB_RELATIONSHIP",                                            "Relationship: {1_Relationship}"),
("en_US", "LOC_CUI_DB_GRIEVANCES_NONE",                                         "No Grievances"),
("en_US", "LOC_CUI_DB_GRIEVANCES",                                              "Grievances: {1_Grievances}"),
("en_US", "LOC_CUI_DB_THEY_CAN_OFFER",                                          "They can offer:"),
("en_US", "LOC_CUI_DB_WE_CAN_OFFER",                                            "We can offer:"),
("en_US", "LOC_CUI_DB_GOLD",                                                    "Gold:"),
("en_US", "LOC_CUI_DB_GOLD_AND_FAVOR",                                          "Gold and Diplomatic Favors:"),
("en_US", "LOC_CUI_DB_SCORE_AND_YIELDS",                                        "Score and Yields:"),
("en_US", "LOC_CUI_DB_MARS_PROJECT",                                            "Mars Colony: {1_progress}  {2_progress}  {3_progress}"),
("en_US", "LOC_CUI_DB_EXOPLANET_EXPEDITION",                                    "Exoplanet Expedition: {1_progress}{2_progress}{3_progress}{4_progress}{5_progress}"),
("en_US", "LOC_CUI_DB_VISITING_TOURISTS",                                       "Visiting Tourists: {1_num} / {2_total}"),
("en_US", "LOC_CUI_DB_CAPITALS_CAPTURED",                                       "Capitals Captured: {1_num}"),
("en_US", "LOC_CUI_DB_CIVS_CONVERTED",                                          "Civilizations Converted: {1_num} / {2_total}"),
("en_US", "LOC_CUI_DB_DIPLOMATIC_POINT",                                        "Diplomatic Victory Point: {1_num} / {2_total}"),

-- =============================================================================
-- Minimap Panel
("en_US", "LOC_CUI_MP_SHOW_DISTRICTS_TOOLTIP",                                  "Show Districts Icons"),
("en_US", "LOC_CUI_MP_SHOW_WONDERS_TOOLTIP",                                    "Show Wonders Icons"),
("en_US", "LOC_CUI_MP_AUTONAMING",                                              "Naming"),
("en_US", "LOC_CUI_MP_AUTONAMING_TOOLTIP",                                      "Auto-naming pins"),
("en_US", "LOC_CUI_MO_SHOW_IMPROVED_RESOURCES",                                 "Show Improved Resource Icons"),
("en_US", "LOC_CUI_MO_TOGGLE_IMPROVED_TOOLTIP",                                 "Toggle Improved Resource Icons"),
("en_US", "LOC_CUI_MO_SHOW_UNIT_FLAGS",                                         "Show Unit Flags"),
("en_US", "LOC_CUI_MP_TOGGLE_UNIT_FLAGS_TOOLTIP",                               "Toggle Unit Flags"),
("en_US", "LOC_CUI_MO_SHOW_CITY_BANNERS",                                       "Show City Banners"),
("en_US", "LOC_CUI_MP_TOGGLE_CITY_BANNERS_TOOLTIP",                             "Toggle City Banners"),
("en_US", "LOC_CUI_MO_SHOW_TRADERS",                                            "Show Traders"),
("en_US", "LOC_CUI_MP_TOGGLE_TRADERS_TOOLTIP",                                  "Toggle Trader Flags"),
("en_US", "LOC_CUI_MO_SHOW_RELIGIONS",                                          "Show Religion Units"),
("en_US", "LOC_CUI_MP_TOGGLE_RELIGIONS_TOOLTIP",                                "Toggle Religion Flags"),

-- =============================================================================
-- SpyInfo
("en_US", "LOC_CUI_SI_SPY_AVAILABLE",                                           "{1_num} [ICON_Unit] {1_num : plural 1?Spy; other?Spies;} available"),
("en_US", "LOC_CUI_SI_SPY_CAPACITY",                                            "{1_num} [ICON_Unit] {1_num : plural 1?Spy; other?Spies;} capacity"),

-- =============================================================================
-- World Tracker
("en_US", "LOC_CUI_WT_GOSSIP_LOG",                                              "Gossip Log"),
("en_US", "LOC_CUI_WT_COMBAT_LOG",                                              "Combat Log"),

-- =============================================================================
-- Production Panel
("en_US", "LOC_CUI_PP_QUEUE_DEFAULT",                                           "Use Queue By Default"),

-- =============================================================================
-- Great Works
("en_US", "LOC_CUI_GW_SORT_BY_CITY",                                            "Sort By City"),
("en_US", "LOC_CUI_GW_SORT_BY_BUILDING",                                        "Sort By Building"),
("en_US", "LOC_CUI_GW_THEMING_HELPER",                                          "Theming Helper"),
("en_US", "LOC_CUI_GW_THEMING_HELPER_TOOLTIP",                                  "Pick three Great Works / Artifacts of the same color and different numbers to complete a theme."),

-- =============================================================================
-- Notes
("en_US", "LOC_CUI_NOTES",                                                      "Notes"),
("en_US", "LOC_CUI_NOTE_LAST_EDIT",                                             "[ Turn: {1_num} ]"),
("en_US", "LOC_CUI_NOTE_EMPTY",                                                 "Empty Note"),

-- =============================================================================
-- Options
("en_US", "LOC_CUI_OPTIONS_TAB_VICTORY",                                        "Victories"),
("en_US", "LOC_CUI_OPTIONS_TAB_LOG",                                            "Logs"),
("en_US", "LOC_CUI_OPTIONS_TAB_POPUP",                                          "Popups"),
("en_US", "LOC_CUI_OPTIONS_TAB_REMIND",                                         "Remind"),
--
("en_US", "LOC_CUI_OPTIONS_DESC_VICTORY",                                       "Please select the victory you want to track."),
("en_US", "LOC_CUI_OPTIONS_DESC_LOG",                                           "Please select where the logs will be displayed."),
("en_US", "LOC_CUI_OPTIONS_DESC_POPUP",                                         "Please select the popups you want to enable."),
("en_US", "LOC_CUI_OPTIONS_DESC_REMIND",                                        "Please select the reminders you want to use."),
("en_US", "LOC_CUI_OPTIONS_DESC_SPEED",                                         "Please select quick combat & movement objects."),
--
("en_US", "LOC_CUI_OPTIONS_LOG_SHOW_NONE",                                      "Disable"),
("en_US", "LOC_CUI_OPTIONS_LOG_DEFAULT",                                        "Default position"),
("en_US", "LOC_CUI_OPTIONS_LOG_WORLDTRACKER",                                   "World Tracker"),
("en_US", "LOC_CUI_OPTIONS_LOG_BOTH",                                           "Both"),
--
("en_US", "LOC_CUI_OPTIONS_POPUP_RESEARCH",                                     "Tech/Civic complete"),
("en_US", "LOC_CUI_OPTIONS_POPUP_AUDIO",                                        "Tech/Civic audio"),
("en_US", "LOC_CUI_OPTIONS_POPUP_ERA_SCORE",                                    "Gain era score"),
("en_US", "LOC_CUI_OPTIONS_POPUP_GREAT_WORK",                                   "Create great works"),
("en_US", "LOC_CUI_OPTIONS_POPUP_RELIC",                                        "Get relics"),
--
("en_US", "LOC_CUI_OPTIONS_REMIND_TECH",                                        "Tech complete by eureka"),
("en_US", "LOC_CUI_OPTIONS_REMIND_CIVIC",                                       "Civic complete by inspire"),
("en_US", "LOC_CUI_OPTIONS_REMIND_GOVERNMENT",                                  "Free government chance"),
("en_US", "LOC_CUI_OPTIONS_REMIND_GOVERNOR",                                    "Governor titles available"),
--
("en_US", "LOC_CUI_OPTIONS_QUICK_COMBAT",                                       "Quick Combat"),
("en_US", "LOC_CUI_OPTIONS_QUICK_MOVEMENT",                                     "Quick Movement"),
("en_US", "LOC_CUI_OPTIONS_SPEED_PLAYER_ONLY",                                  "Player Only"),
("en_US", "LOC_CUI_OPTIONS_SPEED_AI_ONLY",                                      "AI Only"),

-- =============================================================================
-- Screenshot
("en_US", "LOC_CUI_SCREENSHOT_TOOLTIP",                                         "Enter Screenshot Mode[NEWLINE][NEWLINE]Screenshot Mode will hide most or all UI Elements, allows you to take clean screenshots.[NEWLINE][NEWLINE]Left-click hide all UI Elements[NEWLINE]Right-click hide all UI Elements except for City Banners[NEWLINE]Hold ALT to rotate the screen[NEWLINE]Press ESC to exit Screenshot Mode"),

-- =============================================================================
("en_US", "LOC_CUI_COLON", ": ");
-- EOF
