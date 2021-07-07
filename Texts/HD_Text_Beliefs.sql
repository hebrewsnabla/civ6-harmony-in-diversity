--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                     Text)
values
    ("LOC_DISTRICT_PLANTATION_FAITH",                         "+{1_num} [ICON_Faith] Faith from the adjacent Plantation {1_Num : plural 2?tile; other?tiles;}."),
    ("LOC_DISTRICT_PASTURE_FAITH",                            "+{1_num} [ICON_Faith] Faith from the adjacent Pasture {1_Num : plural 2?tile; other?tiles;}."),
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
    ("LOC_BELIEF_LAY_MINISTRY_DL_DESCRIPTION",                "+3 [ICON_Culture] Culture for each city following this Religion."),
    ("LOC_BELIEF_PILGRIMAGE_DL_DESCRIPTION",                  "+4 [ICON_Faith] Faith for each city following this Religion."),
    ("LOC_BELIEF_STEWARDSHIP_DL_DESCRIPTION",                 "+3 [ICON_Science] Science for each city following this Religion."),
    ("LOC_PROMOTION_JUST_WAR_DESCRIPTION",                    "+{1_Value} from Papal Primary"),
    ("LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",               "When you send an [ICON_ENVOY] Envoy to a City-State it adds 200 Religious pressure to that City-State.Reduced levy army cost by 20 percent. +1 or +2 [ICON_Envoy] Envoy at each City-State when it first adopts this Religion, in addition to any envoy from a City-State quest. Combat units gain +5 [ICON_Strength] Combat Strength when within the borders of foreign cities that follow this Religion. "),
    ("LOC_BELIEF_SACRED_PLACES_DL_DESCRIPTION",               "+3 [ICON_SCIENCE] Science, [ICON_CULTURE] Culture, [ICON_GOLD] Gold, and [ICON_FAITH] Faith for each city following this Religion that has a World Wonder."),
    ("LOC_BELIEF_TO_THE_GLORY_OF_GOD_NAME",                   "To the Glory of God"),
    ("LOC_BELIEF_TO_THE_GLORY_OF_GOD_DL_DESCRIPTION",         "-25% [ICON_faith] faith when you patronage great person. Grant a [ICON_GreatWork_Relic] relic when a great person is fully activated or retired with 33% probability."), -- Each time you recruit a great person, add 50 [ICON_FAVOR] Diplomatic Favor. 
    ("LOC_BELIEF_FEED_THE_WORLD_DL_DESCRIPTION",              "Shrines provide +3 [ICON_FOOD] Food and +2 [ICON_HOUSING] Housing. Temples provide +6 [ICON_FOOD] Food and +2 [ICON_HOUSING] Housing."),
    ("LOC_BELIEF_CHORAL_MUSIC_DL_DESCRIPTION",                "Shrines provide +3 [ICON_CULTURE] Culture. Temples provide +6 [ICON_CULTURE] Culture."),
    ("LOC_BELIEF_DIVINE_INSPIRATION_DL_DESCRIPTION",          "All world wonders provide +4 [ICON_Faith] Faith. Holy Site provides extra [ICON_Faith] Faith equal to the district adjacency bonus.Each time gain [ICON_Faith] Faith equal t0 50% production cost after Wonder construction."),
    ("LOC_BELIEF_JESUIT_EDUCATION_DL_DESCRIPTION",            "May purchase Campus district buildings with [ICON_Faith] Faith. +0.2 [ICON_Science] Science for each [ICON_Citizen] citizen in this city, becomes double when the city has Shrine, becomes triple when the city has Temple."),
    ("LOC_BELIEF_RELIQUARIES_DL_DESCRIPTION",                 "[ICON_GreatWork_Relic] Relics have triple yield of both [ICON_Faith] Faith and [ICON_Tourism] Tourism. Shrines and Temples provide [ICON_Tourism] Tourism equal to their intrinsic [ICON_Faith] Faith output."),
    ("LOC_BELIEF_RELIGIOUS_COMMUNITY_DL_DESCRIPTION",         "In cities following this Religion, each building in the Holy Site district provides +1 [ICON_SCIENCE] Science for international [ICON_TradeRoute] Trade Routes, and provieds +1 [ICON_SCIENCE] Science for the city every time there is an international [ICON_TradeRoute] Trade Route to the city. May purchase trader units with [ICON_Faith] Faith. Trader are 20% cheaper to purchase with [ICON_FAITH] Faith and [ICON_GOLD] Gold. "),
    ("LOC_BELIEF_RELIGIOUS_ART_NAME",                         "Religious Art"),
    ("LOC_BELIEF_RELIGIOUS_ART_DL_DESCRIPTION",               "Holy Site district’s [ICON_Faith] Faith adjacency bonus provides [ICON_Culture] Culture as well. May purchase Theater district buildings with [ICON_Faith] Faith."),
    ("LOC_BELIEF_WORK_ETHIC_DL_DESCRIPTION",                  "Holy Site District and Shrine in cities following this Religion provides +1 [ICON_Production] Production to all adjacent tiles."),
    ("LOC_BELIEF_PRACTICAL_APPLICATION_NAME",                 "Practical Application"),
    ("LOC_BELIEF_PRACTICAL_APPLICATION_DL_DESCRIPTION",       "Each [ICON_Citizen] citizen yields 1.5 [ICON_Gold] Gold in cities that follow this Religion.+2% [ICON_Gold] Gold for each follower in this city."),
    ("LOC_BELIEF_RELIGIOUS_COLONIZATION_DL_DESCRIPTION",      "Settlers and Buildiers are 20% cheaper to purchase with [ICON_GOLD] Gold, and 20% cheaper to purchase with [ICON_FAITH] Faith when allowed. May purchase Government district and Diplomatic Quarter district buildings with [ICON_Faith] Faith."),
    ("LOC_BELIEF_ZEN_MEDITATION_DL_DESCRIPTION",              "+1 [ICON_Amenities] Amenity if the Holy Site is adjacent to mountains.+1 [ICON_Amenities] Amenity if the Holy Site is adjacent to Forests.+2 [ICON_Housing] Housing if the Holy Site is adjacent to river.So as the City Center."),
    ("LOC_BELIEF_INITIATION_RITES_NAME",                      "Initiation Rites"),
    ("LOC_BELIEF_INITIATION_RITES_DL_DESCRIPTION",            "When you use a religious unit to convert a city for the first time earn 50 [ICON_Gold] Gold per [ICON_Citizen] Population of that city (on Standard Speed)."),
    ("LOC_BELIEF_ITINERANT_PREACHERS_DL_DESCRIPTION",         "Religion spreads to cities 30% further away. When you use a religious unit to convert a city for the first time earn 15 [ICON_Culture] Culture per [ICON_Citizen] Population of that city (on Standard Speed)."),
    ("LOC_BELIEF_SCRIPTURE_DL_DESCRIPTION",                   "Religious spread from adjacent city pressure is 25% stronger. Boosted to 50% once Printing is researched. When you use a religious unit to convert a city for the first time earn 15 [ICON_Science] Science per [ICON_Citizen] Population of that city (on Standard Speed)."),
    ("LOC_BELIEF_SCHOLASTICISM_NAME",                         "Scholasticism"),
    ("LOC_BELIEF_SCHOLASTICISM_DL_DESCRIPTION",               "After this belief being added, all Religious units newly obtained from cities with this religion +7 [ICON_Religion] Religious Strength in theological combat."),
    ("LOC_BELIEF_PIOUS_MERCHANTS_NAME",                       "Pious Merchants"),
    ("LOC_BELIEF_PIOUS_MERCHANTS_DL_DESCRIPTION",             "+100% Religious pressure from your [ICON_TradeRoute] Trade Routes. All [ICON_TradeRoute] trade routes +6 [ICON_Gold] Gold from cities that believe in this religion. All [ICON_TradeRoute] trade route +3 [ICON_FAITH] Faith to cities that believe in this religion ."),
    ("LOC_BELIEF_MESSIAH_NAME",                               "Messiah"),
    ("LOC_BELIEF_MESSIAH_DL_DESCRIPTION",                     "After this belief being added, the apostles newly obtained from cities with this religion will receive 1 extra promotion."),
    ("LOC_BELIEF_CANONIZATION_OF_SAINTS_NAME",                "Canonization of Saints"),
    ("LOC_BELIEF_CANONIZATION_OF_SAINTS_DL_DESCRIPTION",      "When you activate a [ICON_GreatPerson] Great Person they spread 400 Religious pressure of your founded religion to cities within 6 tiles. When you use a religious unit to convert a city for the first time earn 25 [ICON_Faith] Faith per [ICON_Citizen] Population of that city (on Standard Speed)."),
    ("LOC_BELIEF_DEFENDER_OF_FAITH_DL_DESCRIPTION",           "Combat units gain +5 [ICON_Strength] Combat Strength when within the borders of friendly cities that follow this Religion."),
    ("LOC_BELIEF_JUST_WAR_DL_DESCRIPTION",                    "After this belief being added, the religious units newly obtained from cities with this religion can provide +5 [ICON_Strength] Combat Strength to the Combat Units in the same plot."),
    ("LOC_BELIEF_HOLY_WATERS_DL_DESCRIPTION",                 "Your districts and wonders on or next to Coast or Lake tiles provide +2 [ICON_Science] Science."),
    ("LOC_BELIEF_MONASTIC_ISOLATION_DL_DESCRIPTION",          "Your Religion's pressure never drops due to losses in Theological Combat. Cities with this religion -100% outer religion pressure and -30% purchase cost for Inquisitors. Inquisitors newly obtained from cities with this religion receive +1 charge.  "),
    ("LOC_BELIEF_HOLY_ORDER_DESCRIPTION",                     "Missionaries and Apostles are 30% cheaper to purchase in cities with this religion."),
    ("LOC_BELIEF_MISSIONARY_ZEAL_DESCRIPTION",                "Religious units newly obtained from cities with this religion ignore [ICON_Movement] Movement costs of terrain and features."),
    ("LOC_BELIEF_MOSQUE_DL_DESCRIPTION",                      "Allows construction of Mosques (+2 [ICON_Faith] Faith, Missionary and Apostles created here have +1 spread; All Religious units created in this city receive +3 [ICON_Strength] Combat Strength in religious combats)."),
    ("LOC_BELIEF_PAGODA_DL_DESCRIPTION",                      "Allows construction of Pagodas (+2 [ICON_Faith] Faith, +3 [ICON_Culture] Culture, +10% [ICON_CULTURE] Culture in this city). "),
    ("LOC_BELIEF_WAT_DL_DESCRIPTION",                         "Allows construction of Wats (+2 [ICON_Faith] Faith, +3 [ICON_Science] Science; +10% [ICON_SCIENCE] Science in this city). "),
    ("LOC_BELIEF_SYNAGOGUE_DL_DESCRIPTION",                   "Allows construction of Synagogues (+5 [ICON_Faith] Faith; +10% [ICON_FAITH] Faith in this city). "),
    ("LOC_BELIEF_GURDWARA_DL_DESCRIPTION",                    "Allows construction of Gurdwaras (+2 [ICON_Faith] Faith, +3 [ICON_Food] Food, +1 [ICON_Housing] Housing; +10% Growth rate in this city). "),
    ("LOC_BELIEF_MEETING_HOUSE_DL_DESCRIPTION",               "Allows construction of Meeting Houses (+2 [ICON_Faith] Faith, +3 [ICON_Production] Production; +10% [ICON_PRODUCTION] Production in this city). "),
    ("LOC_BELIEF_STUPA_DL_DESCRIPTION",                       "Allows construction of Stupas (+2 [ICON_Faith] Faith, +2 [ICON_Amenities] Amenity; Receive 1 [ICON_AMENITIES] Amenity for every Luxury resource this city has improved)."),
    ("LOC_BELIEF_CATHEDRAL_DL_DESCRIPTION",                   "Allows construction of Cathedrals (+2 [ICON_Faith] Faith, Can holds a [ICON_GreatWork_Landscape] Great Work of Art.[NEWLINE] +100% [ICON_CULTURE] Culture and +100% [ICON_Tourism] Tourism for Great Works of Art in this city."),
    ("LOC_BELIEF_DAR_E_MEHR_DL_DESCRIPTION",                  "Allows construction of Dar-e Mehrs (+2 [ICON_Faith] Faith, +2 additional [ICON_FAITH] Faith for each era since constructed or last repaired; Gain a Missionary unit after finishing construction).");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                     Text)
values
    ("zh_Hans_CN",  "LOC_DISTRICT_PLANTATION_FAITH",                         "+{1_num} [ICON_Faith] 信仰值来自相邻种植园{1_Num : plural 2?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_PASTURE_FAITH",                            "+{1_num} [ICON_Faith] 信仰值来自相邻牧场{1_Num : plural 2?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_TUNDRA_FOOD",                              "+{1_num} [ICON_Food] 食物来自相邻冻土{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_TUNDRA_HILLS_FOOD",                        "+{1_num} [ICON_Food] 食物来自相邻冻土丘陵{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_TUNDRA_HILLS_FAITH",                       "+{1_num} [ICON_Faith] 信仰值来自相邻冻土丘陵{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_JUNGLE_PRODUCTION",                        "+{1_num} [ICON_Production] 生产力来自相邻雨林{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_JUNGLE_CULTURE",                           "+{1_num} [ICON_Culture] 文化值来自相邻雨林{1_Num : plural 1?单元格; other?单元格;}。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_RIVER_FAITH",                              "+{1_num} [ICON_Faith] 信仰值来自相邻河流。"),
    ("zh_Hans_CN",  "LOC_BELIEF_TITHE_DL_DESCRIPTION",                       "该宗教每有2个信徒则+3 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_UNITY_DL_DESCRIPTION",             "该宗教每有4个信徒则+3 [ICON_Faith] 信仰。"),
    ("zh_Hans_CN",  "LOC_BELIEF_WORLD_CHURCH_DL_DESCRIPTION",                "该宗教每有2个信徒则+1 [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CROSS_CULTURAL_DIALOGUE_DL_DESCRIPTION",     "该宗教每有2个信徒则+1 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CHURCH_PROPERTY_DL_DESCRIPTION",             "每个信奉该宗教的城市+8 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BELIEF_LAY_MINISTRY_DL_DESCRIPTION",                "每个信奉该宗教的城市+3 [ICON_Culture] 文化。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PILGRIMAGE_DL_DESCRIPTION",                  "每个信奉该宗教的城市+4 [ICON_Faith] 信仰。"),
    ("zh_Hans_CN",  "LOC_BELIEF_STEWARDSHIP_DL_DESCRIPTION",                 "每个信奉该宗教的城市+3 [ICON_Science] 科技。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_JUST_WAR_DESCRIPTION",                    "+{1_Value}教皇权威"),
    ("zh_Hans_CN",  "LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",               "将一个 [ICON_ENVOY]使者派遣至城邦后，将对该城邦施加200点宗教压力。征兵费用减少20%。除了城邦的任务外，城邦信教将自动向该城邦派遣1至2个 [ICON_Envoy] 使者。战斗单位处于信奉该宗教的外国城市境内时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_SACRED_PLACES_DL_DESCRIPTION",               "信仰此宗教且拥有世界奇观的每座城市+3 [ICON_SCIENCE] 科技值、[ICON_CULTURE] 文化值、[ICON_GOLD] 金币和 [ICON_FAITH] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_TO_THE_GLORY_OF_GOD_NAME",                   "荣神益人"),
    ("zh_Hans_CN",  "LOC_BELIEF_TO_THE_GLORY_OF_GOD_DL_DESCRIPTION",         "招募伟人-25% [ICON_faith] 信仰值花费。 每当一位伟人完全激活或隐退后，有33%的几率获得一个 [ICON_GreatWork_Relic] 遗物。"), -- 每次招募伟人时，获得50 [ICON_FAVOR] 外交支持。
    ("zh_Hans_CN",  "LOC_BELIEF_FEED_THE_WORLD_DL_DESCRIPTION",              "神社提供+3 [ICON_FOOD] 食物，+2 [ICON_HOUSING] 住房。寺庙提供+6 [ICON_FOOD] 食物，+2 [ICON_HOUSING] 住房。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CHORAL_MUSIC_DL_DESCRIPTION",                "神社提供+3 [ICON_CULTURE] 文化值。寺庙提供+6 [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_DIVINE_INSPIRATION_DL_DESCRIPTION",          "所有世界奇观+4 [ICON_Faith] 信仰值。圣地区域的 [ICON_Faith] 信仰值相邻加成提供额外等量的 [ICON_Faith] 信仰值。完成世界奇观后返还等同于奇观所需产能一半的 [ICON_Faith] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_JESUIT_EDUCATION_DL_DESCRIPTION",            "可以使用 [ICON_Faith] 信仰值购买学院区域内的建筑。每人口提供0.2 [ICON_Science] 科技值，若城市有神社则变为2倍，有寺庙则变为3倍。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIQUARIES_DL_DESCRIPTION",                 "[ICON_GreatWork_Relic] 遗物能产出3倍的 [ICON_Faith] 信仰值和 [ICON_Tourism] 旅游业绩。神社和寺庙提供的 [ICON_Tourism] 旅游业绩等于其固定产出的 [ICON_Faith] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_COMMUNITY_DL_DESCRIPTION",         "信奉该宗教的城市，圣地中每座建筑为此城出发的国际 [ICON_TradeRoute] 贸易路线+1 [ICON_Science] 科技值，使每条通往此城的国际 [ICON_TradeRoute] 贸易路线为本城+1 [ICON_Science] 科技值。可用 [ICON_Faith] 信仰值购买商人，用 [ICON_FAITH] 信仰值和 [ICON_GOLD] 金币购买商人的费用降低20%。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_ART_NAME",                         "宗教艺术"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_ART_DL_DESCRIPTION",               "圣地区域的 [ICON_Faith] 信仰值相邻加成也提供 [ICON_Culture] 文化值。可以使用 [ICON_Faith] 信仰值购买剧院广场区域建筑。"),
    ("zh_Hans_CN",  "LOC_BELIEF_WORK_ETHIC_DL_DESCRIPTION",                  "信奉该宗教的城市，圣地和神社给相邻的单元格+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PRACTICAL_APPLICATION_NAME",                 "经世致用"),
    ("zh_Hans_CN",  "LOC_BELIEF_PRACTICAL_APPLICATION_DL_DESCRIPTION",       "信奉该宗教的城市，每 [ICON_Citizen] 人口提供1.5 [ICON_Gold] 金币。 信教城市中的每个信徒+2% [ICON_Gold] 金币产出。"),
    ("zh_Hans_CN",  "LOC_BELIEF_RELIGIOUS_COLONIZATION_DL_DESCRIPTION",      "用 [ICON_GOLD] 金币购买开拓者和建造者的费用降低20%，若可用[ICON_FAITH] 信仰值购买，则也降低20% 。可以使用 [ICON_Faith] 信仰值购买政府区和外交区建筑。"),
    ("zh_Hans_CN",  "LOC_BELIEF_ZEN_MEDITATION_DL_DESCRIPTION",              "若圣地相邻山脉，+1 [ICON_Amenities] 宜居度；相邻森林，+1 [ICON_Amenities] 宜居度；相邻河流，+2 [ICON_housing] 住房。市中心也获得相同加成。"),
    ("zh_Hans_CN",  "LOC_BELIEF_INITIATION_RITES_NAME",                      "入会仪式"),
    ("zh_Hans_CN",  "LOC_BELIEF_INITIATION_RITES_DL_DESCRIPTION",            "利用宗教单位使城市首次改变信仰时，该城市每拥有1点 [ICON_Citizen] 人口，则提供50点 [ICON_Gold] 金币（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_ITINERANT_PREACHERS_DL_DESCRIPTION",         "宗教传播距离增加30%。利用宗教单位使城市首次改变信仰时，该城市每拥有1点 [ICON_Citizen] 人口，则提供15点 [ICON_Culture] 文化值（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_SCRIPTURE_DL_DESCRIPTION",                   "邻近城市的宗教传播的压力增加25%。一旦研发出印刷术，增加到50%。利用宗教单位使城市首次改变信仰时，该城市每拥有1点 [ICON_Citizen] 人口，则提供15点 [ICON_Science] 科技值（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_SCHOLASTICISM_NAME",                         "经院哲学"),
    ("zh_Hans_CN",  "LOC_BELIEF_SCHOLASTICISM_DL_DESCRIPTION",               "强化后从信仰此宗教的城市中新获得的宗教单位在神学战斗中+7 [ICON_Religion] 宗教战斗力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PIOUS_MERCHANTS_NAME",                       "虔诚商队"),
    ("zh_Hans_CN",  "LOC_BELIEF_PIOUS_MERCHANTS_DL_DESCRIPTION",             "来自 [ICON_TradeRoute] 贸易路线的宗教压力+100%。从信仰此宗教的城市出发的商路+6 [ICON_Gold] 金币，通往信仰此宗教城市的贸易路线+3 [ICON_Faith] 信仰。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MESSIAH_NAME",                               "弥赛亚"),
    ("zh_Hans_CN",  "LOC_BELIEF_MESSIAH_DL_DESCRIPTION",                     "强化后从信仰此宗教的城市中新获得的使徒将额外获得1次升级。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CANONIZATION_OF_SAINTS_NAME",                "册封圣徒"),
    ("zh_Hans_CN",  "LOC_BELIEF_CANONIZATION_OF_SAINTS_DL_DESCRIPTION",      "当您激活一位 [ICON_GreatPerson] 伟人时，其会将您所创立宗教的400点宗教压力传播到6单元格内的城市。利用宗教单位使城市首次改变信仰时，该城市每拥有1点 [ICON_Citizen] 人口，则提供25点 [ICON_Faith] 信仰（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_DEFENDER_OF_FAITH_DL_DESCRIPTION",           "战斗单位处于信奉该宗教的友好城市境内时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_JUST_WAR_DL_DESCRIPTION",                    "强化后从信仰此宗教的城市中新获得的宗教单位为同一单元格军事单位+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_HOLY_WATERS_DL_DESCRIPTION",                 "您境内位于或与海岸湖泊单元格相邻的区域和奇观+2 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MONASTIC_ISOLATION_DL_DESCRIPTION",          "您的宗教压力不会因为神学战斗失败而减少。强化后信仰此宗教的城市减少100%外来宗教压力影响，购买审判官的费用降低30%，购买的审判官+1使用次数。"),
    ("zh_Hans_CN",  "LOC_BELIEF_HOLY_ORDER_DESCRIPTION",                     "信仰此宗教的城市购买传教士和使徒的费用降低30%。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MISSIONARY_ZEAL_DESCRIPTION",                "强化后从信仰此宗教的城市中新获得的宗教单位忽略地形和地貌的 [ICON_Movement] 移动力消耗。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MOSQUE_DL_DESCRIPTION",                      "允许建造清真寺（+2 [ICON_Faith] 信仰值；此处创建的传教士和使徒+1传教次数；所有从本城创建的宗教单位在宗教战争中+3力）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PAGODA_DL_DESCRIPTION",                      "允许建造宝塔（+2 [ICON_Faith] 信仰值，+3 [ICON_Culture] 文化值；本城+10% [ICON_CULTURE] 文化值）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_WAT_DL_DESCRIPTION",                         "允许建造佛寺（+2 [ICON_Faith] 信仰值，+3 [ICON_Science] 科技值；本城+10% [ICON_SCIENCE] 科技值）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_SYNAGOGUE_DL_DESCRIPTION",                   "允许建造犹太教堂（+5 [ICON_Faith] 信仰值；本城+10% [ICON_FAITH] 信仰值）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_GURDWARA_DL_DESCRIPTION",                    "允许建造谒师所（+2 [ICON_Faith] 信仰值，+3 [ICON_Food] 食物，+1 [ICON_Housing] 住房；本城+10%人口增长速度）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MEETING_HOUSE_DL_DESCRIPTION",               "允许建造礼拜堂（+2 [ICON_Faith] 信仰值，+3 [ICON_Production] 生产力；本城+10% [ICON_PRODUCTION] 生产力）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_STUPA_DL_DESCRIPTION",                       "允许建造窣堵波（+2 [ICON_Faith] 信仰值、+2 [ICON_Amenities] 宜居度；本城每种已开发的奢侈品 +1 [ICON_AMENITIES] 宜居度）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CATHEDRAL_DL_DESCRIPTION",                   "允许建造大教堂（+2 [ICON_Faith] 信仰值，可放置1个 [ICON_GreatWork_Landscape] 艺术巨作。[NEWLINE] 本城 [ICON_GreatWork_Landscape] 艺术巨作产出的 [ICON_CULTURE] 文化值和 [ICON_TOURISM] 旅游业绩+100%）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_DAR_E_MEHR_DL_DESCRIPTION",                  "允许建造拜火神庙（+2 [ICON_Faith] 信仰值；建造或上次修复后的每个时代均额外+2 [ICON_FAITH] 信仰值；完成后，获得一个传教士）。 ");

