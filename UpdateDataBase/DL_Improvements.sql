-- Basic Yields
delete from Improvement_YieldChanges where
	(ImprovementType = 'IMPROVEMENT_FISHING_BOATS'	and YieldType = 'YIELD_FOOD') or
	(ImprovementType = 'IMPROVEMENT_PLANTATION'		and YieldType = 'YIELD_GOLD') or
	(ImprovementType = 'IMPROVEMENT_CAMP'			and YieldType = 'YIELD_FOOD');
insert or replace into Improvement_YieldChanges
	(ImprovementType,					YieldType,				YieldChange)
values
	('IMPROVEMENT_FISHING_BOATS',		'YIELD_PRODUCTION',		1),
	('IMPROVEMENT_PLANTATION',			'YIELD_FOOD',			1),
	('IMPROVEMENT_CAMP',				'YIELD_FOOD',			1),
	('IMPROVEMENT_LUMBER_MILL',			'YIELD_PRODUCTION',		1),
	('IMPROVEMENT_OIL_WELL',			'YIELD_PRODUCTION',		3),
	('IMPROVEMENT_OIL_WELL',			'YIELD_SCIENCE',		1),
	('IMPROVEMENT_OFFSHORE_OIL_RIG',	'YIELD_PRODUCTION',		3),
	('IMPROVEMENT_OFFSHORE_OIL_RIG',	'YIELD_SCIENCE',		1);

-- Bonus Yields
delete from Improvement_BonusYieldChanges where ImprovementType in (
	'IMPROVEMENT_FARM',
	'IMPROVEMENT_PLANTATION',
	'IMPROVEMENT_CAMP',
	'IMPROVEMENT_PASTURE',
	'IMPROVEMENT_QUARRY',
	'IMPROVEMENT_MINE',
	'IMPROVEMENT_LUMBER_MILL',
	'IMPROVEMENT_FISHING_BOATS');
insert or replace into Improvement_BonusYieldChanges
	(Id,	ImprovementType,						YieldType,				BonusYieldChange,	PrereqCivic,					PrereqTech)
values
	(600,	'IMPROVEMENT_FARM',						'YIELD_FOOD',			1,					null,							'TECH_CALENDAR_HD'),

	(610,	'IMPROVEMENT_PLANTATION',				'YIELD_FOOD',			1,					null,							'TECH_PAPER_MAKING_HD'),
	(611,	'IMPROVEMENT_PLANTATION',				'YIELD_GOLD',			2,					'CIVIC_FEUDALISM',				null),
	(612,	'IMPROVEMENT_PLANTATION',				'YIELD_GOLD',			2,					'CIVIC_MERCANTILISM',			null),
	(613,	'IMPROVEMENT_PLANTATION',				'YIELD_GOLD',			2,					'CIVIC_GLOBALIZATION',			null),

	(620,	'IMPROVEMENT_CAMP',						'YIELD_PRODUCTION',		1,					null,							'TECH_CONSTRUCTION'),
	(621,	'IMPROVEMENT_CAMP',						'YIELD_PRODUCTION',		1,					'CIVIC_MEDIEVAL_FAIRES',		null),
	(622,	'IMPROVEMENT_CAMP',						'YIELD_FOOD',			1,					'CIVIC_EVOLUTION_THEORY_HD',	null),
	(623,	'IMPROVEMENT_CAMP',						'YIELD_GOLD',			2,					null,							'TECH_SYNTHETIC_MATERIALS'),

	(630,	'IMPROVEMENT_PASTURE',					'YIELD_PRODUCTION',		1,					null,							'TECH_HORSEBACK_RIDING'),
	(631,	'IMPROVEMENT_PASTURE',					'YIELD_PRODUCTION',		1,					'CIVIC_FEUDALISM',				null),
	(632,	'IMPROVEMENT_PASTURE',					'YIELD_FOOD',			1,					null,							'TECH_MASS_PRODUCTION'),
	(633,	'IMPROVEMENT_PASTURE',					'YIELD_FOOD',			1,					null,							'TECH_ROBOTICS'),

	(640,	'IMPROVEMENT_QUARRY',					'YIELD_PRODUCTION',		1,					null,							'TECH_GUNPOWDER'),
	(641,	'IMPROVEMENT_QUARRY',					'YIELD_PRODUCTION',		1,					null,							'TECH_APPRENTICESHIP'),
	(642,	'IMPROVEMENT_QUARRY',					'YIELD_PRODUCTION',		1,					null,							'TECH_PREDICTIVE_SYSTEMS'),

	(650,	'IMPROVEMENT_MINE',						'YIELD_PRODUCTION',		1,					null,							'TECH_ENGINEERING'),
	(651,	'IMPROVEMENT_MINE',						'YIELD_PRODUCTION',		1,					null,							'TECH_APPRENTICESHIP'),
	(652,	'IMPROVEMENT_MINE',						'YIELD_PRODUCTION',		1,					null,							'TECH_INDUSTRIALIZATION'),
	(653,	'IMPROVEMENT_MINE',						'YIELD_PRODUCTION',		1,					null,							'TECH_SMART_MATERIALS'),

	(660,	'IMPROVEMENT_LUMBER_MILL',				'YIELD_PRODUCTION',		1,					null,							'TECH_CONSTRUCTION'),
	(661,	'IMPROVEMENT_LUMBER_MILL',				'YIELD_PRODUCTION',		1,					null,							'TECH_MACHINERY'),
	(662,	'IMPROVEMENT_LUMBER_MILL',				'YIELD_PRODUCTION',		1,					null,							'TECH_CIVIL_ENGINEERING_HD'),
	(663,	'IMPROVEMENT_LUMBER_MILL',				'YIELD_PRODUCTION',		1,					null,							'TECH_CYBERNETICS'),

	(670,	'IMPROVEMENT_FISHING_BOATS',			'YIELD_PRODUCTION',		1,					null,							'TECH_COMPASS_HD'),
	(671,	'IMPROVEMENT_FISHING_BOATS',			'YIELD_GOLD',			2,					null,							'TECH_STEAM_POWER'),
	(672,	'IMPROVEMENT_FISHING_BOATS',			'YIELD_FOOD',			1,					null,							'TECH_PLASTICS'),

	(700,	'IMPROVEMENT_OIL_WELL',					'YIELD_PRODUCTION',		2,					null,							'TECH_REFINING'),
	(701,	'IMPROVEMENT_OIL_WELL',					'YIELD_SCIENCE',		2,					null,							'TECH_REFINING'),
	(702,	'IMPROVEMENT_OFFSHORE_OIL_RIG',			'YIELD_PRODUCTION',		2,					null,							'TECH_REFINING'),
	(703,	'IMPROVEMENT_OFFSHORE_OIL_RIG',			'YIELD_SCIENCE',		2,					null,							'TECH_REFINING');

-- Prereq Tech / Civic
update Improvements set PrereqTech = 'TECH_POTTERY'					where ImprovementType = 'IMPROVEMENT_PLANTATION';
update Improvements set PrereqTech = 'TECH_MINING'					where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';
update Improvements set PrereqTech = 'TECH_MILITARY_ENGINEERING'	where ImprovementType = 'IMPROVEMENT_FORT';
update Improvements set PrereqTech = 'TECH_BIOLOGY_HD'				where ImprovementType = 'IMPROVEMENT_OIL_WELL';

-- Valid Features
insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType,					PrereqTech,			PrereqCivic)
values
	('IMPROVEMENT_CAMP',		'FEATURE_FOREST',				'TECH_ARCHERY',		null),
	('IMPROVEMENT_CAMP',		'FEATURE_JUNGLE',				null,				'CIVIC_GUILDS'),
	('IMPROVEMENT_LUMBER_MILL',	'FEATURE_JUNGLE',				null,				'CIVIC_GUILDS'),
	('IMPROVEMENT_FISHERY',		'FEATURE_REEF',					null,				null),
	('IMPROVEMENT_MINE',		'FEATURE_GEOTHERMAL_FISSURE',	'TECH_ENGINEERING',	null);
with I(ImprovementType) as (select ImprovementType from Improvements where ImprovementType in (
	'IMPROVEMENT_GREAT_WALL',
	'IMPROVEMENT_MISSION',
	'IMPROVEMENT_FORT',
	'IMPROVEMENT_ROMAN_FORT',
	'IMPROVEMENT_GOLF_COURSE',
	'IMPROVEMENT_MEKEWAP',
	'IMPROVEMENT_MOAI',
	'IMPROVEMENT_OPEN_AIR_MUSEUM',
	'IMPROVEMENT_ICE_HOCKEY_RINK',
	'IMPROVEMENT_MAHAVIHARA', 
	'IMPROVEMENT_TRADING_DOME',
	'IMPROVEMENT_BATEY',
	'IMPROVEMENT_HACIENDA',
	'IMPROVEMENT_PAIRIDAEZA',
	'IMPROVEMENT_MONASTERY',
	'IMPROVEMENT_ALCAZAR')),
F(FeatureType) as (select FeatureType from Features where FeatureType in (
	'FEATURE_FLOODPLAINS',
	'FEATURE_FLOODPLAINS_GRASSLAND',
	'FEATURE_FLOODPLAINS_PLAINS'))
insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType,					PrereqTech)
select
	ImprovementType,			FeatureType,					'TECH_BUTTRESS'
from I cross join F;
update Improvements set Description = '{' || Description || '}{LOC_IMPROVEMENT_BUTTRESS_ON_FLOODLANDS}'	where ImprovementType in (
	'IMPROVEMENT_GREAT_WALL',
	'IMPROVEMENT_MISSION',
	'IMPROVEMENT_FORT',
	'IMPROVEMENT_ROMAN_FORT',
	'IMPROVEMENT_GOLF_COURSE',
	'IMPROVEMENT_MEKEWAP',
	'IMPROVEMENT_MOAI',
	'IMPROVEMENT_OPEN_AIR_MUSEUM',
	'IMPROVEMENT_ICE_HOCKEY_RINK',
	'IMPROVEMENT_MAHAVIHARA', 
	'IMPROVEMENT_TRADING_DOME',
	'IMPROVEMENT_BATEY',
	'IMPROVEMENT_HACIENDA',
	'IMPROVEMENT_PAIRIDAEZA',
	'IMPROVEMENT_MONASTERY',
	'IMPROVEMENT_ALCAZAR'
);

-- Plunder Yield
update Improvements set PlunderType = 'PLUNDER_GOLD', PlunderAmount = 50 where ImprovementType = 'IMPROVEMENT_PLANTATION';
update Improvements set PlunderType = 'PLUNDER_GOLD', PlunderAmount = 50 where ImprovementType = 'IMPROVEMENT_QUARRY';
update Improvements set PlunderType = 'PLUNDER_HEAL' where ImprovementType = 'IMPROVEMENT_PASTURE';

-- Improvement Tourism
delete from Improvement_Tourism where ImprovementType in (
	'IMPROVEMENT_MINE',
	'IMPROVEMENT_ZIGGURAT',
	'IMPROVEMENT_SEASTEAD',
	'IMPROVEMENT_PASTURE',
	'IMPROVEMENT_PLANTATION'
);
insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqTech)
values
	('IMPROVEMENT_FORT',		'TOURISMSOURCE_CULTURE',	'TECH_FLIGHT');

insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqCivic)
select
	ImprovementType, 			'TOURISMSOURCE_GOLD',		'CIVIC_CAPITALISM'
from Improvements where ImprovementType in (
	'IMPROVEMENT_PLANTATION',
	'IMPROVEMENT_CAMP',
	'IMPROVEMENT_PASTURE',
	'IMPROVEMENT_LUMBER_MILL',
	'IMPROVEMENT_FISHING_BOATS',
	'IMPROVEMENT_MEKEWAP',
	'IMPROVEMENT_POLDER',
	'IMPROVEMENT_LAND_POLDER',
	'IMPROVEMENT_TRADING_DOME'
);
insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqTech)
select
	ImprovementType, 			'TOURISMSOURCE_SCIENCE',	'TECH_FLIGHT'
from Improvements where ImprovementType in (
	'IMPROVEMENT_MAHAVIHARA',
	'IMPROVEMENT_ALCAZAR',
	'IMPROVEMENT_MISSION',
	'IMPROVEMENT_ZIGGURAT'
);
insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqTech)
select
	ImprovementType, 			'TOURISMSOURCE_FAITH',		'TECH_FLIGHT'
from Improvements where ImprovementType in (
	'IMPROVEMENT_PYRAMID',
	'IMPROVEMENT_MONASTERY'
);
insert or replace into Improvement_Tourism
	(ImprovementType,			TourismSource,				PrereqTech)
select
	ImprovementType, 			'TOURISMSOURCE_PRODUCTION',	'TECH_FLIGHT'
from Improvements where ImprovementType in (
	'IMPROVEMENT_OUTBACK_STATION',
	'IMPROVEMENT_HACIENDA',
	'IMPROVEMENT_SEASTEAD'
);

-- Misc
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierID)
values
	('IMPROVEMENT_PLANTATION',	'PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_GOLD'),
	('IMPROVEMENT_PLANTATION',	'PLANTATION_AQUEDUCT_NO_FEUDALISM_GOLD'),
	-- ('IMPROVEMENT_MINE',		'MINE_ON_HILL_PRODUCTION_MODIFIER'),
	('IMPROVEMENT_MINE',		'MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION');
	-- ('IMPROVEMENT_MINE',		'MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER');

insert or replace into Modifiers
	(ModifierId,											ModifierType,								SubjectRequirementSetId)
values
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_GOLD',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_IS_ADJACENT_TO_FRESH_WATER_NOT_AQUEDUCT_NO_FEUDALISM'),
	('PLANTATION_AQUEDUCT_NO_FEUDALISM_GOLD',				'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'IS_ADJACENT_TO_AQUEDUCT_NO_FEUDALISM'),
	-- ('MINE_ADJACENT_TO_INDUSTRIAL_ZONE_MODIFIER',		'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO_INDUSTRIAL_ZONE'),
	('MINE_ADJACENT_TO_MOUNTAIN_NO_APPRENTICE_PRODUCTION',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO_MOUNTAIN_NO_APPRENTICESHIP');
	-- ('MINE_ADJACENT_TO_MOUNTAIN_APPRENTICESHIP_MODIFIER',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'HAS_APPRENTICESHIP_AND_PLOT_ADJACENT_TO_MOUNTAIN');

insert or replace into ModifierArguments
	(ModifierId,											Name,		Value)
values
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_GOLD',	'YieldType',	'YIELD_GOLD'),
	('PLANTATION_FRESH_WATER_NO_AQUEDUCT_FEUDALISM_GOLD',	'Amount',		2),
	('PLANTATION_AQUEDUCT_NO_FEUDALISM_GOLD',				'YieldType',	'YIELD_GOLD'),
	('PLANTATION_AQUEDUCT_NO_FEUDALISM_GOLD',				'Amount',		2),
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
update Improvements set ValidAdjacentTerrainAmount = 2, PrereqTech = 'TECH_COMPASS_HD', PrereqCivic = null where ImprovementType = 'IMPROVEMENT_POLDER';
delete from Improvement_BonusYieldChanges where ImprovementType = 'IMPROVEMENT_POLDER';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_BIOLOGY_HD' where ID = 'Polder_Polder_Food_Early';
update Adjacency_YieldChanges set PrereqTech = 'TECH_BIOLOGY_HD' where ID = 'Polder_Polder_Food_Late';
update Adjacency_YieldChanges set PrereqTech = 'TECH_MASS_PRODUCTION' where ID = 'Polder_Polder_Production';

insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType)
values
	('IMPROVEMENT_POLDER',		'FEATURE_REEF');

insert or replace into Improvement_Adjacencies
	(ImprovementType,			YieldChangeId)
values
	('IMPROVEMENT_POLDER',		'HD_POLDER_GOLD');

insert or replace into Adjacency_YieldChanges
	(ID,							Description,	YieldType,			YieldChange,	TilesRequired,	AdjacentImprovement,		PrereqCivic,	PrereqTech,					ObsoleteCivic,	ObsoleteTech)
values
	('HD_POLDER_GOLD',				'Placeholder',	'YIELD_GOLD',		2,				1,				'IMPROVEMENT_POLDER',		null,			'TECH_CIVIL_ENGINEERING_HD',null,			null);

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
	('IMPROVEMENT_LAND_POLDER',	'LOC_IMPROVEMENT_LAND_POLDER_NAME',	'TECH_BUTTRESS',	null,				1,			'LOC_IMPROVEMENT_LAND_POLDER_DESCRIPTION',	'PLUNDER_FAITH',	25,				'ICON_IMPROVEMENT_LAND_POLDER',	'TRAIT_CIVILIZATION_IMPROVEMENT_LAND_POLDER',	1,			2,				2);

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
	('HD_LAND_POLDER_FOOD_EARLY',	'Placeholder',	'YIELD_FOOD',		1,				1,				'IMPROVEMENT_LAND_POLDER',	null,			null,						null,			'TECH_BIOLOGY_HD'),
	('HD_LAND_POLDER_FOOD_LATE',	'Placeholder',	'YIELD_FOOD',		2,				1,				'IMPROVEMENT_LAND_POLDER',	null,			'TECH_BIOLOGY_HD',			null,			null),
	('HD_LAND_POLDER_PRODUCTION',	'Placeholder',	'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_LAND_POLDER',	null,			'TECH_MACHINERY',			null,			null),
	('HD_LAND_POLDER_GOLD',			'Placeholder',	'YIELD_GOLD',		2,				1,				'IMPROVEMENT_LAND_POLDER',	null,			'TECH_CIVIL_ENGINEERING_HD',null,			null);

insert or replace into MomentIllustrations
	(MomentIllustrationType,						MomentDataType,					GameDataType,					Texture)
values
	('MOMENT_ILLUSTRATION_UNIQUE_IMPROVEMENT',		'MOMENT_DATA_IMPROVEMENT',		'IMPROVEMENT_LAND_POLDER',		'Moment_Infrastructure_Netherlands.dds');
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
-- 陆地圩田改良特定资源
insert or replace into Improvement_ValidResources
	(ImprovementType,			ResourceType)
select
	'IMPROVEMENT_LAND_POLDER',	ResourceType
from Resources where ResourceType in ('RESOURCE_SUGAR','RESOURCE_SAFFRON','RESOURCE_P0K_PAPYRUS');

--移除雨林前移到采矿
update Features set RemoveTech = 'TECH_MINING' where FeatureType = 'FEATURE_JUNGLE';
--种树前移到工会，越南到神秘主义
update Features set AddCivic = 'CIVIC_GUILDS' where FeatureType = 'FEATURE_FOREST';

update Technologies set Description = null where TechnologyType = 'TECH_SANITATION';