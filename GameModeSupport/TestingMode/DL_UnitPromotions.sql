-------------------------------------
--         Unit Promostions        --
-------------------------------------

--promotion class ability 通用能力
--melee
-- insert or replace into TechnologyModifiers
-- 	(TechnologyType,										ModifierId)
-- values
--     --melee
-- 	('TECH_SHIPBUILDING',							        'SHIPBUILDING_MELEE_IGNORE_RIVERS'),
--     ('TECH_SHIPBUILDING',							        'SHIPBUILDING_MELEE_IGNORE_SHORES');

-- insert or replace into CivicModifiers
-- 	(CivicType,										        ModifierId)
-- values
--     --melee
-- 	('CIVIC_FEUDALISM',							            'MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS')
--     ;

insert or replace into Modifiers
	(ModifierId,									        ModifierType,                                       SubjectRequirementSetId)
values
    --melee
	('SHIPBUILDING_MELEE_IGNORE_RIVERS',				    'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_RIVERS',        'UNIT_IS_MELEE_REQUIREMENTS'),
    ('SHIPBUILDING_MELEE_IGNORE_SHORES',				    'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_SHORES',        'UNIT_IS_MELEE_REQUIREMENTS'),
    ('MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS',                'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH',     'MELEE_FOREST_AND_JUNGLE_REQUIREMENTS')
    ;

insert or replace into ModifierArguments
	(ModifierId,									        Name,		        Value)
values
    --melee
	('SHIPBUILDING_MELEE_IGNORE_RIVERS',				    'Ignore',           1),
    ('SHIPBUILDING_MELEE_IGNORE_SHORES',				    'Ignore',           1),
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
    --('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITIES',         'Preview',	'+{1_Amount} {LOC_PROMOTION_TORTOISE_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('BATTLE_LINE_COMBAT',                                  'Preview',	'+{1_Amount} {LOC_PROMOTION_BATTLE_LINE_HD_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    --ranged
    ('RANGED_GARRISON_DISTRICT_BONUS',					    'Preview',	'+{1_Amount} {LOC_RANGED_GARRISON_DISTRICT_BONUS_HD_PREVIEW_DESCRIPTION}'),
    ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',           'Preview',	'{1_Amount} {LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_PREVIEW_DESCRIPTION}'),
    ('SNIPER_BONUS_VS_WOUNDED_UNITS',                       'Preview',	'+{1_Amount} {LOC_PROMOTION_SNIPER_HD_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('SUPPRESSION_DEFNECE_BONUS',                           'Preview',	'+{1_Amount} {LOC_PROMOTION_SUPPRESSION_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('EMPLACEMENT_DEFENSE_BONUS_VS_RANGED',                 'Preview',	'+{1_Amount} {LOC_PROMOTION_EMPLACEMENT_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}');

--unit upgrade ability 升级线
--melee
update ModifierArguments set Value = 5 where ModifierId = 'BATTLECRY_BONUS_VS_MELEE_RANGED' and Name = 'Amount';
--update UnitPromotionModifiers set ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITIES' where UnitPromotionType = 'PROMOTION_TORTOISE' and ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_COMBAT';
update ModifierArguments set Value = 7 where ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_COMBAT' and Name = 'Amount';
update ModifierArguments set Value = 7 where ModifierId = 'URBAN_WARFARE_BONUS' and Name = 'Amount';
--ranged
update ModifierArguments set Value = 5 where ModifierId = 'GARRISON_BONUS_DISTRICTS' and Name = 'Amount';
update UnitPromotionModifiers set ModifierId = 'EMPLACEMENT_DEFENSE_BONUS_VS_RANGED' where UnitPromotionType = 'PROMOTION_EMPLACEMENT' and ModifierId = 'EMPLACEMENT_DEFENSE_BONUS_VS_CITIES';

--melee
update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_AMPHIBIOUS' or UnitPromotionType = 'PROMOTION_ZWEIHANDER';
--ranged
update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_INCENDIARIES';
update UnitPromotions set Level = 2 , Column = 3 where UnitPromotionType = 'PROMOTION_SUPPRESSION';
update UnitPromotions set Level = 3 , Column = 1 where UnitPromotionType = 'PROMOTION_ARROW_STORM';

delete from UnitPromotionPrereqs 
    --melee
where  UnitPromotion = 'PROMOTION_AMPHIBIOUS' 
    or PrereqUnitPromotion = 'PROMOTION_AMPHIBIOUS'
    or UnitPromotion = 'PROMOTION_ZWEIHANDER' 
    or PrereqUnitPromotion = 'PROMOTION_ZWEIHANDER'
    --ranged
    or UnitPromotion = 'PROMOTION_ARROW_STORM' 
    or PrereqUnitPromotion = 'PROMOTION_ARROW_STORM'
    or UnitPromotion = 'PROMOTION_INCENDIARIES' 
    or PrereqUnitPromotion = 'PROMOTION_INCENDIARIES'
    or UnitPromotion = 'PROMOTION_SUPPRESSION' 
    or PrereqUnitPromotion = 'PROMOTION_SUPPRESSION';
    
insert or replace into UnitPromotionPrereqs
    (UnitPromotion,             PrereqUnitPromotion)
values
    --melee
    ('PROMOTION_BATTLE_LINE',   'PROMOTION_TORTOISE'),
    ('PROMOTION_BATTLE_LINE',   'PROMOTION_COMMANDO'),
    ('PROMOTION_COMMANDO',      'PROMOTION_BATTLE_LINE'),
    ('PROMOTION_LONG_MARCH',    'PROMOTION_COMMANDO'),
    ('PROMOTION_LONG_MARCH',    'PROMOTION_BATTLE_LINE'),
    ('PROMOTION_URBAN_WARFARE', 'PROMOTION_BATTLE_LINE'),
    ('PROMOTION_ELITE_GUARD',   'PROMOTION_LONG_MARCH'),
    --ranged
    ('PROMOTION_SNIPER',        'PROMOTION_VOLLEY'),
    ('PROMOTION_SNIPER',        'PROMOTION_GARRISON'),
    ('PROMOTION_SUPPRESSION',   'PROMOTION_VOLLEY'),
    ('PROMOTION_SUPPRESSION',   'PROMOTION_GARRISON'),
    ('PROMOTION_ARROW_STORM',   'PROMOTION_SNIPER'),
    ('PROMOTION_EMPLACEMENT',   'PROMOTION_SUPPRESSION'),
    ('PROMOTION_EXPERT_MARKSMAN',   'PROMOTION_ARROW_STORM');

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
	--('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITIES',		            'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'DEFENSE_BONUS_VS_RANGED_AND_CITIES_REQUIREMENTS'),
    ('BATTLE_LINE_COMBAT',                                          'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'BATTLE_LINE_COMBAT_REQUIREMENTS'),
    --ranged
    ('GARRISON_LOYALTY_BONUS',                                      'MODIFIER_GARRISON_ADJUST_CITY_LOYALTY',            'PLOT_IS_CITY_CENTER',  'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
    ('SNIPER_BONUS_VS_WOUNDED_UNITS',                               'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'BONUS_VS_WOUNDED_UNITS'),
    ('SUPPRESSION_DEFNECE_BONUS',                                   'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'DEFENCE_MELEE_ATTACK'),
    ('EMPLACEMENT_DEFENSE_BONUS_VS_RANGED',                         'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'TORTOISE_REQUIREMENTS')
    ;

insert or replace into ModifierArguments
	(ModifierId,									                Name,		    Value)
values
    --melee
	--('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITIES',		            'Amount',	    7),
    ('BATTLE_LINE_COMBAT',                                          'Amount',	    10),
    ('GARRISON_LOYALTY_BONUS',                                      'Amount',	    5),
    ('SNIPER_BONUS_VS_WOUNDED_UNITS',                               'Amount',	    7),
    ('SUPPRESSION_DEFNECE_BONUS',                                   'Amount',	    10),
    ('EMPLACEMENT_DEFENSE_BONUS_VS_RANGED',                         'Amount',	    10)
    ;
