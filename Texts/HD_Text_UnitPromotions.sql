--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                       Text)
values
    -- Abilities
    ("LOC_ABILITY_MELEE_BATTLE_LINE_HD_DESCRIPTION",                            "+3 [ICON_Strength] Combat Strength if there is at least one adjacent friendly melee unit."),
    ("LOC_ABILITY_RANGED_HILLS_STRENGTH_HD_DESCRIPTION",                        "+5 [ICON_Strength] Combat Strength When attacking from Hills."),
    ("LOC_ABILITY_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION_HD_DESCRIPTION",      "Units ignore [ICON_Strength] Combat Strength reduction from being injured."),
    ("LOC_ABILITY_RECON_IGNORE_RIVERS_AND_SHORES_HD_DESCRIPTION",               "No [ICON_Strength] Combat Strength and [ICON_Movement] Movement penalty when attacking from a Sea or a River."),
    ("LOC_ABILITY_HEAVYC_HEAL_AFTER_KILL_HD_DESCRIPTION",                       "+10 [ICON_Damaged] Health after defeating an enemy unit."),
    ("LOC_ABILITY_LIGHTC_AGAINST_UNIT_BONUS_HD_DESCRIPTION",                    "+5 [ICON_Strength] Combat Strength against units."),
    ("LOC_ABILITY_SIEGE_ATTACK_DISTRICT_BONUS_HD_DESCRIPTION",                  "+5 [ICON_Strength] Combat Strength when attacking Districts."),
    ("LOC_ABILITY_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_DESCRIPTION",         "+3 [ICON_Strength] Combat Strength for units fighting in Rainforest or Woods tiles."),
    ("LOC_ABILITY_RANGED_GARRISON_BONUS_HD_DESCRIPTION",                        "+5 [ICON_Strength] Combat Strength when occupying either an improvement that provides [ICON_Strength] Defense Strength or a District."),
    ("LOC_ABILITY_ANTIC_HILLS_DEFEND_BONUS_HD_DESCRIPTION",                     "+7 [ICON_Strength] Combat Strength when defending from melee attack on Hills."),
    ("LOC_ABILITY_RECON_IGNORE_ZOC_HD_DESCRIPTION",                             "Ignores Zones of Control."),
    -- ("LOC_ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD_DESCRIPTION",                    "+5 [ICON_Strength] Combat Strength when fighting on flat tiles without Woods, Jungle, or Marsh."),
    ("LOC_ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD_DESCRIPTION",                    "+5 [ICON_Strength] Combat Strength when attacking wounded units."),
    -- ("LOC_ABILITY_LIGHTC_EXTRA_FAITH_PLUNDER_HD_DESCRIPTION",                   "Pillaging Improvements and Districts provides extra 25 [ICON_Faith] Faith."),
    ("LOC_ABILITY_LIGHTC_ENEMY_MOVEMENT_HD_DESCRIPTION",                        "+1 [ICON_Movement] Movement if starting in enemy's territory."),
    ("LOC_ABILITY_SIEGE_ATTACK_AFTER_MOVE_HD_DESCRIPTION",                      "Can attack after moving (enabled by Military Training Civic)."),
    -- Preview Text
    ("LOC_HD_BATTLE_LINE_COMBAT_PREVIEW_TEXT",                                  "Adjacent to friendly melee unit"),
    ("LOC_HD_ATTACKING_FROM_HILLS_STRENGTH_PREVIEW_TEXT",                       "Attacking from Hills"),
    ("LOC_HD_AGAINST_UNIT_BONUS_PREVIEW_TEXT",                                  "Against units"),
    ("LOC_HD_ATTACK_DISTRICT_BONUS_PREVIEW_TEXT",                               "Attack Districts"),
    ("LOC_HD_FOREST_AND_JUNGLE_COMBAT_BONUS_PREVIEW_TEXT",                      "Fighting in Rainforest or Woods tiles"),
    ("LOC_HD_GARRISON_BONUS_PREVIEW_TEXT",                                      "From occupying either an improvement that provides [ICON_Strength] Defense Strength or a district"),
    ("LOC_HD_HILLS_DEFEND_BONUS_PREVIEW_TEXT",                                  "From defending on Hills"),
    -- ("LOC_HD_OPEN_AREA_STRENGTH_PREVIEW_TEXT",                                  "Fighting on flat tiles without Woods, Jungle, or Marsh"),
    ("LOC_HD_ATTACK_WOUNDED_PREVIEW_TEXT",                                      "From attacking a wounded Unit"),
    ("LOC_HD_WOLFPACK_ADJACENT_BONUS_PREVIEW_TEXT",                             "From Wolfpack"),
    ("LOC_HD_GENERAL_GUARD_PREVIEW_TEXT",                                       "From General Guard");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    -- Abilities
    ("zh_Hans_CN",  "LOC_ABILITY_MELEE_BATTLE_LINE_HD_DESCRIPTION",                         "与至少一个友方近战单位相邻时+3 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_RANGED_HILLS_STRENGTH_HD_DESCRIPTION",                     "从丘陵上发动攻击时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION_HD_DESCRIPTION",   "不再受到来自单位受伤程度的 [ICON_Strength] 战斗力减益。"),
    ("zh_Hans_CN",  "LOC_ABILITY_RECON_IGNORE_RIVERS_AND_SHORES_HD_DESCRIPTION",            "免除单位上下船和跨河时的 [ICON_Movement] 移动力及 [ICON_Strength] 战斗力惩罚。"), --从海洋或河流进行攻击时，免除 [ICON_Strength] 战斗力和 [ICON_Movement] 移动力减益。
    ("zh_Hans_CN",  "LOC_ABILITY_HEAVYC_HEAL_AFTER_KILL_HD_DESCRIPTION",                    "击杀敌方单位后+10 [ICON_Damaged] 生命值。"),
    ("zh_Hans_CN",  "LOC_ABILITY_LIGHTC_AGAINST_UNIT_BONUS_HD_DESCRIPTION",                 "与单位作战时+5[ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_SIEGE_ATTACK_DISTRICT_BONUS_HD_DESCRIPTION",               "攻击区域防御+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_DESCRIPTION",      "在森林或雨林中战斗时+3 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_RANGED_GARRISON_BONUS_HD_DESCRIPTION",                     "占领一个区域或一个提供 [ICON_Strength] 防御力的改良设施时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_ANTIC_HILLS_DEFEND_BONUS_HD_DESCRIPTION",                  "在丘陵上防御近距离攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_RECON_IGNORE_ZOC_HD_DESCRIPTION",                          "忽略控制区。"),
    -- ("zh_Hans_CN",  "LOC_ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD_DESCRIPTION",                 "在没有雨林、树林、沼泽地貌的平坦地形作战时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD_DESCRIPTION",                 "攻击受伤单位时+5 [ICON_Strength] 战斗力。"),
    -- ("zh_Hans_CN",  "LOC_ABILITY_LIGHTC_EXTRA_FAITH_PLUNDER_HD_DESCRIPTION",                "劫掠区域和改良后额外获得25 [ICON_Faith] 信仰值。"),
    ("zh_Hans_CN",  "LOC_ABILITY_LIGHTC_ENEMY_MOVEMENT_HD_DESCRIPTION",                     "在敌方领土内开始回合时+1 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_SIEGE_ATTACK_AFTER_MOVE_HD_DESCRIPTION",                   "可移动后攻击（拥有军事训练市政后允许）。"),
-- Preview Text
    ("zh_Hans_CN",  "LOC_HD_BATTLE_LINE_COMBAT_PREVIEW_TEXT",                               "相邻友方近战单位"),
    ("zh_Hans_CN",  "LOC_HD_ATTACKING_FROM_HILLS_STRENGTH_PREVIEW_TEXT",                    "从丘陵上发起攻击"),
    ("zh_Hans_CN",  "LOC_HD_AGAINST_UNIT_BONUS_PREVIEW_TEXT",                               "与单位作战"),
    ("zh_Hans_CN",  "LOC_HD_ATTACK_DISTRICT_BONUS_PREVIEW_TEXT",                            "攻击区域"),
    ("zh_Hans_CN",  "LOC_HD_FOREST_AND_JUNGLE_COMBAT_BONUS_PREVIEW_TEXT",                   "来自在森林或雨林中战斗"),
    ("zh_Hans_CN",  "LOC_HD_GARRISON_BONUS_PREVIEW_TEXT",                                   "来自占领区域或防御性的改良设施"),
    ("zh_Hans_CN",  "LOC_HD_HILLS_DEFEND_BONUS_PREVIEW_TEXT",                               "来自在丘陵上防御"),
    -- ("zh_Hans_CN",  "LOC_HD_OPEN_AREA_STRENGTH_PREVIEW_TEXT",                               "来自在没有雨林、树林、沼泽地貌的平坦地形作战"),
    ("zh_Hans_CN",  "LOC_HD_ATTACK_WOUNDED_PREVIEW_TEXT",                                   "来自攻击受伤的单位"),
    ("zh_Hans_CN",  "LOC_HD_WOLFPACK_ADJACENT_BONUS_PREVIEW_TEXT",                          "来自狼群战术"),
    ("zh_Hans_CN",  "LOC_HD_GENERAL_GUARD_PREVIEW_TEXT",                                    "来自将领卫队");

--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                       Text)
values
    -- Melee
    ("LOC_PROMOTION_BATTLECRY_DESCRIPTION",                                     "+7 [ICON_Strength] Combat Strength attacking melee, anti-cavalry and ranged units."),
    -- ("LOC_PROMOTION_BATTLE_LINE_HD_NAME",                                       "Battle Line"),
    -- ("LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                                "+7 [ICON_Strength] Combat Strength if there is at least one adjacent friendly melee unit."),
    ("LOC_PROMOTION_ZWEIHANDER_DESCRIPTION",                                    "+7 [ICON_Strength] Combat Strength when flanked."),
    ("LOC_PROMOTION_LONG_MARCH_HD_NAME",                                        "Long March"),
    ("LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                                 "Heals at the end of every turn, even after moving or attacking."),
    -- Ranged
    ("LOC_ABILITY_RANGED_GARRISON_DISTRICT_BONUS_HD_DESCRIPTION",               "+5 [ICON_Strength] Combat Strength when occupying either an improvement that provides [ICON_Strength] Defense Strength or a District."),
    ("LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_DESCRIPTION",            "-3 [ICON_Strength] Combat Strength when target is in Rainforest or Woods tiles."),
    ("LOC_RANGED_GARRISON_DISTRICT_BONUS_HD_PREVIEW_DESCRIPTION",               "from garrison"),
    ("LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_PREVIEW_DESCRIPTION",    "from target in Rainforest or Woods tiles"),
    ("LOC_PROMOTION_SNIPER_HD_NAME",                                            "Sniper"),
    ("LOC_PROMOTION_SNIPER_HD_DESCRIPTION",                                     "+1 [ICON_Range] Range."),
    ("LOC_PROMOTION_SUPPRESSION_DESCRIPTION",                                   "Exercises Zone of Control. +5 [ICON_Strength] when attacking damaged unit."), -- +10 [ICON_Strength] Combat Strength when defending melee combat.
    ("LOC_PROMOTION_ARROW_STORM_DESCRIPTION",                                   "+7 [ICON_Strength] Combat Strength when attacking."),
    ("LOC_PROMOTION_EMPLACEMENT_DESCRIPTION",                                   "+10 [ICON_Strength] Combat Strength when defending against ranged attacks."),
    -- Anti-cavalry
    ("LOC_ABILITY_ANTI_CAVALRY_DESCRIPTION",                                    "+10 [ICON_Strength] Combat Strength when defending from cavalry units."), --+5 [ICON_Strength] Combat Strength against Cavalry units, extra 
    -- ("LOC_ABILITY_ANTI_CAVALRY_MODIFIER_DESCRIPTION",                           "+5 [ICON_Strength] Combat Strength against Cavalry units"),
    ("LOC_ANTI_CAVALRY_COMBAT_BONUS_DEFENDING_PREVIEW_TEXT",                    "from defending cavalry units"),
    ("LOC_PROMOTION_LOGISTICS_SUPPLY_HD_NAME",                                  "Logistics Supply"),
    ("LOC_PROMOTION_LOGISTICS_SUPPLY_HD_DESCRIPTION",                           "+15 HP healing when Fortified."),
    ("LOC_PROMOTION_THRUST_DESCRIPTION",                                        "+5 [ICON_Strength] Combat Strength when attacking"),
    ("LOC_PROMOTION_CHOKE_POINTS_DESCRIPTION",                                  "+7 [ICON_Strength] Combat Strength in Woods, Rainforest, Hills, or Marsh."),
    ("LOC_PROMOTION_SPRINT_HD_NAME",                                            "Sprint"),
    ("LOC_PROMOTION_SPRINT_HD_DESCRIPTION",                                     "+3 [ICON_Strength] Combat Strength per unused [ICON_Movement] Movement."),
    -- Recon
    ("LOC_ABILITY_RECON_IGNORE_TERRIAN_COST_HD_DESCRIPTION",                    "Faster [ICON_Movement] Movement in Hills, Woods and Rainforest terrain."), -- , but -1 [ICON_Movement] Base Movement.
    ("LOC_PROMOTION_SENTRY_DESCRIPTION",                                        "+1 sight range, can see through Features."),
    ("LOC_PROMOTION_RECON_TRAVEL_LIGHT_NAME",                                   "Travel Light"),
    ("LOC_PROMOTION_RECON_TRAVEL_LIGHT_DESCRIPTION",                            "+1 [ICON_Movement] Movement."), -- Ignores Zone of Control
    ("LOC_PROMOTION_SPYGLASS_DESCRIPTION",                                      "+1 sight range. Reveals stealth units on the map within sight range."),
    ("LOC_PROMOTION_GUERRILLA_DESCRIPTION",                                     "Can move after attacking. +5 [ICON_Strength] when attacking."),
    ("LOC_PROMOTION_AMBUSH_DESCRIPTION",                                        "+5 [ICON_Strength] Combat Strength. Only adjacent enemy units can reveal this unit."),
    ("LOC_PROMOTION_RECON_RAPID_FIRE_NAME",                                     "Rapid Fire"),
    ("LOC_PROMOTION_RECON_RAPID_FIRE_DESCRIPTION",                              "+1 additional attack per turn if [ICON_Movement] Movement allows."),
    ("LOC_PROMOTION_RECON_ACCURATE_NAME",                                       "Accurate"),
    ("LOC_PROMOTION_RECON_ACCURATE_DESCRIPTION",                                "+1 [ICON_Range] Range."),
    -- Heavy Cavalry
    ("LOC_PROMOTION_HEAVYC_SHOCK_NAME",                                         "Shock"),
    ("LOC_PROMOTION_HEAVYC_SHOCK_DESCRIPTION",                                  "+5 [ICON_Strength] Combat Strength when fighting on flat tiles without Woods, Jungle, or Marsh."),
    ("LOC_PROMOTION_ROUT_DESCRIPTION",                                          "+5 [ICON_Strength] Combat Strength attacking damaged units."),
    ("LOC_PROMOTION_MARAUDING_DESCRIPTION",                                     "+7 [ICON_Strength] Combat Strength when attacking Districts or units in Districts."),
    ("LOC_PROMOTION_ARMOR_PIERCING_DESCRIPTION",                                "+5 [ICON_Strength] Combat Strength when attacking units. Extra +5 [ICON_Strength] Combat Strength when you have a higher (or equal) base Combat Strength."),
    ("LOC_PROMOTION_REACTIVE_ARMOR_DESCRIPTION",                                "+7 [ICON_Strength] Combat Strength when defending. Extra +7 [ICON_Strength] Combat Strength when you have a higher (or equal) base Combat Strength."),
    -- Light Cavalry
    -- ("LOC_ABILITY_LIGHT_CAVALRY_HD_DESCRIPTION",                                "Pillaging costs only 1 [ICON_Movement] Movement point."),
    ("LOC_PROMOTION_LIGHTC_MILITANT_NAME",                                      "Bellicose"),
    ("LOC_PROMOTION_LIGHTC_MILITANT_DESCRIPTION",                               "+5 [ICON_Strength] Combat Strength when in enemy territory."),
    ("LOC_PROMOTION_LIGHTC_SHOCK_NAME",                                         "Shock"),
    ("LOC_PROMOTION_LIGHTC_SHOCK_DESCRIPTION",                                  "+5 [ICON_Strength] Combat Strength when fighting on flat tiles without Woods, Rainforest, or Marsh."),
    -- ("LOC_PROMOTION_DEPREDATION_DESCRIPTION",                                   "+5 [ICON_Strength] Combat Strength when in enemy territory."),
    ("LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_NAME",                                "Mobile Warfare"),
    ("LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_DESCRIPTION",                         "+1 [ICON_Movement] Movement, can move after attacking."),
    ("LOC_PROMOTION_PURSUIT_DESCRIPTION",                                       "+7 [ICON_Strength] Combat Strength attacking damaged units."),
    ("LOC_PROMOTION_ESCORT_MOBILITY_DESCRIPTION",                               "Formation units all inherit escort's [ICON_Movement] Movement speed and +7 [ICON_Strength] Combat Strength when in a formation."),
    -- Siege
    ("LOC_ABILITY_SIEGE_CAVALRY_MOVEMENT_HD_DESCRIPTION",                       "+1 [ICON_Movement] Movement when adjacent to Light or Heavy Cavalry."),
    ("LOC_PROMOTION_SHELLS_DESCRIPTION",                                        "+10 [ICON_Strength] Combat Strength vs. District defenses."),
    -- ("LOC_PROMOTION_EXPERT_CREW_DESCRIPTION",                                   "+10 [ICON_Strength] Combat Strength vs. District defenses."),
    ("LOC_PROMOTION_EXPERT_CREW_DESCRIPTION",                                   "+1 [ICON_Movement] Movement."),
    --naval melee
    ("LOC_PROMOTION_BATTERING_RAM_TACTICS_HD_NAME",                             "Battering Ram Tactics"),
    ("LOC_PROMOTION_BATTERING_RAM_TACTICS_HD_DESCRIPTION",                      "+1 additional attack per turn if [ICON_Movement] Movement allows."),
    ("LOC_PROMOTION_CREEPING_ATTACK_DESCRIPTION",                               "+12 [ICON_Strength] Combat Strength vs. Naval Raider units."),
    --naval ranged
    ("LOC_PROMOTION_BOMBARDMENT_DESCRIPTION",                                   "+7 [ICON_Strength] Combat Strength vs. District defenses."),
    ("LOC_PROMOTION_ROLLING_BARRAGE_DESCRIPTION",                               "+12 [ICON_Strength] Combat Strength vs. District defenses."),
    ("LOC_PROMOTION_BULB_BOW_HD_NAME",                                          "Bulbous Bow"),
    ("LOC_PROMOTION_BULB_BOW_HD_DESCRIPTION",                                   "+1 [ICON_Movement] Movement and +1 sight range."),
    --naval raider
    ("LOC_PROMOTION_SWIFT_KEEL_DESCRIPTION",                                    "+1 [ICON_Movement] Movement and +1 sight range."),
    --("LOC_PROMOTION_LOOT_NAME",                                                 ""),
    ("LOC_PROMOTION_LOOT_DESCRIPTION",                                          "+100 [ICON_Gold] Gold from coastal raids. +100% yields gained from plundering sea [ICON_TradeRoute] Trade Routes."),
    ("LOC_PROMOTION_WOLFPACK_DESCRIPTION",                                      "+2 [ICON_Strength] Combat Strength for adjacent naval raiders"),
    ("LOC_PROMOTION_BOARDING_ACTION_HD_NAME",                                   "Boarding Action"),
    ("LOC_PROMOTION_BOARDING_ACTION_HD_DESCRIPTION",                            "+7 [ICON_Strength] Combat Strength when attacking naval units."),
    ("LOC_PROMOTION_DAMAGE_CONTROL_HD_NAME",                                    "Damage Control"),
    ("LOC_PROMOTION_DAMAGE_CONTROL_HD_DESCRIPTION",                             "Heals outside of friendly territory."),
    ("LOC_PROMOTION_AUTO_SOLICITATION_HD_NAME",                                 "Auto Solicitation"),
    ("LOC_PROMOTION_SPY_SPIN_WEB_NAME",                                         "Spin Web"),
    ("LOC_PROMOTION_SPY_SPIN_WEB_DESCRIPTION",                                  "+1 spy partner, when you visit a new city."),
    ("LOC_PROMOTION_AUTO_SOLICITATION_HD_DESCRIPTION",                          "+1 additional attack per turn."),
    ("LOC_PROMOTION_REACTIVE_ARMOR_NAME",                                       "General Guard"),
    ("LOC_PROMOTION_SPY_PATHFINDER_NAME",                                       "Pathfinder"),    
    ("LOC_PROMOTION_SPY_PATHFINDER_DESCRIPTION",                                "All units within 6 tiles gain +1 [ICON_MOVEMENT] movement."), 
    ("LOC_PROMOTION_SPY_OBSERVER_NAME",                                         "Observer"),
    ("LOC_PROMOTION_SPY_OBSERVER_DESCRIPTION",                                  "+2 Sight Range, can see through terrain and features and reveal invisible units."),
    ("LOC_SPY_PATHFINDER_MOVEMENT_DESCRIPTION",                                 "+1 [ICON_Movement] movement from your Pathfinder."),   
    ("LOC_PROMOTION_REACTIVE_ARMOR_DESCRIPTION",                                "+2 [ICON_STRENGTH] Combat Strength to all land units within 1 tiles."),
    ("LOC_ABILITY_SCOUNT_IGNORE_ALL_HD_DESCRIPTION",                            "Ignore the extra [ICON_Movement] Movement cost from Marsh.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    -- Melee
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLECRY_DESCRIPTION",                                  "攻击近战、抗骑兵和远程单位时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ZWEIHANDER_DESCRIPTION",                                 "遭夹击时+7 [ICON_Strength] 战斗力。"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_NAME",                                    "战线"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                             "与至少一个友方近战单位相邻时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION",                              "在区域内进行近距离战斗时，+10 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_NAME",                                     "长途行军"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                              "在每回合结束时（甚至是在移动或攻击后），自动恢复生命值。"),
    -- Ranged
    ("zh_Hans_CN",  "LOC_PROMOTION_SNIPER_HD_NAME",                                         "狙击"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SNIPER_HD_DESCRIPTION",                                  "+1 [ICON_Range] 射程。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SUPPRESSION_DESCRIPTION",                                "学会区域控制，攻击受伤单位+5 [ICON_Strength] 战斗力。"), -- 防御近战攻击时+10 [ICON_Strength] 战斗力。
    ("zh_Hans_CN",  "LOC_PROMOTION_ARROW_STORM_DESCRIPTION",                                "攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_EMPLACEMENT_DESCRIPTION",                                "防御远程攻击时+10 [ICON_Strength] 战斗力。"),
    -- Anti-cavalry
    ("zh_Hans_CN",  "LOC_ABILITY_ANTI_CAVALRY_DESCRIPTION",                                 "防御骑兵单位时+10 [ICON_Strength] 战斗力。"), --与骑兵单位作战时+5 [ICON_Strength] 战斗力，
    -- ("zh_Hans_CN",  "LOC_ABILITY_ANTI_CAVALRY_MODIFIER_DESCRIPTION",                        "与骑兵单位战斗时+5 [ICON_Strength] 战斗力"),
    ("zh_Hans_CN",  "LOC_ANTI_CAVALRY_COMBAT_BONUS_DEFENDING_PREVIEW_TEXT",                 "来自防御骑兵单位"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LOGISTICS_SUPPLY_HD_NAME",                               "后勤补给"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LOGISTICS_SUPPLY_HD_DESCRIPTION",                        "驻防时+15生命值恢复。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_THRUST_DESCRIPTION",                                     "攻击时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_CHOKE_POINTS_DESCRIPTION",                               "在树林、丛林、丘陵或沼泽时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SPRINT_HD_NAME",                                         "冲刺"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SPRINT_HD_DESCRIPTION",                                  "每点未使用的 [ICON_Movement] 移动力提供+3 [ICON_Strength] 战斗力。"),
    -- Recon
    ("zh_Hans_CN",  "LOC_ABILITY_RECON_IGNORE_TERRIAN_COST_HD_DESCRIPTION",                 "在丘陵、树林和雨林地形有更快的 [ICON_Movement] 移动力。"), -- ，但-1 [ICON_Movement] 移动力
    ("zh_Hans_CN",  "LOC_PROMOTION_SENTRY_DESCRIPTION",                                     "+1视野范围，视野能穿过地貌。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_TRAVEL_LIGHT_NAME",                                "轻装"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_TRAVEL_LIGHT_DESCRIPTION",                         "+1 [ICON_Movement] 移动力。"), -- 忽略控制区
    ("zh_Hans_CN",  "LOC_PROMOTION_SPYGLASS_DESCRIPTION",                                   "+1视野范围，显示视野范围内的隐形单位。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_GUERRILLA_DESCRIPTION",                                  "攻击后可移动，攻击时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_AMBUSH_DESCRIPTION",                                     "在所有情况下+5 [ICON_Strength] 战斗力，只有相邻敌军单位才能发现该单位。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_RAPID_FIRE_NAME",                                  "速射"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_RAPID_FIRE_DESCRIPTION",                           "如果 [ICON_Movement] 移动力允许，每回合+1额外攻击。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_ACCURATE_NAME",                                    "精准"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_ACCURATE_DESCRIPTION",                             "+1 [ICON_Range] 射程。"),
    -- Heavy Cavalry
    -- ("zh_Hans_CN",  "LOC_PROMOTION_BARDING_DESCRIPTION",                                    "防御远程攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_HEAVYC_SHOCK_NAME",                                      "冲击"),
    ("zh_Hans_CN",  "LOC_PROMOTION_HEAVYC_SHOCK_DESCRIPTION",                               "在没有雨林、树林、沼泽地貌的平坦地形作战时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_MARAUDING_DESCRIPTION",                                  "进攻区域或进攻区域上的单位时，+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ROUT_DESCRIPTION",                                       "攻击受伤单位时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ARMOR_PIERCING_DESCRIPTION",                             "攻击单位时+5 [ICON_Strength] 战斗力。若基础战斗力不低于对方单位，则攻击时额外 +5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_REACTIVE_ARMOR_DESCRIPTION",                             "防御时+7 [ICON_Strength] 战斗力。若基础战斗力不低于对方，则防御时额外 +7 [ICON_Strength] 战斗力。"),
    -- Light Cavalry
    -- ("zh_Hans_CN",  "LOC_ABILITY_LIGHT_CAVALRY_HD_DESCRIPTION",                             "掠夺只消耗1点 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_MILITANT_NAME",                                   "好战"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_MILITANT_DESCRIPTION",                            "在敌方领土内时 +5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_SHOCK_NAME",                                      "冲击"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_SHOCK_DESCRIPTION",                               "在没有雨林、树林、沼泽地貌的平坦地形作战时+5 [ICON_Strength] 战斗力。"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_DEPREDATION_DESCRIPTION",                                "在敌方领土内时 +5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_NAME",                             "运动战"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_DESCRIPTION",                      "+1 [ICON_Movement] 移动力，攻击后可移动。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_PURSUIT_DESCRIPTION",                                    "攻击受伤单位时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ESCORT_MOBILITY_DESCRIPTION",                            "编队时，所有编队单位将继承护卫队的 [ICON_Movement] 移动力并+7 [ICON_Strength] 战斗力。"),
    -- Siege
    ("zh_Hans_CN",  "LOC_ABILITY_SIEGE_CAVALRY_MOVEMENT_HD_DESCRIPTION",                    "相邻轻重骑兵时+1 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SHELLS_DESCRIPTION",                                     "与区域防御战斗时+10 [ICON_Strength] 战斗力。"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_EXPERT_CREW_DESCRIPTION",                                "与区域防御战斗时+10 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_EXPERT_CREW_DESCRIPTION",                                "+1 [ICON_Movement] 移动力。"),
    --naval melee
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTERING_RAM_TACTICS_HD_NAME",                          "冲撞战术"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTERING_RAM_TACTICS_HD_DESCRIPTION",                   "如果移动力 [ICON_Movement] 允许，每回合攻击次数+1"),
    ("zh_Hans_CN",  "LOC_PROMOTION_CREEPING_ATTACK_DESCRIPTION",                            "与海军袭击者单位战斗时+12 [ICON_Strength] 战斗力。"),
    --naval ranged
    ("zh_Hans_CN",  "LOC_PROMOTION_BOMBARDMENT_DESCRIPTION",                                "攻击区域防御时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ROLLING_BARRAGE_DESCRIPTION",                            "攻击区域防御时+12 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BULB_BOW_HD_NAME",                                       "球鼻艏"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BULB_BOW_HD_DESCRIPTION",                                "+1 [ICON_Movement] 移动力并+1 视野范围。"),
    --naval raider
    ("zh_Hans_CN",  "LOC_PROMOTION_SWIFT_KEEL_DESCRIPTION",                                 "+1 [ICON_Movement] 移动力并+1 视野范围。"),
    --("zh_Hans_CN",  "LOC_PROMOTION_LOOT_NAME",                                              "破交作战"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LOOT_DESCRIPTION",                                       "海岸扫荡获得的 [ICON_Gold] 金币+100。掠夺海上 [ICON_TradeRoute] 贸易路线的收益+100%。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_WOLFPACK_DESCRIPTION",                                   "为相邻的友方海军袭击者单位+2 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BOARDING_ACTION_HD_NAME",                                "跳帮"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BOARDING_ACTION_HD_DESCRIPTION",                         "进攻海军单位时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_DAMAGE_CONTROL_HD_NAME",                                 "损害管制"),
    ("zh_Hans_CN",  "LOC_PROMOTION_DAMAGE_CONTROL_HD_DESCRIPTION",                          "可在友军领土之外回复。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_AUTO_SOLICITATION_HD_NAME",                              "自动索敌"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SPY_QUARTERMASTER_DESCRIPTION",                          "处于我方领土时，使我方间谍的成功率+1级。"),    
    ("zh_Hans_CN",  "LOC_PROMOTION_SPY_SPIN_WEB_NAME",                                      "吐丝织网"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SPY_SPIN_WEB_DESCRIPTION",                               "在每个到访的城市可召唤一名间谍伙伴，级别为新手间谍。"),    
    ("zh_Hans_CN",  "LOC_PROMOTION_AUTO_SOLICITATION_HD_DESCRIPTION",                       "每回合+1额外攻击。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_REACTIVE_ARMOR_NAME",                                    "将领卫队"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SPY_PATHFINDER_NAME",                                    "向导"),
    ("zh_Hans_CN",  "LOC_SPY_PATHFINDER_MOVEMENT_DESCRIPTION",                              "+1 [ICON_Movement] 移动力，来自向导的指引。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SPY_OBSERVER_NAME",                                      "观察者"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SPY_OBSERVER_DESCRIPTION",                               "+2视野范围，视野穿过地形和地貌，且能够发现隐形单位。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SPY_PATHFINDER_DESCRIPTION",                             "就位后，6个单元格内的友方单位+1 [ICON_MOVEMENT] 移动力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_REACTIVE_ARMOR_DESCRIPTION",                             "在一个单元格以内，为所有陆地单位+2 [ICON_STRENGTH] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_SCOUNT_IGNORE_ALL_HD_DESCRIPTION",                         "忽略沼泽带来的的额外 [ICON_Movement] 移动力消耗。");
