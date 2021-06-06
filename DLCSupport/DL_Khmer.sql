-------------------------------------
--            Khmer DLC            --
-------------------------------------

insert or replace into Building_CitizenYieldChanges
    (BuildingType,                          YieldType,          YieldChange)
values
    ('BUILDING_PRASAT',                     'YIELD_FAITH',      1); --ub (高棉)

insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
values
    ('BUILDING_PRASAT',             'TEMPLE_SETTLER_PURCHASE'),
    ('BUILDING_PRASAT',             'TEMPLE_FAITH_PERCENTAGE_BOOST');

--CIVILIZATION_INDONESIA
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_NUSANTARA_COAST_HOLY_SITE' and Name = 'TilesRequired';
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_NUSANTARA_COAST_CAMPUS' and Name = 'TilesRequired';
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_NUSANTARA_COAST_INDUSTRIAL_ZONE' and Name = 'TilesRequired';
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_NUSANTARA_COAST_THEATER' and Name = 'TilesRequired';

insert or replace into Improvement_ValidFeatures (ImprovementType, FeatureType, PrereqTech, PrereqCivic) 
values  ('IMPROVEMENT_KAMPUNG', 'FEATURE_REEF', NULL, NULL);