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

-- Outer Defense
update Buildings set OuterDefenseHitPoints = 50 where BuildingType = 'BUILDING_WALLS';
update Buildings set OuterDefenseStrength = 2 where
    BuildingType = 'BUILDING_WALLS' or BuildingType = 'BUILDING_CASTLE' or BuildingType = 'BUILDING_STAR_FORT';
update Districts set CityStrengthModifier = 1 where CityStrengthModifier = 2;
delete from AiFavoredItems where ListType = 'DLAdjustBuildings' and Item = 'BUILDING_CASTLE';

-- COMBAT_STRENGTH_REDUCTION_INSUFFICIENT_FUEL
update GlobalParameters set Value = 15 where Name = 'UNIT_MAX_STR_REDUCTION_INSUFFICIENT_RESOURCES';
update GlobalParameters set Value = 25 where Name = 'EXPERIENCE_PROMOTE_HEALED';
update GlobalParameters set Value = 2 where Name = 'PILLAGE_MOVEMENT_COST';

update Improvements set PlunderType = 'PLUNDER_GOLD' where ImprovementType = 'IMPROVEMENT_FISHERY';
update Improvements set PlunderAmount = 25 where PlunderType = 'PLUNDER_HEAL';

-- strategic resources
update Resource_Consumption set ImprovedExtractionRate = ImprovedExtractionRate + 1;

-- one free strategic resource for deity AI.
insert or replace into TraitModifiers (TraitType,   ModifierId)
select 'TRAIT_LEADER_MAJOR_CIV',                    'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into Modifiers (ModifierId,           ModifierType,   OwnerRequirementSetId)
select 'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType,   'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI_CAN_SEE_' || ResourceType
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select 'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType,   'ResourceType', ResourceType
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select 'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType,   'Amount', 1
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into DistrictModifiers (DistrictType, ModifierId)
select 'DISTRICT_THANH',                                'HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_THANH');

insert or replace into DistrictModifiers
    (DistrictType,                  ModifierId)
values
    ('DISTRICT_ENCAMPMENT',         'HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION'),
    ('DISTRICT_IKANDA',             'HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION');

insert or replace into Modifiers
    (ModifierId,                                            ModifierType)
values
    ('HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION',   'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_ACCUMULATION');

insert or replace into ModifierArguments
    (ModifierId,                                            Name,       Value)
values
    ('HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION',   'Amount',   2);

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
