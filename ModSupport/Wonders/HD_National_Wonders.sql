-- National_Wonders

-- 国立大学 ----------------------------------------------------------------------------------------------------------------------------------------------------
	-- 修改解锁条件和造价
update Buildings set PrereqTech = Null, PrereqCivic = 'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD', cost = 500 where BuildingType = 'NAT_WONDER_CL_COLLEGE';
update Buildings set PrereqTech = Null, PrereqCivic = 'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD', cost = 500 where BuildingType = 'NAT_WONDER_CL_COLLEGE_INTERNAL';
	-- 修改建造条件
update Modifiers set OwnerRequirementSetId = Null where ModifierId = 'CL_NAT_WONDER_ALLOW_BUILDING_COLLEGE';
insert or replace into BuildingPrereqs
	(Building,								PrereqBuilding)
values
	('NAT_WONDER_CL_COLLEGE',				'BUILDING_LIBRARY'),
	('NAT_WONDER_CL_COLLEGE_INTERNAL',		'BUILDING_LIBRARY');
	-- 修改本体产出
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'NAT_WONDER_CL_COLLEGE';
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'NAT_WONDER_CL_COLLEGE_INTERNAL';
update Building_GreatPersonPoints set PointsPerTurn = 6 where BuildingType = 'NAT_WONDER_CL_COLLEGE';
update Building_GreatPersonPoints set PointsPerTurn = 6 where BuildingType = 'NAT_WONDER_CL_COLLEGE_INTERNAL';
	-- 修改特效
delete from BuildingModifiers where BuildingType = 'NAT_WONDER_CL_COLLEGE' and ModifierId = 'CL_NAT_WONDER_ATTACH_SCIENCE_YIELD_MODIFIER';
delete from BuildingModifiers where BuildingType = 'NAT_WONDER_CL_COLLEGE' and ModifierId = 'CL_NAT_WONDER_ADJUST_CITY_SCIENCE_YIELD';

insert or replace into Modifiers
	(ModifierId,							ModifierType,																SubjectRequirementSetId)
values
	('HD_NAT_COLLEGE_CAMPUS_DOUBLE',		'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',							'DISTRICT_IS_CAMPUS'),
	('HD_NAT_COLLEGE_GOVERN_SCIENCE',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_PER_GOVERNOR_TITLE',		'CITY_HAS_NAT_COLLEGE');

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('NAT_WONDER_CL_COLLEGE',				'HD_NAT_COLLEGE_CAMPUS_DOUBLE'),
	('NAT_WONDER_CL_COLLEGE',				'HD_NAT_COLLEGE_GOVERN_SCIENCE');

insert or replace into ModifierArguments
	(ModifierId,							Name,				Value)
values
	('HD_NAT_COLLEGE_CAMPUS_DOUBLE',		'YieldType',		'YIELD_SCIENCE'),
	('HD_NAT_COLLEGE_CAMPUS_DOUBLE',		'Amount',			100),
	('HD_NAT_COLLEGE_GOVERN_SCIENCE',		'YieldType',		'YIELD_SCIENCE'),
	('HD_NAT_COLLEGE_GOVERN_SCIENCE',		'Amount',			6);

insert or replace into RequirementSets
	(RequirementSetId,						RequirementSetType)
values
	('CITY_HAS_NAT_COLLEGE',				'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,						RequirementId)
values
	('CITY_HAS_NAT_COLLEGE',				'REQUIRES_CITY_HAS_NAT_WONDER_CL_COLLEGE');


-- 民族史诗 ----------------------------------------------------------------------------------------------------------------------------------------------------
	-- 修改解锁条件和造价
update Buildings set PrereqTech = Null, PrereqCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD', cost = 880 where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC';
update Buildings set PrereqTech = Null, PrereqCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD', cost = 880 where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC_INTERNAL';
	-- 修改建造条件
update Modifiers set OwnerRequirementSetId = Null where ModifierId = 'CL_NAT_WONDER_ALLOW_BUILDING_NATIONALEPIC';

update Buildings set AdjacentDistrict = 'DISTRICT_THEATER' where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC';
update Buildings set AdjacentDistrict = 'DISTRICT_THEATER' where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC_INTERNAL';

insert or replace into BuildingPrereqs
	(Building,								PrereqBuilding)
values
	('NAT_WONDER_CL_NATIONALEPIC',			'BUILDING_MUSEUM_ART'),
	('NAT_WONDER_CL_NATIONALEPIC',			'BUILDING_MUSEUM_ARTIFACT'),
	('NAT_WONDER_CL_NATIONALEPIC_INTERNAL',	'BUILDING_MUSEUM_ART'),
	('NAT_WONDER_CL_NATIONALEPIC_INTERNAL',	'BUILDING_MUSEUM_ARTIFACT');
	-- 修改本体产出
delete from Building_YieldChanges where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC';
delete from Building_YieldChanges where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC_INTERNAL';
delete from Building_GreatWorks where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC';
delete from Building_GreatWorks where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC_INTERNAL';
	-- 修改特效
delete from BuildingModifiers where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC' and ModifierId = 'CL_NAT_WONDER_ADJUST_GREATWORK_YIELD';
delete from BuildingModifiers where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC' and ModifierId = 'CL_NAT_WONDER_ADJUST_GREAT_PERSON_POINT_BONUS_GOLDEN';
delete from BuildingModifiers where BuildingType = 'NAT_WONDER_CL_NATIONALEPIC' and ModifierId = 'CL_NAT_WONDER_ADJUST_GREATWORK_YIELD_GOLDEN';

insert or replace into Modifiers
	(ModifierId,											ModifierType)
select
	'HD_NAT_NATIONALEPIC_' || YieldType || '_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER'
from Yields;

insert or replace into Modifiers
	(ModifierId,											ModifierType)
select
	'HD_NAT_NATIONALEPIC_' || YieldType,					'MODIFIER_BUILDING_YIELD_CHANGE'
from Yields;

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
select
	'HD_NAT_NATIONALEPIC_' || YieldType || '_ATTACH',		'ModifierId',			'HD_NAT_NATIONALEPIC_' || YieldType
from Yields;

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
select
	'HD_NAT_NATIONALEPIC_' || YieldType,					'BuildingType',			'NAT_WONDER_CL_NATIONALEPIC'
from Yields;

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
select
	'HD_NAT_NATIONALEPIC_' || YieldType,					'YieldType',			YieldType
from Yields;

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
select
	'HD_NAT_NATIONALEPIC_' || YieldType,					'Amount',				4
from Yields;

-- 大本营 ------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 修改解锁条件和造价
update Buildings set PrereqTech = 'TECH_MILITARY_ENGINEERING', PrereqCivic = Null, cost = 500 where BuildingType = 'NAT_WONDER_CL_CITADEL';
update Buildings set PrereqTech = 'TECH_MILITARY_ENGINEERING', PrereqCivic = Null, cost = 500 where BuildingType = 'NAT_WONDER_CL_CITADEL_INTERNAL';
	-- 修改本体产出
delete from Building_YieldChanges where BuildingType = 'NAT_WONDER_CL_CITADEL';
delete from Building_YieldChanges where BuildingType = 'NAT_WONDER_CL_CITADEL_INTERNAL';

update Building_GreatPersonPoints set PointsPerTurn = 6 where BuildingType = 'NAT_WONDER_CL_CITADEL';
update Building_GreatPersonPoints set PointsPerTurn = 6 where BuildingType = 'NAT_WONDER_CL_CITADEL_INTERNAL';
	-- 修改特效
		-- 堡垒产出
update Modifiers set OwnerRequirementSetId = Null where ModifierId = 'CL_NAT_WONDER_ATTACH_FORT_YIELD_MODIFIER';
delete from ModifierArguments where ModifierId = 'CL_NAT_WONDER_ADJUST_FORT_YIELD';
insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
values
	('CL_NAT_WONDER_ADJUST_FORT_YIELD',		'YieldType',			'YIELD_PRODUCTION,YIELD_CULTURE'),
	('CL_NAT_WONDER_ADJUST_FORT_YIELD',		'Amount',				'2,2');
		-- 单位加力
update Modifiers set SubjectRequirementSetId = Null where ModifierId = 'CL_NAT_WONDER_CITADEL_GRANT_ABILITY';
update Modifiers set SubjectRequirementSetId = 'HD_UNIT_IN_OWNER_TERRITORY_REQUIREMENTS' where ModifierId = 'CL_NAT_WONDER_ADJUST_UNIT_COMBAT_STRENGTH';
delete from UnitAbilityModifiers where UnitAbilityType = 'ABILITY_NAT_WONDER_CL_CITADEL' and ModifierId = 'CL_NAT_WONDER_ADJUST_UNIT_MOVEMENT';
update UnitAbilities set Description = 'LOC_ABILITY_NAT_WONDER_CL_CITADEL_DESCRIPTION_HD' where UnitAbilityType = 'ABILITY_NAT_WONDER_CL_CITADEL';
insert or replace into ModifierStrings
	(ModifierId,									Context,				Text)
values
	('CL_NAT_WONDER_ADJUST_UNIT_COMBAT_STRENGTH',	'Preview',				'LOC_ABILITY_NAT_WONDER_CL_CITADEL_DESCRIPTION_HD');
delete from TypeTags where Type = 'ABILITY_NAT_WONDER_CL_CITADEL';
insert or replace into TypeTags
	(Type,									Tag)
values
	('ABILITY_NAT_WONDER_CL_CITADEL',		'CLASS_MILITARY');

		-- 单位晋升不消耗移动力
insert or replace into UnitAbilityModifiers
	(UnitAbilityType,						ModifierId)
values
	('ABILITY_NAT_WONDER_CL_CITADEL',		'TRAIT_PROMOTE_NO_FINISH_MOVES');
-- Gran Colombia pack
insert or ignore into Modifiers (ModifierId, ModifierType) values
('TRAIT_PROMOTE_NO_FINISH_MOVES',	'MODIFIER_PLAYER_UNITS_PROMOTE_NO_FINISH_MOVES');
insert or ignore into ModifierArguments (ModifierId, Name, Value) values
('TRAIT_PROMOTE_NO_FINISH_MOVES',	'NoFinishMoves',	1);

		-- 送城墙&军营产出
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('NAT_WONDER_CL_CITADEL',				'HD_NAT_CITADEL_GRANT_WALLS'),
	('NAT_WONDER_CL_CITADEL',				'HD_NAT_CITADEL_GRANT_CASTLE'),
	('NAT_WONDER_CL_CITADEL',				'HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_PRODUCTION_ATTACH'),
	('NAT_WONDER_CL_CITADEL',				'HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_CULTURE_ATTACH');

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
select
	'NAT_WONDER_CL_CITADEL',				'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_PRODUCTION_ATTACH'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
select
	'NAT_WONDER_CL_CITADEL',				'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_CULTURE_ATTACH'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into Modifiers
	(ModifierId,														ModifierType,												RunOnce,	Permanent,	SubjectRequirementSetId)
values
	('HD_NAT_CITADEL_GRANT_WALLS',										'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',		1,			1,			Null),
	('HD_NAT_CITADEL_GRANT_CASTLE',										'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',		1,			1,			Null),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_PRODUCTION_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',					0,			0,			Null),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_CULTURE_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',					0,			0,			Null),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_PRODUCTION',			'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',				0,			0,			'DISTRICT_IS_ENCAMPMENT'),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_CULTURE',				'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',				0,			0,			'DISTRICT_IS_ENCAMPMENT');

insert or replace into Modifiers
	(ModifierId,														ModifierType)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_PRODUCTION_ATTACH',	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into Modifiers
	(ModifierId,														ModifierType)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_CULTURE_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into Modifiers
	(ModifierId,														ModifierType)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_PRODUCTION',			'MODIFIER_BUILDING_YIELD_CHANGE'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into Modifiers
	(ModifierId,														ModifierType)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_CULTURE',				'MODIFIER_BUILDING_YIELD_CHANGE'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into ModifierArguments
	(ModifierId,														Name,					Value)
values
	('HD_NAT_CITADEL_GRANT_WALLS',										'BuildingType',			'BUILDING_WALLS'),
	('HD_NAT_CITADEL_GRANT_CASTLE',										'BuildingType',			'BUILDING_CASTLE'),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_PRODUCTION_ATTACH',		'ModifierId',			'HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_PRODUCTION'),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_CULTURE_ATTACH',		'ModifierId',			'HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_CULTURE'),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_PRODUCTION',			'YieldType',			'YIELD_PRODUCTION'),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_PRODUCTION',			'Amount',				2),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_CULTURE',				'YieldType',			'YIELD_CULTURE'),
	('HD_NAT_CITADEL_ADJUST_ENCAMPMENT_DISTRICT_CULTURE',				'Amount',				2);

insert or replace into ModifierArguments
	(ModifierId,														Name,					Value)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_PRODUCTION_ATTACH',	'ModifierId',			'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_PRODUCTION'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into ModifierArguments
	(ModifierId,														Name,					Value)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_CULTURE_ATTACH',		'ModifierId',			'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_CULTURE'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into ModifierArguments
	(ModifierId,														Name,					Value)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_PRODUCTION',			'BuildingType',			BuildingType
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into ModifierArguments
	(ModifierId,														Name,					Value)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_PRODUCTION',			'YieldType',			'YIELD_PRODUCTION'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into ModifierArguments
	(ModifierId,														Name,					Value)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_PRODUCTION',			'Amount',				2
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into ModifierArguments
	(ModifierId,														Name,					Value)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_CULTURE',				'BuildingType',			BuildingType
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into ModifierArguments
	(ModifierId,														Name,					Value)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_CULTURE',				'YieldType',			'YIELD_CULTURE'
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

insert or replace into ModifierArguments
	(ModifierId,														Name,					Value)
select
	'HD_NAT_CITADEL_ADJUST_' || BuildingType || '_CULTURE',				'Amount',				2
from Buildings where (PrereqDistrict = 'DISTRICT_ENCAMPMENT' and TraitType is Null);

	-- 堡垒在飞行后获得旅游业绩
insert or replace into Improvement_Tourism
	(ImprovementType,		TourismSource,				PrereqTech,			ScalingFactor)
values
	('IMPROVEMENT_FORT',	'TOURISMSOURCE_CULTURE',	'TECH_FLIGHT',		100);

-- 圣殿 --------------------------------------------------------------------------------------------------------------------------------------------------------
	-- 修改解锁条件和造价
update Buildings set PrereqTech = Null, PrereqCivic = 'CIVIC_THEOLOGY', cost = 300 where BuildingType = 'NAT_WONDER_CL_TEMPLE';
update Buildings set PrereqTech = Null, PrereqCivic = 'CIVIC_THEOLOGY', cost = 300 where BuildingType = 'NAT_WONDER_CL_TEMPLE_INTERNAL';
	-- 修改建造条件
update RequirementArguments set Value = 5 where RequirementId = 'REQ_CL_PLAYER_HAS_X_CITIES_WITH_RELIGION' and Name = 'Count';
	-- 修改特效
update ModifierArguments set Value = 20 where ModifierId = 'CL_NAT_WONDER_ADJUST_RELIGION_PRESSURE' and Name = 'Amount';
update Modifiers set SubjectStackLimit = 5 where ModifierId = 'CL_NAT_WONDER_ADJUST_RELIGION_PRESSURE';
update Modifiers set SubjectStackLimit = 5 where ModifierId = 'CL_NAT_WONDER_ADJUST_RELIGION_DISTANCE';

delete from BuildingModifiers where BuildingType = 'NAT_WONDER_CL_TEMPLE';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('NAT_WONDER_CL_TEMPLE',		'HD_NAT_TEMPLE_ADJUST_RELIGION_PRESSURE_ATTACH'),
	('NAT_WONDER_CL_TEMPLE',		'HD_NAT_TEMPLE_ADJUST_RELIGION_DISTANCE_ATTACH');

insert or replace into Modifiers
	(ModifierId,											ModifierType,									SubjectRequirementSetId)
values
	('HD_NAT_TEMPLE_ADJUST_RELIGION_PRESSURE_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',		'HD_CITY_HAS_RELIGIOUS_TIER_3_BUILDING_REQUIREMENTS'),
	('HD_NAT_TEMPLE_ADJUST_RELIGION_DISTANCE_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',		'HD_CITY_HAS_RELIGIOUS_TIER_3_BUILDING_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
values
	('HD_NAT_TEMPLE_ADJUST_RELIGION_PRESSURE_ATTACH',		'ModifierId',			'CL_NAT_WONDER_ADJUST_RELIGION_PRESSURE'),
	('HD_NAT_TEMPLE_ADJUST_RELIGION_DISTANCE_ATTACH',		'ModifierId',			'CL_NAT_WONDER_ADJUST_RELIGION_DISTANCE');

-- 国家主题公园 ------------------------------------------------------------------------------------------------------------------------------------------------
	-- 修改解锁条件和造价
update Buildings set PrereqTech = 'TECH_BIOLOGY_HD', PrereqCivic = Null, cost = 900 where BuildingType = 'NAT_WONDER_CL_THEMEPARK';
update Buildings set PrereqTech = 'TECH_BIOLOGY_HD', PrereqCivic = Null, cost = 900 where BuildingType = 'NAT_WONDER_CL_THEMEPARK_INTERNAL';
	-- 修改本体产出
delete from Building_YieldChanges where BuildingType = 'NAT_WONDER_CL_THEMEPARK';
delete from Building_YieldChanges where BuildingType = 'NAT_WONDER_CL_THEMEPARK_INTERNAL';
delete from Building_YieldChangesBonusWithPower where BuildingType = 'NAT_WONDER_CL_THEMEPARK';
delete from Building_YieldChangesBonusWithPower where BuildingType = 'NAT_WONDER_CL_THEMEPARK_INTERNAL';
	-- 修改特效
delete from RequirementSetRequirements where RequirementSetId = 'REQ_SET_CL_DISTRICT_IS_WITHIN_6_ENTERTAINMENT' and RequirementId = 'REQ_CL_PLOT_WITHIN_6';

insert or replace into BuildingModifiers
	(BuildingType,											ModifierId)
values
	('NAT_WONDER_CL_THEMEPARK',								'HD_NAT_THEMEPARK_ENTERTAINMENT_BUILDING_PRODUCTION'),
	('NAT_WONDER_CL_THEMEPARK',								'HD_NAT_THEMEPARK_WATERENTER_BUILDING_PRODUCTION');

insert or replace into Modifiers
	(ModifierId,											ModifierType)
values
	('HD_NAT_THEMEPARK_ENTERTAINMENT_BUILDING_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'),
	('HD_NAT_THEMEPARK_WATERENTER_BUILDING_PRODUCTION',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
values
	('HD_NAT_THEMEPARK_ENTERTAINMENT_BUILDING_PRODUCTION',	'DistrictType',			'DISTRICT_ENTERTAINMENT_COMPLEX'),
	('HD_NAT_THEMEPARK_ENTERTAINMENT_BUILDING_PRODUCTION',	'Amount',				50),
	('HD_NAT_THEMEPARK_WATERENTER_BUILDING_PRODUCTION',		'DistrictType',			'DISTRICT_WATER_ENTERTAINMENT_COMPLEX'),
	('HD_NAT_THEMEPARK_WATERENTER_BUILDING_PRODUCTION',		'Amount',				50);