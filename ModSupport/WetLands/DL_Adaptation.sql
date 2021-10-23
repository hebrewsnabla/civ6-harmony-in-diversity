-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

-- Peat
update Resources set Frequency = 4 where ResourceType = 'RESOURCE_JNR_PEAT';

insert or replace into Modifiers
    (ModifierId,                                ModifierType,                                           SubjectRequirementSetId)
values
    ('HD_INDUSTRIAL_ZONE_PEAT_PRODUCTION',      'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',          'HD_PLOT_HAS_IMPROVED_PEAT_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                Name,           Value)
values
    ('HD_INDUSTRIAL_ZONE_PEAT_PRODUCTION',      'YieldType',    'YIELD_PRODUCTION'),
    ('HD_INDUSTRIAL_ZONE_PEAT_PRODUCTION',      'Amount',       1);

insert or replace into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
values
    ('HD_PLOT_HAS_IMPROVED_PEAT_REQUIREMENTS',          'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
values
    ('HD_PLOT_HAS_IMPROVED_PEAT_REQUIREMENTS',          'REQUIRES_RESOURCE_JNR_PEAT_IN_PLOT'),
    ('HD_PLOT_HAS_IMPROVED_PEAT_REQUIREMENTS',          'REQUIRES_PLOT_HAS_QUARRY');

-- Oasis Farm
-- Unlock by Drama and Poetry, change to 0.5 housing
update Improvements set PrereqTech = NULL, PrereqCivic = 'CIVIC_DRAMA_POETRY', TilesRequired = 2 where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM';
-- remove effect: Prevents Drought
update Improvements_XP2 set PreventsDrought = 0 where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM';

-- Reed Home
-- Unlock by Craftsmanship
update Improvements set PrereqTech = NULL, PrereqCivic = 'CIVIC_CRAFTSMANSHIP' where ImprovementType = 'IMPROVEMENT_JNR_REED_HOME';

delete from Improvement_ValidFeatures where ImprovementType = 'IMPROVEMENT_JNR_REED_HOME' and FeatureType != 'FEATURE_MARSH';

delete from Improvement_YieldChanges where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM';
delete from Improvement_YieldChanges where ImprovementType = 'IMPROVEMENT_JNR_REED_HOME';
insert or replace into Improvement_YieldChanges
        (ImprovementType,               YieldType,          YieldChange)
values  ('IMPROVEMENT_JNR_OASIS_FARM',  'YIELD_CULTURE',    2),
        ('IMPROVEMENT_JNR_REED_HOME',   'YIELD_PRODUCTION', 1),
        ('IMPROVEMENT_JNR_REED_HOME',   'YIELD_SCIENCE',    0);

-- Improvement_BonusYieldChanges Removed
--------------------------------------------------------------
-- INSERT OR IGNORE INTO Improvement_BonusYieldChanges
--         (Id,    ImprovementType,                YieldType,          BonusYieldChange,   PrereqTech,                 PrereqCivic)
-- VALUES  (1301,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_PRODUCTION', 1,                  'TECH_MACHINERY',           NULL),
--         (1302,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_FOOD',       1,                  'TECH_SCIENTIFIC_THEORY',   NULL),
--         (1303,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_GOLD',       2,                  NULL,                       'CIVIC_GLOBALIZATION'),
--         (1304,  'IMPROVEMENT_JNR_FLOOD_FARM',   'YIELD_FOOD',       1,                  NULL,                       'CIVIC_FEUDALISM'),
--         (1305,  'IMPROVEMENT_JNR_REED_HOME',    'YIELD_PRODUCTION', 1,                  NULL,                       'CIVIC_MERCANTILISM');
-- --------------------------------------------------------------
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_JNR_REED_HOME';
insert or replace into Improvement_BonusYieldChanges
        (Id,    ImprovementType,                YieldType,          BonusYieldChange,   PrereqTech,                 PrereqCivic)
values  (307,  'IMPROVEMENT_JNR_REED_HOME',    'YIELD_SCIENCE',     1,                  NULL,                       'CIVIC_GUILDS'),
        (308,  'IMPROVEMENT_JNR_REED_HOME',    'YIELD_SCIENCE',     1,                  'TECH_SCIENTIFIC_THEORY',   NULL);

-- Improvement_Adjacencies
delete from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM' and YieldChangeId = 'District_Gold';

-- Improvement_Tourism
--------------------------------------------------------------
-- INSERT OR IGNORE INTO Improvement_Tourism
--         (ImprovementType,               TourismSource,          PrereqTech)
-- VALUES  ('IMPROVEMENT_JNR_OASIS_FARM',  'TOURISMSOURCE_GOLD',   'TECH_FLIGHT');
delete from Improvement_Tourism where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM';

insert or replace into ImprovementModifiers (ImprovementType, ModifierID) values
    ('IMPROVEMENT_JNR_OASIS_FARM', 'JNR_OASIS_FARM_AMENITY');

insert or replace into Modifiers
    (ModifierId,                    ModifierType,                                           SubjectRequirementSetId)
values
    ('JNR_OASIS_FARM_AMENITY',      'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',      'PLAYER_HAS_TECH_BUTTRESS');

insert or replace into ModifierArguments
    (ModifierId,                    Name,            Value)
values
    ('JNR_OASIS_FARM_AMENITY',      'Amount',       1);
