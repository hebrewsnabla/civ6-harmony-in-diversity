-------------------------------------
--     Civilization Adjustment     --
-------------------------------------
------------------------------------------------------------------------------------------------------------------------

-- 秦始皇
-- update TraitModifiers set TraitType = 'TRAIT_CIVILIZATION_DYNASTIC_CYCLE' where ModifierId = 'TRAIT_CANAL_UNLOCK_MASONRY';
delete from TraitModifiers where TraitType = 'FIRST_EMPEROR_TRAIT' and ModifierId = 'TRAIT_CANAL_UNLOCK_MASONRY';

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_DYNASTIC_CYCLE',	'TRAIT_CANAL_UNLOCK_MASONRY'),
	('FIRST_EMPEROR_TRAIT',					'TRAIT_ADJUST_BUILDER_MOVEMENT_HD');

insert or replace into Modifiers
	(ModifierId,							ModifierType,								SubjectRequirementSetId)
values
	('TRAIT_ADJUST_BUILDER_MOVEMENT_HD',	'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',	'UNIT_IS_BUILDER');

insert or replace into ModifierArguments
	(ModifierId,							Name,		Value)
values
	('TRAIT_ADJUST_BUILDER_MOVEMENT_HD',    'Amount',	1);

-- Eleanor 
update ModifierArguments set Value = 2 where ModifierId = 'IDENTITY_NEARBY_GREATWORKS' and Name = 'Amount';
--additonal theater project
insert or replace into Types
	(Type,								Kind)
values
	('PROJECT_CIRCUSES_AND_BREAD',		'KIND_PROJECT');

insert or replace into Projects 
	(ProjectType,					Name,										ShortName,										Description,	
	Cost,	CostProgressionModel,				CostProgressionParam1,	PrereqDistrict,	UnlocksFromEffect)
values 
	('PROJECT_CIRCUSES_AND_BREAD',	'LOC_PROJECT_CIRCUSES_AND_BREAD_HD_NAME',	'LOC_PROJECT_CIRCUSES_AND_BREAD_HD_SHORT_NAME',	'LOC_PROJECT_CIRCUSES_AND_BREAD_HD_DESCRIPTION',
	40,		'COST_PROGRESSION_GAME_PROGRESS',	1100,					'DISTRICT_THEATER',	1);

insert or replace into Projects_XP1
	(ProjectType,					IdentityPerCitizenChange,	UnlocksFromEffect)
values
	('PROJECT_CIRCUSES_AND_BREAD',	2,							1);

insert or replace into ProjectCompletionModifiers 
	(ProjectType,					ModifierId)
values
	('PROJECT_CIRCUSES_AND_BREAD',	'PROJECT_COMPLETION_LOYALTY');

insert or replace into TraitModifiers (TraitType,	ModifierId)
values
	('TRAIT_LEADER_ELEANOR_LOYALTY',	'ELEANOR_ALLOW_PROJECT'),
	('TRAIT_LEADER_ELEANOR_LOYALTY',	'DOUBLE_ARCHAEOLOGY_SLOTS'),
	('TRAIT_LEADER_ELEANOR_LOYALTY',	'DOUBLE_ART_SLOTS'),
	('TRAIT_LEADER_ELEANOR_LOYALTY',	'AUTO_THEME_AT_LEAST_6_SLOTS');
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'DOUBLE_ARCHAEOLOGY_SLOTS1'),
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'DOUBLE_ART_SLOTS1'),
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'TRAIT_SUPPORT_TWO_ARCHAEOLOGISTS'),
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'TRAIT_AUTO_THEME_ARCHAEOLOGY_MUSEUM'),
	--('TRAIT_LEADER_ELEANOR_LOYALTY',	'TRAIT_AUTO_THEME_ART_MUSEUM');

insert or replace into Modifiers
	(ModifierId,					ModifierType)
values
	('ELEANOR_ALLOW_PROJECT',		'MODIFIER_PLAYER_ALLOW_PROJECT_CATHERINE'),
	('DOUBLE_ARCHAEOLOGY_SLOTS',	'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS'),
	('DOUBLE_ART_SLOTS',			'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_GREAT_WORK_SLOTS'),
	--('DOUBLE_ARCHAEOLOGY_SLOTS1',	'MODIFIER_PLAYER_CAPTURED_CITY_ADJUST_EXTRA_GREAT_WORK_SLOTS'),
	--('DOUBLE_ART_SLOTS1',			'MODIFIER_PLAYER_CAPTURED_CITY_ADJUST_EXTRA_GREAT_WORK_SLOTS'),
	('AUTO_THEME_AT_LEAST_6_SLOTS',	'MODIFIER_PLAYER_ADJUST_AUTO_THEME_BUILDINGS_WITH_X_SLOTS');
	--('TRAIT_AUTO_THEME_ARCHAEOLOGY_MUSEUM',	'MODIFIER_PLAYER_ADJUST_AUTO_THEMED_BUILDING'),
	--('TRAIT_AUTO_THEME_ART_MUSEUM',	'MODIFIER_PLAYER_ADJUST_AUTO_THEMED_BUILDING');

insert or replace into ModifierArguments
	(ModifierId,								Name,				 	Value)
values
	('ELEANOR_ALLOW_PROJECT',     				'ProjectType',			'PROJECT_CIRCUSES_AND_BREAD'),
	--('TRAIT_DOUBLE_ARCHAEOLOGY_SLOTS_MODIFIER',	'ModifierId',			'DOUBLE_ARCHAEOLOGY_SLOTS'),
	--('TRAIT_DOUBLE_ART_SLOTS_MODIFIER',			'ModifierId',			'DOUBLE_ART_SLOTS'),
	('DOUBLE_ARCHAEOLOGY_SLOTS',				'BuildingType',			'BUILDING_MUSEUM_ARTIFACT'),
	('DOUBLE_ARCHAEOLOGY_SLOTS',				'GreatWorkSlotType',	'GREATWORKSLOT_ARTIFACT'),
	('DOUBLE_ARCHAEOLOGY_SLOTS',				'Amount',				3),
	('DOUBLE_ART_SLOTS',						'BuildingType',			'BUILDING_MUSEUM_ART'),
	('DOUBLE_ART_SLOTS',						'GreatWorkSlotType',	'GREATWORKSLOT_ART'),
	('DOUBLE_ART_SLOTS',						'Amount',				3),
	('AUTO_THEME_AT_LEAST_6_SLOTS',				'Amount',				6),
	('AUTO_THEME_AT_LEAST_6_SLOTS',				'IsWonder',				0);
	/*('DOUBLE_ARCHAEOLOGY_SLOTS1',				'BuildingType',			'BUILDING_MUSEUM_ARTIFACT'),
	('DOUBLE_ARCHAEOLOGY_SLOTS1',				'GreatWorkSlotType',	'GREATWORKSLOT_ARTIFACT'),
	('DOUBLE_ARCHAEOLOGY_SLOTS1',				'Amount',				3),
	('DOUBLE_ART_SLOTS1',						'BuildingType',			'BUILDING_MUSEUM_ART'),
	('DOUBLE_ART_SLOTS1',						'GreatWorkSlotType',	'GREATWORKSLOT_ART'),
	('DOUBLE_ART_SLOTS1',						'Amount',				3),
	('TRAIT_AUTO_THEME_ARCHAEOLOGY_MUSEUM',		'BuildingType',			'BUILDING_MUSEUM_ARTIFACT'),
	('TRAIT_AUTO_THEME_ART_MUSEUM',				'BuildingType',			'BUILDING_MUSEUM_ART');*/

-- Victoria
-- insert or replace into TraitModifiers (TraitType,	ModifierId)
-- values
-- 	('TRAIT_LEADER_PAX_BRITANNICA',		'TRAIT_FOREIGN_CONTINENT_MILITARY_ENGINEER');

-- insert or replace into Modifiers
-- 	(ModifierId,									ModifierType)
-- values
-- 	('TRAIT_FOREIGN_CONTINENT_MILITARY_ENGINEER',	'MODIFIER_PLAYER_ADJUST_SETTLE_FOREIGN_CONTINENT_UNIT_CLASS');

-- insert or replace into ModifierArguments
-- 	(ModifierId,									Name,				 		Value)
-- values
-- 	('TRAIT_FOREIGN_CONTINENT_MILITARY_ENGINEER',	'UnitPromotionClassType',	'PROMOTION_CLASS_SUPPORT');

-- England
delete from TraitModifiers where 
	TraitType = 'TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION' and ModifierId like 'TRAIT_POWERED_BUILDINGS_MORE_%';
delete from TraitModifiers where 
	TraitType = 'TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION' and ModifierId like 'TRAIT_ADJUST_MILITARY_ENGINEER_%';
delete from TraitModifiers where 
	TraitType = 'TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION' and ModifierId like 'TRAIT_ADJUST_%_STOCKPILE_CAP';

insert or replace into TraitModifiers (TraitType,		ModifierId)
values
	-- ('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',		'TRAIT_REVEAL_IRON'),
	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',		'TRAIT_IRON_PRODUCTION'),
	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',		'TRAIT_COAL_PRODUCTION'),
	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',		'TRAIT_INDUSTRIAL_ZONE_MORE_REGIONAL_PRODUCTION'),
	('TRAIT_CIVILIZATION_INDUSTRIAL_REVOLUTION',		'TRAIT_SHIPYARD_INDISTRIALIZATION');

insert or replace into Modifiers
	(ModifierId,										ModifierType)
values
	('TRAIT_REVEAL_IRON',								'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY'),
	('TRAIT_SHIPYARD_INDISTRIALIZATION',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER');

insert or replace into Modifiers
	(ModifierId,										ModifierType,												SubjectRequirementSetId)
values
	('TRAIT_IRON_PRODUCTION',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'HAS_IMPROVED_IRON'),
	('TRAIT_COAL_PRODUCTION',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',						'HAS_IMPROVED_COAL'),
	('TRAIT_INDUSTRIAL_ZONE_MORE_REGIONAL_PRODUCTION',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_YIELD',	'DISTRICT_IS_INDUSTRIAL_ZONE');

insert or replace into Modifiers
	(ModifierId,										ModifierType,									SubjectRequirementSetId,	RunOnce,	Permanent)
values
	('TRAIT_SHIPYARD_INDISTRIALIZATION_MODIFIER',		'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',	'BUILDING_IS_SHIPYARD',			1,		1);
-- REQUIRES_PLAYER_CAN_SEE_IRON
insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
values
	('TRAIT_REVEAL_IRON',								'ResourceType',	'RESOURCE_IRON'),
	('TRAIT_IRON_PRODUCTION',							'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_IRON_PRODUCTION',							'Amount',		1),
	('TRAIT_COAL_PRODUCTION',							'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_COAL_PRODUCTION',							'Amount',		1),
	('TRAIT_INDUSTRIAL_ZONE_MORE_REGIONAL_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_INDUSTRIAL_ZONE_MORE_REGIONAL_PRODUCTION',	'Amount',		4),
	('TRAIT_SHIPYARD_INDISTRIALIZATION',				'ModifierId',	'TRAIT_SHIPYARD_INDISTRIALIZATION_MODIFIER'),
	('TRAIT_SHIPYARD_INDISTRIALIZATION_MODIFIER',		'TechType',		'TECH_INDUSTRIALIZATION'),
	('TRAIT_SHIPYARD_INDISTRIALIZATION_MODIFIER',		'GrantTechIfBoosted',	1);

-- Arab
update ModifierArguments set Value = 4 where ModifierId = 'TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION' and Name = 'Amount';

-- Babylon
update ModifierArguments set Value = 61 where ModifierId = 'TRAIT_EUREKA_INCREASE';

-- Maori
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_MAORI_MANA' and ModifierId = 'TRAIT_MAORI_PREVENT_HARVEST';
-- insert or replace into Building_YieldChanges 
-- 	(BuildingType, 		YieldType,			YieldChange) 
-- values
-- 	('BUILDING_MARAE', 	'YIELD_CULTURE',	2);

insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE'),
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE'),
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_RAINFOREST_ENVIRONMENTALISM'),
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_WOODS_ENVIRONMENTALISM');

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) values
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_JUNGLE_CIVIL_SERVICE_REQUIREMENTS'),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_FOREST_CIVIL_SERVICE_REQUIREMENTS'),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_ENVIRONMENTALISM', 	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_JUNGLE_ENVIRONMENTALISM_REQUIREMENTS'),
	('TRAIT_MAORI_PRODUCTION_WOODS_ENVIRONMENTALISM', 		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_FOREST_ENVIRONMENTALISM_REQUIREMENTS');

insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 	'YieldType', 	'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 	'Amount', 		1),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 			'YieldType', 	'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 			'Amount',		1),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_ENVIRONMENTALISM', 	'YieldType', 	'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_ENVIRONMENTALISM', 	'Amount', 		1),
	('TRAIT_MAORI_PRODUCTION_WOODS_ENVIRONMENTALISM', 		'YieldType', 	'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_WOODS_ENVIRONMENTALISM', 		'Amount',		1);

update ModifierArguments set Value = 1 where
	ModifierId = 'TRAIT_MAORI_PRODUCTION_RAINFOREST_CONSERVATION' and Name = 'Amount';
update ModifierArguments set Value = 1 where
	ModifierId = 'TRAIT_MAORI_PRODUCTION_WOODS_CONSERVATION' and Name = 'Amount';

-------------------------------------------------------------------------------------------------
-- Kongo

-- Kongo all land units receive ability to move on forest and jungles without movement penalty
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_CIVILIZATION_NKISI', 'TRAIT_ALL_LAND_UNITS_IGNORE_WOODS');

insert or replace into Modifiers
	(ModifierId,			ModifierType)
values
	('TRAIT_ALL_LAND_UNITS_IGNORE_WOODS',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('TRAIT_ALL_LAND_UNITS_IGNORE_WOODS',	'AbilityType',	'ABILITY_KONGO_IGNORE_WOODS');

insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_CIVILIZATION_NKISI', 'TRAIT_DOUBLE_WRITER_POINTS');
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_WRITER_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_ARTIST_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_MUSICIAN_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_MERCHANT_POINTS' and Name = 'Amount';

------------------------------------------------------------------------------------------------------------------
-- Mali
insert or replace into TraitModifiers 
	(TraitType, 							ModifierId) 
values
	('TRAIT_CIVILIZATION_UNIT_MALI_MANDEKALU_CAVALRY',	'MALI_MANDEKALU_CAVALRY_DISCOUNT'),
	-- ('TRAIT_LEADER_SAHEL_MERCHANTS', 		'DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN'),
	-- ('TRAIT_LEADER_SAHEL_MERCHANTS', 		'DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN'),
	('TRAIT_LEADER_SAHEL_MERCHANTS', 		'INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN'),
	-- ('TRAIT_CIVILIZATION_MALI_GOLD_DESERT',	'TRAIT_BONUS_MINE_GOLD'),
	('TRAIT_CIVILIZATION_MALI_GOLD_DESERT',	'HD_LUXURY_MINE_GOLD');
	-- ('TRAIT_LEADER_SAHEL_MERCHANTS',		'MALI_ALLOW_PROJECT');

insert or replace into Modifiers 
	(ModifierId, 											ModifierType) 
values
	('MALI_MANDEKALU_CAVALRY_DISCOUNT',						'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN', 			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_DOMESTIC'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN', 		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_DOMESTIC'),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN', 	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_INTERNATIONAL');
	-- ('MALI_ALLOW_PROJECT',									'MODIFIER_PLAYER_ALLOW_PROJECT_CATHERINE');

insert or replace into Modifiers 
	(ModifierId, 				ModifierType,							SubjectRequirementSetId) 
values
	('HD_LUXURY_MINE_GOLD',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_LUXURY_MINE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	('MALI_MANDEKALU_CAVALRY_DISCOUNT',						'UnitType',		'UNIT_MALI_MANDEKALU_CAVALRY'),
	('MALI_MANDEKALU_CAVALRY_DISCOUNT',						'Amount',		20),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',				'YieldType',	'YIELD_GOLD'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',				'TerrainType',	'TERRAIN_DESERT'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',				'Origin',		1),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',				'Amount',		1),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',		'YieldType',	'YIELD_GOLD'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',		'TerrainType',	'TERRAIN_DESERT_HILLS'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',		'Origin',		1),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',		'Amount',		1),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',	'YieldType',	'YIELD_GOLD'),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',	'TerrainType',	'TERRAIN_DESERT_HILLS'),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',	'Origin',		1),
	('INTERNATIONAL_TRADE_ROUTE_GOLD_DESERT_HILLS_ORIGIN',	'Amount',		1),
	('HD_LUXURY_MINE_GOLD',									'YieldType',	'YIELD_GOLD'),
	('HD_LUXURY_MINE_GOLD',									'Amount',		2);
	-- ('MALI_ALLOW_PROJECT',     								'ProjectType',	'PROJECT_ENDLESS_MONEY');
--每个奢侈矿为本城国际商路+1食物。
-- insert or replace into ImprovementModifiers
-- 	(ImprovementType,						ModifierID)
-- values
-- 	('IMPROVEMENT_MINE',					'MALI_DESERT_HILLS_INTERNATIONAL_TRADE_ROUTE_FOOD');

-- insert or replace into Modifiers
-- 	(ModifierId,											ModifierType,															OwnerRequirementSetId,					SubjectRequirementSetId)
-- values
-- 	('MALI_DESERT_HILLS_INTERNATIONAL_TRADE_ROUTE_FOOD',	'MODIFIER_CITY_OWNER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',		'PLOT_HAS_LUXURY_MINE_REQUIREMENTS',	'MALI_REQUIREMENTS');

-- insert or replace into ModifierArguments
-- 	(ModifierId,											Name,			Value)
-- values
-- 	('MALI_DESERT_HILLS_INTERNATIONAL_TRADE_ROUTE_FOOD',	'YieldType',	'YIELD_FOOD'),
-- 	('MALI_DESERT_HILLS_INTERNATIONAL_TRADE_ROUTE_FOOD',	'Amount',		1);

-- insert or replace into RequirementSets
-- 	(RequirementSetId,						RequirementSetType)
-- values
-- 	('MALI_REQUIREMENTS',					'REQUIREMENTSET_TEST_ALL'),
-- 	('MALI_DESERT_HILLS_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL');

-- insert or replace into RequirementSetRequirements
-- 	(RequirementSetId,						RequirementId)
-- values
-- 	('MALI_REQUIREMENTS',					'PLAYER_IS_CIVILIZATION_MALI'),
-- 	('MALI_DESERT_HILLS_REQUIREMENTS',		'REQUIRES_PLOT_HAS_DESERT_HILLS');

-- insert or replace into TraitModifiers (TraitType, ModifierId) 
-- select 'TRAIT_CIVILIZATION_MALI_GOLD_DESERT', 'BONUS_LUXURY_GOLD_PERCENTAGE' || ResourceType from Improvement_ValidResources 
-- where ImprovementType = 'IMPROVEMENT_MINE' and ResourceType not in (select ResourceType from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC' or ResourceClassType = 'RESOURCECLASS_BONUS');

-- insert or replace into Modifiers (ModifierId,  		ModifierType,											SubjectRequirementSetId)
-- select 'BONUS_LUXURY_GOLD_PERCENTAGE' || ResourceType,	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'HD_CITY_HAS_IMPROVED_' || ResourceType || '_REQUIRMENTS' from Improvement_ValidResources 
-- where ImprovementType = 'IMPROVEMENT_MINE' and ResourceType not in (select ResourceType from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC' or ResourceClassType = 'RESOURCECLASS_BONUS');

-- insert or replace into ModifierArguments	(ModifierId,	Name,			Value)
-- select 'BONUS_LUXURY_GOLD_PERCENTAGE' || ResourceType,		'YieldType',    'YIELD_GOLD' from Improvement_ValidResources 
-- where ImprovementType = 'IMPROVEMENT_MINE' and ResourceType not in (select ResourceType from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC' or ResourceClassType = 'RESOURCECLASS_BONUS');

-- insert or replace into ModifierArguments	(ModifierId,	Name,			Value)
-- select 'BONUS_LUXURY_GOLD_PERCENTAGE' || ResourceType,		'Amount',       10	from Improvement_ValidResources 
-- where ImprovementType = 'IMPROVEMENT_MINE' and ResourceType not in (select ResourceType from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC' or ResourceClassType = 'RESOURCECLASS_BONUS');

-- ud
-- update Districts set Entertainment = 1 where DistrictType = 'DISTRICT_SUGUBA';
insert or replace into DistrictModifiers(DistrictType,ModifierId)values
	('DISTRICT_SUGUBA','SUGUBA_ALLOW_PURCHASE_DISTRICT');
insert or replace into Modifiers(ModifierID,ModifierType)values
	('SUGUBA_ALLOW_PURCHASE_DISTRICT','MODIFIER_CITY_ADJUST_CAN_PURCHASE_DISTRICTS');
insert or replace into ModifierArguments(ModifierID, Name, Value)values
	('SUGUBA_ALLOW_PURCHASE_DISTRICT','CanPurchase',1);

--additonal SUGUBA project
-- insert or replace into Types
-- 	(Type,								Kind)
-- values
-- 	('PROJECT_ENDLESS_MONEY',			'KIND_PROJECT');

-- insert or replace into Projects 
-- 	(ProjectType,				Name,										ShortName,								Description,	
-- 	Cost,	CostProgressionModel,				CostProgressionParam1,	PrereqDistrict,	UnlocksFromEffect)
-- values 
-- 	('PROJECT_ENDLESS_MONEY',	'LOC_PROJECT_ENDLESS_MONEY_HD_NAME',	'LOC_PROJECT_ENDLESS_MONEY_HD_SHORT_NAME',	'LOC_PROJECT_ENDLESS_MONEY_HD_DESCRIPTION',
-- 	40,		'COST_PROGRESSION_GAME_PROGRESS',	1100,					'DISTRICT_SUGUBA',	1);

-- insert or replace into Project_YieldConversions
-- 	(ProjectType,				YieldType,		PercentOfProductionRate)
-- values 
-- 	('PROJECT_ENDLESS_MONEY',	'YIELD_GOLD',	250);
------------------------------------------------------------------------------------------------------------------
-- Rome
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAJANS_COLUMN_TRAIT', 'TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION');
insert or replace into Modifiers (ModifierId, ModifierType) values
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 'DistrictType', 'DISTRICT_CITY_CENTER'),
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 'Amount', 50);
---------------------------------------------------------------------------------------------------------------------------
-- Ethiopia
-- update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_FAITH_INTO_SCIENCE_HILLS' and Name = 'Amount';
-- update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_FAITH_INTO_CULTURE_HILLS' and Name = 'Amount';

--------------------------------------------------------------------------------------------------------------------
--Egypt
--学院剧院相邻河边大加成
--建造完奇观以后送工人
--UI为相邻泛滥田+1粮
--la商路翻倍

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_ITERU',			'TRAIT_CAMPUS_RIVER_ADJACENCY'),
	('TRAIT_CIVILIZATION_ITERU',			'TRAIT_THEATER_DISTRICT_RIVER_ADJACENCY'),
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

---------------------------------------------------------------------------------------------------------------------------
-- Gaul can now build all districts near City Center
delete from TraitModifiers where ModifierId ='TRAIT_CIVILIZATION_GAUL_CITY_NO_ADJACENT_DISTRICT';

-----------------------------------------------------------------------------------------------------------------------------
-- Hungary
update ModifierArguments set value = 50 where ModifierId ='LEVY_UNITUPGRADEDISCOUNT' and Name = 'Amount';

-------------------------------------------------------------------------------------------------------------------------------
--Mapuche
--木人现在可以在魅力迷人及以上的地块建造，且生成相当于魅力值100%的文化产出。
update Improvements set MinimumAppeal = 2 where ImprovementType = 'IMPROVEMENT_CHEMAMULL';
update Improvements set YieldFromAppealPercent = 100 where ImprovementType = 'IMPROVEMENT_CHEMAMULL';
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierId)
values
	('IMPROVEMENT_PASTURE',		'PASTURE_HOUSING_WITH_MAPUCHE_TRAIT');

insert or replace into Modifiers
	(ModifierId,								ModifierType,											SubjectRequirementSetId)
values
	('PASTURE_HOUSING_WITH_MAPUCHE_TRAIT',		'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_HOUSING',		'PLAYER_IS_MAPUCHE');

insert or replace into ModifierArguments
	(ModifierId,								Name,		Value)
values
	('PASTURE_HOUSING_WITH_MAPUCHE_TRAIT',		'Amount',	1);

insert or replace into RequirementSetRequirements 
	(RequirementSetId,			RequirementId)	
values
	('PLAYER_IS_MAPUCHE',		'PLAYER_IS_CIVILIZATION_MAPUCHE');

insert or replace into RequirementSets (RequirementSetId,	RequirementSetType)	
values
	('PLAYER_IS_MAPUCHE',		'REQUIREMENTSET_TEST_ALL');

insert or replace into Improvement_ValidFeatures (ImprovementType, FeatureType) values
	('IMPROVEMENT_CHEMAMULL', 'FEATURE_FOREST');
--------------------------------------------------------------------------------------------------------------------------
-- Georgia
-- Resume ability (April Update)
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_LEADER_RELIGION_CITY_STATES',	'TRAIT_PROTECTORATE_WAR_FAITH');
-- delete from TraitModifiers where TraitType = 'TRAIT_LEADER_RELIGION_CITY_STATES' and ModifierId = 'TRAIT_LEADER_FAITH_KILLS';
update ModifierArguments set Value = 100 where ModifierId = 'TRAIT_LEADER_FAITH_KILLS' and Name = 'PercentDefeatedStrength';

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

-- LA : each level of walls +1 culture and +1 faith
insert or replace into TraitModifiers	(TraitType,	ModifierId)
select 'TRAIT_LEADER_RELIGION_CITY_STATES',	BuildingType || '_TAMAR_CULTURE' from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into TraitModifiers	(TraitType,	ModifierId)
select 'TRAIT_LEADER_RELIGION_CITY_STATES',	BuildingType || '_TAMAR_FAITH' from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select BuildingType || '_TAMAR_CULTURE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'CITY_HAS_' || BuildingType || '_REQUIREMENTS' from Buildings
where  BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select BuildingType || '_TAMAR_FAITH',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'CITY_HAS_' || BuildingType || '_REQUIREMENTS' from Buildings
where  BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
-- insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
-- select BuildingType || '_TAMAR_CULTURE',	'BuildingType',	BuildingType	from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select BuildingType || '_TAMAR_CULTURE',	'YieldType',	'YIELD_CULTURE'	from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select BuildingType || '_TAMAR_CULTURE',	'Amount',    	1				from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
-- insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
-- select BuildingType || '_TAMAR_FAITH',		'BuildingType',	BuildingType	from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select BuildingType || '_TAMAR_FAITH',		'YieldType',	'YIELD_FAITH'	from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select BuildingType || '_TAMAR_FAITH',		'Amount',    	1				from Buildings	where BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;

insert or replace into RequirementSets	(RequirementSetId,	RequirementSetType)
select 'CITY_HAS_' || BuildingType || '_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL' from Buildings
where  BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;

insert or replace into RequirementSetRequirements	(RequirementSetId,	RequirementId)
select 'CITY_HAS_' || BuildingType || '_REQUIREMENTS', 'REQUIRES_CITY_HAS_' || BuildingType from Buildings
where  BuildingType != 'BUILDING_STAR_FORT' and OuterDefenseHitPoints is not NULL;

-- UA 
update ModifierArguments set Value = 100 where Name = 'Amount' and (ModifierId = 'TRAIT_WALLS_PRODUCTION' or ModifierId = 'TRAIT_CASTLE_PRODUCTION' or ModifierId = 'TRAIT_TSIKHE_PRODUCTION' or ModifierId = 'TRAIT_STAR_FORT_PRODUCTION');

insert or replace into TraitModifiers
	(TraitType,									ModifierId)
select
	'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS',	'TRAIT_GOLDEN_AGE_WILDCARD_SLOT'
where exists (select TraitType from Traits where TraitType = 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS');

insert or replace into TraitModifiers
	(TraitType,									ModifierId)
select
	'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS',	'TRAIT_GOLDEN_AGE_UNLOCK_DARK_POLICIES'
where exists (select TraitType from Traits where TraitType = 'TRAIT_CIVILIZATION_GOLDEN_AGE_QUESTS');

insert or ignore into Modifiers
    (ModifierId,                            	ModifierType,												Permanent,	SubjectRequirementSetId,	SubjectStackLimit)
values
    ('TRAIT_GOLDEN_AGE_WILDCARD_SLOT',			'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',	1,			'PLAYER_HAS_GOLDEN_AGE',	1),
	('TRAIT_GOLDEN_AGE_UNLOCK_DARK_POLICIES',	'MODIFIER_PLAYER_ADJUST_PROPERTY',							0,			'PLAYER_HAS_GOLDEN_AGE',	NULL);

insert or ignore into ModifierArguments
    (ModifierId,                            	Name,          			 Value)
values
    ('TRAIT_GOLDEN_AGE_WILDCARD_SLOT',			'GovernmentSlotType',	'SLOT_WILDCARD'),
	('TRAIT_GOLDEN_AGE_UNLOCK_DARK_POLICIES',	'Key',					'CanSlotDarkPolicies'),
	('TRAIT_GOLDEN_AGE_UNLOCK_DARK_POLICIES',	'Amount',				1);
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

insert or replace into Improvement_ValidResources
	(ImprovementType,				ResourceType)
values
	('IMPROVEMENT_TERRACE_FARM',	'RESOURCE_SHEEP');

-- 1 housing (2 & 2 in official update)
update Improvements set Housing = 1, TilesRequired = 1 where ImprovementType = 'IMPROVEMENT_TERRACE_FARM';

insert or replace into Adjacency_YieldChanges
	(ID,	Description,	YieldChange,	YieldType,	AdjacentTerrain,	PrereqTech)
values
	('Terrace_GrassMountainAdjacency_later',	'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_GRASS_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_PlainsMountainAdjacency_later',	'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_PLAINS_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_DesertMountainAdjacency_later',	'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_DESERT_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_TundraMountainAdjacency_later',	'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_TUNDRA_MOUNTAIN',	'TECH_ENGINEERING'),
	('Terrace_SnowMountainAdjacency_later',		'Placeholder',		2,	'YIELD_FOOD',	'TERRAIN_SNOW_MOUNTAIN',	'TECH_ENGINEERING');

update ModifierArguments set Value = 3 where ModifierId = 'TRAIT_PRODUCTION_MOUNTAIN' and Name = 'Amount';
delete from TraitModifiers where ModifierId = 'TRAIT_PRODUCTION_MOUNTAIN_LATE';

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

-----------------------------------------------------------------------------------------------------------------
-- Russia, Resume the ability
-- TRAIT_CIVILIZATION_DISTRICT_LAVRA
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_DISTRICT_LAVRA' and ModifierId = 'TRAIT_SHRINE_WRITING_POINTS';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_DISTRICT_LAVRA' and ModifierId = 'TRAIT_TEMPLE_ARTIST_POINTS';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_DISTRICT_LAVRA' and ModifierId = 'TRAIT_TIER3_MUSICIAN_POINTS';

-- Doubles because all GP doulbes.
insert or replace into District_GreatPersonPoints
	(DistrictType,		GreatPersonClassType,			PointsPerTurn)
values
	('DISTRICT_LAVRA',	'GREAT_PERSON_CLASS_WRITER',	2),
	('DISTRICT_LAVRA',	'GREAT_PERSON_CLASS_ARTIST',	2),
	('DISTRICT_LAVRA',	'GREAT_PERSON_CLASS_MUSICIAN',	2);

update ModifierArguments set Value = 8 where ModifierId = 'TRAIT_INCREASED_TILES' and Name = 'Amount';

--NEW UA AND LA
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_GRAND_EMBASSY' and ModifierId = 'TRAIT_ADJUST_PROGRESS_DIFF_TRADE_BONUS';

insert or replace into TraitModifiers
	(TraitType,							ModifierId)
values
	('TRAIT_LEADER_GRAND_EMBASSY',		'TRAIT_GREAT_PERSON_DISCOUNT'),
	-- ('TRAIT_LEADER_GRAND_EMBASSY',		'TRAIT_CAN_PURCHASE_HOLYSITE_BUILDING'),
	('TRAIT_LEADER_GRAND_EMBASSY',		'TRAIT_CAN_PURCHASE_INDUSTRIAL_BUILDING'),
	('TRAIT_CIVILIZATION_MOTHER_RUSSIA','TRAIT_TUNDRA_DISTRICT_FOOD');

insert or replace into Modifiers
	(ModifierId,								ModifierType,														SubjectRequirementSetId)
values
	('TRAIT_GREAT_PERSON_DISCOUNT',				'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_PATRONAGE_DISCOUNT_PERCENT',	NULL),
	('TRAIT_CAN_PURCHASE_HOLYSITE_BUILDING',	'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE',			NULL),
	('TRAIT_CAN_PURCHASE_INDUSTRIAL_BUILDING',	'MODIFIER_PLAYER_CITIES_ENABLE_BUILDING_FAITH_PURCHASE',			NULL),
	('TRAIT_TUNDRA_DISTRICT_FOOD',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',					'DISTRICTS_ON_TUNDRA_OR_TUNDRA_HILL_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,								Name,				Value)
values
	('TRAIT_GREAT_PERSON_DISCOUNT',				'YieldType',		'YIELD_FAITH'),
	('TRAIT_GREAT_PERSON_DISCOUNT',				'Amount',			8),
	('TRAIT_CAN_PURCHASE_HOLYSITE_BUILDING',	'DistrictType',		'DISTRICT_HOLY_SITE'),
	('TRAIT_CAN_PURCHASE_INDUSTRIAL_BUILDING',	'DistrictType',		'DISTRICT_INDUSTRIAL_ZONE'),
	('TRAIT_TUNDRA_DISTRICT_FOOD',				'YieldType',		'YIELD_FOOD'),
	('TRAIT_TUNDRA_DISTRICT_FOOD',				'Amount',			1);

insert or replace into RequirementArguments (RequirementId,		Name,		Value) values
	('REQUIRES_TUNDRA_OR_TUNDRA_HILL',					'RequirementSetId',	'PLOT_HAS_TUNDRA_OR_TUNDRA_HILL_REQUIREMENTS');
	-- ('REQUIRES_DISTRICTS_NOT_CITY_CENTER_NOT_WONDERS',	'RequirementSetId',	'HD_DISTRICTS_IS_NOT_WONDERS_REQUIREMENTS');

insert or replace into Requirements (RequirementId,		RequirementType) values
	('REQUIRES_TUNDRA_OR_TUNDRA_HILL',					'REQUIREMENT_REQUIREMENTSET_IS_MET');
	-- ('REQUIRES_DISTRICTS_NOT_CITY_CENTER_NOT_WONDERS',	'REQUIREMENT_REQUIREMENTSET_IS_MET');

insert or replace into RequirementSets (RequirementSetId,		RequirementSetType) values
	('DISTRICTS_ON_TUNDRA_OR_TUNDRA_HILL_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');
	-- ('HD_DISTRICTS_IS_NOT_WONDERS_REQUIREMENTS',    			'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	('DISTRICTS_ON_TUNDRA_OR_TUNDRA_HILL_REQUIREMENTS',			'REQUIRES_TUNDRA_OR_TUNDRA_HILL'),
	('DISTRICTS_ON_TUNDRA_OR_TUNDRA_HILL_REQUIREMENTS',			'HD_REQUIRES_DISTRICT_IS_NOT_DISTRICT_WONDER');
	-- ('HD_DISTRICTS_IS_NOT_WONDERS_REQUIREMENTS',				'HD_REQUIRES_DISTRICT_IS_NOT_DISTRICT_WONDER');

-- insert or replace into RequirementSetRequirements   (RequirementSetId,   RequirementId)
-- select 'HD_DISTRICTS_NOT_CITY_CENTER_NOT_WONDERS',  'REQUIRES_DISTRICT_IS_' || DistrictType from Districts where DistrictType != 'DISTRICT_WONDER';
-----------------------------------------------------------------------------------------------------------------

-- Brazil 
-- lumber mill +1 adjacency bonus to IZ
-- IZ +1 production to adjacent rainforest
-- + 2 culture if lumber mill is built on rainforest +100% tourism = culture if flight is researched
-- districts do not remove rainforest
-- + 1 faith in each rainforest tiles after recruit a great person
-- + 1 faith if city is near rainforest999

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

insert or replace into Modifiers    (ModifierId, ModifierType)
    select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'DistrictType', DistrictType
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'FeatureType', 'FEATURE_JUNGLE'
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

insert or replace into RequirementSets
	(RequirementSetId,										RequirementSetType)
values
	('CITY_ADJACENT_TO_JUNGLE_REQUIREMENTS',				'REQUIREMENTSET_TEST_ALL'),
	('PLOT_ADJACENT_TO_IZ_AND_RAINFOREST_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL'),
	('PLOT_HAS_LUMBER_MILL_AND_RAINFOREST_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,										RequirementId)
values
	('CITY_ADJACENT_TO_JUNGLE_REQUIREMENTS',				'REQUIRES_PLOT_ADJACENT_TO_JUNGLE'),
	('PLOT_ADJACENT_TO_IZ_AND_RAINFOREST_REQUIREMENTS',		'REQUIRES_PLOT_HAS_JUNGLE'),
	('PLOT_ADJACENT_TO_IZ_AND_RAINFOREST_REQUIREMENTS',		'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_INDUSTRIAL_ZONE'),
	('PLOT_HAS_LUMBER_MILL_AND_RAINFOREST_REQUIREMENTS',	'REQUIRES_PLOT_HAS_LUMBER_MILL'),
	('PLOT_HAS_LUMBER_MILL_AND_RAINFOREST_REQUIREMENTS',	'REQUIRES_PLOT_HAS_JUNGLE');

--------------------------------------------------------------------------------------------------------------------------
--Scotland
--Happy city recives an additional 10% science and 10% production.
update ModifierArguments set Value = 8 where ModifierId = 'TRAIT_SCIENCE_HAPPY'and Name = 'Amount';
update ModifierArguments set Value = 8 where ModifierId = 'TRAIT_PRODUCTION_HAPPY'and Name = 'Amount';
update ModifierArguments set Value = 24 where ModifierId = 'TRAIT_SCIENCE_ECSTATIC' and Name = 'Amount';
update ModifierArguments set Value = 24 where ModifierId = 'TRAIT_PRODUCTION_ECSTATIC' and Name = 'Amount';

update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_SCIENTIST_HAPPY' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'TRAIT_SCIENTIST_ECSTATIC' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_ENGINEER_HAPPY' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'TRAIT_ENGINEER_ECSTATIC' and Name = 'Amount';

-- untested
insert or replace into TraitModifiers
	(TraitType,											ModifierId)
values
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_SCIENCE_JOYFUL'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_PRODUCTION_JOYFUL'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_SCIENTIST_JOYFUL'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_ENGINEER_JOYFUL'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_LIBRARY_SCIENTIST_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_UNIVERSITY_SCIENTIST_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_RESEARCHLAB_SCIENTIST_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_WORKSHOP_ENGINEER_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_FACTORY_ENGINEER_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_COALPLANT_ENGINEER_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_OILPLANT_ENGINEER_POINT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_NUCLEARPLANT_ENGINEER_POINT'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_CAMPUS_AMENITY'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_INDUSTRIAL_ZONE_AMENIYT'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_FACTORY_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_COALPLANT_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_OILPLANT_SCIENTIST_POINT_ECSTATIC'),
-- 	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_NUCLEARPLANT_SCIENTIST_POINT_ECSTATIC'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_ADJACENT_DISTRICTS_CAMPUS_ADJACENCYSCIENCE'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'TRAIT_ADJACENT_DISTRICTS_INDUSTRIALZONE_ADJACENCYPRODUCTION'),
	('TRAIT_LEADER_BANNOCKBURN',						'SCOTLAND_TERRITORY_COMBAT');

insert or replace into Modifiers
	(ModifierId,												ModifierType,													SubjectRequirementSetId)
values
	('TRAIT_SCIENCE_JOYFUL',									'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD',				NULL),
	('TRAIT_PRODUCTION_JOYFUL',									'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD',				NULL),
	('TRAIT_SCIENTIST_JOYFUL',									'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_CAMPUS_HAPPY_REQUIREMENTS'),
	('TRAIT_ENGINEER_JOYFUL',									'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_INDUSTRIAL_ZONE_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT',							'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_LIBRARY_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT',						'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_UNIVERSITY_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT',						'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_RESEARCHLAB_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT',							'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_WORKSHOP_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT',							'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_FACTORY_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_COALPLANT_ENGINEER_POINT',							'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_PLANT_HAPPY_REQUIREMENTS'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC',					'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_LIBRARY_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC',				'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_UNIVERSITY_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC',				'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_RESEARCHLAB_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC',					'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_WORKSHOP_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT_ECSTATIC',					'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_FACTORY_ECSTATIC_REQUIREMENTS'),
-- 	('TRAIT_COALPLANT_ENGINEER_POINT_ECSTATIC',					'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_GREAT_PERSON',			'PLAYER_HAS_PLANT_ECSTATIC_REQUIREMENTS'),
	('TRAIT_CAMPUS_AMENITY',									'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',					'HD_CITY_HAS_CAMPUS_REQUIREMENTS'),
	('TRAIT_INDUSTRIAL_ZONE_AMENIYT',							'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',					'HD_CITY_HAS_INDUSTRIAL_ZONE_REQUIREMENTS'),
	('SCOTLAND_TERRITORY_COMBAT',								'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',							NULL),
	('SCOTLAND_FRIENDLY_COMBAT',								'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',							'HD_UNIT_IN_FRIENDLY_TERRITORY_DEFENCE_REQUIREMENTS');

insert or replace into ExcludedAdjacencies (TraitType,	YieldChangeId)values
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'District_Science'),
	('TRAIT_CIVILIZATION_SCOTTISH_ENLIGHTENMENT',		'District_Production');

insert or replace into ModifierArguments
	(ModifierId,									Name,							Value)
values
	('TRAIT_SCIENCE_JOYFUL',						'YieldType',					'YIELD_SCIENCE'),
	('TRAIT_SCIENCE_JOYFUL',						'HappinessType',				'HAPPINESS_JOYFUL'),
	('TRAIT_SCIENCE_JOYFUL',						'Amount',						16),
	('TRAIT_PRODUCTION_JOYFUL',						'YieldType',					'YIELD_PRODUCTION'),
	('TRAIT_PRODUCTION_JOYFUL',						'HappinessType',				'HAPPINESS_JOYFUL'),
	('TRAIT_PRODUCTION_JOYFUL',						'Amount',						16),
	('TRAIT_SCIENTIST_JOYFUL',						'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
	('TRAIT_SCIENTIST_JOYFUL',						'HappinessType',				'HAPPINESS_JOYFUL'),
	('TRAIT_SCIENTIST_JOYFUL',						'Amount',						4),
	('TRAIT_ENGINEER_JOYFUL',						'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
	('TRAIT_ENGINEER_JOYFUL',						'HappinessType',				'HAPPINESS_JOYFUL'),
	('TRAIT_ENGINEER_JOYFUL',						'Amount',						4),
	-- 
	('TRAIT_CAMPUS_AMENITY',						'Amount',						1),
	('TRAIT_INDUSTRIAL_ZONE_AMENIYT',				'Amount',						1),
	('SCOTLAND_TERRITORY_COMBAT',					'AbilityType',					'ABILITY_TERRITORY_COMBAT'),
	('SCOTLAND_FRIENDLY_COMBAT',					'Amount',						4);

insert or replace into ModifierStrings
	(ModifierId,									Context,	Text)
values
	('SCOTLAND_FRIENDLY_COMBAT',					'Preview',	'+{1_Amount} {LOC_TRAIT_LEADER_BANNOCKBURN_NAME}');

-- 	('TRAIT_LIBRARY_SCIENTIST_POINT',				'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT',				'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT',				'Amount',						2),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT',			'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT',			'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT',			'Amount',						2),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT',			'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT',			'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT',			'Amount',						2),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT',				'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT',				'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT',				'Amount',						2),
-- 	('TRAIT_FACTORY_ENGINEER_POINT'					'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT'					'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT'					'Amount',						2),
-- 	('TRAIT_PLANT_ENGINEER_POINT',					'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_PLANT_ENGINEER_POINT',					'HappinessType',				'HAPPINESS_HAPPY'),
-- 	('TRAIT_PLANT_ENGINEER_POINT',					'Amount',						2),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC',		'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC',		'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_LIBRARY_SCIENTIST_POINT_ECSTATIC',		'Amount',						4),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC',	'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC',	'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_UNIVERSITY_SCIENTIST_POINT_ECSTATIC',	'Amount',						4),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC',	'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC',	'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_RESEARCHLAB_SCIENTIST_POINT_ECSTATIC',	'Amount',						4),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC',		'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC',		'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_WORKSHOP_ENGINEER_POINT_ECSTATIC',		'Amount',						4),
-- 	('TRAIT_FACTORY_ENGINEER_POINT_ECSTATIC'		'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT_ECSTATIC'		'HappinessType',				'HAPPINESS_ECSTATIC'),
-- 	('TRAIT_FACTORY_ENGINEER_POINT_ECSTATIC'		'Amount',						4),
-- 	('TRAIT_PLANT_ENGINEER_POINT_ECSTATIC',			'GreatPersonClassType',			'GREAT_PERSON_CLASS_ENGINEER'),
-- 	('TRAIT_PLANT_ENGINEER_POINT_ECSTATIC',			'HappinessType',				'HAPPINESS_ECSTATIC');

insert or ignore into Requirements
	(RequirementId,							RequirementType)
values
	('UNIT_IN_OWNER_TERRITORY_REQUIREMENT',	'REQUIREMENT_UNIT_IN_OWNER_TERRITORY');

insert or replace into RequirementSets
	(RequirementSetId,										RequirementSetType)
values
	('HD_UNIT_IN_FRIENDLY_TERRITORY_DEFENCE_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,										RequirementId)
values
	('HD_UNIT_IN_FRIENDLY_TERRITORY_DEFENCE_REQUIREMENTS',	'PLAYER_IS_DEFENDER_REQUIREMENTS'),
	('HD_UNIT_IN_FRIENDLY_TERRITORY_DEFENCE_REQUIREMENTS',	'UNIT_IN_OWNER_TERRITORY_REQUIREMENT');

-- ui
update Improvements set PrereqCivic = 'CIVIC_GUILDS', Housing = 1 where ImprovementType = 'IMPROVEMENT_GOLF_COURSE'; --CIVIC_GAMES_RECREATION
insert or replace into Improvement_Adjacencies (ImprovementType, YieldChangeId) values
	('IMPROVEMENT_GOLF_COURSE',		'Golf_District_Culture');

---------------------------------------------------------------------------------------------------------------------
--SCYTHIA
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY','TRAIT_YIELD_MORE_HORSE'),
	('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY','TRAIT_TECH_ANIMAL_HUSBANDRY'),
	('TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY','TRAIT_PASTURE_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,						ModifierType,															SubjectRequirementSetId)
values
	('TRAIT_YIELD_MORE_HORSE',			'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_ACCUMULATION_SPECIFIC_RESOURCE',	NULL),
	('TRAIT_TECH_ANIMAL_HUSBANDRY',		'MODIFIER_PLAYER_GRANT_SPECIFIC_TECHNOLOGY',							NULL),
	('TRAIT_PASTURE_PRODUCTION',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',									'PLOT_HAS_PASTURE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
values
	('TRAIT_YIELD_MORE_HORSE',		'ResourceType',	'RESOURCE_HORSES'),
	('TRAIT_YIELD_MORE_HORSE',		'Amount',		3),
	('TRAIT_TECH_ANIMAL_HUSBANDRY',	'TechType',		'TECH_ANIMAL_HUSBANDRY'	),
	('TRAIT_PASTURE_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_PASTURE_PRODUCTION',	'Amount',		1);
---------------------------------------------------------------------------------------------------------------------------
-- Spainish
update ModifierArguments set Value = 'CIVIC_EXPLORATION' where ModifierId = 'TRAIT_NAVAL_CORPS_EARLY' and Name= 'CivicType';

---------------------------------------------------------------------------------------------------------------------------
--Gilgamesh
--Sumerian war cart can attack wall 
insert or replace into TypeTags
	(Type,									Tag)
values
	('UNIT_SUMERIAN_WAR_CART',				'CLASS_WALL_ATTACK'),
	('ABILITY_ENABLE_WALL_ATTACK',			'CLASS_WALL_ATTACK');

insert or replace into Tags
	(Tag,					Vocabulary)
values
	('CLASS_WALL_ATTACK',	'ABILITY_CLASS');

insert or replace into ImprovementModifiers
	(ImprovementType,						ModifierID)
values
	('IMPROVEMENT_ZIGGURAT',				'ZIGGURAT_RIVERADJACENCY_FOOD');

insert or replace into Modifiers
	(ModifierId,							ModifierType,								SubjectRequirementSetId)
values
	('ZIGGURAT_RIVERADJACENCY_FOOD',		'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO_RIVER_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('ZIGGURAT_RIVERADJACENCY_FOOD',		'YieldType',	'YIELD_FOOD'),
	('ZIGGURAT_RIVERADJACENCY_FOOD',		'Amount',		1);

insert or replace into ImprovementModifiers	(ImprovementType,	ModifierID)
	select 'IMPROVEMENT_ZIGGURAT',	'ZIGGURAT_' || EraType || '_SCIENCE' from Eras where EraType != 'ERA_ANCIENT';

insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
	select 'ZIGGURAT_' || EraType || '_SCIENCE',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'ZIGGURAT_' || EraType from Eras where EraType != 'ERA_ANCIENT';

insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
	select 'ZIGGURAT_' || EraType || '_SCIENCE',	'YieldType',	'YIELD_SCIENCE'	from Eras where EraType != 'ERA_ANCIENT';
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
values
	('ZIGGURAT_ERA_CLASSICAL_SCIENCE',		'Amount',		1),
	('ZIGGURAT_ERA_MEDIEVAL_SCIENCE',		'Amount',		1),
	('ZIGGURAT_ERA_RENAISSANCE_SCIENCE',	'Amount',		1),
	('ZIGGURAT_ERA_INDUSTRIAL_SCIENCE',		'Amount',		1),
	('ZIGGURAT_ERA_MODERN_SCIENCE',			'Amount',		1),
	('ZIGGURAT_ERA_ATOMIC_SCIENCE',			'Amount',		1),
	('ZIGGURAT_ERA_INFORMATION_SCIENCE',	'Amount',		1),
	('ZIGGURAT_ERA_FUTURE_SCIENCE',			'Amount',		1);

----------------------------------------------------------------------------------------------------------------------------------
-- France
update ModifierArguments set Value = 300 where ModifierId = 'TRAIT_WONDER_DOUBLETOURISM' and Name = 'ScalingFactor';

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_WONDER_TOURISM',	'TRAIT_WONDER_BONUS_TO_CAPITAL'),
	('TRAIT_CIVILIZATION_WONDER_TOURISM',	'TRAIT_WONDER_AT_LEAST_MEDIEVAL_BONUS_TO_CAPITAL');

insert or replace into Modifiers
	(ModifierId,												ModifierType,												SubjectRequirementSetId)
values
	('TRAIT_WONDER_BONUS_TO_CAPITAL',							'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',				'DL_THIS_WONDER_IS_AT_LEAST_ANCIENT_REQUIRMENTS'),
	('TRAIT_WONDER_BONUS_TO_CAPITAL_MODIFIER',					'MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_CITY_ALL_YIELDS_CHANGE', NULL),
	('TRAIT_WONDER_AT_LEAST_MEDIEVAL_BONUS_TO_CAPITAL',			'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',				'DL_THIS_WONDER_IS_AT_LEAST_MIEDIVAL_REQUIRMENTS'),
	('TRAIT_WONDER_AT_LEAST_MEDIEVAL_BONUS_TO_CAPITAL_MODIFIER','MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_CITY_ALL_YIELDS_CHANGE', NULL);

insert or replace into ModifierArguments
	(ModifierId,												Name,			Value)
values
	('TRAIT_WONDER_BONUS_TO_CAPITAL',							'ModifierId',	'TRAIT_WONDER_BONUS_TO_CAPITAL_MODIFIER'),
	('TRAIT_WONDER_BONUS_TO_CAPITAL_MODIFIER',					'Amount',		1),
	('TRAIT_WONDER_AT_LEAST_MEDIEVAL_BONUS_TO_CAPITAL',			'ModifierId',	'TRAIT_WONDER_AT_LEAST_MEDIEVAL_BONUS_TO_CAPITAL_MODIFIER'),
	('TRAIT_WONDER_AT_LEAST_MEDIEVAL_BONUS_TO_CAPITAL_MODIFIER','Amount',		1);

-- Chateau
update Improvements set PrereqCivic = 'CIVIC_FEUDALISM' where ImprovementType = 'IMPROVEMENT_CHATEAU';
update Improvement_YieldChanges set YieldChange = 0 where ImprovementType = 'IMPROVEMENT_CHATEAU' and YieldType = 'YIELD_GOLD';
delete from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_CHATEAU' and YieldChangeId = 'Chateau_WonderEarly';
update Adjacency_YieldChanges set PrereqTech = NULL where ID = 'Chateau_WonderLate';

insert or replace into Adjacency_YieldChanges
	(ID,				Description,	YieldType,			YieldChange,	AdjacentResourceClass)
values
	('Chateau_Luxury',	'Placeholder',	'YIELD_CULTURE',	1,				'RESOURCECLASS_LUXURY'),
	('Chateau_Bonus',	'Placeholder',	'YIELD_GOLD', 		2,				'RESOURCECLASS_BONUS');

insert or replace into Improvement_Adjacencies 
	(ImprovementType,		YieldChangeId)
values
	('IMPROVEMENT_CHATEAU',	'Chateau_Luxury'),
	('IMPROVEMENT_CHATEAU',	'Chateau_Bonus');

-----------------------------------------------------------------------------------------------------------------------------
--India
insert or replace into RequirementSets
	(RequirementSetId,						RequirementSetType)
values
	('PLAYER_IS_CIVILIZATION_INDIA',		'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,						RequirementId)
values
	('PLAYER_IS_CIVILIZATION_INDIA',		'PLAYER_IS_CIVILIZATION_INDIA');

insert or replace into ImprovementModifiers
	(ImprovementType,				ModifierId)
values
	('IMPROVEMENT_STEPWELL',		'STEPWELL_ADD_CITY_POPULATION_FOOD'),
	('IMPROVEMENT_STEPWELL',		'STEPWELL_AMENITY_MAX_ONE');

insert or replace into Modifiers
	(ModifierId,							ModifierType,										SubjectRequirementSetId,		SubjectStackLimit)
values
	('STEPWELL_ADD_CITY_POPULATION_FOOD',	'MODIFIER_CITY_OWNER_ADJUST_POP_YIELD',				'PLAYER_IS_CIVILIZATION_INDIA',	1),
	('STEPWELL_AMENITY_MAX_ONE',			'MODIFIER_CITY_OWNER_ADJUST_IMPROVEMENT_AMENITY',	NULL,							1);

insert or replace into ModifierArguments
	(ModifierId,									Name,				Value)
values
	('STEPWELL_ADD_CITY_POPULATION_FOOD',			'YieldType',		'YIELD_FOOD'),
	('STEPWELL_ADD_CITY_POPULATION_FOOD',			'Amount',			0.5),
	('STEPWELL_AMENITY_MAX_ONE',					'Amount',			1);

---------------------------------------------------------------------------------------------------------------------------------
--Gandhi
insert or replace into TraitModifiers 
	(TraitType,					ModifierId)
values
	('TRAIT_LEADER_SATYAGRAHA',	'PEACE_ADDGROWTH'),
	('TRAIT_LEADER_SATYAGRAHA',	'PEACE_ADDFAITH'),
	('TRAIT_LEADER_SATYAGRAHA',	'PEACE_ADDAMENITY');

insert or replace into Modifiers
	(ModifierId,				ModifierType,											SubjectRequirementSetId)
values
	('PEACE_ADDGROWTH',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH',			'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
	('PEACE_ADDFAITH',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
	('PEACE_ADDAMENITY',		'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',			'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS');

insert or replace into ModifierArguments
	(ModifierId,				Name,			Value)
values
	('PEACE_ADDGROWTH',			'Amount',		15),
	('PEACE_ADDFAITH',			'YieldType',	'YIELD_FAITH'),
	('PEACE_ADDFAITH',			'Amount',		15),
	('PEACE_ADDAMENITY',		'Amount',		1);

-------------------------------------------------------------------------------------------------
--Cree's Mekewap now provides +1 production adjacent a Luxury.
update ModifierArguments set Value = 'YIELD_PRODUCTION' where ModifierId = 'MEKEWAP_LUXURY_GOLD' and Name = 'YieldType';

----------------------------------------------------------------------------------------------------------------------
-- Germany
-- UA: TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES
-- LA: TRAIT_LEADER_HOLY_ROMAN_EMPEROR
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_HOLY_ROMAN_EMPEROR' and ModifierId = 'TRAIT_COMBAT_BONUS_CITY_STATES';
insert or replace into TraitModifiers
	(TraitType,										ModifierId)
values
	('TRAIT_LEADER_HOLY_ROMAN_EMPEROR',				'HD_HOLY_ROMAN_DOUBLE_INFLUENCE_POINTS'),
	('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',		'HD_SCIENCE_BONUS_WITH_SPECILTY_DISTRICT'),
	('TRAIT_CIVILIZATION_IMPERIAL_FREE_CITIES',		'HD_CULTURE_BONUS_WITH_SPECILTY_DISTRICT');

insert or replace into Modifiers
	(ModifierId,									ModifierType,										SubjectRequirementSetId)
values
	('HD_HOLY_ROMAN_DOUBLE_INFLUENCE_POINTS',		'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS',			NULL),
	('HD_SCIENCE_BONUS_WITH_SPECILTY_DISTRICT',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'CITY_HAS_1_SPECIALTY_DISTRICT'),
	('HD_CULTURE_BONUS_WITH_SPECILTY_DISTRICT',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'CITY_HAS_1_SPECIALTY_DISTRICT');

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	('HD_HOLY_ROMAN_DOUBLE_INFLUENCE_POINTS',		'BonusType',	'GOVERNMENTBONUS_ENVOYS'),
	('HD_HOLY_ROMAN_DOUBLE_INFLUENCE_POINTS',		'Amount',		100),
	('HD_SCIENCE_BONUS_WITH_SPECILTY_DISTRICT',		'YieldType',	'YIELD_SCIENCE'),
	('HD_SCIENCE_BONUS_WITH_SPECILTY_DISTRICT',		'Amount',		1),
	('HD_CULTURE_BONUS_WITH_SPECILTY_DISTRICT',		'YieldType',	'YIELD_CULTURE'),
	('HD_CULTURE_BONUS_WITH_SPECILTY_DISTRICT',		'Amount',		1);

----------------------------------------------------------------------------------------------------------------------
-- Canada
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_FACES_OF_PEACE' and ModifierId = 'TRAIT_TOURISM_INTO_FAVOR';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_FACES_OF_PEACE' and ModifierId = 'TRAIT_EMERGENCY_FAVOR_MODIFIER';

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_CIVILIZATION_FACES_OF_PEACE',	'PEACE_ADD_CULTURE'),
	('TRAIT_CIVILIZATION_FACES_OF_PEACE',	'PEACE_ADD_TOURISM'),
	('TRAIT_CIVILIZATION_FACES_OF_PEACE',	'TRAIT_BARBARIAN_CAMP_BUILDER_HD');

insert or replace into Modifiers
	(ModifierId,							ModifierType,											SubjectRequirementSetId)
values
	('PEACE_ADD_CULTURE',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
	('PEACE_ADD_TOURISM',					'MODIFIER_PLAYER_ADJUST_TOURISM',						'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
	('TRAIT_BARBARIAN_CAMP_BUILDER_HD',		'MODIFIER_PLAYER_ADJUST_IMPROVEMENT_GOODY_HUT',			NULL);

insert or replace into ModifierArguments
	(ModifierId,							Name,						Value)
values
	('PEACE_ADD_CULTURE',					'YieldType',				'YIELD_CULTURE'),
	('PEACE_ADD_CULTURE',					'Amount',					15),
	('PEACE_ADD_TOURISM',					'Amount',					25),
	('TRAIT_BARBARIAN_CAMP_BUILDER_HD',		'ImprovementType',			'IMPROVEMENT_BARBARIAN_CAMP'),
	('TRAIT_BARBARIAN_CAMP_BUILDER_HD',		'GoodyHutImprovementType',	'IMPROVEMENT_GOODY_BUILDER');

update ModifierArguments set Value = 2 where ModifierId = 'SNOW_MINES_PRODUCTION' and Name = 'Amount';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_LAST_BEST_WEST' and ModifierId like 'TUNDRA%_FOOD';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_LAST_BEST_WEST' and ModifierId like 'TUNDRA%_PRODUCTION';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_LAST_BEST_WEST' and ModifierId like 'SNOW_%_FOOD';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_LAST_BEST_WEST' and ModifierId like 'SNOW_%_PRODUCTION';

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_LEADER_LAST_BEST_WEST',			'TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_PRODUCTION'),
	('TRAIT_LEADER_LAST_BEST_WEST',			'TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_FOOD');

insert or replace into Modifiers
	(ModifierId,										ModifierType,							SubjectRequirementSetId)
values
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'HD_IS_TUNDRA_SNOW_PRODUCTION_IMPROVEMENTS_REQUIREMENTS'),
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_FOOD',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'HD_IS_TUNDRA_SNOW_FOOD_IMPROVEMENTS_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
values
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_PRODUCTION',	'Amount',		2),
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_FOOD',		'YieldType',	'YIELD_FOOD'),
	('TRAIT_TUNDRA_SNOW_SOME_IMPROVEMENTS_FOOD',		'Amount',		2);

------------------------------------------------------------------------------------------------
-- Korea ability updated
delete from TraitModifiers where ModifierId = 'TRAIT_ADJUST_CITY_CULTURE_PER_GOVERNOR_TITLE_MODIFIER';
delete from TraitModifiers where ModifierId = 'TRAIT_ADJUST_CITY_SCIENCE_PER_GOVERNOR_TITLE_MODIFIER';  
delete from Adjacency_YieldChanges where ID = 'Mine_ScienceSeowonAdjacency';
delete from Adjacency_YieldChanges where ID = 'Farm_FoodSeowonAdjacency';
delete from District_Adjacencies where YieldChangeId = 'NegativeDistrict_Science';

insert or replace into TraitModifiers (TraitType,   ModifierId)
select  'TRAIT_LEADER_HWARANG', 'HWARANG_RESEARCHLAB_POP' || YieldType from Yields;
insert or replace into Modifiers (ModifierId,   ModifierType,   SubjectRequirementSetId)
select  'HWARANG_RESEARCHLAB_POP' || YieldType, 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION', 'CITY_HAS_BUILDING_RESEARCH_LAB' from Yields;
insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select  'HWARANG_RESEARCHLAB_POP' || YieldType, 'YieldType', YieldType from Yields;
insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select  'HWARANG_RESEARCHLAB_POP' || YieldType, 'Amount', 1 from Yields;

insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('TRAIT_LEADER_HWARANG',                'HWARANG_ALLBUFF'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_HOUSING'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_LOYALTY'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_AMENITY'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_LOYALTY_DEBUFF'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_AMENITY_DEBUFF'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_ALLDEBUFF'),
    ('TRAIT_LEADER_HWARANG',                'SEWON_FOOD'),
    ('TRAIT_LEADER_HWARANG',                'SEWON_PRODUCTION'),
    ('TRAIT_LEADER_HWARANG',                'LIBRARY_DISTRICT_PRODUCTION'),
    ('TRAIT_LEADER_HWARANG',                'LIBRARY_BUILDING_PRODUCTION'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_CAMPUS_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_THEATER_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_COMMEICIAL_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_HARBOR_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_INDUSTRIAL_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_HOLY_SITE_ADJACENCY'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_SEWON_TITLE'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_LIBRARY_TITLE'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_UNIVERSITY_TITLE'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_RESERCHLAB_TITLE');

insert or replace into Modifiers
    (ModifierId,                        ModifierType,                                                       SubjectRequirementSetId)
values
    ('HWARANG_ALLBUFF',                 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'CITY_HAS_BUILDING_RESEARCH_LAB'),
    ('HWARANG_HOUSING',                 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',                     'CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL'),
    ('HWARANG_LOYALTY',                 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',                  'CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL'),
    ('HWARANG_AMENITY',                 'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',                      'CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL'),
    ('HWARANG_LOYALTY_DEBUFF',          'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',                  'CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL'),
    ('HWARANG_AMENITY_DEBUFF',          'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',                      'CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL'),
    ('HWARANG_ALLDEBUFF',               'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL'),
    ('SEWON_FOOD',                      'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'CITY_HAS_BUILDING_LIBRARY'), --TODO
    ('SEWON_PRODUCTION',                'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'CITY_HAS_BUILDING_LIBRARY'), --TODO
    ('LIBRARY_DISTRICT_PRODUCTION',     'MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PRODUCTION',           'CITY_HAS_DISTRICT_SEOWON'), --TODO
    ('LIBRARY_BUILDING_PRODUCTION',     'MODIFIER_PLAYER_CITIES_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER',    'CITY_HAS_DISTRICT_SEOWON'), --TODO
    ('UNIVERSITY_CAMPUS_ADJACENCY',     'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_CAMPUS_REQUIRMENTS'),
    ('UNIVERSITY_THEATER_ADJACENCY',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_THEATER_REQUIRMENTS'),
    ('UNIVERSITY_COMMEICIAL_ADJACENCY', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS'),
    ('UNIVERSITY_HARBOR_ADJACENCY',     'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_HARBOR_REQUIRMENTS'),
    ('UNIVERSITY_INDUSTRIAL_ADJACENCY', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS'),
    ('UNIVERSITY_HOLY_SITE_ADJACENCY',  'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_HOLYSITE_REQUIRMENTS');
update Modifiers set OwnerRequirementSetId = 'PLAYER_IS_HUMAN' where ModifierId like 'HWARANG_%DEBUFF';

insert or replace into Modifiers
    (ModifierId,                    ModifierType)
values
    ('CAPITAL_SEWON_TITLE',         'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
    ('CAPITAL_LIBRARY_TITLE',       'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
    ('CAPITAL_UNIVERSITY_TITLE',    'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
    ('CAPITAL_RESERCHLAB_TITLE',    'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER');

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                               SubjectRequirementSetId,        RunOnce,    Permanent)
values
    ('CAPITAL_SEWON_TITLE_MODIFIER',        'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_SEOWON_REQUIREMENTS',       1,  1),
    ('CAPITAL_LIBRARY_TITLE_MODIFIER',      'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_LIBRARY_REQUIREMENTS',      1,  1),
    ('CAPITAL_UNIVERSITY_TITLE_MODIFIER',   'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_UNIVERSITY_REQUIREMENTS',   1,  1),
    ('CAPITAL_RESERCHLAB_TITLE_MODIFIER',   'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_REEARCHLAB_REQUIREMENTS',   1,  1);

insert or replace into ModifierArguments
    (ModifierId,                            Name,           Value)
values
    ('HWARANG_ALLBUFF',                     'YieldType',    'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'),
    ('HWARANG_ALLBUFF',                     'Amount',       '10,10,10,10,10,10'),
    ('HWARANG_HOUSING',                     'Amount',       5),
    ('HWARANG_LOYALTY',                     'Amount',       20),
    ('HWARANG_AMENITY',                     'Amount',       3),
    ('HWARANG_LOYALTY_DEBUFF',              'Amount',       -8),
    ('HWARANG_AMENITY_DEBUFF',              'Amount',       -2),
    ('HWARANG_ALLDEBUFF',                   'YieldType',    'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE,YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'),
    ('HWARANG_ALLDEBUFF',                   'Amount',       '-50,-50,-50,-50,-50,-50'),
    -- 
    ('SEWON_FOOD',                          'YieldType',    'YIELD_FOOD'),
    ('SEWON_FOOD',                          'Amount',       15),
    ('SEWON_PRODUCTION',                    'YieldType',    'YIELD_PRODUCTION'),
    ('SEWON_PRODUCTION',                    'Amount',       15),
    -- 
    ('LIBRARY_DISTRICT_PRODUCTION',         'Amount',       25),
    ('LIBRARY_BUILDING_PRODUCTION',         'IsWonder',     0),
    ('LIBRARY_BUILDING_PRODUCTION',         'Amount',       25),
    -- 
    ('UNIVERSITY_CAMPUS_ADJACENCY',         'YieldType',    'YIELD_SCIENCE'),
    ('UNIVERSITY_CAMPUS_ADJACENCY',         'Amount',       100),
    ('UNIVERSITY_THEATER_ADJACENCY',        'YieldType',    'YIELD_CULTURE'),
    ('UNIVERSITY_THEATER_ADJACENCY',        'Amount',       100),
    ('UNIVERSITY_COMMEICIAL_ADJACENCY',     'YieldType',    'YIELD_GOLD'),
    ('UNIVERSITY_COMMEICIAL_ADJACENCY',     'Amount',       100),
    ('UNIVERSITY_HARBOR_ADJACENCY',         'YieldType',    'YIELD_GOLD'),
    ('UNIVERSITY_HARBOR_ADJACENCY',         'Amount',       100),
    ('UNIVERSITY_INDUSTRIAL_ADJACENCY',     'YieldType',    'YIELD_PRODUCTION'),
    ('UNIVERSITY_INDUSTRIAL_ADJACENCY',     'Amount',       100),
    ('UNIVERSITY_HOLY_SITE_ADJACENCY',      'YieldType',    'YIELD_FAITH'),
    ('UNIVERSITY_HOLY_SITE_ADJACENCY',      'Amount',       100),
    -- 
    ('CAPITAL_SEWON_TITLE',                 'ModifierId',   'CAPITAL_SEWON_TITLE_MODIFIER'),
    ('CAPITAL_LIBRARY_TITLE',               'ModifierId',   'CAPITAL_LIBRARY_TITLE_MODIFIER'),
    ('CAPITAL_UNIVERSITY_TITLE',            'ModifierId',   'CAPITAL_UNIVERSITY_TITLE_MODIFIER'),
    ('CAPITAL_RESERCHLAB_TITLE',            'ModifierId',   'CAPITAL_RESERCHLAB_TITLE_MODIFIER'),
    ('CAPITAL_SEWON_TITLE_MODIFIER',        'Delta',        1),
    ('CAPITAL_LIBRARY_TITLE_MODIFIER',      'Delta',        1),
    ('CAPITAL_UNIVERSITY_TITLE_MODIFIER',   'Delta',        1),
    ('CAPITAL_RESERCHLAB_TITLE_MODIFIER',   'Delta',        1);

insert or replace into Requirements
    (RequirementId,                             RequirementType,                        Inverse)
values
    ('REQUIRES_CITY_NON_CAPITAL',               'REQUIREMENT_CITY_HAS_BUILDING',        1),
    ('REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD', 'REQUIREMENT_PLOT_PROPERTY_MATCHES',    0),
    ('REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD',  'REQUIREMENT_PLOT_PROPERTY_MATCHES',    1);

insert or replace into RequirementArguments
    (RequirementId,                             Name,               Value)
values
    ('REQUIRES_CITY_NON_CAPITAL',               'BuildingType',     'BUILDING_PALACE'),
    ('REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD', 'PropertyName',     'HD_HasAssignedGovernor'),
    ('REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD', 'PropertyMinimum',  1),
    ('REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD',  'PropertyName',     'HD_HasAssignedGovernor'),
    ('REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD',  'PropertyMinimum',  1);

insert or replace into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
values
    ('PALACE_AND_SEOWON_REQUIREMENTS',                  'REQUIREMENTSET_TEST_ALL'),
    ('PALACE_AND_LIBRARY_REQUIREMENTS',                 'REQUIREMENTSET_TEST_ALL'),
    ('PALACE_AND_UNIVERSITY_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL'),
    ('PALACE_AND_REEARCHLAB_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL',           'REQUIREMENTSET_TEST_ANY'),
    ('CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL',  'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_DISTRICT_SEOWON',                        'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_BUILDING_LIBRARY',                       'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_CAMPUS_REQUIRMENTS',               'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_THEATER_REQUIRMENTS',              'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS',           'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_HARBOR_REQUIRMENTS',               'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS',           'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_HOLYSITE_REQUIRMENTS',             'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_BUILDING_RESEARCH_LAB',                  'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
values
    ('PALACE_AND_SEOWON_REQUIREMENTS',                  'REQUIRES_CITY_HAS_DISTRICT_SEOWON'),
    ('PALACE_AND_SEOWON_REQUIREMENTS',                  'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('PALACE_AND_LIBRARY_REQUIREMENTS',                 'REQUIRES_CITY_HAS_BUILDING_LIBRARY'),
    ('PALACE_AND_LIBRARY_REQUIREMENTS',                 'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('PALACE_AND_UNIVERSITY_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('PALACE_AND_UNIVERSITY_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('PALACE_AND_REEARCHLAB_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_RESEARCH_LAB'),
    ('PALACE_AND_REEARCHLAB_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    -- 
    ('CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL',           'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL',           'REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD'),
    ('CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL',  'REQUIRES_CITY_NON_CAPITAL'),
    ('CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL',  'REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD'),
    -- 
    ('CITY_HAS_DISTRICT_SEOWON',                        'REQUIRES_CITY_HAS_DISTRICT_SEOWON'),
    ('CITY_HAS_BUILDING_LIBRARY',                       'REQUIRES_CITY_HAS_BUILDING_LIBRARY'),
    ('UNIVERSITY_AND_CAMPUS_REQUIRMENTS',               'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_CAMPUS_REQUIRMENTS',               'REQUIRES_DISTRICT_IS_DISTRICT_CAMPUS'),
    ('UNIVERSITY_AND_THEATER_REQUIRMENTS',              'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_THEATER_REQUIRMENTS',              'REQUIRES_DISTRICT_IS_DISTRICT_THEATER'),
    ('UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS',           'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS',           'REQUIRES_DISTRICT_IS_DISTRICT_COMMERCIAL_HUB'),
    ('UNIVERSITY_AND_HARBOR_REQUIRMENTS',               'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_HARBOR_REQUIRMENTS',               'REQUIRES_DISTRICT_IS_DISTRICT_HARBOR'),
    ('UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS',           'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS',           'REQUIRES_DISTRICT_IS_DISTRICT_INDUSTRIAL_ZONE'),
    ('UNIVERSITY_AND_HOLYSITE_REQUIRMENTS',             'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_HOLYSITE_REQUIRMENTS',             'REQUIRES_DISTRICT_IS_DISTRICT_HOLY_SITE'),
    ('CITY_HAS_BUILDING_RESEARCH_LAB',                  'REQUIRES_CITY_HAS_BUILDING_RESEARCH_LAB');

delete from District_ValidTerrains where DistrictType = 'DISTRICT_SEOWON';
delete from StartBiasTerrains where CivilizationType = 'CIVILIZATION_KOREA';

----------------------------------------------------------------------------------------------------------------------
-- Qin
-- the Great Wall
update Improvements_XP2 set BuildOnAdjacentPlot = 1 where ImprovementType = 'IMPROVEMENT_GREAT_WALL';
update Adjacency_YieldChanges set PrereqTech = 'TECH_CASTLES' where ID = 'GreatWall_Gold';
update Adjacency_YieldChanges set PrereqTech = 'TECH_MASONRY' where ID = 'GreatWall_Culture';

insert or replace into Improvement_YieldChanges
	(ImprovementType,			YieldType,		YieldChange)
values
	('IMPROVEMENT_GREAT_WALL',	'YIELD_FOOD',	1);

insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType)
values
	('IMPROVEMENT_GREAT_WALL',	'FEATURE_FOREST');

insert or replace into Improvement_ValidTerrains
	(ImprovementType,			TerrainType)
values
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_GRASS_MOUNTAIN'),
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_PLAINS_MOUNTAIN'),
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_DESERT_MOUNTAIN'),
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_TUNDRA_MOUNTAIN'),
	('IMPROVEMENT_GREAT_WALL',	'TERRAIN_SNOW_MOUNTAIN');

insert or replace into ImprovementModifiers
	(ImprovementType,				ModifierId)
values
	('IMPROVEMENT_GREAT_WALL',		'GREAT_WALL_REDUCE_COMBAT');

insert or replace into Modifiers
	(ModifierId,							ModifierType,									SubjectRequirementSetId)
values
	('GREAT_WALL_REDUCE_COMBAT',			'MODIFIER_ALL_UNITS_ATTACH_MODIFIER',			'VARU_ADJACENT_AT_WAR_REQUIREMENTS'),
	('GREAT_WALL_REDUCE_COMBAT_MODIFIER',	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',			NULL);

insert or replace into ModifierArguments
	(ModifierId,									Name,				Value)
values
	('GREAT_WALL_REDUCE_COMBAT',					'ModifierId',		'GREAT_WALL_REDUCE_COMBAT_MODIFIER'),
	('GREAT_WALL_REDUCE_COMBAT_MODIFIER',			'Amount',			-2);

insert or replace into ModifierStrings
	(ModifierId,								Context,	Text)
values
	('GREAT_WALL_REDUCE_COMBAT_MODIFIER',		'Preview',	'{1_Amount} {LOC_GREAT_WALL_REDUCE_COMBAT_PREVIEW_TEXT}');

----------------------------------------------------------------------------------------------------------------------
-- Phoenicia
-- LA
insert or replace into TraitModifiers (TraitType,	ModifierId)
select 'TRAIT_LEADER_FOUNDER_CARTHAGE',		'PRODUCTION_DIP_DISTRICT'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into TraitModifiers (TraitType,	ModifierId)
select 'TRAIT_LEADER_FOUNDER_CARTHAGE',		'TRADE_ROUTE_DIP_DISTRICT'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into TraitModifiers (TraitType,	ModifierId)
select 'TRAIT_LEADER_FOUNDER_CARTHAGE',		'TRADE_ROUTE_CONSULATE'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into TraitModifiers (TraitType,	ModifierId)
select 'TRAIT_LEADER_FOUNDER_CARTHAGE',		'TRADE_ROUTE_CHANCERY'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');

insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select 'PRODUCTION_DIP_DISTRICT',	'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION_MODIFIER',	'CITY_HAS_DIP_DISTRICT'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select 'TRADE_ROUTE_DIP_DISTRICT',	'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_CAPACITY',	'CITY_HAS_DIP_DISTRICT'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select 'TRADE_ROUTE_CONSULATE',		'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_CAPACITY',	'BUILDING_IS_CONSULATE'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select 'TRADE_ROUTE_CHANCERY',		'MODIFIER_PLAYER_CITIES_ADJUST_TRADE_ROUTE_CAPACITY',	'BUILDING_IS_CHANCERY'
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');

insert or replace into ModifierArguments (ModifierId,						Name,			Value)
select 'PRODUCTION_DIP_DISTRICT',		'Amount',		50
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into ModifierArguments (ModifierId,						Name,			Value)
select 'TRADE_ROUTE_DIP_DISTRICT',		'Amount',		1
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into ModifierArguments (ModifierId,						Name,			Value)
select 'TRADE_ROUTE_CONSULATE',			'Amount',		1
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into ModifierArguments (ModifierId,						Name,			Value)
select 'TRADE_ROUTE_CHANCERY',			'Amount',		1
where exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');

-- UA
insert or replace into TraitModifiers
	(TraitType,										ModifierId)
values
	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_INTERNATIONAL_TRADE_ROUTE_CULTURE'),
	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_INTERNATIONAL_TRADE_ROUTE_GOLD'),
	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_SUZERAIN_TRADE_ROUTE_CULTURE'),
	('TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES',	'PHOENICIA_SUZERAIN_TRADE_ROUTE_GOLD');

insert or replace into Modifiers
    (ModifierId,                            			ModifierType)
values
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_CULTURE',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_GOLD',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_CULTURE',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE'),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_GOLD',  			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE');

insert or replace into ModifierArguments
    (ModifierId,                            			Name,           Value)
values
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_CULTURE',  	'YieldType',    'YIELD_CULTURE'),
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_CULTURE',  	'Amount',       1),
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_GOLD',    	'YieldType',    'YIELD_GOLD'),
    ('PHOENICIA_INTERNATIONAL_TRADE_ROUTE_GOLD',    	'Amount',       2),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_CULTURE',   		'YieldType',    'YIELD_CULTURE'),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_CULTURE',   		'Amount',       2),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_GOLD',				'YieldType',    'YIELD_GOLD'),
    ('PHOENICIA_SUZERAIN_TRADE_ROUTE_GOLD',				'Amount',       4);
	
-- UD
insert or replace into DistrictModifiers 
	(DistrictType,				ModifierId)
values
	('DISTRICT_COTHON',			'COTHON_ADDGROWTH');

insert or replace into Modifiers
	(ModifierId,				ModifierType)
values
	('COTHON_ADDGROWTH',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH');

insert or replace into ModifierArguments
	(ModifierId,				Name,			Value)
values
	('COTHON_ADDGROWTH',		'Amount',		15);

----------------------------------------------------------------------------------------------------------------------
-- Cree
-- LA : add fishing boats
insert or replace into TraitModifiers
	(TraitType,							ModifierId)
values
	('TRAIT_LEADER_ALLIANCE_AND_TRADE',	'POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS'),
	('TRAIT_LEADER_ALLIANCE_AND_TRADE',	'POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS');

insert or replace into Modifiers
    (ModifierId,                            		ModifierType)
values
    ('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_IMPROVEMENT_IN_TARGET'),
    ('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_IMPROVEMENT_IN_TARGET');

insert or replace into ModifierArguments
    (ModifierId,                            	Name,           Value)
values
    ('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',  	'YieldType',    	'YIELD_FOOD'),
	('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',  	'Amount',    		1),
	('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',  	'ImprovementType',	'IMPROVEMENT_FISHING_BOATS'),
	('POUNDMAKER_TRADE_FOOD_FROM_FISHBOATS',  	'Origin',    		1),
    ('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',  	'YieldType',    	'YIELD_GOLD'),
	('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',  	'Amount',    		1),
	('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',  	'ImprovementType',	'IMPROVEMENT_FISHING_BOATS'),
	('POUNDMAKER_TRADE_GOLD_FROM_FISHBOATS',  	'Destination',    	1);

----------------------------------------------------------------------------------------------------------------------
-- Greece
-- ud 
-- update Districts set PrereqCivic = 'CIVIC_EARLY_EMPIRE' where DistrictType = 'DISTRICT_ACROPOLIS';

insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('TRAIT_LEADER_SURROUNDED_BY_GLORY',	'ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN'),
	('CULTURE_KILLS_TRAIT',					'ACROPOLIS_GRANT_FREE_ANTI_CAVALRY');

insert or replace into Modifiers
	(ModifierId,											ModifierType,												RunOnce,	Permanent,	SubjectRequirementSetId,			SubjectStackLimit)
values
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN',			'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',				0,			0,			'DISTRICT_IS_DISTRICT_ACROPOLIS',	NULL),
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER',	'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER',				0,			0,			NULL,								1),
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER1',	'MODIFIER_PLAYER_ADJUST_DUPLICATE_FIRST_INFLUENCE_TOKEN',	0,			0,			NULL,								NULL),
	('ACROPOLIS_GRANT_FREE_ANTI_CAVALRY',					'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',				0,			0,			'DISTRICT_IS_DISTRICT_ACROPOLIS',	NULL),
	('ACROPOLIS_GRANT_FREE_ANTI_CAVALRY_MODIFIER',			'MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_WITH_MODIFIER',		1,			1,			NULL,								NULL);

insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN',			'ModifierId',	'ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER'),
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER',	'ModifierId',	'ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER1'),
	('ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN_MODIFIER1',	'Amount',		1),
	('ACROPOLIS_GRANT_FREE_ANTI_CAVALRY',					'ModifierId',	'ACROPOLIS_GRANT_FREE_ANTI_CAVALRY_MODIFIER'),
	('ACROPOLIS_GRANT_FREE_ANTI_CAVALRY_MODIFIER',			'UnitPromotionClassType',	'PROMOTION_CLASS_ANTI_CAVALRY');

insert or replace into RequirementSetRequirements
    (RequirementSetId,              	RequirementId)
values
    ('DISTRICT_IS_DISTRICT_ACROPOLIS',  'REQUIRES_DISTRICT_IS_DISTRICT_ACROPOLIS');

insert or replace into RequirementSets
    (RequirementSetId,                  RequirementSetType)
values
    ('DISTRICT_IS_DISTRICT_ACROPOLIS',	'REQUIREMENTSET_TEST_ALL');

--------------------------------------------------------------------------
--Catherine De Medici
-- delete from TraitModifiers where TraitType = 'FLYING_SQUADRON_TRAIT' and ModifierId = 'UNIQUE_LEADER_SPIES_START_PROMOTED';
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
values
	('FLYING_SQUADRON_TRAIT',				'SPY_AND_TRADER_BONUS_SIGHT');

insert or replace into Modifiers
	(ModifierId,							ModifierType,								Permanent)
values
	('SPY_AND_TRADER_BONUS_SIGHT',			'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		1);

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('SPY_AND_TRADER_BONUS_SIGHT',			'AbilityType',	'ABILITY_SPY_AND_TRADER_BONUS_SIGHT');

------------------------------------------------------------------------------------------------
-- Ikanda bug in captured cities 
delete from TraitModifiers where ModifierId like 'TRAIT_IKANDA_%';

insert into DistrictModifiers	(DistrictType,	ModifierId)
select	'DISTRICT_IKANDA',	'TRAIT_IKANDA_' || BuildingType || '_GOLD' from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

insert into DistrictModifiers	(DistrictType,	ModifierId)
select	'DISTRICT_IKANDA',	'TRAIT_IKANDA_' || BuildingType || '_SCIENCE' from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select	'TRAIT_IKANDA_' || BuildingType || '_GOLD',	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',	'CITY_HAS_' || BuildingType from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

insert or replace into Modifiers	(ModifierId,	ModifierType,	SubjectRequirementSetId)
select	'TRAIT_IKANDA_' || BuildingType || '_SCIENCE',	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',	'CITY_HAS_' || BuildingType from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select	'TRAIT_IKANDA_' || BuildingType || '_GOLD',	'YieldType',	'YIELD_GOLD' from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select	'TRAIT_IKANDA_' || BuildingType || '_GOLD',	'Amount',	2 from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select	'TRAIT_IKANDA_' || BuildingType || '_SCIENCE',	'YieldType',	'YIELD_SCIENCE' from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select	'TRAIT_IKANDA_' || BuildingType || '_SCIENCE',	'Amount',	1 from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

insert or replace into RequirementSets	(RequirementSetId,	RequirementSetType)
select	'CITY_HAS_' || BuildingType, 'REQUIREMENTSET_TEST_ALL' from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';

insert or replace into RequirementSetRequirements	(RequirementSetId,	RequirementId)
select	'CITY_HAS_' || BuildingType, 'REQUIRES_CITY_HAS_' || BuildingType	from Buildings 
where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and BuildingType != 'BUILDING_BASILIKOI_PAIDES' and BuildingType != 'BUILDING_ORDU';