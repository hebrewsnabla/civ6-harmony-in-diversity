-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

update Improvements set PrereqTech = NULL, PrereqCivic = 'CIVIC_CRAFTSMANSHIP' where ImprovementType = 'IMPROVEMENT_JNR_REED_HOME';

delete from Improvement_ValidFeatures where ImprovementType = 'IMPROVEMENT_JNR_REED_HOME' and FeatureType != 'FEATURE_MARSH';

-- Improvement_Adjacencies
-- delete from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM' and YieldChangeId = 'District_Gold';

-- Improvement_Tourism (TODO remove or not?)
--------------------------------------------------------------
-- INSERT OR IGNORE INTO Improvement_Tourism
--         (ImprovementType,               TourismSource,          PrereqTech)
-- VALUES  ('IMPROVEMENT_JNR_OASIS_FARM',  'TOURISMSOURCE_GOLD',   'TECH_FLIGHT');

-- Improvement_BonusYieldChanges (TODO: to be adapted)
--------------------------------------------------------------
-- INSERT OR IGNORE INTO Improvement_BonusYieldChanges
--         (Id,    ImprovementType,                YieldType,          BonusYieldChange,   PrereqTech,                 PrereqCivic)
-- VALUES  (1301,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_PRODUCTION', 1,                  'TECH_MACHINERY',           NULL),
--         (1302,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_FOOD',       1,                  'TECH_SCIENTIFIC_THEORY',   NULL),
--         (1303,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_GOLD',       2,                  NULL,                       'CIVIC_GLOBALIZATION'),
--         (1304,  'IMPROVEMENT_JNR_FLOOD_FARM',   'YIELD_FOOD',       1,                  NULL,                       'CIVIC_FEUDALISM'),
--         (1305,  'IMPROVEMENT_JNR_REED_HOME',    'YIELD_PRODUCTION', 1,                  NULL,                       'CIVIC_MERCANTILISM');
-- --------------------------------------------------------------
