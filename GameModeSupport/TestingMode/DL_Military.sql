-------------------------------------
--      All Testing Adjustments    --
-------------------------------------

-- update Units set Cost = round(Cost / 2) where FormationClass != 'FORMATION_CLASS_CIVILIAN' and FormationClass != 'FORMATION_CLASS_AIR';
-- update Units set Cost = round(Cost * 0.6) where FormationClass != 'FORMATION_CLASS_CIVILIAN';
-- update Units set Cost = round(Cost * 0.8) where FormationClass != 'FORMATION_CLASS_CIVILIAN';

-- 这句操作是把Units上的单位一次性消耗的资源类型 抄给 维护性消耗写到Units_XP2的表上面.
-- update Units_XP2 set ResourceMaintenanceType = (select StrategicResource from Units where UnitType = Units_XP2.UnitType) where ResourceCost > 1;

-- update Units_XP2 set ResourceMaintenanceAmount = 1 where ResourceCost > 1;
-- update Units_XP2 set ResourceCost = 5 where ResourceCost > 0;

-- update Buildings set OuterDefenseStrength = 2 where
--     BuildingType = 'BUILDING_WALLS' or BuildingType = 'BUILDING_CASTLE' or BuildingType = 'BUILDING_STAR_FORT';
-- update Districts set CityStrengthModifier = 1 where CityStrengthModifier = 2;

delete from BuildingModifiers where BuildingType = 'BUILDING_GOV_CONQUEST' and ModifierId = 'GOV_CONQUEST_MILITARY_UNIT_PRODUCTION';

insert or replace into AiFavoredItems
    (ListType,                  Item,                                   Favored,    Value)
values
    ('DLAdjustBuildings',       'BUILDING_CASTLE',                      1,          0);

update GlobalParameters set Value = 25 where Name = 'EXPERIENCE_PROMOTE_HEALED';
update GlobalParameters set Value = 2 where Name = 'PILLAGE_MOVEMENT_COST';

update Improvements set PlunderType = 'PLUNDER_GOLD' where ImprovementType = 'IMPROVEMENT_FISHERY';
update Improvements set PlunderAmount = 25 where PlunderType = 'PLUNDER_HEAL';

-- free promotion for deity AI.
insert or replace into TraitModifiers (TraitType,   ModifierId) values ('TRAIT_LEADER_MAJOR_CIV', 'HD_DEITY_FREE_PROMOTION');
insert or replace into Modifiers (ModifierId,           ModifierType,  OwnerRequirementSetId)
values ('HD_DEITY_FREE_PROMOTION',  'MODIFIER_PLAYER_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',  'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI');
insert or replace into ModifierArguments (ModifierId,   Name,   Value) values ('HD_DEITY_FREE_PROMOTION',  'Amount',   -1);

--------------------------------------------------------------------------------------------------------------------------

insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    -- ('TRAIT_LEADER_MAJOR_CIV',               'MORE_STRATEGIC_RESOURCE_ACCUMULATION'),
    -- Wolin Ability for all.
    ('TRAIT_LEADER_MAJOR_CIV',               'KILL_GIVE_GREAT_GENERAL_POINTS'),
    ('TRAIT_LEADER_MAJOR_CIV',               'KILL_GIVE_GREAT_ADMIRAL_POINTS');

insert or replace into Modifiers
    (ModifierId,                                ModifierType)
values
    -- ('MORE_STRATEGIC_RESOURCE_ACCUMULATION',    'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_ACCUMULATION'),
    ('KILL_GIVE_GREAT_GENERAL_POINTS',          'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('KILL_GIVE_GREAT_ADMIRAL_POINTS',          'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
    ('KILL_GIVE_GREAT_GENERAL_POINTS_MODIFIER', 'MODIFIER_PLAYER_ADJUST_UNITS_GREAT_PEOPLE_POINTS_PER_KILL_BY_DEFEATED_STRENGTH'),
    ('KILL_GIVE_GREAT_ADMIRAL_POINTS_MODIFIER', 'MODIFIER_PLAYER_ADJUST_UNITS_GREAT_PEOPLE_POINTS_PER_KILL_BY_DEFEATED_STRENGTH');

insert or replace into ModifierArguments
    (ModifierId,                                Name,                       Value)
values
    -- ('MORE_STRATEGIC_RESOURCE_ACCUMULATION',    'Amount',                   3),
    ('KILL_GIVE_GREAT_GENERAL_POINTS',          'AbilityType',              'ABILITY_KILL_GIVE_GREAT_GENERAL_POINTS'),
    ('KILL_GIVE_GREAT_ADMIRAL_POINTS',          'AbilityType',              'ABILITY_KILL_GIVE_GREAT_ADMIRAL_POINTS'),
    ('KILL_GIVE_GREAT_GENERAL_POINTS_MODIFIER', 'GreatPersonClassType',     'GREAT_PERSON_CLASS_GENERAL'),
    ('KILL_GIVE_GREAT_GENERAL_POINTS_MODIFIER', 'Amount',                   20),
    ('KILL_GIVE_GREAT_ADMIRAL_POINTS_MODIFIER', 'GreatPersonClassType',     'GREAT_PERSON_CLASS_ADMIRAL'),
    ('KILL_GIVE_GREAT_ADMIRAL_POINTS_MODIFIER', 'Amount',                   20);

insert or replace into Types
    (Type,                                              Kind)
values
    ('ABILITY_KILL_GIVE_GREAT_GENERAL_POINTS',          'KIND_ABILITY'),
    ('ABILITY_KILL_GIVE_GREAT_ADMIRAL_POINTS',          'KIND_ABILITY');

insert or replace into TypeTags
    (Type,                                      Tag)
values
    ('ABILITY_KILL_GIVE_GREAT_GENERAL_POINTS',  'CLASS_LAND_COMBAT'),
    ('ABILITY_KILL_GIVE_GREAT_ADMIRAL_POINTS',  'CLASS_NAVAL');

insert or replace into UnitAbilities (UnitAbilityType, Name, Description, Inactive) values
    ('ABILITY_KILL_GIVE_GREAT_GENERAL_POINTS',
    'LOC_ABILITY_KILL_GIVE_GREAT_GENERAL_POINTS_NAME',
    'LOC_ABILITY_KILL_GIVE_GREAT_GENERAL_POINTS_DESCRIPTION',
    1),
    ('ABILITY_KILL_GIVE_GREAT_ADMIRAL_POINTS',
    'LOC_ABILITY_KILL_GIVE_GREAT_ADMIRAL_POINTS_NAME',
    'LOC_ABILITY_KILL_GIVE_GREAT_ADMIRAL_POINTS_DESCRIPTION',
    1);

insert or replace into UnitAbilityModifiers
    (UnitAbilityType,                                       ModifierId)
values
    ('ABILITY_KILL_GIVE_GREAT_GENERAL_POINTS',              'KILL_GIVE_GREAT_GENERAL_POINTS_MODIFIER'),
    ('ABILITY_KILL_GIVE_GREAT_ADMIRAL_POINTS',              'KILL_GIVE_GREAT_ADMIRAL_POINTS_MODIFIER');

------------------------------------------------------------------------------------------------------------
-- update GlobalParameters set Value = 4 where Name = 'GOLD_PURCHASE_MULTIPLIER';
-- Failed to add purchase debuff for buildings and districts at cities that loyalty is not full, only able to change units (seems enough).
insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    -- ('TRAIT_LEADER_MAJOR_CIV',              'DOUBLE_BUILDING_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL'),
    -- ('TRAIT_LEADER_MAJOR_CIV',              'DOUBLE_DISTRICT_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL'),
    ('TRAIT_LEADER_MAJOR_CIV',              'DOUBLE_UNIT_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL');

insert or replace into Modifiers
    (ModifierId,                                                ModifierType,                                                   SubjectRequirementSetId)
values
    -- ('DOUBLE_BUILDING_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL',     'MODIFIER_PLAYER_CITIES_ADJUST_ALL_BUILDINGS_PURCHASE_COST',    'LOYALTY_NOT_FULL_REQUIREMENTS'),
    -- ('DOUBLE_DISTRICT_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL',     'MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PURCHASE_COST',    'LOYALTY_NOT_FULL_REQUIREMENTS'),
    ('DOUBLE_UNIT_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL',         'MODIFIER_PLAYER_CITIES_ADJUST_UNITS_PURCHASE_COST',            'LOYALTY_NOT_FULL_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                                Name,               Value)
values
    -- ('DOUBLE_BUILDING_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL',     'Amount',       -50),
    -- ('DOUBLE_DISTRICT_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL',     'Amount',       -50),
    ('DOUBLE_UNIT_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL',         'Amount',           -100),
    ('DOUBLE_UNIT_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL',         'IncludeCivilian',  1),
    ('DOUBLE_UNIT_PURCHASE_COST_WHEN_LOYALTY_NOT_FULL',         'UnitDomain',       'DOMAIN_ALL');

insert or replace into Requirements
    (RequirementId,                         RequirementType,                        Inverse)
values
    ('REQUIRES_CITY_LOYALTY_NOT_FULL',      'REQUIREMENT_CITY_HAS_FULL_LOYALTY',    1);

insert or replace into RequirementSets
    (RequirementSetId,                      RequirementSetType)
values
    ('LOYALTY_NOT_FULL_REQUIREMENTS',       'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                      RequirementId)
values
    ('LOYALTY_NOT_FULL_REQUIREMENTS',       'REQUIRES_CITY_LOYALTY_NOT_FULL');
