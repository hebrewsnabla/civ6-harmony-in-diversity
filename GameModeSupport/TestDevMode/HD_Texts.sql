--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                     Text)
values
    ("LOC_BELIEF_ABBOT_DL_DESCRIPTION",                                       "+1 [ICON_Production] Production for Holy Site Districts. Holy Site District and Shrine provide +1 [ICON_Production] Production to all adjacent tiles."),
    ("LOC_UNIT_GURU_DESCRIPTION",                                             "May use a charge to heal itself and all adjacent friendly religious units. May not initiate theological combat with units of other Religions (but can defend). Religious units adjacent to Gurus receive +5 [ICON_Religion] Religious Strength in Theological Combat and +1 [ICON_Movement] Movement."),
    ("LOC_BUILDING_MEENAKSHI_TEMPLE_DESCRIPTION",                             "+2 [ICON_FOOD] Food for Holy Site Districts. Holy Site District, Shrine and Temple provide +1 [ICON_FOOD] Food to all adjacent tiles. Your cities may purchase Builders and Settlers using [ICON_Faith] Faith. Must be built adjacent to a Holy Site and you must have founded a Religion."),
    ("LOC_TRAIT_CIVILIZATION_GREAT_MOUNTAINS_DESCRIPTION",                    "Citizens may work Mountain tiles. Mountain tiles provide +3 [ICON_PRODUCTION] Production and. +1 [ICON_FOOD] Food to Mountain tiles for every adjacent Terrace Farm. +1 [ICON_PRODUCTION] Production after researching Construntion. Reduces the purchase cost of mountain tiles by 50%."),
    ("LOC_ARYABHATA_CAMPUS_AMENITY",                                          "Chosen Campus gains 2 [ICON_AMENITIES] Amenities."),
    ("LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",                               "[ICON_ENVOY] Envoys spread +150 Religious Pressure. City-State leveraging costs 20% less. +1 or +2 [ICON_Envoy] Envoy at each City-State when it first adopts this Religion. City-States you are a suzerain of provide +2 [ICON_FAITH] Faith and +2 [ICON_GOLD] Gold."),
    -- ("LOC_BUILDING_CASA_DE_CONTRATACION_DESCRIPTION",                         "Gain 2 [ICON_Governor] Governor promotions. All your cities not on your original [ICON_Capital] Capital's continent with a [ICON_Governor] Governor gain +15% [ICON_Production] Production, +15% [ICON_Faith] Faith and +15% [ICON_Gold] Gold. Must be built adjacent to a Government Plaza."),
    -- ("LOC_BUILDING_ORSZAGHAZ_DESCRIPTION",                                    "+2 Diplomatic Victory Points when built. Gain 1 [ICON_Governor] Governor promotions. All cities receive a +5% corresponding boost to the Type of Alliance. [NEWLINE][NEWLINE]Must be built on a River."),
    ("LOC_WON_CL_KINKAKU_DESCRIPTION",                                        "For Holy Site districts that within 4 tiles, their [ICON_Faith] Faith adjacency bonus provides [ICON_Production] Production as well. +2 [ICON_Culture] Culture for Encampments that within 4 tiles. Must be built on a Lake tile adjacent to land.");
    -- ("LOC_BUILDING_GREAT_ZIMBABWE_DESCRIPTION",                               "+1 [ICON_TradeRoute] Trade Route capacity.[NEWLINE][NEWLINE]Your [ICON_TradeRoute] Trade Routes from this city get +3 [ICON_Gold] Gold for every Bonus resource within 3 tiles of the city and in this city's territory.[NEWLINE][NEWLINE] Must be built adjacent to a Commercial Hub district with a Market and adjacent to [ICON_RESOURCE_CATTLE] Cattle.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                 Text)
values
    ("zh_Hans_CN",  "LOC_BELIEF_ABBOT_DL_DESCRIPTION",                                   "圣地区域+1 [ICON_Production] 生产力。圣地区域和神社为相邻的单元格提供+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_UNIT_GURU_DESCRIPTION",                                         "消耗次数可治疗其自身以及相邻的全部友方宗教单位。无法发起和其他宗教单位的神学战争（但可进行防御）。与上师相邻的宗教单位在神学战争中+5 [ICON_Religion] 宗教战斗力、+1 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_MEENAKSHI_TEMPLE_DESCRIPTION",                         "圣地区域+2 [ICON_Food] 食物。圣地区域、神社和寺庙为相邻的单元格提供+1 [ICON_Food] 食物。允许您的城市使用 [ICON_Faith] 信仰值购买建造者和开拓者。必须建在圣地旁，同时必须已创立宗教。"),
    ("zh_Hans_CN",  "LOC_TRAIT_CIVILIZATION_GREAT_MOUNTAINS_DESCRIPTION",                "公民可在山脉单元格上工作。山脉单元格提供+3 [ICON_PRODUCTION] 生产力。每个相邻的梯田农场为山脉单元格+1 [ICON_FOOD] 食物。解锁建造科技后，每个相邻的梯田农场为山脉单元格+1 [ICON_PRODUCTION] 生产力。山脉单元格购买费用降低50%。"),
    ("zh_Hans_CN",  "LOC_ARYABHATA_CAMPUS_AMENITY",                                      "选定的学院获得2点 [ICON_AMENITIES] 宜居度。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",                           "将一个 [ICON_ENVOY] 使者派遣至城邦后，将对该城邦施加150点宗教压力。征兵费用减少20%。除了城邦的任务外，城邦信教将自动向该城邦派遣1至2个 [ICON_Envoy] 使者。每个宗主的城邦提供+2 [ICON_FAITH] 信仰和+2 [ICON_GOLD] 金币。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_CASA_DE_CONTRATACION_DESCRIPTION",                     "获得2次 [ICON_Governor] 总督升级。所有与原始 [ICON_Capital] 首都不在同一大陆、且拥有 [ICON_Governor] 总督的城市 [ICON_Production] 生产力+15%、[ICON_Faith] 信仰值+15%、[ICON_Gold] 金币+15%。必须建造在市政广场旁。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_ORSZAGHAZ_DESCRIPTION",                                "建成时+2外交胜利点数。获得1次 [ICON_Governor] 总督升级。所有城市根据每种已结成的同盟类型获得对应的产出+5%。[NEWLINE][NEWLINE]必须修建在河边。"),
    ("zh_Hans_CN",  "LOC_WON_CL_KINKAKU_DESCRIPTION",                                    "4个单元格内的圣地的 [ICON_Faith] 信仰值相邻加成也提供 [ICON_Production] 生产力，4个单元格内的军营+2 [ICON_Culture] 文化值。必须建在靠近陆地的湖泊单元格。");
    -- ("zh_Hans_CN",  "LOC_BUILDING_GREAT_ZIMBABWE_DESCRIPTION",                           "[ICON_TradeRoute] 贸易路线容量+1。[NEWLINE][NEWLINE]城市领土中3个单元格以内的每个加成资源将为从此城市发源的 [ICON_TradeRoute] 贸易路线+3 [ICON_Gold] 金币。[NEWLINE][NEWLINE]必须建在与商业中心区域（要求拥有市场）和 [ICON_RESOURCE_CATTLE] 牛资源相邻的单元格上。");

--------------------------------------------------------------------------------------------------------------------------------
-- dev used for v1.0.7
--------------------------------------------------------------------------------------------------------------------------------
-- -- Language: en_US
-- insert or replace into EnglishText
--     (Tag,                                                                     Text)
-- values
--     ("LOC_LEADER_TRAIT_ANTANANARIVO_DESCRIPTION",                             "Your Civilization gains +2% [ICON_Culture] Culture for each Great Person it has ever earned, up to a total of +20%."),
--     ("LOC_CIVILIZATION_ANTANANARIVO_BONUS",                                   "Your Civilization gains +2% [ICON_Culture] Culture for each Great Person it has ever earned, up to a total of +20%."),
--     ("LOC_GOVT_INHERENT_BONUS_AUTOCRACY_ETHIOPIA",                            "+2 to all yields for each building inside Government Plaza, building inside Diplomatic Quarter and palace in a city."),
--     ("LOC_GOVT_INHERENT_BONUS_AUTOCRACY_XP1",                                 "+2 to all yields for each building inside Government Plaza and palace in a city."),
--     ("LOC_DISTRICT_INDUSTRIAL_ZONE_HD_DESCRIPTION",                           "A district in your city for industrial activity. All [ICON_Citizen] citizens in this city provide +0.5 [ICON_PRODUCTION] Production."),
--     ("LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION",                                   "A district unique to Gaul that is cheaper than the district it replaces, the Industrial Zone. The Oppidum district is defensible with a ranged attack. All [ICON_Citizen] citizens in this city provide +0.5 [ICON_PRODUCTION] Production. When the first Oppidum is constructed, the Metal Casting technology is unlocked.[NEWLINE][NEWLINE]+2 [ICON_Production] Production adjacency bonus from Quarries and Strategic resources. -1 Appeal to adjacent tiles."),
--     ("LOC_BELIEF_WORK_ETHIC_DL_DESCRIPTION",                                  "+1 [ICON_Production] Production for all Speciality Districts. +1% [ICON_Production] Production for each citizen following this religion in the city. May purchase Industrial Zone district buildings with [ICON_Faith] Faith.");

-- -- Language: zh_Hans_CN
-- insert or replace into LocalizedText
--     (Language,      Tag,                                                                 Text)
-- values
--     ("zh_Hans_CN",  "LOC_LEADER_TRAIT_ANTANANARIVO_DESCRIPTION",                         "您的文明每获得1位伟人，[ICON_Culture] 文化值便+2%（上限为+20%）。"),
--     ("zh_Hans_CN",  "LOC_CIVILIZATION_ANTANANARIVO_BONUS",                               "您的文明每获得1位伟人，[ICON_Culture] 文化值便+2%（上限为+20%）。"),
--     ("zh_Hans_CN",  "LOC_GOVT_INHERENT_BONUS_AUTOCRACY_ETHIOPIA",                        "城市中每有一座宫殿、市政广场中的建筑、外交区中的建筑，便+2所有产出。"),
--     ("zh_Hans_CN",  "LOC_GOVT_INHERENT_BONUS_AUTOCRACY_XP1",                             "城市中每有一座宫殿、市政广场中的建筑，便+2所有产出。"),
--     ("zh_Hans_CN",  "LOC_DISTRICT_INDUSTRIAL_ZONE_HD_DESCRIPTION",                       "您城市里的工业活动区。本城每位 [ICON_Citizen] 公民+0.5 [ICON_PRODUCTION] 生产力。"),
--     ("zh_Hans_CN",  "LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION",                               "高卢特色区域，替代“工业区”，建造花费更低。“奥皮杜姆”区域具有防御力且可执行远程攻击。本城每位 [ICON_Citizen] 公民+0.5 [ICON_PRODUCTION] 生产力。建成此区域后，即可解锁“金属铸造”科技。[NEWLINE][NEWLINE]每与一个采石场改良设施或战略资源相邻，则+2 [ICON_Production] 生产力。为相邻单元格-1魅力。"),
--     ("zh_Hans_CN",  "LOC_BELIEF_WORK_ETHIC_DL_DESCRIPTION",                              "专业化区域+1 [ICON_Production] 生产力，城市中每个信仰此宗教的居民将使 [ICON_Production] 生产力+1%，可以使用 [ICON_Faith] 信仰值购买工业区内的建筑。");

--------------------------------------------------------------------------------------------------------------------------------
-- dev used for v1.0.5
--------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------
-- Language: en_US
-- insert or replace into EnglishText
--     (Tag,                                                                     Text)
-- values
    -- ("LOC_TECH_SQUARE_RIGGING_HD_DESCRIPTION",                                "+1 [ICON_Movement] Movement for embarked units.[NEWLINE]Naval melee units gain the ability: Can escort moving civilian and support units at their higher [ICON_Movement] Movement speed."),
    -- ("LOC_BELIEF_FISHING_TRADITION_NAME",                                     "Fishing Traidition"),
    -- ("LOC_BELIEF_FISHING_TRADITION_DL_DESCRIPTION",                           "+1 [ICON_Production] Production and +2 [ICON_Gold] Gold from Fishing Boats over Bonus Resources."),
    -- ("LOC_BELIEF_GOD_OF_THE_SEA_DL_DESCRIPTION",                              "+1 [ICON_Food] Food from Fishing Boats over Luxury Resources. +1 [ICON_Science] Science from Fishing Boats for the cities have Holy Site. +2 [ICON_GreatProphet] Great Prophet point per turn if a city owns a Fishing Boats."),
    -- ("LOC_BELIEF_DANCE_OF_THE_AURORA_DL_DESCRIPTION",                         "Holy Site districts get +1 [ICON_Faith] Faith from each adjacent Tundra tile. Holy Site provides +1 [ICON_Culture] Culture to all adjacent Tundra tiles. +2 [ICON_GreatProphet] Great Prophet point per turn if Holy Site is located on Tundra or Tundra Hills tiles. "),
    -- ("LOC_BELIEF_MESSENGER_OF_THE_GODS_DL_DESCRIPTION",                       "When chosen receive two recon units in your capital. The recon units start with a free promotion if they do not have. +1 [ICON_Movement] Movement for all Recon Units."),
    -- ("LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",                               "[ICON_ENVOY] Envoys spread +200 Religious Pressure. City-State leveraging costs 20% less. +1 or +2 [ICON_Envoy] Envoy at each City-State when it first adopts this Religion. City-States you are a suzerain of provide +2 [ICON_FAITH] Faith and +2 [ICON_GOLD] Gold."),
    -- ("LOC_BUILDING_HUEY_TEOCALLI_DESCRIPTION",                                "+1 [ICON_Amenities] Amenity from entertainment for each Lake tile within one tile of Huey Teocalli. +1 [ICON_Food] Food and +1 [ICON_Production] Production for each Lake tile in your empire. Must be built on a Lake tile adjacent to land."),
    -- ("LOC_BUILDING_COLOSSUS_DESCRIPTION",                                     "+1 [ICON_TradeRoute] Trade Route capacity. Grants a Trader unit. Each Fishing Boat owned by this city adds 1 [ICON_GOLD] Gold to international trade route yield from this city. [NEWLINE][NEWLINE]Must be built on the Coast, adjacent to land and a Harbor district."),
    -- ("LOC_BUILDING_ITSUKUSHIMA_DESCRIPTION",                                  "Coast and Lake tiles provide standard adjacency bonus for Holy Site and Theater Square. +1 Appeal to all tiles in this city. [NEWLINE][NEWLINE]Must be built on Coast adjacent to a Holy Site District."), -- standard adjacency bonus for
    -- ("LOC_BUILDING_WORKSHOP_DESCRIPTION",                                     "All mines in this city gain +1 [ICON_PRODUCTION] Production. +5% [ICON_Production] Production towards wonders, districts and buildings in this city."),
    -- ("LOC_TRAIT_LEADER_HWARANG_DESCRIPTION",                                  "+3 [ICON_Amenities] Amenities, +5 [Icon_Housing] Housing and +20 Loyalty per turn for your Capital and cities with an assigned Governor. -2 [ICON_Amenities] Amenities, -20 Loyalty per turn and -50% to all yields for cities that are not your Capital and do not have an assigned Governors. +25% [ICON_PRODUCTION] Production towards Districts and Buildings for cities that have a Seowon district. +15% [ICON_Production] Production and +15% [ICON_FOOD] Food for Cities have a Library. +100% Districts Adjacency (of corresponding yields) to all Districts for Cities that have a University. Cities with a Research Lab gain +10% to all yields and +1 to all [ICON_CITIZEN] citizen yields."),
    -- ("LOC_TRAIT_LEADER_GRAND_EMBASSY_DESCRIPTION",                            "Can purchase buildings in Industrial Zone with [ICON_FAITH] Faith. -10% [ICON_FAITH] Faith cost when patronizing Great Person."),
    -- ("LOC_TRAIT_CIVILIZATION_MOTHER_RUSSIA_EXPANSION2_DESCRIPTION",           "+1 [ICON_Food] Food for all Tundra Districts. Extra territory upon founding cities. +1 [ICON_Faith] Faith and +1 [ICON_Production] Production from Tundra. Units do not receive damage from Blizzards. Civilizations that are at war with Russia receive +100% unit damage from Blizzards in Russian territory."),
    -- ("LOC_TRAIT_RADIO_ORANJE_DESCRIPTION",                                    "For each [ICON_TradeRoute] Trade Routes to foreign cities or from foreign cities, the specialty districts provide yields to you as if they were international destination."),
    -- ("LOC_BOOST_TRIGGER_MASS_PRODUCTION",                                     "Build 2 Lumber Mills."),
    -- ("LOC_BUILDING_DUMMY_MAGNUS_DESCRIPTION",                                 "Created when Governor Magnus with General Services Officer title that estabilished within 9 tiles."),
    -- ("LOC_BUILDING_GENERAL_SERVICE_DESCRIPTION",                              "When the Governor Magnus with the Promotion ""General Services Officer"" is estabilished in this city, the General Service Office can provide +2 of all yields to the cities within 9 tiles (this city included). Can only construct when Governor Magnus with General Services Officer Title is established within 9 tiles. "),
    -- ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_DESCRIPTION",     "When the Governor Magnus estabilished in city, the General Service Office of the city can provide +2 of all yields to the cities within 9 tiles."),
    -- ("LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_DESCRIPTION",                "Each Commercial and Harbor building in the city increase city [ICON_Gold] Gold yield output by 5%."),
    -- ("LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",        "Gain 50% more yields for international [ICON_TradeRoute] Trade Routes from this city when player has complete the Exploration Civic.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
-- insert or replace into LocalizedText
--     (Language,      Tag,                                                                 Text)
-- values
    -- ("zh_Hans_CN",  "LOC_TECH_SQUARE_RIGGING_HD_DESCRIPTION",                            "水运单位+1 [ICON_Movement] 移动力。[NEWLINE]海军近战单位获得能力：可利用自身的高 [ICON_Movement] 移动力护送平民和支援单位。"),
    -- ("zh_Hans_CN",  "LOC_BELIEF_FISHING_TRADITION_NAME",                                 "捕鱼传统"),
    -- ("zh_Hans_CN",  "LOC_BELIEF_FISHING_TRADITION_DL_DESCRIPTION",                       "改良加成资源的渔船+1 [ICON_Production] 生产力和+2 [ICON_Gold] 金币。"),
    -- ("zh_Hans_CN",  "LOC_BELIEF_GOD_OF_THE_SEA_DL_DESCRIPTION",                          "改良奢侈资源的渔船+1 [ICON_Food] 食物。拥有圣地的城市，渔船+1 [ICON_Science] 科技值。如城市中有渔船，则每回合+2 [ICON_GreatProphet] 大预言家点数。"),
    -- ("zh_Hans_CN",  "LOC_BELIEF_DANCE_OF_THE_AURORA_DL_DESCRIPTION",                     "圣地区域从每个相邻的冻土单元格+1 [ICON_Faith] 信仰值。圣地给相邻的冻土单元格+1 [ICON_Culture] 文化值。若圣地位于冻土或冻土丘陵则每回合+2 [ICON_GreatProphet] 大预言家点数。"),
    -- ("zh_Hans_CN",  "LOC_BELIEF_MESSENGER_OF_THE_GODS_DL_DESCRIPTION",                   "选择后即可在首都中获得2个侦察单位，若其初始未拥有免费升级，则获得一次免费升级。所有侦察类型的单位+1 [ICON_Movement] 移动力。"),
    -- ("zh_Hans_CN",  "LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",                           "将一个 [ICON_ENVOY]使者派遣至城邦后，将对该城邦施加200点宗教压力。征兵费用减少20%。除了城邦的任务外，城邦信教将自动向该城邦派遣1至2个 [ICON_Envoy] 使者。每个宗主的城邦提供+2 [ICON_FAITH] 信仰和+2 [ICON_GOLD] 金币。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_HUEY_TEOCALLI_DESCRIPTION",                            "在休伊神庙一个单元格以内的每个湖泊单元格为城市+1 [ICON_Amenities] 宜居度。为您帝国内的每个湖泊单元格+1 [ICON_Food] 食物和+1 [ICON_Production] 生产力。必须建在靠近陆地的湖泊单元格上。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_COLOSSUS_DESCRIPTION",                                 "+1 [ICON_TradeRoute] 贸易路线容量。获得1个商人单位。 本城拥有的每个渔船为从该城出发的国际商路+1 [ICON_GOLD] 金币[NEWLINE][NEWLINE]必须建在邻近陆地和港口的海岸上。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_ITSUKUSHIMA_DESCRIPTION",                              "圣地和剧院都可从海岸或湖泊单元格获得标准相邻加成。本城所有单元格+1魅力。[NEWLINE][NEWLINE]必须建在相邻圣地的海岸上。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_WORKSHOP_DESCRIPTION",                                 "为本城的矿山+1 [ICON_PRODUCTION] 生产力。本城建造区域、建筑和奇观+5% [ICON_PRODUCTION] 生产力。"),
    -- ("zh_Hans_CN",  "LOC_TRAIT_LEADER_HWARANG_DESCRIPTION",                              "首都或派遣了总督的城市获得+3 [ICON_Amenities] 宜居度，+5 [Icon_Housing] 住房和+20忠诚度。非首都且未派遣总督的城市-2 [ICON_Amenities] 宜居度，-8忠诚度，-50%全部产出。 有书院的城市建造区域和建筑+25% [Icon_Production] 生产力；有图书馆的城市+15% [ICON_Food] 食物和 [Icon_production] 生产力；有大学的城市，所有区域对应产出类型的相邻加成+100%；有实验室的城市所有产出+10%且每个人口额外1点全部产出。"),
    -- ("zh_Hans_CN",  "LOC_TRAIT_LEADER_GRAND_EMBASSY_DESCRIPTION",                        "可以用 [ICON_FAITH] 信仰购买工业区建筑。用 [ICON_FAITH] 信仰值招募伟人时所需的费用-10%。"),
    -- ("zh_Hans_CN",  "LOC_TRAIT_CIVILIZATION_MOTHER_RUSSIA_EXPANSION2_DESCRIPTION",       "所有位于冻土单元格的区域+1 [ICON_Food] 食物。建立城市可获得额外领土。冻土提供+1 [ICON_Faith] 信仰值与+1 [ICON_Production] 生产力。与俄罗斯交战的文明单位如处于俄罗斯领土中，遭遇暴风雪时受到的伤害+100%。"),
    -- ("zh_Hans_CN",  "LOC_TRAIT_RADIO_ORANJE_DESCRIPTION",                                "对于每一条 [ICON_TradeRoute] 商路连接，无论您的城市作为国际商路的起点还是终点，您都可从该城内的专业化区域获得其作为国际目的地时的加成。"),
    -- ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_MASS_PRODUCTION",                                 "建造2座伐木场。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_DUMMY_MAGNUS_DESCRIPTION",                             "当拥有总务官头衔的马格努斯总督在9环内就职时会自动创建。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_GENERAL_SERVICE_DESCRIPTION",                          "总督“马格努斯”（必须拥有“总务官”升级）在此城市就职时，总务厅为9个单元格之内的城市（包括该城市）提供额外+2所有产出。只有当拥有总务官头衔的总督马格努斯在9个单元格以内的城市就职时方可建造。"),
    -- ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_DESCRIPTION", "总督“马格努斯”就职的城市中的总务厅可为9个单元格之内的城市提供+2所有产出。"),
    -- ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_DESCRIPTION",            "城市中每有一座商业中心建筑和港口建筑，[ICON_Gold] 金币产出便+5%。"),
    -- ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",    "当玩家研究探索市政后，从此城开始的国际 [ICON_TradeRoute] 贸易路线收益增加50%。");
