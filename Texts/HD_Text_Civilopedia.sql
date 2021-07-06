--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                         Text)
values
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_TITLE",             "Introduction"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_PARA_1",            "在原版游戏中，存在着许多不合理的数据及机制，例如被玩家诟病的砍树锤，对于爆铺没有有效的限制，人口的作用微乎其微，被玩家戏称的木制火箭（砍树极大加速火星项目），老马环游（无敌的总督马格努斯）等，导致绝大部分玩家都使用“砍树”+“爆铺”作为对抗神级AI的唯一解，游戏过程变得单一无趣。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_PARA_2",            "我们制作文明6和而不同的初衷，不仅是希望能够解决大部分原版出现的问题，还想要让文明6变得更好玩，让更多的玩家感受到思考的乐趣，提高游戏的可玩性，丰富游戏的内容，并且尽可能地贴近历史，让每个人都体验到文明在历史的漫漫长河不断发展和壮大，最终赢得胜利的成就感。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_PARA_3",            "总而言之，文明6和而不同是文明6社区中不断进行更新的大型游戏模组，大部分游戏内容（城市政策，城市人口调整，区域和建筑，地块产出和改良，奇观，总督等）已经更新并登陆创意工坊。使用文明6和而不同进行游戏时，你将来到一个“和而不同”的文明6，享受全新的游戏体验。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_PARA_4",            "我们的交流群群号为1142970145，欢迎加群交流。"),
    -- Highlights
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_HIGHLIGHTS_CHAPTER_CONTENT_TITLE",               "Highlights"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_HIGHLIGHTS_CHAPTER_GOVERNORS_TITLE",             "Governors"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_HIGHLIGHTS_CHAPTER_GOVERNORS_PARA_1",            "我们完全推翻重做了除了平嘎啦以外的总督，并将平嘎啦的强度作为设计标杆，令总督能力各有特色并均有一定强度，达到了总督点选择上百花齐放的效果。详细能力见“总督”表。"),
    -- 游戏进度相关
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_CONTENT_TITLE",            "Game Progress Related"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_INTRO_TITLE",              "Summary"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_INTRO_PARA_1",             "取消绝大多数数值与游戏进度的绑定。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_HARVEST_TITLE",            "Remove Feature and Harvest Resources"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_HARVEST_PARA_1",           "移除地貌和收获资源（俗称砍树与收获）的瞬时收益不再增长，移除地貌收益为基础30点（按地貌类型分配），收获资源收益为基础40点（按资源类型分配）。详见“资源地形地貌”表。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PILLAGE_TITLE",            "Pillage Yields"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PILLAGE_PARA_1",           "取消劫掠收益随自身科技人文进度而增加的设定，改为固定每次基础25点（产出类型根据劫掠对象决定）。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_DISTRICTS_TITLE",          "Districts Cost"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_DISTRICTS_PARA_1",         "区域的定价改为按已建造同类的个数（N）的方式定价，多数专业化区域定价为75+15N锤，多数特色区域定价为60+12N锤，其他区域以固定值定价。详见“区域”表。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PROJECTS_TITLE",           "Projects and Great Person Points"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PROJECTS_PARA_1",          "专业化区域对应的项目的造价维持按游戏进度增长，幅度为40涨至440。其对应的伟人点产出改为（项目造价/5 + 2）*2，多种伟人则为每个 （造价/10 + 1）*2。特殊的宫廷盛会项目由80涨至640，迁都100涨至300。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PROJECTS_PARA_2",          "所有和伟人点相关内容均翻倍（即目前的2伟人点等于以前的1伟人点）。金币和信仰赞助伟人的公式无法直接调整，通过间接的打折调整（6折）。金币赞助伟人的公式为120+9n金币（对应原120+18n），信仰赞助伟人的公式为90+6n信仰（对应原90+12n），神谕等伟人打折-25%的字面效果维持。"),
    -- 地图生成优化
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_CONTENT_TITLE",           "Map Generation"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_GENERAL_TITLE",           "General Changes"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_GENERAL_PARA_1",          "修复地图上的地貌和部落村庄生成代码中的随机性缺失问题。部落村庄和蛮族寨子不再生成在雪地，缩减雪地在地图上的范围，减少冰层面积。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_GENERAL_PARA_2",          "铜、石油资源不再在雪地生成。地图热带地区生成的雨林比例由40%减少为35%。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_STARTING_TITLE",          "Starting Plots"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_STARTING_PARA_1",         "出生点生成机制优化，重写了类肥沃度的计算方法，将其与一环二环的地块产出挂钩，优化后贫瘠出生点的概率大幅下降。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_STARTING_PARA_2",         "整合[MOD] ExpandedInitialVision，提供初始出生点的3环探索视野（玛雅能力将其扩展为6环）。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_STARTING_PARA_3",         "兼容[MOD] Faster Starting Settlers，可进一步提升初始移民的灵活性（初始移民3速且无视地形惩罚）。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_SPECIFIC_TITLE",          "Specific Maps"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_SPECIFIC_PARA_1",         "优化群岛的地图生成，降低超大型岛屿出现的概率，优化群岛山脉生成。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_SPECIFIC_PARA_2",         "禁止七海、千湖、盘古、分大陆地图上生成在海边的山脉单元格（火山除外）。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_SPECIFIC_PARA_3",         "增加盘古、分大陆、湿地地图的陆地面积（调整方式是降低海平面的参数，可能导致预期之外的陆地或浅海相连）。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_NEW_MAPS_TITLE",          "New Maps"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_NEW_MAPS_PARA_1",         "米粒岛屿：由群岛派生，由很多如米粒大小的岛屿组成。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_NEW_MAPS_PARA_2",         "星罗棋布：由千湖派生，将千湖的水域改为了分布更广的更小的湖泊。"),
    -- 地形地貌与资源
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_CONTENT_TITLE",        "Terrains, Features and Resources"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_YIELDS_TITLE",         "Adjustments of Yields"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_YIELDS_PARA_1",        "对各类地形地貌资源的产出做统一调整，将常规地块的总产出统一为3点，而奢侈资源统一为1产+1金的模型（少数有地形绑定缺陷的有补偿）。详见“资源地形地貌”表。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_YIELDS_PARA_2",        "拉平差距后有助于将原设定中的地形地貌导向型变为资源导向型，因为资源的全图分布性质，不同出生点都能分到一定量的资源在开局期间使用，缩小了出生点之间的差距。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_HARVEST_TITLE",        "Harvest Resources"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_HARVEST_PARA_1",       "奢侈和战略可以被收获或被奇观或区域覆盖，在掌握对应开发科技后，收获奢侈资源产出固定80金，收获战略资源产出固定40锤。（同时优化了界面UI防止战略被工人的收获按钮提前暴露）地热、礁石可以被奇观或区域覆盖。礁石上也可修建改良。"),
    -- 城市相关
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_CONTENT_TITLE",           "City Related"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_POPULATION_TITLE",        "Population"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_POPULATION_PARA_1",       "每个人口消耗3点粮食，坐地补正3粮1锤（即市中心地块粮食产出小于3则补为3，生产力产出小于1则补为1）。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_POPULATION_PARA_2",       "城市人口增长所需的粮食公式改为18+10n+n^1.6，平均增幅25%左右。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_PLOTS_TITLE",             "City Plots"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_PLOTS_PARA_1",            "买地基准价格调整为40，减少20%，同时删除帝国初期解锁的买地-20%折扣的政策卡。通过文化值自然扩地范围由改为8环。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_CITIZEN_TITLE",           "Citizen"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_CITIZEN_PARA_1",          "为各个区域的专家提供了伟人点产出（如每个学院专家提供4点大科点）。区域地基也提供专家槽位。每级建筑都可为区域内的专家增加产出。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_AMENITY_TITLE",           "Amenity"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_AMENITY_PARA_1",          "城市免费宜居度改回1点。并增加了一档新的宜居状态："),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_AMENITY_PARA_2",          "[ICON_BULLET] 愉悦（新增）：要求城市达到+2宜居，加成为10%余粮，5%非粮产出。[NEWLINE][ICON_BULLET] 高兴：要求城市达到+4宜居，加成为20%余粮，10%非粮产出。[NEWLINE][ICON_BULLET] 欣喜若狂：要求城市达到+6宜居，加成为30%余粮，20%非粮产出。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_MAINTENANCE_TITLE",       "City and Population Maintenance"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_MAINTENANCE_PARA_1",      "为城市和人口引入维护费的概念，只作用于7难度（不朽）和8难度（神级）的玩家。下面以神级的数值为例，不朽难度下该维护费减半。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_MAINTENANCE_PARA_2",      "每座城市需要2金维护费。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_MAINTENANCE_PARA_3",      "人口维护费分级，第1-5个人口不需要维护费，第6-10个人口的维护费均为1金，第11-15个人口的维护费均为2金，第16-20个人口的维护费均为3金，第21个人口开始每个人口的维护费均为4金。"),
    -- 城市新内容
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CONTENT_TITLE",         "New Content for Cities"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CC_BUILDINGS_TITLE",    "Brand New City Center Buildings"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CC_BUILDINGS_PARA_1",   "新增了7个远古时代的科技或市政解锁的市中心建筑（囊括了粮锤瓶琴金鸽6种产出，其中锤又分为建筑向和军事向，详见“建筑”表），自制了其中部分图标。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CITY_POLICY_TITLE",     "City Policies"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CITY_POLICY_PARA_1",    "添加城市政策，即每个城市可单独控制的一个特殊政策槽位，通过完成项目的方式可以选择开启或关闭各种城市政策，并达到切换的效果。当前有3种城市政策（还有一种状态是无城市政策）。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CITY_POLICY_PARA_2",    "[ICON_BULLET] 徭役：城市余粮减少75%，城市-1宜居度，每人口多消耗1粮食但提供1.5锤。[NEWLINE][ICON_BULLET] 农业税：农田-1粮+2金。[NEWLINE][ICON_BULLET] 工业税：矿和采石场-1矿+2金。"),
    -- 蛮族
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_BARBARIAN_CHAPTER_CONTENT_TITLE",                "Barbarians"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_BARBARIAN_CHAPTER_CONTENT_PARA_1",               "蛮族部落的城市生成距离限制改为6。蛮族在发现城市需要点数达标才会开始生成劫掠部队（寨子生成后会开始积累点数，20t后才能达标）。寨子防守单位被攻击将使得该点数减少10t的积累量。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_BARBARIAN_CHAPTER_CONTENT_PARA_2",               "蛮族科技需求改为60%的文明已拥有科技，马寨判定范围改为2环有马资源。 "),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_BARBARIAN_CHAPTER_CONTENT_PARA_3",               "拥有一级晋升的单位与蛮族作战仍获得正常经验（升到2级后每次与蛮族战斗就只有1经验了）。"),
    -- AI调整
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_CONTENT_TITLE",           "AI Adjustments"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_EVALUATION_TITLE",        "AI evaluations"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_EVALUATION_PARA_1",       "[ICON_BULLET] 优化AI坐地的价值判定，减少其坐无水城倾向。[NEWLINE][ICON_BULLET] 增加AI建造城墙的倾向，优化AI的其他建筑建造倾向。[NEWLINE][ICON_BULLET] 增加ai开改良的倾向。[NEWLINE][ICON_BULLET] 调整AI对部分产出的估值（如增加粮食的估值，降低金币的估值）。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_BUFFS_TITLE",             "AI Extra Buffs"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_BUFFS_PARA_1",            "神级AI减少一个初始移民，减少初始勇士数量为3，其中2个在建立城市后才会送，送AI一个侦察单位。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_BUFFS_PARA_2",            "AI的加成不仅与难度相关，也会随着其自身所处时代增长，以神级AI为例，锤为85+15n，瓶、琴为40+10n，金为25+15n，鸽为30+10n，其中n为距离远古时代的时代数，如远古时n=0，中世纪时n=2。注意：该机制的引入显著提高了文化与征服胜利难度。"), -- （AI测试模式：粮食也获得类似BUFF，神级为10%的总粮食，不随时代增长。）
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_BUFFS_PARA_3",            "6级和7级难度AI每城送1住房1宜居，8难度（神级）AI每城送2住房2宜居。"),
    -- 道路与商人
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_CONTENT_TITLE",         "Roads and Traders"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_ROADS_TITLE",           "Roads"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_ROADS_PARA_1",          "研究轮子后，所有境内改良获得道路。之后建造的改良也自动获得道路。[NEWLINE]单位（如：军事工程师）主动修建道路时不再消耗次数，改为消耗战略资源。修远古、古典道路时改为消耗1马，工业、现代道路为1铁。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_TRADER_TITLE",          "Traders"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_TRADER_PARA_1",         "商路最短持续时间调整为13t（即长度小于7的商路会走2个来回，其余商路会走一个来回结束），且该最短持续时间不再随世界时代动态调整。[NEWLINE]兼容[mod] Better Trade Screen查看（该调整后的）商路预计所需回合数。"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_TRADER_PARA_2",         "将彼得的大使馆能力全文明化，即通往研究了更多科技和市政的文明的国际商路获得瓶和琴，每多3个科技多1瓶，每多3个市政多1琴（彼得能力替换为新能力）。"),
    -- 时代相关
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_ERAS_RELATED_CHAPTER_CONTENT_TITLE",             "Eras Related"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_ERAS_RELATED_CHAPTER_CONTENT_PARA_1",            "新增机制：每获得1点时代得分获得5金币。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_ERAS_RELATED_CHAPTER_CONTENT_PARA_2",            "每个世界时代最低回合数限制改为20。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_ERAS_RELATED_CHAPTER_CONTENT_PARA_3",            "调整时代分阈值的计算：[NEWLINE][ICON_BULLET] 每次进入黄金时代后，时代分的需求增加10分。每次进入黑暗时代时代分需求减少10分。[NEWLINE][ICON_BULLET] 每有一座城市，时代分需求增加2分。"),
    -- 外交
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_TITLE",                "Diplomacy"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_PARA_1",               "与ai正常交易需小额贴钱（手续费约20-30块，关系越好手续费越少），与谴责状态ai交易需要超高额手续费。来自有利交易的绿字改为最多2点。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_PARA_2",               "除少量战狂文明外，其他文明都几乎不打城邦。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_PARA_3",               "不满带来的红字减少为6%，第三方不满带来的红字减少为3%。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_PARA_4",               "宣友、同盟、谴责、防御协定的回合数改为15t。同盟点数来源增加：商路的同盟点数由单向0.25提升为0.5。贸易银行绿卡的同盟点数0.25改为0.5。外交办（外交区2级建筑）提供+0.5同盟点数。"),
    -- 军事
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_TITLE",                 "Military"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_PARA_1",                "为所有文明首都赠送一个简易城墙，拥有25点防御点数。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_PARA_2",                "远程单位对城墙造成造成75%伤害。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_PARA_3",                "轻骑兵和重骑兵（不含苏美尔战车）攻击区域分别-7和-5力。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_PARA_4",                "城邦征兵的价格改为购买价格的40%。"),
    -- 其他
    ("LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_CONTENT_TITLE",                   "Other Changes"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_GOODYHUTS_TITLE",                 "Goody Huts"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_GOODYHUTS_PARA_1",                "[ICON_BULLET] 取消送完整科技和治愈单位的蘑菇类型[NEWLINE][ICON_BULLET] 降低后期蘑菇踩到40金和20鸽的概率。[NEWLINE][ICON_BULLET] 延迟踩工人的回合数到最早15t。[NEWLINE][ICON_BULLET] 延迟踩遗物的回合数到最早30t。[NEWLINE][ICON_BULLET] 延迟踩总督点的回合数到最早50t。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_CITYSTATES_TITLE",                "City-States"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_CITYSTATES_PARA_1",               "[ICON_BULLET]城邦不会再请求商路任务和皈依任务[NEWLINE][ICON_BULLET]重做“外交联盟卡”：提供6点影响力点数，城邦开放边境，改为外交部门解锁。[NEWLINE][ICON_BULLET]给城邦自身50点的额外忠诚压力，20点有时候不够用。[NEWLINE][ICON_BULLET]不朽和神级难度下城邦初始勇士数-1。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_TECH_CIVIC_TITLE",                "Technologies and Civics"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_TECH_CIVIC_PARA_1",               "尤里卡和鼓舞改为35%。未来科技和人文变为固定连线，且开局揭示"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_NATURAL_DISASTER_TITLE",          "Natural Disaster"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_NATURAL_DISASTER_PARA_1",         "降低自然灾害带来的产出。被林火烧毁的树木重生后只增加1粮。"),
    (  "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_GAME_OPTIONS_TITLE",              "Game Options"),
    (    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_GAME_OPTIONS_PARA_1",             "增加三个高级游戏选项：[NEWLINE][ICON_BULLET] （默认开启）将世界议会推迟到工业时代开始，开会的间隔时间减半（改为15t）。[NEWLINE][ICON_BULLET] （默认关闭）抢占移民变工人（同文明5的设定，降低抢移民收益）。[NEWLINE][ICON_BULLET] （默认关闭）AI双倍军事单位：每当ai训练一个军事单位，其会免费获得一个同样的单位（仅推荐目标征服胜利且挑战自我时打开，该选项将大幅提高征服胜利难度，但是也让玩家有机会体验兵海对决的刺激感）。"),

    ("LOC_PEDIA_CONCEPTS_PAGEGROUP_HD_NAME",                                      "Harmony in Diversity");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                         Text)
values
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_TITLE",             "概述"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_PARA_1",            "在原版游戏中，存在着许多不合理的数据及机制，例如被玩家诟病的砍树锤，对于爆铺没有有效的限制，人口的作用微乎其微，被玩家戏称的木制火箭（砍树极大加速火星项目），老马环游（无敌的总督马格努斯）等，导致绝大部分玩家都使用“砍树”+“爆铺”作为对抗神级AI的唯一解，游戏过程变得单一无趣。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_PARA_2",            "我们制作文明6和而不同的初衷，不仅是希望能够解决大部分原版出现的问题，还想要让文明6变得更好玩，让更多的玩家感受到思考的乐趣，提高游戏的可玩性，丰富游戏的内容，并且尽可能地贴近历史，让每个人都体验到文明在历史的漫漫长河不断发展和壮大，最终赢得胜利的成就感。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_PARA_3",            "总而言之，文明6和而不同是文明6社区中不断进行更新的大型游戏模组，大部分游戏内容（城市政策，城市人口调整，区域和建筑，地块产出和改良，奇观，总督等）已经更新并登陆创意工坊。使用文明6和而不同进行游戏时，你将来到一个“和而不同”的文明6，享受全新的游戏体验。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_INTRODUCTION_CHAPTER_CONTENT_PARA_4",            "我们的交流群群号为1142970145，欢迎加群交流。"),
    -- Highlights
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_HIGHLIGHTS_CHAPTER_CONTENT_TITLE",               "和而不同：特色内容"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_HIGHLIGHTS_CHAPTER_GOVERNORS_TITLE",             "总督"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_HIGHLIGHTS_CHAPTER_GOVERNORS_PARA_1",            "我们完全推翻重做了除了平嘎啦以外的总督，并将平嘎啦的强度作为设计标杆，令总督能力各有特色并均有一定强度，达到了总督点选择上百花齐放的效果。详细能力见“总督”表。"),
    -- 游戏进度相关
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_CONTENT_TITLE",            "游戏进度相关"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_INTRO_TITLE",              "总述"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_INTRO_PARA_1",             "取消绝大多数数值与游戏进度的绑定。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_HARVEST_TITLE",            "移除地貌和收获资源"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_HARVEST_PARA_1",           "移除地貌和收获资源（俗称砍树与收获）的瞬时收益不再增长，移除地貌收益为基础30点（按地貌类型分配），收获资源收益为基础40点（按资源类型分配）。详见“资源地形地貌”表。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PILLAGE_TITLE",            "劫掠收益"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PILLAGE_PARA_1",           "取消劫掠收益随自身科技人文进度而增加的设定，改为固定每次基础25点（产出类型根据劫掠对象决定）。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_DISTRICTS_TITLE",          "区域定价"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_DISTRICTS_PARA_1",         "区域的定价改为按已建造同类的个数（N）的方式定价，多数专业化区域定价为75+15N锤，多数特色区域定价为60+12N锤，其他区域以固定值定价。详见“区域”表。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PROJECTS_TITLE",           "项目与伟人点"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PROJECTS_PARA_1",          "专业化区域对应的项目的造价维持按游戏进度增长，幅度为40涨至440。其对应的伟人点产出改为（项目造价/5 + 2）*2，多种伟人则为每个 （造价/10 + 1）*2。特殊的宫廷盛会项目由80涨至640，迁都100涨至300。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_GAME_PROGRESS_CHAPTER_PROJECTS_PARA_2",          "所有和伟人点相关内容均翻倍（即目前的2伟人点等于以前的1伟人点）。金币和信仰赞助伟人的公式无法直接调整，通过间接的打折调整（6折）。金币赞助伟人的公式为120+9n金币（对应原120+18n），信仰赞助伟人的公式为90+6n信仰（对应原90+12n），神谕等伟人打折-25%的字面效果维持。"),
    -- 地图生成优化
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_CONTENT_TITLE",           "地图生成优化"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_GENERAL_TITLE",           "通用改动"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_GENERAL_PARA_1",          "修复地图上的地貌和部落村庄生成代码中的随机性缺失问题。部落村庄和蛮族寨子不再生成在雪地，缩减雪地在地图上的范围，减少冰层面积。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_GENERAL_PARA_2",          "铜、石油资源不再在雪地生成。地图热带地区生成的雨林比例由40%减少为35%。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_STARTING_TITLE",          "出生点"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_STARTING_PARA_1",         "出生点生成机制优化，重写了类肥沃度的计算方法，将其与一环二环的地块产出挂钩，优化后贫瘠出生点的概率大幅下降。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_STARTING_PARA_2",         "整合[MOD] ExpandedInitialVision，提供初始出生点的3环探索视野（玛雅能力将其扩展为6环）。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_STARTING_PARA_3",         "兼容[MOD] Faster Starting Settlers，可进一步提升初始移民的灵活性（初始移民3速且无视地形惩罚）。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_SPECIFIC_TITLE",          "特定地图"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_SPECIFIC_PARA_1",         "优化群岛的地图生成，降低超大型岛屿出现的概率，优化群岛山脉生成。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_SPECIFIC_PARA_2",         "禁止七海、千湖、盘古、分大陆地图上生成在海边的山脉单元格（火山除外）。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_SPECIFIC_PARA_3",         "增加盘古、分大陆、湿地地图的陆地面积（调整方式是降低海平面的参数，可能导致预期之外的陆地或浅海相连）。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_NEW_MAPS_TITLE",          "新增地图"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_NEW_MAPS_PARA_1",         "米粒岛屿：由群岛派生，由很多如米粒大小的岛屿组成。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_MAP_GENERATION_CHAPTER_NEW_MAPS_PARA_2",         "星罗棋布：由千湖派生，将千湖的水域改为了分布更广的更小的湖泊。"),
    -- 地形地貌与资源
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_CONTENT_TITLE",        "地形地貌与资源"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_YIELDS_TITLE",         "产出调整"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_YIELDS_PARA_1",        "对各类地形地貌资源的产出做统一调整，将常规地块的总产出统一为3点，而奢侈资源统一为1产+1金的模型（少数有地形绑定缺陷的有补偿）。详见“资源地形地貌”表。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_YIELDS_PARA_2",        "拉平差距后有助于将原设定中的地形地貌导向型变为资源导向型，因为资源的全图分布性质，不同出生点都能分到一定量的资源在开局期间使用，缩小了出生点之间的差距。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_HARVEST_TITLE",        "资源收割"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_TERRAINS_FEATURES_CHAPTER_HARVEST_PARA_1",       "奢侈和战略可以被收获或被奇观或区域覆盖，在掌握对应开发科技后，收获奢侈资源产出固定80金，收获战略资源产出固定40锤。（同时优化了界面UI防止战略被工人的收获按钮提前暴露）地热、礁石可以被奇观或区域覆盖。礁石上也可修建改良。"),
    -- 城市相关
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_CONTENT_TITLE",           "城市相关"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_POPULATION_TITLE",        "人口"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_POPULATION_PARA_1",       "每个人口消耗3点粮食，坐地补正3粮1锤（即市中心地块粮食产出小于3则补为3，生产力产出小于1则补为1）。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_POPULATION_PARA_2",       "城市人口增长所需的粮食公式改为18+10n+n^1.6，平均增幅25%左右。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_PLOTS_TITLE",             "买地与扩地"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_PLOTS_PARA_1",            "买地基准价格调整为40，减少20%，同时删除帝国初期解锁的买地-20%折扣的政策卡。通过文化值自然扩地范围由改为8环。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_CITIZEN_TITLE",           "专家"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_CITIZEN_PARA_1",          "为各个区域的专家提供了伟人点产出（如每个学院专家提供4点大科点）。区域地基也提供专家槽位。每级建筑都可为区域内的专家增加产出。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_AMENITY_TITLE",           "宜居度"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_AMENITY_PARA_1",          "城市免费宜居度改回1点。并增加了一档新的宜居状态："),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_AMENITY_PARA_2",          "[ICON_BULLET] 愉悦（新增）：要求城市达到+2宜居，加成为10%余粮，5%非粮产出。[NEWLINE][ICON_BULLET] 高兴：要求城市达到+4宜居，加成为20%余粮，10%非粮产出。[NEWLINE][ICON_BULLET] 欣喜若狂：要求城市达到+6宜居，加成为30%余粮，20%非粮产出。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_MAINTENANCE_TITLE",       "城市与人口维护费"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_MAINTENANCE_PARA_1",      "为城市和人口引入维护费的概念，只作用于7难度（不朽）和8难度（神级）的玩家。下面以神级的数值为例，不朽难度下该维护费减半。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_MAINTENANCE_PARA_2",      "每座城市需要2金维护费。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITIES_RELATED_CHAPTER_MAINTENANCE_PARA_3",      "人口维护费分级，第1-5个人口不需要维护费，第6-10个人口的维护费均为1金，第11-15个人口的维护费均为2金，第16-20个人口的维护费均为3金，第21个人口开始每个人口的维护费均为4金。"),
    -- 城市与人口维护费
    -- ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_MAINTENANCE_CHAPTER_CONTENT_TITLE",              "城市与人口维护费"),
    -- ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAINTENANCE_CHAPTER_CONTENT_PARA_1",             "为城市和人口引入维护费的概念，只作用于7难度（不朽）和8难度（神级）的玩家。下面以神级的数值为例，不朽难度下该维护费减半。"),
    -- ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAINTENANCE_CHAPTER_CONTENT_PARA_2",             "每座城市需要2金维护费。"),
    -- ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MAINTENANCE_CHAPTER_CONTENT_PARA_3",             "人口维护费分级，第1-5个人口不需要维护费，第6-10个人口的维护费均为1金，第11-15个人口的维护费均为2金，第16-20个人口的维护费均为3金，第21个人口开始每个人口的维护费均为4金。"),
    -- 城市新内容
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CONTENT_TITLE",         "城市新内容"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CC_BUILDINGS_TITLE",    "全新市中心建筑"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CC_BUILDINGS_PARA_1",   "新增了7个远古时代的科技或市政解锁的市中心建筑（囊括了粮锤瓶琴金鸽6种产出，其中锤又分为建筑向和军事向，详见“建筑”表），自制了其中部分图标。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CITY_POLICY_TITLE",     "城市政策"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CITY_POLICY_PARA_1",    "添加城市政策，即每个城市可单独控制的一个特殊政策槽位，通过完成项目的方式可以选择开启或关闭各种城市政策，并达到切换的效果。当前有3种城市政策（还有一种状态是无城市政策）。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_CITY_NEW_CONTENT_CHAPTER_CITY_POLICY_PARA_2",    "[ICON_BULLET] 徭役：城市余粮减少75%，城市-1宜居度，每人口多消耗1粮食但提供1.5锤。[NEWLINE][ICON_BULLET] 农业税：农田-1粮+2金。[NEWLINE][ICON_BULLET] 工业税：矿和采石场-1矿+2金。"),
    -- 蛮族
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_BARBARIAN_CHAPTER_CONTENT_TITLE",                "蛮族"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_BARBARIAN_CHAPTER_CONTENT_PARA_1",               "蛮族部落的城市生成距离限制改为6。蛮族在发现城市需要点数达标才会开始生成劫掠部队（寨子生成后会开始积累点数，20t后才能达标）。寨子防守单位被攻击将使得该点数减少10t的积累量。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_BARBARIAN_CHAPTER_CONTENT_PARA_2",               "蛮族科技需求改为60%的文明已拥有科技，马寨判定范围改为2环有马资源。 "),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_BARBARIAN_CHAPTER_CONTENT_PARA_3",               "拥有一级晋升的单位与蛮族作战仍获得正常经验（升到2级后每次与蛮族战斗就只有1经验了）。"),
    -- AI调整
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_CONTENT_TITLE",           "AI调整"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_EVALUATION_TITLE",        "倾向调整"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_EVALUATION_PARA_1",       "[ICON_BULLET] 优化AI坐地的价值判定，减少其坐无水城倾向。[NEWLINE][ICON_BULLET] 增加AI建造城墙的倾向，优化AI的其他建筑建造倾向。[NEWLINE][ICON_BULLET] 增加ai开改良的倾向。[NEWLINE][ICON_BULLET] 调整AI对部分产出的估值（如增加粮食的估值，降低金币的估值）。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_BUFFS_TITLE",             "额外奖励"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_BUFFS_PARA_1",            "神级AI减少一个初始移民，减少初始勇士数量为3，其中2个在建立城市后才会送，送AI一个侦察单位。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_BUFFS_PARA_2",            "AI的加成不仅与难度相关，也会随着其自身所处时代增长，以神级AI为例，锤为85+15n，瓶、琴为40+10n，金为25+15n，鸽为30+10n，其中n为距离远古时代的时代数，如远古时n=0，中世纪时n=2。注意：该机制的引入显著提高了文化与征服胜利难度。"), -- （AI测试模式：粮食也获得类似BUFF，神级为10%的总粮食，不随时代增长。）
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_AI_ADJUSTMENTS_CHAPTER_BUFFS_PARA_3",            "6级和7级难度AI每城送1住房1宜居，8难度（神级）AI每城送2住房2宜居。"),
    -- 道路与商人
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_CONTENT_TITLE",         "道路与商人"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_ROADS_TITLE",           "道路"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_ROADS_PARA_1",          "研究轮子后，所有境内改良获得道路。之后建造的改良也自动获得道路。[NEWLINE]单位（如：军事工程师）主动修建道路时不再消耗次数，改为消耗战略资源。修远古、古典道路时改为消耗1马，工业、现代道路为1铁。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_TRADER_TITLE",          "商路"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_TRADER_PARA_1",         "商路最短持续时间调整为13t（即长度小于7的商路会走2个来回，其余商路会走一个来回结束），且该最短持续时间不再随世界时代动态调整。[NEWLINE]兼容[mod] Better Trade Screen查看（该调整后的）商路预计所需回合数。"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_ROADS_AND_TRADER_CHAPTER_TRADER_PARA_2",         "将彼得的大使馆能力全文明化，即通往研究了更多科技和市政的文明的国际商路获得瓶和琴，每多3个科技多1瓶，每多3个市政多1琴（彼得能力替换为新能力）。"),
    -- 时代相关
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_ERAS_RELATED_CHAPTER_CONTENT_TITLE",             "时代相关"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_ERAS_RELATED_CHAPTER_CONTENT_PARA_1",            "新增机制：每获得1点时代得分获得5金币。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_ERAS_RELATED_CHAPTER_CONTENT_PARA_2",            "每个世界时代最低回合数限制改为20。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_ERAS_RELATED_CHAPTER_CONTENT_PARA_3",            "调整时代分阈值的计算：[NEWLINE][ICON_BULLET] 每次进入黄金时代后，时代分的需求增加10分。每次进入黑暗时代时代分需求减少10分。[NEWLINE][ICON_BULLET] 每有一座城市，时代分需求增加2分。"),
    -- 外交
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_TITLE",                "外交"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_PARA_1",               "与ai正常交易需小额贴钱（手续费约20-30块，关系越好手续费越少），与谴责状态ai交易需要超高额手续费。来自有利交易的绿字改为最多2点。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_PARA_2",               "除少量战狂文明外，其他文明都几乎不打城邦。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_PARA_3",               "不满带来的红字减少为6%，第三方不满带来的红字减少为3%。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_DIPLOMACY_CHAPTER_CONTENT_PARA_4",               "宣友、同盟、谴责、防御协定的回合数改为15t。同盟点数来源增加：商路的同盟点数由单向0.25提升为0.5。贸易银行绿卡的同盟点数0.25改为0.5。外交办（外交区2级建筑）提供+0.5同盟点数。"),
    -- 军事
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_TITLE",                 "军事"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_PARA_1",                "为所有文明首都赠送一个简易城墙，拥有25点防御点数。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_PARA_2",                "远程单位对城墙造成造成75%伤害。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_PARA_3",                "轻骑兵和重骑兵（不含苏美尔战车）攻击区域分别-7和-5力。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_MILITARY_CHAPTER_CONTENT_PARA_4",                "城邦征兵的价格改为购买价格的40%。"),
    -- 其他
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_CONTENT_TITLE",                   "其他改动"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_GOODYHUTS_TITLE",                 "部落村庄"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_GOODYHUTS_PARA_1",                "[ICON_BULLET] 取消送完整科技和治愈单位的蘑菇类型[NEWLINE][ICON_BULLET] 降低后期蘑菇踩到40金和20鸽的概率。[NEWLINE][ICON_BULLET] 延迟踩工人的回合数到最早15t。[NEWLINE][ICON_BULLET] 延迟踩遗物的回合数到最早30t。[NEWLINE][ICON_BULLET] 延迟踩总督点的回合数到最早50t。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_CITYSTATES_TITLE",                "城邦"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_CITYSTATES_PARA_1",               "[ICON_BULLET]城邦不会再请求商路任务和皈依任务[NEWLINE][ICON_BULLET]重做“外交联盟卡”：提供6点影响力点数，城邦开放边境，改为外交部门解锁。[NEWLINE][ICON_BULLET]给城邦自身50点的额外忠诚压力，20点有时候不够用。[NEWLINE][ICON_BULLET]不朽和神级难度下城邦初始勇士数-1。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_TECH_CIVIC_TITLE",                "科技与市政"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_TECH_CIVIC_PARA_1",               "尤里卡和鼓舞改为35%。未来科技和人文变为固定连线，且开局揭示"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_NATURAL_DISASTER_TITLE",          "自然灾害"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_NATURAL_DISASTER_PARA_1",         "降低自然灾害带来的产出。被林火烧毁的树木重生后只增加1粮。"),
    ("zh_Hans_CN",    "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_GAME_OPTIONS_TITLE",              "游戏选项"),
    ("zh_Hans_CN",      "LOC_PEDIA_CONCEPTS_PAGE_HD_OTHERS_CHAPTER_GAME_OPTIONS_PARA_1",             "增加三个高级游戏选项：[NEWLINE][ICON_BULLET] （默认开启）将世界议会推迟到工业时代开始，开会的间隔时间减半（改为15t）。[NEWLINE][ICON_BULLET] （默认关闭）抢占移民变工人（同文明5的设定，降低抢移民收益）。[NEWLINE][ICON_BULLET] （默认关闭）AI双倍军事单位：每当ai训练一个军事单位，其会免费获得一个同样的单位（仅推荐目标征服胜利且挑战自我时打开，该选项将大幅提高征服胜利难度，但是也让玩家有机会体验兵海对决的刺激感）。"),

    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGEGROUP_HD_NAME",                                      "和而不同");

-- Original Pedia Contents
--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                     Text)
values
    ("LOC_PEDIA_CONCEPTS_PAGE_ALLIANCES_1_CHAPTER_CONTENT_PARA_1",            "Alliances are a relationship between two different civilizations, a mutual agreement to work together in some way. To enter into an Alliance, you must first be Declared Friends with the civilization, and both civilizations must have researched the Civil Service civic.[NEWLINE][NEWLINE]There are several Alliance types, each one provides different mutual benefits according to its type. The effects of these levels are cumulative, so if you are in a Level 3 Alliance, you also gain the Level 1 and Level 2 effects. When you are in an Alliance with another Player, you gain Alliance Points every turn.  Collecting enough increases your Alliance Level, resulting in more benefits from your Alliances.  You can increase the rate at which you gain Alliance Points by trading with your Ally.[NEWLINE][NEWLINE]Every Alliance, regardless of its type, provides Open Borders and a Defensive Pact to both parties. Members of an Alliance cannot declare war on each other.[NEWLINE][NEWLINE]You may have only one kind of alliance with another civilization, and once you have created that alliance, you cannot have it with another civilization, although you might have another kind of alliance with them. For example, you might have a Research Alliance with Korea, so you cannot make a new Research Alliance with the Cree. You might create a Military, Cultural, Religious, or Economic Alliance with the Cree, however. Note that this limits you to five total Alliances in a game.[NEWLINE][NEWLINE]Research Alliance[NEWLINE][ICON_BULLET]Level 1: [ICON_TradeRoute] Trade Routes between allies grant additional [ICON_Science] Science.[NEWLINE][ICON_BULLET]Level 2: Allies share 1 Tech Boost every 10 turns (on Standard Speed).[NEWLINE][ICON_BULLET]Level 3: Gives bonus [ICON_Science] Science when studying the same technology as your ally or one that your ally has completed, and while your ally is researching a tech you have completed.[NEWLINE][NEWLINE]Cultural Alliance[NEWLINE][ICON_BULLET]Level 1: Allies do not exert Loyalty pressure on each other, and [ICON_TradeRoute] Trade Routes between allies grant additional [ICON_CULTURE] Culture.[NEWLINE][ICON_BULLET]Level 2: When your cities have [ICON_TradeRoute] Trade Routes with your ally, gain additional [ICON_GreatPerson] Great Person points in the origin cities based off of the districts in those cities.[NEWLINE][ICON_BULLET]Level 3: You gain a portion of your ally’s [ICON_Tourism] Tourism and [ICON_CULTURE] Culture from cities.[NEWLINE][NEWLINE]Military Alliance[NEWLINE][ICON_BULLET]Level 1: Allies gain bonus [ICON_Strength] Combat Strength against civilizations on whom both allies have declared war.[NEWLINE][ICON_BULLET]Level 2: Allies share visibility and gain bonus [ICON_Production] Production toward military units when either ally is at war.[NEWLINE][ICON_BULLET]Level 3: Units start with a bonus promotion.[NEWLINE][NEWLINE]Religious Alliance[NEWLINE][ICON_BULLET]Level 1: Ally cities do not exert Religious pressure on each other, and [ICON_TradeRoute] Trade Routes between allies grant additional [ICON_Faith] Faith.[NEWLINE][ICON_BULLET]Level 2: Allies gain [ICON_Religion] religious Combat Strength against Religions not founded by either ally.[NEWLINE][ICON_BULLET]Level 3: You gain Faith based on the number of your [ICON_Citizen] Citizens following your ally’s Religion, and bonus Religious Pressure in cities with no followers of your ally's Religion.[NEWLINE][NEWLINE]Economic Alliance[NEWLINE][ICON_BULLET]Level 1: [ICON_TradeRoute] Trade Routes between allies grant additional [ICON_Gold] Gold.[NEWLINE][ICON_BULLET]Level 2: Gain an [ICON_ENVOY] Envoy point for every City-State with your Ally as Suzerain.[NEWLINE][ICON_BULLET]Level 3: Allies share the Suzerain bonus of all city-states of which they are Suzerain."),
    ("LOC_PEDIA_CONCEPTS_PAGE_CITIES_9_CHAPTER_CONTENT_PARA_5",               "Captains work in the Harbor and provide +2 [ICON_Food] Food."),
    ("LOC_PEDIA_CONCEPTS_PAGE_CITIES_10_CHAPTER_CONTENT_PARA_2",              "A city must expand its [ICON_Citizen] Population before it can construct multiple districts:[NEWLINE]• 1 [ICON_Citizen] Population for 1 District[NEWLINE]• 4 [ICON_Citizen] Population for 2 Districts[NEWLINE]• 7 [ICON_Citizen] Population for 3 Districts[NEWLINE]• Each additional District requires +3 [ICON_Citizen] Population[NEWLINE]The Aqueduct, Neighborhood, Aerodrome, Preserve, Spaceport, Dam and Canal Districts ignore this [ICON_Citizen] Population requirement. Districts which require a certain number of [ICON_Citizen] Population are specialty districts."),
    ("LOC_PEDIA_CONCEPTS_PAGE_CITIES_12_CHAPTER_CONTENT_PARA_1",              "Your city will grow, or add more [ICON_Citizen] Citizens, with surplus [ICON_Food] Food. Any amount of [ICON_Food] Food over the total consumption of a city's [ICON_Citizen] Citizens, 3 per, is considered surplus, and is added as progress towards a new [ICON_Citizen] Citizen."),
    ("LOC_PEDIA_CONCEPTS_PAGE_CITIES_13_CHAPTER_CONTENT_PARA_1",              "A city requires 3 [ICON_Food] Food per [ICON_Citizen] Citizen (another term for ""[ICON_Citizen] Population"") per turn to avoid starvation. A city acquires [ICON_Food] Food (as well as other yields) by assigning its [ICON_Citizen] Citizens to ""work"" the land around the city. The city can work any tile within 3 spaces of the city that is also within the civilization's borders, provided as well that it is not being worked by another city. Cities cannot work tiles occupied by wonders."),
    ("LOC_PEDIA_CONCEPTS_PAGE_COMBAT_9_CHAPTER_CONTENT_PARA_2",               "Walls add extra protection to a city or Encampment, making it even more difficult to conquer. This protection is like armor, shielding the city from attacks. Melee units deal only 15% of their normal damage to walls, and ranged units deal only 75% of their normal damage. Only Bombard units deal 100% of their normal damage to walls, making them necessary to capture a fortified city. If the walls are damaged, they stop being as effective and the district's health will start taking a little bit of damage with every attack. Walls can only recover health with a Project found in the city's Production Queue, like repairing district buildings, that becomes available if the district has not taken any damage for 3 consecutive turns. Once a city has walls, it can make ranged attacks against enemy units using a ""City Ranged Strength"" stat.[NEWLINE][NEWLINE]The City Combat Strength is based on the [ICON_Strength] Combat Strength of the strongest melee unit built by your civilization, minus 10, or by the [ICON_Strength] Combat Strength of a garrisoned military unit.[NEWLINE][NEWLINE]The City Ranged Strength is based on the [ICON_Ranged] Ranged Strength of the strongest ranged unit built by your civilization.[NEWLINE][NEWLINE]The city gets additional bonuses to its City Combat Strength for each non-pillaged district it has, making big cities harder to capture, and from terrain and a few other modifiers sources.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                         Text)
values
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_ALLIANCES_1_CHAPTER_CONTENT_PARA_1",               "同盟是两个不同文明间相互协商、在某方面进行合作的一种关系。结为同盟之前双方必须首先宣布友谊，且均已完成市政“行政部门”的研究。[NEWLINE][NEWLINE]同盟类型有数种，提供的益处皆有所不同。与其他玩家处于同盟关系时，每回合将获得同盟点数。获得足够的点数后同盟等级将提升，产生更多益处。与盟友进行贸易可提升获得的同盟点数。同盟等级效果叠加计算，如果处于第3级同盟，则也会获得第1级和第2级效果。[NEWLINE][NEWLINE]每种同盟均会使双方开放边界并共同防御。盟友之间无法宣战。[NEWLINE][NEWLINE]您只能和其他文明结成一种同盟。一旦结成一类同盟，则无法与其他文明再次结成此类同盟，但可与之结成其他类型的同盟。举例而言，您与朝鲜结成研究同盟后便无法再与克里结成研究同盟，但却可以与其建立军事、文化、宗教或经济同盟。注意，游戏中最多只能结缔5个同盟。[NEWLINE]研究同盟[NEWLINE][ICON_BULLET] 第1级：盟友之间的 [ICON_TradeRoute] 贸易路线可产出更多 [ICON_Science] 科技值。[NEWLINE][ICON_BULLET] 第2级：盟友每10回合共享1个科技提升（标准速度下）。[NEWLINE][ICON_BULLET] 第3级：与盟友研究相同科技、或研究盟友已研究完成的科技时获得 [ICON_Science] 科技值加成；盟友已研究您完成的科技时也可获得科技值加成。[NEWLINE][NEWLINE]文化同盟[NEWLINE][ICON_BULLET] 第1级：盟友之间不会相互施加忠诚度压力；盟友之间的 [ICON_TradeRoute] 贸易路线可产出更多 [ICON_CULTURE] 文化值。[NEWLINE][ICON_BULLET] 第2级：城市与盟友之间存在 [ICON_TradeRoute] 贸易路线时，将根据起源城市中建造的区域获得更多 [ICON_GreatPerson] 伟人点数。[NEWLINE][ICON_BULLET] 第3级：您将获得盟友城市产出的部分 [ICON_Tourism] 旅游业绩和 [ICON_CULTURE] 文化值。[NEWLINE][NEWLINE]军事同盟[NEWLINE][ICON_BULLET] 第1级：与双方盟友均已宣战的文明作战时将获得 [ICON_Strength] 战斗力加成。[NEWLINE][ICON_BULLET] 第2级：盟友之间共享能见度；其中一个盟友处于战争状态时，双方生产军事单位时都将获得 [ICON_Production] 生产力加成。[NEWLINE][ICON_BULLET] 第3级：单位初始便拥有一次奖励升级。[NEWLINE][NEWLINE]宗教同盟[NEWLINE][ICON_BULLET] 第1级：不会对盟友的城市释放宗教压力；盟友之间的 [ICON_TradeRoute] 贸易路线可产出更多 [ICON_Faith] 信仰值。[NEWLINE][ICON_BULLET] 第2级：与非盟友创建的其他宗教进行宗教战争时获得 [ICON_Religion] 宗教战斗力加成。[NEWLINE][ICON_BULLET] 第3级：基于信仰盟友宗教的 [ICON_Citizen] 公民数量获得信仰值；在没有盟友宗教信徒的城市中获得奖励宗教压力。[NEWLINE][NEWLINE]经济同盟[NEWLINE][ICON_BULLET] 第1级：盟友之间的 [ICON_TradeRoute] 贸易路线可产出更多 [ICON_Gold] 黄金。[NEWLINE][ICON_BULLET] 第2级：每个视盟友为宗主国的城邦将提供一点[ICON_ENVOY]使者点数。[NEWLINE][ICON_BULLET] 第3级：盟友之间共享双方获得的全部城邦宗主国加成。"),
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_CITIES_9_CHAPTER_CONTENT_PARA_5",                  "船长在港口中工作，提供+2 [ICON_Food] 食物。"),
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_CITIES_10_CHAPTER_CONTENT_PARA_2",                 "城市必须扩大 [ICON_Citizen] 人口才能建造多个区域：[NEWLINE]• 1个区域需要1点 [ICON_Citizen] 人口[NEWLINE]• 2个区域需要4点 [ICON_Citizen] 人口[NEWLINE]• 3个区域需要7点 [ICON_Citizen] 人口[NEWLINE]• 之后每个额外区域需要+3 [ICON_Citizen] 人口[NEWLINE]水渠、社区、航空港、保护区、宇航中心、堤坝和运河区域无视此 [ICON_Citizen] 人口要求。对 [ICON_Citizen] 人口数量有特定要求的区域即为专业化区域。"),
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_CITIES_13_CHAPTER_CONTENT_PARA_1",                 "城市里的每位 [ICON_Citizen] 公民（这是“ [ICON_Citizen] 人口”的另一种表达方式）每回合需要3份 [ICON_Food] 食物来避免饥饿。通过派遣其 [ICON_Citizen] 公民“改良”周围土地，城市能获得 [ICON_Food] 食物（以及其他收益）。城市能改良3个距离以内的任意单元格（位于文明境内且没被其他城市改良过）。城市无法改良被奇观占领的单元格。"),
    ("zh_Hans_CN",  "LOC_PEDIA_CONCEPTS_PAGE_COMBAT_9_CHAPTER_CONTENT_PARA_2",                  "城墙为城市或军营增加额外保护，让其更难被占领。这种保护如同护甲一般，使城市免受攻击。近战单位仅对城墙造成它通常伤害的15%，远程单位仅对城墙造成它通常伤害的75%。只有轰炸单位才能对城墙造成它100%的伤害，因此，轰炸单位是占领坚固城市的必需之物。如果城墙遭受损害，其会不再有效，同时，每一次攻击都会让区域生命值受到少量伤害。只有使用在城市生产队列中找到的项目才能回复城墙生命值，比如修理区域建筑，如果区域连续3回合没有遭受任何伤害，则可以进行修复。城市一旦拥有城墙，便可使用“城市远程攻击”对敌方单位发动远程攻击。[NEWLINE][NEWLINE]城市战斗力取决于您文明里最强近战单位的 [ICON_Strength] 战斗力大小，最小为10，或取决于驻军军事单位的战斗力。[NEWLINE][NEWLINE]城市远程攻击力取决于您文明里最强 [ICON_Ranged] 远程单位的远程攻击力大小。[NEWLINE][NEWLINE]城市所拥有的每个没被掠夺的区域会为其城市战斗力提供额外加成，使大城市更难被占领，城市也能从地形和一些其他改造者来源中获得额外加成。");