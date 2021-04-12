-------------------------------------
--       Wonders Adjustments       --
-------------------------------------

-- Oracle gives 3 * 2 great person points each.
update ModifierArguments set Value = 6 where ModifierId = 'ORACLE_GREATGENERALPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'ORACLE_GREATADMIRALPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'ORACLE_GREATENGINEERPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'ORACLE_GREATMERCHANTPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'ORACLE_GREATPROPHETPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'ORACLE_GREATSCIENTISTPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'ORACLE_GREATWRITERPOINTS' and Name = 'Amount';
-- ARTEMIS does not affect empty camp.
insert into RequirementSets (RequirementSetId, RequirementSetType) values
	('TEMPLE_ARTEMIS_AND_HAS_RESOURCE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL')
;

insert into RequirementSetRequirements values
	('TEMPLE_ARTEMIS_AND_HAS_RESOURCE_REQUIREMENTS', 'PLOT_HAS_RESOURCE_REQUIREMENTS'),
	('TEMPLE_ARTEMIS_AND_HAS_RESOURCE_REQUIREMENTS', 'REQUIRES_PLOT_HAS_ARTEMIS_WITHIN_4')
;

update Modifiers set SubjectRequirementSetId = 'TEMPLE_ARTEMIS_AND_HAS_RESOURCE_REQUIREMENTS'
	where ModifierId = 'TEMPLE_ARTEMIS_CAMP_AMENITY';

update Building_YieldChanges set YieldChange = 6 where BuildingType = 'BUILDING_TEMPLE_ARTEMIS';
-- Petra
update ModifierArguments set Value = '3,2,1' where ModifierId = 'PETRA_YIELD_MODIFIER' and Name = 'Amount';

-- MEENAKSHI_TEMPLE
update Buildings set PrereqCivic = 'CIVIC_DIVINE_RIGHT' where BuildingType = 'BUILDING_MEENAKSHI_TEMPLE';
--STBASILS
update ModifierArguments set Value = 2 where ModifierId = 'STBASILS_ADDFOOD_MODIFIER' and Name = 'Amount';
--chichen itza
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('BUILDING_CHICHEN_ITZA',				'CHICHEN_ITZA_JUNGLE_FOOD');

insert or replace into Modifiers
	(ModifierId, 							ModifierType,										SubjectRequirementSetId)
values
	('CHICHEN_ITZA_JUNGLE_FOOD',			'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_HAS_CHICHEN_ITZA_REQUIREMENTS'),
	('CHICHEN_ITZA_JUNGLE_FOOD_MODIFIER',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_JUNGLE_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
values
	('CHICHEN_ITZA_JUNGLE_FOOD',				'ModifierId',			'CHICHEN_ITZA_JUNGLE_FOOD_MODIFIER'),		
	('CHICHEN_ITZA_JUNGLE_FOOD_MODIFIER',		'YieldType',			'YIELD_FOOD'),
	('CHICHEN_ITZA_JUNGLE_FOOD_MODIFIER',		'Amount',				1);

--remove MAHABODHI_DIPLOVP 
--add ORSZAGHAZ DVP
delete from BuildingModifiers where ModifierId = 'MAHABODHI_DIPLOVP';
insert or replace into BuildingModifiers (BuildingType,ModifierId) values
	('BUILDING_ORSZAGHAZ', 'MAHABODHI_DIPLOVP');

--Great Lighthouse grants GREAT_PERSON_CLASS_ADMIRAL
--grants an Admiral 
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_GREAT_LIGHTHOUSE', 'GREAT_LIGHTHOUSE_GRANTS_ADMIRAL'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_GREAT_LIGHTHOUSE');

insert or replace into Modifiers	(ModifierId,ModifierType,	RunOnce,	Permanent) values
('GREAT_LIGHTHOUSE_GRANTS_ADMIRAL',	'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',1,1);

insert or replace into ModifierArguments (ModifierId,	Name,	Value) values
('GREAT_LIGHTHOUSE_GRANTS_ADMIRAL',	'Amount',	1),
('GREAT_LIGHTHOUSE_GRANTS_ADMIRAL',	'GreatPersonClassType',	'GREAT_PERSON_CLASS_ADMIRAL');

update Building_GreatPersonPoints set PointsPerTurn = 2 where BuildingType = 'BUILDING_GREAT_LIGHTHOUSE';

--BUILDING_GREAT_ZIMBABWE
--grants a GREAT_PERSON_CLASS_MERCHANT
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_GREAT_ZIMBABWE', 'GREAT_ZIMBABWE_GRANTS_MERCHANT'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_GREAT_ZIMBABWE');

insert or replace into Modifiers	(ModifierId,ModifierType,	RunOnce,	Permanent) values
('GREAT_ZIMBABWE_GRANTS_MERCHANT',	'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',1,1);

insert or replace into ModifierArguments (ModifierId,	Name,	Value) values
('GREAT_ZIMBABWE_GRANTS_MERCHANT',	'Amount',	1),
('GREAT_ZIMBABWE_GRANTS_MERCHANT',	'GreatPersonClassType',	'GREAT_PERSON_CLASS_MERCHANT');

--BUILDING_BROADWAY
---grants a GREAT_PERSON_CLASS_MUSICIAN
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_BROADWAY', 'BROADWAY_GRANTS_MUSICIAN'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BROADWAY');

insert or replace into Modifiers	(ModifierId,ModifierType,	RunOnce,	Permanent) values
('BROADWAY_GRANTS_MUSICIAN',	'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',1,1);

insert or replace into ModifierArguments (ModifierId,	Name,	Value) values
('BROADWAY_GRANTS_MUSICIAN',	'Amount',	1),
('BROADWAY_GRANTS_MUSICIAN',	'GreatPersonClassType',	'GREAT_PERSON_CLASS_MUSICIAN');

--BUILDING_AMUNDSEN_SCOTT_RESEARCH_STATION
update Buildings set PrereqCivic = 'CIVIC_COLD_WAR' where BuildingType = 'BUILDING_AMUNDSEN_SCOTT_RESEARCH_STATION';

--BUILDING_UNIVERSITY_SANKORE
--remove all effects and make it more like a larger university
delete from BuildingModifiers where BuildingType = 'BUILDING_UNIVERSITY_SANKORE' and ModifierId !='TRAIT_FREE_BUILDER_AFTER_FININSHING_WONDER';

update Buildings set RegionalRange = 9 where BuildingType = 'BUILDING_UNIVERSITY_SANKORE';
update Building_YieldChanges set YieldChange = 5 where BuildingType = 'BUILDING_UNIVERSITY_SANKORE' and YieldType = 'YIELD_SCIENCE';

insert or replace into BuildingModifiers
	(BuildingType,						 ModifierId)
values
	('BUILDING_UNIVERSITY_SANKORE',		'UNIVERSITY_SANKORE_CAMPUS_DESERTADJACENCY'),
	('BUILDING_UNIVERSITY_SANKORE',		'UNIVERSITY_SANKORE_DESERT_SCIENCE'),
	('BUILDING_UNIVERSITY_SANKORE',		'UNIVERSITY_SANKORE_CAMPUS_DESERTHILLADJACENCY');

insert or replace into Modifiers	
	(ModifierId,										ModifierType,						SubjectRequirementSetId)
values	
	('UNIVERSITY_SANKORE_CAMPUS_DESERTADJACENCY',		'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY',NULL),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTHILLADJACENCY',	'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY',NULL),
	('UNIVERSITY_SANKORE_DESERT_SCIENCE',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'PETRA_YIELD_MODIFIER_REQUIREMENTS');

insert or replace into ModifierArguments 
	(ModifierId,										Name,					Value) 
values
	('UNIVERSITY_SANKORE_DESERT_SCIENCE',				'YieldType',			'YIELD_SCIENCE'),			
	('UNIVERSITY_SANKORE_DESERT_SCIENCE',				'Amount',				1),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTADJACENCY',		'DistrictType',			'DISTRICT_CAMPUS'),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTADJACENCY',		'TerrainType',			'TERRAIN_DESERT'),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTADJACENCY',		'YieldType'	,			'YIELD_SCIENCE'),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTADJACENCY',		'Amount',				1),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTADJACENCY',		'Description',			'LOC_DISTRICT_DESERT_SCIENCE'),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTHILLADJACENCY',	'DistrictType',			'DISTRICT_CAMPUS'),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTHILLADJACENCY',	'TerrainType',			'TERRAIN_DESERT_HILLS'),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTHILLADJACENCY',	'YieldType',			'YIELD_SCIENCE'),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTHILLADJACENCY',	'Amount',				1),
	('UNIVERSITY_SANKORE_CAMPUS_DESERTHILLADJACENCY',	'Description',			'LOC_DISTRICT_DESERT_HILLS_SCIENCE');

--BUILDING_STATUE_OF_ZEUS
---grants a GREAT_PERSON_CLASS_GENERAL
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_STATUE_OF_ZEUS', 'STATUE_OF_ZEUS_GRANTS_GENERAL'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_STATUE_OF_ZEUS');

insert or replace into Modifiers	(ModifierId,ModifierType,	RunOnce,	Permanent) values
('STATUE_OF_ZEUS_GRANTS_GENERAL',	'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',1,1);

insert or replace into ModifierArguments (ModifierId,	Name,	Value) values
('STATUE_OF_ZEUS_GRANTS_GENERAL',	'Amount',	1),
('STATUE_OF_ZEUS_GRANTS_GENERAL',	'GreatPersonClassType',	'GREAT_PERSON_CLASS_GENERAL');

--Great Library extra eruka boost 3%
insert or replace into BuildingModifiers
	(BuildingType,						 ModifierId)
values
	('BUILDING_GREAT_LIBRARY',			'GREAT_LIBRARY_BOOST_ERUKA');

insert or replace into Modifiers	
	(ModifierId,								ModifierType)
values	
	('GREAT_LIBRARY_BOOST_ERUKA',				'MODIFIER_PLAYER_ADJUST_TECHNOLOGY_BOOST');

insert or replace into ModifierArguments (ModifierId,	Name,	Value) values
	('GREAT_LIBRARY_BOOST_ERUKA',		'Amount',		3);

--BUILDING_MAHABODHI_TEMPLE PURCHASE_UNIT_APOSTLE_DISCOUNT
insert or replace into BuildingModifiers
	(BuildingType,						 ModifierId)
values
	('BUILDING_MAHABODHI_TEMPLE',		'MAHABODHI_TEMPLE_PURCHASE_UNIT_APOSTLE_DISCOUNT');

insert or replace into Modifiers	
	(ModifierId,										ModifierType)
values	
	('MAHABODHI_TEMPLE_PURCHASE_UNIT_APOSTLE_DISCOUNT','MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST');

insert or replace into ModifierArguments 
	(ModifierId,										Name,		Value) 
values
	('MAHABODHI_TEMPLE_PURCHASE_UNIT_APOSTLE_DISCOUNT',	'UnitType',	'UNIT_APOSTLE'),
	('MAHABODHI_TEMPLE_PURCHASE_UNIT_APOSTLE_DISCOUNT',	'Amount',	10);

--BUILDING_HAGIA_SOPHIA
insert or replace into BuildingModifiers
	(BuildingType,						 ModifierId)
values
	('BUILDING_HAGIA_SOPHIA',			'HAGIA_SOPHIA_CONVERT_FAITH');

insert or replace into Modifiers	
	(ModifierId,							ModifierType)
values	
	('HAGIA_SOPHIA_CONVERT_FAITH',			'MODIFIER_PLAYER_UNITS_ADJUST_INITIATION_YIELD_POPULATION');

insert or replace into ModifierArguments 
	(ModifierId,							Name,		Value) 
values
	('HAGIA_SOPHIA_CONVERT_FAITH',		'YieldType',	'YIELD_FAITH'),
	('HAGIA_SOPHIA_CONVERT_FAITH',		'Amount',		10);

--BUILDING_BIOSPHERE
update ModifierArguments set Value = 400 where ModifierId = 'BIOSPHERE_MODIFIED_FREE_POWER' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'BIOSPHERE_ADJUST_APPEAL_RAINFOREST' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'BIOSPHERE_ADJUST_APPEAL_MARSH' and Name = 'Amount';

--BUILDING_KOTOKU_IN
--grants all UNIT_WARRIOR_MONK trained in this city free Promotion
delete from BuildingModifiers where ModifierId = 'KOTOKU_GRANTMONKS';
insert or replace into BuildingModifiers
	(BuildingType,						 ModifierId)
values
	('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_1_EXPMONKS'),
	('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_2_EXPMONKS'),
	('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_3_EXPMONKS'),
	('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_4_EXPMONKS'),
	('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_MONKS_FREE_PROMOTION');

--'MODIFIER_PLAYER_UNIT_ADJUST_GRANT_EXPERIENCE'
insert or replace into Modifiers	
	(ModifierId,								ModifierType,					RunOnce,	Permanent)
values
	('KOTOKU_IN_GRANTS_1_EXPMONKS',				'MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_WITH_MODIFIER',1,1),
	('KOTOKU_IN_GRANTS_2_EXPMONKS',				'MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_WITH_MODIFIER',1,1),
	('KOTOKU_IN_GRANTS_3_EXPMONKS',				'MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_WITH_MODIFIER',1,1),
	('KOTOKU_IN_GRANTS_4_EXPMONKS',				'MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_WITH_MODIFIER',1,1),
	('KOTOKU_IN_GRANTS_MONKS_FREE_PROMOTION',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',0,1);
insert or replace into ModifierArguments 
	(ModifierId,								Name,			Value) 
values
	('KOTOKU_IN_GRANTS_MONKS_FREE_PROMOTION',	'AbilityType',	'ABILITY_KOTOKU_IN_TRAINED_FREE_PROMOTION'),
	('KOTOKU_IN_GRANTS_1_EXPMONKS',				'UnitPromotionClassType','PROMOTION_CLASS_MONK'),
	('KOTOKU_IN_GRANTS_1_EXPMONKS',				'ModifierId',	'HETAIROI_FREE_PROMOTION'),			
	('KOTOKU_IN_GRANTS_2_EXPMONKS',				'UnitPromotionClassType','PROMOTION_CLASS_MONK'),
	('KOTOKU_IN_GRANTS_2_EXPMONKS',				'ModifierId',	'HETAIROI_FREE_PROMOTION'),
	('KOTOKU_IN_GRANTS_3_EXPMONKS',				'UnitPromotionClassType','PROMOTION_CLASS_MONK'),
	('KOTOKU_IN_GRANTS_3_EXPMONKS',				'ModifierId',	'HETAIROI_FREE_PROMOTION'),
	('KOTOKU_IN_GRANTS_4_EXPMONKS',				'UnitPromotionClassType','PROMOTION_CLASS_MONK'),
	('KOTOKU_IN_GRANTS_4_EXPMONKS',				'ModifierId',	'HETAIROI_FREE_PROMOTION');
	-- ('KOTOKU_IN_GRANTS_1_EXPMONKS',				'UnitType',		'UNIT_WARRIOR_MONK'),
	-- ('KOTOKU_IN_GRANTS_1_EXPMONKS',				'Experience',	-1),
	-- ('KOTOKU_IN_GRANTS_1_EXPMONKS',				'UniqueOverride',1),
	-- ('KOTOKU_IN_GRANTS_2_EXPMONKS',				'UnitType',		'UNIT_WARRIOR_MONK'),
	-- ('KOTOKU_IN_GRANTS_2_EXPMONKS',				'Experience',	-1),
	-- ('KOTOKU_IN_GRANTS_2_EXPMONKS',				'UniqueOverride',1),
	-- ('KOTOKU_IN_GRANTS_3_EXPMONKS',				'UnitType',		'UNIT_WARRIOR_MONK'),
	-- ('KOTOKU_IN_GRANTS_3_EXPMONKS',				'Experience',	-1),
	-- ('KOTOKU_IN_GRANTS_3_EXPMONKS',				'UniqueOverride',1),
	--('KOTOKU_IN_GRANTS_4_EXPMONKS',				'UnitType',		'UNIT_SPY'),
	--('KOTOKU_IN_GRANTS_4_EXPMONKS',				'Experience',	-1),
	--('KOTOKU_IN_GRANTS_4_EXPMONKS',				'UniqueOverride',1);

-- Hanging Garden food buff
delete from BuildingModifiers where ModifierId = 'HANGING_GARDEN_ADDGROWTH';

insert or replace into BuildingModifiers
	(BuildingType,						 ModifierId)
values
	('BUILDING_HANGING_GARDENS',	'HANGING_GARDEN_ADDFOOD');

insert or replace into Modifiers	
	(ModifierId,								ModifierType	)
values
	('HANGING_GARDEN_ADDFOOD',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER');

insert or replace into ModifierArguments 
	(ModifierId,								Name,			Value) 
values
('HANGING_GARDEN_ADDFOOD','YieldType','YIELD_FOOD'),
('HANGING_GARDEN_ADDFOOD','Amount',10);

update Buildings set Housing = 1 where BuildingType = 'BUILDING_HANGING_GARDENS';

insert or replace into Building_YieldChanges
	(BuildingType,  YieldType,	YieldChange)
values
('BUILDING_HANGING_GARDENS','YIELD_FOOD', 4);

update Buildings set cost = 220 where BuildingType = 'BUILDING_HANGING_GARDENS';

-- Jebel region 9
update Buildings set RegionalRange = 9 where BuildingType = 'BUILDING_JEBEL_BARKAL';

-- Cristo redentor faith discount 15%
insert or replace into BuildingModifiers (BuildingType,	 ModifierId)  values
	('BUILDING_CRISTO_REDENTOR',	'ORACLE_PATRONAGE_FAITH_DISCOUNT');

-- colossus grants trade route yield from IMPROVEMENT_FISHING_BOATS each 2 gold
insert or replace into ImprovementModifiers (ImprovementType,	 ModifierId)  values
	('IMPROVEMENT_FISHING_BOATS',		'COLOSSUS_TRADE_ROUTE_FISHINGBOAT_GOLD');

insert or replace into Modifiers(ModifierId, ModifierType, SubjectRequirementSetId) values
	('COLOSSUS_TRADE_ROUTE_FISHINGBOAT_GOLD', 'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', 'CITY_HAS_COLOSSUS');

insert or replace into ModifierArguments 
	(ModifierId,								Name,			Value) 
values
	('COLOSSUS_TRADE_ROUTE_FISHINGBOAT_GOLD', 	'YieldType',	'YIELD_GOLD'),
	('COLOSSUS_TRADE_ROUTE_FISHINGBOAT_GOLD',	'Amount',		2);

-- BUILDING_MACHU_PICCHU to guilds 710 add food to mountain districts
update Buildings set PrereqTech = NULL, PrereqCivic = 'CIVIC_GUILDS', Cost = 710 
	where BuildingType = 'BUILDING_MACHU_PICCHU';

insert or replace into BuildingModifiers (BuildingType,	ModifierId)values
('BUILDING_MACHU_PICCHU', 'MACHU_PICCHU_DISTRICT_FOOD');
	
insert or replace into Modifiers(ModifierId, 	ModifierType, 	SubjectRequirementSetId) values 
('MACHU_PICCHU_DISTRICT_FOOD', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'PLOT_ADJACENT_TO_MOUNTAIN');

insert or replace into ModifierArguments (ModifierId,	Name, Value) values
('MACHU_PICCHU_DISTRICT_FOOD',	'Amount', 2),
('MACHU_PICCHU_DISTRICT_FOOD',	'YieldType', 'YIELD_FOOD');

-- huey lake +1 food
update Buildings set PrereqTech = 'TECH_ENGINEERING', Cost = 400 
	where BuildingType = 'BUILDING_HUEY_TEOCALLI';
update ModifierArguments set Value = 2 where ModifierId = 'HUEY_LAKE_FOOD_MODIFIER' and Name = 'Amount';

--liberty to colonialism
update Buildings set PrereqCivic = 'CIVIC_COLONIALISM'
	where BuildingType = 'BUILDING_STATUE_LIBERTY';

--Hagia Sophia
update Modifiers set SubjectRequirementSetId = 'HAGIA_SOPHIA_REQUIREMENTS' where ModifierId = 'HAGIA_SOPHIA_ADJUST_RELIGIOUS_CHARGES';

insert or replace into RequirementSetRequirements 	(RequirementSetId, RequirementId)	
values
	('HAGIA_SOPHIA_REQUIREMENTS',		'REQUIRES_UNIT_IS_MISSIONARY'),
	('HAGIA_SOPHIA_REQUIREMENTS',		'REQUIRES_UNIT_IS_APOSTLE');

insert or replace into RequirementSets (RequirementSetId,	RequirementSetType)	
values
	('HAGIA_SOPHIA_REQUIREMENTS',		'REQUIREMENTSET_TEST_ANY');

-- Adjust the Cost.
update Buildings set Cost = 180 where BuildingType = 'BUILDING_STONEHENGE';
update Buildings set Cost = 220 where BuildingType = 'BUILDING_HANGING_GARDENS';
update Buildings set Cost = 220 where BuildingType = 'BUILDING_PYRAMIDS';
update Buildings set Cost = 300 where BuildingType = 'BUILDING_ORACLE';
update Buildings set Cost = 300 where BuildingType = 'BUILDING_GREAT_LIGHTHOUSE';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_COLOSSUS';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_PETRA';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_COLOSSEUM';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_GREAT_LIBRARY';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_MAHABODHI_TEMPLE';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_TERRACOTTA_ARMY';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_HAGIA_SOPHIA';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_ALHAMBRA';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_CHICHEN_ITZA';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_MONT_ST_MICHEL';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_VENETIAN_ARSENAL';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_GREAT_ZIMBABWE';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_FORBIDDEN_CITY';
update Buildings set Cost = 1160 where BuildingType = 'BUILDING_POTALA_PALACE';
update Buildings set Cost = 1360 where BuildingType = 'BUILDING_RUHR_VALLEY';
update Buildings set Cost = 1360 where BuildingType = 'BUILDING_BOLSHOI_THEATRE';
update Buildings set Cost = 1360 where BuildingType = 'BUILDING_OXFORD_UNIVERSITY';
update Buildings set Cost = 1600 where BuildingType = 'BUILDING_BIG_BEN';
update Buildings set Cost = 1600 where BuildingType = 'BUILDING_HERMITAGE';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_EIFFEL_TOWER';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_BROADWAY';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_CRISTO_REDENTOR';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_ESTADIO_DO_MARACANA';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_SYDNEY_OPERA_HOUSE';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_HUEY_TEOCALLI';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_ANGKOR_WAT';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_JEBEL_BARKAL';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_APADANA';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_HALICARNASSUS_MAUSOLEUM';
update Buildings set Cost = 180 where BuildingType = 'BUILDING_TEMPLE_ARTEMIS';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_KILWA_KISIWANI';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_KOTOKU_IN';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_CASA_DE_CONTRATACION';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_ST_BASILS_CATHEDRAL';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_TAJ_MAHAL';
update Buildings set Cost = 1360 where BuildingType = 'BUILDING_STATUE_LIBERTY';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_AMUNDSEN_SCOTT_RESEARCH_STATION';
update Buildings set Cost = 180 where BuildingType = 'BUILDING_GREAT_BATH';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_MACHU_PICCHU';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_MEENAKSHI_TEMPLE';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_UNIVERSITY_SANKORE';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_ORSZAGHAZ';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_PANAMA_CANAL';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_GOLDEN_GATE_BRIDGE';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_STATUE_OF_ZEUS';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_BIOSPHERE';
update Buildings set Cost = 220 where BuildingType = 'BUILDING_ETEMENANKI';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_TORRE_DE_BELEM';
