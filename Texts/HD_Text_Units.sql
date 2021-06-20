--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                 Text)
values
    ("LOC_UNIT_BUILDER_DL_DESCRIPTION",                   "May create tile improvements, remove features like Woods or Rainforest, or Harvest some resources. Builders can be used 4 times. This can be increased through policies or wonders like the Pyramids."),
    ("LOC_UNIT_SIEGE_TOWER_EXPANSION2_DESCRIPTION",       "Medieval era support unit. When adjacent to a city, attacking melee, anti-cavalry units and Warrior Monks ignore Walls and immediately assault the city. Does not affect cities with Renaissance Walls. Ineffective against Urban Defenses."),
    ("LOC_UNIT_BATTERING_RAM_EXPANSION2_DESCRIPTION",     "Ancient era support unit. When adjacent to a city, attacking melee and anti-cavalry units do full damage to the city’s Walls. Does not affect cities with Medieval or Renaissance Walls. Ineffective against Urban Defenses."),
    ("LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION",        "Medieval era support unit. Requires an Armory to produce. Can construct Roads, Railroads, Forts, Airstrips, Missile Silos, and Mountain Tunnel improvements. One of their build charges can also be used to complete 30% of a Canal, Dam or Aqueduct district or a Flood Barrier building. Ignore [ICON_MOVEMENT] movement penalty from all Terrians, Features and Rivers."), -- Can move with ability that ignore all the terrain and river.
    ("LOC_UNIT_WARRIOR_MONK_DESCRIPTION",                 "Fast-moving land combat unit with a unique promotion tree. Can only be purchased by [ICON_FAITH] Faith in city with a Temple. "),
    -- Unique Units
    ("LOC_UNIT_ROMAN_LEGION_DESCRIPTION",                 "Roman unique Classical era melee unit that replaces the Swordsman. Can build a Roman Fort. Can construct ancient or classical roads."),
    ("LOC_UNIT_CHINESE_CROUCHING_TIGER_DESCRIPTION",      "Chinese unique Renaissance era unit that replaces the Field Cannon. Ranged unit with high combat strength."),
    ("LOC_UNIT_MACEDONIAN_HETAIROI_DESCRIPTION",          "Macedonian unique heavy cavalry unit that replaces the Horseman. Additional +5 [ICON_Strength] Combat Strength when adjacent to a Great General. +10 Great General points when killing an enemy unit. Starts with 1 free Promotion."),
    ("LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION",            "Sumerian unique Ancient era unit. Stronger than all other starting units. No penalties against anti-cavalry units. 4 [ICON_Movement] Movement if this unit starts in open terrain. Attacks do full damage to the city's Walls.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                 Text)
values
    ("zh_Hans_CN",  "LOC_UNIT_BUILDER_DL_DESCRIPTION",                   "可建造单元格改良设施、移除地貌（如森林或雨林），或收获资源。建造者可使用4次。可通过政策或奇观（如金字塔）增加使用次数。"),
    ("zh_Hans_CN",  "LOC_UNIT_SIEGE_TOWER_EXPANSION2_DESCRIPTION",       "中世纪支援单位。与城市相邻时，近战、抗骑兵单位和武僧可无视城墙直接对城市发起进攻。对拥有文艺复兴城墙的城市无效。对现代城市防御无效。"),
    ("zh_Hans_CN",  "LOC_UNIT_BATTERING_RAM_EXPANSION2_DESCRIPTION",     "远古时代支援单位。与城市相邻时，近战，抗骑兵单位和武僧发起进攻可对城墙输出全额伤害。对拥有中世纪或文艺复兴城墙的城市无效。对现代城市防御无效。"),
    ("zh_Hans_CN",  "LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION",        "中世纪支援单位。需要“兵工厂”才能生产。能建造道路、堡垒、飞机跑道、导弹发射井和穿山隧道改良设施。其建造次数可用于加快运河、堤坝、水渠区域或拦洪坝30%的建造进度。无视地形、地貌和河流的移动力消耗。"),
    ("zh_Hans_CN",  "LOC_UNIT_WARRIOR_MONK_DESCRIPTION",                 "高移动力的陆地战斗单位，拥有独特的升级树。只能在有寺庙的城市通过 [ICON_FAITH] 信仰购买。"),
    -- 特色单位
    ("zh_Hans_CN",  "LOC_UNIT_ROMAN_LEGION_DESCRIPTION",                 "取代剑客的罗马古典时代特色近战单位。能建造一个罗马堡垒，修建远古和古典道路。"),
    ("zh_Hans_CN",  "LOC_UNIT_CHINESE_CROUCHING_TIGER_DESCRIPTION",      "中国文艺复兴特色单位，取代野战加农炮。 火药解锁的高战斗力的远程单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_MACEDONIAN_HETAIROI_DESCRIPTION",          "马其顿特色重骑兵单位，替代骑手。与大将军相邻时额外+5 [ICON_Strength] 战斗力。击杀敌方单位时+10大将军点数。初始便拥有1次免费升级。"),
    ("zh_Hans_CN",  "LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION",            "苏美尔远古时代特色单位。比其他所有初始单位更强大。对战抗骑兵单位时，无减益。如果该单位从开阔地形开始回合， [ICON_Movement] 移动力为4。对城墙造成全额伤害。");

-- WE
--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                 Text)
values
    -- Naval
    ("LOC_UNIT_ATTACK_SUBMARINE_DESCRIPTION",             "Atomic era ranged raiding naval unit. Can only be seen by other Naval Raiders unless adjacent to it. Reveals Naval Raiders within sight range."),
    ("LOC_UNIT_MISSILE_DESTROYER_DESCRIPTION",            "Strongest melee naval unit. Reveals submarines within sight range."),
    ("LOC_UNIT_MISSILE_CRUISER_DESCRIPTION",              "Strongest ranged naval unit."), -- Provides cover from air and nuclear attacks up to 1 tile away.
    -- Land
    ("LOC_UNIT_ARQUEBUSIER_DESCRIPTION",                  "Renaissance era recon unit."),
    ("LOC_UNIT_GUARDS_DESCRIPTION",                       "Industrial era anti-cavalry unit that's effective against mounted units."),
    ("LOC_UNIT_AT_CREW_NAME",                             "AT Crew"),
    ("LOC_UNIT_AT_CREW_DESCRIPTION",                      "Modern era counter to cavalry class units."),
    ("LOC_UNIT_ANTI_TANK_GUN_DESCRIPTION",                "Atomic era anti-cavalry unit that's effective against mounted units."),
    ("LOC_UNIT_MODERN_AT_NAME",                           "Modern AT"),
    ("LOC_UNIT_MODERN_AT_DESCRIPTION",                    "Information era counter to cavalry class units.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                 Text)
values
    -- Naval
    ("zh_Hans_CN",  "LOC_UNIT_COG_NAME",                                 "柯克船"),
    ("zh_Hans_CN",  "LOC_UNIT_COG_DESCRIPTION",                          "中世纪海军近战单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_CARAVEL_DESCRIPTION",                      "文艺复兴快速探索近战海军单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_RAIDER_NAME",                              "商船劫掠者"),
    ("zh_Hans_CN",  "LOC_UNIT_RAIDER_DESCRIPTION",                       "工业时期的海军远程袭击单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_ATTACK_SUBMARINE_DESCRIPTION",             "原子能时代海军远程袭击单位。除非与单位相邻，否则只能被其他海军袭击者发现。能使视线范围中的海军袭击者暴露位置。"),
    -- Land
    ("zh_Hans_CN",  "LOC_UNIT_ARMORED_HORSEMAN_NAME",                    "重装骑兵"),
    ("zh_Hans_CN",  "LOC_UNIT_RECON_HELICOPTER_NAME",                    "侦察直升机"),
    ("zh_Hans_CN",  "LOC_UNIT_RECON_HELICOPTER_DESCRIPTION",             "原子时代支援单位。为1单元格内的攻城类单位+1 [ICON_Range] 射程、+5 [ICON_Bombard] 炮击攻击力。"),
    ("zh_Hans_CN",  "LOC_UNIT_ARQUEBUSIER_DESCRIPTION",                  "启蒙时代的侦察单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_STRADIOT_NAME",                            "巴尔干雇佣骑兵"),
    ("zh_Hans_CN",  "LOC_UNIT_STRADIOT_DESCRIPTION",                     "高机动性的启蒙时代轻骑兵。"),
    ("zh_Hans_CN",  "LOC_UNIT_GUARDS_NAME",                              "近卫步兵"),
    ("zh_Hans_CN",  "LOC_UNIT_GUARDS_DESCRIPTION",                       "工业时代抗骑兵单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_AT_CREW_NAME",                             "反坦克组"),
    ("zh_Hans_CN",  "LOC_UNIT_AT_CREW_DESCRIPTION",                      "现代抗骑兵类单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_ANTI_TANK_GUN_DESCRIPTION",                "原子能时代抗骑兵单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_MODERN_AT_NAME",                           "现代反坦克组"),
    ("zh_Hans_CN",  "LOC_UNIT_MODERN_AT_DESCRIPTION",                    "信息时代抗骑兵类单位。");

--------------------------------------------------------------------------------
-- WE extra version
insert or replace into EnglishText (Tag, Text) select
    "LOC_UNIT_MACHINE_GUN_DESCRIPTION", "Modern era recon unit."
where exists (select Tag from EnglishText where Tag = 'LOC_UNIT_MODERN_INFANTRY_NAME');

insert or replace into LocalizedText (Language, Tag, Text) select
    "zh_Hans_CN", "LOC_UNIT_MACHINE_GUN_DESCRIPTION", "现代侦察单位。"
where exists (select Tag from EnglishText where Tag = 'LOC_UNIT_MODERN_INFANTRY_NAME');

insert or replace into EnglishText (Tag, Text) select
    "LOC_UNIT_HELICOPTER_DESCRIPTION", "Fast-moving Atomic era recon unit. Ignore [ICON_MOVEMENT] movement penalty from all Terrians, Features and Rivers."
where exists (select Tag from EnglishText where Tag = 'LOC_UNIT_MODERN_INFANTRY_NAME');

insert or replace into LocalizedText (Language, Tag, Text) select
    "zh_Hans_CN", "LOC_UNIT_HELICOPTER_DESCRIPTION", "移动迅速的原子能时代侦察单位。无视地形、地貌和河流的移动力消耗。"
where exists (select Tag from EnglishText where Tag = 'LOC_UNIT_MODERN_INFANTRY_NAME');

insert or replace into EnglishText (Tag, Text) select
    "LOC_UNIT_SPEC_OPS_DESCRIPTION", "Information Era reconnaissance unit. Paradrop ability allows movement from friendly tile to location 7 tiles away (12 if starting from Aerodrome or Airstrip). Can attack support units directly without having to eliminate the combat unit first."
where exists (select Tag from EnglishText where Tag = 'LOC_UNIT_MODERN_INFANTRY_NAME');

insert or replace into LocalizedText (Language, Tag, Text) select
    "zh_Hans_CN", "LOC_UNIT_SPEC_OPS_DESCRIPTION", "信息时代侦察单位。拥有“空投”能力，可移动到离友方单元格7个单元格的位置上（如果从航空港或飞机跑道上执行空投则距离上升为12个单元格）。无需先消灭地面战斗单位即可直接攻击支援单位。"
where exists (select Tag from EnglishText where Tag = 'LOC_UNIT_MODERN_INFANTRY_NAME');
