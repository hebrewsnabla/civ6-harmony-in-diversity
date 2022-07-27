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
	(FeatureType,		YieldType,			YieldChange)
values
	('FEATURE_FOREST',	'YIELD_FOOD',		-1),
	('FEATURE_JUNGLE',	'YIELD_PRODUCTION',	-1),
	('FEATURE_REEF',	'YIELD_GOLD',		-3);
insert or replace into Feature_YieldChanges
	(FeatureType,		YieldType,			YieldChange)
select
	'FEATURE_SUK_KELP',	'YIELD_GOLD',		-3
where exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_FLOODPLAINS' and YieldType = 'YIELD_FOOD';
update Feature_YieldChanges set YieldChange = 4 where FeatureType = 'FEATURE_OASIS' and YieldType = 'YIELD_FOOD';
delete from Feature_YieldChanges where FeatureType = 'FEATURE_MARSH' and YieldType = 'YIELD_FOOD';
delete from Feature_YieldChanges where FeatureType = 'FEATURE_REEF' and YieldType = 'YIELD_FOOD';
-- Resource yield
insert or replace into Resource_YieldChanges  
	(ResourceType,			YieldType,			YieldChange)
values
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
	('RESOURCE_ALUMINUM',	'YIELD_PRODUCTION',	1);
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_CATTLE' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_DEER' and YieldType = 'YIELD_PRODUCTION';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_HORSES' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_DYES' and YieldType = 'YIELD_FAITH';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_CITRUS' and YieldType = 'YIELD_FOOD';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_SPICES' and YieldType = 'YIELD_FOOD';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_SUGAR' and YieldType = 'YIELD_FOOD';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_HONEY' and YieldType = 'YIELD_FOOD';
update Resource_YieldChanges set YieldChange = 2 where ResourceType = 'RESOURCE_INCENSE' and YieldType = 'YIELD_FAITH';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_WHALES' and YieldType = 'YIELD_PRODUCTION';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_WHALES' and YieldType = 'YIELD_GOLD';
update Resource_YieldChanges set YieldChange = 2 where ResourceType = 'RESOURCE_PEARLS' and YieldType = 'YIELD_FAITH';
update Resource_YieldChanges set YieldChange = 4 where ResourceType = 'RESOURCE_COCOA' and YieldType = 'YIELD_GOLD';
update Resource_YieldChanges set YieldChange = 4 where ResourceType = 'RESOURCE_DIAMONDS' and YieldType = 'YIELD_GOLD';
update Resource_YieldChanges set YieldChange = 4 where ResourceType = 'RESOURCE_TRUFFLES' and YieldType = 'YIELD_GOLD';
update Resource_YieldChanges set YieldChange = 2 where ResourceType = 'RESOURCE_TOBACCO' and YieldType = 'YIELD_FAITH';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_COTTON' and YieldType = 'YIELD_GOLD';
update Resource_YieldChanges set YieldChange = 3 where ResourceType = 'RESOURCE_CRABS' and YieldType = 'YIELD_GOLD';

-- Natural Wonders.
-- Need to provide yields to natural wonders in later game.

-- 4 tiles
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_PANTANAL' and YieldType = 'YIELD_FOOD';
-- update Feature_YieldChanges set YieldChange = 6 where FeatureType = 'FEATURE_WHITEDESERT' and YieldType = 'YIELD_GOLD';
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_UBSUNUR_HOLLOW' and YieldType = 'YIELD_FAITH';
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_CHOCOLATEHILLS' and YieldType = 'YIELD_FOOD';

-- 3 tiles
update Feature_YieldChanges set YieldChange = 1 where FeatureType = 'FEATURE_EYE_OF_THE_SAHARA' and YieldType = 'YIELD_PRODUCTION';
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_EYE_OF_THE_SAHARA' and YieldType = 'YIELD_SCIENCE';
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_GOBUSTAN' and YieldType = 'YIELD_PRODUCTION';

-- 2 tiles
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_BARRIER_REEF' and YieldType = 'YIELD_FOOD';
update Feature_YieldChanges set YieldChange = 4 where FeatureType = 'FEATURE_HA_LONG_BAY' and YieldType = 'YIELD_FOOD';
-- update Feature_YieldChanges set YieldChange = 4 where FeatureType = 'FEATURE_CLIFFS_DOVER' and YieldType = 'YIELD_GOLD';
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_DEAD_SEA' and YieldType = 'YIELD_FAITH';
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_DEAD_SEA' and YieldType = 'YIELD_CULTURE';
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_LAKE_RETBA' and YieldType = 'YIELD_CULTURE';

-- 1 tiles
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_CRATER_LAKE' and YieldType = 'YIELD_SCIENCE';
update Feature_YieldChanges set YieldChange = 6 where FeatureType = 'FEATURE_CRATER_LAKE' and YieldType = 'YIELD_FAITH';
update Feature_YieldChanges set YieldChange = 6 where FeatureType = 'FEATURE_FOUNTAIN_OF_YOUTH' and YieldType = 'YIELD_SCIENCE';
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_FOUNTAIN_OF_YOUTH' and YieldType = 'YIELD_FAITH';

insert or replace into Feature_YieldChanges (FeatureType, YieldType, YieldChange) values
	('FEATURE_WHITEDESERT', 'YIELD_FAITH', 1),
	('FEATURE_EYE_OF_THE_SAHARA', 'YIELD_FAITH', 1),
	('FEATURE_BARRIER_REEF', 'YIELD_PRODUCTION', 1),
	('FEATURE_BARRIER_REEF', 'YIELD_GOLD', 2),
	('FEATURE_LAKE_RETBA', 'YIELD_FOOD', 1);
update ModifierArguments set Value = 1 where ModifierId = 'EYESAHARA_SCIENCE_ATOMIC' and Name = 'Amount';

delete from Feature_AdjacentYields where FeatureType = 'FEATURE_PAITITI' and YieldType = 'YIELD_CULTURE';
update Feature_AdjacentYields set YieldChange = 5 where FeatureType = 'FEATURE_PAITITI' and YieldType = 'YIELD_GOLD';
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_EVEREST' and YieldType = 'YIELD_FAITH';
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_DELICATE_ARCH' and YieldType = 'YIELD_GOLD';
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_PIOPIOTAHI' and YieldType = 'YIELD_GOLD';


--移除雨林前移到采矿
update Features set RemoveTech = 'TECH_MINING' where FeatureType = 'FEATURE_JUNGLE';
--种树前移到工会，越南到神秘主义
update Features set AddCivic = 'CIVIC_GUILDS' where FeatureType = 'FEATURE_FOREST';
update Technologies set Description = null where TechnologyType = 'TECH_SANITATION';