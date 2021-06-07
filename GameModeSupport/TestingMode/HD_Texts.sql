--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                       Text)
values
    ("LOC_TECH_SHIPBUILDING_HD_DESCRIPTION",                                    "Allows all land units to embark. Melee and recon units gain the ability: No [ICON_Strength] Combat Strength and [ICON_Movement] Movement penalty when attacking from sea or river."),
    ("LOC_TECH_SANITATION_HD_DESCRIPTION",                                      "Stepwell improvements receive +1 [ICON_Housing] Housing. Anti-cavalry units gain the ability: Ignore [ICON_Strength] Combat Strength reduction from being injured."),
    -- Civic
    ("LOC_CIVIC_FEUDALISM_HD_DESCRIPTION",                                      "Plantation improvements receive +1 [ICON_Food] Food. Melee units gain the ability: +3 [ICON_Strength] Combat Strength for units fighting in Rainforest or Woods tiles."),
    ("LOC_CIVIC_DEFENSIVE_TACTICS_HD_DESCRIPTION",                              "Anti-cavalry units gain the ability: +3 [ICON_Strength] Combat Strength for units fighting in hill tiles."),
    ("LOC_CIVIC_MERCANTILISM_HD_DESCRIPTION",                                   "+2 [ICON_gold] Gold from the Camp improvement. Recon units gain the ability: Ignore the Zone of Control.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    ("zh_Hans_CN",  "LOC_TECH_SHIPBUILDING_HD_DESCRIPTION",                                 "允许所有陆地单位上船。近战和侦察单位获得能力：从海洋或河流进行攻击时，免除 [ICON_Strength] 战斗力和 [ICON_Movement] 移动力减益。"),
    ("zh_Hans_CN",  "LOC_TECH_SANITATION_HD_DESCRIPTION",                                   "梯井改良设施+1 [ICON_Housing] 住房。抗骑兵单位获得能力：单位无视受到伤害后的 [ICON_Strength] 战斗力减益。"),
    -- Civic
    ("zh_Hans_CN",  "LOC_CIVIC_FEUDALISM_HD_DESCRIPTION",                                   "种植园改良设施提供的 [ICON_Food] 食物+1。近战单位获得能力：在森林或雨林中战斗时+3 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_CIVIC_DEFENSIVE_TACTICS_HD_DESCRIPTION",                           "抗骑兵单位获得能力：在丘陵上战斗时+3 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_CIVIC_MERCANTILISM_HD_DESCRIPTION",                                "营地+2 [ICON_gold] 金币。侦察单位获得能力：忽略控制区。"),
    -- Preview Text
    ("zh_Hans_CN",  "LOC_HD_ATTACKING_FROM_HILLS_STRENGTH_PREVIEW_TEXT",                    "从丘陵攻击"),
    ("zh_Hans_CN",  "LOC_HD_AGAINST_UNIT_BONUS_PREVIEW_TEXT",                               "与单位作战"),
    ("zh_Hans_CN",  "LOC_HD_ATTACK_DISTRICT_BONUS_PREVIEW_TEXT",                            "攻击区域"),
    ("zh_Hans_CN",  "LOC_HD_FOREST_AND_JUNGLE_COMBAT_BONUS_PREVIEW_TEXT",                   "来自在森林或雨林中战斗"),
    ("zh_Hans_CN",  "LOC_HD_GARRISON_BONUS_PREVIEW_TEXT",                                   "来自占领区域或防御性的改良设施"),
    ("zh_Hans_CN",  "LOC_HD_HILLS_DEFEND_BONUS_PREVIEW_TEXT",                               "来自在丘陵上防御"),
    ("zh_Hans_CN",  "LOC_HD_OPEN_AREA_STRENGTH_PREVIEW_TEXT",                               "来自在没有雨林、树林、沼泽地貌的平坦地形作战");

--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                       Text)
values
    -- Recon
    ("LOC_ABILITY_RECON_IGNORE_TERRIAN_COST_HD_DESCRIPTION",                    "Faster [ICON_Movement] Movement in Hills, Woods and Rainforest terrain."), -- , but -1 [ICON_Movement] Base Movement.
    ("LOC_PROMOTION_SENTRY_DESCRIPTION",                                        "+1 sight range, can see through Woods and Jungle."),
    ("LOC_PROMOTION_RECON_TRAVEL_LIGHT_NAME",                                   "Travel Light"),
    ("LOC_PROMOTION_RECON_TRAVEL_LIGHT_DESCRIPTION",                            "+1 [ICON_Movement] Movement."), -- Ignore Zone of Control
    ("LOC_PROMOTION_SPYGLASS_DESCRIPTION",                                      "+1 sight range, reveal stealth units on the map within sight range."),
    ("LOC_PROMOTION_GUERRILLA_DESCRIPTION",                                     "Can move after attacking, +5 [ICON_Strength] when attacking."),
    -- ("LOC_GUERRILLA_ATTACK_BUFF_HD_PREVIEW_TEXT",                               "From Guerrilla when attacking"),
    ("LOC_PROMOTION_AMBUSH_DESCRIPTION",                                        "+5 [ICON_Strength] Combat Strength in all situations, only adjacent enemy units can reveal this unit."),
    ("LOC_PROMOTION_RECON_RAPID_FIRE_NAME",                                     "Rapid Fire"),
    ("LOC_PROMOTION_RECON_RAPID_FIRE_DESCRIPTION",                              "+1 additional attack per turn if [ICON_Movement] Movement allows."),
    ("LOC_PROMOTION_RECON_ACCURATE_NAME",                                       "Accurate"),
    ("LOC_PROMOTION_RECON_ACCURATE_DESCRIPTION",                                "+1 [ICON_Range] Range."),
    -- Heavy Cavalry
    ("LOC_PROMOTION_ROUT_DESCRIPTION",                                          "+5 [ICON_Strength] Combat Strength attacking damaged units."),
    ("LOC_PROMOTION_ARMOR_PIERCING_DESCRIPTION",                                "+5 [ICON_Strength] Combat Strength when attacking units. Extra +5 [ICON_Strength] Combat Strength when you have a higher (or equal) base Combat Strength."),
    ("LOC_PROMOTION_REACTIVE_ARMOR_DESCRIPTION",                                "+5 [ICON_Strength] Combat Strength when defending. Extra +5 [ICON_Strength] Combat Strength when you have a higher (or equal) base Combat Strength."),
    -- Light Cavalry
    ("LOC_ABILITY_LIGHT_CAVALRY_HD_DESCRIPTION",                                "Pillaging costs only 1 [ICON_Movement] Movement point."),
    ("LOC_PROMOTION_LIGHTC_SHOCK_NAME",                                         "Shock"),
    ("LOC_PROMOTION_LIGHTC_SHOCK_DESCRIPTION",                                  "+5 [ICON_Strength] Combat Strength when fighting flatten tiles without Woods, Jungle, or Marsh."),
    ("LOC_PROMOTION_DEPREDATION_DESCRIPTION",                                   "+5 [ICON_Strength] Combat Strength when the unit is in the enemy territory。"),
    ("LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_NAME",                                "Mobile Warfare"),
    ("LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_DESCRIPTION",                         "+1 [ICON_Movement] Movement, can move after attacking."),
    ("LOC_PROMOTION_PURSUIT_DESCRIPTION",                                       "+7 [ICON_Strength] Combat Strength attacking damaged units."),
    ("LOC_PROMOTION_ESCORT_MOBILITY_DESCRIPTION",                               "Formation units all inherit escort's [ICON_Movement] Movement speed and +7 [ICON_Strength] Combat Strength when in a formation."),
    -- Siege
    ("LOC_ABILITY_SIEGE_CAVALRY_MOVEMENT_HD_DESCRIPTION",                       "+1 [ICON_Movement] Movement when adjacent to Light or Heavy Cavalry."),
    ("LOC_PROMOTION_SHELLS_DESCRIPTION",                                        "+7 [ICON_Strength] Combat Strength vs. district defenses."),
    ("LOC_PROMOTION_EXPERT_CREW_DESCRIPTION",                                   "+10 [ICON_Strength] Combat Strength vs. district defenses."),
    ("LOC_BUILDING_GOV_CONQUEST_DESCRIPTION",                                   "Capturing an enemy City grants 15% bonus [ICON_Production] Production in all Cities for 5 turns.[NEWLINE][ICON_Gold] Golds gained from capturing cities are +100%.[NEWLINE]Yields gained from pilaging and coastal raids are +100%.[NEWLINE]Awards +1 [ICON_Governor] Governor Title.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    -- Recon
    ("zh_Hans_CN",  "LOC_ABILITY_RECON_IGNORE_TERRIAN_COST_HD_DESCRIPTION",                 "在丘陵、树林和雨林地形有更快的 [ICON_Movement] 移动力"), -- ，但-1 [ICON_Movement] 移动力
    ("zh_Hans_CN",  "LOC_PROMOTION_SENTRY_DESCRIPTION",                                     "+1视野范围，视野能穿过森林和丛林。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_TRAVEL_LIGHT_NAME",                                "轻装"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_TRAVEL_LIGHT_DESCRIPTION",                         "+1 [ICON_Movement] 移动力。"), -- 忽略控制区
    ("zh_Hans_CN",  "LOC_PROMOTION_SPYGLASS_DESCRIPTION",                                   "+1视野范围，显示视野范围内的隐形单位。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_GUERRILLA_DESCRIPTION",                                  "攻击后可移动，攻击时+5 [ICON_Strength] 战斗力。"),
    -- ("zh_Hans_CN",  "LOC_GUERRILLA_ATTACK_BUFF_HD_PREVIEW_TEXT",                            "进攻时，来自游击队"),
    ("zh_Hans_CN",  "LOC_PROMOTION_AMBUSH_DESCRIPTION",                                     "在所有情况下+5 [ICON_Strength] 战斗力，只有相邻敌军单位才能发现该单位。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_RAPID_FIRE_NAME",                                  "速射"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_RAPID_FIRE_DESCRIPTION",                           "如果 [ICON_Movement] 移动力允许，每回合+1额外攻击。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_ACCURATE_NAME",                                    "精准"),
    ("zh_Hans_CN",  "LOC_PROMOTION_RECON_ACCURATE_DESCRIPTION",                             "+1 [ICON_Range] 射程。"),
    -- Heavy Cavalry
    -- ("zh_Hans_CN",  "LOC_PROMOTION_BARDING_DESCRIPTION",                                    "防御远程攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ROUT_DESCRIPTION",                                       "攻击受伤单位时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ARMOR_PIERCING_DESCRIPTION",                             "攻击单位时+5 [ICON_Strength] 战斗力。若基础战斗力不低于对方单位，则攻击时额外 +5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_REACTIVE_ARMOR_DESCRIPTION",                             "防御时+5 [ICON_Strength] 战斗力。若基础战斗力不低于对方，则防御时额外 +5 [ICON_Strength] 战斗力。"),
    -- Light Cavalry
    ("zh_Hans_CN",  "LOC_ABILITY_LIGHT_CAVALRY_HD_DESCRIPTION",                             "掠夺只消耗1点 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_SHOCK_NAME",                                      "冲击"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_SHOCK_DESCRIPTION",                               "在没有雨林、树林、沼泽地貌的平坦地形作战时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_DEPREDATION_DESCRIPTION",                                "在敌方领土内时 +5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_NAME",                             "运动战"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_DESCRIPTION",                      "+1 [ICON_Movement] 移动力，攻击后可移动。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_PURSUIT_DESCRIPTION",                                    "攻击受伤单位时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ESCORT_MOBILITY_DESCRIPTION",                            "编队时，所有编队单位将继承护卫队的 [ICON_Movement] 移动力并+7 [ICON_Strength] 战斗力。"),
    -- Siege
    ("zh_Hans_CN",  "LOC_ABILITY_SIEGE_CAVALRY_MOVEMENT_HD_DESCRIPTION",                    "相邻轻重骑兵时+1 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SHELLS_DESCRIPTION",                                     "与区域防御战斗时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_EXPERT_CREW_DESCRIPTION",                                "与区域防御战斗时+10 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_CONQUEST_DESCRIPTION",                                "占领一座敌方城市后，所有城市将获得15%的 [ICON_Production] 生产力加成，效果持续5回合。[NEWLINE]占领城市获得的 [ICON_Gold] 金币收益+100%。[NEWLINE]掠夺和海岸扫荡的收益+100%。[NEWLINE]奖励1个 [ICON_Governor] 总督头衔。");

--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                       Text)
values
    --melee
    -- ("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION",                  "+5 [ICON_Strength] Combat Strength when fighting in a district."),
    -- ("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",          "from District Warfare"),
    -- ("LOC_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",         "from fighting in Rainforest or Woods tiles"),
    --("LOC_BATTLE_LINE_COMBAT_HD_PREVIEW_DESCRIPTION",                           "from adjacent melee unit"),
    -- ("LOC_PROMOTION_BATTLECRY_DESCRIPTION",                                     "+5 [ICON_Strength] Combat Strength vs. melee, ranged and anti-cavalry units."),
    -- ("LOC_PROMOTION_TORTOISE_DESCRIPTION",                                      "+7 [ICON_Strength] Combat Strength when defending against ranged attacks."),
    ("LOC_PROMOTION_BATTLE_LINE_HD_NAME",                                       "Battle Line"),
    ("LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                                "+7 [ICON_Strength] Combat Strength if there is at least one adjacent friendly melee unit."),
    ("LOC_PROMOTION_LONG_MARCH_HD_NAME",                                        "Long March"),
    ("LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                                 "Heals at the end of every turn, even after moving or attacking."),
    -- ("LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION",                                 "+7 [ICON_Strength] Combat Strength when fighting in a district."),
    --ranged
    ("LOC_ABILITY_RANGED_GARRISON_DISTRICT_BONUS_HD_DESCRIPTION",               "+5 [ICON_Strength] Combat Strength when occupying either an improvement that provides [ICON_Strength] Defense Strength or a district."),
    ("LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_DESCRIPTION",            "-3 [ICON_Strength] Combat Strength when targets in Rainforest or Woods tiles."),
    ("LOC_RANGED_GARRISON_DISTRICT_BONUS_HD_PREVIEW_DESCRIPTION",               "from garrison"),
    ("LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_PREVIEW_DESCRIPTION",    "from targets in Rainforest or Woods tiles"),
    --("LOC_SNIPER_BONUS_VS_WOUNDED_UNITS_HD_PREVIEW_DESCRIPTION",                "from attacking wounded units"),
    --("LOC_SUPPRESSION_DEFNECE_BONUS_HD_PREVIEW_DESCRIPTION",                    "from Suppression"),
    -- ("LOC_PROMOTION_GARRISON_DESCRIPTION",                                      "+5 [ICON_Strength] Combat Strength when occupying either an improvement that provides [ICON_Strength] Defense Strength or a district. +5 Loyalty per turn when garrisoning in city centers."),
    -- ("LOC_PROMOTION_SNIPER_HD_NAME",                                            "Sniper"),
    -- ("LOC_PROMOTION_SNIPER_HD_DESCRIPTION",                                     "+7 [ICON_Strength] Combat Strength when attacking wounded units."),
    ("LOC_PROMOTION_SUPPRESSION_DESCRIPTION",                                   "Exercise zone of control. +10 [ICON_Strength] Combat Strength when defending melee combat."),
    ("LOC_PROMOTION_ARROW_STORM_DESCRIPTION",                                   "+7 [ICON_Strength] Combat Strength when attacking."),
    ("LOC_PROMOTION_EMPLACEMENT_DESCRIPTION",                                   "+10 [ICON_Strength] Combat Strength when defending against ranged attacks."),
    --anti-cavalry
    ("LOC_ABILITY_ANTI_CAVALRY_DESCRIPTION",                                    "+5 [ICON_Strength] Combat Strength against Cavalry units, extra +5 [ICON_Strength] Combat Strength when defending cavalry units."),
    ("LOC_ABILITY_ANTI_CAVALRY_MODIFIER_DESCRIPTION",                           "+5 [ICON_Strength] Combat Strength against Cavalry units"),
    ("LOC_ANTI_CAVALRY_COMBAT_BONUS_DEFENDING_PREVIEW_TEXT",                    "from defending Cavalry units"),
    -- ("LOC_ABILITY_ANTI_CAVALRY_HILLS_COMBAT_BONUS_DESCRIPTION",                 "from fighting in hills tiles"),
    ("LOC_PROMOTION_LOGISTICS_SUPPLY_HD_NAME",                                  "Logistics Supply"),
    ("LOC_PROMOTION_LOGISTICS_SUPPLY_HD_DESCRIPTION",                           "+10 HP healing."),
    --("LOC_PROMOTION_ECHELON_DESCRIPTION",                                       "+7 [ICON_Strength] Combat Strength when defending melee combat."),
    ("LOC_PROMOTION_THRUST_DESCRIPTION",                                        "+5 [ICON_Strength] Combat Strength when attacking"),
    ("LOC_PROMOTION_CHOKE_POINTS_DESCRIPTION",                                  "+10 [ICON_Strength] Combat Strength when defending in Woods, Jungle, Hills, or Marsh.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                    Text)
values
    --melee
    -- ("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION",               "在区域上战斗时+5 [ICON_Strength] 战斗力"),
    -- ("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",       "来自区域作战"),
    -- ("zh_Hans_CN",  "LOC_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION",      "来自在森林或雨林中战斗"),
    --("zh_Hans_CN",  "LOC_BATTLE_LINE_COMBAT_HD_PREVIEW_DESCRIPTION",                      "来自相邻近战单位"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_BATTLECRY_DESCRIPTION",                                  "进攻近战、远程和抗骑兵单位时+5 [ICON_Strength] 战斗力。"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_TORTOISE_DESCRIPTION",                                   "防御远程攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_NAME",                                    "战线"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                             "与至少一个友方近战单位相邻时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_NAME",                                     "长途行军"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                              "在每回合结束时（甚至是在移动或攻击后），自动恢复生命值。"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION",                              "在区域上战斗时+7 [ICON_Strength] 战斗力。"),
    --ranged
    -- ("zh_Hans_CN",  "LOC_ABILITY_RANGED_GARRISON_DISTRICT_BONUS_HD_DESCRIPTION",            "占领一个区域或一个提供 [ICON_Strength] 防御力的改良设施时+5 [ICON_Strength] 战斗力。"),
    -- ("zh_Hans_CN",  "LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_DESCRIPTION",         "攻击森林或雨林中的目标时-3 [ICON_Strength] 战斗力。"),
    -- ("zh_Hans_CN",  "LOC_RANGED_GARRISON_DISTRICT_BONUS_HD_PREVIEW_DESCRIPTION",            "来自驻军"),
    -- ("zh_Hans_CN",  "LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_PREVIEW_DESCRIPTION", "来自目标位于森林或雨林中"),
    -- ("zh_Hans_CN",  "LOC_SNIPER_BONUS_VS_WOUNDED_UNITS_HD_PREVIEW_DESCRIPTION",             "来自攻击受伤单位"),
    -- ("zh_Hans_CN",  "LOC_SUPPRESSION_DEFNECE_BONUS_HD_PREVIEW_DESCRIPTION",                 "来自压制"), 
    -- ("zh_Hans_CN",  "LOC_PROMOTION_GARRISON_DESCRIPTION",                                   "占领一个区域或一个提供 [ICON_Strength] 防御力的改良设施时+5 [ICON_Strength] 战斗力。驻军时+5忠诚度。"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_SNIPER_HD_NAME",                                         "狙击"),
    -- ("zh_Hans_CN",  "LOC_PROMOTION_SNIPER_HD_DESCRIPTION",                                  "攻击受伤单位时+7 [ICON_Strength] 战斗力"),
    ("zh_Hans_CN",  "LOC_PROMOTION_SUPPRESSION_DESCRIPTION",                                "学会区域控制。防御近战攻击时+10 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_ARROW_STORM_DESCRIPTION",                                "攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_EMPLACEMENT_DESCRIPTION",                                "防御远程攻击时+10 [ICON_Strength] 战斗力。"),
    --anti-cavalry
    ("zh_Hans_CN",  "LOC_ABILITY_ANTI_CAVALRY_DESCRIPTION",                                 "与骑兵单位作战时+5 [ICON_Strength] 战斗力，防御骑兵单位时额外+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_ABILITY_ANTI_CAVALRY_MODIFIER_DESCRIPTION",                        "与骑兵单位战斗时+5 [ICON_Strength] 战斗力"),
    ("zh_Hans_CN",  "LOC_ANTI_CAVALRY_COMBAT_BONUS_DEFENDING_PREVIEW_TEXT",                 "来自防御骑兵单位"),
    -- ("zh_Hans_CN",  "LOC_ABILITY_ANTI_CAVALRY_HILLS_COMBAT_BONUS_DESCRIPTION",              "来自在丘陵上战斗"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LOGISTICS_SUPPLY_HD_NAME",                               "后勤补给"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LOGISTICS_SUPPLY_HD_DESCRIPTION",                        "+10生命值恢复。"),
    --("zh_Hans_CN",  "LOC_PROMOTION_ECHELON_DESCRIPTION",                                    "防御近战攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_THRUST_DESCRIPTION",                                     "攻击时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_CHOKE_POINTS_DESCRIPTION",                               "在树林、丛林、丘陵或沼泽防御时+10 [ICON_Strength] 战斗力。");

--------------------------------------------------------------------------------
-- Language: en_US
-- update EnglishText set Text = Text || '[NEWLINE]TestMessage' where Tag in (select Description from Units where PromotionClass = 'PROMOTION_CLASS_RECON');
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Recon: Faster [ICON_Movement] Movement in Hills, Woods and Rainforest terrain.' where Language = 'en_US' and (
    Tag = 'LOC_UNIT_SCOUT_DESCRIPTION' or
    Tag = 'LOC_UNIT_RANGER_DESCRIPTION' or
    Tag = 'LOC_UNIT_SCOTTISH_HIGHLANDER_DESCRIPTION' or
    Tag = 'LOC_UNIT_CREE_OKIHTCITAW_DESCRIPTION' or
    Tag = 'LOC_UNIT_SPEC_OPS_DESCRIPTION' or
    Tag = 'LOC_UNIT_SKIRMISHER_DESCRIPTION' or
    Tag = 'LOC_UNIT_INCA_WARAKAQ_DESCRIPTION');

-- Melee: ability cancelled.
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Melee: +5 [ICON_Strength] when attacking Districts.' where Language = 'en_US' and (
--     Tag = 'LOC_UNIT_WARRIOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SWORDSMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ROMAN_LEGION_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KONGO_SHIELD_BEARER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_JAPANESE_SAMURAI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_NORWEGIAN_BERSERKER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MUSKETMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SPANISH_CONQUISTADOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ENGLISH_REDCOAT_DESCRIPTION' or
--     Tag = 'LOC_UNIT_FRENCH_GARDE_IMPERIALE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MECHANIZED_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAN_AT_ARMS_DESCRIPTION' or
--     Tag = 'LOC_UNIT_LINE_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_AZTEC_EAGLE_WARRIOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MACEDONIAN_HYPASPIST_DESCRIPTION' or
--     Tag = 'LOC_UNIT_PERSIAN_IMMORTAL_DESCRIPTION' or
--     Tag = 'LOC_UNIT_DIGGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_GEORGIAN_KHEVSURETI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAORI_TOA_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SULEIMAN_JANISSARY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_GAUL_GAESATAE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BABYLONIAN_SABUM_KIBITTUM_DESCRIPTION');

update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Anti Cavalry: +5 [ICON_Strength] Combat Strength against Cavalry units, extra +5 [ICON_Strength] Combat Strength when defending cavalry units.' where Language = 'en_US' and (
    Tag = 'LOC_UNIT_SPEARMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_GREEK_HOPLITE_DESCRIPTION' or
    Tag = 'LOC_UNIT_PIKEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_AT_CREW_DESCRIPTION' or
    Tag = 'LOC_UNIT_MODERN_AT_DESCRIPTION' or
    Tag = 'LOC_UNIT_ZULU_IMPI_DESCRIPTION' or
    Tag = 'LOC_UNIT_PIKE_AND_SHOT_DESCRIPTION' or
    Tag = 'LOC_UNIT_SWEDEN_CAROLEAN_DESCRIPTION');

-- Ranged: ability cancelled.
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Ranged: -17 [ICON_Strength] Combat Strength when attacking districts or Naval units. +5 [ICON_Strength] Combat Strength when occupying either an improvement that provides [ICON_Strength] Defense Strength or a district. -3 [ICON_Strength] Combat Strength when targets in Rainforest or Woods tiles.' where Language = 'en_US' and (
--     Tag = 'LOC_UNIT_SLINGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BARBARIAN_HORSE_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SCYTHIAN_HORSE_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_EGYPTIAN_CHARIOT_ARCHER_EXPANSION2_DESCRIPTION' or
--     Tag = 'LOC_UNIT_CROSSBOWMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_CHINESE_CROUCHING_TIGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_FIELD_CANNON_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MACHINE_GUN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_NUBIAN_PITATI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KOREAN_HWACHA_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MONGOLIAN_KESHIG_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAYAN_HULCHE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_VIETNAMESE_VOI_CHIEN_DESCRIPTION');

update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Heavy Cavalry: +1 [ICON_Movement] Movement if starting in flat tiles. -5 [ICON_Strength] Combat Strength when attacking districts.' where Language = 'en_US' and (
    Tag = 'LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION' or
    Tag = 'LOC_UNIT_HEAVY_CHARIOT_DESCRIPTION' or
    Tag = 'LOC_UNIT_KNIGHT_DESCRIPTION' or
    Tag = 'LOC_UNIT_INDIAN_VARU_DESCRIPTION' or
    Tag = 'LOC_UNIT_ARABIAN_MAMLUK_DESCRIPTION' or
    Tag = 'LOC_UNIT_TANK_DESCRIPTION' or
    Tag = 'LOC_UNIT_MODERN_ARMOR_DESCRIPTION' or
    Tag = 'LOC_UNIT_POLISH_HUSSAR_EXPANSION2_DESCRIPTION' or
    Tag = 'LOC_UNIT_MACEDONIAN_HETAIROI_DESCRIPTION' or
    Tag = 'LOC_UNIT_CUIRASSIER_DESCRIPTION' or
    Tag = 'LOC_UNIT_MALI_MANDEKALU_CAVALRY_DESCRIPTION' or
    Tag = 'LOC_UNIT_AMERICAN_ROUGH_RIDER_EXPANSION2_DESCRIPTION' or
    Tag = 'LOC_UNIT_BYZANTINE_TAGMA_DESCRIPTION');

update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Light Cavalry: Pillaging costs only 1 [ICON_Movement] Movement point. -7 [ICON_Strength] Combat Strength when attacking districts.' where Language = 'en_US' and (
    Tag = 'LOC_UNIT_BARBARIAN_HORSEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_HORSEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_CAVALRY_DESCRIPTION' or
    Tag = 'LOC_UNIT_RUSSIAN_COSSACK_DESCRIPTION' or
    Tag = 'LOC_UNIT_HELICOPTER_DESCRIPTION' or
    Tag = 'LOC_UNIT_MAPUCHE_MALON_RAIDER_DESCRIPTION' or
    Tag = 'LOC_UNIT_COURSER_DESCRIPTION' or
    Tag = 'LOC_UNIT_CANADA_MOUNTIE_DESCRIPTION' or
    Tag = 'LOC_UNIT_HUNGARY_BLACK_ARMY_DESCRIPTION' or
    Tag = 'LOC_UNIT_HUNGARY_HUSZAR_DESCRIPTION' or
    Tag = 'LOC_UNIT_COLOMBIAN_LLANERO_DESCRIPTION' or
    Tag = 'LOC_UNIT_ETHIOPIAN_OROMO_CAVALRY_EXPANSION2_DESCRIPTION');

-- Siege: temporary disable.
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]Siege: +1 [ICON_Movement] Movement when adjacent to Light or Heavy Cavalry.' where Language = 'en_US' and (
--     Tag = 'LOC_UNIT_CATAPULT_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BOMBARD_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ARTILLERY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_TREBUCHET_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KHMER_DOMREY_DESCRIPTION');

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]侦察：在丘陵、树林和雨林地形有更快的 [ICON_Movement] 移动力。' where Language = 'zh_Hans_CN' and (
    Tag = 'LOC_UNIT_SCOUT_DESCRIPTION' or
    Tag = 'LOC_UNIT_RANGER_DESCRIPTION' or
    Tag = 'LOC_UNIT_SCOTTISH_HIGHLANDER_DESCRIPTION' or
    Tag = 'LOC_UNIT_CREE_OKIHTCITAW_DESCRIPTION' or
    Tag = 'LOC_UNIT_SPEC_OPS_DESCRIPTION' or
    Tag = 'LOC_UNIT_SKIRMISHER_DESCRIPTION' or
    Tag = 'LOC_UNIT_INCA_WARAKAQ_DESCRIPTION');

-- 近战能力取消。
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]近战：攻击区域防御时+5 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
--     Tag = 'LOC_UNIT_WARRIOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SWORDSMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ROMAN_LEGION_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KONGO_SHIELD_BEARER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_JAPANESE_SAMURAI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_NORWEGIAN_BERSERKER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MUSKETMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SPANISH_CONQUISTADOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ENGLISH_REDCOAT_DESCRIPTION' or
--     Tag = 'LOC_UNIT_FRENCH_GARDE_IMPERIALE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MECHANIZED_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAN_AT_ARMS_DESCRIPTION' or
--     Tag = 'LOC_UNIT_LINE_INFANTRY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_AZTEC_EAGLE_WARRIOR_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MACEDONIAN_HYPASPIST_DESCRIPTION' or
--     Tag = 'LOC_UNIT_PERSIAN_IMMORTAL_DESCRIPTION' or
--     Tag = 'LOC_UNIT_DIGGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_GEORGIAN_KHEVSURETI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAORI_TOA_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SULEIMAN_JANISSARY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_GAUL_GAESATAE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BABYLONIAN_SABUM_KIBITTUM_DESCRIPTION');

update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]抗骑兵：与骑兵单位作战时+5 [ICON_Strength] 战斗力，防御骑兵单位时额外+5 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
    Tag = 'LOC_UNIT_SPEARMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_GREEK_HOPLITE_DESCRIPTION' or
    Tag = 'LOC_UNIT_PIKEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_AT_CREW_DESCRIPTION' or
    Tag = 'LOC_UNIT_MODERN_AT_DESCRIPTION' or
    Tag = 'LOC_UNIT_ZULU_IMPI_DESCRIPTION' or
    Tag = 'LOC_UNIT_PIKE_AND_SHOT_DESCRIPTION' or
    Tag = 'LOC_UNIT_SWEDEN_CAROLEAN_DESCRIPTION');

-- 远程能力取消。
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]远程：攻击区域防御和海军单位时-17 [ICON_Strength] 战斗力。占领一个区域或一个提供 [ICON_Strength] 防御力的改良设施时+5 [ICON_Strength] 战斗力。攻击森林或雨林中的目标时-3 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
--     Tag = 'LOC_UNIT_SLINGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BARBARIAN_HORSE_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_SCYTHIAN_HORSE_ARCHER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_EGYPTIAN_CHARIOT_ARCHER_EXPANSION2_DESCRIPTION' or
--     Tag = 'LOC_UNIT_CROSSBOWMAN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_CHINESE_CROUCHING_TIGER_DESCRIPTION' or
--     Tag = 'LOC_UNIT_FIELD_CANNON_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MACHINE_GUN_DESCRIPTION' or
--     Tag = 'LOC_UNIT_NUBIAN_PITATI_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KOREAN_HWACHA_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MONGOLIAN_KESHIG_DESCRIPTION' or
--     Tag = 'LOC_UNIT_MAYAN_HULCHE_DESCRIPTION' or
--     Tag = 'LOC_UNIT_VIETNAMESE_VOI_CHIEN_DESCRIPTION');

update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]重骑兵：如果在平坦地形开始回合，本回合+1 [ICON_Movement] 移动力。攻击区域防御时-5 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
    Tag = 'LOC_UNIT_SUMERIAN_WAR_CART_DESCRIPTION' or
    Tag = 'LOC_UNIT_HEAVY_CHARIOT_DESCRIPTION' or
    Tag = 'LOC_UNIT_KNIGHT_DESCRIPTION' or
    Tag = 'LOC_UNIT_INDIAN_VARU_DESCRIPTION' or
    Tag = 'LOC_UNIT_ARABIAN_MAMLUK_DESCRIPTION' or
    Tag = 'LOC_UNIT_TANK_DESCRIPTION' or
    Tag = 'LOC_UNIT_MODERN_ARMOR_DESCRIPTION' or
    Tag = 'LOC_UNIT_POLISH_HUSSAR_EXPANSION2_DESCRIPTION' or
    Tag = 'LOC_UNIT_MACEDONIAN_HETAIROI_DESCRIPTION' or
    Tag = 'LOC_UNIT_CUIRASSIER_DESCRIPTION' or
    Tag = 'LOC_UNIT_MALI_MANDEKALU_CAVALRY_DESCRIPTION' or
    Tag = 'LOC_UNIT_AMERICAN_ROUGH_RIDER_EXPANSION2_DESCRIPTION' or
    Tag = 'LOC_UNIT_BYZANTINE_TAGMA_DESCRIPTION');

update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]轻骑兵：劫掠只消耗一点 [ICON_Movement] 移动力。攻击区域防御时-7 [ICON_Strength] 战斗力。' where Language = 'zh_Hans_CN' and (
    Tag = 'LOC_UNIT_BARBARIAN_HORSEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_HORSEMAN_DESCRIPTION' or
    Tag = 'LOC_UNIT_CAVALRY_DESCRIPTION' or
    Tag = 'LOC_UNIT_RUSSIAN_COSSACK_DESCRIPTION' or
    Tag = 'LOC_UNIT_HELICOPTER_DESCRIPTION' or
    Tag = 'LOC_UNIT_MAPUCHE_MALON_RAIDER_DESCRIPTION' or
    Tag = 'LOC_UNIT_COURSER_DESCRIPTION' or
    Tag = 'LOC_UNIT_CANADA_MOUNTIE_DESCRIPTION' or
    Tag = 'LOC_UNIT_HUNGARY_BLACK_ARMY_DESCRIPTION' or
    Tag = 'LOC_UNIT_HUNGARY_HUSZAR_DESCRIPTION' or
    Tag = 'LOC_UNIT_COLOMBIAN_LLANERO_DESCRIPTION' or
    Tag = 'LOC_UNIT_ETHIOPIAN_OROMO_CAVALRY_EXPANSION2_DESCRIPTION');

-- 攻城能力临时取消
-- update LocalizedText set Text = Text || '[NEWLINE][NEWLINE]攻城：若相邻轻重骑兵，则+1 [ICON_Movement] 移动力。' where Language = 'zh_Hans_CN' and (
--     Tag = 'LOC_UNIT_CATAPULT_DESCRIPTION' or
--     Tag = 'LOC_UNIT_BOMBARD_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ARTILLERY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION' or
--     Tag = 'LOC_UNIT_TREBUCHET_DESCRIPTION' or
--     Tag = 'LOC_UNIT_KHMER_DOMREY_DESCRIPTION');