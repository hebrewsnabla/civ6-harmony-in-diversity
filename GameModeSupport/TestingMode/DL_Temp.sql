-------------------------------------
--     Temp Testing Adjustments    --
-------------------------------------

-- insert or replace into Improvement_ValidResources
--     (ImprovementType,       ResourceType,           MustRemoveFeature)
-- values
--     ('IMPROVEMENT_FORT',    'RESOURCE_ALUMINUM',    0),
--     ('IMPROVEMENT_FORT',    'RESOURCE_COAL',        0),
--     ('IMPROVEMENT_FORT',    'RESOURCE_IRON',        1),
--     ('IMPROVEMENT_FORT',    'RESOURCE_NITER',       0),
--     ('IMPROVEMENT_FORT',    'RESOURCE_URANIUM',     0),
--     ('IMPROVEMENT_FORT',    'RESOURCE_HORSES',      0),
--     ('IMPROVEMENT_FORT',    'RESOURCE_OIL',         0);

-- update Eras_XP1 set GameEraMinimumTurns = 15 where not EraType = 'ERA_FUTURE';

-- can have 2 units on the same plot.
-- update GlobalParameters set Value = 2 where Name = 'PLOT_UNIT_LIMIT';

-- update GlobalParameters set Value = 5 where Name = 'COMBAT_GARRISON_MILITIA_MODIFIER';

-- identity
update GlobalParameters set Value = Value * 2 where
    Name = 'LOYALTY_MAXIMUM' or
    Name = 'LOYALTY_START' or
    Name = 'LOYALTY_AFTER_TRANSFERRED_BY_COMBAT' or
    Name = 'LOYALTY_AFTER_TRANSFERRED_BY_COMBAT_ORIGINAL_OWNER' or
    Name = 'LOYALTY_AFTER_TRANSFERRED_BY_COMBAT_OWNER_BEFORE_OCCUPATION' or
    Name = 'LOYALTY_AFTER_TRANSFERRED_BY_LIBERATION' or
    Name = 'LOYALTY_AFTER_TRANSFERRED_BY_CULTURAL_IDENTITY' or
    Name = 'ESPIONAGE_FOMENT_UNREST_BASE_LOYALTY_CHANGE' or
    Name = 'ESPIONAGE_FOMENT_UNREST_LEVEL_LOYALTY_CHANGE';

update GlobalParameters set Value = 80 where Name = 'LOYALTY_AFTER_TRANSFERRED_BY_COMBAT';
update GlobalParameters set Value = 120 where Name = 'LOYALTY_AFTER_TRANSFERRED_BY_COMBAT_ORIGINAL_OWNER';
-- update GlobalParameters set Value = 100 where Name = 'LOYALTY_AFTER_TRANSFERRED_BY_COMBAT_OWNER_BEFORE_OCCUPATION';

insert or replace into Types (Type, Kind) values ('LOYALTY_LEVEL_4', 'KIND_LOYALTY_LEVEL');

insert or replace into LoyaltyLevels
    (LoyaltyLevelType,  YieldChange,    GrowthChange,  Name,    Description,        LoyaltyMax,     LoyaltyMin,     IdentityChange)
values
    ('LOYALTY_LEVEL_0', -1,         0,    'LOC_LOYALTY_LEVEL_0_NAME',    'LOC_LOYALTY_LEVEL_0_DESCRIPTION',  50,     0,     0.25),
    ('LOYALTY_LEVEL_1', -0.75,      0.25, 'LOC_LOYALTY_LEVEL_1_NAME',    'LOC_LOYALTY_LEVEL_1_DESCRIPTION',  100,    51,    0.5),
    ('LOYALTY_LEVEL_2', -0.5,       0.5,  'LOC_LOYALTY_LEVEL_2_NAME',    'LOC_LOYALTY_LEVEL_2_DESCRIPTION',  150,    101,   0.75),
    ('LOYALTY_LEVEL_3', -0.25,      0.75, 'LOC_LOYALTY_LEVEL_3_NAME',    'LOC_LOYALTY_LEVEL_3_DESCRIPTION',  175,    151,   0),
    ('LOYALTY_LEVEL_4', 0,          1,    'LOC_LOYALTY_LEVEL_4_NAME',    'LOC_LOYALTY_LEVEL_4_DESCRIPTION',  200,    176,   0);

UPDATE PseudoYields SET DefaultValue = 1.33 WHERE PseudoYieldType = 'PSEUDOYIELD_STANDING_ARMY_NUMBER'; --  1 -- controls size of the army
UPDATE PseudoYields SET DefaultValue = 0.15 WHERE PseudoYieldType = 'PSEUDOYIELD_STANDING_ARMY_VALUE'; --   0.1 -- controls size of the army

---------------------------------------------------------------------------------------------------------------
-- Ability
delete from TypeTags where Type = 'UNIT_SCOUT' and Tag = 'CLASS_REVEAL_STEALTH';
insert or replace into TypeTags
    (Type,                                                      Tag)
values
    -- recon
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',                    'CLASS_RECON'),
    -- heavy
    ('ABILITY_HEAVY_CHARIOT',                                   'CLASS_HEAVY_CAVALRY'),
    -- light
    ('ABILITY_LIGHT_CAVALRY_HD',                                'CLASS_LIGHT_CAVALRY'),
    -- siege
    ('ABILITY_SIEGE_CAVALRY_MOVEMENT_HD',                       'CLASS_SIEGE');

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
