-- 激光站项目降价
update Projects set Cost = 600 where ProjectType = 'PROJECT_ORBITAL_LASER';
update Projects set Cost = 600 where ProjectType = 'PROJECT_TERRESTRIAL_LASER';

-- 商港重做
delete from TraitModifiers where ModifierId = 'FREEPORT_TRADER_ATTACH';
delete from BuildingModifiers where ModifierId = 'FREEPORT_TRADE_GOLD';
update Building_YieldChanges set YieldChange = 12 where YieldType = 'YIELD_GOLD' and BuildingType = 'BUILDING_JNR_FREEPORT';
insert or replace into Building_YieldDistrictCopies
	(BuildingType,              OldYieldType,   NewYieldType)
values
	('BUILDING_JNR_FREEPORT',   'YIELD_GOLD',   'YIELD_GOLD');
insert or replace into Modifiers
    (ModifierId,                        ModifierType)
values
    ('FREEPORT_TRADE_ROUTE_CAPACITY',   'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY');
insert or replace into ModifierArguments
    (ModifierId,                        Name,       Value)
values
    ('FREEPORT_TRADE_ROUTE_CAPACITY',   'Amount',   1);
insert or replace into BuildingModifiers
    (BuildingType,              ModifierId)
values
    ('BUILDING_JNR_FREEPORT',   'FREEPORT_TRADE_ROUTE_CAPACITY');

-- 删除手续费
update DiplomaticStateActions set Cost = 0 where DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE' and StateType != 'DIPLO_STATE_DENOUNCED';

-- 海军袭击者晋升树左二与左三互换位置
update UnitPromotions set Level = 3 where UnitPromotionType = 'PROMOTION_LOOT';
update UnitPromotions set Level = 2 where UnitPromotionType = 'PROMOTION_DAMAGE_CONTROL';
delete from UnitPromotionPrereqs where UnitPromotion = 'PROMOTION_LOOT' and PrereqUnitPromotion = 'PROMOTION_SWIFT_KEEL';
delete from UnitPromotionPrereqs where UnitPromotion = 'PROMOTION_DAMAGE_CONTROL' and PrereqUnitPromotion = 'PROMOTION_LOOT';
delete from UnitPromotionPrereqs where UnitPromotion = 'PROMOTION_DAMAGE_CONTROL' and PrereqUnitPromotion = 'PROMOTION_SILENT_RUNNING';
delete from UnitPromotionPrereqs where UnitPromotion = 'PROMOTION_WOLFPACK' and PrereqUnitPromotion = 'PROMOTION_LOOT';
delete from UnitPromotionPrereqs where UnitPromotion = 'PROMOTION_AUTO_SOLICITATION' and PrereqUnitPromotion = 'PROMOTION_DAMAGE_CONTROL';
insert or replace into UnitPromotionPrereqs
    (UnitPromotion, PrereqUnitPromotion)
values
    ('PROMOTION_DAMAGE_CONTROL',	'PROMOTION_SWIFT_KEEL'),
    ('PROMOTION_LOOT',	'PROMOTION_DAMAGE_CONTROL'),
    ('PROMOTION_LOOT',	'PROMOTION_SILENT_RUNNING'),
    ('PROMOTION_WOLFPACK',	'PROMOTION_DAMAGE_CONTROL'),
    ('PROMOTION_AUTO_SOLICITATION',	'PROMOTION_LOOT');

-- 航海卡从探索移动到海军传统
update Policies set PrereqCivic = 'CIVIC_NAVAL_TRADITION' where PolicyType = 'POLICY_NAVIGATION';

-- 教堂和寺庙给的鸽子出口统一
insert or replace into BuildingModifiers
    (BuildingType,              ModifierId)
values
    ('BUILDING_TEMPLE',         'TEMPLE_SETTLER_PURCHASE'),
    ('BUILDING_PRASAT',         'TEMPLE_SETTLER_PURCHASE');
insert or replace into Unit_BuildingPrereqs
    (Unit,                  PrereqBuilding)
values
    ('UNIT_APOSTLE',        'BUILDING_JNR_MONASTERY'),
    ('UNIT_GURU',           'BUILDING_JNR_MONASTERY'),
    ('UNIT_INQUISITOR',     'BUILDING_JNR_MONASTERY'),
    ('UNIT_WARRIOR_MONK',   'BUILDING_JNR_MONASTERY'),
    ('UNIT_APOSTLE',        'BUILDING_STAVE_CHURCH'),
    ('UNIT_GURU',           'BUILDING_STAVE_CHURCH'),
    ('UNIT_INQUISITOR',     'BUILDING_STAVE_CHURCH'),
    ('UNIT_WARRIOR_MONK',   'BUILDING_STAVE_CHURCH');

-- 木板教堂移动到神学
update Buildings set PrereqCivic = 'CIVIC_THEOLOGY' where BuildingType = 'BUILDING_STAVE_CHURCH';

-- 瑞纳4跨国公司金币加成回调到100%
update GlobalParameters set Value = 100 where Name = 'REYNA_CONVERT_PERCENTAGE';

-- 古典提督航海家汉诺: 赠送一艘+2速的海军近战单位, 且所有与该单位编队的单位将继承该桨帆单位的移速
insert or replace into Types (Type, Kind) values ('ABILITY_HANNO', 'KIND_ABILITY');
insert or replace into TypeTags (Type, Tag) values ('ABILITY_HANNO', 'CLASS_NAVAL_MELEE');
insert or replace into UnitAbilities
    (UnitAbilityType,    Description,                        Inactive)
values
    ('ABILITY_HANNO',   'LOC_ABILITY_HANNO_DESCRIPTION',    1);
insert or replace into UnitAbilityModifiers
    (UnitAbilityType,   ModifierId)
values
    ('ABILITY_HANNO',   'HANNO_FREE_UNIT_MOVEMENT_BUFF'),
    ('ABILITY_HANNO',   'ESCORT_MOBILITY_SHARED_MOVEMENT');
update ModifierArguments set Value = 'HANNO_GRANT_ABILITY' where ModifierId = 'GREAT_PERSON_INDIVIDUAL_HANNO_THE_NAVIGATOR_FREE_UNIT' and Name = 'ModifierId';
insert or replace into Modifiers
    (ModifierId,            ModifierType,                           RunOnce,    Permanent)
values
    ('HANNO_GRANT_ABILITY', 'MODIFIER_PLAYER_UNIT_GRANT_ABILITY',   1,          1);
insert or replace into ModifierArguments
    (ModifierId,            Name,           Value)
values
    ('HANNO_GRANT_ABILITY', 'AbilityType',  'ABILITY_HANNO');

-- 情报局改名贸易本埠: +1贸易路线容量, 全国每级商业和港口建筑为本城+4%的金币产出. 本国的国际商路从每个经过的贸易站获得+3金.
-- 原情报局能力给外交办
insert or replace into BuildingModifiers
    (BuildingType,          ModifierId)
select
    'BUILDING_CHANCERY',    ModifierId
from BuildingModifiers where BuildingType = 'BUILDING_GOV_SPIES';
delete from BuildingModifiers where BuildingType = 'BUILDING_GOV_SPIES';
insert or replace into BuildingModifiers
    (BuildingType,          ModifierId)
values
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_TRADE_ROUTE_CAPACITY'),
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_TRADE_ROUTE_YIELD'),
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER1'),
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER2'),
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER3'),
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_GOLD_FROM_HARBOR_TIER1'),
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_GOLD_FROM_HARBOR_TIER2'),
    ('BUILDING_GOV_SPIES',  'GOV_SPIES_GOLD_FROM_HARBOR_TIER3');
insert or replace into Modifiers
    (ModifierId,                                    ModifierType,                                                           SubjectRequirementSetId)
values
    ('GOV_SPIES_TRADE_ROUTE_CAPACITY',              'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',                          null),
    ('GOV_SPIES_TRADE_ROUTE_YIELD',                 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_POST_IN_FOREIGN_CITY',    null),
    ('GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER1',    'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',                      'HD_PLAYER_HAS_COMMERCIAL_HUB_TIER1'),
    ('GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER2',    'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',                      'HD_PLAYER_HAS_COMMERCIAL_HUB_TIER2'),
    ('GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER3',    'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',                      'HD_PLAYER_HAS_COMMERCIAL_HUB_TIER3'),
    ('GOV_SPIES_GOLD_FROM_HARBOR_TIER1',            'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',                      'HD_PLAYER_HAS_HARBOR_TIER1'),
    ('GOV_SPIES_GOLD_FROM_HARBOR_TIER2',            'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',                      'HD_PLAYER_HAS_HARBOR_TIER2'),
    ('GOV_SPIES_GOLD_FROM_HARBOR_TIER3',            'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',                      'HD_PLAYER_HAS_HARBOR_TIER3');
insert or replace into ModifierArguments
    (ModifierId,                                    Name,           Value)
values
    ('GOV_SPIES_TRADE_ROUTE_CAPACITY',              'Amount',       1),
    ('GOV_SPIES_TRADE_ROUTE_YIELD',                 'YieldType',    'YIELD_GOLD'),
    ('GOV_SPIES_TRADE_ROUTE_YIELD',                 'Amount',       3),
    ('GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER1',    'YieldType',    'YIELD_GOLD'),
    ('GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER1',    'Amount',       4),
    ('GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER2',    'YieldType',    'YIELD_GOLD'),
    ('GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER2',    'Amount',       4),
    ('GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER3',    'YieldType',    'YIELD_GOLD'),
    ('GOV_SPIES_GOLD_FROM_COMMERCIAL_HUB_TIER3',    'Amount',       4),
    ('GOV_SPIES_GOLD_FROM_HARBOR_TIER1',            'YieldType',    'YIELD_GOLD'),
    ('GOV_SPIES_GOLD_FROM_HARBOR_TIER1',            'Amount',       4),
    ('GOV_SPIES_GOLD_FROM_HARBOR_TIER2',            'YieldType',    'YIELD_GOLD'),
    ('GOV_SPIES_GOLD_FROM_HARBOR_TIER2',            'Amount',       4),
    ('GOV_SPIES_GOLD_FROM_HARBOR_TIER3',            'YieldType',    'YIELD_GOLD'),
    ('GOV_SPIES_GOLD_FROM_HARBOR_TIER3',            'Amount',       4);
insert or replace into RequirementSets
    (RequirementSetId,                      RequirementSetType)
values
    ('HD_PLAYER_HAS_COMMERCIAL_HUB_TIER1',  'REQUIREMENTSET_TEST_ANY'),
    ('HD_PLAYER_HAS_COMMERCIAL_HUB_TIER2',  'REQUIREMENTSET_TEST_ANY'),
    ('HD_PLAYER_HAS_COMMERCIAL_HUB_TIER3',  'REQUIREMENTSET_TEST_ANY'),
    ('HD_PLAYER_HAS_HARBOR_TIER1',          'REQUIREMENTSET_TEST_ANY'),
    ('HD_PLAYER_HAS_HARBOR_TIER2',          'REQUIREMENTSET_TEST_ANY'),
    ('HD_PLAYER_HAS_HARBOR_TIER3',          'REQUIREMENTSET_TEST_ANY');
create temporary table GovSpiesBuffedBuildings (BuildingType text not null primary key);
insert into GovSpiesBuffedBuildings (BuildingType) select BuildingType from Buildings where (PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' or PrereqDistrict = 'DISTRICT_HARBOR') and BuildingType not like 'BUILDING_MARACANA_DUMMY_%' and IsWonder = 0 and InternalOnly = 0;
insert or replace into BuildingModifiers
    (BuildingType,          ModifierId)
select
    'BUILDING_GOV_SPIES',   'GOV_SPIES_' || BuildingType || '_GRANT_GOLD_PERCENTAGE'
from GovSpiesBuffedBuildings;
insert or replace into Modifiers
    (ModifierId,                                                ModifierType,                                       SubjectRequirementSetId)
select
    'GOV_SPIES_' || BuildingType || '_GRANT_GOLD_PERCENTAGE',  'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER', 'HD_CITY_HAS_' || BuildingType
from GovSpiesBuffedBuildings;
insert or replace into ModifierArguments
    (ModifierId,                                                Name,           Value)
select
    'GOV_SPIES_' || BuildingType || '_GRANT_GOLD_PERCENTAGE',   'Amount',       4
from GovSpiesBuffedBuildings;
insert or replace into ModifierArguments
    (ModifierId,                                                Name,           Value)
select
    'GOV_SPIES_' || BuildingType || '_GRANT_GOLD_PERCENTAGE',   'YieldType',    'YIELD_GOLD'
from GovSpiesBuffedBuildings;
insert or replace into RequirementSets
    (RequirementSetId,              RequirementSetType)
select
    'HD_CITY_HAS_' || BuildingType, 'REQUIREMENTSET_TEST_ALL'
from GovSpiesBuffedBuildings;
insert or replace into RequirementSetRequirements
    (RequirementSetId,              RequirementId)
select
    'HD_CITY_HAS_' || BuildingType, 'REQUIRES_CITY_HAS_' || BuildingType
from GovSpiesBuffedBuildings;

-- 以下效果为"全国每个等级的商业和港口建筑为本城 +4% [ICON_GOLD] 金币产出。"
--insert or replace into RequirementSetRequirements
--    (RequirementSetId,                      RequirementId)
--select
--    'HD_PLAYER_HAS_COMMERCIAL_HUB_TIER1',   'REQUIRES_PLAYER_HAS_' || BuildingType
--from Buildings where PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB' and BuildingType in GovSpiesBuffedBuildings and BuildingType not in (select Building from BuildingPrereqs);
--insert or replace into RequirementSetRequirements
--    (RequirementSetId,                      RequirementId)
--select
--    'HD_PLAYER_HAS_COMMERCIAL_HUB_TIER2',   'REQUIRES_PLAYER_HAS_' || BuildingType
--from Buildings where BuildingType in GovSpiesBuffedBuildings and BuildingType in (select Building from BuildingPrereqs where PrereqBuilding = 'BUILDING_MARKET');
--insert or replace into RequirementSetRequirements
--    (RequirementSetId,                      RequirementId)
--select
--    'HD_PLAYER_HAS_COMMERCIAL_HUB_TIER3',   'REQUIRES_PLAYER_HAS_' || BuildingType
--from Buildings where BuildingType in GovSpiesBuffedBuildings and BuildingType in (select Building from BuildingPrereqs where PrereqBuilding = 'BUILDING_BANK');
--insert or replace into RequirementSetRequirements
--    (RequirementSetId,                      RequirementId)
--select
--    'HD_PLAYER_HAS_HARBOR_TIER1',   'REQUIRES_PLAYER_HAS_' || BuildingType
--from Buildings where PrereqDistrict = 'DISTRICT_HARBOR' and BuildingType in GovSpiesBuffedBuildings and BuildingType not in (select Building from BuildingPrereqs);
--insert or replace into RequirementSetRequirements
--    (RequirementSetId,                      RequirementId)
--select
--    'HD_PLAYER_HAS_HARBOR_TIER2',   'REQUIRES_PLAYER_HAS_' || BuildingType
--from Buildings where BuildingType in GovSpiesBuffedBuildings and BuildingType in (select Building from BuildingPrereqs where PrereqBuilding = 'BUILDING_LIGHTHOUSE');
--insert or replace into RequirementSetRequirements
--    (RequirementSetId,                      RequirementId)
--select
--    'HD_PLAYER_HAS_HARBOR_TIER3',   'REQUIRES_PLAYER_HAS_' || BuildingType
--from Buildings where BuildingType in GovSpiesBuffedBuildings and BuildingType in (select Building from BuildingPrereqs where PrereqBuilding = 'BUILDING_SHIPYARD');



-- 自由探索: 多10%尤里卡, 每个不同的区域和建筑给1瓶
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_SCIENTIFIC' and ModifierId = 'COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB';
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_SCIENTIFIC' and ModifierId = 'COMMEMORATION_SCIENTIFIC_GA_HARBOR';

create temporary table RealBuildings (BuildingType text not null primary key);
insert or replace into RealBuildings (BuildingType) select BuildingType from Buildings where BuildingType != 'BUILDING_CANAL' and BuildingType not like 'BUILDING_MARACANA_DUMMY_%' and IsWonder = 0 and InternalOnly = 0 and PrereqDistrict is not null;
create temporary table BuffedObjects (ObjectType text not null primary key);
insert or replace into BuffedObjects (ObjectType) select BuildingType from RealBuildings;
insert or replace into BuffedObjects (ObjectType) select DistrictType from Districts;
insert or replace into Requirements
    (RequirementId,                         RequirementType)
select
    'REQUIRES_PLAYER_HAS_' || BuildingType, 'REQUIREMENT_PLAYER_HAS_BUILDING'
from RealBuildings;
insert or replace into Requirements
    (RequirementId,                         RequirementType)
select
    'REQUIRES_PLAYER_HAS_' || DistrictType, 'REQUIREMENT_PLAYER_HAS_DISTRICT'
from Districts;
insert or replace into RequirementArguments
    (RequirementId,                         Name,           Value)
select
    'REQUIRES_PLAYER_HAS_' || BuildingType, 'BuildingType', BuildingType
from RealBuildings;
insert or replace into RequirementArguments
    (RequirementId,                         Name,           Value)
select
    'REQUIRES_PLAYER_HAS_' || DistrictType, 'DistrictType', DistrictType
from Districts;
insert or replace into RequirementSets
    (RequirementSetId,                             RequirementSetType)
select
    'PLAYER_HAS_GOLDEN_AGE_AND_' || ObjectType,    'REQUIREMENTSET_TEST_ALL'
from BuffedObjects;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                             RequirementId)
select
    'PLAYER_HAS_GOLDEN_AGE_AND_' || ObjectType,    'REQUIRES_PLAYER_HAS_' || ObjectType
from BuffedObjects;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                             RequirementId)
select
    'PLAYER_HAS_GOLDEN_AGE_AND_' || ObjectType,    'REQUIRES_PLAYER_HAS_GOLDEN_AGE'
from BuffedObjects;
insert or replace into CommemorationModifiers
    (CommemorationType,         ModifierId)
select
    'COMMEMORATION_SCIENTIFIC', 'COMMEMORATION_SCIENTIFIC_' || ObjectType || '_SCIENCE'
from BuffedObjects;
insert or replace into Modifiers
    (ModifierId,                                              ModifierType,                                               OwnerRequirementSetId)
select
    'COMMEMORATION_SCIENTIFIC_' || ObjectType || '_SCIENCE',  'MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_CITY_YIELD_CHANGE',    'PLAYER_HAS_GOLDEN_AGE_AND_' || ObjectType
from BuffedObjects;
insert or replace into ModifierArguments
    (ModifierId,                                              Name,           Value)
select
    'COMMEMORATION_SCIENTIFIC_' || ObjectType || '_SCIENCE',  'YieldType',    'YIELD_SCIENCE'
from BuffedObjects;
insert or replace into ModifierArguments
    (ModifierId,                                              Name,           Value)
select
    'COMMEMORATION_SCIENTIFIC_' || ObjectType || '_SCIENCE',  'Amount',       1
from BuffedObjects;
-- 商业 & 港口地基回调
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'HD_Harbor_City_Gold';
insert or replace into District_Adjacencies
	(DistrictType,					YieldChangeId)
values
    ('DISTRICT_COMMERCIAL_HUB',		'District_Gold_City_Center');
update Adjacency_YieldChanges set YieldChange = 2, ObsoleteCivic = null where ID = 'HD_Commercial_Luxury_Gold';
delete from Adjacency_YieldChanges where ID = 'HD_Commercial_Luxury_Gold_Late';

-- 殖民地办事处10%总粮回调为10%余粮
update Modifiers set ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH' where ModifierId = 'COLONIALOFFICES_FOREIGNFOODPERCENTAGE';

-- 拥有姆班赞的城市享受神权的人头鸽收益
insert or replace into Requirements
    (RequirementId,                             RequirementType)
values
    ('REQUIRES_CITY_HAS_DISTRICT_MBANZA_FIXED', 'REQUIREMENT_REQUIREMENTSET_IS_MET');
    insert or replace into RequirementArguments
    (RequirementId,                             Name,               Value)
values
    ('REQUIRES_CITY_HAS_DISTRICT_MBANZA_FIXED', 'RequirementSetId', 'CITY_HAS_DISTRICT_MBANZA_FIXED');
insert or replace into RequirementSets
    (RequirementSetId,                  RequirementSetType)
values
    ('CITY_HAS_HOLY_SITE_OR_MBANZA',    'REQUIREMENTSET_TEST_ANY'),
    ('CITY_HAS_DISTRICT_MBANZA_FIXED',  'REQUIREMENTSET_TEST_ALL');
insert or replace into RequirementSetRequirements
    (RequirementSetId,                  RequirementId)
values
    ('CITY_HAS_HOLY_SITE_OR_MBANZA',    'REQUIRES_CITY_HAS_DISTRICT_HOLY_SITE'),
    ('CITY_HAS_HOLY_SITE_OR_MBANZA',    'REQUIRES_CITY_HAS_DISTRICT_MBANZA_FIXED'),
    ('CITY_HAS_DISTRICT_MBANZA_FIXED',  'REQUIRES_CITY_HAS_DISTRICT_MBANZA'),
    ('CITY_HAS_DISTRICT_MBANZA_FIXED',  'PLAYER_IS_CIVILIZATION_KONGO');
update Modifiers set SubjectRequirementSetId = 'CITY_HAS_HOLY_SITE_OR_MBANZA' where ModifierId = 'THEOCRACY_RELIGIOUS_PEOPLE';

-- 米庙改为圣地地基2粮, 每级建筑4粮
delete from BuildingModifiers where BuildingType = 'BUILDING_MEENAKSHI_TEMPLE' and ModifierId = 'MEENAKSHI_SHRINE_FOOD';
delete from BuildingModifiers where BuildingType = 'BUILDING_MEENAKSHI_TEMPLE' and ModifierId = 'MEENAKSHI_TEMPLE_FOOD';
insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
values
    ('BUILDING_MEENAKSHI_TEMPLE',   'MEENAKSHI_TEMPLE_ATTACH_HOLY_SITE_FOOD');
insert or replace into Modifiers
    (ModifierId,                                    ModifierType)
values
    ('MEENAKSHI_TEMPLE_ATTACH_HOLY_SITE_FOOD',     'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER'),
    ('MEENAKSHI_TEMPLE_HOLY_SITE_FOOD',            'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE');
insert or replace into ModifierArguments
    (ModifierId,                                Name,           Value)
values
    ('MEENAKSHI_TEMPLE_ATTACH_HOLY_SITE_FOOD',  'ModifierId',   'MEENAKSHI_TEMPLE_HOLY_SITE_FOOD'),
    ('MEENAKSHI_TEMPLE_HOLY_SITE_FOOD',         'YieldType',    'YIELD_FOOD'),
    ('MEENAKSHI_TEMPLE_HOLY_SITE_FOOD',         'Amount',       2);
create temporary table HolySiteBuildings (BuildingType text not null primary key);
insert into HolySiteBuildings (BuildingType) select BuildingType from Buildings where PrereqDistrict = 'DISTRICT_HOLY_SITE' and BuildingType not like 'BUILDING_MARACANA_DUMMY_%' and IsWonder = 0 and InternalOnly = 0;
insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
select
    'BUILDING_MEENAKSHI_TEMPLE',   'MEENAKSHI_TEMPLE_' || BuildingType || '_FOOD'
from HolySiteBuildings;
insert or replace into Modifiers
    (ModifierId,                                        ModifierType)
select
    'MEENAKSHI_TEMPLE_' || BuildingType || '_FOOD',    'MODIFIER_BUILDING_YIELD_CHANGE'
from HolySiteBuildings;
insert or replace into ModifierArguments
    (ModifierId,                                        Name,           Value)
select
    'MEENAKSHI_TEMPLE_' || BuildingType || '_FOOD',    'YieldType',     'YIELD_FOOD'
from HolySiteBuildings;
insert or replace into ModifierArguments
    (ModifierId,                                        Name,           Value)
select
    'MEENAKSHI_TEMPLE_' || BuildingType || '_FOOD',    'Amount',        4
from HolySiteBuildings;
insert or replace into ModifierArguments
    (ModifierId,                                        Name,           Value)
select
    'MEENAKSHI_TEMPLE_' || BuildingType || '_FOOD',    'BuildingType',  BuildingType
from HolySiteBuildings;