--------------------------------
--  Civ Rework -- Netherlands --
--------------------------------

update StartBiasRivers set Tier = 3 where CivilizationType = 'CIVILIZATION_NETHERLANDS';
update StartBiasTerrains set Tier = 3 where CivilizationType = 'CIVILIZATION_NETHERLANDS' and TerrainType = 'TERRAIN_COAST';

update Improvements set ValidAdjacentTerrainAmount = 2 where ImprovementType = 'IMPROVEMENT_POLDER';

delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_GROTE_RIVIEREN' and ModifierId = 'TRAIT_CAMPUS_RIVER_ADJACENCY';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_GROTE_RIVIEREN' and ModifierId = 'TRAIT_INDUSTRIAL_ZONE_RIVER_ADJACENCY';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_GROTE_RIVIEREN' and ModifierId = 'TRAIT_THEATER_DISTRICT_RIVER_ADJACENCY';
delete from TraitModifiers where TraitType = 'TRAIT_RADIO_ORANJE';

insert or replace into TraitModifiers (TraitType, ModifierId) values
    -- ('TRAIT_RADIO_ORANJE',                  'TRAIT_TRADER_SPEEDUP'),
    ('TRAIT_CIVILIZATION_GROTE_RIVIEREN',   'TRAIT_SHIPYARD_TRADE_ROUTE'),
    ('TRAIT_CIVILIZATION_GROTE_RIVIEREN',   'TRAIT_BOOST_BUILDING_SHIPYARD');

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) values
    ('TRAIT_TRADER_SPEEDUP',                'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION',         NULL),
    ('TRAIT_SHIPYARD_TRADE_ROUTE',          'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               NULL),
    ('TRAIT_SHIPYARD_TRADE_ROUTE_MODIFIER', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',          'BUILDING_IS_SHIPYARD'),
    ('TRAIT_BOOST_BUILDING_SHIPYARD',       'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',    NULL);

insert or replace into ModifierArguments (ModifierId, Name, Value) values
    ('TRAIT_TRADER_SPEEDUP',                'UnitType',     'UNIT_TRADER'),
    ('TRAIT_TRADER_SPEEDUP',                'Amount',       50),
    ('TRAIT_SHIPYARD_TRADE_ROUTE',          'ModifierId',   'TRAIT_SHIPYARD_TRADE_ROUTE_MODIFIER'),
    ('TRAIT_SHIPYARD_TRADE_ROUTE_MODIFIER', 'Amount',       1),
    ('TRAIT_BOOST_BUILDING_SHIPYARD',       'BuildingType', 'BUILDING_SHIPYARD'),
    ('TRAIT_BOOST_BUILDING_SHIPYARD',       'Amount',       50);

-- From Others
insert or replace into DistrictModifiers (DistrictType, ModifierId)
select DistrictType, DistrictType || '_' || YieldType || '_FROM_OTHERS'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select DistrictType || '_' || YieldType || '_FROM_OTHERS',
    'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS',
    'NETHERLANDS_REQUIREMENTS'
    -- NULL -- 'RADIO_ORANJE_TRAIT_REQUIREMENTS'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FROM_OTHERS', 'YieldType', YieldType
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FROM_OTHERS', 'Amount', YieldChangeAsInternationalDestination
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

-- For International
insert or replace into DistrictModifiers (DistrictType, ModifierId)
select DistrictType, DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
select DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL',
    'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',
    'NETHERLANDS_REQUIREMENTS'
    -- NULL -- 'RADIO_ORANJE_TRAIT_REQUIREMENTS'
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL', 'YieldType', YieldType
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select DistrictType || '_' || YieldType || '_FOR_INTERNATIONAL', 'Amount', YieldChangeAsInternationalDestination
from District_TradeRouteYields
where DistrictType != 'DISTRICT_CITY_CENTER' and YieldChangeAsInternationalDestination != 0;

-- The trade route extra yields should be Leader Ability by design,
-- but the requirement REQUIREMENT_PLAYER_HAS_CIVILIZATION_OR_LEADER_TRAIT failed.
-- So we have to use REQUIREMENT_PLAYER_TYPE_MATCHES and it is actually tied to Civlization.
-- Requirement

insert or replace into Requirements (RequirementId, RequirementType) values
    ('REQUIRES_PLAYER_IS_NETHERLANDS', 'REQUIREMENT_PLAYER_TYPE_MATCHES');

insert or replace into RequirementArguments (RequirementId, Name, Value) values
    ('REQUIRES_PLAYER_IS_NETHERLANDS', 'CivilizationType', 'CIVILIZATION_NETHERLANDS');

insert or replace into RequirementSets (RequirementSetId, RequirementSetType) values
    ('NETHERLANDS_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId) values
    ('NETHERLANDS_REQUIREMENTS', 'REQUIRES_PLAYER_IS_NETHERLANDS');

-- insert or replace into Requirements (RequirementId, RequirementType) values
--     ('REQUIRES_PLAYER_HAS_RADIO_ORANJE_TRAIT', 'REQUIREMENT_PLAYER_HAS_CIVILIZATION_OR_LEADER_TRAIT');

-- insert or replace into RequirementArguments (RequirementId, Name, Value) values
--     ('REQUIRES_PLAYER_HAS_RADIO_ORANJE_TRAIT', 'TraitType', 'TRAIT_RADIO_ORANJE');
--     -- ('REQUIRES_PLAYER_HAS_RADIO_ORANJE_TRAIT', 'TraitType', 'TRAIT_CIVILIZATION_GROTE_RIVIEREN');

-- insert or replace into RequirementSets (RequirementSetId, RequirementSetType) values
--     ('RADIO_ORANJE_TRAIT_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

-- insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId) values
--     ('RADIO_ORANJE_TRAIT_REQUIREMENTS', 'REQUIRES_PLAYER_HAS_RADIO_ORANJE_TRAIT');
