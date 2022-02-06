-----------------------------------------------
-- Terrain & Feature & Resource yield adjust --
-----------------------------------------------

-- Lake +1 food
insert or replace into GameModifiers (ModifierId) values ('LAKE_ADD_FOOD');
insert or replace into Modifiers
	(ModifierId,		ModifierType,						SubjectRequirementSetId)
values
	('LAKE_ADD_FOOD',	'MODIFIER_GAME_ADJUST_PLOT_YIELD',	'DL_PLOT_IS_LAKE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,		Name,			Value)
values
	('LAKE_ADD_FOOD',	'YieldType',	'YIELD_FOOD'),
	('LAKE_ADD_FOOD',	'Amount',		1);

-- Terrain yields adjustment
insert or replace into Terrain_YieldChanges values
	-- TerrainType, YieldType, YieldChange
	('TERRAIN_DESERT', 'YIELD_FAITH', 1),
	('TERRAIN_DESERT_HILLS', 'YIELD_FAITH', 1);

update Terrain_YieldChanges set YieldChange = 3 where TerrainType = 'TERRAIN_GRASS' and YieldType = 'YIELD_FOOD';
update Terrain_YieldChanges set YieldChange = 2 where TerrainType = 'TERRAIN_GRASS_HILLS' and YieldType = 'YIELD_FOOD';
update Terrain_YieldChanges set YieldChange = 1 where TerrainType = 'TERRAIN_GRASS_HILLS' and YieldType = 'YIELD_PRODUCTION';
update Terrain_YieldChanges set YieldChange = 2 where TerrainType = 'TERRAIN_PLAINS' and YieldType = 'YIELD_FOOD';
update Terrain_YieldChanges set YieldChange = 1 where TerrainType = 'TERRAIN_PLAINS' and YieldType = 'YIELD_PRODUCTION';
update Terrain_YieldChanges set YieldChange = 1 where TerrainType = 'TERRAIN_PLAINS_HILLS' and YieldType = 'YIELD_FOOD';
update Terrain_YieldChanges set YieldChange = 2 where TerrainType = 'TERRAIN_PLAINS_HILLS' and YieldType = 'YIELD_PRODUCTION';
update Terrain_YieldChanges set YieldChange = 2 where TerrainType = 'TERRAIN_TUNDRA' and YieldType = 'YIELD_FOOD';
update Terrain_YieldChanges set YieldChange = 1 where TerrainType = 'TERRAIN_TUNDRA_HILLS' and YieldType = 'YIELD_FOOD';
update Terrain_YieldChanges set YieldChange = 1 where TerrainType = 'TERRAIN_TUNDRA_HILLS' and YieldType = 'YIELD_PRODUCTION';
update Terrain_YieldChanges set YieldChange = 1 where TerrainType = 'TERRAIN_DESERT_HILLS' and YieldType = 'YIELD_PRODUCTION';
update Terrain_YieldChanges set YieldChange = 1 where TerrainType = 'TERRAIN_SNOW_HILLS' and YieldType = 'YIELD_PRODUCTION';
update Terrain_YieldChanges set YieldChange = 2 where TerrainType = 'TERRAIN_COAST' and YieldType = 'YIELD_FOOD';

-- Feature yields adjustment
insert or replace into Feature_YieldChanges values 
	-- FeatureType, YieldType, YieldChange
	('FEATURE_FOREST', 'YIELD_FOOD', -1),
	('FEATURE_JUNGLE', 'YIELD_PRODUCTION', -1);

delete from Feature_YieldChanges where FeatureType = 'FEATURE_MARSH' and YieldType = 'YIELD_FOOD';
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_FLOODPLAINS' and YieldType = 'YIELD_FOOD';
update Feature_YieldChanges set YieldChange = 4 where FeatureType = 'FEATURE_OASIS' and YieldType = 'YIELD_FOOD';
delete from Feature_YieldChanges where FeatureType = 'FEATURE_REEF' and YieldType = 'YIELD_FOOD';

-- Resource yields adjustment
insert or replace into Resource_YieldChanges  
	(ResourceType,			YieldType,			YieldChange)
values
	('RESOURCE_DEER',		'YIELD_FOOD',		1),
	('RESOURCE_CATTLE',		'YIELD_PRODUCTION',	1),
	-- ('RESOURCE_SHEEP',		'YIELD_PRODUCTION',		-1),
	--
	('RESOURCE_CITRUS',		'YIELD_GOLD',		1),
	('RESOURCE_COFFEE',		'YIELD_GOLD',		1),
	('RESOURCE_DYES',		'YIELD_GOLD',		1),
	-- ('RESOURCE_INCENSE',	'YIELD_GOLD',		1),
	('RESOURCE_JADE',		'YIELD_GOLD',		1),
	('RESOURCE_MARBLE',		'YIELD_GOLD',		1),
	('RESOURCE_MERCURY',	'YIELD_GOLD',		1),
	('RESOURCE_PEARLS',		'YIELD_GOLD',		1),
	('RESOURCE_SILK',		'YIELD_GOLD',		1),
	('RESOURCE_SPICES',		'YIELD_GOLD',		1),
	('RESOURCE_SUGAR',		'YIELD_GOLD',		1),
	('RESOURCE_TEA',		'YIELD_GOLD',		1),
	('RESOURCE_TOBACCO',	'YIELD_GOLD',		1),
	('RESOURCE_AMBER',		'YIELD_GOLD',		1),
	('RESOURCE_TURTLES',	'YIELD_GOLD',		1),
	--
	('RESOURCE_SILVER',		'YIELD_PRODUCTION',	1),
	--
	('RESOURCE_ALUMINUM',	'YIELD_PRODUCTION',	1);

-- update Resource_YieldChanges set YieldChange = 2 where ResourceType = 'RESOURCE_SHEEP' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_CATTLE' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_DEER' and YieldType = 'YIELD_PRODUCTION';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_HORSES' and YieldType = 'YIELD_FOOD';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_CITRUS' and YieldType = 'YIELD_FOOD';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_SPICES' and YieldType = 'YIELD_FOOD';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_SUGAR' and YieldType = 'YIELD_FOOD';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_HONEY' and YieldType = 'YIELD_FOOD';
update Resource_YieldChanges set YieldChange = 2 where ResourceType = 'RESOURCE_INCENSE' and YieldType = 'YIELD_FAITH';
update Resource_YieldChanges set YieldChange = 2 where ResourceType = 'RESOURCE_WHALES' and YieldType = 'YIELD_PRODUCTION';
update Resource_YieldChanges set YieldChange = -1 where ResourceType = 'RESOURCE_WHALES' and YieldType = 'YIELD_GOLD';
update Resource_YieldChanges set YieldChange = 2 where ResourceType = 'RESOURCE_PEARLS' and YieldType = 'YIELD_FAITH';
update Resource_YieldChanges set YieldChange = -1 where ResourceType = 'RESOURCE_PEARLS' and YieldType = 'YIELD_GOLD';

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
	('FEATURE_LAKE_RETBA', 'YIELD_FOOD', 1)
;
update ModifierArguments set Value = 1 where ModifierId = 'EYESAHARA_SCIENCE_ATOMIC' and Name = 'Amount';

delete from Feature_AdjacentYields where FeatureType = 'FEATURE_PAITITI' and YieldType = 'YIELD_CULTURE';
update Feature_AdjacentYields set YieldChange = 5 where FeatureType = 'FEATURE_PAITITI' and YieldType = 'YIELD_GOLD';
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_EVEREST' and YieldType = 'YIELD_FAITH';
-- update Feature_AdjacentYields set YieldChange = 2 whereFeatureType = 'FEATURE_DELICATE_ARCH' and YieldType = 'YIELD_GOLD';
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_PIOPIOTAHI' and YieldType = 'YIELD_GOLD';
