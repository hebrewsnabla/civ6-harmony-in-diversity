-------------------------------------
--           Ethiopia DLC          --
-------------------------------------

-- insert or replace into PolicyModifiers
--     (PolicyType,    ModifierId)
-- values
--     ('POLICY_GOV_AUTOCRACY',    'AUTOCRACY_DIP');

-- insert or replace into GovernmentModifiers
--     (GovernmentType,    ModifierId)
-- values
--     ('GOVERNMENT_AUTOCRACY',    'AUTOCRACY_DIP');

-- insert or replace into Modifiers
--     (ModifierId,        ModifierType,   SubjectRequirementSetId)
-- values
--     ('AUTOCRACY_DIP',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE', 'CITY_HAS_DIP_DISTRICT');

-- insert or replace into ModifierArguments
--     (ModifierId,            Name,       Value)
-- values
--     ('AUTOCRACY_DIP',       'Amount',   2);

insert or replace into RequirementSetRequirements(RequirementSetId, RequirementId)values
    ('CITY_HAS_DIP_DISTRICT',   'REQUIRES_CITY_HAS_DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into RequirementSets(RequirementSetId, RequirementSetType)values
    ('CITY_HAS_DIP_DISTRICT',   'REQUIREMENTSET_TEST_ALL');

update Policies set Description = 'LOC_POLICY_CHARISMATIC_LEADER_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_CHARISMATIC_LEADER';
update Policies set Description = 'LOC_POLICY_DIPLOMATIC_LEAGUE_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_DIPLOMATIC_LEAGUE';
update Policies set Description = 'LOC_POLICY_GUNBOAT_DIPLOMACY_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_GUNBOAT_DIPLOMACY';
update Traits set Description = 'LOC_TRAIT_LEADER_FOUNDER_CARTHAGE_ETHIOPIA_DESCRIPTION' where TraitType = 'TRAIT_LEADER_FOUNDER_CARTHAGE';

insert or replace into PolicyModifiers  
    (PolicyType,                    ModifierId)
values 
    ('POLICY_CHARISMATIC_LEADER',   'CHARISMATIC_LEADER_DIP_INFLUENCEPOINTS'),
    ('POLICY_CHARISMATIC_LEADER',   'CHARISMATIC_LEADER_CONSULATE_INFLUENCEPOINTS'),
    ('POLICY_CHARISMATIC_LEADER',   'CHARISMATIC_LEADER_CHANCERY_INFLUENCEPOINTS'),
    ('POLICY_DIPLOMATIC_LEAGUE',    'DIPLOMATIC_LEAGUE_DIP_INFLUENCEPOINTS'),
    ('POLICY_DIPLOMATIC_LEAGUE',    'DIPLOMATIC_LEAGUE_CONSULATE_INFLUENCEPOINTS'),
    ('POLICY_DIPLOMATIC_LEAGUE',    'DIPLOMATIC_LEAGUE_CHANCERY_INFLUENCEPOINTS'),
    ('POLICY_GUNBOAT_DIPLOMACY',    'GUNBOAT_DIPLOMACY_DIP_INFLUENCEPOINTS'),
    ('POLICY_GUNBOAT_DIPLOMACY',    'GUNBOAT_DIPLOMACY_CONSULATE_INFLUENCEPOINTS'),
    ('POLICY_GUNBOAT_DIPLOMACY',    'GUNBOAT_DIPLOMACY_CHANCERY_INFLUENCEPOINTS');

insert or replace into Modifiers    (ModifierId,        ModifierType,   SubjectRequirementSetId)
select ModifierId,  'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'CITY_HAS_DIP_DISTRICT' from PolicyModifiers 
where ModifierId = 'CHARISMATIC_LEADER_DIP_INFLUENCEPOINTS' or ModifierId = 'DIPLOMATIC_LEAGUE_DIP_INFLUENCEPOINTS' or ModifierId = 'GUNBOAT_DIPLOMACY_DIP_INFLUENCEPOINTS';
insert or replace into Modifiers    (ModifierId,        ModifierType,   SubjectRequirementSetId)
select ModifierId,  'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'BUILDING_IS_CONSULATE' from PolicyModifiers 
where ModifierId = 'CHARISMATIC_LEADER_CONSULATE_INFLUENCEPOINTS' or ModifierId = 'DIPLOMATIC_LEAGUE_CONSULATE_INFLUENCEPOINTS' or ModifierId = 'GUNBOAT_DIPLOMACY_CONSULATE_INFLUENCEPOINTS';
insert or replace into Modifiers    (ModifierId,        ModifierType,   SubjectRequirementSetId)
select ModifierId,  'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',   'BUILDING_IS_CHANCERY' from PolicyModifiers 
where ModifierId = 'CHARISMATIC_LEADER_CHANCERY_INFLUENCEPOINTS' or ModifierId = 'DIPLOMATIC_LEAGUE_CHANCERY_INFLUENCEPOINTS' or ModifierId = 'GUNBOAT_DIPLOMACY_CHANCERY_INFLUENCEPOINTS';

insert or replace into Modifiers
    (ModifierId,                                    ModifierType)
values
    ('CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP',  'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN');

insert or replace into ModifierArguments
    (ModifierId,                                        Name,           Value)
values
    ('CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP',      'Amount',       1),
    ('CHARISMATIC_LEADER_DIP_INFLUENCEPOINTS',          'ModifierId',   'CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP'),
    ('CHARISMATIC_LEADER_CONSULATE_INFLUENCEPOINTS',    'ModifierId',   'CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP'),
    ('CHARISMATIC_LEADER_CHANCERY_INFLUENCEPOINTS',     'ModifierId',   'CHARISMATIC_LEADER_INFLUENCEPOINTS_FOR_DIP'),
    ('DIPLOMATIC_LEAGUE_DIP_INFLUENCEPOINTS',           'ModifierId',   'CONSULATE_INFLUENCEPOINTS'),
    ('DIPLOMATIC_LEAGUE_CONSULATE_INFLUENCEPOINTS',     'ModifierId',   'CONSULATE_INFLUENCEPOINTS'),
    ('DIPLOMATIC_LEAGUE_CHANCERY_INFLUENCEPOINTS',      'ModifierId',   'CONSULATE_INFLUENCEPOINTS'),
    ('GUNBOAT_DIPLOMACY_DIP_INFLUENCEPOINTS',           'ModifierId',   'CHANCERY_INFLUENCEPOINTS'),
    ('GUNBOAT_DIPLOMACY_CONSULATE_INFLUENCEPOINTS',     'ModifierId',   'CHANCERY_INFLUENCEPOINTS'),
    ('GUNBOAT_DIPLOMACY_CHANCERY_INFLUENCEPOINTS',      'ModifierId',   'CHANCERY_INFLUENCEPOINTS');

-- delete from DistrictModifiers where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER' and ModifierId = 'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN';
-- delete from DistrictModifiers where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER' and ModifierId = 'DIPLOMATIC_QUARTER_DELEGATION_FAVOR';
-- delete from DistrictModifiers where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER' and ModifierId = 'DIPLOMATIC_QUARTER_EMBASSY_FAVOR';

insert into DistrictModifiers
    (DistrictType,                      ModifierId)
values
    -- Diplomatic Quarter
    -- ('DISTRICT_DIPLOMATIC_QUARTER',     'DIPLOMATIC_QUARTER_DUPLICATE_FIRST_INFLUENCE');
    ('DISTRICT_DIPLOMATIC_QUARTER',       'DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY'); -- Moved to tier-1 building.

update Modifiers set RunOnce = 1, Permanent = 1, SubjectRequirementSetId = NULL where ModifierId = 'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN';

-- Diplomacy Quarter Buildings
insert or replace into BuildingModifiers
    (BuildingType,                          ModifierId)
values
    --('BUILDING_CHANCERY',                   'CHANCERY_ADD_VISIBILITY'),
    -- ('BUILDING_CONSULATE',                  'MODIFIER_MAJOR_PLAYER_TRADE_ROUTE_BY_CITY_STATE_BONUS_TYPE_MODIFIER'),
    ('BUILDING_CONSULATE',                  'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN'),
    ('BUILDING_CONSULATE',                  'CONSULATE_LEVY_DISCOUNT'),
    ('BUILDING_CHANCERY',                   'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN'),
    ('BUILDING_CHANCERY',                   'WISSELBANKEN_ALLIANCEPOINTS');
    -- ('BUILDING_CONSULATE',                  'CONSULATE_LEVY_UNITUPGRADEDISCOUNT');
    -- ('BUILDING_CONSULATE',                   'DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY'),
    -- ('BUILDING_CONSULATE',                   'DIPLOMATIC_QUARTER_DELEGATION_FAVOR'),
    -- ('BUILDING_CONSULATE',                   'DIPLOMATIC_QUARTER_EMBASSY_FAVOR');

insert or replace into Modifiers    
    (ModifierId,                            ModifierType)
values
    --('CHANCERY_ADD_VISIBILITY',             'MODIFIER_PLAYER_ADD_DIPLO_VISIBILITY'),
    ('CONSULATE_LEVY_DISCOUNT',             'MODIFIER_PLAYER_ADJUST_LEVY_DISCOUNT_PERCENT'),
    ('CONSULATE_LEVY_UNITUPGRADEDISCOUNT',  'MODIFIER_PLAYER_ADJUST_LEVIED_UNIT_UPGRADE_DISCOUNT_PERCENT');

insert or replace into ModifierArguments
    (ModifierId,                            Name,               Value)
values
    --('CHANCERY_ADD_VISIBILITY',             'Amount',           1),
    --('CHANCERY_ADD_VISIBILITY',             'Source',           'SOURCE_CHANCERY'),
   -- ('CHANCERY_ADD_VISIBILITY',             'SourceType',       'DIPLO_SOURCE_ALL_NAMES'),
    ('CONSULATE_LEVY_DISCOUNT',             'Percent',          20),
    ('CONSULATE_LEVY_UNITUPGRADEDISCOUNT',  'Amount',           20);

-- insert or replace into District_CitizenYieldChanges
-- 	(DistrictType,			YieldType,			YieldChange)
-- values
-- 	('DISTRICT_DIPLOMATIC_QUARTER','YIELD_SCIENCE',	2),
-- 	('DISTRICT_DIPLOMATIC_QUARTER','YIELD_CULTURE',	2);

-- insert or replace into Building_CitizenYieldChanges
-- 	(BuildingType,							YieldType,			YieldChange)
-- values
-- 	--diplomatic quarter
-- 	('BUILDING_CONSULATE',					'YIELD_CULTURE',	1),
-- 	('BUILDING_CONSULATE',					'YIELD_SCIENCE',	1),
-- 	('BUILDING_CONSULATE',					'YIELD_GOLD',		-1),
-- 	('BUILDING_CHANCERY',					'YIELD_CULTURE',	2),
-- 	('BUILDING_CHANCERY',					'YIELD_SCIENCE',	2),
-- 	('BUILDING_CHANCERY',					'YIELD_GOLD',		-2);

/*insert or replace into DiplomaticVisibilitySources
    (VisibilitySourceType,  Description,                ActionDescription,                  GossipString,                   PrereqTech)
values
    ('SOURCE_CHANCERY',     'LOC_VIZSOURCE_CHANCERY',   'LOC_VIZSOURCE_ACTION_CHANCERY',    'LOC_GOSSIP_SOURCE_CHANCERY',   'TECH_MATHEMATICS');
*/

-- Influence Point Policy
-- update Policies set Description = 'LOC_POLICY_CHARISMATIC_LEADER_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_CHARISMATIC_LEADER'; 
-- update Policies set Description = 'LOC_POLICY_DIPLOMATIC_LEAGUE_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_DIPLOMATIC_LEAGUE';
-- update Policies set Description = 'LOC_POLICY_GUNBOAT_DIPLOMACY_ETHIOPIA_DESCRIPTION' where PolicyType = 'POLICY_GUNBOAT_DIPLOMACY';

-- 打草谷
-- insert or replace into TypeTags
--     (Type,                                  Tag)
-- values
--     ('UNIT_ETHIOPIAN_OROMO_CAVALRY',        'CLASS_DACAOGU');
 
-- insert or replace into BuildingModifiers 
--     (BuildingType,                              ModifierId)
-- values 
--     ('BUILDING_CITY_POLICY_DACAOGU',            'CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER');

-- insert or replace into Modifiers
--     (ModifierId,                                                                ModifierType)
-- values
--     ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER',    'MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT');

-- insert or replace into ModifierArguments
--     (ModifierId,                                                                Name,           Value)
-- values
--     ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER',    'Amount',       '-1'),
--     ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER',    'UnitType',     'UNIT_ETHIOPIAN_OROMO_CAVALRY');

----------------------------------------------------------------------------------------------------
-- Ethiopia citystate bonus for diplomacy buildings
insert or replace into TraitModifiers (TraitType, ModifierId)
select TraitType, ModifierId||'_CONSULATE_ATTACH' from CityStateInfluenceBonus_HD where Level = 'LARGE';
insert or replace into TraitModifiers (TraitType, ModifierId)
select TraitType, ModifierId||'_CHANCERY_ATTACH' from CityStateInfluenceBonus_HD where Level = 'LARGEST';

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CONSULATE_ATTACH', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_'||Level||'_INFLUENCE'
from CityStateInfluenceBonus_HD where Level = 'LARGE';
insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CHANCERY_ATTACH', 'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER', 'PLAYER_HAS_'||Level||'_INFLUENCE'
from CityStateInfluenceBonus_HD where Level = 'LARGEST';

insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE_ATTACH', 'ModifierId', ModifierId||'_CONSULATE'
from CityStateInfluenceBonus_HD where Level = 'LARGE';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY_ATTACH', 'ModifierId', ModifierId||'_CHANCERY'
from CityStateInfluenceBonus_HD where Level = 'LARGEST';

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CONSULATE', ModifierType, 'BUILDING_IS_CONSULATE'
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 0;
insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CONSULATE', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'BUILDING_IS_CONSULATE'
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 1;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CHANCERY', ModifierType, 'BUILDING_IS_CHANCERY'
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 0;
insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select ModifierId||'_CHANCERY', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 'BUILDING_IS_CHANCERY'
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 1;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE', 'Amount', Amount
from CityStateInfluenceBonus_HD where Level = 'LARGE';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE', 'YieldType', YieldType
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 1;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE', 'BuildingType', 'BUILDING_CONSULATE'
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 1;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CONSULATE', 'CityStatesOnly', 1
from CityStateInfluenceBonus_HD where Level = 'LARGE' and IsYieldChange = 1;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY', 'Amount', Amount
from CityStateInfluenceBonus_HD where Level = 'LARGEST';
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY', 'YieldType', YieldType
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 1;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY', 'BuildingType', 'BUILDING_CHANCERY'
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 1;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select ModifierId||'_CHANCERY', 'CityStatesOnly', 1
from CityStateInfluenceBonus_HD where Level = 'LARGEST' and IsYieldChange = 1;
