-------------------------------------
--         Unit Promostions        --
-------------------------------------

--promotion class ability 通用能力
--melee
insert or replace into TechnologyModifiers
	(TechnologyType,										ModifierId)
values
    --melee
	('TECH_SHIPBUILDING',							        'MELEE_AMPHIBIOUS_UPGRADE')
    ;

insert or replace into CivicModifiers
	(CivicType,										        ModifierId)
values
    --melee
	('CIVIC_FEUDALISM',							            'MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS')
    ;

insert or replace into Modifiers
	(ModifierId,									        ModifierType,                               SubjectRequirementSetId)
values
    --melee
	('MELEE_AMPHIBIOUS_UPGRADE',				            'MODIFIER_PLAYER_UNITS_GRANT_PROMOTION',    NULL),
    ('MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS',                'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'MELEE_FOREST_AND_JUNGLE_REQUIREMENTS')
    ;

insert or replace into ModifierArguments
	(ModifierId,									        Name,		        Value)
values
    --melee
	('MELEE_AMPHIBIOUS_UPGRADE',					        'PromotionType',	'PROMOTION_AMPHIBIOUS'),
    ('MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS',                'Amount',           3)
    ;

insert or replace into Types
	(Type,														Kind)
values
    --melee
	('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',					    'KIND_ABILITY')
    ;

insert or replace into TypeTags
	(Type,														Tag)
values
    --melee
	('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',					    'CLASS_MELEE')
    ;

insert or replace into UnitAbilities 
    (UnitAbilityType,                               Name,      Description,                                                   Inactive) 
values
    --melee
	('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',         NULL,      'LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION',      0)
    ;

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
    --melee
	('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',					'MELEE_DISTRICT_COMBAT_BONUS')
    ;

insert or replace into Modifiers
	(ModifierId,									        ModifierType,                               SubjectRequirementSetId)
values
    --melee
	('MELEE_DISTRICT_COMBAT_BONUS',					        'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'URBAN_WARFARE_REQUIREMENTS')
    ;

insert or replace into ModifierArguments
	(ModifierId,									        Name,		    Value)
values
    --melee
	('MELEE_DISTRICT_COMBAT_BONUS',					        'Amount',	    5)
    ;

insert or replace into ModifierStrings
	(ModifierId,										    Context,	Text)
values
    --melee
	('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',					'Preview',	'+{1_Amount} {LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_PREVIEW_DESCRIPTION}')
    ;

--unit upgrade ability 升级线
--melee
update ModifierArguments set Value = 5 where ModifierId = 'BATTLECRY_BONUS_VS_MELEE_RANGED' and Name = 'Amount';
update UnitPromotionModifiers set ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITY_CENTER_COMBAT' where UnitPromotionType = 'PROMOTION_TORTOISE' and ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_COMBAT';
update ModifierArguments set Value = 7 where ModifierId = 'URBAN_WARFARE_BONUS' and Name = 'Amount';

update UnitPromotions set Column = 0 where UnitPromotionType = 'PROMOTION_AMPHIBIOUS' or UnitPromotionType = 'PROMOTION_ZWEIHANDER';
delete from UnitPromotionPrereqs 
where  UnitPromotion = 'PROMOTION_AMPHIBIOUS' 
    or PrereqUnitPromotion = 'PROMOTION_AMPHIBIOUS'
    or UnitPromotion = 'PROMOTION_ZWEIHANDER' 
    or PrereqUnitPromotion = 'PROMOTION_ZWEIHANDER';
    
insert or replace into UnitPromotionPrereqs
    (UnitPromotion,             PrereqUnitPromotion)
values
    ('PROMOTION_BATTLE_LINE',   'PROMOTION_TORTOISE'),
    ('PROMOTION_LONG_MARCH',    'PROMOTION_ZWEIHANDER'),
    ('PROMOTION_LONG_MARCH',    'PROMOTION_BATTLE_LINE'),
    ('PROMOTION_URBAN_WARFARE', 'PROMOTION_BATTLE_LINE'),
    ('PROMOTION_ELITE_GUARD',   'PROMOTION_LONG_MARCH');

insert or replace into UnitPromotions
    (UnitPromotionType,         Name,                                   Description,                                  Level,    PromotionClass,             Column)
values
    ('PROMOTION_BATTLE_LINE',   'LOC_PROMOTION_BATTLE_LINE_HD_NAME',    'LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION',   2,        'PROMOTION_CLASS_MELEE',    3),
    ('PROMOTION_LONG_MARCH',    'LOC_PROMOTION_LONG_MARCH_HD_NAME',     'LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION',    3,        'PROMOTION_CLASS_MELEE',    1);

insert or replace into UnitPromotionModifiers
    (UnitPromotionType,         ModifierId)
values
    ('PROMOTION_BATTLE_LINE',   'BATTLE_LINE_COMBAT'),
    ('PROMOTION_LONG_MARCH',    'MAMLUK_HEAL_EVERY_MOVE');

insert or replace into Modifiers
	(ModifierId,									                ModifierType,                               SubjectRequirementSetId)
values
    --melee
	('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITY_CENTER_COMBAT',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'DEFENSE_BONUS_VS_RANGED_AND_CITY_CENTER_REQUIREMENTS'),
    ('BATTLE_LINE_COMBAT',                                          'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'BATTLE_LINE_COMBAT_REQUIREMENTS')
    ;

insert or replace into ModifierArguments
	(ModifierId,									                Name,		    Value)
values
    --melee
	('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITY_CENTER_COMBAT',		'Amount',	    7),
    ('BATTLE_LINE_COMBAT',                                          'Amount',	    2)
    ;

insert or replace into EnglishText
    (Tag,                                                                Text)
values
    --melee
    ("LOC_TECH_SHIPBUILDING_DESCRIPTION",                                "Allows all land units to embark. Unlocks Melee units upgrade: Amphibious[NEWLINE]No [ICON_Strength] Combat Strength and [ICON_Movement] Movement penalty when attacking from sea or river."),
    ("LOC_CIVIC_FEUDALISM_DL_DESCRIPTION",                               "Plantation improvements receive +1 [ICON_Food] Food. Unlocks Melee units upgrade: +3 [ICON_Strength] Combat Strength for units fighting in Rainforest or Woods tiles."),
    --("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_NAME",                  "District Warfare"),
    ("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION",           "+5 [ICON_Strength] Combat Strength when fighting in a district."),
    ("LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_PREVIEW_DESCRIPTION",      "from District Warfare"),
    ("LOC_PROMOTION_BATTLECRY_DESCRIPTION",                              "+5 [ICON_Strength] Combat Strength vs. melee, ranged and anti-cavalry units."),
    ("LOC_PROMOTION_TORTOISE_DESCRIPTION",                               "+7 [ICON_Strength] Combat Strength when defending against ranged or city center attacks."),
    ("LOC_PROMOTION_BATTLE_LINE_HD_NAME",                                "Battle Line"),
    ("LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                         "+7 [ICON_Strength] Combat Strength when defending against ranged or city center attacks."),
    ("LOC_PROMOTION_LONG_MARCH_HD_NAME",                                 "Long March"),
    ("LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                          "Heals at the end of every turn, even after moving or attacking."),
    ("LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION",                          "+7 [ICON_Strength] Combat Strength when fighting in a district.")
    ;

insert or replace into LocalizedText
    (Language,      Tag,                                                    Text)
values
    --melee
    ("zh_Hans_CN",  "LOC_TECH_SHIPBUILDING_DESCRIPTION",                            "允许所有陆地单位上船。解锁近战单位升级：水陆两栖[NEWLINE]从海洋或河流进行攻击时，免除 [ICON_Strength] 战斗力和 [ICON_Movement] 移动力减益。"),
    ("zh_Hans_CN",  "LOC_CIVIC_FEUDALISM_DL_DESCRIPTION",                           "种植园改良设施提供的 [ICON_Food] 食物+1。解锁近战单位升级：在树林或雨林上战斗时+3 [ICON_Strength] 战斗力"),
    --("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_NAME",              "区域作战"),
    ("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION",       "在区域上战斗时+5 [ICON_Strength] 战斗力"),
    ("zh_Hans_CN",  "LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_PREVIEW_DESCRIPTION",  "来自区域作战"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLECRY_DESCRIPTION",                          "进攻近战、远程和抗骑兵单位时+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_TORTOISE_DESCRIPTION",                           "防御远程或城市攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_NAME",                            "战线"),
    ("zh_Hans_CN",  "LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION",                     "防御远程或城市攻击时+7 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_NAME",                             "长途行军"),
    ("zh_Hans_CN",  "LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION",                      "在每回合结束时（甚至是在移动或攻击后），自动恢复生命值。"),
    ("zh_Hans_CN",  "LOC_PROMOTION_URBAN_WARFARE_DESCRIPTION",                      "在区域上战斗时+7 [ICON_Strength] 战斗力")
    ;