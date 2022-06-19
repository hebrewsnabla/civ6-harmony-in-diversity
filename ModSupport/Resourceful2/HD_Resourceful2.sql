--------------------------
-- Resourceful 2 by xhh --
--------------------------

-- 该文件于DL_Resources.sql文件之后加载

-- Basic
update Resources set LakeEligible = 0 where ResourceType = 'RESOURCE_SPONGE' or ResourceType = 'RESOURCE_SEA_URCHIN' or ResourceType = 'RESOURCE_ORCA' or
	ResourceType = 'RESOURCE_COD' or ResourceType = 'RESOURCE_MUSSELS';

-- Yield
insert or replace into Resource_YieldChanges
	(ResourceType,				YieldType,				YieldChange)
values
	-- 奢侈
	('RESOURCE_WOLF',			'YIELD_PRODUCTION',		1),
	('RESOURCE_WOLF',			'YIELD_GOLD',			1),
	('RESOURCE_TRAVERTINE',		'YIELD_SCIENCE',		1),
	('RESOURCE_TRAVERTINE',		'YIELD_GOLD',			1),
	('RESOURCE_TOXINS',			'YIELD_FOOD',			-1),
	('RESOURCE_TOXINS',			'YIELD_PRODUCTION',		1),
	('RESOURCE_TOXINS',			'YIELD_SCIENCE',		1),
	('RESOURCE_TOXINS',			'YIELD_GOLD',			1),
	('RESOURCE_TIGER',			'YIELD_CULTURE',		1),
	('RESOURCE_TIGER',			'YIELD_GOLD',			1),
	('RESOURCE_STRAWBERRY',		'YIELD_FOOD',			1),
	('RESOURCE_STRAWBERRY',		'YIELD_GOLD',			1),
	('RESOURCE_SPONGE',			'YIELD_GOLD',			3),
	('RESOURCE_SEA_URCHIN',		'YIELD_FOOD',			1),
	('RESOURCE_SEA_URCHIN',		'YIELD_GOLD',			1),
	('RESOURCE_SANDALWOOD',		'YIELD_FAITH',			1),
	('RESOURCE_SANDALWOOD',		'YIELD_GOLD',			2),
	('RESOURCE_SAKURA',			'YIELD_CULTURE',		1),
	('RESOURCE_SAKURA',			'YIELD_GOLD',			1),
	('RESOURCE_SAFFRON',		'YIELD_CULTURE',		1),
	('RESOURCE_SAFFRON',		'YIELD_GOLD',			1),
	('RESOURCE_RUBY',			'YIELD_PRODUCTION',		1),
	('RESOURCE_RUBY',			'YIELD_GOLD',			1),
	('RESOURCE_POPPIES',		'YIELD_CULTURE',		1),
	('RESOURCE_POPPIES',		'YIELD_GOLD',			1),
	('RESOURCE_PLATINUM',		'YIELD_PRODUCTION',		1),
	('RESOURCE_PLATINUM',		'YIELD_GOLD',			1),
	('RESOURCE_ORCA',			'YIELD_FOOD',			-1),
	('RESOURCE_ORCA',			'YIELD_SCIENCE',		1),
	('RESOURCE_ORCA',			'YIELD_GOLD',			3),
	('RESOURCE_LION',			'YIELD_CULTURE',		1),
	('RESOURCE_LION',			'YIELD_GOLD',			1),
	('RESOURCE_LAPIS',			'YIELD_SCIENCE',		1),
	('RESOURCE_LAPIS',			'YIELD_GOLD',			1),
	('RESOURCE_EBONY',			'YIELD_PRODUCTION',		1),
	('RESOURCE_EBONY',			'YIELD_GOLD',			1),
	('RESOURCE_CASHMERE',		'YIELD_CULTURE',		1),
	('RESOURCE_CASHMERE',		'YIELD_GOLD',			1),
	('RESOURCE_BAMBOO',			'YIELD_PRODUCTION',		1),
	('RESOURCE_BAMBOO',			'YIELD_GOLD',			1),
	('RESOURCE_ALABASTER',		'YIELD_CULTURE',		1),
	('RESOURCE_ALABASTER',		'YIELD_GOLD',			3),
	('RESOURCE_COD',			'YIELD_SCIENCE',		1),
	('RESOURCE_COD',			'YIELD_GOLD',			1),
	('RESOURCE_SALMON',			'YIELD_CULTURE',		1),
	('RESOURCE_SALMON',			'YIELD_GOLD',			1),
	('RESOURCE_ALOE',			'YIELD_FOOD',			1),
	('RESOURCE_ALOE',			'YIELD_GOLD',			1),
	('RESOURCE_MEDIHERBS',		'YIELD_SCIENCE',		1),
	('RESOURCE_MEDIHERBS',		'YIELD_GOLD',			1),
	('RESOURCE_QUARTZ',			'YIELD_PRODUCTION',		1),
	('RESOURCE_QUARTZ',			'YIELD_GOLD',			1),
	('RESOURCE_SEASHELLS',		'YIELD_GOLD',			4),
	-- 加成
	('RESOURCE_TOMATO',			'YIELD_FOOD',			1),
	('RESOURCE_TIN',			'YIELD_GOLD',			2),
	('RESOURCE_RUBBER',			'YIELD_PRODUCTION',		1),
	('RESOURCE_PINE',			'YIELD_PRODUCTION',		1),
	('RESOURCE_OAK',			'YIELD_FOOD',			1),
	('RESOURCE_MUSSELS',		'YIELD_PRODUCTION',		1),
	('RESOURCE_MUSHROOMS',		'YIELD_FAITH',			1),
	('RESOURCE_GRANITE',		'YIELD_PRODUCTION',		1),
	('RESOURCE_LIMESTONE',		'YIELD_FOOD',			-1),
	('RESOURCE_LIMESTONE',		'YIELD_PRODUCTION',		1),
	('RESOURCE_LIMESTONE',		'YIELD_GOLD',			2),
	('RESOURCE_LEAD',			'YIELD_FOOD',			-1),
	('RESOURCE_LEAD',			'YIELD_PRODUCTION',		2),
	('RESOURCE_HAM',			'YIELD_FOOD',			1),
	('RESOURCE_DATES',			'YIELD_GOLD',			2),
	('RESOURCE_BERRIES',		'YIELD_FOOD',			1),
	('RESOURCE_BARLEY',			'YIELD_FOOD',			1),
	('RESOURCE_BARLEY',			'YIELD_GOLD',			1);

-- Terrain
insert or replace into Resource_ValidTerrains
	(ResourceType,				TerrainType)
values
	-- 奢侈
	('RESOURCE_WOLF',			'TERRAIN_GRASS'),
	('RESOURCE_WOLF',			'TERRAIN_PLAINS'),
	('RESOURCE_WOLF',			'TERRAIN_TUNDRA'),
	('RESOURCE_WOLF',			'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_TRAVERTINE',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_STRAWBERRY',		'TERRAIN_GRASS'),
	('RESOURCE_RUBY',			'TERRAIN_DESERT_HILLS'),
	('RESOURCE_RUBY',			'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_RUBY',			'TERRAIN_GRASS'),
	('RESOURCE_RUBY',			'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_POPPIES',		'TERRAIN_PLAINS'),
	('RESOURCE_POPPIES',		'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_PLATINUM',		'TERRAIN_DESERT'),
	('RESOURCE_PLATINUM',		'TERRAIN_TUNDRA'),
	('RESOURCE_PLATINUM',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_PLATINUM',		'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_ORCA',			'TERRAIN_COAST'),
	('RESOURCE_LION',			'TERRAIN_PLAINS'),
	('RESOURCE_LION',			'TERRAIN_DESERT'),
	('RESOURCE_LAPIS',			'TERRAIN_TUNDRA'),
	('RESOURCE_LAPIS',			'TERRAIN_DESERT_HILLS'),
	('RESOURCE_LAPIS',			'TERRAIN_GRASS'),
	('RESOURCE_LAPIS',			'TERRAIN_GRASS_HILLS'),
	('RESOURCE_CASHMERE',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_CASHMERE',		'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_BAMBOO',			'TERRAIN_GRASS'),
	('RESOURCE_ALABASTER',		'TERRAIN_TUNDRA'),
	('RESOURCE_ALABASTER',		'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_ALABASTER',		'TERRAIN_DESERT'),
	('RESOURCE_ALABASTER',		'TERRAIN_DESERT_HILLS'),
	('RESOURCE_COD',			'TERRAIN_COAST'),
	('RESOURCE_SALMON',			'TERRAIN_COAST'),
	('RESOURCE_ALOE',			'TERRAIN_GRASS'),
	('RESOURCE_ALOE',			'TERRAIN_PLAINS'),
	('RESOURCE_ALOE',			'TERRAIN_DESERT'),
	('RESOURCE_MEDIHERBS',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_MEDIHERBS',		'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_QUARTZ',			'TERRAIN_DESERT'),
	('RESOURCE_QUARTZ',			'TERRAIN_DESERT_HILLS'),
	('RESOURCE_QUARTZ',			'TERRAIN_PLAINS'),
	('RESOURCE_QUARTZ',			'TERRAIN_GRASS_HILLS'),
	('RESOURCE_SEASHELLS',		'TERRAIN_COAST'),
	-- 加成
	('RESOURCE_TOMATO',			'TERRAIN_GRASS'),
	('RESOURCE_TOMATO',			'TERRAIN_PLAINS'),
	('RESOURCE_TIN',			'TERRAIN_GRASS_HILLS'),
	('RESOURCE_TIN',			'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_PINE',			'TERRAIN_TUNDRA'),
	('RESOURCE_PINE',			'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_MUSSELS',		'TERRAIN_COAST'),
	('RESOURCE_LIMESTONE',		'TERRAIN_GRASS'),
	('RESOURCE_LIMESTONE',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_GRANITE',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_GRANITE',		'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_GRANITE',		'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_LEAD',			'TERRAIN_GRASS'),
	('RESOURCE_LEAD',			'TERRAIN_GRASS_HILLS'),
	('RESOURCE_LEAD',			'TERRAIN_PLAINS'),
	('RESOURCE_LEAD',			'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_LEAD',			'TERRAIN_TUNDRA'),
	('RESOURCE_LEAD',			'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_HAM',			'TERRAIN_GRASS'),
	('RESOURCE_HAM',			'TERRAIN_PLAINS'),
	('RESOURCE_BERRIES',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_BERRIES',		'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_BARLEY',			'TERRAIN_TUNDRA'),
	('RESOURCE_BARLEY',			'TERRAIN_TUNDRA_HILLS');

-- Feature
insert or replace into Resource_ValidFeatures
	(ResourceType,				FeatureType)
values
	-- 奢侈
	('RESOURCE_WOLF',			'FEATURE_FOREST'),
	('RESOURCE_TRAVERTINE',		'FEATURE_GEOTHERMAL_FISSURE'),
	('RESOURCE_TOXINS',			'FEATURE_JUNGLE'),
	('RESOURCE_TOXINS',			'FEATURE_MARSH'),
	('RESOURCE_TIGER',			'FEATURE_FOREST'),
	('RESOURCE_TIGER',			'FEATURE_JUNGLE'),
	('RESOURCE_SPONGE',			'FEATURE_REEF'),
	('RESOURCE_SEA_URCHIN',		'FEATURE_REEF'),
	('RESOURCE_SANDALWOOD',		'FEATURE_JUNGLE'),
	('RESOURCE_SAKURA',			'FEATURE_FOREST'),
	('RESOURCE_SAFFRON',		'FEATURE_FLOODPLAINS'),
	('RESOURCE_SAFFRON',		'FEATURE_FLOODPLAINS_GRASSLAND'),
	('RESOURCE_SAFFRON',		'FEATURE_FLOODPLAINS_PLAINS'),
	('RESOURCE_RUBY',			'FEATURE_JUNGLE'),
	('RESOURCE_LAPIS',			'FEATURE_JUNGLE'),
	('RESOURCE_EBONY',			'FEATURE_JUNGLE'),
	('RESOURCE_BAMBOO',			'FEATURE_JUNGLE'),
	('RESOURCE_ALOE',			'FEATURE_OASIS'),
	('RESOURCE_MEDIHERBS',		'FEATURE_FOREST'),
	('RESOURCE_MEDIHERBS',		'FEATURE_MARSH'),
	('RESOURCE_QUARTZ',			'FEATURE_GEOTHERMAL_FISSURE'),
	('RESOURCE_QUARTZ',			'FEATURE_MARSH'),
	-- 加成
	('RESOURCE_TIN',			'FEATURE_GEOTHERMAL_FISSURE'),
	('RESOURCE_RUBBER',			'FEATURE_JUNGLE'),
	('RESOURCE_PINE',			'FEATURE_FOREST'),
	('RESOURCE_OAK',			'FEATURE_FOREST'),
	('RESOURCE_MUSSELS',		'FEATURE_REEF'),
	('RESOURCE_GRANITE',		'FEATURE_GEOTHERMAL_FISSURE'),
	('RESOURCE_GRANITE',		'FEATURE_JUNGLE'),
	('RESOURCE_MUSHROOMS',		'FEATURE_FOREST'),
	('RESOURCE_MUSHROOMS',		'FEATURE_JUNGLE'),
	('RESOURCE_MUSHROOMS',		'FEATURE_MARSH'),
	('RESOURCE_DATES',			'FEATURE_FLOODPLAINS'),
	('RESOURCE_DATES',			'FEATURE_OASIS'),
	('RESOURCE_BERRIES',		'FEATURE_FOREST'),
	('RESOURCE_BERRIES',		'FEATURE_MARSH');

insert or replace into Resource_ValidFeatures
	(ResourceType,				FeatureType)
select
	'RESOURCE_SEA_URCHIN',		'FEATURE_SUK_KELP'
where exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');

delete from Resource_ValidTerrains where ResourceType = 'RESOURCE_ORCA' and exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');

insert or replace into Resource_ValidFeatures
	(ResourceType,				FeatureType)
select
	'RESOURCE_ORCA',			'FEATURE_SUK_KELP'
where exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');

insert or replace into Resource_ValidFeatures
	(ResourceType,				FeatureType)
select
	'RESOURCE_COD',				'FEATURE_SUK_KELP'
where exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');

-- Frequency
	-- New Resources
update Resources set Frequency = (select Frequency from HDResourceful2_Basic where Resources.ResourceType = HDResourceful2_Basic.ResourceType) 
    where ResourceType in (select ResourceType from HDResourceful2_Basic);
update Resources set SeaFrequency = (select SeaFrequency from HDResourceful2_Basic where Resources.ResourceType = HDResourceful2_Basic.ResourceType) 
    where ResourceType in (select ResourceType from HDResourceful2_Basic);
update Resources set SeaFrequency = 5 where ResourceType = 'RESOURCE_ORCA' and exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');
    -- Old Resources
create TEMPORARY table "HDResourceful2_Old_Frequency"(
    "ResourceType"  TEXT,
    "Frequency"  INTEGER
);
insert or replace into HDResourceful2_Old_Frequency
	(ResourceType,					Frequency)
values
	('RESOURCE_JNR_PEAT',			3),
	('RESOURCE_STONE',				5),
	('RESOURCE_COPPER',				6),
	('RESOURCE_CATTLE',				4),
	('RESOURCE_DLV_BISON',			4),
	('RESOURCE_DEER',				4),
	('RESOURCE_SHEEP',				6),
	('RESOURCE_RICE',				7),
	('RESOURCE_WHEAT',				7),
	('RESOURCE_LEU_P0K_POTATOES',	4),
	('RESOURCE_BANANAS',			4),
	('RESOURCE_SUK_CAMEL',			4),
	('RESOURCE_MAIZE',				3),
	('RESOURCE_SUK_OBSIDIAN',		2),
	('RESOURCE_SUK_CHEESE',			2),
	('RESOURCE_GOLD',				2);
update Resources set Frequency = (select Frequency from HDResourceful2_Old_Frequency where Resources.ResourceType = HDResourceful2_Old_Frequency.ResourceType) 
    where ResourceType in (select ResourceType from HDResourceful2_Old_Frequency);
update Resources set SeaFrequency = 1 where ResourceType = 'RESOURCE_SUK_CAVIAR';

-- Improvement
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_MINE';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_QUARRY';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_FARM';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_PASTURE';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_FISHING_BOATS';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';

-- Buildings
	-- 工官
insert or ignore into RequirementSetRequirements
	(RequirementSetId,						RequirementId)
select
	'OFFICIAL_RUN_HANDCRAFT_REQUIREMENT',	'HD_REQUIRES_CITY_HAS_IMPROVED_' || r.ResourceType
from Resources r, Improvement_ValidResources i
where r.ResourceType = i.ResourceType and (i.ImprovementType = 'IMPROVEMENT_LUMBER_MILL')
	and (r.ResourceClassType = 'RESOURCECLASS_LUXURY' or r.ResourceClassType = 'RESOURCECLASS_BONUS');

-- Relogion Beliefs.
insert or replace into Types
	(Type,								Kind)
values
	-- Pantheon
	('BELIEF_PAN',		                'KIND_BELIEF'),
    ('BELIEF_HEART_OF_THE_WOODS',		'KIND_BELIEF');

insert or replace into Beliefs
	(BeliefType,						Name,										Description,											BeliefClassType)
values
	-- Pantheon
	('BELIEF_PAN',		                'LOC_BELIEF_PAN_NAME',		                'LOC_BELIEF_PAN_DL_DESCRIPTION',		                'BELIEF_CLASS_PANTHEON'),
    ('BELIEF_HEART_OF_THE_WOODS',		'LOC_BELIEF_HEART_OF_THE_WOODS_NAME',		'LOC_BELIEF_HEART_OF_THE_WOODS_DL_DESCRIPTION',		    'BELIEF_CLASS_PANTHEON');

insert or replace into BeliefsSortIndex
	(BeliefType,			SortIndex)
values
	('BELIEF_HEART_OF_THE_WOODS',	17),
	('BELIEF_PAN',					18);
insert or replace into BeliefModifiers
	(BeliefType,							ModifierID)
values
	-- Pantheon
	('BELIEF_PAN',			                'PAN_FAITH_LUMBER_MILL_ADJACENCY'),
    ('BELIEF_PAN',			                'PAN_CITY_LUMBER_MILL_FOOD'),
	('BELIEF_PAN',			                'PAN_LUMBER_MILL_GREAT_PROPHET'),
	('BELIEF_HEART_OF_THE_WOODS',			'HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_FOOD'),
    ('BELIEF_HEART_OF_THE_WOODS',			'HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_SCIENCE'),
	('BELIEF_HEART_OF_THE_WOODS',			'HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_FOOD'),
    ('BELIEF_HEART_OF_THE_WOODS',			'HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_SCIENCE');
	-- ('BELIEF_HEART_OF_THE_WOODS',			'HEART_OF_THE_WOODS_LUMBER_MILL_GOLD');

insert or replace into Modifiers
	(ModifierId,													ModifierType,										SubjectRequirementSetId)
values
    ('PAN_FAITH_LUMBER_MILL_ADJACENCY',				                'MODIFIER_ALL_CITIES_FEATURE_ADJACENCY',		    'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('PAN_CITY_LUMBER_MILL_FOOD',			                        'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_AND_CITY_HAS_HOLYSITE'),
	('PAN_CITY_LUMBER_MILL_FOOD_MODIFIER',	                        'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_LUMBER_MILL_REQUIREMENTS'),
	('PAN_LUMBER_MILL_GREAT_PROPHET',				                'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),			
	('PAN_LUMBER_MILL_GREAT_PROPHET_MODIFIER',		                'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT',	'PAN_CITY_HAS_IMPROVED_LUMBER_MILL_RESOURCE'),
    ('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_FOOD',				    'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',		        'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_FOOD_MODIFIER',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_LUXURY_LUMBER_MILL_REQUIREMENTS'),
    ('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_FOOD',				    'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',		        'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_FOOD_MODIFIER',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_BONUS_LUMBER_MILL_REQUIREMENTS'),

    ('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_SCIENCE',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',		        'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_SCIENCE_MODIFIER',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_LUXURY_LUMBER_MILL_REQUIREMENTS'),
    ('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_SCIENCE',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',		        'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_SCIENCE_MODIFIER',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_BONUS_LUMBER_MILL_REQUIREMENTS');

    -- ('HEART_OF_THE_WOODS_LUMBER_MILL_GOLD',				            'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',		        'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    -- ('HEART_OF_THE_WOODS_LUMBER_MILL_GOLD_MODIFIER',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_LUMBER_MILL_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,									        Name,					Value)
values
	('PAN_FAITH_LUMBER_MILL_ADJACENCY',				        'DistrictType',			'DISTRICT_HOLY_SITE'),
	('PAN_FAITH_LUMBER_MILL_ADJACENCY',				        'YieldType',			'YIELD_FAITH'),
	('PAN_FAITH_LUMBER_MILL_ADJACENCY',				        'FeatureType',		    'FEATURE_FOREST'),
	('PAN_FAITH_LUMBER_MILL_ADJACENCY',				        'Amount',				1),
	('PAN_FAITH_LUMBER_MILL_ADJACENCY',				        'Description',			'LOC_DISTRICT_LUMBER_MILL_FAITH'),
    ('PAN_CITY_LUMBER_MILL_FOOD',			                'ModifierId',			'PAN_CITY_LUMBER_MILL_FOOD_MODIFIER'),
	('PAN_CITY_LUMBER_MILL_FOOD_MODIFIER',	                'YieldType',			'YIELD_FOOD'),
	('PAN_CITY_LUMBER_MILL_FOOD_MODIFIER',	                'Amount',				1),
	('PAN_LUMBER_MILL_GREAT_PROPHET',				        'ModifierId',			'PAN_LUMBER_MILL_GREAT_PROPHET_MODIFIER'),			
	('PAN_LUMBER_MILL_GREAT_PROPHET_MODIFIER',		        'GreatPersonClassType',	'GREAT_PERSON_CLASS_PROPHET'),
	('PAN_LUMBER_MILL_GREAT_PROPHET_MODIFIER',		        'Amount',				3),

    ('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_FOOD',			'ModifierId',			'HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_FOOD_MODIFIER'),
	('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_FOOD_MODIFIER', 'YieldType',			'YIELD_FOOD'),
	('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_FOOD_MODIFIER', 'Amount',				1),	
    ('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_FOOD',			'ModifierId',			'HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_FOOD_MODIFIER'),
	('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_FOOD_MODIFIER', 'YieldType',			'YIELD_FOOD'),
	('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_FOOD_MODIFIER', 'Amount',				1),	

    ('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_SCIENCE',			    'ModifierId',			'HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_SCIENCE_MODIFIER'),
	('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_SCIENCE_MODIFIER',     'YieldType',			'YIELD_SCIENCE'),
	('HEART_OF_THE_WOODS_LUXURY_LUMBER_MILL_SCIENCE_MODIFIER',     'Amount',				1),	
    ('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_SCIENCE',			    'ModifierId',			'HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_SCIENCE_MODIFIER'),
	('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_SCIENCE_MODIFIER',     'YieldType',			'YIELD_SCIENCE'),
	('HEART_OF_THE_WOODS_BONUS_LUMBER_MILL_SCIENCE_MODIFIER',     'Amount',				1);

    -- ('HEART_OF_THE_WOODS_LUMBER_MILL_GOLD',			        'ModifierId',			'HEART_OF_THE_WOODS_LUMBER_MILL_GOLD_MODIFIER'),
	-- ('HEART_OF_THE_WOODS_LUMBER_MILL_GOLD_MODIFIER',        'YieldType',			'YIELD_GOLD'),
	-- ('HEART_OF_THE_WOODS_LUMBER_MILL_GOLD_MODIFIER',        'Amount',				1);

insert or ignore into RequirementSetRequirements
	(RequirementSetId,									RequirementId)
select
	'PAN_CITY_HAS_IMPROVED_LUMBER_MILL_RESOURCE',	    'HD_REQUIRES_CITY_HAS_IMPROVED_' || r.ResourceType
from Resources r, Improvement_ValidResources i
where r.ResourceType = i.ResourceType and i.ImprovementType = 'IMPROVEMENT_LUMBER_MILL'
	and (r.ResourceClassType = 'RESOURCECLASS_LUXURY' or r.ResourceClassType = 'RESOURCECLASS_BONUS');
