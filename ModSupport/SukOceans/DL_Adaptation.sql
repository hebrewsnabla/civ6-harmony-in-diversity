-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

delete from Resource_YieldChanges where ResourceType = 'RESOURCE_SUK_SQUID' and YieldType = 'YIELD_GOLD';
insert or replace into Resource_YieldChanges
    (ResourceType,              YieldType,              YieldChange)
values
    ('RESOURCE_SUK_CORAL',      'YIELD_GOLD',           1),
    ('RESOURCE_SUK_LOBSTER',    'YIELD_GOLD',           1);

delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and ModifierId = 'SUK_FISHERY_FOOD';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and ModifierId = 'SUK_FISHERY_PRODUCTION';
update Improvements
set
    Housing             = 1,
    TilesRequired       = 2,

    AdjacentSeaResource = 0,
    Workable            = 1
where ImprovementType = "IMPROVEMENT_FISHERY";

insert or ignore into Improvement_Adjacencies (ImprovementType, YieldChangeId) values
    ('IMPROVEMENT_FISHERY', 'Fishery_SeaResourceAdjacency');
insert or replace into Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) values
    ('IMPROVEMENT_FISHERY', 'YIELD_FOOD',       1),
    ('IMPROVEMENT_FISHERY', 'YIELD_PRODUCTION', 0);
insert or replace into Improvement_ValidFeatures (ImprovementType, FeatureType) values
    ('IMPROVEMENT_FISHERY', 'FEATURE_SUK_KELP');

update BuildingModifiers set ModifierId = 'AQUATICS_CENTER_WONDER_TOURISM'
    where ModifierId = 'SUK_OCEANS_AQUATIC_CENTER_TOURISM';

delete from BuildingModifiers where ModifierId in ('SUK_OCEANS_AQUARIUM_SCIENCE', 'SUK_OCEANS_AQUARIUM_ADJACENT_SCIENCE');
insert or ignore into BuildingModifiers
        (BuildingType,          ModifierId)
values  ('BUILDING_AQUARIUM',   'AQUARIUM_SEARESOURCE_SCIENCE'),
        ('BUILDING_AQUARIUM',   'AQUARIUM_REEF_SCIENCE'),
        ('BUILDING_AQUARIUM',   'AQUARIUM_KELP_FOREST_SCIENCE');
insert or replace into Modifiers
        (ModifierId,                                ModifierType,                                       SubjectRequirementSetId)
values  ('AQUARIUM_KELP_FOREST_SCIENCE',            'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'SUK_OCEANS_AQUARIUM_KELP_REQUIREMENTS');
insert or replace into ModifierArguments
        (ModifierId,                                    Name,                   Value)
values  ('AQUARIUM_KELP_FOREST_SCIENCE',                'YieldType',            'YIELD_SCIENCE'),
        ('AQUARIUM_KELP_FOREST_SCIENCE',                'Amount',               1);
insert or replace into RequirementSets
        (RequirementSetId,                                          RequirementSetType)
values  ('SUK_OCEANS_AQUARIUM_KELP_REQUIREMENTS',                   'REQUIREMENTSET_TEST_ANY');
insert or replace into RequirementSetRequirements
        (RequirementSetId,                                          RequirementId)
values  ('SUK_OCEANS_AQUARIUM_KELP_REQUIREMENTS',                   'REQUIRES_PLOT_HAS_SUK_KELP');
