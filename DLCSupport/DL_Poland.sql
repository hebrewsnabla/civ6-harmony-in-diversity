-------------------------------------
--            Poland DLC           --
-------------------------------------

insert or replace into Building_CitizenYieldChanges
    (BuildingType,                          YieldType,          YieldChange)
values
    ('BUILDING_SUKIENNICE',                 'YIELD_GOLD',       2); -- ub

insert or replace into Building_YieldChanges
    (BuildingType,                  YieldType,          YieldChange)
values
    ('BUILDING_SUKIENNICE',         'YIELD_GOLD',       5);

-- insert or replace into BuildingModifiers
--     (BuildingType,                          ModifierId)
-- values
--     ('BUILDING_SUKIENNICE',                  'MARKET_GOLD_PERCENTAGE_BOOST');

/*
-- By Xiaoyu
----------------------------------------------------------------------------------
-- Poland
insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'ENCAMPMENT_ADJACENT_PRODUCTION'),
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'FORT_ADJACENT_PRODUCTION'),
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'POLAND_ENCAPMENT_PRODUCTION'),
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'POLAND_ENCAPMENT_BUILDING_PRODUCTION');

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                                           SubjectRequirementSetId)
values
    ('POLAND_ENCAPMENT_PRODUCTION',         'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',    NULL),
    ('POLAND_ENCAPMENT_BUILDING_PRODUCTION','MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',    NULL),
    ('ENCAMPMENT_ADJACENT_PRODUCTION',      'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                    'PLOT_ADJACENT_TO_ENCAPMENT'),
    ('FORT_ADJACENT_PRODUCTION',            'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                    'PLOT_ADJACENT_TO_FORT');

insert or replace into RequirementSetRequirements
    (RequirementSetId,              RequirementId)
values
    ('PLOT_ADJACENT_TO_ENCAPMENT',  'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_ENCAMPMENT'),
    ('PLOT_ADJACENT_TO_FORT',       'REQUIRES_PLOT_ADJACENT_TO_IMPROVEMENT_FORT');

insert or replace into RequirementSets
    (RequirementSetId,              RequirementSetType)
values
    ('PLOT_ADJACENT_TO_ENCAPMENT',  'REQUIREMENTSET_TEST_ALL'),
    ('PLOT_ADJACENT_TO_FORT',       'REQUIREMENTSET_TEST_ALL');

insert or replace into ModifierArguments
    (ModifierId,                                        Name,               Value)
values
    ('TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD',       'ReplacesAll',      1),
    ('POLAND_ENCAPMENT_PRODUCTION',                     'DistrictType',     'DISTRICT_ENCAMPMENT'),
    ('POLAND_ENCAPMENT_PRODUCTION',                     'Amount',           20),
    ('FORT_ADJACENT_PRODUCTION',                        'YieldType',        'YIELD_PRODUCTION'),
    ('FORT_ADJACENT_PRODUCTION',                        'Amount',           1),
    ('POLAND_ENCAPMENT_BUILDING_PRODUCTION',            'DistrictType',     'DISTRICT_ENCAMPMENT'),
    ('POLAND_ENCAPMENT_BUILDING_PRODUCTION',            'Amount',           20),
    ('ENCAMPMENT_ADJACENT_PRODUCTION',                  'YieldType',        'YIELD_PRODUCTION'),
    ('ENCAMPMENT_ADJACENT_PRODUCTION',                  'Amount',           1);

-- Jadiwiga
delete from TraitModifiers where ModifierId = 'TRAIT_LITHUANIANUNION_GOLD_RELIC'
    or ModifierId = 'TRAIT_LITHUANIANUNION_FAITH_RELIC'
    or ModifierId = 'TRAIT_LITHUANIANUNION_CULTURE_RELIC';

insert or replace into TraitModifiers
    (TraitType,                                     ModifierId)
values
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_ALLY_COMBAT_STRENGTH'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTEGOLDTOALLY'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTESCIENCETOALLY'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTECULTURETOALLY'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTEFAITHTOALLY'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTEGOLDFROMALLY'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTESCIENCEFROMALLY'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTECULTUREFROMALLY'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTEFAITHFROMALLY'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTEGOLDTOSUZERAIN'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTESCIENCETOSUZERAIN'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTECULTURETOSUZERAIN'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTEFAITHTOSUZERAIN'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTEGOLDFROMSUZERAIN'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTESCIENCEFROMSUZERAIN'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTECULTUREFROMSUZERAIN'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',               'POLAND_TRADEROUTEFAITHFROMSUZERAIN');

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                                   OwnerRequirementSetId)
values
    ('POLAND_ALLY_COMBAT_STRENGTH',         'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'HD_PLAYER_HAS_ALLY_REQUIREMENTS');

insert or replace into Modifiers
    (ModifierId,                            ModifierType)
values
    ('POLAND_TRADEROUTEGOLDTOALLY',         'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_ALLY_ROUTE'),
    ('POLAND_TRADEROUTESCIENCETOALLY',      'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_ALLY_ROUTE'),
    ('POLAND_TRADEROUTECULTURETOALLY',      'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_ALLY_ROUTE'),
    ('POLAND_TRADEROUTEFAITHTOALLY',        'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_ALLY_ROUTE'),
    ('POLAND_TRADEROUTEGOLDFROMALLY',       'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE'),
    ('POLAND_TRADEROUTESCIENCEFROMALLY',    'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE'),
    ('POLAND_TRADEROUTECULTUREFROMALLY',    'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE'),
    ('POLAND_TRADEROUTEFAITHFROMALLY',      'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE'),
    ('POLAND_TRADEROUTEGOLDTOSUZERAIN',     'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_SUZERAIN_ROUTE'),
    ('POLAND_TRADEROUTESCIENCETOSUZERAIN',  'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_SUZERAIN_ROUTE'),
    ('POLAND_TRADEROUTECULTURETOSUZERAIN',  'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_SUZERAIN_ROUTE'),
    ('POLAND_TRADEROUTEFAITHTOSUZERAIN',    'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_DESTINATION_YIELD_FOR_SUZERAIN_ROUTE'),
    ('POLAND_TRADEROUTEGOLDFROMSUZERAIN',   'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE'),
    ('POLAND_TRADEROUTESCIENCEFROMSUZERAIN','MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE'),
    ('POLAND_TRADEROUTECULTUREFROMSUZERAIN','MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE'),
    ('POLAND_TRADEROUTEFAITHFROMSUZERAIN',  'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE');

insert or replace into ModifierArguments
    (ModifierId,                            Name,           Value)
values
    ('POLAND_ALLY_COMBAT_STRENGTH',         'Amount',       4),
    ('POLAND_TRADEROUTEGOLDTOALLY',         'YieldType',    'YIELD_GOLD'),
    ('POLAND_TRADEROUTEGOLDTOALLY',         'Amount',       2),
    ('POLAND_TRADEROUTESCIENCETOALLY',      'YieldType',    'YIELD_SCIENCE'),
    ('POLAND_TRADEROUTESCIENCETOALLY',      'Amount',       2),
    ('POLAND_TRADEROUTECULTURETOALLY',      'YieldType',    'YIELD_CULTURE'),
    ('POLAND_TRADEROUTECULTURETOALLY',      'Amount',       2),
    ('POLAND_TRADEROUTEFAITHTOALLY',        'YieldType',    'YIELD_FAITH'),
    ('POLAND_TRADEROUTEFAITHTOALLY',        'Amount',       2),
    ('POLAND_TRADEROUTEGOLDFROMALLY',       'YieldType',    'YIELD_GOLD'),
    ('POLAND_TRADEROUTEGOLDFROMALLY',       'Amount',       2),
    ('POLAND_TRADEROUTESCIENCEFROMALLY',    'YieldType',    'YIELD_SCIENCE'),
    ('POLAND_TRADEROUTESCIENCEFROMALLY',    'Amount',       2),
    ('POLAND_TRADEROUTECULTUREFROMALLY',    'YieldType',    'YIELD_CULTURE'),
    ('POLAND_TRADEROUTECULTUREFROMALLY',    'Amount',       2),
    ('POLAND_TRADEROUTEFAITHFROMALLY',      'YieldType',    'YIELD_FAITH'),
    ('POLAND_TRADEROUTEFAITHFROMALLY',      'Amount',       2),
    ('POLAND_TRADEROUTEGOLDTOSUZERAIN',     'YieldType',    'YIELD_GOLD'),
    ('POLAND_TRADEROUTEGOLDTOSUZERAIN',     'Amount',       2),
    ('POLAND_TRADEROUTESCIENCETOSUZERAIN',  'YieldType',    'YIELD_SCIENCE'),
    ('POLAND_TRADEROUTESCIENCETOSUZERAIN',  'Amount',       2),
    ('POLAND_TRADEROUTECULTURETOSUZERAIN',  'YieldType',    'YIELD_CULTURE'),
    ('POLAND_TRADEROUTECULTURETOSUZERAIN',  'Amount',       2),
    ('POLAND_TRADEROUTEFAITHTOSUZERAIN',    'YieldType',    'YIELD_FAITH'),
    ('POLAND_TRADEROUTEFAITHTOSUZERAIN',    'Amount',       2),
    ('POLAND_TRADEROUTEGOLDFROMSUZERAIN',   'YieldType',    'YIELD_GOLD'),
    ('POLAND_TRADEROUTEGOLDFROMSUZERAIN',   'Amount',       2),
    ('POLAND_TRADEROUTESCIENCEFROMSUZERAIN','YieldType',    'YIELD_SCIENCE'),
    ('POLAND_TRADEROUTESCIENCEFROMSUZERAIN','Amount',       2),
    ('POLAND_TRADEROUTECULTUREFROMSUZERAIN','YieldType',    'YIELD_CULTURE'),
    ('POLAND_TRADEROUTECULTUREFROMSUZERAIN','Amount',       2),
    ('POLAND_TRADEROUTEFAITHFROMSUZERAIN',  'YieldType',    'YIELD_FAITH'),
    ('POLAND_TRADEROUTEFAITHFROMSUZERAIN',  'Amount',       2);

insert or replace into ModifierStrings (ModifierId, Context, Text)
values ('POLAND_ALLY_COMBAT_STRENGTH', 'Preview', 'LOC_POLAND_ALLY_COMBAT_STRENGTH_PREVIEW_TEXT');

--sukinennice
insert or replace into BuildingModifiers
    (BuildingType,                      ModifierId)
values
    ('BUILDING_SUKIENNICE',     'SUKINENNICE_LUXUARY_GOLD'),
    ('BUILDING_SUKIENNICE',     'SUKINENNICE_LUXUARY_PRODUCTION');      

insert or replace into Modifiers
    (ModifierId,                        ModifierType,                                   SubjectRequirementSetId)
values
    ('SUKINENNICE_LUXUARY_GOLD',        'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',  'HD_PLOT_HAS_LUXURY_REQUIREMENTS'),
    ('SUKINENNICE_LUXUARY_PRODUCTION',  'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',  'HD_PLOT_HAS_LUXURY_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                        Name,           Value)
values
    ('SUKINENNICE_LUXUARY_GOLD',        'YieldType',    'YIELD_GOLD'),
    ('SUKINENNICE_LUXUARY_GOLD',        'Amount',       2),
    ('SUKINENNICE_LUXUARY_PRODUCTION',  'YieldType',    'YIELD_PRODUCTION'),
    ('SUKINENNICE_LUXUARY_PRODUCTION',  'Amount',       1);

insert or replace into RequirementSetRequirements
    (RequirementSetId,                  RequirementId)
values
    ('HD_PLAYER_HAS_ALLY_REQUIREMENTS', 'REQUIRES_PLAYER_IS_ALLY_LEVEL_1'),
    ('HD_PLOT_HAS_LUXURY_REQUIREMENTS', 'REQUIRES_PLOT_HAS_LUXURY');

insert or replace into RequirementSets
    (RequirementSetId,                  RequirementSetType)
values
    ('HD_PLAYER_HAS_ALLY_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
    ('HD_PLOT_HAS_LUXURY_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');
*/

--Poland another plan by zhushou
-------------------------------------------------------------------------
delete from TraitModifiers where ModifierId = 'TRAIT_LITHUANIANUNION_GOLD_RELIC'
    or ModifierId = 'TRAIT_LITHUANIANUNION_FAITH_RELIC'
    or ModifierId = 'TRAIT_LITHUANIANUNION_CULTURE_RELIC'
    or ModifierId = 'TRAIT_ADJACENT_DISTRICTS_HOLYSITE_ADJACENCYFAITH';
--LA 圣地区域及建筑30%加速
insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_HOLYSITE_PRODUCTION'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_HOLYSITE_BUILDING_PRODUCTION');
    /*('TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_ENCAPMENT_PRODUCTION'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_ENCAPMENT_BUILDING_PRODUCTION'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_GRASS_CULTURE'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_GRASS_HILLS_CULTURE'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_PLAINS_CULTURE'),
    ('TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_PLAINS_HILLS_CULTURE');*/

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                                           SubjectRequirementSetId)
values
    ('POLAND_HOLYSITE_PRODUCTION',          'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',    NULL),
    ('POLAND_HOLYSITE_BUILDING_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',    NULL);
    /*('POLAND_ENCAPMENT_PRODUCTION',         'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',    NULL),
    ('POLAND_ENCAPMENT_BUILDING_PRODUCTION','MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',    NULL);
    ('POLAND_GRASS_CULTURE',                'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               'PLAYER_HAS_CIVIC_CIVIL_SERVICE'),
    ('POLAND_GRASS_HILLS_CULTURE',          'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               'PLAYER_HAS_CIVIC_CIVIL_SERVICE'),
    ('POLAND_PLAINS_CULTURE',               'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               'PLAYER_HAS_CIVIC_CIVIL_SERVICE'),
    ('POLAND_PLAINS_HILLS_CULTURE',         'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               'PLAYER_HAS_CIVIC_CIVIL_SERVICE'),
    ('POLAND_GRASS_CULTURE_MODIFIER',       'MODIFIER_CITY_ADJUST_CITY_YIELD_PER_TERRAIN_TYPE',     NULL),
    ('POLAND_GRASS_HILLS_CULTURE_MODIFIER', 'MODIFIER_CITY_ADJUST_CITY_YIELD_PER_TERRAIN_TYPE',     NULL),
    ('POLAND_PLAINS_CULTURE_MODIFIER',      'MODIFIER_CITY_ADJUST_CITY_YIELD_PER_TERRAIN_TYPE',     NULL),
    ('POLAND_PLAINS_HILLS_CULTURE_MODIFIER',    'MODIFIER_CITY_ADJUST_CITY_YIELD_PER_TERRAIN_TYPE',     NULL);*/

insert or replace into ModifierArguments
    (ModifierId,                                       Name,               Value)
values
    ('POLAND_HOLYSITE_PRODUCTION',                     'DistrictType',     'DISTRICT_HOLY_SITE'),
    ('POLAND_HOLYSITE_PRODUCTION',                     'Amount',           30),
    ('POLAND_HOLYSITE_BUILDING_PRODUCTION',            'DistrictType',     'DISTRICT_HOLY_SITE'),
    ('POLAND_HOLYSITE_BUILDING_PRODUCTION',            'Amount',           30);
    /*('POLAND_ENCAPMENT_PRODUCTION',                    'DistrictType',     'DISTRICT_ENCAMPMENT'),
    ('POLAND_ENCAPMENT_PRODUCTION',                    'Amount',           20),
    ('POLAND_ENCAPMENT_BUILDING_PRODUCTION',           'DistrictType',     'DISTRICT_ENCAMPMENT'),
    ('POLAND_ENCAPMENT_BUILDING_PRODUCTION',           'Amount',           20),
    ('POLAND_GRASS_CULTURE',                           'ModifierId',       'POLAND_GRASS_CULTURE_MODIFIER'),
    ('POLAND_GRASS_HILLS_CULTURE',                     'ModifierId',       'POLAND_GRASS_HILLS_CULTURE_MODIFIER'),
    ('POLAND_PLAINS_CULTURE',                          'ModifierId',       'POLAND_PLAINS_CULTURE_MODIFIER'),
    ('POLAND_PLAINS_HILLS_CULTURE',                    'ModifierId',       'POLAND_PLAINS_HILLS_CULTURE_MODIFIER'),
    ('POLAND_GRASS_CULTURE_MODIFIER',                  'TerrainType',      'TERRAIN_GRASS'),
    ('POLAND_GRASS_CULTURE_MODIFIER',                  'YieldType',        'YIELD_CULTURE'),
    ('POLAND_GRASS_CULTURE_MODIFIER',                  'Amount',           0.5),
    ('POLAND_GRASS_HILLS_CULTURE_MODIFIER',            'TerrainType',      'TERRAIN_GRASS_HILLS'),
    ('POLAND_GRASS_HILLS_CULTURE_MODIFIER',            'YieldType',        'YIELD_CULTURE'),
    ('POLAND_GRASS_HILLS_CULTURE_MODIFIER',            'Amount',           0.5),
    ('POLAND_PLAINS_CULTURE_MODIFIER',                 'TerrainType',      'TERRAIN_PLAINS'),
    ('POLAND_PLAINS_CULTURE_MODIFIER',                 'YieldType',        'YIELD_CULTURE'),
    ('POLAND_PLAINS_CULTURE_MODIFIER',                 'Amount',           0.5),
    ('POLAND_PLAINS_HILLS_CULTURE_MODIFIER',           'TerrainType',      'TERRAIN_PLAINS_HILLS'),
    ('POLAND_PLAINS_HILLS_CULTURE_MODIFIER',           'YieldType',        'YIELD_CULTURE'),
    ('POLAND_PLAINS_HILLS_CULTURE_MODIFIER',           'Amount',           0.5);*/

--ua 所有红转紫，相邻堡垒+2锤+2琴，信仰购买军工且军工+2次
insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    -- ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'ENCAMPMENT_ADJACENT_PRODUCTION'),
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'FORT_ADJACENT_PRODUCTION'),
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'FORT_ADJACENT_CULTURE'),
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'POLAND_ENABLE_MILITARY_ENGINEER_FAITH_PURCHASE'),
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'TRAIT_ADJUST_MILITARY_ENGINEER_BUILDCHARGES'),
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'POLAND_CAVALRY_REDUCTION_DAMAGE');

insert or replace into Modifiers
    (ModifierId,                                        ModifierType,                                                           SubjectRequirementSetId)
values
    -- ('ENCAMPMENT_ADJACENT_PRODUCTION',                  'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                    'PLOT_ADJACENT_TO_ENCAPMENT'),
    ('FORT_ADJACENT_PRODUCTION',                        'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                    'PLOT_ADJACENT_TO_FORT'),
    ('FORT_ADJACENT_CULTURE',                           'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                    'PLOT_ADJACENT_TO_FORT'),
    ('POLAND_ENABLE_MILITARY_ENGINEER_FAITH_PURCHASE',  'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE',                    NULL),
    ('POLAND_CAVALRY_REDUCTION_DAMAGE',                 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',                                  'UNIT_IS_POLAND_HUSSAR'),
    ('POLAND_CAVALRY_HALF_REDUCTION_DAMAGE',            'MODIFIER_PLAYER_UNITS_ADJUST_STRENGTH_REDUCTION_FOR_DAMAGE_MODIFIER',  NULL);

insert or replace into RequirementSetRequirements
    (RequirementSetId,              RequirementId)
values
    ('PLOT_ADJACENT_TO_ENCAPMENT',  'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_ENCAMPMENT'),
    ('PLOT_ADJACENT_TO_FORT',       'REQUIRES_PLOT_ADJACENT_TO_IMPROVEMENT_FORT'),
    ('PLAYER_HAS_CIVIC_CIVIL_SERVICE', 'REQUIRES_PLAYER_HAS_CIVIC_CIVIL_SERVICE'),
    ('UNIT_IS_POLAND_HUSSAR',       'REQUIRES_UNIT_IS_UNIT_POLISH_HUSSAR');

insert or replace into RequirementSets
    (RequirementSetId,                  RequirementSetType)
values
    ('PLOT_ADJACENT_TO_ENCAPMENT',      'REQUIREMENTSET_TEST_ALL'),
    ('PLOT_ADJACENT_TO_FORT',           'REQUIREMENTSET_TEST_ALL'),
    ('PLAYER_HAS_CIVIC_CIVIL_SERVICE',  'REQUIREMENTSET_TEST_ALL'),
    ('UNIT_IS_POLAND_HUSSAR',           'REQUIREMENTSET_TEST_ALL');

insert or replace into ModifierArguments
    (ModifierId,                                        Name,               Value)
values
    ('TRAIT_REPLACE_MILITARY_SLOT_WITH_WILDCARD',       'ReplacesAll',      1),
    ('FORT_ADJACENT_PRODUCTION',                        'YieldType',        'YIELD_PRODUCTION'),
    ('FORT_ADJACENT_PRODUCTION',                        'Amount',           2),
    ('FORT_ADJACENT_CULTURE',                           'YieldType',        'YIELD_CULTURE'),
    ('FORT_ADJACENT_CULTURE',                           'Amount',           2),
    -- ('ENCAMPMENT_ADJACENT_PRODUCTION',                  'YieldType',        'YIELD_PRODUCTION'),
    -- ('ENCAMPMENT_ADJACENT_PRODUCTION',                  'Amount',           1),
    ('POLAND_ENABLE_MILITARY_ENGINEER_FAITH_PURCHASE',  'Tag',              'CLASS_MILITARY_ENGINEER'),
    ('POLAND_CAVALRY_REDUCTION_DAMAGE',                 'AbilityType',      'ABILITY_POLAND_CAVALRY_REDUCTION_DAMAGE'),
    ('POLAND_CAVALRY_HALF_REDUCTION_DAMAGE',            'Amount',           50);

insert or replace into Types
	(Type,														Kind)
values
	('ABILITY_POLAND_CAVALRY_REDUCTION_DAMAGE',					'KIND_ABILITY');

insert or replace into TypeTags
	(Type,																Tag)
values
	('ABILITY_POLAND_CAVALRY_REDUCTION_DAMAGE',							'CLASS_LIGHT_CAVALRY'),
	('ABILITY_POLAND_CAVALRY_REDUCTION_DAMAGE',						    'CLASS_HEAVY_CAVALRY');

insert or replace into UnitAbilities (UnitAbilityType, Description, Inactive) values
	('ABILITY_POLAND_CAVALRY_REDUCTION_DAMAGE', 'LOC_ABILITY_POLAND_CAVALRY_REDUCTION_DAMAGE_DESCRIPTION',  1);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
	('ABILITY_POLAND_CAVALRY_REDUCTION_DAMAGE',				'POLAND_CAVALRY_HALF_REDUCTION_DAMAGE');

--sukinennice 本城每个区域（不包括奇观）+2金
insert or replace into BuildingModifiers
    (BuildingType,                      ModifierId)
values
    ('BUILDING_SUKIENNICE',             'SUKINENNICE_DISTRCIT_GOLD');      

insert or replace into Modifiers
    (ModifierId,                        ModifierType,                                           SubjectRequirementSetId)
values
    ('SUKINENNICE_DISTRCIT_GOLD',       'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',   'HD_DISTRICTS_BUT_NOT_WONDERS');

insert or replace into ModifierArguments
    (ModifierId,                        Name,           Value)
values
    ('SUKINENNICE_DISTRCIT_GOLD',       'YieldType',    'YIELD_GOLD'),
    ('SUKINENNICE_DISTRCIT_GOLD',       'Amount',       2);

insert or replace into RequirementSets
    (RequirementSetId,                  RequirementSetType)
values
    ('HD_DISTRICTS_BUT_NOT_WONDERS',    'REQUIREMENTSET_TEST_ANY');

insert or replace into RequirementSetRequirements   (RequirementSetId,   RequirementId)
select 'HD_DISTRICTS_BUT_NOT_WONDERS',  'REQUIRES_DISTRICT_IS_' || DistrictType from Districts where DistrictType != 'DISTRICT_WONDER';

-- Poland ver3.0
-- temple unlock military engineer
insert or replace into Types
    (Type,                                  Kind)
values
    ('BUILDING_DUMMY_POLAND',               'KIND_BUILDING');

insert or replace into Buildings 
    (BuildingType,                      Name,                                   Cost,   Description,                                InternalOnly) 
values
    ('BUILDING_DUMMY_POLAND',           'LOC_BUILDING_DUMMY_POLAND_NAME',       1,      'LOC_BUILDING_DUMMY_POLAND_DESCRIPTION',    1);

insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('TRAIT_CIVILIZATION_GOLDEN_LIBERTY',   'TEMPLE_UNLOCK_MILITARY_ENGINEER');

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                                               SubjectRequirementSetId)
values
    ('TEMPLE_UNLOCK_MILITARY_ENGINEER',     'MODIFIER_PLAYER_CITIES_GRANT_BUILDING_IN_CITY_IGNORE',     'BUILDING_IS_TEMPLE_XP2');

insert or replace into ModifierArguments
    (ModifierId,                            Name,               Value)
values
    ('TEMPLE_UNLOCK_MILITARY_ENGINEER',     'BuildingType',     'BUILDING_DUMMY_POLAND');

insert or replace into ModifierArguments
    (Unit,                      PrereqBuilding)
values
    ('UNIT_MILITARY_ENGINEER',  'BUILDING_DUMMY_POLAND');

-- La 圣地和圣地建筑+2信仰
insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_HOLYSITE_FAITH');

insert or replace into Modifiers
    (ModifierId,                            ModifierType)
values
    ('POLAND_HOLYSITE_FAITH',               'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE');

insert or replace into ModifierArguments
    (ModifierId,                                  Name,               Value)
values
    ('POLAND_HOLYSITE_FAITH',                     'YieldType',        'YIELD_FAITH'),
    ('POLAND_HOLYSITE_FAITH',                     'Amount',           2);

insert or replace into TraitModifiers (TraitType,  ModifierId)
select 'TRAIT_LEADER_LITHUANIAN_UNION',       'POLAND_ '|| BuildingType || '_FAITH' from Buildings
where PrereqDistrict = 'DISTRICT_HOLY_SITE';

insert or replace into Modifiers (ModifierId, ModifierType)
select 'POLAND_ '|| BuildingType || '_FAITH',      'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE' from Buildings
where PrereqDistrict = 'DISTRICT_HOLY_SITE';

insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select 'POLAND_ '|| BuildingType || '_FAITH',      'BuildingType',  BuildingType   from Buildings
where PrereqDistrict = 'DISTRICT_HOLY_SITE';

insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select 'POLAND_ '|| BuildingType || '_FAITH',      'YieldType',     'YIELD_FAITH'   from Buildings
where PrereqDistrict = 'DISTRICT_HOLY_SITE';

insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select 'POLAND_ '|| BuildingType || '_FAITH',      'Amount',        2   from Buildings
where PrereqDistrict = 'DISTRICT_HOLY_SITE';