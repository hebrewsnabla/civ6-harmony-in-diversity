-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

update Districts set Cost = 75, Entertainment = 0, PrereqTech = 'TECH_IRRIGATION' where DistrictType = 'DISTRICT_AQUEDUCT';
update Districts set Cost = 50, Entertainment = 1, PrereqTech = 'TECH_IRRIGATION' where DistrictType = 'DISTRICT_BATH';

update Buildings set Cost = 110, Maintenance = 2, CitizenSlots = 0, Housing = 1, Entertainment = 0, PrereqTech = 'TECH_CONSTRUCTION' where BuildingType = 'BUILDING_JNR_ORCHARD';
update Buildings set Cost = 110, Maintenance = 2, CitizenSlots = 0, Housing = 1, Entertainment = 0, PrereqTech = 'TECH_CONSTRUCTION' where BuildingType = 'BUILDING_JNR_HAMMER_WORKS';
update Buildings set Cost = 110, Maintenance = 2, CitizenSlots = 0, Housing = 1, Entertainment = 1, PrereqTech = 'TECH_ENGINEERING' where BuildingType = 'BUILDING_JNR_BATHHOUSE';
update Buildings set Cost = 220, Maintenance = 5, CitizenSlots = 0, Housing = 2, Entertainment = 1 where BuildingType = 'BUILDING_SEWER';

insert or replace into Building_YieldChanges
    (BuildingType,                  YieldType,          YieldChange)
values
    ('BUILDING_JNR_ORCHARD',        'YIELD_FOOD',       3),
    ('BUILDING_JNR_HAMMER_WORKS',   'YIELD_PRODUCTION', 2),
    ('BUILDING_JNR_HAMMER_WORKS',   'YIELD_SCIENCE',    2),
    ('BUILDING_JNR_BATHHOUSE',      'YIELD_CULTURE',    2);

delete from DistrictModifiers where DistrictType = 'DISTRICT_AQUEDUCT' and ModifierId = 'AQUEDUCT_ADDAMENITIES';
delete from DistrictModifiers where DistrictType = 'DISTRICT_BATH' and ModifierId = 'BATH_ADDAMENITIES';

insert or replace into DistrictModifiers
    (DistrictType,              ModifierId)
values
    ('DISTRICT_BATH',           'BATH_ADJUST_INSIDE_BUILDINGS_PRODUCTION_SPEED');

insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
values
    ('BUILDING_JNR_ORCHARD',        'AQUEDUCT_TIER_ONE_BUILDING_GROWTH_RATE'),
    ('BUILDING_JNR_HAMMER_WORKS',   'AQUEDUCT_TIER_ONE_BUILDING_GROWTH_RATE'),
    ('BUILDING_JNR_BATHHOUSE',      'AQUEDUCT_TIER_ONE_BUILDING_GROWTH_RATE'),
    -- 
    ('BUILDING_JNR_ORCHARD',        'ORCHARD_ADD_PLANTATION_FOOD'),
    ('BUILDING_JNR_ORCHARD',        'ORCHARD_ADD_PLANTATION_GOLD'),
    ('BUILDING_JNR_ORCHARD',        'ORCHARD_ADD_FARM_RESOURCE_FOOD'),
    ('BUILDING_JNR_ORCHARD',        'ORCHARD_ADD_FARM_RESOURCE_GOLD'),
    ('BUILDING_JNR_HAMMER_WORKS',   'HAMMER_WORKS_ADD_MINE_SCIENCE'),
    ('BUILDING_JNR_BATHHOUSE',      'BATHHOUSE_POP_CULTURE_MODIFIER'),
    ('BUILDING_JNR_BATHHOUSE',      'AQUEDUCT_ADDAMENITIES');

insert or replace into Modifiers
    (ModifierId,                                            ModifierType,                                               SubjectRequirementSetId)
values
    ('BATH_ADJUST_INSIDE_BUILDINGS_PRODUCTION_SPEED',       'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION',          NULL),
    -- 
    ('AQUEDUCT_TIER_ONE_BUILDING_GROWTH_RATE',              'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH',                  NULL),
    ('ORCHARD_ADD_PLANTATION_FOOD',                         'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'PLOT_HAS_PLANTATION_REQUIREMENTS'),
    ('ORCHARD_ADD_PLANTATION_GOLD',                         'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'PLOT_HAS_PLANTATION_REQUIREMENTS'),
    ('ORCHARD_ADD_FARM_RESOURCE_FOOD',                      'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'HD_PLOT_HAS_FARM_RESOURCE_REQUIREMENTS'),
    ('ORCHARD_ADD_FARM_RESOURCE_GOLD',                      'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'HD_PLOT_HAS_FARM_RESOURCE_REQUIREMENTS'),
    ('HAMMER_WORKS_ADD_MINE_SCIENCE',                       'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'PLOT_HAS_MINE_REQUIREMENTS'),
    ('BATHHOUSE_POP_CULTURE_MODIFIER',                      'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',    NULL);

insert or replace into ModifierArguments
    (ModifierId,                                        Name,           Value)
values
    ('BATH_ADJUST_INSIDE_BUILDINGS_PRODUCTION_SPEED',   'DistrictType', 'DISTRICT_AQUEDUCT'),
    ('BATH_ADJUST_INSIDE_BUILDINGS_PRODUCTION_SPEED',   'Amount',       50),
    -- 
    ('AQUEDUCT_TIER_ONE_BUILDING_GROWTH_RATE',          'Amount',       10),
    ('ORCHARD_ADD_PLANTATION_FOOD',                     'YieldType',    'YIELD_FOOD'),
    ('ORCHARD_ADD_PLANTATION_FOOD',                     'Amount',       1),
    ('ORCHARD_ADD_PLANTATION_GOLD',                     'YieldType',    'YIELD_GOLD'),
    ('ORCHARD_ADD_PLANTATION_GOLD',                     'Amount',       2),
    ('ORCHARD_ADD_FARM_RESOURCE_FOOD',                  'YieldType',    'YIELD_FOOD'),
    ('ORCHARD_ADD_FARM_RESOURCE_FOOD',                  'Amount',       1),
    ('ORCHARD_ADD_FARM_RESOURCE_GOLD',                  'YieldType',    'YIELD_GOLD'),
    ('ORCHARD_ADD_FARM_RESOURCE_GOLD',                  'Amount',       2),
    ('HAMMER_WORKS_ADD_MINE_SCIENCE',                   'YieldType',    'YIELD_SCIENCE'),
    ('HAMMER_WORKS_ADD_MINE_SCIENCE',                   'Amount',       1),
    ('BATHHOUSE_POP_CULTURE_MODIFIER',                  'YieldType',    'YIELD_CULTURE'),
    ('BATHHOUSE_POP_CULTURE_MODIFIER',                  'Amount',       0.3);

update ModifierArguments set Value = 20 where ModifierId = 'SEWER_GROWTH_RATE' and Name = 'Amount';
