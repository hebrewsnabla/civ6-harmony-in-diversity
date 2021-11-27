--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                             Text)
values
    -- New policies
    ("LOC_POLICY_AGOGE_HD_DESCRIPTION",                                               "+30% production speed toward Ancient and Classical era land military units. +10% for each Encampment District buildings the city has."),
    ("LOC_POLICY_FEUDAL_CONTRACT_HD_DESCRIPTION",                                     "+30% production speed toward Ancient, Classical, Medieval and Renaissance era land military units. +10% for each Encampment District buildings the city has."),
    ("LOC_POLICY_GRANDE_ARMEE_HD_DESCRIPTION",                                        "+30% production speed toward Modern era and earlier land military units. +10% for each Encampment District buildings the city has."),
    ("LOC_POLICY_MILITARY_FIRST_HD_DESCRIPTION",                                      "+30% production speed toward all land military units. +10% for each Encampment District buildings the city has."),
    ("LOC_POLICY_MARITIME_INDUSTRIES_HD_DESCRIPTION",                                 "+50% production speed toward Ancient and Classical era naval units. +10% for each Harbor District buildings the city has."),
    ("LOC_POLICY_PRESS_GANGS_HD_DESCRIPTION",                                         "+50% production speed toward Industrial era and earlier naval units. +10% for each Harbor District buildings the city has."),
    ("LOC_POLICY_INTERNATIONAL_WATERS_HD_DESCRIPTION",                                "+50% production speed toward all naval units, excluding Carriers. +10% for each Harbor District buildings the city has."),
    ("LOC_POLICY_LIGHTNING_WARFARE_HD_DESCRIPTION",                                   "All Heavy and Light Cavalry units get +1 [ICON_Movement] Movement and +5 [ICON_Strength] Combat Strength."),
    ("LOC_POLICY_SOCIAL_STATISTICS_NAME",                                             "Social Statistics"),--xhh
    ("LOC_POLICY_SOCIAL_STATISTICS_DESCRIPTION",                                      "+0.8 [ICON_Science] Science per [ICON_Citizen] Citizen and 0.8 [ICON_Culture] Culture per [ICON_Citizen] Citizen in all cities with at least 3 specialty districts."),--xhh
    ("LOC_POLICY_PLUTONOMY_NAME",                                                     "Plutonomy"),--xhh
    ("LOC_POLICY_PLUTONOMY_DESCRIPTION",                                              "+10% [ICON_GOLD] Gold in all cities with a Theater district. +5% [ICON_Production] Production in all cities with a Campus district."),--xhh
    ("LOC_POLICY_PHILOSOPHY_EDUCATION_NAME",                                          "Philosophy Education"),--xhh
    ("LOC_POLICY_PHILOSOPHY_EDUCATION_DESCRIPTION",                                   "+25% [ICON_GreatPerson] Great Person points in all cities with a World Wonder."),--xhh
    ("LOC_POLICY_PURITAN_NAME",                                                       "Puritan"),--xhh
    ("LOC_POLICY_PURITAN_DESCRIPTION",                                                "+15% [ICON_GOLD] Gold and 15% [ICON_Production] Production in all cities with a Worship Building."),--xhh
    ("LOC_POLICY_SCIENTIFIC_EXPEDITIONS_NAME",                                        "Scientific Expeditions"),--xhh
    ("LOC_POLICY_SCIENTIFIC_EXPEDITIONS_DESCRIPTION",                                 "+15% [ICON_SCIENCE] Science in all foreign cities with a Commercial Hub district. +15% [ICON_CULTURE] Culture in all foreign cities with a Harbor district."),--xhh
    -- 政策卡改名
    ("LOC_POLICY_GRAND_OPERA_NAME",                                                   "Pedagogy"),--xhh
    ("LOC_POLICY_EXPROPRIATION_NAME",                                                 "Public Health"),--xhh
    ("LOC_POLICY_FIVE_YEAR_PLAN_NAME",                                                "The Ivy League"),--xhh
    ("LOC_POLICY_COLLECTIVIZATION_NAME",                                              "Highway"),--xhh
    ("LOC_POLICY_BASTIONS_NAME",                                                      "Fortifications"),--xhh
    ("LOC_POLICY_LOGISTICS_NAME",                                                     "Supply Lines"),--xhh
    ("LOC_POLICY_COLLECTIVE_ACTIVISM_NAME",                                           "Non-Aligned Movement"),--xhh
    ("LOC_POLICY_LITERARY_TRADITION_NAME",                                            "Collect Ballads"),--xhh
    -- Golden age
    ("LOC_MOMENT_CATEGORY_INFRASTRUCTURE_BONUS_GOLDEN_AGE",                           "Monumentality Golden Age:[NEWLINE]+2 [ICON_Movement] Movement for all Builders and Settlers. Builders and Settlers are 20% cheaper to purchase with [ICON_GOLD] Gold. They are also 20% cheaper to purchase with [ICON_FAITH] Faith if purchase with [ICON_FAITH] Faith is allowed."),
    ("LOC_MOMENT_CATEGORY_CULTURAL_BONUS_GOLDEN_AGE",                                 "Pen, Brush, and Voice Golden Age:[NEWLINE][ICON_CivicBoosted] Inspirations provide an additional 10% of civic costs. Each city receives +2 [ICON_Culture] Culture for each specialty district "),
    ("LOC_MOMENT_CATEGORY_INDUSTRIAL_BONUS_GOLDEN_AGE",                               "Heartbeat of Steam Golden Age:[NEWLINE]+10% [ICON_Production] Production toward Industrial era and later wonders. Campus district's [ICON_SCIENCE] Science adjacency bonus provides [ICON_PRODUCTION] Production as well. Industrial zone district's [ICON_PRODUCTION] Production adjacency bonus provides [ICON_SCIENCE] Science as well."),
    ("LOC_MOMENT_CATEGORY_MILITARY_BONUS_GOLDEN_AGE",                                 "To Arms! Golden Age:[NEWLINE]Unlock a special Casus Belli which generates 75% less [ICON_STAT_GRIEVANCE] Grievances than Formal War and can be used immediately after Denouncing the target. +30% [ICON_Production] Production towards military units."),
    ("LOC_MOMENT_CATEGORY_TOURISM_BONUS_GOLDEN_AGE",                                  "Wish You Were Here Golden Age:[NEWLINE]Cities receive +100%  [ICON_Tourism] Tourism from World Wonders. +100%  [ICON_Tourism] Tourism to all National Parks."),
    -- 黑暗卡
    ("LOC_POLICY_TWILIGHT_VALOR_DESCRIPTION",                                         "+5 [ICON_Strength] Combat Strength for all melee attack units. +5 Loyalty per turn for cities with a garrisoned unit.[NEWLINE]BUT: Units cannot heal outside your territory."),
    ("LOC_POLICY_ISOLATIONISM_DESCRIPTION",                                           "Domestic routes provide +3 [ICON_Food] Food and +3 [ICON_Production] Production.[NEWLINE]BUT: Can't train or buy Settlers nor settle new cities. Can't train or buy Builders."),
    ("LOC_POLICY_WONDERS_MISLEAD_COUNTRY_NAME",                                       "Wonder Misleads the Country"),
    ("LOC_POLICY_WONDERS_MISLEAD_COUNTRY_DESCRIPTION",                                "+20% [ICON_Production] Production toward Renaissance, Medieval, Classical, and Ancient wonders.[NEWLINE]BUT: Your cities yield -50% [ICON_GOLD] Gold."),
    -- Govs: TODO: swap the inherent and accumulate
    ("LOC_GOVT_INHERENT_BONUS_AUTOCRACY_ETHIOPIA",                                    "+2 to all yields for each building inside Government Plaza, building inside Diplomatic Quarter and palace in a city."),
    ("LOC_GOVT_INHERENT_BONUS_AUTOCRACY_XP1",                                         "+2 to all yields for each building inside Government Plaza and palace in a city."),
        -- Tier 2
    ("LOC_GOVT_INHERENT_BONUS_MONARCHY_XP1",                                          "Increases the city growth rate by +10%. +10% [ICON_GOLD] Gold for cities with a garrisoned unit."),
    ("LOC_GOVT_ACCUMULATED_BONUS_BRIEF_MONARCHY_XP1",                                 "+50% Influence Points. +20% [ICON_Production] Production toward units for cities with a garrisoned unit."),
    ("LOC_GOVT_INHERENT_BONUS_MERCHREP_XP1",                                          "+20% [ICON_GOLD] Gold in all cities with an established [ICON_Governor] Governor. +20% Production toward Districts."),
    ("LOC_GOVT_ACCUMULATED_BONUS_BRIEF_MERCHREP_XP1",                                 "Reduces the cost of purchasing a tile by 20%."),
    ("LOC_GOVT_INHERENT_BONUS_THEOCRACY_XP1",                                         "+5 [ICON_Religion] Religious Strength in Theological Combat. Gains +1 [ICON_Faith] Faith from each follower of the Religion that is established as majority in your civilization."),
    ("LOC_GOVT_ACCUMULATED_BONUS_BRIEF_THEOCRACY_XP1",                                "15% Discount on Purchases with [ICON_Faith] Faith. Enable purchase land military units with [ICON_Faith] Faith in cities that has Holy Site."),
        -- Tier 3
    ("LOC_GOVT_INHERENT_BONUS_DEMOCRACY_XP2",                                         "Your [ICON_TradeRoute] Trade Routes to an Ally's city or vassal city-states provide +4 [ICON_Food] Food and +4 [ICON_Production] Production for both cities. Alliance Points with all Allies increase by an additional .25 per turn. Allows city to purchase districts with [ICON_Gold] Gold."),
    ("LOC_GOVT_ACCUMULATED_BONUS_BRIEF_DEMOCRACY_XP1",                                "25% Discount on Purchases with [ICON_Gold] Gold."),
    ("LOC_GOVT_INHERENT_BONUS_COMMUNISM_XP1",                                         "+2 [ICON_Production] Production per [ICON_Citizen] Citizen in cities."),
    ("LOC_GOVT_ACCUMULATED_BONUS_BRIEF_COMMUNISM_XP2",                                "+15% [ICON_Science] Science."),
    -- Policies
    ("LOC_POLICY_GOD_KING_DESCRIPTION",                                               "+2 [ICON_Faith] Faith in the [ICON_Capital] Capital."),
    ("LOC_POLICY_COLLECTIVIZATION_DESCRIPTION_XP2",                                   "+4 [ICON_Production] Production and +4 [ICON_Food] Food from domestic [ICON_TradeRoute] Trade Routes."),
    ("LOC_POLICY_DISCIPLINE_DESCRIPTION",                                             "+10 [ICON_Strength] Unit Combat Strength when fighting Barbarians."),
    ("LOC_POLICY_MACHIAVELLIANISM_DESCRIPTION",                                       "+100% [ICON_Production] Production toward Spies."),
    ("LOC_POLICY_NAVIGATION_DESCRIPTION",                                             "+4 [ICON_GreatAdmiral] Great Admiral points per turn. +4 [ICON_GreatAdmiral] Great Admiral points per turn for every Lighthouse."),
    ("LOC_POLICY_TRAVELING_MERCHANTS_DESCRIPTION",                                    "+4 [ICON_GreatMerchant] Great Merchant points per turn. +4 [ICON_GreatMerchant] Great Merchant points per turn for every Market."),
    ("LOC_POLICY_ILKUM_DESCRIPTION",                                                  "+50% [ICON_Production] Production toward Builders."),
    ("LOC_POLICY_SERFDOM_DESCRIPTION",                                                "+50% [ICON_Production] Production toward Builders. Newly trained Builders gain 1 extra build charge."),
    ("LOC_POLICY_PUBLIC_WORKS_DESCRIPTION",                                           "+50% [ICON_Production] Production toward Builders, and newly trained Builders gain 2 extra build actions."),
    ("LOC_POLICY_LIMITANEI_DESCRIPTION",                                              "+5 Loyalty per turn for cities with a garrisoned unit."),
    ("LOC_POLICY_INSULAE_DESCRIPTION",                                                "+2 [ICON_Housing] Housing in all cities with at least 2 Specialty districts."),
    ("LOC_POLICY_CIVIL_PRESTIGE_DESCRIPTION",                                         "Established [ICON_GOVERNOR] Governors with at least 2 Promotions provide +1 [ICON_Amenities] Amenity and +3 [ICON_Housing] Housing."),
    ("LOC_POLICY_MEDINA_QUARTER_DESCRIPTION",                                         "+4 [ICON_Housing] Housing in all cities with at least 3 specialty districts."),
    ("LOC_POLICY_DIPLOMATIC_LEAGUE_DESCRIPTION",                                      "Regardless of having Diplomatic Quarter or not, the first [ICON_Envoy] Envoy you send to each city-state counts as two [ICON_Envoy] Envoys."),
    ("LOC_POLICY_PRAETORIUM_DESCRIPTION",                                             "[ICON_Governor] Governors provide +5 Loyalty per turn to their city."),
    ("LOC_POLICY_CHARISMATIC_LEADER_ETHIOPIA_DESCRIPTION",                            "Open Borders with all city-states. +3 Influence points per turn and +1 Influence point per turn for Diplomatic Quarter, Consulate and Chancery."),
    ("LOC_POLICY_DIPLOMATIC_LEAGUE_ETHIOPIA_DESCRIPTION",                             "Open Borders with all city-states. +3 Influence points per turn and +2 Influence points per turn for Diplomatic Quarter, Consulate and Chancery."),
    ("LOC_POLICY_GUNBOAT_DIPLOMACY_ETHIOPIA_DESCRIPTION",                             "Open Borders with all city-states. +3 Influence points per turn and +3 Influence points per turn for Diplomatic Quarter, Consulate and Chancery."),
    ("LOC_POLICY_CHARISMATIC_LEADER_DESCRIPTION",                                     "Open Borders with all city-states. +3 Influence points per turn."),
    ("LOC_POLICY_DIPLOMATIC_LEAGUE_DESCRIPTION",                                      "Open Borders with all city-states. +6 Influence points per turn."),
    ("LOC_POLICY_GUNBOAT_DIPLOMACY_DESCRIPTION",                                      "Open Borders with all city-states. +9 Influence points per turn."),
    ("LOC_POLICY_NATIONAL_IDENTITY_DESCRIPTION",                                      "Units ignore [ICON_Strength] Combat Strength reduction from being injured.+5 [ICON_Strength] Combat Strength when attacking wounded units."),
    ("LOC_POLICY_FREELANCERS_NAME",                                                   "Freelancers"),
    ("LOC_POLICY_MARITIME_INFRASTRUCTURE_NAME",                                       "Maritime Infrastructure"),
    ("LOC_POLICY_SEABORNE_SUPPLY_NAME",                                               "Seaborne Supply"),
    ("LOC_POLICY_GARRISON_RECLAMATION_NAME",                                          "Garrison Reclamation"),
    ("LOC_POLICY_MINARET_NAME",                                                       "Minaret"),
    ("LOC_POLICY_PRIMITIVE_COMMUNE_NAME",                                             "Primitive Commune"),
    ("LOC_POLICY_OVERALL_PLANNING_NAME",                                              "Overall Planning"),
    ("LOC_POLICY_BARD_NAME",                                                          "Bards"),
    ("LOC_POLICY_CIVILIZE_NAME",                                                      "Oral Tradition"),
    ("LOC_POLICY_DOMESTIC_TRADE_NAME",                                                "Domestic Trade"),
    ("LOC_POLICY_HIGHWAY_NAME",                                                       "Highway"),
    ("LOC_POLICY_SILK_ROAD_NAME",                                                     "Silk Road"),
    ("LOC_POLICY_WAREHOUSE_NAME",                                                     "Artisan Office"),
    ("LOC_POLICY_SAFETY_BOX_NAME",                                                    "Commune"),
    ("LOC_POLICY_WALL_HOUSING_NAME",                                                  "Feoff"),
    ("LOC_POLICY_ARENA_TICKETS_NAME",                                                 "Arena Tickets"),
    ("LOC_POLICY_WRESTING_AND_MANEUVERS_NAME",                                        "Wrestling and Maneuvers"),
    ("LOC_POLICY_CITY_CENTRALIZATION_NAME",                                           "City Centralization"),
    ("LOC_POLICY_CONSTRUCTION_CROPS_NAME",                                            "Production and Construction Crops"),
    ("LOC_POLICY_DRILL_NAME",                                                         "Drill"),
    ("LOC_POLICY_TRIBUTE_TRADE_NAME",                                                 "Tribute Trade"),
    ("LOC_POLICY_FREELANCERS_DESCRIPTION",                                            "+5 [ICON_Gold] Gold for cities with a garrisoned unit."),
    ("LOC_POLICY_MARITIME_INFRASTRUCTURE_DESCRIPTION",                                "+2 [ICON_Production] Production to all cities adjacent to coasts or lakes."),
    ("LOC_POLICY_SEABORNE_SUPPLY_DESCRIPTION",                                        "+4 [ICON_Production] Production to all cities adjacent to coasts or lakes."),
    ("LOC_POLICY_GARRISON_RECLAMATION_DESCRIPTION",                                   "+4 [ICON_Food] Food and +2 [ICON_Housing] in all cities having Encampments."),
    ("LOC_POLICY_PRIMITIVE_COMMUNE_DESCRIPTION",                                      "+1 [ICON_Food] Food in all cities."),
    ("LOC_POLICY_OVERALL_PLANNING_DESCRIPTION",                                       "Regional effects from your Industrial Zone, Water Park, and Entertainment Complex districts reach 3 tiles farther."),
    ("LOC_POLICY_BARD_DESCRIPTION",                                                   "+1 [ICON_CULTURE] Culture in all cities."),
    ("LOC_POLICY_CIVILIZE_DESCRIPTION",                                               "+1 [ICON_SCIENCE] Science in all cities."),
    ("LOC_POLICY_CARAVANSARIES_DESCRIPTION",                                          "+2 [ICON_Gold] Gold in all cities."),
    ("LOC_POLICY_DOMESTIC_TRADE_DESCRIPTION",                                         "+1 [ICON_Food] Food and +1 [ICON_Production] Production from all domestic [ICON_TradeRoute] Trade Routes."),
    ("LOC_POLICY_HIGHWAY_DESCRIPTION",                                                "+2 [ICON_Food] Food and +2 [ICON_Production] Production from all domestic [ICON_TradeRoute] Trade Routes."),
    ("LOC_POLICY_SILK_ROAD_DESCRIPTION",                                              "+2 [ICON_Culture] Culture and +2 [ICON_Science] Science from all international [ICON_TradeRoute] Trade Routes."),
    ("LOC_POLICY_MARKET_ECONOMY_DESCRIPTION",                                         "Your international [ICON_TradeRoute] Trade Routes provide +1 [ICON_Gold] Gold per Luxury and Strategic resource improved at the destination, as well as +3 [ICON_Culture] Culture and +3 [ICON_Science] Science."),
    ("LOC_POLICY_WAREHOUSE_DESCRIPTION",                                              "+2 [ICON_Production] Production for Commercial Hubs."),
    ("LOC_POLICY_SAFETY_BOX_DESCRIPTION",                                             "+4 [ICON_Production] Production for Commercial Hubs."),
    ("LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_MINARET_CHAPTER_HISTORY_PARA_1",              "TBD Minaret paragraph 1"),
    ("LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_MINARET_CHAPTER_HISTORY_PARA_2",              "TBD Minaret paragraph 2"),
    ("LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_SHAMAN_CHAPTER_HISTORY_PARA_1",               "TBD Shaman paragraph 1"),
    ("LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_PRIMITIVE_COMMUNE_CHAPTER_HISTORY_PARA_1",    "TBD Primitive commune paragraph 1"),
    ("LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_BARD_CHAPTER_HISTORY_PARA_1",                 "TBD One more culture paragraph 1"),
    ("LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_CIVILIZE_CHAPTER_HISTORY_PARA_1",             "TBD One more science paragraph 1"),
    ("LOC_POLICY_RATIONALISM_DESCRIPTION",                                            "Regional effects from Campus district reach 3 tiles farther. Universties generate 0.3 [ICON_SCIENCE] Science and Research Labs generate 0.5 [ICON_SCIENCE] Science per [ICON_Citizen] citizen in the city."),
    ("LOC_POLICY_FREE_MARKET_DESCRIPTION",                                            "Regional effects from Commercial Hub district reach 3 tiles farther. Banks generate 0.6 [ICON_GOLD] Gold and Stock Exchanges generate 1 [ICON_GOLD] gold per [ICON_Citizen] citizen in the city."),
    ("LOC_POLICY_GRAND_OPERA_DESCRIPTION",                                            "Regional effects from Theater district reach 3 tiles farther. Art Museums or Archaeological Museums generate 0.3 [ICON_CULTURE] Culture and Broadcast Centers generate 0.5 [ICON_CULTURE] Culture per [ICON_Citizen] citizen in the city."),
    ("LOC_POLICY_MINARET_DESCRIPTION",                                                "Temples generate 0.3 [ICON_FAITH] Faith and Worship Buildings generate 0.5 [ICON_FAITH] Faith per [ICON_Citizen] citizen in the city."),
    ("LOC_POLICY_SCRIPTURE_DESCRIPTION",                                              "+50% Holy Site district adjacency bonuses."),
    ("LOC_POLICY_SIMULTANEUM_DL_DESCRIPTION",                                         "+100% Holy Site district adjacency bonuses."),
    ("LOC_POLICY_RAID_DL_DESCRIPTION",                                                "Yields gained from pillaging and coastal raids are +100%."),
    ("LOC_POLICY_TOTAL_WAR_DL_DESCRIPTION",                                           "Yields gained from pillaging, coastal raids, and plundering [ICON_TradeRoute] Trade Routes are +200%."),
    ("LOC_POLICY_EQUESTRIAN_ORDERS_DL_DESCRIPTION",                                   "All improved [ICON_RESOURCE_HORSES] Horses and [ICON_RESOURCE_IRON] Iron resources yield 2 additional resource per turn."),
    ("LOC_POLICY_DRILL_MANUALS_DL_DESCRIPTION",                                       "All improved [ICON_RESOURCE_NITER] Niter and [ICON_RESOURCE_COAL] Coal resources yield 2 additional resource per turn."),
    ("LOC_POLICY_RESOURCE_MANAGEMENT_DL_DESCRIPTION",                                 "All improved [ICON_RESOURCE_ALUMINUM] Aluminum and [ICON_RESOURCE_OIL] Oil resources yield 2 additional resource per turn."),
    ("LOC_POLICY_PRESS_GANGS_DESCRIPTION",                                            "+60% [ICON_Production] Production toward Industrial era and earlier naval units."),
    ("LOC_POLICY_MARITIME_INDUSTRIES_DESCRIPTION",                                    "+60% [ICON_Production] Production toward Ancient and Classical era naval units."),
    ("LOC_POLICY_CHIVALRY_DESCRIPTION",                                               "+30% [ICON_Production] Production toward Industrial era and earlier heavy and light cavalry units."),
    ("LOC_POLICY_MANEUVER_DESCRIPTION",                                               "+30% [ICON_Production] Production toward Ancient and Classical era heavy and light cavalry units."),
    ("LOC_POLICY_FEUDAL_CONTRACT_DESCRIPTION",                                        "+30% [ICON_Production] Production toward Ancient, Classical, Medieval, and Renaissance era melee, anti-cavalry, and ranged units."),
    ("LOC_POLICY_AGOGE_DESCRIPTION",                                                  "+30% [ICON_Production] Production toward Ancient and Classical era melee, anti-cavalry, and ranged units."),
    ("LOC_POLICY_WISSELBANKEN_DESCRIPTION",                                           "Your [ICON_TradeRoute] Trade Routes to an Ally's city or vassal city-state provide +2 [ICON_Food] Food and +2 [ICON_Production] Production for both cities. Alliance Points with all allies increase by an additional 0.5 per turn."),
    ("LOC_POLICY_PUBLIC_TRANSPORT_DESCRIPTION_XP2",                                   "Neighborhoods with Charming appeal receive +3 Food [ICON_Food] and +1 Production [ICON_Production], Breathtaking Neighborhoods receive double yields. All Neighborhoods receive +1 [ICON_Gold] Gold."),
    ("LOC_POLICY_WALL_HOUSING_DESCRIPTION",                                           "+2 [ICON_Housing] Housing per level of Walls."),
    ("LOC_POLICY_ARENA_TICKETS_DESCRIPTION",                                          "Each Entertainment_Complex +6 [ICON_GOLD] Gold and each Arena +10 [ICON_GOLD] Gold."),
    ("LOC_POLICY_WRESTING_AND_MANEUVERS_DESCRIPTION",                                 "If the city [ICON_CITIZEN] population is 8 or higher, Arenas gain +2 [ICON_Amenities] Amenities (4 tile regional effects)."),
    ("LOC_POLICY_AFTER_ACTION_REPORTS_DESCRIPTION",                                   "All units gain +100% combat experience."),
    ("LOC_POLICY_COLONIAL_OFFICES_DESCRIPTION",                                       "+1 [ICON_Food] Food, +15% growth rate and +3 Loyalty per turn for cities not on your original [ICON_Capital] Capital's continent."),
    ("LOC_POLICY_CITY_CENTRALIZATION_DESCRIPTION",                                    "+1 [ICON_Food] Food, +1 [ICON_Production] Production, +1 [ICON_SCIENCE] Science, +1 [ICON_CULTURE] Culture, +1 [ICON_Faith] Faith and +2 [ICON_Gold] Gold in all cities."),
    ("LOC_POLICY_CONSTRUCTION_CROPS_DESCRIPTION",                                     "+4 [ICON_Food] Food and +2 [ICON_Housing] in all cities having Encampments. +2 [ICON_Housing] Housing per level of Walls."),
    ("LOC_POLICY_DRILL_DESCRIPTION",                                                  "All units gain +50% combat experience."),
    ("LOC_POLICY_TRIBUTE_TRADE_DESCRIPTION",                                          "+2 Influence points per turn for Commercial Hubs. Your [ICON_TradeRoute] Trade Routes to a vassal city-state provide +2 [ICON_GOLD] Gold.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                             Text)
values
    -- 新政策卡
    ("zh_Hans_CN",  "LOC_POLICY_AGOGE_HD_DESCRIPTION",                                               "生产远古和古典时代的陆地军事单位加速+30%，城市每有一级军营建筑多10%。"),
    ("zh_Hans_CN",  "LOC_POLICY_FEUDAL_CONTRACT_HD_DESCRIPTION",                                     "生产远古、古典、中世纪和文艺复兴时代的陆地军事单位加速+30%，城市每有一级军营建筑多10%。"),
    ("zh_Hans_CN",  "LOC_POLICY_GRANDE_ARMEE_HD_DESCRIPTION",                                        "生产现代及更早时代的陆地军事单位加速+30%，城市每有一级军营建筑多10%。"),
    ("zh_Hans_CN",  "LOC_POLICY_MILITARY_FIRST_HD_DESCRIPTION",                                      "生产所有陆地军事单位加速+30%，城市每有一级军营建筑多10%。"),
    ("zh_Hans_CN",  "LOC_POLICY_MARITIME_INDUSTRIES_HD_DESCRIPTION",                                 "生产远古和古典时代的海军单位加速+50%，城市每有一级港口建筑多10%。"),
    ("zh_Hans_CN",  "LOC_POLICY_PRESS_GANGS_HD_DESCRIPTION",                                         "生产工业及更早时代的海军单位加速+50%，城市每有一级港口建筑多10%。"),
    ("zh_Hans_CN",  "LOC_POLICY_INTERNATIONAL_WATERS_HD_DESCRIPTION",                                "生产除航空母舰外的所有海军单位加速+50%，城市每有一级港口建筑多10%。"),
    ("zh_Hans_CN",  "LOC_POLICY_LIGHTNING_WARFARE_HD_DESCRIPTION",                                   "所有轻骑兵和重骑兵+1 [ICON_Movement] 移动力且+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_POLICY_SOCIAL_STATISTICS_NAME",                                             "社会统计学"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_SOCIAL_STATISTICS_DESCRIPTION",                                      "所有拥有至少3个专业化区域的城市每位 [ICON_Citizen] 公民将提供0.8点 [ICON_Science] 科技值和0.8点 [ICON_Culture] 文化值。"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_PLUTONOMY_NAME",                                                     "政治经济学"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_PLUTONOMY_DESCRIPTION",                                              "拥有剧院的城市+10% [ICON_GOLD] 金币，拥有学院的城市+5% [ICON_Production] 生产力。"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_PHILOSOPHY_EDUCATION_NAME",                                          "哲学教育"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_PHILOSOPHY_EDUCATION_DESCRIPTION",                                   "拥有奇观的城市+25% [ICON_GreatPerson] 伟人点。"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_PURITAN_NAME",                                                       "清教"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_PURITAN_DESCRIPTION",                                                "拥有祭祀建筑的城市+15% [ICON_GOLD] 金币和15% [ICON_Production] 生产力。"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_SCIENTIFIC_EXPEDITIONS_NAME",                                        "科学考察队"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_SCIENTIFIC_EXPEDITIONS_DESCRIPTION",                                 "拥有商业中心的外大陆城市+15% [ICON_SCIENCE] 科技值，拥有港口的外大陆城市+15% [ICON_CULTURE] 文化值。"),--xhh
    -- 政策卡改名
    ("zh_Hans_CN",  "LOC_POLICY_GRAND_OPERA_NAME",                                                   "教育学"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_EXPROPRIATION_NAME",                                                 "公共卫生"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_FIVE_YEAR_PLAN_NAME",                                                "常春藤联盟"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_COLLECTIVIZATION_NAME",                                              "高速公路"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_BASTIONS_NAME",                                                      "工事"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_LOGISTICS_NAME",                                                     "交通线"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_COLLECTIVE_ACTIVISM_NAME",                                           "不结盟运动"),--xhh
    ("zh_Hans_CN",  "LOC_POLICY_LITERARY_TRADITION_NAME",                                            "采风"),--xhh
    -- 着力点
    ("zh_Hans_CN",  "LOC_MOMENT_CATEGORY_INFRASTRUCTURE_BONUS_GOLDEN_AGE",                           "“雄伟壮丽”黄金时代：[NEWLINE]所有建造者和开拓者+2 [ICON_Movement] 移动力。用 [ICON_GOLD] 金币购买建造者和开拓者的费用降低20%。若可用 [ICON_FAITH] 信仰值购买建造者或开拓者，则其购买费用也降低20%。"),
    ("zh_Hans_CN",  "LOC_MOMENT_CATEGORY_CULTURAL_BONUS_GOLDEN_AGE",                                 "“百花齐放”黄金时代：[NEWLINE][ICON_CivicBoosted]鼓舞额外提供10%的市政开销。城市每拥有1处特色区域，则+2 [ICON_Culture] 文化值。"),
    ("zh_Hans_CN",  "LOC_MOMENT_CATEGORY_INDUSTRIAL_BONUS_GOLDEN_AGE",                               "“滚滚蒸汽”黄金时代：[NEWLINE]建造后工业时代的奇观时+10% [ICON_Production] 生产力。学院区域的 [ICON_SCIENCE] 科技值相邻加成也可提供 [ICON_PRODUCTION] 生产力。工业区域的 [ICON_PRODUCTION] 生产力相邻加成也可提供 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_MOMENT_CATEGORY_MILITARY_BONUS_GOLDEN_AGE",                                 "“全民皆兵”黄金时代：[NEWLINE]解锁特殊战争借口，谴责目标后可立即宣战，[ICON_STAT_GRIEVANCE] 不满-75%。生产军事单位时+30% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_MOMENT_CATEGORY_TOURISM_BONUS_GOLDEN_AGE",                                  "“愿你在此”黄金时代：[NEWLINE]世界奇观产出的 [ICON_Tourism] 旅游业绩+100%。国家公园产出的 [ICON_Tourism] 旅游业绩+100%。"),
    -- 黑暗卡
    ("zh_Hans_CN",  "LOC_POLICY_TWILIGHT_VALOR_DESCRIPTION",                                         "所有近战攻击单位+5 [ICON_Strength] 战斗力。拥有驻军单位的城市每回合的忠诚度+5。[NEWLINE]但无法在本国领土外进行治疗。"),
    ("zh_Hans_CN",  "LOC_POLICY_ISOLATIONISM_DESCRIPTION",                                           "国内贸易路线提供+3 [ICON_Food] 食物、+3 [ICON_Production] 生产力。[NEWLINE]但无法生产或购买开拓者和建造者，也无法建立新城市。"),
    ("zh_Hans_CN",  "LOC_POLICY_WONDERS_MISLEAD_COUNTRY_NAME",                                       "奇观误国"),
    ("zh_Hans_CN",  "LOC_POLICY_WONDERS_MISLEAD_COUNTRY_DESCRIPTION",                                "建造远古、古典、中世纪和文艺复兴时代的奇观时+20% [ICON_Production] 生产力。[NEWLINE]但所有城市的 [ICON_GOLD] 金币产出减少50%。"),
    -- 政体
    ("zh_Hans_CN",  "LOC_GOVT_INHERENT_BONUS_AUTOCRACY_ETHIOPIA",                                    "城市中每有一座宫殿、市政广场中的建筑、外交区中的建筑，便+2所有产出。"),
    ("zh_Hans_CN",  "LOC_GOVT_INHERENT_BONUS_AUTOCRACY_XP1",                                         "城市中每有一座宫殿、市政广场中的建筑，便+2所有产出。"),
        -- Tier 2
    ("zh_Hans_CN",  "LOC_GOVT_INHERENT_BONUS_MONARCHY_XP1",                                          "拥有驻军单位的城市获得以下效果：人口增长速度+10%；城市产出的 [ICON_GOLD] 金币+10%。"),
    ("zh_Hans_CN",  "LOC_GOVT_ACCUMULATED_BONUS_BRIEF_MONARCHY_XP1",                                 "+50%影响力点数。拥有驻军单位的城市生产单位时+20% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_GOVT_INHERENT_BONUS_MERCHREP_XP1",                                          "所有 [ICON_Governor] 总督就职城市产出的 [ICON_GOLD] 金币+20%。建造区域时+20%生产力。"),
    ("zh_Hans_CN",  "LOC_GOVT_ACCUMULATED_BONUS_BRIEF_MERCHREP_XP1",                                 "购买一个单元格的费用降低20%。"),
    ("zh_Hans_CN",  "LOC_GOVT_INHERENT_BONUS_THEOCRACY_XP1",                                         "神学战争中+5 [ICON_Religion] 宗教战斗力。每个人口产出1 [ICON_Faith] 信仰。"), -- 从已成为多数城市信仰的宗教中获得信仰值，每个信仰该宗教的人口+1 [Icon_Faith] 信仰值
    ("zh_Hans_CN",  "LOC_GOVT_ACCUMULATED_BONUS_BRIEF_THEOCRACY_XP1",                                "使用 [ICON_Faith] 信仰值购买可享受15%折扣。可使用信仰在拥有圣地的城市购买陆地军事单位。"),
        -- Tier 3
    ("zh_Hans_CN",  "LOC_GOVT_INHERENT_BONUS_DEMOCRACY_XP2",                                         "您通往盟友或宗主国城市的 [ICON_TradeRoute] 贸易路线为双边城市+4 [ICON_Food] 食物、+4 [ICON_Production] 生产力。所有盟友的同盟点数每回合额外增加0.25点。城市可使用 [ICON_Gold] 金币购买区域。"),
    ("zh_Hans_CN",  "LOC_GOVT_ACCUMULATED_BONUS_BRIEF_DEMOCRACY_XP1",                                "使用 [ICON_Gold] 金币购买时费用-25%。"),
    ("zh_Hans_CN",  "LOC_GOVT_INHERENT_BONUS_COMMUNISM_XP1",                                         "城市中每位 [ICON_Citizen] 公民将提供2点 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_GOVT_ACCUMULATED_BONUS_BRIEF_COMMUNISM_XP2",                                "+15% [ICON_Science] 科技值。"),
    -- 政策卡
    ("zh_Hans_CN",  "LOC_POLICY_GOD_KING_DESCRIPTION",                                               "[ICON_Capital] 首都+2 [ICON_Faith] 信仰值。"),
    ("zh_Hans_CN",  "LOC_POLICY_COLLECTIVIZATION_DESCRIPTION_XP2",                                   "国内贸易路线提供的 [ICON_Production] 生产力+4、[ICON_Food] 食物+4。"),
    ("zh_Hans_CN",  "LOC_POLICY_DISCIPLINE_DESCRIPTION",                                             "同蛮族战斗时，+10 [ICON_Strength] 单位战斗力。"),
    ("zh_Hans_CN",  "LOC_POLICY_MACHIAVELLIANISM_DESCRIPTION",                                       "为生产间谍+100% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_POLICY_NAVIGATION_DESCRIPTION",                                             "每回合+4 [ICON_GreatAdmiral] 海军统帅点数。每有一座灯塔，每回合的 [ICON_GreatAdmiral] 海军统帅点数便+4。"),
    ("zh_Hans_CN",  "LOC_POLICY_TRAVELING_MERCHANTS_DESCRIPTION",                                    "每回合+4 [ICON_GreatMerchant] 大商人点数。每有一座市场，每回合的 [ICON_GreatMerchant] 大商人点数便+4。"),
    ("zh_Hans_CN",  "LOC_POLICY_ILKUM_DESCRIPTION",                                                  "为生产建造者+50% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_POLICY_SERFDOM_DESCRIPTION",                                                "为生产建造者+50% [ICON_Production] 生产力，新训练的建造者获得一点额外劳动力。"),
    ("zh_Hans_CN",  "LOC_POLICY_PUBLIC_WORKS_DESCRIPTION",                                           "为生产建造者+50% [ICON_Production] 生产力，新训练的建造者获得两点额外劳动力。"),
    ("zh_Hans_CN",  "LOC_POLICY_LIMITANEI_DESCRIPTION",                                              "拥有驻军单位的城市每回合的忠诚度+5。"),
    ("zh_Hans_CN",  "LOC_POLICY_INSULAE_DESCRIPTION",                                                "所有拥有至少2个专业化区域的城市+2 [ICON_Housing] 住房。"),
    ("zh_Hans_CN",  "LOC_POLICY_CIVIL_PRESTIGE_DESCRIPTION",                                         "拥有至少2项升级的 [ICON_GOVERNOR] 总督就职后将提供+1 [ICON_Amenities] 宜居度、+3 [ICON_Housing] 住房。"),
    ("zh_Hans_CN",  "LOC_POLICY_MEDINA_QUARTER_DESCRIPTION",                                         "所有拥有至少3个专业化区域的城市+4 [ICON_Housing] 住房。"),
    --("zh_Hans_CN",  "LOC_POLICY_DIPLOMATIC_LEAGUE_DESCRIPTION",                                      "无论是否拥有外交区，您向每个城邦派遣的第一个 [ICON_Envoy] 使者会被视为2个 [ICON_Envoy] 使者。"),
    ("zh_Hans_CN",  "LOC_POLICY_PRAETORIUM_DESCRIPTION",                                             "[ICON_Governor] 总督为其所在城市每回合忠诚度+5。"),
    ("zh_Hans_CN",  "LOC_POLICY_CHARISMATIC_LEADER_ETHIOPIA_DESCRIPTION",                            "开放所有城邦的边境，影响力点数每回合+3，外交区、领事馆、外交办提供的影响力点数每回合+1。"),
    ("zh_Hans_CN",  "LOC_POLICY_DIPLOMATIC_LEAGUE_ETHIOPIA_DESCRIPTION",                             "开放所有城邦的边境，影响力点数每回合+3，外交区、领事馆、外交办提供的影响力点数每回合+2。"),
    ("zh_Hans_CN",  "LOC_POLICY_GUNBOAT_DIPLOMACY_ETHIOPIA_DESCRIPTION",                             "开放所有城邦的边境，影响力点数每回合+3，外交区、领事馆、外交办提供的影响力点数每回合+3。"),
    ("zh_Hans_CN",  "LOC_POLICY_CHARISMATIC_LEADER_DESCRIPTION",                                     "开放所有城邦的边境，影响力点数每回合+3。"),
    ("zh_Hans_CN",  "LOC_POLICY_DIPLOMATIC_LEAGUE_DESCRIPTION",                                      "开放所有城邦的边境，影响力点数每回合+6。"),
    ("zh_Hans_CN",  "LOC_POLICY_GUNBOAT_DIPLOMACY_DESCRIPTION",                                      "开放所有城邦的边境，影响力点数每回合+9。"),
    ("zh_Hans_CN",  "LOC_POLICY_NATIONAL_IDENTITY_DESCRIPTION",                                      "单位无视受到伤害后的 [ICON_Strength] 战斗力减益。攻击受伤单位时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_POLICY_FREELANCERS_NAME",                                                   "自由佣兵"),
    ("zh_Hans_CN",  "LOC_POLICY_MARITIME_INFRASTRUCTURE_NAME",                                       "海上设施"),
    ("zh_Hans_CN",  "LOC_POLICY_SEABORNE_SUPPLY_NAME",                                               "海上补给线"),
    ("zh_Hans_CN",  "LOC_POLICY_GARRISON_RECLAMATION_NAME",                                          "屯田"),
    ("zh_Hans_CN",  "LOC_POLICY_MINARET_NAME",                                                       "宣礼塔"),
    ("zh_Hans_CN",  "LOC_POLICY_PRIMITIVE_COMMUNE_NAME",                                             "原始公社"),
    ("zh_Hans_CN",  "LOC_POLICY_OVERALL_PLANNING_NAME",                                              "统筹规划"),
    ("zh_Hans_CN",  "LOC_POLICY_BARD_NAME",                                                          "对城弹琴"),
    ("zh_Hans_CN",  "LOC_POLICY_CIVILIZE_NAME",                                                      "再来一瓶"),
    ("zh_Hans_CN",  "LOC_POLICY_DOMESTIC_TRADE_NAME",                                                "本土贸易"),
    ("zh_Hans_CN",  "LOC_POLICY_HIGHWAY_NAME",                                                       "官道"),
    ("zh_Hans_CN",  "LOC_POLICY_SILK_ROAD_NAME",                                                     "丝绸之路"),
    ("zh_Hans_CN",  "LOC_POLICY_WAREHOUSE_NAME",                                                     "工商食官"),
    ("zh_Hans_CN",  "LOC_POLICY_SAFETY_BOX_NAME",                                                    "城市公社"),
    ("zh_Hans_CN",  "LOC_POLICY_WALL_HOUSING_NAME",                                                  "采邑"),
    ("zh_Hans_CN",  "LOC_POLICY_ARENA_TICKETS_NAME",                                                 "竞技场门票"),
    ("zh_Hans_CN",  "LOC_POLICY_WRESTING_AND_MANEUVERS_NAME",                                        "角力与演武"),
    ("zh_Hans_CN",  "LOC_POLICY_CITY_CENTRALIZATION_NAME",                                           "城市中心化"),
    ("zh_Hans_CN",  "LOC_POLICY_CONSTRUCTION_CROPS_NAME",                                            "生产建设兵团"),
    ("zh_Hans_CN",  "LOC_POLICY_DRILL_NAME",                                                         "演练"),
    ("zh_Hans_CN",  "LOC_POLICY_TRIBUTE_TRADE_NAME",                                                 "朝贡贸易"),
    ("zh_Hans_CN",  "LOC_POLICY_FREELANCERS_DESCRIPTION",                                            "拥有驻军单位的城市+5 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_POLICY_MARITIME_INFRASTRUCTURE_DESCRIPTION",                                "位于海边或湖边的城市+2 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_POLICY_SEABORNE_SUPPLY_DESCRIPTION",                                        "位于海边或湖边的城市+4 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_POLICY_GARRISON_RECLAMATION_DESCRIPTION",                                   "所有拥有军营的城市+4 [ICON_Food] 食物和+2 [ICON_Housing] 住房。"),
    ("zh_Hans_CN",  "LOC_POLICY_PRIMITIVE_COMMUNE_DESCRIPTION",                                      "所有城市+1 [ICON_Food] 食物。"),
    ("zh_Hans_CN",  "LOC_POLICY_OVERALL_PLANNING_DESCRIPTION",                                       "来自工业区、水上乐园和娱乐设施的区域效果范围增加3个单元格。"),
    ("zh_Hans_CN",  "LOC_POLICY_BARD_DESCRIPTION",                                                   "所有城市+1 [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_POLICY_CIVILIZE_DESCRIPTION",                                               "所有城市+1 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_POLICY_CARAVANSARIES_DESCRIPTION",                                          "所有城市+2 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_POLICY_DOMESTIC_TRADE_DESCRIPTION",                                         "所有国内 [ICON_TradeRoute] 贸易路线+1 [ICON_Food] 食物和+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_POLICY_HIGHWAY_DESCRIPTION",                                                "所有国内 [ICON_TradeRoute] 贸易路线+2 [ICON_Food] 食物和+2 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_POLICY_SILK_ROAD_DESCRIPTION",                                              "所有国际 [ICON_TradeRoute] 贸易路线+2 [ICON_Culture] 文化值和+2 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_POLICY_MARKET_ECONOMY_DESCRIPTION",                                         "目的地已开发的每个奢侈品资源和战略资源为您的国际 [ICON_TradeRoute] 贸易路线+1 [ICON_Gold] 金币，同时+3 [ICON_Culture] 文化值和+3 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_POLICY_WAREHOUSE_DESCRIPTION",                                              "商业区+2 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_POLICY_SAFETY_BOX_DESCRIPTION",                                             "商业区+4 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_MINARET_CHAPTER_HISTORY_PARA_1",              "待定 宣礼塔 第一段"),
    ("zh_Hans_CN",  "LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_MINARET_CHAPTER_HISTORY_PARA_2",              "待定 宣礼塔 第二段"),
    ("zh_Hans_CN",  "LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_SHAMAN_CHAPTER_HISTORY_PARA_1",               "待定 萨满 第一段"),
    ("zh_Hans_CN",  "LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_PRIMITIVE_COMMUNE_CHAPTER_HISTORY_PARA_1",    "待定 原始公社 第一段"),
    ("zh_Hans_CN",  "LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_BARD_CHAPTER_HISTORY_PARA_1",                 "待定 对城弹琴 第一段"),
    ("zh_Hans_CN",  "LOC_PEDIA_GOVERNMENTS_PAGE_POLICY_CIVILIZE_CHAPTER_HISTORY_PARA_1",             "待定 再来一瓶 第一段"),
    ("zh_Hans_CN",  "LOC_POLICY_RATIONALISM_DESCRIPTION",                                            "来自学院区域建筑的辐射范围增加3个单元格。拥有大学的城市每位 [ICON_Citizen] 公民提供0.3 [ICON_SCIENCE] 科技值。拥有研究实验室的城市每位 [ICON_Citizen] 公民提供0.5 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_POLICY_FREE_MARKET_DESCRIPTION",                                            "来自商业中心区域建筑的辐射范围增加3个单元格。拥有银行的城市每位 [ICON_Citizen] 公民提供0.6 [ICON_GOLD] 金币。拥有证券交易所的城市每位 [ICON_Citizen] 公民提供1 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_POLICY_GRAND_OPERA_DESCRIPTION",                                            "来自剧院广场区域建筑的辐射范围增加3个单元格。拥有艺术博物馆或考古博物馆的城市每位 [ICON_Citizen] 公民提供0.3 [ICON_CULTURE] 文化值。拥有广播中心的城市每位 [ICON_Citizen] 公民提供0.5 [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_POLICY_MINARET_DESCRIPTION",                                                "拥有寺庙的城市每位 [ICON_Citizen] 公民提供0.3 [ICON_FAITH] 信仰值。拥有祭祀建筑的城市每位 [ICON_Citizen] 公民提供0.5 [ICON_FAITH] 信仰值。"),
    ("zh_Hans_CN",  "LOC_POLICY_SCRIPTURE_DESCRIPTION",                                              "+50%圣地相邻加成。"),
    ("zh_Hans_CN",  "LOC_POLICY_SIMULTANEUM_DL_DESCRIPTION",                                         "+100%圣地相邻加成。"),
    ("zh_Hans_CN",  "LOC_POLICY_RAID_DL_DESCRIPTION",                                                "掠夺和海岸扫荡的收益+100%。"),
    ("zh_Hans_CN",  "LOC_POLICY_TOTAL_WAR_DL_DESCRIPTION",                                           "掠夺、海岸扫荡和掠夺 [ICON_TradeRoute] 贸易路线的收益+200%。"),
    ("zh_Hans_CN",  "LOC_POLICY_EQUESTRIAN_ORDERS_DL_DESCRIPTION",                                   "所有改良的 [ICON_RESOURCE_HORSES] 马与 [ICON_RESOURCE_IRON] 铁每回合额外产出2点资源。"),
    ("zh_Hans_CN",  "LOC_POLICY_DRILL_MANUALS_DL_DESCRIPTION",                                       "所有改良的 [ICON_RESOURCE_NITER] 硝石与 [ICON_RESOURCE_COAL] 煤每回合额外产出2点资源。"),
    ("zh_Hans_CN",  "LOC_POLICY_RESOURCE_MANAGEMENT_DL_DESCRIPTION",                                 "所有改良的 [ICON_RESOURCE_ALUMINUM] 铝与 [ICON_RESOURCE_OIL] 石油每回合额外产出2点资源。"),
    ("zh_Hans_CN",  "LOC_POLICY_PRESS_GANGS_DESCRIPTION",                                            "为工业及更早时代的海军单位增加60%生产速度。"),
    ("zh_Hans_CN",  "LOC_POLICY_MARITIME_INDUSTRIES_DESCRIPTION",                                    "为远古和古典时代的海军单位增加60%生产速度。"),
    ("zh_Hans_CN",  "LOC_POLICY_CHIVALRY_DESCRIPTION",                                               "为工业及更早时代的重型和轻型骑兵单位增加30%生产速度。"),
    ("zh_Hans_CN",  "LOC_POLICY_MANEUVER_DESCRIPTION",                                               "为远古和古典时代的重型和轻型骑兵单位增加30%生产速度。"),
    ("zh_Hans_CN",  "LOC_POLICY_FEUDAL_CONTRACT_DESCRIPTION",                                        "为远古、古典、中世纪和文艺复兴时代的近战、抗骑兵和远程单位增加30%生产速度。"),
    ("zh_Hans_CN",  "LOC_POLICY_AGOGE_DESCRIPTION",                                                  "为远古和古典时代的近战、抗骑兵和远程单位增加30%生产速度。"),
    ("zh_Hans_CN",  "LOC_POLICY_WISSELBANKEN_DESCRIPTION",                                           "您通往盟友城市或宗主城邦的 [ICON_TradeRoute] 贸易路线为双边城市+2 [ICON_Food] 食物、+2 [ICON_Production] 生产力。所有盟友的同盟点数每回合额外增加0.5点。"),
    ("zh_Hans_CN",  "LOC_POLICY_PUBLIC_TRANSPORT_DESCRIPTION_XP2",                                   "拥有迷人魅力的社区+3 [ICON_Food] 食物、+1 [ICON_Production] 生产力、+1 [ICON_Housing] 住房，若拥有惊艳魅力则翻倍。所有社区+1 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_POLICY_WALL_HOUSING_DESCRIPTION",                                           "每个等级的城墙提供+2 [ICON_Housing] 住房。"),
    ("zh_Hans_CN",  "LOC_POLICY_ARENA_TICKETS_DESCRIPTION",                                          "每座娱乐中心产出+6 [ICON_GOLD] 金币，竞技场产出+10 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_POLICY_WRESTING_AND_MANEUVERS_DESCRIPTION",                                 "拥有8点或以上 [ICON_Citizen] 人口城市中的竞技场+2 [ICON_Amenities] 宜居度（4环辐射）。"),
    ("zh_Hans_CN",  "LOC_POLICY_AFTER_ACTION_REPORTS_DESCRIPTION",                                   "所有单位的战斗经验值+100%。"),
    ("zh_Hans_CN",  "LOC_POLICY_COLONIAL_OFFICES_DESCRIPTION",                                       "与您最初的 [ICON_Capital] 首都不在同一大陆的城市+1 [ICON_Food] 食物、+15%余粮、每回合提供5点忠诚度。"),
    ("zh_Hans_CN",  "LOC_POLICY_CITY_CENTRALIZATION_DESCRIPTION",                                    "所有城市+1 [ICON_Food] 食物、+1 [ICON_Production] 生产力、+1 [ICON_SCIENCE] 科技值、+1 [ICON_CULTURE] 文化值、+1 [ICON_Faith] 信仰值和+2 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_POLICY_CONSTRUCTION_CROPS_DESCRIPTION",                                     "所有拥有军营的城市+4 [ICON_Food] 食物和+2 [ICON_Housing] 住房。每个等级的城墙提供+2 [ICON_Housing] 住房。"),
    ("zh_Hans_CN",  "LOC_POLICY_DRILL_DESCRIPTION",                                                  "所有单位的战斗经验值+50%。"),
    ("zh_Hans_CN",  "LOC_POLICY_TRIBUTE_TRADE_DESCRIPTION",                                          "所有商业区每回合提供+2影响力点数。通往宗主城邦的 [ICON_TradeRoute] 贸易路线+2 [ICON_GOLD] 金币。");
