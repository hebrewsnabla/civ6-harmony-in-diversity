insert or replace into EnglishText
    (Tag,                                           Text)
values
    -- 商港重做
    ("LOC_BUILDING_JNR_FREEPORT_DESCRIPTION",        "+1 [ICON_TRADEROUTE] Trade Route capacity."),
    -- 教堂和寺庙给的鸽子出口统一
    ("LOC_BUILDING_TEMPLE_DESCRIPTION",              "Allows the purchasing of Settlers using [ICON_FAITH] Faith. Allows the purchasing of Apostles, Gurus, Inquisitors, and with the proper belief, Warrior Monks (these units can only be purchased with [ICON_FAITH] Faith). +5% [ICON_FAITH] Faith in this city.[NEWLINE][NEWLINE]May not be built in a Holy Site district that already has a Church."),
    ("LOC_BUILDING_JNR_MONASTERY_DESCRIPTION",       "Allows the purchasing of Settlers using [ICON_FAITH] Faith. Allows the purchasing of Apostles, Gurus, Inquisitors, and with the proper belief, Warrior Monks (these units can only be purchased with [ICON_FAITH] Faith).[NEWLINE][NEWLINE]May not be built in a Holy Site district that already has a Temple."),
    ("LOC_BUILDING_PRASAT_DESCRIPTION_UC_JNR",       "A building unique to Khmer. Replaces the Temple. Allows the purchasing of Settlers using [ICON_FAITH] Faith. Allows the purchasing of Apostles, Gurus, Inquisitors, and with the proper belief, Warrior Monks (these units can only be purchased with [ICON_Faith] Faith). [ICON_CITIZEN] Citizens in this is provide +0.5 [ICON_Culture] Culture. +5% [ICON_Faith] Faith in this city.[NEWLINE][NEWLINE]May not be built in a Holy Site district that already has a Church."),
    ("LOC_BUILDING_STAVE_CHURCH_DESCRIPTION_UC_JNR", "A building unique to Norway. Replaces the Church. Allows the purchasing of Settlers using [ICON_FAITH] Faith. Allows the purchasing of Apostles, Gurus, Inquisitors, and with the proper belief, Warrior Monks (these units can only be purchased with [ICON_FAITH] Faith). Holy Site districts get an additional standard adjacency bonus from Woods. +1 [ICON_PRODUCTION] Production to each coast Resource tile in this city. +1 [ICON_FOOD] Food to each Forest tile in this city.[NEWLINE][NEWLINE]May not be built in a Holy Site district that already has a Temple."),
    ("LOC_BELIEF_WARRIOR_MONKS_EXPANSION2_DESCRIPTION", "Allows spending [ICON_FAITH] Faith to train Warriors Monks (A land combat unit) in cities with a Temple or a Church. Culture Bomb adjacent tiles when completing a Holy Site. Holy Site provides extra [ICON_FAITH] Faith equal to their district adjacency bonus."),
    ("LOC_UNIT_WARRIOR_MONK_DESCRIPTION",   "Fast-moving land combat unit with a unique promotion tree. Can only be purchased with [ICON_FAITH] Faith in city with a Temple or a Church."),
    -- 瑞纳4跨国公司金币加成回调到100%
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",            "+100% [ICON_Gold] Gold yield for international [ICON_TradeRoute] Trade Routes starting from the city when player has the 'Exploration' Civic."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION_CORP",       "International [ICON_TradeRoute] Trade Routes from this City provide +100% [ICON_Gold] Gold after finishing the 'Exploration' civic. [ICON_Greatwork_Product] Product provide +100% [ICON_Tourism] Tourism in this City after finishing the 'Capitalism' Civic."),
    -- 航海家汉诺
    ("LOC_ABILITY_HANNO_DESCRIPTION",       "+2 [ICON_MOVEMENT] Movement. Escorted units move at the same speed."),
    ("LOC_GREAT_PERSON_INDIVIDUAL_HANNO_THE_NAVIGATOR_FREE_UNIT",       "Creates a naval melee unit with +2 [ICON_MOVEMENT] Movement. Escorted units with it move at the same speed."),
    -- 情报局能力给外交办，情报局重置为贸易本埠
    ("LOC_BUILDING_GOV_SPIES_NAME",         "Trade Capital"),
    ("LOC_BUILDING_GOV_SPIES_DESCRIPTION",  "+1 [ICON_TRADEROUTE] Trade Route capacity. Each of your city yields +4% [ICON_GOLD] Gold for each Commercial Hub building and each Harbor building in that city. Your [ICON_TRADEROUTE] Trade Routes provide additional +3 [ICON_GOLD] Gold for passing through each of your[ICON_TRADINGPOST] Trading Post in foreign city.[NEWLINE]Awards +1 [ICON_GOVERNOR] Governor Title."),
    ("LOC_BUILDING_CHANCERY_DESCRIPTION",   "Receive one Spy and +1 Spy capacity. +1 [ICON_VISLIMITED] Visibility level on all other Civs. All Spy Operations have a higher chance of success. Spy mission time reduces by 25%. Your Spy units can choose from any possible promotion. +50% [ICON_PRODUCTION] toward Spies in all Cities.+3 Influence Points per turn. When this civilization captures or kills an enemy Spy, receive 50 [ICON_SCIENCE] Science for every level of the enemy Spy. Alliance Points with all allies increase by an additional 0.5 per turn. Gain +1 [ICON_ENVOY] Envoy."),
    ("LOC_MOMENT_CATEGORY_SCIENTIFIC_BONUS_GOLDEN_AGE", "Free Inquiry Golden Age:[NEWLINE][ICON_TECHBOOSTED] Eurekas provide an additional 10% of technology costs. Each different District and Building provides +1 [ICON_SCIENCE] Science to your capital."),
    -- 殖民地办事处
    ("LOC_POLICY_COLONIAL_OFFICES_DESCRIPTION",                                       "+5 [ICON_Food] Food, +10% Growth rate and +5 Loyalty per turn for cities not on your original [ICON_Capital] Capital's continent."),
    -- 刚果
    ("LOC_TRAIT_LEADER_RELIGIOUS_CONVERT_DESCRIPTION",                "May not build Holy Site districts, gain Great Prophets, or found Religions. Gains all Beliefs of any Religion that has established itself in a majority of his cities. Receives an Apostle each time he finishes a M'banza or Theater Square district (of that city's majority Religion). Receive Theology [ICON_CivicBoosted] Inspiration, Divine Right [ICON_CivicBoosted] Inspiration and Reformed Church [ICON_CivicBoosted] Inspiration when Mbanza is first built. While adopting Theocracy government, citizens in cities with Mbanza provide +1 [ICON_FAITH] Faith."),
    ("LOC_BUILDING_MEENAKSHI_TEMPLE_DESCRIPTION",                   "Grants 2 Gurus. Holy Site districts provide +2 [ICON_FOOD] Food. Buildings in Holy Site district provide +4 [ICON_FOOD] Food. Allows your Cities to purchase Builders and Settlers using [ICON_Faith] Faith. Must be built adjacent to a Holy Site and you must have founded a Religion."),
    ("LOC_BUILDING_KILWA_KISIWANI_DESCRIPTION",               "+3 [ICON_ENVOY] Envoys when built. When you are the Suzerain of a City-State this city receives a +15% boost to the Type bonuses provided by that City-State. If you are the Suzerain to 2 or more City-States of that type this city receives an additional +15% boost to the Type bonuses provided by those City-States. Must be built on a flat tile adjacent to Coast."),
    ("LOC_BUILDING_STATUE_LIBERTY_EXPANSION2_DESCRIPTION",              "+4 Diplomatic Victory point. Coastal Cities within 9 tiles receive +4 [ICON_CULTURE] Culture and +4 [ICON_AMENITIES] Amenities. [NEWLINE][NEWLINE]Must be built on a Coast tile, adjacent to land and a Harbor district."),
    ("LOC_TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES_DESCRIPTION",     "Begin the game with the Writing technology [ICON_TechBoosted] Eureka and Foreign Trade [ICON_CivicBoosted] Inspiration. Coastal cities founded by Phoenicia and located on the same continent as the Phoenician [ICON_Capital] Capital are 100% Loyal. Settlers gain +2 [ICON_Movement] Movement and +2 sight range while embarked. Settlers ignore additional [ICON_Movement] Movement costs from embarking and disembarking. International [ICON_Traderoute] Trade Routes provide +2 [ICON_Culture] culture; this bonus is tripled when the destination is a City-State you are the Suzerain of."),
    ("LOC_TRAIT_LEADER_RAVEN_KING_DESCRIPTION",                       "Levied units gain an ability giving them +2 [ICON_Movement] Movement and +5 [ICON_Strength] Combat Strength. It costs 50% less [ICON_GOLD] Gold and resources to upgrade Levied units. If you Levy troops from a City-State, receive 2 [ICON_ENVOY] Envoys in that City-State. Gain the Black Army unique unit when the 'Castles' technology is researched."),
    ("LOC_BUILDING_APADANA_DESCRIPTION",                      "+2 [ICON_ENVOY] Envoys when you build a wonder, including Apadana, in this city. Must be built adjacent to your [ICON_CAPITAL] Capital."),
    ("LOC_BUILDING_CASA_DE_CONTRATACION_DESCRIPTION",         "Gain 3 [ICON_Governor] Governor titles. All your cities not on your original [ICON_Capital] Capital's continent with a [ICON_Governor] Governor gain +15% [ICON_Production] Production, +15% [ICON_Faith] Faith and +15% [ICON_Gold] Gold. Must be built adjacent to a Government Plaza."),
    ("LOC_BUILDING_ORSZAGHAZ_DESCRIPTION",                    "+2 Diplomatic Victory Points and +4 [ICON_ENVOY] Envoys when built. Doubles the effect of each Wildcard Policy in your government. Receive +100% [ICON_Favor] Diplomatic Favor per turn from starting a turn as Suzerain of a City-State.[NEWLINE][NEWLINE]Must be built next to a River."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_DESCRIPTION",                   "City-state units gain +4 [ICON_Strength] Combat Strength if you are its Suzerain (including Leveraged Units) and cost 20% less [ICON_GOLD] Gold to levy troops. Amani now acts as 3 [ICON_Envoy] envoys (instead of 2). When established in a city-state, provide you with its Strategic and Luxury resources, doubled if you are its Suzerain."),
    ("LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",               "[ICON_ENVOY] Envoys spread +150 Religious Pressure. City-State leveraging costs 20% less. City-States you are Suzerain of provide +2 [ICON_FAITH] Faith and +4 [ICON_GOLD] Gold."),
    ("LOC_TRAIT_CIVILIZATION_WONDER_TOURISM_DESCRIPTION",             "+20% [ICON_Production] Production toward Medieval, Renaissance, and Industrial era wonders. [ICON_Tourism] Tourism from wonders of any era is +200%. Each time you complete a Wonder, gain [ICON_GREATWRITER] Great Writer, [ICON_GREATARTIST] Great Artist and [ICON_GREATMUSICIAN] Great Musician Points each equals to 20% of its production cost."),
    ("LOC_BUILDING_TAJ_MAHAL_DESCRIPTION",                    "+1 Era Score from Historic Moment earned after this wonder is complete if that Moment is usually worth 2 or more Era Score. +8 [ICON_GOLD] Gold for all world wonders in your empire. Each time you complete a wonder, gain [ICON_GOLD] Gold equal to 80% of its production cost.[NEWLINE][NEWLINE]Must be built next to a River."),
    ("LOC_MINOR_CIV_SMALL_INFLUENCE_ENVOYS",              "1 [ICON_ENVOY] Envoy:"),
    ("LOC_MINOR_CIV_MEDIUM_INFLUENCE_ENVOYS",             "1 [ICON_ENVOY] Envoys:"),
    ("LOC_MINOR_CIV_LARGE_INFLUENCE_ENVOYS",              "3 [ICON_ENVOY] Envoys:"),
    ("LOC_MINOR_CIV_LARGEST_INFLUENCE_ENVOYS",            "6 [ICON_ENVOY] Envoys:"),
    ("LOC_CITY_STATES_SUZERAIN_ENVOYS",                   "3 [ICON_Envoy] Envoys, and more than any other civilization:"),
    ("LOC_BUILDING_SUK_WAT_ARUN_DESCRIPTION",             "Holy Site buildings in cities with a Worship building provide [ICON_TOURISM] Tourism equal to their intrinsic [ICON_FAITH] Faith yield. +2 Influence Points from each Worship building. Must be built along a River.");

insert or replace into LocalizedText
    (Language,      Tag,                                        Text)
values
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_FREEPORT_DESCRIPTION",    "+1 [ICON_TRADEROUTE] 贸易路线容量。"),
    ("zh_Hans_CN",  "LOC_BUILDING_TEMPLE_DESCRIPTION",          "允许使用 [ICON_FAITH] 信仰值购买开拓者。允许购买使徒、上师、审判官，拥有特定信仰还可购买武僧（这些宗教单位只能通过 [ICON_FAITH] 信仰值购买）。本城的 [ICON_FAITH] 信仰值+5%。[NEWLINE][NEWLINE]无法建造在已拥有教堂的圣地区域中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_MONASTERY_DESCRIPTION",   "允许使用 [ICON_FAITH] 信仰值购买开拓者。允许购买使徒、上师、审判官，拥有特定信仰还可购买武僧（这些宗教单位只能通过 [ICON_FAITH] 信仰值购买）。[NEWLINE][NEWLINE]无法建造在已拥有寺庙的圣地区域中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_PRASAT_DESCRIPTION_UC_JNR",               "高棉特色建筑。替代寺庙。允许使用 [ICON_FAITH] 信仰值购买开拓者。允许购买使徒、上师、审判官，拥有特定信仰还可购买武僧（这些宗教单位只能通过 [ICON_Faith] 信仰值购买）。此城中每有1点 [ICON_CITIZEN] 人口，便+0.5 [ICON_Culture] 文化值。本城的 [ICON_Faith] 信仰值+5%。[NEWLINE][NEWLINE]无法建造在已拥有教堂的圣地区域中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_STAVE_CHURCH_DESCRIPTION_UC_JNR",         "挪威特色建筑。取代教堂。允许使用 [ICON_FAITH] 信仰值购买开拓者。允许购买使徒、上师、审判官，拥有特定信仰还可购买武僧（这些宗教单位只能通过 [ICON_FAITH] 信仰值购买）。圣地可从树林获得额外的标准相邻加成。城市中每个森林单元格+1 [ICON_FOOD] 食物，每个海岸资源单元格+1 [ICON_PRODUCTION] 生产力。[NEWLINE][NEWLINE]无法建造在已拥有寺庙的圣地区域中。"),
    ("zh_Hans_CN",  "LOC_BELIEF_WARRIOR_MONKS_EXPANSION2_DESCRIPTION", "允许花费 [ICON_FAITH] 信仰值来在有寺庙或教堂的城市生产陆地战斗单位“武僧”。建成圣地后对相邻单元格施放文化炸弹。圣地区域的 [ICON_FAITH] 信仰值相邻加成提供额外等量的 [ICON_FAITH] 信仰值。"),
    ("zh_Hans_CN",  "LOC_UNIT_WARRIOR_MONK_DESCRIPTION",    "高移动力的陆地战斗单位，拥有独特的升级树。只能在有寺庙或教堂的城市通过 [ICON_FAITH] 信仰购买。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",            "研究探索市政后，从此城开始的国际 [ICON_TradeRoute] 贸易路线的 [ICON_Gold] 金币收益+100%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION_CORP",       "研究探索市政后，从此城开始的国际 [ICON_TradeRoute] 贸易路线的 [ICON_Gold] 金币收益+100%。研究资本主义市政后此城的 [ICON_GreatWork_Product] 产品提供的 [ICON_Tourism] 旅游业绩+100%"),
    ("zh_Hans_CN",  "LOC_ABILITY_HANNO_DESCRIPTION",       "+2 [ICON_MOVEMENT] 移动力。被护送的单位将以同样的速度移动。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_HANNO_THE_NAVIGATOR_FREE_UNIT",       "创建1个拥有+2 [ICON_MOVEMENT] 移动力的海军近战单位。被该单位护送的单位将以同样的速度移动。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_SPIES_NAME",         "贸易本埠"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_SPIES_DESCRIPTION",  "+1 [ICON_TRADEROUTE] 贸易路线容量。全国商业和港口建筑为所在城市 +4% [ICON_GOLD] 金币产出。您的 [ICON_TRADEROUTE] 贸易路线每经过一个您在国外城市的 [ICON_TRADINGPOST] 贸易站便+3 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_BUILDING_CHANCERY_DESCRIPTION",   "获得一个间谍并+1间谍容量。对所有文明+1 [ICON_VISLIMITED] 外交能见度。所有间谍行动的成功率上升。间谍执行任务的时间缩短25%，您的间谍可以选择任何可用升级。所有城市训练间谍时+50% [ICON_PRODUCTION] 生产力。每回合影响力点数+3。此文明俘获或杀死敌方间谍时，敌方间谍每拥有一级升级，文明便获得50点 [ICON_SCIENCE] 科技值。所有盟友的同盟点数每回合额外增加0.5点。获得1名 [ICON_ENVOY] 使者。"),
    ("zh_Hans_CN",  "LOC_MOMENT_CATEGORY_SCIENTIFIC_BONUS_GOLDEN_AGE", "“自由探索”黄金时代：[NEWLINE][ICON_TECHBOOSTED]尤里卡额外提供（对应科技所需科技总量的）10%。每个不同的区域和建筑为首都提供 +1 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_POLICY_COLONIAL_OFFICES_DESCRIPTION",                                       "与您最初的 [ICON_Capital] 首都不在同一大陆的城市+5 [ICON_Food] 食物、+10%余粮、每回合提供5点忠诚度。"),
    ("zh_Hans_CN",  "LOC_TRAIT_LEADER_RELIGIOUS_CONVERT_DESCRIPTION",                "无法建造圣地区、获得大预言家，或创建宗教。从已成为多数刚果城市信仰的宗教中获得创始人信条加成。每次完成一个姆班赞或剧院广场区时获得一位（城市主流宗教的）使徒。首次建成姆班赞后，激活“神学”、“王权神授”和“归正会”市政 [ICON_CivicBoosted] 鼓舞。采用神权政体时，有姆班赞的城市每个人口产出1 [ICON_FAITH] 信仰。"),
    ("zh_Hans_CN",  "LOC_BUILDING_MEENAKSHI_TEMPLE_DESCRIPTION",            "获得2名上师。圣地提供 +2 [ICON_FOOD] 食物，每个圣地建筑提供 +4 [ICON_FOOD] 食物。允许您的城市使用 [ICON_Faith] 信仰值购买建造者和开拓者。必须建在圣地旁，同时必须已创立宗教。"),
    ("zh_Hans_CN",  "LOC_BUILDING_KILWA_KISIWANI_DESCRIPTION",               "建成后+3 [ICON_ENVOY] 使者。对于每一类城邦，若你是其中至少1个的宗主国，本城中此类城邦对应的产出+15%；若你是其中至少2个的宗主国，本城中此类城邦对应的产出额外+15%。必须建造在与海岸相邻的平坦地形上。"),
    ("zh_Hans_CN",  "LOC_BUILDING_STATUE_LIBERTY_EXPANSION2_DESCRIPTION",              "+4外交胜利点数。为9个单元格以内的所有海岸城市市中心提供：+4 [ICON_CULTURE] 文化值和+4 [ICON_AMENITIES] 宜居度。当前所有拥有港口的城市获得当前可在该区域中建造的、所需 [ICON_PRODUCTION] 生产力最低的建筑。[NEWLINE][NEWLINE]必须建造在与港口相邻且靠近陆地的海岸单元格上。"),
    ("zh_Hans_CN",  "LOC_TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES_DESCRIPTION",     "游戏开始便激活“写作”科技 [ICON_TechBoosted] 尤里卡和“对外贸易”市政 [ICON_CivicBoosted] 鼓舞。腓尼基建造的海岸城市若与 [ICON_Capital] 首都在同一大陆，则其忠诚度为100%。开拓者上船后，[ICON_Movement] 移动力与视野范围各+2。开拓者上船和下船无需额外花费 [ICON_Movement] 移动力。国际 [ICON_TradeRoute] 贸易路线+2 [ICON_CULTURE] 文化，若目的地为你宗主的城邦则该加成变为3倍。"),
    ("zh_Hans_CN",  "LOC_TRAIT_LEADER_RAVEN_KING_DESCRIPTION",                       "征集单位+2 [ICON_Movement] 移动力、+5 [ICON_Strength] 战斗力。升级征集单位所花费的 [ICON_GOLD] 金币和资源减少50%。征集城邦军队时可在该城邦增加2名 [ICON_ENVOY] 使者。研究“城堡”科技后获得特色单位“黑军”。"),
    ("zh_Hans_CN",  "LOC_BUILDING_APADANA_DESCRIPTION",                      "在此城市中建造奇观（包括阿帕达纳宫）时+2 [ICON_ENVOY] 使者。必须建造在 [ICON_CAPITAL] 首都旁。"),
    ("zh_Hans_CN",  "LOC_BUILDING_CASA_DE_CONTRATACION_DESCRIPTION",         "获得3次 [ICON_Governor] 总督升级。所有与原始 [ICON_Capital] 首都不在同一大陆、且拥有 [ICON_Governor] 总督的城市 [ICON_Production] 生产力+15%、[ICON_Faith] 信仰值+15%、[ICON_Gold] 金币+15%。必须建造在市政广场旁。"),
    ("zh_Hans_CN",  "LOC_BUILDING_ORSZAGHAZ_DESCRIPTION",                    "建成时+2外交胜利点数，+4 [ICON_ENVOY] 使者。政体中每张生效中的通配政策卡效果翻倍。成为一座城邦的宗主国后，每回合从此城邦获得的 [ICON_Favor] 外交支持+100%。[NEWLINE][NEWLINE]必须修建在河边。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_DESCRIPTION",                   "对所有宗主的城邦，其单位+4 [ICON_Strength] 战斗力（包括征召单位），征兵时花费 [ICON_GOLD] 金币-20%。派遣至城邦时，效力等同于3名 [ICON_Envoy] 使者（而不是2名），可获得其奢侈和战略（宗主时翻倍）。"),
    ("zh_Hans_CN",  "LOC_BELIEF_PAPAL_PRIMACY_DL_DESCRIPTION",               "将一个 [ICON_ENVOY]使者派遣至城邦后，将对该城邦施加150点宗教压力。征兵费用减少20%。每个宗主的城邦提供+2 [ICON_FAITH] 信仰和+4 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_TRAIT_CIVILIZATION_WONDER_TOURISM_DESCRIPTION",             "为中世纪、文艺复兴时期和工业时代的奇观+20% [ICON_Production] 生产力。 所有奇观的 [ICON_Tourism] 旅游业绩+200%。完成奇观时，获得各等同于其所需生产力20%的 [ICON_GREATWRITER] 大作家、 [ICON_GREATARTIST] 大艺术家、 [ICON_GREATMUSICIAN] 大音乐家点数。"),
    ("zh_Hans_CN",  "LOC_BUILDING_TAJ_MAHAL_DESCRIPTION",                    "此奇观建成后，提供2点或以上时代得分的历史时刻所提供的时代得分+1。所有世界奇观+8 [ICON_GOLD] 金币。完成世界奇观后返还等同于奇观所需产能80%的 [ICON_GOLD] 金币。[NEWLINE][NEWLINE]必须建在河流旁。"),
    ("zh_Hans_CN",  "LOC_MINOR_CIV_SMALL_INFLUENCE_ENVOYS",              "派遣1位 [ICON_Envoy] 使者："),
    ("zh_Hans_CN",  "LOC_MINOR_CIV_MEDIUM_INFLUENCE_ENVOYS",             "派遣1位 [ICON_Envoy] 使者："),
    ("zh_Hans_CN",  "LOC_MINOR_CIV_LARGE_INFLUENCE_ENVOYS",              "派遣3位 [ICON_Envoy] 使者："),
    ("zh_Hans_CN",  "LOC_MINOR_CIV_LARGEST_INFLUENCE_ENVOYS",            "派遣6位 [ICON_Envoy] 使者："),
    ("zh_Hans_CN",  "LOC_CITY_STATES_SUZERAIN_ENVOYS",                   "已派至少3位 [ICON_Envoy] 使者，并多于其他文明："),
    ("zh_Hans_CN",  "LOC_BUILDING_SUK_WAT_ARUN_DESCRIPTION",             "有祭祀建筑的城市内的圣地建筑产出等同于基础 [ICON_FAITH] 信仰产出的 [ICON_TOURISM] 旅游业绩。祭祀建筑+2影响力点数。必须建在临近河流的单元格中。");

-- 城邦加成文本
update LocalizedText set Text = '首都和' || Text where Language = 'zh_Hans_CN' and Tag like 'LOC_CSE_%_TRAIT_MEDIUM_INFLUENCE_BONUS';
update LocalizedText set Text = substr(Text, 0, length(Text) - 1) || ' and in your [ICON_CAPITAL] Capital.' where Language = 'en_US' and Tag like 'LOC_CSE_%_TRAIT_MEDIUM_INFLUENCE_BONUS';
-- 城邦效果
insert or replace into EnglishText
    (Tag,                                           Text)
values
    ("LOC_LEADER_TRAIT_CARDIFF_DESCRIPTION",              "Cities receive +3 [ICON_POWER] Power for every Shipyard and Seaport."),
    ("LOC_CIVILIZATION_CARDIFF_BONUS",                    "Cities receive +3 [ICON_POWER] Power for every Shipyard and Seaport."),("LOC_LEADER_TRAIT_AUCKLAND_DESCRIPTION",             "Shallow water tiles worked by  Citizens provide +1 [ICON_PRODUCTION] Production. Additional +1 [ICON_PRODUCTION] Production after researching Steam Power."),
    ("LOC_CIVILIZATION_AUCKLAND_BONUS",                   "Shallow water tiles worked by  Citizens provide +1 [ICON_PRODUCTION] Production. Additional +1 [ICON_PRODUCTION] Production after researching Steam Power."),
    ("LOC_LEADER_TRAIT_HONG_KONG_DESCRIPTION",            "Your cities get +20% Production towards city projects."),
    ("LOC_CIVILIZATION_HONG_KONG_BONUS",                  "Your cities get +20% Production towards city projects."),
    ("LOC_LEADER_TRAIT_BRUSSELS_DESCRIPTION",             "Your cities get +15% [ICON_Production] Production towards Wonders."),
    ("LOC_CIVILIZATION_BRUSSELS_BONUS",                   "Your cities get +15% [ICON_Production] Production towards Wonders."),
    ("LOC_LEADER_TRAIT_JOHANNESBURG_DESCRIPTION",         "+1 [ICON_PRODUCTION] Production  if this city owns each type of improvements （Farm, Plantation, Mine, Quarry, Lumber Mill, Pasture, or Camp) over  resources."),
    ("LOC_CIVILIZATION_JOHANNESBURG_BONUS",               "+1 [ICON_PRODUCTION] Production  if this city owns each type of improvements （Farm, Plantation, Mine, Quarry, Lumber Mill, Pasture, or Camp) over  resources."),
    ("LOC_CSE_HAVANA_TRAIT_DESCRIPTION",                  "+1 [ICON_CULTURE] Culture for Breathtaking coastal tiles."),
    ("LOC_CSE_DJIBOUTI_TRAIT_DESCRIPTION",          "+1 [ICON_FOOD] Food and +1 [ICON_PRODUCTION] Production  to all Coast and Lake tiles in this city that adjacent to City center tiles."),
    ("LOC_CSD_RIGA_TRAIT_DESCRIPTION",              "Each building inside Harbor District provide +1 [ICON_SCIENCE] Science for [ICON_TRADEROUTE] International Trade Routes start from the city."),
    ("LOC_LEADER_TRAIT_PRESLAV_DESCRIPTION",              "+2 [ICON_SCIENCE] Science from each Encampment, Barracks, Stable, Armory and Military Academy."),
    ("LOC_CIVILIZATION_PRESLAV_BONUS_XP1",                "+2 [ICON_SCIENCE] Science from each Encampment, Barracks, Stable, Armory and Military Academy."),
    ("LOC_LEADER_TRAIT_VALLETTA_DESCRIPTION",             "City Center buildings and Encampment district buildings can be bought with [ICON_FAITH] Faith. Purchasing Ancient, Medieval, and Renaissance Walls (including Tsikhe) is 50% cheaper, but they can only be bought with [ICON_FAITH] Faith."),
    ("LOC_CIVILIZATION_VALLETTA_BONUS",                   "City Center buildings and Encampment district buildings can be bought with [ICON_FAITH] Faith. Purchasing Ancient, Medieval, and Renaissance Walls (including Tsikhe) is 50% cheaper, but they can only be bought with [ICON_FAITH] Faith."),
    ("LOC_LEADER_TRAIT_BABYLON_DESCRIPTION",              "+3 [ICON_SCIENCE] Science from each [ICON_GreatWork_WRITING] Great Work of Writing, [ICON_GreatWork_RELIC] Relic and [ICON_GreatWork_Artifact] Artifact."),
    ("LOC_CIVILIZATION_BABYLON_BONUS",                    "+3 [ICON_SCIENCE] Science from each [ICON_GreatWork_WRITING] Great Work of Writing, [ICON_GreatWork_RELIC] Relic and [ICON_GreatWork_Artifact] Artifact."),
    ("LOC_CSD_HONOLULU_TRAIT_DESCRIPTION",          "+2 [ICON_FOOD] Food for cities adjacent to Lakes or Coasts, +1 [ICON_FOOD] Food from Fishery."),
    ("LOC_CSE_MOMBASA_TRAIT_DESCRIPTION",           "Cistern provides +1 [ICON_PRODUCTION] Production and +1 [ICON_GOLD] Gold for Plantations in the city."),
    ("LOC_CSD_FERGANA_TRAIT_DESCRIPTION",           "+1 [ICON_Food] Food for Hill tiles inside cities that located on hills or adjacent to Mountains."),
    ("LOC_CSD_KIEV_TRAIT_DESCRIPTION",              "Your cities earn +7% [ICON_PRODUCTION] Production when you are at war with any civilization. Your cities earn +7% growth rate when you are at peace with all civilizations."),
    ("LOC_LEADER_TRAIT_MITLA_DESCRIPTION",                "City growth rate is 20% higher in cities with a Campus district."),
    ("LOC_CIVILIZATION_PALENQUE_BONUS",                   "City growth rate is 20% higher in cities with a Campus district."),
    ("LOC_LEADER_TRAIT_GENEVA_DESCRIPTION",               "Your cities earn +10% [ICON_SCIENCE] Science whenever you are not at war with any civilization."),
    ("LOC_CIVILIZATION_GENEVA_BONUS",                     "Your cities earn +10% [ICON_SCIENCE] Science whenever you are not at war with any civilization."),
    ("LOC_LEADER_TRAIT_TARUGA_DESCRIPTION",               "+5% [ICON_SCIENCE] Science in all cities for each different improved Strategic resource they have."),
    ("LOC_CIVILIZATION_TARUGA_BONUS",                     "+5% [ICON_SCIENCE] Science in all cities for each different improved Strategic resource they have."),
    ("LOC_LEADER_TRAIT_FEZ_DESCRIPTION",                  "+2 [ICON_SCIENCE] Science from each building inside Holy Site."),
    ("LOC_CIVILIZATION_FEZ_BONUS",                        "+2 [ICON_SCIENCE] Science from each building inside Holy Site."),
    ("LOC_LEADER_TRAIT_HATTUSA_EXPANSION2_DESCRIPTION",   "Provides you with 2 of each Strategic resource per turn that you have revealed. +1 [ICON_SCIENCE] Science from improved Strategic resources."),
    ("LOC_CIVILIZATION_HATTUSA_BONUS_XP2",                "Provides you with 2 of each Strategic resource per turn that you have revealed. +1 [ICON_SCIENCE] Science from improved Strategic resources."),
    ("LOC_LEADER_TRAIT_NAN_MADOL_DESCRIPTION",            "Your Districts(except City center) and Wonders on or next to Coast or Lake tiles provide +1 [ICON_Culture] Culture."),
    ("LOC_CIVILIZATION_NAN_MADOL_BONUS",                  "Your Districts(except City center) and Wonders on or next to Coast or Lake tiles provide +1 [ICON_Culture] Culture."),
    ("LOC_LEADER_TRAIT_AYUTTHAYA_DESCRIPTION",            "Theater and Wonders provide 1 [ICON_CULTURE] Culture, double when they are located near river."),
    ("LOC_CIVILIZATION_AYUTTHAYA_BONUS",                  "Theater and Wonders provide 1 [ICON_CULTURE] Culture, double when they are located near river."),
    ("LOC_LEADER_TRAIT_ANTANANARIVO_DESCRIPTION",         "Your Civilization gains +2% [ICON_Culture] Culture for each Great Person it has ever earned, up to a total of +10%."),
    ("LOC_CIVILIZATION_ANTANANARIVO_BONUS",               "Your Civilization gains +2% [ICON_Culture] Culture for each Great Person it has ever earned, up to a total of +10%."),
    ("LOC_LEADER_TRAIT_HUNZA_DESCRIPTION",                "Your [ICON_TradeRoute] Trade Routes generate +1 [ICON_Gold] Gold for every 5 tiles they travel."),
    ("LOC_CIVILIZATION_HUNZA_BONUS",                      "Your [ICON_TradeRoute] Trade Routes generate +1 [ICON_Gold] Gold for every 5 tiles they travel."),
    ("LOC_LEADER_TRAIT_JAKARTA_DESCRIPTION",              "Your districts(except City center) on or next to Coast or Lake tiles provide +3 [ICON_Gold] Gold."),
    ("LOC_CIVILIZATION_JAKARTA_BONUS",                    "Your districts(except City center) on or next to Coast or Lake tiles provide +3 [ICON_Gold] Gold."),
    ("LOC_CSD_MANILA_TRAIT_DESCRIPTION",            "Your [ICON_TradeRoute] International Trade Routes +2 [ICON_Food] Food.");

insert or replace into LocalizedText
    (Language,      Tag,                                        Text)
values
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_CARDIFF_DESCRIPTION",              "每个造船厂和码头向城市提供3点 [ICON_POWER] 电力。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_CARDIFF_BONUS",                    "每个造船厂和码头向城市提供3点 [ICON_POWER] 电力。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_AUCKLAND_DESCRIPTION",             "您国境内的近海单元格+1 [ICON_PRODUCTION] 生产力，研究“蒸汽动力”科技以后额外+1 [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_AUCKLAND_BONUS",                   "您国境内的近海单元格+1 [ICON_PRODUCTION] 生产力，研究“蒸汽动力”科技以后额外+1 [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_HONG_KONG_DESCRIPTION",            "城市建造项目时+20% [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_HONG_KONG_BONUS",                  "城市建造项目时+20% [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_BRUSSELS_DESCRIPTION",             "城市建造奇观时+15% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_BRUSSELS_BONUS",                   "城市建造奇观时+15% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_JOHANNESBURG_DESCRIPTION",         "对于改良资源的农田、种植园、矿山、采石场、伐木场、牧场和营地，你的城市中每有一种，则+1 [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_JOHANNESBURG_BONUS",               "对于改良资源的农田、种植园、矿山、采石场、伐木场、牧场和营地，你的城市中每有一种，则+1 [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_CSE_HAVANA_TRAIT_DESCRIPTION",                  "拥有惊艳魅力的沿海地块额外+1 [ICON_CULTURE] 文化。"),
    ("zh_Hans_CN",  "LOC_CSE_DJIBOUTI_TRAIT_DESCRIPTION",           "相邻市中心的近海和湖泊单元格，+1 [ICON_FOOD] 食物和 +1 [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_CSD_RIGA_TRAIT_DESCRIPTION",               "港口内每个建筑为从该城出发的 [ICON_TRADEROUTE] 国际商路+1 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_PRESLAV_DESCRIPTION",              "城市中建成的每个军营及军营区域建筑提供+2 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_PRESLAV_BONUS_XP1",                "城市中建成的每个军营及军营区域建筑提供+2 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_VALLETTA_DESCRIPTION",             "[ICON_FAITH] 信仰值可用来购买市中心建筑和军营区的建筑。购买远古、中世纪、文艺复兴城墙（包括堡垒）的费用降低50%，但只能通过 [ICON_FAITH] 信仰值购买。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_VALLETTA_BONUS",                   "[ICON_FAITH] 信仰值可用来购买市中心建筑和军营区的建筑。购买远古、中世纪、文艺复兴城墙（包括堡垒）的费用降低50%，但只能通过 [ICON_FAITH] 信仰值购买。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_BABYLON_DESCRIPTION",              "所有的 [ICON_GreatWork_WRITING] 著作巨作、[ICON_GreatWork_RELIC] 遗物和 [ICON_GreatWork_Artifact] 文物+3 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_BABYLON_BONUS",                    "所有的 [ICON_GreatWork_WRITING] 著作巨作、[ICON_GreatWork_RELIC] 遗物和 [ICON_GreatWork_Artifact] 文物+3 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_CSD_HONOLULU_TRAIT_DESCRIPTION",           "相邻湖泊或近海的城市+2 [ICON_FOOD] 食物，渔场+1 [ICON_FOOD] 食物。"),
    ("zh_Hans_CN",  "LOC_CSE_MOMBASA_TRAIT_DESCRIPTION",            "蓄水池为本城的种植园提供+1 [ICON_PRODUCTION] 生产力和+1 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_CSD_FERGANA_TRAIT_DESCRIPTION",            "相邻山脉或位于丘陵上的城市，其丘陵单元格+1 [ICON_Food] 食物。"),
    ("zh_Hans_CN",  "LOC_CSD_KIEV_TRAIT_DESCRIPTION",               "当您与任何文明发生战争时，您的城市+7% [ICON_PRODUCTION] 生产力。当您不与任何文明发生战争时，您的城市+7% [ICON_FOOD] 余粮。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_MITLA_DESCRIPTION",                "拥有学院的城市+20%余粮。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_PALENQUE_BONUS",                   "拥有学院的城市+20%余粮。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_GENEVA_DESCRIPTION",               "当您不与任何文明发生战争时，您的城市+10% [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_GENEVA_BONUS",                     "当您不与任何文明发生战争时，您的城市+10% [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_TARUGA_DESCRIPTION",               "对于所有城市，其3个单元格内每拥有一种已改良的战略资源，便+5% [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_TARUGA_BONUS",                     "对于所有城市，其3个单元格内每拥有一种已改良的战略资源，便+5% [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_FEZ_DESCRIPTION",                  "圣地中的每个建筑+2 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_FEZ_BONUS",                        "圣地中的每个建筑+2 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_HATTUSA_EXPANSION2_DESCRIPTION",   "每回合提供2份文明已解锁战略资源。改良后的战略资源+1 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_HATTUSA_BONUS_XP2",                "每回合提供2份文明已解锁战略资源。改良后的战略资源+1 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_NAN_MADOL_DESCRIPTION",            "您境内位于或与海岸湖泊单元格相邻的区域(市中心外)和奇观+1 [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_NAN_MADOL_BONUS",                  "您境内位于或与海岸湖泊单元格相邻的区域(市中心外)和奇观+1 [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_AYUTTHAYA_DESCRIPTION",            "剧院和奇观提供1 [ICON_CULTURE] 文化值，位于河流旁时加成翻倍。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_AYUTTHAYA_BONUS",                  "剧院和奇观提供1 [ICON_CULTURE] 文化值，位于河流旁时加成翻倍。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_ANTANANARIVO_DESCRIPTION",         "您的文明每获得1位伟人，[ICON_Culture] 文化值便+2%（上限为+10%）。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_ANTANANARIVO_BONUS",               "您的文明每获得1位伟人，[ICON_Culture] 文化值便+2%（上限为+10%）。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_HUNZA_DESCRIPTION",                "您的 [ICON_TradeRoute] 贸易路线每经过5个单元格，其提供的 [ICON_Gold] 金币便+1。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_HUNZA_BONUS",                      "您的 [ICON_TradeRoute] 贸易路线每经过5个单元格，其提供的 [ICON_Gold] 金币便+1。"),
    ("zh_Hans_CN",  "LOC_LEADER_TRAIT_JAKARTA_DESCRIPTION",              "您境内位于或与海岸湖泊单元格相邻的区域(市中心外)+3 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_CIVILIZATION_JAKARTA_BONUS",                    "您境内位于或与海岸湖泊单元格相邻的区域(市中心外)+3 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_CSD_MANILA_TRAIT_DESCRIPTION",             "你的 [ICON_TradeRoute] 国际商路+2 [ICON_Food] 食物。");

UPDATE LocalizedText SET Text=REPLACE(Text, 'Shipyard and Seaport','Entrepot, Haven, Shipyard, Seaport, Cruise Terminal and Naval Base') WHERE Tag = 'LOC_CIVILIZATION_CARDIFF_BONUS' or Tag = 'LOC_LEADER_TRAIT_CARDIFF_DESCRIPTION';
UPDATE LocalizedText SET Text=REPLACE(Text, '造船厂和码头','商港、避风港、造船厂、海港、游轮码头和海军基地') WHERE Tag = 'LOC_CIVILIZATION_CARDIFF_BONUS' or Tag = 'LOC_LEADER_TRAIT_CARDIFF_DESCRIPTION';

-- 万神
insert or replace into EnglishText
    (Tag,                                           Text)
values
    ("LOC_BELIEF_OLD_GOD_OF_THE_FORGE_NAME",                   "Old God of the Forge"),
    ("LOC_BELIEF_OLD_GOD_OF_THE_FORGE_DESCRIPTION",            "+50% [ICON_PRODUCTION] Production toward Ancient, Classical and Medieval military units. Receive 40% discount on Strategic resource costs for units."),
    ("LOC_BELIEF_DANCE_OF_THE_AURORA_DL_DESCRIPTION",             "Holy Site districts get +1 [ICON_Faith] Faith from each adjacent Tundra tile. Holy Site provides +1 [ICON_Food] Food to all adjacent Tundra tiles. +3 [ICON_GreatProphet] Great Prophet point per turn if Holy Site is located on Tundra or Tundra Hills tiles. "),
    ("LOC_BELIEF_DESERT_FOLKLORE_DL_DESCRIPTION",                 "Holy Site districts get +1 [ICON_Faith] Faith from each adjacent Desert tile. Holy Site provides +1 [ICON_Food] Food and +1 [ICON_Faith] Faith to all adjacent Desert tiles. +3 [ICON_GreatProphet] Great Prophet point per turn if Holy Site is located on Desert or Desert Hills tiles."),
    ("LOC_BELIEF_SACRED_PATH_DL_DESCRIPTION",                     "Holy Site districts get +1 [ICON_Faith] Faith from each adjacent Rainforest tile. Holy Site provides +1 [ICON_Culture] Culture to all adjacent Rainforest tiles.+3 [ICON_GreatProphet] Great Prophet point per turn if Holy Site is adjacent to Rainforest tiles."),
    ("LOC_BELIEF_OCEAN_MOTHER_DL_DESCRIPTION",                    "City center receive +1 [ICON_Food] Food and +1 [ICON_Faith] Faith from each adjacent Coast tile. +1 [ICON_Housing] Housing and +2 [ICON_GreatProphet] Great Prophet point per turn for cities that adjacent to Coasts."),
    ("LOC_BELIEF_CITY_PATRON_GODDESS_DL_DESCRIPTION",             "+75% [ICON_Production] Production towards Districts in cities without a Specialty district."),
    ("LOC_BELIEF_TALE_OF_DWALVES_NAME",                         "Tale of Dwalves"),
    ("LOC_BELIEF_TALE_OF_DWALVES_DESCRIPTION",                  "+1 [ICON_FOOD] Food from Mines over Luxury and Bonus resources. +2 [ICON_GOLD] Gold and +1 [ICON_HOUSING] Housing from all Mines."),
    ("LOC_BELIEF_MEGALITHIC_WORSHIP_NAME",                      "Megalithic Worship"),
    ("LOC_BELIEF_MEGALITHIC_WORSHIP_DESCRIPTION",               "Quarries provide +1 [ICON_CULTURE] Culture and +3 [ICON_GOLD] Gold.");

insert or replace into LocalizedText
    (Language,      Tag,                                        Text)
values
    ("zh_Hans_CN",  "LOC_BELIEF_OLD_GOD_OF_THE_FORGE_NAME",                   "锻造之神（怀旧版）"),
    ("zh_Hans_CN",  "LOC_BELIEF_OLD_GOD_OF_THE_FORGE_DESCRIPTION",            "为远古、古典和中世纪军事单位+50% [ICON_PRODUCTION] 生产力。生产单位所需战略资源花费减少40%。"),
    ("zh_Hans_CN",  "LOC_BELIEF_DANCE_OF_THE_AURORA_DL_DESCRIPTION",             "圣地区域从每个相邻的冻土单元格+1 [ICON_Faith] 信仰值。未被劫掠过的圣地给相邻的冻土单元格+1 [ICON_Food] 食物。若圣地位于冻土或冻土丘陵则每回合+3 [ICON_GreatProphet] 大预言家点数。"),
    ("zh_Hans_CN",  "LOC_BELIEF_DESERT_FOLKLORE_DL_DESCRIPTION",                 "圣地区域从每个相邻的沙漠单元格+1 [ICON_Faith] 信仰值。未被劫掠过的圣地给相邻的沙漠单元格+1 [ICON_Food] 食物和+1 [ICON_Faith] 信仰值。若圣地位于沙漠或沙漠丘陵则每回合+3 [ICON_GreatProphet] 大预言家点数。"),
    ("zh_Hans_CN",  "LOC_BELIEF_SACRED_PATH_DL_DESCRIPTION",                     "圣地区域从每个相邻的雨林的单元格+1 [ICON_Faith] 信仰值。未被劫掠过的圣地给相邻的雨林单元格+1 [ICON_Culture] 文化。若圣地相邻雨林则每回合+3 [ICON_GreatProphet] 大预言家点数。"),
    ("zh_Hans_CN",  "LOC_BELIEF_OCEAN_MOTHER_DL_DESCRIPTION",                    "市中心相邻每个海岸单元格+1 [ICON_Food] 食物和+1 [ICON_Faith] 信仰值。相邻海岸的市中心+1 [ICON_Housing] 住房，且城市每回合+2 [ICON_GreatProphet] 大预言家点数。"),
    ("zh_Hans_CN",  "LOC_BELIEF_CITY_PATRON_GODDESS_DL_DESCRIPTION",             "没有专业化区域的城市建造区域+75% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_BELIEF_TALE_OF_DWALVES_NAME",                         "矮人传说"),
    ("zh_Hans_CN",  "LOC_BELIEF_TALE_OF_DWALVES_DESCRIPTION",                  "改良奢侈和加成资源的矿山+1 [ICON_FOOD] 食物。所有矿山+2 [ICON_GOLD] 金币，+1 [ICON_HOUSING] 住房。"),
    ("zh_Hans_CN",  "LOC_BELIEF_MEGALITHIC_WORSHIP_NAME",                      "巨石崇拜"),
    ("zh_Hans_CN",  "LOC_BELIEF_MEGALITHIC_WORSHIP_DESCRIPTION",               "采石场+1 [ICON_CULTURE] 文化值，+3 [ICON_GOLD] 金币。");;