-------------------------------------
--     Civilization Adjustment     --
-------------------------------------

-- Eleanor
update ModifierArguments set Value = 2 where ModifierId = 'IDENTITY_NEARBY_GREATWORKS' and Name = 'Amount';

-- Arab
update ModifierArguments set Value = 4 where ModifierId = 'TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION' and Name = 'Amount';

-- Babylon
update ModifierArguments set Value = 56 where ModifierId = 'TRAIT_EUREKA_INCREASE';

-- Maori
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_MAORI_MANA' and ModifierId = 'TRAIT_MAORI_PREVENT_HARVEST';

insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE'),
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE')
;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) values
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_JUNGLE_CIVIL_SERVICE_REQUIREMENTS'),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_FOREST_CIVIL_SERVICE_REQUIREMENTS')
;

insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 'YieldType', 'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 'Amount', 1),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 'YieldType', 'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 'Amount', 1)
;

update ModifierArguments set Value = 1 where
	ModifierId = 'TRAIT_MAORI_PRODUCTION_RAINFOREST_CONSERVATION' and Name = 'Amount';
update ModifierArguments set Value = 1 where
	ModifierId = 'TRAIT_MAORI_PRODUCTION_WOODS_CONSERVATION' and Name = 'Amount';

-- Kongo
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_WRITER_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_ARTIST_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_MUSICIAN_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_MERCHANT_POINTS' and Name = 'Amount';

-- Mali
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_LEADER_SAHEL_MERCHANTS', 'DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN');

insert or replace into Modifiers (ModifierId, ModifierType) values
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_DOMESTIC');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',	'YieldType',	'YIELD_GOLD'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',	'TerrainType',	'TERRAIN_DESERT'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',	'Origin',		1),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',	'Amount',		1);

-- Maya
update Modifiers set SubjectRequirementSetId = 'OBJECT_IS_6_TILES_FROM_CAPITAL_REQUIREMENTS'
	where ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_GAIN_YIELDS';
update Modifiers set SubjectRequirementSetId = 'OBJECT_IS_10_OR_MORE_TILES_FROM_CAPITAL_REQUIREMENTS'
	where ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_LOSE_YIELDS';

insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_CIVILIZATION_MAYAB', 'MAYAB_EXTRA_HOUSING');
insert or replace into Modifiers (ModifierId, ModifierType) values
	('MAYAB_EXTRA_HOUSING', 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING');
insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('MAYAB_EXTRA_HOUSING', 'Amount', 1);

-- Rome
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAJANS_COLUMN_TRAIT', 'TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION');
insert or replace into Modifiers (ModifierId, ModifierType) values
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 'DistrictType', 'DISTRICT_CITY_CENTER'),
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 'Amount', 25);


-- Ethiopia
-- update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_FAITH_INTO_SCIENCE_HILLS' and Name = 'Amount';
-- update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_FAITH_INTO_CULTURE_HILLS' and Name = 'Amount';

--Egypt
--泛滥区域上的建筑加1粮
--建造完奇观以后送工人
--UI为相邻泛滥田+1粮
--la商路翻倍

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	-- ('TRAIT_CIVILIZATION_ITERU',			'TRAIT_FLOODPLAIN_BUILDINGS_FOOD'),
	-- ('TRAIT_CIVILIZATION_ITERU',			'TRAIT_GRASSFLOODPLAIN_BUILDINGS_FOOD'),
	-- ('TRAIT_CIVILIZATION_ITERU',			'TRAIT_PLAINFLOODPLAIN_BUILDINGS_FOOD'),
	('TRAIT_CIVILIZATION_ITERU',			'TRAIT_FREE_BUILDER_AFTER_FININSHING_WONDER');

insert or replace into ImprovementModifiers
	(ImprovementType,						ModifierId)
values
	('IMPROVEMENT_SPHINX',					'SPHINX_ADJACENT_FLOODPLAINS_FARM_FOOD');

insert or replace into Modifiers 
	(ModifierId, 									ModifierType,													RunOnce,	Permanent,	SubjectRequirementSetId)
values
	('SPHINX_ADJACENT_FLOODPLAINS_FARM_FOOD',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',							0,0,'SPHINX_ADJACENT_FLOODPLAINS_FARM_REQUIREMENTS'),
	-- ('TRAIT_FLOODPLAIN_BUILDINGS_FOOD',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_FEATURE_YIELD_CHANGE',	0,0,NULL),
	-- ('TRAIT_GRASSFLOODPLAIN_BUILDINGS_FOOD',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_FEATURE_YIELD_CHANGE',	0,0,NULL),
	-- ('TRAIT_PLAINFLOODPLAIN_BUILDINGS_FOOD',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_FEATURE_YIELD_CHANGE',	0,0,NULL),
	('TRAIT_FREE_BUILDER_AFTER_FININSHING_WONDER',	'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',						1,1,'EGYPT_REQUIREMENTS');

insert or replace into RequirementSets
	(RequirementSetId,									RequirementSetType)
values
	('SPHINX_ADJACENT_FLOODPLAINS_FARM_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL'),
	('EGYPT_REQUIREMENTS',								'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,								RequirementId)
values
	('SPHINX_ADJACENT_FLOODPLAINS_FARM_REQUIREMENTS','ADJACENT_TO_OWNER'),
	('SPHINX_ADJACENT_FLOODPLAINS_FARM_REQUIREMENTS','REQUIRES_PLOT_HAS_FARM'),
	('SPHINX_ADJACENT_FLOODPLAINS_FARM_REQUIREMENTS','REQUIRES_PLOT_HAS_FLOODPLAINS_TAG'),
	('EGYPT_REQUIREMENTS',							'PLAYER_IS_CIVILIZATION_EGYPT');

insert or replace into BuildingModifiers (BuildingType,ModifierId)
	select 	BuildingType ,'TRAIT_FREE_BUILDER_AFTER_FININSHING_WONDER' from Buildings where IsWonder = 1; 

insert or replace into ModifierArguments 
	(ModifierId, 											Name,				 Value) 
values
	('SPHINX_ADJACENT_FLOODPLAINS_FARM_FOOD',				'Amount',			1),
	('SPHINX_ADJACENT_FLOODPLAINS_FARM_FOOD',				'YieldType',		'YIELD_FOOD'),
	('TRAIT_FREE_BUILDER_AFTER_FININSHING_WONDER',			'UnitType',			'UNIT_BUILDER'),
	('TRAIT_FREE_BUILDER_AFTER_FININSHING_WONDER',			'Amount',			1);
	-- ('TRAIT_GRASSFLOODPLAIN_BUILDINGS_FOOD',				'FeatureType',		'FEATURE_FLOODPLAINS_GRASSLAND'),
	-- ('TRAIT_GRASSFLOODPLAIN_BUILDINGS_FOOD',				'YieldType',		'YIELD_FOOD'),
	-- ('TRAIT_GRASSFLOODPLAIN_BUILDINGS_FOOD',				'Amount',			1),
	-- ('TRAIT_PLAINFLOODPLAIN_BUILDINGS_FOOD',				'FeatureType',		'FEATURE_FLOODPLAINS_PLAINS'),
	-- ('TRAIT_PLAINFLOODPLAIN_BUILDINGS_FOOD',				'YieldType',		'YIELD_FOOD'),
	-- ('TRAIT_PLAINFLOODPLAIN_BUILDINGS_FOOD',				'Amount',			1),
	-- ('TRAIT_FLOODPLAIN_BUILDINGS_FOOD',						'FeatureType',		'FEATURE_FLOODPLAINS'),
	-- ('TRAIT_FLOODPLAIN_BUILDINGS_FOOD',						'YieldType',		'YIELD_FOOD'),
	-- ('TRAIT_FLOODPLAIN_BUILDINGS_FOOD',						'Amount',			1);

update ModifierArguments set value = 8 where ModifierId ='TRAIT_INTERNATIONAL_TRADE_GAIN_GOLD' and Name = 'Amount';
update ModifierArguments set value = 4 where ModifierId ='TRAIT_INCOMING_TRADE_GAIN_GOLD' and Name = 'Amount';
update ModifierArguments set value = 4 where ModifierId ='TRAIT_INCOMING_TRADE_OFFER_FOOD' and Name = 'Amount';
update ModifierArguments set value = 2 where ModifierId ='TRAIT_ALLIANCE_POINTS_FROM_TRADE' and Name = 'Amount';

-- Gaul can now build all districts near City Center
delete from TraitModifiers where ModifierId ='TRAIT_CIVILIZATION_GAUL_CITY_NO_ADJACENT_DISTRICT';


-- Hungary
update ModifierArguments set value = 50 where ModifierId ='LEVY_UNITUPGRADEDISCOUNT' and Name = 'Amount';
-----------------------------------------------------------------------------------------------------------------------
--Persia
--波斯LA从占领城市驻军+5忠诚变成全部城市驻军+5忠诚
--长生军变成28远程，33近战 (在DL_Units里面修改)
--波斯庭院相邻港口+1金，相邻市中心除了1金外额外+1粮
--波斯UA内商+1琴改为+2琴
--波斯、马其顿、罗马、刚果、日本、格鲁吉亚、挪威增加铁关联（4级关联，在DL_StartBias里面修改）
--城市中建造的首座波斯庭院改良设施可以提供+1点宜居度
insert or replace into Improvement_YieldChanges
	(ImprovementType,							YieldType,			YieldChange)
values
	('IMPROVEMENT_PAIRIDAEZA',					'YIELD_FOOD',		0);

insert or replace into Improvement_Adjacencies 
	(ImprovementType,							YieldChangeId)
values
	('IMPROVEMENT_PAIRIDAEZA',					'Pairidaeza_CityCenterAdjacency_Food'),
	('IMPROVEMENT_PAIRIDAEZA',					'Pairidaeza_HarborAdjacency');

insert or replace into Adjacency_YieldChanges
	(ID,										Description,		YieldType,		YieldChange,	AdjacentDistrict)
values
	('Pairidaeza_CityCenterAdjacency_Food',		'Placeholder',		'YIELD_FOOD',	1,				'DISTRICT_CITY_CENTER'),
	('Pairidaeza_HarborAdjacency',				'Placeholder',		'YIELD_GOLD',	1,				'DISTRICT_HARBOR');

insert or replace into ImprovementModifiers
	(ImprovementType,                           ModifierId)
values
    ('IMPROVEMENT_PAIRIDAEZA',                  'PAIRIDAEZA_AMENITY_MAX_ONE');

insert into Modifiers
		(ModifierId,                                    ModifierType,                                           SubjectStackLimit)
values
	    ('PAIRIDAEZA_AMENITY_MAX_ONE',                  'MODIFIER_CITY_OWNER_ADJUST_IMPROVEMENT_AMENITY',       1);

insert into ModifierArguments
    	(ModifierId,                                     Name,                Value)
values
        ('PAIRIDAEZA_AMENITY_MAX_ONE',                  'Amount',             1);

insert or replace into ModifierArguments 
	(ModifierId, 								Name,				Value) 
values
	('TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE',	'Amount',			2);

INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_SATRAPIES', 'PERSIA_GOVERNOR_POINTS');

INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
('PERSIA_GOVERNOR_POINTS', 'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS', 'PLAYER_HAS_POLITICAL_PHILOSOPHY');

INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('PERSIA_GOVERNOR_POINTS', 'Delta', '1');


update Modifiers set ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN' where ModifierId = 'TRAIT_ADDITIONAL_MARTIAL_LAW';
update Modifiers set SubjectRequirementSetId = 'CITY_HAS_GARRISON_UNIT_REQUIERMENT' where ModifierId = 'TRAIT_ADDITIONAL_MARTIAL_LAW';

-------------------------------------------------------------------------------------------------------------------------------
--Mapuche
--木人现在可以在魅力迷人及以上的地块建造，且生成相当于魅力值100%的文化产出。
update Improvements set MinimumAppeal = 2 where ImprovementType = 'IMPROVEMENT_CHEMAMULL';
update Improvements set YieldFromAppealPercent = 100 where ImprovementType = 'IMPROVEMENT_CHEMAMULL';

-------------------------------------------------------------------------------------------------------------------------------

-- Vietnam can build districts in all features and do not remove on forest jungle and marsh
-- rainforest +2 food forest +2 production marsh +2 science
delete from TraitModifiers where ModifierId = 'TRAIT_DISTRICTS_FOREST_ONLY';
delete from TraitModifiers where ModifierId = 'TRAIT_DISTRICTS_MARSH_ONLY';
delete from TraitModifiers where ModifierId = 'TRAIT_DISTRICTS_JUNGLE_ONLY';

insert or replace into TraitModifiers (TraitType,	ModifierId) 
	select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_JUNGLE_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into TraitModifiers (TraitType,	ModifierId) 
	select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_MARSH_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into TraitModifiers (TraitType,	ModifierId) 
	select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_FOREST_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

insert or replace into Modifiers 	(ModifierId, ModifierType)
	select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
	from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into Modifiers 	(ModifierId, ModifierType)
	select 'TRAIT_MARSH_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
	from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into Modifiers 	(ModifierId, ModifierType)
	select 'TRAIT_FOREST_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
	from Districts where DistrictType != 'DISTRICT_CITY_CENTER';	

insert or replace into ModifierArguments 	(ModifierId, 	Name,		 Value) 
	select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'DistrictType', DistrictType
	from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments 	(ModifierId, 	Name,		 Value) 
	select 'TRAIT_MARSH_VALID_' || DistrictType, 'DistrictType', DistrictType
	from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments 	(ModifierId, 	Name,		 Value) 
	select 'TRAIT_FOREST_VALID_' || DistrictType, 'DistrictType', DistrictType
	from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments 	(ModifierId, 	Name,		 Value) 
	select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'FeatureType', 'FEATURE_JUNGLE'
	from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments 	(ModifierId, 	Name,		 Value) 
	select 'TRAIT_MARSH_VALID_' || DistrictType, 'FeatureType', 'FEATURE_MARSH'
	from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments 	(ModifierId, 	Name,		 Value) 
	select 'TRAIT_FOREST_VALID_' || DistrictType, 'FeatureType', 'FEATURE_FOREST'
	from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

update ModifierArguments set Value = 'YIELD_PRODUCTION' where ModifierId = 'TRAIT_FOREST_BUILDINGS_CULTURE' and Name = 'YieldType';
update ModifierArguments set Value = 'YIELD_FOOD' where ModifierId = 'TRAIT_JUNGLE_BUILDINGS_SCIENCE' and Name = 'YieldType';
update ModifierArguments set Value = 'YIELD_SCIENCE' where ModifierId = 'TRAIT_MARSH_BUILDINGS_PRODUCTION' and Name = 'YieldType';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_FOREST_BUILDINGS_CULTURE' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_JUNGLE_BUILDINGS_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_MARSH_BUILDINGS_PRODUCTION' and Name = 'Amount';
--------------------------------------------------------------------------------------------------------------------------
--UB ajustment for BUILDING_TSIKHE
--adjust Ub base tourism to 5
insert or replace into CivicModifiers (CivicType, ModifierId) values
	('CIVIC_CONSERVATION', 'CONSERVATION_TSIKHE_TOURISM');

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) values
	('CONSERVATION_TSIKHE_TOURISM', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_CHANGE',	'DISTRICT_IS_CITY_CENTER_TSIKHE');

insert or replace into ModifierArguments 	(ModifierId, Name, Value) values
	('CONSERVATION_TSIKHE_TOURISM', 'Amount', 2);

insert or replace into RequirementSetRequirements(RequirementSetId, RequirementId) values
	('DISTRICT_IS_CITY_CENTER_TSIKHE', 'REQUIRES_DISTRICT_IS_CITY_CENTER'),
	('DISTRICT_IS_CITY_CENTER_TSIKHE', 'REQUIRES_CITY_HAS_TSIKHE');

insert or replace into RequirementSets (RequirementSetId, RequirementSetType) values
	('DISTRICT_IS_CITY_CENTER_TSIKHE', 'REQUIREMENTSET_TEST_ALL');

---GOLDEN AGE TOURISM AND FAITH +300%
update ModifierArguments set Value = 12 where ModifierId = 'TSIKHE_FAITH_GOLDEN_AGE' and Name = 'Amount';
update ModifierArguments set Value = 15 where ModifierId = 'CONSERVATION_TSIKHE_TOURISM_GOLDEN_AGE' and Name = 'Amount';

----------------------------------------------------------------------------------------------------------------------------

-- inca UI adjustment

update Adjacency_YieldChanges set ObsoleteTech = 'TECH_ENGINEERING' where ID = 'Terrace_GrassMountainAdjacency';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_ENGINEERING' where ID = 'Terrace_PlainsMountainAdjacency';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_ENGINEERING' where ID = 'Terrace_DesertMountainAdjacency';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_ENGINEERING' where ID = 'Terrace_TundraMountainAdjacency';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_ENGINEERING' where ID = 'Terrace_SnowMountainAdjacency';

insert or replace into Improvement_Adjacencies
	(ImprovementType,				YieldChangeId)
values
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_GrassMountainAdjacency_later'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_PlainsMountainAdjacency_later'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_DesertMountainAdjacency_later'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_TundraMountainAdjacency_later'),
	('IMPROVEMENT_TERRACE_FARM',	'Terrace_SnowMountainAdjacency_later');

insert or replace into Adjacency_YieldChanges
	(ID,	Description,	YieldChange,	YieldType,	AdjacentTerrain,	PrereqTech)
values
	('Terrace_GrassMountainAdjacency_later',	'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_GRASS_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_PlainsMountainAdjacency_later',	'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_PLAINS_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_DesertMountainAdjacency_later',	'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_DESERT_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_TundraMountainAdjacency_later',	'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_TUNDRA_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_SnowMountainAdjacency_later',		'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_SNOW_MOUNTAIN',	'TECH_ENGINEERING');

update ModifierArguments set Value = 3 where ModifierId = 'TRAIT_PRODUCTION_MOUNTAIN' and Name = 'Amount';

insert or replace into TraitModifiers
	(TraitType,						ModifierId)
values
	('TRAIT_CIVILIZATION_GREAT_MOUNTAINS',	'TRAIT_TERRACE_GRASS_MOUNTAIN_PRODUCTION'),
	('TRAIT_CIVILIZATION_GREAT_MOUNTAINS',	'TRAIT_TERRACE_PLAINS_MOUNTAIN_PRODUCTION'),
	('TRAIT_CIVILIZATION_GREAT_MOUNTAINS',	'TRAIT_TERRACE_DESERT_MOUNTAIN_PRODUCTION'),
	('TRAIT_CIVILIZATION_GREAT_MOUNTAINS',	'TRAIT_TERRACE_TUNDRA_MOUNTAIN_PRODUCTION'),
	('TRAIT_CIVILIZATION_GREAT_MOUNTAINS',	'TRAIT_TERRACE_SNOW_MOUNTAIN_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,			ModifierType,	SubjectRequirementSetId)
values
	('TRAIT_TERRACE_GRASS_MOUNTAIN_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_TERRAIN_YIELD_FROM_ADJACENT_IMPROVEMENTS',	'PLAYER_HAS_CONSTRUCTION_REQUIREMENTS'),
	('TRAIT_TERRACE_PLAINS_MOUNTAIN_PRODUCTION','MODIFIER_PLAYER_CITIES_ADJUST_TERRAIN_YIELD_FROM_ADJACENT_IMPROVEMENTS',	'PLAYER_HAS_CONSTRUCTION_REQUIREMENTS'),
	('TRAIT_TERRACE_DESERT_MOUNTAIN_PRODUCTION','MODIFIER_PLAYER_CITIES_ADJUST_TERRAIN_YIELD_FROM_ADJACENT_IMPROVEMENTS',	'PLAYER_HAS_CONSTRUCTION_REQUIREMENTS'),
	('TRAIT_TERRACE_TUNDRA_MOUNTAIN_PRODUCTION','MODIFIER_PLAYER_CITIES_ADJUST_TERRAIN_YIELD_FROM_ADJACENT_IMPROVEMENTS',	'PLAYER_HAS_CONSTRUCTION_REQUIREMENTS'),
	('TRAIT_TERRACE_SNOW_MOUNTAIN_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_TERRAIN_YIELD_FROM_ADJACENT_IMPROVEMENTS',	'PLAYER_HAS_CONSTRUCTION_REQUIREMENTS');

insert or replace into RequirementSetRequirements(RequirementSetId,RequirementId)values
	('PLAYER_HAS_CONSTRUCTION_REQUIREMENTS','REQUIRES_PLAYER_HAS_TECH_CONSTRUCTION');
insert or replace into RequirementSets(RequirementSetId,RequirementSetType)values
	('PLAYER_HAS_CONSTRUCTION_REQUIREMENTS','REQUIREMENTSET_TEST_ALL');

insert or replace into ModifierArguments
	(ModifierId,									Name,				Value)
values
	('TRAIT_TERRACE_GRASS_MOUNTAIN_PRODUCTION',		'TerrainType',		'TERRAIN_GRASS_MOUNTAIN'),
	('TRAIT_TERRACE_GRASS_MOUNTAIN_PRODUCTION',		'ImprovementType',	'IMPROVEMENT_TERRACE_FARM'),
	('TRAIT_TERRACE_GRASS_MOUNTAIN_PRODUCTION',		'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_TERRACE_GRASS_MOUNTAIN_PRODUCTION',		'Amount',			1),
	('TRAIT_TERRACE_PLAINS_MOUNTAIN_PRODUCTION',	'TerrainType',		'TERRAIN_PLAINS_MOUNTAIN'),
	('TRAIT_TERRACE_PLAINS_MOUNTAIN_PRODUCTION',	'ImprovementType',	'IMPROVEMENT_TERRACE_FARM'),
	('TRAIT_TERRACE_PLAINS_MOUNTAIN_PRODUCTION',	'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_TERRACE_PLAINS_MOUNTAIN_PRODUCTION',	'Amount',			1),
	('TRAIT_TERRACE_DESERT_MOUNTAIN_PRODUCTION',	'TerrainType',		'TERRAIN_DESERT_MOUNTAIN'),
	('TRAIT_TERRACE_DESERT_MOUNTAIN_PRODUCTION',	'ImprovementType',	'IMPROVEMENT_TERRACE_FARM'),
	('TRAIT_TERRACE_DESERT_MOUNTAIN_PRODUCTION',	'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_TERRACE_DESERT_MOUNTAIN_PRODUCTION',	'Amount',			1),
	('TRAIT_TERRACE_TUNDRA_MOUNTAIN_PRODUCTION',	'TerrainType',		'TERRAIN_TUNDRA_MOUNTAIN'),
	('TRAIT_TERRACE_TUNDRA_MOUNTAIN_PRODUCTION',	'ImprovementType',	'IMPROVEMENT_TERRACE_FARM'),
	('TRAIT_TERRACE_TUNDRA_MOUNTAIN_PRODUCTION',	'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_TERRACE_TUNDRA_MOUNTAIN_PRODUCTION',	'Amount',			1),
	('TRAIT_TERRACE_SNOW_MOUNTAIN_PRODUCTION',		'TerrainType',		'TERRAIN_SNOW_MOUNTAIN'),
	('TRAIT_TERRACE_SNOW_MOUNTAIN_PRODUCTION',		'ImprovementType',	'IMPROVEMENT_TERRACE_FARM'),
	('TRAIT_TERRACE_SNOW_MOUNTAIN_PRODUCTION',		'YieldType',		'YIELD_PRODUCTION'),
	('TRAIT_TERRACE_SNOW_MOUNTAIN_PRODUCTION',		'Amount',			1);

-- inca all land units receive ability to move on hills without movement penalty
insert or replace into TraitModifiers
	(TraitType,						ModifierId)
values
	-- ('TRAIT_CIVILIZATION_GREAT_MOUNTAINS',	'TRAIT_ALL_LAND_UNITS_IGNORE_HILLS');
	('TRAIT_LEADER_PACHACUTI_QHAPAQ_NAN',	'TRAIT_ALL_LAND_UNITS_IGNORE_HILLS');

insert or replace into Modifiers
	(ModifierId,			ModifierType)
values
	('TRAIT_ALL_LAND_UNITS_IGNORE_HILLS','MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

insert or replace into ModifierArguments
	(ModifierId,									Name,				Value)
values
	('TRAIT_ALL_LAND_UNITS_IGNORE_HILLS','AbilityType','ABILITY_INCA_IGNORE_HILLS');


-- Brazil 
-- lumber mill +1 adjacency bonus to IZ
-- IZ +1 production to adjacent rainforest
-- +2 culture if lumber mill is built on rainforest +100% tourism = culture if flight is researched
-- districts do not remove rainforest
-- +1 faith in each rainforest tiles after recruit a great person

insert or replace into Modifiers
	(ModifierId,							ModifierType,							SubjectRequirementSetId)
values
	('TRAIT_GREAT_PEOPLE_JUNGLE_FAITH',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_JUNGLE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('TRAIT_GREAT_PEOPLE_JUNGLE_FAITH',		'YieldType',	'YIELD_FAITH'),
	('TRAIT_GREAT_PEOPLE_JUNGLE_FAITH',		'Amount',		1);

insert or replace into TraitModifiers
	(TraitType,						ModifierId)
values
	('TRAIT_CIVILIZATION_AMAZON',	'TRAIT_CITYCENTER_ADJACENT_RAINFOREST_FAITH'),
	('TRAIT_CIVILIZATION_AMAZON',	'TRAIT_CIVILIZATION_BRAZIL_INDUSTRAIL_ADJACENCYPRODUCTION'),
	('TRAIT_CIVILIZATION_AMAZON',	'TRAIT_RAINFOREST_PRODUCTION_IZ'),
	('TRAIT_CIVILIZATION_AMAZON',	'BRAZIL_RAINFOREST_CULTURE');

insert or replace into Modifiers
	(ModifierId,							ModifierType,						SubjectRequirementSetId)
values
	('TRAIT_CITYCENTER_ADJACENT_RAINFOREST_FAITH','MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE','CITY_ADJACENT_TO_JUNGLE_REQUIREMENTS'),
	('BRAZIL_RAINFOREST_CULTURE',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_LUMBER_MILL_AND_RAINFOREST_REQUIREMENTS'),
	('TRAIT_RAINFOREST_PRODUCTION_IZ',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_ADJACENT_TO_IZ_AND_RAINFOREST_REQUIREMENTS'),
	('TRAIT_CIVILIZATION_BRAZIL_INDUSTRAIL_ADJACENCYPRODUCTION','MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY',NULL);

insert or replace into ModifierArguments
	(ModifierId,													Name,			Value)
values
	('TRAIT_CITYCENTER_ADJACENT_RAINFOREST_FAITH',					'YieldType',	'YIELD_FAITH'),
	('TRAIT_CITYCENTER_ADJACENT_RAINFOREST_FAITH',					'Amount',		1),	
	('BRAZIL_RAINFOREST_CULTURE',									'YieldType',	'YIELD_CULTURE'),
	('BRAZIL_RAINFOREST_CULTURE',									'Amount',		2),	
	('TRAIT_RAINFOREST_PRODUCTION_IZ',								'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_RAINFOREST_PRODUCTION_IZ',								'Amount',		1),			
	('TRAIT_CIVILIZATION_BRAZIL_INDUSTRAIL_ADJACENCYPRODUCTION',	'DistrictType',	'DISTRICT_INDUSTRIAL_ZONE'),
	('TRAIT_CIVILIZATION_BRAZIL_INDUSTRAIL_ADJACENCYPRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_CIVILIZATION_BRAZIL_INDUSTRAIL_ADJACENCYPRODUCTION',	'ImprovementType','IMPROVEMENT_LUMBER_MILL'),
	('TRAIT_CIVILIZATION_BRAZIL_INDUSTRAIL_ADJACENCYPRODUCTION',	'Amount',		1),
	('TRAIT_CIVILIZATION_BRAZIL_INDUSTRAIL_ADJACENCYPRODUCTION',	'Description',	'LOC_DISTRICT_LUMBER_MILL_1_PRODUCTION'),
	('TRAIT_CIVILIZATION_BRAZIL_INDUSTRAIL_ADJACENCYPRODUCTION',	'TilesRequired',1);

insert or replace into ExcludedAdjacencies
	(TraitType,			YieldChangeId)
values
	('TRAIT_CIVILIZATION_AMAZON',	'LumberMill_HalfProduction');

insert or replace into Improvement_Tourism
	(ImprovementType,TourismSource,PrereqTech,ScalingFactor)
values
	('IMPROVEMENT_LUMBER_MILL','TOURISMSOURCE_CULTURE','TECH_FLIGHT',100);

insert or replace into TraitModifiers (TraitType,	ModifierId) 
	select 'TRAIT_CIVILIZATION_AMAZON', 'TRAIT_JUNGLE_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

insert or replace into RequirementSets
	(RequirementSetId,										RequirementSetType)
values
	('CITY_ADJACENT_TO_JUNGLE_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL'),
	('PLOT_ADJACENT_TO_IZ_AND_RAINFOREST_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL'),
	('PLOT_HAS_LUMBER_MILL_AND_RAINFOREST_REQUIREMENTS','REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,										RequirementId)
values
	('CITY_ADJACENT_TO_JUNGLE_REQUIREMENTS',				'REQUIRES_PLOT_ADJACENT_TO_JUNGLE'),
	('PLOT_ADJACENT_TO_IZ_AND_RAINFOREST_REQUIREMENTS',		'REQUIRES_PLOT_HAS_JUNGLE'),
	('PLOT_ADJACENT_TO_IZ_AND_RAINFOREST_REQUIREMENTS',		'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_INDUSTRIAL_ZONE'),
	('PLOT_HAS_LUMBER_MILL_AND_RAINFOREST_REQUIREMENTS',	'REQUIRES_PLOT_HAS_LUMBER_MILL'),
	('PLOT_HAS_LUMBER_MILL_AND_RAINFOREST_REQUIREMENTS',	'REQUIRES_PLOT_HAS_JUNGLE');