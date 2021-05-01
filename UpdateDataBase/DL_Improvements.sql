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
	('IMPROVEMENT_FISHERY', 'FEATURE_REEF', NULL, NULL),
	('IMPROVEMENT_CAMP', 'FEATURE_JUNGLE', NULL, 'CIVIC_GUILDS');

insert or replace into Improvement_YieldChanges (ImprovementType, YieldType, YieldChange) values
	('IMPROVEMENT_FISHING_BOATS', 'YIELD_FOOD', 0),
	('IMPROVEMENT_FISHING_BOATS', 'YIELD_PRODUCTION', 1),
	-- ('IMPROVEMENT_MINE', 'YIELD_GOLD', 1),
	-- ('IMPROVEMENT_PASTURE', 'YIELD_PRODUCTION', 0),
	-- ('IMPROVEMENT_PASTURE', 'YIELD_FOOD', 1),
	-- ('IMPROVEMENT_PLANTATION', 'YIELD_GOLD', 2),
	-- ('IMPROVEMENT_PLANTATION', 'YIELD_FOOD', 0),
	('IMPROVEMENT_CAMP', 'YIELD_GOLD', 0),
	('IMPROVEMENT_CAMP', 'YIELD_FOOD', 1),
	('IMPROVEMENT_LUMBER_MILL', 'YIELD_PRODUCTION', 1);

delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_PLANTATION' and PrereqCivic = 'CIVIC_FEUDALISM';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_MINE' and PrereqTech = 'TECH_APPRENTICESHIP';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_QUARRY' and PrereqTech = 'TECH_ROCKETRY';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and PrereqTech = 'TECH_CARTOGRAPHY';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and PrereqTech = 'TECH_PLASTICS';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and PrereqCivic = 'CIVIC_COLONIALISM';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_CAMP' and PrereqCivic = 'CIVIC_MERCANTILISM';
--delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_BATEY' and PrereqCivic = 'CIVIC_EXPLORATION';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_PASTURE' and PrereqTech = 'TECH_STIRRUPS';

insert or replace into Improvement_BonusYieldChanges
	(Id,	ImprovementType,			YieldType,		BonusYieldChange,	PrereqTech,				PrereqCivic)
values 
	(234,	'IMPROVEMENT_LUMBER_MILL',	'YIELD_PRODUCTION',	1,				'TECH_CONSTRUCTION',	NULL),
	(235,	'IMPROVEMENT_LUMBER_MILL',	'YIELD_PRODUCTION',	1,				'TECH_MACHINERY',		NULL),
	-- (236,	'IMPROVEMENT_QUARRY',		'YIELD_PRODUCTION',	1,				'TECH_APPRENTICESHIP',	NULL),
	(241,	'IMPROVEMENT_PLANTATION',	'YIELD_GOLD',		2,				NULL,					'CIVIC_MEDIEVAL_FAIRES'),
	-- (242,	'IMPROVEMENT_CAMP',			'YIELD_FOOD',		1,				'TECH_CONSTRUCTION',	NULL),
	(242,	'IMPROVEMENT_CAMP',			'YIELD_GOLD',		1,				'TECH_ARCHERY',			NULL),
	(243,	'IMPROVEMENT_CAMP',			'YIELD_PRODUCTION',	1,				'TECH_CONSTRUCTION',	NULL),
	(245,	'IMPROVEMENT_CAMP',			'YIELD_GOLD',		2,				NULL,					'CIVIC_MERCANTILISM'),
	(246,	'IMPROVEMENT_CAMP',			'YIELD_FOOD',		1,				'TECH_RIFLING',			NULL),
	--(247,	'IMPROVEMENT_BATEY',		'YIELD_CULTURE',	2,				NULL,					'CIVIC_HUMANISM'),
	(248,	'IMPROVEMENT_PASTURE',		'YIELD_PRODUCTION',	1,				'TECH_HORSEBACK_RIDING',	NULL),
	(249,	'IMPROVEMENT_PASTURE',		'YIELD_FOOD',		1,				NULL,					'CIVIC_MEDIEVAL_FAIRES');

insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierID)
values
	('IMPROVEMENT_PLANTATION',	'PLANTATION_FRESH_WATER_NO_AQUEDUCT_FOOD'),
	('IMPROVEMENT_PLANTATION',	'PLANTATION_AQUEDUCT_FOOD'),
	-- ('IMPROVEMENT_MINE',		'MINE_ON_HILL_PRODUCTION_MODIFIER'),
	('IMPROVEMENT_MINE',		'MINE_ADJACENT_TO_MOUNTAIN_PRODUCTION_MODIFIER'),
	('IMPROVEMENT_MINE',		'MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER');

insert or replace into Modifiers
	(ModifierId,											ModifierType,								SubjectRequirementSetId)
values
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FOOD',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT'),
	('PLANTATION_AQUEDUCT_FOOD',							'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'IS_ADJACENT_TO_AQUEDUCT'),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER',		'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO_INDUSTRIAL_ZONE'),
	('MINE_ADJACENT_TO_MOUNTAIN_PRODUCTION_MODIFIER',		'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO_MOUNTAIN'),
	('MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'HAS_APPRENTICESHIP_AND_PLOT_ADJACENT_TO_MOUNTAIN');

insert or replace into ModifierArguments
	(ModifierId,											Name,		Value)
values
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FOOD',				'YieldType',	'YIELD_FOOD'),
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FOOD',				'Amount',		1),
	('PLANTATION_AQUEDUCT_FOOD',							'YieldType',	'YIELD_FOOD'),
	('PLANTATION_AQUEDUCT_FOOD',							'Amount',		1),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER',		'YieldType',	'YIELD_PRODUCTION'),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER',		'Amount',		1),
	('MINE_ADJACENT_TO_MOUNTAIN_PRODUCTION_MODIFIER',		'YieldType',	'YIELD_PRODUCTION'),
	('MINE_ADJACENT_TO_MOUNTAIN_PRODUCTION_MODIFIER',		'Amount',		1),
	('MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER',	'YieldType',	'YIELD_PRODUCTION'),
	('MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER',	'Amount',		-1);

-- Remove snow barbarian camp.
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW';
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW_HILLS';
