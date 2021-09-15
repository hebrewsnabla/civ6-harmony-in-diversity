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
    ('IMPROVEMENT_CAMP',            'Camp_Hippodrome_Gold'),
	('IMPROVEMENT_BATEY',			'BATEY_Hippodrome_Culture'),
    ('IMPROVEMENT_BATEY',			'BATEY_Late_Hippodrome_Culture');

insert or replace into District_Adjacencies
    (DistrictType,                  YieldChangeId)
values
    ('DISTRICT_OPPIDUM',            'Oil_INDUSTRIAL_Production'),
    ('DISTRICT_OPPIDUM',            'AERODROME_INDUSTRIAL_Production'),
    ('DISTRICT_OPPIDUM',            'SEAOil_INDUSTRIAL_Production'),
    ('DISTRICT_OPPIDUM',            'Bath_Production'),
    ('DISTRICT_OPPIDUM',            'Aqueduct_Production'),
    ('DISTRICT_OPPIDUM',            'Dam_Production'),
    ('DISTRICT_OPPIDUM',            'Canal_Production'),
    ('DISTRICT_OPPIDUM',            'Mine_Production'),
    ('DISTRICT_OPPIDUM',	        'Harbor_INDUSTRIAL_Production'),
	('DISTRICT_OPPIDUM',	        'RoyalDock_INDUSTRIAL_Production'),
	('DISTRICT_OPPIDUM',	        'Cothon_INDUSTRIAL_Production');

insert or replace into Adjacency_YieldChanges
    (ID,                                Description,    YieldType,          YieldChange,    TilesRequired,  AdjacentRiver,
    AdjacentDistrict,               PrereqCivic,    PrereqTech, ObsoleteCivic,  ObsoleteTech,   AdjacentResourceClass)
values
    ('Mine_Oppidum_Production',         'Placeholder', 'YIELD_PRODUCTION',  1,              1,              0,
    'DISTRICT_OPPIDUM',             NULL,           NULL,       NULL,           NULL,           'NO_RESOURCECLASS'),
    ('Quarry_Oppidum_Production',       'Placeholder', 'YIELD_PRODUCTION',  1,              1,              0,
    'DISTRICT_OPPIDUM',             NULL,           NULL,       NULL,           NULL,           'NO_RESOURCECLASS'),
    ('Camp_Hippodrome_Gold',            'Placeholder', 'YIELD_GOLD',        2,              1,              0,
    'DISTRICT_HIPPODROME',          NULL,           NULL,       NULL,           NULL,           'NO_RESOURCECLASS'),
    ('BATEY_Hippodrome_Culture', 	    'Placeholder', 'YIELD_CULTURE',		1,				1,				0,
	'DISTRICT_HIPPODROME',		    NULL,			NULL,		'CIVIC_HUMANISM',	NULL,		'NO_RESOURCECLASS'),
	('BATEY_Late_Hippodrome_Culture', 	'Placeholder', 'YIELD_CULTURE',	2,				1,				0,
	'DISTRICT_HIPPODROME',		    'CIVIC_HUMANISM',	NULL,	NULL,			NULL,			'NO_RESOURCECLASS');

insert into District_CitizenGreatPersonPoints
    (DistrictType,                      GreatPersonClassType,               PointsPerTurn)
values
    ("DISTRICT_OPPIDUM",                "GREAT_PERSON_CLASS_ENGINEER",      2);


insert or replace into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
values
    ('PLOT_ADJACENT_TO_INDUSTRIAL_ZONE',                'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_OPPIDUM');


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
