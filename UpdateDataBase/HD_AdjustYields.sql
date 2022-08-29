-- Terrain yield
delete from Terrain_YieldChanges;
insert or replace into Terrain_YieldChanges
	(TerrainType, 				YieldType, 			YieldChange)
values
	('TERRAIN_GRASS',			'YIELD_FOOD',		3),
	('TERRAIN_GRASS_HILLS',		'YIELD_FOOD',		2),
	('TERRAIN_GRASS_HILLS',		'YIELD_PRODUCTION',	1),
	('TERRAIN_PLAINS',			'YIELD_FOOD',		2),
	('TERRAIN_PLAINS',			'YIELD_PRODUCTION',	1),
	('TERRAIN_PLAINS_HILLS',	'YIELD_FOOD',		1),
	('TERRAIN_PLAINS_HILLS',	'YIELD_PRODUCTION',	2),
	('TERRAIN_TUNDRA',			'YIELD_FOOD',		2),
	('TERRAIN_TUNDRA_HILLS',	'YIELD_FOOD',		1),
	('TERRAIN_TUNDRA_HILLS',	'YIELD_PRODUCTION',	1),
	('TERRAIN_DESERT',			'YIELD_FAITH',		1),
	('TERRAIN_DESERT_HILLS',	'YIELD_FAITH',		1),
	('TERRAIN_DESERT_HILLS',	'YIELD_PRODUCTION',	1),
	('TERRAIN_SNOW_HILLS',		'YIELD_PRODUCTION',	1),
	('TERRAIN_COAST',			'YIELD_FOOD',		2),
	('TERRAIN_COAST',			'YIELD_GOLD',		3),
	('TERRAIN_OCEAN',			'YIELD_FOOD',		1);
-- Feature yield
insert or replace into Feature_YieldChanges
	(FeatureType,			YieldType,			YieldChange)
values
	('FEATURE_FOREST',		'YIELD_FOOD',		-1),
	('FEATURE_JUNGLE',		'YIELD_PRODUCTION',	-1),
	('FEATURE_REEF',		'YIELD_GOLD',		-3),
	('FEATURE_FLOODPLAINS',	'YIELD_FOOD',		3),
	('FEATURE_OASIS',		'YIELD_FOOD',		4);
insert or replace into Feature_YieldChanges
	(FeatureType,			YieldType,			YieldChange)
select
	'FEATURE_SUK_KELP',		'YIELD_GOLD',		-3
where exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');
delete from Feature_YieldChanges where FeatureType = 'FEATURE_MARSH' and YieldType = 'YIELD_FOOD';
delete from Feature_YieldChanges where FeatureType = 'FEATURE_REEF' and YieldType = 'YIELD_FOOD';
-- Resource yield
with Resource_YieldChanges_Pre
	(ResourceType,			YieldType,			YieldChange)
as (values
	('RESOURCE_DEER',		'YIELD_FOOD',		1),
	('RESOURCE_CATTLE',		'YIELD_PRODUCTION',	1),
	('RESOURCE_COTTON',		'YIELD_PRODUCTION',	1),
	('RESOURCE_DYES',		'YIELD_PRODUCTION',	1),
	('RESOURCE_CITRUS',		'YIELD_GOLD',		1),
	('RESOURCE_COFFEE',		'YIELD_GOLD',		1),
	('RESOURCE_DYES',		'YIELD_GOLD',		1),
	('RESOURCE_JADE',		'YIELD_GOLD',		1),
	('RESOURCE_MARBLE',		'YIELD_GOLD',		1),
	('RESOURCE_MERCURY',	'YIELD_GOLD',		1),
	('RESOURCE_SILK',		'YIELD_GOLD',		1),
	('RESOURCE_SPICES',		'YIELD_GOLD',		1),
	('RESOURCE_SUGAR',		'YIELD_GOLD',		1),
	('RESOURCE_TEA',		'YIELD_GOLD',		1),
	('RESOURCE_AMBER',		'YIELD_GOLD',		1),
	('RESOURCE_TURTLES',	'YIELD_GOLD',		1),
	('RESOURCE_SILVER',		'YIELD_PRODUCTION',	1),
	('RESOURCE_ALUMINUM',	'YIELD_PRODUCTION',	1),
	('RESOURCE_CITRUS',		'YIELD_FOOD',		1),
	('RESOURCE_SPICES',		'YIELD_FOOD',		1),
	('RESOURCE_SUGAR',		'YIELD_FOOD',		1),
	('RESOURCE_HONEY',		'YIELD_FOOD',		1),
	('RESOURCE_INCENSE',	'YIELD_FAITH',		2),
	('RESOURCE_WHALES',		'YIELD_PRODUCTION',	1),
	('RESOURCE_WHALES',		'YIELD_GOLD',		1),
	('RESOURCE_PEARLS',		'YIELD_FAITH',		2),
	('RESOURCE_COCOA',		'YIELD_GOLD',		4),
	('RESOURCE_DIAMONDS',	'YIELD_GOLD',		4),
	('RESOURCE_TRUFFLES',	'YIELD_GOLD',		4),
	('RESOURCE_TOBACCO',	'YIELD_FAITH',		2),
	('RESOURCE_COTTON',		'YIELD_GOLD',		1),
	('RESOURCE_CRABS',		'YIELD_GOLD',		3))
insert or replace into Resource_YieldChanges
	(ResourceType,			YieldType,			YieldChange)
select
	ResourceType,			YieldType,			YieldChange
from Resource_YieldChanges_Pre where ResourceType in (select ResourceType from Resources);
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_CATTLE' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_DEER' and YieldType = 'YIELD_PRODUCTION';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_HORSES' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_DYES' and YieldType = 'YIELD_FAITH';
-- Natural Wonders yield
with Feature_YieldChanges_Pre
	(FeatureType,					YieldType,			YieldChange)
as (values
-- 4 tiles
	('FEATURE_PANTANAL',			'YIELD_FOOD',		3),
	('FEATURE_UBSUNUR_HOLLOW',		'YIELD_FAITH',		3),
	('FEATURE_CHOCOLATEHILLS',		'YIELD_FOOD',		2),
	('FEATURE_WHITEDESERT',			'YIELD_FAITH',		1),
-- 3 tiles
	('FEATURE_EYE_OF_THE_SAHARA',	'YIELD_PRODUCTION',	1),
	('FEATURE_EYE_OF_THE_SAHARA',	'YIELD_SCIENCE',	3),
	('FEATURE_EYE_OF_THE_SAHARA',	'YIELD_FAITH',		1),
	('FEATURE_GOBUSTAN',			'YIELD_PRODUCTION',	2),
-- 2 tiles
	('FEATURE_BARRIER_REEF',		'YIELD_FOOD',		2),
	('FEATURE_BARRIER_REEF',		'YIELD_PRODUCTION',	1),
	('FEATURE_BARRIER_REEF',		'YIELD_GOLD',		2),
	('FEATURE_HA_LONG_BAY',			'YIELD_FOOD',		4),
	('FEATURE_DEAD_SEA',			'YIELD_FAITH',		3),
	('FEATURE_DEAD_SEA',			'YIELD_CULTURE',	3),
	('FEATURE_LAKE_RETBA',			'YIELD_CULTURE',	3),
	('FEATURE_LAKE_RETBA',			'YIELD_FOOD',		1),
-- 1 tiles
	('FEATURE_CRATER_LAKE',			'YIELD_SCIENCE',	2),
	('FEATURE_CRATER_LAKE',			'YIELD_FAITH',		6),
	('FEATURE_FOUNTAIN_OF_YOUTH',	'YIELD_SCIENCE',	6),
	('FEATURE_FOUNTAIN_OF_YOUTH',	'YIELD_FAITH',		2))
insert or replace into Feature_YieldChanges
	(FeatureType,					YieldType,			YieldChange)
select
	FeatureType,					YieldType,			YieldChange
from Feature_YieldChanges_Pre;
update ModifierArguments set Value = 1 where ModifierId = 'EYESAHARA_SCIENCE_ATOMIC' and Name = 'Amount';
delete from Feature_AdjacentYields where FeatureType = 'FEATURE_PAITITI' and YieldType = 'YIELD_CULTURE';
with Feature_AdjacentYields_Pre
	(FeatureType,					YieldType,			YieldChange)
as (values
	('FEATURE_PAITITI',				'YIELD_GOLD',		5),
	('FEATURE_EVEREST',				'YIELD_FAITH',		2),
	('FEATURE_DELICATE_ARCH',		'YIELD_GOLD',		2),
	('FEATURE_PIOPIOTAHI',			'YIELD_GOLD',		2))
insert or replace into Feature_AdjacentYields
	(FeatureType,					YieldType,			YieldChange)
select
	FeatureType,					YieldType,			YieldChange
from Feature_AdjacentYields_Pre;