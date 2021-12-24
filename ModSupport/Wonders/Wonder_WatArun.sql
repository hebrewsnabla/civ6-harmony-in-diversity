
--BUILDING_SUK_WAT_ARUN
update Buildings set  Cost = 1160, ObsoleteEra = 'ERA_MODERN', PrereqTech = NULL, PrereqCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD'
where BuildingType = 'BUILDING_SUK_WAT_ARUN' AND EXISTS (select BuildingType from Buildings where BuildingType ='BUILDING_SUK_WAT_ARUN');

insert or replace into Building_YieldChanges
	(BuildingType,							YieldType,									YieldChange)
values
	('BUILDING_SUK_WAT_ARUN',				'YIELD_CULTURE',							5);

delete from BuildingModifiers where BuildingType = 'BUILDING_SUK_WAT_ARUN';

insert or replace into Modifiers
	(ModifierId,							ModifierType, 											SubjectRequirementSetId)
values
	('WAT_ARUN_INFLUENCE_POINTS_ATTACH',	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				'HD_CITY_HAS_WAT_ARUN_XHH'),
	('WAT_ARUN_COMMERCIAL_HUB_TOKEN_ATTACH','MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				'HD_CITY_HAS_DISTRICT_COMMERCIAL_HUB_XHH'),
	('WAT_ARUN_THEATER_TOKEN_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',				'HD_CITY_HAS_DISTRICT_THEATER_XHH'),
	('WAT_ARUN_INFLUENCE_POINTS',			'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',		NULL),
	('WAT_ARUN_GRANT_ONE_TOKEN',			'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',				NULL);

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('WAT_ARUN_INFLUENCE_POINTS_ATTACH',	'ModifierId',	'WAT_ARUN_INFLUENCE_POINTS'),
	('WAT_ARUN_COMMERCIAL_HUB_TOKEN_ATTACH','ModifierId',	'WAT_ARUN_GRANT_ONE_TOKEN'),
	('WAT_ARUN_THEATER_TOKEN_ATTACH',		'ModifierId',	'WAT_ARUN_GRANT_ONE_TOKEN'),
	('WAT_ARUN_INFLUENCE_POINTS',			'Amount',		5),
	('WAT_ARUN_GRANT_ONE_TOKEN',			'Amount',		1);

insert or replace into RequirementSets
	(RequirementSetId,							RequirementSetType)
values
	('HD_CITY_HAS_DISTRICT_COMMERCIAL_HUB_XHH',	'REQUIREMENTSET_TEST_ALL'),
	('HD_CITY_HAS_WAT_ARUN_XHH',				'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,							RequirementId)
values
	('HD_CITY_HAS_DISTRICT_COMMERCIAL_HUB_XHH',	'REQUIRES_CITY_HAS_DISTRICT_COMMERCIAL_HUB'),
	('HD_CITY_HAS_WAT_ARUN_XHH',				'REQUIRES_CITY_HAS_BUILDING_SUK_WAT_ARUN');

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('BUILDING_SUK_WAT_ARUN',				'WAT_ARUN_COMMERCIAL_HUB_TOKEN_ATTACH'),
	('BUILDING_SUK_WAT_ARUN',				'WAT_ARUN_THEATER_TOKEN_ATTACH'),
	('BUILDING_SUK_WAT_ARUN',				'WAT_ARUN_INFLUENCE_POINTS_ATTACH');

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
