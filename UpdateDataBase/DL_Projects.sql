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

insert or replace into Types	(Type,	Kind)
select 'PROJECT_GRANT_' || ResourceType,	'KIND_PROJECT' from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into Projects 
	(ProjectType,						Name,												ShortName,													
	Description,												Cost,	PrereqDistrict)
select
	'PROJECT_GRANT_' || ResourceType,	'LOC_PROJECT_GRANT_' || ResourceType || '_HD_NAME',	'LOC_PROJECT_GRANT_' || ResourceType || '_HD_SHORT_NAME',	
	'LOC_PROJECT_GRANT_' || ResourceType || '_HD_DESCRIPTION',	100,	'DISTRICT_ENCAMPMENT' from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

update Projects set Cost = 100,	PrereqTech = 'TECH_HORSEBACK_RIDING', RequiredBuilding = 'BUILDING_STABLE' where ProjectType = 'PROJECT_GRANT_RESOURCE_HORSES';
update Projects set Cost = 150,	PrereqTech = 'TECH_IRON_WORKING', RequiredBuilding = 'BUILDING_BARRACKS'  where ProjectType = 'PROJECT_GRANT_RESOURCE_IRON';
update Projects set Cost = 200,	PrereqTech = 'TECH_GUNPOWDER', RequiredBuilding = 'BUILDING_ARMORY'  where ProjectType = 'PROJECT_GRANT_RESOURCE_NITER';
update Projects set Cost = 300,	PrereqTech = 'TECH_REFINING', RequiredBuilding = 'BUILDING_ARMORY'  where ProjectType = 'PROJECT_GRANT_RESOURCE_COAL';
update Projects set Cost = 500,	PrereqTech = 'TECH_PLASTICS', RequiredBuilding = 'BUILDING_MILITARY_ACADEMY'  where ProjectType = 'PROJECT_GRANT_RESOURCE_OIL';
update Projects set Cost = 500,	PrereqTech = 'TECH_ADVANCED_FLIGHT', RequiredBuilding = 'BUILDING_MILITARY_ACADEMY'  where ProjectType = 'PROJECT_GRANT_RESOURCE_ALUMINUM';
update Projects set Cost = 800,	PrereqTech = 'TECH_STEALTH_TECHNOLOGY', RequiredBuilding = 'BUILDING_MILITARY_ACADEMY'  where ProjectType = 'PROJECT_GRANT_RESOURCE_URANIUM';

------------------------------------------------------------------------------------------------------------
-- adjust strategic projects cost
update Projects set Cost = 80 where ProjectType = 'PROJECT_GRANT_RESOURCE_HORSES';
update Projects set Cost = 100 where ProjectType = 'PROJECT_GRANT_RESOURCE_IRON';
update Projects set Cost = 150 where ProjectType = 'PROJECT_GRANT_RESOURCE_NITER';
update Projects set Cost = 200 where ProjectType = 'PROJECT_GRANT_RESOURCE_COAL';
update Projects set Cost = 300 where ProjectType = 'PROJECT_GRANT_RESOURCE_OIL';
update Projects set Cost = 300 where ProjectType = 'PROJECT_GRANT_RESOURCE_ALUMINUM';
update Projects set Cost = 600 where ProjectType = 'PROJECT_GRANT_RESOURCE_URANIUM';

-- 征发民夫 by xhh
insert or replace into Types
	(Type,							Kind)
values
	('PROJECT_RECRUIT_WORKERS_HD',	'KIND_PROJECT');

insert or replace into Projects
	(ProjectType,					Name,									ShortName,										Description,									Cost,		CostProgressionModel,				CostProgressionParam1,		PrereqCivic)
values
	('PROJECT_RECRUIT_WORKERS_HD',	'LOC_PROJECT_RECRUIT_WORKERS_HD_NAME',	'LOC_PROJECT_RECRUIT_WORKERS_HD_SHORT_NAME',	"LOC_PROJECT_RECRUIT_WORKERS_HD_DESCRIPTION",	30,			'COST_PROGRESSION_GAME_PROGRESS',	600,						'CIVIC_DEFENSIVE_TACTICS');

insert or replace into ProjectCompletionModifiers
	(ProjectType,					ModifierId)
values
	('PROJECT_RECRUIT_WORKERS_HD',	'HD_RECRUIT_WORKERS_GRANT_BUILDER_XHH'),
	('PROJECT_RECRUIT_WORKERS_HD',	'HD_RECRUIT_WORKERS_POPU_DECREASE_XHH');

insert or replace into Modifiers
	(ModifierId,										ModifierType,									RunOnce,	Permanent,		SubjectRequirementSetId)
values
	('HD_RECRUIT_WORKERS_GRANT_BUILDER_XHH',			'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY',		1,			1,				'CITY_HAS_2_POPULATION'),
	('HD_RECRUIT_WORKERS_POPU_DECREASE_XHH',			'MODIFIER_PLAYER_CITIES_ADD_POPULATION',		1,			1,				'CITY_HAS_2_POPULATION');

insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
values
	('HD_RECRUIT_WORKERS_GRANT_BUILDER_XHH',			'UnitType',			'UNIT_BUILDER'),
	('HD_RECRUIT_WORKERS_GRANT_BUILDER_XHH',			'Amount',			1),
	('HD_RECRUIT_WORKERS_POPU_DECREASE_XHH',			'Amount',			-1);