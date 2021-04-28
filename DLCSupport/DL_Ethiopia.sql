-------------------------------------
--           Ethiopia DLC          --
-------------------------------------

insert or replace into PolicyModifiers
    (PolicyType,    ModifierId)
values
    ('POLICY_GOV_AUTOCRACY',    'AUTOCRACY_DIP');

insert or replace into GovernmentModifiers
    (GovernmentType,    ModifierId)
values
    ('GOVERNMENT_AUTOCRACY',    'AUTOCRACY_DIP');

insert or replace into Modifiers
    (ModifierId,        ModifierType,   SubjectRequirementSetId)
values
    ('AUTOCRACY_DIP',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE', 'CITY_HAS_DIP_DISTRICT');

insert or replace into RequirementSetRequirements(RequirementSetId, RequirementId)values
    ('CITY_HAS_DIP_DISTRICT',   'REQUIRES_CITY_HAS_DISTRICT_DIPLOMATIC_QUARTER');
insert or replace into RequirementSets(RequirementSetId, RequirementSetType)values
    ('CITY_HAS_DIP_DISTRICT',   'REQUIREMENTSET_TEST_ALL');

insert or replace into ModifierArguments
    (ModifierId,            Name,       Value)
values
    ('AUTOCRACY_DIP',       'Amount',   2);

-- delete from DistrictModifiers where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER' and ModifierId = 'DIPLOMATIC_QUARTER_AWARD_ONE_INFLUENCE_TOKEN';
-- delete from DistrictModifiers where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER' and ModifierId = 'DIPLOMATIC_QUARTER_DELEGATION_FAVOR';
-- delete from DistrictModifiers where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER' and ModifierId = 'DIPLOMATIC_QUARTER_EMBASSY_FAVOR';

insert into DistrictModifiers
    (DistrictType,                      ModifierId)
values
    -- Diplomatic Quarter
    -- ('DISTRICT_DIPLOMATIC_QUARTER',     'DIPLOMATIC_QUARTER_DUPLICATE_FIRST_INFLUENCE');
    ('DISTRICT_DIPLOMATIC_QUARTER',       'DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY'); -- Moved to tier-1 building.

-- Diplomacy Quarter Buildings
insert or replace into BuildingModifiers
    (BuildingType,                          ModifierId)
values
    --('BUILDING_CHANCERY',                   'CHANCERY_ADD_VISIBILITY'),
    -- ('BUILDING_CONSULATE',                  'MODIFIER_MAJOR_PLAYER_TRADE_ROUTE_BY_CITY_STATE_BONUS_TYPE_MODIFIER'),
    ('BUILDING_CONSULATE',                  'CONSULATE_LEVY_DISCOUNT');
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

/*insert or replace into DiplomaticVisibilitySources
    (VisibilitySourceType,  Description,                ActionDescription,                  GossipString,                   PrereqTech)
values
    ('SOURCE_CHANCERY',     'LOC_VIZSOURCE_CHANCERY',   'LOC_VIZSOURCE_ACTION_CHANCERY',    'LOC_GOSSIP_SOURCE_CHANCERY',   'TECH_MATHEMATICS');
*/

-- 打草谷
insert or replace into TypeTags
    (Type,                                  Tag)
values
    ('UNIT_ETHIOPIAN_OROMO_CAVALRY',        'CLASS_DACAOGU');
 
insert or replace into BuildingModifiers 
    (BuildingType,                              ModifierId)
values 
    ('BUILDING_CITY_POLICY_DACAOGU',            'CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER');

insert or replace into Modifiers
    (ModifierId,                                                                ModifierType)
values
    ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER',    'MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT');

insert or replace into ModifierArguments
    (ModifierId,                                                                Name,           Value)
values
    ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER',    'Amount',       '-1'),
    ('CITY_POLICY_DACAOGU_CITY_POP_ETHIOPIAN_OROMO_CAVALRYREDUCED_MODIFIER',    'UnitType',     'UNIT_ETHIOPIAN_OROMO_CAVALRY');
