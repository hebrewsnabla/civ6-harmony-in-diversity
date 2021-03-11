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
update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_FAITH_INTO_SCIENCE_HILLS' and Name = 'Amount';
update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_FAITH_INTO_CULTURE_HILLS' and Name = 'Amount';

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


-- Minor Civs, City states

-- Valletta
-- insert or replace into TraitModifiers 
-- 	(TraitType,						ModifierId)
-- values
-- 	('MINOR_CIV_VALLETTA_TRAIT',	'MINOR_CIV_VALLETTA_UNIQUE_INFLUENCE_PURCHASE_CHEAPER_TSIKHE_BONUS');

-- insert or replace into Modifiers 
-- 	(ModifierId,															ModifierType,											SubjectRequirementSetId)
-- values
-- 	('MINOR_CIV_VALLETTA_UNIQUE_INFLUENCE_PURCHASE_CHEAPER_TSIKHE_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
-- 	('MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_TSIKHE_BONUS',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PURCHASE_COST',	NULL);

-- insert into	ModifierArguments
-- 	(ModifierId, 															Name,			Value)
-- values
-- 	('MINOR_CIV_VALLETTA_UNIQUE_INFLUENCE_PURCHASE_CHEAPER_TSIKHE_BONUS',	'ModifierId',	'MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_TSIKHE_BONUS'),
-- 	('MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_TSIKHE_BONUS',					'BuildingType',	'BUILDING_TSIKHE'),
-- 	('MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_TSIKHE_BONUS',					'Amount',		50);

-- Singapore
-- MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL
delete from TraitModifiers where TraitType = 'MINOR_CIV_SINGAPORE_TRAIT' and ModifierId = 'MINOR_CIV_SINGAPORE_UNIQUE_INFLUENCE_BONUS';
insert or replace into TraitModifiers 
	(TraitType,								ModifierId)
values
	('MINOR_CIV_SINGAPORE_TRAIT',			'SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION'),
	('MINOR_CIV_SINGAPORE_TRAIT',			'SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY'),
	('MINOR_CIV_SINGAPORE_TRAIT',			'SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN');

insert or replace into Modifiers 
	(ModifierId,												ModifierType,															SubjectRequirementSetId)
values
	('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',									'PLAYER_IS_SUZERAIN'),
	('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION_MODIFIER',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',			NULL),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',									'PLAYER_IS_SUZERAIN'),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY_MODIFIER',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE',		NULL),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',									'PLAYER_IS_SUZERAIN'),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN_MODIFIER',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE',	NULL);

insert into	ModifierArguments
	(ModifierId, 												Name,			Value)
values
	('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION',			'ModifierId',	'SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION_MODIFIER'),
	('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION_MODIFIER',	'YieldType',	'YIELD_PRODUCTION'),
	('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION_MODIFIER',	'Amount',		2),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY',					'ModifierId',	'SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY_MODIFIER'),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY_MODIFIER',			'YieldType',	'YIELD_GOLD'),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY_MODIFIER',			'Amount',		4),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN',				'ModifierId',	'SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN_MODIFIER'),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN_MODIFIER',		'YieldType',	'YIELD_GOLD'),
	('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN_MODIFIER',		'Amount',		4);

-- Rapa nui, opinion: only plots adjacent to coast/lake can build moai, but cannot enable the placement on VOLCANIC_SOIL.
delete from Improvement_InvalidAdjacentFeatures where ImprovementType = 'IMPROVEMENT_MOAI';
update Improvements set ValidAdjacentTerrainAmount = 1 where ImprovementType = 'IMPROVEMENT_MOAI';
insert into Improvement_ValidAdjacentTerrains (ImprovementType, TerrainType) values
	('IMPROVEMENT_MOAI', 'TERRAIN_COAST');

update ModifierArguments set value = 2 where ModifierId = 'MOAI_COASTADJACENCY_CULTURE' and Name = 'Amount';

-- Mohenjo Daro
insert into TraitModifiers 
	(TraitType,								ModifierId)
values
	('MINOR_CIV_MOHENJO_DARO_TRAIT',		'MOHENJO_DARO_BOUNAS_HOUSING');

insert into	Modifiers
	(ModifierId,									ModifierType,										SubjectRequirementSetId)
values
	('MOHENJO_DARO_BOUNAS_HOUSING',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',				'PLAYER_IS_SUZERAIN'),
	('MOHENJO_DARO_BOUNAS_HOUSING_MODIFIER',		'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',		null);

insert into	ModifierArguments
	(ModifierId, 									Name,												Value)
values
	('MOHENJO_DARO_BOUNAS_HOUSING',					'ModifierId',										'MOHENJO_DARO_BOUNAS_HOUSING_MODIFIER'),
	('MOHENJO_DARO_BOUNAS_HOUSING_MODIFIER',		'Amount',											1);

-- Kumasi
-- update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_KUMASI_CULTURE_TRADE_ROUTE_YIELD_BONUS' and Name = 'Amount';
-- Chinguetti
update ModifierArguments set Value = 0.8 where ModifierId = 'MINOR_CIV_CHINGUETTI_FAITH_FOLLOWERS' and Name = 'Amount';
-- Kandy
update ModifierArguments set Value = 200 where ModifierId = 'MINOR_CIV_KANDY_BETTER_RELIC_BONUS' and Name = 'ScalingFactor';
delete from TraitModifiers where TraitType = 'MINOR_CIV_KANDY_TRAIT' and ModifierId = 'MINOR_CIV_KANDY_UNIQUE_INFLUENCE_GRANT_BONUS';


--City-state by zhushou

-- Venice（Antioch）
update ModifierArguments set Value = 2 where ModifierId = 'MINOR_CIV_ANTIOCH_LUXURY_TRADE_ROUTE_BONUS' and Name = 'Amount';
--Hunza
update ModifierArguments set Value = 0.4 where ModifierId = 'MINOR_CIV_HUNZA_GOLD_FROM_TRADE_ROUTE_LENGTH' and Name = 'Amount';
--Bandar Seri Begawan(Jakarta)
update ModifierArguments set Value = 'MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS' where ModifierId = 'MINOR_CIV_JAKARTA_UNIQUE_INFLUENCE_BONUS' and Name = 'ModifierId';
--Lisbon
--delete from TraitModifiers where TraitType = 'MINOR_CIV_KANDY_TRAIT' and ModifierId = 'MINOR_CIV_LISBON_UNIQUE_INFLUENCE_BONUS';
--Muscat
--Samarkand
update ModifierArguments set Value = 2 where ModifierId = 'MINOR_CIV_SAMARKAND_TRADE_GOLD_MODIFIER' and Name = 'Amount';

--Granada 阿卡萨地堡基础文化改为3，地块魅力加成改为75%
update Improvements set YieldFromAppealPercent = 75 where ImprovementType ='IMPROVEMENT_ALCAZAR';
update Improvement_YieldChanges set YieldChange = 3 where ImprovementType ='IMPROVEMENT_ALCAZAR';

-- Nalanda
delete from TraitModifiers where TraitType = 'MINOR_CIV_NALANDA_TRAIT' and ModifierId = 'MINOR_CIV_NALANDA_FREE_TECHNOLOGY';
update Improvement_YieldChanges set YieldChange = 3 where ImprovementType = 'IMPROVEMENT_MAHAVIHARA' and YieldType = 'YIELD_SCIENCE';
update Adjacency_YieldChanges  set YieldType = 'YIELD_SCIENCE' where ID = 'Mahavihara_Holy_Site_Faith';
--Hattusa
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_HORSES'   where ModifierId = 'MINOR_CIV_HATTUSA_HORSES_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_IRON'     where ModifierId = 'MINOR_CIV_HATTUSA_IRON_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_NITER'    where ModifierId = 'MINOR_CIV_HATTUSA_NITER_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_COAL'     where ModifierId = 'MINOR_CIV_HATTUSA_COAL_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_OIL'      where ModifierId = 'MINOR_CIV_HATTUSA_OIL_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_ALUMINUM' where ModifierId = 'MINOR_CIV_HATTUSA_ALUMINUM_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_URANIUM'  where ModifierId = 'MINOR_CIV_HATTUSA_URANIUM_RESOURCE_XP2';
--Fez
delete from TraitModifiers where TraitType = 'MINOR_CIV_FEZ_TRAIT' and ModifierId = 'MINOR_CIV_FEZ_UNIQUE_INFLUENCE_BONUS';
--Babylon
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_BABYLON_GREAT_WORK_WRITING_SCIENCE'  and Name = 'YieldChange';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_BABYLON_GREAT_WORK_ARTIFACT_SCIENCE' and Name = 'YieldChange';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_BABYLON_GREAT_WORK_RELIC_SCIENCE'    and Name = 'YieldChange';	
--Vatican City
delete from TraitModifiers where TraitType = 'MINOR_CIV_VATICAN_CITY_TRAIT' and ModifierId = 'MINOR_CIV_VATICAN_CITY_UNIQUE_INFLUENCE_BONUS';
--Armagh
update Adjacency_YieldChanges  set TilesRequired = 1 , ObsoleteCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Monastery_DistrictAdjacency';
insert or replace into Improvement_Adjacencies
	(ImprovementType,				YieldChangeId)
values 
	('IMPROVEMENT_MONASTERY',       'Monastery_DistrictAdjacency_Divine_Right_Late');
insert or replace into Adjacency_YieldChanges
	(ID, Description, YieldType, YieldChange, TilesRequired, OtherDistrictAdjacent, PrereqCivic)  
values 
	('Monastery_DistrictAdjacency_Divine_Right_Late', 'Placeholder', 'YIELD_FAITH', 2, 1, 1, 'CIVIC_DIVINE_RIGHT');

insert into TraitModifiers 
    (TraitType,                                  ModifierId)
values
	--Lisbon  
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_INTERCONTINENTAL_INTERNATIONAL_GOLD1'),
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD1'),
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION1'),
	--Muscat
	('MINOR_CIV_MUSCAT_TRAIT',				     'MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1'),
	--Fez
	('MINOR_CIV_FEZ_TRAIT',				         'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE'),
	('MINOR_CIV_FEZ_TRAIT',				         'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE'),
	('MINOR_CIV_FEZ_TRAIT',				         'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING'),
	--Vatican City
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS'),
	('MINOR_CIV_VATICAN_CITY_TRAIT',			 'MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS');

insert into Modifiers
	(ModifierId,										ModifierType,									    SubjectRequirementSetId)
values
    --Bandar Seri Begawan(Jakarta)
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',	        'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'PLOT_IS_OR_ADJACENT_TO_COAST'),
	--Lisbon
	('TRAIT_INTERCONTINENTAL_INTERNATIONAL_GOLD1',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD1',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION1',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	--Muscat
	('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1',	    'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS',	        'MODIFIER_PLAYER_CITIES_ADJUST_CITY_AMENITIES_FROM_CITY_STATES', 'CITY_HAS_HARBOR'),
	--Fez
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE',          'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE',          'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	        'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1',         'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',  'BUILDING_IS_SHRINE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1',         'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',  'BUILDING_IS_TEMPLE_XP2'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'BUILDING_IS_TIER3_HOLY_SITE'),
	--Vatican City
	('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1',		'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
	('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1',		'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null);
    


insert into ModifierArguments
	(ModifierId,										Name,			 Value)
values
    --Bandar Seri Begawan(Jakarta)
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',			'YieldType',	 'YIELD_GOLD'),
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',			'Amount',	     4),
	--Lisbon
    ('TRAIT_INTERCONTINENTAL_INTERNATIONAL_GOLD1',		'ModifierId',	 'TRAIT_INTERCONTINENTAL_INTERNATIONAL_GOLD'),
	('TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD1',			'ModifierId',	 'TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD'),
	('TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION1',		'ModifierId',	 'TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION'),
    --Muscat
	('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1',		'ModifierId',	 'MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS'),
	('MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS',	        'Amount',	     1),
	--Fez
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE',          'ModifierId',    'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE',          'ModifierId',	 'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING', 'ModifierId', 'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1',          'YieldType',	 'YIELD_SCIENCE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1',          'Amount',	     2),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1',          'YieldType',	 'YIELD_SCIENCE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1',          'Amount',	     2),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1', 'YieldType', 'YIELD_SCIENCE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1', 'Amount',    2),
	--Vatican City
	('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS',	'ModifierId',    'MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS',		'ModifierId',    'MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS',	'ModifierId',    'MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS',	'ModifierId',    'MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS',	'ModifierId',    'MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS',	'ModifierId',    'MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS',	'ModifierId',    'MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS',		'ModifierId',    'MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS',	'ModifierId',    'MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS',	'ModifierId',    'MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS',		'ModifierId',    'MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1'),
	('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1',	'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING'),
	('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1',	'YieldType',     'YIELD_CULTURE'),
	('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1',	'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1',	    'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING'),
	('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1',	    'YieldType',     'YIELD_FAITH'),
	('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1',	    'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1',	'GreatWorkObjectType', 'GREATWORKOBJECT_SCULPTURE'),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1',	'YieldType',     'YIELD_CULTURE'),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1',	'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1',	'GreatWorkObjectType', 'GREATWORKOBJECT_SCULPTURE'),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1',	'YieldType',     'YIELD_FAITH'),
	('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1',   'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1',	'GreatWorkObjectType', 'GREATWORKOBJECT_LANDSCAPE'),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1',	'YieldType',     'YIELD_CULTURE'),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1',	'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1',	'GreatWorkObjectType', 'GREATWORKOBJECT_LANDSCAPE'),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1',	'YieldType',     'YIELD_FAITH'),
	('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1',   'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1',	'GreatWorkObjectType', 'GREATWORKOBJECT_PORTRAIT'),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1',	'YieldType',     'YIELD_CULTURE'),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1',	'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1',	'GreatWorkObjectType', 'GREATWORKOBJECT_PORTRAIT'),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1',	'YieldType',     'YIELD_FAITH'),
	('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1',    'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1',	'GreatWorkObjectType', 'GREATWORKOBJECT_RELIGIOUS'),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1',	'YieldType',     'YIELD_CULTURE'),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1',	'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1',	'GreatWorkObjectType', 'GREATWORKOBJECT_RELIGIOUS'),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1',	'YieldType',     'YIELD_FAITH'),
	('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1',   'YieldChange',   2),
	('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1',	    'GreatWorkObjectType', 'GREATWORKOBJECT_RELIC'),
	('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1',	    'YieldType',     'YIELD_CULTURE'),
	('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1',  	'YieldChange',   3);

-- AYUTTHAYA
delete from ModifierArguments where Value = 'MINOR_CIV_AYUTTHAYA_CULTURE_COMPLETE_BUILDING';

insert or replace into Modifiers
	(ModifierId,										ModifierType,											SubjectRequirementSetId)
values
	('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				Null),
	('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER',	'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',	'MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,										Name,													Value)
values
	('MINOR_CIV_AYUTTHAYA_UNIQUE_INFLUENCE_BONUS',		'ModifierId',											'MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE'),
	('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE',			'ModifierId',											'MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER'),
	('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER',	'YieldType',											'YIELD_CULTURE'),
	('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER',	'Amount',												2);

-- Cardiff
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_LIGHTHOUSE' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_SHIPYARD' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_SEAPORT' and Name = 'Amount';

--普雷斯拉夫军营建筑加速军事单位建造
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_UNIQUE_INFLUENCE_BARRACKS_STABLE_IDENTITY_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_UNIQUE_INFLUENCE_ARMORY_IDENTITY_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_UNIQUE_INFLUENCE_MILITARY_ACADEMY_IDENTITY_BONUS';
	insert into TraitModifiers 
    (TraitType,                                 	 ModifierId)
values
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS');
insert into Modifiers
	(ModifierId,													ModifierType,									   			 SubjectRequirementSetId)
values
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            		'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            		'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	        			'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_MILITARY_UNITS_PRODUCTION',	'BUILDING_IS_BARRACKS_STABLE_MILITARITIC_CITY_STATE'),
	('MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS1',				'MODIFIER_PLAYER_CITIES_ADJUST_MILITARY_UNITS_PRODUCTION', 	'BUILDING_IS_ARMORY'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_MILITARY_UNITS_PRODUCTION', 	'BUILDING_IS_MILITARY_ACADEMY');
insert into ModifierArguments
	(ModifierId,															Name,				 Value)
values
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS',     		'ModifierId',		'MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS1'),
	('MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS',      				'ModifierId',		'MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS1'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS', 			'ModifierId', 		'MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS1'),
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS1',			'Amount',	     	10),
	('MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS1',						'Amount',	     	10),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS1',			'Amount',	     	10);

-- vilnius
insert or replace into TraitModifiers
	(TraitType,						    	ModifierId)values
	('MINOR_CIV_VILNIUS_TRAIT', 	     'MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0'  );
insert or replace into Modifiers	
	(ModifierId,												ModifierType,										Permanent,	SubjectRequirementSetId)
values
	('MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					0,					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_VILNIUS_ALLIANCE_LEVEL_0',						'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',		0,					'DISTRICT_IS_THEATER');	
insert or replace into ModifierArguments
	(ModifierId,												Name,						Value)
values
	('MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0',		'ModifierId',		'MINOR_CIV_VILNIUS_ALLIANCE_LEVEL_0'),
	('MINOR_CIV_VILNIUS_ALLIANCE_LEVEL_0',						'YieldType',		'YIELD_CULTURE'),	
	('MINOR_CIV_VILNIUS_ALLIANCE_LEVEL_0',						'Amount',			50);