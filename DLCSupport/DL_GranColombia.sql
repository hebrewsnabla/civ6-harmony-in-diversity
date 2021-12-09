-------------------------------------
--        GranColombia DLC         --
-------------------------------------

-- Resource
insert or replace into Resource_YieldChanges  
    (ResourceType,          YieldType,          YieldChange)
values
    ('RESOURCE_HONEY',      'YIELD_GOLD',       1);

-- insert or replace into RequirementSetRequirements 
--     (RequirementSetId,                      RequirementId) 
-- values
--     ('PLOT_HAS_FARM_RESOURCE_REQUIREMENTS', 'REQUIRES_MAIZE_IN_PLOT');

--start bias(camp and pasture resources) for cree
insert or replace into StartBiasResources
    (CivilizationType,      ResourceType,           Tier)
values
    ('CIVILIZATION_CREE',   'RESOURCE_HONEY',       4);

insert or replace into StartBiasResources
    (CivilizationType,              ResourceType,           Tier)
select
    'CIVILIZATION_GRAN_COLOMBIA',   ResourceType,           3
from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_PLANTATION';

---------------------------------------------------------------------------------------------------------------
-- Maya
update Modifiers set SubjectRequirementSetId = 'OBJECT_IS_6_TILES_FROM_CAPITAL_REQUIREMENTS'
    where ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_GAIN_YIELDS';
update Modifiers set SubjectRequirementSetId = 'OBJECT_IS_10_OR_MORE_TILES_FROM_CAPITAL_REQUIREMENTS'
    where ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_LOSE_YIELDS';
update Modifiers set SubjectRequirementSetId = 'OBJECT_IS_6_TILES_FROM_CAPITAL_REQUIREMENTS' where
    ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_GAIN_BUILDER';

-- insert or replace into TraitModifiers (TraitType, ModifierId) values
--     ('TRAIT_CIVILIZATION_MAYAB', 'MAYAB_EXTRA_HOUSING');
-- insert or replace into Modifiers (ModifierId, ModifierType) values
--     ('MAYAB_EXTRA_HOUSING', 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING');
-- insert or replace into ModifierArguments (ModifierId, Name, Value) values
--     ('MAYAB_EXTRA_HOUSING', 'Amount', 1);

-- Gran Colombia
insert or replace into TraitModifiers 
    (TraitType,                                 ModifierId)
values
    ('TRAIT_CIVILIZATION_EJERCITO_PATRIOTA',    'TRAIT_PLANTATION_CULTURE_HD'),
    ('TRAIT_CIVILIZATION_EJERCITO_PATRIOTA',    'TRAIT_PLANTATION_CULTURE_BOMB_HD');

insert or replace into Modifiers 
    (ModifierId,                                ModifierType,                               SubjectRequirementSetId)
values
    ('TRAIT_PLANTATION_CULTURE_HD',             'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',        'PLOT_HAS_PLANTATION_REQUIREMENTS'),
    ('TRAIT_PLANTATION_CULTURE_BOMB_HD',        'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', NULL);

insert into ModifierArguments
    (ModifierId,                                Name,                       Value)
values
    ('TRAIT_PLANTATION_CULTURE_HD',             'YieldType',                'YIELD_CULTURE'),
    ('TRAIT_PLANTATION_CULTURE_HD',             'Amount',                   1),
    ('TRAIT_PLANTATION_CULTURE_BOMB_HD',        'ImprovementType',          'IMPROVEMENT_PLANTATION'),
    ('TRAIT_PLANTATION_CULTURE_BOMB_HD',        'CaptureOwnedTerritory',    0);

-- Hacienda now requires Guilds
update Improvements set PrereqCivic = 'CIVIC_GUILDS' where ImprovementType = 'IMPROVEMENT_HACIENDA';
update Adjacency_YieldChanges set PrereqCivic = 'CIVIC_MERCANTILISM' where ID = 'Hacienda_AdvancedHaciendaAdjacency';
update Adjacency_YieldChanges set PrereqCivic = 'CIVIC_MERCANTILISM' where ID = 'Plantation_AdvancedHaciendaAdjacency';   
update Adjacency_YieldChanges set ObsoleteCivic = 'CIVIC_MERCANTILISM' where ID = 'Hacienda_HaciendaAdjacency';
update Adjacency_YieldChanges set ObsoleteCivic = 'CIVIC_MERCANTILISM' where ID = 'Plantation_HaciendaAdjacency';
update Adjacency_YieldChanges set TilesRequired = 1 , ObsoleteTech = NULL where ID = 'Hacienda_PlantationAdjacency';
-- update Adjacency_YieldChanges set YieldChange = 2 where ID = 'Hacienda_MechanizedPlantationAdjacency';
delete from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_HACIENDA' and YieldChangeId = 'Hacienda_MechanizedPlantationAdjacency';

insert or replace into Improvement_ValidFeatures 
    (ImprovementType,           FeatureType)
values
    ('IMPROVEMENT_HACIENDA',    'FEATURE_JUNGLE');

-- insert or replace into Improvement_ValidTerrains 
--     (ImprovementType,           TerrainType)
-- values
--     ('IMPROVEMENT_HACIENDA',    'TERRAIN_DESERT'),
--     ('IMPROVEMENT_HACIENDA',    'TERRAIN_DESERT_HILLS'),
--     ('IMPROVEMENT_HACIENDA',    'TERRAIN_TUNDRA'),
--     ('IMPROVEMENT_HACIENDA',    'TERRAIN_TUNDRA_HILLS');

---------------------------------------------------------------------------------------------------------------
-- CityStates

-- Batey
insert or replace into Improvement_Adjacencies
    (ImprovementType,               YieldChangeId)
values
    ('IMPROVEMENT_BATEY',           'BATEY_Street_Carnival_Culture'),
    ('IMPROVEMENT_BATEY',           'BATEY_Late_Street_Carnival_Culture');

---------------------------------------------------------------------------------------------------------
--Caguana
update Adjacency_YieldChanges set ObsoleteCivic = 'CIVIC_HUMANISM', AdjacentResource = 1, AdjacentResourceClass = 'NO_RESOURCECLASS'
    where ID = 'Batey_EntertainmentComplexAdjacency' or ID = 'Batey_BonusResourceAdjacency';
update Adjacency_YieldChanges set PrereqCivic = 'CIVIC_HUMANISM', AdjacentResource = 1, AdjacentResourceClass = 'NO_RESOURCECLASS'
    where ID = 'Batey_LateEntertainmentComplexAdjacency' or ID = 'Batey_LateBonusResourceAdjacency';
update Improvement_YieldChanges set YieldChange = 2 where ImprovementType = 'IMPROVEMENT_BATEY';
-- insert or ignore into Improvement_Adjacencies
--     (ImprovementType,               YieldChangeId)
-- values
--     ('IMPROVEMENT_BATEY',           'Batey_LUXURYResourceAdjacency'),
--     ('IMPROVEMENT_BATEY',           'Batey_LateLUXURYResourceAdjacency'),
--     ('IMPROVEMENT_BATEY',           'Batey_STRATEGICResourceAdjacency'),
--     ('IMPROVEMENT_BATEY',           'Batey_LateSTRATEGICResourceAdjacency');
-- insert or ignore into Adjacency_YieldChanges
--     (ID,                                    Description,    YieldType,              YieldChange,    TilesRequired,  PrereqCivic,            ObsoleteCivic,          AdjacentResourceClass)
-- values
--     ('Batey_LUXURYResourceAdjacency',       'Placeholder', 'YIELD_CULTURE',         1,              1,              NULL,                   'CIVIC_EXPLORATION',    'RESOURCECLASS_LUXURY'),
--     ('Batey_LateLUXURYResourceAdjacency',   'Placeholder', 'YIELD_CULTURE',         2,              1,              'CIVIC_EXPLORATION',    NULL,                   'RESOURCECLASS_LUXURY'),
--     ('Batey_STRATEGICResourceAdjacency',    'Placeholder', 'YIELD_CULTURE',         1,              1,              NULL,                   'CIVIC_EXPLORATION',    'RESOURCECLASS_STRATEGIC'),
--     ('Batey_LateSTRATEGICResourceAdjacency','Placeholder', 'YIELD_CULTURE',         2,              1,              'CIVIC_EXPLORATION',    NULL,                   'RESOURCECLASS_STRATEGIC');


-- Singapore
-- MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL
delete from TraitModifiers where TraitType = 'MINOR_CIV_SINGAPORE_TRAIT' and ModifierId = 'MINOR_CIV_SINGAPORE_UNIQUE_INFLUENCE_BONUS';
insert or replace into TraitModifiers 
    (TraitType,                             ModifierId)
values
    ('MINOR_CIV_SINGAPORE_TRAIT',           'SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION'),
    ('MINOR_CIV_SINGAPORE_TRAIT',           'SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY'),
    ('MINOR_CIV_SINGAPORE_TRAIT',           'SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN');

insert or replace into Modifiers 
    (ModifierId,                                                ModifierType,                                                           SubjectRequirementSetId)
values
    ('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION',          'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                                 'PLAYER_IS_SUZERAIN'),
    ('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION_MODIFIER', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',           NULL),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY',                    'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                                 'PLAYER_IS_SUZERAIN'),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY_MODIFIER',           'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_ALLY_ROUTE',       NULL),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN',                'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                                 'PLAYER_IS_SUZERAIN'),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN_MODIFIER',       'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE',   NULL);

insert into ModifierArguments
    (ModifierId,                                                Name,           Value)
values
    ('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION',          'ModifierId',   'SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION_MODIFIER'),
    ('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION_MODIFIER', 'YieldType',    'YIELD_PRODUCTION'),
    ('SINGAPORE_INTERNATIONAL_TRADE_ROUTE_PRODUCTION_MODIFIER', 'Amount',       2),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY',                    'ModifierId',   'SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY_MODIFIER'),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY_MODIFIER',           'YieldType',    'YIELD_GOLD'),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_ALLY_MODIFIER',           'Amount',       4),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN',                'ModifierId',   'SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN_MODIFIER'),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN_MODIFIER',       'YieldType',    'YIELD_GOLD'),
    ('SINGAPORE_TRADE_ROUTE_GOLD_FROM_SUZERAIN_MODIFIER',       'Amount',       4);

-- Vatican City
delete from TraitModifiers where TraitType = 'MINOR_CIV_VATICAN_CITY_TRAIT' and ModifierId = 'MINOR_CIV_VATICAN_CITY_UNIQUE_INFLUENCE_BONUS';
insert into TraitModifiers 
    (TraitType,                                  ModifierId)
values
    --Vatican City
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS'),
    ('MINOR_CIV_VATICAN_CITY_TRAIT',             'MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS');


insert into Modifiers
    (ModifierId,                                        ModifierType,                                       SubjectRequirementSetId)
values
    --Vatican City
    ('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS',    'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS',      'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS',  'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS',    'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS',  'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS',    'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS',   'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS',     'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS',  'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS',    'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS',      'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1',   'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1',     'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1',   'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1',   'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1',  'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1',    'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1', 'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1',   'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null),
    ('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1',     'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD',    null);

insert into ModifierArguments
    (ModifierId,                                        Name,            Value)
values
    --Vatican City
    ('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS',    'ModifierId',    'MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS',      'ModifierId',    'MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS',  'ModifierId',    'MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS',    'ModifierId',    'MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS',  'ModifierId',    'MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS',    'ModifierId',    'MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS',   'ModifierId',    'MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS',     'ModifierId',    'MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS',  'ModifierId',    'MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS',    'ModifierId',    'MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS',      'ModifierId',    'MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1'),
    ('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1',   'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING'),
    ('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1',   'YieldType',     'YIELD_CULTURE'),
    ('MINOR_CIV_VATICAN_CITY_WRITING_CULTURE_BONUS1',   'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1',     'GreatWorkObjectType', 'GREATWORKOBJECT_WRITING'),
    ('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1',     'YieldType',     'YIELD_FAITH'),
    ('MINOR_CIV_VATICAN_CITY_WRITING_FAITH_BONUS1',     'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1', 'GreatWorkObjectType', 'GREATWORKOBJECT_SCULPTURE'),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1', 'YieldType',     'YIELD_CULTURE'),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_CULTURE_BONUS1', 'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1',   'GreatWorkObjectType', 'GREATWORKOBJECT_SCULPTURE'),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1',   'YieldType',     'YIELD_FAITH'),
    ('MINOR_CIV_VATICAN_CITY_SCULPTURE_FAITH_BONUS1',   'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1', 'GreatWorkObjectType', 'GREATWORKOBJECT_LANDSCAPE'),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1', 'YieldType',     'YIELD_CULTURE'),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_CULTURE_BONUS1', 'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1',   'GreatWorkObjectType', 'GREATWORKOBJECT_LANDSCAPE'),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1',   'YieldType',     'YIELD_FAITH'),
    ('MINOR_CIV_VATICAN_CITY_LANDSCAPE_FAITH_BONUS1',   'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1',  'GreatWorkObjectType', 'GREATWORKOBJECT_PORTRAIT'),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1',  'YieldType',     'YIELD_CULTURE'),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_CULTURE_BONUS1',  'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1',    'GreatWorkObjectType', 'GREATWORKOBJECT_PORTRAIT'),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1',    'YieldType',     'YIELD_FAITH'),
    ('MINOR_CIV_VATICAN_CITY_PORTRAIT_FAITH_BONUS1',    'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1', 'GreatWorkObjectType', 'GREATWORKOBJECT_RELIGIOUS'),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1', 'YieldType',     'YIELD_CULTURE'),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_CULTURE_BONUS1', 'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1',   'GreatWorkObjectType', 'GREATWORKOBJECT_RELIGIOUS'),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1',   'YieldType',     'YIELD_FAITH'),
    ('MINOR_CIV_VATICAN_CITY_RELIGIOUS_FAITH_BONUS1',   'YieldChange',   2),
    ('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1',     'GreatWorkObjectType', 'GREATWORKOBJECT_RELIC'),
    ('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1',     'YieldType',     'YIELD_CULTURE'),
    ('MINOR_CIV_VATICAN_CITY_RELIC_CULTURE_BONUS1',     'YieldChange',   3);

--Lahore_Nihang
update Units set Cost = 80 where UnitType = 'UNIT_LAHORE_NIHANG';
insert or replace into BuildingModifiers
	(BuildingType,						    ModifierId)
values
	('BUILDING_BARRACKS',					'LAHORE_NIHANG_BARRACKS_ADD_PURCHASE_COST'),
	('BUILDING_ARMORY',						'LAHORE_NIHANG_ARMORY_ADD_PURCHASE_COST'),
	('BUILDING_MILITARY_ACADEMY',			'LAHORE_NIHANG_ACADEMY_ADD_PURCHASE_COST');

insert or replace into BuildingModifiers
    (BuildingType,                          ModifierId)
select
    'BUILDING_BASILIKOI_PAIDES',           'LAHORE_NIHANG_BARRACKS_ADD_PURCHASE_COST'
where exists (select BuildingType from Buildings where BuildingType = 'BUILDING_BASILIKOI_PAIDES');

insert or replace into Modifiers
	(ModifierId,									ModifierType,									   			 SubjectRequirementSetId,       SubjectStackLimit)
values
	('LAHORE_NIHANG_BARRACKS_ADD_PURCHASE_COST',	'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',          NULL,                          1),
	('LAHORE_NIHANG_ARMORY_ADD_PURCHASE_COST',		'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',          NULL,                          1),
	('LAHORE_NIHANG_ACADEMY_ADD_PURCHASE_COST',		'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PURCHASE_COST',          NULL,                          1);

insert or replace into ModifierArguments
	(ModifierId,                                    Name,            Value)
values
	('LAHORE_NIHANG_BARRACKS_ADD_PURCHASE_COST',	'UnitType',     'UNIT_LAHORE_NIHANG'),
    ('LAHORE_NIHANG_BARRACKS_ADD_PURCHASE_COST',	'Amount',       -50),
	('LAHORE_NIHANG_ARMORY_ADD_PURCHASE_COST',		'UnitType',     'UNIT_LAHORE_NIHANG'),
    ('LAHORE_NIHANG_ARMORY_ADD_PURCHASE_COST',		'Amount',       -100),
	('LAHORE_NIHANG_ACADEMY_ADD_PURCHASE_COST',		'UnitType',     'UNIT_LAHORE_NIHANG'),
    ('LAHORE_NIHANG_ACADEMY_ADD_PURCHASE_COST',		'Amount',       -150);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
	('ABILITY_BYPASS_WALLS_PROMOTION_CLASS',				'BYPASS_WALLS_LAHORE_NIHANG'),
	('ABILITY_ENABLE_WALL_ATTACK_PROMOTION_CLASS',			'ENABLE_WALL_ATTACK_LAHORE_NIHANG');

insert or replace into Modifiers
	(ModifierId,									ModifierType)
values
	('BYPASS_WALLS_LAHORE_NIHANG',					'MODIFIER_PLAYER_UNIT_ADJUST_BYPASS_WALLS_PROMOTION_CLASS'),
	('ENABLE_WALL_ATTACK_LAHORE_NIHANG',			'MODIFIER_PLAYER_UNIT_ADJUST_ENABLE_WALL_ATTACK_PROMOTION_CLASS');

insert or replace into ModifierArguments
	(ModifierId,									Name,		        Value)
values
	('BYPASS_WALLS_LAHORE_NIHANG',					'PromotionClass',   'PROMOTION_CLASS_NIHANG'),
	('ENABLE_WALL_ATTACK_LAHORE_NIHANG',			'PromotionClass',   'PROMOTION_CLASS_NIHANG');