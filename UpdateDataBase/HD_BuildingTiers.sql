-- At LoadOrder 16001
create table if not exists HD_BuildingTiers (
    BuildingType text not null primary key,
    PrereqDistrict text not null,
    Tier int not null default 1,
    IsUB int not null default 0
);

-- Initialize
insert or replace into HD_BuildingTiers
    (BuildingType,  PrereqDistrict,    IsUB)
select
    BuildingType,   PrereqDistrict,     TraitType is not null
from Buildings where IsWonder = 0 and InternalOnly = 0 and PrereqDistrict is not null;
update HD_BuildingTiers set Tier = 0 where PrereqDistrict = 'DISTRICT_CITY_CENTER';
update HD_BuildingTiers set Tier = 2 where BuildingType in (select Building from BuildingPrereqs where PrereqBuilding in (select BuildingType from HD_BuildingTiers where Tier = 1));
update HD_BuildingTiers set Tier = 3 where BuildingType in (select Building from BuildingPrereqs where PrereqBuilding in (select BuildingType from HD_BuildingTiers where Tier = 2));
update HD_BuildingTiers set Tier = 4 where BuildingType in (select Building from BuildingPrereqs where PrereqBuilding in (select BuildingType from HD_BuildingTiers where Tier = 3));

-- Reqs
insert or replace into RequirementSets
    (RequirementSetId,                                                                          RequirementSetType)
select
    distinct 'CITY_HAS_' || PrereqDistrict || '_TIER_' || Tier || '_BUILDING_REQUIREMENTS',     'REQUIREMENTSET_TEST_ANY'
from HD_BuildingTiers;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                                                                          RequirementId)
select
    'CITY_HAS_' || PrereqDistrict || '_TIER_' || Tier || '_BUILDING_REQUIREMENTS',              'REQUIRES_CITY_HAS_' || BuildingType
from HD_BuildingTiers;
insert or replace into Requirements
    (RequirementId,                                                                             RequirementType)
select
    distinct 'REQUIRES_CITY_HAS_' || PrereqDistrict || '_TIER_' || Tier || '_BUILDING',         'REQUIREMENT_REQUIREMENTSET_IS_MET'
from HD_BuildingTiers;
insert or replace into RequirementArguments
    (RequirementId,                                                                     Name,               Value)
select
    distinct 'REQUIRES_CITY_HAS_' || PrereqDistrict || '_TIER_' || Tier || '_BUILDING', 'RequirementSetId', 'CITY_HAS_' || PrereqDistrict || '_TIER_' || Tier || '_BUILDING_REQUIREMENTS'
from HD_BuildingTiers;

-- City State
delete from TraitModifiers where TraitType in (select TraitType from CSE_ClassTypes);
create table if not exists HD_CityStateBuffedBuildings (
    TraitType text not null,
    YieldType text not null,
    BuildingType text not null,
    Amount int default 0,
    Level text default null,
    AttachId text default null,
    ModifierId text default null,
    primary key (TraitType, YieldType, BuildingType)
);

-- City State buffed Buildings
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                     YieldType,          BuildingType,   Amount)
select
    'MINOR_CIV_SCIENTIFIC_TRAIT',   'YIELD_SCIENCE',    BuildingType,   Tier
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_CAMPUS' and IsUB = 0;
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                     YieldType,          BuildingType,   Amount)
select
    'MINOR_CIV_CULTURAL_TRAIT',     'YIELD_CULTURE',    BuildingType,   Tier
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_THEATER' and IsUB = 0;
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                     YieldType,          BuildingType,   Amount)
select
    'MINOR_CIV_RELIGIOUS_TRAIT',    'YIELD_FAITH',      BuildingType,   Tier
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_HOLY_SITE' and IsUB = 0;
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                     YieldType,          BuildingType,   Amount)
select
    'MINOR_CIV_TRADE_TRAIT',        'YIELD_GOLD',       BuildingType,   Tier
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' and IsUB = 0;
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                     YieldType,          BuildingType,   Amount)
select
    'MINOR_CIV_CSE_MARITIME_TRAIT', 'YIELD_GOLD',       BuildingType,   Tier
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_HARBOR' and IsUB = 0;
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                             YieldType,      BuildingType,   Amount)
select
    'MINOR_CIV_CSE_AGRICULTURAL_TRAIT',     'YIELD_FOOD',   BuildingType,   Tier
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_AQUEDUCT' and IsUB = 0 and 'MINOR_CIV_CSE_AGRICULTURAL_TRAIT' in (select Type from Types);
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                     YieldType,              BuildingType,   Amount)
select
    'MINOR_CIV_MILITARISTIC_TRAIT', 'UNIT_PRODUCTION',      BuildingType,   Tier
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and IsUB = 0;
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                     YieldType,              BuildingType,   Amount)
select
    'MINOR_CIV_INDUSTRIAL_TRAIT',   'BUILDING_PRODUCTION',  BuildingType,   Tier
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and IsUB = 0;
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                     YieldType,              BuildingType,   Amount)
select
    'MINOR_CIV_INDUSTRIAL_TRAIT',   'DISTRICT_PRODUCTION',  BuildingType,   Tier
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and IsUB = 0;
-- Agricultural City States buff sewer with district expansion not enabled.
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,                             YieldType,      BuildingType,   Amount)
select
    'MINOR_CIV_CSE_AGRICULTURAL_TRAIT',     'YIELD_FOOD',   BuildingType,   2
from Buildings where BuildingType = 'BUILDING_SEWER' and PrereqDistrict = 'DISTRICT_CITY_CENTER' and 'MINOR_CIV_CSE_AGRICULTURAL_TRAIT' in (select Type from Types);
-- Trade City States buff Harbor buildings with Maritime not enabled.
update HD_CityStateBuffedBuildings set TraitType = 'MINOR_CIV_TRADE_TRAIT' where TraitType = 'MINOR_CIV_CSE_MARITIME_TRAIT' and TraitType not in (select Type from Types);
-- Diplomatic Quater buildings if Ethiopia enabled
insert or replace into HD_CityStateBuffedBuildings
    (TraitType, YieldType,  BuildingType,   Amount)
select
    TraitType,  YieldType,  BuildingType,   Tier + 1
from ((select distinct TraitType, YieldType from HD_CityStateBuffedBuildings)
left outer join (select BuildingType, Tier from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_DIPLOMATIC_QUARTER' and IsUB = 0));
-- Palace
insert or replace into HD_CityStateBuffedBuildings
    (TraitType,         YieldType,  BuildingType,       Amount)
select
    distinct TraitType, YieldType,  'BUILDING_PALACE',  1
from HD_CityStateBuffedBuildings;

-- stores Influence Level
update HD_CityStateBuffedBuildings set Level = 'SMALL'  where Amount = 1;
update HD_CityStateBuffedBuildings set Level = 'MEDIUM' where Amount = 2;
update HD_CityStateBuffedBuildings set Level = 'LARGE'  where Amount = 3;
delete from HD_CityStateBuffedBuildings where Level is null;
-- Agricultural City States adjusts
update HD_CityStateBuffedBuildings set Level = 'LARGE'  where Level = 'MEDIUM'  and YieldType = 'YIELD_FOOD' and BuildingType != 'BUILDING_CONSULATE';
update HD_CityStateBuffedBuildings set Level = 'MEDIUM' where Level = 'SMALL'   and YieldType = 'YIELD_FOOD' and BuildingType != 'BUILDING_PALACE';
-- double gold yield
update HD_CityStateBuffedBuildings set Amount = Amount * 2 where YieldType = 'YIELD_GOLD';

-- City State Trait Modifiers
update HD_CityStateBuffedBuildings set AttachId = TraitType || '_' || BuildingType || '_' || YieldType;
update HD_CityStateBuffedBuildings set ModifierId = AttachId || '_MODIFIER';
insert or replace into TraitModifiers
    (TraitType, ModifierId)
select
    TraitType,  AttachId
from HD_CityStateBuffedBuildings;
insert or replace into Modifiers
    (ModifierId,    ModifierType,                           SubjectRequirementSetId)
select
    AttachId,       'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_' || Level || '_INFLUENCE'
from HD_CityStateBuffedBuildings;
insert or replace into ModifierArguments
    (ModifierId,    Name,           Value)
select
    AttachId,       'ModifierId',   ModifierId
from HD_CityStateBuffedBuildings;
-- YieldChange
insert or replace into Modifiers
    (ModifierId,    ModifierType)
select
    ModifierId,     'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
from HD_CityStateBuffedBuildings where YieldType in (select YieldType from Yields);
insert or replace into ModifierArguments
    (ModifierId,    Name,           Value)
select
    ModifierId,    'YieldType',    YieldType
from HD_CityStateBuffedBuildings where YieldType in (select YieldType from Yields);
insert or replace into ModifierArguments
    (ModifierId,    Name,           Value)
select
    ModifierId,    'BuildingType', BuildingType
from HD_CityStateBuffedBuildings where YieldType in (select YieldType from Yields);
-- non-YieldChange
insert or replace into Modifiers
    (ModifierId,    ModifierType,                                                   SubjectRequirementSetId)
select
    ModifierId,    'MODIFIER_PLAYER_CITIES_ADJUST_' || YieldType || '_CHANGE',     'CITY_HAS_' || BuildingType || '_REQUIREMENTS'
from HD_CityStateBuffedBuildings where YieldType not in (select YieldType from Yields);
-- Amount
insert or replace into ModifierArguments
    (ModifierId,    Name,           Value)
select
    ModifierId,    'Amount',       Amount
from HD_CityStateBuffedBuildings;
-- Agricultural City States buff Aqueduct with district expansion not enabled.
insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
select
    'MINOR_CIV_CSE_AGRICULTURAL_TRAIT',     'MINOR_CIV_CSE_AGRICULTURAL_TRAIT_DISTRICT_AQUEDUCT_YIELD_FOOD'
from Buildings where BuildingType = 'BUILDING_SEWER' and PrereqDistrict = 'DISTRICT_CITY_CENTER' and 'MINOR_CIV_CSE_AGRICULTURAL_TRAIT' in (select Type from Types);;
insert or replace into Modifiers
    (ModifierId,                                                                ModifierType,                                       SubjectRequirementSetId)
values
    ('MINOR_CIV_CSE_AGRICULTURAL_TRAIT_DISTRICT_AQUEDUCT_YIELD_FOOD',           'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_HAS_MEDIUM_INFLUENCE'),
    ('MINOR_CIV_CSE_AGRICULTURAL_TRAIT_DISTRICT_AQUEDUCT_YIELD_FOOD_MODIFIER',  'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',    'DISTRICT_IS_DISTRICT_AQUEDUCT_REQUIREMENTS');
insert or replace into ModifierArguments
    (ModifierId,                                                                Name,           Value)
values
    ('MINOR_CIV_CSE_AGRICULTURAL_TRAIT_DISTRICT_AQUEDUCT_YIELD_FOOD',           'ModifierId',   'MINOR_CIV_CSE_AGRICULTURAL_TRAIT_DISTRICT_AQUEDUCT_YIELD_FOOD_MODIFIER'),
    ('MINOR_CIV_CSE_AGRICULTURAL_TRAIT_DISTRICT_AQUEDUCT_YIELD_FOOD_MODIFIER',  'YieldType',    'YIELD_FOOD'),
    ('MINOR_CIV_CSE_AGRICULTURAL_TRAIT_DISTRICT_AQUEDUCT_YIELD_FOOD_MODIFIER',  'Amount',       1);