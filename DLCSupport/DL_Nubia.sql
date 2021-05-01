-------------------------------------
--            Nubia DLC            --
-------------------------------------

-- 努比亚ui可以建造在平原,草原,平原丘陵,草原丘陵,并且当ui建造在沙漠和沙漠丘陵时,基础产出翻倍
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
