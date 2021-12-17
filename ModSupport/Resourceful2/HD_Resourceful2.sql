--------------------------
-- Resourceful 2 by xhh --
--------------------------

-- 该文件于DL_Resources.sql文件之后加载

-- Basic
update Resources set ResourceClassType = 'RESOURCECLASS_LUXURY', Happiness = 4 
	where ResourceType = 'RESOURCE_COD' or ResourceType = 'RESOURCE_SALMON' or ResourceType = 'RESOURCE_ALOE' or ResourceType = 'RESOURCE_MEDIHERBS' or ResourceType = 'RESOURCE_QUARTZ';
update Resources set Happiness = 4 where ResourceType = 'RESOURCE_RUBY';
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
	('RESOURCE_TOXINS',			'YIELD_SCIENCE',		1),
	('RESOURCE_TOXINS',			'YIELD_GOLD',			1),
	('RESOURCE_TIGER',			'YIELD_SCIENCE',		1),
	('RESOURCE_TIGER',			'YIELD_GOLD',			1),
	('RESOURCE_STRAWBERRY',		'YIELD_FOOD',			1),
	('RESOURCE_STRAWBERRY',		'YIELD_GOLD',			1),
	('RESOURCE_SPONGE',			'YIELD_GOLD',			3),
	('RESOURCE_SEA_URCHIN',		'YIELD_FOOD',			1),
	('RESOURCE_SEA_URCHIN',		'YIELD_GOLD',			1),
	('RESOURCE_SANDALWOOD',		'YIELD_FAITH',			1),
	('RESOURCE_SANDALWOOD',		'YIELD_GOLD',			1),
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
	('RESOURCE_CASHMERE',		'YIELD_GOLD',			3),
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
	('RESOURCE_QUARTZ',			'YIELD_FAITH',			1),
	('RESOURCE_QUARTZ',			'YIELD_GOLD',			1),
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
delete from Resource_ValidTerrains where TerrainType = 'TERRAIN_TUNDRA_HILLS' and ResourceType = 'RESOURCE_GYPSUM';
delete from Resource_ValidTerrains where ResourceType = 'RESOURCE_STONE';

insert or replace into Resource_ValidTerrains
	(ResourceType,				TerrainType)
values
	-- 奢侈
	('RESOURCE_WOLF',			'TERRAIN_GRASS'),
	('RESOURCE_WOLF',			'TERRAIN_GRASS_HILLS'),
	('RESOURCE_WOLF',			'TERRAIN_PLAINS'),
	('RESOURCE_WOLF',			'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_TRAVERTINE',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_STRAWBERRY',		'TERRAIN_GRASS'),
	('RESOURCE_RUBY',			'TERRAIN_DESERT_HILLS'),
	('RESOURCE_RUBY',			'TERRAIN_GRASS_HILLS'),
	('RESOURCE_RUBY',			'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_POPPIES',		'TERRAIN_PLAINS'),
	('RESOURCE_POPPIES',		'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_PLATINUM',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_PLATINUM',		'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_PLATINUM',		'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_ORCA',			'TERRAIN_COAST'),
	('RESOURCE_LION',			'TERRAIN_PLAINS'),
	('RESOURCE_LION',			'TERRAIN_DESERT'),
	('RESOURCE_LAPIS',			'TERRAIN_DESERT'),
	('RESOURCE_LAPIS',			'TERRAIN_DESERT_HILLS'),
	('RESOURCE_LAPIS',			'TERRAIN_GRASS'),
	('RESOURCE_LAPIS',			'TERRAIN_GRASS_HILLS'),
	('RESOURCE_LAPIS',			'TERRAIN_PLAINS'),
	('RESOURCE_LAPIS',			'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_CASHMERE',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_CASHMERE',		'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_CASHMERE',		'TERRAIN_DESERT_HILLS'),
	('RESOURCE_CASHMERE',		'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_BAMBOO',			'TERRAIN_GRASS'),
	('RESOURCE_ALABASTER',		'TERRAIN_TUNDRA'),
	('RESOURCE_ALABASTER',		'TERRAIN_TUNDRA_HILLS'),
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
	('RESOURCE_QUARTZ',			'TERRAIN_PLAINS_HILLS'),
	-- 加成
	('RESOURCE_TOMATO',			'TERRAIN_GRASS'),
	('RESOURCE_TOMATO',			'TERRAIN_PLAINS'),
	('RESOURCE_TIN',			'TERRAIN_GRASS_HILLS'),
	('RESOURCE_TIN',			'TERRAIN_PLAINS_HILLS'),
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
	('RESOURCE_BERRIES',		'TERRAIN_GRASS'),
	('RESOURCE_BERRIES',		'TERRAIN_GRASS_HILLS'),
	('RESOURCE_BERRIES',		'TERRAIN_PLAINS'),
	('RESOURCE_BERRIES',		'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_BERRIES',		'TERRAIN_TUNDRA'),
	('RESOURCE_BERRIES',		'TERRAIN_TUNDRA_HILLS'),
	('RESOURCE_BARLEY',			'TERRAIN_TUNDRA'),
	('RESOURCE_BARLEY',			'TERRAIN_TUNDRA_HILLS'),
	-- Old Resources
	('RESOURCE_STONE',			'TERRAIN_PLAINS'),
	('RESOURCE_STONE',			'TERRAIN_PLAINS_HILLS');

-- Feature
delete from Feature_ValidTerrains where FeatureType = 'FEATURE_GEOTHERMAL_FISSURE' and (TerrainType = 'TERRAIN_SNOW' or TerrainType = 'TERRAIN_SNOW_HILLS');

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
	-- Old Resources
	('RESOURCE_STONE',			'FEATURE_GEOTHERMAL_FISSURE'),
	('RESOURCE_COPPER',			'FEATURE_GEOTHERMAL_FISSURE');

insert or replace into Resource_ValidFeatures
	(ResourceType,				FeatureType)
select
	'RESOURCE_SUK_OBSIDIAN',	'FEATURE_GEOTHERMAL_FISSURE'
where exists (select ResourceType from Resources where ResourceType = 'RESOURCE_SUK_OBSIDIAN');

insert or replace into Resource_ValidFeatures
	(ResourceType,				FeatureType)
select
	'RESOURCE_SEA_URCHIN',		'FEATURE_SUK_KELP'
where exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');

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
	-- 伐木场改良
update Improvements set PrereqTech = 'TECH_MINING' where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';
update Adjacency_YieldChanges set PrereqTech = 'TECH_BRONZE_WORKING' where ID = 'Lumber_Mill_River_Production';
	-- 地热有资矿山、采石场
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_MINE';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_QUARRY';
	-- 礁石有资渔船
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_FISHING_BOATS';
	-- 雨林有资伐木场
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';

-- District
	-- 军营
update ModifierArguments set Value = 2 where ModifierId = 'ENCAMPMENT_ADD_STONE_PRODUCTION' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'ENCAMPMENT_ADD_COPPER_PRODUCTION' and Name = 'Amount';

insert or replace into DistrictModifiers
	(DistrictType,						ModifierId)
values
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_ADD_TIN_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_ADD_LEAD_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_ADD_GRANITE_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_ADD_LIMESTONE_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,									ModifierType,										SubjectRequirementSetId)
values
	('ENCAMPMENT_ADD_TIN_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'HD_HAS_IMPROVED_TIN'),
	('ENCAMPMENT_ADD_LEAD_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'HD_HAS_IMPROVED_LEAD'),
	('ENCAMPMENT_ADD_GRANITE_PRODUCTION',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'HD_HAS_IMPROVED_GRANITE'),
	('ENCAMPMENT_ADD_LIMESTONE_PRODUCTION',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'HD_HAS_IMPROVED_LIMESTONE');

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	('ENCAMPMENT_ADD_TIN_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_TIN_PRODUCTION',				'Amount',		2),
	('ENCAMPMENT_ADD_LEAD_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_LEAD_PRODUCTION',				'Amount',		2),
	('ENCAMPMENT_ADD_GRANITE_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_GRANITE_PRODUCTION',			'Amount',		2),
	('ENCAMPMENT_ADD_LIMESTONE_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_LIMESTONE_PRODUCTION',			'Amount',		2);

insert or replace into RequirementSets 
	(RequirementSetId,						RequirementSetType) 
values
	('HD_HAS_IMPROVED_TIN',					'REQUIREMENTSET_TEST_ALL'),
	('HD_HAS_IMPROVED_LEAD',				'REQUIREMENTSET_TEST_ALL'),
	('HD_HAS_IMPROVED_GRANITE',				'REQUIREMENTSET_TEST_ALL'),
	('HD_HAS_IMPROVED_LIMESTONE',			'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,						RequirementId)
values
	('HD_HAS_IMPROVED_TIN',					'REQUIRES_RESOURCE_TIN_IN_PLOT'),
	('HD_HAS_IMPROVED_TIN',					'REQUIRES_PLOT_HAS_MINE'),
	('HD_HAS_IMPROVED_LEAD',				'REQUIRES_RESOURCE_LEAD_IN_PLOT'),
	('HD_HAS_IMPROVED_LEAD',				'REQUIRES_PLOT_HAS_MINE'),
	('HD_HAS_IMPROVED_GRANITE',				'REQUIRES_RESOURCE_GRANITE_IN_PLOT'),
	('HD_HAS_IMPROVED_GRANITE',				'REQUIRES_PLOT_HAS_QUARRY'),
	('HD_HAS_IMPROVED_LIMESTONE',			'REQUIRES_RESOURCE_LIMESTONE_IN_PLOT'),
	('HD_HAS_IMPROVED_LIMESTONE',			'REQUIRES_PLOT_HAS_QUARRY');

	-- 工业区
insert or replace into DistrictModifiers
	(DistrictType,						ModifierId)
values
	('DISTRICT_INDUSTRIAL_ZONE',		'ENCAMPMENT_ADD_RUBBER_PRODUCTION'),
	('DISTRICT_INDUSTRIAL_ZONE',		'ENCAMPMENT_ADD_PINE_PRODUCTION'),
	('DISTRICT_INDUSTRIAL_ZONE',		'ENCAMPMENT_ADD_OAK_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,									ModifierType,										SubjectRequirementSetId)
values
	('ENCAMPMENT_ADD_RUBBER_PRODUCTION',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'HD_HAS_IMPROVED_RUBBER'),
	('ENCAMPMENT_ADD_PINE_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'HD_HAS_IMPROVED_PINE'),
	('ENCAMPMENT_ADD_OAK_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'HD_HAS_IMPROVED_OAK');

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	('ENCAMPMENT_ADD_RUBBER_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_RUBBER_PRODUCTION',			'Amount',		1),
	('ENCAMPMENT_ADD_PINE_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_PINE_PRODUCTION',				'Amount',		1),
	('ENCAMPMENT_ADD_OAK_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_OAK_PRODUCTION',				'Amount',		1);

insert or replace into RequirementSets 
	(RequirementSetId,						RequirementSetType) 
values
	('HD_HAS_IMPROVED_RUBBER',				'REQUIREMENTSET_TEST_ALL'),
	('HD_HAS_IMPROVED_PINE',				'REQUIREMENTSET_TEST_ALL'),
	('HD_HAS_IMPROVED_OAK',					'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,						RequirementId)
values
	('HD_HAS_IMPROVED_RUBBER',				'REQUIRES_RESOURCE_RUBBER_IN_PLOT'),
	('HD_HAS_IMPROVED_RUBBER',				'REQUIRES_PLOT_HAS_LUMBER_MILL'),
	('HD_HAS_IMPROVED_PINE',				'REQUIRES_RESOURCE_PINE_IN_PLOT'),
	('HD_HAS_IMPROVED_PINE',				'REQUIRES_PLOT_HAS_LUMBER_MILL'),
	('HD_HAS_IMPROVED_OAK',					'REQUIRES_RESOURCE_OAK_IN_PLOT'),
	('HD_HAS_IMPROVED_OAK',					'REQUIRES_PLOT_HAS_LUMBER_MILL');

	-- 水渠
delete from BuildingModifiers where ModifierId = 'GRANARY_BONUS_PLANTATION_FOOD' and BuildingType = 'BUILDING_GRANARY';
insert or replace into DistrictModifiers
	(DistrictType,						ModifierId)
values
	('DISTRICT_AQUEDUCT',				'GRANARY_BONUS_PLANTATION_FOOD');

-- Buildings
	-- 工官
insert or ignore into RequirementSetRequirements
	(RequirementSetId,						RequirementId)
select
	'OFFICIAL_RUN_HANDCRAFT_REQUIREMENT',	'HD_REQUIRES_CITY_HAS_IMPROVED_' || r.ResourceType
from Resources r, Improvement_ValidResources i
where r.ResourceType = i.ResourceType and (i.ImprovementType = 'IMPROVEMENT_LUMBER_MILL')
	and (r.ResourceClassType = 'RESOURCECLASS_LUXURY' or r.ResourceClassType = 'RESOURCECLASS_BONUS');