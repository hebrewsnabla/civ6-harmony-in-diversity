-------------------------------------
--         Unit Promostions        --
-------------------------------------

-- Tech and Civic Promotion
update Civics set Description = 'LOC_CIVIC_DEFENSIVE_TACTICS_HD_DESCRIPTION' where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
update Civics set Description = 'LOC_CIVIC_MILITARY_TRAINING_HD_DESCRIPTION' where CivicType = 'CIVIC_MILITARY_TRAINING';
update Civics set Description = 'LOC_CIVIC_MERCENARIES_HD_DESCRIPTION' where CivicType = 'CIVIC_MERCENARIES';

update Technologies set Description = 'LOC_TECH_SHIPBUILDING_HD_DESCRIPTION' where TechnologyType ='TECH_SHIPBUILDING';
update Technologies set Description = 'LOC_TECH_MILITARY_TACTICS_HD_DESCRIPTION' where TechnologyType ='TECH_MILITARY_TACTICS';
update Technologies set Description = 'LOC_TECH_GUNPOWDER_HD_DESCRIPTION' where TechnologyType ='TECH_GUNPOWDER';
-- update Technologies set Description = 'LOC_TECH_RIFLING_HD_DESCRIPTION' where TechnologyType ='TECH_RIFLING';
update Technologies set Description = 'LOC_TECH_SANITATION_HD_DESCRIPTION' where TechnologyType ='TECH_SANITATION';

insert or replace into Types
    (Type,                                                      Kind)
values
    ('ABILITY_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES_HD',     'KIND_ABILITY'),
    ('ABILITY_RANGED_HILLS_STRENGTH_HD',                        'KIND_ABILITY'),
    ('ABILITY_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION_HD',      'KIND_ABILITY'),
    ('ABILITY_HEAVYC_HEAL_AFTER_KILL_HD',                       'KIND_ABILITY'),
    ('ABILITY_LIGHTC_AGAINST_UNIT_BONUS_HD',                    'KIND_ABILITY'),
    ('ABILITY_SIEGE_ATTACK_DISTRICT_BONUS_HD',                  'KIND_ABILITY'),
    ('ABILITY_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD',         'KIND_ABILITY'),
    ('ABILITY_RANGED_GARRISON_BONUS_HD',                        'KIND_ABILITY'),
    ('ABILITY_ANTIC_HILLS_DEFEND_BONUS_HD',                     'KIND_ABILITY'),
    ('ABILITY_RECON_IGNORE_ZOC_HD',                             'KIND_ABILITY'),
    ('ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD',                    'KIND_ABILITY'),
    ('ABILITY_LIGHTC_EXTRA_FAITH_PLUNDER_HD',                   'KIND_ABILITY'),
    ('ABILITY_SIEGE_ATTACK_AFTER_MOVE_HD',                      'KIND_ABILITY');

insert or replace into TechnologyModifiers
    (TechnologyType,                                        ModifierId)
values
    ('TECH_SHIPBUILDING',                                   'HD_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES'),
    ('TECH_MILITARY_TACTICS',                               'HD_RANGED_HILLS_STRENGTH'),
    ('TECH_SANITATION',                                     'HD_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION'),
    ('TECH_GUNPOWDER',                                      'HD_HEAVYC_HEAL_AFTER_KILL'),
    ('TECH_MILITARY_TACTICS',                               'HD_LIGHTC_AGAINST_UNIT_BONUS'),
    ('TECH_RIFLING',                                        'HD_SIEGE_ATTACK_DISTRICT_BONUS');

insert or replace into CivicModifiers
    (CivicType,                                             ModifierId)
values
    ('CIVIC_FEUDALISM',                                     'HD_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS'),
    ('CIVIC_DEFENSIVE_TACTICS',                             'HD_RANGED_GARRISON_BONUS'),
    ('CIVIC_DEFENSIVE_TACTICS',                             'HD_ANTIC_HILLS_DEFEND_BONUS'),
    ('CIVIC_MERCANTILISM',                                  'HD_RECON_IGNORE_ZOC'),
    ('CIVIC_MILITARY_TRAINING',                             'HD_HEAVYC_OPEN_AREA_STRENGTH'),
    ('CIVIC_MERCENARIES',                                   'HD_LIGHTC_EXTRA_FAITH_PLUNDER'),
    ('CIVIC_MILITARY_TRAINING',                             'HD_SIEGE_ATTACK_AFTER_MOVE');

insert or replace into Modifiers
    (ModifierId,                                            ModifierType)
values
    ('HD_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES',         'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_RANGED_HILLS_STRENGTH',                            'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION',          'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_HEAVYC_HEAL_AFTER_KILL',                           'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_LIGHTC_AGAINST_UNIT_BONUS',                        'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_SIEGE_ATTACK_DISTRICT_BONUS',                      'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),

    ('HD_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS',             'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_RANGED_GARRISON_BONUS',                            'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_ANTIC_HILLS_DEFEND_BONUS',                         'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_RECON_IGNORE_ZOC',                                 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_HEAVYC_OPEN_AREA_STRENGTH',                        'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_LIGHTC_EXTRA_FAITH_PLUNDER',                       'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('HD_SIEGE_ATTACK_AFTER_MOVE',                          'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

insert or replace into ModifierArguments
    (ModifierId,                                            Name,           Value)
values
    ('HD_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES',         'AbilityType',  'ABILITY_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES_HD'),
    ('HD_RANGED_HILLS_STRENGTH',                            'AbilityType',  'ABILITY_RANGED_HILLS_STRENGTH_HD'),
    ('HD_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION',          'AbilityType',  'ABILITY_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION_HD'),
    ('HD_HEAVYC_HEAL_AFTER_KILL',                           'AbilityType',  'ABILITY_HEAVYC_HEAL_AFTER_KILL_HD'),
    ('HD_LIGHTC_AGAINST_UNIT_BONUS',                        'AbilityType',  'ABILITY_LIGHTC_AGAINST_UNIT_BONUS_HD'),
    ('HD_SIEGE_ATTACK_DISTRICT_BONUS',                      'AbilityType',  'ABILITY_SIEGE_ATTACK_DISTRICT_BONUS_HD'),

    ('HD_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS',             'AbilityType',  'ABILITY_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD'),
    ('HD_RANGED_GARRISON_BONUS',                            'AbilityType',  'ABILITY_RANGED_GARRISON_BONUS_HD'),
    ('HD_ANTIC_HILLS_DEFEND_BONUS',                         'AbilityType',  'ABILITY_ANTIC_HILLS_DEFEND_BONUS_HD'),
    ('HD_RECON_IGNORE_ZOC',                                 'AbilityType',  'ABILITY_RECON_IGNORE_ZOC_HD'),
    ('HD_HEAVYC_OPEN_AREA_STRENGTH',                        'AbilityType',  'ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD'),
    ('HD_LIGHTC_EXTRA_FAITH_PLUNDER',                       'AbilityType',  'ABILITY_LIGHTC_EXTRA_FAITH_PLUNDER_HD'),
    ('HD_SIEGE_ATTACK_AFTER_MOVE',                          'AbilityType',  'ABILITY_SIEGE_ATTACK_AFTER_MOVE_HD');

insert or replace into TypeTags
    (Type,                                                      Tag)
values
    ('ABILITY_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES_HD',     'CLASS_MELEE'),
    ('ABILITY_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES_HD',     'CLASS_RECON'),
    ('ABILITY_RANGED_HILLS_STRENGTH_HD',                        'CLASS_RANGED'),
    ('ABILITY_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION_HD',      'CLASS_ANTI_CAVALRY'),
    ('ABILITY_HEAVYC_HEAL_AFTER_KILL_HD',                       'CLASS_HEAVY_CAVALRY'),
    ('ABILITY_LIGHTC_AGAINST_UNIT_BONUS_HD',                    'CLASS_LIGHT_CAVALRY'),
    ('ABILITY_SIEGE_ATTACK_DISTRICT_BONUS_HD',                  'CLASS_SIEGE'),
    ('ABILITY_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD',         'CLASS_MELEE'),
    ('ABILITY_RANGED_GARRISON_BONUS_HD',                        'CLASS_RANGED'),
    ('ABILITY_ANTIC_HILLS_DEFEND_BONUS_HD',                     'CLASS_ANTI_CAVALRY'),
    ('ABILITY_RECON_IGNORE_ZOC_HD',                             'CLASS_RECON'),
    ('ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD',                    'CLASS_HEAVY_CAVALRY'),
    ('ABILITY_LIGHTC_EXTRA_FAITH_PLUNDER_HD',                   'CLASS_LIGHT_CAVALRY'),
    ('ABILITY_SIEGE_ATTACK_AFTER_MOVE_HD',                      'CLASS_SIEGE'),
    ('ABILITY_SEE_HIDDEN',                                      'CLASS_NAVAL_MELEE'),
    ('ABILITY_MONGOLIAN_KESHIG',                                'CLASS_NAVAL_MELEE');

insert or replace into UnitAbilities 
    (UnitAbilityType,                                           Name,   Description,                                                            Inactive) 
values
    ('ABILITY_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES_HD',     NULL,   'LOC_ABILITY_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES_HD_DESCRIPTION',     1),
    ('ABILITY_RANGED_HILLS_STRENGTH_HD',                        NULL,   'LOC_ABILITY_RANGED_HILLS_STRENGTH_HD_DESCRIPTION',                        1),
    ('ABILITY_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION_HD',      NULL,   'LOC_ABILITY_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION_HD_DESCRIPTION',      1),
    ('ABILITY_HEAVYC_HEAL_AFTER_KILL_HD',                       NULL,   'LOC_ABILITY_HEAVYC_HEAL_AFTER_KILL_HD_DESCRIPTION',                       1),
    ('ABILITY_LIGHTC_AGAINST_UNIT_BONUS_HD',                    NULL,   'LOC_ABILITY_LIGHTC_AGAINST_UNIT_BONUS_HD_DESCRIPTION',                    1),
    ('ABILITY_SIEGE_ATTACK_DISTRICT_BONUS_HD',                  NULL,   'LOC_ABILITY_SIEGE_ATTACK_DISTRICT_BONUS_HD_DESCRIPTION',                  1),
    ('ABILITY_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD',         NULL,   'LOC_ABILITY_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_DESCRIPTION',         1),
    ('ABILITY_RANGED_GARRISON_BONUS_HD',                        NULL,   'LOC_ABILITY_RANGED_GARRISON_BONUS_HD_DESCRIPTION',                        1),
    ('ABILITY_ANTIC_HILLS_DEFEND_BONUS_HD',                     NULL,   'LOC_ABILITY_ANTIC_HILLS_DEFEND_BONUS_HD_DESCRIPTION',                     1),
    ('ABILITY_RECON_IGNORE_ZOC_HD',                             NULL,   'LOC_ABILITY_RECON_IGNORE_ZOC_HD_DESCRIPTION',                             1),
    ('ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD',                    NULL,   'LOC_ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD_DESCRIPTION',                    1),
    ('ABILITY_LIGHTC_EXTRA_FAITH_PLUNDER_HD',                   NULL,   'LOC_ABILITY_LIGHTC_EXTRA_FAITH_PLUNDER_HD_DESCRIPTION',                   1),
    ('ABILITY_SIEGE_ATTACK_AFTER_MOVE_HD',                      NULL,   'LOC_ABILITY_SIEGE_ATTACK_AFTER_MOVE_HD_DESCRIPTION',                      1);

insert or replace into UnitAbilityModifiers
    (UnitAbilityType,                                           ModifierId)
values
    ('ABILITY_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES_HD',     'HD_IGNORE_RIVERS'),
    ('ABILITY_MELEE_AND_RECON_IGNORE_RIVERS_AND_SHORES_HD',     'HD_IGNORE_SHORES'),
    ('ABILITY_RANGED_HILLS_STRENGTH_HD',                        'HD_ATTACKING_FROM_HILLS_STRENGTH'),
    ('ABILITY_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION_HD',      'HD_IGNORE_DAMAGED_STRENGTH_REDUCTION'),
    ('ABILITY_HEAVYC_HEAL_AFTER_KILL_HD',                       'HD_HEAL_AFTER_KILL'),
    ('ABILITY_LIGHTC_AGAINST_UNIT_BONUS_HD',                    'HD_AGAINST_UNIT_BONUS'),
    ('ABILITY_SIEGE_ATTACK_DISTRICT_BONUS_HD',                  'HD_ATTACK_DISTRICT_BONUS'),
    ('ABILITY_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD',         'HD_FOREST_AND_JUNGLE_COMBAT_BONUS'),
    ('ABILITY_RANGED_GARRISON_BONUS_HD',                        'HD_GARRISON_BONUS'),
    ('ABILITY_ANTIC_HILLS_DEFEND_BONUS_HD',                     'HD_HILLS_DEFEND_BONUS'),
    ('ABILITY_RECON_IGNORE_ZOC_HD',                             'HD_IGNORE_ZOC'),
    ('ABILITY_HEAVYC_OPEN_AREA_STRENGTH_HD',                    'HD_OPEN_AREA_STRENGTH'),
    ('ABILITY_LIGHTC_EXTRA_FAITH_PLUNDER_HD',                   'HD_EXTRA_FAITH_PLUNDER_DISTRICT'),
    ('ABILITY_LIGHTC_EXTRA_FAITH_PLUNDER_HD',                   'HD_EXTRA_FAITH_PLUNDER_IMPROVEMENT'),
    ('ABILITY_SIEGE_ATTACK_AFTER_MOVE_HD',                      'HD_ATTACK_AFTER_MOVE');

insert or replace into Modifiers
    (ModifierId,                                ModifierType,                           OwnerRequirementSetId,                  SubjectRequirementSetId)
values
    ('HD_ATTACKING_FROM_HILLS_STRENGTH',        'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH', 'ETHIOPIA_PLOT_IS_HILLS_REQUIREMENTS',  'HD_UNIT_ATTACKING_REQUIREMENTS');

insert or replace into Modifiers
    (ModifierId,                                ModifierType,                                                           SubjectRequirementSetId)
values
    ('HD_IGNORE_RIVERS',                        'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_RIVERS',                            NULL),
    ('HD_IGNORE_SHORES',                        'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_SHORES',                            NULL),
    ('HD_IGNORE_DAMAGED_STRENGTH_REDUCTION',    'MODIFIER_PLAYER_UNIT_ADJUST_STRENGTH_REDUCTION_FOR_DAMAGE_MODIFIER',   NULL),
    ('HD_HEAL_AFTER_KILL',                      'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_FROM_COMBAT',                         NULL),
    ('HD_AGAINST_UNIT_BONUS',                   'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',                                 'COMBAT_AGAINST_UNITS_REQUIREMENTS'),
    ('HD_ATTACK_DISTRICT_BONUS',                'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',                                 'ATTACKING_DISTRICTS_REQUIREMENTS'),
    ('HD_FOREST_AND_JUNGLE_COMBAT_BONUS',       'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',                                 'PLOT_HAS_FOREST_OR_JUNGLE_REQUIREMENTS'),
    ('HD_GARRISON_BONUS',                       'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',                                 'GARRISON_REQUIREMENTS'),
    ('HD_HILLS_DEFEND_BONUS',                   'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',                                 'DEFENCE_MELEE_ATTACK_ON_HILLS_REQUIREMENTS'),
    ('HD_IGNORE_ZOC',                           'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_ZOC',                               NULL),
    ('HD_OPEN_AREA_STRENGTH',                   'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',                                 'PLOT_IS_OPEN_AREA_REQUIREMENTS'),
    ('HD_EXTRA_FAITH_PLUNDER_DISTRICT',         'MODIFIER_PLAYER_UNIT_ADJUST_FAITH_ON_DISTRICT_PILLAGE',                NULL),
    ('HD_EXTRA_FAITH_PLUNDER_IMPROVEMENT',      'MODIFIER_PLAYER_UNIT_ADJUST_FAITH_ON_IMPROVEMENT_PILLAGE',             NULL),
    ('HD_ATTACK_AFTER_MOVE',                    'MODIFIER_PLAYER_UNIT_ADJUST_MOVE_AND_ATTACK',                          NULL);

insert or replace into ModifierArguments
    (ModifierId,                                Name,           Value)
values
    ('HD_IGNORE_RIVERS',                        'Ignore',      1),
    ('HD_IGNORE_SHORES',                        'Ignore',      1),
    ('HD_ATTACKING_FROM_HILLS_STRENGTH',        'Amount',      5),
    ('HD_IGNORE_DAMAGED_STRENGTH_REDUCTION',    'Amount',      100),
    ('HD_HEAL_AFTER_KILL',                      'Amount',      10),
    ('HD_AGAINST_UNIT_BONUS',                   'Amount',      5),
    ('HD_ATTACK_DISTRICT_BONUS',                'Amount',      5),
    ('HD_FOREST_AND_JUNGLE_COMBAT_BONUS',       'Amount',      3),
    ('HD_GARRISON_BONUS',                       'Amount',      5),
    ('HD_HILLS_DEFEND_BONUS',                   'Amount',      7),
    ('HD_IGNORE_ZOC',                           'Ignore',      1),
    ('HD_OPEN_AREA_STRENGTH',                   'Amount',      5),
    ('HD_EXTRA_FAITH_PLUNDER_DISTRICT',         'Amount',      25),
    ('HD_EXTRA_FAITH_PLUNDER_IMPROVEMENT',      'Amount',      25),
    ('HD_ATTACK_AFTER_MOVE',                    'CanAttack',   1);

insert or replace into ModifierStrings
    (ModifierId,                                Context,    Text)
values
    ('HD_ATTACKING_FROM_HILLS_STRENGTH',        'Preview',  '+{1_Amount} {LOC_HD_ATTACKING_FROM_HILLS_STRENGTH_PREVIEW_TEXT}'),
    ('HD_AGAINST_UNIT_BONUS',                   'Preview',  '+{1_Amount} {LOC_HD_AGAINST_UNIT_BONUS_PREVIEW_TEXT}'),
    ('HD_ATTACK_DISTRICT_BONUS',                'Preview',  '+{1_Amount} {LOC_HD_ATTACK_DISTRICT_BONUS_PREVIEW_TEXT}'),
    ('HD_FOREST_AND_JUNGLE_COMBAT_BONUS',       'Preview',  '+{1_Amount} {LOC_HD_FOREST_AND_JUNGLE_COMBAT_BONUS_PREVIEW_TEXT}'),
    ('HD_GARRISON_BONUS',                       'Preview',  '+{1_Amount} {LOC_HD_GARRISON_BONUS_PREVIEW_TEXT}'),
    ('HD_HILLS_DEFEND_BONUS',                   'Preview',  '+{1_Amount} {LOC_HD_HILLS_DEFEND_BONUS_PREVIEW_TEXT}'),
    ('HD_OPEN_AREA_STRENGTH',                   'Preview',  '+{1_Amount} {LOC_HD_OPEN_AREA_STRENGTH_PREVIEW_TEXT}');

---------------------------------------------------------------------------------------------------------------
-- Melee, ranged, anti-cavalry                                                                               --
---------------------------------------------------------------------------------------------------------------
insert or replace into Types
    (Type,                                                      Kind)
values
    --melee
    -- ('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',                     'KIND_ABILITY'),
    ('PROMOTION_BATTLE_LINE',                                   'KIND_PROMOTION'),
    ('PROMOTION_LONG_MARCH',                                    'KIND_PROMOTION'),
    --ranged
    -- ('ABILITY_RANGED_GARRISON_DISTRICT_BONUS',                  'KIND_ABILITY'),
    -- ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',               'KIND_ABILITY'),
    -- ('PROMOTION_SNIPER',                                        'KIND_PROMOTION');
    --anti-cavalry
    ('PROMOTION_LOGISTICS_SUPPLY',                              'KIND_PROMOTION'),
    --naval melee
    ('PROMOTION_BATTERING_RAM_TACTICS',                         'KIND_PROMOTION'),
    --naval ranged
    ('PROMOTION_BULB_BOW',                                      'KIND_PROMOTION'),
    --naval raider
    ('PROMOTION_BOARDING_ACTION',                               'KIND_PROMOTION'),
    ('PROMOTION_DAMAGE_CONTROL',                                'KIND_PROMOTION'),
    ('PROMOTION_AUTO_SOLICITATION',                             'KIND_PROMOTION');

delete from TypeTags where Type = 'ABILITY_ANTI_SPEAR' and Tag = 'CLASS_MELEE';
delete from TypeTags where (Type != 'ABILITY_SEE_HIDDEN' and Type != 'UNIT_SCOUT') and Tag = 'CLASS_REVEAL_STEALTH';
-- insert or replace into TypeTags
--     (Type,                                                      Tag)
-- values
--     --melee
--     ('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',                     'CLASS_MELEE'),
--     --ranged
--     ('ABILITY_RANGED_GARRISON_DISTRICT_BONUS',                  'CLASS_RANGED'),
--     ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',               'CLASS_RANGED');

-- insert or replace into UnitAbilities 
--     (UnitAbilityType,                               Name,      Description,                                                     Inactive) 
-- values
--     --melee
--     ('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',         NULL,      'LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_DESCRIPTION',        0),
--     --ranged
--     ('ABILITY_RANGED_GARRISON_DISTRICT_BONUS',      NULL,      'LOC_ABILITY_RANGED_GARRISON_DISTRICT_BONUS_HD_DESCRIPTION',     0),
--     ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',   NULL,      'LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_DESCRIPTION',  0);

insert or replace into UnitAbilityModifiers
    (UnitAbilityType,                                           ModifierId)
values
    --melee
    -- ('ABILITY_MELEE_DISTRICT_COMBAT_BONUS',                     'MELEE_DISTRICT_COMBAT_BONUS'),
    --ranged
    -- ('ABILITY_RANGED_GARRISON_DISTRICT_BONUS',                  'RANGED_GARRISON_DISTRICT_BONUS'),
    -- ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',               'RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE'),
    ('ABILITY_ANTI_CAVALRY',                                    'ANTI_CAVALRY_COMBAT_BONUS_DEFENDING');

insert or replace into Modifiers
    (ModifierId,                                                ModifierType,                               SubjectRequirementSetId)
values
    --melee
    -- ('MELEE_DISTRICT_COMBAT_BONUS',                             'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'URBAN_WARFARE_REQUIREMENTS'),
    --ranged
    -- ('RANGED_GARRISON_DISTRICT_BONUS',                          'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'GARRISON_REQUIREMENTS'),
    -- ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',               'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'RANGED_WEAKER_REQUIREMENTS'),
    ('ANTI_CAVALRY_COMBAT_BONUS_DEFENDING',                     'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'ANTI_CAVALRY_DEFEND_OPPONENT_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                                Name,            Value)
values
    --melee
    -- ('MELEE_DISTRICT_COMBAT_BONUS',                             'Amount',        5),
    --ranged
    -- ('RANGED_GARRISON_DISTRICT_BONUS',                          'Amount',        5),
    -- ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',               'Amount',        -3),
    ('ANTI_CAVALRY_COMBAT_BONUS_DEFENDING',                     'Amount',        5);

insert or replace into ModifierStrings
    (ModifierId,                                                Context,    Text)
values
    --melee
    -- ('MELEE_DISTRICT_COMBAT_BONUS',                             'Preview',    '+{1_Amount} {LOC_ABILITY_MELEE_DISTRICT_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION}'),
    -- ('MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS',                    'Preview',    '+{1_Amount} {LOC_MELEE_FOREST_AND_JUNGLE_COMBAT_BONUS_HD_PREVIEW_DESCRIPTION}'),
    -- ('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITIES',             'Preview',    '+{1_Amount} {LOC_PROMOTION_TORTOISE_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('BATTLE_LINE_COMBAT',                                      'Preview',    '+{1_Amount} {LOC_PROMOTION_BATTLE_LINE_HD_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    --ranged
    -- ('RANGED_GARRISON_DISTRICT_BONUS',                          'Preview',    '+{1_Amount} {LOC_RANGED_GARRISON_DISTRICT_BONUS_HD_PREVIEW_DESCRIPTION}'),
    -- ('RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE',               'Preview',    '{1_Amount} {LOC_RANGED_WEAKER_ATTACKING_FOREST_AND_JUNGLE_HD_PREVIEW_DESCRIPTION}'),
    ('ANTI_CAVALRY_COMBAT_BONUS_DEFENDING',                     'Preview',    '+{1_Amount} {LOC_ANTI_CAVALRY_COMBAT_BONUS_DEFENDING_PREVIEW_TEXT}'),
    -- ('SNIPER_BONUS_VS_WOUNDED_UNITS',                           'Preview',    '+{1_Amount} {LOC_PROMOTION_SNIPER_HD_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('SUPPRESSION_DEFNECE_BONUS',                               'Preview',    '+{1_Amount} {LOC_PROMOTION_SUPPRESSION_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('EMPLACEMENT_DEFENSE_BONUS_VS_RANGED',                     'Preview',    '+{1_Amount} {LOC_PROMOTION_EMPLACEMENT_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    --anti-cavalry
    -- ('ANTI_CAVALRY_HILLS_COMBAT_BONUS',                         'Preview',    '+{1_Amount} {LOC_ABILITY_ANTI_CAVALRY_HILLS_COMBAT_BONUS_DESCRIPTION}'),
    -- ('ECHELON_DEFENCE',                                         'Preview',    '+{1_Amount} {LOC_PROMOTION_ECHELON_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('THRUST_ATTACK_BONUS',                                     'Preview',    '+{1_Amount} {LOC_PROMOTION_THRUST_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    --naval raider
    ('BOARDING_ACTION_ATTACK_BONUS',                            'Preview',    '+{1_Amount} {LOC_PROMOTION_BOARDING_ACTION_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('WOLFPACK_ADJACENT_BONUS',                                 'Preview',    '+{1_Amount} {LOC_PROMOTION_WOLFPACK_ADJACENT_BONUS_PREVIEW_TEXT}');

--unit upgrade ability 升级线
--melee
-- update ModifierArguments set Value = 5 where ModifierId = 'BATTLECRY_BONUS_VS_MELEE_RANGED' and Name = 'Amount';
--update UnitPromotionModifiers set ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITIES' where UnitPromotionType = 'PROMOTION_TORTOISE' and ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_COMBAT';
-- update ModifierArguments set Value = 7 where ModifierId = 'TORTOISE_DEFENSE_BONUS_VS_RANGED_COMBAT' and Name = 'Amount';
-- update ModifierArguments set Value = 7 where ModifierId = 'URBAN_WARFARE_BONUS' and Name = 'Amount';
--ranged
-- update ModifierArguments set Value = 5 where ModifierId = 'GARRISON_BONUS_DISTRICTS' and Name = 'Amount';
-- update ModifierArguments set Value = 10 where ModifierId = 'INCENDIARIES_BONUS_VS_DISTRICT_DEFENSES' and Name = 'Amount';
update UnitPromotionModifiers set ModifierId = 'EMPLACEMENT_DEFENSE_BONUS_VS_RANGED' where UnitPromotionType = 'PROMOTION_EMPLACEMENT' and ModifierId = 'EMPLACEMENT_DEFENSE_BONUS_VS_CITIES';
--anti-cavalry
update ModifierArguments set Value = 5 where ModifierId = 'ANTI_CAVALRY_COMBAT_BONUS' and Name = 'Amount';
--delete from UnitPromotionModifiers where UnitPromotionType = 'PROMOTION_ECHELON' and ModifierId = 'ECHELON_ADDITIONAL_CAVALRY_BONUS';
delete from UnitPromotionModifiers where UnitPromotionType = 'PROMOTION_THRUST' and ModifierId = 'THRUST_BONUS_VS_MELEE';
update ModifierArguments set Value = 10 where ModifierId = 'CHOKE_POINTS_BONUS' and Name = 'Amount';
--naval melee
update ModifierArguments set Value = 10 where ModifierId = 'CREEPING_ATTACK_BONUS_VS_RAIDERS' and Name = 'Amount';
--naval ranged
update ModifierArguments set Value = 5 where ModifierId = 'BOMBARDMENT_BONUS_VS_DISTRICT_DEFENSES' and Name = 'Amount';
update ModifierArguments set Value = 7 where ModifierId = 'ROLLING_BARRAGE_BONUS_VS_DISTRICT_DEFENSES' and Name = 'Amount';
--naval raider
update ModifierArguments set Value = 100 where ModifierId = 'LOOT_GOLD_FROM_COASTAL_RAID' and Name = 'Bonus';
delete from UnitPromotionModifiers where UnitPromotionType = 'PROMOTION_WOLFPACK' and ModifierId = 'WOLFPACK_ADDITIONAL_ATTACK';

--melee
update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_AMPHIBIOUS' or UnitPromotionType = 'PROMOTION_ZWEIHANDER';
--ranged
-- update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_INCENDIARIES';
update UnitPromotions set Level = 2 , Column = 1 where UnitPromotionType = 'PROMOTION_SUPPRESSION';
update UnitPromotions set Level = 3 , Column = 1 where UnitPromotionType = 'PROMOTION_ARROW_STORM';
--anti-cavalry 
update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_SCHILTRON';
update UnitPromotions set Level = 2 , Column = 3 where UnitPromotionType = 'PROMOTION_REDEPLOY';
update UnitPromotions set Level = 3 , Column = 1 where UnitPromotionType = 'PROMOTION_CHOKE_POINTS';
--naval melee
update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_RUTTER';
update UnitPromotions set Level = 2 , Column = 3 where UnitPromotionType = 'PROMOTION_CREEPING_ATTACK';
--naval ranged
update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_PROXIMITY_FUSES';
--naval raider
update UnitPromotions set Column = -1 where UnitPromotionType = 'PROMOTION_BOARDING' or UnitPromotionType = 'PROMOTION_HOMING_TORPEDOES' or UnitPromotionType = 'PROMOTION_OBSERVATION';
update UnitPromotions set Level = 1 , Column = 1 where UnitPromotionType = 'PROMOTION_SWIFT_KEEL';
update UnitPromotions set Level = 2 , Column = 3 where UnitPromotionType = 'PROMOTION_SILENT_RUNNING';
update UnitPromotions set Level = 3 , Column = 1 where UnitPromotionType = 'PROMOTION_LOOT';

delete from UnitPromotionPrereqs 
    --melee
where  UnitPromotion = 'PROMOTION_AMPHIBIOUS' 
    or PrereqUnitPromotion = 'PROMOTION_AMPHIBIOUS'
    or UnitPromotion = 'PROMOTION_ZWEIHANDER' 
    or PrereqUnitPromotion = 'PROMOTION_ZWEIHANDER'
    --ranged
    or UnitPromotion = 'PROMOTION_ARROW_STORM' 
    or PrereqUnitPromotion = 'PROMOTION_ARROW_STORM'
    -- or UnitPromotion = 'PROMOTION_INCENDIARIES' 
    -- or PrereqUnitPromotion = 'PROMOTION_INCENDIARIES'
    or UnitPromotion = 'PROMOTION_SUPPRESSION' 
    or PrereqUnitPromotion = 'PROMOTION_SUPPRESSION'
    --anti-cavalry 
    or UnitPromotion = 'PROMOTION_SCHILTRON' 
    or PrereqUnitPromotion = 'PROMOTION_SCHILTRON'
    or UnitPromotion = 'PROMOTION_REDEPLOY' 
    or PrereqUnitPromotion = 'PROMOTION_REDEPLOY'
    --naval melee
    or UnitPromotion = 'PROMOTION_RUTTER' 
    or PrereqUnitPromotion = 'PROMOTION_RUTTER'
    or UnitPromotion = 'PROMOTION_CREEPING_ATTACK' 
    or PrereqUnitPromotion = 'PROMOTION_CREEPING_ATTACK'
    --naval ranged
    or UnitPromotion = 'PROMOTION_PROXIMITY_FUSES' 
    or PrereqUnitPromotion = 'PROMOTION_PROXIMITY_FUSES'
    --naval raider
    or PrereqUnitPromotion = 'PROMOTION_LOOT'
    or PrereqUnitPromotion = 'PROMOTION_BOARDING'
    or UnitPromotion = 'PROMOTION_SWIFT_KEEL' 
    or PrereqUnitPromotion = 'PROMOTION_SWIFT_KEEL'
    or UnitPromotion = 'PROMOTION_HOMING_TORPEDOES' 
    or PrereqUnitPromotion = 'PROMOTION_HOMING_TORPEDOES'
    or UnitPromotion = 'PROMOTION_OBSERVATION' 
    or PrereqUnitPromotion = 'PROMOTION_OBSERVATION'
    or UnitPromotion = 'PROMOTION_SILENT_RUNNING' 
    or PrereqUnitPromotion = 'PROMOTION_SILENT_RUNNING'
    or UnitPromotion = 'PROMOTION_WOLFPACK'
    ;

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
    -- ('PROMOTION_SNIPER',        'PROMOTION_VOLLEY'),
    -- ('PROMOTION_SNIPER',        'PROMOTION_GARRISON'),
    ('PROMOTION_SUPPRESSION',   'PROMOTION_VOLLEY'),
    ('PROMOTION_SUPPRESSION',   'PROMOTION_GARRISON'),
    ('PROMOTION_INCENDIARIES',  'PROMOTION_VOLLEY'),
    -- ('PROMOTION_ARROW_STORM',   'PROMOTION_SNIPER'),
    ('PROMOTION_ARROW_STORM',   'PROMOTION_SUPPRESSION'),
    -- ('PROMOTION_EMPLACEMENT',   'PROMOTION_SUPPRESSION'),
    ('PROMOTION_EXPERT_MARKSMAN',   'PROMOTION_ARROW_STORM'),
    --anti-cavalry
    ('PROMOTION_REDEPLOY',          'PROMOTION_THRUST'),
    ('PROMOTION_LOGISTICS_SUPPLY',  'PROMOTION_REDEPLOY'),
    ('PROMOTION_LOGISTICS_SUPPLY',  'PROMOTION_SQUARE'),
    ('PROMOTION_HOLD_THE_LINE',     'PROMOTION_LOGISTICS_SUPPLY'),
    --naval melee
    ('PROMOTION_CREEPING_ATTACK',   'PROMOTION_HELMSMAN'),
    ('PROMOTION_AUXILIARY_SHIPS',   'PROMOTION_CREEPING_ATTACK'),
    ('PROMOTION_CONVOY',            'PROMOTION_CREEPING_ATTACK'),
    ('PROMOTION_BATTERING_RAM_TACTICS',     'PROMOTION_AUXILIARY_SHIPS'),
    ('PROMOTION_BATTERING_RAM_TACTICS',     'PROMOTION_CONVOY'),
    --naval ranged
    ('PROMOTION_BULB_BOW',           'PROMOTION_PREPARATORY_FIRE'),
    ('PROMOTION_BULB_BOW',           'PROMOTION_ROLLING_BARRAGE'),
    ('PROMOTION_COINCIDENCE_RANGEFINDING',  'PROMOTION_BULB_BOW'),
    --naval raider
    ('PROMOTION_DAMAGE_CONTROL',     'PROMOTION_SWIFT_KEEL'),
    ('PROMOTION_DAMAGE_CONTROL',     'PROMOTION_SILENT_RUNNING'),
    ('PROMOTION_SILENT_RUNNING',     'PROMOTION_BOARDING_ACTION'),
    ('PROMOTION_SILENT_RUNNING',     'PROMOTION_DAMAGE_CONTROL'),
    ('PROMOTION_LOOT',               'PROMOTION_DAMAGE_CONTROL'),
    ('PROMOTION_AUTO_SOLICITATION',  'PROMOTION_SILENT_RUNNING'),
    ('PROMOTION_WOLFPACK',           'PROMOTION_LOOT'),
    ('PROMOTION_WOLFPACK',           'PROMOTION_AUTO_SOLICITATION');

insert or replace into UnitPromotions
    (UnitPromotionType,             Name,                                           Description,                                        Level,    PromotionClass,                   Column)
values
    --melee
    ('PROMOTION_BATTLE_LINE',       'LOC_PROMOTION_BATTLE_LINE_HD_NAME',            'LOC_PROMOTION_BATTLE_LINE_HD_DESCRIPTION',         2,        'PROMOTION_CLASS_MELEE',          3),
    ('PROMOTION_LONG_MARCH',        'LOC_PROMOTION_LONG_MARCH_HD_NAME',             'LOC_PROMOTION_LONG_MARCH_HD_DESCRIPTION',          3,        'PROMOTION_CLASS_MELEE',          1),
    --ranged
    -- ('PROMOTION_SNIPER',         'LOC_PROMOTION_SNIPER_HD_NAME',                 'LOC_PROMOTION_SNIPER_HD_DESCRIPTION',              2,        'PROMOTION_CLASS_RANGED',         1);
    --anti-cavalry
    ('PROMOTION_LOGISTICS_SUPPLY',  'LOC_PROMOTION_LOGISTICS_SUPPLY_HD_NAME',       'LOC_PROMOTION_LOGISTICS_SUPPLY_HD_DESCRIPTION',    3,        'PROMOTION_CLASS_ANTI_CAVALRY',   3),
    --naval melee
    ('PROMOTION_BATTERING_RAM_TACTICS', 'LOC_PROMOTION_BATTERING_RAM_TACTICS_HD_NAME',  'LOC_PROMOTION_BATTERING_RAM_TACTICS_HD_DESCRIPTION',  4, 'PROMOTION_CLASS_NAVAL_MELEE',    2),
    --naval ranged
    ('PROMOTION_BULB_BOW',          'LOC_PROMOTION_BULB_BOW_HD_NAME',               'LOC_PROMOTION_BULB_BOW_HD_DESCRIPTION',            3,        'PROMOTION_CLASS_NAVAL_RANGED',   3),
    --naval raider
    ('PROMOTION_BOARDING_ACTION',   'LOC_PROMOTION_BOARDING_ACTION_HD_NAME',        'LOC_PROMOTION_BOARDING_ACTION_HD_DESCRIPTION',     1,        'PROMOTION_CLASS_NAVAL_RAIDER',   3),
    ('PROMOTION_DAMAGE_CONTROL',    'LOC_PROMOTION_DAMAGE_CONTROL_HD_NAME',         'LOC_PROMOTION_DAMAGE_CONTROL_HD_DESCRIPTION',      2,        'PROMOTION_CLASS_NAVAL_RAIDER',   1),
    ('PROMOTION_AUTO_SOLICITATION', 'LOC_PROMOTION_AUTO_SOLICITATION_HD_NAME',      'LOC_PROMOTION_AUTO_SOLICITATION_HD_DESCRIPTION',   3,        'PROMOTION_CLASS_NAVAL_RAIDER',   3);

insert or replace into UnitPromotionModifiers
    (UnitPromotionType,             ModifierId)
values
    --melee
    ('PROMOTION_BATTLE_LINE',       'BATTLE_LINE_COMBAT'),
    ('PROMOTION_LONG_MARCH',        'MAMLUK_HEAL_EVERY_MOVE'),
    --ranged
    -- ('PROMOTION_GARRISON',          'GARRISON_LOYALTY_BONUS'),
    -- ('PROMOTION_SNIPER',            'SNIPER_BONUS_VS_WOUNDED_UNITS'),
    ('PROMOTION_SUPPRESSION',       'SUPPRESSION_DEFNECE_BONUS'),
    --anti-cavalry
    -- ('PROMOTION_ECHELON',           'ECHELON_DEFENCE'),
    ('PROMOTION_THRUST',            'THRUST_ATTACK_BONUS'),
    ('PROMOTION_LOGISTICS_SUPPLY',  'LOGISTICS_SUPPLY_HEAL_BONUS'),
    --naval melee
    ('PROMOTION_BATTERING_RAM_TACTICS', 'BREAKTHROUGH_ADDITIONAL_ATTACK'),
    ('PROMOTION_BATTERING_RAM_TACTICS', 'MOD_MOVE_AFTER_ATTACKING'),
    --naval ranged
    ('PROMOTION_BULB_BOW',          'BULB_BOW_BONUS_WATER_MOVEMENT'),
    --naval raider
    ('PROMOTION_SWIFT_KEEL',        'OBSERVATION_INCREASED_SIGHT_RANGE'),
    ('PROMOTION_BOARDING_ACTION',   'BOARDING_ACTION_ATTACK_BONUS'),
    ('PROMOTION_DAMAGE_CONTROL',    'SUPPLY_FLEET_NEUTRAL_TERRITORY_HEAL'),
    ('PROMOTION_DAMAGE_CONTROL',    'SUPPLY_FLEET_ENEMY_TERRITORY_HEAL'),
    ('PROMOTION_LOOT',              'TRADE_ROUTE_PLUNDER_BONUS'),
    ('PROMOTION_AUTO_SOLICITATION', 'WOLFPACK_ADDITIONAL_ATTACK'),
    ('PROMOTION_WOLFPACK',          'WOLFPACK_ADJACENT_BONUS');

insert or replace into Modifiers
    (ModifierId,                                                    ModifierType,                                       OwnerRequirementSetId,  SubjectRequirementSetId)
values
    --melee
    --('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITIES',                    'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'DEFENSE_BONUS_VS_RANGED_AND_CITIES_REQUIREMENTS'),
    ('BATTLE_LINE_COMBAT',                                          'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'BATTLE_LINE_COMBAT_REQUIREMENTS'),
    --ranged
    -- ('GARRISON_LOYALTY_BONUS',                                      'MODIFIER_GARRISON_ADJUST_CITY_LOYALTY',            'PLOT_IS_CITY_CENTER',  'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
    -- ('SNIPER_BONUS_VS_WOUNDED_UNITS',                               'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'BONUS_VS_WOUNDED_UNITS'),
    ('SUPPRESSION_DEFNECE_BONUS',                                   'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'DEFENCE_MELEE_ATTACK_REQUIREMENTS'),
    ('EMPLACEMENT_DEFENSE_BONUS_VS_RANGED',                         'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'TORTOISE_REQUIREMENTS'),
     --anti-cavalry
    -- ('ECHELON_DEFENCE',                                             'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'DEFENCE_MELEE_ATTACK'),
    ('THRUST_ATTACK_BONUS',                                         'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'FASCISM_REQUIREMENTS'),
    ('LOGISTICS_SUPPLY_HEAL_BONUS',                                 'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN',        NULL,                   NULL),
    --naval ranged
    ('BULB_BOW_BONUS_WATER_MOVEMENT',                               'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',             NULL,                   NULL),
    --naval raider
    ('BOARDING_ACTION_ATTACK_BONUS',                                'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL,                   'ATTACK_NAVAL_REQUIREMENTS'),
    ('TRADE_ROUTE_PLUNDER_BONUS',                                   'MODIFIER_PLAYER_UNIT_ADJUST_PLUNDER_YIELDS',       NULL,                   NULL),
    ('WOLFPACK_ADJACENT_BONUS',                                     'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH',     NULL,                   'WOLFPACK_ADJACENT_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                                    Name,            Value)
values
    --melee
    --('TORTOISE_DEFENSE_BONUS_VS_RANGED_AND_CITIES',                    'Amount',        7),
    ('BATTLE_LINE_COMBAT',                                          'Amount',        5),
    -- ('GARRISON_LOYALTY_BONUS',                                      'Amount',        5),
    -- ('SNIPER_BONUS_VS_WOUNDED_UNITS',                               'Amount',        7),
    ('SUPPRESSION_DEFNECE_BONUS',                                   'Amount',        10),
    ('EMPLACEMENT_DEFENSE_BONUS_VS_RANGED',                         'Amount',        10),
     --anti-cavalry
    -- ('ECHELON_DEFENCE',                                             'Amount',        7),
    ('THRUST_ATTACK_BONUS',                                         'Amount',        5),
    ('LOGISTICS_SUPPLY_HEAL_BONUS',                                 'Amount',        10),
    ('LOGISTICS_SUPPLY_HEAL_BONUS',                                 'Type',          'ALL'),
    --naval ranged
    ('BULB_BOW_BONUS_WATER_MOVEMENT',                               'Amount',        1),
     --naval raider
    ('BOARDING_ACTION_ATTACK_BONUS',                                'Amount',        10),
    ('TRADE_ROUTE_PLUNDER_BONUS',                                   'Amount',        100),
    ('WOLFPACK_ADJACENT_BONUS',                                     'Amount',        2);


---------------------------------------------------------------------------------------------------------------
-- Recon, light & heavy Cavalry, Siege                                                                       --
---------------------------------------------------------------------------------------------------------------
-- Ability
delete from TypeTags where Type = 'UNIT_SCOUT' and Tag = 'CLASS_REVEAL_STEALTH';
insert or replace into TypeTags
    (Type,                                                      Tag)
values
    -- recon
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',                    'CLASS_RECON'),
    -- siege
    -- ('ABILITY_SIEGE_CAVALRY_MOVEMENT_HD',                       'CLASS_SIEGE'),
    -- heavy
    ('ABILITY_HEAVY_CHARIOT',                                   'CLASS_HEAVY_CAVALRY'),
    -- light
    ('ABILITY_LIGHT_CAVALRY_HD',                                'CLASS_LIGHT_CAVALRY');

insert or replace into UnitAbilities 
    (UnitAbilityType,                               Name,       Description,                                                     Inactive) 
values
    -- recon
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',        NULL,       'LOC_ABILITY_RECON_IGNORE_TERRIAN_COST_HD_DESCRIPTION',          0),
    ('ABILITY_LIGHT_CAVALRY_HD',                    NULL,       'LOC_ABILITY_LIGHT_CAVALRY_HD_DESCRIPTION',                      0),
    ('ABILITY_SIEGE_CAVALRY_MOVEMENT_HD',           NULL,       'LOC_ABILITY_SIEGE_CAVALRY_MOVEMENT_HD_DESCRIPTION',             0);

insert or replace into UnitAbilityModifiers
    (UnitAbilityType,                                       ModifierId)
values
    -- recon
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',                'HD_RECON_IGNORE_HILLS_MOVEMENT_PENALTY'),
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',                'HD_RECON_IGNORE_FOREST_MOVEMENT_PENALTY'),
    -- light
    ('ABILITY_LIGHT_CAVALRY_HD',                            'HD_LIGHT_CAVALRY_ADVANCED_PILLAGING'),
    -- siege
    ('ABILITY_SIEGE_CAVALRY_MOVEMENT_HD',                   'HD_SIEGE_CAVALRY_MOVEMENT');

-- Promotions
insert or replace into Types
    (Type,                                                      Kind)
values
    -- recon
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',                    'KIND_ABILITY'),
    ('ABILITY_LIGHT_CAVALRY_HD',                                'KIND_ABILITY'),
    ('ABILITY_SIEGE_CAVALRY_MOVEMENT_HD',                       'KIND_ABILITY'),
    ('PROMOTION_RECON_TRAVEL_LIGHT',                            'KIND_PROMOTION'),
    ('PROMOTION_RECON_RAPID_FIRE',                              'KIND_PROMOTION'),
    ('PROMOTION_RECON_ACCURATE',                                'KIND_PROMOTION'),
    ('PROMOTION_LIGHTC_SHOCK',                                  'KIND_PROMOTION'),
    ('PROMOTION_LIGHTC_MOBILE_WARFARE',                         'KIND_PROMOTION');

update UnitPromotions set Level = 1 where UnitPromotionType = 'PROMOTION_SENTRY';
update UnitPromotions set Level = 2 where UnitPromotionType = 'PROMOTION_SPYGLASS';
update UnitPromotions set Column = 2 where UnitPromotionType = 'PROMOTION_AMBUSH';
update UnitPromotions set Column = 3 where UnitPromotionType = 'PROMOTION_MARAUDING';
update UnitPromotions set Column = 1 where UnitPromotionType = 'PROMOTION_ROUT';
-- update UnitPromotions set Level = 1 where UnitPromotionType = 'PROMOTION_DEPREDATION';

insert or replace into UnitPromotions
    (UnitPromotionType,                 Name,                                       Description,                                        Level,  PromotionClass,                     Column)
values
    -- Recon
    ('PROMOTION_RECON_TRAVEL_LIGHT',    'LOC_PROMOTION_RECON_TRAVEL_LIGHT_NAME',    'LOC_PROMOTION_RECON_TRAVEL_LIGHT_DESCRIPTION',     1,      'PROMOTION_CLASS_RECON',            3),
    ('PROMOTION_RECON_RAPID_FIRE',      'LOC_PROMOTION_RECON_RAPID_FIRE_NAME',      'LOC_PROMOTION_RECON_RAPID_FIRE_DESCRIPTION',       4,      'PROMOTION_CLASS_RECON',            1),
    ('PROMOTION_RECON_ACCURATE',        'LOC_PROMOTION_RECON_ACCURATE_NAME',        'LOC_PROMOTION_RECON_ACCURATE_DESCRIPTION',         4,      'PROMOTION_CLASS_RECON',            3),
    -- Light
    ('PROMOTION_LIGHTC_SHOCK',          'LOC_PROMOTION_LIGHTC_SHOCK_NAME',          'LOC_PROMOTION_LIGHTC_SHOCK_DESCRIPTION',           1,      'PROMOTION_CLASS_LIGHT_CAVALRY',    1),
    ('PROMOTION_LIGHTC_MOBILE_WARFARE', 'LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_NAME', 'LOC_PROMOTION_LIGHTC_MOBILE_WARFARE_DESCRIPTION',  3,      'PROMOTION_CLASS_LIGHT_CAVALRY',    1);

delete from UnitPromotionPrereqs where UnitPromotion = 'PROMOTION_CAMOUFLAGE';
delete from UnitPromotionPrereqs where PrereqUnitPromotion = 'PROMOTION_RANGER' or PrereqUnitPromotion = 'PROMOTION_ALPINE';
-- Heavy
update UnitPromotionPrereqs set UnitPromotion = 'PROMOTION_ROUT' where UnitPromotion = 'PROMOTION_MARAUDING' and PrereqUnitPromotion = 'PROMOTION_CHARGE';
update UnitPromotionPrereqs set UnitPromotion = 'PROMOTION_MARAUDING' where UnitPromotion = 'PROMOTION_ROUT' and PrereqUnitPromotion = 'PROMOTION_BARDING';
update UnitPromotionPrereqs set PrereqUnitPromotion = 'PROMOTION_ROUT' where UnitPromotion = 'PROMOTION_ARMOR_PIERCING' and PrereqUnitPromotion = 'PROMOTION_MARAUDING';
update UnitPromotionPrereqs set PrereqUnitPromotion = 'PROMOTION_MARAUDING' where UnitPromotion = 'PROMOTION_REACTIVE_ARMOR' and PrereqUnitPromotion = 'PROMOTION_ROUT';
-- Light
update UnitPromotionPrereqs set PrereqUnitPromotion = 'PROMOTION_LIGHTC_SHOCK' where PrereqUnitPromotion = 'PROMOTION_CAPARISON';
update UnitPromotionPrereqs set UnitPromotion = 'PROMOTION_LIGHTC_MOBILE_WARFARE' where UnitPromotion = 'PROMOTION_SPIKING_THE_GUNS';
update UnitPromotionPrereqs set PrereqUnitPromotion = 'PROMOTION_LIGHTC_MOBILE_WARFARE' where PrereqUnitPromotion = 'PROMOTION_SPIKING_THE_GUNS';

insert or replace into UnitPromotionPrereqs
    (UnitPromotion,                 PrereqUnitPromotion)
values
    -- recon
    ('PROMOTION_GUERRILLA',         'PROMOTION_RECON_TRAVEL_LIGHT'),
    ('PROMOTION_AMBUSH',            'PROMOTION_SPYGLASS'),
    ('PROMOTION_RECON_RAPID_FIRE',  'PROMOTION_AMBUSH'),
    ('PROMOTION_RECON_ACCURATE',    'PROMOTION_AMBUSH');

-- Remove unused promotions
delete from UnitPromotions where UnitPromotionType = 'PROMOTION_RANGER' or UnitPromotionType = 'PROMOTION_ALPINE' or UnitPromotionType = 'PROMOTION_CAMOUFLAGE';
delete from UnitPromotions where UnitPromotionType = 'PROMOTION_CAPARISON' or UnitPromotionType = 'PROMOTION_SPIKING_THE_GUNS';

update ModifierArguments set Value = 5 where ModifierId = 'AMBUSH_INCREASED_COMBAT_STRENGTH' and Name = 'Amount';
update ModifierArguments set Value = 7 where ModifierId = 'SHELLS_BONUS_VS_DISTRICTS' and Name = 'Amount';
-- update ModifierArguments set Value = 7 where ModifierId = 'TOP_COVER_DEFENSE_BONUS_VS_RANGED' and Name = 'Amount';
delete from UnitPromotionModifiers where UnitPromotionType = 'PROMOTION_ARMOR_PIERCING';
delete from UnitPromotionModifiers where UnitPromotionType = 'PROMOTION_REACTIVE_ARMOR';
delete from UnitPromotionModifiers where UnitPromotionType = 'PROMOTION_EXPERT_CREW' and ModifierId = 'EXPERT_CREW_BONUS_ATTACK_AFTER_MOVING';
delete from UnitPromotionModifiers where UnitPromotionType = 'PROMOTION_DEPREDATION';
delete from UnitPromotionModifiers where UnitPromotionType = 'PROMOTION_PURSUIT';

insert or replace into UnitPromotionModifiers
    (UnitPromotionType,                 ModifierId)
values
    ('PROMOTION_SENTRY',                'SPYGLASS_BONUS_SIGHT'),
    ('PROMOTION_RECON_TRAVEL_LIGHT',    'TRAVEL_LIGHT_BONUS_MOVEMENT'),
    -- ('PROMOTION_RECON_TRAVEL_LIGHT',    'TRAVEL_LIGHT_IGNORE_ZOC'),
    ('PROMOTION_SPYGLASS',              'SPYGLASS_SEE_HIDDEN'),
    ('PROMOTION_GUERRILLA',             'GUERRILLA_ATTACK_BUFF_HD'),
    ('PROMOTION_AMBUSH',                'AMBUSH_STEALTH'),
    ('PROMOTION_RECON_RAPID_FIRE',      'RAPID_FIRE_ADDITIONAL_ATTACK'),
    ('PROMOTION_RECON_ACCURATE',        'ACCURATE_BONUS_RANGE'),
    -- Heavy Cavalry
    ('PROMOTION_ARMOR_PIERCING',        'ARMOR_PIERCING_ATTACK_BONUS'),
    ('PROMOTION_ARMOR_PIERCING',        'ARMOR_PIERCING_ATTACK_BONUS_HIGHER_STRENGTH'),
    ('PROMOTION_REACTIVE_ARMOR',        'REACTIVE_ARMOR_DEFEND_BONUS'),
    ('PROMOTION_REACTIVE_ARMOR',        'REACTIVE_ARMOR_DEFEND_BONUS_HIGHER_STRENGTH'),
    -- Light
    ('PROMOTION_LIGHTC_SHOCK',          'SHOCK_OPEN_AREA_STRENGTH'),
    ('PROMOTION_DEPREDATION',           'DEPREDATION_ENEMY_TERRITORY_STRENGTH'),
    ('PROMOTION_LIGHTC_MOBILE_WARFARE', 'PURSUIT_BONUS_MOVEMENT'),
    ('PROMOTION_LIGHTC_MOBILE_WARFARE', 'FADE_BONUS_MOVE_AFTER_ATTACKING'),
    ('PROMOTION_PURSUIT',               'PURSUIT_BONUS_VS_WOUNDED_UNITS'),
    ('PROMOTION_ESCORT_MOBILITY',       'ESCORT_BONUS_IN_FORMATION'),
    -- Siege
    -- ('PROMOTION_EXPERT_CREW',           'EXPERT_CREW_BONUS_VS_FORTIFIED'),
    ('PROMOTION_EXPERT_CREW',           'EXPERT_CREW_BONUS_VS_DISTRICTS');

insert or replace into Modifiers
    (ModifierId,                                            ModifierType)
values
    -- recon
    ('TRAVEL_LIGHT_BONUS_MOVEMENT',                         'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT'),
    ('TRAVEL_LIGHT_IGNORE_ZOC',                             'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_ZOC'),
    ('SPYGLASS_SEE_HIDDEN',                                 'MODIFIER_PLAYER_UNIT_ADJUST_SEE_HIDDEN'),
    ('AMBUSH_STEALTH',                                      'MODIFIER_PLAYER_UNIT_ADJUST_HIDDEN_VISIBILITY'),
    ('RAPID_FIRE_ADDITIONAL_ATTACK',                        'MODIFIER_UNIT_ADJUST_NUM_ATTACKS'),
    ('ACCURATE_BONUS_RANGE',                                'MODIFIER_UNIT_ADJUST_ATTACK_RANGE'),
    ('HD_RECON_LOWER_MOVEMENT',                             'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT'),
    ('HD_RECON_IGNORE_HILLS_MOVEMENT_PENALTY',              'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST'),
    ('HD_RECON_IGNORE_FOREST_MOVEMENT_PENALTY',             'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST'),
    ('HD_LIGHT_CAVALRY_ADVANCED_PILLAGING',                 'MODIFIER_PLAYER_UNIT_ADJUST_ADVANCED_PILLAGING');

insert or replace into Modifiers
    (ModifierId,                                            ModifierType,                               SubjectRequirementSetId)
values
    ('GUERRILLA_ATTACK_BUFF_HD',                            'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'HD_UNIT_ATTACKING_REQUIREMENTS'),
    -- 
    ('ARMOR_PIERCING_ATTACK_BONUS',                         'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'HD_UNIT_ATTACKING_REQUIREMENTS'),
    ('ARMOR_PIERCING_ATTACK_BONUS_HIGHER_STRENGTH',         'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'HD_UNIT_ATTACK_WEAKER_UNIT_REQUIREMENTS'),
    ('REACTIVE_ARMOR_DEFEND_BONUS',                         'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'HD_UNIT_DEFENDING_REQUIREMENTS'),
    ('REACTIVE_ARMOR_DEFEND_BONUS_HIGHER_STRENGTH',         'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'HD_UNIT_DEFEND_WEAKER_OPPONENT_REQUIREMENTS'),
    -- 
    ('SHOCK_OPEN_AREA_STRENGTH',                            'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'PLOT_IS_OPEN_AREA_REQUIREMENTS'),
    ('DEPREDATION_ENEMY_TERRITORY_STRENGTH',                'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'BERSERKER_PLOT_IS_ENEMY_TERRITORY'),
    ('PURSUIT_BONUS_VS_WOUNDED_UNITS',                      'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'REQUIREMENTS_OPPONENT_IS_WOUNDED'),
    ('ESCORT_BONUS_IN_FORMATION',                           'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'CONVOY_REQUIREMENTS'),
    -- 
    ('HD_SIEGE_CAVALRY_MOVEMENT',                           'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',     'HD_NEAR_CAVALRY_REQUIREMENTS'),
    -- ('EXPERT_CREW_BONUS_VS_FORTIFIED',                      'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'CHARGE_REQUIREMENTS'),
    ('EXPERT_CREW_BONUS_VS_DISTRICTS',                      'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'SHELLS_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                            Name,           Value)
values
    -- recon
    ('TRAVEL_LIGHT_BONUS_MOVEMENT',                         'Amount',       1),
    ('TRAVEL_LIGHT_IGNORE_ZOC',                             'Ignore',       1),
    ('SPYGLASS_SEE_HIDDEN',                                 'SeeHidden',    1),
    ('GUERRILLA_ATTACK_BUFF_HD',                            'Amount',       5),
    ('AMBUSH_STEALTH',                                      'Hidden',       1),
    ('RAPID_FIRE_ADDITIONAL_ATTACK',                        'Amount',       1),
    ('ACCURATE_BONUS_RANGE',                                'Amount',       1),
    ('HD_RECON_IGNORE_HILLS_MOVEMENT_PENALTY',              'Ignore',       1),
    ('HD_RECON_IGNORE_HILLS_MOVEMENT_PENALTY',              'Type',         'HILLS'),
    ('HD_RECON_IGNORE_FOREST_MOVEMENT_PENALTY',             'Ignore',       1),
    ('HD_RECON_IGNORE_FOREST_MOVEMENT_PENALTY',             'Type',         'FOREST'),
    -- heavy
    ('ARMOR_PIERCING_ATTACK_BONUS',                         'Amount',       5),
    ('ARMOR_PIERCING_ATTACK_BONUS_HIGHER_STRENGTH',         'Amount',       5),
    ('REACTIVE_ARMOR_DEFEND_BONUS',                         'Amount',       5),
    ('REACTIVE_ARMOR_DEFEND_BONUS_HIGHER_STRENGTH',         'Amount',       5),
    -- light
    ('HD_LIGHT_CAVALRY_ADVANCED_PILLAGING',                 'UseAdvancedPillaging', 1),
    ('SHOCK_OPEN_AREA_STRENGTH',                            'Amount',       5),
    ('DEPREDATION_ENEMY_TERRITORY_STRENGTH',                'Amount',       5),
    ('PURSUIT_BONUS_VS_WOUNDED_UNITS',                      'Amount',       7),
    ('ESCORT_BONUS_IN_FORMATION',                           'Amount',       7),
    -- siege
    ('HD_SIEGE_CAVALRY_MOVEMENT',                           'Amount',       1),
    ('EXPERT_CREW_BONUS_VS_DISTRICTS',                      'Amount',       10);

insert or replace into ModifierStrings
    (ModifierId,                                            Context,    Text)
values
    ('GUERRILLA_ATTACK_BUFF_HD',                            'Preview',  '+{1_Amount} {LOC_PROMOTION_GUERRILLA_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('ARMOR_PIERCING_ATTACK_BONUS',                         'Preview',  '+{1_Amount} {LOC_PROMOTION_ARMOR_PIERCING_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('ARMOR_PIERCING_ATTACK_BONUS_HIGHER_STRENGTH',         'Preview',  '+{1_Amount} {LOC_PROMOTION_ARMOR_PIERCING_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('REACTIVE_ARMOR_DEFEND_BONUS',                         'Preview',  '+{1_Amount} {LOC_PROMOTION_REACTIVE_ARMOR_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('REACTIVE_ARMOR_DEFEND_BONUS_HIGHER_STRENGTH',         'Preview',  '+{1_Amount} {LOC_PROMOTION_REACTIVE_ARMOR_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('SHOCK_OPEN_AREA_STRENGTH',                            'Preview',  '+{1_Amount} {LOC_PROMOTION_LIGHTC_SHOCK_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('DEPREDATION_ENEMY_TERRITORY_STRENGTH',                'Preview',  '+{1_Amount} {LOC_PROMOTION_DEPREDATION_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('PURSUIT_BONUS_VS_WOUNDED_UNITS',                      'Preview',  '+{1_Amount} {LOC_PROMOTION_PURSUIT_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('ESCORT_BONUS_IN_FORMATION',                           'Preview',  '+{1_Amount} {LOC_PROMOTION_ESCORT_MOBILITY_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}'),
    ('EXPERT_CREW_BONUS_VS_DISTRICTS',                      'Preview',  '+{1_Amount} {LOC_PROMOTION_EXPERT_CREW_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}');

--------------------------------------------------------------------------------------------------------------
-- Requirements
insert or replace into RequirementSets
    (RequirementSetId,                              RequirementSetType)
values
    ('HD_UNIT_ATTACKING_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL'),
    ('HD_UNIT_DEFENDING_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL'),
    -- 
    ('HD_UNIT_ATTACKING_UNIT_REQUIREMENTS',         'REQUIREMENTSET_TEST_ALL'),
    ('HD_UNIT_ATTACK_WEAKER_UNIT_REQUIREMENTS',     'REQUIREMENTSET_TEST_ALL'),
    ('HD_UNIT_DEFEND_WEAKER_OPPONENT_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
    -- 
    ('ANTI_CAVALRY_DEFEND_OPPONENT_REQUIREMENTS',   'REQUIREMENTSET_TEST_ALL'),
    -- 
    -- ('HD_SHOCK_REQUIREMENTS',                       'REQUIREMENTSET_TEST_ALL'),
    -- 
    ('HD_NEAR_CAVALRY_REQUIREMENTS',                'REQUIREMENTSET_TEST_ANY');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                              RequirementId)
values
    ('HD_UNIT_ATTACKING_REQUIREMENTS',              'PLAYER_IS_ATTACKER_REQUIREMENTS'),
    ('HD_UNIT_DEFENDING_REQUIREMENTS',              'PLAYER_IS_DEFENDER_REQUIREMENTS'),
    -- 
    ('HD_UNIT_ATTACKING_UNIT_REQUIREMENTS',         'PLAYER_IS_ATTACKER_REQUIREMENTS'),
    ('HD_UNIT_ATTACKING_UNIT_REQUIREMENTS',         'OPPONENT_IS_NOT_DISTRICT'),
    ('HD_UNIT_ATTACK_WEAKER_UNIT_REQUIREMENTS',     'REQUIRES_COMBAT_AGAINST_WEAKER_OPPONENT'),
    ('HD_UNIT_ATTACK_WEAKER_UNIT_REQUIREMENTS',     'PLAYER_IS_ATTACKER_REQUIREMENTS'),
    ('HD_UNIT_ATTACK_WEAKER_UNIT_REQUIREMENTS',     'OPPONENT_IS_NOT_DISTRICT'),
    ('HD_UNIT_DEFEND_WEAKER_OPPONENT_REQUIREMENTS', 'REQUIRES_COMBAT_AGAINST_WEAKER_OPPONENT'),
    ('HD_UNIT_DEFEND_WEAKER_OPPONENT_REQUIREMENTS', 'PLAYER_IS_DEFENDER_REQUIREMENTS'),
    -- 
    ('ANTI_CAVALRY_DEFEND_OPPONENT_REQUIREMENTS',   'PLAYER_IS_DEFENDER_REQUIREMENTS'),
    ('ANTI_CAVALRY_DEFEND_OPPONENT_REQUIREMENTS',   'REQUIRES_OPPONENT_IS_CAVALRY'),
    -- ('HD_SHOCK_REQUIREMENTS',                       'REQUIRES_PLOT_IS_FLAT'),
    -- 
    ('HD_NEAR_CAVALRY_REQUIREMENTS',                'REQUIRES_LIGHT_CAVALRY_NEXT_TO_OWNER'),
    ('HD_NEAR_CAVALRY_REQUIREMENTS',                'REQUIRES_HEAVY_CAVALRY_NEXT_TO_OWNER');

insert or replace into Requirements
    (RequirementId,                                 RequirementType,                                        Inverse)
values
    ('REQUIRES_COMBAT_AGAINST_WEAKER_OPPONENT',     'REQUIREMENT_OPPONENT_IS_STRONGER',                     1),
    ('REQUIRES_LIGHT_CAVALRY_NEXT_TO_OWNER',        'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',  0),
    ('REQUIRES_HEAVY_CAVALRY_NEXT_TO_OWNER',        'REQUIREMENT_PLOT_ADJACENT_FRIENDLY_UNIT_TAG_MATCHES',  0);

insert or replace into RequirementArguments
    (RequirementId,                                 Name,       Value)
values
    ('REQUIRES_LIGHT_CAVALRY_NEXT_TO_OWNER',        'Tag',      'CLASS_LIGHT_CAVALRY'),
    ('REQUIRES_HEAVY_CAVALRY_NEXT_TO_OWNER',        'Tag',      'CLASS_HEAVY_CAVALRY');
