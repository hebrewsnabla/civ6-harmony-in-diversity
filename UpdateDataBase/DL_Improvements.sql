-------------------------------------
--    Improvements Adjustments     --
-------------------------------------

-- 【油井】和【海上油井】修改
update Improvements set PrereqTech = 'TECH_BIOLOGY_HD' where ImprovementType = 'IMPROVEMENT_OIL_WELL';

update Improvement_YieldChanges set YieldChange = 3 where ImprovementType = 'IMPROVEMENT_OIL_WELL';
update Improvement_YieldChanges set YieldChange = 3 where ImprovementType = 'IMPROVEMENT_OFFSHORE_OIL_RIG';

insert or replace into Improvement_YieldChanges
	(ImprovementType,						YieldType,				YieldChange)
values
	('IMPROVEMENT_OIL_WELL',				'YIELD_SCIENCE',		1),
	('IMPROVEMENT_OFFSHORE_OIL_RIG',		'YIELD_SCIENCE',		1);

insert or replace into Improvement_BonusYieldChanges
	(ImprovementType,						YieldType,				BonusYieldChange,		PrereqTech)
values
	('IMPROVEMENT_OIL_WELL',				'YIELD_PRODUCTION',		2,						'TECH_REFINING'),
	('IMPROVEMENT_OIL_WELL',				'YIELD_SCIENCE',		2,						'TECH_REFINING'),
	('IMPROVEMENT_OFFSHORE_OIL_RIG',		'YIELD_SCIENCE',		2,						'TECH_REFINING'),
	('IMPROVEMENT_OFFSHORE_OIL_RIG',		'YIELD_PRODUCTION',		2,						'TECH_REFINING');

-- 设定【演化论】市政效果：营地+1粮+1锤，替代【重商主义】市政
update Improvement_BonusYieldChanges set PrereqCivic = 'CIVIC_EVOLUTION_THEORY_HD' where PrereqCivic = 'CIVIC_MERCANTILISM';--xhh

-- update Improvement_YieldChanges set YieldChange = 2 where ImprovementType = 'IMPROVEMENT_MINE';

update Improvements set PrereqTech = 'TECH_MINING' where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';
update Improvements set PrereqTech = 'TECH_MILITARY_ENGINEERING' where ImprovementType = 'IMPROVEMENT_FORT';
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

delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_LUMBER_MILL' and PrereqTech = 'TECH_STEEL';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_PLANTATION' and PrereqCivic = 'CIVIC_FEUDALISM';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_MINE' and PrereqTech = 'TECH_APPRENTICESHIP';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_QUARRY' and PrereqTech = 'TECH_ROCKETRY';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and PrereqTech = 'TECH_CARTOGRAPHY';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and PrereqTech = 'TECH_PLASTICS';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_FISHING_BOATS' and PrereqCivic = 'CIVIC_COLONIALISM';
-- delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_CAMP' and PrereqCivic = 'CIVIC_MERCANTILISM';
--delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_BATEY' and PrereqCivic = 'CIVIC_EXPLORATION';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_PASTURE' and (PrereqTech = 'TECH_STIRRUPS' or PrereqTech = 'TECH_REPLACEABLE_PARTS');

insert or replace into Improvement_BonusYieldChanges
	(Id,	ImprovementType,			YieldType,		BonusYieldChange,	PrereqTech,				PrereqCivic)
values 
	(234,	'IMPROVEMENT_LUMBER_MILL',	'YIELD_PRODUCTION',	1,				'TECH_CONSTRUCTION',	NULL),
	(235,	'IMPROVEMENT_LUMBER_MILL',	'YIELD_PRODUCTION',	1,				'TECH_MACHINERY',		NULL),
	(236,	'IMPROVEMENT_LUMBER_MILL',	'YIELD_PRODUCTION',	1,				NULL,					'CIVIC_CIVIL_ENGINEERING'),
	(237,	'IMPROVEMENT_QUARRY',		'YIELD_PRODUCTION',	1,				'TECH_APPRENTICESHIP',	NULL),
	(241,	'IMPROVEMENT_PLANTATION',	'YIELD_GOLD',		2,				NULL,					'CIVIC_MEDIEVAL_FAIRES'),
	-- (242,	'IMPROVEMENT_CAMP',			'YIELD_FOOD',		1,				'TECH_CONSTRUCTION',	NULL),
	(242,	'IMPROVEMENT_CAMP',			'YIELD_GOLD',		1,				'TECH_ARCHERY',			NULL),
	(243,	'IMPROVEMENT_CAMP',			'YIELD_PRODUCTION',	1,				'TECH_CONSTRUCTION',	NULL),
	-- (245,	'IMPROVEMENT_CAMP',			'YIELD_GOLD',		2,				NULL,					'CIVIC_MERCANTILISM'),
	-- (246,	'IMPROVEMENT_CAMP',			'YIELD_FOOD',		1,				'TECH_RIFLING',			NULL),
	--(247,	'IMPROVEMENT_BATEY',		'YIELD_CULTURE',	2,				NULL,					'CIVIC_HUMANISM'),
	(248,	'IMPROVEMENT_PASTURE',		'YIELD_PRODUCTION',	1,				'TECH_HORSEBACK_RIDING',		NULL),
	(249,	'IMPROVEMENT_PASTURE',		'YIELD_FOOD',		1,				NULL,					'CIVIC_EXPLORATION');
----250已占用
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierID)
values
	('IMPROVEMENT_PLANTATION',	'PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_FOOD'),
	('IMPROVEMENT_PLANTATION',	'PLANTATION_AQUEDUCT_NO_FEUDALISM_FOOD'),
	-- ('IMPROVEMENT_MINE',		'MINE_ON_HILL_PRODUCTION_MODIFIER'),
	('IMPROVEMENT_MINE',		'MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION');
	-- ('IMPROVEMENT_MINE',		'MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER');

insert or replace into Modifiers
	(ModifierId,											ModifierType,								SubjectRequirementSetId)
values
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_FOOD',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT_NO_FEUDALISM'),
	('PLANTATION_AQUEDUCT_NO_FEUDALISM_FOOD',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'IS_ADJACENT_TO_AQUEDUCT_NO_FEUDALISM'),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER',		'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO_INDUSTRIAL_ZONE'),
	('MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO_MOUNTAIN_NO_APPRENTICESHIP');
	-- ('MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'HAS_APPRENTICESHIP_AND_PLOT_ADJACENT_TO_MOUNTAIN');

insert or replace into ModifierArguments
	(ModifierId,											Name,		Value)
values
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_FOOD',	'YieldType',	'YIELD_FOOD'),
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_FOOD',	'Amount',		1),
	('PLANTATION_AQUEDUCT_NO_FEUDALISM_FOOD',				'YieldType',	'YIELD_FOOD'),
	('PLANTATION_AQUEDUCT_NO_FEUDALISM_FOOD',				'Amount',		1),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER',		'YieldType',	'YIELD_PRODUCTION'),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER',		'Amount',		1),
	('MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION',	'Amount',		1);
	-- ('MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER',	'YieldType',	'YIELD_PRODUCTION'),
	-- ('MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER',	'Amount',		-1);

-- Remove snow barbarian camp.
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW';
delete from Improvement_ValidTerrains where
	ImprovementType = 'IMPROVEMENT_BARBARIAN_CAMP' and TerrainType = 'TERRAIN_SNOW_HILLS';

-- Goody
-- test: sumeria gives heavy cavalry unit instead.
-- update ModifierArguments set Value = 'IMPROVEMENT_METEOR_GOODY' where ModifierId = 'TRAIT_BARBARIAN_CAMP_GOODY' and Name = 'GoodyHutImprovementType';

insert or replace into Types (Type, Kind) values ('IMPROVEMENT_GOODY_BUILDER', 'KIND_IMPROVEMENT');
insert or replace into Improvements
	(ImprovementType,				Name,									Icon,							PlunderType,	RemoveOnEntry,	Goody,	GoodyNotify)
values
	('IMPROVEMENT_GOODY_BUILDER',	'LOC_IMPROVEMENT_GOODY_BUILDER_NAME',	'ICON_IMPROVEMENT_GOODY_HUT',	'NO_PLUNDER',	1,				1,		0);

insert or replace into GoodyHuts
	(GoodyHutType,				ImprovementType,				Weight,	ShowMoment)
values
	('DUMMY_GOODY_BUILDIER',	'IMPROVEMENT_GOODY_BUILDER',	100,	0);

insert or replace into GoodyHutSubTypes
	(GoodyHut,					SubTypeGoodyHut,		Description,										Weight, ModifierID)
values
	('DUMMY_GOODY_BUILDIER',	'DUMMY_GRANT_BUILDER',	'LOC_GOODYHUT_SURVIVORS_GRANT_UNIT_DESCRIPTION',	100,	'GOODY_SURVIVORS_GRANT_BUILDER');

insert or replace into Improvement_YieldChanges
	(ImprovementType,		YieldType,		YieldChange)
values
	('IMPROVEMENT_PASTURE',	'YIELD_GOLD',	0);

insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqTech,				ScalingFactor)
values
	('IMPROVEMENT_CAMP',		'TOURISMSOURCE_CULTURE',	'TECH_FLIGHT',			100);

-- 冰球场
update Improvements set PrereqCivic = 'CIVIC_URBANIZATION' where ImprovementType = 'IMPROVEMENT_ICE_HOCKEY_RINK';