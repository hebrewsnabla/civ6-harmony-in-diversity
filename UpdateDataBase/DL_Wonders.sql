-------------------------------------
--       Wonders Adjustments       --
-------------------------------------

-- Oracle gives 3 great person points each.
update ModifierArguments set Value = 3 where ModifierId = 'ORACLE_GREATGENERALPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'ORACLE_GREATADMIRALPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'ORACLE_GREATENGINEERPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'ORACLE_GREATMERCHANTPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'ORACLE_GREATPROPHETPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'ORACLE_GREATSCIENTISTPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'ORACLE_GREATWRITERPOINTS' and Name = 'Amount';
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

-- hanging garden boost great people born in this city
--insert or replace into BuildingModifiers
 	--(BuildingType,							ModifierId)
 --values
 	--('BUILDING_HANGING_GARDENS',			'HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST1'),
 	--('BUILDING_HANGING_GARDENS',			'HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST2'),
 	--('BUILDING_HANGING_GARDENS',			'HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST3'),
 	--('BUILDING_HANGING_GARDENS',			'HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST4'),
 	--('BUILDING_HANGING_GARDENS',			'HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST5'),
 	--('BUILDING_HANGING_GARDENS',			'HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST6'),
 	--('BUILDING_HANGING_GARDENS',			'HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST7'),
 	--('BUILDING_HANGING_GARDENS',			'HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST8'),
 	--('BUILDING_HANGING_GARDENS',			'HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST9');

 -- insert or replace into Modifiers
 -- 	(ModifierId,											ModifierType)
 -- values
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST1',		'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST2',		'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST3',		'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST4',		'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST5',		'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST6',		'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST7',		'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST8',		'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST9',		'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT');

 -- insert or replace into ModifierArguments
 -- 	(ModifierId,										Name,					Value)
 -- values
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST1','GreatPersonClassType',	'GREAT_PERSON_CLASS_ADMIRAL'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST1','Amount',					15),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST2','GreatPersonClassType',	'GREAT_PERSON_CLASS_GENERAL'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST2','Amount',					15),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST3','GreatPersonClassType',	'GREAT_PERSON_CLASS_ENGINEER'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST3','Amount',					15),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST4','GreatPersonClassType',	'GREAT_PERSON_CLASS_ARTIST'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST4','Amount',					15),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST5','GreatPersonClassType',	'GREAT_PERSON_CLASS_MERCHANT'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST5','Amount',					15),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST6','GreatPersonClassType',	'GREAT_PERSON_CLASS_PROPHET'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST6','Amount',					15),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST7','GreatPersonClassType',	'GREAT_PERSON_CLASS_SCIENTIST'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST7','Amount',					15),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST8','GreatPersonClassType',	'GREAT_PERSON_CLASS_WRITER'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST8','Amount',					15),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST9','GreatPersonClassType',	'GREAT_PERSON_CLASS_MUSICIAN'),
 -- 	('HANGING_GARDENS_SINGLE_CITY_GREATPERSON_BOOST9','Amount',					15);

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
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'BUILDING_UNIVERSITY_SANKORE' and YieldType = 'YIELD_SCIENCE';

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
	('UNIVERSITY_SANKORE_DESERT_SCIENCE',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PETRA_YIELD_MODIFIER_REQUIREMENTS');

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

--Great Library extra eruka boost 2%
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
--delete from BuildingModifiers where ModifierId = 'KOTOKU_GRANTMONKS';
insert or replace into BuildingModifiers
	(BuildingType,						 ModifierId)
values
	-- ('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_1_EXPMONKS'),
	-- ('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_2_EXPMONKS'),
	-- ('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_3_EXPMONKS'),
	-- ('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_4_EXPMONKS'),
	('BUILDING_KOTOKU_IN',		'KOTOKU_IN_GRANTS_MONKS_FREE_PROMOTION');

--'MODIFIER_PLAYER_UNIT_ADJUST_GRANT_EXPERIENCE'
insert or replace into Modifiers	
	(ModifierId,								ModifierType,					RunOnce,	Permanent)
values
	('KOTOKU_IN_GRANTS_1_EXPMONKS',				'MODIFIER_PLAYER_UNIT_GRANT_UNIT_WITH_EXPERIENCE',1,1),
	('KOTOKU_IN_GRANTS_2_EXPMONKS',				'MODIFIER_PLAYER_UNIT_GRANT_UNIT_WITH_EXPERIENCE',1,1),
	('KOTOKU_IN_GRANTS_3_EXPMONKS',				'MODIFIER_PLAYER_UNIT_GRANT_UNIT_WITH_EXPERIENCE',1,1),
	('KOTOKU_IN_GRANTS_4_EXPMONKS',				'MODIFIER_PLAYER_UNIT_GRANT_UNIT_WITH_EXPERIENCE',1,1),
	('KOTOKU_IN_GRANTS_MONKS_FREE_PROMOTION',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',0,1);
insert or replace into ModifierArguments 
	(ModifierId,								Name,			Value) 
values
	('KOTOKU_IN_GRANTS_MONKS_FREE_PROMOTION',	'AbilityType',	'ABILITY_KOTOKU_IN_TRAINED_FREE_PROMOTION'),
	('KOTOKU_IN_GRANTS_1_EXPMONKS',				'UnitType',		'UNIT_WARRIOR_MONK'),
	('KOTOKU_IN_GRANTS_1_EXPMONKS',				'Experience',	-1),
	('KOTOKU_IN_GRANTS_1_EXPMONKS',				'UniqueOverride',1),
	('KOTOKU_IN_GRANTS_2_EXPMONKS',				'UnitType',		'UNIT_WARRIOR_MONK'),
	('KOTOKU_IN_GRANTS_2_EXPMONKS',				'Experience',	-1),
	('KOTOKU_IN_GRANTS_2_EXPMONKS',				'UniqueOverride',1),
	('KOTOKU_IN_GRANTS_3_EXPMONKS',				'UnitType',		'UNIT_WARRIOR_MONK'),
	('KOTOKU_IN_GRANTS_3_EXPMONKS',				'Experience',	-1),
	('KOTOKU_IN_GRANTS_3_EXPMONKS',				'UniqueOverride',1),
	('KOTOKU_IN_GRANTS_4_EXPMONKS',				'UnitType',		'UNIT_WARRIOR_MONK'),
	('KOTOKU_IN_GRANTS_4_EXPMONKS',				'Experience',	-1),
	('KOTOKU_IN_GRANTS_4_EXPMONKS',				'UniqueOverride',1);