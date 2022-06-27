
--BUILDING_SUK_WAT_ARUN
update Buildings set  Cost = 1000, ObsoleteEra = 'ERA_MODERN', PrereqTech = NULL, PrereqCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD' where BuildingType = 'BUILDING_SUK_WAT_ARUN';-- AND EXISTS (select BuildingType from Buildings where BuildingType ='BUILDING_SUK_WAT_ARUN');

insert or replace into Building_YieldChanges
	(BuildingType,							YieldType,									YieldChange)
values
	('BUILDING_SUK_WAT_ARUN',				'YIELD_CULTURE',							5);
delete from Building_GreatPersonPoints where BuildingType = 'BUILDING_SUK_WAT_ARUN';
delete from BuildingModifiers where BuildingType = 'BUILDING_SUK_WAT_ARUN';
insert or replace into GlobalParameters
    (Name,                          Value)
values
    ('WAT_ARUN_FAITH_PERCENTAGE',   100);

-- this modifier is used by lua instead of directly attached to Wat Arun
insert or replace into Modifiers
    (ModifierId,            ModifierType,                                       SubjectRequirementSetId)
values
    ('WAT_ARUN_INFLUNCE',   'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN', 'PLAYER_HAS_BUILDING_SUK_WAT_ARUN_REQUIREMENTS');
insert or replace into ModifierArguments
    (ModifierId,            Name,       Value)
values
    ('WAT_ARUN_INFLUNCE',   'Amount',   2);

/*
create temporary table WatArunBuildingTourisms (BuildingType text not null primary key, Tourism int);
insert into WatArunBuildingTourisms
    (BuildingType,  Tourism)
select
    b.BuildingType,   YieldChange
from (Buildings b inner join Building_YieldChanges y on b.BuildingType = y.BuildingType) where PrereqDistrict = 'DISTRICT_HOLY_SITE' and YieldType = 'YIELD_FAITH';
insert or replace into RequirementSets
    (RequirementSetId,              RequirementSetType)
values
    ('CITY_HAS_WORSHIP_BUILDING',   'REQUIREMENTSET_TEST_ANY');
insert or replace into RequirementSetRequirements
    (RequirementSetId,              RequirementId)
select
    'CITY_HAS_WORSHIP_BUILDING',    'REQUIRES_CITY_HAS_' || BuildingType
from Buildings where EnabledByReligion = 1;
insert or replace into Requirements
    (RequirementId,                         RequirementType)
values
    ('REQUIRES_CITY_HAS_WORSHIP_BUILDING',  'REQUIREMENT_REQUIREMENTSET_IS_MET');
insert or replace into RequirementArguments
    (RequirementId,                         Name,               Value)
values
    ('REQUIRES_CITY_HAS_WORSHIP_BUILDING',  'RequirementSetId', 'CITY_HAS_WORSHIP_BUILDING');
insert or replace into RequirementSets
    (RequirementSetId,                                                              RequirementSetType)
select
    'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType || '_DISTRCIT_IS_HOLY_SITE',   'REQUIREMENTSET_TEST_ALL'
from WatArunBuildingTourisms;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                                                              RequirementId)
select
    'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType || '_DISTRCIT_IS_HOLY_SITE',   'REQUIRES_CITY_HAS_WORSHIP_BUILDING'
from WatArunBuildingTourisms;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                                                              RequirementId)
select
    'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType || '_DISTRCIT_IS_HOLY_SITE',   'REQUIRES_DISTRICT_IS_DISTRICT_HOLY_SITE'
from WatArunBuildingTourisms;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                                                               RequirementId)
select
    'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType ||  '_DISTRCIT_IS_HOLY_SITE',   'REQUIRES_CITY_HAS_' || BuildingType
from WatArunBuildingTourisms;
insert or replace into BuildingModifiers
    (BuildingType,              ModifierId)
select
    'BUILDING_SUK_WAT_ARUN',    'WAT_ARUN_' || BuildingType || '_TOURISM'
from WatArunBuildingTourisms;
insert or replace into Modifiers
    (ModifierId,                                ModifierType,                                       SubjectRequirementSetId)
select
    'WAT_ARUN_' || BuildingType || '_TOURISM', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_CHANGE',   'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType ||'_DISTRCIT_IS_HOLY_SITE'
from WatArunBuildingTourisms;
insert or replace into ModifierArguments
    (ModifierId,                                Name,       Value)
select
    'WAT_ARUN_' || BuildingType || '_TOURISM', 'Amount',    Tourism
from WatArunBuildingTourisms;
insert or replace into BuildingModifiers
    (BuildingType,              ModifierId)
values
    ('BUILDING_SUK_WAT_ARUN',   'WAT_ARUN_INFLUENCE_ATTACH');
insert or replace into Modifiers
    (ModifierId,                    ModifierType,                                           SubjectRequirementSetId)
values  
    ('WAT_ARUN_INFLUENCE_ATTACH',   'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               'CITY_HAS_WORSHIP_BUILDING'),
    ('WAT_ARUN_INFLUENCE',          'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',     null);
insert or replace into ModifierArguments
    (ModifierId,                    Name,           Value)
values  
    ('WAT_ARUN_INFLUENCE_ATTACH',   'ModifierId',   'WAT_ARUN_INFLUENCE'),
    ('WAT_ARUN_INFLUENCE',          'Amount',       2);
*/

--delete from BuildingModifiers where BuildingType = 'BUILDING_SUK_WAT_ARUN';
--insert or replace into BuildingModifiers
--	(BuildingType,							ModifierId)
--values
--	('BUILDING_SUK_WAT_ARUN',				'WAT_ARUN_COMMERCIAL_HUB_TOKEN_ATTACH'),
--	('BUILDING_SUK_WAT_ARUN',				'WAT_ARUN_THEATER_TOKEN_ATTACH'),
--	('BUILDING_SUK_WAT_ARUN',				'WAT_ARUN_INFLUENCE_POINTS');

--insert or replace into Modifiers
--	(ModifierId,								ModifierType, 											SubjectRequirementSetId)
--values
--	('WAT_ARUN_COMMERCIAL_HUB_TOKEN_ATTACH',	'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',			'DISTRICT_IS_COMMERCIAL_HUB'),
--	('WAT_ARUN_THEATER_TOKEN_ATTACH',			'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',			'DISTRICT_IS_THEATER'),
--	('WAT_ARUN_INFLUENCE_POINTS',				'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',		NULL),
--	('WAT_ARUN_GRANT_ONE_TOKEN',				'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',				NULL);
--update Modifiers set RunOnce = 1 where ModifierId = 'WAT_ARUN_COMMERCIAL_HUB_TOKEN_ATTACH';
--update Modifiers set RunOnce = 1 where ModifierId = 'WAT_ARUN_THEATER_TOKEN_ATTACH';

--insert or replace into ModifierArguments
--	(ModifierId,								Name,			Value)
--values
--	('WAT_ARUN_COMMERCIAL_HUB_TOKEN_ATTACH',	'ModifierId',	'WAT_ARUN_GRANT_ONE_TOKEN'),
--	('WAT_ARUN_THEATER_TOKEN_ATTACH',			'ModifierId',	'WAT_ARUN_GRANT_ONE_TOKEN'),
--	('WAT_ARUN_INFLUENCE_POINTS',				'Amount',		5),
--	('WAT_ARUN_GRANT_ONE_TOKEN',				'Amount',		1);

-- insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
-- 	'BUILDING_SUK_WAT_ARUN',	'WAT_ARUN_DISTRICT_HOUSING'
-- where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_SUK_WAT_ARUN');
-- insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
-- 	'BUILDING_SUK_WAT_ARUN',	'WAT_ARUN_DISTRICT_HOUSING_SELF'
-- where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_SUK_WAT_ARUN');
-- insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
-- 	'BUILDING_SUK_WAT_ARUN',	'WAT_ARUN_DISTRICT_FOOD'
-- where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_SUK_WAT_ARUN');
-- insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
-- 	'BUILDING_SUK_WAT_ARUN',	'WAT_ARUN_DISTRICT_FOOD_SELF'
-- where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_SUK_WAT_ARUN');

-- insert or replace into Modifiers 
-- 	(ModifierId,						ModifierType,											SubjectRequirementSetId) 
-- values
-- 	('WAT_ARUN_DISTRICT_HOUSING',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',				'PLOT_IS_DISTRICT_ADJACENT_TO_RIVER_REQUIREMENTS'),
-- 	('WAT_ARUN_DISTRICT_HOUSING_SELF',	'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_HOUSING',		'PLOT_IS_DISTRICT_ADJACENT_TO_RIVER_REQUIREMENTS'),												
-- 	('WAT_ARUN_DISTRICT_FOOD',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',		'PLOT_IS_DISTRICT_ADJACENT_TO_RIVER_REQUIREMENTS'),											
-- 	('WAT_ARUN_DISTRICT_FOOD_SELF',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',	'PLOT_IS_DISTRICT_ADJACENT_TO_RIVER_REQUIREMENTS');	

-- insert or replace into ModifierArguments 
-- 	(ModifierId,						Name,		Value) 
-- values
-- 	('WAT_ARUN_DISTRICT_HOUSING',		'Amount',		1),			
-- 	('WAT_ARUN_DISTRICT_HOUSING_SELF',	'Amount',		1),
-- 	('WAT_ARUN_DISTRICT_FOOD',			'YieldType',	'YIELD_FOOD'),
-- 	('WAT_ARUN_DISTRICT_FOOD',			'Amount',		1),
-- 	('WAT_ARUN_DISTRICT_FOOD_SELF',		'YieldType',	'YIELD_FOOD'),
-- 	('WAT_ARUN_DISTRICT_FOOD_SELF',		'Amount',		1);
