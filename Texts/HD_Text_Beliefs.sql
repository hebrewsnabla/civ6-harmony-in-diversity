--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                     Text)
values
    ("LOC_DISTRICT_FEATURE_PLANTATION_FAITH",                 "+{1_num} [ICON_Faith] Faith from the adjacent Plantation {1_Num : plural 2?tile; other?tiles;}."),
    ("LOC_DISTRICT_UTAKI_GOLD",                               "+{1_num} [ICON_Gold] Gold from the adjacent Coast and Lake {1_Num : plural 2?tile; other?tiles;}"),
    ("LOC_DISTRICT_FEATURE_MOUNTAIN_FAITH",                   "+{1_num} [ICON_Faith] Faith from the adjacent Mountain {1_Num : plural 2?tile; other?tiles;}."),
    ("LOC_DISTRICT_REEF_SCIENCE",                             "+{1_num} [ICON_Science] Science from the adjacent Reef {1_Num : plural 2?tile; other?tiles;}."),
    ("LOC_DISTRICT_SUK_KELP_SCIENCE",                         "+{1_num} [ICON_Science] Science from the adjacent Kelp {1_Num : plural 2?tile; other?tiles;}."),
    ("LOC_DISTRICT_MOUNTAIN_SCIENCE",                         "+{1_num} [ICON_Science] Science from the adjacent Mountain {1_Num : plural 2?tile; other?tiles;}."),
    ("LOC_DISTRICT_PASTURE_FAITH",                            "+{1_num} [ICON_Faith] Faith from the adjacent Pasture {1_Num : plural 2?tile; other?tiles;}."),
    ("LOC_DISTRICT_PLANTATION_FAITH",                         "+{1_num} [ICON_Faith] Faith from the adjacent Plantation {1_Num : plural 2?tile; other?tiles;}."),
    ("LOC_DISTRICT_TUNDRA_FOOD",                              "+{1_num} [ICON_Food] Food from the adjacent Tundra {1_Num : plural 1?tile; other?tiles;}."),
    ("LOC_DISTRICT_TUNDRA_HILLS_FOOD",                        "+{1_num} [ICON_Food] Food from the adjacent Tundra Hill {1_Num : plural 1?tile; other?tiles;}."),
    ("LOC_DISTRICT_TUNDRA_HILLS_FAITH",                       "+{1_num} [ICON_Faith] Faith from the adjacent Tundra Hill {1_Num : plural 1?tile; other?tiles;}."),
    ("LOC_DISTRICT_JUNGLE_PRODUCTION",                        "+{1_num} [ICON_Production] Production from the adjacent Jungle {1_Num : plural 1?tile; other?tiles;}."),
    ("LOC_DISTRICT_JUNGLE_CULTURE",                           "+{1_num} [ICON_Culture] Culture from the adjacent Jungle {1_Num : plural 1?tile; other?tiles;}."),
    ("LOC_DISTRICT_RIVER_FAITH",                              "+{1_num} [ICON_Faith] Faith from the adjacent River."),
    ("LOC_BELIEF_TITHE_DL_DESCRIPTION",                       "+3 [ICON_Gold] Gold for every 2 follower of this Religion."),
    ("LOC_BELIEF_RELIGIOUS_UNITY_DL_DESCRIPTION",             "+3 [ICON_Faith] Faith for every 4 followers of this Religion."),
    ("LOC_BELIEF_WORLD_CHURCH_DL_DESCRIPTION",                "+1 [ICON_Culture] Culture for every 2 followers of this Religion."),
    ("LOC_BELIEF_CROSS_CULTURAL_DIALOGUE_DL_DESCRIPTION",     "+1 [ICON_Science] Science for every 2 followers of this Religion."),
    ("LOC_BELIEF_CHURCH_PROPERTY_DL_DESCRIPTION",             "+8 [ICON_Gold] Gold for each city following this Religion."),
    ("LOC_BELIEF_LAY_MINISTRY_DL_DESCRIPTION",                "+2 [ICON_Culture] Culture for each city following this Religion."),
    ("LOC_BELIEF_PILGRIMAGE_DL_DESCRIPTION",                  "+4 [ICON_Faith] Faith for each city following this Religion."),
    ("LOC_BELIEF_STEWARDSHIP_DL_DESCRIPTION",                 "+2 [ICON_Science] Science for each city following this Religion."),
    -- ("LOC_PROMOTION_JUST_WAR_DESCRIPTION",                    "+{1_Value} from Papal Primary"),
    ("LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",               "[ICON_ENVOY] Envoys spread +250 Religious Pressure. City-State leveraging costs 20% less. City-States you are Suzerain of provide +2 [ICON_FAITH] Faith and +4 [ICON_GOLD] Gold."),
    ("LOC_BELIEF_SACRED_PLACES_DL_DESCRIPTION",               "+3 [ICON_SCIENCE] Science, [ICON_CULTURE] Culture, [ICON_GOLD] Gold, and [ICON_FAITH] Faith for each city following this Religion that has a World Wonder."),
    ("LOC_BELIEF_TO_THE_GLORY_OF_GOD_NAME",                   "To the Glory of God"),
    ("LOC_BELIEF_TO_THE_GLORY_OF_GOD_DL_DESCRIPTION",         "-25% [ICON_faith] Faith cost when you patronize a great person. Grant a [ICON_GreatWork_Relic] relic when a great person is fully activated or retired, then grant a [ICON_GreatWork_Relic] relic for every three great people are fully activated or retired."), -- Each time you recruit a great person, gain 50 [ICON_FAVOR] Diplomatic Favor. 

    ("LOC_BELIEF_MESSIAH_NAME",                               "Messiah"),
    ("LOC_BELIEF_ABBOT_NAME",                                 "Abbot"),
    ("LOC_BELIEF_FEED_THE_WORLD_DL_DESCRIPTION",              "All Holy Site buildings provide +4 [ICON_FOOD] Food and +2 [ICON_HOUSING] Housing. +1% [ICON_FOOD] Food for every follower of this Religion."),
    ("LOC_BELIEF_CHORAL_MUSIC_DL_DESCRIPTION",                "All Holy Site buildings provide +4 [ICON_CULTURE] Culture.  +1% [ICON_CULTURE] Culture for every follower of this Religion. "),
    ("LOC_BELIEF_JESUIT_EDUCATION_DL_DESCRIPTION",            "All Holy Site buildings provide +0.5 [ICON_SCIENCE] Science for each [ICON_CITIZEN] citizen in this city. Campus district buildings are 20% cheaper to purchase. May purchase Campus district buildings with [ICON_FAITH] Faith. "),
    ("LOC_BELIEF_RELIGIOUS_COMMUNITY_DL_DESCRIPTION",         "All Holy Site buildings provide +1 [ICON_SCIENCE] Science for international [ICON_TradeRoute] Trade Routes, and +1 [ICON_SCIENCE] Science for both sides of international [ICON_TradeRoute] Trade Routes to this city. May purchase trader units with [ICON_Faith] Faith. Traders are 20% cheaper to purchase. "),
    ("LOC_BELIEF_MESSIAH_DL_DESCRIPTION",                     "All Holy Site buildings provide +4 [ICON_Faith] Faith. City Center buildings are 20% cheaper to purchase. May purchase City Center buildings and Holy Site district buildings with [ICON_Faith] Faith."),
    ("LOC_BELIEF_ABBOT_DL_DESCRIPTION",                       "All Holy Site buildings provide +1 [ICON_Production] Production to all adjacent tiles. Holy Site district provides +2 [ICON_Production] Production."), -- 

    ("LOC_BELIEF_DIVINE_INSPIRATION_DL_DESCRIPTION",          "All world wonders provide +4 [ICON_Faith] Faith. Each time you complete a Wonder, gain [ICON_Faith] Faith equal to 33% its production cost."),
    ("LOC_BELIEF_WARRIOR_MONKS_EXPANSION2_DESCRIPTION",       "Allows spending [ICON_FAITH] Faith to train Warriors Monks (A land combat unit) in city with Temple. Culture Bomb adjacent tiles when completing a Holy Site. Holy Site provides extra [ICON_FAITH] Faith equal to their district adjacency bonus."),
    ("LOC_BELIEF_RELIQUARIES_DL_DESCRIPTION",                 "[ICON_GreatWork_Relic] Relics have triple yield of both [ICON_Faith] Faith and [ICON_Tourism] Tourism."),
    ("LOC_BELIEF_RELIGIOUS_ART_NAME",                         "Religious Art"),
    ("LOC_BELIEF_RELIGIOUS_ART_DL_DESCRIPTION",               "Holy Site districts provide [ICON_Culture] Culture equal to their [ICON_Faith] Faith adjacency bonus. Theater district buildings are 20% cheaper to purchase, and can be purchased with [ICON_Faith] Faith."),
    ("LOC_BELIEF_WORK_ETHIC_DL_DESCRIPTION",                  "All Districts (except the City Center) provide +2 [ICON_Production] Production in cities having a Holy Site district. Industrial Zone district buildings are 20% cheaper to purchase, and can be purchased with [ICON_Faith] Faith."),
    ("LOC_BELIEF_PRACTICAL_APPLICATION_NAME",                 "Practical Application"),
    ("LOC_BELIEF_PRACTICAL_APPLICATION_DL_DESCRIPTION",       "[ICON_Citizen] Citizens provide +3 [ICON_Gold] Gold in cities having a Holy Site district. Commercial Hub district buildings are 20% cheaper to purchase, and can be purchased with [ICON_Faith] Faith."),
    ("LOC_BELIEF_RELIGIOUS_COLONIZATION_DL_DESCRIPTION",      "Settlers and Buildiers are 20% cheaper to purchase. May purchase buildings in Government Plaza district and Diplomatic Quarter district with [ICON_Faith] Faith. Settlers and Buildiers trained in the city recieve +2 [ICON_MOVEMENT] Movement."),
    ("LOC_BELIEF_ZEN_MEDITATION_DL_DESCRIPTION",              "+2 [ICON_Amenities] Amenity to cities if they have a Holy Site adjacent to a Mountain or a Forest. +1 appeal to all tiles if the city has a Holy Site."), -- So did City Center.
    ("LOC_BELIEF_ZEN_MEDITATION_VIETNAM_DESCRIPTION",         "+1 Appeal to all tiles of cities with a Holy Site district. +2 [ICON_Amenities] Amenity to cities having a Holy Site district adjacent to Mountains or Woods. Preserve district buildings are 20% cheaper to purchase, and can be purchased with [ICON_Faith] Faith."),
    ("LOC_BELIEF_INITIATION_RITES_NAME",                      "Initiation Rites"),
    ("LOC_BELIEF_INITIATION_RITES_DL_DESCRIPTION",            "When you use a religious unit to convert a city for the first time, earn 50 [ICON_Gold] Gold per [ICON_Citizen] citizens living in that city (on Standard Speed)."),
    ("LOC_BELIEF_ITINERANT_PREACHERS_DL_DESCRIPTION",         "Religion spreads to cities 30% further away. When you use a religious unit to convert a city for the first time earn 15 [ICON_Culture] Culture per [ICON_Citizen] citizens living in that city (on Standard Speed)."),
    ("LOC_BELIEF_SCRIPTURE_DL_DESCRIPTION",                   "Religious spread from adjacent city pressure is 25% stronger. Boosted to 50% once Printing is researched. When you use a religious unit to convert a city for the first time earn 15 [ICON_Science] Science per [ICON_Citizen] citizens living in that city (on Standard Speed)."),
    ("LOC_BELIEF_CAPELLANI_NAME",                             "Capellani"),
    ("LOC_BELIEF_CAPELLANI_DL_DESCRIPTION",                   "Religious units newly obtained from cities following this religion can provide +5 [ICON_Strength] Combat Strength to the Combat Units in the same tile (not retroactive)."),
    ("LOC_BELIEF_SCHOLASTICISM_NAME",                         "Scholasticism"),
    ("LOC_BELIEF_SCHOLASTICISM_DL_DESCRIPTION",               "All Religious units newly obtained from cities following this religion receive +7 [ICON_Religion] Religious Strength in Theological Combat (not retroactive)."),
    ("LOC_BELIEF_PIOUS_MERCHANTS_NAME",                       "Pious Merchants"),
    ("LOC_BELIEF_PIOUS_MERCHANTS_DL_DESCRIPTION",             "+100% Religious pressure from your [ICON_TradeRoute] Trade Routes. [ICON_TradeRoute] Trade Routes originated from cities following this religion provide +6 [ICON_Gold] Gold. [ICON_TradeRoute] Trade Routes to cities following this religion provide +3 [ICON_FAITH] Faith."),
    ("LOC_BELIEF_MILLENNIALISM_NAME",                         "Millennialism"),
    ("LOC_BELIEF_MILLENNIALISM_DL_DESCRIPTION",               "Apostles newly obtained from cities following this religion will receive 1 extra promotion (not retroactive)."),
    ("LOC_BELIEF_CANONIZATION_OF_SAINTS_NAME",                "Canonization of Saints"),
    ("LOC_BELIEF_CANONIZATION_OF_SAINTS_DL_DESCRIPTION",      "When you activate a [ICON_GreatPerson] Great Person, spread +400 Religious Pressure to cities within 6 tiles. When you use a religious unit to convert a city for the first time, earn +25 [ICON_Faith] Faith per [ICON_Citizen] citizens living in that city (on Standard Speed)."),
    ("LOC_BELIEF_DEFENDER_OF_FAITH_DL_DESCRIPTION",           "Combat units gain +5 [ICON_Strength] Combat Strength when within the borders of friendly cities that follow this Religion."),
    ("LOC_BELIEF_JUST_WAR_DL_DESCRIPTION",                    "Combat units gain +5 [ICON_Strength] Combat Strength when within the borders of foreign cities that follow this Religion. Pillaging Improvements and Districts provides +25 [ICON_Faith] Faith."),
    ("LOC_BELIEF_HOLY_WATERS_NAME",                           "Sea Festival"),
    ("LOC_BELIEF_HOLY_WATERS_DL_DESCRIPTION",                 "+100% adjacency bonuses to Holy Site districts adjacent to Lake or Coast tiles. Districts (Except City Center) on or adjacent to Lake or Coast tiles provide +4 [ICON_Faith] Faith in cities with Holy Site. Harbor buildings are 20% cheaper to purchase. May purchase Harbor district buildings with [ICON_Faith] Faith."),
    ("LOC_BELIEF_MONASTIC_ISOLATION_DL_DESCRIPTION",          "Your Religious Pressure never drops due to losses in Theological Combat. Cities following this religion receive -100% religion pressure from other religions. -30% purchase cost for Inquisitors. Inquisitors newly obtained from cities following this religion have +1 charge."),
    ("LOC_BELIEF_HOLY_ORDER_DESCRIPTION",                     "Missionaries and Apostles are 30% cheaper to purchase in cities following this religion."),
    ("LOC_BELIEF_MISSIONARY_ZEAL_DESCRIPTION",                "Religious units newly obtained from cities following this religion ignore [ICON_Movement] Movement costs of terrain and features."),
    ("LOC_BELIEF_MOSQUE_DL_DESCRIPTION",                      "Allows construction of Mosques (+8 [ICON_Faith] Faith, Missionary and Apostles created here have +1 spread; All Religious units created in this city receive +3 Religious Strength in Theological Combat."), -- [ICON_Religion] 
    ("LOC_BELIEF_PAGODA_DL_DESCRIPTION",                      "Allows construction of Pagodas (+8 [ICON_Faith] Faith, +3 [ICON_Culture] Culture, +10% [ICON_CULTURE] Culture in this city). "),
    ("LOC_BELIEF_WAT_DL_DESCRIPTION",                         "Allows construction of Wats (+8 [ICON_Faith] Faith, +3 [ICON_Science] Science; +10% [ICON_SCIENCE] Science in this city). "),
    ("LOC_BELIEF_SYNAGOGUE_DL_DESCRIPTION",                   "Allows construction of Synagogues (+12 [ICON_Faith] Faith; +10% [ICON_FAITH] Faith in this city). "),
    ("LOC_BELIEF_GURDWARA_DL_DESCRIPTION",                    "Allows construction of Gurdwaras (+8 [ICON_Faith] Faith, +3 [ICON_Food] Food, +2 [ICON_Housing] Housing; +10% [ICON_Food] Food in this city). "),
    ("LOC_BELIEF_MEETING_HOUSE_DL_DESCRIPTION",               "Allows construction of Meeting Houses (+8 [ICON_Faith] Faith, +3 [ICON_Production] Production; +10% [ICON_PRODUCTION] Production in this city). "),
    ("LOC_BELIEF_STUPA_DL_DESCRIPTION",                       "Allows construction of Stupas (+8 [ICON_Faith] Faith, +2 [ICON_Amenities] Amenity; Receive 1 [ICON_AMENITIES] Amenity for every Luxury resource this city has improved)."),
    ("LOC_BELIEF_CATHEDRAL_DL_DESCRIPTION",                   "Allows construction of Cathedrals (+8 [ICON_Faith] Faith, Can hold a [ICON_GreatWork_Landscape] Great Work of Art.[NEWLINE] +100% [ICON_CULTURE] Culture and +100% [ICON_Tourism] Tourism for Great Works of Art in this city."),
    ("LOC_BELIEF_DAR_E_MEHR_DL_DESCRIPTION",                  "Allows construction of Dar-e Mehrs (+8 [ICON_Faith] Faith, +2 additional [ICON_FAITH] Faith for each era since constructed or last repaired; receive a Missionary unit after finishing construction).");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                     Text)
values
    ("zh_Hans_CN",  "LOC_DISTRICT_FEATURE_REEF_SCIENCE",                     "+{1_num} [ICON_Science] 科技值来自相邻礁石 {1_Num : plural 2?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_UTAKI_GOLD",                               "+{1_num} [ICON_Gold] 金币来自相邻海岸和湖泊{1_Num : plural 2?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_FEATURE_SUK_KELP_SCIENCE",                 "+{1_num} [ICON_Science] 科技值来自相邻海藻森林 {1_Num : plural 2?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_PLANTATION_FAITH",                         "+{1_num} [ICON_Faith] 信仰值来自相邻种植园{1_Num : plural 2?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_MOUNTAIN_FAITH",                           "+{1_num} [ICON_Faith] 信仰值来自相邻山脉 {1_Num : plural 2?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_MOUNTAIN_SCIENCE",                         "+{1_num} [ICON_Science] 科技值来自相邻山脉 {1_Num : plural 2?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_PASTURE_FAITH",                            "+{1_num} [ICON_Faith] 信仰值来自相邻牧场{1_Num : plural 2?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_TUNDRA_FOOD",                              "+{1_num} [ICON_Food] 食物来自相邻冻土{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_TUNDRA_HILLS_FOOD",                        "+{1_num} [ICON_Food] 食物来自相邻冻土丘陵{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_TUNDRA_HILLS_FAITH",                       "+{1_num} [ICON_Faith] 信仰值来自相邻冻土丘陵{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_JUNGLE_PRODUCTION",                        "+{1_num} [ICON_Production] 生产力来自相邻雨林{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_JUNGLE_CULTURE",                           "+{1_num} [ICON_Culture] 文化值来自相邻雨林{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_RIVER_FAITH",                              "+{1_num} [ICON_Faith] 信仰值来自相邻河流。"),
    ("zh_Hans_CN",  "LOC_BELIEF_TITHE_DL_DESCRIPTION",                       "该宗教每有2个信徒便+3 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_UNITY_DL_DESCRIPTION",             "该宗教每有4个信徒便+3 [ICON_Faith] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_WORLD_CHURCH_DL_DESCRIPTION",                "该宗教每有2个信徒便+1 [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CROSS_CULTURAL_DIALOGUE_DL_DESCRIPTION",     "该宗教每有2个信徒便+1 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CHURCH_PROPERTY_DL_DESCRIPTION",             "每有1个信奉该宗教的城市便+8 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BELIEF_LAY_MINISTRY_DL_DESCRIPTION",                "每有1个信奉该宗教的城市便+2 [ICON_Culture] 文化值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PILGRIMAGE_DL_DESCRIPTION",                  "每有1个信奉该宗教的城市便+4 [ICON_Faith] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_STEWARDSHIP_DL_DESCRIPTION",                 "每有1个信奉该宗教的城市便+2 [ICON_Science] 科技值。"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_JUST_WAR_DESCRIPTION",                    "+{1_Value}教皇权威"),
    ("zh_Hans_CN",  "LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",               "将一个 [ICON_ENVOY]使者派遣至城邦后，将对该城邦施加250点宗教压力。征兵费用减少20%。每个宗主的城邦提供+2 [ICON_FAITH] 信仰和+4 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_BELIEF_SACRED_PLACES_DL_DESCRIPTION",               "信仰此宗教且拥有世界奇观的每座城市+3 [ICON_SCIENCE] 科技值、[ICON_CULTURE] 文化值、[ICON_GOLD] 金币和 [ICON_FAITH] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_TO_THE_GLORY_OF_GOD_NAME",                   "荣神益人"),
    ("zh_Hans_CN",  "LOC_BELIEF_TO_THE_GLORY_OF_GOD_DL_DESCRIPTION",         "招募伟人-25% [ICON_faith] 信仰值花费。 有一个伟人完全激活或隐退后，获得一个 [ICON_GreatWork_Relic] 遗物，之后每有三位伟人完全激活或隐退后获得一个 [ICON_GreatWork_Relic] 遗物。"), -- 每次招募伟人时，获得50 [ICON_FAVOR] 外交支持。

    ("zh_Hans_CN",  "LOC_BELIEF_MESSIAH_NAME",                               "弥赛亚"),
    ("zh_Hans_CN",  "LOC_BELIEF_ABBOT_NAME",                                 "苦行"),
    ("zh_Hans_CN",  "LOC_BELIEF_FEED_THE_WORLD_DL_DESCRIPTION",              "所有圣地建筑提供+4 [ICON_FOOD] 食物，+2 [ICON_HOUSING] 住房。每名信仰此宗教的居民将使 [ICON_Food] 食物+1%。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CHORAL_MUSIC_DL_DESCRIPTION",                "所有圣地建筑提供+4 [ICON_CULTURE] 文化值。每名信仰此宗教的居民将使 [ICON_Culture] 文化+1%。"),
    ("zh_Hans_CN",  "LOC_BELIEF_JESUIT_EDUCATION_DL_DESCRIPTION",            "所有圣地建筑为每人口提供0.5 [ICON_SCIENCE] 科技值。购买学院区域内建筑的费用降低20%且可以用 [ICON_FAITH] 信仰值购买。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_COMMUNITY_DL_DESCRIPTION",         "所有圣地建筑为此城出发的国际 [ICON_TradeRoute] 贸易路线+1 [ICON_Science] 科技值，使每条通往此城的国际 [ICON_TradeRoute] 贸易路线为双方+1 [ICON_Science] 科技值。可用 [ICON_Faith] 信仰值购买商人，购买商人的费用降低20%。"),
    ("zh_Hans_CN",  "LOC_BELIEF_ABBOT_DL_DESCRIPTION",                       "所有圣地建筑为相邻的单元格提供+1 [ICON_Production] 生产力。圣地+2 [ICON_Production] 生产力"),
    ("zh_Hans_CN",  "LOC_BELIEF_MESSIAH_DL_DESCRIPTION",                     "所有圣地建筑提供+4 [ICON_Faith] 信仰值。购买市中心内建筑的费用降低20%且可以用 [ICON_Faith] 信仰值购买。圣地区域内建筑可以用 [ICON_FAITH] 信仰值购买。"),
    
    ("zh_Hans_CN",  "LOC_BELIEF_DIVINE_INSPIRATION_DL_DESCRIPTION",          "所有世界奇观+4 [ICON_Faith] 信仰值。完成世界奇观后返还等同于奇观所需产能33%的 [ICON_Faith] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIQUARIES_DL_DESCRIPTION",                 "[ICON_GreatWork_Relic] 遗物能产出3倍的 [ICON_Faith] 信仰值和 [ICON_Tourism] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_ART_NAME",                         "宗教艺术"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_ART_DL_DESCRIPTION",               "圣地区域的 [ICON_Faith] 信仰值相邻加成也提供 [ICON_Culture] 文化值。购买剧院广场区域内建筑的费用降低20%且可以用 [ICON_Faith] 信仰值购买。"),
    ("zh_Hans_CN",  "LOC_BELIEF_WORK_ETHIC_DL_DESCRIPTION",                  "拥有圣地的城市所有区域（市中心除外）+2 [ICON_Production] 生产力，购买工业区区域内建筑的费用降低20%且可以用 [ICON_Faith] 信仰值购买。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PRACTICAL_APPLICATION_NAME",                 "经世致用"),
    ("zh_Hans_CN",  "LOC_BELIEF_PRACTICAL_APPLICATION_DL_DESCRIPTION",       "拥有圣地的城市中每 [ICON_Citizen] 人口提供+3 [ICON_Gold] 金币。购买商业中心区域内建筑的费用降低20%且可以用 [ICON_Faith] 信仰值购买。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_COLONIZATION_DL_DESCRIPTION",      "购买开拓者和建造者的费用降低20%。可以使用 [ICON_Faith] 信仰值购买市政广场和外交区内的建筑。城市中生产的开拓者和建造者+2 [ICON_MOVEMENT] 移动力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_ZEN_MEDITATION_DL_DESCRIPTION",              "若圣地相邻山脉或森林，+2 [ICON_Amenities] 宜居度。拥有圣地的城市所有单元格+1魅力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_ZEN_MEDITATION_VIETNAM_DESCRIPTION",         "若圣地相邻山脉或森林，+2 [ICON_Amenities] 宜居度。拥有圣地的城市所有单元格+1魅力。购买保护区区域内建筑的费用降低20%且可以用 [ICON_Faith] 信仰值购买。"),
    ("zh_Hans_CN",  "LOC_BELIEF_INITIATION_RITES_NAME",                      "入会仪式"),
    ("zh_Hans_CN",  "LOC_BELIEF_INITIATION_RITES_DL_DESCRIPTION",            "利用宗教单位使城市首次改变信仰时，该城市每拥有1点 [ICON_Citizen] 人口，则提供50点 [ICON_Gold] 金币（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_ITINERANT_PREACHERS_DL_DESCRIPTION",         "宗教传播距离增加30%。利用宗教单位使城市首次改变信仰时，该城市每拥有1点 [ICON_Citizen] 人口，则提供15点 [ICON_Culture] 文化值（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_SCRIPTURE_DL_DESCRIPTION",                   "邻近城市的宗教传播的压力增加25%。一旦研发出印刷术，增加到50%。利用宗教单位使城市首次改变信仰时，该城市每拥有1点 [ICON_Citizen] 人口，则提供15点 [ICON_Science] 科技值（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CAPELLANI_NAME",                             "随军牧师"),
    ("zh_Hans_CN",  "LOC_BELIEF_CAPELLANI_DL_DESCRIPTION",                   "强化后从信仰此宗教的城市中新获得的宗教单位为同一单元格军事单位+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_SCHOLASTICISM_NAME",                         "经院哲学"),
    ("zh_Hans_CN",  "LOC_BELIEF_SCHOLASTICISM_DL_DESCRIPTION",               "强化后从信仰此宗教的城市中新获得的宗教单位在神学战斗中+7 [ICON_Religion] 宗教战斗力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PIOUS_MERCHANTS_NAME",                       "虔诚商队"),
    ("zh_Hans_CN",  "LOC_BELIEF_PIOUS_MERCHANTS_DL_DESCRIPTION",             "来自 [ICON_TradeRoute] 贸易路线的宗教压力+100%。从信仰此宗教的城市出发的商路+6 [ICON_Gold] 金币，通往信仰此宗教城市的贸易路线+3 [ICON_Faith] 信仰。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MILLENNIALISM_NAME",                         "千禧年主义"),
    ("zh_Hans_CN",  "LOC_BELIEF_MILLENNIALISM_DL_DESCRIPTION",               "强化后从信仰此宗教的城市中新获得的使徒将额外获得1次升级。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CANONIZATION_OF_SAINTS_NAME",                "册封圣徒"),
    ("zh_Hans_CN",  "LOC_BELIEF_CANONIZATION_OF_SAINTS_DL_DESCRIPTION",      "当您激活一位 [ICON_GreatPerson] 伟人时，其会将您所创立宗教的400点宗教压力传播到6单元格内的城市。利用宗教单位使城市首次改变信仰时，该城市每拥有1点 [ICON_Citizen] 人口，则提供25点 [ICON_Faith] 信仰（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_DEFENDER_OF_FAITH_DL_DESCRIPTION",           "战斗单位处于信奉该宗教的友好城市境内时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_JUST_WAR_DL_DESCRIPTION",                    "战斗单位处于信奉该宗教的外国城市境内时+5 [ICON_Strength] 战斗力，掠夺改良设施和区域时+25 [ICON_Faith] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_HOLY_WATERS_NAME",                           "海祭"),
    ("zh_Hans_CN",  "LOC_BELIEF_HOLY_WATERS_DL_DESCRIPTION",                 "相邻海岸或湖泊的圣地获得+100%相邻加成。拥有圣地的城市中每个位于或相邻海岸或湖泊的区域(市中心外)+4 [ICON_Faith] 信仰值。购买港口区域内建筑的费用降低20%且可以用 [ICON_Faith] 信仰值购买。"),
    ("zh_Hans_CN",  "LOC_BELIEF_WARRIOR_MONKS_EXPANSION2_DESCRIPTION",       "允许花费 [ICON_FAITH] 信仰值来在有寺庙的城市生产陆地战斗单位“武僧”。建成圣地后对相邻单元格施放文化炸弹。圣地区域的 [ICON_FAITH] 信仰值相邻加成提供额外等量的 [ICON_FAITH] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MONASTIC_ISOLATION_DL_DESCRIPTION",          "您的宗教压力不会因为神学战斗失败而减少。强化后信仰此宗教的城市减少100%外来宗教压力影响，购买审判官的费用降低30%，购买的审判官+1使用次数。"),
    ("zh_Hans_CN",  "LOC_BELIEF_HOLY_ORDER_DESCRIPTION",                     "信仰此宗教的城市购买传教士和使徒的费用降低30%。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MISSIONARY_ZEAL_DESCRIPTION",                "强化后从信仰此宗教的城市中新获得的宗教单位忽略地形和地貌的 [ICON_Movement] 移动力消耗。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MOSQUE_DL_DESCRIPTION",                      "允许建造清真寺（+8 [ICON_Faith] 信仰值；此处创建的传教士和使徒+1传教次数；所有从本城创建的宗教单位在宗教战争中+3力）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PAGODA_DL_DESCRIPTION",                      "允许建造宝塔（+8 [ICON_Faith] 信仰值，+3 [ICON_Culture] 文化值；本城+10% [ICON_CULTURE] 文化值）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_WAT_DL_DESCRIPTION",                         "允许建造佛寺（+8 [ICON_Faith] 信仰值，+3 [ICON_Science] 科技值；本城+10% [ICON_SCIENCE] 科技值）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_SYNAGOGUE_DL_DESCRIPTION",                   "允许建造犹太教堂（+12 [ICON_Faith] 信仰值；本城+10% [ICON_FAITH] 信仰值）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_GURDWARA_DL_DESCRIPTION",                    "允许建造谒师所（+8 [ICON_Faith] 信仰值，+3 [ICON_Food] 食物，+2 [ICON_Housing] 住房；本城+10% [ICON_Food] 食物）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MEETING_HOUSE_DL_DESCRIPTION",               "允许建造礼拜堂（+8 [ICON_Faith] 信仰值，+3 [ICON_Production] 生产力；本城+10% [ICON_PRODUCTION] 生产力）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_STUPA_DL_DESCRIPTION",                       "允许建造窣堵波（+8 [ICON_Faith] 信仰值、+2 [ICON_Amenities] 宜居度；本城每种已开发的奢侈品 +1 [ICON_AMENITIES] 宜居度）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CATHEDRAL_DL_DESCRIPTION",                   "允许建造大教堂（+8 [ICON_Faith] 信仰值，可放置1个 [ICON_GreatWork_Landscape] 艺术巨作。本城 [ICON_GreatWork_Landscape] 艺术巨作产出的 [ICON_CULTURE] 文化值和 [ICON_TOURISM] 旅游业绩+100%）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_DAR_E_MEHR_DL_DESCRIPTION",                  "允许建造拜火神庙（+8 [ICON_Faith] 信仰值；建造或上次修复后的每个时代均额外+2 [ICON_FAITH] 信仰值；完成后，获得一个传教士）。 ");

update LocalizedText set Text = replace(Text, '传道信仰', '追加信条') where Language = "zh_Hans_CN";
