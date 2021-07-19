--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                             Text)
values
    -- Techs
    ("LOC_TECH_ANIMAL_HUSBANDRY_HD_DESCRIPTION",      "Allows harvesting of resources improved by Pastures and Camps."),
    ("LOC_TECH_MINING_HD_DESCRIPTION",                "Allows chopping of Woods, and harvesting of resources improved by Mines."),
    ("LOC_TECH_MASONRY_HD_DESCRIPTION",               "Allows harvesting of resources improved by Quarries."),
    ("LOC_TECH_THE_WHEEL_HD_DESCRIPTION",             "After researching the wheel, all improvements inside territory obtain roads for free. All improvements built afterward also get free roads."),
    ("LOC_TECH_IRRIGATION_DESCRIPTION",               "Allows clearing of Marsh, and harvesting of resources improved by Plantations. Allow Builders to build Farms on Plains Hills or Grass Hills adjacent to fresh water or Aqueduct."),
    ("LOC_TECH_MACHINERY_HD_DESCRIPTION",             "+1 [ICON_Production] Production from the Lumber Mill improvements that are not adjacent to rivers."),
    ("LOC_TECH_TELECOMMUNICATIONS_HD_DESCRIPTION",    "+50% [ICON_TOURISM] Tourism from all kinds of Great Works except for [ICON_GREATWORK_RELIC] Relic."),
    -- ("LOC_TECH_RIFLING_HD_DESCRIPTION",               "+1 [ICON_FOOD] Food from the Camp improvement."),
    ("LOC_TECH_CONSTRUCTION_HD_DESCRIPTION",          "+1 [ICON_Production] Production from the Camp improvement. +1 [ICON_Production] Production from the Lumber Mill improvement."),
    ("LOC_TECH_APPRENTICESHIP_HD_DESCRIPTION",        "+1 [ICON_Production] Production to the Mine and Quarry improvement."),
    ("LOC_TECH_CELESTIAL_NAVIGATION_HD_DESCRIPTION",  "Allows Traders to embark, and allows harvesting of resources improved by Fishing Boats. If Ship Building is not researched, also allows all land units to embark."),
    ("LOC_TECH_ARCHERY_HD_DESCRIPTION",               "Allow to build Camps on Forests. +1 [ICON_gold] Gold from the Camp improvement."),
    --("LOC_TECH_HORSEBACK_RIDING_HD_DESCRIPTION",      "+1 [ICON_Production] Production from the Pasture."),
    ("LOC_TECH_STIRRUPS_HD_DESCRIPTION",              "Pasture improvements receive +1 [ICON_Production] Production."),
    ("LOC_TECH_CASTLES_HD_DESCRIPTION",               "Gain a free Spy if playing as Catherine de Medici (Black Queen)."),
    ("LOC_TECH_REPLACEABLE_PARTS_HD_DESCRIPTION",     "Upgrades Farm improvements to Mechanized Agriculture. +1 [ICON_Food] Food Adjacency bonus for every Farm improvement they are adjacent to."),
    ("LOC_TECH_STEAM_POWER_HD_DESCRIPTION",           "+2 [ICON_Movement] Movement for embarked units. +15 tiles for water trade route range."),
    ("LOC_TECH_STEEL_HD_DESCRIPTION",                 "Unlocks Urban Defenses, giving all of your cities an automatic 400 Fortification Strength and the ability to perform a ranged attack. All previous wall improvements become obsolete and siege support units are no longer effective."),
    ("LOC_TECH_SCIENTIFIC_THEORY_HD_DESCRIPTION",     "+1 [ICON_Food] Food from the Plantation improvement. +5% [ICON_Science] Science for cities have University."),
    -- Civics
    ("LOC_CIVIC_CIVIL_SERVICE_HD_DESCRIPTION",        "Farm improvements now gain +1 [ICON_Food] Food from every 2 adjacent Farm improvements."),
    ("LOC_CIVIC_FEUDALISM_HD_DESCRIPTION",            "Plantation improvements receive +1 [ICON_Food] Food."),
    ("LOC_CIVIC_MEDIEVAL_FAIRES_HD_DESCRIPTION",      "+2 [ICON_gold] Gold from the Plantation improvement. +1 [ICON_Food] Food from the Pasture."),
    -- ("LOC_CIVIC_MERCANTILISM_HD_DESCRIPTION",         "+2 [ICON_gold] Gold from the Camp improvement."),
    ("LOC_CIVIC_CIVIL_ENGINEERING_HD_DESCRIPTION",    "Can build Farms on Grassland Hills and Plains Hills. +1 [ICON_Production] Production from the Lumber Mills."),
    ("LOC_CIVIC_GUILDS_HD_DESCRIPTION",               "Lumber Mills and Camps can be built on Rainforest."),
    ("LOC_CIVIC_ENVIRONMENTALISM_HD_DESCRIPTION",     "+50% [ICON_Tourism] Tourism across your empire."),
    ("LOC_CIVIC_GLOBALIZATION_HD_DESCRIPTION",        "+2 [ICON_Gold] Gold to Plantations."),
    ("LOC_CIVIC_NATIONALISM_DESCRIPTION",             "Grants the ability to construct an additional Spy. Allows forming two identical units into a Corps or Fleet. Units have 50% less [ICON_Strength] Combat Strength reduction from being injured. Allows one new Casus Belli that can be used to justify wars: Colonial War."),
    -- Boosts
    ("LOC_BOOST_TRIGGER_MASS_PRODUCTION",             "Build 3 Lumber Mills."),
    ("LOC_BOOST_TRIGGER_INDUSTRIALIZATION_XP2",       "Build 3 Workshops."),
    ("LOC_BOOST_TRIGGER_BRONZE_WORKING",              "Kill 2 Barbarians."),
    -- TODO Longdesc
    ("LOC_BOOST_TRIGGER_THE_WHEEL",                   "Build a Pasture."),
    ("LOC_BOOST_TRIGGER_HORSEBACK_RIDING",            "Build a Pasture with Horses."),
    ("LOC_BOOST_TRIGGER_FOREIGN_TRADE",               "Meet another civilization."),
    ("LOC_BOOST_TRIGGER_WRITING",                     "Build a Monument."),
    ("LOC_BOOST_TRIGGER_GAMES_RECREATION",            "Build two Camps."),
    ("LOC_BOOST_TRIGGER_NAVAL_TRADITION",             "Own 1 Quadrireme."),
    ("LOC_BOOST_TRIGGER_MEDIEVAL_FAIRES",             "Maintain 3 Trade Routes."),
    ("LOC_BOOST_TRIGGER_RECORDED_HISTORY",            "Build 1 Library."),
    ("LOC_BOOST_TRIGGER_HUMANISM",                    "Build 2 Amphitheaters."),
    ("LOC_BOOST_TRIGGER_DEFENSIVE_TACTICS",           "Kill a unit with a Spearman."),
    -- ("LOC_BOOST_TRIGGER_MILITARY_TACTICS",            "Have the Defensive Tactics civic."),
    ("LOC_BOOST_TRIGGER_REPLACEABLE_PARTS",           "Own 3 Line Infantries."),
    ("LOC_BOOST_TRIGGER_SIEGE_TACTICS",               "Own 2 Trebuchets."),
    -- 
    ("LOC_BOOST_TRIGGER_METAL_CASTING",               "Have the Military Training Civic."),
    ("LOC_BOOST_TRIGGER_LONGDESC_METAL_CASTING",      "Weapons evolve along with Military training, more advanced ways of making weapons are emerging."),
    ("LOC_BOOST_TRIGGER_CASTLES",                     "Have the Defensive Tactics Civic."),
    ("LOC_BOOST_TRIGGER_LONGDESC_CASTLES",            "We need impressive defenses to better utilize the defensive tactics to protect our cities."),
    ("LOC_BOOST_TRIGGER_MILITARY_TACTICS",            "Earn a Great General."),
    ("LOC_BOOST_TRIGGER_LONGDESC_MILITARY_TACTICS",   "The Great General brings about new military tactics.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                             Text)
values
    -- Techs
    ("zh_Hans_CN",  "LOC_TECH_ANIMAL_HUSBANDRY_HD_DESCRIPTION",      "允许收获由牧场或营地改良的资源。"),
    ("zh_Hans_CN",  "LOC_TECH_MINING_HD_DESCRIPTION",                "允许砍伐树林和收获由矿山改良的资源。"),
    ("zh_Hans_CN",  "LOC_TECH_MASONRY_HD_DESCRIPTION",               "允许收获由采石场改良的资源。"),
    ("zh_Hans_CN",  "LOC_TECH_THE_WHEEL_HD_DESCRIPTION",             "研究轮子后，所有境内改良设施获得道路。之后建造的改良设施也自动获得道路。"),
    ("zh_Hans_CN",  "LOC_TECH_IRRIGATION_DESCRIPTION",               "允许清理沼泽和收获由种植园改良的资源。允许在相邻淡水或水渠的平原和草原丘陵上修建农田。"),
    ("zh_Hans_CN",  "LOC_TECH_MACHINERY_HD_DESCRIPTION",             "非沿河的伐木场改良+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_TECH_TELECOMMUNICATIONS_HD_DESCRIPTION",    "所有除 [ICON_GREATWORK_RELIC] 遗物外的巨作+50% [ICON_TOURISM] 旅游业绩。"),
    -- ("zh_Hans_CN",  "LOC_TECH_RIFLING_HD_DESCRIPTION",               "营地+1 [ICON_FOOD] 食物。"),
    ("zh_Hans_CN",  "LOC_TECH_CONSTRUCTION_HD_DESCRIPTION",          "营地+1 [ICON_PRODUCTION] 生产力。伐木场改良+1 [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_TECH_APPRENTICESHIP_HD_DESCRIPTION",        "矿山和采石场改良设施的 [ICON_Production] 生产力+1。"),
    ("zh_Hans_CN",  "LOC_TECH_CELESTIAL_NAVIGATION_HD_DESCRIPTION",  "允许商人上船和收获由渔船改良的资源。若未掌握造船术，也允许所有陆地单位上船。"),
    ("zh_Hans_CN",  "LOC_TECH_ARCHERY_HD_DESCRIPTION",               "允许在树林上建造营地。营地+1 [ICON_gold] 金币。"),
    --("zh_Hans_CN",  "LOC_TECH_HORSEBACK_RIDING_HD_DESCRIPTION",      "牧场+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_TECH_STIRRUPS_HD_DESCRIPTION",              "牧场改良设施提供的 [ICON_PRODUCTION] 生产力+1。"),
    ("zh_Hans_CN",  "LOC_TECH_CASTLES_HD_DESCRIPTION",               "如果使用凯瑟琳·德·美第奇（黑王后），能免费获得1名间谍。"),
    ("zh_Hans_CN",  "LOC_TECH_REPLACEABLE_PARTS_HD_DESCRIPTION",     "将农场改良设施升级为机械化农业。为相邻的每个农场改良设施+1 [ICON_Food] 食物。"),
    ("zh_Hans_CN",  "LOC_TECH_STEAM_POWER_HD_DESCRIPTION",           "水运单位+2 [ICON_Movement] 移动力。商人单位在水域单元格的贸易范围增加15个单元格。"),
    ("zh_Hans_CN",  "LOC_TECH_STEEL_HD_DESCRIPTION",                 "解锁城市防御，为所有城市提供400点自动防御力和发起远程攻击的能力。之前的城墙改良设施将全部过时，攻城单位进攻时不再拥有特殊效果。"),
    ("zh_Hans_CN",  "LOC_TECH_SCIENTIFIC_THEORY_HD_DESCRIPTION",     "种植园改良设施+1 [ICON_Food] 食物。拥有大学的城市+5% [ICON_Science] 科技值"),
    -- Civics
    ("zh_Hans_CN",  "LOC_CIVIC_CIVIL_SERVICE_HD_DESCRIPTION",        "现与2个农场改良设施相邻时，农场产出的 [ICON_Food] 食物+1。"),
    ("zh_Hans_CN",  "LOC_CIVIC_FEUDALISM_HD_DESCRIPTION",            "种植园改良设施提供的 [ICON_Food] 食物+1。"),
    ("zh_Hans_CN",  "LOC_CIVIC_MEDIEVAL_FAIRES_HD_DESCRIPTION",      "种植园+2 [ICON_gold] 金币。牧场+1 [ICON_Food] 食物。"),
    -- ("zh_Hans_CN",  "LOC_CIVIC_MERCANTILISM_HD_DESCRIPTION",         "营地+2 [ICON_gold] 金币。"),
    ("zh_Hans_CN",  "LOC_CIVIC_GUILDS_HD_DESCRIPTION",               "允许在雨林上建造伐木场和营地。"),
    ("zh_Hans_CN",  "LOC_CIVIC_CIVIL_ENGINEERING_HD_DESCRIPTION",    "可以在草原丘陵和平原丘陵上建造农场。伐木场+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_CIVIC_ENVIRONMENTALISM_HD_DESCRIPTION",     "在帝国全境内+50% [ICON_Tourism] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_CIVIC_GLOBALIZATION_HD_DESCRIPTION",        "种植园+2 [ICON_gold] 金币。"),
    ("zh_Hans_CN",  "LOC_CIVIC_NATIONALISM_DESCRIPTION",             "可额外招募一名间谍。允许两个完全相同的单位组成一个兵团或舰队。受到伤害后，单位的 [ICON_Strength] 战斗力减益降低50%。现在可用一个新的战争借口替战争辩护：殖民战争。"),
    -- Boosts
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_MASS_PRODUCTION",             "建造3座伐木场。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_INDUSTRIALIZATION_XP2",       "建造3座工作坊。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_BRONZE_WORKING",              "击杀2个蛮族单位。"),
    -- ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_BRONZE_WORKING",     ""), -- 和蛮族的战争让你渴望更强大的武器。
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_THE_WHEEL",                   "建造1座牧场。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_THE_WHEEL",          "被驯养的动物们真是人类的好助手，但如何更有效率地利用他们呢？"), -- 采矿业让您拥有了建造轮轴的能力。接下来是车轮？
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_HORSEBACK_RIDING",            "建造1座改良马的牧场。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_HORSEBACK_RIDING",   "马匹现在被驯养在牧场里，是时候学习骑乘它们了。"), -- 动物现在被驯养在牧场里，是时候学习骑乘它们了。
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_FOREIGN_TRADE",               "遇见另一个文明。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_FOREIGN_TRADE",      "在与另一个文明国家会晤后，您发现这个广阔的世界有很多的贸易机会。"), -- 我们发现了一个新大陆，这个广阔的世界有很多的贸易机会。
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_WRITING",                     "建造一个纪念碑。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_WRITING",            "事件已无法用简单的符号表达，我们需要更准确的表达方式。"), -- 在与另一个文明国家会晤后，您意识到了新的交流方式的必要性。
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_GAMES_RECREATION",            "建造2座营地。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_GAMES_RECREATION",   "追捕猎物又何尝不是另一种游戏？"), -- 毫无疑问，您在建筑上的新技术对创建游戏和娱乐场所大有裨益。
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_NAVAL_TRADITION",             "拥有1艘四段帆船。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_NAVAL_TRADITION",    "新式船只的出现激励您的人民努力让国家成为海上强国。"), -- 您在海上取得的胜利激励您的人民努力让国家成为海上强国。
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_MEDIEVAL_FAIRES",             "经营3条贸易线。"),
    -- ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_MEDIEVAL_FAIRES",    ""), -- 您领土上的贸易正在蓬勃发展，这将很快促使商品交易会的产生。
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_RECORDED_HISTORY",            "建造1个图书馆"),
    -- ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_RECORDED_HISTORY",   ""), -- 您的国民打算把更多卷轴放在您的学院图书馆里，他们开始记录帝国历史了。
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_HUMANISM",                    "建造2个古罗马剧场。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_HUMANISM",           "频繁戏剧的演出引领了人民的新思潮。"), -- 您新获得的大艺术家带来的启示使我们的人民意识到了个体的力量。
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_DEFENSIVE_TACTICS",           "使用枪兵击杀1个单位。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_DEFENSIVE_TACTICS",  "枪兵拥有出色的单兵作战能力，那如果将他们组合起来呢？"), -- 面对入侵威胁，您的国民已准备好了一种新型防御措施。
    -- ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_MILITARY_TACTICS",            "拥有防御战术市政。"),
    -- ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_MILITARY_TACTICS",   "初步的防御战术是不足以抵御强大的敌人的，我们需要更丰富的战术"), -- 您的枪兵很厉害，但如今您的对手实力变强了，行动也更快了。您或许需要一个更长的武器？
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_REPLACEABLE_PARTS",           "拥有3个线列步兵。"),
    -- ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_REPLACEABLE_PARTS",  ""), -- 您的武器制造商已厌倦了手工制作数量如此庞大的步枪。或许建立标准化对此有帮助？
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_SIEGE_TACTICS",               "拥有2个投石机。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_SIEGE_TACTICS",      "在投石机出现后，您意识到城堡并非固若金汤——您需要更坚固的防御措施！"), -- 在射石炮出现后，您意识到城堡并非固若金汤——您需要更坚固的防御措施！
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_METAL_CASTING",               "拥有军事训练市政。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_METAL_CASTING",      "军事训练推进着武器不断的革新，新式的武器铸造方式也孕育而生。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_CASTLES",                     "拥有防御战术市政。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_CASTLES",            "我们需要更牢靠的防御来更好地发挥防御战术保护我们的城市。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_MILITARY_TACTICS",            "获得一位大将军。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_MILITARY_TACTICS",   "大将军带来了全新的军事战术的思考。");
