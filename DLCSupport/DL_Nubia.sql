-------------------------------------
--            Nubia DLC            --
-------------------------------------

----start bias for Nubia
insert or replace into StartBiasResources 
    (CivilizationType,      ResourceType,           Tier)
values
    ('CIVILIZATION_NUBIA',  'RESOURCE_GOLD',        3);

update StartBiasResources set Tier = 3 where CivilizationType = 'CIVILIZATION_NUBIA';

-- 努比亚ui可以建造在平原,草原,平原丘陵,草原丘陵,并且当ui建造在沙漠和沙漠丘陵时,基础产出翻倍；努比亚ua：每一种改良的战略矿产资源为城市+10%锤，每一种改良的加成或奢侈矿产资源为城市+10%金币
insert or replace into Improvement_ValidTerrains 
    (ImprovementType,       TerrainType)
values
    ('IMPROVEMENT_PYRAMID', 'TERRAIN_PLAINS'),
    ('IMPROVEMENT_PYRAMID', 'TERRAIN_GRASS_HILLS'),
    ('IMPROVEMENT_PYRAMID', 'TERRAIN_GRASS'),
    ('IMPROVEMENT_PYRAMID', 'TERRAIN_PLAINS_HILLS');

update Improvement_YieldChanges set YieldChange = 1 where ImprovementType ='IMPROVEMENT_PYRAMID' and YieldType = 'YIELD_FOOD';

insert or replace into ImprovementModifiers
    (ImprovementType,       ModifierId)
values
    ('IMPROVEMENT_PYRAMID', 'PYRAMID_DESERT_FOOD'),
    ('IMPROVEMENT_PYRAMID', 'PYRAMID_DESERT_FAITH');

insert or replace into Modifiers
    (ModifierId,                    ModifierType,                               SubjectRequirementSetId)
values
    ('PYRAMID_DESERT_FOOD',         'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',  'PETRA_YIELD_MODIFIER_REQUIREMENTS'),
    ('PYRAMID_DESERT_FAITH',        'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',  'PETRA_YIELD_MODIFIER_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                    Name,           Value)
values
    ('PYRAMID_DESERT_FAITH',        'YieldType',    'YIELD_FAITH'),
    ('PYRAMID_DESERT_FAITH',        'Amount',       2),
    ('PYRAMID_DESERT_FOOD',         'YieldType',    'YIELD_FOOD'),
    ('PYRAMID_DESERT_FOOD',         'Amount',       2);

insert or replace into Improvement_BonusYieldChanges
    (Id,        ImprovementType,            YieldType,      BonusYieldChange,   PrereqCivic)
values 
    (300,       'IMPROVEMENT_PYRAMID',      'YIELD_FOOD',   1,                  'CIVIC_THEOLOGY');

insert or replace into TraitModifiers
    (TraitType,                     ModifierId)
values
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_STRATEGIC_MINE_PRODUCTION_1'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_STRATEGIC_MINE_PRODUCTION_2'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_STRATEGIC_MINE_PRODUCTION_3'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_STRATEGIC_MINE_PRODUCTION_4'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_STRATEGIC_MINE_PRODUCTION_5'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_1'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_2'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_3'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_4'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_5'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_6'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_7'),
    ('TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_8');
insert or replace into Modifiers
    (ModifierId,                                    ModifierType,                                           SubjectRequirementSetId)
values
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_1',           'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_ALUMINUM_REQUIRMENTS'),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_2',           'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_COAL_REQUIRMENTS'),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_3',           'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_IRON_REQUIRMENTS'),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_4',           'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_URANIUM_REQUIRMENTS'),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_5',           'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_NITER_REQUIRMENTS'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_1',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_SALT_REQUIRMENTS'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_2',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_SILVER_REQUIRMENTS'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_3',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_GOLD_REQUIRMENTS'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_4',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_COPPER_REQUIRMENTS'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_5',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_DIAMONDS_REQUIRMENTS'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_6',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_AMBER_REQUIRMENTS'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_7',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_MERCURY_REQUIRMENTS'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_8',   'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_RESOURCE_JADE_REQUIRMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                    Name,           Value)
values  
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_1',           'YieldType',    'YIELD_PRODUCTION'),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_1',           'Amount',       10),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_2',           'YieldType',    'YIELD_PRODUCTION'),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_2',           'Amount',       10),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_3',           'YieldType',    'YIELD_PRODUCTION'),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_3',           'Amount',       10),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_4',           'YieldType',    'YIELD_PRODUCTION'),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_4',           'Amount',       10),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_5',           'YieldType',    'YIELD_PRODUCTION'),
    ('TRAIT_STRATEGIC_MINE_PRODUCTION_5',           'Amount',       10),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_1',   'YieldType',    'YIELD_GOLD'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_1',   'Amount',       10),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_2',   'YieldType',    'YIELD_GOLD'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_2',   'Amount',       10),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_3',   'YieldType',    'YIELD_GOLD'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_3',   'Amount',       10),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_4',   'YieldType',    'YIELD_GOLD'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_4',   'Amount',       10),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_5',   'YieldType',    'YIELD_GOLD'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_5',   'Amount',       10),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_6',   'YieldType',    'YIELD_GOLD'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_6',   'Amount',       10),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_7',   'YieldType',    'YIELD_GOLD'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_7',   'Amount',       10),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_8',   'YieldType',    'YIELD_GOLD'),
    ('TRAIT_BONUS_LUXURY_MINE_GOLD_PERCENTAGE_8',   'Amount',       10);

update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_PYRAMID_DISTRICT_PRODUCTION_MODIFIER' and Name = 'Amount';