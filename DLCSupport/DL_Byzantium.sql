-------------------------------------
--      Gaul & Byzantium DLC       --
-------------------------------------

----start bias for Gaul
insert or replace into StartBiasResources 
    (CivilizationType,      ResourceType,           Tier)
values
    ('CIVILIZATION_GAUL',  'RESOURCE_GOLD',        2);

insert or replace into Improvement_Adjacencies
    (ImprovementType,               YieldChangeId)
values
    ('IMPROVEMENT_MINE',            'Mine_Oppidum_Production'),
    ('IMPROVEMENT_QUARRY',          'Quarry_Oppidum_Production'),
    ('IMPROVEMENT_LUMBER_MILL',     'LumberMill_Oppidum_Production');

insert or replace into Improvement_Adjacencies
    (ImprovementType,               YieldChangeId)
select
    ImprovementType,                'BATEY_Hippodrome_Culture'
from Improvements where ImprovementType = 'IMPROVEMENT_BATEY';
insert or replace into Improvement_Adjacencies
    (ImprovementType,               YieldChangeId)
select
    ImprovementType,                'BATEY_Late_Hippodrome_Culture'
from Improvements where ImprovementType = 'IMPROVEMENT_BATEY';

insert or replace into Adjacency_YieldChanges
    (ID,                                Description,   YieldType,           YieldChange,    TilesRequired,  AdjacentRiver,
    AdjacentDistrict,               PrereqCivic,        PrereqTech, ObsoleteCivic,  ObsoleteTech,   AdjacentResourceClass)
values
    ('Mine_Oppidum_Production',         'Placeholder', 'YIELD_PRODUCTION',  1,              1,              0,
    'DISTRICT_OPPIDUM',             NULL,               NULL,       NULL,               NULL,           'NO_RESOURCECLASS'),
    ('Quarry_Oppidum_Production',       'Placeholder', 'YIELD_PRODUCTION',  1,              1,              0,
    'DISTRICT_OPPIDUM',             NULL,               NULL,       NULL,               NULL,           'NO_RESOURCECLASS'),
    ('LumberMill_Oppidum_Production',   'Placeholder', 'YIELD_PRODUCTION',  1,              1,              0,
    'DISTRICT_OPPIDUM',             NULL,               NULL,       NULL,               NULL,           'NO_RESOURCECLASS'),
    ('BATEY_Hippodrome_Culture', 	    'Placeholder', 'YIELD_CULTURE',		1,				1,				0,
	'DISTRICT_HIPPODROME',		    NULL,			    NULL,		'CIVIC_HUMANISM',	NULL,		    'NO_RESOURCECLASS'),
	('BATEY_Late_Hippodrome_Culture', 	'Placeholder', 'YIELD_CULTURE',	    2,				1,				0,
	'DISTRICT_HIPPODROME',		    'CIVIC_HUMANISM',	NULL,	    NULL,			    NULL,			'NO_RESOURCECLASS');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
values
    ('PLOT_ADJACENT_TO_INDUSTRIAL_ZONE',                'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_OPPIDUM');

insert or replace into District_Adjacencies
    (DistrictType,                  YieldChangeId)
values
    ('DISTRICT_OPPIDUM',    'Oppidum_Mine_HalfProduction'),
    ('DISTRICT_OPPIDUM',    'Oppidum_Mine_Production'),
    ('DISTRICT_OPPIDUM',    'Oppidum_Quarry_HalfProduction'),
    ('DISTRICT_OPPIDUM',    'Oppidum_Quarry_Production'),
    ('DISTRICT_OPPIDUM',    'Oppidum_LumberMill_HalfProduction'),
    ('DISTRICT_OPPIDUM',    'Oppidum_LumberMill_Production');

insert or replace into Adjacency_YieldChanges
    (ID,                                     Description,                                    YieldType,          YieldChange,    TilesRequired,
    AdjacentImprovement,            PrereqCivic,    PrereqTech,             ObsoleteCivic,  ObsoleteTech)
values
    ('Oppidum_Mine_HalfProduction',          'LOC_DISTRICT_QUARRY_HALF_PRODUCTION',          'YIELD_PRODUCTION', 1,              2,
    'IMPROVEMENT_MINE',             NULL,           NULL,                   NULL,           'TECH_METAL_CASTING'),
    ('Oppidum_Mine_Production',              'LOC_DISTRICT_MINE_PRODUCTION',                 'YIELD_PRODUCTION', 1,              1,
    'IMPROVEMENT_MINE',             NULL,           'TECH_METAL_CASTING',   NULL,           NULL),
    ('Oppidum_Quarry_HalfProduction',        'LOC_DISTRICT_QUARRY_HALF_PRODUCTION',          'YIELD_PRODUCTION', 1,              2,
    'IMPROVEMENT_QUARRY',           NULL,           NULL,                   NULL,           'TECH_APPRENTICESHIP'),
    ('Oppidum_Quarry_Production',            'LOC_DISTRICT_QUARRY_PRODUCTION',               'YIELD_PRODUCTION', 1,              1,
    'IMPROVEMENT_QUARRY',           NULL,           'TECH_APPRENTICESHIP',  NULL,           NULL),
    ('Oppidum_LumberMill_HalfProduction',    'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',          'YIELD_PRODUCTION', 1,              2,
    'IMPROVEMENT_LUMBER_MILL',      NULL,           NULL,                   NULL,           'TECH_CONSTRUCTION'),
    ('Oppidum_LumberMill_Production',        'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',          'YIELD_PRODUCTION', 1,              1,
    'IMPROVEMENT_LUMBER_MILL',      NULL,           'TECH_CONSTRUCTION',    NULL,           NULL);

-- AI

insert or replace into AiListTypes (ListType) values
    ('AmbiorixBuildings'),
    ('AmbiorixDistricts'),
    ('AmbiorixYields');

insert or replace into AiLists
    (ListType,                  LeaderType,                         System)
values
    ('AmbiorixBuildings',       'TRAIT_LEADER_AMBIORIX',            'Buildings'),
    ('AmbiorixDistricts',       'TRAIT_LEADER_AMBIORIX',            'Districts'),
    ('AmbiorixYields',          'TRAIT_LEADER_AMBIORIX',            'Yields');

insert or replace into AiFavoredItems
    (ListType,                  Item,                       Favored,    Value)
values
    ('AmbiorixBuildings',       'BUILDING_WORKSHOP',        1,          0),
    ('AmbiorixDistricts',       'DISTRICT_OPPIDUM',         1,          0),
    ('GaulFavoredTechs',        'TECH_IRON_WORKING',        1,          0),
    ('AmbiorixYields',          'YIELD_FAITH',              1,          -20),
    ('AmbiorixYields',          'YIELD_FOOD',               1,          10),
    ('AmbiorixYields',          'YIELD_PRODUCTION',         1,          10);
