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