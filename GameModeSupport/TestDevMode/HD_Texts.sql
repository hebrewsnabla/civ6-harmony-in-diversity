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
    ("LOC_BUILDING_GOV_SPIES_NAME",         "Main Trading Port"),
    ("LOC_BUILDING_GOV_SPIES_DESCRIPTION",  "+1 [ICON_TRADEROUTE] Trade Route capacity. Each of your city yields +4% [ICON_GOLD] Gold for each Commercial Hub building and each Harbor building in that city. Your [ICON_TRADEROUTE] Trade Routes provide additional +3 [ICON_GOLD] Gold for passing through each of your[ICON_TRADINGPOST] Trading Post in foreign city.[NEWLINE]Awards +1 [ICON_GOVERNOR] Governor Title."),
    ("LOC_BUILDING_CHANCERY_DESCRIPTION",   "Receive one Spy and +1 Spy capacity. +1 [ICON_VISLIMITED] Visibility level on all other Civs. All Spy Operations have a higher chance of success. Spy mission time reduces by 25%. Your Spy units can choose from any possible promotion. +50% [ICON_PRODUCTION] toward Spies in all Cities.+3 Influence Points per turn. When this civilization captures or kills an enemy Spy, receive 50 [ICON_SCIENCE] Science for every level of the enemy Spy. Alliance Points with all allies increase by an additional 0.5 per turn. Gain +1 [ICON_ENVOY] Envoy."),
    ("LOC_MOMENT_CATEGORY_SCIENTIFIC_BONUS_GOLDEN_AGE", "Free Inquiry Golden Age:[NEWLINE][ICON_TECHBOOSTED] Eurekas provide an additional 10% of technology costs. Each different District and Building provides +1 [ICON_SCIENCE] Science to your capital."),
    -- 殖民地办事处
    ("LOC_POLICY_COLONIAL_OFFICES_DESCRIPTION",                                       "+5 [ICON_Food] Food, +10% Growth rate and +5 Loyalty per turn for cities not on your original [ICON_Capital] Capital's continent."),
    -- 刚果
    ("LOC_TRAIT_LEADER_RELIGIOUS_CONVERT_DESCRIPTION",                "May not build Holy Site districts, gain Great Prophets, or found Religions. Gains all Beliefs of any Religion that has established itself in a majority of his cities. Receives an Apostle each time he finishes a M'banza or Theater Square district (of that city's majority Religion). Receive Theology [ICON_CivicBoosted] Inspiration, Divine Right [ICON_CivicBoosted] Inspiration and Reformed Church [ICON_CivicBoosted] Inspiration when Mbanza is first built. While adopting Theocracy government, citizens in cities with Mbanza provide +1 [ICON_FAITH] Faith."),
    ("LOC_BUILDING_MEENAKSHI_TEMPLE_DESCRIPTION",                   "Grants 2 Gurus. Holy Site districts provide +2 [ICON_FOOD] Food. Buildings in Holy Site district provide +4 [ICON_FOOD] Food. Allows your Cities to purchase Builders and Settlers using [ICON_Faith] Faith. Must be built adjacent to a Holy Site and you must have founded a Religion.");

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
    ("zh_Hans_CN",  "LOC_TRAIT_LEADER_RELIGIOUS_CONVERT_DESCRIPTION",                "无法建造圣地区、获得大预言家，或创建宗教。从已成为多数刚果城市信仰的宗教中获得信仰值。每次完成一个姆班赞或剧院广场区时获得一位（城市主流宗教的）使徒。首次建成姆班赞后，激活“神学”、“王权神授”和“归正会”市政 [ICON_CivicBoosted] 鼓舞。采用神权政体时，有姆班赞的城市每个人口产出1 [ICON_FAITH] 信仰。"),
    ("zh_Hans_CN",  "LOC_BUILDING_MEENAKSHI_TEMPLE_DESCRIPTION",            "获得2名上师。圣地提供 +2 [ICON_FOOD] 食物，每个圣地建筑提供 +4 [ICON_FOOD] 食物。允许您的城市使用 [ICON_Faith] 信仰值购买建造者和开拓者。必须建在圣地旁，同时必须已创立宗教。");
