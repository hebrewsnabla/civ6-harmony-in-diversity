-----------------------------------------------------------------------------------------
------support some Comunity Wonder and update its effect , unlock civ&tech and cost------
-----------------------------------------------------------------------------------------

-- Abu Simbel
update Buildings set ObsoleteEra = 'ERA_MEDIEVAL', PrereqTech = 'TECH_CALENDAR_HD', PrereqCivic = null where BuildingType = 'BUILDING_ABU_SIMBEL';
delete from BuildingModifiers where BuildingType = 'BUILDING_ABU_SIMBEL' and ModifierId = 'ABU_SIMBEL_LOYALTY';
insert or replace into Modifiers
	(ModifierId,					ModifierType)
values
	('ABU_SIMBEL_GRANARY_FOOD',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');
insert or replace into ModifierArguments
	(ModifierId,					Name,				Value)
values
	('ABU_SIMBEL_GRANARY_FOOD',		'BuildingType',		'BUILDING_GRANARY'),
	('ABU_SIMBEL_GRANARY_FOOD',		'YieldType',		'YIELD_FOOD'),
	('ABU_SIMBEL_GRANARY_FOOD',		'Amount',			1);
insert or replace into BuildingModifiers
	(BuildingType,				ModifierId)
select
	'BUILDING_ABU_SIMBEL',		'ABU_SIMBEL_GRANARY_FOOD'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_ABU_SIMBEL');

----------------------------------------------------------------------------------------------------------------
--BUILDING_LEANING_TOWER----------------------------------------------------------------------------------------
UPDATE Buildings set ObsoleteEra = 'ERA_MODERN', PrereqTech = 'TECH_PHYSICS_HD', PrereqCivic = Null, PrereqDistrict = NULL, AdjacentDistrict = 'DISTRICT_HARBOR'
WHERE BuildingType = 'BUILDING_LEANING_TOWER' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType ='BUILDING_LEANING_TOWER');
delete from Building_YieldChanges where BuildingType = 'BUILDING_LEANING_TOWER';
delete from BuildingModifiers where ModifierId = 'LEANING_TOWER_TRAINED_UNIT_XP_MODIFIER';
delete from BuildingModifiers where ModifierId = 'LEANING_TOWER_ENHANCEDLATETOURISM';
delete from BuildingModifiers where ModifierId = 'LEANING_TOWER_HARBOR_DISTRICT_GOLD';

--grants an engineer
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_LEANING_TOWER', 'LEANING_TOWER_GRANTS_ENGINEER'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_LEANING_TOWER');

insert or replace into Modifiers	(ModifierId,ModifierType,	RunOnce,	Permanent) values
('LEANING_TOWER_GRANTS_ENGINEER',	'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',1,1);

insert or replace into ModifierArguments (ModifierId,	Name,	Value) values
('LEANING_TOWER_GRANTS_ENGINEER',	'Amount',	1),
('LEANING_TOWER_GRANTS_ENGINEER',	'GreatPersonClassType',	'GREAT_PERSON_CLASS_ENGINEER');

--+25%GPP accumulation speed
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select 'BUILDING_LEANING_TOWER', 'MODIFIER_LEANING_TOWER_ADD_' || GreatPersonClassType from GreatPersonClasses
where not (GreatPersonClassType = 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL')
and exists (select BuildingType from Buildings where BuildingType = 'BUILDING_LEANING_TOWER');

insert or replace into Modifiers	(ModifierId,ModifierType)
select  'MODIFIER_LEANING_TOWER_ADD_' || GreatPersonClassType , 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT' from GreatPersonClasses;

insert or replace into ModifierArguments (ModifierId,	Name,	Value)
select  'MODIFIER_LEANING_TOWER_ADD_' || GreatPersonClassType ,	'GreatPersonClassType',  GreatPersonClassType from GreatPersonClasses;
insert or replace into ModifierArguments (ModifierId,	Name,	Value)
select  'MODIFIER_LEANING_TOWER_ADD_' || GreatPersonClassType ,	'Amount', 25 from GreatPersonClasses;
----------------------------------------------------------------------------------------------------------------------
----------------BUILDING_PORCELAIN_TOWER------------------------------------------------------------------------------
UPDATE Buildings SET ObsoleteEra = 'ERA_MODERN', PrereqTech = NULL, PrereqCivic = 'CIVIC_THE_ENLIGHTENMENT'
WHERE BuildingType = 'BUILDING_PORCELAIN_TOWER';

--grants a scientist
insert or ignore into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_PORCELAIN_TOWER', 'PORCELAIN_TOWER_GRANTS_SCIENTIST'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_PORCELAIN_TOWER');

insert or ignore into Modifiers	(ModifierId, ModifierType,	RunOnce,	Permanent) values
('PORCELAIN_TOWER_GRANTS_SCIENTIST',	'MODIFIER_SINGLE_CITY_GRANT_GREAT_PERSON_CLASS_IN_CITY',1,1);

insert or ignore into ModifierArguments (ModifierId,	Name,	Value) values
('PORCELAIN_TOWER_GRANTS_SCIENTIST',	'Amount',	1),
('PORCELAIN_TOWER_GRANTS_SCIENTIST',	'GreatPersonClassType',	'GREAT_PERSON_CLASS_SCIENTIST');
-----------------------------------------------------------------------------------------------------------------------
-------BUILDING_NEUSCHWANSTEIN-----------------------------------------------------------------------------------------
update Buildings set ObsoleteEra = 'ERA_ATOMIC' where BuildingType = 'BUILDING_NEUSCHWANSTEIN'
	AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType ='BUILDING_NEUSCHWANSTEIN');

insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_NEUSCHWANSTEIN', 'CONSERVATION_ANCIENT_WALL_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_NEUSCHWANSTEIN');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_NEUSCHWANSTEIN', 'CONSERVATION_MEDIEVAL_WALL_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_NEUSCHWANSTEIN');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_NEUSCHWANSTEIN', 'CONSERVATION_RENAISSANCE_WALL_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_NEUSCHWANSTEIN');

--SPECIAL ADJUSTMENT FOR TSIKHE(make it yield(5+15)*2=30 tourism)
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_NEUSCHWANSTEIN', 'CONSERVATION_TSIKHE_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_NEUSCHWANSTEIN');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_NEUSCHWANSTEIN', 'CONSERVATION_TSIKHE_TOURISM_GOLDEN_AGE'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_NEUSCHWANSTEIN');

update ModifierArguments set Value = 4 where ModifierId = 'NEUSCHWANSTEIN_WALLS_CULTURE_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 6 where ModifierId = 'NEUSCHWANSTEIN_WALLS_GOLD_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'NEUSCHWANSTEIN_WALLS_AMENITY_MODIFIER' and Name = 'Amount';

update Building_YieldChanges set YieldChange = 4 where BuildingType = 'BUILDING_NEUSCHWANSTEIN' and YieldType = 'YIELD_CULTURE';
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'BUILDING_NEUSCHWANSTEIN' and YieldType = 'YIELD_GOLD';

insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_NEUSCHWANSTEIN', 'NEUSCHWANSTEIN_ADD_HOUSING'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_NEUSCHWANSTEIN');

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) select
	'NEUSCHWANSTEIN_ADD_HOUSING', 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING', 'CITY_HAS_MED_OR_REN_WALLS_REQUIREMENTS'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_NEUSCHWANSTEIN');

insert or replace into ModifierArguments (ModifierId,	Name,	Value) select
	'NEUSCHWANSTEIN_ADD_HOUSING',	'Amount', 1
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_NEUSCHWANSTEIN');

--  neuschwanstein theming bonus from different aurthor
update Building_GreatWorks set 
	ThemingUniquePerson = 1 ,
	ThemingSameObjectType = 0 ,
	ThemingSameEras = 0 ,
	ThemingTourismMultiplier = 100 ,
	ThemingYieldMultiplier = 100
where BuildingType ='BUILDING_NEUSCHWANSTEIN';
--------------------------------------------------------------------------------------------------------------------------------
------- BUILDING_UFFIZI---------------------------------------------------------------------------------------------------------
UPDATE Buildings SET ObsoleteEra = 'ERA_MODERN'
WHERE BuildingType = 'BUILDING_UFFIZI' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType ='BUILDING_UFFIZI');
delete from BuildingModifiers where ModifierId = 'UFFIZI_ART_MUSEUM_CULTURE_MODIFIER';

insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_UFFIZI', 'UFFIZI_CITY_GOLD'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_UFFIZI');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_UFFIZI', 'UFFIZI_CITY_CULTURE'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_UFFIZI');
-- insert or replace into BuildingModifiers (BuildingType, ModifierId)
-- select	'BUILDING_UFFIZI', 'UFFIZI_CITY_WRITING_TOURISM'
-- where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_UFFIZI');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_UFFIZI', 'UFFIZI_CITY_SCULPTURE_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_UFFIZI');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_UFFIZI', 'UFFIZI_CITY_PORTRAIT_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_UFFIZI');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_UFFIZI', 'UFFIZI_CITY_ART_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_UFFIZI');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_UFFIZI', 'UFFIZI_CITY_RELIGIOUS_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_UFFIZI');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_UFFIZI', 'UFFIZI_CITY_LANDSCAPE_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_UFFIZI');
insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_UFFIZI', 'UFFIZI_CITY_MUSIC_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_UFFIZI');

insert or replace into Modifiers
	(ModifierId, 							ModifierType,				 						SubjectRequirementSetId) 
values
	('UFFIZI_CITY_GOLD',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER','CITY_HAS_THEATER_AND_COMMERCIAL_HUB_REQUIRMENTS'),			
	('UFFIZI_CITY_CULTURE',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER','CITY_HAS_THEATER_AND_COMMERCIAL_HUB_REQUIRMENTS'),	
	-- ('UFFIZI_CITY_WRITING_TOURISM',		'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',			'CITY_HAS_THEATER_AND_COMMERCIAL_HUB_REQUIRMENTS'),	
	('UFFIZI_CITY_SCULPTURE_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',			'CITY_HAS_THEATER_AND_COMMERCIAL_HUB_REQUIRMENTS'),	
	('UFFIZI_CITY_PORTRAIT_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',			'CITY_HAS_THEATER_AND_COMMERCIAL_HUB_REQUIRMENTS'),	
	('UFFIZI_CITY_ART_TOURISM',			'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',			'CITY_HAS_THEATER_AND_COMMERCIAL_HUB_REQUIRMENTS'),	
	('UFFIZI_CITY_RELIGIOUS_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',			'CITY_HAS_THEATER_AND_COMMERCIAL_HUB_REQUIRMENTS'),
	('UFFIZI_CITY_MUSIC_TOURISM',		'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',			'CITY_HAS_THEATER_AND_COMMERCIAL_HUB_REQUIRMENTS'),
	('UFFIZI_CITY_LANDSCAPE_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',			'CITY_HAS_THEATER_AND_COMMERCIAL_HUB_REQUIRMENTS');

insert or replace into ModifierArguments 
	(ModifierId,							Name,					Value) 
values 
	('UFFIZI_CITY_GOLD',					'Amount',				10),
	('UFFIZI_CITY_GOLD',					'YieldType',			'YIELD_GOLD'),				
	('UFFIZI_CITY_CULTURE',					'Amount',				10),
	('UFFIZI_CITY_CULTURE',					'YieldType',			'YIELD_CULTURE'),
	-- ('UFFIZI_CITY_WRITING_TOURISM',			'GreatWorkObjectType',	'GREATWORKOBJECT_WRITING'),	
	-- ('UFFIZI_CITY_WRITING_TOURISM',			'ScalingFactor',		150),
	('UFFIZI_CITY_SCULPTURE_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_SCULPTURE'),
	('UFFIZI_CITY_SCULPTURE_TOURISM',		'ScalingFactor',		150),
	('UFFIZI_CITY_PORTRAIT_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_PORTRAIT'),
	('UFFIZI_CITY_PORTRAIT_TOURISM',		'ScalingFactor',		150),
	('UFFIZI_CITY_ART_TOURISM',				'GreatWorkObjectType',	'GREATWORKOBJECT_ARTIFACT'),
	('UFFIZI_CITY_ART_TOURISM',				'ScalingFactor',		150),
	('UFFIZI_CITY_RELIGIOUS_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_RELIGIOUS'),
	('UFFIZI_CITY_RELIGIOUS_TOURISM',		'ScalingFactor',		150),	
	('UFFIZI_CITY_LANDSCAPE_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_LANDSCAPE'),
	('UFFIZI_CITY_LANDSCAPE_TOURISM',		'ScalingFactor',		150),
	('UFFIZI_CITY_MUSIC_TOURISM',			'GreatWorkObjectType',	'GREATWORKOBJECT_MUSIC'),
	('UFFIZI_CITY_MUSIC_TOURISM',			'ScalingFactor',		150);

-- uffizi theming bonus when art are same kinds(i.e. all portrait) 
update Building_GreatWorks set 
	ThemingUniquePerson = 0,
	ThemingSameObjectType = 1,
	ThemingSameEras = 0,
	ThemingTourismMultiplier = 100,
	ThemingYieldMultiplier = 100,
	NonUniquePersonYield = 1,
	NonUniquePersonTourism = 1
where BuildingType = 'BUILDING_UFFIZI';
-- uffizi +3 great artist (need to assigin era)
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_BOTTICELLI_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_BOTTICELLI_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_BOTTICELLI_3';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_RAPHAEL_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_RAPHAEL_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_RAPHAEL_3';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_CARAVAGGIO_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_CARAVAGGIO_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_CARAVAGGIO_3';
------------------------------------------------------------------------------------------------------------
-----BUILDING_NOTRE_DAME------------------------------------------------------------------------------------
update Buildings set Entertainment = 1, RegionalRange = 9 where BuildingType = 'BUILDING_NOTRE_DAME';
---	notre_dame theming bonus from same era
update Building_GreatWorks set 
	ThemingUniquePerson = 0 ,
	ThemingSameObjectType = 0 ,
	ThemingSameEras = 1 ,
	ThemingTourismMultiplier = 100 ,
	ThemingYieldMultiplier = 100
where BuildingType = 'BUILDING_NOTRE_DAME'; 
insert or replace into Building_YieldChanges (BuildingType,	YieldType, YieldChange)
select 'BUILDING_NOTRE_DAME', 'YIELD_CULTURE', 2
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_NOTRE_DAME');
------------------------------------------------------------------------------------------------------------
------BUILDING_GLOBE_THEATRE--------------------------------------------------------------------------------
UPDATE Buildings SET  ObsoleteEra = 'ERA_MODERN', RegionalRange = 6, Entertainment = 0
WHERE BuildingType = 'BUILDING_GLOBE_THEATRE' AND EXISTS (SELECT BuildingType FROM Buildings WHERE BuildingType = 'BUILDING_GLOBE_THEATRE');

update Building_YieldChanges set YieldChange = 8 where BuildingType = 'BUILDING_GLOBE_THEATRE';
insert into Building_ValidTerrains (BuildingType, TerrainType)
select 'BUILDING_GLOBE_THEATRE', 'TERRAIN_DESERT' where exists (SELECT BuildingType FROM Buildings WHERE BuildingType = 'BUILDING_GLOBE_THEATRE');

insert or replace into BuildingModifiers (BuildingType, ModifierId)
select	'BUILDING_GLOBE_THEATRE', 'GLOBE_THEATRE_CITY_WRITING_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_GLOBE_THEATRE');

insert or replace into Modifiers
	(ModifierId, 							ModifierType,				 						SubjectRequirementSetId) 
values
	('GLOBE_THEATRE_CITY_WRITING_TOURISM',	'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',			'HD_OBJECT_WITHIN_6_TILES');

insert or replace into ModifierArguments 
	(ModifierId,							Name,					Value) 
values
	('GLOBE_THEATRE_CITY_WRITING_TOURISM',	'GreatWorkObjectType',	'GREATWORKOBJECT_WRITING'),	
	('GLOBE_THEATRE_CITY_WRITING_TOURISM',	'ScalingFactor',		150);

delete from BuildingModifiers where ModifierId = 'GLOBE_THEATRE_AMPHITHEATER_AMENITY_MODIFIER';
-- globe theter +3 great writer (need to assign era)
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_JOHN_DONNE_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_JOHN_DONNE_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_MOLIERE_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_MOLIERE_2';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_DANTE_1';
update GreatWorks set EraType = 'ERA_RENAISSANCE'	where GreatWorkType = 'GREATWORK_CWON_DANTE_2';
-------------------------------------------------------------------------------------------------------------
-------P0K_BUILDING_TEMPLE_POSEIDON--------------------------------------------------------------------------
update Buildings set ObsoleteEra = 'ERA_MEDIEVAL' where BuildingType = 'P0K_BUILDING_TEMPLE_POSEIDON';
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'P0K_BUILDING_TEMPLE_POSEIDON' and YieldType = 'YIELD_FOOD';
------------------------------------------------------------------------------------------------------------------

--BUILDING_ITSUKUSHIMA
update Buildings set PrereqTech = 'TECH_CELESTIAL_NAVIGATION' where BuildingType = 'BUILDING_ITSUKUSHIMA';
update ModifierArguments set Value = 1 where ModifierId = 'ITSUKUSHIMA_THEATER_COAST_CULTURE' and Name = 'TilesRequired';
update ModifierArguments set Value = 1 where ModifierId = 'ITSUKUSHIMA_HOLY_SITE_COAST_FAITH' and Name = 'Amount';
delete from BuildingModifiers where BuildingType = 'BUILDING_ITSUKUSHIMA' and ModifierId = 'ITSUKUSHIMA_GRANT_MONUMENT';

--BUILDING_TOWER_BRIDGE
delete from BuildingModifiers where BuildingType = 'BUILDING_TOWER_BRIDGE'
	and (ModifierId = 'TOWER_BRIDGE_GRANT_COAL_PER_TURN' or ModifierId = 'TOWER_BRIDGE_CITIES_PRODUCTION' or ModifierId = 'TOWER_BRIDGE_CITIES_GOLD');

CREATE TEMPORARY TABLE 'TOWER_BRIDGE_DistrictBonus'(
    'DistrictType' TEXT NOT NULL,
    'YieldType' TEXT NOT NULL
);

insert or replace into TOWER_BRIDGE_DistrictBonus
	(DistrictType,					YieldType)
values
	('DISTRICT_HOLY_SITE',			'YIELD_FAITH'),
	('DISTRICT_CAMPUS',				'YIELD_SCIENCE'),
	('DISTRICT_HARBOR',				'YIELD_FOOD'),
	('DISTRICT_ENCAMPMENT',			'YIELD_PRODUCTION'),
	('DISTRICT_COMMERCIAL_HUB',		'YIELD_GOLD'),
	('DISTRICT_THEATER',			'YIELD_CULTURE'),
	('DISTRICT_INDUSTRIAL_ZONE',	'YIELD_PRODUCTION'),
	('DISTRICT_AQUEDUCT',			'YIELD_FOOD');

insert or replace into BuildingModifiers
	(BuildingType,						ModifierId)
select
	'BUILDING_TOWER_BRIDGE',			'TOWER_BRIDGE_' || DistrictType || '_DISTRICT_ATTACH1'
from TOWER_BRIDGE_DistrictBonus where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_TOWER_BRIDGE');

insert or replace into Modifiers
	(ModifierId,											ModifierType,										SubjectRequirementSetId)
select
	'TOWER_BRIDGE_' || DistrictType || '_DISTRICT_ATTACH1', 'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',		'DISTRICT_IS_' || substr(DistrictType, 10)
from TOWER_BRIDGE_DistrictBonus;

insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'TOWER_BRIDGE_' || DistrictType || '_DISTRICT_ATTACH1', 'ModifierId',		'TOWER_BRIDGE_' || DistrictType || '_DISTRICT_YIELD1'
from TOWER_BRIDGE_DistrictBonus;

insert or replace into Modifiers
	(ModifierId,											ModifierType,												OwnerRequirementSetId)
select
	'TOWER_BRIDGE_' || DistrictType || '_DISTRICT_YIELD1', 	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',			'TOWER_BRIDGE_REQUIREMENTS'
from TOWER_BRIDGE_DistrictBonus;

insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'TOWER_BRIDGE_' || DistrictType || '_DISTRICT_YIELD1', 	'YieldType',		YieldType
from TOWER_BRIDGE_DistrictBonus;

insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'TOWER_BRIDGE_' || DistrictType || '_DISTRICT_YIELD1', 	'Amount',			4
from TOWER_BRIDGE_DistrictBonus;


--BUILDING_BRANDENBURG_GATE
insert or replace into Building_YieldChanges (BuildingType, YieldType, YieldChange)
select 'BUILDING_BRANDENBURG_GATE', 'YIELD_SCIENCE', 2 from Buildings where BuildingType = 'BUILDING_BRANDENBURG_GATE';
insert or replace into Building_YieldChanges (BuildingType, YieldType, YieldChange)
select 'BUILDING_BRANDENBURG_GATE', 'YIELD_PRODUCTION', 2 from Buildings where BuildingType = 'BUILDING_BRANDENBURG_GATE';
delete from BuildingModifiers where BuildingType = 'BUILDING_BRANDENBURG_GATE' and ModifierId = 'BRANDENBURG_GATE_TRAINED_UNIT_XP_MODIFIER';
delete from BuildingModifiers where BuildingType = 'BUILDING_BRANDENBURG_GATE' and ModifierId = 'BRANDENBURG_GRANT_GENERAL';
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_BRANDENBURG_GATE',	'BRANDENBURG_GATE_PRODUCTION_AT_PEACE_BONUS'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BRANDENBURG_GATE');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_BRANDENBURG_GATE',	'BRANDENBURG_GATE_SCIENCE_AT_WAR_BONUS'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BRANDENBURG_GATE');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_BRANDENBURG_GATE',	'BRANDENBURG_GARRISON_LOYALTY'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BRANDENBURG_GATE');

insert or replace into Modifiers 
	(ModifierId,									ModifierType,											SubjectRequirementSetId) 
values
	('BRANDENBURG_GATE_PRODUCTION_AT_PEACE_BONUS',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS'),
	('BRANDENBURG_GATE_SCIENCE_AT_WAR_BONUS',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'PLAYER_IS_AT_WAR_WITH_ANY_MAJOR'),
	('BRANDENBURG_GARRISON_LOYALTY',				'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',		'CITY_HAS_GARRISON_UNIT_REQUIERMENT');

insert or replace into ModifierArguments 
	(ModifierId,								Name,			Value) 
values
	('BRANDENBURG_GATE_PRODUCTION_AT_PEACE_BONUS', 	'YieldType',	'YIELD_PRODUCTION'),
	('BRANDENBURG_GATE_PRODUCTION_AT_PEACE_BONUS',	'Amount',		8),
	('BRANDENBURG_GATE_SCIENCE_AT_WAR_BONUS', 		'YieldType',	'YIELD_SCIENCE'),
	('BRANDENBURG_GATE_SCIENCE_AT_WAR_BONUS',		'Amount',		8),
	('BRANDENBURG_GARRISON_LOYALTY',				'Amount',		3);

--BUILDING_BOROBUDUR
delete from BuildingModifiers where BuildingType = 'BUILDING_BOROBUDUR' and ModifierId = 'BOROBUDUR_GRANT_GURU';
delete from BuildingModifiers where BuildingType = 'BUILDING_BOROBUDUR' and ModifierId = 'BOROBUDUR_TRADE_ROUTE_YIELD_PER_DEST_LUXURY';
delete from BuildingModifiers where BuildingType = 'BUILDING_BOROBUDUR' and ModifierId = 'BOROBUDUR_INCREASED_PLANTATION_FAITH';
delete from BuildingPrereqs where Building = 'BUILDING_BOROBUDUR';-- and PrereqBuilding = 'BUILDING_TEMPLE';
update Buildings set PrereqCivic = 'CIVIC_THEOLOGY' where BuildingType = 'BUILDING_BOROBUDUR';
insert or replace into Unit_BuildingPrereqs (Unit,	PrereqBuilding) select
	'UNIT_MISSIONARY',	'BUILDING_BOROBUDUR'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BOROBUDUR');
insert or replace into Unit_BuildingPrereqs (Unit,	PrereqBuilding) select
	'UNIT_APOSTLE',	'BUILDING_BOROBUDUR'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BOROBUDUR');
	
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_BOROBUDUR',	'BOROBUDUR_PLOT_ADJACENT_TO_VOLCANO_YIELD_FAITH'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BOROBUDUR');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_BOROBUDUR',	'BOROBUDUR_PLOT_ADJACENT_TO_VOLCANO_YIELD_CULTURE'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BOROBUDUR');

insert or replace into Modifiers 
	(ModifierId,											ModifierType,								SubjectRequirementSetId) 
values
	('BOROBUDUR_PLOT_ADJACENT_TO_VOLCANO_YIELD_FAITH',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		'PLOT_ADJACENT_TO_VOLCANO_REQUIREMENTS'),
	('BOROBUDUR_PLOT_ADJACENT_TO_VOLCANO_YIELD_CULTURE',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',		'PLOT_ADJACENT_TO_VOLCANO_REQUIREMENTS');

insert or replace into ModifierArguments 
	(ModifierId,											Name,			Value) 
values
	('BOROBUDUR_PLOT_ADJACENT_TO_VOLCANO_YIELD_FAITH',		'YieldType',	'YIELD_FAITH'),
	('BOROBUDUR_PLOT_ADJACENT_TO_VOLCANO_YIELD_FAITH',		'Amount',		2),
	('BOROBUDUR_PLOT_ADJACENT_TO_VOLCANO_YIELD_CULTURE', 	'YieldType',	'YIELD_CULTURE'),
	('BOROBUDUR_PLOT_ADJACENT_TO_VOLCANO_YIELD_CULTURE',	'Amount',		2);

-- BUILDING_MOTHERLAND_CALLS
update Modifiers set SubjectRequirementSetId = 'JANISSARY_CITY_FOUNDED' where ModifierId = 'MOTHERLANDCALLS_IDENTITY';
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_MOTHERLAND_CALLS',	'MOTHERLAND_CALLS_OWNER_TERRITORY_COMBAT_STRENGTH'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_MOTHERLAND_CALLS');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_MOTHERLAND_CALLS',	'MOTHERLAND_CALLS_GOLDEN_SCIENCE'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_MOTHERLAND_CALLS');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_MOTHERLAND_CALLS',	'MOTHERLAND_CALLS_GOLDEN_CULTURE'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_MOTHERLAND_CALLS');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_MOTHERLAND_CALLS',	'MOTHERLAND_CALLS_NORMAL_FOOD'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_MOTHERLAND_CALLS');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_MOTHERLAND_CALLS',	'MOTHERLAND_CALLS_NORMAL_PRODUCTION'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_MOTHERLAND_CALLS');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_MOTHERLAND_CALLS',	'MOTHERLAND_CALLS_DARK_FOOD'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_MOTHERLAND_CALLS');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'BUILDING_MOTHERLAND_CALLS',	'MOTHERLAND_CALLS_DARK_PRODUCTION'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_MOTHERLAND_CALLS');

insert or replace into Modifiers
	(ModifierId,											ModifierType,												SubjectRequirementSetId,					OwnerRequirementSetId) 
values
	('MOTHERLAND_CALLS_OWNER_TERRITORY_COMBAT_STRENGTH',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',						NULL,										Null),
	('OWN_TERRITORY_COMBAT_STRENGTH_BUFF',					'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',						'HD_UNIT_IN_OWNER_TERRITORY_REQUIREMENTS',	Null),
	('MOTHERLAND_CALLS_GOLDEN_SCIENCE',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'HD_OBJECT_WITHIN_9_TILES',					'PLAYER_HAS_GOLDEN_AGE'),
	('MOTHERLAND_CALLS_GOLDEN_CULTURE',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'HD_OBJECT_WITHIN_9_TILES',					'PLAYER_HAS_GOLDEN_AGE'),
	('MOTHERLAND_CALLS_NORMAL_FOOD',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'HD_OBJECT_WITHIN_9_TILES',					'PLAYER_NOT_HAS_GOLDEN_AGE'),
	('MOTHERLAND_CALLS_NORMAL_PRODUCTION',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'HD_OBJECT_WITHIN_9_TILES',					'PLAYER_NOT_HAS_GOLDEN_AGE'),
	('MOTHERLAND_CALLS_DARK_FOOD',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'HD_OBJECT_WITHIN_9_TILES',					'PLAYER_HAS_DARK_AGE'),
	('MOTHERLAND_CALLS_DARK_PRODUCTION',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'HD_OBJECT_WITHIN_9_TILES',					'PLAYER_HAS_DARK_AGE');

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value) 
values
	('MOTHERLAND_CALLS_OWNER_TERRITORY_COMBAT_STRENGTH',	'AbilityType',			'ABILITY_MOTHERLAND_CALLS_OWN_TERRITORY'),
	('OWN_TERRITORY_COMBAT_STRENGTH_BUFF',					'Amount',				10),
	('MOTHERLAND_CALLS_GOLDEN_SCIENCE',						'YieldType',			'YIELD_SCIENCE'),
	('MOTHERLAND_CALLS_GOLDEN_SCIENCE',						'Amount',				7),
	('MOTHERLAND_CALLS_GOLDEN_CULTURE',						'YieldType',			'YIELD_CULTURE'),
	('MOTHERLAND_CALLS_GOLDEN_CULTURE',						'Amount',				7),
	('MOTHERLAND_CALLS_NORMAL_FOOD',						'YieldType',			'YIELD_FOOD'),
	('MOTHERLAND_CALLS_NORMAL_FOOD',						'Amount',				7),
	('MOTHERLAND_CALLS_NORMAL_PRODUCTION',					'YieldType',			'YIELD_PRODUCTION'),
	('MOTHERLAND_CALLS_NORMAL_PRODUCTION',					'Amount',				7),
	('MOTHERLAND_CALLS_DARK_FOOD',							'YieldType',			'YIELD_FOOD'),
	('MOTHERLAND_CALLS_DARK_FOOD',							'Amount',				7),
	('MOTHERLAND_CALLS_DARK_PRODUCTION',					'YieldType',			'YIELD_PRODUCTION'),
	('MOTHERLAND_CALLS_DARK_PRODUCTION',					'Amount',				7);

insert or replace into ModifierStrings
	(ModifierId,											Context,		Text) 
values
	('OWN_TERRITORY_COMBAT_STRENGTH_BUFF',					'Preview',		'LOC_OWN_TERRITORY_COMBAT_STRENGTH_BUFF_PREVIEW_TEXT');

-- Ability
insert or replace into Types
	(Type,													Kind)
values
	('ABILITY_MOTHERLAND_CALLS_OWN_TERRITORY',				'KIND_ABILITY');

insert or replace into TypeTags	
	(Type,													Tag)
values
 	('ABILITY_MOTHERLAND_CALLS_OWN_TERRITORY',				'CLASS_MILITARY');

insert or replace into UnitAbilities (UnitAbilityType, Name, Description, Inactive) values
	('ABILITY_MOTHERLAND_CALLS_OWN_TERRITORY',
	'LOC_ABILITY_MOTHERLAND_CALLS_OWN_TERRITORY_NAME',
 	'LOC_ABILITY_MOTHERLAND_CALLS_OWN_TERRITORY_DESCRIPTION',
 	1);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,									ModifierId)
values
	('ABILITY_MOTHERLAND_CALLS_OWN_TERRITORY',			'OWN_TERRITORY_COMBAT_STRENGTH_BUFF');

-- WON_CL_KINKAKU
insert or replace into Building_YieldChanges (BuildingType, YieldType, YieldChange)
select 'WON_CL_KINKAKU', 'YIELD_FAITH', 2 from Buildings where BuildingType = 'WON_CL_KINKAKU';
insert or replace into Building_YieldChanges (BuildingType, YieldType, YieldChange)
select 'WON_CL_KINKAKU', 'YIELD_PRODUCTION', 2 from Buildings where BuildingType = 'WON_CL_KINKAKU';
update Buildings set PrereqCivic = 'CIVIC_DIVINE_RIGHT', PrereqTech = NULL where BuildingType = 'WON_CL_KINKAKU';
delete from BuildingModifiers where BuildingType = 'WON_CL_KINKAKU';
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'WON_CL_KINKAKU',	'KINKAKU_RANGE_ENCAMPMENT_FAITH'
where exists (select BuildingType from Buildings where BuildingType = 'WON_CL_KINKAKU');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'WON_CL_KINKAKU',	'KINKAKU_RANGE_HOLYSITE_PRODUCTION'
where exists (select BuildingType from Buildings where BuildingType = 'WON_CL_KINKAKU');

insert or replace into Modifiers 
	(ModifierId,										ModifierType,														SubjectRequirementSetId) 
values
	('KINKAKU_RANGE_ENCAMPMENT_FAITH',					'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',						'HD_CITY_HAS_RELIGIOUS_TIER_2_BUILDING_REQUIREMENTS'),
	('KINKAKU_RANGE_HOLYSITE_PRODUCTION',				'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',						'HD_CITY_HAS_RELIGIOUS_TIER_2_BUILDING_REQUIREMENTS'),
	('KINKAKU_RANGE_ENCAMPMENT_FAITH_MODIFIER',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	'DISTRICT_IS_ENCAMPMENT'),
	('KINKAKU_RANGE_HOLYSITE_PRODUCTION_MODIFIER',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	'DISTRICT_IS_HOLY_SITE');

insert or replace into ModifierArguments 
	(ModifierId,									Name,					Value) 
values
	('KINKAKU_RANGE_ENCAMPMENT_FAITH',				'ModifierId',			'KINKAKU_RANGE_ENCAMPMENT_FAITH_MODIFIER'),
	('KINKAKU_RANGE_HOLYSITE_PRODUCTION',			'ModifierId',			'KINKAKU_RANGE_HOLYSITE_PRODUCTION_MODIFIER'),
	('KINKAKU_RANGE_ENCAMPMENT_FAITH_MODIFIER',		'YieldTypeToMirror',	'YIELD_PRODUCTION'),
	('KINKAKU_RANGE_ENCAMPMENT_FAITH_MODIFIER',		'YieldTypeToGrant',		'YIELD_FAITH'),
	('KINKAKU_RANGE_HOLYSITE_PRODUCTION_MODIFIER', 	'YieldTypeToMirror',	'YIELD_FAITH'),
	('KINKAKU_RANGE_HOLYSITE_PRODUCTION_MODIFIER',	'YieldTypeToGrant',		'YIELD_PRODUCTION');

-- CL_BUILDING_CN_TOWER
delete from BuildingModifiers where BuildingType = 'CL_BUILDING_CN_TOWER' and ModifierId != 'CL_GRANT_BROADCAST';
-- update Buildings set AdjacentDistrict = NULL where BuildingType = 'CL_BUILDING_CN_TOWER';

insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'CL_BUILDING_CN_TOWER',	'CN_TOWER_ALL_CITY_POP'
where exists (select BuildingType from Buildings where BuildingType = 'CL_BUILDING_CN_TOWER');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'CL_BUILDING_CN_TOWER',	'CN_TOWER_ALL_CITY_HOUSING'
where exists (select BuildingType from Buildings where BuildingType = 'CL_BUILDING_CN_TOWER');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'CL_BUILDING_CN_TOWER',	'CN_TOWER_ALL_CITY_AMENITY'
where exists (select BuildingType from Buildings where BuildingType = 'CL_BUILDING_CN_TOWER');
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'CL_BUILDING_CN_TOWER',	'CN_TOWER_MUSIC_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'CL_BUILDING_CN_TOWER');

	-- Product
insert or replace into BuildingModifiers (BuildingType,	ModifierId) select
	'CL_BUILDING_CN_TOWER',	'CN_TOWER_PRODUCT_TOURISM'
where exists (select BuildingType from Buildings where BuildingType = 'CL_BUILDING_CN_TOWER')
  and exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');
update Buildings set Description = 'LOC_CL_BUILDING_CN_TOWER_DESCRIPTION_CORP' where BuildingType = 'CL_BUILDING_CN_TOWER'
	and exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');
insert or replace into Modifiers 
	(ModifierId,					ModifierType,								SubjectRequirementSetId) 
select
	'CN_TOWER_PRODUCT_TOURISM',		'MODIFIER_PLAYER_CITIES_ADD_POPULATION',	'HD_CITY_HAS_BROADCAST_AND_POWERED'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');
insert or replace into ModifierArguments 
	(ModifierId,					Name,		Value) 
select
	'CN_TOWER_PRODUCT_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_PRODUCT'
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');
insert or replace into ModifierArguments 
	(ModifierId,					Name,		Value) 
select
	'CN_TOWER_PRODUCT_TOURISM',		'ScalingFactor',	250
where exists (select GreatWorkSlotType from GreatWorkSlotTypes where GreatWorkSlotType = 'GREATWORKSLOT_PRODUCT');

insert or replace into Building_GreatWorks
	(BuildingType,			GreatWorkSlotType,		NumSlots,ThemingUniquePerson,ThemingYieldMultiplier,ThemingTourismMultiplier,ThemingBonusDescription)
select
	'CL_BUILDING_CN_TOWER',	'GREATWORKSLOT_MUSIC',	3,		 1,					 200,					200,					 'LOC_BUILDING_THEMINGBONUS_CN_TOWER'
where exists (select BuildingType from Buildings where BuildingType = 'CL_BUILDING_CN_TOWER');

insert or replace into Modifiers 
	(ModifierId,					ModifierType,							RunOnce,	Permanent,	SubjectRequirementSetId) 
values
	('CN_TOWER_ALL_CITY_POP',		'MODIFIER_PLAYER_CITIES_ADD_POPULATION',	1,		1,			Null),
	('CN_TOWER_MUSIC_TOURISM',		'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',	0,		0,			'HD_CITY_HAS_BROADCAST_AND_POWERED');

insert or replace into Modifiers 
	(ModifierId,					ModifierType) 
values
	('CN_TOWER_ALL_CITY_HOUSING',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_HOUSING'),
	('CN_TOWER_ALL_CITY_AMENITY',	'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY');

insert or replace into ModifierArguments 
	(ModifierId,					Name,		Value) 
values
	('CN_TOWER_ALL_CITY_POP',		'Amount',	2),
	('CN_TOWER_ALL_CITY_HOUSING',	'Amount',	2),
	('CN_TOWER_ALL_CITY_AMENITY', 	'Amount',	1),
	('CN_TOWER_MUSIC_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_MUSIC'),
	('CN_TOWER_MUSIC_TOURISM',	 	'ScalingFactor',		250);

-- Yellow Crane Tower
insert or replace into Types
	(Type, 			Kind)
select
	Type || '_HD', 	Kind
from Types where Type = 'BUILDING_YELLOW_CRANE';
insert or replace into Buildings
	(BuildingType, 			Name, Description, Cost,	AdvisorType, MaxWorldInstances, IsWonder, RequiresPlacement, RequiresRiver, Quote, PrereqCivic)
select
	BuildingType || '_HD',	Name, Description, 420,		AdvisorType, MaxWorldInstances, IsWonder, RequiresPlacement, RequiresRiver, Quote, 'CIVIC_LITERARY_TRADITION_HD'
from Buildings where BuildingType = 'BUILDING_YELLOW_CRANE';
insert or replace into Building_ValidTerrains
	(BuildingType, 			TerrainType)
select
	BuildingType || '_HD', 	TerrainType
from Building_ValidTerrains where BuildingType = 'BUILDING_YELLOW_CRANE';
insert or replace into Building_GreatPersonPoints
	(BuildingType, 			GreatPersonClassType, PointsPerTurn)
select
	BuildingType || '_HD',	GreatPersonClassType, PointsPerTurn
from Building_GreatPersonPoints where BuildingType = 'BUILDING_YELLOW_CRANE';
insert or replace into Building_GreatWorks
	(BuildingType,			GreatWorkSlotType,	NumSlots,	ThemingUniquePerson,	ThemingYieldMultiplier,	ThemingTourismMultiplier,	ThemingBonusDescription)
select
	BuildingType || '_HD', 	GreatWorkSlotType,	2,			1,						100,					100,						'LOC_BUILDING_THEMINGBONUS_YELLOW_CRANE_HD'
from Building_GreatWorks where BuildingType = 'BUILDING_YELLOW_CRANE';
insert or replace into Building_YieldChanges
	(BuildingType,					YieldType,			YieldChange)
select
	BuildingType || '_HD',			'YIELD_CULTURE',	2
from Buildings where BuildingType = 'BUILDING_YELLOW_CRANE';
delete from Types where Type = 'BUILDING_YELLOW_CRANE';
insert or replace into GlobalParameters (Name, Value) values ('YELLOW_CRANE_TOWER_POINT_PERCENTAGE', 15);
insert or replace into Modifiers
	(ModifierId,										ModifierType)
select
	'YELLOW_CRANE_WRITER_' || EraType || '_BOOST',		'MODIFIER_PLAYER_GRANT_RANDOM_CIVIC_BOOST_BY_ERA'
from Eras;
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'YELLOW_CRANE_WRITER_' || EraType || '_BOOST',		'StartEraType',		EraType
from Eras;
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'YELLOW_CRANE_WRITER_' || EraType || '_BOOST',		'EndEraType',		EraType
from Eras;
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'YELLOW_CRANE_WRITER_' || EraType || '_BOOST',		'Amount',			1
from Eras;

-- STPETERSBASILICA
insert or replace into Building_YieldChanges (BuildingType, YieldType, YieldChange)
select 'BUILDING_AL_STPETERSBASILICA', 'YIELD_CULTURE', 2 from Buildings where BuildingType = 'BUILDING_AL_STPETERSBASILICA';
insert or replace into Building_YieldChanges (BuildingType, YieldType, YieldChange)
select 'BUILDING_AL_STPETERSBASILICA', 'YIELD_FAITH', 2 from Buildings where BuildingType = 'BUILDING_AL_STPETERSBASILICA';
delete from Building_GreatWorks where BuildingType = 'BUILDING_AL_STPETERSBASILICA' and GreatWorkSlotType = 'GREATWORKSLOT_RELIC';
update Building_GreatWorks set 
	NumSlots = 3,
	ThemingUniquePerson = 0,
	ThemingSameObjectType = 1,
	ThemingSameEras = 0,
	ThemingTourismMultiplier = 100,
	ThemingYieldMultiplier = 100,
	NonUniquePersonYield = 1,
	NonUniquePersonTourism = 1
where BuildingType ='BUILDING_AL_STPETERSBASILICA' and GreatWorkSlotType = 'GREATWORKSLOT_CATHEDRAL';

-- WON_CL_EMPIRE_STATES
update Buildings set PrereqCivic = 'CIVIC_SUFFRAGE' where BuildingType = 'WON_CL_EMPIRE_STATES';
update ModifierArguments set Value = 300 where ModifierId = 'EMPIRE_CITY_WONDER_TOURISM' and Name = 'ScalingFactor';

-- ????????????
insert or replace into BuildingModifiers (BuildingType, ModifierId) select
	'BUILDING_THREE_GORDES_DAM', 'THREE_GORDES_DAM_RIVER_IMPROVEMENT_FOOD'
from Buildings where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_THREE_GORDES_DAM');
insert or replace into BuildingModifiers (BuildingType, ModifierId)	select
	'BUILDING_THREE_GORDES_DAM', 'THREE_GORDES_DAM_RIVER_IMPROVEMENT_PRODUCTION'
from Buildings where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_THREE_GORDES_DAM');
insert or replace into Modifiers
	(ModifierId,										ModifierType,							SubjectRequirementSetId)
values
	('THREE_GORDES_DAM_RIVER_IMPROVEMENT_FOOD',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_IMPROVEMENT_ADJACENT_TO_RIVER'),
	('THREE_GORDES_DAM_RIVER_IMPROVEMENT_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'PLOT_HAS_IMPROVEMENT_ADJACENT_TO_RIVER');
insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
values
	('THREE_GORDES_DAM_RIVER_IMPROVEMENT_FOOD',			'YieldType',	'YIELD_FOOD'),
	('THREE_GORDES_DAM_RIVER_IMPROVEMENT_FOOD',			'Amount',		1),
	('THREE_GORDES_DAM_RIVER_IMPROVEMENT_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('THREE_GORDES_DAM_RIVER_IMPROVEMENT_PRODUCTION',	'Amount',		1);


-- Buddhas of Bamyan
delete from Building_YieldChanges where BuildingType = 'BUILDING_BAMYAN' and YieldType = 'YIELD_CULTURE';

-- Cost adjust
update Buildings set Cost = 180 where BuildingType = 'P0K_BUILDING_TEMPLE_POSEIDON';
update Buildings set Cost = 260 where BuildingType = 'BUILDING_ABU_SIMBEL';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_BOROBUDUR';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_YELLOW_CRANE';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_BAMYAN';
update Buildings set Cost = 420 where BuildingType = 'BUILDING_ITSUKUSHIMA';
update Buildings set Cost = 750 where BuildingType = 'BUILDING_NOTRE_DAME';
update Buildings set Cost = 750 where BuildingType = 'WON_CL_KINKAKU';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_AL_STPETERSBASILICA';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_UFFIZI';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_GLOBE_THEATRE';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_PORCELAIN_TOWER';
update Buildings set Cost = 1000 where BuildingType = 'BUILDING_LEANING_TOWER';
update Buildings set Cost = 1360 where BuildingType = 'BUILDING_NEUSCHWANSTEIN';
update Buildings set Cost = 1360 where BuildingType = 'BUILDING_BRANDENBURG_GATE';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_THREE_GORDES_DAM';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_TOWER_BRIDGE';
update Buildings set Cost = 2000 where BuildingType = 'BUILDING_BURJ_KHALIFA';
update Buildings set Cost = 1800 where BuildingType = 'WON_CL_EMPIRE_STATES';
update Buildings set Cost = 1800 where BuildingType = 'BUILDING_MOTHERLAND_CALLS';
update Buildings set Cost = 2000 where BuildingType = 'WON_CL_BUILDING_ARECIBO';
update Buildings set Cost = 2000 where BuildingType = 'CL_BUILDING_CN_TOWER';
