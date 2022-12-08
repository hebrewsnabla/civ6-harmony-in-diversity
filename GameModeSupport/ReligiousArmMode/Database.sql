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
	StrategicResource text,
	StrategicResourceAmount int not null default 0,
	ResourceMaintenanceType text,
	ResourceMaintenanceAmount int not null default 0,
	Replaces text,
	Upgrades text,
	IsNew boolean not null default false
);
insert or replace into HD_ReligiousArmUnits
	(UnitType,							BaseMoves,	Combat,	Cost,	PrereqTech,			PrereqCivic,				Maintenance,	FaithMaintenance,	StrategicResource,	StrategicResourceAmount,	ResourceMaintenanceType,	ResourceMaintenanceAmount,	Replaces,					Upgrades,							IsNew)
values
	-- New Units
	('UNIT_HD_ARMED_BELIEVER',			2,			32,		65,		null,				'CIVIC_THEOLOGY',			2,				2,					'RESOURCE_IRON',	5,							'RESOURCE_IRON',			1,							null,						'UNIT_HD_EXPEDITIONARY',			1),
	('UNIT_HD_EXPEDITIONARY',			2,			40,		95,		null,				'CIVIC_DIVINE_RIGHT',		3,				3,					'RESOURCE_IRON',	5,							'RESOURCE_IRON',			2,							null,						'UNIT_HD_THEOCRATIC_GUARDIAN',		1),
	('UNIT_HD_THEOCRATIC_GUARDIAN',		2,			51,		145,	null,				'CIVIC_REFORMED_CHURCH',	4,				4,					'RESOURCE_NITER',	5,							'RESOURCE_NITER',			1,							null,						'UNIT_HD_RESISTANCE_ARMY',			1),
	('UNIT_HD_RESISTANCE_ARMY',			3,			62,		210,	null,				'CIVIC_NATIONALISM',		5,				5,					'RESOURCE_NITER',	5,							'RESOURCE_NITER',			1,							null,						'UNIT_HD_REVOLUTIONARY_GUARDIAN',	1),
	('UNIT_HD_REVOLUTIONARY_GUARDIAN',	3,			72,		305,	null,				'CIVIC_IDEOLOGY',			6,				6,					'RESOURCE_NITER',	5,							'RESOURCE_NITER',			2,							null,						'UNIT_HD_DEUX_EX_MACHINA',			1),
	('UNIT_HD_DEUX_EX_MACHINA',			5,			120,	1500,	'TECH_ROBOTICS',	null,						15,				15,					'RESOURCE_URANIUM',	5,							'RESOURCE_URANIUM',			2,							null,						null,								1),
	-- Old Units
	('UNIT_WARRIOR_MONK',				2,			36,		70,		null,				null,						0,				3,					null,				0,							null,						0,							null,						'UNIT_HD_EXPEDITIONARY',			0),
	('UNIT_NORWEGIAN_ULFHEDNAR',		2,			25,		35,		null,				'CIVIC_MYSTICISM',			1,				0,					null,				0,							null,						0,							null,						'UNIT_HD_ARMED_BELIEVER',			0),
	('UNIT_JAPANESE_SOHEI',				2,			44,		90,		null,				'CIVIC_THEOLOGY',			3,				3,					'RESOURCE_IRON',	5,							'RESOURCE_IRON',			1,							'UNIT_HD_EXPEDITIONARY',	'UNIT_HD_THEOCRATIC_GUARDIAN',		0),
	('UNIT_ELEANOR_TEMPLAR',			2,			45,		100,	'TECH_CASTLES',		null,						3,				3,					null,				0,							'RESOURCE_IRON',			2,							null,						'UNIT_HD_THEOCRATIC_GUARDIAN',		0),
	('UNIT_INDONESIAN_KRIS_SWORDSMAN',	2,			35,		60,		null,				'CIVIC_THEOLOGY',			2,				2,					'RESOURCE_IRON',	5,							'RESOURCE_IRON',			1,							'UNIT_HD_ARMED_BELIEVER',	'UNIT_HD_EXPEDITIONARY',			0),
	('UNIT_LAHORE_NIHANG',				2,			20,		75,		null,				null,						0,				2,					null,				0,							null,						0,							null,						'UNIT_HD_THEOCRATIC_GUARDIAN',		0);
delete from HD_ReligiousArmUnits where (not IsNew) and (UnitType not in (select UnitType from Units));
-- Types
insert or replace into Types
	(Type,			Kind)
select
	UnitType,		'KIND_UNIT'
from HD_ReligiousArmUnits where IsNew;
-- Units
insert or replace into Units
	(UnitType,	Name,							BaseSightRange,	BaseMoves,	Combat,	Domain,			FormationClass,					Cost,	StrategicResource,	Description,							PromotionClass,				PrereqTech,			PrereqCivic,				PurchaseYield,	Maintenance,	ZoneOfControl,	EnabledByReligion,	AdvisorType)
select
	UnitType,	'LOC_' || UnitType || '_NAME',	2,				BaseMoves,	Combat,	'DOMAIN_LAND',	'FORMATION_CLASS_LAND_COMBAT',	Cost,	StrategicResource,	'LOC_' || UnitType || '_DESCRIPTION',	'PROMOTION_CLASS_MONK',		PrereqTech,			PrereqCivic,				'YIELD_FAITH',	Maintenance,	1,				1,					'ADVISOR_CONQUEST'
from HD_ReligiousArmUnits where IsNew;
update Units set
	BaseSightRange		= 2,
	Domain				= 'DOMAIN_LAND',
	FormationClass		= 'FORMATION_CLASS_LAND_COMBAT',
	PromotionClass		= 'PROMOTION_CLASS_MONK',
	PurchaseYield		= 'YIELD_FAITH',
	ZoneOfControl		= 1,
	AdvisorType			= 'ADVISOR_CONQUEST',
	EnabledByReligion	= 1,
	CostProgressionModel = 'NO_COST_PROGRESSION',
	CostProgressionParam1 = 0,
	BaseMoves			= (select BaseMoves			from HD_ReligiousArmUnits r where r.UnitType = Units.UnitType),
	Combat				= (select Combat			from HD_ReligiousArmUnits r where r.UnitType = Units.UnitType),
	Cost				= (select Cost				from HD_ReligiousArmUnits r where r.UnitType = Units.UnitType),
	StrategicResource	= (select StrategicResource	from HD_ReligiousArmUnits r where r.UnitType = Units.UnitType),
	PrereqTech			= (select PrereqTech		from HD_ReligiousArmUnits r where r.UnitType = Units.UnitType),
	PrereqCivic			= (select PrereqCivic		from HD_ReligiousArmUnits r where r.UnitType = Units.UnitType),
	Maintenance			= (select Maintenance		from HD_ReligiousArmUnits r where r.UnitType = Units.UnitType),
	Maintenance			= (select Maintenance		from HD_ReligiousArmUnits r where r.UnitType = Units.UnitType)
where UnitType in (select UnitType from HD_ReligiousArmUnits where not IsNew);
-- Units_XP2
delete from Units_XP2 where UnitType in (select UnitType from HD_ReligiousArmUnits);
insert or replace into Units_XP2
	(UnitType,	ResourceCost,				ResourceMaintenanceType,	ResourceMaintenanceAmount)
select
	UnitType,	StrategicResourceAmount,	ResourceMaintenanceType,	ResourceMaintenanceAmount
from HD_ReligiousArmUnits where ResourceMaintenanceType is not null or StrategicResource is not null;
-- Unit Replaces
delete from UnitReplaces where CivUniqueUnitType in (select UnitType from HD_ReligiousArmUnits) or ReplacesUnitType in (select UnitType from HD_ReligiousArmUnits);
insert or replace into UnitReplaces
	(CivUniqueUnitType,		ReplacesUnitType)
select
	UnitType,				Replaces
from HD_ReligiousArmUnits where Replaces is not null;
-- Unit Upgrades
delete from UnitUpgrades where Unit in (select UnitType from HD_ReligiousArmUnits) or UpgradeUnit in (select UnitType from HD_ReligiousArmUnits);
insert or replace into UnitUpgrades
	(Unit,					UpgradeUnit)
select
	UnitType,				Upgrades
from HD_ReligiousArmUnits where Upgrades is not null;
-- TypeTags
delete from TypeTags where Type in (select UnitType from HD_ReligiousArmUnits) and Type != 'UNIT_WARRIOR_MONK';
insert or replace into TypeTags
	(Type,			Tag)
select
	UnitType,		Tag
from (HD_ReligiousArmUnits cross join (select Tag from TypeTags where Type = 'UNIT_WARRIOR_MONK' and Tag != 'CLASS_ALL_ERAS'));
-- Religion Enable
insert or replace into Modifiers
	(ModifierId,						ModifierType)
select
	'RELIGION_ALLOW_' || UnitType,		'MODIFIER_PLAYER_RELIGION_ADD_RELIGIOUS_UNIT'
from HD_ReligiousArmUnits where UnitType != 'UNIT_WARRIOR_MONK';
insert or replace into ModifierArguments
	(ModifierId,						Name,			Value)
select
	'RELIGION_ALLOW_' || UnitType,		'UnitType',		UnitType
from HD_ReligiousArmUnits where UnitType != 'UNIT_WARRIOR_MONK';
insert or replace into BeliefModifiers
	(BeliefType,						ModifierId)
select
	BeliefType,							'RELIGION_ALLOW_' || UnitType
from (Beliefs cross join HD_ReligiousArmUnits) where BeliefClassType = 'BELIEF_CLASS_FOLLOWER' and UnitType != 'UNIT_WARRIOR_MONK';
-- Unit Abilities
insert or replace into Types
	(Type,								Kind)
values
	('ABILITY_RELIGOUS_ARM',			'KIND_ABILITY'),
	('ABILITY_RELIGOUS_ARM_MELEE_ANTC',	'KIND_ABILITY'),
	('ABILITY_RELIGOUS_ARM_FLAT',		'KIND_ABILITY'),
	('ABILITY_RELIGOUS_ARM_DISTRICT',	'KIND_ABILITY');
insert or replace into TypeTags
	(Type,								Tag)
values
	('ABILITY_RELIGOUS_ARM',			'CLASS_WARRIOR_MONK'),
	('ABILITY_RELIGOUS_ARM_MELEE_ANTC',	'CLASS_WARRIOR_MONK'),
	('ABILITY_RELIGOUS_ARM_FLAT',		'CLASS_WARRIOR_MONK'),
	('ABILITY_RELIGOUS_ARM_DISTRICT',	'CLASS_WARRIOR_MONK');
insert or replace into UnitAbilities
	(UnitAbilityType,					Name,										Description,										Inactive)
values
	('ABILITY_RELIGOUS_ARM',			'LOC_ABILITY_RELIGOUS_ARM_NAME',			'LOC_ABILITY_RELIGOUS_ARM_DESCRIPTION',				0),
	('ABILITY_RELIGOUS_ARM_MELEE_ANTC',	'LOC_ABILITY_RELIGOUS_ARM_MELEE_ANTC_NAME',	'LOC_ABILITY_RELIGOUS_ARM_MELEE_ANTC_DESCRIPTION',	1),
	('ABILITY_RELIGOUS_ARM_FLAT',		'LOC_ABILITY_RELIGOUS_ARM_FLAT_NAME',		'LOC_ABILITY_RELIGOUS_ARM_FLAT_DESCRIPTION',		1),
	('ABILITY_RELIGOUS_ARM_DISTRICT',	'LOC_ABILITY_RELIGOUS_ARM_DISTRICT_NAME',	'LOC_ABILITY_RELIGOUS_ARM_DISTRICT_DESCRIPTION',	1);
insert or replace into UnitAbilityModifiers
	(UnitAbilityType,					ModifierId)
values
	('ABILITY_RELIGOUS_ARM',			'RELIGOUS_ARM_FAITH_ON_KILL'),
	('ABILITY_RELIGOUS_ARM_MELEE_ANTC',	'RELIGOUS_ARM_MELEE_ANTC'),
	('ABILITY_RELIGOUS_ARM_FLAT',		'RELIGOUS_ARM_FLAT'),
	('ABILITY_RELIGOUS_ARM_DISTRICT',	'RELIGOUS_ARM_DISTRICT');
insert or replace into TechnologyModifiers
	(TechnologyType,					ModifierId)
values
	('TECH_IRON_WORKING',				'IRON_WORKING_GRANT_ABILITY_RELIGOUS_ARM'),
	('TECH_GUNPOWDER',					'GUNPOWDER_GRANT_ABILITY_RELIGOUS_ARM'),
	('TECH_REPLACEABLE_PARTS',			'REPLACEABLE_PARTS_GRANT_ABILITY_RELIGOUS_ARM');
insert or replace into Modifiers
	(ModifierId,										ModifierType,								OwnerRequirementSetId,				SubjectRequirementSetId)
values
	('RELIGOUS_ARM_FAITH_ON_KILL',						'MODIFIER_UNIT_ADJUST_POST_COMBAT_YIELD',	null,								null),
	('RELIGOUS_ARM_MELEE_ANTC',							'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		null,								'OPPONENT_IS_MELEE_OR_ANTC_REQUIREMENTS'),
	('RELIGOUS_ARM_FLAT',								'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		'PLOT_IS_OPEN_AREA_REQUIREMENTS',	null),
	('RELIGOUS_ARM_DISTRICT',							'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		null,								'URBAN_WARFARE_REQUIREMENTS'),
	('IRON_WORKING_GRANT_ABILITY_RELIGOUS_ARM',			'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		null,								null),
	('GUNPOWDER_GRANT_ABILITY_RELIGOUS_ARM',			'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		null,								null),
	('REPLACEABLE_PARTS_GRANT_ABILITY_RELIGOUS_ARM',	'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',		null,								null);
insert or replace into ModifierArguments
	(ModifierId,										Name,						Value)
values
	('RELIGOUS_ARM_FAITH_ON_KILL',						'YieldType',				'YIELD_FAITH'),
	('RELIGOUS_ARM_FAITH_ON_KILL',						'PercentDefeatedStrength',	50),
	('RELIGOUS_ARM_MELEE_ANTC',							'Amount',					5),
	('RELIGOUS_ARM_FLAT',								'Amount',					5),
	('RELIGOUS_ARM_DISTRICT',							'Amount',					5),
	('IRON_WORKING_GRANT_ABILITY_RELIGOUS_ARM',			'AbilityType',				'ABILITY_RELIGOUS_ARM_MELEE_ANTC'),
	('GUNPOWDER_GRANT_ABILITY_RELIGOUS_ARM',			'AbilityType',				'ABILITY_RELIGOUS_ARM_FLAT'),
	('REPLACEABLE_PARTS_GRANT_ABILITY_RELIGOUS_ARM',	'AbilityType',				'ABILITY_RELIGOUS_ARM_DISTRICT');
insert or replace into ModifierStrings
	(ModifierId,					Context,		Text)
values
	('RELIGOUS_ARM_MELEE_ANTC',		'Preview',		'LOC_RELIGOUS_ARM_MELEE_ANTC'),
	('RELIGOUS_ARM_FLAT',			'Preview',		'LOC_RELIGOUS_ARM_FLAT'),
	('RELIGOUS_ARM_DISTRICT',		'Preview',		'LOC_RELIGOUS_ARM_DISTRICT');
-- Faith Maintenance
insert or replace into Types
	(Type,																	Kind)
select distinct
	'ABILITY_RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE',	'KIND_ABILITY'
from HD_ReligiousArmUnits where FaithMaintenance > 0;
insert or replace into UnitAbilities
	(UnitAbilityType,														Name,			Description)
select distinct
	'ABILITY_RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE',	'PlaceHolder',	'LOC_ABILITY_' || FaithMaintenance || '_FAITH_MAINTENANCE_DESCRIPTION'
from HD_ReligiousArmUnits where FaithMaintenance > 0;
insert or replace into Tags
	(Tag,																	Vocabulary)
select distinct
	'CLASS_RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE',		'ABILITY_CLASS'
from HD_ReligiousArmUnits where FaithMaintenance > 0;
insert or replace into TypeTags
	(Type,																	Tag)
select distinct
	'ABILITY_RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE',	'CLASS_RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE'
from HD_ReligiousArmUnits where FaithMaintenance > 0 union all select
	UnitType,																'CLASS_RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE'
from HD_ReligiousArmUnits where FaithMaintenance > 0;
insert or replace into UnitAbilityModifiers
	(UnitAbilityType,														ModifierId)
select distinct
	'ABILITY_RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE',	'RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE'
from HD_ReligiousArmUnits where FaithMaintenance > 0;
insert or replace into Modifiers
	(ModifierId,													ModifierType)
select distinct
	'RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE',	'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE'
from HD_ReligiousArmUnits where FaithMaintenance > 0;
insert or replace into ModifierArguments
	(ModifierId,													Name,			Value)
select distinct
	'RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE',	'YieldType',	'YIELD_FAITH'
from HD_ReligiousArmUnits where FaithMaintenance > 0 union all select distinct
	'RELIGOUS_ARM_' || FaithMaintenance || '_FAITH_MAINTENANCE',	'Amount',		-FaithMaintenance
from HD_ReligiousArmUnits where FaithMaintenance > 0;
-- Unit Promotions
delete from Types where Type in (select UnitPromotionType from UnitPromotions where PromotionClass = 'PROMOTION_CLASS_MONK');
insert or replace into Types
	(Type,									Kind)
values
	('PROMOTION_NRYANA',					'KIND_PROMOTION'), -- L1
	('PROMOTION_DRAGONS_SHAME',				'KIND_PROMOTION'), -- L2
	('PROMOTION_UNIVERSAL_RESTORATION',		'KIND_PROMOTION'), -- L3
	('PROMOTION_LIBERATE_THE_HOLY_LAND',	'KIND_PROMOTION'), -- M1
	('PROMOTION_PUNCITIVE_LAND',			'KIND_PROMOTION'), -- M2
	('PROMOTION_PROMISED_LAND',				'KIND_PROMOTION'), -- M3
	('PROMOTION_NATARAJ',					'KIND_PROMOTION'), -- R1
	('PROMOTION_HD_PILGRIM',				'KIND_PROMOTION'), -- R2
	('PROMOTION_SHARING_GODS_FAVOR',		'KIND_PROMOTION'), -- R3
	('PROMOTION_MIND_OVER_MATTER',			'KIND_PROMOTION'); -- M4
insert or replace into UnitPromotions
	(UnitPromotionType,						Name,											Description,										PromotionClass,				Level,	Column)
values
	('PROMOTION_NRYANA',					'LOC_PROMOTION_NRYANA_NAME',					'LOC_PROMOTION_NRYANA_DESCRIPTION',					'PROMOTION_CLASS_MONK',		1,		1),
	('PROMOTION_DRAGONS_SHAME',				'LOC_PROMOTION_DRAGONS_SHAME_NAME',				'LOC_PROMOTION_DRAGONS_SHAME_DESCRIPTION',			'PROMOTION_CLASS_MONK',		2,		1),
	('PROMOTION_UNIVERSAL_RESTORATION',		'LOC_PROMOTION_UNIVERSAL_RESTORATION_NAME',		'LOC_PROMOTION_UNIVERSAL_RESTORATION_DESCRIPTION',	'PROMOTION_CLASS_MONK',		3,		1),
	('PROMOTION_LIBERATE_THE_HOLY_LAND',	'LOC_PROMOTION_LIBERATE_THE_HOLY_LAND_NAME',	'LOC_PROMOTION_LIBERATE_THE_HOLY_LAND_DESCRIPTION',	'PROMOTION_CLASS_MONK',		1,		2),
	('PROMOTION_PUNCITIVE_LAND',			'LOC_PROMOTION_PUNCITIVE_LAND_NAME',			'LOC_PROMOTION_PUNCITIVE_LAND_DESCRIPTION',			'PROMOTION_CLASS_MONK',		2,		2),
	('PROMOTION_PROMISED_LAND',				'LOC_PROMOTION_PROMISED_LAND_NAME',				'LOC_PROMOTION_PROMISED_LAND_DESCRIPTION',			'PROMOTION_CLASS_MONK',		3,		2),
	('PROMOTION_NATARAJ',					'LOC_PROMOTION_NATARAJ_NAME',					'LOC_PROMOTION_NATARAJ_DESCRIPTION',				'PROMOTION_CLASS_MONK',		1,		3),
	('PROMOTION_HD_PILGRIM',				'LOC_PROMOTION_HD_PILGRIM_NAME',				'LOC_PROMOTION_HD_PILGRIM_DESCRIPTION',				'PROMOTION_CLASS_MONK',		2,		3),
	('PROMOTION_SHARING_GODS_FAVOR',		'LOC_PROMOTION_SHARING_GODS_FAVOR_NAME',		'LOC_PROMOTION_SHARING_GODS_FAVOR_DESCRIPTION',		'PROMOTION_CLASS_MONK',		3,		3),
	('PROMOTION_MIND_OVER_MATTER',			'LOC_PROMOTION_MIND_OVER_MATTER_NAME',			'LOC_PROMOTION_MIND_OVER_MATTER_DESCRIPTION',		'PROMOTION_CLASS_MONK',		4,		2);
insert or replace into UnitPromotionPrereqs
	(UnitPromotion,							PrereqUnitPromotion)
values
	('PROMOTION_DRAGONS_SHAME',				'PROMOTION_NRYANA'),
	('PROMOTION_UNIVERSAL_RESTORATION',		'PROMOTION_DRAGONS_SHAME'),
	('PROMOTION_MIND_OVER_MATTER',			'PROMOTION_UNIVERSAL_RESTORATION'),
	('PROMOTION_PUNCITIVE_LAND',			'PROMOTION_LIBERATE_THE_HOLY_LAND'),
	('PROMOTION_PROMISED_LAND',				'PROMOTION_PUNCITIVE_LAND'),
	('PROMOTION_MIND_OVER_MATTER',			'PROMOTION_PROMISED_LAND'),
	('PROMOTION_HD_PILGRIM',				'PROMOTION_NATARAJ'),
	('PROMOTION_SHARING_GODS_FAVOR',		'PROMOTION_HD_PILGRIM'),
	('PROMOTION_MIND_OVER_MATTER',			'PROMOTION_SHARING_GODS_FAVOR');
insert or replace into UnitPromotionModifiers
	(UnitPromotionType,						ModifierId)
values
	('PROMOTION_NRYANA',					'NRYANA_ATTACK'),
	('PROMOTION_DRAGONS_SHAME',				'DRAGONS_SHAME_DEFEND'),
	('PROMOTION_DRAGONS_SHAME',				'DRAGONS_SHAME_HEAL'),
	('PROMOTION_UNIVERSAL_RESTORATION',		'UNIVERSAL_RESTORATION_FLANK'),
	('PROMOTION_LIBERATE_THE_HOLY_LAND',	'LIBERATE_THE_HOLY_LAND_MOVEMENT'),
	('PROMOTION_PUNCITIVE_LAND',			'PUNCITIVE_LAND_DISTRICT'),
	('PROMOTION_PROMISED_LAND',				'PROMISED_LAND_ATTACK_DAMAGED'),
	('PROMOTION_NATARAJ',					'NATARAJ_DEFEND_RANGE'),
	('PROMOTION_NATARAJ',					'NATARAJ_ATTACK_DISTRICT'),
	('PROMOTION_HD_PILGRIM',				'HD_PILGRIM_DAMAGED'),
	('PROMOTION_SHARING_GODS_FAVOR',		'SHARING_GODS_FAVOR_ADJACENT_ATTACH'),
	('PROMOTION_MIND_OVER_MATTER',			'MIND_OVER_MATTER_MOVE_AFTER_ATTACK');
insert or replace into Modifiers
	(ModifierId,							ModifierType,															OwnerRequirementSetId,			SubjectRequirementSetId)
values
	('NRYANA_ATTACK',						'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',									null,							'HD_UNIT_ATTACKING_REQUIREMENTS'),
	('DRAGONS_SHAME_DEFEND',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',									'PLOT_HAS_ANY_FEATURE',			'HD_UNIT_DEFENDING_REQUIREMENTS'),
	('DRAGONS_SHAME_HEAL',					'MODIFIER_PLAYER_UNIT_ADJUST_HEAL_PER_TURN',							'PLOT_HAS_ANY_FEATURE',			null),
	('UNIVERSAL_RESTORATION_FLANK',			'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',									null,							'UNIT_IS_FLANKED_REQUIREMENTS'),
	('LIBERATE_THE_HOLY_LAND_MOVEMENT',		'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',									null,							null),
	('PUNCITIVE_LAND_DISTRICT',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',									null,							'URBAN_WARFARE_REQUIREMENTS'),
	('PROMISED_LAND_ATTACK_DAMAGED',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',									null,							'VULTURE_REQUIREMENTS'),
	('NATARAJ_DEFEND_RANGE',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',									null,							'TORTOISE_REQUIREMENTS'),
	('NATARAJ_ATTACK_DISTRICT',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',									null,							'ATTACKING_DISTRICTS_REQUIREMENTS'),
	('HD_PILGRIM_DAMAGED',					'MODIFIER_PLAYER_UNIT_ADJUST_STRENGTH_REDUCTION_FOR_DAMAGE_MODIFIER',	null,							'ATTACKING_DISTRICTS_REQUIREMENTS'),
	('SHARING_GODS_FAVOR_ADJACENT_ATTACH',	'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER',								null,							'UNIT_IS_RELIGIOUS_ARM_ADJACENT_TO_OWNER'),
	('SHARING_GODS_FAVOR_ADJACENT',			'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',									null,							null),
	('MIND_OVER_MATTER_MOVE_AFTER_ATTACK',	'MODIFIER_PLAYER_UNIT_ADJUST_ATTACK_AND_MOVE',							null,							null);
insert or replace into ModifierArguments
	(ModifierId,							Name,				Value)
values
	('NRYANA_ATTACK',						'Amount',			5),
	('DRAGONS_SHAME_DEFEND',				'Amount',			5),
	('DRAGONS_SHAME_HEAL',					'Type',				'ALL'),
	('DRAGONS_SHAME_HEAL',					'Amount',			15),
	('UNIVERSAL_RESTORATION_FLANK',			'Amount',			7),
	('LIBERATE_THE_HOLY_LAND_MOVEMENT',		'Amount',			1),
	('PUNCITIVE_LAND_DISTRICT',				'Amount',			10),
	('PROMISED_LAND_ATTACK_DAMAGED',		'Amount',			7),
	('NATARAJ_DEFEND_RANGE',				'Amount',			7),
	('NATARAJ_ATTACK_DISTRICT',				'Amount',			7),
	('HD_PILGRIM_DAMAGED',					'Amount',			100),
	('SHARING_GODS_FAVOR_ADJACENT_ATTACH',	'ModifierId',		'SHARING_GODS_FAVOR_ADJACENT'),
	('SHARING_GODS_FAVOR_ADJACENT',			'Amount',			2),
	('MIND_OVER_MATTER_MOVE_AFTER_ATTACK',	'CanMove',			1);
insert or replace into ModifierStrings
	(ModifierId,							Context,			Text)
values
	('NRYANA_ATTACK',						'Preview',			'LOC_NRYANA_ATTACK'),
	('DRAGONS_SHAME_DEFEND',				'Preview',			'LOC_DRAGONS_SHAME_DEFEND'),
	('UNIVERSAL_RESTORATION_FLANK',			'Preview',			'LOC_UNIVERSAL_RESTORATION_FLANK'),
	('PUNCITIVE_LAND_DISTRICT',				'Preview',			'LOC_PUNCITIVE_LAND_DISTRICT'),
	('PROMISED_LAND_ATTACK_DAMAGED',		'Preview',			'LOC_PROMISED_LAND_ATTACK_DAMAGED'),
	('NATARAJ_DEFEND_RANGE',				'Preview',			'LOC_NATARAJ_DEFEND_RANGE'),
	('NATARAJ_ATTACK_DISTRICT',				'Preview',			'LOC_NATARAJ_ATTACK_DISTRICT'),
	('SHARING_GODS_FAVOR_ADJACENT',			'Preview',			'LOC_SHARING_GODS_FAVOR_ADJACENT');
-- Promotion Action Cost
insert or replace into GlobalParameters
	(Name,											Value)
values
	('RELIGIOUS_ARM_UNIVERSAL_RESTORATION_COST',	2.0),
	('RELIGIOUS_ARM_PUNCITIVE_LAND_COST',			0.5),
	('RELIGIOUS_ARM_PROMISED_LAND_COST',			0.5),
	('RELIGIOUS_ARM_MIND_OVER_MATTER_COST',			2.0),
	('RELIGIOUS_ARM_HD_PILGRIM_COST',				10);
	
insert or replace into RequirementSets
	(RequirementSetId,								RequirementSetType)
values
	('OPPONENT_IS_MELEE_OR_ANTC_REQUIREMENTS',		'REQUIREMENTSET_TEST_ANY'),
	('UNIT_IS_RELIGIOUS_ARM_ADJACENT_TO_OWNER',		'REQUIREMENTSET_TEST_ANY');
insert or ignore into RequirementSetRequirements
	(RequirementSetId,								RequirementId)
values
	('OPPONENT_IS_MELEE_OR_ANTC_REQUIREMENTS',		'REQUIRES_OPPONENT_IS_MELEE'),
	('OPPONENT_IS_MELEE_OR_ANTC_REQUIREMENTS',		'REQUIRES_OPPONENT_IS_ANTC'),
	('UNIT_IS_RELIGIOUS_ARM_ADJACENT_TO_OWNER',		'HD_REQUIRES_UNIT_IS_PROMOTION_CLASS_MONK'),
	('UNIT_IS_RELIGIOUS_ARM_ADJACENT_TO_OWNER',		'ADJACENT_TO_OWNER');
insert or ignore into Requirements
	(RequirementId,									RequirementType)
values
	('REQUIRES_OPPONENT_IS_MELEE',					'REQUIREMENT_OPPONENT_UNIT_PROMOTION_CLASS_MATCHES'),
	('REQUIRES_OPPONENT_IS_ANTC',					'REQUIREMENT_OPPONENT_UNIT_PROMOTION_CLASS_MATCHES');
insert or ignore into RequirementArguments
	(RequirementId,								Name,						Value)
values
	('REQUIRES_OPPONENT_IS_MELEE',				'UnitPromotionClass',		'PROMOTION_CLASS_MELEE'),
	('REQUIRES_OPPONENT_IS_ANTC',				'UnitPromotionClass',		'PROMOTION_CLASS_ANTI_CAVALRY');