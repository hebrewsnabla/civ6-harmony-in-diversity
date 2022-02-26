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
	('FEATURE_LAKE_RETBA', 'YIELD_FOOD', 1);
update ModifierArguments set Value = 1 where ModifierId = 'EYESAHARA_SCIENCE_ATOMIC' and Name = 'Amount';

delete from Feature_AdjacentYields where FeatureType = 'FEATURE_PAITITI' and YieldType = 'YIELD_CULTURE';
update Feature_AdjacentYields set YieldChange = 5 where FeatureType = 'FEATURE_PAITITI' and YieldType = 'YIELD_GOLD';
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_EVEREST' and YieldType = 'YIELD_FAITH';
-- update Feature_AdjacentYields set YieldChange = 2 whereFeatureType = 'FEATURE_DELICATE_ARCH' and YieldType = 'YIELD_GOLD';
--update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_PIOPIOTAHI' and YieldType = 'YIELD_GOLD';
--建议表本体产出改动
--白沙漠：+2瓶+2琴+4金
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_WHITEDESERT' and YieldType = 'YIELD_SCIENCE';
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_WHITEDESERT' and YieldType = 'YIELD_CULTURE';
delete from Feature_YieldChanges where FeatureType = 'FEATURE_WHITEDESERT' and YieldType = 'YIELD_FAITH';
--大堡礁：+3粮+1锤+2瓶
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_BARRIER_REEF' and YieldType = 'YIELD_FOOD';
delete from Feature_YieldChanges where FeatureType = 'FEATURE_BARRIER_REEF' and YieldType = 'YIELD_GOLD';
--白岸：+3琴+2粮+2金
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_CLIFFS_DOVER' and YieldType = 'YIELD_GOLD';
--玫瑰湖：+2琴+4金+2锤
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_LAKE_RETBA' and YieldType = 'YIELD_CULTURE';
update Feature_YieldChanges set YieldChange = 4 where FeatureType = 'FEATURE_LAKE_RETBA' and YieldType = 'YIELD_GOLD';
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_LAKE_RETBA' and YieldType = 'YIELD_PRODUCTION';
delete from Feature_YieldChanges where FeatureType = 'FEATURE_LAKE_RETBA' and YieldType = 'YIELD_FOOD';
--火山口湖：+4鸽+2瓶
update Feature_YieldChanges set YieldChange = 4 where FeatureType = 'FEATURE_CRATER_LAKE' and YieldType = 'YIELD_FAITH';
--戈布斯坦：+3琴+1锤+2瓶
--巧克力山：+2琴+2锤+2粮
delete from Feature_YieldChanges where FeatureType = 'FEATURE_CHOCOLATEHILLS' and YieldType = 'YIELD_SCIENCE';
update Feature_YieldChanges set YieldChange = 1 where FeatureType = 'FEATURE_GOBUSTAN' and YieldType = 'YIELD_PRODUCTION';
insert or replace into Feature_YieldChanges
	(FeatureType,				YieldType,			YieldChange)
values
	('FEATURE_GOBUSTAN',		'YIELD_SCIENCE',	2),
	('FEATURE_CHOCOLATEHILLS',	'YIELD_CULTURE',	2);
--潘塔纳尔：+3粮+3琴
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_PANTANAL' and YieldType = 'YIELD_CULTURE';
--青春之泉：+3瓶+3鸽
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_FOUNTAIN_OF_YOUTH' and YieldType = 'YIELD_SCIENCE';
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_FOUNTAIN_OF_YOUTH' and YieldType = 'YIELD_FAITH';
--撒哈拉之眼：+3锤+3瓶
delete from Feature_YieldChanges where FeatureType = 'FEATURE_EYE_OF_THE_SAHARA' and YieldType = 'YIELD_FAITH';
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_EYE_OF_THE_SAHARA' and YieldType = 'YIELD_PRODUCTION';
--乌布苏盆地：+2鸽+2粮+2锤
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_UBSUNUR_HOLLOW' and YieldType = 'YIELD_PRODUCTION';
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_UBSUNUR_HOLLOW' and YieldType = 'YIELD_FAITH';
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_UBSUNUR_HOLLOW' and YieldType = 'YIELD_FOOD';
--下龙湾：+2琴+3粮+1锤
update Feature_YieldChanges set YieldChange = 1 where FeatureType = 'FEATURE_HA_LONG_BAY' and YieldType = 'YIELD_PRODUCTION';
update Feature_YieldChanges set YieldChange = 2 where FeatureType = 'FEATURE_HA_LONG_BAY' and YieldType = 'YIELD_CULTURE';
update Feature_YieldChanges set YieldChange = 3 where FeatureType = 'FEATURE_HA_LONG_BAY' and YieldType = 'YIELD_FOOD';
--建议表周围产出改动
--加拉帕戈斯：+2瓶+2金
--吕瑟峡湾：+2瓶
--伊卡基尔地下水坑：+1瓶+1鸽
insert or replace into Feature_AdjacentYields
	(FeatureType,				YieldType,			YieldChange)
values
	('FEATURE_GALAPAGOS',		'YIELD_GOLD',		2),
	('FEATURE_LYSEFJORDEN',		'YIELD_SCIENCE',	2),
	('FEATURE_IKKIL',			'YIELD_SCIENCE',	1),
	('FEATURE_IKKIL',			'YIELD_FAITH',		1);
delete from Feature_AdjacentYields where FeatureType = 'FEATURE_LYSEFJORDEN' and YieldType = 'YIELD_PRODUCTION';
--精致拱门：+2鸽+2金
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_DELICATE_ARCH' and YieldType = 'YIELD_GOLD';
--巨人堤：+2琴
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_GIANTS_CAUSEWAY' and YieldType = 'YIELD_CULTURE';
--马特洪峰：+2琴
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_MATTERHORN' and YieldType = 'YIELD_CULTURE';
--米尔福德峡湾：+1琴+1金
update Feature_AdjacentYields set YieldChange = 1 where FeatureType = 'FEATURE_PIOPIOTAHI' and YieldType = 'YIELD_GOLD';
--约塞米蒂：+1粮+2金+1瓶
update Feature_AdjacentYields set YieldChange = 2 where FeatureType = 'FEATURE_YOSEMITE' and YieldType = 'YIELD_GOLD';
--珠穆朗玛峰：+3鸽
update Feature_AdjacentYields set YieldChange = 3 where FeatureType = 'FEATURE_EVEREST' and YieldType = 'YIELD_FAITH';
--自然奇观绑定地形改动
--艾雅法拉火山移除绑定雪地
--艾雅法拉火山增加排斥草原平原沙漠雪地
--大堡礁增加排斥冻土雪地
--魔鬼塔增加排斥雪地冻土沙漠
--下龙湾增加排斥冻土雪地
--约塞米蒂增加排斥冻土雪地
--张掖丹霞增加排斥山脉
delete from Feature_AdjacentTerrains where FeatureType = 'FEATURE_EYJAFJALLAJOKULL' and TerrainType = 'TERRAIN_SNOW';
delete from Feature_AdjacentTerrains where FeatureType = 'FEATURE_EYJAFJALLAJOKULL' and TerrainType = 'TERRAIN_SNOW_HILLS';
insert or replace into Feature_NotAdjacentTerrains
	(FeatureType,					TerrainType)
values
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_GRASS_MOUNTAIN'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_PLAINS_MOUNTAIN'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_DESERT_MOUNTAIN'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_SNOW_MOUNTAIN'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_GRASS_HILLS'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_PLAINS_HILLS'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_DESERT_HILLS'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_SNOW_HILLS'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_GRASS'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_PLAINS'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_DESERT'),
	('FEATURE_EYJAFJALLAJOKULL',	'TERRAIN_SNOW'),
	('FEATURE_BARRIER_REEF',		'TERRAIN_SNOW'),
	('FEATURE_BARRIER_REEF',		'TERRAIN_SNOW_HILLS'),
	('FEATURE_BARRIER_REEF',		'TERRAIN_SNOW_MOUNTAIN'),
	('FEATURE_BARRIER_REEF',		'TERRAIN_TUNDRA'),
	('FEATURE_BARRIER_REEF',		'TERRAIN_TUNDRA_HILLS'),
	('FEATURE_BARRIER_REEF',		'TERRAIN_TUNDRA_MOUNTAIN'),
	('FEATURE_DEVILSTOWER',			'TERRAIN_TUNDRA'),
	('FEATURE_DEVILSTOWER',			'TERRAIN_TUNDRA_HILLS'),
	('FEATURE_DEVILSTOWER',			'TERRAIN_TUNDRA_MOUNTAIN'),
	('FEATURE_DEVILSTOWER',			'TERRAIN_SNOW'),
	('FEATURE_DEVILSTOWER',			'TERRAIN_SNOW_HILLS'),
	('FEATURE_DEVILSTOWER',			'TERRAIN_SNOW_MOUNTAIN'),
	('FEATURE_DEVILSTOWER',			'TERRAIN_DESERT'),
	('FEATURE_DEVILSTOWER',			'TERRAIN_DESERT_HILLS'),
	('FEATURE_DEVILSTOWER',			'TERRAIN_DESERT_MOUNTAIN'),
	('FEATURE_PAITITI',				'TERRAIN_TUNDRA'),
	('FEATURE_PAITITI',				'TERRAIN_TUNDRA_HILLS'),
	('FEATURE_PAITITI',				'TERRAIN_TUNDRA_MOUNTAIN'),
	('FEATURE_PAITITI',				'TERRAIN_SNOW'),
	('FEATURE_PAITITI',				'TERRAIN_SNOW_HILLS'),
	('FEATURE_PAITITI',				'TERRAIN_SNOW_MOUNTAIN'),
	('FEATURE_PAITITI',				'TERRAIN_DESERT'),
	('FEATURE_PAITITI',				'TERRAIN_DESERT_HILLS'),
	('FEATURE_PAITITI',				'TERRAIN_DESERT_MOUNTAIN'),
	('FEATURE_HA_LONG_BAY',			'TERRAIN_SNOW'),
	('FEATURE_HA_LONG_BAY',			'TERRAIN_SNOW_HILLS'),
	('FEATURE_HA_LONG_BAY',			'TERRAIN_SNOW_MOUNTAIN'),
	('FEATURE_HA_LONG_BAY',			'TERRAIN_TUNDRA'),
	('FEATURE_HA_LONG_BAY',			'TERRAIN_TUNDRA_HILLS'),
	('FEATURE_HA_LONG_BAY',			'TERRAIN_TUNDRA_MOUNTAIN'),
	('FEATURE_YOSEMITE',			'TERRAIN_SNOW'),
	('FEATURE_YOSEMITE',			'TERRAIN_SNOW_HILLS'),
	('FEATURE_YOSEMITE',			'TERRAIN_TUNDRA'),
	('FEATURE_YOSEMITE',			'TERRAIN_TUNDRA_HILLS');
--	('FEATURE_ZHANGYE_DANXIA',		'TERRAIN_GRASS_MOUNTAIN'),
--	('FEATURE_ZHANGYE_DANXIA',		'TERRAIN_PLAINS_MOUNTAIN'),
--	('FEATURE_ZHANGYE_DANXIA',		'TERRAIN_DESERT_MOUNTAIN'),
--	('FEATURE_ZHANGYE_DANXIA',		'TERRAIN_SNOW_MOUNTAIN'),
--	('FEATURE_ZHANGYE_DANXIA',		'TERRAIN_TUNDRA_MOUNTAIN');
--潘塔纳尔增加绑定沼泽
insert or replace into Feature_AdjacentFeatures
	(FeatureType,					FeatureTypeAdjacent)
values
	('FEATURE_PANTANAL',			'FEATURE_MARSH'),
	('FEATURE_KILIMANJARO',			'FEATURE_JUNGLE');