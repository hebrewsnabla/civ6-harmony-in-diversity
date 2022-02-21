-------------------------------------
--  Temporary update database sql  --
-------------------------------------

--building theming bonus adjustment
--考古=同时代，不同国家
--艺术=同类型，不同作者

--GREAT LIBRARY
--不同作者
-- update Building_GreatWorks set 
-- 	ThemingUniquePerson = 1 ,
-- 	ThemingSameObjectType = 1 ,
-- 	ThemingSameEras = 0 ,
-- 	ThemingTourismMultiplier = 100 ,
-- 	ThemingYieldMultiplier = 100
-- where BuildingType = 'BUILDING_GREAT_LIBRARY';

--OXFORD_UNIVERSITY
--不同作者
update Building_GreatWorks set 
	ThemingUniquePerson = 1 ,
	ThemingSameObjectType = 1 ,
	ThemingSameEras = 0 ,
	ThemingTourismMultiplier = 100 ,
	ThemingYieldMultiplier = 100
where BuildingType = 'BUILDING_OXFORD_UNIVERSITY';

--APADANA
--同类型
-- update Building_GreatWorks set 
-- 	ThemingUniquePerson = 0 ,
-- 	ThemingSameObjectType = 1 ,
-- 	ThemingSameEras = 0 ,
-- 	ThemingTourismMultiplier = 100 ,
-- 	ThemingYieldMultiplier = 100
-- where BuildingType = 'BUILDING_APADANA';

--GOV_CULTURE
--同时代
update Building_GreatWorks set 
	ThemingUniquePerson = 0 ,
	ThemingSameObjectType = 0 ,
	ThemingSameEras = 1 ,
	ThemingTourismMultiplier = 100 ,
	ThemingYieldMultiplier = 100
where BuildingType = 'BUILDING_GOV_CULTURE';

--HERMITAGE
delete from Building_GreatWorks where BuildingType = 'BUILDING_HERMITAGE';
insert or replace into Building_GreatWorks
	(BuildingType, 			GreatWorkSlotType, 			NumSlots,	ThemingSameEras,	ThemingYieldMultiplier,	ThemingTourismMultiplier,	NonUniquePersonYield,	NonUniquePersonTourism)
values
	('BUILDING_HERMITAGE',	'GREATWORKSLOT_ART',		3,			1,					200,					200,						1,						1),
	('BUILDING_HERMITAGE',	'GREATWORKSLOT_ARTIFACT',	3,			1,					200,					200,						1,						1);

--SYDNEY_OPERA_HOUSE
--同时代
update Building_GreatWorks set 
	ThemingUniquePerson = 0 ,
	ThemingSameObjectType = 1 ,
	ThemingSameEras = 1 ,
	ThemingTourismMultiplier = 100 ,
	ThemingYieldMultiplier = 100
where BuildingType = 'BUILDING_SYDNEY_OPERA_HOUSE';