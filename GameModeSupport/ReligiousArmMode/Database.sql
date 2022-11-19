-- Master table
create table if not exists HD_ReligiousArmUnits (
	UnitType text not null primary key,
	BaseMoves int not null,
	Combat int not null,
	Cost int not null,
	PrereqTech text,
	PrereqCivic text,
	Maintenance int not null default 0,
	FaithMaintenance int not null default 0,
	ResourceMaintenanceType text,
	ResourceMaintenanceAmount int not null default 0,
	IsNew boolean not null default false
);
insert or replace into HD_ReligiousArmUnits
	(UnitType,							BaseMoves,	Combat,	Cost,	PrereqTech,			PrereqCivic,				Maintenance,	FaithMaintenance,	ResourceMaintenanceType,	ResourceMaintenanceAmount,	IsNew)
values
	-- New Units
	('UNIT_HD_ARMED_BELIEVER',			2,			34,		65,		null,				'CIVIC_THEOLOGY',			2,				2,					null,						0,							1),
	('UNIT_HD_EXPEDITIONARY',			2,			44,		95,		null,				'CIVIC_DIVINE_RIGHT',		3,				3,					null,						0,							1),
	('UNIT_HD_THEOCRATIC_GUARDIAN',		2,			54,		145,	null,				'CIVIC_REFORMED_CHURCH',	4,				4,					'RESOURCE_NITER',			1,							1),
	('UNIT_HD_RESISTANCE_ARMY',			3,			64,		210,	null,				'CIVIC_NATIONALISM',		5,				5,					'RESOURCE_NITER',			1,							1),
	('UNIT_HD_REVOLUTIONARY_GUARDIAN',	3,			74,		305,	null,				'CIVIC_IDEOLOGY',			6,				6,					'RESOURCE_NITER',			2,							1),
	('UNIT_HD_DEUX_EX_MACHINA',			5,			120,	1500,	'TECH_ROBOTICS',	null,						15,				15,					'RESOURCE_URANIUM',			2,							1),
	-- Old Units
	('UNIT_WARRIOR_MONK',				2,			36,		70,		null,				null,						0,				3,					null,						0,							0),
	('UNIT_NORWEGIAN_ULFHEDNAR',		2,			25,		35,		null,				'CIVIC_MYSTICISM',			1,				0,					null,						0,							0),
	('UNIT_JAPANESE_SOHEI',				2,			48,		90,		null,				'CIVIC_THEOLOGY',			3,				3,					null,						0,							0),
	('UNIT_ELEANOR_TEMPLAR',			2,			45,		100,	'TECH_CASTLES',		null,						3,				3,					'RESOURCE_IRON',			1,							0),
	('UNIT_INDONESIAN_KRIS_SWORDSMAN',	2,			36,		60,		null,				'CIVIC_THEOLOGY',			2,				2,					null,						0,							0),
	('UNIT_LAHORE_NIHANG',				2,			25,		60,		null,				null,						0,				2,					null,						0,							0);
delete from HD_ReligiousArmUnits where (not IsNew) and (UnitType not in (select UnitType from Units));
-- Types
insert or replace into Types
	(Type,			Kind)
select
	UnitType,		'KIND_UNIT'
from HD_ReligiousArmUnits where IsNew;
-- Units
insert or replace into Units
	(UnitType,	Name,							BaseSightRange,	BaseMoves,	Combat,	Domain,			FormationClass,					Cost,	Description,							CanCapture,	PromotionClass,				PrereqTech,			PrereqCivic,				CanTrain,	PurchaseYield,	Maintenance,	ZoneOfControl,	TrackReligion,	AdvisorType)
select
	UnitType,	'LOC_' || UnitType || '_NAME',	2,				BaseMoves,	Combat,	'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	Cost,	'LOC_' || UnitType || '_DESCRIPTION',	1,			'PROMOTION_CLASS_MONK',		PrereqTech,			PrereqCivic,				1,			'YIELD_FAITH',	Maintenance,	1,				1,				'ADVISOR_CONQUEST'
from HD_ReligiousArmUnits where IsNew;
update Units set
	BaseMoves	= (select BaseMoves		from HD_ReligiousArmUnits r where r.UnitType = UnitType),
	Combat		= (select Combat		from HD_ReligiousArmUnits r where r.UnitType = UnitType),
	Cost		= (select Cost			from HD_ReligiousArmUnits r where r.UnitType = UnitType),
	PrereqTech	= (select PrereqTech	from HD_ReligiousArmUnits r where r.UnitType = UnitType),
	PrereqCivic	= (select PrereqCivic	from HD_ReligiousArmUnits r where r.UnitType = UnitType),
	Maintenance	= (select Maintenance	from HD_ReligiousArmUnits r where r.UnitType = UnitType),
	Maintenance	= (select Maintenance	from HD_ReligiousArmUnits r where r.UnitType = UnitType)
where UnitType in (select UnitType from HD_ReligiousArmUnits where not IsNew);
-- Units_XP2
delete from Units_XP2 where UnitType in (select UnitType from HD_ReligiousArmUnits);
insert or replace into Units_XP2
	(UnitType,	ResourceMaintenanceType,	ResourceMaintenanceAmount)
select
	UnitType,	ResourceMaintenanceType,	ResourceMaintenanceAmount
from HD_ReligiousArmUnits where ResourceMaintenanceType is not null;
-- TypeTags
delete from TypeTags where Type in (select UnitType from HD_ReligiousArmUnits) and Type != 'UNIT_WARRIOR_MONK';
insert or replace into TypeTags
	(Type,			Tag)
select
	UnitType,		Tag
from (HD_ReligiousArmUnits cross join (select Tag from TypeTags where Type = 'UNIT_WARRIOR_MONK' and Tag != 'CLASS_ALL_ERAS'));