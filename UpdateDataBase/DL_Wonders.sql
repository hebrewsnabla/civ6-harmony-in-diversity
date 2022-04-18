-------------------------------------
--       Wonders Adjustments       --
-------------------------------------

-- TODO: fix the bug for slot wonders.
-- delete from BuildingModifiers where
-- 	ModifierId = 'ALHAMBRA_MILITARY_GOVERNMENT_SLOT' or
-- 	ModifierId = 'BIG_BEN_ECONOMIC_GOVERNMENT_SLOT' or
-- 	ModifierId = 'POTALA_PALACE_DIPLOMATIC_GOVERNMENT_SLOT' or
-- 	ModifierId = 'FORBIDDEN_CITY_WILDCARD_GOVERNMENT_SLOT';

-- Alhambra
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_ALHAMBRA',			'ALHAMBRA_ENCAMPMENT_INFLUENCE_POINTS_ATTACH');

insert or replace into Modifiers
	(ModifierId,										ModifierType,											SubjectRequirementSetId)
values
	('ALHAMBRA_ENCAMPMENT_INFLUENCE_POINTS_ATTACH',		'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',			'DISTRICT_IS_ENCAMPMENT'),
	('ALHAMBRA_ENCAMPMENT_INFLUENCE_POINTS',			'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',		Null);

insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
values
	('ALHAMBRA_ENCAMPMENT_INFLUENCE_POINTS_ATTACH',		'ModifierId',	'ALHAMBRA_ENCAMPMENT_INFLUENCE_POINTS'),
	('ALHAMBRA_ENCAMPMENT_INFLUENCE_POINTS',			'Amount',		2);

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
update Buildings set PrereqTech = 'TECH_CURRENCY' where BuildingType = 'BUILDING_PETRA';
update ModifierArguments set Value = '3,2,1' where ModifierId = 'PETRA_YIELD_MODIFIER' and Name = 'Amount';

-- MEENAKSHI_TEMPLE
update Buildings set PrereqCivic = 'CIVIC_DIVINE_RIGHT' where BuildingType = 'BUILDING_MEENAKSHI_TEMPLE';

--STBASILS
update ModifierArguments set Value = 2 where ModifierId = 'STBASILS_ADDFOOD_MODIFIER' and Name = 'Amount';
--chichen itza
update Buildings set PrereqCivic = 'CIVIC_FEUDALISM' where BuildingType = 'BUILDING_CHICHEN_ITZA';

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('BUILDING_CHICHEN_ITZA',				'CHICHEN_ITZA_JUNGLE_FOOD'),
	('BUILDING_CHICHEN_ITZA',				'CHICHEN_ITZA_GOLDEN_FAITH'),
	('BUILDING_CHICHEN_ITZA',				'CHICHEN_ITZA_NORMAL_PRODUCTION');

insert or replace into Modifiers
	(ModifierId, 							ModifierType,												SubjectRequirementSetId)
values
	('CHICHEN_ITZA_JUNGLE_FOOD',			'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',						'CITY_HAS_CHICHEN_ITZA_REQUIREMENTS'),
	('CHICHEN_ITZA_JUNGLE_FOOD_MODIFIER',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',				'PLOT_HAS_JUNGLE_REQUIREMENTS'),
	('CHICHEN_ITZA_GOLDEN_FAITH',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'PLAYER_HAS_GOLDEN_AGE'),
	('CHICHEN_ITZA_NORMAL_PRODUCTION',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'PLAYER_NOT_HAS_GOLDEN_AGE');

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
values
	('CHICHEN_ITZA_JUNGLE_FOOD',				'ModifierId',			'CHICHEN_ITZA_JUNGLE_FOOD_MODIFIER'),		
	('CHICHEN_ITZA_JUNGLE_FOOD_MODIFIER',		'YieldType',			'YIELD_FOOD'),
	('CHICHEN_ITZA_JUNGLE_FOOD_MODIFIER',		'Amount',				1),
	('CHICHEN_ITZA_GOLDEN_FAITH',				'YieldType',			'YIELD_FAITH'),
	('CHICHEN_ITZA_GOLDEN_FAITH',				'Amount',				10),
	('CHICHEN_ITZA_NORMAL_PRODUCTION',			'YieldType',			'YIELD_PRODUCTION'),
	('CHICHEN_ITZA_NORMAL_PRODUCTION',			'Amount',				10);

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

--BUILDING_PANAMA_CANAL
--grants a GREAT_PERSON_CLASS_MERCHANT
insert or ignore into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_PANAMA_CANAL', 'PANAMA_CANAL_GRANTS_MERCHANT'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_PANAMA_CANAL');

insert or ignore into Modifiers	(ModifierId,ModifierType,	RunOnce,	Permanent) values
('PANAMA_CANAL_GRANTS_MERCHANT',	'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',1,1);

insert or ignore into ModifierArguments (ModifierId,	Name,	Value) values
('PANAMA_CANAL_GRANTS_MERCHANT',	'Amount',	1),
('PANAMA_CANAL_GRANTS_MERCHANT',	'GreatPersonClassType',	'GREAT_PERSON_CLASS_MERCHANT');

--BUILDING_GREAT_ZIMBABWE
update Buildings set PrereqTech = 'TECH_APPRENTICESHIP', Cost = 750 where BuildingType = 'BUILDING_GREAT_ZIMBABWE';
update ModifierArguments set Value = 3 where ModifierId = 'GREAT_ZIMBABWE_DOMESTICBONUSRESOURCEGOLD' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'GREAT_ZIMBABWE_INTERNATIONALBONUSRESOURCEGOLD' and Name = 'Amount';

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

update ModifierArguments set Value = 30 where ModifierId = 'BROADWAY_ADDCULTUREYIELD' and Name = 'Amount';

insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_BROADWAY', 'BROADWAY_REGIONAL_POP_CULTURE'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BROADWAY');

insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_BROADWAY', 'BROADWAY_MUSICIAN_POINTS'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BROADWAY');

insert or replace into Modifiers	
	(ModifierId,								ModifierType,												SubjectRequirementSetId) 
values
	('BROADWAY_REGIONAL_POP_CULTURE',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BROADWAY_WITHIN_6_REQUIREMENTS'),
	('BROADWAY_MUSICIAN_POINTS',				'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT',		Null);

insert or replace into ModifierArguments
	(ModifierId,								Name,					Value) 
values
	('BROADWAY_REGIONAL_POP_CULTURE',			'YieldType',			'YIELD_CULTURE'),
	('BROADWAY_REGIONAL_POP_CULTURE',			'Amount',				1),
	('BROADWAY_MUSICIAN_POINTS',				'GreatPersonClassType',	'GREAT_PERSON_CLASS_MUSICIAN'),
	('BROADWAY_MUSICIAN_POINTS',				'Amount',				50);

insert or ignore into RequirementArguments (RequirementId,		Name,		Value) values
	('REQUIRES_PLOT_HAS_BROADWAY_WITHIN_6',		'BuildingType',	'BUILDING_BROADWAY'),
	('REQUIRES_PLOT_HAS_BROADWAY_WITHIN_6',		'MinRange',		0),
	('REQUIRES_PLOT_HAS_BROADWAY_WITHIN_6',		'MaxRange',		6);

insert or ignore into Requirements (RequirementId,		RequirementType) values
	('REQUIRES_PLOT_HAS_BROADWAY_WITHIN_6',		'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES');

insert or ignore into RequirementSets (RequirementSetId,		RequirementSetType) values
	('BROADWAY_WITHIN_6_REQUIREMENTS',							'REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSetRequirements (RequirementSetId,	RequirementId) values
	('BROADWAY_WITHIN_6_REQUIREMENTS',							'REQUIRES_PLOT_HAS_BROADWAY_WITHIN_6');

--BUILDING_AMUNDSEN_SCOTT_RESEARCH_STATION
update Buildings set PrereqCivic = 'CIVIC_COLD_WAR' where BuildingType = 'BUILDING_AMUNDSEN_SCOTT_RESEARCH_STATION';

--BUILDING_UNIVERSITY_SANKORE
--remove all effects and make it more like a larger university
delete from BuildingModifiers where BuildingType = 'BUILDING_UNIVERSITY_SANKORE' and ModifierId !='TRAIT_FREE_BUILDER_AFTER_FININSHING_WONDER';

update Buildings set RegionalRange = 6 where BuildingType = 'BUILDING_UNIVERSITY_SANKORE';
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
update Buildings set PrereqTech = 'TECH_APPRENTICESHIP', PrereqCivic = NULL, Cost = 710 
	where BuildingType = 'BUILDING_MACHU_PICCHU';

insert or replace into BuildingModifiers (BuildingType,	ModifierId)values
('BUILDING_MACHU_PICCHU', 'MACHU_PICCHU_DISTRICT_FOOD');
	
insert or replace into Modifiers(ModifierId, 	ModifierType, 	SubjectRequirementSetId) values 
('MACHU_PICCHU_DISTRICT_FOOD', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'PLOT_ADJACENT_TO_MOUNTAIN_IS_NOT_WONDER_REQUIREMENTS');

insert or replace into ModifierArguments (ModifierId,	Name, Value) values
('MACHU_PICCHU_DISTRICT_FOOD',	'Amount', 2),
('MACHU_PICCHU_DISTRICT_FOOD',	'YieldType', 'YIELD_FOOD');

--liberty to colonialism
update Buildings set PrereqCivic = 'CIVIC_COLONIALISM'
	where BuildingType = 'BUILDING_STATUE_LIBERTY';

--Hagia Sophia
update Modifiers set SubjectRequirementSetId = 'HAGIA_SOPHIA_REQUIREMENTS' where ModifierId = 'HAGIA_SOPHIA_ADJUST_RELIGIOUS_CHARGES';

insert or ignore into RequirementSetRequirements 	(RequirementSetId, RequirementId)	
values
	('HAGIA_SOPHIA_REQUIREMENTS',		'REQUIRES_UNIT_IS_MISSIONARY'),
	('HAGIA_SOPHIA_REQUIREMENTS',		'REQUIRES_UNIT_IS_APOSTLE');

insert or ignore into RequirementSets (RequirementSetId,	RequirementSetType)	
values
	('HAGIA_SOPHIA_REQUIREMENTS',		'REQUIREMENTSET_TEST_ANY');

--hermitage
UPDATE Buildings SET RegionalRange = 9, Entertainment = 1 WHERE BuildingType = 'BUILDING_HERMITAGE';

insert or replace into Building_YieldChanges
	(BuildingType,						YieldType,				YieldChange)
values
	('BUILDING_HERMITAGE',				'YIELD_CULTURE',		8),
	('BUILDING_HERMITAGE',				'YIELD_FAITH',			8);

insert or replace into BuildingModifiers
	(BuildingType,				ModifierId)
values
	('BUILDING_HERMITAGE',		'HERMITAGE_THEATER_BUILDING_BOOST'),
	('BUILDING_HERMITAGE',		'HERMITAGE_ARTIFACT_TOURISM_BOOST');

insert or replace into Modifiers
	(ModifierId,										ModifierType,											SubjectRequirementSetId)
values
	('HERMITAGE_THEATER_BUILDING_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',	Null),
	('HERMITAGE_ARTIFACT_TOURISM_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',				'HD_OBJECT_WITHIN_9_TILES');

insert or replace into ModifierArguments
	(ModifierId,										Name, 						Value)
values
	('HERMITAGE_THEATER_BUILDING_BOOST',				'DistrictType',				'DISTRICT_THEATER'),
	('HERMITAGE_THEATER_BUILDING_BOOST',				'Amount',					50),
	('HERMITAGE_ARTIFACT_TOURISM_BOOST',  				'GreatWorkObjectType',      'GREATWORKOBJECT_ARTIFACT'),
    ('HERMITAGE_ARTIFACT_TOURISM_BOOST',  				'ScalingFactor',            300);

-- sydney opera house

insert or replace into BuildingModifiers
	(BuildingType, 					ModifierId)
values
	('BUILDING_SYDNEY_OPERA_HOUSE', 'OPERAHOUSE_ADD_WONDER_TOURISM'),
	('BUILDING_SYDNEY_OPERA_HOUSE',	'OPERAHOUSE_ADD_MUSIC_TOURISM'),
	('BUILDING_SYDNEY_OPERA_HOUSE', 'OPERAHOUSE_ADD_WRITING_TOURISM'),
	('BUILDING_SYDNEY_OPERA_HOUSE', 'OPERAHOUSE_ADD_ARTIFACTS_TOURISM'),
	('BUILDING_SYDNEY_OPERA_HOUSE', 'OPERAHOUSE_ADD_RELIC_TOURISM'),
	('BUILDING_SYDNEY_OPERA_HOUSE', 'OPERAHOUSE_ADD_LANDSCAPE_TOURISM'),
	('BUILDING_SYDNEY_OPERA_HOUSE', 'OPERAHOUSE_ADD_RELIGIOUS_TOURISM'),
	('BUILDING_SYDNEY_OPERA_HOUSE', 'OPERAHOUSE_ADD_PORTRAIT_TOURISM'),
	('BUILDING_SYDNEY_OPERA_HOUSE', 'OPERAHOUSE_ADD_SCULPTURE_TOURISM');
	
insert or replace into Modifiers
	(ModifierId,						ModifierType,							SubjectRequirementSetId)
values
	('OPERAHOUSE_ADD_WONDER_TOURISM',  	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM','CITY_HAS_GOVERNOR_FOUNDED'),
	('OPERAHOUSE_ADD_MUSIC_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM','CITY_HAS_GOVERNOR_FOUNDED'),
	('OPERAHOUSE_ADD_WRITING_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM','CITY_HAS_GOVERNOR_FOUNDED'),
	('OPERAHOUSE_ADD_ARTIFACTS_TOURISM','MODIFIER_PLAYER_CITIES_ADJUST_TOURISM','CITY_HAS_GOVERNOR_FOUNDED'),
	('OPERAHOUSE_ADD_RELIC_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM','CITY_HAS_GOVERNOR_FOUNDED'),
	('OPERAHOUSE_ADD_LANDSCAPE_TOURISM','MODIFIER_PLAYER_CITIES_ADJUST_TOURISM','CITY_HAS_GOVERNOR_FOUNDED'),
	('OPERAHOUSE_ADD_RELIGIOUS_TOURISM','MODIFIER_PLAYER_CITIES_ADJUST_TOURISM','CITY_HAS_GOVERNOR_FOUNDED'),
	('OPERAHOUSE_ADD_PORTRAIT_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM','CITY_HAS_GOVERNOR_FOUNDED'),
	('OPERAHOUSE_ADD_SCULPTURE_TOURISM','MODIFIER_PLAYER_CITIES_ADJUST_TOURISM','CITY_HAS_GOVERNOR_FOUNDED');

insert or replace into ModifierArguments 
	(ModifierId,							Name,					Value) 
values 
	('OPERAHOUSE_ADD_WONDER_TOURISM',		'BoostsWonders',		1),
	('OPERAHOUSE_ADD_WONDER_TOURISM',		'ScalingFactor',		200),
	('OPERAHOUSE_ADD_RELIC_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_RELIC'),
	('OPERAHOUSE_ADD_RELIC_TOURISM',		'ScalingFactor',		200),
	('OPERAHOUSE_ADD_WRITING_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_WRITING'),	
	('OPERAHOUSE_ADD_WRITING_TOURISM',		'ScalingFactor',		200),
	('OPERAHOUSE_ADD_SCULPTURE_TOURISM',	'GreatWorkObjectType',	'GREATWORKOBJECT_SCULPTURE'),
	('OPERAHOUSE_ADD_SCULPTURE_TOURISM',	'ScalingFactor',		200),
	('OPERAHOUSE_ADD_PORTRAIT_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_PORTRAIT'),
	('OPERAHOUSE_ADD_PORTRAIT_TOURISM',		'ScalingFactor',		200),
	('OPERAHOUSE_ADD_ARTIFACTS_TOURISM',	'GreatWorkObjectType',	'GREATWORKOBJECT_ARTIFACT'),
	('OPERAHOUSE_ADD_ARTIFACTS_TOURISM',	'ScalingFactor',		200),
	('OPERAHOUSE_ADD_RELIGIOUS_TOURISM',	'GreatWorkObjectType',	'GREATWORKOBJECT_RELIGIOUS'),
	('OPERAHOUSE_ADD_RELIGIOUS_TOURISM',	'ScalingFactor',		200),	
	('OPERAHOUSE_ADD_LANDSCAPE_TOURISM',	'GreatWorkObjectType',	'GREATWORKOBJECT_LANDSCAPE'),
	('OPERAHOUSE_ADD_LANDSCAPE_TOURISM',	'ScalingFactor',		200),
	('OPERAHOUSE_ADD_MUSIC_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_MUSIC'),
	('OPERAHOUSE_ADD_MUSIC_TOURISM',		'ScalingFactor',		300);

-- Ruhr Valley
update ModifierArguments set Value = 2 where ModifierId = 'RUHR_VALLEY_PRODUCTION_MODIFIER' and Name = 'Amount';

insert or replace into BuildingModifiers
	(BuildingType, 					ModifierId)
values
	('BUILDING_RUHR_VALLEY',		'RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_FROM_OTHERS'),
	('BUILDING_RUHR_VALLEY',		'RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_DOM_OTHERS'),
	('BUILDING_RUHR_VALLEY',		'RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_TO_OTHERS');

insert or replace into Modifiers
	(ModifierId,										ModifierType)
values
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_FROM_OTHERS',	'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS'),
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_DOM_OTHERS',	'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS'),
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_TO_OTHERS',  	'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS');

insert or replace into ModifierArguments 
	(ModifierId,										Name,			Value) 
values 
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_FROM_OTHERS',	'YieldType',	'YIELD_PRODUCTION'),
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_FROM_OTHERS',	'Amount',		3),
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_DOM_OTHERS',	'YieldType',	'YIELD_PRODUCTION'),
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_DOM_OTHERS',	'Amount',		5),
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_DOM_OTHERS',	'Domestic',		1),
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_TO_OTHERS',	'YieldType',	'YIELD_PRODUCTION'),
	('RUHR_VALLEY_TRADE_ROUTE_PRODUCTION_TO_OTHERS',	'Amount',		3);

-- Venetian Arsenal 
insert or replace into BuildingModifiers
	(BuildingType, 					ModifierId)
values
	-- ('BUILDING_RUHR_VALLEY',		'RUHR_VALLEY_GRANT_SIX_COAL_PER_TURN'),
	--('BUILDING_VENETIAN_ARSENAL', 	'VENETIAN_ARSENAL_EXTRANAVALRAIDER'),
	('BUILDING_VENETIAN_ARSENAL',	'VENETIAN_ARSENAL_GRANT_SIX_NITER_PER_TURN'),
	('BUILDING_VENETIAN_ARSENAL', 	'VENETIAN_ARSENAL_COAST_PRODUCTION'),
	('BUILDING_VENETIAN_ARSENAL', 	'VENETIAN_ARSENAL_COAST_GOLD');
	
insert or replace into Modifiers
	(ModifierId,									ModifierType,											SubjectRequirementSetId)
values
	('RUHR_VALLEY_GRANT_SIX_COAL_PER_TURN',			'MODIFIER_SINGLE_CITY_ADJUST_FREE_RESOURCE_EXTRACTION',	NULL),
	--('VENETIAN_ARSENAL_EXTRANAVALRAIDER',  			'MODIFIER_PLAYER_CITIES_ADJUST_EXTRA_UNIT_COPY_TAG',	NULL),
	('VENETIAN_ARSENAL_GRANT_SIX_NITER_PER_TURN',	'MODIFIER_SINGLE_CITY_ADJUST_FREE_RESOURCE_EXTRACTION',	NULL),
	('VENETIAN_ARSENAL_COAST_PRODUCTION',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'PLOT_IS_COAST_NOT_LAKE_REQUIREMENTS'),
	('VENETIAN_ARSENAL_COAST_GOLD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',			'PLOT_IS_COAST_NOT_LAKE_REQUIREMENTS');

insert or replace into ModifierArguments 
	(ModifierId,									Name,				Value) 
values 
	('RUHR_VALLEY_GRANT_SIX_COAL_PER_TURN',			'ResourceType',		'RESOURCE_COAL'),
	('RUHR_VALLEY_GRANT_SIX_COAL_PER_TURN',			'Amount',			6),
	--('VENETIAN_ARSENAL_EXTRANAVALRAIDER',  			'Tag',				'CLASS_NAVAL_RAIDER'),
	--('VENETIAN_ARSENAL_EXTRANAVALRAIDER',  			'Amount',			1),
	('VENETIAN_ARSENAL_GRANT_SIX_NITER_PER_TURN',	'ResourceType',		'RESOURCE_NITER'),
	('VENETIAN_ARSENAL_GRANT_SIX_NITER_PER_TURN',	'Amount',			6),
	('VENETIAN_ARSENAL_COAST_PRODUCTION',			'YieldType',		'YIELD_PRODUCTION'),
	('VENETIAN_ARSENAL_COAST_PRODUCTION',			'Amount', 			1),
	('VENETIAN_ARSENAL_COAST_GOLD',					'YieldType',		'YIELD_GOLD'),
	('VENETIAN_ARSENAL_COAST_GOLD',					'Amount', 			1);

-- Terracotta Army
update ModifierArguments set Value = 30 where ModifierId = 'TERRACOTTA_ARMY_LEVEL_UP_UNITS' and Name = 'Amount';
insert or replace into BuildingModifiers
	(BuildingType, 					ModifierId)
values
	('BUILDING_TERRACOTTA_ARMY',	'TERRACOTTA_ARMY_ARCHAEOLOGIST_IGNORE_HILLS'),
	('BUILDING_TERRACOTTA_ARMY',	'TERRACOTTA_ARMY_ARCHAEOLOGIST_IGNORE_FOREST');

insert or replace into Modifiers
	(ModifierId,										ModifierType)
values
	('TERRACOTTA_ARMY_ARCHAEOLOGIST_IGNORE_HILLS',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
	('TERRACOTTA_ARMY_ARCHAEOLOGIST_IGNORE_FOREST',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

insert or replace into ModifierArguments 
	(ModifierId,									Name,				Value) 
values 
	('TERRACOTTA_ARMY_ARCHAEOLOGIST_IGNORE_HILLS',	'AbilityType',		'ABILITY_ARCHAEOLOGIST_IGNORE_HILLS'),
	('TERRACOTTA_ARMY_ARCHAEOLOGIST_IGNORE_FOREST',	'AbilityType',		'ABILITY_ARCHAEOLOGIST_IGNORE_FOREST');

-- MEENAKSHI_TEMPLE
delete from BuildingModifiers where BuildingType = 'BUILDING_MEENAKSHI_TEMPLE';
update UnitAbilities set Inactive = 0 where UnitAbilityType = 'ABILITY_SAGE_COMBAT_AOE_RELIGIOUS' or UnitAbilityType = 'ABILITY_GUIDE_MOVEMENT_AOE_RELIGIOUS';
-- update ModifierArguments set Value = 1 where ModifierId = 'MEENAKSHITEMPLE_FREE_GURU' and Name = 'Amount';
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
    ('BUILDING_MEENAKSHI_TEMPLE',           'MEENAKSHITEMPLE_FREE_GURU'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_BUILDER_PURCHASE'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_SETTLER_PURCHASE'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_HOLY_SITE_FOOD'),
	-- ('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_DISTRICT_HOLY_SITE_FOOD'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_SHRINE_FOOD'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_TEMPLE_FOOD');

insert or replace into Modifiers
	(ModifierId, 									ModifierType,											SubjectRequirementSetId)
values
	('MEENAKSHI_BUILDER_PURCHASE',					'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE',	NULL),
	('MEENAKSHI_SETTLER_PURCHASE',					'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE',	NULL),
	('MEENAKSHI_HOLY_SITE_FOOD',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',		'DISTRICT_IS_HOLY_SITE'),
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD',			'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',			'DISTRICT_IS_HOLY_SITE'),
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD_MODIFIER',  'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                    'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('MEENAKSHI_SHRINE_FOOD',						'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',			'HD_HOLY_SITE_HAS_SHRINE'),
	('MEENAKSHI_SHRINE_FOOD_MODIFIER',  			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                    'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('MEENAKSHI_TEMPLE_FOOD',						'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',			'HD_HOLY_SITE_HAS_TEMPLE'),
	('MEENAKSHI_TEMPLE_FOOD_MODIFIER',  			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                    'REQUIRE_PLOT_ADJACENT_TO_OWNER');

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	('MEENAKSHI_BUILDER_PURCHASE',					'Tag',			'CLASS_BUILDER'),		
	('MEENAKSHI_SETTLER_PURCHASE',					'Tag',			'CLASS_SETTLER'),
	('MEENAKSHI_HOLY_SITE_FOOD',					'YieldType',	'YIELD_FOOD'),
	('MEENAKSHI_HOLY_SITE_FOOD',					'Amount',		1),
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD',           'ModifierId',  	'MEENAKSHI_DISTRICT_HOLY_SITE_FOOD_MODIFIER'),	
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD_MODIFIER',	'YieldType',   	'YIELD_FOOD'),
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD_MODIFIER',	'Amount',	   	1),
	('MEENAKSHI_SHRINE_FOOD',             			'ModifierId',  	'MEENAKSHI_SHRINE_FOOD_MODIFIER'),
	('MEENAKSHI_SHRINE_FOOD_MODIFIER',    			'YieldType',   	'YIELD_FOOD'),
	('MEENAKSHI_SHRINE_FOOD_MODIFIER',    			'Amount',	   	1),
	('MEENAKSHI_TEMPLE_FOOD',              			'ModifierId',  	'MEENAKSHI_TEMPLE_FOOD_MODIFIER'),
	('MEENAKSHI_TEMPLE_FOOD_MODIFIER',				'YieldType',   	'YIELD_FOOD'),
	('MEENAKSHI_TEMPLE_FOOD_MODIFIER',				'Amount',      	1);

insert or ignore into RequirementSetRequirements
	(RequirementSetId,								RequirementId)
values
	('HD_HOLY_SITE_HAS_SHRINE',                     'REQUIRES_DISTRICT_IS_HOLY_SITE'),
	('HD_HOLY_SITE_HAS_SHRINE',                     'REQUIRES_CITY_HAS_SHRINE'),
	('HD_HOLY_SITE_HAS_TEMPLE',                     'REQUIRES_DISTRICT_IS_HOLY_SITE'),
	('HD_HOLY_SITE_HAS_TEMPLE',                     'REQUIRES_CITY_HAS_TEMPLE');

insert or ignore into RequirementSets
	(RequirementSetId,                           	RequirementSetType)
values
	('HD_HOLY_SITE_HAS_SHRINE',       				'REQUIREMENTSET_TEST_ALL'),
	('HD_HOLY_SITE_HAS_TEMPLE',       				'REQUIREMENTSET_TEST_ALL');

-- unlock
	-- 【泰姬陵】改为【物理】科技解锁
update Buildings set PrereqCivic = Null, PrereqTech = 'TECH_PHYSICS_HD' where BuildingType = 'BUILDING_TAJ_MAHAL';--xhh

	-- 【金门大桥】改为【钢铁】科技解锁
update Buildings set PrereqCivic = Null, PrereqTech = 'TECH_STEEL' where BuildingType = 'BUILDING_GOLDEN_GATE_BRIDGE';--xhh

	-- 【兵马俑】改为【后勤补给】市政解锁
update Buildings set PrereqCivic = 'CIVIC_DEFENSIVE_TACTICS', PrereqTech = Null where BuildingType = 'BUILDING_TERRACOTTA_ARMY';--xhh

-- Kilwa
	-- 【基尔瓦基斯瓦尼】改为【罗盘】科技解锁
update Buildings set PrereqTech = 'TECH_COMPASS_HD' where BuildingType = 'BUILDING_KILWA_KISIWANI';--xhh
update ModifierArguments set Value = 15 where Name = 'Amount' and ModifierId like 'KILWA_SINGLE_ADD%';
update ModifierArguments set Value = 15 where Name = 'Amount' and ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDFOODYIELD';

update ModifierArguments set Value = 5 where ModifierId = 'KILWA_THREE_INFLUENCE_TOKENS';

delete from BuildingModifiers where BuildingType = 'BUILDING_KILWA_KISIWANI' and ModifierId like 'KILWA_PLAYERCITIES_ADD%';
delete from BuildingModifiers where BuildingType = 'BUILDING_KILWA_KISIWANI' and ModifierId = 'CVS_CITYSTATE_KILWA_PLAYERCITIES_ADDFOODYIELD';
-- Maritime
delete from BuildingModifiers where BuildingType = 'BUILDING_KILWA_KISIWANI' and ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORPRODUCTION'; -- leave the food one to be modified
delete from BuildingModifiers where BuildingType = 'BUILDING_KILWA_KISIWANI' and ModifierId like 'CVS_CITYSTATE_KILWA_PLAYERCITIES_ADDHARBOR%';
-- update ModifierArguments set Value = 'YIELD_GOLD' where Name = 'YieldType' and ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORFOOD';
update ModifierArguments set Value = 15 where Name = 'Amount' and ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORFOOD';
-- update BuildingModifiers set ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORGOLD' where ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORFOOD';
-- update Modifiers set ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORGOLD' where ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORFOOD';
-- update ModifierArguments set ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORGOLD' where ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORFOOD';

insert or replace into BuildingModifiers (BuildingType,  ModifierId)
select 'BUILDING_KILWA_KISIWANI',  ModifierId || '1' from BuildingModifiers where ModifierId like 'KILWA_SINGLE_ADD%';
insert or replace into BuildingModifiers (BuildingType,  ModifierId)
select 'BUILDING_KILWA_KISIWANI',  ModifierId || '1' from BuildingModifiers where
ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDFOODYIELD' or ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORFOOD';

insert or replace into Modifiers    
    (ModifierId,                                ModifierType,                                               SubjectRequirementSetId)
values 
    ('KILWA_SINGLE_ADDSCIENCEYIELD1',           'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',          'SCIENTIFIC_SUZERAIN_2_REQUIREMENTS'),
    ('KILWA_SINGLE_ADDFAITHYIELD1',             'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',          'RELIGIOUS_SUZERAIN_2_REQUIREMENTS'),
    ('KILWA_SINGLE_ADDGOLDYIELD1',              'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',          'TRADE_SUZERAIN_2_REQUIREMENTS'),
    ('KILWA_SINGLE_ADDCULTUREYIELD1',           'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',          'CULTURAL_SUZERAIN_2_REQUIREMENTS'),
    ('KILWA_SINGLE_ADDPRODUCTIONUNITS1',        'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_MODIFIER',     'MILITARISTIC_SUZERAIN_2_REQUIREMENTS'),
    ('KILWA_SINGLE_ADDPRODUCTIONBUILDINGS1',    'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_MODIFIER', 'INDUSTRIAL_SUZERAIN_2_REQUIREMENTS'),
    ('KILWA_SINGLE_ADDPRODUCTIONDISTRICTS1',    'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER', 'INDUSTRIAL_SUZERAIN_2_REQUIREMENTS');

insert or replace into Modifiers    
    (ModifierId, 	ModifierType,                       				SubjectRequirementSetId)
select
	ModifierId,		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'CVS_CITYSTATE_AGRICULTURAL_SUZERAIN_2_REQUIREMENTSET'
from BuildingModifiers where ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDFOODYIELD1';

insert or replace into Modifiers    
    (ModifierId, 	ModifierType,                       				SubjectRequirementSetId)
select
	ModifierId,		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'CVS_CITYSTATE_MARITIME_SUZERAIN_2_REQUIREMENTSET'
from BuildingModifiers where ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORFOOD1';

insert or replace into ModifierArguments    (ModifierId,    Name,   Value)
select ModifierId || '1', Name,   Value from ModifierArguments where ModifierId like 'KILWA_SINGLE_ADD%';
insert or replace into ModifierArguments    (ModifierId,    Name,   Value)
select ModifierId || '1', Name,   Value from ModifierArguments where
	ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDFOODYIELD' or ModifierId = 'CVS_CITYSTATE_KILWA_SINGLE_ADDHARBORFOOD';

-- insert or replace into Unit_BuildingPrereqs(Unit, PrereqBuilding, NumSupported)
-- values ('UNIT_ARCHAEOLOGIST','BUILDING_HERMITAGE',1);
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
update Buildings set Cost = 750 where BuildingType = 'BUILDING_GREAT_ZIMBABWE';
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
update Buildings set Cost = 2000 where BuildingType = 'BUILDING_SYDNEY_OPERA_HOUSE';
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

-- Enable Wonders on Mountain
insert or replace into Building_ValidTerrains (BuildingType,	TerrainType)
select a.BuildingType,	b.TerrainType
from Buildings a, Terrains b where
	a.BuildingType in ('BUILDING_ORACLE', 'BUILDING_POTALA_PALACE', 'BUILDING_CRISTO_REDENTOR', 'BUILDING_NEUSCHWANSTEIN') and
	b.TerrainType like 'TERRAIN_%_MOUNTAIN';

insert or replace into Building_ValidTerrains (BuildingType,	TerrainType)
values ('BUILDING_PETRA',	'TERRAIN_DESERT_MOUNTAIN');
	-- ('BUILDING_JEBEL_BARKAL',	'TERRAIN_DESERT_MOUNTAIN');

-- Panama
update Buildings set PrereqTech = NULL, PrereqCivic = 'CIVIC_COLONIALISM' where BuildingType = 'BUILDING_PANAMA_CANAL';

-- 紫禁城
insert or replace into Building_GreatWorks
	(BuildingType,					GreatWorkSlotType,				NumSlots,	ThemingSameObjectType,		ThemingYieldMultiplier,		ThemingTourismMultiplier,	ThemingBonusDescription)
values
	('BUILDING_FORBIDDEN_CITY',		'GREATWORKSLOT_PALACE',			2,			1,							100,						100,						'LOC_BUILDING_THEMINGBONUS_FORBIDDEN_CITY');

-- 西印度交易所
update ModifierArguments set Value = 2 where ModifierId = 'CONTRATACION_GOVERNOR_POINTS';

-- 匈牙利议会大厦
update Buildings set PrereqTech = NULL, PrereqCivic = 'CIVIC_SOCIAL_SCIENCE_HD' where BuildingType = 'BUILDING_ORSZAGHAZ';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_ORSZAGHAZ',			'BUILDING_ORSZAGHAZ_GOVERNOR_POINTS'),
	('BUILDING_ORSZAGHAZ',			'BUILDING_ORSZAGHAZ_INFLUENCE_POINTS_MODIFIER');

insert or replace into Modifiers
	(ModifierId,											ModifierType,									RunOnce)
values
	('BUILDING_ORSZAGHAZ_GOVERNOR_POINTS',					'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',		1),
	('BUILDING_ORSZAGHAZ_INFLUENCE_POINTS_MODIFIER',		'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS',		0);

insert or replace into ModifierArguments
	(ModifierId,											Name,			Value)
values
	('BUILDING_ORSZAGHAZ_GOVERNOR_POINTS',					'Delta',		1),
	('BUILDING_ORSZAGHAZ_INFLUENCE_POINTS_MODIFIER',		'BonusType',	'GOVERNMENTBONUS_ENVOYS'),
	('BUILDING_ORSZAGHAZ_INFLUENCE_POINTS_MODIFIER',		'Amount',		100);



-- 马拉卡纳体育场
update Buildings set RegionalRange = 12 where BuildingType = 'BUILDING_ESTADIO_DO_MARACANA';
insert into Building_YieldChangesBonusWithPower
	(BuildingType,						YieldType,			YieldChange)
values
	('BUILDING_ESTADIO_DO_MARACANA',	'YIELD_CULTURE',	6);

insert into Buildings_XP2
	(BuildingType,						RequiredPower,	EntertainmentBonusWithPower)
values
	('BUILDING_ESTADIO_DO_MARACANA',	6,				2);

insert or replace into BuildingModifiers
	(BuildingType,						ModifierId)
values
	('BUILDING_ESTADIO_DO_MARACANA',	'MARACANA_CITIES_GPP_BOOST');

insert or replace into Modifiers
	(ModifierId,					ModifierType,												OwnerRequirementSetId,	SubjectRequirementSetId)
values
	('MARACANA_CITIES_GPP_BOOST',	'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT_BONUS',	'CITY_IS_POWERED',		'HD_OBJECT_WITHIN_9_TILES');

insert or replace into ModifierArguments
	(ModifierId,					Name,		Value)
values
	('MARACANA_CITIES_GPP_BOOST',	'Amount',	50);

CREATE TEMPORARY TABLE 'MARACANA_DistrictBonus'(
    'DistrictType' TEXT NOT NULL,
    'YieldType' TEXT NOT NULL
);

insert or replace into MARACANA_DistrictBonus
	(DistrictType,					YieldType)
values
	('DISTRICT_HOLY_SITE',			'YIELD_FAITH'),
	('DISTRICT_CAMPUS',				'YIELD_SCIENCE'),
	('DISTRICT_HARBOR',				'YIELD_FOOD'),
	('DISTRICT_ENCAMPMENT',			'YIELD_PRODUCTION'),
	('DISTRICT_COMMERCIAL_HUB',		'YIELD_GOLD'),
	('DISTRICT_THEATER',			'YIELD_CULTURE'),
	('DISTRICT_INDUSTRIAL_ZONE',	'YIELD_PRODUCTION');

insert or replace into Types
    (Type,                                      Kind)
select
    'BUILDING_MARACANA_DUMMY_' || DistrictType, 'KIND_BUILDING'
from MARACANA_DistrictBonus;

insert or replace into Buildings 
    (BuildingType,Name,Cost,Description,PrereqDistrict,MustPurchase) 
select
	'BUILDING_MARACANA_DUMMY_' || DistrictType,
	'BUILDING_MARACANA_DUMMY_' || DistrictType || '_NAME',
	9999,
	'BUILDING_MARACANA_DUMMY_' || DistrictType || '_DESCRIPTION',
	DistrictType,
	1
from MARACANA_DistrictBonus;

insert or replace into Buildings_XP2 (BuildingType,Pillage) select
	'BUILDING_MARACANA_DUMMY_' || DistrictType,0
from MARACANA_DistrictBonus;

insert or replace into Building_CitizenYieldChanges (BuildingType,YieldType,YieldChange) select
	'BUILDING_MARACANA_DUMMY_' || DistrictType,YieldType,3
from MARACANA_DistrictBonus;

insert or replace into BuildingModifiers
	(BuildingType,						ModifierId)
select
	'BUILDING_ESTADIO_DO_MARACANA',		'MARACANA_' || DistrictType || '_EXPERT_ATTACH'
from MARACANA_DistrictBonus;

insert or replace into Modifiers
	(ModifierId,										ModifierType,										SubjectRequirementSetId)
select
	'MARACANA_' || DistrictType || '_EXPERT_ATTACH', 	'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',		'HD_OBJECT_WITHIN_9_TILES'
from MARACANA_DistrictBonus;

insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'MARACANA_' || DistrictType || '_EXPERT_ATTACH', 	'ModifierId',		'MARACANA_' || DistrictType || '_EXPERT_YIELD'
from MARACANA_DistrictBonus;

insert or replace into Modifiers
	(ModifierId,										ModifierType,												OwnerRequirementSetId)
select
	'MARACANA_' || DistrictType || '_EXPERT_YIELD', 	'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',		'DISTRICT_IS_' || substr(DistrictType, 10)
from MARACANA_DistrictBonus;

insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'MARACANA_' || DistrictType || '_EXPERT_YIELD', 	'BuildingType',		'BUILDING_MARACANA_DUMMY_' || DistrictType
from MARACANA_DistrictBonus;


--自由女神像重做：建成以后+4外交胜利点数，
--为9环内每个沿海城市+4琴+4宜居，
--且为全国的每座港口赠送一个价格最低的港口建筑(每个港口当前可以建造的最便宜的建筑，不是只送一级建筑)，
--派往通商城邦的使者+1。
delete from BuildingModifiers where BuildingType = 'BUILDING_STATUE_LIBERTY' and ModifierId = 'STATUELIBERTY_CITIES_ALWAYS_LOYAL';
insert or replace into BuildingModifiers
	(BuildingType, 											ModifierId)
values
	('BUILDING_STATUE_LIBERTY',								'STATUE_OF_LIBERTY_COASTAL_RADIATION_CULTURE'),
	('BUILDING_STATUE_LIBERTY',								'STATUE_OF_LIBERTY_COASTAL_RADIATION_AMENITY'),
	('BUILDING_STATUE_LIBERTY',								'STATUE_OF_LIBERTY_TRADE_ROUTE_TOKEN');
--	('BUILDING_STATUE_LIBERTY',								'STATUE_OF_LIBERTY_HARBOR_CLASS_3'),
--	('BUILDING_STATUE_LIBERTY',								'STATUE_OF_LIBERTY_HARBOR_CLASS_2'),
--	('BUILDING_STATUE_LIBERTY',								'STATUE_OF_LIBERTY_HARBOR_CLASS_1');
insert or replace into Modifiers
	(ModifierId,											ModifierType,																RunOnce,	SubjectRequirementSetId)
values
	('STATUE_OF_LIBERTY_COASTAL_RADIATION_CULTURE',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',							0,			'STATUE_OF_LIBERTY_WITHIN_9_REQUIREMENTS'),
	('STATUE_OF_LIBERTY_COASTAL_RADIATION_AMENITY',			'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY',								0,			'STATUE_OF_LIBERTY_WITHIN_9_REQUIREMENTS'),
	('STATUE_OF_LIBERTY_TRADE_ROUTE_TOKEN',					'MODIFIER_PLAYER_ADJUST_DUPLICATE_INFLUENCE_TOKEN_WHEN_TRADE_ROUTE_TO',		0,			NULL);
--	('STATUE_OF_LIBERTY_HARBOR_CLASS_1',					'GRANT_BUILDING_TO_ALL_CITIES_IGNORE',										1,			'CITY_HAS_HARBOR_REQUIREMENTS'),
--	('STATUE_OF_LIBERTY_HARBOR_CLASS_2',					'GRANT_BUILDING_TO_ALL_CITIES_IGNORE',										1,			'HD_CITY_HAS_HARBOR_TIER_1_BUILDING_REQUIREMENTS_BASIC'),
--	('STATUE_OF_LIBERTY_HARBOR_CLASS_3',					'GRANT_BUILDING_TO_ALL_CITIES_IGNORE',										1,			'HD_CITY_HAS_HARBOR_TIER_2_BUILDING_REQUIREMENTS_BASIC');
insert or replace into ModifierArguments
	(ModifierId,											Name,												Value)
values
	('STATUE_OF_LIBERTY_COASTAL_RADIATION_CULTURE',			'YieldType',										'YIELD_CULTURE'),
	('STATUE_OF_LIBERTY_COASTAL_RADIATION_CULTURE',			'Amount',											4),
	('STATUE_OF_LIBERTY_COASTAL_RADIATION_AMENITY',			'Amount',											4),
	('STATUE_OF_LIBERTY_TRADE_ROUTE_TOKEN',					'Amount',											1);
--	('STATUE_OF_LIBERTY_HARBOR_CLASS_1',					'BuildingType',										'BUILDING_LIGHTHOUSE'),
--	('STATUE_OF_LIBERTY_HARBOR_CLASS_2',					'BuildingType',										'BUILDING_SHIPYARD'),
--	('STATUE_OF_LIBERTY_HARBOR_CLASS_3',					'BuildingType',										'BUILDING_SEAPORT');
