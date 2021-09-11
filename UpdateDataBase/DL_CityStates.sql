-------------------------------------
--     Citystates Adjustment     --
-------------------------------------

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
-- update Improvement_YieldChanges set YieldChange = 3 where ImprovementType ='IMPROVEMENT_ALCAZAR';

-- Nalanda
delete from TraitModifiers where TraitType = 'MINOR_CIV_NALANDA_TRAIT' and ModifierId = 'MINOR_CIV_NALANDA_FREE_TECHNOLOGY';
update Improvement_YieldChanges set YieldChange = 3 where ImprovementType = 'IMPROVEMENT_MAHAVIHARA' and YieldType = 'YIELD_SCIENCE';
update Adjacency_YieldChanges  set YieldType = 'YIELD_SCIENCE' where ID = 'Mahavihara_Holy_Site_Faith';
update Adjacency_YieldChanges  set YieldType = 'YIELD_SCIENCE' where ID = 'Mahavihara_Lavra_Faith';
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

--Caguana
update Adjacency_YieldChanges set ObsoleteCivic = 'CIVIC_HUMANISM' where ID = 'Batey_EntertainmentComplexAdjacency' or ID = 'Batey_BonusResourceAdjacency';
update Adjacency_YieldChanges set PrereqCivic = 'CIVIC_HUMANISM' where ID = 'Batey_LateEntertainmentComplexAdjacency' or ID = 'Batey_LateBonusResourceAdjacency';

insert into TraitModifiers 
    (TraitType,                                  ModifierId)
values
	--Lisbon  
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_INTERCONTINENTAL_INTERNATIONAL_GOLD1'),
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD1'),
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION1'),
	--Fez
	('MINOR_CIV_FEZ_TRAIT',				         'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE'),
	('MINOR_CIV_FEZ_TRAIT',				         'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE'),
	('MINOR_CIV_FEZ_TRAIT',				         'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING');

insert into Modifiers
	(ModifierId,										ModifierType,									    SubjectRequirementSetId)
values
    --Bandar Seri Begawan(Jakarta)
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',	        'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'PLOT_IS_OR_ADJACENT_TO_COAST'),
	--Lisbon
	('TRAIT_INTERCONTINENTAL_INTERNATIONAL_GOLD1',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_INTERCONTINENTAL_DOMESTIC_FOOD1',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_INTERCONTINENTAL_DOMESTIC_PRODUCTION1',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	--Fez
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE',          'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE',          'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	        'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1',         'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',  'BUILDING_IS_SHRINE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1',         'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',  'BUILDING_IS_TEMPLE_XP2'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'BUILDING_IS_TIER3_HOLY_SITE');

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
	--Fez
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE',          'ModifierId',    'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE',          'ModifierId',	 'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING', 'ModifierId', 'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1',          'YieldType',	 'YIELD_SCIENCE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1',          'Amount',	     2),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1',          'YieldType',	 'YIELD_SCIENCE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1',          'Amount',	     2),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1', 'YieldType', 'YIELD_SCIENCE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1', 'Amount',    2);

-- Cardiff
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_LIGHTHOUSE' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_SHIPYARD' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_SEAPORT' and Name = 'Amount';

--普雷斯拉夫军营及军营建筑+2科技
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_UNIQUE_INFLUENCE_BARRACKS_STABLE_IDENTITY_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_UNIQUE_INFLUENCE_ARMORY_IDENTITY_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_UNIQUE_INFLUENCE_MILITARY_ACADEMY_IDENTITY_BONUS';
/*insert into TraitModifiers 
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
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS1',			'Amount',	     	10);*/

insert into TraitModifiers 
    (TraitType,                                 	 ModifierId)
values
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_BARRACKS_STABLE_SCIENCE_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_ARMORY_SCIENCE_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_MILITARY_ACADEMY_SCIENCE_BONUS');
insert into Modifiers
	(ModifierId,													ModifierType,									   			 SubjectRequirementSetId)
values
	('MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE_BONUS',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            		'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_SCIENCE_BONUS',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            		'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_ARMORY_SCIENCE_BONUS',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            		'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_SCIENCE_BONUS',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	        			'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE_BONUS1',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			'CITY_HAS_ENCAMPMENT'),
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_SCIENCE_BONUS1',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			'BUILDING_IS_BARRACKS_STABLE_MILITARITIC_CITY_STATE'),
	('MINOR_CIV_PRESLAV_ARMORY_SCIENCE_BONUS1',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 			'BUILDING_IS_ARMORY'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_SCIENCE_BONUS1',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 			'BUILDING_IS_MILITARY_ACADEMY');
insert into ModifierArguments
	(ModifierId,													Name,				 Value)
values
	('MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE_BONUS',     				'ModifierId',		'MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE_BONUS1'),
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_SCIENCE_BONUS',     		'ModifierId',		'MINOR_CIV_PRESLAV_BARRACKS_STABLE_SCIENCE_BONUS1'),
	('MINOR_CIV_PRESLAV_ARMORY_SCIENCE_BONUS',      				'ModifierId',		'MINOR_CIV_PRESLAV_ARMORY_SCIENCE_BONUS1'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_SCIENCE_BONUS', 			'ModifierId', 		'MINOR_CIV_PRESLAV_MILITARY_ACADEMY_SCIENCE_BONUS1'),
	('MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE_BONUS1',					'YieldType',	 	'YIELD_SCIENCE'),
	('MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE_BONUS1',					'Amount',	     	2),
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_SCIENCE_BONUS1',			'YieldType',	 	'YIELD_SCIENCE'),
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_SCIENCE_BONUS1',			'Amount',	     	2),
	('MINOR_CIV_PRESLAV_ARMORY_SCIENCE_BONUS1',						'YieldType',	 	'YIELD_SCIENCE'),
	('MINOR_CIV_PRESLAV_ARMORY_SCIENCE_BONUS1',						'Amount',	     	2),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_SCIENCE_BONUS1',			'YieldType',	 	'YIELD_SCIENCE'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_SCIENCE_BONUS1',			'Amount',	     	2);

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

--Nan Madol
update Modifiers set SubjectRequirementSetId = 'NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST' where ModifierId = 'MINOR_CIV_NAN_MADOL_DISTRICTS_CULTURE_BONUS';

insert or replace into RequirementSets
	(RequirementSetId,			RequirementSetType)
values
	('NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST','REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,					RequirementId)
values
	('NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST', 'REQUIRES_DISTRICT_IS_NOT_CITY_CENTER'),
	('NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST',	'PLOT_IS_OR_ADJACENT_TO_COAST_REQUIREMENTS');

insert or replace into Requirements(RequirementId, RequirementType)values
	('PLOT_IS_OR_ADJACENT_TO_COAST_REQUIREMENTS','REQUIREMENT_REQUIREMENTSET_IS_MET');
insert or replace into RequirementArguments(RequirementId,Name,Value)values
	('PLOT_IS_OR_ADJACENT_TO_COAST_REQUIREMENTS','RequirementSetId','PLOT_IS_OR_ADJACENT_TO_COAST');

-- Kabul
update ModifierArguments set Value = 50 where ModifierId = 'MINOR_CIV_KABUL_UNIT_EXPERIENCE_BONUS' and Name = 'Amount';

-- 阿卡德改为：可用信仰购买支援单位，且为陆地军事单位提供护送能力。
-- Akkad
delete from TraitModifiers where TraitType = 'MINOR_CIV_AKKAD_TRAIT';
-- 	-- MINOR_CIV_AKKAD_UNIQUE_INFLUENCE_BONUS_MELEE
-- 	-- MINOR_CIV_AKKAD_UNIQUE_INFLUENCE_BONUS_ANTI_CAVALRY

insert or replace into TraitModifiers
	(TraitType,					ModifierId)
values
 	('MINOR_CIV_AKKAD_TRAIT',	'MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT'),
	('MINOR_CIV_AKKAD_TRAIT',	'MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT');

insert or replace into Modifiers	
	(ModifierId,													ModifierType,											SubjectRequirementSetId)
values
	('MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT_MODIFIER',				'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE',	NULL),
	('MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT_MODIFIER',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',					NULL);	

insert or replace into ModifierArguments
	(ModifierId,													Name,				Value)
values
	('MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT',						'ModifierId',		'MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT_MODIFIER'),
	('MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT_MODIFIER',				'Tag',				'CLASS_SUPPORT'),
	('MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',				'ModifierId',		'MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT_MODIFIER'),
	('MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT_MODIFIER',	'AbilityType',		'ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT');

insert or replace into Types
	(Type,													Kind)
values
	('ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		'KIND_ABILITY');

insert or replace into TypeTags		(Type,					Tag)
select 'ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		Tag from TypeTags where Type = 'ABILITY_WOLIN_LAND_UNITS';

insert or replace into UnitAbilities (UnitAbilityType, Inactive) values	
	('ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',  1);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
	('ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		'ESCORT_MOBILITY_SHARED_MOVEMENT');

-- La venta
insert or replace into Improvement_ValidFeatures
	(ImprovementType,				FeatureType)
values
	('IMPROVEMENT_COLOSSAL_HEAD',	'FEATURE_FOREST'),
	('IMPROVEMENT_COLOSSAL_HEAD',	'FEATURE_JUNGLE');

delete from Improvement_ValidFeatures where ImprovementType = 'IMPROVEMENT_COLOSSAL_HEAD' and FeatureType = 'FEATURE_VOLCANIC_SOIL';
delete from Improvement_ValidTerrains where ImprovementType = 'IMPROVEMENT_COLOSSAL_HEAD';
