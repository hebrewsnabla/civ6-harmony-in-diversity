-------------------------------------
--       Monopoly Adjustment       --
-------------------------------------

insert or replace into GlobalParameters
        (Name,                                                      Value)
values  ('MONOPOLY_REQUIRED_RESOURCE_CONTROL_PERCENTAGE',           201),
        ('MONOPOLY_REQUIRED_RESOURCE_CONTROL_PERCENTAGE_MED',       201),
        ('MONOPOLY_REQUIRED_RESOURCE_CONTROL_PERCENTAGE_MAX',       201);

-- Rewrite industry and corp effects
create table 'HDCounter'(
    'Count' INT NOT NULL,
    PRIMARY KEY(Count)
);
insert or replace into HDCounter (Count) values (1),(2),(3),(4),(5);

create table 'HDMonopolyResourceClasses'(
    'Category' TEXT NOT NULL,
    PRIMARY KEY(Category)
);
insert or replace into HDMonopolyResourceClasses (Category) values
    ('GROWTH'),
    ('FAITH'),
    ('GPP'),
    ('TRADER'),
    ('FOOD'),
    ('AMENITY'), -- Default
    ('WONDER'),
    ('TOURISM'),
    ('FISHERY');

create table 'HDMonopolyResourceEffects'(
    'ResourceType' TEXT NOT NULL,
    'Category' TEXT NOT NULL,
    'IndustryEffect' TEXT NOT NULL,
    'CorporationEffect' TEXT NOT NULL,
    'ProductEffect' TEXT,
    PRIMARY KEY(ResourceType)
    FOREIGN KEY(ResourceType) REFERENCES Resources(ResourceType) ON DELETE CASCADE ON UPDATE CASCADE
    FOREIGN KEY(Category) REFERENCES HDMonopolyResourceClasses(Category) ON DELETE CASCADE ON UPDATE CASCADE
);

insert or replace into HDMonopolyResourceEffects
    (ResourceType,  Category,   IndustryEffect,                 CorporationEffect)
select
    ResourceType,   'AMENITY',  'INDUSTRY_HD_AMENITY_BONUS',    'CORPORATION_HD_AMENITY_BONUS' -- Default
from Resources where ResourceClassType = 'RESOURCECLASS_LUXURY';

update HDMonopolyResourceEffects set Category = 'GROWTH',
    IndustryEffect = 'INDUSTRY_HD_GROWTH_BONUS',
    CorporationEffect = 'CORPORATION_HD_GROWTH_BONUS'
    where ResourceType = 'RESOURCE_SPICES'
    or ResourceType = 'RESOURCE_SALT'
    or ResourceType = 'RESOURCE_SUGAR'
    or ResourceType = 'RESOURCE_HONEY';
update HDMonopolyResourceEffects set Category = 'FAITH', 
    IndustryEffect = 'INDUSTRY_HD_FAITH_BONUS',
    CorporationEffect = 'CORPORATION_HD_FAITH_BONUS'
    where ResourceType = 'RESOURCE_INCENSE'
    or ResourceType = 'RESOURCE_TOBACCO'
    or ResourceType = 'RESOURCE_DYES';
update HDMonopolyResourceEffects set Category = 'GPP',
    IndustryEffect = 'INDUSTRY_HD_GPP_BONUS',
    CorporationEffect = 'CORPORATION_HD_GPP_BONUS'
    where ResourceType = 'RESOURCE_COCOA'
    or ResourceType = 'RESOURCE_COFFEE'
    or ResourceType = 'RESOURCE_TEA';
update HDMonopolyResourceEffects set Category = 'TRADER',
    IndustryEffect = 'INDUSTRY_HD_TRADER_BONUS',
    CorporationEffect = 'CORPORATION_HD_TRADER_BONUS'
    where ResourceType = 'RESOURCE_SILK'
    or ResourceType = 'RESOURCE_SILVER'
    or ResourceType = 'RESOURCE_GOLD'
    or ResourceType = 'RESOURCE_DIAMONDS';
update HDMonopolyResourceEffects set Category = 'FOOD',
    IndustryEffect = 'INDUSTRY_HD_FOOD_BONUS',
    CorporationEffect = 'CORPORATION_HD_FOOD_BONUS'
    where ResourceType = 'RESOURCE_WINE'
    or ResourceType = 'RESOURCE_CITRUS'
    or ResourceType = 'RESOURCE_TRUFFLES'
    or ResourceType = 'RESOURCE_SUK_CAVIAR';
-- Default: Amenity, RESOURCE_COTTON, RESOURCE_FURS, RESOURCE_OLIVES
update HDMonopolyResourceEffects set Category = 'WONDER',
    IndustryEffect = 'INDUSTRY_HD_WONDER_BONUS',
    CorporationEffect = 'CORPORATION_HD_WONDER_BONUS'
    where ResourceType = 'RESOURCE_MARBLE'
    or ResourceType = 'RESOURCE_GYPSUM'
    or ResourceType = 'RESOURCE_MERCURY';
update HDMonopolyResourceEffects set Category = 'TOURISM',
    IndustryEffect = 'INDUSTRY_HD_TOURISM_BONUS',
    CorporationEffect = 'CORPORATION_HD_TOURISM_BONUS'
    where ResourceType = 'RESOURCE_IVORY'
    or ResourceType = 'RESOURCE_JADE'
    or ResourceType = 'RESOURCE_AMBER'
    or ResourceType = 'RESOURCE_SUK_CORAL';
update HDMonopolyResourceEffects set Category = 'FISHERY',
    IndustryEffect = 'INDUSTRY_HD_FISHERY_BONUS',
    CorporationEffect = 'CORPORATION_HD_FISHERY_BONUS'
    where ResourceType = 'RESOURCE_TURTLES'
    or ResourceType = 'RESOURCE_WHALES'
    or ResourceType = 'RESOURCE_PEARLS'
    or ResourceType = 'RESOURCE_SUK_LOBSTER';

update HDMonopolyResourceEffects set ProductEffect = 'PRODUCT_HD_AMENITY_BONUS' where Category = 'AMENITY';

-- ====================
-- INDUSTRY and CORPORATION
-- ====================
update Improvement_YieldChanges set YieldChange = 2
where ImprovementType = 'IMPROVEMENT_INDUSTRY' and YieldType = 'YIELD_FOOD';
update Improvement_YieldChanges set YieldChange = 3
where ImprovementType = 'IMPROVEMENT_INDUSTRY' and YieldType = 'YIELD_PRODUCTION';
update Improvement_YieldChanges set YieldChange = 3
where ImprovementType = 'IMPROVEMENT_INDUSTRY' and YieldType = 'YIELD_GOLD';

update Improvement_YieldChanges set YieldChange = 4
where ImprovementType = 'IMPROVEMENT_CORPORATION' and YieldType = 'YIELD_FOOD';
update Improvement_YieldChanges set YieldChange = 6
where ImprovementType = 'IMPROVEMENT_CORPORATION' and YieldType = 'YIELD_PRODUCTION';
update Improvement_YieldChanges set YieldChange = 4
where ImprovementType = 'IMPROVEMENT_CORPORATION' and YieldType = 'YIELD_GOLD';

delete from ImprovementModifiers where
    ImprovementType = 'IMPROVEMENT_INDUSTRY' or ImprovementType = 'IMPROVEMENT_CORPORATION';
insert or replace into ImprovementModifiers
    (ImprovementType,           ModifierId)
values
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_GROWTH_BONUS'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_GROWTH_BONUS_TRADE'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_FAITH_BONUS'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_FAITH_BONUS_POP'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_GPP_BONUS_POP_S'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_GPP_BONUS_POP_C'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_TRADER_BONUS'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_FOOD_BONUS'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_FOOD_BONUS_FOOD'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_FOOD_BONUS_CULTURE'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_AMENITY_BONUS'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_AMENITY_BONUS_HOUSING'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_AMENITY_BONUS_UNIT'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_WONDER_BONUS'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_WONDER_BONUS_CULTURE'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_TOURISM_BONUS'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_TOURISM_BONUS_GOLD'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_FISHERY_BONUS'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_FISHERY_BONUS_FOOD'),
    ('IMPROVEMENT_INDUSTRY',    'INDUSTRY_HD_FISHERY_BONUS_PROD');

insert or replace into Modifiers
    (ModifierId,                        ModifierType,                                               OwnerRequirementSetId,              SubjectRequirementSetId)
values
    ('INDUSTRY_HD_GROWTH_BONUS',        'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH',                  'HD_GROWTH_BONUS_REQUIREMENTS',     NULL),
    ('INDUSTRY_HD_GROWTH_BONUS_TRADE',  'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS',  'HD_GROWTH_BONUS_REQUIREMENTS',     NULL),
    ('INDUSTRY_HD_FAITH_BONUS',         'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',          'HD_FAITH_BONUS_REQUIREMENTS',      NULL),
    ('INDUSTRY_HD_FAITH_BONUS_POP',     'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',    'HD_FAITH_BONUS_REQUIREMENTS',      NULL),
    ('INDUSTRY_HD_GPP_BONUS_POP_S',     'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',    'HD_GPP_BONUS_REQUIREMENTS',        NULL),
    ('INDUSTRY_HD_GPP_BONUS_POP_C',     'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION',    'HD_GPP_BONUS_REQUIREMENTS',        NULL),
    ('INDUSTRY_HD_TRADER_BONUS',        'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL', 'HD_TRADER_BONUS_REQUIREMENTS',   NULL),
    ('INDUSTRY_HD_FOOD_BONUS',          'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',          'HD_FOOD_BONUS_REQUIREMENTS',       NULL),
    ('INDUSTRY_HD_FOOD_BONUS_FOOD',     'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',                 'HD_FOOD_BONUS_REQUIREMENTS',       NULL),
    ('INDUSTRY_HD_FOOD_BONUS_CULTURE',  'MODIFIER_SINGLE_CITY_ADJUST_YIELD_CHANGE',                 'HD_FOOD_BONUS_REQUIREMENTS',       NULL),
    ('INDUSTRY_HD_AMENITY_BONUS',       'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY',          'HD_AMENITY_BONUS_REQUIREMENTS',    NULL),
    ('INDUSTRY_HD_AMENITY_BONUS_HOUSING', 'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_HOUSING',        'HD_AMENITY_BONUS_REQUIREMENTS',    NULL),
    ('INDUSTRY_HD_AMENITY_BONUS_UNIT',  'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION',              'HD_AMENITY_BONUS_REQUIREMENTS',    NULL),
    ('INDUSTRY_HD_WONDER_BONUS',        'MODIFIER_SINGLE_CITY_ADJUST_WONDER_PRODUCTION',            'HD_WONDER_BONUS_REQUIREMENTS',     NULL),
    ('INDUSTRY_HD_WONDER_BONUS_CULTURE', 'MODIFIER_SINGLE_CITY_ADJUST_WONDER_YIELD_CHANGE',         'HD_WONDER_BONUS_REQUIREMENTS',     NULL),
    ('INDUSTRY_HD_TOURISM_BONUS',       'MODIFIER_CITY_ADJUST_CITY_YIELD_PER_DISTRICT',             'HD_TOURISM_BONUS_REQUIREMENTS',    NULL),
    ('INDUSTRY_HD_TOURISM_BONUS_GOLD',  'MODIFIER_CITY_ADJUST_CITY_YIELD_PER_DISTRICT',             'HD_TOURISM_BONUS_REQUIREMENTS',    NULL),
    ('INDUSTRY_HD_FISHERY_BONUS',       'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'HD_FISHERY_BONUS_REQUIREMENTS',    'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
    ('INDUSTRY_HD_FISHERY_BONUS_FOOD',  'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'HD_FISHERY_BONUS_REQUIREMENTS',    'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
    ('INDUSTRY_HD_FISHERY_BONUS_PROD',  'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',              'HD_FISHERY_BONUS_REQUIREMENTS',    'PLOT_HAS_FISHINGBOATS_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                        Name,           Value)
values
    ('INDUSTRY_HD_GROWTH_BONUS',        'Amount',       10),
    ('INDUSTRY_HD_GROWTH_BONUS_TRADE',  'YieldType',    'YIELD_FOOD'),
    ('INDUSTRY_HD_GROWTH_BONUS_TRADE',  'Amount',       3),
    ('INDUSTRY_HD_GROWTH_BONUS_TRADE',  'Domestic',     1),
    ('INDUSTRY_HD_FAITH_BONUS',         'YieldType',    'YIELD_FAITH'),
    ('INDUSTRY_HD_FAITH_BONUS',         'Amount',       15),
    ('INDUSTRY_HD_FAITH_BONUS_POP',     'YieldType',    'YIELD_GOLD'),
    ('INDUSTRY_HD_FAITH_BONUS_POP',     'Amount',       2),
    ('INDUSTRY_HD_GPP_BONUS_POP_S',     'YieldType',    'YIELD_SCIENCE'),
    ('INDUSTRY_HD_GPP_BONUS_POP_S',     'Amount',       0.8),
    ('INDUSTRY_HD_GPP_BONUS_POP_C',     'YieldType',    'YIELD_CULTURE'),
    ('INDUSTRY_HD_GPP_BONUS_POP_C',     'Amount',       0.8),
    ('INDUSTRY_HD_TRADER_BONUS',        'YieldType',    'YIELD_GOLD'),
    ('INDUSTRY_HD_TRADER_BONUS',        'Amount',       4),
    ('INDUSTRY_HD_FOOD_BONUS',          'Amount',       3),
    ('INDUSTRY_HD_FOOD_BONUS_FOOD',     'YieldType',    'YIELD_FOOD'),
    ('INDUSTRY_HD_FOOD_BONUS_FOOD',     'Amount',       6),
    ('INDUSTRY_HD_FOOD_BONUS_CULTURE',  'YieldType',    'YIELD_CULTURE'),
    ('INDUSTRY_HD_FOOD_BONUS_CULTURE',  'Amount',       3),
    ('INDUSTRY_HD_AMENITY_BONUS',       'Amount',       2),
    ('INDUSTRY_HD_AMENITY_BONUS_HOUSING', 'Amount',     3),
    ('INDUSTRY_HD_AMENITY_BONUS_UNIT',  'UnitType',     'UNIT_BUILDER,UNIT_SETTLER,UNIT_TRADER'),
    ('INDUSTRY_HD_AMENITY_BONUS_UNIT',  'Amount',       30),
    ('INDUSTRY_HD_WONDER_BONUS',        'Amount',       20),
    ('INDUSTRY_HD_WONDER_BONUS_CULTURE', 'YieldType',    'YIELD_CULTURE'),
    ('INDUSTRY_HD_WONDER_BONUS_CULTURE', 'Amount',       3),
    ('INDUSTRY_HD_TOURISM_BONUS',       'YieldType',    'YIELD_CULTURE'),
    ('INDUSTRY_HD_TOURISM_BONUS',       'Amount',       2),
    ('INDUSTRY_HD_TOURISM_BONUS_GOLD',  'YieldType',    'YIELD_GOLD'),
    ('INDUSTRY_HD_TOURISM_BONUS_GOLD',  'Amount',       4),
    ('INDUSTRY_HD_FISHERY_BONUS',       'YieldType',    'YIELD_GOLD'),
    ('INDUSTRY_HD_FISHERY_BONUS',       'Amount',       3),
    ('INDUSTRY_HD_FISHERY_BONUS_FOOD',  'YieldType',    'YIELD_FOOD'),
    ('INDUSTRY_HD_FISHERY_BONUS_FOOD',  'Amount',       1),
    ('INDUSTRY_HD_FISHERY_BONUS_PROD',  'YieldType',    'YIELD_PRODUCTION'),
    ('INDUSTRY_HD_FISHERY_BONUS_PROD',  'Amount',       1);

insert or replace into ImprovementModifiers
    (ImprovementType,           ModifierId)
values
    -- Duplicate
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_GROWTH_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_GROWTH_BONUS_TRADE'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_FAITH_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_FAITH_BONUS_POP'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_GPP_BONUS_POP_S'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_GPP_BONUS_POP_C'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_TRADER_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_FOOD_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_FOOD_BONUS_FOOD'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_FOOD_BONUS_CULTURE'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_AMENITY_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_AMENITY_BONUS_HOUSING'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_AMENITY_BONUS_UNIT'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_WONDER_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_WONDER_BONUS_CULTURE'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_TOURISM_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_TOURISM_BONUS_GOLD'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_FISHERY_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_FISHERY_BONUS_FOOD'),
    ('IMPROVEMENT_CORPORATION', 'INDUSTRY_HD_FISHERY_BONUS_PROD'),
    -- Corporation (empire wide)
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_GROWTH_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_FAITH_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_GPP_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_TRADER_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_FOOD_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_FOOD_BONUS_HARBOR'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_AMENITY_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_WONDER_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_WONDER_BONUS_DISTRI'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_TOURISM_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_FISHERY_BONUS'),
    ('IMPROVEMENT_CORPORATION', 'CORPORATION_HD_FISHERY_BONUS_CULTURE');

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                                               OwnerRequirementSetId,              SubjectRequirementSetId)
values
    ('CORPORATION_HD_GROWTH_BONUS',         'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',        'HD_GROWTH_BONUS_REQUIREMENTS',     NULL),
    ('CORPORATION_HD_FAITH_BONUS',          'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',  'HD_FAITH_BONUS_REQUIREMENTS',      'CITY_HAS_HOLY_SITE'),
    ('CORPORATION_HD_GPP_BONUS',            'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS',                    'HD_GPP_BONUS_REQUIREMENTS',        NULL),
    ('CORPORATION_HD_TRADER_BONUS',         'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD',                 'HD_TRADER_BONUS_REQUIREMENTS',     NULL),
    ('CORPORATION_HD_FOOD_BONUS',           'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',            'HD_FOOD_BONUS_REQUIREMENTS',       'DISTRICT_IS_COMMERCIAL_HUB'),
    ('CORPORATION_HD_FOOD_BONUS_HARBOR',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',            'HD_FOOD_BONUS_REQUIREMENTS',       'DISTRICT_IS_HARBOR'),
    ('CORPORATION_HD_AMENITY_BONUS',        'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',              'HD_AMENITY_BONUS_REQUIREMENTS',    NULL),
    ('CORPORATION_HD_WONDER_BONUS',         'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION_MODIFIER', 'HD_WONDER_BONUS_REQUIREMENTS',   NULL),
    ('CORPORATION_HD_WONDER_BONUS_DISTRI',  'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION_MODIFIER', 'HD_WONDER_BONUS_REQUIREMENTS',   NULL),
    ('CORPORATION_HD_TOURISM_BONUS',        'MODIFIER_PLAYER_ADJUST_TOURISM',                           'HD_TOURISM_BONUS_REQUIREMENTS',    NULL),
    ('CORPORATION_HD_FISHERY_BONUS',        'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                        'HD_FISHERY_BONUS_REQUIREMENTS',    'HD_PLOT_HAS_FISHERY_REQUIREMENTS'), -- PLOT_HAS_FISHINGBOATS_REQUIREMENTS
    ('CORPORATION_HD_FISHERY_BONUS_CULTURE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',           'HD_FISHERY_BONUS_REQUIREMENTS',    'DISTRICT_IS_HARBOR');

insert or replace into ModifierArguments
    (ModifierId,                        Name,           Value)
values
    ('CORPORATION_HD_GROWTH_BONUS',     'YieldType',    'YIELD_FOOD'),
    ('CORPORATION_HD_GROWTH_BONUS',     'Amount',       10),
    ('CORPORATION_HD_FAITH_BONUS',      'YieldType',    'YIELD_GOLD'),
    ('CORPORATION_HD_FAITH_BONUS',      'Amount',       3),
    ('CORPORATION_HD_GPP_BONUS',        'BonusType',    'GOVERNMENTBONUS_GREAT_PEOPLE'),
    ('CORPORATION_HD_GPP_BONUS',        'Amount',       25),
    ('CORPORATION_HD_TRADER_BONUS',     'YieldType',    'YIELD_GOLD'),
    ('CORPORATION_HD_TRADER_BONUS',     'Amount',       8),
    ('CORPORATION_HD_FOOD_BONUS',       'YieldType',    'YIELD_FOOD'),
    ('CORPORATION_HD_FOOD_BONUS',       'Amount',       5),
    ('CORPORATION_HD_FOOD_BONUS_HARBOR', 'YieldType',   'YIELD_FOOD'),
    ('CORPORATION_HD_FOOD_BONUS_HARBOR', 'Amount',      5),
    ('CORPORATION_HD_AMENITY_BONUS',    'Amount',       1),
    ('CORPORATION_HD_WONDER_BONUS',     'Amount',       10),
    ('CORPORATION_HD_WONDER_BONUS_DISTRI', 'Amount',    10),
    ('CORPORATION_HD_TOURISM_BONUS',    'Amount',       20),
    ('CORPORATION_HD_FISHERY_BONUS',    'YieldType',    'YIELD_SCIENCE'),
    ('CORPORATION_HD_FISHERY_BONUS',    'Amount',       2),
    ('CORPORATION_HD_FISHERY_BONUS_CULTURE', 'YieldType', 'YIELD_CULTURE'),
    ('CORPORATION_HD_FISHERY_BONUS_CULTURE', 'Amount',  3);

delete from ResourceIndustries;
delete from ResourceCorporations;

create table 'HDResourceProducts'(
    'ResourceType' TEXT NOT NULL,
    'ResourceEffect' TEXT,
    'ResourceEffectTExt' TEXT,
    PRIMARY KEY(ResourceType)
    FOREIGN KEY(ResourceType) REFERENCES Resources(ResourceType) ON DELETE CASCADE ON UPDATE CASCADE
);
insert or replace into ResourceIndustries
    (ResourceType,  ResourceEffect, ResourceEffectTExt)
select
    ResourceType,   IndustryEffect, 'LOC_'||IndustryEffect||'_DESCRIPTION'
from HDMonopolyResourceEffects;
insert or replace into ResourceCorporations
    (ResourceType,  ResourceEffect, ResourceEffectTExt)
select
    ResourceType,   CorporationEffect,  'LOC_'||CorporationEffect||'_DESCRIPTION'
from HDMonopolyResourceEffects;
insert or replace into HDResourceProducts
    (ResourceType,  ResourceEffect, ResourceEffectTExt)
select
    ResourceType,   ProductEffect,  'LOC_'||ProductEffect||'_DESCRIPTION'
from HDMonopolyResourceEffects;

-- ====================
-- Requirements
-- ====================
-- Fishery
insert or ignore into Requirements
    (RequirementId,                        RequirementType)
values
    ('HD_REQUIRES_PLOT_HAS_FISHERY',       'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');

insert or ignore into RequirementArguments
    (RequirementId,                        Name,                Value)
values
    ('HD_REQUIRES_PLOT_HAS_FISHERY',       'ImprovementType',   'IMPROVEMENT_FISHERY');

insert or replace into RequirementSets
    (RequirementSetId,                      RequirementSetType)
values
    ('HD_PLOT_HAS_FISHERY_REQUIREMENTS',   'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                      RequirementId)
values
    ('HD_PLOT_HAS_FISHERY_REQUIREMENTS',    'HD_REQUIRES_PLOT_HAS_FISHERY');

-- Resource REQ
-- insert or ignore into RequirementArguments (RequirementId, Name, Value)
--     select 'REQUIRES_' || ResourceType || '_IN_PLOT', 'ResourceType', ResourceType from Resources;
-- insert or ignore into Requirements (RequirementId, RequirementType)
--     select 'REQUIRES_' || ResourceType || '_IN_PLOT', 'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES' from Resources;

insert or replace into RequirementSets (RequirementSetId, RequirementSetType)
    select 'HD_' || Category || '_BONUS_REQUIREMENTS', 'REQUIREMENTSET_TEST_ANY' from HDMonopolyResourceClasses;
insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)
    select 'HD_' || Category || '_BONUS_REQUIREMENTS', 'REQUIRES_' || ResourceType || '_IN_PLOT' from HDMonopolyResourceEffects;

-- ====================
-- Products
-- ====================
update Projects set Cost = 200 where ProjectType like 'PROJECT_CREATE_CORPORATION_PRODUCT_%';

delete from GreatWorkModifiers where GreatWorkType like 'GREATWORK_PRODUCT_%' and ModifierID like 'PRODUCT_%';
-- Tourism
update GreatWorks set Tourism = 6 where GreatWorkType like 'GREATWORK_PRODUCT_%';
update GreatWorks set Tourism = 12 where GreatWorkType in
    (select 'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count
        from HDMonopolyResourceEffects a, HDCounter b where Category = 'TOURISM');

-- Amenity Housing need modifier.
insert or replace into GreatWorkModifiers
    (GreatWorkType,                                                 ModifierId)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'HD_PRODUCT_CITY_HOUSING'
from HDMonopolyResourceEffects a, HDCounter b where Category = 'AMENITY'
and 'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count in (select GreatWorkType from GreatWorks);
insert or replace into GreatWorkModifiers
    (GreatWorkType,                                                 ModifierId)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'HD_PRODUCT_CITY_AMENITY'
from HDMonopolyResourceEffects a, HDCounter b where Category = 'AMENITY'
and 'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count in (select GreatWorkType from GreatWorks);

insert or replace into Modifiers
    (ModifierId,                        ModifierType)
values
    ('HD_PRODUCT_CITY_HOUSING',         'MODIFIER_SINGLE_CITY_ADJUST_CITY_HOUSING_FROM_GREAT_WORKS'),
    ('HD_PRODUCT_CITY_AMENITY',         'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_AMENITY');

insert or replace into ModifierArguments
    (ModifierId,                    Name,           Value)
values
    ('HD_PRODUCT_CITY_HOUSING',     'Amount',       2),
    ('HD_PRODUCT_CITY_AMENITY',     'Amount',       1);

insert or replace into ModifierStrings
    (ModifierId,                    Context,        Text)
values
    ('HD_PRODUCT_CITY_HOUSING',     'Summary',      'LOC_HD_PRODUCT_CITY_HOUSING_DESCRIPTION'),
    ('HD_PRODUCT_CITY_AMENITY',     'Summary',      'LOC_HD_PRODUCT_CITY_AMENITY_DESCRIPTION');

-- Product Yields
delete from GreatWork_YieldChanges where GreatWorkType like 'GREATWORK_PRODUCT_%';
insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_FOOD',       8
from HDMonopolyResourceEffects a, HDCounter b where Category = 'GROWTH';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_FAITH',      5
from HDMonopolyResourceEffects a, HDCounter b where Category = 'FAITH';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_GOLD',       6
from HDMonopolyResourceEffects a, HDCounter b where Category = 'FAITH';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_SCIENCE',    3
from HDMonopolyResourceEffects a, HDCounter b where Category = 'GPP';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_CULTURE',    3
from HDMonopolyResourceEffects a, HDCounter b where Category = 'GPP';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_GOLD',       16
from HDMonopolyResourceEffects a, HDCounter b where Category = 'TRADER';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_FOOD',       4
from HDMonopolyResourceEffects a, HDCounter b where Category = 'FOOD';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_GOLD',       8
from HDMonopolyResourceEffects a, HDCounter b where Category = 'FOOD';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_PRODUCTION', 8
from HDMonopolyResourceEffects a, HDCounter b where Category = 'WONDER';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_CULTURE',    4
from HDMonopolyResourceEffects a, HDCounter b where Category = 'TOURISM';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_SCIENCE',    2
from HDMonopolyResourceEffects a, HDCounter b where Category = 'FISHERY';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_FOOD',       2
from HDMonopolyResourceEffects a, HDCounter b where Category = 'FISHERY';

insert or replace into GreatWork_YieldChanges
    (GreatWorkType,                                                 YieldType,          YieldChange)
select
    'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count, 'YIELD_PRODUCTION', 2
from HDMonopolyResourceEffects a, HDCounter b where Category = 'FISHERY';

-- ====================
-- Leugi Monopoly ++
-- ====================
update Units set Cost = 200, CostProgressionParam1 = 20, PrereqTech = 'TECH_APPRENTICESHIP' where UnitType = 'UNIT_LEU_TYCOON';
update Units set Cost = 500, CostProgressionParam1 = 30 where UnitType = 'UNIT_LEU_INVESTOR';

delete from Unit_BuildingPrereqs where Unit = 'UNIT_LEU_TYCOON';
insert or replace into Unit_BuildingPrereqs
        (Unit,                  PrereqBuilding)
select  UnitType,               'BUILDING_MARKET'
from Units where UnitType = 'UNIT_LEU_TYCOON';

insert or replace into Unit_BuildingPrereqs
        (Unit,                  PrereqBuilding)
select  'UNIT_LEU_TYCOON',        CivUniqueBuildingType
from BuildingReplaces where ReplacesBuildingType = 'BUILDING_MARKET'
and exists (select UnitType from Units where UnitType = 'UNIT_LEU_TYCOON');
