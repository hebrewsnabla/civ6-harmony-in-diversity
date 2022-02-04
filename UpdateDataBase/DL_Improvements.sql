-------------------------------------
--    Improvements Adjustments     --
-------------------------------------

-- 农场
insert or replace into Improvement_BonusYieldChanges
	(Id,	ImprovementType,						YieldType,				BonusYieldChange,		PrereqTech)
values
	(604,	'IMPROVEMENT_FARM',						'YIELD_FOOD',			1,						'TECH_CALENDAR_HD');

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
	(Id,	ImprovementType,						YieldType,				BonusYieldChange,		PrereqTech)
values
	(600,	'IMPROVEMENT_OIL_WELL',					'YIELD_PRODUCTION',		2,						'TECH_REFINING'),
	(601,	'IMPROVEMENT_OIL_WELL',					'YIELD_SCIENCE',		2,						'TECH_REFINING'),
	(602,	'IMPROVEMENT_OFFSHORE_OIL_RIG',			'YIELD_SCIENCE',		2,						'TECH_REFINING'),
	(603,	'IMPROVEMENT_OFFSHORE_OIL_RIG',			'YIELD_PRODUCTION',		2,						'TECH_REFINING');

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
	(248,	'IMPROVEMENT_PASTURE',		'YIELD_PRODUCTION',	1,				'TECH_HORSEBACK_RIDING', NULL),
	(249,	'IMPROVEMENT_PASTURE',		'YIELD_FOOD',		1,				'TECH_MASS_PRODUCTION',	NULL); -- CIVIC_EXPLORATION
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
--by 弱猹
--西班牙，传教团的提升
UPDATE Improvement_BonusYieldChanges SET PrereqCivic="CIVIC_EXPLORATION" where ImprovementType="IMPROVEMENT_MISSION" and PrereqCivic="CIVIC_CULTURAL_HERITAGE";
--土澳，内陆牧场的提升，
UPDATE Adjacency_YieldChanges SET PrereqTech="TECH_BANKING"   where ID="Outback_Outback_Production";
--法国UI改为文学传统
UPDATE Improvements SET PrereqCivic="CIVIC_LITERARY_TRADITION_HD"  where ImprovementType="IMPROVEMENT_CHATEAU"  ;
--瑞典UI改为人文主义
UPDATE Improvements SET PrereqCivic="CIVIC_HUMANISM"  where ImprovementType="IMPROVEMENT_OPEN_AIR_MUSEUM";

-- 坟墩给相邻牧场+1鸽
insert or replace into Improvement_YieldChanges
	(ImprovementType,	YieldType,	YieldChange)
values
	('IMPROVEMENT_PASTURE',	'YIELD_FAITH',0);
	
insert or replace into Adjacency_YieldChanges
	(ID,	Description,	YieldType,	YieldChange,	TilesRequired,	AdjacentImprovement)
values
	('Pasture_Kurgan_Faith',	'Placeholder',	'YIELD_FAITH',	1,	1,	'IMPROVEMENT_KURGAN');
insert into Improvement_Adjacencies
	(ImprovementType,		YieldChangeId)
values
	('IMPROVEMENT_PASTURE',	'Pasture_Kurgan_Faith');
	
-- 圩田
update Improvements set ValidAdjacentTerrainAmount = 2, PrereqTech = 'TECH_BUTTRESS', PrereqCivic = NULL where ImprovementType = 'IMPROVEMENT_POLDER';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_POLDER';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_BIOLOGY_HD' where ID = 'Polder_Polder_Food_Early';
update Adjacency_YieldChanges set PrereqTech = 'TECH_BIOLOGY_HD' where ID = 'Polder_Polder_Food_Late';
update Adjacency_YieldChanges set PrereqTech = 'TECH_MASS_PRODUCTION' where ID = 'Polder_Polder_Production';

insert or replace into Improvement_Adjacencies
	(ImprovementType,			YieldChangeId)
values
	('IMPROVEMENT_POLDER',		'HD_POLDER_GOLD');

insert or replace into Adjacency_YieldChanges
	(ID,							Description,	YieldType,			YieldChange,	TilesRequired,	AdjacentImprovement,		PrereqCivic,	PrereqTech,					ObsoleteCivic,	ObsoleteTech)
values
	('HD_POLDER_GOLD',				'Placeholder',	'YIELD_GOLD',		2,				1,				'IMPROVEMENT_POLDER',		NULL,			'TECH_BANKING',				NULL,			NULL);

-- 陆地圩田
insert or ignore into Types
	(Type,											Kind)
values
	('TRAIT_CIVILIZATION_IMPROVEMENT_LAND_POLDER',	'KIND_TRAIT'),
	('IMPROVEMENT_LAND_POLDER',						'KIND_IMPROVEMENT');

insert or replace into Traits
	(TraitType,										Name)
values
	('TRAIT_CIVILIZATION_IMPROVEMENT_LAND_POLDER',	'LOC_IMPROVEMENT_LAND_POLDER_NAME');

insert or replace into CivilizationTraits
	(CivilizationType,								TraitType)
values
	('CIVILIZATION_NETHERLANDS',					'TRAIT_CIVILIZATION_IMPROVEMENT_LAND_POLDER');

insert or replace into Improvements
	(ImprovementType,			Name,								PrereqTech,			PrereqCivic,		Buildable,	Description,								PlunderType,		PlunderAmount,	Icon,							TraitType,										Housing,	TilesRequired,	MovementChange)
values
	('IMPROVEMENT_LAND_POLDER',	'LOC_IMPROVEMENT_LAND_POLDER_NAME',	'TECH_BUTTRESS',	Null,				1,			'LOC_IMPROVEMENT_LAND_POLDER_DESCRIPTION',	'PLUNDER_FAITH',	25,				'ICON_IMPROVEMENT_LAND_POLDER',	'TRAIT_CIVILIZATION_IMPROVEMENT_LAND_POLDER',	1,			2,				2);

insert or replace into Improvement_YieldChanges
	(ImprovementType,			YieldType,			YieldChange)
values
	('IMPROVEMENT_LAND_POLDER',	'YIELD_FOOD',		1),
	('IMPROVEMENT_LAND_POLDER',	'YIELD_PRODUCTION',	1),
	('IMPROVEMENT_LAND_POLDER',	'YIELD_GOLD',		0);

insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType)
values
	('IMPROVEMENT_LAND_POLDER',	'FEATURE_FLOODPLAINS'),
	('IMPROVEMENT_LAND_POLDER',	'FEATURE_FLOODPLAINS_GRASSLAND'),
	('IMPROVEMENT_LAND_POLDER',	'FEATURE_FLOODPLAINS_PLAINS'),
	('IMPROVEMENT_LAND_POLDER',	'FEATURE_MARSH');

insert or replace into Improvement_ValidBuildUnits
	(ImprovementType,			UnitType)
values
	('IMPROVEMENT_LAND_POLDER',	'UNIT_BUILDER');

insert or replace into Improvement_Adjacencies
	(ImprovementType,			YieldChangeId)
values
	('IMPROVEMENT_LAND_POLDER',	'HD_LAND_POLDER_FOOD_EARLY'),
	('IMPROVEMENT_LAND_POLDER',	'HD_LAND_POLDER_FOOD_LATE'),
	('IMPROVEMENT_LAND_POLDER',	'HD_LAND_POLDER_PRODUCTION'),
	('IMPROVEMENT_LAND_POLDER',	'HD_LAND_POLDER_GOLD');

insert or replace into Adjacency_YieldChanges
	(ID,							Description,	YieldType,			YieldChange,	TilesRequired,	AdjacentImprovement,		PrereqCivic,	PrereqTech,					ObsoleteCivic,	ObsoleteTech)
values
	('HD_LAND_POLDER_FOOD_EARLY',	'Placeholder',	'YIELD_FOOD',		1,				1,				'IMPROVEMENT_LAND_POLDER',	NULL,			NULL,						NULL,			'TECH_BIOLOGY_HD'),
	('HD_LAND_POLDER_FOOD_LATE',	'Placeholder',	'YIELD_FOOD',		2,				1,				'IMPROVEMENT_LAND_POLDER',	NULL,			'TECH_BIOLOGY_HD',			NULL,			NULL),
	('HD_LAND_POLDER_PRODUCTION',	'Placeholder',	'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_LAND_POLDER',	NULL,			'TECH_MASS_PRODUCTION',		NULL,			NULL),
	('HD_LAND_POLDER_GOLD',			'Placeholder',	'YIELD_GOLD',		2,				1,				'IMPROVEMENT_LAND_POLDER',	NULL,			'TECH_BANKING',				NULL,			NULL);

-- 海陆圩田相互Buff
insert or replace into Improvement_Adjacencies
	(ImprovementType,			YieldChangeId)
select
	'IMPROVEMENT_POLDER',		YieldChangeId
from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_LAND_POLDER';

insert or replace into Improvement_Adjacencies
	(ImprovementType,			YieldChangeId)
select
	'IMPROVEMENT_LAND_POLDER',	YieldChangeId
from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_POLDER';