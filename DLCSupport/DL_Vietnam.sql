-------------------------------------
--            Vietnam DLC          --
-------------------------------------

insert or replace into District_GreatPersonPoints
    (DistrictType,      GreatPersonClassType,           PointsPerTurn)
values
    ('DISTRICT_THANH',  'GREAT_PERSON_CLASS_GENERAL',   1);

update Districts set Appeal = 0 where DistrictType = 'DISTRICT_THANH';
-------------------------------------------------------------------------------------------------------------------------------
-- Vietnan Civ

-- Vietnam can build districts in all features and do not remove on forest jungle and marsh
-- rainforest +2 food forest +2 production marsh +2 science
-- district itself included

delete from TraitModifiers where ModifierId = 'TRAIT_DISTRICTS_FOREST_ONLY';
delete from TraitModifiers where ModifierId = 'TRAIT_DISTRICTS_MARSH_ONLY';
delete from TraitModifiers where ModifierId = 'TRAIT_DISTRICTS_JUNGLE_ONLY';

insert or replace into TraitModifiers (TraitType,   ModifierId) 
    select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_JUNGLE_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into TraitModifiers (TraitType,   ModifierId) 
    select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_MARSH_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into TraitModifiers (TraitType,   ModifierId) 
    select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_FOREST_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

-- insert or replace into Modifiers    (ModifierId, ModifierType)
--     select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
--     from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into Modifiers    (ModifierId, ModifierType)
    select 'TRAIT_MARSH_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into Modifiers    (ModifierId, ModifierType)
    select 'TRAIT_FOREST_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';    

-- insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
--     select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'DistrictType', DistrictType
--     from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_MARSH_VALID_' || DistrictType, 'DistrictType', DistrictType
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_FOREST_VALID_' || DistrictType, 'DistrictType', DistrictType
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
-- insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
--     select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'FeatureType', 'FEATURE_JUNGLE'
--     from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_MARSH_VALID_' || DistrictType, 'FeatureType', 'FEATURE_MARSH'
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_FOREST_VALID_' || DistrictType, 'FeatureType', 'FEATURE_FOREST'
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

update ModifierArguments set Value = 'YIELD_PRODUCTION' where ModifierId = 'TRAIT_FOREST_BUILDINGS_CULTURE' and Name = 'YieldType';
update ModifierArguments set Value = 'YIELD_FOOD' where ModifierId = 'TRAIT_JUNGLE_BUILDINGS_SCIENCE' and Name = 'YieldType';
update ModifierArguments set Value = 'YIELD_SCIENCE' where ModifierId = 'TRAIT_MARSH_BUILDINGS_PRODUCTION' and Name = 'YieldType';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_FOREST_BUILDINGS_CULTURE' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_JUNGLE_BUILDINGS_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_MARSH_BUILDINGS_PRODUCTION' and Name = 'Amount';

insert or replace into TraitModifiers 
    (TraitType, ModifierId)
values
    ('TRAIT_CIVILIZATION_VIETNAM','TRAIT_JUNGLE_FOOD'),
    ('TRAIT_CIVILIZATION_VIETNAM','TRAIT_WOODS_PRODUCTION'),
    ('TRAIT_CIVILIZATION_VIETNAM','TRAIT_MARSH_SCIENCE');

insert or replace into Modifiers
    (ModifierId,        ModifierType,       SubjectRequirementSetId)
values
    ('TRAIT_JUNGLE_FOOD',       'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',    'ZOO_RAINFOREST_REQUIREMENTS'),
    ('TRAIT_WOODS_PRODUCTION',  'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',    'PLOT_HAS_FOREST_REQUIREMENT'),
    ('TRAIT_MARSH_SCIENCE',     'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',    'PLOT_HAS_MARSH_REQUIREMENTS');

insert or replace into ModifierArguments    
    (ModifierId,                    Name,       Value) 
values
    ('TRAIT_JUNGLE_FOOD',           'Amount',       2),
    ('TRAIT_JUNGLE_FOOD',           'YieldType',    'YIELD_FOOD'),
    ('TRAIT_WOODS_PRODUCTION',      'Amount',       2),
    ('TRAIT_WOODS_PRODUCTION',      'YieldType',    'YIELD_PRODUCTION'),
    ('TRAIT_MARSH_SCIENCE',         'Amount',       2),
    ('TRAIT_MARSH_SCIENCE',         'YieldType',    'YIELD_SCIENCE');

------------------------------------------------------------------------------------------------------------------
-- Kublai
delete from TraitModifiers where (ModifierId = 'TRAIT_TRADING_POST_CIVIC_BOOST' or ModifierId = 'TRAIT_TRADING_POST_TECH_BOOST') and TraitType = 'TRAIT_LEADER_KUBLAI';
--越南种树前移
update ModifierArguments set Value = 'CIVIC_MYSTICISM' where ModifierId = 'TRAIT_PLANT_MEDIEVAL_WOODS' and Name = 'CivicType';
insert or replace into District_Adjacencies
	(DistrictType,								YieldChangeId)
values
    ('DISTRICT_THANH',							'Aerodrome_Industrial_Production'),
    ('DISTRICT_THANH',							'Station_Production'),
    ('DISTRICT_THANH',							'HD_IMPROVEMENT_ROMAN_FORT'),
--    ('DISTRICT_THANH',							'HD_IMPROVEMENT_SAILOR_WATCHTOWER'),
    ('DISTRICT_THANH',							'HD_IMPROVEMENT_FORT'),
    ('DISTRICT_THANH',							'HD_IMPROVEMENT_AIRSTRIP'),
    ('DISTRICT_THANH',							'HD_IMPROVEMENT_MOUNTAIN_TUNNEL'),
    ('DISTRICT_THANH',							'HD_IMPROVEMENT_MISSILE_SILO'),
--    ('DISTRICT_THANH',							'HD_IMPROVEMENT_ALCAZAR'),
    ('DISTRICT_THANH',							'HD_IMPROVEMENT_MAORI_PA');

------------------------------------------------------------------------------------------------------------------
---- 保护区新建筑
insert or ignore into Types
	(Type,								        Kind)
values
	('BUILDING_HD_MONASTERY',			        'KIND_BUILDING'),
	('BUILDING_HD_HOLYWATERS',			        'KIND_BUILDING'),

	('BUILDING_HD_JUNGLE_PRESERVE',		        'KIND_BUILDING'),
	('BUILDING_HD_WETLANDS_PRESERVE',	        'KIND_BUILDING'),
	('BUILDING_HD_WATER_PRESERVE',		        'KIND_BUILDING'),

    ('BUILDING_HD_CULTURE_HERITAGE_PRESERVE',	'KIND_BUILDING'),

	('BUILDING_HD_LANDFORM_EPO',		        'KIND_BUILDING'),
	('BUILDING_HD_RESOURCE_EPO',		        'KIND_BUILDING'),
	('BUILDING_HD_SPECIES_EPO',		            'KIND_BUILDING'),
	('BUILDING_HD_SCENIC_EPO',		            'KIND_BUILDING'),

    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',		'KIND_BUILDING'),
	('BUILDING_HD_DUMMY_FOREST_PRESERVE',		'KIND_BUILDING'),
	('BUILDING_HD_DUMMY_JUNGLE_PRESERVE',		'KIND_BUILDING'),
	('BUILDING_HD_DUMMY_WETLANDS_PRESERVE',     'KIND_BUILDING'),
	('BUILDING_HD_DUMMY_WATER_PRESERVE',		'KIND_BUILDING'),
	('BUILDING_HD_DUMMY_HERITAGE_PRESERVE',		'KIND_BUILDING');

insert or ignore into Buildings
	(BuildingType,			                    PrereqDistrict,				PrereqCivic,		    PrereqTech, 	    Cost,	Maintenance,	PurchaseYield,		AdvisorType,			Name,								                Description)
values
	('BUILDING_HD_MONASTERY',	                'DISTRICT_PRESERVE',	    NULL,	                'TECH_ASTROLOGY',   120,	1,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_MONASTERY_NAME',		            'LOC_BUILDING_HD_MONASTERY_DESCRIPTION'),
	('BUILDING_HD_HOLYWATERS',		            'DISTRICT_PRESERVE',	    'CIVIC_MYSTICISM',	    NULL,       	    120,	1,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_HOLYWATERS_NAME',			        'LOC_BUILDING_HD_HOLYWATERS_DESCRIPTION'),

	('BUILDING_HD_JUNGLE_PRESERVE',		        'DISTRICT_PRESERVE',	    'CIVIC_GUILDS',	        NULL,       	    240,	4,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_JUNGLE_PRESERVE_NAME',		        'LOC_BUILDING_HD_JUNGLE_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_WETLANDS_PRESERVE',           'DISTRICT_PRESERVE',	    NULL,	                'TECH_BUTTRESS',    240,	4,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_WETLANDS_PRESERVE_NAME',	        'LOC_BUILDING_HD_WETLANDS_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_WATER_PRESERVE',		        'DISTRICT_PRESERVE',	    NULL,	                'TECH_COMPASS_HD',  240,	4,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_WATER_PRESERVE_NAME',		        'LOC_BUILDING_HD_WATER_PRESERVE_DESCRIPTION'),
	
    ('BUILDING_HD_CULTURE_HERITAGE_PRESERVE',	'DISTRICT_PRESERVE',	    'CIVIC_HUMANISM',	    NULL,               240,	4,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_CULTURE_HERITAGE_PRESERVE_NAME',	'LOC_BUILDING_HD_CULTURE_HERITAGE_PRESERVE_DESCRIPTION'),

    ('BUILDING_HD_LANDFORM_EPO',		        'DISTRICT_PRESERVE',	    'CIVIC_CONSERVATION',	NULL,       	    480,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_LANDFORM_EPO_NAME',		        'LOC_BUILDING_HD_LANDFORM_EPO_DESCRIPTION'),
	('BUILDING_HD_RESOURCE_EPO',		        'DISTRICT_PRESERVE',	    NULL,	                'TECH_CHEMISTRY',   480,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_RESOURCE_EPO_NAME',		        'LOC_BUILDING_HD_RESOURCE_EPO_DESCRIPTION'),
	('BUILDING_HD_SPECIES_EPO',		            'DISTRICT_PRESERVE',	    NULL,	                'TECH_BIOLOGY_HD',  480,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_SPECIES_EPO_NAME',			        'LOC_BUILDING_HD_SPECIES_EPO_DESCRIPTION'),
	('BUILDING_HD_SCENIC_EPO',		            'DISTRICT_PRESERVE',	    'CIVIC_CONSERVATION',	NULL,       	    480,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_SCENIC_EPO_NAME',			        'LOC_BUILDING_HD_SCENIC_EPO_DESCRIPTION'),
	
    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',		'DISTRICT_CITY_CENTER',	    NULL,	                NULL,       	    1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_PREREQ_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_PREREQ_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_DUMMY_FOREST_PRESERVE',		NULL,	                    NULL,	                NULL,               1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_FOREST_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_FOREST_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_DUMMY_JUNGLE_PRESERVE',		NULL,	                    NULL,	                NULL,               1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_JUNGLE_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_JUNGLE_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_DUMMY_WETLANDS_PRESERVE',		NULL,	                    NULL,	                NULL,       	    1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_WETLANDS_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_WETLANDS_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_DUMMY_WATER_PRESERVE',		NULL,	                    NULL,	                NULL,       	    1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_WATER_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_WATER_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_DUMMY_HERITAGE_PRESERVE',		NULL,	                    NULL,	                NULL,       	    1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_HERITAGE_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_HERITAGE_PRESERVE_DESCRIPTION');
update Buildings set InternalOnly = 1 where BuildingType = 'BUILDING_HD_DUMMY_PREREQ_PRESERVE';
update Buildings set MaxPlayerInstances = 1 where BuildingType in ('BUILDING_HD_LANDFORM_EPO','BUILDING_HD_RESOURCE_EPO','BUILDING_HD_SPECIES_EPO','BUILDING_HD_SCENIC_EPO');
update Buildings set Maintenance = 1,	Cost = 120, AdvisorType = 'ADVISOR_GENERIC', PrereqCivic = NULL, PrereqTech = 'TECH_ARCHERY' where BuildingType = 'BUILDING_GROVE';
update Buildings set Maintenance = 4,	Cost = 240, AdvisorType = 'ADVISOR_GENERIC', PrereqCivic = 'CIVIC_CIVIL_SERVICE'    where BuildingType = 'BUILDING_SANCTUARY';

insert or ignore into Buildings_XP2
    (BuildingType,                              Pillage)
values
    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',       0),
    ('BUILDING_HD_DUMMY_FOREST_PRESERVE',       0),
    ('BUILDING_HD_DUMMY_JUNGLE_PRESERVE',       0),
    ('BUILDING_HD_DUMMY_WETLANDS_PRESERVE',     0),
    ('BUILDING_HD_DUMMY_WATER_PRESERVE',        0),
    ('BUILDING_HD_DUMMY_HERITAGE_PRESERVE',     0);

insert or ignore into MutuallyExclusiveBuildings
	(Building,							        MutuallyExclusiveBuilding)
values
	('BUILDING_GROVE',				            'BUILDING_HD_MONASTERY'),
	('BUILDING_GROVE',					        'BUILDING_HD_HOLYWATERS'),
    ('BUILDING_HD_MONASTERY',			        'BUILDING_GROVE'),
	('BUILDING_HD_MONASTERY',		            'BUILDING_HD_HOLYWATERS'),
    ('BUILDING_HD_HOLYWATERS',			        'BUILDING_HD_MONASTERY'),
	('BUILDING_HD_HOLYWATERS',		            'BUILDING_GROVE'),

    ('BUILDING_SANCTUARY',			            'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_SANCTUARY',			            'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_SANCTUARY',			            'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_JUNGLE_PRESERVE',		        'BUILDING_SANCTUARY'),
    ('BUILDING_HD_JUNGLE_PRESERVE',		        'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_HD_JUNGLE_PRESERVE',		        'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_WETLANDS_PRESERVE',	        'BUILDING_SANCTUARY'),
    ('BUILDING_HD_WETLANDS_PRESERVE',	        'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_WETLANDS_PRESERVE',	        'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_WATER_PRESERVE',		        'BUILDING_SANCTUARY'),
    ('BUILDING_HD_WATER_PRESERVE',		        'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_WATER_PRESERVE',	            'BUILDING_HD_WETLANDS_PRESERVE'),

    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_RESOURCE_EPO'),
    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_SPECIES_EPO'),
    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_SCENIC_EPO'),
    ('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_HD_LANDFORM_EPO'),
    ('BUILDING_HD_RESOURCE_EPO',	            'BUILDING_HD_SPECIES_EPO'),
    ('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_HD_SCENIC_EPO'),
    ('BUILDING_HD_SPECIES_EPO',			        'BUILDING_HD_LANDFORM_EPO'),
    ('BUILDING_HD_SPECIES_EPO',			        'BUILDING_HD_RESOURCE_EPO'),
    ('BUILDING_HD_SPECIES_EPO',			        'BUILDING_HD_SCENIC_EPO'),
    ('BUILDING_HD_SCENIC_EPO',			        'BUILDING_HD_LANDFORM_EPO'),
    ('BUILDING_HD_SCENIC_EPO',			        'BUILDING_HD_RESOURCE_EPO'),
    ('BUILDING_HD_SCENIC_EPO',			        'BUILDING_HD_SPECIES_EPO');

insert or ignore into BuildingPrereqs
	(Building,							        PrereqBuilding)
values
    ('BUILDING_HD_DUMMY_FOREST_PRESERVE',       'BUILDING_HD_DUMMY_PREREQ_PRESERVE'),
    ('BUILDING_HD_DUMMY_JUNGLE_PRESERVE',       'BUILDING_HD_DUMMY_PREREQ_PRESERVE'),
    ('BUILDING_HD_DUMMY_WETLANDS_PRESERVE',     'BUILDING_HD_DUMMY_PREREQ_PRESERVE'),
    ('BUILDING_HD_DUMMY_WATER_PRESERVE',        'BUILDING_HD_DUMMY_PREREQ_PRESERVE'),
    ('BUILDING_HD_DUMMY_HERITAGE_PRESERVE',     'BUILDING_HD_DUMMY_PREREQ_PRESERVE'),

	('BUILDING_SANCTUARY',  			        'BUILDING_HD_DUMMY_FOREST_PRESERVE'),
    ('BUILDING_HD_JUNGLE_PRESERVE',		        'BUILDING_HD_DUMMY_JUNGLE_PRESERVE'),
    ('BUILDING_HD_WETLANDS_PRESERVE',	        'BUILDING_HD_DUMMY_WETLANDS_PRESERVE'),
    ('BUILDING_HD_WATER_PRESERVE',		        'BUILDING_HD_DUMMY_WATER_PRESERVE'),
    ('BUILDING_HD_CULTURE_HERITAGE_PRESERVE',	'BUILDING_HD_DUMMY_HERITAGE_PRESERVE'),

    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_SANCTUARY'),
	('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_CULTURE_HERITAGE_PRESERVE'),

    ('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_SANCTUARY'),
	('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_HD_CULTURE_HERITAGE_PRESERVE'),

    ('BUILDING_HD_SPECIES_EPO',		            'BUILDING_SANCTUARY'),
	('BUILDING_HD_SPECIES_EPO',		            'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_SPECIES_EPO',		            'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_HD_SPECIES_EPO',		            'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_SPECIES_EPO',		            'BUILDING_HD_CULTURE_HERITAGE_PRESERVE'),

    ('BUILDING_HD_SCENIC_EPO',		            'BUILDING_SANCTUARY'),
	('BUILDING_HD_SCENIC_EPO',		            'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_SCENIC_EPO',		            'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_HD_SCENIC_EPO',		            'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_SCENIC_EPO',		            'BUILDING_HD_CULTURE_HERITAGE_PRESERVE');

update Buildings set InternalOnly = 1 where BuildingType in ('BUILDING_HD_LANDFORM_EPO', 'BUILDING_HD_RESOURCE_EPO', 'BUILDING_HD_SPECIES_EPO', 'BUILDING_HD_SCENIC_EPO');