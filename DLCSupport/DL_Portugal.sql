-------------------------------------
--            Portugal DLC         --
-------------------------------------

insert or replace into Building_CitizenYieldChanges
	(BuildingType,							YieldType,			YieldChange)
values
	('BUILDING_NAVIGATION_SCHOOL',			'YIELD_SCIENCE',	1), -- ub
	('BUILDING_NAVIGATION_SCHOOL',			'YIELD_GOLD',		-1);

update Buildings set RegionalRange = 6 where BuildingType = 'BUILDING_NAVIGATION_SCHOOL';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_NAVIGATION_SCHOOL',	'UNIVERSITY_SCIENCE_PERCENTAGE_BOOST'),
	('BUILDING_NAVIGATION_SCHOOL',	'UNIVERSITY_ADD_RAINFOREST_ADJACENCY'),
	('BUILDING_NAVIGATION_SCHOOL',	'UNIVERSITY_ADD_ADJACENT_RAINFOREST_SCIENCE');

update Buildings set Maintenance = 4,	Cost = 275	where BuildingType = 'BUILDING_NAVIGATION_SCHOOL';
