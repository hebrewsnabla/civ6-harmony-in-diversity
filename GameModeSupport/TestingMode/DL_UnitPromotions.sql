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
	(ModifierId,									        ModifierType,                                       SubjectRequirementSetId)
values
    --melee
	('MELEE_AMPHIBIOUS_UPGRADE',				            'MODIFIER_PLAYER_UNITS_GRANT_PROMOTION',            NULL),
    ('MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS',                'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH',     'MELEE_FOREST_AND_JUNGLE_REQUIREMENTS')
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
	('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',					    'KIND_ABILITY'),
    ('PROMOTION_BATTLE_LINE',                                   'KIND_PROMOTION'),
    ('PROMOTION_LONG_MARCH',                                    'KIND_PROMOTION'),
    --ranged
    ('ABILITY_RANGED_GARRISON_DISTRICT_BONUS',					'KIND_ABILITY'),
    ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',               'KIND_ABILITY'),
    ('PROMOTION_SNIPER',                                        'KIND_PROMOTION')
    ;

insert or replace into TypeTags
	(Type,														Tag)
values
    --melee
	('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',					    'CLASS_MELEE'),
    --ranged
    ('ABILITY_RANGED_GARRISON_DISTRICT_BONUS',					'CLASS_RANGED'),
    ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',               'CLASS_RANGED')
    ;

insert or replace into UnitAbilities 
    (UnitAbilityType,                               Name,      Description,                                                     Inactive) 
values
    --melee
	('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',         NULL,      'LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION',        0),
    --ranged
    ('ABILITY_RANGED_GARRISON_DISTRICT_BONUS',      NULL,      'LOC_ABILITY_RANGED_GARRISON_DISTRICT_BONUS_HD_DESCRIPTION',     0),
    ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',   NULL,      'LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_DESCRIPTION',  0)
    ;

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
    --melee
	('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',					'MELEE_DISTRICT_COMBAT_BONUS'),
    --ranged
    ('ABILITY_RANGED_GARRISON_DISTRICT_BONUS',              'RANGED_GARRISON_DISTRICT_BONUS'),
    ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',           'RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE')
    ;

insert or replace into Modifiers
	(ModifierId,									        ModifierType,                               SubjectRequirementSetId)
values
    --melee
	('MELEE_DISTRICT_COMBAT_BONUS',					        'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'URBAN_WARFARE_REQUIREMENTS'),
    --ranged
    ('RANGED_GARRISON_DISTRICT_BONUS',					    'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'GARRISON_REQUIREMENTS'),
    ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',           'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'RANGED_WEAKER_REQUIREMENTS')
    ;

insert or replace into ModifierArguments
	(ModifierId,									        Name,		    Value)
values
    --melee
	('MELEE_DISTRICT_COMBAT_BONUS',					        'Amount',	    5),
    --ranged
    ('RANGED_GARRISON_DISTRICT_BONUS',					    'Amount',	    5),
    ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',           'Amount',	    -3)
    ;

insert or replace into ModifierStrings
	(ModifierId,										    Context,	Text)
values
    --melee
	('MELEE_DISTRICT_COMBAT_BONUS',					        'Preview',	'+{1_Amount} {LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION}'),
    ('MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS',                'Preview',	'+{1_Amount} {LOC_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION}'),
    ('BATTLE_LINE_COMBAT',                                  'Preview',	'+{1_Amount} {LOC_BATTLE_LINE_COMBAT_HD_PREVIEW_DESCRIPTION}'),
    ('RANGED_GARRISON_DISTRICT_BONUS',					    'Preview',	'+{1_Amount} {LOC_RANGED_GARRISON_DISTRICT_BONUS_HD_PREVIEW_DESCRIPTION}'),
    ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',           'Preview',	'+{1_Amount} {LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_PREVIEW_DESCRIPTION}'),
    --ranged
    ('SNIPER_BONUS_VS_WOUNDED_UNITS',                       'Preview',	'+{1_Amount} {LOC_SNIPER_BONUS_VS_WOUNDED_UNITS_HD_PREVIEW_DESCRIPTION}',
    ('SUPPRESSION_DEFNECE_BONUS',                           'Preview',	'+{1_Amount} {LOC_SUPPRESSION_DEFNECE_BONUS_HD_PREVIEW_DESCRIPTION}');

--unit upgrade ability 升级线
--melee
update ModifierArguments set Value = 5 where ModifierId = 'BATTLECRY_BONUS_VS_MELEE_RANGED' and Name = 'Amount';
update UnitPromotionModifiers set ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITY_CENTER_COMBAT' where UnitPromotionType = 'PROMOTION_TORTOISE' and ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_COMBAT';
update ModifierArguments set Value = 7 where ModifierId = 'URBAN_WARFARE_BONUS' and Name = 'Amount';
--ranged
update ModifierArguments set Value = 5 where ModifierId = 'GARRISON_BONUS_DISTRICTS' and Name = 'Amount';

--melee
update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_AMPHIBIOUS' or UnitPromotionType = 'PROMOTION_ZWEIHANDER';
--ranged
update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_ARROW_STORM' or UnitPromotionType = 'PROMOTION_INCENDIARIES';
update UnitPromotions set Level = 2 and Column = 3 where UnitPromotionType = 'PROMOTION_SUPPRESSION';

delete from UnitPromotionPrereqs 
where  UnitPromotion = 'PROMOTION_AMPHIBIOUS' 
    or PrereqUnitPromotion = 'PROMOTION_AMPHIBIOUS'
    or UnitPromotion = 'PROMOTION_ZWEIHANDER' 
    or PrereqUnitPromotion = 'PROMOTION_ZWEIHANDER';
    
insert or replace into UnitPromotionPrereqs
    (UnitPromotion,             PrereqUnitPromotion)
values
    --melee
    ('PROMOTION_BATTLE_LINE',   'PROMOTION_TORTOISE'),
    ('PROMOTION_LONG_MARCH',    'PROMOTION_COMMANDO'),
    ('PROMOTION_LONG_MARCH',    'PROMOTION_BATTLE_LINE'),
    ('PROMOTION_URBAN_WARFARE', 'PROMOTION_BATTLE_LINE'),
    ('PROMOTION_ELITE_GUARD',   'PROMOTION_LONG_MARCH');

insert or replace into UnitPromotions
    (UnitPromotionType,         Name,                                   Description,                                  Level,    PromotionClass,             Column)
values
    --melee
    ('PROMOTION_BATTLE_LINE',   'LOC_PROMOTION_BATTLE_LINE_HD_NAME',    'LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION',   2,        'PROMOTION_CLASS_MELEE',    3),
    ('PROMOTION_LONG_MARCH',    'LOC_PROMOTION_LONG_MARCH_HD_NAME',     'LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION',    3,        'PROMOTION_CLASS_MELEE',    1),
    --ranged
    ('PROMOTION_SNIPER',        'LOC_PROMOTION_SNIPER_HD_NAME',         'LOC_PROMOTION_SNIPER_HD_DESCRIPTION',        2,        'PROMOTION_CLASS_RANGED',   1);

insert or replace into UnitPromotionModifiers
    (UnitPromotionType,         ModifierId)
values
    --melee
    ('PROMOTION_BATTLE_LINE',   'BATTLE_LINE_COMBAT'),
    ('PROMOTION_LONG_MARCH',    'MAMLUK_HEAL_EVERY_MOVE'),
    --ranged
    ('PROMOTION_GARRISON',      'GARRISON_LOYALTY_BONUS'),
    ('PROMOTION_SNIPER',        'SNIPER_BONUS_VS_WOUNDED_UNITS'),
    ('PROMOTION_SUPPRESSION',   'SUPPRESSION_DEFNECE_BONUS')
    ;

insert or replace into Modifiers
	(ModifierId,									                ModifierType,                                       OwnerRequirementSetId,  SubjectRequirementSetId)
values
    --melee
	('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITY_CENTER_COMBAT',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'DEFENSE_BONUS_VS_RANGED_AND_CITY_CENTER_REQUIREMENTS'),
    ('BATTLE_LINE_COMBAT',                                          'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'BATTLE_LINE_COMBAT_REQUIREMENTS'),
    --ranged
    ('GARRISON_LOYALTY_BONUS',                                      'MODIFIER_SINGLE_CITY_ADJUST_IDENTITY_PER_TURN',    'PLOT_IS_CITY_CENTER',  NULL),
    ('SNIPER_BONUS_VS_WOUNDED_UNITS',                               'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'BONUS_VS_WOUNDED_UNITS'),
    ('SUPPRESSION_DEFNECE_BONUS',                                   'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'DEFENCE_MELEE_ATTACK')
    ;

insert or replace into ModifierArguments
	(ModifierId,									                Name,		    Value)
values
    --melee
	('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITY_CENTER_COMBAT',		'Amount',	    7),
    ('BATTLE_LINE_COMBAT',                                          'Amount',	    2),
    ('GARRISON_LOYALTY_BONUS',                                      'Amount',	    2),
    ('SNIPER_BONUS_VS_WOUNDED_UNITS',                               'Amount',	    7),
    ('MELEE_DEFNECE_BONUS',                                         'Amount',	    10)
    ;
