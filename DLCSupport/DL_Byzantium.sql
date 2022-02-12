-------------------------------------
--      Gaul & Byzantium DLC       --
-------------------------------------

-- Wonder

--BUILDING_STATUE_OF_ZEUS
---grants a GREAT_PERSON_CLASS_GENERAL
-- insert or replace into BuildingModifiers (BuildingType, ModifierId)
-- select   'BUILDING_STATUE_OF_ZEUS', 'STATUE_OF_ZEUS_GRANTS_GENERAL'
-- where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_STATUE_OF_ZEUS');

insert or replace into Modifiers    (ModifierId,ModifierType,   RunOnce,    Permanent) values
('STATUE_OF_ZEUS_GRANTS_GENERAL',   'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',1,1);

insert or replace into ModifierArguments (ModifierId,   Name,   Value) values
('STATUE_OF_ZEUS_GRANTS_GENERAL',   'Amount',   1),
('STATUE_OF_ZEUS_GRANTS_GENERAL',   'GreatPersonClassType', 'GREAT_PERSON_CLASS_GENERAL');

----

update Buildings set PrereqCivic = 'CIVIC_DRAMA_POETRY', AdjacentDistrict = 'DISTRICT_THEATER', RegionalRange = 5, RequiresRiver = 1 where BuildingType = 'BUILDING_STATUE_OF_ZEUS';

delete from Building_ValidTerrains where BuildingType = 'BUILDING_STATUE_OF_ZEUS';
delete from BuildingPrereqs where Building = 'BUILDING_STATUE_OF_ZEUS';
delete from Building_YieldChanges where BuildingType = 'BUILDING_STATUE_OF_ZEUS';

insert or replace into Building_YieldChanges
    (BuildingType,                  YieldType,          YieldChange)
values
    ('BUILDING_STATUE_OF_ZEUS',     'YIELD_CULTURE',    2),
    ('BUILDING_STATUE_OF_ZEUS',     'YIELD_FAITH',      2);

delete from BuildingModifiers where BuildingType = 'BUILDING_STATUE_OF_ZEUS' and ModifierId != 'TRAIT_FREE_BUILDER_AFTER_FININSHING_WONDER';

insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
select
    'BUILDING_STATUE_OF_ZEUS',      'STATUE_OF_ZEUS_INFLUENCE_POINTS_ATTACH'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_STATUE_OF_ZEUS');

insert or replace into Modifiers
    (ModifierId,                                    ModifierType,                               SubjectRequirementSetId)
select
    'STATUE_OF_ZEUS_INFLUENCE_POINTS_ATTACH',       'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'CITY_HAS_MONUMENT'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_STATUE_OF_ZEUS');

insert or replace into ModifierArguments
    (ModifierId,                                    Name,           Value)
select
    'STATUE_OF_ZEUS_INFLUENCE_POINTS_ATTACH',       'ModifierId',   'STATUE_OF_ZEUS_INFLUENCE_POINTS'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_STATUE_OF_ZEUS');

insert or replace into Modifiers
    (ModifierId,                                    ModifierType)
values
    ('STATUE_OF_ZEUS_INFLUENCE_POINTS',             'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN');

insert or replace into ModifierArguments
    (ModifierId,                                    Name,           Value)
values
    ('STATUE_OF_ZEUS_INFLUENCE_POINTS',             'Amount',       1);

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
    ('IMPROVEMENT_LUMBER_MILL',     'Lumber_Mill_Oppidum_Production');
    -- ('IMPROVEMENT_CAMP',            'Camp_Hippodrome_Gold');

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
    (ID,                                Description,    YieldType,          YieldChange,    TilesRequired,  AdjacentRiver,
    AdjacentDistrict,               PrereqCivic,    PrereqTech, ObsoleteCivic,  ObsoleteTech,   AdjacentResourceClass)
values
    ('Mine_Oppidum_Production',         'Placeholder', 'YIELD_PRODUCTION',  1,              1,              0,
    'DISTRICT_OPPIDUM',             NULL,           NULL,       NULL,           NULL,           'NO_RESOURCECLASS'),
    ('Quarry_Oppidum_Production',       'Placeholder', 'YIELD_PRODUCTION',  1,              1,              0,
    'DISTRICT_OPPIDUM',             NULL,           NULL,       NULL,           NULL,           'NO_RESOURCECLASS'),
    ('Lumber_Mill_Oppidum_Production',  'Placeholder', 'YIELD_PRODUCTION',  1,              1,              0,
    'DISTRICT_OPPIDUM',             NULL,           NULL,       NULL,           NULL,           'NO_RESOURCECLASS'),
    ('Camp_Hippodrome_Gold',            'Placeholder', 'YIELD_GOLD',        2,              1,              0,
    'DISTRICT_HIPPODROME',          NULL,           NULL,       NULL,           NULL,           'NO_RESOURCECLASS'),
    ('BATEY_Hippodrome_Culture', 	    'Placeholder', 'YIELD_CULTURE',		1,				1,				0,
	'DISTRICT_HIPPODROME',		    NULL,			NULL,		'CIVIC_HUMANISM',	NULL,		'NO_RESOURCECLASS'),
	('BATEY_Late_Hippodrome_Culture', 	'Placeholder', 'YIELD_CULTURE',	2,				1,				0,
	'DISTRICT_HIPPODROME',		    'CIVIC_HUMANISM',	NULL,	NULL,			NULL,			'NO_RESOURCECLASS');

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
