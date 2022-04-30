--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                 Text)
values
    ("LOC_UNIT_BUILDER_DL_DESCRIPTION",                   "May create tile improvements, remove features like Woods or Rainforest, or Harvest some resources. Builders can be used 4 times. This can be increased through policies or wonders like the Pyramids. After Sailing is researched, Builders are allowed to embark."),
    ("LOC_UNIT_GURU_DESCRIPTION",                         "May use a charge to heal itself and all adjacent friendly religious units. May not initiate theological combat with units of other Religions (but can defend). Religious units adjacent to Gurus receive +5 [ICON_Religion] Religious Strength in Theological Combat and +1 [ICON_Movement] Movement."),
    ("LOC_UNIT_SIEGE_TOWER_EXPANSION2_DESCRIPTION",       "Medieval era support unit. When adjacent to a city, attacking melee, anti-cavalry units and Warrior Monks ignore Walls and immediately assault the city. Does not affect cities with Renaissance Walls. Ineffective against Urban Defenses."),
    ("LOC_UNIT_BATTERING_RAM_EXPANSION2_DESCRIPTION",     "Ancient era support unit. When adjacent to a city, attacking melee, anti-cavalry units and Monk Warriors do full damage to the city’s Walls. Does not affect cities with Medieval or Renaissance Walls. Ineffective against Urban Defenses."),
    ("LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION",        "Medieval era support unit. Requires an Armory to produce. Can construct Roads, Railroads, Forts, Airstrips, Missile Silos, and Mountain Tunnel improvements. One of their build charges can also be used to complete 30% of a Canal, Dam or Aqueduct district or a Flood Barrier building. Ignore [ICON_MOVEMENT] movement penalty from all Terrians, Features and Rivers."), -- Can move with ability that ignore all the terrain and river.
    ("LOC_UNIT_WARRIOR_MONK_DESCRIPTION",                 "Fast-moving land combat unit with a unique promotion tree. Can only be purchased with [ICON_FAITH] Faith in city with a Temple."),
    ("LOC_UNIT_OBSERVATION_BALLOON_DESCRIPTION",          "Industrial era support unit. Grants +1 [ICON_Range] Range to Siege class units within 1 hex."),
    ("LOC_UNIT_ANCIENT_SEADOG_DESCRIPTION",               "Ancient era ranged Naval Raider."),
    ("LOC_UNIT_ANCIENT_SEADOG_NAME",                      "Oarlocked Rowboats"), -- Outrigger Boats
    -- Unique Units
    ("LOC_UNIT_NORWEGIAN_LONGSHIP_DESCRIPTION",           "Norwegian unique Ancient era naval unit that replaces the Galley. Can pillage enemy coastal lands and capture civilians if adjacent using its coastal raiding ability. Formation units all inherit escort's [ICON_Movement] Movement speed. 4 [ICON_Movement] Movement while in coastal waters."),
    ("LOC_UNIT_ENGLISH_SEADOG_DESCRIPTION",               "English unique Renaissance era naval unit that replaces the Privateer. Has a chance to capture defeated enemy ships."), -- Can only be seen by other Naval Raiders unless adjacent to it. Reveals Naval Raiders within sight range.
    ("LOC_UNIT_OTTOMAN_BARBARY_CORSAIR_DESCRIPTION",      "Ottoman unique Medieval era naval unit that replaces the Pirate Ship. It costs no [ICON_Movement] Movement to coastal raid."), -- Can only be seen by other Naval Raiders unless adjacent to it. Reveals Naval Raiders within sight range.
    ("LOC_UNIT_GERMAN_UBOAT_DESCRIPTION",                 "German unique Modern era naval unit that replaces the Submarine. Cheaper to produce, +1 Sight, and +10 [ICON_Strength] Combat Strength when fighting on Ocean tiles."), -- Able to reveal other stealthed units.
    ("LOC_UNIT_ZULU_IMPI_DESCRIPTION",                    "Zulu unique Medieval Era unit that replaces the Pikeman. +100% Flanking bonus, lower maintenance. Earns XP 50% faster."),
    ("LOC_UNIT_KONGO_SHIELD_BEARER_DESCRIPTION",          "Kongo unique Classical era unit that replaces the Swordsman. +10 [ICON_Strength] Combat Strength when defending against ranged attacks. Can see through Woods and Rainforest. +3 [ICON_Strength] Combat Strength when fighting in Rainforest or Woods tiles."),
    ("LOC_UNIT_SWEDEN_CAROLEAN_DESCRIPTION",              "Swedish unique Industrial Era unit that replaces the Line Infantry. Faster than the Pike and Shot. +3 [ICON_Strength] Combat Strength per unused [ICON_Movement] Movement."),
    ("LOC_UNIT_BABYLONIAN_SABUM_KIBITTUM_DESCRIPTION",    "Babylonian unique Ancient era melee unit. +17 [ICON_Strength] Combat Strength against Heavy and Light Cavalry promotion class units. This unit has 3 [ICON_Movement] Movement and sight. Combat victories provide [ICON_SCIENCE] Science equal to 50% of that unit's base [ICON_Strength] Combat Strength (on Standard Speed)."),
    ("LOC_UNIT_MALI_MANDEKALU_CAVALRY_DESCRIPTION",       "Mali unique Medieval Era unit that replaces the Knight. Stronger than Knight. Trader units are immune to being plundered if they are within 4 tiles of a Mandekalu Cavalry and on a land tile. Combat kills provide [ICON_GOLD] Gold equal to 100% of killed unit's base [ICON_Strength] Combat Strength (on Standard Speed). 20% Cheaper to purchase with [ICON_Gold] Gold or [ICON_Faith] Faith (when available)."),
    ("LOC_UNIT_DE_ZEVEN_PROVINCIEN_DESCRIPTION",          "Netherlands unique Renaissance Era unit that replaces the Frigate. +7 [ICON_Strength] Combat Strength when attacking defensible districts. Require less resources to build or upgrade."),
    ("LOC_UNIT_SCYTHIAN_HORSE_ARCHER_DESCRIPTION",        "Scythian unique Classical era unit. Ranged unit with 4 [ICON_Movement] Movement with a [ICON_Range] Range of 2. Can move after attacking and ignore Zone of Control."),
    ("LOC_UNIT_MONGOLIAN_KESHIG_DESCRIPTION",             "Mongolian unique Medieval Era Ranged Cavalry unit that replaces Crossbowman. Can move after attacking and ignore Zone of Control. Can escort moving civilian and support units at their higher [ICON_Movement] Movement speed."),
    ("LOC_UNIT_AZTEC_EAGLE_WARRIOR_DESCRIPTION",          "Aztec unique Ancient era unit that replaces the Warrior. Has higher base combat Strength."),
    ("LOC_UNIT_ROMAN_LEGION_DESCRIPTION",                 "Roman unique Classical era melee unit that replaces the Swordsman. Can build a Roman Fort. Can construct ancient or classical roads."),
    ("LOC_UNIT_CHINESE_CROUCHING_TIGER_DESCRIPTION",      "Chinese unique Renaissance era unit that replaces the Field Cannon. Ranged unit with high combat strength."),
    ("LOC_UNIT_MACEDONIAN_HETAIROI_DESCRIPTION",          "Macedonian unique heavy cavalry unit. Additional +5 [ICON_Strength] Combat Strength when adjacent to a Great General. +10 Great General points when killing an enemy unit. Starts with 1 free Promotion."),
    ("LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION",            "Sumerian unique Ancient era unit. Stronger than all other starting units. No penalties against anti-cavalry units. 4 [ICON_Movement] Movement if this unit starts in open terrain. Attacks do full damage to the city's Walls."),
    ("LOC_UNIT_CREE_OKIHTCITAW_DESCRIPTION",              "Cree unique Ancient era unit that replaces the Scout. Strong reconnaissance unit and have one more [ICON_Movement] Movement than Scout."),
    ("LOC_UNIT_POLISH_HUSSAR_EXPANSION2_DESCRIPTION",     "Polish unique Renaissance era unit. Pushes defending enemy units back from their hex in any battle where they score more damage. Defenders that cannot retreat suffer additional damage. 50% less [ICON_Strength] Combat Strength reduction from being injured.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                 Text)
values
    ("zh_Hans_CN",  "LOC_UNIT_BUILDER_DL_DESCRIPTION",                   "可建造单元格改良设施、移除地貌（如森林或雨林），或收获资源。建造者可使用4次。可通过政策或奇观（如金字塔）增加使用次数。研究“航海术”科技后可进入湖泊或浅海单元格。"),
    ("zh_Hans_CN",  "LOC_UNIT_GURU_DESCRIPTION",                         "消耗次数可治疗其自身以及相邻的全部友方宗教单位。无法发起和其他宗教单位的神学战争（但可进行防御）。与上师相邻的宗教单位在神学战争中+5 [ICON_Religion] 宗教战斗力、+1 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_UNIT_SIEGE_TOWER_EXPANSION2_DESCRIPTION",       "中世纪支援单位。与城市相邻时，近战、抗骑兵单位和武僧可无视城墙直接对城市发起进攻。对拥有文艺复兴城墙的城市无效。对现代城市防御无效。"),
    ("zh_Hans_CN",  "LOC_UNIT_BATTERING_RAM_EXPANSION2_DESCRIPTION",     "远古时代支援单位。与城市相邻时，近战，抗骑兵单位和武僧发起进攻可对城墙输出全额伤害。对拥有中世纪或文艺复兴城墙的城市无效。对现代城市防御无效。"),
    ("zh_Hans_CN",  "LOC_UNIT_MILITARY_ENGINEER_ALT_DESCRIPTION",        "中世纪支援单位。需要“兵工厂”才能生产。能建造道路、堡垒、飞机跑道、导弹发射井和穿山隧道改良设施。其建造次数可用于加快运河、堤坝、水渠区域或拦洪坝30%的建造进度。无视地形、地貌和河流的移动力消耗。"),
    ("zh_Hans_CN",  "LOC_UNIT_WARRIOR_MONK_DESCRIPTION",                 "高移动力的陆地战斗单位，拥有独特的升级树。只能在有寺庙的城市通过 [ICON_FAITH] 信仰购买。"),
    ("zh_Hans_CN",  "LOC_UNIT_OBSERVATION_BALLOON_DESCRIPTION",          "工业时代支援单位。为1单元格内的攻城类单位+1 [ICON_Range] 射程。"),
    ("zh_Hans_CN",  "LOC_UNIT_ANCIENT_SEADOG_DESCRIPTION",               "远古时代的海军袭击者。"),
    ("zh_Hans_CN",  "LOC_UNIT_ANCIENT_SEADOG_NAME",                      "桨架划艇"),
    -- 特色单位
    ("zh_Hans_CN",  "LOC_UNIT_NORWEGIAN_LONGSHIP_DESCRIPTION",           "取代桨帆船的挪威远古时代特色海军单位。通过海岸扫荡能力，可掠夺敌方海岸土地，并俘获附近的平民。能在中立领土上恢复。可使编队单位继承自己的移动力。位于海岸水域时， [ICON_Movement] 移动力为4。"),
    ("zh_Hans_CN",  "LOC_UNIT_ENGLISH_SEADOG_DESCRIPTION",               "文艺复兴时代英国特色海军单位，取代私掠船。击败敌方船只后有几率将其俘获。"),
    ("zh_Hans_CN",  "LOC_UNIT_OTTOMAN_BARBARY_CORSAIR_DESCRIPTION",      "中世纪奥斯曼特色海军单位，取代海盗船。进行海岸扫荡时无需花费 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_UNIT_GERMAN_UBOAT_DESCRIPTION",                 "取代潜艇的德国特色现代海军单位。生产成本更低，+1视野，在海洋单元格作战时，+10 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_UNIT_ZULU_IMPI_DESCRIPTION",                    "中世纪时代的祖鲁特色单位，替代长矛兵。双倍夹击加成，维护费较低。从战斗中获得的经验值多50%。"),
    ("zh_Hans_CN",  "LOC_UNIT_KONGO_SHIELD_BEARER_DESCRIPTION",          "取代剑客的刚果古典时代特色单位。防御远程攻击时+10 [ICON_Strength] 战斗力。视野能穿过树林和雨林。在森林或雨林中战斗时+3 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_UNIT_SWEDEN_CAROLEAN_DESCRIPTION",              "瑞典工业时代特色单位，取代线列步兵，速度较其更快。每点未使用的 [ICON_Movement] 移动力提供+3 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_UNIT_BABYLONIAN_SABUM_KIBITTUM_DESCRIPTION",    "巴比伦特色远古时代近战单位。与轻重骑兵类单位作战时+17 [ICON_Strength] 战斗力。此单位拥有3点 [ICON_Movement] 移动力和视野。战斗胜利后，可获得等同于被击杀单位50%基础 [ICON_Strength] 战斗力数值的 [ICON_SCIENCE] 科技值（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_UNIT_MALI_MANDEKALU_CAVALRY_DESCRIPTION",       "马里中世纪特色单位，取代骑士。基础力更高。位于陆地且与曼德卡鲁骑兵相距4个单元格内的商人单位可免遭掠夺。战斗胜利后，可获得等同于被击杀单位基础 [ICON_Strength] 战斗力数值的 [ICON_GOLD] 金币（标准速度下）。使用 [ICON_Gold] 金币购买时降价20%，若可用 [ICON_Faith] 信仰购买时也降价20%。"),
    ("zh_Hans_CN",  "LOC_UNIT_DE_ZEVEN_PROVINCIEN_DESCRIPTION",          "荷兰文艺复兴特色单位，取代护卫舰。攻击防御区域时+7 [ICON_Strength] 战斗力。建造或升级得到时需要更少的战略资源。"),
    ("zh_Hans_CN",  "LOC_UNIT_SCYTHIAN_HORSE_ARCHER_DESCRIPTION",        "斯基泰古典时代特色单位。 [ICON_Range] 射程为2， [ICON_Movement] 移动力为4的远程单位。攻击后可移动且免受控制区影响。"),
    ("zh_Hans_CN",  "LOC_UNIT_MONGOLIAN_KESHIG_DESCRIPTION",             "取代弩手的中世纪蒙古特色远程单位。攻击后可移动且免受控制区影响。可利用自身的高 [ICON_Movement] 移动力护送平民和支援单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_AZTEC_EAGLE_WARRIOR_DESCRIPTION",          "取代勇士的阿兹特克远古时代特色单位。拥有更高的基础战斗力。"),
    ("zh_Hans_CN",  "LOC_UNIT_ROMAN_LEGION_DESCRIPTION",                 "取代剑客的罗马古典时代特色近战单位。能建造一个罗马堡垒，修建远古和古典道路。"),
    ("zh_Hans_CN",  "LOC_UNIT_CHINESE_CROUCHING_TIGER_DESCRIPTION",      "中国文艺复兴特色单位，取代野战加农炮。 火药解锁的高战斗力的远程单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_MACEDONIAN_HETAIROI_DESCRIPTION",          "马其顿特色重骑兵单位。与大将军相邻时额外+5 [ICON_Strength] 战斗力。击杀敌方单位时+10大将军点数。初始便拥有1次免费升级。"),
    ("zh_Hans_CN",  "LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION",            "苏美尔远古时代特色单位。比其他所有初始单位更强大。对战抗骑兵单位时，无减益。如果该单位从开阔地形开始回合， [ICON_Movement] 移动力为4。对城墙造成全额伤害。"),
    ("zh_Hans_CN",  "LOC_UNIT_CREE_OKIHTCITAW_DESCRIPTION",              "远古时代的克里特色单位，替代侦察兵。拥有更高战斗力的侦察单位，且比侦察兵多1 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_UNIT_POLISH_HUSSAR_EXPANSION2_DESCRIPTION",     "波兰文艺复兴特色单位。伤害点数高于敌方的状况下，会将防守的敌方单位推至后方的单元格。无法后退的防守单位会遭受额外伤害。受伤后的 [ICON_Strength] 战斗力减益减少50%。");

-- Units information updates
--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                       Text)
values

    ("LOC_UNIT_HD_BARBARIAN_GALLEY_NAME",                                       "Primitive Galley"),
    ("LOC_UNIT_HD_BARBARIAN_GALLEY_DESCRIPTION",                                "Ancient era naval raider unit, unique to Barbarians."),
    ("LOC_UNIT_HD_BARBARIAN_QUADRIREME_NAME",                                   "Primitive Quadrireme"),
    ("LOC_UNIT_HD_BARBARIAN_QUADRIREME_DESCRIPTION",                            "Ancient era naval ranged unit, unique to Barbarians."),
    ("LOC_UNIT_DL_MEDIEVAL_PIRATE_DESCRIPTION",                                 "Medieval era Naval Raider unit."), -- have the ability to coastal raid. Can only be seen by other Naval Raiders unless adjacent to it. Reveals Naval Raiders within sight range."),
    ("LOC_UNIT_PRIVATEER_DESCRIPTION",                                          "Renaissance era Naval Raider unit."), -- ranged naval unit with the ability to coastal raid. Can only be seen by other Naval Raiders unless adjacent to it. Reveals Naval Raiders within sight range."),
    ("LOC_UNIT_SUBMARINE_DESCRIPTION",                                          "Modern era Naval Raider unit."), -- ranged naval unit with the ability to coastal raid. Can only be seen by other Naval Raiders unless adjacent to it. Reveals Naval Raiders within sight range."),
    ("LOC_UNIT_NUCLEAR_SUBMARINE_DESCRIPTION",                                  "Highly advanced Information era Naval Raider unit that can be armed with nuclear weapons."),
    ("LOC_UNIT_CATAPULT_DESCRIPTION",                                           "Classical era siege unit, ideal for attacking cities. Cannot move and attack on the same turn unless player has Military Training Civic."),
    ("LOC_UNIT_BOMBARD_DESCRIPTION",                                            "Renaissance era siege unit, ideal for attacking cities. Cannot move and attack on the same turn unless player has Military Training Civic."),
    ("LOC_UNIT_ARTILLERY_DESCRIPTION",                                          "Modern era siege unit, ideal for attacking cities. Cannot move and attack on the same turn unless player has Military Training Civic."),
    ("LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION",                                   "Information era siege unit, ideal for attacking cities. Cannot move and attack on the same turn unless player has Military Training Civic."),
    ("LOC_UNIT_TREBUCHET_DESCRIPTION",                                          "Medieval era siege unit, ideal for attacking cities. Cannot move and attack on the same turn unless player has Military Training Civic."),
    ("LOC_PROMOTION_HELMSMAN_DESCRIPTION",                                      "+1 [ICON_Movement] Movement, and +1 sight range.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    ("zh_Hans_CN",  "LOC_UNIT_HD_BARBARIAN_GALLEY_NAME",                                    "原始桨帆船"),
    ("zh_Hans_CN",  "LOC_UNIT_HD_BARBARIAN_GALLEY_DESCRIPTION",                             "远古时代蛮族部落的海上侦察单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_HD_BARBARIAN_QUADRIREME_NAME",                                "原始四段帆船"),
    ("zh_Hans_CN",  "LOC_UNIT_HD_BARBARIAN_QUADRIREME_DESCRIPTION",                         "远古时代蛮族部落的海上远程单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_DL_MEDIEVAL_PIRATE_DESCRIPTION",                              "中世纪时代海军袭击者。"),
    ("zh_Hans_CN",  "LOC_UNIT_PRIVATEER_DESCRIPTION",                                       "文艺复兴时代的海军袭击者。"),
    ("zh_Hans_CN",  "LOC_UNIT_SUBMARINE_DESCRIPTION",                                       "现代海军袭击者。"),
    ("zh_Hans_CN",  "LOC_UNIT_NUCLEAR_SUBMARINE_DESCRIPTION",                               "高度发达的信息时代海军袭击者，能配备核武器。"),
    ("zh_Hans_CN",  "LOC_UNIT_CATAPULT_DESCRIPTION",                                        "古典时代攻城单位，适合对城市发起攻击。无法在一回合内移动并攻击（除非玩家已拥有军事训练市政）。"),
    ("zh_Hans_CN",  "LOC_UNIT_BOMBARD_DESCRIPTION",                                         "文艺复兴时代攻城单位，适合对城市发起攻击。无法在一回合内移动并攻击（除非玩家已拥有军事训练市政）。"),
    ("zh_Hans_CN",  "LOC_UNIT_ARTILLERY_DESCRIPTION",                                       "现代攻城单位，适合对城市发起攻击。无法在一回合内移动并攻击（除非玩家已拥有军事训练市政）。"),
    ("zh_Hans_CN",  "LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION",                                "信息时代攻城单位，适合对城市发起攻击。无法在一回合内移动并攻击（除非玩家已拥有军事训练市政）。"),
    ("zh_Hans_CN",  "LOC_UNIT_TREBUCHET_DESCRIPTION",                                       "中世纪攻城单位，适合对城市发起攻击。无法在一回合内移动并攻击（除非玩家已拥有军事训练市政）。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_HELMSMAN_DESCRIPTION",                                   "+1 [ICON_Movement] 移动力，+1视野范围。");