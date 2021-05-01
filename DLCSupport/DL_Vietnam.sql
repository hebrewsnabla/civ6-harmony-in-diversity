-------------------------------------
--            Vietnam DLC          --
-------------------------------------

insert or replace into District_CitizenGreatPersonPoints
    (DistrictType,                      GreatPersonClassType,               PointsPerTurn)
values
    ("DISTRICT_THANH",                  "GREAT_PERSON_CLASS_GENERAL",       2);

insert or replace into District_GreatPersonPoints
    (DistrictType,      GreatPersonClassType,           PointsPerTurn)
values
    ('DISTRICT_THANH',  'GREAT_PERSON_CLASS_GENERAL',   2);

insert or replace into DistrictModifiers
    (DistrictType,                      ModifierId)
values
    ('DISTRICT_THANH',                  'ENCAMPMENT_ADD_STONE_PRODUCTION'),
    ('DISTRICT_THANH',                  'BARRACKS_ADD_COPPER_PRODUCTION'),
    ('DISTRICT_THANH',                  'ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION'),
    ('DISTRICT_THANH',                  'ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION');

-- preserve food for both international and domestic traderoute yields
-- insert or replace into District_TradeRouteYields
--     (DistrictType,              YieldType,          YieldChangeAsDomesticDestination,   YieldChangeAsInternationalDestination)
-- values
--     ('DISTRICT_PRESERVE',       'YIELD_FOOD',       1,                                  1),
--     ('DISTRICT_PRESERVE',        'YIELD_FOOD',       0,                                  0);

-------------------------------------------------------------------------------------------------------------------------------
-- Vietnan Civ

-- Vietnam can build districts in all features and do not remove on forest jungle and marsh
-- rainforest +2 food forest +2 production marsh +2 science
-- district itself included

delete from TraitModifiers where ModifierId = 'TRAIT_DISTRICTS_FOREST_ONLY';
delete from TraitModifiers where ModifierId = 'TRAIT_DISTRICTS_MARSH_ONLY';
delete from TraitModifiers where ModifierId = 'TRAIT_DISTRICTS_JUNGLE_ONLY';

insert or replace into TraitModifiers (TraitType,   ModifierId) 
    select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_JUNGLE_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into TraitModifiers (TraitType,   ModifierId) 
    select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_MARSH_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into TraitModifiers (TraitType,   ModifierId) 
    select 'TRAIT_CIVILIZATION_VIETNAM', 'TRAIT_FOREST_VALID_' || DistrictType from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

-- insert or replace into Modifiers    (ModifierId, ModifierType)
--     select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
--     from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into Modifiers    (ModifierId, ModifierType)
    select 'TRAIT_MARSH_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into Modifiers    (ModifierId, ModifierType)
    select 'TRAIT_FOREST_VALID_' || DistrictType, 'MODIFIER_PLAYER_CITIES_ADJUST_VALID_FEATURES_DISTRICTS' 
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';    

-- insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
--     select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'DistrictType', DistrictType
--     from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_MARSH_VALID_' || DistrictType, 'DistrictType', DistrictType
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_FOREST_VALID_' || DistrictType, 'DistrictType', DistrictType
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
-- insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
--     select 'TRAIT_JUNGLE_VALID_' || DistrictType, 'FeatureType', 'FEATURE_JUNGLE'
--     from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_MARSH_VALID_' || DistrictType, 'FeatureType', 'FEATURE_MARSH'
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';
insert or replace into ModifierArguments    (ModifierId,    Name,        Value) 
    select 'TRAIT_FOREST_VALID_' || DistrictType, 'FeatureType', 'FEATURE_FOREST'
    from Districts where DistrictType != 'DISTRICT_CITY_CENTER';

update ModifierArguments set Value = 'YIELD_PRODUCTION' where ModifierId = 'TRAIT_FOREST_BUILDINGS_CULTURE' and Name = 'YieldType';
update ModifierArguments set Value = 'YIELD_FOOD' where ModifierId = 'TRAIT_JUNGLE_BUILDINGS_SCIENCE' and Name = 'YieldType';
update ModifierArguments set Value = 'YIELD_SCIENCE' where ModifierId = 'TRAIT_MARSH_BUILDINGS_PRODUCTION' and Name = 'YieldType';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_FOREST_BUILDINGS_CULTURE' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_JUNGLE_BUILDINGS_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_MARSH_BUILDINGS_PRODUCTION' and Name = 'Amount';

insert or replace into TraitModifiers 
    (TraitType, ModifierId)
values
    ('TRAIT_CIVILIZATION_VIETNAM','TRAIT_JUNGLE_FOOD'),
    ('TRAIT_CIVILIZATION_VIETNAM','TRAIT_WOODS_PRODUCTION'),
    ('TRAIT_CIVILIZATION_VIETNAM','TRAIT_MARSH_SCIENCE');

insert or replace into Modifiers
    (ModifierId,        ModifierType,       SubjectRequirementSetId)
values
    ('TRAIT_JUNGLE_FOOD',       'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',    'ZOO_RAINFOREST_REQUIREMENTS'),
    ('TRAIT_WOODS_PRODUCTION',  'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',    'PLOT_HAS_FOREST_REQUIREMENT'),
    ('TRAIT_MARSH_SCIENCE',     'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',    'ZOO_MARSH_REQUIREMENTS');

insert or replace into ModifierArguments    
    (ModifierId,                    Name,       Value) 
values
    ('TRAIT_JUNGLE_FOOD',           'Amount',       2),
    ('TRAIT_JUNGLE_FOOD',           'YieldType',    'YIELD_FOOD'),
    ('TRAIT_WOODS_PRODUCTION',      'Amount',       2),
    ('TRAIT_WOODS_PRODUCTION',      'YieldType',    'YIELD_PRODUCTION'),
    ('TRAIT_MARSH_SCIENCE',         'Amount',       2),
    ('TRAIT_MARSH_SCIENCE',         'YieldType',    'YIELD_SCIENCE');
