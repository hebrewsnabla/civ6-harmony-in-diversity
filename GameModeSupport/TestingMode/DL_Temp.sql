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

-- Combat Strength Adjustments.
update Units set Combat = Combat + 1 where Combat > 25 and PromotionClass = 'PROMOTION_CLASS_MELEE';
-- update Units set Combat = Combat + 2, RangedCombat = RangedCombat + 2 where Combat < 20 and PromotionClass = 'PROMOTION_CLASS_RANGED';

-- Ability from Basilikoi
insert or replace into TypeTags
    (Type,                                                              Tag)
values
    ('ABILITY_BASILIKOI_TRAINED_UNIT_XP',                               'CLASS_LIGHT_CAVALRY'),
    ('ABILITY_BASILIKOI_TRAINED_UNIT_XP',                               'CLASS_HEAVY_CAVALRY'),
    ('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',                         'CLASS_LIGHT_CAVALRY'),
    ('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',                         'CLASS_HEAVY_CAVALRY');

-- Levy Units
update GlobalParameters set Value = 20 where Name = 'LEVY_MILITARY_TURN_DURATION';

insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('TRAIT_LEADER_MAJOR_CIV',              'TRAIT_LEVY_DEBUFF_IN_ENEMY_TERRITORY');

insert or replace into Modifiers
    (ModifierId,                                            ModifierType,                                       SubjectRequirementSetId)
values
    ('TRAIT_LEVY_DEBUFF_IN_ENEMY_TERRITORY',                'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',              'REQUIREMENTS_UNIT_IS_LEVIED_AND_IN_ENEMY_TERRITORY'),
    ('LEVY_DEBUFF_IN_ENEMY_TERRITORY',                      'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',             NULL);

insert or replace into ModifierArguments
    (ModifierId,                                            Name,           Value)
values
    ('TRAIT_LEVY_DEBUFF_IN_ENEMY_TERRITORY',                'AbilityType',  'ABILITY_LEVY_DEBUFF_IN_ENEMY_TERRITORY'),
    ('LEVY_DEBUFF_IN_ENEMY_TERRITORY',                      'Amount',       -5);

insert or replace into ModifierStrings
    (ModifierId,                                            Context,    Text)
values
    ('LEVY_DEBUFF_IN_ENEMY_TERRITORY',                      'Preview',  '{1_Amount} {LOC_LEVY_DEBUFF_IN_ENEMY_TERRITORY_PREVIEW_TEXT}');

insert or ignore into Requirements
	(RequirementId,									RequirementType)
values
	('UNIT_IN_ENEMY_TERRITORY_REQUIREMENT',			'REQUIREMENT_UNIT_IN_ENEMY_TERRITORY');

insert or replace into RequirementSets
    (RequirementSetId,                                          RequirementSetType)
values
    ('REQUIREMENTS_UNIT_IS_LEVIED_AND_IN_ENEMY_TERRITORY',      'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                          RequirementId)
values
    ('REQUIREMENTS_UNIT_IS_LEVIED_AND_IN_ENEMY_TERRITORY',      'REQUIRES_UNIT_IS_LEVIED_XP2'),
    ('REQUIREMENTS_UNIT_IS_LEVIED_AND_IN_ENEMY_TERRITORY',      'UNIT_IN_ENEMY_TERRITORY_REQUIREMENT');