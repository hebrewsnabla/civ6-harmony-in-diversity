-------------------------------------
--      Projects Adjustments      --
-------------------------------------

-- Projects
-- update Projects set CostProgressionModel = 'NO_PROGRESSION_MODEL', CostProgressionParam1 = 0
update Projects set CostProgressionParam1 = 1100 -- was 600
 where ProjectType = 'PROJECT_CARNIVAL'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_ENCAMPMENT'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_HARBOR'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_INDUSTRIAL_ZONE'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_COMMERCIAL_HUB'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_HOLY_SITE'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_CAMPUS'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_THEATER'
	or ProjectType = 'PROJECT_WATER_CARNIVAL'
	or ProjectType = 'PROJECT_BREAD_AND_CIRCUSES'
	or ProjectType = 'PROJECT_WATER_BREAD_AND_CIRCUSES'
;

update Projects set Cost = 40
 where ProjectType = 'PROJECT_CARNIVAL'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_ENCAMPMENT'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_HARBOR'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_INDUSTRIAL_ZONE'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_COMMERCIAL_HUB'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_HOLY_SITE'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_CAMPUS'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_THEATER'
	or ProjectType = 'PROJECT_WATER_CARNIVAL'
	or ProjectType = 'PROJECT_BREAD_AND_CIRCUSES'
	or ProjectType = 'PROJECT_WATER_BREAD_AND_CIRCUSES'
;

update Projects set CostProgressionParam1 = 800, Cost = 80 where ProjectType = 'PROJECT_COURT_FESTIVAL';

-- update Projects set CostProgressionModel = 'NO_PROGRESSION_MODEL', CostProgressionParam1 = 0, Cost = 200
update Projects set CostProgressionParam1 = 300, Cost = 100
	where ProjectType = 'PROJECT_COTHON_CAPITAL_MOVE';

-- TODO OCCULT project in Secret Societies MODE

-- Project Great Points
-- update Project_GreatPersonPoints set PointProgressionModel = 'NO_PROGRESSION_MODEL', PointProgressionParam1 = 0
update Project_GreatPersonPoints set PointProgressionParam1 = 900 -- was 500
 where ProjectType = 'PROJECT_CARNIVAL'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_ENCAMPMENT'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_HARBOR'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_INDUSTRIAL_ZONE'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_COMMERCIAL_HUB'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_HOLY_SITE'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_CAMPUS'
	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_THEATER'
	or ProjectType = 'PROJECT_WATER_CARNIVAL'
;

-- update Project_GreatPersonPoints set Points = 10
--  where ProjectType = 'PROJECT_ENHANCE_DISTRICT_ENCAMPMENT'
-- 	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_HARBOR'
-- 	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_INDUSTRIAL_ZONE'
-- 	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_COMMERCIAL_HUB'
-- 	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_HOLY_SITE'
-- 	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_CAMPUS'
-- ;

-- update Project_GreatPersonPoints set Points = 5
--  where ProjectType = 'PROJECT_CARNIVAL'
-- 	or ProjectType = 'PROJECT_ENHANCE_DISTRICT_THEATER'
-- 	or ProjectType = 'PROJECT_WATER_CARNIVAL'
-- ;

-- TODO OCCULT project in Secret Societies MODE

-- strategic projects

insert or replace into Types
	(Type,								Kind)
values
	('PROJECT_BREEDING_GOOD_FOALS',		'KIND_PROJECT');

insert or replace into Projects 
	(ProjectType,					Name,										ShortName,											Description,	
	Cost,	CostProgressionModel,	CostProgressionParam1,	PrereqDistrict,			UnlocksFromEffect)
values 
	('PROJECT_BREEDING_GOOD_FOALS',	'LOC_PROJECT_BREEDING_GOOD_FOALS_HD_NAME',	'LOC_PROJECT_BREEDING_GOOD_FOALS_HD_SHORT_NAME',	'LOC_PROJECT_BREEDING_GOOD_FOALS_HD_DESCRIPTION',
	100,	'NO_PROGRESSION_MODEL',	0,						'DISTRICT_ENCAMPMENT',	1);

insert or replace into BuildingModifiers (BuildingType,	ModifierId)
values
	('BUILDING_STABLE',				'STABLE_HORSES_PROJECT');

insert or replace into Modifiers
	(ModifierId,					ModifierType)
values
	('STABLE_HORSES_PROJECT',		'MODIFIER_PLAYER_ALLOW_PROJECT_CATHERINE');

insert or replace into ModifierArguments
	(ModifierId,								Name,				 	Value)
values
	('STABLE_HORSES_PROJECT',     				'ProjectType',			'PROJECT_BREEDING_GOOD_FOALS');