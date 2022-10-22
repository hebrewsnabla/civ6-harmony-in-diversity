-------------------------------------
--		GreatPeople Adjustments		--
-------------------------------------

-------------------------------------------------------------------------------------------------------------------------------------------
-- New Great Eng (Classical Era), JNR Industry Expansion
-------------------------------------------------------------------------------------------------------------------------------------------
-- Types
--------------------------------------------------------------
INSERT OR IGNORE INTO Types
		(Type,													Kind)
VALUES	('GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES',				'KIND_GREAT_PERSON_INDIVIDUAL'),
		('GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',					'KIND_GREAT_PERSON_INDIVIDUAL'),
		('GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN',					'KIND_GREAT_PERSON_INDIVIDUAL'),
		('GREAT_PERSON_INDIVIDUAL_HD_CROESUS',					'KIND_GREAT_PERSON_INDIVIDUAL'),
		('GREAT_PERSON_INDIVIDUAL_HD_ALI_MUGHAYAT_SYAH',		'KIND_GREAT_PERSON_INDIVIDUAL');
		-- ('GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU', 'KIND_GREAT_PERSON_INDIVIDUAL');

insert or ignore into Types
	(Type,												Kind)
select
	'GREAT_PERSON_INDIVIDUAL_HD_SANG_HONGYANG',			'KIND_GREAT_PERSON_INDIVIDUAL'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_JNR_MINT');

-- GreatPersonIndividuals
--------------------------------------------------------------
INSERT OR IGNORE INTO GreatPersonIndividuals
		(
		GreatPersonIndividualType,
		Name,
		GreatPersonClassType,
		EraType,
		Gender,
		ActionCharges,
		ActionRequiresCompletedDistrictType
		)
VALUES	(
		'GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES',
		'LOC_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES_NAME',
		'GREAT_PERSON_CLASS_ENGINEER',
		'ERA_CLASSICAL',
		'M',
		1,
		'DISTRICT_INDUSTRIAL_ZONE'
		),
		(
		'GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',
		'LOC_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING_NAME',
		'GREAT_PERSON_CLASS_ENGINEER',
		'ERA_CLASSICAL',
		'M',
		1,
		'DISTRICT_INDUSTRIAL_ZONE'
		),
		(
		'GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN',
		'LOC_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_NAME',
		'GREAT_PERSON_CLASS_ENGINEER',
		'ERA_CLASSICAL',
		'M',
		1,
		'DISTRICT_CITY_CENTER'
		),
		(
		'GREAT_PERSON_INDIVIDUAL_HD_CROESUS',
		'LOC_GREAT_PERSON_INDIVIDUAL_HD_CROESUS_NAME',
		'GREAT_PERSON_CLASS_MERCHANT',
		'ERA_CLASSICAL',
		'M',
		1,
		'DISTRICT_COMMERCIAL_HUB'
		),
		(
		'GREAT_PERSON_INDIVIDUAL_HD_ALI_MUGHAYAT_SYAH',
		'LOC_GREAT_PERSON_INDIVIDUAL_HD_ALI_MUGHAYAT_SYAH_NAME',
		'GREAT_PERSON_CLASS_MERCHANT',
		'ERA_MEDIEVAL',
		'M',
		1,
		'DISTRICT_COMMERCIAL_HUB'
		);
insert or ignore into GreatPersonIndividuals
		(
		GreatPersonIndividualType,
		Name,
		GreatPersonClassType,
		EraType,
		Gender,
		ActionCharges,
		ActionRequiresCompletedDistrictType
		)
select	
		'GREAT_PERSON_INDIVIDUAL_HD_SANG_HONGYANG',
		'LOC_GREAT_PERSON_INDIVIDUAL_HD_SANG_HONGYANG_NAME',
		'GREAT_PERSON_CLASS_MERCHANT',
		'ERA_CLASSICAL',
		'M',
		1,
		'DISTRICT_COMMERCIAL_HUB'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_JNR_MINT');
		-- (
		-- 'GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU',
		-- 'LOC_GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU_NAME',
		-- 'GREAT_PERSON_CLASS_ENGINEER',
		-- 'ERA_RENAISSANCE',
		-- 'F',
		-- 1,
		-- 'DISTRICT_CITY_CENTER'
		-- );

UPDATE GreatPersonIndividuals SET EraType='ERA_CLASSICAL'	WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_IMHOTEP';

UPDATE GreatPersonIndividuals SET ActionEffectTextOverride='LOC_GREATPERSON_IMHOTEP_ACTIVE_JNR_UC'				WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_IMHOTEP';
-- UPDATE GreatPersonIndividuals SET ActionEffectTextOverride='LOC_GREATPERSON_LEONARDO_DA_VINCI_ACTIVE_JNR_UC' WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_LEONARDO_DA_VINCI';
-- UPDATE GreatPersonIndividuals SET ActionEffectTextOverride='LOC_GREATPERSON_JAMES_WATT_ACTIVE_JNR_UC'			WHERE GreatPersonIndividualType='GREAT_PERSON_INDIVIDUAL_JAMES_WATT';
--------------------------------------------------------------

-- Modifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO Modifiers
		(ModifierId,										ModifierType,											SubjectRequirementSetId,					Permanent)
VALUES	('JNR_GREATPERSON_EUREKA_STRENGTH',					'MODIFIER_PLAYER_ADJUST_TECHNOLOGY_BOOST',				NULL,										1),
		('JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'MODIFIER_PLAYER_ADJUST_DISTRICT_UNLOCK',				NULL,										1);
--------------------------------------------------------------

-- ModifierArguments
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierArguments
		(ModifierId,										Name,					Value)
VALUES	('JNR_GREATPERSON_EUREKA_STRENGTH',					'Amount',				5),
		('JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'DistrictType',			'DISTRICT_DAM'),
		('JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'TechType',				'TECH_MATHEMATICS');

UPDATE ModifierArguments SET Extra=-1	WHERE Name='Amount' AND ModifierId='JNR_GREATPERSON_EUREKA_STRENGTH';
--------------------------------------------------------------

-- GreatPersonIndividualActionModifiers
--------------------------------------------------------------
INSERT OR IGNORE INTO GreatPersonIndividualActionModifiers
		(GreatPersonIndividualType,								ModifierId,											AttachmentTargetType)
VALUES	('GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES',				'JNR_GREATPERSON_EUREKA_STRENGTH',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
		('GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',					'JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY');
--------------------------------------------------------------

-- ModifierStrings
--------------------------------------------------------------
INSERT OR IGNORE INTO ModifierStrings
		(ModifierId,										Context,	Text)
VALUES	('JNR_GREATPERSON_EUREKA_STRENGTH',					'Summary',	'LOC_JNR_GREATPERSON_EUREKA_STRENGTH'),
		('JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS',			'Summary',	'LOC_JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS');
--------------------------------------------------------------

--------------------------------------------------------------
-- Adaptation for JNR's New Great Eng
update GreatPersonIndividuals set ActionCharges = 4 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_IMHOTEP';
update ModifierArguments set Value = 55 where Name = 'Amount' and ModifierId = 'GREAT_PERSON_INDIVIDUAL_IMHOTEP_PRODUCTION_OTHER';
update ModifierArguments set Value = 110 where Name = 'Amount' and ModifierId = 'GREAT_PERSON_INDIVIDUAL_IMHOTEP_PRODUCTION_ANCIENT_CLASSICAL';

update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES';
update ModifierArguments set Value = 1 where Name = 'Amount' and ModifierId = 'JNR_GREATPERSON_EUREKA_STRENGTH';

update GreatPersonIndividuals set ActionRequiresCompletedDistrictType = 'DISTRICT_CITY_CENTER' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JNR_LI_BING';
update GreatPersonIndividuals set ActionRequiresCompletedDistrictType = 'DISTRICT_INDUSTRIAL_ZONE' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN';

insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,					ModifierId,											AttachmentTargetType)
values
	('GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES',	'GREATPERSON_1MEDIEVALTECHBOOST',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',		'JNR_GREATPERSON_DAM_SPEED_UP',						'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_JNR_LI_BING',		'JNR_GREATPERSON_DAM_RIVER_PRODUCTION',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN',		'HD_GREATPERSON_GRANT_IZ_TIER1_BUILDING',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN',		'JNR_GREATPERSON_TECH_MACHINERY',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER');

insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,					ModifierId,											AttachmentTargetType)
select
	'GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN',		'HD_GREATPERSON_'|| BuildingType ||'_PRODUCTION',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and Tier = 1;

insert or replace into Modifiers
	(ModifierId,										ModifierType,												SubjectRequirementSetId)
values
	('JNR_GREATPERSON_DAM_RIVER_PRODUCTION',			'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',				'DISTRICT_IS_DAM'),
	('JNR_GREATPERSON_DAM_SPEED_UP',					'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',		NULL),
	('HD_GREATPERSON_GRANT_IZ_TIER1_BUILDING',			'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',		NULL),
	('JNR_GREATPERSON_TECH_MACHINERY',					'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',				NULL);

insert or replace into Modifiers
	(ModifierId,										ModifierType)
select
	'HD_GREATPERSON_'|| BuildingType ||'_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and Tier = 1;

insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
values
	('JNR_GREATPERSON_DAM_RIVER_PRODUCTION',			'ModifierId',		'HYDROELECTRIC_DAM_ADD_RIVER_PRODUCTION'),
	('JNR_GREATPERSON_DAM_SPEED_UP',					'DistrictType',		'DISTRICT_DAM'),
	('JNR_GREATPERSON_DAM_SPEED_UP',					'Amount',			25),
	('HD_GREATPERSON_GRANT_IZ_TIER1_BUILDING',			'BuildingType',		'BUILDING_WORKSHOP'),
	('JNR_GREATPERSON_TECH_MACHINERY',					'TechType',			'TECH_MACHINERY');

insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'HD_GREATPERSON_'|| BuildingType ||'_PRODUCTION',	'BuildingType',		BuildingType
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and Tier = 1;

insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'HD_GREATPERSON_'|| BuildingType ||'_PRODUCTION',	'Amount',			1
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and Tier = 1;

insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'HD_GREATPERSON_'|| BuildingType ||'_PRODUCTION',	'YieldType',		'YIELD_PRODUCTION'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and Tier = 1;

insert or replace into ModifierStrings
	(ModifierId,										Context,	Text)
values
	('HD_GREATPERSON_GRANT_IZ_TIER1_BUILDING',			'Summary',	'LOC_HD_GREATPERSON_GRANT_IZ_TIER1_BUILDING'),
	('JNR_GREATPERSON_TECH_MACHINERY',					'Summary',	'LOC_JNR_GREATPERSON_TECH_MACHINERY');
-------------------------------------------------------------- End

-------------------------------------------------------------------------------------------------------------------------------------------
---	Great Engineer
-------------------------------------------------------------------------------------------------------------------------------------------
-- Bi Sheng: if printing eruka is boosted grant this tech GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_MATHEMATICS
-- JAMES_OF_ST_GEORGE: +1 great engineer points for each level wall 
-- CHARLES_CORREA: +2 appeal national-wide
-- ALVAR_AALTO: +1 appeal national-wide
-- SHAH_JAHAN: tourism from district adjacency national-wide
-- JOHN_A_ROEBLING: little goldengate + wonder tourism
-- SHAH_JAHAN: to renissance era
-- JOSEPH_PAXTON: to modern era, 2 charges +680 production for wonders 

delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_BI_SHENG' and ModifierId = 'GREATPERSON_PRINTINGTECHBOOST';
-- delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_CULTURE_BOMB_TRIGGER_INDUSTRIAL_ZONE';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ALVAR_AALTO' and ModifierId = 'GREATPERSON_CITY_APPEAL_SMALL';
update GreatPersonIndividuals set EraType = 'ERA_RENAISSANCE' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_SHAH_JAHAN';	
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_CHARLES_CORREA';
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE';
update GreatPersonIndividuals set EraType = 'ERA_MODERN', ActionCharges = 2, ActionRequiresIncompleteWonder = 1, ActionRequiresCompletedDistrictType = NULL where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON' and (ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_RANGE' or ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_ENTERTAINMENT');
update GreatPersonIndividuals set ActionCharges = ActionCharges + 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ADA_LOVELACE';

delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA' and ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_RANGE';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA' and ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_PRODUCTION';

insert or replace into GreatPersonIndividualActionModifiers 
	(GreatPersonIndividualType,							ModifierId,										AttachmentTargetType)
values
	('GREAT_PERSON_INDIVIDUAL_JOHN_A_ROEBLING',			'GREATPERSON_SINGLECITY_APPEAL',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
	('GREAT_PERSON_INDIVIDUAL_JOHN_A_ROEBLING',			'GREATPERSON_SINGLECITY_WONDER_TOURISM',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
	('GREAT_PERSON_INDIVIDUAL_JOHN_A_ROEBLING',			'GREATPERSON_SINGLECITY_IMPROVEMENT_TOURISM',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
	('GREAT_PERSON_INDIVIDUAL_JOHN_A_ROEBLING',			'GREATPERSON_SINGLECITY_NATIONAL_PARK_TOURISM', 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
	('GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON',			'GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_WONDER_IN_TILE');

insert or replace into GreatPersonIndividualActionModifiers 
	(GreatPersonIndividualType,							ModifierId)
values
	('GREAT_PERSON_INDIVIDUAL_BI_SHENG',				'GREAT_PERSON_HD_BOOST_OR_GRANT_PRINTING'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE',		'GREAT_PERSON_INDIVIDUAL_WALL_GEP'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE',		'GREAT_PERSON_INDIVIDUAL_CASTLE_GEP'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE',		'GREAT_PERSON_INDIVIDUAL_STAR_WALL_GEP'),
	-- this Modifier is not removed with the Regional Range rewrite in DL_PostProcess.sql in order to make Power Plants provides power to more cities.
	('GREAT_PERSON_INDIVIDUAL_JAMES_WATT',				'GREATPERSON_REGIONAL_RANGE_BONUS'),
	--('GREAT_PERSON_INDIVIDUAL_JAMES_WATT',				'GREATPERSON_REGIONAL_RANGE_SCIENCE'),
--	('GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA',			'GREATPERSON_CAMPUS_SCIENCE_PRODUCTION'),
--	('GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA',			'GREATPERSON_INDUSTRY_PRODUCTION_SCIENCE'),
	('GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA',			'GREATPERSON_ELECTRICITY'),
	('GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA',			'GREATPERSON_ELECTRICITY_ADD_PRODUCTION'),
	('GREAT_PERSON_INDIVIDUAL_ALVAR_AALTO',				'GREATPERSON_NATIONAL_APPEAL'),
	('GREAT_PERSON_INDIVIDUAL_CHARLES_CORREA',			'GREATPERSON_NATIONAL_APPEAL_BIG');

insert or replace into Modifiers
	(ModifierId,										ModifierType,								Runonce, Permanent, SubjectRequirementSetId)
values
    ('GREAT_PERSON_HD_BOOST_OR_GRANT_PRINTING',         'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',            1,1,    NULL),
    ('GREAT_PERSON_INDIVIDUAL_WALL_GEP',                'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',     0,1,    'CITY_HAS_ANCIENT_WALLS'),
    ('GREAT_PERSON_INDIVIDUAL_CASTLE_GEP',              'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',     0,1,    'CITY_HAS_MEDIEVAL_WALLS'),
    ('GREAT_PERSON_INDIVIDUAL_STAR_WALL_GEP',           'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',     0,1,    'CITY_HAS_RENAISSANCE_WALLS'),
    ('GREATPERSON_REGIONAL_RANGE_BONUS',                'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',0,1,    'DISTRICT_IS_INDUSTRIAL_ZONE'),
    --('GREATPERSON_REGIONAL_RANGE_SCIENCE',           'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_YIELD',0,1,    'DISTRICT_IS_INDUSTRIAL_ZONE'),
    ('GREATPERSON_CAMPUS_SCIENCE_PRODUCTION',           'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS', 0,1, 'DISTRICT_IS_CAMPUS'),
    ('GREATPERSON_INDUSTRY_PRODUCTION_SCIENCE',         'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS', 0,1, 'DISTRICT_IS_INDUSTRIAL_ZONE'),
    ('GREATPERSON_NATIONAL_APPEAL',                     'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',            0,1,    NULL),
    ('GREATPERSON_SINGLECITY_APPEAL',                   'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL',              0,1,    NULL),
    ('GREATPERSON_SINGLECITY_WONDER_TOURISM',           'MODIFIER_SINGLE_CITY_ADJUST_TOURISM',                  0,1,    NULL),
    ('GREATPERSON_SINGLECITY_IMPROVEMENT_TOURISM',      'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_TOURISM',      0,1,    NULL),  
    ('GREATPERSON_SINGLECITY_NATIONAL_PARK_TOURISM',    'MODIFIER_SINGLE_CITY_ADJUST_NATIONAL_PARK_TOURISM',    0,1,    NULL),
    ('GREATPERSON_NATIONAL_APPEAL_BIG',                 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',            0,1,    NULL),
    ('GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN',     'MODIFIER_SINGLE_CITY_GRANT_PRODUCTION_IN_CITY',        1,1,    NULL),
    ('GREATPERSON_ELECTRICITY',                         'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               0,1,    NULL),
    ('GREATPERSON_ELECTRICITY_MODIFIER',                'MODIFIER_SINGLE_CITY_ADJUST_FREE_POWER',               0,1,    NULL),
    ('GREATPERSON_ELECTRICITY_ADD_PRODUCTION',          'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',   0,1,    'CITY_IS_POWERED');

insert or replace into ModifierArguments
	(ModifierId,										Name,					Value)
values
    ('GREAT_PERSON_HD_BOOST_OR_GRANT_PRINTING',         'TechType',             'TECH_PRINTING'),
    ('GREAT_PERSON_HD_BOOST_OR_GRANT_PRINTING',         'GrantTechIfBoosted',   1),
    ('GREAT_PERSON_INDIVIDUAL_WALL_GEP',                'GreatPersonClassType', 'GREAT_PERSON_CLASS_ENGINEER'),
    ('GREAT_PERSON_INDIVIDUAL_WALL_GEP',                'Amount',               1),
    ('GREAT_PERSON_INDIVIDUAL_CASTLE_GEP',              'GreatPersonClassType', 'GREAT_PERSON_CLASS_ENGINEER'),
    ('GREAT_PERSON_INDIVIDUAL_CASTLE_GEP',              'Amount',               1),
    ('GREAT_PERSON_INDIVIDUAL_STAR_WALL_GEP',           'GreatPersonClassType', 'GREAT_PERSON_CLASS_ENGINEER'),
    ('GREAT_PERSON_INDIVIDUAL_STAR_WALL_GEP',           'Amount',               1),
    ('GREATPERSON_REGIONAL_RANGE_BONUS',                'Amount',               3),
    --('GREATPERSON_REGIONAL_RANGE_SCIENCE',              'YieldType',            'YIELD_SCIENCE'),
    --('GREATPERSON_REGIONAL_RANGE_SCIENCE',              'Amount',               3),
    ('GREATPERSON_CAMPUS_SCIENCE_PRODUCTION',           'YieldTypeToMirror',    'YIELD_SCIENCE'),
    ('GREATPERSON_CAMPUS_SCIENCE_PRODUCTION',           'YieldTypeToGrant',     'YIELD_PRODUCTION'),
    ('GREATPERSON_INDUSTRY_PRODUCTION_SCIENCE',         'YieldTypeToMirror',    'YIELD_PRODUCTION'),
    ('GREATPERSON_INDUSTRY_PRODUCTION_SCIENCE',         'YieldTypeToGrant',     'YIELD_SCIENCE'),
    ('GREATPERSON_NATIONAL_APPEAL',                     'Amount',               1),
    ('GREATPERSON_SINGLECITY_APPEAL',                   'Amount',               2),
    ('GREATPERSON_SINGLECITY_IMPROVEMENT_TOURISM',      'Amount',               100),
    ('GREATPERSON_SINGLECITY_NATIONAL_PARK_TOURISM',    'Amount',               100),
    ('GREATPERSON_SINGLECITY_WONDER_TOURISM',           'BoostsWonders',        1),
    ('GREATPERSON_SINGLECITY_WONDER_TOURISM',           'ScalingFactor',        200),
    ('GREATPERSON_NATIONAL_APPEAL_BIG',                 'Amount',               2),
    ('GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN',     'Amount',               680),
    ('GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN',     'KeepOverflow',         0),
    ('GREATPERSON_ELECTRICITY',                         'ModifierId',           'GREATPERSON_ELECTRICITY_MODIFIER'),
    ('GREATPERSON_ELECTRICITY_MODIFIER',                'Amount',               3),
    ('GREATPERSON_ELECTRICITY_MODIFIER',                'SourceType',           'FREE_POWER_SOURCE_MISC'),
    ('GREATPERSON_ELECTRICITY_ADD_PRODUCTION',          'YieldType',            'YIELD_PRODUCTION'),
    ('GREATPERSON_ELECTRICITY_ADD_PRODUCTION',          'Amount',               5);

-- 瓦特拿特斯拉的效果
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAMES_WATT' and ModifierId = 'GREATPERSON_WORKSHOP';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAMES_WATT' and ModifierId = 'GREATPERSON_FACTORY';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAMES_WATT' and ModifierId = 'GREATPERSON_FACTORIES_PRODUCTION';

------------------------------------------------------------------------------------------------------------------------------
--- Great Scientist
-------------------------------------------------------------------------------------------------------------------------------
-- EUCLID +1 district capacity finish mathmatics if boosted
-- Darwin : +1000 science for each natural wonder tiles
-- galieo : +400 science for each ajacent mountain tiles
-- HILDEGARD_OF_BINGEN ： +200 faith when activate
-- ABU_AL_QASIM_AL_ZAHRAWI : sanitation boost or give full tech
-- issac_newton : university +1 sicence
-- ALFRED_NOBEL：+25%GPP acumulate speed
-- ALBERT_EINSTEIN: 2 boost
-- ALAN_TURING: finish computer if boosted; boost +era
-- DMITRI_MENDELEEV: finish chemistry if boosted; boost +era
-- JAMES_YOUNG: finish refining if boosted; boost plastic

update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_SNOWMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_TUNDRAMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_DESERTMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_PLAINSMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_GRASSMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 1000 where ModifierId = 'GREATPERSON_ADJACENT_NATURALWONDER_SCIENCE' and Name = 'Amount';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_1MEDIEVALRENAISSANCETECHBOOST';
update ModifierArguments set Value = 200 where ModifierId = 'GREATPERSON_FAITH' and	Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'GREATPERSON_LIBRARIES_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 4 where ModifierId = 'GREATPERSON_UNIVERSITIES_SMALL_SCIENCE' and Name = 'Amount';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_MATHTECHBOOST' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_EUCLID';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_2INDUSTRIALMODERNTECHBOOSTS';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_1INDUSTRIALTECHBOOST';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_COMPUTERSTECHBOOST' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ALAN_TURING';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_1MODERNTECHBOOST' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ALAN_TURING';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_CHEMISTRYTECHBOOST';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_1MODERNATOMICTECHBOOST' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ALBERT_EINSTEIN';

insert or replace into GreatPersonIndividualActionModifiers 
	(GreatPersonIndividualType,							ModifierId,												AttachmentTargetType)
values
	('GREAT_PERSON_INDIVIDUAL_EUCLID',					'GREATPERSON_EXTRA_DISTRICT_CAPACITY',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_ARYABHATA',				'GREAT_PERSON_INDIVIDUAL_ARYABHATA_CAMPUS_AMENITY',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

insert or replace into GreatPersonIndividualActionModifiers 
	(GreatPersonIndividualType,							ModifierId)
values
	('GREAT_PERSON_INDIVIDUAL_EUCLID',					'GREAT_PERSON_HD_BOOST_OR_GRANT_MATHEMATICS'),
	('GREAT_PERSON_INDIVIDUAL_ALBERT_EINSTEIN',			'GREATPERSON_2MODERNATOMICTECHBOOST'),
	('GREAT_PERSON_INDIVIDUAL_ALAN_TURING',				'GREATPERSON_1MODERNATOMICTECHBOOST'),
	('GREAT_PERSON_INDIVIDUAL_ALAN_TURING',				'GREAT_PERSON_HD_BOOST_OR_GRANT_COMPUTERS'),
	-- ('GREAT_PERSON_INDIVIDUAL_DMITRI_MENDELEEV',		'GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS'),
	('GREAT_PERSON_INDIVIDUAL_DMITRI_MENDELEEV',		'GREAT_PERSON_HD_BOOST_OR_GRANT_CHEMISTRY'),
	('GREAT_PERSON_INDIVIDUAL_DMITRI_MENDELEEV',		'GREATPERSON_REVEAL_ALUMINUM'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_YOUNG',				'GREAT_PERSON_HD_BOOST_OR_GRANT_REFINING'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_YOUNG',				'GREAT_PERSON_PLASTICS_TECHBOOST'),
	('GREAT_PERSON_INDIVIDUAL_ABU_AL_QASIM_AL_ZAHRAWI', 'GREAT_PERSON_HD_BOOST_OR_GRANT_SANITATION');

insert or replace into Modifiers
	(ModifierId,											ModifierType,											Runonce,	Permanent)
values
	('GREAT_PERSON_INDIVIDUAL_ARYABHATA_CAMPUS_AMENITY',	'MODIFIER_ADJUST_AMENITIES_IN_DISTRICT',				1,	1),
	('GREATPERSON_2MODERNATOMICTECHBOOST',					'MODIFIER_PLAYER_GRANT_RANDOM_TECHNOLOGY_BOOST_BY_ERA', 1,	1),
	-- ('GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS',				'MODIFIER_PLAYER_GRANT_RANDOM_TECHNOLOGY_BOOST_BY_ERA', 1,	1),
	('GREATPERSON_REVEAL_ALUMINUM',							'MODIFIER_PLAYER_GRANT_FREE_RESOURCE_VISIBILITY',		1,	1),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_MATHEMATICS',			'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',			1,	1),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_COMPUTERS',			'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',			1,	1),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_CHEMISTRY',			'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',			1,	1),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_REFINING',				'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',			1,	1),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_SANITATION',			'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',			1,	1),
	('GREAT_PERSON_PLASTICS_TECHBOOST',						'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',			1,	1);

insert or replace into GreatPersonIndividualActionModifiers (GreatPersonIndividualType, ModifierId)
select 'GREAT_PERSON_INDIVIDUAL_ALFRED_NOBEL', 'GREAT_PERSON_ADD_' || GreatPersonClassType from GreatPersonClasses
where not (GreatPersonClassType = 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL');
insert or replace into Modifiers	(ModifierId,ModifierType, Runonce, Permanent)
select	'GREAT_PERSON_ADD_' || GreatPersonClassType , 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT',1,1 from GreatPersonClasses;
insert or replace into ModifierArguments (ModifierId,	Name,	Value)
select	'GREAT_PERSON_ADD_' || GreatPersonClassType ,	'GreatPersonClassType',	GreatPersonClassType from GreatPersonClasses;
insert or replace into ModifierArguments (ModifierId,	Name,	Value)
select	'GREAT_PERSON_ADD_' || GreatPersonClassType ,	'Amount', 25 from GreatPersonClasses;

insert or replace into ModifierArguments
	(ModifierId,												Name,					Value)
values
	('GREAT_PERSON_INDIVIDUAL_ARYABHATA_CAMPUS_AMENITY',		'Amount',				2),
	('GREATPERSON_2MODERNATOMICTECHBOOST',						'Amount',				2),
	('GREATPERSON_2MODERNATOMICTECHBOOST',						'EndEraType',			'ERA_ATOMIC'),
	('GREATPERSON_2MODERNATOMICTECHBOOST',						'StartEraType',			'ERA_MODERN'),
	-- ('GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS',					'Amount',				1),
	-- ('GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS',					'EndEraType',			'ERA_MODERN'),
	-- ('GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS',					'StartEraType',			'ERA_INDUSTRIAL'),
	('GREATPERSON_REVEAL_ALUMINUM',								'ResourceType',			'RESOURCE_ALUMINUM'),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_MATHEMATICS',				'TechType',				'TECH_MATHEMATICS'),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_MATHEMATICS',				'GrantTechIfBoosted',	1),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_COMPUTERS',				'TechType',				'TECH_COMPUTERS'),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_COMPUTERS',				'GrantTechIfBoosted',	1),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_CHEMISTRY',				'TechType',				'TECH_CHEMISTRY'),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_CHEMISTRY',				'GrantTechIfBoosted',	1),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_REFINING',					'TechType',				'TECH_REFINING'),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_REFINING',					'GrantTechIfBoosted',	1),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_SANITATION',				'TechType',				'TECH_SANITATION'),
	('GREAT_PERSON_HD_BOOST_OR_GRANT_SANITATION',				'GrantTechIfBoosted',	1),
	('GREAT_PERSON_PLASTICS_TECHBOOST',							'TechType',				'TECH_PLASTICS');

--GREAT_PERSON_INDIVIDUAL_JANAKI_AMMAL
update ModifierArguments set Value = 800 where ModifierId = 'GREATPERSON_ADJACENT_RAINFOREST_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_MARY_LEAKEY
update ModifierArguments set Value = 700 where ModifierId = 'GREATPERSON_ARTIFACT_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_MARGARET_MEAD
update ModifierArguments set Value = 3000 where ModifierId = 'GREAT_PERSON_GRANT_LOTSO_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_ABDUS_SALAM
update ModifierArguments set Value = 'ERA_FUTURE' where ModifierId = 'GREATPERSON_ALLINFORMATIONTECHBOOSTS' and Name = 'EndEraType';

-- insert or replace into GreatWorks
--	(GreatWorkType, GreatWorkObjectType, GreatPersonIndividualType, Name, Audio, Image, Quote, Tourism, Eratype)
-- values
--	('GREATWORK_NEWTON',	'GREATWORKOBJECT_WRITING',	'GREAT_PERSON_INDIVIDUAL_ISAAC_NEWTON', 'LOC_GREATWORK_NEWTON_NAME',	NULL,
--		NULL, 'LOC_GREATWORK_NEWTON_QUOTE', 3,	'ERA_RENAISSANCE');

-- insert or replace into GreatWorkModifiers (GreatWorkType, ModifierId)
-- values ('GREATWORK_NEWTON','PRODUCT_SCIENCE_YIELD_BONUS_TURTLES');

-- todo: add a button for Newton
-- and see if he is 30% sicence boost

------------------------------------------------------------------------------------------------------------------------------
--- Great Merchants
-------------------------------------------------------------------------------------------------------------------------------
-- Colaeus
update GreatPersonIndividuals set ActionRequiresOwnedTile = 1, ActionRequiresVisibleLuxury = 0, ActionRequiresCompletedDistrictType = 'DISTRICT_COMMERCIAL_HUB'
	where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_COLAEUS';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_COLAEUS';
-- Marcus Licinius Crassus
update GreatPersonIndividuals set ActionCharges = 2, ActionRequiresUnownedTile = 0, ActionRequiresOwnedTile = 0, ActionRequiresAdjacentOwnedTile = 0, ActionRequiresCompletedDistrictType = null, ActionRequiresNoMilitaryUnit = 1, ActionEffectTileHighlighting = 0
	where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MARCUS_LICINIUS_CRASSUS';
update ModifierArguments set Value = 100 where ModifierId = 'GREATPERSON_GOLD_TINY' and Name = 'Amount';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MARCUS_LICINIUS_CRASSUS' and ModifierId = 'GREATPERSON_GRANT_PLOT';
-- Zhang Qian
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHANG_QIAN' and (ModifierId = 'GREATPERSON_GOLD_FROM_INCOMING_FOREIGN_ROUTES' or ModifierId = 'GREATPERSON_GOLD_TO_INCOMING_FOREIGN_ROUTES');
-- Marco Polo
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MARCO_POLO' and (ModifierId = 'GREATPERSON_GOLD_TO_INCOMING_FOREIGN_ROUTES' or ModifierId = 'GREATPERSON_GOLD_TO_INCOMING_FOREIGN_ROUTES');
-- Piero de' Bardi
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_PIERO_DE_BARDI';
-- Ibn Fadlan
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_IBN_FADLAN' and ModifierId = 'GREATPERSON_CITY_STATE_TRADE_FAITH';
-- Giovanni de' Medici
insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,						ModifierId,												AttachmentTargetType)
select
	'GREAT_PERSON_INDIVIDUAL_GIOVANNI_DE_MEDICI',	'GIOVANNI_DE_MEDICI_' || BuildingType || '_DISCOUNT',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_THEATER';
insert or replace into Modifiers
	(ModifierId,											ModifierType)
select
	'GIOVANNI_DE_MEDICI_' || BuildingType || '_DISCOUNT',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PURCHASE_COST'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_THEATER';
insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'GIOVANNI_DE_MEDICI_' || BuildingType || '_DISCOUNT',	'BuildingType',		BuildingType
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_THEATER';
insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'GIOVANNI_DE_MEDICI_' || BuildingType || '_DISCOUNT',	'Amount',			25
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_THEATER';
-- Jakob Fugger
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_GOLD_SMALL' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAKOB_FUGGER';
-- Raja Todar Mal
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_INFLUENCE_TOKENS_SMALL' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_RAJA_TODAR_MAL';
update ModifierArguments set Value = 2 where ModifierId = 'GREATPERSON_DOMESTIC_ROUTE_GOLD_PER_SPECIALTY_DISTRICT' and Name = 'Amount';
-- Zhou Daguan
update GreatPersonIndividuals set ActionRequiresCityStateTerritory = 0, ActionRequiresNonHostileTerritory = 0, ActionRequiresCompletedDistrictType = 'DISTRICT_COMMERCIAL_HUB' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
delete from GreatPersonIndividualBirthModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
-- John Jacob Astor
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_GOLD_LARGE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOHN_JACOB_ASTOR';
-- Adam Smith
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ADAM_SMITH' and (ModifierId = 'GREATPERSON_GOVERNOR_POINTS' or ModifierId = 'GREATPERSON_GOLD_LARGE');
-- Melitta Bentz
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MELITTA_BENTZ' and ModifierId = 'GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY';
-- Modifiers
insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,							ModifierId,									AttachmentTargetType)
values
	('GREAT_PERSON_INDIVIDUAL_COLAEUS',					'COLAEUS_SETTLER_PRODUCTION',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_COLAEUS',					'COLAEUS_SETTLER_MOVEMENT_ATTACH',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_MARCUS_LICINIUS_CRASSUS',	'MARCUS_LICINIUS_CRASSUS_SWORDSMAN',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_GREATPERSON'),
	('GREAT_PERSON_INDIVIDUAL_MARCUS_LICINIUS_CRASSUS',	'MARCUS_LICINIUS_CRASSUS_IRON',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_ZHANG_QIAN',				'ZHANG_QIAN_GRANT_TRADER',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_HD_CROESUS',				'CROESUS_MARKET',							'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_MARCO_POLO',				'MARCO_POLO_DO_NOTHING',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_PIERO_DE_BARDI',			'PIERO_DE_BARDI_COMMERCIAL_ATTACH',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_IBN_FADLAN',				'GREATPERSON_INFLUENCE_TOKENS_MEDIUM',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_HD_ALI_MUGHAYAT_SYAH',	'ALI_MUGHAYAT_SYAH_SETTLER',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_HD_ALI_MUGHAYAT_SYAH',	'ALI_MUGHAYAT_SYAH_BUILDER',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JAKOB_FUGGER',			'JAKOB_FUGGER_GOLD',						'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JAKOB_FUGGER',			'JAKOB_FUGGER_COMMERCIAL_ADJACENCY',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JAKOB_FUGGER',			'JAKOB_FUGGER_INDUSTRIAL_ADJACENCY',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_RAJA_TODAR_MAL',			'GREATPERSON_INFLUENCE_TOKENS_MEDIUM',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN',				'ZHOU_DAGUAN_TOKENS',						'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JOHN_JACOB_ASTOR',		'JOHN_JACOB_ASTOR_GOLD',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_ADAM_SMITH',				'GREATPERSON_ECONOMIC_POLICY_SLOT',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_MARY_KATHERINE_GODDARD',	'MARY_KATHERINE_DEFENSE',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_MELITTA_BENTZ',			'GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY2',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');
-- With conditions
with GreatPersonIndividualActionModifiers_Pre
	(GreatPersonIndividualType,							ModifierId,									AttachmentTargetType)
as (values
	('GREAT_PERSON_INDIVIDUAL_HD_SANG_HONGYANG',		'SANG_HONGYANG_MINT',						'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_HD_SANG_HONGYANG',		'SANG_HONGYANG_CULTURE',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_HD_SANG_HONGYANG',		'SANG_HONGYANG_CULTURE_MAGNUS_ATTACH',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'))
insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,							ModifierId,									AttachmentTargetType)
select
	GreatPersonIndividualType,							ModifierId,									AttachmentTargetType
from GreatPersonIndividualActionModifiers_Pre where GreatPersonIndividualType in (select GreatPersonIndividualType from GreatPersonIndividuals);

insert or replace into Modifiers
	(ModifierId,								ModifierType,														RunOnce,	Permanent,	SubjectRequirementSetId)
values
	('COLAEUS_SETTLER_PRODUCTION',				'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION',						0,			1,			null),
	('COLAEUS_SETTLER_MOVEMENT_ATTACH',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							0,			1,			null),
	('COLAEUS_SETTLER_MOVEMENT',				'MODIFIER_HD_CITY_TRAINED_UNITS_ADJUST_MOVEMENT',					0,			0,			'UNIT_IS_UNIT_SETTLER_REQUIREMENTS'),
	('MARCUS_LICINIUS_CRASSUS_SWORDSMAN',		'MODIFIER_PLAYER_UNIT_GRANT_UNIT_WITH_EXPERIENCE',					1,			1,			null),
	('MARCUS_LICINIUS_CRASSUS_IRON',			'MODIFIER_SINGLE_CITY_ADJUST_FREE_RESOURCE_EXTRACTION',				0,			1,			null),
	('ZHANG_QIAN_GRANT_TRADER',					'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',							1,			1,			null),
	('CROESUS_MARKET',							'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',				1,			1,			null),
	('SANG_HONGYANG_MINT',						'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',				1,			1,			null),
	('SANG_HONGYANG_CULTURE',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',					0,			1,			null),
	('SANG_HONGYANG_CULTURE_MAGNUS_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							0,			1,			null),
	('SANG_HONGYANG_CULTURE_MAGNUS',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',					0,			0,			'CITY_HAS_VERTICAL_INTEGRATION_REQUIREMENTS'),
	('MARCO_POLO_DO_NOTHING',					'MODIFIER_DO_NOTHING',												0,			0,			null),
	('PIERO_DE_BARDI_COMMERCIAL_ATTACH',		'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',						0,			1,			'DISTRICT_IS_DISTRICT_COMMERCIAL_HUB_REQUIREMENTS'),
	('ALI_MUGHAYAT_SYAH_SETTLER',				'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',							1,			1,			null),
	('ALI_MUGHAYAT_SYAH_BUILDER',				'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',							1,			1,			null),
	('JAKOB_FUGGER_GOLD',						'MODIFIER_PLAYER_GRANT_YIELD',										1,			1,			null),
	('JAKOB_FUGGER_COMMERCIAL_ADJACENCY',		'MODIFIER_PLAYER_CITIES_DISTRICT_ADJACENCY',						0,			1,			null),
	('JAKOB_FUGGER_INDUSTRIAL_ADJACENCY',		'MODIFIER_PLAYER_CITIES_DISTRICT_ADJACENCY',						0,			1,			null),
	('ZHOU_DAGUAN_TOKENS',						'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',							1,			1,			null),
	('JOHN_JACOB_ASTOR_GOLD',					'MODIFIER_PLAYER_GRANT_YIELD',										1,			1,			null),
	('MARY_KATHERINE_DEFENSE',					'MODIFIER_PLAYER_ADJUST_SPY_BONUS',									1,			1,			null),
	('GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY2', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',						1,			1,			null);
update Modifiers set SubjectRequirementSetId = 'CITY_CAN_RECIEVE_BUILDING_JNR_MINT_REGIONAL_BONUS_REQUIREMENTS'
	where (ModifierId = 'SANG_HONGYANG_CULTURE') and exists (select BuildingType from Buildings where BuildingType = 'BUILDING_JNR_MINT');
update Modifiers set SubjectRequirementSetId = 'CITY_CAN_GIVE_BUILDING_JNR_MINT_REGIONAL_BONUS_TO_MAGNUS_REQUIREMENTS'
	where (ModifierId = 'SANG_HONGYANG_CULTURE_MAGNUS_ATTACH') and exists (select BuildingType from Buildings where BuildingType = 'BUILDING_JNR_MINT');
update Modifiers set NewOnly = 1 where ModifierId = 'PIERO_DE_BARDI_COMMERCIAL_ATTACH';
with ModifierArguments_Pre
	(ModifierId,								Name,				Value)
as (values
	('SANG_HONGYANG_MINT',						'BuildingType',		'BUILDING_JNR_MINT'),
	('SANG_HONGYANG_CULTURE',					'YieldType',		'YIELD_CULTURE'),
	('SANG_HONGYANG_CULTURE',					'Amount',			1),
	('SANG_HONGYANG_CULTURE_MAGNUS_ATTACH',		'ModifierId',		'SANG_HONGYANG_CULTURE_MAGNUS'),
	('SANG_HONGYANG_CULTURE_MAGNUS',			'YieldType',		'YIELD_CULTURE'),
	('SANG_HONGYANG_CULTURE_MAGNUS',			'Amount',			1))
insert or replace into ModifierArguments
	(ModifierId,								Name,				Value)
select
	ModifierId,									Name,				Value
from ModifierArguments_Pre where ModifierId in (select ModifierId from Modifiers);
	

insert or replace into ModifierArguments
	(ModifierId,								Name,				Type,					Value)
values
	('JAKOB_FUGGER_GOLD',						'Amount',			'ScaleByGameSpeed',		400),
	('JOHN_JACOB_ASTOR_GOLD',					'Amount',			'ScaleByGameSpeed',		600);
insert or replace into ModifierArguments
	(ModifierId,								Name,				Value)
values
	('COLAEUS_SETTLER_PRODUCTION',				'Amount',			25),
	('COLAEUS_SETTLER_PRODUCTION',				'UnitType',			'UNIT_SETTLER'),
	('COLAEUS_SETTLER_MOVEMENT_ATTACH',			'ModifierId',		'COLAEUS_SETTLER_MOVEMENT'),
	('COLAEUS_SETTLER_MOVEMENT',				'Amount',			1),
	('MARCUS_LICINIUS_CRASSUS_SWORDSMAN',		'UnitType',			'UNIT_SWORDSMAN'),
	('MARCUS_LICINIUS_CRASSUS_SWORDSMAN',		'Experience',		0),
	('MARCUS_LICINIUS_CRASSUS_SWORDSMAN',		'UniqueOverride',	1),
	('MARCUS_LICINIUS_CRASSUS_IRON',			'ResourceType',		'RESOURCE_IRON'),
	('MARCUS_LICINIUS_CRASSUS_IRON',			'Amount',			2),
	('ZHANG_QIAN_GRANT_TRADER',					'UnitType',			'UNIT_TRADER'),
	('ZHANG_QIAN_GRANT_TRADER',					'Amount',			1),
	('CROESUS_MARKET',							'BuildingType',		'BUILDING_MARKET'),
	('PIERO_DE_BARDI_COMMERCIAL_ATTACH',		'ModifierId',		'GREATPERSON_INFLUENCE_TOKENS_SMALL'),
	('ALI_MUGHAYAT_SYAH_SETTLER',				'UnitType',			'UNIT_SETTLER'),
	('ALI_MUGHAYAT_SYAH_SETTLER',				'Amount',			1),
	('ALI_MUGHAYAT_SYAH_BUILDER',				'UnitType',			'UNIT_BUILDER'),
	('ALI_MUGHAYAT_SYAH_BUILDER',				'Amount',			1),
	('JAKOB_FUGGER_GOLD',						'YieldType',		'YIELD_GOLD'),
	('JAKOB_FUGGER_COMMERCIAL_ADJACENCY',		'DistrictType',		'DISTRICT_COMMERCIAL_HUB'),
	('JAKOB_FUGGER_COMMERCIAL_ADJACENCY',		'YieldType',		'YIELD_GOLD'),
	('JAKOB_FUGGER_COMMERCIAL_ADJACENCY',		'Amount',			1),
	('JAKOB_FUGGER_COMMERCIAL_ADJACENCY',		'Description',		'LOC_DISTRICT_DISTRICT_1_GOLD'),
	('JAKOB_FUGGER_INDUSTRIAL_ADJACENCY',		'DistrictType',		'DISTRICT_INDUSTRIAL_ZONE'),
	('JAKOB_FUGGER_INDUSTRIAL_ADJACENCY',		'YieldType',		'YIELD_PRODUCTION'),
	('JAKOB_FUGGER_INDUSTRIAL_ADJACENCY',		'Amount',			1),
	('JAKOB_FUGGER_INDUSTRIAL_ADJACENCY',		'Description',		'LOC_DISTRICT_DISTRICT_1_PRODUCTION'),
	('ZHOU_DAGUAN_TOKENS',						'Amount',			5),
	('JOHN_JACOB_ASTOR_GOLD',					'YieldType',		'YIELD_GOLD'),
	('MARY_KATHERINE_DEFENSE',					'Amount',			1),
	('MARY_KATHERINE_DEFENSE',					'Offense',			0),
	('GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY2', 'Amount',			2);
-- Text
update GreatPersonIndividuals set ActionEffectTextOverride = null where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHANG_QIAN' or GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MARCO_POLO';
update GreatPersonIndividuals set ActionEffectTextOverride = 'LOC_GREAT_PERSON_INDIVIDUAL_HD_CROESUS_ACTIVE' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_HD_CROESUS';
update GreatPersonIndividuals set ActionEffectTextOverride = 'LOC_GREAT_PERSON_INDIVIDUAL_HD_SANG_HONGYANG_ACTIVE' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_HD_SANG_HONGYANG';
update GreatPersonIndividuals set ActionEffectTextOverride = 'LOC_GREATPERSON_GIOVANNI_DE_MEDICI_ACTIVE_HD' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_GIOVANNI_DE_MEDICI';
insert or replace into ModifierStrings
	(ModifierId,								Context,		Text)
values
	('COLAEUS_SETTLER_PRODUCTION',				'Summary',		'LOC_COLAEUS_SETTLER_PRODUCTION'),
	('COLAEUS_SETTLER_MOVEMENT_ATTACH',			'Summary',		'LOC_COLAEUS_SETTLER_MOVEMENT_ATTACH'),
	('MARCUS_LICINIUS_CRASSUS_SWORDSMAN',		'Summary',		'LOC_MARCUS_LICINIUS_CRASSUS_SWORDSMAN'),
	('MARCUS_LICINIUS_CRASSUS_IRON',			'Summary',		'LOC_MARCUS_LICINIUS_CRASSUS_IRON'),
	('ZHANG_QIAN_GRANT_TRADER',					'Summary',		'LOC_ZHANG_QIAN_GRANT_TRADER'),
	('GREATPERSON_FREE_TRADER_UNIT',			'Summary',		'LOC_GREATPERSON_FREE_TRADER_UNIT'),
	('MARCO_POLO_DO_NOTHING',					'Summary',		'LOC_MARCO_POLO_NOTHING'),
	('PIERO_DE_BARDI_COMMERCIAL_ATTACH',		'Summary',		'LOC_PIERO_DE_BARDI_COMMERCIAL_ATTACH'),
	('ALI_MUGHAYAT_SYAH_SETTLER',				'Summary',		'LOC_ALI_MUGHAYAT_SYAH_SETTLER'),
	('ALI_MUGHAYAT_SYAH_BUILDER',				'Summary',		'LOC_ALI_MUGHAYAT_SYAH_BUILDER'),
	('JAKOB_FUGGER_GOLD',						'Summary',		'LOC_JAKOB_FUGGER_GOLD'),
	('JAKOB_FUGGER_COMMERCIAL_ADJACENCY',		'Summary',		'LOC_JAKOB_FUGGER_COMMERCIAL_ADJACENCY'),
	('JAKOB_FUGGER_INDUSTRIAL_ADJACENCY',		'Summary',		'LOC_JAKOB_FUGGER_INDUSTRIAL_ADJACENCY'),
	('ZHOU_DAGUAN_TOKENS',						'Summary',		'LOC_ZHOU_DAGUAN_TOKENS'),
	('JOHN_JACOB_ASTOR_GOLD',					'Summary',		'LOC_JOHN_JACOB_ASTOR_GOLD'),
	('MARY_KATHERINE_DEFENSE',					'Summary',		'LOC_MARY_KATHERINE_DEFENSE'),
	('GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY2',	'Summary',		'LOC_GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY2');

--克罗索斯
insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,							ModifierId,									AttachmentTargetType)
select
	'GREAT_PERSON_INDIVIDUAL_HD_CROESUS',				'CROESUS_' || BuildingType || '_GOLD',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' and Tier = 1 and ReplacesOther = 0;
insert or replace into Modifiers
	(ModifierId,										ModifierType)
select
	'CROESUS_' || BuildingType || '_GOLD',				'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' and Tier = 1 and ReplacesOther = 0;
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'CROESUS_' || BuildingType || '_GOLD',				'BuildingType',		BuildingType
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' and Tier = 1 and ReplacesOther = 0;
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'CROESUS_' || BuildingType || '_GOLD',				'YieldType',		'YIELD_GOLD'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' and Tier = 1 and ReplacesOther = 0;
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'CROESUS_' || BuildingType || '_GOLD',				'Amount',			3
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' and Tier = 1 and ReplacesOther = 0;
------------------------------------------------------------
-- great admiral
------------------------------------------------------------
-- GREAT_PERSON_INDIVIDUAL_ARTEMISIA grants a lighthouse and lighthouses +1 food
-- GREAT_PERSON_INDIVIDUAL_THEMISTOCLES grants an extra district capacity and an envoy
-- GREAT_PERSON_INDIVIDUAL_LEIF_ERIKSON grants a settler
-- GREAT_PERSON_INDIVIDUAL_HIMERIOS +1 charge
-- GREAT_PERSON_INDIVIDUAL_FRANCIS_DRAKE naval raider units +2 combat strength
-- GREAT_PERSON_INDIVIDUAL_FERDINAND_MAGELLAN grants a settler instead of luxulry resource
-- GREAT_PERSON_INDIVIDUAL_CHING_SHIH plunder bonus +100%
-- GREAT_PERSON_INDIVIDUAL_HORATIO_NELSON shipyards +2 production
-- GREAT_PERSON_INDIVIDUAL_LASKARINA_BOUBOULINA +2 charges
-- GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA grants a lighthouse, a shipyard, a seaport and all seaports +1 housing
-- GREAT_PERSON_INDIVIDUAL_SERGEY_GORSHKOV +1 charge
-- GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO +1 amenity for all harbors and -25% war weariness
-- GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO +1 Movement for all naval units
-- GREAT_PERSON_INDIVIDUAL_CHESTER_NIMITZ grants an aircraft carrier with free promotion

update GreatPersonIndividuals set ActionRequiresOwnedTile = 1, ActionRequiresMilitaryUnitDomain = NULL, ActionRequiresCompletedDistrictType = 'DISTRICT_HARBOR', ActionEffectTileHighlighting = 1, ActionRequiresUnitCanGainExperience = 0
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ARTEMISIA';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 1, ActionRequiresNoMilitaryUnit = 0, ActionRequiresCompletedDistrictType = 'DISTRICT_HARBOR', ActionEffectTileHighlighting = 1
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_THEMISTOCLES';
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_HIMERIOS';
update GreatPersonIndividuals set ActionRequiresVisibleLuxury = 0, ActionEffectTileHighlighting = 0 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_FERDINAND_MAGELLAN';
update ModifierArguments set Value = 100 where ModifierId = 'CHING_SHIH_PLUNDER_BONUS' and Name = 'Amount';
update GreatPersonIndividuals set ActionCharges = 3 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_LASKARINA_BOUBOULINA';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 1, ActionRequiresCompletedDistrictType = 'DISTRICT_HARBOR', ActionEffectTileHighlighting = 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA';
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_SERGEY_GORSHKOV';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 1, ActionRequiresMilitaryUnitDomain = NULL, ActionRequiresCompletedDistrictType = 'DISTRICT_HARBOR', ActionEffectTileHighlighting = 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 0, ActionRequiresCompletedDistrictType = NULL, ActionEffectTileHighlighting = 0 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO';
update ModifierArguments set Value = 'UNIT_AIRCRAFT_CARRIER' where ModifierId = 'GREATPERSON_CHESTER_NIMITZ_UNIT_PROMOTION' and Name = 'UnitType';

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_ARTEMISIA_ACTIVE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ARTEMISIA';
delete from GreatPersonIndividualActionModifiers where (ModifierId = 'GREATPERSON_THEMISTOCLES_ACTIVE' or ModifierId = 'GREATPERSON_THEMISTOCLES_NAVAL_RANGED') and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_THEMISTOCLES';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_FERDINAND_MAGELLAN_GRANT_PLOT_RESOURCE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_FERDINAND_MAGELLAN';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_JOAQUIM_MARQUES_LISBOA_ACTIVE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA';
delete from GreatPersonIndividualActionModifiers where (ModifierId = 'GREATPERSON_CLANCY_FERNANDO_ACTIVE' or ModifierId = 'GREATPERSON_CLANCY_FERNANDO_ACTIVE_UNIT_BONUS') and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_TOGO_HEIHACHIRO_ACTIVE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO';

--update ModifierArguments set Value = 'TERRAIN_OCEAN,TERRAIN_COAST' where ModifierId = 'GREATPERSON_LEIF_ERIKSON_ACTIVE' and Name = 'TerrainType';
update RequirementSets set RequirementSetType = 'REQUIREMENTSET_TEST_ANY' where RequirementSetId = 'GREATPERSON_LEIF_ERIKSON_ACTIVE_REQUIREMENTS';
insert or ignore into RequirementSetRequirements	(RequirementSetId,	RequirementId)	
values	('GREATPERSON_LEIF_ERIKSON_ACTIVE_REQUIREMENTS', 'REQUIREMENT_UNIT_IS_SETTLER');

insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,							ModifierId,												AttachmentTargetType)
values
	('GREAT_PERSON_INDIVIDUAL_ARTEMISIA',				'ARTEMISIA_LIGHTHOUSE',									'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_ARTEMISIA',				'ARTEMISIA_LIGHTHOUSE_FOOD',							'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_THEMISTOCLES',			'GREATPERSON_EXTRA_DISTRICT_CAPACITY',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_THEMISTOCLES',			'GREATPERSON_INFLUENCE_TOKENS_SMALL',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_LEIF_ERIKSON',			'GREATPERSON_GRANT_A_SETTLER',							'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_GREATPERSON'),
	('GREAT_PERSON_INDIVIDUAL_FRANCIS_DRAKE',			'GREATPERSON_NAVLA_RAIDER_BONUS',						'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_FERDINAND_MAGELLAN',		'GREATPERSON_GRANT_A_SETTLER',							'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_GREATPERSON'),
	('GREAT_PERSON_INDIVIDUAL_HORATIO_NELSON',			'HORATIO_NELSON_SHIPYARD_PRODUCTION',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_LEIF_ERIKSON',			'GREATPERSON_SETTLER_EMBARK',							'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA',	'GREATPERSON_HORATIO_NELSON_LIGHTHOUSE',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA',	'GREATPERSON_HORATIO_NELSON_SHIPYARD',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA',	'GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA',	'GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO',			'GREATPERSON_JOAQUIM_MARQUES_LISBOA_ACTIVE',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO',			'GREATPERSON_CLANCY_FERNANDO_AMENITIES',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO',			'GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT', 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER');

insert or replace into Modifiers
	(ModifierId,												ModifierType,											RunOnce,	Permanent)
values
	('ARTEMISIA_LIGHTHOUSE',									'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',	1,			1),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	0,			1),
	('GREATPERSON_GRANT_A_SETTLER',								'MODIFIER_PLAYER_UNIT_GRANT_UNIT_WITH_EXPERIENCE',		1,			1),
	('GREATPERSON_NAVLA_RAIDER_BONUS',							'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',					0,			1),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	0,			1),
	('GREATPERSON_SETTLER_EMBARK',								'MODIFIER_PLAYER_ADJUST_EMBARK_UNIT_PASS',				0,			1),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT',				'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',	1,			1),
	('GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT',	'MODIFIER_PLAYER_UNITS_ADJUST_SEA_MOVEMENT',			1,			1);

insert or replace into Modifiers
	(ModifierId,											ModifierType,										RunOnce,		Permanent,	SubjectRequirementSetId)
values
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_HOUSING',	0,				1,			'BUILDING_IS_SEAPORT'),
	('GREATPERSON_CLANCY_FERNANDO_AMENITIES',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_AMENITIES_FROM_GREAT_PEOPLE',	0,	1,		'CITY_HAS_HARBOR_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,												Name,				Value)
values
	('ARTEMISIA_LIGHTHOUSE',									'BuildingType',		'BUILDING_LIGHTHOUSE'),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'BuildingType',		'BUILDING_LIGHTHOUSE'),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'YieldType',		'YIELD_FOOD'),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'Amount',			1),
	('GREATPERSON_GRANT_A_SETTLER',								'UnitType',			'UNIT_SETTLER'),
	('GREATPERSON_NAVLA_RAIDER_BONUS',							'AbilityType',		'ABILITY_NAVAL_RAIDER_BONUS'),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'BuildingType',		'BUILDING_SHIPYARD'),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'YieldType',		'YIELD_PRODUCTION'),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'Amount',			2),
	('GREATPERSON_SETTLER_EMBARK',								'UnitType',			'UNIT_SETTLER'),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT',				'BuildingType',		'BUILDING_SEAPORT'),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING',		'Amount',			1),
	('GREATPERSON_CLANCY_FERNANDO_AMENITIES',					'Amount',			1),
	('GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT',	'Amount',			1);

insert or replace into ModifierStrings
	(ModifierId,												Context,	Text)
values
	('ARTEMISIA_LIGHTHOUSE',									'Summary',	'LOC_ARTEMISIA_LIGHTHOUSE'),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'Summary',	'LOC_ARTEMISIA_LIGHTHOUSE_FOOD'),
	('GREATPERSON_GRANT_A_SETTLER',								'Summary',	'LOC_GREATPERSON_GRANT_A_SETTLER'),
	('GREATPERSON_NAVLA_RAIDER_BONUS',							'Summary',	'LOC_GREATPERSON_NAVLA_RAIDER_BONUS'),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'Summary',	'LOC_HORATIO_NELSON_SHIPYARD_PRODUCTION'),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT',				'Summary',	'LOC_GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT'),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING',		'Summary',	'LOC_GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING'),
	('GREATPERSON_CLANCY_FERNANDO_AMENITIES',					'Summary',	'LOC_GREATPERSON_CLANCY_FERNANDO_AMENITIES'),
	('GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT',	'Summary',	'LOC_GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT');

update ModifierStrings set Text = 'LOC_PIERO_DE_BARDI_GOLD' where ModifierId = 'GREATPERSON_FERDINAND_MAGELLAN_ACTIVE';

-- Mimar Sinan.
insert or replace into Modifiers (ModifierId, ModifierType) values
('GREATPERSON_CULTURE_BOMB_MIMAR_SINAN', 'MODIFIER_DO_NOTHING');
insert or replace into ModifierStrings (ModifierId, Context, Text) values
('GREATPERSON_CULTURE_BOMB_MIMAR_SINAN', 'Summary', 'LOC_GREATPERSON_DISTRICT_CULTURE_BOMB');

update GreatPersonIndividuals set
ActionCharges = 2,
ActionRequiresCompletedDistrictType = NULL,
ActionEffectTileHighlighting = 0
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MIMAR_SINAN';

update GreatPersonIndividualActionModifiers
set ModifierId = 'GREATPERSON_CULTURE_BOMB_MIMAR_SINAN', AttachmentTargetType = 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MIMAR_SINAN';

-- 使者调整
	-- 【大将军】 安娜·恩津加
-- update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ANA_NZINGA';
	-- 【大商人】 拉贾·托达·马尔 皮耶罗·迪·巴尔迪 【海军统帅】 特米斯托克力
-- update ModifierArguments set Value = 2 where ModifierId = 'GREATPERSON_INFLUENCE_TOKENS_SMALL';
	-- 【大商人】 雅各布·富格尔 约翰·雅各·阿斯特
-- update ModifierArguments set Value = 4 where ModifierId = 'GREATPERSON_INFLUENCE_TOKENS_MEDIUM';
	-- 【大商人】 周达观
-- update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';

-- 新大作家
insert or replace into Types
	(Type,											Kind)
values
	('GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU',			'KIND_GREAT_PERSON_INDIVIDUAL'),
	('GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN',			'KIND_GREAT_PERSON_INDIVIDUAL');

insert or replace into GreatPersonIndividuals
	(GreatPersonIndividualType,						Name,												GreatPersonClassType,			EraType,			ActionCharges,		ActionRequiresOwnedTile,		Gender)
values
	('GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU',			'LOC_GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU_NAME',		'GREAT_PERSON_CLASS_WRITER',	'ERA_CLASSICAL',	0,					1,								'M'),
	('GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN',			'LOC_GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN_NAME',		'GREAT_PERSON_CLASS_WRITER',	'ERA_CLASSICAL',	0,					1,								'M');

------------------------------------------------------------------------------------------------
--大军改动 by先驱

--布狄卡由一次改为两次(取消)
--update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_BOUDICA';
--汉尼拔·巴卡由两次改为三次
update GreatPersonIndividuals set ActionCharges = 3 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_HANNIBAL_BARCA';
--孙子新增能力：全国军事单位战斗经验+25%（效果还在大军上，能力写在书上）
--update GreatPersonIndividuals set ActionCharges = 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_SUN_TZU';
--埃塞尔弗莱德能力重做：完成1个兵营，对蛮子+3力。可以使用两次
update GreatPersonIndividuals set ActionCharges = 2, ActionRequiresCompletedDistrictType = 'DISTRICT_ENCAMPMENT'
	where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_AETHELFLAED';
--古斯塔夫·阿道弗斯，不送单位的晋升，次数由1改为2
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_GUSTAVUS_ADOLPHUS';
update ModifierArguments set Value = 0 where ModifierId = 'GREATPERSON_GUSTAVUS_ADOLPHUS_ACTIVE' and Name = 'Experience';
--安娜·恩津加次数由2改为4
update GreatPersonIndividuals set ActionCharges = 4 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ANA_NZINGA';
--詹西女王由一次改为两次
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_RANI_LAKSHMIBAI';
--次数由1改为2
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_SIMON_BOLIVAR';

update GreatPersonIndividuals set
	ActionRequiresUnitCanGainExperience = 0,
	ActionRequiresMilitaryUnitDomain = NULL,
	ActionRequiresCompletedDistrictType = 'DISTRICT_CITY_CENTER'
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_TIMUR';

update GreatPersonIndividuals set 
	ActionRequiresCompletedDistrictType = NULL,
	ActionRequiresNoMilitaryUnit = 1,
	ActionRequiresOwnedTile = 0,
	ActionEffectTileHighlighting = 0
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_SIMON_BOLIVAR';

insert or replace into ModifierStrings
	(ModifierId,								Context,		Text)
values
--	('GREATPERSON_SUN_ZTU_ACTIVE_1',			'Summary',		'LOC_GREATPERSON_SUN_ZTU_ACTIVE'),
	('GREATPERSON_AETHELFLAED_ACTIVE_1',		'Summary',		'LOC_GREATPERSON_AETHELFLAED_ACTIVE'),
	('GREATPERSON_EL_CID_ACTIVE',				'Summary',		'LOC_GREATPERSON_EL_CID_ACTIVE'),
	('GREATPERSON_TIMUR_ACTIVE_1',				'Summary',		'LOC_GREATPERSON_TIMUR_ACTIVE'),
	('GREATPERSON_GUSTAVUS_ADOLPHUS_ACTIVE',	'Summary',		'LOC_GREATPERSON_GUSTAVUS_ADOLPHUS_ACTIVE'),
	('GREATPERSON_NAPOLEON_BONAPARTE_ACTIVE',	'Summary',		'LOC_GREATPERSON_NAPOLEON_BONAPARTE_ACTIVE'),
	('GREATPERSON_SIMON_BOLIVAR_ACTIVE_1',		'Summary',		'LOC_GREATPERSON_SIMON_BOLIVAR_ACTIVE');

delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_AETHELFLAED' and ModifierId = 'GREATPERSON_AETHELFLAED_ACTIVE';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_TIMUR' and ModifierId = 'GREATPERSON_TIMUR_ACTIVE';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_TIMUR' and ModifierId = 'GREATPERSON_TIMUR_ACTIVE_UNIT_BONUS';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_SIMON_BOLIVAR' and ModifierId = 'GREATPERSON_SIMON_BOLIVAR_ACTIVE';

insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,						ModifierId,									AttachmentTargetType)
values
	('GREAT_PERSON_INDIVIDUAL_SUN_TZU',				'GREATPERSON_SUN_ZTU_ACTIVE_1',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
--埃塞尔弗莱德能力重做：完成1个兵营，对蛮子+3力。可以使用两次
	('GREAT_PERSON_INDIVIDUAL_AETHELFLAED',			'GREATPERSON_AETHELFLAED_ACTIVE_1',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_AETHELFLAED',			'GREATPERSON_AETHELFLAED_ACTIVE_2',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
--艾尔·熙德新增能力：给一个升级
	('GREAT_PERSON_INDIVIDUAL_EL_CID',				'GREATPERSON_EL_CID_ACTIVE_1',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_DOMAIN_MILITARY_IN_TILE'),
--帖木儿能力重做：为该城市赠予一个免费的商人单位，增加1条贸易路线容量。
	('GREAT_PERSON_INDIVIDUAL_TIMUR',				'GREATPERSON_TIMUR_ACTIVE_1',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
	('GREAT_PERSON_INDIVIDUAL_TIMUR',				'GREATPERSON_TIMUR_ACTIVE_2',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
--拿破仑波拿巴新增能力：给一个升级
	('GREAT_PERSON_INDIVIDUAL_NAPOLEON_BONAPARTE',	'GREATPERSON_NAPOLEON_BONAPARTE_ACTIVE_1',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_DOMAIN_MILITARY_IN_TILE'),
--圣马丁能力重做：立即创建1个胸甲骑兵单位。
	('GREAT_PERSON_INDIVIDUAL_SIMON_BOLIVAR',		'GREATPERSON_SIMON_BOLIVAR_ACTIVE_1',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_GREATPERSON');
--insert or replace into GreatWorkModifiers
--	(GreatWorkType,					ModifierId)
--values
--	('GREATWORK_SUN_TZU',			'GREATPERSON_SUN_ZTU_ACTIVE_1');
insert or replace into Modifiers
	(ModifierId,								ModifierType,								RunOnce,	Permanent)
values
	('GREATPERSON_SUN_ZTU_ACTIVE_1',			'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_EXPERIENCE_MODIFIER',	0,	0),
	('GREATPERSON_AETHELFLAED_ACTIVE_1',		'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',		1,	1),
	('GREATPERSON_AETHELFLAED_ACTIVE_2',		'MODIFIER_PLAYER_UNITS_ADJUST_BARBARIAN_COMBAT',			1,	1),
	('GREATPERSON_EL_CID_ACTIVE_1',				'MODIFIER_PLAYER_UNIT_ADJUST_GRANT_EXPERIENCE',				1,	1),
	('GREATPERSON_TIMUR_ACTIVE_1',				'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',					1,	1),
	('GREATPERSON_TIMUR_ACTIVE_2',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',				1,	1),
	('GREATPERSON_NAPOLEON_BONAPARTE_ACTIVE_1', 'MODIFIER_PLAYER_UNIT_ADJUST_GRANT_EXPERIENCE',				1,	1),
	('GREATPERSON_SIMON_BOLIVAR_ACTIVE_1',		'MODIFIER_PLAYER_UNIT_GRANT_UNIT_WITH_EXPERIENCE',			1,	1);

insert or replace into ModifierArguments 
	(ModifierID,								Name,			Value) 
values 
	('GREATPERSON_SUN_ZTU_ACTIVE_1',			'Amount',		25),
	('GREATPERSON_AETHELFLAED_ACTIVE_1',		'BuildingType', 'BUILDING_BARRACKS'),
	('GREATPERSON_AETHELFLAED_ACTIVE_2',		'Amount',		3),
	('GREATPERSON_EL_CID_ACTIVE_1',				'Amount',		-1),
	('GREATPERSON_TIMUR_ACTIVE_1',				'Amount',		1),
	('GREATPERSON_TIMUR_ACTIVE_1',				'UnitType',		'UNIT_TRADER'),
	('GREATPERSON_TIMUR_ACTIVE_2',				'Amount',		1),
	('GREATPERSON_NAPOLEON_BONAPARTE_ACTIVE_1', 'Amount',		-1),
	('GREATPERSON_SIMON_BOLIVAR_ACTIVE_1',		'Experience',	0),
	('GREATPERSON_SIMON_BOLIVAR_ACTIVE_1',		'UnitType',		'UNIT_CUIRASSIER'),
	('GREATPERSON_SIMON_BOLIVAR_ACTIVE_1',		'UniqueOverride',	1);
