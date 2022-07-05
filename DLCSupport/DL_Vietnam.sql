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

---- 保护区新建筑
insert or ignore into Types
	(Type,								        Kind)
values
	('BUILDING_HD_MONASTERY',			        'KIND_BUILDING'),
	('BUILDING_HD_HOLYWATERS',			        'KIND_BUILDING'),

	('BUILDING_HD_JUNGLE_PRESERVE',		        'KIND_BUILDING'),
	('BUILDING_HD_WETLANDS_PRESERVE',	        'KIND_BUILDING'),
	('BUILDING_HD_WATER_PRESERVE',		        'KIND_BUILDING'),

	('BUILDING_HD_LANDFORM_EPO',		        'KIND_BUILDING'),
	('BUILDING_HD_RESOURCE_EPO',		        'KIND_BUILDING'),
	('BUILDING_HD_SPECIES_EPO',		            'KIND_BUILDING'),
	('BUILDING_HD_SCENIC_EPO',		            'KIND_BUILDING'),

    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',		'KIND_BUILDING'),
	('BUILDING_HD_DUMMY_FOREST_PRESERVE',		'KIND_BUILDING'),
	('BUILDING_HD_DUMMY_JUNGLE_PRESERVE',		'KIND_BUILDING'),
	('BUILDING_HD_DUMMY_WETLANDS_PRESERVE',     'KIND_BUILDING'),
	('BUILDING_HD_DUMMY_WATER_PRESERVE',		'KIND_BUILDING');

insert or ignore into Buildings
	(BuildingType,			                    PrereqDistrict,				PrereqCivic,		    PrereqTech, 	    Cost,	Maintenance,	PurchaseYield,		AdvisorType,			Name,								                Description)
values
	('BUILDING_HD_MONASTERY',	                'DISTRICT_PRESERVE',	    'CIVIC_MYSTICISM',	    NULL,       	    120,	1,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_MONASTERY_NAME',		            'LOC_BUILDING_HD_MONASTERY_DESCRIPTION'),
	('BUILDING_HD_HOLYWATERS',		            'DISTRICT_PRESERVE',	    'CIVIC_MYSTICISM',	    NULL,       	    120,	1,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_HOLYWATERS_NAME',			        'LOC_BUILDING_HD_HOLYWATERS_DESCRIPTION'),

	('BUILDING_HD_JUNGLE_PRESERVE',		        'DISTRICT_PRESERVE',	    'CIVIC_GUILDS',	        NULL,       	    200,	4,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_JUNGLE_PRESERVE_NAME',		        'LOC_BUILDING_HD_JUNGLE_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_WETLANDS_PRESERVE',           'DISTRICT_PRESERVE',	    NULL,	                'TECH_BUTTRESS',    200,	4,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_WETLANDS_PRESERVE_NAME',	        'LOC_BUILDING_HD_WETLANDS_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_WATER_PRESERVE',		        'DISTRICT_PRESERVE',	    NULL,	                'TECH_COMPASS_HD',  200,	4,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_WATER_PRESERVE_NAME',		        'LOC_BUILDING_HD_WATER_PRESERVE_DESCRIPTION'),
	
    ('BUILDING_HD_LANDFORM_EPO',		        'DISTRICT_PRESERVE',	    'CIVIC_CONSERVATION',	NULL,       	    600,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_LANDFORM_EPO_NAME',		        'LOC_BUILDING_HD_LANDFORM_EPO_DESCRIPTION'),
	('BUILDING_HD_RESOURCE_EPO',		        'DISTRICT_PRESERVE',	    NULL,	                'TECH_CHEMISTRY',   600,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_RESOURCE_EPO_NAME',		        'LOC_BUILDING_HD_RESOURCE_EPO_DESCRIPTION'),
	('BUILDING_HD_SPECIES_EPO',		            'DISTRICT_PRESERVE',	    NULL,	                'TECH_BIOLOGY_HD',  600,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_SPECIES_EPO_NAME',			        'LOC_BUILDING_HD_SPECIES_EPO_DESCRIPTION'),
	('BUILDING_HD_SCENIC_EPO',		            'DISTRICT_PRESERVE',	    'CIVIC_CONSERVATION',	NULL,       	    600,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_SCENIC_EPO_NAME',			        'LOC_BUILDING_HD_SCENIC_EPO_DESCRIPTION'),
	
    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',		'DISTRICT_CITY_CENTER',	    NULL,	                NULL,       	    1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_PREREQ_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_PREREQ_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_DUMMY_FOREST_PRESERVE',		'DISTRICT_CITY_CENTER',	    NULL,	                NULL,               1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_FOREST_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_FOREST_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_DUMMY_JUNGLE_PRESERVE',		'DISTRICT_CITY_CENTER',	    NULL,	                NULL,               1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_JUNGLE_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_JUNGLE_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_DUMMY_WETLANDS_PRESERVE',		'DISTRICT_CITY_CENTER',	    NULL,	                NULL,       	    1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_WETLANDS_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_WETLANDS_PRESERVE_DESCRIPTION'),
	('BUILDING_HD_DUMMY_WATER_PRESERVE',		'DISTRICT_CITY_CENTER',	    NULL,	                NULL,       	    1,	    0,				NULL,		        'ADVISOR_GENERIC',		'LOC_BUILDING_HD_DUMMY_WATER_PRESERVE_NAME',		'LOC_BUILDING_HD_DUMMY_WATER_PRESERVE_DESCRIPTION');
update Buildings set MaxPlayerInstances = 1 where BuildingType in ('BUILDING_HD_LANDFORM_EPO','BUILDING_HD_RESOURCE_EPO','BUILDING_HD_SPECIES_EPO','BUILDING_HD_SCENIC_EPO');
update Buildings set InternalOnly = 1 where BuildingType = 'BUILDING_HD_DUMMY_PREREQ_PRESERVE';
update Buildings set Maintenance = 1,	Cost = 120, AdvisorType = 'ADVISOR_GENERIC'                                         where BuildingType = 'BUILDING_GROVE';
update Buildings set Maintenance = 4,	Cost = 200, AdvisorType = 'ADVISOR_GENERIC', PrereqCivic = 'CIVIC_CIVIL_SERVICE'    where BuildingType = 'BUILDING_SANCTUARY';

insert or ignore into Buildings_XP2
    (BuildingType,                              Pillage)
values
    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',       0),
    ('BUILDING_HD_DUMMY_FOREST_PRESERVE',       0),
    ('BUILDING_HD_DUMMY_JUNGLE_PRESERVE',       0),
    ('BUILDING_HD_DUMMY_WETLANDS_PRESERVE',     0),
    ('BUILDING_HD_DUMMY_WATER_PRESERVE',        0);

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

delete from BuildingPrereqs where Building = 'BUILDING_SANCTUARY';
insert or ignore into BuildingPrereqs
	(Building,							        PrereqBuilding)
values
    ('BUILDING_HD_DUMMY_FOREST_PRESERVE',       'BUILDING_HD_DUMMY_PREREQ_PRESERVE'),
    ('BUILDING_HD_DUMMY_JUNGLE_PRESERVE',       'BUILDING_HD_DUMMY_PREREQ_PRESERVE'),
    ('BUILDING_HD_DUMMY_WETLANDS_PRESERVE',     'BUILDING_HD_DUMMY_PREREQ_PRESERVE'),
    ('BUILDING_HD_DUMMY_WATER_PRESERVE',        'BUILDING_HD_DUMMY_PREREQ_PRESERVE'),
    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',       'BUILDING_HD_DUMMY_FOREST_PRESERVE'),
    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',       'BUILDING_HD_DUMMY_JUNGLE_PRESERVE'),
    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',       'BUILDING_HD_DUMMY_WETLANDS_PRESERVE'),
    ('BUILDING_HD_DUMMY_PREREQ_PRESERVE',       'BUILDING_HD_DUMMY_WATER_PRESERVE'),

	('BUILDING_SANCTUARY',  			        'BUILDING_HD_DUMMY_FOREST_PRESERVE'),
    ('BUILDING_HD_JUNGLE_PRESERVE',		        'BUILDING_HD_DUMMY_JUNGLE_PRESERVE'),
    ('BUILDING_HD_WETLANDS_PRESERVE',	        'BUILDING_HD_DUMMY_WETLANDS_PRESERVE'),
    ('BUILDING_HD_WATER_PRESERVE',		        'BUILDING_HD_DUMMY_WATER_PRESERVE'),

    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_SANCTUARY'),
	('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_HD_LANDFORM_EPO',		        'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_SANCTUARY'),
	('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_HD_RESOURCE_EPO',		        'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_SPECIES_EPO',		            'BUILDING_SANCTUARY'),
	('BUILDING_HD_SPECIES_EPO',		            'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_SPECIES_EPO',		            'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_HD_SPECIES_EPO',		            'BUILDING_HD_WATER_PRESERVE'),
    ('BUILDING_HD_SCENIC_EPO',		            'BUILDING_SANCTUARY'),
	('BUILDING_HD_SCENIC_EPO',		            'BUILDING_HD_JUNGLE_PRESERVE'),
    ('BUILDING_HD_SCENIC_EPO',		            'BUILDING_HD_WETLANDS_PRESERVE'),
    ('BUILDING_HD_SCENIC_EPO',		            'BUILDING_HD_WATER_PRESERVE');

CREATE TABLE 'HD_NATURAL_WONDERS_TYPE'(
    'FeatureType' TEXT NOT NULL,
    'Type' TEXT
);

insert into HD_NATURAL_WONDERS_TYPE
    (FeatureType,                       Type)
values
    ('FEATURE_BARRIER_REEF',            'SEA'),
    ('FEATURE_CLIFFS_DOVER',            'SEA'),
    ('FEATURE_CRATER_LAKE',             'LAKE'),
    ('FEATURE_DEAD_SEA',                'LAKE'),
    ('FEATURE_EVEREST',                 'MOUNTAIN'),
    ('FEATURE_GALAPAGOS',               'SEA'),
    ('FEATURE_KILIMANJARO',             'MOUNTAIN'),
    ('FEATURE_PANTANAL',                'WETLANDS'),
    ('FEATURE_PIOPIOTAHI',              'SEA'),
    ('FEATURE_TORRES_DEL_PAINE',        'MOUNTAIN'),
    ('FEATURE_TSINGY',                  'MOUNTAIN'),
    ('FEATURE_YOSEMITE',                'MOUNTAIN'),
    ('FEATURE_HA_LONG_BAY',             'SEA'),
    ('FEATURE_EYJAFJALLAJOKULL',        'MOUNTAIN'),
    ('FEATURE_LYSEFJORDEN',             'SEA'),
    ('FEATURE_GIANTS_CAUSEWAY',         'SEA'),
    ('FEATURE_ULURU',                   'MOUNTAIN'),
    ('FEATURE_DELICATE_ARCH',           'MOUNTAIN'),
    ('FEATURE_EYE_OF_THE_SAHARA',       'LAND'),
    ('FEATURE_LAKE_RETBA',              'LAKE'),
    ('FEATURE_MATTERHORN',              'MOUNTAIN'),
    ('FEATURE_RORAIMA',                 'MOUNTAIN'),
    ('FEATURE_UBSUNUR_HOLLOW',          'WETLANDS'),
    ('FEATURE_ZHANGYE_DANXIA',          'MOUNTAIN'),
    ('FEATURE_CHOCOLATEHILLS',          'JUNGLE'),
    ('FEATURE_DEVILSTOWER',             'MOUNTAIN'),
    ('FEATURE_GOBUSTAN',                'MOUNTAIN'),
    ('FEATURE_IKKIL',                   'LAKE'),
    ('FEATURE_PAMUKKALE',               'LAKE'),
    ('FEATURE_VESUVIUS',                'MOUNTAIN'),
    ('FEATURE_WHITEDESERT',             'LAND'),
    ('FEATURE_BERMUDA_TRIANGLE',        'SEA'),
    ('FEATURE_FOUNTAIN_OF_YOUTH',       'LAKE'),
    ('FEATURE_PAITITI',                 'JUNGLE'),
    ('FEATURE_SUK_FUJI',                'MOUNTAIN'),
    ('FEATURE_SUK_TONLESAP',            'LAKE'),
    ('FEATURE_SUK_NGORONGORO_CRATER',   'FOREST'),
    ('FEATURE_SUK_GREATBLUEHOLE',       'SEA'),
    ('FEATURE_SUK_GRANDCANYON',         'LAKE');
delete from HD_NATURAL_WONDERS_TYPE where FeatureType not in (select FeatureType from Features where NaturalWonder = 1);

    -- 特效
delete from AppealHousingChanges where DistrictType = 'DISTRICT_PRESERVE';
delete from Adjacent_AppealYieldChanges where DistrictType = 'DISTRICT_PRESERVE';

insert or replace into DistrictModifiers
    (DistrictType,          ModifierId)
values
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_ADD_FOOD_1'),
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_ADD_FOOD_2'),
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_FEATURE_FLOODPLAINS_APPEAL'),
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_FEATURE_JUNGLE_APPEAL'),
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_FEATURE_MARSH_APPEAL'),
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_FEATURE_FLOODPLAINS_GRASSLAND_APPEAL'),
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_FEATURE_FLOODPLAINS_PLAINS_APPEAL'),

    ('DISTRICT_PRESERVE',   'HD_PRESERVE_GRANT_DUMMY_FOREST'),
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_GRANT_DUMMY_JUNGLE'),
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_GRANT_DUMMY_WETLANDS'),
    ('DISTRICT_PRESERVE',   'HD_PRESERVE_GRANT_DUMMY_WATER');

insert or replace into BuildingModifiers
    (BuildingType,                          ModifierId)
values
    ('BUILDING_GROVE',                      'HD_GROVE_PLOT_BONUS_1'),
    ('BUILDING_GROVE',                      'HD_GROVE_PLOT_BONUS_2'),
    ('BUILDING_GROVE',                      'HD_GROVE_PLOT_BONUS_3'),
    ('BUILDING_HD_MONASTERY',               'HD_MONASTERY_PLOT_CHARMING_BONUS_1'),
    ('BUILDING_HD_MONASTERY',               'HD_MONASTERY_PLOT_CHARMING_BONUS_2'),
    ('BUILDING_HD_MONASTERY',               'HD_MONASTERY_PLOT_BREATHTAKING_BONUS_1'),
    ('BUILDING_HD_MONASTERY',               'HD_MONASTERY_PLOT_BREATHTAKING_BONUS_2'),
    ('BUILDING_HD_HOLYWATERS',              'HD_HOLYWATERS_PLOT_BONUS_1'),
    ('BUILDING_HD_HOLYWATERS',              'HD_HOLYWATERS_PLOT_BONUS_2'),
    ('BUILDING_HD_HOLYWATERS',              'HD_HOLYWATERS_PLOT_BONUS_3'),

    ('BUILDING_SANCTUARY',                  'HD_SANCTUARY_PLOT_FOREST_BONUS'),
    ('BUILDING_SANCTUARY',                  'HD_SANCTUARY_PLOT_CHARMING_BONUS'),
    ('BUILDING_SANCTUARY',                  'HD_SANCTUARY_PLOT_BREATHTAKING_BONUS'),
    ('BUILDING_SANCTUARY',                  'HD_SANCTUARY_PLOT_NATURAL_WONDER_BONUS'),

    ('BUILDING_HD_JUNGLE_PRESERVE',         'HD_PRESERVE_FEATURE_JUNGLE_APPEAL'),
    ('BUILDING_HD_JUNGLE_PRESERVE',         'HD_JUNGLE_PRESERVE_PLOT_JUNGLE_BONUS'),
    ('BUILDING_HD_JUNGLE_PRESERVE',         'HD_JUNGLE_PRESERVE_PLOT_CHARMING_BONUS'),
    ('BUILDING_HD_JUNGLE_PRESERVE',         'HD_JUNGLE_PRESERVE_PLOT_BREATHTAKING_BONUS'),
    ('BUILDING_HD_JUNGLE_PRESERVE',         'HD_JUNGLE_PRESERVE_PLOT_NATURAL_WONDER_BONUS'),

    ('BUILDING_HD_WETLANDS_PRESERVE',       'HD_PRESERVE_FEATURE_FLOODPLAINS_APPEAL'),
    ('BUILDING_HD_WETLANDS_PRESERVE',       'HD_PRESERVE_FEATURE_MARSH_APPEAL'),
    ('BUILDING_HD_WETLANDS_PRESERVE',       'HD_PRESERVE_FEATURE_FLOODPLAINS_GRASSLAND_APPEAL'),
    ('BUILDING_HD_WETLANDS_PRESERVE',       'HD_PRESERVE_FEATURE_FLOODPLAINS_PLAINS_APPEAL'),
    ('BUILDING_HD_WETLANDS_PRESERVE',       'HD_WETLANDS_PRESERVE_PLOT_WETLANDS_BONUS'),
    ('BUILDING_HD_WETLANDS_PRESERVE',       'HD_WETLANDS_PRESERVE_PLOT_CHARMING_BONUS'),
    ('BUILDING_HD_WETLANDS_PRESERVE',       'HD_WETLANDS_PRESERVE_PLOT_BREATHTAKING_BONUS'),
    ('BUILDING_HD_WETLANDS_PRESERVE',       'HD_WETLANDS_PRESERVE_PLOT_NATURAL_WONDER_BONUS'),

    ('BUILDING_HD_WATER_PRESERVE',          'HD_WATER_PRESERVE_PLOT_WATER_BONUS'),
    ('BUILDING_HD_WATER_PRESERVE',          'HD_WATER_PRESERVE_PLOT_FEATURE_BONUS'),
    ('BUILDING_HD_WATER_PRESERVE',          'HD_WATER_PRESERVE_PLOT_RESOURCE_BONUS'),
    ('BUILDING_HD_WATER_PRESERVE',          'HD_WATER_PRESERVE_PLOT_NATURAL_WONDER_BONUS');

insert or replace into Modifiers
	(ModifierId,													ModifierType,										SubjectRequirementSetId,                            OwnerRequirementSetId)
values
    ('HD_PRESERVE_ADD_FOOD_1',                                      'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_HAS_RESOURCE_OR_FEATURE',         NULL),
    ('HD_PRESERVE_ADD_FOOD_2',                                      'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_HAS_RESOURCE_OR_FEATURE',         'HD_ADJACENT_TO_NATURAL_WONDER'),
    ('HD_PRESERVE_FEATURE_FLOODPLAINS_APPEAL',                      'MODIFIER_CITY_ADJUST_FEATURE_APPEAL_MODIFIER',     NULL,                                               NULL),
    ('HD_PRESERVE_FEATURE_JUNGLE_APPEAL',                           'MODIFIER_CITY_ADJUST_FEATURE_APPEAL_MODIFIER',     NULL,                                               NULL),
    ('HD_PRESERVE_FEATURE_MARSH_APPEAL',                            'MODIFIER_CITY_ADJUST_FEATURE_APPEAL_MODIFIER',     NULL,                                               NULL),
    ('HD_PRESERVE_FEATURE_FLOODPLAINS_GRASSLAND_APPEAL',            'MODIFIER_CITY_ADJUST_FEATURE_APPEAL_MODIFIER',     NULL,                                               NULL),
    ('HD_PRESERVE_FEATURE_FLOODPLAINS_PLAINS_APPEAL',               'MODIFIER_CITY_ADJUST_FEATURE_APPEAL_MODIFIER',     NULL,                                               NULL),

    ('HD_PRESERVE_GRANT_DUMMY_FOREST',                              'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE','HD_CITY_HAS_PRESERVE_TIER1',                      'HD_ON_OR_ADJACENT_FOREST'),
    ('HD_PRESERVE_GRANT_DUMMY_JUNGLE',                              'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE','HD_CITY_HAS_PRESERVE_TIER1',                      'HD_ON_OR_ADJACENT_JUNGLE'),
    ('HD_PRESERVE_GRANT_DUMMY_WETLANDS',                            'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE','HD_CITY_HAS_PRESERVE_TIER1',                      'HD_ON_OR_ADJACENT_WETLANDS'),
    ('HD_PRESERVE_GRANT_DUMMY_WATER',                               'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE','HD_CITY_HAS_PRESERVE_TIER1',                      'HD_ON_OR_ADJACENT_WATER'),

    ('HD_GROVE_PLOT_BONUS_1',                                       'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_HAS_GROVE_FEATURE',               NULL),
    ('HD_GROVE_PLOT_BONUS_2',                                       'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_HAS_GROVE_FEATURE_RESOURCE',      NULL),
    ('HD_GROVE_PLOT_BONUS_3',                                       'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_HAS_GROVE_NATURAL_WONDER',        NULL),
    
    ('HD_MONASTERY_PLOT_CHARMING_BONUS_1',                          'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_CHARMING',                        NULL),
    ('HD_MONASTERY_PLOT_CHARMING_BONUS_2',                          'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_CHARMING',                        'HD_PLOT_ADJACENT_TO_MOUNTAIN_NATURAL_WONDERS'),
    ('HD_MONASTERY_PLOT_BREATHTAKING_BONUS_1',                      'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_BREATHTAKING',                    NULL),
    ('HD_MONASTERY_PLOT_BREATHTAKING_BONUS_2',                      'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_BREATHTAKING',                    'HD_PLOT_ADJACENT_TO_MOUNTAIN_NATURAL_WONDERS'),
    
    ('HD_HOLYWATERS_PLOT_BONUS_1',                                  'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_WATER',                           NULL),
    ('HD_HOLYWATERS_PLOT_BONUS_2',                                  'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_WATER_FEATURE_RESOURCE',          NULL),
    ('HD_HOLYWATERS_PLOT_BONUS_3',                                  'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                'HD_ADJACENT_PLOT_SEA_NATURAL_WONDER_ONLAND',       NULL),

    ('HD_SANCTUARY_PLOT_FOREST_BONUS',                              'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_FOREST_REQUIREMENTS',                  NULL),
    ('HD_SANCTUARY_PLOT_CHARMING_BONUS',                            'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_CHARMING_FOREST_RESOURCE',             NULL),
    ('HD_SANCTUARY_PLOT_BREATHTAKING_BONUS',                        'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_BREATHTAKING_FOREST_RESOURCE',         NULL),
    ('HD_SANCTUARY_PLOT_NATURAL_WONDER_BONUS',                      'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_FOREST_NATURAL_WONDER',                NULL),

    ('HD_JUNGLE_PRESERVE_PLOT_JUNGLE_BONUS',                        'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_JUNGLE_REQUIREMENTS',                  NULL),
    ('HD_JUNGLE_PRESERVE_PLOT_CHARMING_BONUS',                      'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_CHARMING_JUNGLE_RESOURCE',             NULL),
    ('HD_JUNGLE_PRESERVE_PLOT_BREATHTAKING_BONUS',                  'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_BREATHTAKING_JUNGLE_RESOURCE',         NULL),
    ('HD_JUNGLE_PRESERVE_PLOT_NATURAL_WONDER_BONUS',                'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_JUNGLE_NATURAL_WONDER',                NULL),

    ('HD_WETLANDS_PRESERVE_PLOT_WETLANDS_BONUS',                    'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_WETLANDS_REQUIREMENTS',                NULL),
    ('HD_WETLANDS_PRESERVE_PLOT_CHARMING_BONUS',                    'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_CHARMING_WETLANDS_RESOURCE',           NULL),
    ('HD_WETLANDS_PRESERVE_PLOT_BREATHTAKING_BONUS',                'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_BREATHTAKING_WETLANDS_RESOURCE',       NULL),
    ('HD_WETLANDS_PRESERVE_PLOT_NATURAL_WONDER_BONUS',              'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_WETLANDS_NATURAL_WONDER',              NULL),

    ('HD_WATER_PRESERVE_PLOT_WATER_BONUS',                          'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_COAST_REQUIREMENTS',                      NULL),
    ('HD_WATER_PRESERVE_PLOT_FEATURE_BONUS',                        'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_SEA_FEATURE',                          NULL),
    ('HD_WATER_PRESERVE_PLOT_RESOURCE_BONUS',                       'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_WATER_RESOURCE',                       NULL),
    ('HD_WATER_PRESERVE_PLOT_NATURAL_WONDER_BONUS',                 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'HD_PLOT_HAS_SEA_NATURAL_WONDER',                   NULL);

insert into ModifierArguments
	(ModifierId,										            Name,			Value)
values
    ('HD_PRESERVE_ADD_FOOD_1',                                      'YieldType',    'YIELD_FOOD'),
    ('HD_PRESERVE_ADD_FOOD_1',                                      'Amount',       1),
    ('HD_PRESERVE_ADD_FOOD_2',                                      'YieldType',    'YIELD_FOOD'),
    ('HD_PRESERVE_ADD_FOOD_2',                                      'Amount',       1),
    ('HD_PRESERVE_FEATURE_FLOODPLAINS_APPEAL',                      'FeatureType',  'FEATURE_FLOODPLAINS'),
    ('HD_PRESERVE_FEATURE_FLOODPLAINS_APPEAL',                      'Amount',       1),
    ('HD_PRESERVE_FEATURE_JUNGLE_APPEAL',                           'FeatureType',  'FEATURE_JUNGLE'),
    ('HD_PRESERVE_FEATURE_JUNGLE_APPEAL',                           'Amount',       1),
    ('HD_PRESERVE_FEATURE_MARSH_APPEAL',                            'FeatureType',  'FEATURE_MARSH'),
    ('HD_PRESERVE_FEATURE_MARSH_APPEAL',                            'Amount',       1),
    ('HD_PRESERVE_FEATURE_FLOODPLAINS_GRASSLAND_APPEAL',            'FeatureType',  'FEATURE_FLOODPLAINS_GRASSLAND'),
    ('HD_PRESERVE_FEATURE_FLOODPLAINS_GRASSLAND_APPEAL',            'Amount',       1),
    ('HD_PRESERVE_FEATURE_FLOODPLAINS_PLAINS_APPEAL',               'FeatureType',  'FEATURE_FLOODPLAINS_PLAINS'),
    ('HD_PRESERVE_FEATURE_FLOODPLAINS_PLAINS_APPEAL',               'Amount',       1),
    
    ('HD_GROVE_PLOT_BONUS_1',                                       'YieldType',    'YIELD_FOOD,YIELD_CULTURE'),
    ('HD_GROVE_PLOT_BONUS_1',                                       'Amount',       '1,1'),
    ('HD_GROVE_PLOT_BONUS_2',                                       'YieldType',    'YIELD_FOOD,YIELD_CULTURE'),
    ('HD_GROVE_PLOT_BONUS_2',                                       'Amount',       '1,1'),
    ('HD_GROVE_PLOT_BONUS_3',                                       'YieldType',    'YIELD_FOOD,YIELD_CULTURE'),
    ('HD_GROVE_PLOT_BONUS_3',                                       'Amount',       '2,2'),
    
    ('HD_MONASTERY_PLOT_CHARMING_BONUS_1',                          'YieldType',    'YIELD_FAITH'),
    ('HD_MONASTERY_PLOT_CHARMING_BONUS_1',                          'Amount',       '1'),
    ('HD_MONASTERY_PLOT_CHARMING_BONUS_2',                          'YieldType',    'YIELD_FAITH'),
    ('HD_MONASTERY_PLOT_CHARMING_BONUS_2',                          'Amount',       '1'),
    ('HD_MONASTERY_PLOT_BREATHTAKING_BONUS_1',                      'YieldType',    'YIELD_FOOD,YIELD_SCIENCE'),
    ('HD_MONASTERY_PLOT_BREATHTAKING_BONUS_1',                      'Amount',       '1,1'),
    ('HD_MONASTERY_PLOT_BREATHTAKING_BONUS_2',                      'YieldType',    'YIELD_FOOD,YIELD_SCIENCE'),
    ('HD_MONASTERY_PLOT_BREATHTAKING_BONUS_2',                      'Amount',       '1,1'),
    
    ('HD_HOLYWATERS_PLOT_BONUS_1',                                  'YieldType',    'YIELD_PRODUCTION,YIELD_FAITH'),
    ('HD_HOLYWATERS_PLOT_BONUS_1',                                  'Amount',       '1,1'),
    ('HD_HOLYWATERS_PLOT_BONUS_2',                                  'YieldType',    'YIELD_PRODUCTION,YIELD_SCIENCE'),
    ('HD_HOLYWATERS_PLOT_BONUS_2',                                  'Amount',       '1,1'),
    ('HD_HOLYWATERS_PLOT_BONUS_3',                                  'YieldType',    'YIELD_PRODUCTION,YIELD_SCIENCE,YIELD_FAITH'),
    ('HD_HOLYWATERS_PLOT_BONUS_3',                                  'Amount',       '2,1,1'),

    ('HD_SANCTUARY_PLOT_FOREST_BONUS',                              'YieldType',    'YIELD_FOOD'),
    ('HD_SANCTUARY_PLOT_FOREST_BONUS',                              'Amount',       1),
    ('HD_SANCTUARY_PLOT_CHARMING_BONUS',                            'YieldType',    'YIELD_CULTURE'),
    ('HD_SANCTUARY_PLOT_CHARMING_BONUS',                            'Amount',       1),
    ('HD_SANCTUARY_PLOT_BREATHTAKING_BONUS',                        'YieldType',    'YIELD_CULTURE'),
    ('HD_SANCTUARY_PLOT_BREATHTAKING_BONUS',                        'Amount',       1),
    ('HD_SANCTUARY_PLOT_NATURAL_WONDER_BONUS',                      'YieldType',    'YIELD_FOOD,YIELD_CULTURE'),
    ('HD_SANCTUARY_PLOT_NATURAL_WONDER_BONUS',                      'Amount',       '1,2'),

    ('HD_JUNGLE_PRESERVE_PLOT_JUNGLE_BONUS',                        'YieldType',    'YIELD_PRODUCTION'),
    ('HD_JUNGLE_PRESERVE_PLOT_JUNGLE_BONUS',                        'Amount',       1),
    ('HD_JUNGLE_PRESERVE_PLOT_CHARMING_BONUS',                      'YieldType',    'YIELD_SCIENCE'),
    ('HD_JUNGLE_PRESERVE_PLOT_CHARMING_BONUS',                      'Amount',       1),
    ('HD_JUNGLE_PRESERVE_PLOT_BREATHTAKING_BONUS',                  'YieldType',    'YIELD_SCIENCE'),
    ('HD_JUNGLE_PRESERVE_PLOT_BREATHTAKING_BONUS',                  'Amount',       1),
    ('HD_JUNGLE_PRESERVE_PLOT_NATURAL_WONDER_BONUS',                'YieldType',    'YIELD_PRODUCTION,YIELD_SCIENCE'),
    ('HD_JUNGLE_PRESERVE_PLOT_NATURAL_WONDER_BONUS',                'Amount',       '1,2'),

    ('HD_WETLANDS_PRESERVE_PLOT_WETLANDS_BONUS',                    'YieldType',    'YIELD_PRODUCTION'),
    ('HD_WETLANDS_PRESERVE_PLOT_WETLANDS_BONUS',                    'Amount',       1),
    ('HD_WETLANDS_PRESERVE_PLOT_CHARMING_BONUS',                    'YieldType',    'YIELD_FOOD'),
    ('HD_WETLANDS_PRESERVE_PLOT_CHARMING_BONUS',                    'Amount',       1),
    ('HD_WETLANDS_PRESERVE_PLOT_BREATHTAKING_BONUS',                'YieldType',    'YIELD_SCIENCE'),
    ('HD_WETLANDS_PRESERVE_PLOT_BREATHTAKING_BONUS',                'Amount',       1),
    ('HD_WETLANDS_PRESERVE_PLOT_NATURAL_WONDER_BONUS',              'YieldType',    'YIELD_FOOD,YIELD_PRODUCTION,YIELD_SCIENCE'),
    ('HD_WETLANDS_PRESERVE_PLOT_NATURAL_WONDER_BONUS',              'Amount',       '1,1,1'),

    ('HD_WATER_PRESERVE_PLOT_WATER_BONUS',                          'YieldType',    'YIELD_PRODUCTION'),
    ('HD_WATER_PRESERVE_PLOT_WATER_BONUS',                          'Amount',       1),
    ('HD_WATER_PRESERVE_PLOT_FEATURE_BONUS',                        'YieldType',    'YIELD_FOOD'),
    ('HD_WATER_PRESERVE_PLOT_FEATURE_BONUS',                        'Amount',       1),
    ('HD_WATER_PRESERVE_PLOT_RESOURCE_BONUS',                       'YieldType',    'YIELD_CULTURE'),
    ('HD_WATER_PRESERVE_PLOT_RESOURCE_BONUS',                       'Amount',       1),
    ('HD_WATER_PRESERVE_PLOT_NATURAL_WONDER_BONUS',                 'YieldType',    'YIELD_FOOD,YIELD_PRODUCTION,YIELD_CULTURE'),
    ('HD_WATER_PRESERVE_PLOT_NATURAL_WONDER_BONUS',                 'Amount',       '1,1,1'),

    ('HD_PRESERVE_GRANT_DUMMY_FOREST',                              'BuildingType', 'BUILDING_HD_DUMMY_FOREST_PRESERVE'),
    ('HD_PRESERVE_GRANT_DUMMY_JUNGLE',                              'BuildingType', 'BUILDING_HD_DUMMY_JUNGLE_PRESERVE'),
    ('HD_PRESERVE_GRANT_DUMMY_WETLANDS',                            'BuildingType', 'BUILDING_HD_DUMMY_WETLANDS_PRESERVE'),
    ('HD_PRESERVE_GRANT_DUMMY_WATER',                               'BuildingType', 'BUILDING_HD_DUMMY_WATER_PRESERVE');

insert or ignore into Requirements
	(RequirementId,									                RequirementType)
values
    ('HD_PLOT_HAS_RESOURCE_OR_FEATURE_MET',   		                'REQUIREMENT_REQUIREMENTSET_IS_MET'),
    ('HD_PLOT_HAS_GROVE_FEATURE_MET',   		                    'REQUIREMENT_REQUIREMENTSET_IS_MET'),
    ('HD_PLOT_HAS_GROVE_NATURAL_WONDER_MET',   		                'REQUIREMENT_REQUIREMENTSET_IS_MET'),
    ('HD_PLOT_HAS_SEA_NATURAL_WONDER_MET',   		                'REQUIREMENT_REQUIREMENTSET_IS_MET'),
    ('HD_PLOT_HAS_WETLANDS_REQUIREMENTS_MET',   		            'REQUIREMENT_REQUIREMENTSET_IS_MET');

insert or ignore into RequirementArguments
	(RequirementId,									                Name,				    Value)
values
    ('HD_PLOT_HAS_RESOURCE_OR_FEATURE_MET',                         'RequirementSetId',     'HD_PLOT_HAS_RESOURCE_OR_FEATURE'),
    ('HD_PLOT_HAS_GROVE_FEATURE_MET',                               'RequirementSetId',     'HD_PLOT_HAS_GROVE_FEATURE'),
    ('HD_PLOT_HAS_GROVE_NATURAL_WONDER_MET',                        'RequirementSetId',     'HD_PLOT_HAS_GROVE_NATURAL_WONDER'),
    ('HD_PLOT_HAS_SEA_NATURAL_WONDER_MET',                          'RequirementSetId',     'HD_PLOT_HAS_SEA_NATURAL_WONDER'),
    ('HD_PLOT_HAS_WETLANDS_REQUIREMENTS_MET',                       'RequirementSetId',     'HD_PLOT_HAS_WETLANDS_REQUIREMENTS');

insert or ignore into RequirementSets
	(RequirementSetId,												RequirementSetType)
values
	('HD_ADJACENT_TO_NATURAL_WONDER',								'REQUIREMENTSET_TEST_ALL'),
    ('HD_PLOT_HAS_RESOURCE_OR_FEATURE',								'REQUIREMENTSET_TEST_ANY'),
    ('HD_ADJACENT_PLOT_HAS_RESOURCE_OR_FEATURE',					'REQUIREMENTSET_TEST_ALL'),

    ('HD_CITY_HAS_PRESERVE_TIER1',								    'REQUIREMENTSET_TEST_ANY'),
    ('HD_ON_OR_ADJACENT_FOREST',								    'REQUIREMENTSET_TEST_ANY'),
    ('HD_ON_OR_ADJACENT_JUNGLE',								    'REQUIREMENTSET_TEST_ANY'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'REQUIREMENTSET_TEST_ANY'),
    ('HD_ON_OR_ADJACENT_WATER',								        'REQUIREMENTSET_TEST_ANY'),

    ('HD_PLOT_HAS_GROVE_FEATURE',					                'REQUIREMENTSET_TEST_ANY'),
    ('HD_PLOT_HAS_GROVE_NATURAL_WONDER',					        'REQUIREMENTSET_TEST_ANY'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_FEATURE',					        'REQUIREMENTSET_TEST_ALL'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_NATURAL_WONDER',					'REQUIREMENTSET_TEST_ALL'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_FEATURE_RESOURCE',					'REQUIREMENTSET_TEST_ALL'),

    ('HD_PLOT_ADJACENT_TO_MOUNTAIN_NATURAL_WONDERS',				'REQUIREMENTSET_TEST_ANY'),
    ('HD_ADJACENT_PLOT_CHARMING',					                'REQUIREMENTSET_TEST_ALL'),
    ('HD_ADJACENT_PLOT_BREATHTAKING',					            'REQUIREMENTSET_TEST_ALL'),

    ('HD_ADJACENT_PLOT_WATER',					                    'REQUIREMENTSET_TEST_ALL'),
    ('HD_ADJACENT_PLOT_WATER_FEATURE_RESOURCE',					    'REQUIREMENTSET_TEST_ALL'),
    ('HD_ADJACENT_PLOT_SEA_NATURAL_WONDER_ONLAND',					'REQUIREMENTSET_TEST_ALL'),
    ('HD_PLOT_HAS_SEA_NATURAL_WONDER',					            'REQUIREMENTSET_TEST_ANY'),

    ('HD_PLOT_HAS_CHARMING_FOREST_RESOURCE',				        'REQUIREMENTSET_TEST_ALL'),
    ('HD_PLOT_HAS_BREATHTAKING_FOREST_RESOURCE',					'REQUIREMENTSET_TEST_ALL'),
    ('HD_PLOT_HAS_FOREST_NATURAL_WONDER',					        'REQUIREMENTSET_TEST_ANY'),

    ('HD_PLOT_HAS_CHARMING_JUNGLE_RESOURCE',				        'REQUIREMENTSET_TEST_ALL'),
    ('HD_PLOT_HAS_BREATHTAKING_JUNGLE_RESOURCE',					'REQUIREMENTSET_TEST_ALL'),
    ('HD_PLOT_HAS_JUNGLE_NATURAL_WONDER',					        'REQUIREMENTSET_TEST_ANY'),

    ('HD_PLOT_HAS_WETLANDS_REQUIREMENTS',				            'REQUIREMENTSET_TEST_ANY'),
    ('HD_PLOT_HAS_CHARMING_WETLANDS_RESOURCE',					    'REQUIREMENTSET_TEST_ALL'),
    ('HD_PLOT_HAS_BREATHTAKING_WETLANDS_RESOURCE',					'REQUIREMENTSET_TEST_ALL'),
    ('HD_PLOT_HAS_WETLANDS_NATURAL_WONDER',					        'REQUIREMENTSET_TEST_ANY'),

    ('HD_PLOT_HAS_WATER_RESOURCE',				                    'REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
values
	('HD_ADJACENT_TO_NATURAL_WONDER',								'REQUIRES_PLOT_ADJACENT_TO_NATURAL_WONDER'),
    ('HD_PLOT_HAS_RESOURCE_OR_FEATURE',								'PLOT_HAS_RESOURCE_REQUIREMENTS'),
    ('HD_PLOT_HAS_RESOURCE_OR_FEATURE',								'PLOT_HAS_ANY_FEATURE_REQUIREMENT'),
    ('HD_ADJACENT_PLOT_HAS_RESOURCE_OR_FEATURE',    				'HD_PLOT_HAS_RESOURCE_OR_FEATURE_MET'),
    ('HD_ADJACENT_PLOT_HAS_RESOURCE_OR_FEATURE',    				'ADJACENT_TO_OWNER'),

    ('HD_CITY_HAS_PRESERVE_TIER1',								    'REQUIRES_CITY_HAS_BUILDING_GROVE'),
    ('HD_CITY_HAS_PRESERVE_TIER1',								    'REQUIRES_CITY_HAS_BUILDING_HD_MONASTERY'),
    ('HD_CITY_HAS_PRESERVE_TIER1',								    'REQUIRES_CITY_HAS_BUILDING_HD_HOLYWATERS'),

    ('HD_ON_OR_ADJACENT_FOREST',								    'HD_REQUIRES_PLOT_HAS_FEATURE_FOREST'),
    ('HD_ON_OR_ADJACENT_FOREST',								    'HD_REQUIRES_PLOT_ADJACENT_TO_FEATURE_FOREST'),
    ('HD_ON_OR_ADJACENT_JUNGLE',								    'HD_REQUIRES_PLOT_HAS_FEATURE_JUNGLE'),
    ('HD_ON_OR_ADJACENT_JUNGLE',								    'HD_REQUIRES_PLOT_ADJACENT_TO_FEATURE_JUNGLE'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'HD_REQUIRES_PLOT_HAS_FEATURE_FLOODPLAINS'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'HD_REQUIRES_PLOT_ADJACENT_TO_FEATURE_FLOODPLAINS'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'HD_REQUIRES_PLOT_HAS_FEATURE_MARSH'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'HD_REQUIRES_PLOT_ADJACENT_TO_FEATURE_MARSH'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'HD_REQUIRES_PLOT_HAS_FEATURE_FLOODPLAINS_GRASSLAND'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'HD_REQUIRES_PLOT_ADJACENT_TO_FEATURE_FLOODPLAINS_GRASSLAND'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'HD_REQUIRES_PLOT_HAS_FEATURE_FLOODPLAINS_PLAINS'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'HD_REQUIRES_PLOT_ADJACENT_TO_FEATURE_FLOODPLAINS_PLAINS'),
    ('HD_ON_OR_ADJACENT_WETLANDS',								    'HD_REQUIRES_PLOT_ADJACENT_TO_FEATURE_OASIS'),
    ('HD_ON_OR_ADJACENT_WATER',								        'REQUIRES_PLOT_IS_ADJACENT_TO_COAST'),

    ('HD_PLOT_HAS_GROVE_FEATURE',					                'HD_REQUIRES_PLOT_HAS_FEATURE_JUNGLE'),
    ('HD_PLOT_HAS_GROVE_FEATURE',					                'HD_REQUIRES_PLOT_HAS_FEATURE_FOREST'),
    ('HD_PLOT_HAS_GROVE_FEATURE',					                'HD_REQUIRES_PLOT_HAS_FEATURE_OASIS'),
    ('HD_PLOT_HAS_GROVE_FEATURE',					                'HD_REQUIRES_PLOT_HAS_FEATURE_MARSH'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_FEATURE',          				'ADJACENT_TO_OWNER'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_FEATURE',          				'HD_PLOT_HAS_GROVE_FEATURE_MET'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_NATURAL_WONDER',      				'ADJACENT_TO_OWNER'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_NATURAL_WONDER',      				'HD_PLOT_HAS_GROVE_NATURAL_WONDER_MET'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_FEATURE_RESOURCE',    				'ADJACENT_TO_OWNER'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_FEATURE_RESOURCE',    				'HD_PLOT_HAS_GROVE_FEATURE_MET'),
    ('HD_ADJACENT_PLOT_HAS_GROVE_FEATURE_RESOURCE',    				'PLOT_HAS_RESOURCE_REQUIREMENTS'),

    ('HD_PLOT_ADJACENT_TO_MOUNTAIN_NATURAL_WONDERS',				'REQUIRES_PLOT_ADJACENT_TO_MOUNTAIN'),
    ('HD_ADJACENT_PLOT_CHARMING',					                'ADJACENT_TO_OWNER'),
    ('HD_ADJACENT_PLOT_CHARMING',					                'REQUIRES_PLOT_CHARMING_APPEAL'),
    ('HD_ADJACENT_PLOT_BREATHTAKING',					            'ADJACENT_TO_OWNER'),
    ('HD_ADJACENT_PLOT_BREATHTAKING',					            'REQUIRES_PLOT_BREATHTAKING_APPEAL'),

    ('HD_ADJACENT_PLOT_WATER',					                    'ADJACENT_TO_OWNER'),
    ('HD_ADJACENT_PLOT_WATER',					                    'REQUIRES_PLOT_HAS_COAST'),
    ('HD_ADJACENT_PLOT_WATER_FEATURE_RESOURCE',					    'ADJACENT_TO_OWNER'),
    ('HD_ADJACENT_PLOT_WATER_FEATURE_RESOURCE',					    'REQUIRES_PLOT_HAS_COAST'),
    ('HD_ADJACENT_PLOT_WATER_FEATURE_RESOURCE',					    'HD_PLOT_HAS_RESOURCE_OR_FEATURE_MET'),
    ('HD_ADJACENT_PLOT_SEA_NATURAL_WONDER_ONLAND',				    'ADJACENT_TO_OWNER'),
    ('HD_ADJACENT_PLOT_SEA_NATURAL_WONDER_ONLAND',				    'REQUIRES_PLOT_HAS_NOT_COAST'),
    ('HD_ADJACENT_PLOT_SEA_NATURAL_WONDER_ONLAND',				    'HD_PLOT_HAS_SEA_NATURAL_WONDER_MET'),

    ('HD_PLOT_HAS_CHARMING_FOREST_RESOURCE',				        'PLOT_IS_FOREST_REQUIREMENT'),
    ('HD_PLOT_HAS_CHARMING_FOREST_RESOURCE',				        'REQUIRES_PLOT_CHARMING_APPEAL'),
    ('HD_PLOT_HAS_CHARMING_FOREST_RESOURCE',				        'PLOT_HAS_RESOURCE_REQUIREMENTS'),
    ('HD_PLOT_HAS_BREATHTAKING_FOREST_RESOURCE',					'PLOT_IS_FOREST_REQUIREMENT'),
    ('HD_PLOT_HAS_BREATHTAKING_FOREST_RESOURCE',					'REQUIRES_PLOT_BREATHTAKING_APPEAL'),
    ('HD_PLOT_HAS_BREATHTAKING_FOREST_RESOURCE',					'PLOT_HAS_RESOURCE_REQUIREMENTS'),

    ('HD_PLOT_HAS_CHARMING_JUNGLE_RESOURCE',				        'PLOT_IS_JUNGLE_REQUIREMENT'),
    ('HD_PLOT_HAS_CHARMING_JUNGLE_RESOURCE',				        'REQUIRES_PLOT_CHARMING_APPEAL'),
    ('HD_PLOT_HAS_CHARMING_JUNGLE_RESOURCE',				        'PLOT_HAS_RESOURCE_REQUIREMENTS'),
    ('HD_PLOT_HAS_BREATHTAKING_JUNGLE_RESOURCE',					'PLOT_IS_JUNGLE_REQUIREMENT'),
    ('HD_PLOT_HAS_BREATHTAKING_JUNGLE_RESOURCE',					'REQUIRES_PLOT_BREATHTAKING_APPEAL'),
    ('HD_PLOT_HAS_BREATHTAKING_JUNGLE_RESOURCE',					'PLOT_HAS_RESOURCE_REQUIREMENTS'),

    ('HD_PLOT_HAS_WETLANDS_REQUIREMENTS',				            'HD_REQUIRES_PLOT_HAS_FEATURE_FLOODPLAINS'),
    ('HD_PLOT_HAS_WETLANDS_REQUIREMENTS',				            'HD_REQUIRES_PLOT_HAS_FEATURE_OASIS'),
    ('HD_PLOT_HAS_WETLANDS_REQUIREMENTS',				            'HD_REQUIRES_PLOT_HAS_FEATURE_MARSH'),
    ('HD_PLOT_HAS_WETLANDS_REQUIREMENTS',				            'HD_REQUIRES_PLOT_HAS_FEATURE_FLOODPLAINS_GRASSLAND'),
    ('HD_PLOT_HAS_WETLANDS_REQUIREMENTS',				            'HD_REQUIRES_PLOT_HAS_FEATURE_FLOODPLAINS_PLAINS'),
    ('HD_PLOT_HAS_CHARMING_WETLANDS_RESOURCE',					    'HD_PLOT_HAS_WETLANDS_REQUIREMENTS_MET'),
    ('HD_PLOT_HAS_CHARMING_WETLANDS_RESOURCE',					    'REQUIRES_PLOT_CHARMING_APPEAL'),
    ('HD_PLOT_HAS_CHARMING_WETLANDS_RESOURCE',					    'PLOT_HAS_RESOURCE_REQUIREMENTS'),
    ('HD_PLOT_HAS_BREATHTAKING_WETLANDS_RESOURCE',					'HD_PLOT_HAS_WETLANDS_REQUIREMENTS_MET'),
    ('HD_PLOT_HAS_BREATHTAKING_WETLANDS_RESOURCE',					'REQUIRES_PLOT_BREATHTAKING_APPEAL'),
    ('HD_PLOT_HAS_BREATHTAKING_WETLANDS_RESOURCE',					'PLOT_HAS_RESOURCE_REQUIREMENTS'),

    ('HD_PLOT_HAS_WATER_RESOURCE',				                    'REQUIRES_PLOT_HAS_COAST'),
    ('HD_PLOT_HAS_WATER_RESOURCE',				                    'PLOT_HAS_RESOURCE_REQUIREMENTS');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_PLOT_HAS_GROVE_NATURAL_WONDER',                             'HD_REQUIRES_PLOT_HAS_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type not in ('SEA','LAKE');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_PLOT_ADJACENT_TO_MOUNTAIN_NATURAL_WONDERS',                 'HD_REQUIRES_PLOT_ADJACENT_TO_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type = 'MOUNTAIN';

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_PLOT_HAS_SEA_NATURAL_WONDER',                               'HD_REQUIRES_PLOT_HAS_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type in ('SEA','LAKE');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_PLOT_HAS_FOREST_NATURAL_WONDER',                            'HD_REQUIRES_PLOT_HAS_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type = 'FOREST';

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_PLOT_HAS_JUNGLE_NATURAL_WONDER',                            'HD_REQUIRES_PLOT_HAS_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type = 'JUNGLE';

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_PLOT_HAS_WETLANDS_NATURAL_WONDER',                          'HD_REQUIRES_PLOT_HAS_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type = 'WETLANDS';

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_ON_OR_ADJACENT_FOREST',                                     'HD_REQUIRES_PLOT_ADJACENT_TO_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type = 'FOREST';

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_ON_OR_ADJACENT_JUNGLE',                                     'HD_REQUIRES_PLOT_ADJACENT_TO_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type = 'JUNGLE';

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_ON_OR_ADJACENT_WETLANDS',                                   'HD_REQUIRES_PLOT_ADJACENT_TO_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type = 'WETLANDS';

insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
select
    'HD_ON_OR_ADJACENT_WATER',                                      'HD_REQUIRES_PLOT_ADJACENT_TO_' || FeatureType
from HD_NATURAL_WONDERS_TYPE where Type in ('SEA','LAKE');