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
    ('DISTRICT_COMMERCIAL_HUB',		'District_Gold_City_Center'),
    ('DISTRICT_SUGUBA',		        'District_Gold_City_Center');
update Adjacency_YieldChanges set YieldChange = 2, ObsoleteCivic = null where ID = 'HD_Commercial_Luxury_Gold';
delete from District_Adjacencies where YieldChangeId = 'HD_Commercial_Luxury_Gold_Late';

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
    (ModifierId,                                    ModifierType,                                           SubjectRequirementSetId)
values
    ('MEENAKSHI_TEMPLE_ATTACH_HOLY_SITE_FOOD',     'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',             'DISTRICT_IS_HOLY_SITE'),
    ('MEENAKSHI_TEMPLE_HOLY_SITE_FOOD',            'MODIFIER_PLAYER_DISTRICT_ADJUST_BASE_YIELD_CHANGE',     null);

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
    'MEENAKSHI_TEMPLE_' || BuildingType || '_FOOD',    'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
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

-- 使者全面回调136系统
-- 城邦需求
update GlobalParameters set Value = 1 where Name = 'INFLUENCE_TOKENS_MINIMUM_FOR_SMALL_INFLUENCE';
update GlobalParameters set Value = 1 where Name = 'INFLUENCE_TOKENS_MINIMUM_FOR_MEDIUM_INFLUENCE';
update GlobalParameters set Value = 3 where Name = 'INFLUENCE_TOKENS_MINIMUM_FOR_SUZERAIN';
update GlobalParameters set Value = 3 where Name = 'INFLUENCE_TOKENS_MINIMUM_FOR_LARGE_INFLUENCE';
update GlobalParameters set Value = 6 where Name = 'INFLUENCE_TOKENS_MINIMUM_FOR_LARGEST_INFLUENCE';
update RequirementArguments set Value = 1 where RequirementId = 'REQUIRES_PLAYER_HAS_SMALL_INFLUENCE' and Name = 'MinimumTokens';
update RequirementArguments set Value = 1 where RequirementId = 'REQUIRES_PLAYER_HAS_MEDIUM_INFLUENCE' and Name = 'MinimumTokens';
update RequirementArguments set Value = 3 where RequirementId = 'REQUIRES_PLAYER_HAS_LARGE_INFLUENCE' and Name = 'MinimumTokens';
update RequirementArguments set Value = 6 where RequirementId = 'REQUIRES_PLAYER_HAS_LARGEST_INFLUENCE' and Name = 'MinimumTokens';
-- 市政树上的使者分布
update CivicModifiers set ModifierId = 'CIVIC_AWARD_ONE_INFLUENCE_TOKEN' where ModifierId = 'CIVIC_AWARD_TWO_INFLUENCE_TOKENS';
update CivicModifiers set ModifierId = 'CIVIC_AWARD_TWO_INFLUENCE_TOKENS' where ModifierId = 'CIVIC_AWARD_THREE_INFLUENCE_TOKENS' and (CivicType = 'CIVIC_NATIONALISM' or CivicType = 'CIVIC_OPERA_BALLET' or CivicType = 'CIVIC_SCORCHED_EARTH' or CivicType = 'CIVIC_NATURAL_HISTORY');
-- 伟人的使者
update ModifierArguments set Value = 1 where ModifierId = 'GREATPERSON_INFLUENCE_TOKENS_SMALL' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'GREATPERSON_INFLUENCE_TOKENS_MEDIUM' and Name = 'Amount';
update GreatPersonIndividuals set ActionCharges = 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ANA_NZINGA';
-- 城邦效果调整
-- 加的夫
update ModifierArguments set Value = 0 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_LIGHTHOUSE' and Name = 'Amount';
-- 奥克兰
insert or replace into TraitModifiers
    (TraitType,                     ModifierId)
values
    ('MINOR_CIV_AUCKLAND_TRAIT',    'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_BASE'),
    ('MINOR_CIV_AUCKLAND_TRAIT',    'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL');
insert or replace into RequirementSets
    (RequirementSetId,                                      RequirementSetType)
values
	('PLOT_HAS_SHALLOW_WATER_AND_STEAM_POWER_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');
insert or replace into RequirementSetRequirements(RequirementSetId,RequirementId)values
	('PLOT_HAS_SHALLOW_WATER_AND_STEAM_POWER_REQUIREMENTS',	'REQUIRES_PLOT_HAS_SHALLOW_WATER'),
	('PLOT_HAS_SHALLOW_WATER_AND_STEAM_POWER_REQUIREMENTS',	'HD_REQUIRES_PLAYER_HAS_TECH_STEAM_POWER');
update Modifiers set SubjectRequirementSetId = 'PLOT_HAS_SHALLOW_WATER_AND_STEAM_POWER_REQUIREMENTS' where ModifierId = 'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL';
-- 拜科努尔
delete from TraitModifiers where TraitType = 'MINOR_CIV_HONG_KONG_TRAIT' and ModifierId = 'MINOR_CIV_HONG_KONG_CAMPUS_PRODUCTION_BONUS';
-- 布鲁塞尔
update ModifierArguments set Value = 15 where ModifierId = 'MINOR_CIV_BRUSSELS_WONDER_PRODUCTION_BONUS' and Name = 'Amount';
-- 约翰内斯堡
delete from TraitModifiers where TraitType = 'MINOR_CIV_JOHANNESBURG_TRAIT' and ModifierId = 'MINOR_CIV_JOHANNESBURG_UNIQUE_INFLUENCE_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_JOHANNESBURG_TRAIT' and ModifierId = 'MINOR_CIV_JOHANNESBURG_UNIQUE_INFLUENCE_BONUS_LATE';
create temporary table 'JohannesburgImprovementType'(
    ImprovementType TEXT not null primary key
);
insert into JohannesburgImprovementType values
    ('IMPROVEMENT_FARM'),
    ('IMPROVEMENT_PLANTATION'),
    ('IMPROVEMENT_CAMP'),
    ('IMPROVEMENT_PASTURE'),
    ('IMPROVEMENT_MINE'),
    ('IMPROVEMENT_QUARRY'),
    ('IMPROVEMENT_LUMBER_MILL');
insert or ignore into RequirementSets(RequirementSetId, 						RequirementSetType) 
	select 'HD_REQUIRES_CITY_HAS_' || imps.ImprovementType || '_OVER_RESOURCES',	'REQUIREMENTSET_TEST_ANY'
	from Improvements imps, Improvement_ValidResources ivr where imps.ImprovementType = ivr.ImprovementType;
insert or ignore into RequirementSetRequirements(RequirementSetId,						RequirementId)
	select 'HD_REQUIRES_CITY_HAS_' || imps.ImprovementType || '_OVER_RESOURCES', 'HD_REQUIRES_CITY_HAS_IMPROVED_' || ivr.ResourceType
	from Improvements imps, Improvement_ValidResources ivr where imps.ImprovementType = ivr.ImprovementType;
insert or ignore into TraitModifiers(TraitType,		ModifierId)
    select 'MINOR_CIV_JOHANNESBURG_TRAIT', 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType
    from JohannesburgImprovementType;
insert or ignore into Modifiers(ModifierId,		ModifierType,   SubjectRequirementSetId)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType, 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_IS_SUZERAIN'
    from JohannesburgImprovementType;
insert or ignore into Modifiers(ModifierId,		ModifierType,   SubjectRequirementSetId)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType||'_MODIFIER', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'HD_REQUIRES_CITY_HAS_' || ImprovementType || '_OVER_RESOURCES'
    from JohannesburgImprovementType;
insert or ignore into ModifierArguments(ModifierId,                            Name,   Value)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType, 'ModifierId' , 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType||'_MODIFIER'
    from JohannesburgImprovementType;
insert or ignore into ModifierArguments(ModifierId,                            Name,   Value)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType||'_MODIFIER',  'YieldType', 'YIELD_PRODUCTION'
    from JohannesburgImprovementType;
insert or ignore into ModifierArguments(ModifierId,                            Name,   Value)
    select 'MINOR_CIV_JOHANNESBURG_PRODUCTION_'||ImprovementType||'_MODIFIER',  'Amount', '1'
    from JohannesburgImprovementType;
-- 哈瓦那
delete from TraitModifiers where TraitType = 'MINOR_CIV_CSE_HAVANA_TRAIT' and ModifierId = 'MINOR_CIV_CSE_HAVANA_CULTURE_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_CSE_HAVANA_TRAIT' and ModifierId = 'MINOR_CIV_CSE_HAVANA_BREATHTAKING_CULTURE_BONUS';
-- 吉布提
insert or ignore into RequirementSets
    (RequirementSetId,                          RequirementSetType)
values
    ('MINOR_CIV_CSE_DJIBOUTI_NEARED_WATER',     'REQUIREMENTSET_TEST_ALL');
    insert or ignore into RequirementSetRequirements
    (RequirementSetId,                          RequirementId)
values
    ('MINOR_CIV_CSE_DJIBOUTI_NEARED_WATER',     'REQUIRES_PLOT_HAS_SHALLOW_WATER'),
    ('MINOR_CIV_CSE_DJIBOUTI_NEARED_WATER',     'ADJACENT_TO_OWNER');
delete from TraitModifiers where TraitType = 'MINOR_CIV_CSE_DJIBOUTI_TRAIT';
insert or replace into TraitModifiers 
    (TraitType,                                ModifierId)
values
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT',        'MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT',        'MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION');
insert or replace into    Modifiers
    (ModifierId,                                                ModifierType,                                       SubjectRequirementSetId)
values
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD',                  'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION',            'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD_CITY',             'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',           'HD_DISTRICT_IS_CITY_CENTER'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION_CITY',       'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',           'HD_DISTRICT_IS_CITY_CENTER'),
	('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD_MODIFIER',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'MINOR_CIV_CSE_DJIBOUTI_NEARED_WATER'),
	('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION_MODIFIER',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'MINOR_CIV_CSE_DJIBOUTI_NEARED_WATER');
insert or replace into    ModifierArguments
    (ModifierId,                                                Name,                                       Value)
values
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD',                  'ModifierId',                               'MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD_CITY'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION',            'ModifierId',                               'MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION_CITY'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD_CITY',             'ModifierId',                               'MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD_MODIFIER'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION_CITY',       'ModifierId',                               'MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION_MODIFIER'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD_MODIFIER',         'YieldType',                                'YIELD_FOOD'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_FOOD_MODIFIER',   		'Amount',                                   1),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION_MODIFIER',   'YieldType',                                'YIELD_PRODUCTION'),
    ('MINOR_CIV_CSE_DJIBOUTI_TRAIT_PLOT_PRODUCTION_MODIFIER',   'Amount',                                   1);
-- 里加
delete from TraitModifiers where TraitType = 'MINOR_CIV_CSD_RIGA_TRAIT' and ModifierId = 'MINOR_CIV_CSD_RIGA_SCIENCE_BOUNUS_HARBOR';
-- 普雷斯拉夫
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_CAVALRY_INCREASED_MOVEMENT';
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT' and ModifierId = 'MINOR_CIV_PRESLAV_CAVALRY_INCREASED_COMBAT';
-- 瓦莱塔
delete from TraitModifiers where TraitType = 'MINOR_CIV_VALLETTA_TRAIT' and ModifierId like 'MINOR_CIV_VALLETTA_PURCHASE_CHEAPER_%_BONUS';
-- 安善
delete from TraitModifiers where TraitType = 'MINOR_CIV_BABYLON_TRAIT' and ModifierId = 'MINOR_CIV_BABYLON_CAMPUS_TIER1_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_BABYLON_TRAIT' and ModifierId = 'MINOR_CIV_BABYLON_THEATER_TIER1_BONUS';
insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('MINOR_CIV_BABYLON_TRAIT',             'MINOR_CIV_BABYLON_WRITING_BONUS');
-- 檀香山
delete from TraitModifiers where TraitType = 'MINOR_CIV_CSD_HONOLULU_TRAIT' and ModifierID = 'MINOR_CIV_CSD_HONOLULU_FISHING_BOATS_CULTURE_BONUS';
-- 蒙巴萨
update ModifierArguments set Value = 'YIELD_PRODUCTION' where ModifierId = 'MINOR_CIV_CSE_MOMBASA_PLANTATION_CULTURE_BONUS_MODIFIER' and Name = 'YieldType';
update ModifierArguments set Value = 'YIELD_GOLD' where ModifierId = 'MINOR_CIV_CSE_MOMBASA_PLANTATION_SCIENCE_BONUS_MODIFIER' and Name = 'YieldType';
-- 费尔干纳
delete from TraitModifiers where TraitType = 'MINOR_CIV_CSD_FERGANA_TRAIT' and ModifierID = 'MINOR_CIV_CSD_FERGANA_GROWTH_BONUS';
-- 基辅
update Modifiers set ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH' where ModifierId = 'MINOR_CIV_CSD_KIEV_FOOD_AT_PEACE_BONUS_MODIFIER';
delete from ModifierArguments where ModifierId = 'MINOR_CIV_CSD_KIEV_FOOD_AT_PEACE_BONUS_MODIFIER' and Name = 'YieldType';
-- 米特拉
update ModifierArguments set value = 20 where ModifierId = 'MINOR_CIV_PALENQUE_CAMPUS_GROWTH_BONUS' and Name = 'Amount';
delete from TraitModifiers where TraitType = 'MINOR_CIV_PALENQUE_TRAIT' and ModifierID = 'MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS';
-- 日内瓦
update ModifierArguments set Value = 10 where ModifierId = 'MINOR_CIV_GENEVA_SCIENCE_AT_PEACE_BONUS' and Name = 'Amount';
-- 塔鲁加
update ModifierArguments set Value = 5 where ModifierId like 'MINOR_CIV_TARUGA_%_RESOURCE_SCIENCE' and Name = 'Amount';
-- 菲斯
delete from TraitModifiers where TraitType = 'MINOR_CIV_FEZ_TRAIT' and ModifierID = 'MINOR_CIV_FEZ_YIELD_SCIENCE_FOR_HOLY_SITE';
-- 哈图沙
update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE_MODIFIER' and Name = 'Amount';
-- 南马都尔
update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_NAN_MADOL_DISTRICTS_CULTURE_BONUS' and Name = 'Amount';
-- 阿育陀耶
delete from RequirementSetRequirements where RequirementSetId = 'MINOR_3DISTRICTS_CULTURE_REQUIREMENTS' and RequirementId = 'REQUIRES_DISTRICT_IS_DISTRICT_HOLY_SITE';
delete from RequirementSetRequirements where RequirementSetId = 'MINOR_3DISTRICTS_CULTURE_REQUIREMENTS' and RequirementId = 'REQUIRES_DISTRICT_IS_DISTRICT_COMMERCIAL_HUB';
delete from RequirementSetRequirements where RequirementSetId = 'MINOR_3DISTRICTS_CULTURE_REQUIREMENTS' and RequirementId = 'REQUIRES_DISTRICT_IS_DISTRICT_ENTERTAINMENT_COMPLEX';
-- 塔那那利佛
update GlobalParameters set Value = 10 where Name = 'YIELD_MODIFIER_PER_EARNED_GREAT_PERSON_MAXIMUM';
-- 罕萨
update ModifierArguments set Value = 0.2 where ModifierId = 'MINOR_CIV_HUNZA_GOLD_FROM_TRADE_ROUTE_LENGTH' and Name = 'Amount';
-- 斯里巴加湾
update ModifierArguments set Value = 'MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS' where ModifierId = 'MINOR_CIV_JAKARTA_UNIQUE_INFLUENCE_BONUS' and Name = 'ModifierId';
insert or replace into Modifiers
	(ModifierId,										ModifierType,									    SubjectRequirementSetId)
values
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',	        'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST');
insert or replace into ModifierArguments
	(ModifierId,										Name,			 Value)
values
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',			'YieldType',	 'YIELD_GOLD'),
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',			'Amount',	     3);
-- 马尼拉
delete from TraitModifiers where TraitType = 'MINOR_CIV_CSD_MANILA_TRAIT' and ModifierID = 'MINOR_CIV_CSD_MANILA_TRADE_ROUTE_YIELD_FOR_SEA_TOWN_BONUS';
-- 阿帕
delete from BuildingModifiers where BuildingType = 'BUILDING_APADANA' and ModifierId = 'APADANA_TRIBUTARY_CULTURE';
-- 基尔瓦
update ModifierArguments set Value = 5 where ModifierId = 'KILWA_THREE_INFLUENCE_TOKENS';
-- 自由女神像
delete from BuildingModifiers where BuildingType = 'BUILDING_STATUE_LIBERTY' and ModifierId = 'STATUE_OF_LIBERTY_TRADE_ROUTE_TOKEN';
-- 腓尼基
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES' and ModifierId = '	PHOENICIA_FOREIGN_TRADE_INFLUENCE_TOKEN';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES' and ModifierId = '	PHOENICIA_WRITING_INFLUENCE_TOKEN';
-- 匈牙利
update GlobalParameters set Value = 0 where Name = 'HUNGARY_ENVOY_NUMBER';
-- 阿玛尼
update ModifierArguments set Value = 1 where ModifierId = 'AMANI_EXTRA_ENVOY' and Name = 'Amount';

-- 匈牙利议会大厦和西印度交易所
update ModifierArguments set Value = 3 where ModifierId = 'CONTRATACION_GOVERNOR_POINTS';
delete from BuildingModifiers where BuildingType = 'BUILDING_ORSZAGHAZ' and ModifierId = 'BUILDING_ORSZAGHAZ_GOVERNOR_POINTS';
delete from BuildingModifiers where BuildingType = 'BUILDING_ORSZAGHAZ' and ModifierId = 'BUILDING_ORSZAGHAZ_INFLUENCE_POINTS_MODIFIER';
insert or replace into Modifiers
    (ModifierId,                    ModifierType,                               RunOnce)
values
    ('ORSZAGHAZ_INFLUENCE_TOKENS',  'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',    1);
insert or replace into ModifierArguments
    (ModifierId,                    Name,        Value)
values
    ('ORSZAGHAZ_INFLUENCE_TOKENS',  'Amount',    4);
insert or replace into BuildingModifiers
    (BuildingType,          ModifierId)
values
    ('BUILDING_ORSZAGHAZ',  'ORSZAGHAZ_INFLUENCE_TOKENS');
insert or replace into Requirements
    (RequirementId,                     RequirementType)
values
    ('REQUIRES_PLAYER_HAS_ORSZAGHAZ',   'REQUIREMENT_PLAYER_HAS_BUILDING');
insert or replace into RequirementArguments
    (RequirementId,                     Name,           Value)
values
    ('REQUIRES_PLAYER_HAS_ORSZAGHAZ',   'BuildingType', 'BUILDING_ORSZAGHAZ');
insert or replace into RequirementSets
    (RequirementSetId,         RequirementSetType)
values
    ('PLAYER_HAS_ORSZAGHAZ',   'REQUIREMENTSET_TEST_ALL');
insert or replace into RequirementSetRequirements
    (RequirementSetId,         RequirementId)
values
    -- ('PLAYER_HAS_ORSZAGHAZ',   'REQUIRES_PLAYER_HAS_ORSZAGHAZ');
    ('PLAYER_HAS_ORSZAGHAZ',   'REQUIRES_CITY_HAS_BUILDING_ORSZAGHAZ');
create temporary table OrszaghazModifiers (PolicyType text not null, OldModifierId text not null, NewModifierId text not null);
insert into OrszaghazModifiers
    (PolicyType,    OldModifierId,  NewModifierId)
select
    PolicyType,    ModifierId,      'ORSZAGHAZ_GRANT_' || ModifierId
from PolicyModifiers where PolicyType in (select PolicyType from Policies where GovernmentSlotType = 'SLOT_GREAT_PERSON' or GovernmentSlotType = 'SLOT_WILDCARD');
insert or replace into Modifiers
    (ModifierId,	ModifierType,	                                SubjectRequirementSetId)
select
    NewModifierId,	'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',       'PLAYER_HAS_ORSZAGHAZ'
from OrszaghazModifiers;
insert or replace into ModifierArguments
    (ModifierId,	Name,	        Value)
select
    NewModifierId,	'ModifierId',   OldModifierId
from OrszaghazModifiers;
insert or replace into PolicyModifiers
    (PolicyType,   ModifierId)
select
    PolicyType,    NewModifierId
from OrszaghazModifiers;

-- 军营相邻战略+2
delete from District_Adjacencies where DistrictType = 'DISTRICT_ENCAMPMENT' and YieldChangeId = 'Strategic_Production';
delete from District_Adjacencies where DistrictType = 'DISTRICT_IKANDA' and YieldChangeId = 'Strategic_Production';
delete from District_Adjacencies where DistrictType = 'DISTRICT_THANH' and YieldChangeId = 'Strategic_Production';
insert or ignore into Adjacency_YieldChanges
	(ID,									Description,							YieldType,				YieldChange,				TilesRequired,				AdjacentResourceClass)
values
	('Strategic_Production2',				'LOC_DISTRICT_STRATEGIC2_PRODUCTION',	'YIELD_PRODUCTION',		2,							1,							'RESOURCECLASS_STRATEGIC');
insert or replace into District_Adjacencies
	(DistrictType,								YieldChangeId)
values
	('DISTRICT_ENCAMPMENT',						'Strategic_Production2'),
	('DISTRICT_IKANDA',							'Strategic_Production2'),
	('DISTRICT_THANH',						    'Strategic_Production2');

-- 锻造之神改名后重新实装
update ModifierArguments set Value = 'ERA_MEDIEVAL' where ModifierId = 'GOD_OF_THE_FORGE_UNIT_ANCIENT_CLASSICAL_PRODUCTION_MODIFIER' and Name = 'EndEra';
update ModifierArguments set Value = 50 where ModifierId = 'GOD_OF_THE_FORGE_UNIT_ANCIENT_CLASSICAL_PRODUCTION_MODIFIER' and Name = 'Amount';
insert or replace into Types
    (Type,                          Kind)
values
    ('BELIEF_OLD_GOD_OF_THE_FORGE', 'KIND_BELIEF');
insert or replace into Beliefs
    (BeliefType,	                Name,	                                 Description,	                                 BeliefClassType)
values
    ('BELIEF_OLD_GOD_OF_THE_FORGE', 'LOC_BELIEF_OLD_GOD_OF_THE_FORGE_NAME',  'LOC_BELIEF_OLD_GOD_OF_THE_FORGE_DESCRIPTION',  'BELIEF_CLASS_PANTHEON');
insert or replace into BeliefsSortIndex
	(BeliefType,			            SortIndex)
values
	('BELIEF_OLD_GOD_OF_THE_FORGE',	    84);
insert or replace into BeliefModifiers
    (BeliefType,                    ModifierId)
values
    ('BELIEF_OLD_GOD_OF_THE_FORGE', 'GOD_OF_THE_FORGE_STRATEGIC_RESOURCE_COST_DISCOUNT'),
    ('BELIEF_OLD_GOD_OF_THE_FORGE', 'GOD_OF_THE_FORGE_UNIT_ANCIENT_CLASSICAL_PRODUCTION');

-- 翼骑兵由73力下调至70力
update Units set Combat = 70 where UnitType = 'UNIT_POLISH_HUSSAR';

-- 删除人口维护费
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_MAJOR_CIV' and ModifierId like 'AT_LEAST_%_HUMAN_%_POPULATION_MAINTENANCE';

-- 泰姬陵：取消时代分多给钱的能力，每次全国建成奇观可以返还80%的金币，同时所有奇观+8金。
update GlobalParameters set Value = 0 where Name = 'TAJ_MAHAL_GOLD';
insert or replace into Modifiers
    (ModifierId,                ModifierType)
values
    ('TAJ_MAHAL_WONDER_GOLD',   'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_YIELD_CHANGE');
insert or replace into ModifierArguments
    (ModifierId,                Name,           Value)
values
    ('TAJ_MAHAL_WONDER_GOLD',   'YieldType',    'YIELD_GOLD'),
    ('TAJ_MAHAL_WONDER_GOLD',   'Amount',        8);
insert or replace into BuildingModifiers
    (BuildingType,          ModifierId)
values
    ('BUILDING_TAJ_MAHAL',  'TAJ_MAHAL_WONDER_GOLD');
insert or replace into GlobalParameters (Name,  Value) values ('TAJ_WONDER_GOLD_PERCENTAGE',  80);


-- 搬迦太基分支的万神改动
-- 海洋母亲
delete from BeliefModifiers where BeliefType = 'BELIEF_OCEAN_MOTHER';
insert or replace into Modifiers
	(ModifierId,													ModifierType,										SubjectRequirementSetId)
values
    ('OCEAN_MOTHER_CENTER_COAST_FOOD',								'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('OCEAN_MOTHER_CENTER_COAST_FOOD_MODIFIER',						'MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',			NULL),
	('OCEAN_MOTHER_CENTER_COAST_FAITH',								'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('OCEAN_MOTHER_CENTER_COAST_FAITH_MODIFIER',					'MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',			NULL),
	('OCEAN_MOTHER_GREAT_PROPHET',									'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
	('OCEAN_MOTHER_GREAT_PROPHET_MODIFIER',							'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT',	'PLOT_IS_ADJACENT_TO_COAST'),
	('OCEAN_MOTHER_HOUSING',										'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',				'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('OCEAN_MOTHER_HOUSING_MODIFIER',                               'MODIFIER_CITY_DISTRICTS_ADJUST_DISTRICT_HOUSING',	'PLOT_IS_ADJACENT_TO_COAST');
insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
values
    ('OCEAN_MOTHER_CENTER_COAST_FOOD',								'ModifierId',			'OCEAN_MOTHER_CENTER_COAST_FOOD_MODIFIER'),
	('OCEAN_MOTHER_CENTER_COAST_FOOD_MODIFIER',						'DistrictType',			'DISTRICT_CITY_CENTER'),
	('OCEAN_MOTHER_CENTER_COAST_FOOD_MODIFIER',						'YieldType',			'YIELD_FOOD'),
	('OCEAN_MOTHER_CENTER_COAST_FOOD_MODIFIER',						'TerrainType',			'TERRAIN_COAST'),
	('OCEAN_MOTHER_CENTER_COAST_FOOD_MODIFIER',						'Amount',				1),
	('OCEAN_MOTHER_CENTER_COAST_FOOD_MODIFIER',						'Description',			'LOC_DISTRICT_COAST_FOOD'),
	('OCEAN_MOTHER_CENTER_COAST_FAITH',								'ModifierId',			'OCEAN_MOTHER_CENTER_COAST_FAITH_MODIFIER'),
	('OCEAN_MOTHER_CENTER_COAST_FAITH_MODIFIER',					'DistrictType',			'DISTRICT_CITY_CENTER'),
	('OCEAN_MOTHER_CENTER_COAST_FAITH_MODIFIER',					'YieldType',			'YIELD_FAITH'),
	('OCEAN_MOTHER_CENTER_COAST_FAITH_MODIFIER',					'TerrainType',			'TERRAIN_COAST'),
	('OCEAN_MOTHER_CENTER_COAST_FAITH_MODIFIER',					'Amount',				1),
	('OCEAN_MOTHER_CENTER_COAST_FAITH_MODIFIER',					'Description',			'LOC_DISTRICT_COAST_FAITH'),
	('OCEAN_MOTHER_GREAT_PROPHET',									'ModifierId',			'OCEAN_MOTHER_GREAT_PROPHET_MODIFIER'),
	('OCEAN_MOTHER_GREAT_PROPHET_MODIFIER',							'GreatPersonClassType',	'GREAT_PERSON_CLASS_PROPHET'),
	('OCEAN_MOTHER_GREAT_PROPHET_MODIFIER',							'Amount',				2),
	('OCEAN_MOTHER_HOUSING',							            'ModifierId',			'OCEAN_MOTHER_HOUSING_MODIFIER'),
	('OCEAN_MOTHER_HOUSING_MODIFIER',					            'Amount',				1);
insert or replace into BeliefModifiers
	(BeliefType,							ModifierID)
values
    ('BELIEF_OCEAN_MOTHER',					'OCEAN_MOTHER_CENTER_COAST_FOOD'),
	('BELIEF_OCEAN_MOTHER',					'OCEAN_MOTHER_CENTER_COAST_FAITH'),
	('BELIEF_OCEAN_MOTHER',					'OCEAN_MOTHER_GREAT_PROPHET'),
	('BELIEF_OCEAN_MOTHER',					'OCEAN_MOTHER_HOUSING');
-- 极光之舞
delete from BeliefModifiers where BeliefType = 'BELIEF_DANCE_OF_THE_AURORA' and ModifierId = 'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD';
delete from BeliefModifiers where BeliefType = 'BELIEF_DANCE_OF_THE_AURORA' and ModifierId = 'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD';
insert or replace into BeliefModifiers
	(BeliefType,							ModifierID)
values
	('BELIEF_DANCE_OF_THE_AURORA',			'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD'),
	('BELIEF_DANCE_OF_THE_AURORA',			'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD');
insert or replace into Modifiers
	(ModifierId,													ModifierType,										SubjectRequirementSetId)
values
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD',					'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',			'CITY_FOLLOWS_PANTHEON_AND_HOLYSITE_REQUIREMENTS'),
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD_MODIFIER',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'HOLYSITE_TUNDRA_REQUIREMENTS'),
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD',				'MODIFIER_ALL_DISTRICTS_ATTACH_MODIFIER',			'CITY_FOLLOWS_PANTHEON_AND_HOLYSITE_REQUIREMENTS'),
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD_MODIFIER',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',				'HOLYSITE_TUNDRA_HILL_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,													Name,					Value)
values
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD',					'ModifierId',			'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD_MODIFIER'),
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD_MODIFIER',			'YieldType',			'YIELD_FOOD'),
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD_MODIFIER',			'Amount',				1),
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD',				'ModifierId',			'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD_MODIFIER'),
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD_MODIFIER',		'YieldType',			'YIELD_FOOD'),
	('DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD_MODIFIER',		'Amount',				1);
update ModifierArguments set Value = 3 where ModifierId = 'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_GREAT_PROPHET_MODIFIER' and Name = 'Amount';
-- 沙漠民俗 & 神圣道路
update ModifierArguments set Value = 3 where ModifierId = 'DESERT_FOLKLORE_HOLYSITE_DESERT_GREAT_PROPHET_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'SACRED_PATH_HOLYSITE_JUNGLE_GREAT_PROPHET_MODIFIER' and Name = 'Amount';
-- 城守删去城防能力
delete from BeliefModifiers where BeliefType = 'BELIEF_CITY_PATRON_GODDESS' and ModifierId != 'CITY_PATRON_GODDESS_DISTRICT_PRODUCTION_MODIFIER';

-- 新增万神殿矮人传说：资源矿1粮，所有矿2金1住房
-- 新增万神殿巨石崇拜：采石场+1琴+3金
insert or replace into Types
    (Type,                                              Kind)
values
    ('BELIEF_TALE_OF_DWALVES',                          'KIND_BELIEF'),
    ('BELIEF_MEGALITHIC_WORSHIP',                       'KIND_BELIEF'),
    ('MODIFIER_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',    'KIND_MODIFIER');
insert or replace into DynamicModifiers
    (ModifierType,	CollectionType,	EffectType)
values
    ('MODIFIER_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',    'COLLECTION_PLAYER_IMPROVEMENTS',   'EFFECT_ATTACH_MODIFIER');
insert or replace into Beliefs
    (BeliefType,	                Name,	                                 Description,	                                 BeliefClassType)
values
    ('BELIEF_TALE_OF_DWALVES',      'LOC_BELIEF_TALE_OF_DWALVES_NAME',      'LOC_BELIEF_TALE_OF_DWALVES_DESCRIPTION',       'BELIEF_CLASS_PANTHEON'),
    ('BELIEF_MEGALITHIC_WORSHIP',   'LOC_BELIEF_MEGALITHIC_WORSHIP_NAME',   'LOC_BELIEF_MEGALITHIC_WORSHIP_DESCRIPTION',    'BELIEF_CLASS_PANTHEON');
update BeliefsSortIndex set SortIndex = SortIndex + 1 where SortIndex > 15 and SortIndex < 30;
insert or replace into BeliefsSortIndex
	(BeliefType,			        SortIndex)
values
	('BELIEF_TALE_OF_DWALVES',	    14),
	('BELIEF_MEGALITHIC_WORSHIP',	16);
insert or replace into BeliefModifiers
    (BeliefType,                     ModifierId)
values
    ('BELIEF_TALE_OF_DWALVES',      'TALE_OF_DWALVES_BONUS_MINE_FOOD'),
    ('BELIEF_TALE_OF_DWALVES',      'TALE_OF_DWALVES_LUXURY_MINE_FOOD'),
    ('BELIEF_TALE_OF_DWALVES',      'TALE_OF_DWALVES_MINE_GOLD'),
    ('BELIEF_TALE_OF_DWALVES',      'TALE_OF_DWALVES_MINE_HOUSING'),
    ('BELIEF_MEGALITHIC_WORSHIP',   'MEGALITHIC_WORSHIP_QUARRY_CULTURE'),
    ('BELIEF_MEGALITHIC_WORSHIP',   'MEGALITHIC_WORSHIP_QUARRY_GOLD');
insert or replace into Modifiers
    (ModifierId,                                    ModifierType,                                       SubjectRequirementSetId)
values
    ('TALE_OF_DWALVES_BONUS_MINE_FOOD',             'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('TALE_OF_DWALVES_BONUS_MINE_FOOD_MODIFIER',    'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_BONUS_MINE_REQUIREMENTS'),
    ('TALE_OF_DWALVES_LUXURY_MINE_FOOD',            'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('TALE_OF_DWALVES_LUXURY_MINE_FOOD_MODIFIER',   'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_LUXURY_MINE_REQUIREMENTS'),
    ('TALE_OF_DWALVES_MINE_GOLD',                   'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('TALE_OF_DWALVES_MINE_GOLD_MODIFIER',          'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_MINE_REQUIREMENTS'),
    ('TALE_OF_DWALVES_MINE_HOUSING',                'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_HAS_PANTHEON_REQUIREMENTS'),
    ('TALE_OF_DWALVES_MINE_HOUSING_MODIFIER',       'MODIFIER_PLAYER_IMPROVEMENTS_ATTACH_MODIFIER',     'PLOT_HAS_MINE_REQUIREMENTS'),
    ('TALE_OF_DWALVES_MINE_HOUSING_MODIMODIFIER',   'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_HOUSING',  null),
    ('MEGALITHIC_WORSHIP_QUARRY_CULTURE',           'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('MEGALITHIC_WORSHIP_QUARRY_CULTURE_MODIFIER',  'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_QUARRY_REQUIREMENTS'),
    ('MEGALITHIC_WORSHIP_QUARRY_GOLD',              'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('MEGALITHIC_WORSHIP_QUARRY_GOLD_MODIFIER',     'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_QUARRY_REQUIREMENTS');
insert or replace into ModifierArguments
    (ModifierId,                                    Name,           Value)
values
    ('TALE_OF_DWALVES_BONUS_MINE_FOOD',             'ModifierId',   'TALE_OF_DWALVES_BONUS_MINE_FOOD_MODIFIER'),
    ('TALE_OF_DWALVES_BONUS_MINE_FOOD_MODIFIER',    'YieldType',    'YIELD_FOOD'),
    ('TALE_OF_DWALVES_BONUS_MINE_FOOD_MODIFIER',    'Amount',       1),
    ('TALE_OF_DWALVES_LUXURY_MINE_FOOD',            'ModifierId',   'TALE_OF_DWALVES_LUXURY_MINE_FOOD_MODIFIER'),
    ('TALE_OF_DWALVES_LUXURY_MINE_FOOD_MODIFIER',   'YieldType',    'YIELD_FOOD'),
    ('TALE_OF_DWALVES_LUXURY_MINE_FOOD_MODIFIER',   'Amount',       1),
    ('TALE_OF_DWALVES_MINE_GOLD',                   'ModifierId',   'TALE_OF_DWALVES_MINE_GOLD_MODIFIER'),
    ('TALE_OF_DWALVES_MINE_GOLD_MODIFIER',          'YieldType',    'YIELD_GOLD'),
    ('TALE_OF_DWALVES_MINE_GOLD_MODIFIER',          'Amount',       2),
    ('TALE_OF_DWALVES_MINE_HOUSING',                'ModifierId',   'TALE_OF_DWALVES_MINE_HOUSING_MODIFIER'),
    ('TALE_OF_DWALVES_MINE_HOUSING_MODIFIER',       'ModifierId',   'TALE_OF_DWALVES_MINE_HOUSING_MODIMODIFIER'),
    ('TALE_OF_DWALVES_MINE_HOUSING_MODIMODIFIER',   'Amount',       1),
    ('MEGALITHIC_WORSHIP_QUARRY_CULTURE',           'ModifierId',   'MEGALITHIC_WORSHIP_QUARRY_CULTURE_MODIFIER'),
    ('MEGALITHIC_WORSHIP_QUARRY_CULTURE_MODIFIER',  'YieldType',    'YIELD_CULTURE'),
    ('MEGALITHIC_WORSHIP_QUARRY_CULTURE_MODIFIER',  'Amount',       1),
    ('MEGALITHIC_WORSHIP_QUARRY_GOLD',              'ModifierId',   'MEGALITHIC_WORSHIP_QUARRY_GOLD_MODIFIER'),
    ('MEGALITHIC_WORSHIP_QUARRY_GOLD_MODIFIER',     'YieldType',    'YIELD_GOLD'),
    ('MEGALITHIC_WORSHIP_QUARRY_GOLD_MODIFIER',     'Amount',       3);

-- 教皇权威: 删除给使者，移动到强化
delete from BeliefModifiers where BeliefType = 'BELIEF_PAPAL_PRIMACY' and ModifierId = 'RELIGIOUS_UNITY_ENVOY_ON_ADOPTION';
update Beliefs set BeliefClassType = 'BELIEF_CLASS_ENHANCER' where BeliefType = 'BELIEF_PAPAL_PRIMACY';
update BeliefsSortIndex set SortIndex =	194 where BeliefType = 'BELIEF_PAPAL_PRIMACY';
update ModifierArguments set Value = 4 where ModifierId = 'PAPAL_PRIMACY_GOLD_PER_TRIBUTARY_MODIFIER' and Name = 'Amount';

-- 法国UA
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_WONDER_TOURISM' and ModifierId = 'TRAIT_WONDER_BONUS_TO_CAPITAL';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_WONDER_TOURISM' and ModifierId = 'TRAIT_WONDER_AT_LEAST_MEDIEVAL_BONUS_TO_CAPITAL';
insert or replace into GlobalParameters (Name,  Value) values ('FRANCE_WONDER_GREATPEOPLE_PERCENTAGE',  20);

-- 郑王庙
delete from BuildingModifiers where BuildingType = 'BUILDING_SUK_WAT_ARUN';
delete from Building_GreatPersonPoints where BuildingType = 'BUILDING_SUK_WAT_ARUN';
create temporary table WatArunBuildingTourisms (BuildingType text not null primary key, Tourism int);
insert into WatArunBuildingTourisms
    (BuildingType,  Tourism)
select
    b.BuildingType,   YieldChange
from (Buildings b inner join Building_YieldChanges y on b.BuildingType = y.BuildingType) where PrereqDistrict = 'DISTRICT_HOLY_SITE' and YieldType = 'YIELD_FAITH';
insert or replace into RequirementSets
    (RequirementSetId,              RequirementSetType)
values
    ('CITY_HAS_WORSHIP_BUILDING',   'REQUIREMENTSET_TEST_ANY');
insert or replace into RequirementSetRequirements
    (RequirementSetId,              RequirementId)
select
    'CITY_HAS_WORSHIP_BUILDING',    'REQUIRES_CITY_HAS_' || BuildingType
from Buildings where EnabledByReligion = 1;
insert or replace into Requirements
    (RequirementId,                         RequirementType)
values
    ('REQUIRES_CITY_HAS_WORSHIP_BUILDING',  'REQUIREMENT_REQUIREMENTSET_IS_MET');
insert or replace into RequirementArguments
    (RequirementId,                         Name,               Value)
values
    ('REQUIRES_CITY_HAS_WORSHIP_BUILDING',  'RequirementSetId', 'CITY_HAS_WORSHIP_BUILDING');
insert or replace into RequirementSets
    (RequirementSetId,                                                              RequirementSetType)
select
    'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType || '_DISTRCIT_IS_HOLY_SITE',   'REQUIREMENTSET_TEST_ALL'
from WatArunBuildingTourisms;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                                                              RequirementId)
select
    'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType || '_DISTRCIT_IS_HOLY_SITE',   'REQUIRES_CITY_HAS_WORSHIP_BUILDING'
from WatArunBuildingTourisms;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                                                              RequirementId)
select
    'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType || '_DISTRCIT_IS_HOLY_SITE',   'REQUIRES_DISTRICT_IS_DISTRICT_HOLY_SITE'
from WatArunBuildingTourisms;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                                                               RequirementId)
select
    'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType ||  '_DISTRCIT_IS_HOLY_SITE',   'REQUIRES_CITY_HAS_' || BuildingType
from WatArunBuildingTourisms;
insert or replace into BuildingModifiers
    (BuildingType,              ModifierId)
select
    'BUILDING_SUK_WAT_ARUN',    'WAT_ARUN_' || BuildingType || '_TOURISM'
from WatArunBuildingTourisms;
insert or replace into Modifiers
    (ModifierId,                                ModifierType,                                       SubjectRequirementSetId)
select
    'WAT_ARUN_' || BuildingType || '_TOURISM', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_CHANGE',   'CITY_HAS_WORSHIP_BUILDING_AND_' || BuildingType ||'_DISTRCIT_IS_HOLY_SITE'
from WatArunBuildingTourisms;
insert or replace into ModifierArguments
    (ModifierId,                                Name,       Value)
select
    'WAT_ARUN_' || BuildingType || '_TOURISM', 'Amount',    Tourism
from WatArunBuildingTourisms;
insert or replace into BuildingModifiers
    (BuildingType,              ModifierId)
values
    ('BUILDING_SUK_WAT_ARUN',   'WAT_ARUN_INFLUENCE_ATTACH');
insert or replace into Modifiers
    (ModifierId,                    ModifierType,                                           SubjectRequirementSetId)
values  
    ('WAT_ARUN_INFLUENCE_ATTACH',   'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               'CITY_HAS_WORSHIP_BUILDING'),
    ('WAT_ARUN_INFLUENCE',          'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',     null);
insert or replace into ModifierArguments
    (ModifierId,                    Name,           Value)
values  
    ('WAT_ARUN_INFLUENCE_ATTACH',   'ModifierId',   'WAT_ARUN_INFLUENCE'),
    ('WAT_ARUN_INFLUENCE',          'Amount',       2);