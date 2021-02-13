-------------------------------------
--    Improvements Adjustments     --
-------------------------------------

-- update Improvement_YieldChanges set YieldChange = 2 where ImprovementType = 'IMPROVEMENT_MINE';

update Improvements set PrereqTech = 'TECH_BRONZE_WORKING'
	where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';

-- -- change the unlock condition.
update Improvement_ValidFeatures set PrereqTech = NULL, PrereqCivic = 'CIVIC_GUILDS'
	where ImprovementType = 'IMPROVEMENT_LUMBER_MILL' and FeatureType = 'FEATURE_JUNGLE';

insert or replace into Improvement_ValidFeatures (ImprovementType, FeatureType, PrereqTech, PrereqCivic) values
	('IMPROVEMENT_CAMP', 'FEATURE_FOREST', 'TECH_ARCHERY', NULL),
	('IMPROVEMENT_CAMP', 'FEATURE_JUNGLE', NULL, 'CIVIC_GUILDS')
;

insert or replace into Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) values
	('IMPROVEMENT_FISHING_BOATS', 'YIELD_FOOD', 0),
	('IMPROVEMENT_FISHING_BOATS', 'YIELD_PRODUCTION', 1),
	-- ('IMPROVEMENT_MINE', 'YIELD_GOLD', 1),
	-- ('IMPROVEMENT_PASTURE', 'YIELD_PRODUCTION', 0),
	-- ('IMPROVEMENT_PASTURE', 'YIELD_FOOD', 1),
	-- ('IMPROVEMENT_PLANTATION', 'YIELD_GOLD', 2),
	-- ('IMPROVEMENT_PLANTATION', 'YIELD_FOOD', 0),
	-- ('IMPROVEMENT_CAMP', 'YIELD_GOLD', 0),
	-- ('IMPROVEMENT_CAMP', 'YIELD_FOOD', 1),
	('IMPROVEMENT_LUMBER_MILL', 'YIELD_PRODUCTION', 1);

delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_MINE' and PrereqTech = 'TECH_APPRENTICESHIP';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_QUARRY' and PrereqTech = 'TECH_ROCKETRY';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and PrereqTech = 'TECH_CARTOGRAPHY';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and PrereqTech = 'TECH_PLASTICS';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and PrereqCivic = 'CIVIC_COLONIALISM';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_CAMP' and PrereqCivic = 'CIVIC_MERCANTILISM';
insert or replace into Improvement_BonusYieldChanges values 
	-- (id, ImprovementType, YieldType, BonusYieldChange, PrereqTech, PrereqCivic)
	(234, 'IMPROVEMENT_LUMBER_MILL', 'YIELD_PRODUCTION', 1, 'TECH_MACHINERY', NULL),
	(235, 'IMPROVEMENT_LUMBER_MILL', 'YIELD_PRODUCTION', 1, 'TECH_STEAM_POWER', NULL),
	-- (236, 'IMPROVEMENT_QUARRY', 'YIELD_PRODUCTION', 1, 'TECH_APPRENTICESHIP', NULL),
	-- (237, 'IMPROVEMENT_MINE', 'YIELD_PRODUCTION', 1, 'TECH_STEAM_POWER', NULL),
	-- (238, 'IMPROVEMENT_PASTURE', 'YIELD_FOOD', 1, 'TECH_HORSEBACK_RIDING', NULL),
	-- (239, 'IMPROVEMENT_PASTURE', 'YIELD_FOOD', 1, NULL, 'CIVIC_MEDIEVAL_FAIRES'),
	-- (240, 'IMPROVEMENT_PASTURE', 'YIELD_FOOD', 1, 'TECH_REPLACEABLE_PARTS', NULL),
	-- (241, 'IMPROVEMENT_PLANTATION', 'YIELD_GOLD', 2, 'TECH_CARTOGRAPHY', NULL),
	(242, 'IMPROVEMENT_CAMP', 'YIELD_FOOD', 1, 'TECH_CONSTRUCTION', NULL),
	-- (242, 'IMPROVEMENT_CAMP', 'YIELD_PRODUCTION', 1, 'TECH_CONSTRUCTION', NULL),
	-- (243, 'IMPROVEMENT_CAMP', 'YIELD_FOOD', 1, NULL, 'CIVIC_MEDIEVAL_FAIRES'),
	(244, 'IMPROVEMENT_CAMP', 'YIELD_GOLD', 1, NULL, 'CIVIC_MEDIEVAL_FAIRES'),
	(245, 'IMPROVEMENT_CAMP', 'YIELD_GOLD', 1, NULL, 'CIVIC_MERCANTILISM'),
	(246, 'IMPROVEMENT_CAMP', 'YIELD_FOOD', 1, 'TECH_RIFLING', NULL)
	-- (247, 'IMPROVEMENT_FISHING_BOATS', 'YIELD_FOOD', 1, 'TECH_SHIPBUILDING', NULL),
	-- (248, 'IMPROVEMENT_FISHING_BOATS', 'YIELD_FOOD', 1, 'TECH_CARTOGRAPHY', NULL),
	-- (249, 'IMPROVEMENT_FISHING_BOATS', 'YIELD_GOLD', 2, NULL, 'CIVIC_EXPLORATION')
;

insert or replace into ImprovementModifiers (ImprovementType, ModifierID) values
	-- ('IMPROVEMENT_MINE', 'TECH_BRONZE_WORKING_INCREASE_BRONZE_MINE_YIELD'),
	-- ('IMPROVEMENT_MINE', 'TECH_CURRENCY_INCREASE_LUXURY_RESOURCE_MINE_YIELD'),
	-- ('IMPROVEMENT_MINE', 'TECH_CURRENCY_INCREASE_BONUS_RESOURCE_MINE_YIELD'),
	-- ('IMPROVEMENT_MINE', 'TECH_CURRENCY_INCREASE_STRATEGIC_RESOURCE_MINE_YIELD'),
	-- ('IMPROVEMENT_MINE', 'MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER'),
	-- ('IMPROVEMENT_MINE', 'MINE_ON_HILL_PRODUCTION_MODIFIER'),
	('IMPROVEMENT_MINE', 'MINE_ADJACENT_TO_MOUNTAIN_PRODUCTION_MODIFIER')
	-- ('IMPROVEMENT_LUMBER_MILL', 'CONSTRUCTION_INCREASE_RIVER_LUMBER_MILL_YIELD')
;

insert into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) values
	-- ('TECH_BRONZE_WORKING_INCREASE_BRONZE_MINE_YIELD', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'HAS_COPPER_RESOURCE_AND_BRONZE_WORKING'),
	-- ('TECH_CURRENCY_INCREASE_LUXURY_RESOURCE_MINE_YIELD', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'HAS_LUXURY_RESOURCE_AND_CURRENCY'),
	-- ('TECH_CURRENCY_INCREASE_BONUS_RESOURCE_MINE_YIELD', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'HAS_BONUS_RESOURCE_AND_CURRENCY'),
	-- ('TECH_CURRENCY_INCREASE_STRATEGIC_RESOURCE_MINE_YIELD', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'HAS_STRATEGIC_RESOURCE_AND_CURRENCY'),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'PLOT_ADJACENT_TO_INDUSTRIAL_ZONE'),
	-- ('MINE_ON_HILL_PRODUCTION_MODIFIER', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'PLOT_IS_TERRAIN_HILL'),
	('MINE_ADJACENT_TO_MOUNTAIN_PRODUCTION_MODIFIER', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'PLOT_ADJACENT_TO_MOUNTAIN')
	-- ('CONSTRUCTION_INCREASE_RIVER_LUMBER_MILL_YIELD', 'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS', 'HAS_CONSTRUCTION_AND_PLOT_ADJACENT_TO_RIVER_REQUIREMENTS')
;

insert into ModifierArguments (ModifierId, Name, Value) values
	-- ('TECH_BRONZE_WORKING_INCREASE_BRONZE_MINE_YIELD', 'YieldType', 'YIELD_PRODUCTION'),
	-- ('TECH_BRONZE_WORKING_INCREASE_BRONZE_MINE_YIELD', 'Amount', 1),
	-- ('TECH_CURRENCY_INCREASE_LUXURY_RESOURCE_MINE_YIELD', 'YieldType', 'YIELD_GOLD'),
	-- ('TECH_CURRENCY_INCREASE_LUXURY_RESOURCE_MINE_YIELD', 'Amount', 2),
	-- ('TECH_CURRENCY_INCREASE_BONUS_RESOURCE_MINE_YIELD', 'YieldType', 'YIELD_GOLD'),
	-- ('TECH_CURRENCY_INCREASE_BONUS_RESOURCE_MINE_YIELD', 'Amount', 2),
	-- ('TECH_CURRENCY_INCREASE_STRATEGIC_RESOURCE_MINE_YIELD', 'YieldType', 'YIELD_GOLD'),
	-- ('TECH_CURRENCY_INCREASE_STRATEGIC_RESOURCE_MINE_YIELD', 'Amount', 2),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER', 'YieldType', 'YIELD_PRODUCTION'),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER', 'Amount', 1),
	-- ('MINE_ON_HILL_PRODUCTION_MODIFIER', 'YieldType', 'YIELD_PRODUCTION'),
	-- ('MINE_ON_HILL_PRODUCTION_MODIFIER', 'Amount', 1),
	('MINE_ADJACENT_TO_MOUNTAIN_PRODUCTION_MODIFIER', 'YieldType', 'YIELD_PRODUCTION'),
	('MINE_ADJACENT_TO_MOUNTAIN_PRODUCTION_MODIFIER', 'Amount', 1)
	-- ('CONSTRUCTION_INCREASE_RIVER_LUMBER_MILL_YIELD', 'YieldType', 'YIELD_PRODUCTION'),
	-- ('CONSTRUCTION_INCREASE_RIVER_LUMBER_MILL_YIELD', 'Amount', 1)
;

-- Remove snow barbarian camp.
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW';
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW_HILLS';
