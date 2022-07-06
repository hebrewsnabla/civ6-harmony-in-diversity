-------------------------------------
--     Citystates Adjustment     --
-------------------------------------

-- Minor Civs, City states
---------------------------------------------------------------------------------------------------------
-- Individuals


---------------------------------------------------------------------------------------------------------
-- ANTANANARIVO--塔娜
update GlobalParameters set Value = 10 where Name = 'YIELD_MODIFIER_PER_EARNED_GREAT_PERSON_MAXIMUM';


---------------------------------------------------------------------------------------------------------
-- Valletta瓦莱塔
--insert or replace into TraitModifiers 
--	(TraitType,						ModifierId)
--select 'MINOR_CIV_VALLETTA_TRAIT',	'MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_'||BuildingType||'_BONUS'
--from Buildings where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is NULL;

--insert or replace into Modifiers 
--	(ModifierId,															ModifierType,											SubjectRequirementSetId)
--select 'MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_'||BuildingType||'_BONUS',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'
--from Buildings where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is NULL;
--insert or replace into Modifiers 
--	(ModifierId,															ModifierType,											SubjectRequirementSetId)
--select 'MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_'||BuildingType||'_BONUS1',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PURCHASE_COST',NULL
--from Buildings where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is NULL;

--insert or replace into	ModifierArguments
--	(ModifierId, 															Name,			Value)
--select 'MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_'||BuildingType||'_BONUS',		'ModifierId',	'MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_'||BuildingType||'_BONUS1'
--from Buildings where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is NULL;
--insert or replace into	ModifierArguments
--	(ModifierId, 															Name,			Value)
--select 'MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_'||BuildingType||'_BONUS1',	'BuildingType',	BuildingType 
--from Buildings where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is NULL;
--insert or replace into	ModifierArguments
--	(ModifierId, 															Name,			Value)
--select 'MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_'||BuildingType||'_BONUS1',	'Amount',			20
--from Buildings where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is NULL;

---------------------------------------------------------------------------------------------------------
-- Rapa nui, opinion: only plots adjacent to coast/lake can build moai, but cannot enable the placement on VOLCANIC_SOIL.
--delete from Improvement_InvalidAdjacentFeatures where ImprovementType = 'IMPROVEMENT_MOAI';
update Improvements set ValidAdjacentTerrainAmount = 1 where ImprovementType = 'IMPROVEMENT_MOAI';
--insert or replace into Improvement_ValidAdjacentTerrains (ImprovementType, TerrainType) values
--	('IMPROVEMENT_MOAI', 'TERRAIN_COAST');
update Improvement_YieldChanges set ImprovementType = IMPROVEMENT_MOAI WHERE YieldChange = 2
update Adjacency_YieldChanges set TilesRequired = 1 where ID = 'Moai_FirstBonusAdjacency';
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'Moai_SecondBonusAdjacency';

update ModifierArguments set value = 2 where ModifierId = 'MOAI_COASTADJACENCY_CULTURE' and Name = 'Amount';
insert or replace into Improvement_ValidResources (ImprovementType,ResourceType,MustRemoveFeature)
select 'IMPROVEMENT_MOAI', ResourceType, 1 from Resources where Frequency > 0;

update Improvement_Tourism set PrereqTech = NULL where ImprovementType = 'IMPROVEMENT_MOAI';

---------------------------------------------------------------------------------------------------------
-- Mohenjo Daro朱大罗
insert or replace into TraitModifiers 
	(TraitType,								ModifierId)
values
	('MINOR_CIV_MOHENJO_DARO_TRAIT',		'MOHENJO_DARO_THEATER_POPULATION_CULTURE'),
	('MINOR_CIV_MOHENJO_DARO_TRAIT',		'MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE');
insert or replace into	Modifiers
	(ModifierId,												ModifierType,												SubjectRequirementSetId)
values
	('MOHENJO_DARO_THEATER_POPULATION_CULTURE',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',						'PLAYER_IS_SUZERAIN'),
	('MOHENJO_DARO_THEATER_POPULATION_CULTURE_MODIFIER',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'CITY_HAS_THEATER_REQUIREMENTS'),
	('MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',						'PLAYER_IS_SUZERAIN'),
	('MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE_MODIFIER',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'CITY_HAS_AQUEDUCT_REQUIREMENTS');

insert or replace into	ModifierArguments
	(ModifierId, 											Name,												Value)
values
	('MOHENJO_DARO_THEATER_POPULATION_CULTURE',				'ModifierId',										'MOHENJO_DARO_THEATER_POPULATION_CULTURE_MODIFIER'),
	('MOHENJO_DARO_THEATER_POPULATION_CULTURE_MODIFIER',	'YieldType',										'YIELD_CULTURE'),
	('MOHENJO_DARO_THEATER_POPULATION_CULTURE_MODIFIER',	'Amount',											0.3),
	('MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE',			'ModifierId',										'MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE_MODIFIER'),
	('MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE_MODIFIER',	'YieldType',										'YIELD_CULTURE'),
	('MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE_MODIFIER',	'Amount',											0.3);

---------------------------------------------------------------------------------------------------------
-- Kumasi
delete from TraitModifiers where TraitType = 'MINOR_CIV_KUMASI_TRAIT' and ModifierId = 'MINOR_CIV_KUMASI_UNIQUE_INFLUENCE_TRADE_GOLD_BONUS';
-- update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_KUMASI_CULTURE_TRADE_ROUTE_YIELD_BONUS' and Name = 'Amount';
update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_KUMASI_CULTURE_TRADE_ROUTE_YIELD_BONUS' and Name = 'Amount';

---------------------------------------------------------------------------------------------------------
-- Kandy
update ModifierArguments set Value = 200 where ModifierId = 'MINOR_CIV_KANDY_BETTER_RELIC_BONUS' and Name = 'ScalingFactor';
delete from TraitModifiers where TraitType = 'MINOR_CIV_KANDY_TRAIT' and ModifierId = 'MINOR_CIV_KANDY_UNIQUE_INFLUENCE_GRANT_BONUS';

---------------------------------------------------------------------------------------------------------
-- Venice（Antioch）威尼斯
-- update ModifierArguments set Value = 2 where ModifierId = 'MINOR_CIV_ANTIOCH_LUXURY_TRADE_ROUTE_BONUS' and Name = 'Amount';
delete from TraitModifiers where TraitType = 'MINOR_CIV_ANTIOCH_TRAIT' and ModifierId = 'MINOR_CIV_ANTIOCH_UNIQUE_INFLUENCE_BONUS';
insert or replace into TraitModifiers 
	(TraitType,						        ModifierId)
values
	('MINOR_CIV_ANTIOCH_TRAIT',		    	'MINOR_CIV_ANTIOCH_GOVERNOR_DISCOUNT');
insert or replace into	Modifiers
	(ModifierId,										ModifierType,													SubjectRequirementSetId)
values
	('MINOR_CIV_ANTIOCH_GOVERNOR_DISCOUNT',		       	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',							'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_ANTIOCH_GOVERNOR_DISCOUNT_MODIFIER',	'MODIFIER_PLAYER_CITIES_ADJUST_ALL_BUILDINGS_PURCHASE_COST',	'CITY_HAS_GOVERNOR_REQUIREMENTS');
insert or replace into	ModifierArguments
	(ModifierId, 										Name,			Value)
values
	('MINOR_CIV_ANTIOCH_GOVERNOR_DISCOUNT',				'ModifierId',	'MINOR_CIV_ANTIOCH_GOVERNOR_DISCOUNT_MODIFIER'),
    ('MINOR_CIV_ANTIOCH_GOVERNOR_DISCOUNT_MODIFIER',	'Amount',		15);

---------------------------------------------------------------------------------------------------------
--Hunza罕萨
update ModifierArguments set Value = 0.2 where ModifierId = 'MINOR_CIV_HUNZA_GOLD_FROM_TRADE_ROUTE_LENGTH' and Name = 'Amount';


---------------------------------------------------------------------------------------------------------
--Bandar Seri Begawan(Jakarta)斯里巴加湾
update ModifierArguments set Value = 'MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS' where ModifierId = 'MINOR_CIV_JAKARTA_UNIQUE_INFLUENCE_BONUS' and Name = 'ModifierId';
insert or replace into Modifiers
	(ModifierId,										ModifierType,									    SubjectRequirementSetId)
values
    --Bandar Seri Begawan(Jakarta)
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',	        'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST');
insert or replace into ModifierArguments
	(ModifierId,										Name,			 Value)
values
    --Bandar Seri Begawan(Jakarta)
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',			'YieldType',	 'YIELD_GOLD'),
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',			'Amount',	     3);


---------------------------------------------------------------------------------------------------------
--Lisbon摩加迪沙
insert or replace into TraitModifiers 
    (TraitType,                                  ModifierId)
values
	-- ('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_LISBON_INTERCONTINENTAL_INTERNATIONAL_GOLD1'),
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD1'),
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION1'),
	-- ('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_LISBON_INTERNATIONAL_GOLD2'),
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_LISBON_DOMESTIC_FOOD2'),
	('MINOR_CIV_LISBON_TRAIT',				     'TRAIT_LISBON_DOMESTIC_PRODUCTION2');
insert or replace into Modifiers
	(ModifierId,											ModifierType,									    SubjectRequirementSetId)
values
	('TRAIT_LISBON_INTERCONTINENTAL_INTERNATIONAL_GOLD1',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD1',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION1',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_LISBON_INTERCONTINENTAL_INTERNATIONAL_GOLD',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',	  	NULL),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',	       	NULL),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',	     	NULL),

	('TRAIT_LISBON_INTERNATIONAL_GOLD2',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_LISBON_DOMESTIC_FOOD2',							'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_LISBON_DOMESTIC_PRODUCTION2',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('TRAIT_LISBON_INTERNATIONAL_GOLD',						'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',		NULL),
	('TRAIT_LISBON_DOMESTIC_FOOD',							'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',	    	NULL),
	('TRAIT_LISBON_DOMESTIC_PRODUCTION',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',			NULL);

insert or replace into ModifierArguments
	(ModifierId,											Name,			 	Value)
values
    ('TRAIT_LISBON_INTERCONTINENTAL_INTERNATIONAL_GOLD1',	'ModifierId',	 	'TRAIT_LISBON_INTERCONTINENTAL_INTERNATIONAL_GOLD'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD1',		'ModifierId',	 	'TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION1',	'ModifierId',	 	'TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION'),

	('TRAIT_LISBON_INTERCONTINENTAL_INTERNATIONAL_GOLD',	'YieldType',	 	'YIELD_GOLD'),
	('TRAIT_LISBON_INTERCONTINENTAL_INTERNATIONAL_GOLD',	'Amount',	 	 	6),
	('TRAIT_LISBON_INTERCONTINENTAL_INTERNATIONAL_GOLD',	'Intercontinental',	1),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD',			'YieldType',	 	'YIELD_FOOD'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD',			'Amount',	 	 	1),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD',			'Intercontinental',	1),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION',	'YieldType',	 	'YIELD_PRODUCTION'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION',	'Amount',	 	 	1),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION',	'Intercontinental',	1),

    ('TRAIT_LISBON_INTERNATIONAL_GOLD2',					'ModifierId',	 	'TRAIT_LISBON_INTERNATIONAL_GOLD'),
	('TRAIT_LISBON_DOMESTIC_FOOD2',							'ModifierId',	 	'TRAIT_LISBON_DOMESTIC_FOOD'),
	('TRAIT_LISBON_DOMESTIC_PRODUCTION2',					'ModifierId',	 	'TRAIT_LISBON_DOMESTIC_PRODUCTION'),
	('TRAIT_LISBON_INTERNATIONAL_GOLD',						'YieldType',	 	'YIELD_GOLD'),
	('TRAIT_LISBON_INTERNATIONAL_GOLD',						'Amount',	 	 	6),
	('TRAIT_LISBON_DOMESTIC_FOOD',							'YieldType',	 	'YIELD_FOOD'),
	('TRAIT_LISBON_DOMESTIC_FOOD',							'Amount',	 	 	1),
	('TRAIT_LISBON_DOMESTIC_PRODUCTION',					'YieldType',	 	'YIELD_PRODUCTION'),
	('TRAIT_LISBON_DOMESTIC_PRODUCTION',					'Amount',	 	 	1);

---------------------------------------------------------------------------------------------------------
--Granada 阿卡萨地堡基础文化改为3，地块魅力加成改为100%
update Improvements set YieldFromAppealPercent = 100 where ImprovementType ='IMPROVEMENT_ALCAZAR';
update Improvement_YieldChanges set YieldChange = 3 where ImprovementType ='IMPROVEMENT_ALCAZAR';


---------------------------------------------------------------------------------------------------------
-- Nalanda
delete from TraitModifiers where TraitType = 'MINOR_CIV_NALANDA_TRAIT' and ModifierId = 'MINOR_CIV_NALANDA_FREE_TECHNOLOGY';
update Improvement_YieldChanges set YieldChange = 3 where ImprovementType = 'IMPROVEMENT_MAHAVIHARA' and YieldType = 'YIELD_SCIENCE';
update Adjacency_YieldChanges  set YieldType = 'YIELD_SCIENCE' where ID = 'Mahavihara_Holy_Site_Faith';
update Adjacency_YieldChanges  set YieldType = 'YIELD_SCIENCE' where ID = 'Mahavihara_Lavra_Faith';


---------------------------------------------------------------------------------------------------------
--Hattusa
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_HORSES'   where ModifierId = 'MINOR_CIV_HATTUSA_HORSES_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_IRON'     where ModifierId = 'MINOR_CIV_HATTUSA_IRON_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_NITER'    where ModifierId = 'MINOR_CIV_HATTUSA_NITER_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_COAL'     where ModifierId = 'MINOR_CIV_HATTUSA_COAL_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_OIL'      where ModifierId = 'MINOR_CIV_HATTUSA_OIL_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_ALUMINUM' where ModifierId = 'MINOR_CIV_HATTUSA_ALUMINUM_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_URANIUM'  where ModifierId = 'MINOR_CIV_HATTUSA_URANIUM_RESOURCE_XP2';

insert or replace into TraitModifiers 
    (TraitType,                                  ModifierId)
values
	('MINOR_CIV_HATTUSA_TRAIT',					'MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE');
insert or replace into Modifiers
	(ModifierId,												ModifierType,									    SubjectRequirementSetId)
values
	('MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',				'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE_MODIFIER',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 				'PLOT_HAS_STRATEGIC_IMPROVED_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,												Name,			Value)
values
	('MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE', 			'ModifierId', 	'MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE_MODIFIER'),
	('MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE_MODIFIER', 	'YieldType',    'YIELD_SCIENCE'),
	('MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE_MODIFIER', 	'Amount',    	1);

-- insert or replace into TraitModifiers 
-- 	(TraitType,						            ModifierId)
-- select 'MINOR_CIV_HATTUSA_TRAIT',		    	'MINOR_CIV_HATTUSA_'||ResourceType||'_SCIENCE_BONUS'
-- from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
-- insert or replace into Modifiers
-- 	(ModifierId,												ModifierType,														SubjectRequirementSetId)
-- select 'MINOR_CIV_HATTUSA_'||ResourceType||'_SCIENCE_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	    						'PLAYER_IS_SUZERAIN'
-- from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
-- insert or replace into Modifiers
-- 	(ModifierId,														ModifierType,												SubjectRequirementSetId)
-- select 'MINOR_CIV_HATTUSA_'||ResourceType||'_SCIENCE_BONUS_MODIFIER',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	    	'CITY_HAS_IMPROVED_'||ResourceType
-- from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
-- insert or replace into ModifierArguments
-- 	(ModifierId,							        					Name,			        Value)
-- select 'MINOR_CIV_HATTUSA_'||ResourceType||'_SCIENCE_BONUS',			'ModifierId',			'MINOR_CIV_HATTUSA_'||ResourceType||'_SCIENCE_BONUS_MODIFIER'
-- from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
-- insert or replace into ModifierArguments
-- 	(ModifierId,							        					Name,			        Value)
-- select 'MINOR_CIV_HATTUSA_'||ResourceType||'_SCIENCE_BONUS_MODIFIER',	'YieldType',			'YIELD_SCIENCE'
-- from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
-- insert or replace into ModifierArguments
-- 	(ModifierId,							        					Name,			        Value)
-- select 'MINOR_CIV_HATTUSA_'||ResourceType||'_SCIENCE_BONUS_MODIFIER',	'Amount',				2
-- from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
-- insert or ignore into RequirementSets
-- 	(RequirementSetId, 										RequirementSetType)
-- select 'CITY_HAS_IMPROVED_'||ResourceType,					'REQUIREMENTSET_TEST_ALL'
-- from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

-- insert or ignore into RequirementSetRequirements
-- 	(RequirementSetId, 										RequirementId)
-- select 'CITY_HAS_IMPROVED_'||ResourceType,					'HD_REQUIRES_CITY_HAS_IMPROVED_'||ResourceType
-- from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';


---------------------------------------------------------------------------------------------------------
--Fez
delete from TraitModifiers where TraitType = 'MINOR_CIV_FEZ_TRAIT' and ModifierId = 'MINOR_CIV_FEZ_UNIQUE_INFLUENCE_BONUS';
insert or replace into TraitModifiers 
    (TraitType,                                  ModifierId)
values
--	('MINOR_CIV_FEZ_TRAIT',						 'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_HOLY_SITE'),
	('MINOR_CIV_FEZ_TRAIT',				         'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE'),
	('MINOR_CIV_FEZ_TRAIT',				         'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE'),
	('MINOR_CIV_FEZ_TRAIT',				         'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING');
insert or replace into Modifiers
	(ModifierId,											ModifierType,									    SubjectRequirementSetId)
values
--	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_HOLY_SITE',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',				'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE',         		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE',          	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	        	'PLAYER_IS_SUZERAIN'),
--	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_HOLY_SITE1',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'DISTRICT_IS_HOLY_SITE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1',         	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',  'BUILDING_IS_SHRINE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1',         	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',  'BUILDING_IS_TEMPLE_XP2'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 	'BUILDING_IS_TIER3_HOLY_SITE');
insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
--	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_HOLY_SITE',			'ModifierId',	'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_HOLY_SITE1'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE',          	'ModifierId',   'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE',          	'ModifierId',	'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING',	'ModifierId',	'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1'),
--	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_HOLY_SITE1',			'YieldType',	'YIELD_SCIENCE'),
--  ('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_HOLY_SITE1',			'Amount',		2),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1',          	'YieldType',	'YIELD_SCIENCE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_SHRINE1',          	'Amount',	    2),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1',          	'YieldType',	'YIELD_SCIENCE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_TEMPLE1',          	'Amount',	    2),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1', 'YieldType', 	'YIELD_SCIENCE'),
	('MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_RELIGIOUS_BUILDING1', 'Amount',    	2);

---------------------------------------------------------------------------------------------------------
--Babylon安善
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_BABYLON_GREAT_WORK_WRITING_SCIENCE'  and Name = 'YieldChange';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_BABYLON_GREAT_WORK_ARTIFACT_SCIENCE' and Name = 'YieldChange';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_BABYLON_GREAT_WORK_RELIC_SCIENCE'    and Name = 'YieldChange';	
-- insert or replace into TraitModifiers
-- 	(TraitType,							ModifierId)
-- values
-- 	('MINOR_CIV_BABYLON_TRAIT',			'MINOR_CIV_BABYLON_CAMPUS_GREAT_ARTIST_POINT_BONUS');

-- insert or replace into Modifiers	
-- 	(ModifierId,														ModifierType,											SubjectRequirementSetId)
-- values
-- 	('MINOR_CIV_BABYLON_CAMPUS_GREAT_ARTIST_POINT_BONUS',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
-- 	('MINOR_CIV_BABYLON_CAMPUS_GREAT_ARTIST_POINT_BONUS_MODIFIER',		'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',		'HD_CITY_HAS_CAMPUS_REQUIREMENTS');	

-- insert or replace into	ModifierArguments
-- 	(ModifierId, 											        		Name,													Value)
-- values
-- 	('MINOR_CIV_BABYLON_CAMPUS_GREAT_ARTIST_POINT_BONUS',					'ModifierId',											'MINOR_CIV_BABYLON_CAMPUS_GREAT_ARTIST_POINT_BONUS_MODIFIER'),
-- 	('MINOR_CIV_BABYLON_CAMPUS_GREAT_ARTIST_POINT_BONUS_MODIFIER',			'GreatPersonClassType',									'GREAT_PERSON_CLASS_ARTIST'),
--     ('MINOR_CIV_BABYLON_CAMPUS_GREAT_ARTIST_POINT_BONUS_MODIFIER',			'Amount',												4);

---------------------------------------------------------------------------------------------------------
-- Cardiff
update ModifierArguments set Value = 0 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_LIGHTHOUSE' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_SHIPYARD' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_SEAPORT' and Name = 'Amount';
-- insert or replace into TraitModifiers 
--     (TraitType,                                 	 ModifierId)
-- values
-- 	('MINOR_CIV_CARDIFF_TRAIT',				         'TRAIT_POWERED_BUILDINGS_MORE_CULTURE'),
-- 	('MINOR_CIV_CARDIFF_TRAIT',				         'TRAIT_POWERED_BUILDINGS_MORE_GOLD'),
-- 	('MINOR_CIV_CARDIFF_TRAIT',				         'TRAIT_POWERED_BUILDINGS_MORE_SCIENCE'),
-- 	('MINOR_CIV_CARDIFF_TRAIT',				         'TRAIT_POWERED_BUILDINGS_MORE_FOOD');

---------------------------------------------------------------------------------------------------------
--普雷斯拉夫军营及军营建筑+2科技
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_UNIQUE_INFLUENCE_BARRACKS_STABLE_IDENTITY_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_UNIQUE_INFLUENCE_ARMORY_IDENTITY_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_UNIQUE_INFLUENCE_MILITARY_ACADEMY_IDENTITY_BONUS';
/*insert or replace into TraitModifiers 
    (TraitType,                                 	 ModifierId)
values
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS');
insert or replace into Modifiers
	(ModifierId,													ModifierType,									   			 SubjectRequirementSetId)
values
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            		'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            		'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS',	'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	        			'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_MILITARY_UNITS_PRODUCTION',	'BUILDING_IS_BARRACKS_STABLE_MILITARITIC_CITY_STATE'),
	('MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS1',				'MODIFIER_PLAYER_CITIES_ADJUST_MILITARY_UNITS_PRODUCTION', 	'BUILDING_IS_ARMORY'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS1',	'MODIFIER_PLAYER_CITIES_ADJUST_MILITARY_UNITS_PRODUCTION', 	'BUILDING_IS_MILITARY_ACADEMY');
insert or replace into ModifierArguments
	(ModifierId,															Name,				 Value)
values
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS',     		'ModifierId',		'MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS1'),
	('MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS',      				'ModifierId',		'MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS1'),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS', 			'ModifierId', 		'MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS1'),
	('MINOR_CIV_PRESLAV_BARRACKS_STABLE_UNIT_PRODUCTION_BONUS1',			'Amount',	     	10),
	('MINOR_CIV_PRESLAV_ARMORY_UNIT_PRODUCTION_BONUS1',						'Amount',	     	10),
	('MINOR_CIV_PRESLAV_MILITARY_ACADEMY_UNIT_PRODUCTION_BONUS1',			'Amount',	     	10);*/

insert or replace into TraitModifiers 
    (TraitType,                                 	 ModifierId)
values
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_BARRACKS_STABLE_SCIENCE_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_ARMORY_SCIENCE_BONUS'),
	('MINOR_CIV_PRESLAV_TRAIT',				         'MINOR_CIV_PRESLAV_MILITARY_ACADEMY_SCIENCE_BONUS');
	--('MINOR_CIV_PRESLAV_TRAIT',						 'MINOR_CIV_PRESLAV_CAVALRY_INCREASED_MOVEMENT'),
	--('MINOR_CIV_PRESLAV_TRAIT',						 'MINOR_CIV_PRESLAV_CAVALRY_INCREASED_COMBAT');
insert or replace into Modifiers
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
	-- 
	--('MINOR_CIV_PRESLAV_CAVALRY_INCREASED_MOVEMENT',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            		'PLAYER_IS_SUZERAIN'),
	--('MINOR_CIV_PRESLAV_CAVALRY_INCREASED_COMBAT',					'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',	            		'PLAYER_IS_SUZERAIN'),
	--('MINOR_CIV_PRESLAV_CAVALRY_MOVEMENT',							'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',					'UNIT_IS_CAVALRY_REQUIREMENTS'),
	--('MINOR_CIV_PRESLAV_CAVALRY_STRENGTH',							'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH',				'UNIT_IS_CAVALRY_REQUIREMENTS');
insert or replace into ModifierArguments
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
	-- 
	--('MINOR_CIV_PRESLAV_CAVALRY_INCREASED_MOVEMENT',				'ModifierId',		'MINOR_CIV_PRESLAV_CAVALRY_MOVEMENT'),
	--('MINOR_CIV_PRESLAV_CAVALRY_INCREASED_COMBAT',					'ModifierId',		'MINOR_CIV_PRESLAV_CAVALRY_STRENGTH'),	
	--('MINOR_CIV_PRESLAV_CAVALRY_MOVEMENT',							'Amount',			1),
	--('MINOR_CIV_PRESLAV_CAVALRY_STRENGTH',							'Amount',			3);
--insert or replace into ModifierStrings
--	(ModifierId,							Context,	Text)
--values
--	('MINOR_CIV_PRESLAV_CAVALRY_STRENGTH',	'Preview',	'+{1_Amount} {LOC_PRESLAV_CAVALRY_STRENGTH_PREVIEW_TEXT}');

---------------------------------------------------------------------------------------------------------
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


---------------------------------------------------------------------------------------------------------
--Nan Madol
update Modifiers set SubjectRequirementSetId = 'NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST' where ModifierId = 'MINOR_CIV_NAN_MADOL_DISTRICTS_CULTURE_BONUS';
update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_NAN_MADOL_DISTRICTS_CULTURE_BONUS' and Name = 'Amount';

insert or replace into RequirementSets
	(RequirementSetId,			RequirementSetType)
values
	('NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST','REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,					RequirementId)
values
	('NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST', 'REQUIRES_DISTRICT_IS_NOT_CITY_CENTER'),
	('NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST',	'PLOT_IS_OR_ADJACENT_TO_COAST_REQUIREMENTS'),
	('NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST',	'REQUIRES_PLOT_DOES_NOT_HAVE_INCOMPLETE_WONDER');

insert or replace into Requirements(RequirementId, RequirementType)values
	('PLOT_IS_OR_ADJACENT_TO_COAST_REQUIREMENTS','REQUIREMENT_REQUIREMENTSET_IS_MET');
insert or replace into RequirementArguments(RequirementId,Name,Value)values
	('PLOT_IS_OR_ADJACENT_TO_COAST_REQUIREMENTS','RequirementSetId','PLOT_IS_OR_ADJACENT_TO_COAST');


---------------------------------------------------------------------------------------------------------
-- Kabul
-- update ModifierArguments set Value = 50 where ModifierId = 'MINOR_CIV_KABUL_UNIT_EXPERIENCE_BONUS' and Name = 'Amount';


---------------------------------------------------------------------------------------------------------
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
	-- ('AKKAD_ESCORT_MOVEMENT_BONUS',									'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',					'CONVOY_REQUIREMENTS');	

insert or replace into ModifierArguments
	(ModifierId,													Name,				Value)
values
	('MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT',						'ModifierId',		'MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT_MODIFIER'),
	('MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT_MODIFIER',				'Tag',				'CLASS_SUPPORT'),
	('MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',				'ModifierId',		'MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT_MODIFIER'),
	('MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT_MODIFIER',	'AbilityType',		'ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT');
	-- ('AKKAD_ESCORT_MOVEMENT_BONUS',									'Amount',			1);
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
	-- ('ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		'AKKAD_ESCORT_MOVEMENT_BONUS');
	('ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		'ESCORT_MOBILITY_SHARED_MOVEMENT');

---------------------------------------------------------------------------------------------------------
-- La venta
insert or replace into Improvement_ValidFeatures
	(ImprovementType,				FeatureType)
values
	('IMPROVEMENT_COLOSSAL_HEAD',	'FEATURE_FOREST'),
	('IMPROVEMENT_COLOSSAL_HEAD',	'FEATURE_JUNGLE');

--delete from Improvement_ValidFeatures where ImprovementType = 'IMPROVEMENT_COLOSSAL_HEAD' and FeatureType = 'FEATURE_VOLCANIC_SOIL';
--delete from Improvement_ValidTerrains where ImprovementType = 'IMPROVEMENT_COLOSSAL_HEAD';
UPDATE Improvement_YieldChanges set YieldChange = 1 where ImprovementType = 'IMPROVEMENT_COLOSSAL_HEAD' and YieldType = 'YIELD_FAITH';

---------------------------------------------------------------------------------------------------------
--CAHOKIA
update Modifiers set SubjectStackLimit = 2 where ModifierId = 'MOUND_AMENITY_MAX_ONE';
update Adjacency_YieldChanges set TilesRequired = 1 where ID = 'Mound_MedievalAdjacency';
update Adjacency_YieldChanges set PrereqCivic = NULL where ID = 'Mound_MedievalAdjacency';
update Adjacency_YieldChanges set ObsoleteCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD' where ID = 'Mound_MedievalAdjacency';
update Adjacency_YieldChanges set ObsoleteTech = NULL where ID = 'Mound_MedievalAdjacency';
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'Mound_MechanizedAdjacency';
update Adjacency_YieldChanges set PrereqCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD' where ID = 'Mound_MechanizedAdjacency';
update Adjacency_YieldChanges set PrereqTech = NULL where ID = 'Mound_MechanizedAdjacency';
delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_MOUND' and ModifierID = 'MOUND_HOUSING';

---------------------------------------------------------------------------------------------------------
--Baikonur
--insert or replace into TraitModifiers
--	(TraitType,							ModifierId)
--values
--	('MINOR_CIV_HONG_KONG_TRAIT',		'MINOR_CIV_HONG_KONG_CAMPUS_PRODUCTION_BONUS');

--insert or replace into Modifiers	
--	(ModifierId,														ModifierType,											SubjectRequirementSetId)
--values
--	('MINOR_CIV_HONG_KONG_CAMPUS_PRODUCTION_BONUS',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
--	('MINOR_CIV_HONG_KONG_CAMPUS_PRODUCTION_BONUS_MODIFIER',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',		'DISTRICT_IS_CAMPUS');	

--insert or replace into	ModifierArguments
--	(ModifierId, 											        	Name,												Value)
--values
--	('MINOR_CIV_HONG_KONG_CAMPUS_PRODUCTION_BONUS',						'ModifierId',										'MINOR_CIV_HONG_KONG_CAMPUS_PRODUCTION_BONUS_MODIFIER'),
--	('MINOR_CIV_HONG_KONG_CAMPUS_PRODUCTION_BONUS_MODIFIER',			'YieldType',										'YIELD_PRODUCTION'),
--    ('MINOR_CIV_HONG_KONG_CAMPUS_PRODUCTION_BONUS_MODIFIER',			'Amount',											2);
--insert or replace into TraitModifiers
--	(TraitType,							ModifierId)
--	select 'MINOR_CIV_HONG_KONG_TRAIT',		'MINOR_CIV_HONG_KONG_'||BuildingType||'_PRODUCTION_BONUS'
--from Buildings where PrereqDistrict = 'DISTRICT_CAMPUS' and TraitType is NULL;
--insert or replace into Modifiers	
--	(ModifierId,														ModifierType,											SubjectRequirementSetId)
--	select 'MINOR_CIV_HONG_KONG_'||BuildingType||'_PRODUCTION_BONUS','MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER','PLAYER_IS_SUZERAIN'
--from Buildings where PrereqDistrict = 'DISTRICT_CAMPUS' and TraitType is NULL;
--insert or replace into Modifiers	
--	(ModifierId,														ModifierType,											SubjectRequirementSetId)
--	select 'MINOR_CIV_HONG_KONG_'||BuildingType||'_PRODUCTION_BONUS_MODIFIER','MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',NULL
--from Buildings where PrereqDistrict = 'DISTRICT_CAMPUS' and TraitType is NULL;
--insert or replace into	ModifierArguments
--	(ModifierId, 											        	Name,												Value)
--	select 'MINOR_CIV_HONG_KONG_'||BuildingType||'_PRODUCTION_BONUS','ModifierId','MINOR_CIV_HONG_KONG_'||BuildingType||'_PRODUCTION_BONUS_MODIFIER'
--from Buildings where PrereqDistrict = 'DISTRICT_CAMPUS' and TraitType is NULL;
--insert or replace into ModifierArguments	
--	(ModifierId,														Name,											Value)
--	select 'MINOR_CIV_HONG_KONG_'||BuildingType||'_PRODUCTION_BONUS_MODIFIER','BuildingType',BuildingType
--from Buildings where PrereqDistrict = 'DISTRICT_CAMPUS' and TraitType is NULL;
--insert or replace into ModifierArguments	
--	(ModifierId,														Name,											Value)
--	select 'MINOR_CIV_HONG_KONG_'||BuildingType||'_PRODUCTION_BONUS_MODIFIER','YieldType','YIELD_PRODUCTION'
--from Buildings where PrereqDistrict = 'DISTRICT_CAMPUS' and TraitType is NULL;
--insert or replace into ModifierArguments	
--	(ModifierId,														Name,											Value)
--	select 'MINOR_CIV_HONG_KONG_'||BuildingType||'_PRODUCTION_BONUS_MODIFIER','Amount',2
--from Buildings where PrereqDistrict = 'DISTRICT_CAMPUS' and TraitType is NULL;

-------------------------------------
--MEXICO_CITY
-- insert or replace into TraitModifiers
-- 	(TraitType,							ModifierId)
-- values
-- 	('MINOR_CIV_MEXICO_CITY_TRAIT',		'MINOR_CIV_MEXICO_CITY_INDUSTRIAL_ZONE_AMENITY_BONUS'),
-- 	('MINOR_CIV_MEXICO_CITY_TRAIT',		'MINOR_CIV_MEXICO_CITY_ENTERTAINMENT_COMPLEX_PRODUCTION_BONUS');

-- insert or replace into Modifiers	
-- 	(ModifierId,														ModifierType,											SubjectRequirementSetId)
-- values
-- 	('MINOR_CIV_MEXICO_CITY_INDUSTRIAL_ZONE_AMENITY_BONUS',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
-- 	('MINOR_CIV_MEXICO_CITY_INDUSTRIAL_ZONE_AMENITY_BONUS_MODIFIER',	'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',			'DISTRICT_IS_INDUSTRIAL_ZONE'),
-- 	('MINOR_CIV_MEXICO_CITY_ENTERTAINMENT_COMPLEX_PRODUCTION_BONUS',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',			'PLAYER_IS_SUZERAIN'),
-- 	('MINOR_CIV_MEXICO_CITY_ENTERTAINMENT_COMPLEX_PRODUCTION_BONUS_MODIFIER',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE','DL_PLOT_IS_DISTRICT_IS_ENTERTAINMENT_REQUIRMENTS');	

-- insert or replace into	ModifierArguments
-- 	(ModifierId, 											        	Name,												Value)
-- values
--     ('MINOR_CIV_MEXICO_CITY_INDUSTRIAL_ZONE_AMENITY_BONUS',             'ModifierId',                                       'MINOR_CIV_MEXICO_CITY_INDUSTRIAL_ZONE_AMENITY_BONUS_MODIFIER'),
--     ('MINOR_CIV_MEXICO_CITY_INDUSTRIAL_ZONE_AMENITY_BONUS_MODIFIER',    'Amount',                                           1),
-- 	('MINOR_CIV_MEXICO_CITY_ENTERTAINMENT_COMPLEX_PRODUCTION_BONUS',					'ModifierId',											'MINOR_CIV_MOHENJO_DARO_THEATER_FOOD_BONUS_MODIFIER'),
-- 	('MINOR_CIV_MEXICO_CITY_ENTERTAINMENT_COMPLEX_PRODUCTION_BONUS_MODIFIER',			'YieldType',											'YIELD_PRODUCTION'),
--     ('MINOR_CIV_MEXICO_CITY_ENTERTAINMENT_COMPLEX_PRODUCTION_BONUS_MODIFIER',			'Amount',												5);

-------------------------------------
--布鲁塞尔
-- update ModifierArguments set Value = 25 where ModifierId = 'MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUS' and Name = 'Amount';
-- insert or replace into TraitModifiers
-- 	(TraitType,							ModifierId)
-- values
-- 	('MINOR_CIV_BRUSSELS_TRAIT',		'MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUS1');

-- insert or replace into Modifiers	
-- 	(ModifierId,														ModifierType,											SubjectRequirementSetId)
-- values
-- 	('MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUS1',						'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
--     ('MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUSXP',    				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               NULL),
-- 	('MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUS_MODIFIER',				'MODIFIER_SINGLE_CITY_ADJUST_WONDER_YIELD_CHANGE',		NULL);	

-- insert or replace into	ModifierArguments
-- 	(ModifierId, 											        	Name,												Value)
-- values
-- 	('MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUS1',					'ModifierId',											'MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUSXP'),
-- 	('MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUSXP',				'ModifierId',											'MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUS_MODIFIER'),
-- 	('MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUS_MODIFIER',			'YieldType',											'YIELD_PRODUCTION'),
--     ('MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUS_MODIFIER',			'Amount',												2);


-------------------------------------
--Taruga
--update ModifierArguments set Value = 7 where ModifierId = 'MINOR_CIV_TARUGA_ALUMINUM_RESOURCE_SCIENCE' and Name = 'Amount';
--update ModifierArguments set Value = 7 where ModifierId = 'MINOR_CIV_TARUGA_COAL_RESOURCE_SCIENCE' and Name = 'Amount';
--update ModifierArguments set Value = 7 where ModifierId = 'MINOR_CIV_TARUGA_HORSES_RESOURCE_SCIENCE' and Name = 'Amount';
--update ModifierArguments set Value = 7 where ModifierId = 'MINOR_CIV_TARUGA_IRON_RESOURCE_SCIENCE' and Name = 'Amount';
--update ModifierArguments set Value = 7 where ModifierId = 'MINOR_CIV_TARUGA_NITER_RESOURCE_SCIENCE' and Name = 'Amount';
--update ModifierArguments set Value = 7 where ModifierId = 'MINOR_CIV_TARUGA_OIL_RESOURCE_SCIENCE' and Name = 'Amount';
--update ModifierArguments set Value = 7 where ModifierId = 'MINOR_CIV_TARUGA_URANIUM_RESOURCE_SCIENCE' and Name = 'Amount';


-------------------------------------
--Bologna
-- update ModifierArguments set Value = 4 where ModifierId = 'MINOR_CIV_BOLOGNA_GREAT_GENERAL_POINTS_BONUS' and Name = 'Amount';
-- update ModifierArguments set Value = 4 where ModifierId = 'MINOR_CIV_BOLOGNA_GREAT_ADMIRAL_POINTS_BONUS' and Name = 'Amount';
-- update ModifierArguments set Value = 4 where ModifierId = 'MINOR_CIV_BOLOGNA_GREAT_ENGINEER_POINTS_BONUS' and Name = 'Amount';
-- update ModifierArguments set Value = 4 where ModifierId = 'MINOR_CIV_BOLOGNA_GREAT_MERCHANT_POINTS_BONUS' and Name = 'Amount';
-- update ModifierArguments set Value = 4 where ModifierId = 'MINOR_CIV_BOLOGNA_GREAT_PROPHET_POINTS_BONUS' and Name = 'Amount';
-- update ModifierArguments set Value = 4 where ModifierId = 'MINOR_CIV_BOLOGNA_GREAT_SCIENTIST_POINTS_BONUS' and Name = 'Amount';
-- update ModifierArguments set Value = 4 where ModifierId = 'MINOR_CIV_BOLOGNA_GREAT_WRITER_POINTS_BONUS' and Name = 'Amount';
-- update ModifierArguments set Value = 4 where ModifierId = 'MINOR_CIV_BOLOGNA_GREAT_ARTIST_POINTS_BONUS' and Name = 'Amount';
-- update ModifierArguments set Value = 4 where ModifierId = 'MINOR_CIV_BOLOGNA_GREAT_MUSICIAN_POINTS_BONUS' and Name = 'Amount';

-------------------------------------
--Nazca
update ModifierArguments set Value = 2 where ModifierId = 'NAZCA_LINE_ADJACENCY_FAITH' and Name = 'Amount';
update RequirementSetRequirements set RequirementId = 'REQUIRES_PLAYER_HAS_CIVIC_FEUDALISM' where RequirementSetId = 'NAZCA_LINE_ADJACENCY_FOOD_DESERT_CIVIL_SERVICE_REQUIREMENTS' and RequirementId = 'REQUIRES_PLAYER_HAS_CIVIL_SERVICE_XP2';
update RequirementSetRequirements set RequirementId = 'REQUIRES_PLAYER_HAS_CIVIC_FEUDALISM' where RequirementSetId = 'NAZCA_LINE_ADJACENCY_FOOD_DESERT_HILLS_CIVIL_SERVICE_REQUIREMENTS' and RequirementId = 'REQUIRES_PLAYER_HAS_CIVIL_SERVICE_XP2';
-- delete from RequirementSetRequirements where RequirementSetId = 'NAZCA_LINE_ADJACENCY_FOOD_DESERT_CIVIL_SERVICE_REQUIREMENTS' and RequirementId = 'REQUIRES_PLOT_DESERT';
-- delete from RequirementSetRequirements where RequirementSetId = 'NAZCA_LINE_ADJACENCY_FOOD_DESERT_HILLS_CIVIL_SERVICE_REQUIREMENTS' and RequirementId = 'REQUIRES_PLOT_HAS_DESERT';
-- insert or replace into ImprovementModifiers
-- 	(ImprovementType,			ModifierID)
-- values
-- 	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_ADJACENCY_FOOD'),
-- 	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_ADJACENCY_PRODUCTION'),
-- 	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_ADJACENCY_DESERT_FAITH'),
-- 	('IMPROVEMENT_NAZCA_LINE',	'NAZCA_LINE_ADJACENCY_DESERT_HILLS_FAITH');
-- insert or replace into Modifiers
-- 	(ModifierId,												ModifierType,														SubjectRequirementSetId)
-- values
--     ('NAZCA_LINE_ADJACENCY_FOOD',	    						'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	    						'NAZCA_LINE_ADJACENCY_FAITH_REQUIREMENTS'),
--     ('NAZCA_LINE_ADJACENCY_PRODUCTION',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',								'NAZCA_LINE_ADJACENCY_FAITH_REQUIREMENTS'),
--     ('NAZCA_LINE_ADJACENCY_DESERT_FAITH',	    				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	    						'NAZCA_LINE_ADJACENCY_DESERT_FAITH_REQUIREMENTS'),
--     ('NAZCA_LINE_ADJACENCY_DESERT_HILLS_FAITH',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',								'NAZCA_LINE_ADJACENCY_DESERT_HILLS_FAITH_REQUIREMENTS');

-- insert or replace into ModifierArguments
-- 	(ModifierId,								Name,			        Value)
-- values
-- 	('NAZCA_LINE_ADJACENCY_FOOD',				'YieldType',			'YIELD_FOOD'),
-- 	('NAZCA_LINE_ADJACENCY_FOOD',				'Amount',				1),
-- 	('NAZCA_LINE_ADJACENCY_PRODUCTION',			'YieldType',			'YIELD_PRODUCTION'),
-- 	('NAZCA_LINE_ADJACENCY_PRODUCTION',			'Amount',				1),
-- 	('NAZCA_LINE_ADJACENCY_DESERT_FAITH',		'YieldType',			'YIELD_FAITH'),
-- 	('NAZCA_LINE_ADJACENCY_DESERT_FAITH',		'Amount',				1),
-- 	('NAZCA_LINE_ADJACENCY_DESERT_HILLS_FAITH',	'YieldType',			'YIELD_FAITH'),
-- 	('NAZCA_LINE_ADJACENCY_DESERT_HILLS_FAITH',	'Amount',				1);
-- insert or replace into RequirementSets
-- 	(RequirementSetId,											RequirementSetType)
-- values
-- 	('NAZCA_LINE_ADJACENCY_DESERT_FAITH_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL'),
-- 	('NAZCA_LINE_ADJACENCY_DESERT_HILLS_FAITH_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');
-- insert or replace into RequirementSetRequirements
-- 	(RequirementSetId,												RequirementId)
-- values
-- 	('NAZCA_LINE_ADJACENCY_DESERT_FAITH_REQUIREMENTS',			'ADJACENT_TO_OWNER'),
-- 	('NAZCA_LINE_ADJACENCY_DESERT_FAITH_REQUIREMENTS',			'REQUIRES_PLOT_DESERT'),
-- 	('NAZCA_LINE_ADJACENCY_DESERT_HILLS_FAITH_REQUIREMENTS',	'ADJACENT_TO_OWNER'),
-- 	('NAZCA_LINE_ADJACENCY_DESERT_HILLS_FAITH_REQUIREMENTS',	'REQUIRES_PLOT_HAS_DESERT');
-------------------------------------
--Wolin
update ModifierArguments set Value = 100 where ModifierId = 'WOLIN_GREAT_GENERAL_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where ModifierId = 'WOLIN_GREAT_ADMIRAL_POINTS' and Name = 'Amount';

-------------------------------------
--埃里温
insert or replace into TraitModifiers
	(TraitType,					ModifierId)
values
	('MINOR_CIV_YEREVAN_TRAIT',	'MINOR_CIV_YEREVAN_RELIGIOUS_ALL_INCREASED_MOVEMENT');

insert or replace into Modifiers	
	(ModifierId,													ModifierType,											SubjectRequirementSetId)
values
	('MINOR_CIV_YEREVAN_RELIGIOUS_ALL_INCREASED_MOVEMENT',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_YEREVAN_RELIGIOUS_ALL_INCREASED_MOVEMENT_MODIFIER',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',					NULL),
	('RELIGIOUS_ALL_INCREASED_MOVEMENT',           					'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',					NULL);	

insert or replace into	ModifierArguments
	(ModifierId, 											        Name,												Value)
values
	('MINOR_CIV_YEREVAN_RELIGIOUS_ALL_INCREASED_MOVEMENT',			'ModifierId',										'MINOR_CIV_YEREVAN_RELIGIOUS_ALL_INCREASED_MOVEMENT_MODIFIER'),
	('MINOR_CIV_YEREVAN_RELIGIOUS_ALL_INCREASED_MOVEMENT_MODIFIER',	'AbilityType',										'ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT'),
    ('RELIGIOUS_ALL_INCREASED_MOVEMENT',							'Amount',											1);
insert or replace into Types
	(Type,													Kind)
values
	('ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT',			'KIND_ABILITY');

insert or replace into TypeTags		
	(Type,													Tag)
select 
	'ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT',				'CLASS_RELIGIOUS_ALL';

insert or replace into UnitAbilities 
	(UnitAbilityType, 										Inactive) 
values	
	('ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT',  			1);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
	('ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT',			'RELIGIOUS_ALL_INCREASED_MOVEMENT');

-- 约翰内斯堡
delete from TraitModifiers where TraitType = 'MINOR_CIV_JOHANNESBURG_TRAIT' and ModifierId = 'MINOR_CIV_JOHANNESBURG_UNIQUE_INFLUENCE_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_JOHANNESBURG_TRAIT' and ModifierId = 'MINOR_CIV_JOHANNESBURG_UNIQUE_INFLUENCE_BONUS_LATE';
create temporary table 'JohannesburgImprovementType'(
    ImprovementType TEXT not null primary key
);
insert into JohannesburgImprovementType values
    ('IMPROVEMENT_FARM'),
    ('IMPROVEMENT_PLANTATION'),
    ('IMPROVEMENT_CAMP'),
    ('IMPROVEMENT_PASTURE'),
    ('IMPROVEMENT_MINE'),
    ('IMPROVEMENT_QUARRY'),
    ('IMPROVEMENT_LUMBER_MILL');
insert or ignore into RequirementSets(RequirementSetId, 						RequirementSetType) 
	select 'HD_REQUIRES_CITY_HAS_' || imps.ImprovementType || '_OVER_RESOURCES',	'REQUIREMENTSET_TEST_ANY'
	from Improvements imps, Improvement_ValidResources ivr where imps.ImprovementType = ivr.ImprovementType;
insert or ignore into RequirementSetRequirements(RequirementSetId,						RequirementId)
	select 'HD_REQUIRES_CITY_HAS_' || imps.ImprovementType || '_OVER_RESOURCES', 'HD_REQUIRES_CITY_HAS_IMPROVED_' || ivr.ResourceType
	from Improvements imps, Improvement_ValidResources ivr where imps.ImprovementType = ivr.ImprovementType;
insert or ignore into TraitModifiers(TraitType,		ModifierId)
    select 'MINOR_CIV_JOHANNESBURG_TRAIT', 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType
    from JohannesburgImprovementType;
insert or ignore into Modifiers(ModifierId,		ModifierType,   SubjectRequirementSetId)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType, 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_IS_SUZERAIN'
    from JohannesburgImprovementType;
insert or ignore into Modifiers(ModifierId,		ModifierType,   SubjectRequirementSetId)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType||'_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'HD_REQUIRES_CITY_HAS_' || ImprovementType || '_OVER_RESOURCES'
    from JohannesburgImprovementType;
insert or ignore into ModifierArguments(ModifierId,                            Name,   Value)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType, 'ModifierId' , 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType||'_MODIFIER'
    from JohannesburgImprovementType;
insert or ignore into ModifierArguments(ModifierId,                            Name,   Value)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType||'_MODIFIER',  'YieldType', 'YIELD_PRODUCTION'
    from JohannesburgImprovementType;
insert or ignore into ModifierArguments(ModifierId,                            Name,   Value)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType||'_MODIFIER',  'Amount', '1'
    from JohannesburgImprovementType;

-- 日内瓦
update ModifierArguments set Value = 10 where ModifierId = 'MINOR_CIV_GENEVA_SCIENCE_AT_PEACE_BONUS' and Name = 'Amount';