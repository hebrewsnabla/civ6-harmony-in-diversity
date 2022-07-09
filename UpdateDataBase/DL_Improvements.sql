-- Basic Yield
delete from Improvement_YieldChanges where
	(ImprovementType = 'IMPROVEMENT_FISHING_BOATS'	and YieldType = 'YIELD_FOOD') or
	(ImprovementType = 'IMPROVEMENT_PLANTATION'		and YieldType = 'YIELD_GOLD') or
	(ImprovementType = 'IMPROVEMENT_CAMP'			and YieldType = 'YIELD_GOLD') or

	(ImprovementType = 'IMPROVEMENT_MEKEWAP'		and YieldType = 'YIELD_PRODUCTION');
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
	('IMPROVEMENT_OFFSHORE_OIL_RIG',	'YIELD_SCIENCE',		1),
	
	('IMPROVEMENT_COLOSSAL_HEAD',		'YIELD_FAITH',			1),
	('IMPROVEMENT_MOAI',				'YIELD_CULTURE',		2),
	
	('IMPROVEMENT_MEKEWAP',				'YIELD_GOLD',			2);

-- Bonus Yield
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

-- Adjacency Yield
delete from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_MAHAVIHARA';
insert or replace into Improvement_Adjacencies
	(ImprovementType,				YieldChangeId)
values
	('IMPROVEMENT_LUMBER_MILL',		'Lumber_Mill_River_Production'),
	('IMPROVEMENT_LUMBER_MILL',		'Lumber_Mill_Industrial_Production'),
	('IMPROVEMENT_MINE',			'Mine_Industrial_Production'),
	('IMPROVEMENT_QUARRY',			'Quarry_Industrial_Production'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Commercial_Gold'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Suguba_Gold'),
	('IMPROVEMENT_PASTURE',			'Pasture_Commercial_Gold'),
	('IMPROVEMENT_PASTURE',			'Pasture_Suguba_Gold'),
	('IMPROVEMENT_CAMP',			'Camp_Commercial_Gold'),
	('IMPROVEMENT_CAMP',			'Camp_Suguba_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Harbor_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Royal_Navy_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Cothon_Gold'),

	('IMPROVEMENT_MAHAVIHARA',		'Mahavihara_Seowon_Science_Early'),
	('IMPROVEMENT_MAHAVIHARA',		'Mahavihara_Seowon_Science_Late'),
	('IMPROVEMENT_MAHAVIHARA',		'Mahavihara_Holy_Site_Science_Late'),
	('IMPROVEMENT_MAHAVIHARA',		'Mahavihara_Lavra_Science_Late'),
	('IMPROVEMENT_MAHAVIHARA',		'Mahavihara_Neighborhood_Science'),
	('IMPROVEMENT_MAHAVIHARA',		'Mahavihara_Mbanza_Science'),
	
	('IMPROVEMENT_MEKEWAP',			'Mekewap_Luxury_Production'),
	('IMPROVEMENT_MEKEWAP',			'Mekewap_Strategic_Production');
insert or replace into Adjacency_YieldChanges
	(ID,									Description,	YieldType,			YieldChange,	AdjacentDistrict)
values
	('Lumber_Mill_Industrial_Production',	'Placeholder',	'YIELD_PRODUCTION',	1,				'DISTRICT_INDUSTRIAL_ZONE'),
	('Mine_Industrial_Production',			'Placeholder',	'YIELD_PRODUCTION',	1,				'DISTRICT_INDUSTRIAL_ZONE'),
	('Quarry_Industrial_Production',		'Placeholder',	'YIELD_PRODUCTION',	1,				'DISTRICT_INDUSTRIAL_ZONE'),
	('Plantation_Commercial_Gold', 			'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_COMMERCIAL_HUB'),
	('Plantation_Suguba_Gold', 				'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_SUGUBA'),
	('Pasture_Commercial_Gold', 			'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_COMMERCIAL_HUB'),
	('Pasture_Suguba_Gold', 				'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_SUGUBA'),
	('Camp_Commercial_Gold', 				'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_COMMERCIAL_HUB'),
	('Camp_Suguba_Gold', 					'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_SUGUBA'),
	('Fishing_Boats_Harbor_Gold', 			'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_HARBOR'),
	('Fishing_Boats_Royal_Navy_Gold', 		'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_ROYAL_NAVY_DOCKYARD'),
	('Fishing_Boats_Cothon_Gold', 			'Placeholder',	'YIELD_GOLD',		2,				'DISTRICT_COTHON');
insert or replace into Adjacency_YieldChanges
	(ID,									Description,	YieldType,			YieldChange,	AdjacentRiver,	AdjacentDistrict,			OtherDistrictAdjacent,	AdjacentResourceClass, 		PrereqCivic,			ObsoleteCivic,			PrereqTech,				ObsoleteTech)
values	
	('Lumber_Mill_River_Production', 		'Placeholder',	'YIELD_PRODUCTION',	1,				1,				null,						null,					'NO_RESOURCECLASS',			null,					null,					'TECH_BRONZE_WORKING',	'TECH_MACHINERY'),

	('Mahavihara_Seowon_Science_Early', 	'Placeholder',	'YIELD_SCIENCE',	1,				0,				'DISTRICT_SEOWON',			null,					'NO_RESOURCECLASS',			null,					'CIVIC_DIVINE_RIGHT',	null,					null),
	('Mahavihara_Seowon_Science_Late', 		'Placeholder',	'YIELD_SCIENCE',	2,				0,				'DISTRICT_SEOWON',			null,					'NO_RESOURCECLASS',			'CIVIC_DIVINE_RIGHT',	null,					null,					null),
	('Mahavihara_Holy_Site_Science_Late', 	'Placeholder',	'YIELD_SCIENCE',	2,				0,				'DISTRICT_HOLY_SITE',		null,					'NO_RESOURCECLASS',			'CIVIC_DIVINE_RIGHT',	null,					null,					null),
	('Mahavihara_Lavra_Science_Late', 		'Placeholder',	'YIELD_SCIENCE',	2,				0,				'DISTRICT_LAVRA',			null,					'NO_RESOURCECLASS',			'CIVIC_DIVINE_RIGHT',	null,					null,					null),
	('Mahavihara_Neighborhood_Science', 	'Placeholder',	'YIELD_SCIENCE',	1,				0,				'DISTRICT_NEIGHBORHOOD',	null,					'NO_RESOURCECLASS',			null,					null,					null,					null),
	('Mahavihara_Mbanza_Science', 			'Placeholder',	'YIELD_SCIENCE',	1,				0,				'DISTRICT_MBANZA',			null,					'NO_RESOURCECLASS',			null,					null,					null,					null),

	('Mekewap_Luxury_Production', 			'Placeholder',	'YIELD_PRODUCTION',	1,				0,				null,						null,					'RESOURCECLASS_LUXURY',		null,					null,					null,					null),
	('Mekewap_Strategic_Production', 		'Placeholder',	'YIELD_PRODUCTION',	1,				0,				null,						null,					'RESOURCECLASS_STRATEGIC',	null,					null,					null,					null),

	('Golf_District_Culture',				'placeholder',	'YIELD_CULTURE',	1, 				0,				null,						1,						'NO_RESOURCECLASS',			'CIVIC_HUMANISM',		null,					null,					null);

-- Prereq Tech / Civic
update Improvements set PrereqTech = 'TECH_POTTERY'					where ImprovementType = 'IMPROVEMENT_PLANTATION';
update Improvements set PrereqTech = 'TECH_MINING'					where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';
update Improvements set PrereqTech = 'TECH_MILITARY_ENGINEERING'	where ImprovementType = 'IMPROVEMENT_FORT';
update Improvements set PrereqTech = 'TECH_BIOLOGY_HD'				where ImprovementType = 'IMPROVEMENT_OIL_WELL';

-- Valid Features
insert or replace into Improvement_ValidFeatures
	(ImprovementType,				FeatureType,					PrereqTech,			PrereqCivic)
values
	('IMPROVEMENT_CAMP',			'FEATURE_FOREST',				'TECH_ARCHERY',		null),
	('IMPROVEMENT_CAMP',			'FEATURE_JUNGLE',				null,				'CIVIC_GUILDS'),
	('IMPROVEMENT_LUMBER_MILL',		'FEATURE_JUNGLE',				null,				'CIVIC_GUILDS'),
	('IMPROVEMENT_MINE',			'FEATURE_GEOTHERMAL_FISSURE',	'TECH_ENGINEERING',	null),
	('IMPROVEMENT_FISHERY',			'FEATURE_REEF',					null,				null),

	('IMPROVEMENT_COLOSSAL_HEAD',	'FEATURE_FOREST',				null,				null),
	('IMPROVEMENT_COLOSSAL_HEAD',	'FEATURE_JUNGLE',				null,				null),

	('IMPROVEMENT_MEKEWAP',			'FEATURE_FOREST',				'TECH_MINING',		null);
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

-- City State UI
-- Cahokia Mounds
update Modifiers set SubjectRequirementSetId = null, SubjectStackLimit = 2 where ModifierId = 'MOUND_AMENITY_MAX_ONE';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_MOUND' and (ModifierId = 'MOUND_AMENITY_MAX_TWO' or ModifierId = 'MOUND_HOUSING');
update Adjacency_YieldChanges set TilesRequired = 1, PrereqCivic = null, ObsoleteTech = null, ObsoleteCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD' where ID = 'Mound_MedievalAdjacency';
update Adjacency_YieldChanges set YieldChange = 2, PrereqTech = null, PrereqCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD' where ID = 'Mound_MechanizedAdjacency';

-- Alcázar
update Improvements set YieldFromAppealPercent = 100 where ImprovementType ='IMPROVEMENT_ALCAZAR';

-- Moai
insert or replace into Improvement_ValidResources
	(ImprovementType,	ResourceType,	MustRemoveFeature)
select
	'IMPROVEMENT_MOAI', ResourceType,	0
from Resources where Frequency > 0;
update Improvement_Tourism set PrereqTech = null where ImprovementType = 'IMPROVEMENT_MOAI';

-- Nazca Line
update Improvements set SameAdjacentValid = 0 where ImprovementType = 'IMPROVEMENT_NAZCA_LINE';
update ModifierArguments set Value = 'YIELD_FOOD' where ModifierId = 'NAZCA_LINE_ADJACENCY_FAITH' and Name = 'YieldType';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_NAZCA_LINE' and ModifierId in (
	'NAZCA_LINE_ADJACENCY_FOOD_DESERT_CIVIL_SERVICE',
	'NAZCA_LINE_ADJACENCY_FOOD_DESERT_HILLS_CIVIL_SERVICE',
	'NAZCA_LINE_ADJACENCY_PRODUCTION_FLAT_MASS_PRODUCTION');
insert or replace into ImprovementModifiers
 	(ImprovementType,			ModifierId)
values
	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_FRESH_WATER'),
	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_ENGINEERING_ADJACENCY_FOOD'),
	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_MASS_PRODUCTION_ADJACENCY_PRODUCTION');
insert or replace into GameModifiers
	(ModifierId)
values
	('NAZCA_LINE_HOLY_SITE_ADJACENCY'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE'),
	('NAZCA_LINE_THEATER_ADJACENCY'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE');
insert or replace into Modifiers
 	(ModifierId,											ModifierType,											SubjectRequirementSetId,									SubjectStackLimit)
values
	('NAZCA_LINE_FRESH_WATER',								'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_HOUSING',	'REQUIRE_PLOT_ADJACENT_TO_OWNER',							1),
	('NAZCA_LINE_ENGINEERING_ADJACENCY_FOOD',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	    			'PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_ENGINEERING',		null),
	('NAZCA_LINE_MASS_PRODUCTION_ADJACENCY_PRODUCTION',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_MASS_PRODUCTION',	null),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_NO_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_NO_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_THEATER_ADJACENCY',						'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_NO_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',			'PLAYER_HAS_CIVIC_NATURAL_HISTORY_REQUIREMENTS',			null);
insert or replace into ModifierArguments
	(ModifierId,											Name,			        Value)
values
	('NAZCA_LINE_FRESH_WATER',								'Amount',				2),
	('NAZCA_LINE_ENGINEERING_ADJACENCY_FOOD',				'YieldType',			'YIELD_FOOD'),
	('NAZCA_LINE_ENGINEERING_ADJACENCY_FOOD',				'Amount',				1),
	('NAZCA_LINE_MASS_PRODUCTION_ADJACENCY_PRODUCTION',		'YieldType',			'YIELD_PRODUCTION'),
	('NAZCA_LINE_MASS_PRODUCTION_ADJACENCY_PRODUCTION',		'Amount',				1),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'DistrictType',			'DISTRICT_HOLY_SITE'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'YieldType',			'YIELD_FAITH'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'Amount',				1),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY',						'Description',			'LOC_NAZCA_LINE_HOLY_SITE_ADJACENCY_DESCRIPTION'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'DistrictType',			'DISTRICT_HOLY_SITE'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'YieldType',			'YIELD_FAITH'),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'Amount',				2),
	('NAZCA_LINE_HOLY_SITE_ADJACENCY_LATE',					'Description',			'LOC_NAZCA_LINE_HOLY_SITE_ADJACENCY_DESCRIPTION'),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'DistrictType',			'DISTRICT_CAMPUS'),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'YieldType',			'YIELD_SCIENCE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'Amount',				1),
	('NAZCA_LINE_CAMPUS_ADJACENCY',							'Description',			'LOC_NAZCA_LINE_CAMPUS_ADJACENCY_DESCRIPTION'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'DistrictType',			'DISTRICT_CAMPUS'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'YieldType',			'YIELD_SCIENCE'),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'Amount',				2),
	('NAZCA_LINE_CAMPUS_ADJACENCY_LATE',					'Description',			'LOC_NAZCA_LINE_CAMPUS_ADJACENCY_LATE_DESCRIPTION'),
	('NAZCA_LINE_THEATER_ADJACENCY',						'DistrictType',			'DISTRICT_THEATER'),
	('NAZCA_LINE_THEATER_ADJACENCY',						'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_THEATER_ADJACENCY',						'YieldType',			'YIELD_CULTURE'),
	('NAZCA_LINE_THEATER_ADJACENCY',						'Amount',				1),
	('NAZCA_LINE_THEATER_ADJACENCY',						'Description',			'LOC_NAZCA_LINE_THEATER_ADJACENCY_DESCRIPTION'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'DistrictType',			'DISTRICT_THEATER'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'ImprovementType',		'IMPROVEMENT_NAZCA_LINE'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'YieldType',			'YIELD_CULTURE'),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'Amount',				2),
	('NAZCA_LINE_THEATER_ADJACENCY_LATE',					'Description',			'LOC_NAZCA_LINE_THEATER_ADJACENCY_LATE_DESCRIPTION');
insert or replace into RequirementSets
	(RequirementSetId,											RequirementSetType)
values
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_ENGINEERING',		'REQUIREMENTSET_TEST_ALL'),
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_MASS_PRODUCTION',	'REQUIREMENTSET_TEST_ALL');
insert or replace into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_ENGINEERING',		'ADJACENT_TO_OWNER'),
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_ENGINEERING',		'HD_REQUIRES_PLAYER_HAS_TECH_ENGINEERING'),
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_MASS_PRODUCTION',	'ADJACENT_TO_OWNER'),
	('PLOT_ADJACENT_TO_OWNER_AND_PLAYER_HAS_MASS_PRODUCTION',	'HD_REQUIRES_PLAYER_HAS_TECH_MASS_PRODUCTION');

-- Mahavihara
delete from TraitModifiers where TraitType = 'MINOR_CIV_NALANDA_TRAIT' and ModifierId = 'MINOR_CIV_NALANDA_FREE_TECHNOLOGY';
update Adjacency_YieldChanges set PrereqTech = null, PrereqCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Mahavihara_Campus_Science_Late' or ID = 'Mahavihara_Observatory_Science_Late';
update Adjacency_YieldChanges set ObsoleteTech = null, ObsoleteCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Mahavihara_Campus_Science_Early' or ID = 'Mahavihara_Observatory_Science_Early';
update Adjacency_YieldChanges set YieldType = 'YIELD_SCIENCE', ObsoleteCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Mahavihara_Holy_Site_Faith';
update Adjacency_YieldChanges set YieldType = 'YIELD_SCIENCE', ObsoleteCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Mahavihara_Lavra_Faith';

-- Civilization UI
-- Mekewap
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_MEKEWAP' and ModifierId = 'MEKEWAP_LUXURY_GOLD';
update ModifierArguments set Value = 'YIELD_PRODUCTION' where ModifierId = 'MEKEWAP_LUXURY_GOLD' and Name = 'YieldType';
update Adjacency_YieldChanges set PrereqCivic = null where ID = 'Mekewap_SecondBonusAdjacency';
delete from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_MEKEWAP' and YieldChangeId = 'Mekewap_FirstBonusAdjacency';

-- Kurgan
insert or replace into ImprovementModifiers
	(ImprovementType,		ModifierId)
values
	('IMPROVEMENT_KURGAN',	'KURGAN_PASTURE_FAITH'),
	('IMPROVEMENT_KURGAN',	'KURGAN_PURCHASE_LIGHT_CAVALRY'),
	('IMPROVEMENT_KURGAN',	'KURGAN_PURCHASE_HEAVY_CAVALRY');
insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,		ModifierId,					AttachmentTargetType)
select
	GreatPersonIndividualType,		'KURGAN_GENERAL_FAITH',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'
from GreatPersonIndividuals where GreatPersonClassType = 'GREAT_PERSON_CLASS_GENERAL';
insert or replace into Modifiers
	(ModifierId,						ModifierType,										SubjectRequirementSetId)
values
	('KURGAN_PASTURE_FAITH',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_PASTURE_AND_ADJACENT_TO_OWNER'),
	('KURGAN_PURCHASE_LIGHT_CAVALRY',	'MODIFIER_SINGLE_CITY_ENABLE_UNIT_FAITH_PURCHASE',	null),
	('KURGAN_PURCHASE_HEAVY_CAVALRY',	'MODIFIER_SINGLE_CITY_ENABLE_UNIT_FAITH_PURCHASE',	null),
	('KURGAN_GENERAL_FAITH',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'PLOT_HAS_IMPROVEMENT_KURGAN_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,						Name,			Value)
values
	('KURGAN_PASTURE_FAITH',			'YieldType',	'YIELD_FAITH'),
	('KURGAN_PASTURE_FAITH',			'Amount',		1),
	('KURGAN_PURCHASE_LIGHT_CAVALRY',	'Tag',			'CLASS_LIGHT_CAVALRY'),
	('KURGAN_PURCHASE_HEAVY_CAVALRY',	'Tag',			'CLASS_HEAVY_CAVALRY'),
	('KURGAN_GENERAL_FAITH',			'YieldType',	'YIELD_FAITH'),
	('KURGAN_GENERAL_FAITH',			'Amount',		2);
insert or replace into RequirementSets
	(RequirementSetId,							RequirementSetType)
values
	('PLOT_HAS_PASTURE_AND_ADJACENT_TO_OWNER',	'REQUIREMENTSET_TEST_ALL');
insert or replace into RequirementSetRequirements
	(RequirementSetId,							RequirementId)
values
	('PLOT_HAS_PASTURE_AND_ADJACENT_TO_OWNER',	'ADJACENT_TO_OWNER'),
	('PLOT_HAS_PASTURE_AND_ADJACENT_TO_OWNER',	'REQUIRES_PLOT_HAS_IMPROVEMENT_PASTURE');
/*
insert or replace into Adjacency_YieldChanges
	(ID,	Description,	YieldType,	YieldChange,	TilesRequired,	AdjacentImprovement)
values
	('Pasture_Kurgan_Faith',	'Placeholder',	'YIELD_FAITH',	1,	1,	'IMPROVEMENT_KURGAN');
insert into Improvement_Adjacencies
	(ImprovementType,		YieldChangeId)
values
	('IMPROVEMENT_PASTURE',	'Pasture_Kurgan_Faith');
*/
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