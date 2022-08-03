-------------------------------------
--         Post Process            --
-------------------------------------

-------------------------------------------------------------------------------------------------------------------
-- Military production cards
-------------------------------------------------------------------------------------------------------------------

-- Speed Up
insert or replace into PolicyModifiers (PolicyType, ModifierId) select
    a.PolicyType,   'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType;

insert or replace into Modifiers (ModifierId,   ModifierType) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION',  'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType;

insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION',  'EraType',  a.EraType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType;
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION',  'UnitPromotionClass',   b.PromotionClassType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType;
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION',  'Amount',   a.SpeedUpAmount
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType;

-- Tier1, land
insert or replace into PolicyModifiers (PolicyType, ModifierId) select
    a.PolicyType,   'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER1'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';

insert or replace into Modifiers (ModifierId,   ModifierType,   SubjectRequirementSetId) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER1',
    'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION',    'BUILDING_IS_BARRACKS_STABLE_MILITARITIC_CITY_STATE'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';

insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER1',   'EraType',  a.EraType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER1',   'UnitPromotionClass',   b.PromotionClassType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER1',   'Amount',   a.SpeedUpPerTier
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';

-- Tier2, land
insert or replace into PolicyModifiers (PolicyType, ModifierId) select
    a.PolicyType,   'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER2'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';

insert or replace into Modifiers (ModifierId,   ModifierType,   SubjectRequirementSetId) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER2',
    'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION',    'BUILDING_IS_ARMORY'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';

insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER2',   'EraType',  a.EraType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER2',   'UnitPromotionClass',   b.PromotionClassType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER2',   'Amount',   a.SpeedUpPerTier
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';

-- Tier3, land
insert or replace into PolicyModifiers (PolicyType, ModifierId) select
    a.PolicyType,   'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER3'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';

insert or replace into Modifiers (ModifierId,   ModifierType,   SubjectRequirementSetId) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER3',
    'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION',    'BUILDING_IS_MILITARY_ACADEMY'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';

insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER3',   'EraType',  a.EraType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER3',   'UnitPromotionClass',   b.PromotionClassType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_LAND_TIER3',   'Amount',   a.SpeedUpPerTier
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Land';

-- Tier1, sea
insert or replace into PolicyModifiers (PolicyType, ModifierId) select
    a.PolicyType,   'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER1'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';

insert or replace into Modifiers (ModifierId,   ModifierType,   SubjectRequirementSetId) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER1',
    'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION',    'BUILDING_IS_LIGHTHOUSE'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';

insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER1',    'EraType',  a.EraType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER1',    'UnitPromotionClass',   b.PromotionClassType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER1',    'Amount',   a.SpeedUpPerTier
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';

-- Tier2, land
insert or replace into PolicyModifiers (PolicyType, ModifierId) select
    a.PolicyType,   'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER2'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';

insert or replace into Modifiers (ModifierId,   ModifierType,   SubjectRequirementSetId) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER2',
    'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION',    'BUILDING_IS_SHIPYARD'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';

insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER2',    'EraType',  a.EraType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER2',    'UnitPromotionClass',   b.PromotionClassType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER2',    'Amount',   a.SpeedUpPerTier
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';

-- Tier3, land
insert or replace into PolicyModifiers (PolicyType, ModifierId) select
    a.PolicyType,   'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER3'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';

insert or replace into Modifiers (ModifierId,   ModifierType,   SubjectRequirementSetId) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER3',
    'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION',    'BUILDING_IS_SEAPORT'
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';

insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER3',    'EraType',  a.EraType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER3',    'UnitPromotionClass',   b.PromotionClassType
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';
insert or replace into ModifierArguments (ModifierId,   Name,   Value) select
    'HD_' || a.PolicyType || '_' || a.EraType || '_' || b.PromotionClassType || '_PRODUCTION_SEA_TIER3',    'Amount',   a.SpeedUpPerTier
from PolicyUnitProductionValidEras a CROSS JOIN PolicyUnitProductionValidClasses b where a.PolicyType = b.PolicyType and b.UnitDomain = 'Sea';

-- Sphinx (Egypt)
-- other basic adjustments are written in UpdateDatabse/DL_Improvements.sql
create temporary table SphinxWonderYields (
	BuildingType text not null,
	YieldType text not null,
	YieldChange int not null,
	primary key (BuildingType, YieldType)
);
insert or replace into SphinxWonderYields
	(BuildingType,	YieldType,	YieldChange)
select
	BuildingType,	YieldType,	YieldChange
from Building_YieldChanges where BuildingType in (select BuildingType from Buildings where IsWonder = 1);
insert or replace into ImprovementModifiers
	(ImprovementType,		ModifierId)
select
	'IMPROVEMENT_SPHINX',	'SPHINX_' || BuildingType || '_' || YieldType
from SphinxWonderYields;
insert or replace into Modifiers
	(ModifierId,										ModifierType,								SubjectRequirementSetId)
select
	'SPHINX_' || BuildingType || '_' || YieldType,		'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLOT_ADJACENT_TO' || BuildingType || '_REQUIREMENTS'
from SphinxWonderYields;
insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
select
	'SPHINX_' || BuildingType || '_' || YieldType,		'YieldType',	YieldType
from SphinxWonderYields;
insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
select
	'SPHINX_' || BuildingType || '_' || YieldType,		'Amount',		YieldChange * 2
from SphinxWonderYields;

-- Royal Society
delete from BuildingModifiers where BuildingType = 'BUILDING_GOV_SCIENCE' and ModifierId = 'GOV_PROJECT_ABILITY';
create temporary table HD_GovScienceBuildingYields (
	BuildingType text not null primary key,
	YieldType text not null,
	Amount int,
	ReplacesBuildingType text,
	ReplacesAmount int,
	ModifierId text
);
-- Initialize
insert or replace into HD_GovScienceBuildingYields
	(BuildingType,	YieldType)
select
	BuildingType,	'YIELD_PRODUCTION'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_CAMPUS';
insert or replace into HD_GovScienceBuildingYields
	(BuildingType,	YieldType)
select
	BuildingType,	'YIELD_SCIENCE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE';
update HD_GovScienceBuildingYields set Amount =	(select YieldChange from Building_YieldChanges
	where BuildingType = HD_GovScienceBuildingYields.BuildingType and YieldType = 'YIELD_PRODUCTION') where YieldType = 'YIELD_SCIENCE';
update HD_GovScienceBuildingYields set Amount =	(select YieldChange from Building_YieldChanges
	where BuildingType = HD_GovScienceBuildingYields.BuildingType and YieldType = 'YIELD_SCIENCE') where YieldType = 'YIELD_PRODUCTION';
-- UB support
update HD_GovScienceBuildingYields set Amount = 0 where Amount is null;
update HD_GovScienceBuildingYields set ReplacesBuildingType = (select ReplacesBuildingType from BuildingReplaces where CivUniqueBuildingType = BuildingType);
with T(BuildingType, Amount) as (select BuildingType, Amount from HD_GovScienceBuildingYields)
update HD_GovScienceBuildingYields set ReplacesAmount = (select Amount from T where T.BuildingType = ReplacesBuildingType);
update HD_GovScienceBuildingYields set ReplacesAmount = 0 where ReplacesAmount is null;
update HD_GovScienceBuildingYields set Amount = Amount - ReplacesAmount;
delete from HD_GovScienceBuildingYields where Amount = 0;
-- Modifiers
update HD_GovScienceBuildingYields set ModifierId = 'GOV_SCIENCE_' || BuildingType || '_' || YieldType;
insert or replace into BuildingModifiers
	(BuildingType,				ModifierId)
select
	'BUILDING_GOV_SCIENCE',		ModifierId
from HD_GovScienceBuildingYields;
insert or replace into Modifiers
	(ModifierId,	ModifierType)
select
	ModifierId,		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
from HD_GovScienceBuildingYields;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'BuildingType',	BuildingType
from HD_GovScienceBuildingYields;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'YieldType',	YieldType
from HD_GovScienceBuildingYields;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'Amount',		Amount
from HD_GovScienceBuildingYields;

-- Regional Range bug fix
--		Let A be a non-regional building and B be a regional building, which are exclusive (defined in MutuallyExclusiveBuildings)
--		When the following conditions are BOTH met:
-- 			There is a Modifier that extends the Regional Range of B, e.g. Rationalism
-- 			The CURRENT yield (including basic yield plus the yields given by EFFECT_ADJUST_BUILDING_YIELD_CHANGE) of A >= the BASIC yield of B
--		Then the bug happens, and the city of A cannot recieve the regional yield of B
-- To fix the bug, rewrite all regional yield by Modifiers. Things to adapt: Policy, Mexico City, Magnus, Watt, England, Forging Iron
-- Record regional range in HD_BuildingRegionalRange
create table if not exists HD_BuildingRegionalRange (
	BuildingType text not null primary key,
	RegionalRange int not null
);
insert or replace into HD_BuildingRegionalRange
	(BuildingType,	RegionalRange)
select
	BuildingType,	RegionalRange
from Buildings where RegionalRange > 0 and BuildingType in (select BuildingType from HD_BuildingTiers);
-- Remove Regional Range from original database
update Buildings set RegionalRange = 0 where BuildingType in (select BuildingType from HD_BuildingRegionalRange);
-- Record regional yields in HD_BuildingRegionalYields
create table if not exists HD_BuildingRegionalYields (
	BuildingType text not null,
	YieldType text not null,
	YieldChange int not null,
	RequiresPower boolean not null default 0,
	ModifierId text,
	primary key (BuildingType, YieldType, RequiresPower)
);
-- Building_YieldChanges
insert or replace into HD_BuildingRegionalYields
	(BuildingType,	YieldType,	YieldChange)
select
	BuildingType,	YieldType,	YieldChange
from Building_YieldChanges where BuildingType in (select BuildingType from HD_BuildingRegionalRange);
-- Building_YieldChangesBonusWithPower
insert or replace into HD_BuildingRegionalYields
	(BuildingType,	YieldType,	YieldChange,	RequiresPower)
select
	BuildingType,	YieldType,	YieldChange,	1
from Building_YieldChangesBonusWithPower where BuildingType in (select BuildingType from HD_BuildingRegionalRange);
-- Amenity without power
insert or replace into HD_BuildingRegionalYields
	(BuildingType,	YieldType,	YieldChange)
select
	BuildingType,	'AMENITY',	Entertainment
from Buildings where Entertainment > 0 and BuildingType in (select BuildingType from HD_BuildingRegionalRange);
-- Amenity with power
insert or replace into HD_BuildingRegionalYields
	(BuildingType,	YieldType,	YieldChange,					RequiresPower)
select
	BuildingType,	'AMENITY',	EntertainmentBonusWithPower,	1
from Buildings_XP2 where BuildingType in (select BuildingType from HD_BuildingRegionalRange);
-- Name Modifiers
update HD_BuildingRegionalYields set ModifierId = BuildingType || '_RIGIONAL_' || YieldType;
update HD_BuildingRegionalYields set ModifierId = ModifierId || '_WITH_POWER' where RequiresPower;
-- Insert Modifiers
insert or replace into BuildingModifiers
	(BuildingType,	ModifierId)
select
	BuildingType,	ModifierId
from HD_BuildingRegionalYields;
insert or replace into Modifiers
	(ModifierId,
	ModifierType,
	OwnerRequirementSetId,
	SubjectRequirementSetId,
	SubjectStackLimit)
select
	ModifierId,
	case when YieldType = 'AMENITY' then 'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY' else 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE' end,
	case when RequiresPower then 'CITY_IS_POWERED' else null end,
	'CITY_CAN_RECIEVE_' || BuildingType || '_REGIONAL_BONUS_REQUIREMENTS',
	1
from HD_BuildingRegionalYields;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'YieldType',	YieldType
from HD_BuildingRegionalYields where YieldType != 'AMENITY';
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'Amount',		YieldChange
from HD_BuildingRegionalYields;
-- Magnus Adaption
insert or replace into GovernorPromotionModifiers
	(GovernorPromotionType,											ModifierId)
select
	'GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION',		ModifierId || '_MAGNUS_ATTACH'
from HD_BuildingRegionalYields;
insert or replace into Modifiers
	(ModifierId,						ModifierType,								SubjectRequirementSetId)
select
	ModifierId || '_MAGNUS_ATTACH',		'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',	'CITY_CAN_GIVE_' || BuildingType || '_REGIONAL_BONUS_TO_MAGNUS_REQUIREMENTS'
from HD_BuildingRegionalYields;
insert or replace into ModifierArguments
	(ModifierId,						Name,			Value)
select
	ModifierId || '_MAGNUS_ATTACH',		'ModifierId',	ModifierId || '_MAGNUS'
from HD_BuildingRegionalYields;
insert or replace into Modifiers
	(ModifierId,
	ModifierType,
	OwnerRequirementSetId,
	SubjectRequirementSetId)
select
	ModifierId || '_MAGNUS',
	case when YieldType = 'AMENITY' then 'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY' else 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE' end,
	case when RequiresPower then 'CITY_IS_POWERED' else null end,
	'CITY_HAS_VERTICAL_INTEGRATION_REQUIREMENTS'
from HD_BuildingRegionalYields;
insert or replace into ModifierArguments
	(ModifierId,				Name,			Value)
select
	ModifierId || '_MAGNUS',	'YieldType',	YieldType
from HD_BuildingRegionalYields where YieldType != 'AMENITY';
insert or replace into ModifierArguments
	(ModifierId,				Name,			Value)
select
	ModifierId || '_MAGNUS',	'Amount',		YieldChange
from HD_BuildingRegionalYields;
-- Reqs & ReqSets
create temporary table HD_BuildingRegionalReqs (
	PropertyName text not null primary key,
	RequirementId text,
	RequirementSetId text
);
insert or replace into HD_BuildingRegionalReqs (PropertyName) select 'CITY_CAN_RECIEVE_' || BuildingType || '_REGIONAL_BONUS' from HD_BuildingRegionalRange;
insert or replace into HD_BuildingRegionalReqs (PropertyName) select 'CITY_CAN_GIVE_' || BuildingType || '_REGIONAL_BONUS_TO_MAGNUS' from HD_BuildingRegionalRange;
update HD_BuildingRegionalReqs set RequirementId = 'REQUIRES_' || PropertyName;
update HD_BuildingRegionalReqs set RequirementSetId = PropertyName || '_REQUIREMENTS';
insert or ignore into Requirements
	(RequirementId,		RequirementType)
select
	RequirementId,		'REQUIREMENT_PLOT_PROPERTY_MATCHES'
from HD_BuildingRegionalReqs;
insert or ignore into RequirementArguments
	(RequirementId,		Name,				Value)
select
	RequirementId,		'PropertyMinimum',	1
from HD_BuildingRegionalReqs;
insert or ignore into RequirementArguments
	(RequirementId,		Name,				Value)
select
	RequirementId,		'PropertyName',		PropertyName
from HD_BuildingRegionalReqs;
insert or ignore into RequirementSets
	(RequirementSetId,	RequirementSetType)
select
	RequirementSetId,	'REQUIREMENTSET_TEST_ALL'
from HD_BuildingRegionalReqs;
insert or ignore into RequirementSetRequirements
	(RequirementSetId,	RequirementId)
select
	RequirementSetId,	RequirementId
from HD_BuildingRegionalReqs;

-- Policy Cards
create table if not exists HD_PolicyRegionalRange (
	PolicyType text not null,
	DistrictType text not null,
	RegionalRange int not null,
	primary key (PolicyType, DistrictType)
);
