-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

-- Peat
update Resources set Frequency = 4 where ResourceType = 'RESOURCE_JNR_PEAT';

delete from Improvements_XP2 where ImprovementType in ('IMPROVEMENT_JNR_OASIS_FARM','IMPROVEMENT_JNR_REED_HOME');

-- Oasis Farm
-- Unlock by Drama and Poetry, change to 0.5 housing
update Improvements set PrereqTech = NULL, PrereqCivic = 'CIVIC_DRAMA_POETRY', TilesRequired = 2 where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM';
-- remove effect: Prevents Drought

-- Reed Home
-- Unlock by Craftsmanship
update Improvements set PrereqTech = NULL, PrereqCivic = 'CIVIC_CRAFTSMANSHIP', TilesRequired = 2 where ImprovementType = 'IMPROVEMENT_JNR_REED_HOME';

delete from Improvement_YieldChanges where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM';
delete from Improvement_YieldChanges where ImprovementType = 'IMPROVEMENT_JNR_REED_HOME';
insert or replace into Improvement_YieldChanges
        (ImprovementType,               YieldType,          YieldChange)
values  ('IMPROVEMENT_JNR_OASIS_FARM',  'YIELD_CULTURE',    1),
        ('IMPROVEMENT_JNR_OASIS_FARM',  'YIELD_GOLD',       0),
        ('IMPROVEMENT_JNR_REED_HOME',   'YIELD_PRODUCTION', 1),
        ('IMPROVEMENT_JNR_REED_HOME',   'YIELD_SCIENCE',    0);

-- --------------------------------------------------------------
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_JNR_OASIS_FARM';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_JNR_REED_HOME';
insert or replace into Improvement_BonusYieldChanges
    (Id,    ImprovementType,                YieldType,          BonusYieldChange,   PrereqTech,                 PrereqCivic)
values  
    (307,  'IMPROVEMENT_JNR_REED_HOME',    'YIELD_SCIENCE',     1,                  NULL,                       'CIVIC_GAMES_RECREATION'),
    (308,  'IMPROVEMENT_JNR_REED_HOME',    'YIELD_PRODUCTION',  1,                  'TECH_BUTTRESS',            NULL),
    (309,  'IMPROVEMENT_JNR_REED_HOME',    'YIELD_SCIENCE',     1,                  'TECH_BIOLOGY_HD',          NULL),
    (310,  'IMPROVEMENT_JNR_REED_HOME',    'YIELD_PRODUCTION',  1,                  'TECH_NANOTECHNOLOGY',      NULL),

    (311,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_GOLD',        2,                  'TECH_BUTTRESS',            NULL),
    -- (312,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_GOLD',        2,                  NULL,                       'CIVIC_MERCANTILISM'),
    (313,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_CULTURE',     1,                  'TECH_BIOLOGY_HD',          Null),
    (314,  'IMPROVEMENT_JNR_OASIS_FARM',   'YIELD_GOLD',        2,                  'TECH_SYNTHETIC_MATERIALS', NULL);

update Technologies set Description = 'LOC_TECH_BIOLOGY_HD_DESCRIPTION' where TechnologyType = 'TECH_BIOLOGY_HD';
update Technologies set Description = 'LOC_TECH_BUTTRESS_DESCRIPTION' where TechnologyType = 'TECH_BUTTRESS';
update Technologies set Description = 'LOC_TECH_NANOTECHNOLOGY_DESCRIPTION' where TechnologyType = 'TECH_NANOTECHNOLOGY';
update Civics set Description = 'LOC_CIVIC_GAMES_RECREATION_HD_DESCRIPTION' where CivicType = 'CIVIC_GAMES_RECREATION';
-- update Civics set Description = 'LOC_CIVIC_MERCANTILISM_HD_DESCRIPTION' where CivicType ='CIVIC_MERCANTILISM';

insert or replace into Adjacency_YieldChanges
	(ID,							        Description,	YieldType,			YieldChange,	TilesRequired,	AdjacentDistrict)
values
    ('HD_REED_HOME_PRODUCTION_AQUEDUCT',	'Placeholder',	'YIELD_PRODUCTION', 1,				1,				'DISTRICT_AQUEDUCT'),
	('HD_REED_HOME_PRODUCTION_BATH',        'Placeholder',	'YIELD_PRODUCTION', 1,				1,				'DISTRICT_BATH'),
	('HD_REED_HOME_PRODUCTION_DAM',	        'Placeholder',	'YIELD_PRODUCTION', 1,				1,				'DISTRICT_DAM'),

	('HD_OASIS_FARM_CULTURE_NEIGHBORHOOD',  'Placeholder',	'YIELD_GOLD',       2,				1,				'DISTRICT_NEIGHBORHOOD'),
	('HD_OASIS_FARM_CULTURE_MBANZA',	    'Placeholder',	'YIELD_GOLD',       2,				1,				'DISTRICT_MBANZA'),
    ('HD_OASIS_FARM_CULTURE_THEATER',       'Placeholder',	'YIELD_CULTURE',    1,				1,				'DISTRICT_THEATER'),
	('HD_OASIS_FARM_CULTURE_ACROPOLIS',	    'Placeholder',	'YIELD_CULTURE',    1,				1,				'DISTRICT_ACROPOLIS');

insert or replace into Improvement_Adjacencies
	(ImprovementType,			    YieldChangeId)
values
	('IMPROVEMENT_JNR_REED_HOME',	'HD_REED_HOME_PRODUCTION_AQUEDUCT'),
    ('IMPROVEMENT_JNR_REED_HOME',	'HD_REED_HOME_PRODUCTION_BATH'),
	('IMPROVEMENT_JNR_REED_HOME',	'HD_REED_HOME_PRODUCTION_DAM'),

    ('IMPROVEMENT_JNR_OASIS_FARM',	'HD_OASIS_FARM_CULTURE_NEIGHBORHOOD'),
    ('IMPROVEMENT_JNR_OASIS_FARM',	'HD_OASIS_FARM_CULTURE_MBANZA'),
	('IMPROVEMENT_JNR_OASIS_FARM',	'HD_OASIS_FARM_CULTURE_THEATER'),
	('IMPROVEMENT_JNR_OASIS_FARM',	'HD_OASIS_FARM_CULTURE_ACROPOLIS');

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
    ('JNR_OASIS_FARM_AMENITY',      'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',      Null);

insert or replace into ModifierArguments
    (ModifierId,                    Name,            Value)
values
    ('JNR_OASIS_FARM_AMENITY',      'Amount',       1);

------------------------------------------------------------------------
------------------------------------------------------------------------
insert or replace into Features_XP2
    (FeatureType,           ValidForReplacement)
values
    ('FEATURE_HD_SWAMP',    1);

insert or replace into Feature_ValidTerrains
    (FeatureType,           TerrainType)
values
    ('FEATURE_HD_SWAMP',    'TERRAIN_PLAINS'),
    ('FEATURE_HD_SWAMP',    'TERRAIN_PLAINS_HILLS');

insert or replace into Feature_Removes
    (FeatureType,           YieldType,          Yield)
values
    ('FEATURE_HD_SWAMP',    'YIELD_PRODUCTION', 24);

insert or replace into Improvement_ValidFeatures
    (ImprovementType,               FeatureType)
values
    ('IMPROVEMENT_JNR_REED_HOME',   'FEATURE_HD_SWAMP'),
    ('IMPROVEMENT_JNR_REED_HOME',   'FEATURE_FLOODPLAINS'),
    ('IMPROVEMENT_BARBARIAN_CAMP',  'FEATURE_HD_SWAMP'),
    ('IMPROVEMENT_GOODY_HUT',       'FEATURE_HD_SWAMP'),
    ('IMPROVEMENT_LAND_POLDER',     'FEATURE_HD_SWAMP'),
	('IMPROVEMENT_GREAT_WALL',		'FEATURE_HD_SWAMP');
insert or replace into Improvement_ValidFeatures
    (ImprovementType,               FeatureType)
select
    'IMPROVEMENT_METEOR_GOODY',     'FEATURE_HD_SWAMP'
where exists (select ImprovementType from Improvements where ImprovementType = 'IMPROVEMENT_METEOR_GOODY');

insert or replace into Improvement_InvalidAdjacentFeatures
    (ImprovementType,               FeatureType)
values
    ('IMPROVEMENT_MOAI',   			'FEATURE_HD_SWAMP');

insert or replace into Improvement_ValidFeatures
    (ImprovementType,               FeatureType)
select
    'IMPROVEMENT_SAILOR_WATCHTOWER','FEATURE_HD_SWAMP'
where exists (select ImprovementType from Improvements where ImprovementType = 'IMPROVEMENT_SAILOR_WATCHTOWER');

insert or replace into Building_RequiredFeatures
    (BuildingType,                  FeatureType)
values
    ('BUILDING_MONT_ST_MICHEL',     'FEATURE_HD_SWAMP');

insert or replace into Building_RequiredFeatures
    (BuildingType,                  FeatureType)
select
    'BUILDING_ETEMENANKI',         'FEATURE_HD_SWAMP'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_ETEMENANKI');

delete from Resource_ValidFeatures where ResourceType = 'RESOURCE_TOBACCO' and FeatureType = 'FEATURE_FOREST';

insert or replace into Resource_ValidFeatures
    (ResourceType,                  FeatureType)
values
    ('RESOURCE_IRON',               'FEATURE_HD_SWAMP'),
    ('RESOURCE_DEER',               'FEATURE_HD_SWAMP'),
    ('RESOURCE_GYPSUM',             'FEATURE_HD_SWAMP'),
    ('RESOURCE_WHEAT',              'FEATURE_HD_SWAMP'),
    ('RESOURCE_SALT',               'FEATURE_HD_SWAMP'),
    ('RESOURCE_ANTIQUITY_SITE',     'FEATURE_HD_SWAMP'),
    ('RESOURCE_TOBACCO',            'FEATURE_HD_SWAMP'),
    ('RESOURCE_AMBER',              'FEATURE_HD_SWAMP');

insert or replace into Resource_ValidFeatures
    (ResourceType,                  FeatureType)
select
    ResourceType,                   'FEATURE_HD_SWAMP'
from Resources where ResourceType in
    ('RESOURCE_WOLF','RESOURCE_TOXINS','RESOURCE_LEU_P0K_CAPYBARAS','RESOURCE_PINE','RESOURCE_LIMESTONE',
    'RESOURCE_P0K_MAPLE','RESOURCE_TIN','RESOURCE_HONEY','RESOURCE_BERRIES','RESOURCE_OAK','RESOURCE_SORGHUM');

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
select
    'BUILDING_ETEMENANKI',                 'ETEMENANKI_CULTURE_SWAMP'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_ETEMENANKI');

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
select
    'BUILDING_ETEMENANKI',                 'ETEMENANKI_PRODUCTION_SWAMP'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_ETEMENANKI');

insert or replace into BeliefModifiers
	(BeliefType,							    ModifierID)
values
    ('BELIEF_HD_DRUID',	                        'LADY_OF_THE_SWAMP_CULTURE');

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
select
    'BUILDING_JNR_JINJA',                  'JNR_JINJA_SWAMP_SCIENCE'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_JNR_JINJA');

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                                                       SubjectRequirementSetId)
values
    ('ETEMENANKI_CULTURE_SWAMP',            'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                'HD_PLOT_HAS_SWAMP_REQUIREMENTS'),
    ('ETEMENANKI_PRODUCTION_SWAMP',         'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                                'HD_PLOT_HAS_SWAMP_REQUIREMENTS'),
    ('JNR_JINJA_SWAMP_SCIENCE',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		                'HD_PLOT_HAS_SWAMP_REQUIREMENTS'),
    ('LADY_OF_THE_SWAMP_CULTURE',			'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				                'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('LADY_OF_THE_SWAMP_CULTURE_MODIFIER',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		                'HD_PLOT_HAS_SWAMP_REQUIREMENTS'),
    ('TRAIT_SWAMP_CULTIRE',	                'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',		            'HD_PLOT_HAS_SWAMP_REQUIREMENTS'),
    ('TRAIT_SWAMP_BUILDINGS_CULTIRE',       'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_FEATURE_YIELD_CHANGE',      Null);

insert or ignore into ModifierArguments
	(ModifierId,							Name,				Value)
values
    ('ETEMENANKI_CULTURE_SWAMP',            'YieldType',        'YIELD_CULTURE'),
    ('ETEMENANKI_CULTURE_SWAMP',            'Amount',           2),
    ('ETEMENANKI_PRODUCTION_SWAMP',         'YieldType',        'YIELD_PRODUCTION'),
    ('ETEMENANKI_PRODUCTION_SWAMP',         'Amount',           1),
    ('JNR_JINJA_SWAMP_SCIENCE',             'YieldType',        'YIELD_SCIENCE'),
    ('JNR_JINJA_SWAMP_SCIENCE',             'Amount',           2),
    ('LADY_OF_THE_SWAMP_CULTURE',           'ModifierId',       'LADY_OF_THE_SWAMP_CULTURE_MODIFIER'),
    ('LADY_OF_THE_SWAMP_CULTURE_MODIFIER',	'YieldType',        'YIELD_CULTURE,YIELD_PRODUCTION'),
    ('LADY_OF_THE_SWAMP_CULTURE_MODIFIER',	'Amount',           '1,2'),
    ('TRAIT_SWAMP_CULTIRE',	                'YieldType',        'YIELD_CULTURE'),
    ('TRAIT_SWAMP_CULTIRE',	                'Amount',           2),
    ('TRAIT_SWAMP_BUILDINGS_CULTIRE',	    'FeatureType',      'FEATURE_HD_SWAMP'),
    ('TRAIT_SWAMP_BUILDINGS_CULTIRE',	    'YieldType',        'YIELD_CULTURE'),
    ('TRAIT_SWAMP_BUILDINGS_CULTIRE',	    'Amount',           2);

-- insert or ignore into Requirements
-- 	(RequirementId,									        RequirementType)
-- values
--     ('HD_REQUIRES_PLOT_HAS_FEATURE_HD_SWAMP',               'REQUIREMENT_PLOT_FEATURE_TYPE_MATCHES'),
--     ('HD_REQUIRES_PLOT_ADJACENT_TO_FEATURE_HD_SWAMP',       'REQUIREMENT_PLOT_ADJACENT_FEATURE_TYPE_MATCHES');

-- insert or ignore into RequirementArguments
-- 	(RequirementId,									        Name,				Value)
-- values
--     ('HD_REQUIRES_PLOT_HAS_FEATURE_HD_SWAMP',               'FeatureType',      'FEATURE_HD_SWAMP'),
--     ('HD_REQUIRES_PLOT_ADJACENT_TO_FEATURE_HD_SWAMP',       'FeatureType',      'FEATURE_HD_SWAMP');

insert or ignore into RequirementSets
	(RequirementSetId,								RequirementSetType)
values
    ('HD_PLOT_HAS_SWAMP_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                              RequirementId)
values
    -- ('PLOT_HAS_REEDS_REQUIREMENTS',                 'HD_REQUIRES_PLOT_HAS_FEATURE_HD_SWAMP'),
    ('HD_PLOT_HAS_SWAMP_REQUIREMENTS',              'HD_REQUIRES_PLOT_HAS_FEATURE_HD_SWAMP');

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                              RequirementId)
select
    'PLOT_IS_JUNGLE_FOREST_MARSH_REQUIREMENTS',    'HD_REQUIRES_PLOT_HAS_FEATURE_HD_SWAMP'
where exists (select UnitType from Units where UnitType = 'UNIT_VIETNAMESE_VIETCONG');

insert or replace into TraitModifiers 
    (TraitType,                         ModifierId)
select
    'TRAIT_CIVILIZATION_VIETNAM',       'TRAIT_SWAMP_CULTIRE'
where exists (select CivilizationType from Civilizations where CivilizationType = 'CIVILIZATION_VIETNAM');

insert or replace into TraitModifiers 
    (TraitType,                         ModifierId)
select
    'TRAIT_CIVILIZATION_VIETNAM',       'TRAIT_SWAMP_BUILDINGS_CULTIRE'
where exists (select CivilizationType from Civilizations where CivilizationType = 'CIVILIZATION_VIETNAM');

insert or replace into TraitModifiers (TraitType,   ModifierId) 
    select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_SWAMP_VALID_' || DistrictType
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER'
    and exists (select CivilizationType from Civilizations where CivilizationType = 'CIVILIZATION_VIETNAM');

insert or replace into Modifiers    (ModifierId, ModifierType)
    select 'TRAIT_SWAMP_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER'
    and exists (select CivilizationType from Civilizations where CivilizationType = 'CIVILIZATION_VIETNAM');

insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_SWAMP_VALID_' || DistrictType, 'DistrictType', DistrictType
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER'
    and exists (select CivilizationType from Civilizations where CivilizationType = 'CIVILIZATION_VIETNAM');

insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_SWAMP_VALID_' || DistrictType, 'FeatureType', 'FEATURE_HD_SWAMP'
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER'
    and exists (select CivilizationType from Civilizations where CivilizationType = 'CIVILIZATION_VIETNAM');

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                              RequirementId)
select
    'TRIEU_FEATURE_REQUIREMENTS',                   'HD_REQUIRES_PLOT_HAS_FEATURE_HD_SWAMP'
where exists (select CivilizationType from Civilizations where CivilizationType = 'CIVILIZATION_VIETNAM');

-- 圣地相邻加成
insert or replace into District_Adjacencies
	(DistrictType,						YieldChangeId)
values
	('DISTRICT_HOLY_SITE',				'Swamp_Faith');
insert or replace into Adjacency_YieldChanges
	(ID,				Description,			YieldType,		YieldChange,	AdjacentFeature)
values
	('Swamp_Faith',		'LOC_SWAMP_FAITH',		'YIELD_FAITH',	1,				'FEATURE_HD_SWAMP');