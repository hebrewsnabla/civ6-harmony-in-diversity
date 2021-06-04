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
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',                    'CLASS_RECON');

insert or replace into UnitAbilities 
    (UnitAbilityType,                               Name,       Description,                                                     Inactive) 
values
    -- recon
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',        NULL,       'LOC_ABILITY_RECON_IGNORE_TERRIAN_COST_HD_DESCRIPTION',          0);

insert or replace into UnitAbilityModifiers
    (UnitAbilityType,                                       ModifierId)
values
    -- recon
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',                'HD_RECON_IGNORE_HILLS_MOVEMENT_PENALTY'),
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',                'HD_RECON_IGNORE_FOREST_MOVEMENT_PENALTY');

-- Promotions
insert or replace into Types
    (Type,                                                      Kind)
values
    -- recon
    ('ABILITY_RECON_IGNORE_TERRIAN_COST_HD',                    'KIND_ABILITY'),
    ('PROMOTION_RECON_TRAVEL_LIGHT',                            'KIND_PROMOTION'),
    ('PROMOTION_RECON_RAPID_FIRE',                              'KIND_PROMOTION'),
    ('PROMOTION_RECON_ACCURATE',                                'KIND_PROMOTION');

delete from UnitPromotions where UnitPromotionType = 'PROMOTION_RANGER' or UnitPromotionType = 'PROMOTION_ALPINE' or UnitPromotionType = 'PROMOTION_CAMOUFLAGE';
update UnitPromotions set Level = 1 where UnitPromotionType = 'PROMOTION_SENTRY';
update UnitPromotions set Level = 2 where UnitPromotionType = 'PROMOTION_SPYGLASS';
update UnitPromotions set Column = 2 where UnitPromotionType = 'PROMOTION_AMBUSH';

insert or replace into UnitPromotions
    (UnitPromotionType,                 Name,                                       Description,                                    Level,  PromotionClass,             Column)
values
    ('PROMOTION_RECON_TRAVEL_LIGHT',    'LOC_PROMOTION_RECON_TRAVEL_LIGHT_NAME',    'LOC_PROMOTION_RECON_TRAVEL_LIGHT_DESCRIPTION', 1,      'PROMOTION_CLASS_RECON',    3),
    ('PROMOTION_RECON_RAPID_FIRE',      'LOC_PROMOTION_RECON_RAPID_FIRE_NAME',      'LOC_PROMOTION_RECON_RAPID_FIRE_DESCRIPTION',   4,      'PROMOTION_CLASS_RECON',    1),
    ('PROMOTION_RECON_ACCURATE',        'LOC_PROMOTION_RECON_ACCURATE_NAME',        'LOC_PROMOTION_RECON_ACCURATE_DESCRIPTION',     4,      'PROMOTION_CLASS_RECON',    3);

delete from UnitPromotionPrereqs where UnitPromotion = 'PROMOTION_CAMOUFLAGE';
delete from UnitPromotionPrereqs where PrereqUnitPromotion = 'PROMOTION_RANGER' or PrereqUnitPromotion = 'PROMOTION_ALPINE';
insert or replace into UnitPromotionPrereqs
    (UnitPromotion,                 PrereqUnitPromotion)
values
    -- recon
    ('PROMOTION_GUERRILLA',         'PROMOTION_RECON_TRAVEL_LIGHT'),
    ('PROMOTION_AMBUSH',            'PROMOTION_SPYGLASS'),
    ('PROMOTION_RECON_RAPID_FIRE',  'PROMOTION_AMBUSH'),
    ('PROMOTION_RECON_ACCURATE',    'PROMOTION_AMBUSH');

update ModifierArguments set Value = 5 where ModifierId = 'AMBUSH_INCREASED_COMBAT_STRENGTH' and Name = 'Amount';
insert or replace into UnitPromotionModifiers
    (UnitPromotionType,                 ModifierId)
values
    ('PROMOTION_SENTRY',                'SPYGLASS_BONUS_SIGHT'),
    ('PROMOTION_RECON_TRAVEL_LIGHT',    'TRAVEL_LIGHT_BONUS_MOVEMENT'),
    ('PROMOTION_RECON_TRAVEL_LIGHT',    'TRAVEL_LIGHT_IGNORE_ZOC'),
    ('PROMOTION_SPYGLASS',              'SPYGLASS_SEE_HIDDEN'),
    ('PROMOTION_GUERRILLA',             'GUERRILLA_ATTACK_BUFF_HD'),
    ('PROMOTION_AMBUSH',                'AMBUSH_STEALTH'),
    ('PROMOTION_RECON_RAPID_FIRE',      'RAPID_FIRE_ADDITIONAL_ATTACK'),
    ('PROMOTION_RECON_ACCURATE',        'ACCURATE_BONUS_RANGE');

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
    ('HD_RECON_IGNORE_FOREST_MOVEMENT_PENALTY',             'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST');

insert or replace into Modifiers
    (ModifierId,                                            ModifierType,                               SubjectRequirementSetId)
values
    ('GUERRILLA_ATTACK_BUFF_HD',                            'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'HD_UNIT_ATTACKING_REQUIREMENTS');

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
    ('HD_RECON_IGNORE_FOREST_MOVEMENT_PENALTY',             'Type',         'FOREST');

insert or replace into ModifierStrings
    (ModifierId,                                            Context,    Text)
values
    ('GUERRILLA_ATTACK_BUFF_HD',                            'Preview',  '+{1_Amount} {LOC_PROMOTION_GUERRILLA_NAME} {LOC_PROMOTION_DESCRIPTOR_PREVIEW_TEXT}');

insert or replace into RequirementSets
    (RequirementSetId,                  RequirementSetType)
values
    ('HD_UNIT_ATTACKING_REQUIREMENTS',  'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                  RequirementId)
values
    ('HD_UNIT_ATTACKING_REQUIREMENTS',  'PLAYER_IS_ATTACKER_REQUIREMENTS');
