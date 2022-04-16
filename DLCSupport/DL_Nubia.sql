-------------------------------------
--            Nubia DLC            --
-------------------------------------

----start bias for Nubia
insert or replace into StartBiasResources 
    (CivilizationType,      ResourceType,           Tier)
values
    ('CIVILIZATION_NUBIA',  'RESOURCE_GOLD',        3);

update StartBiasResources set Tier = 3 where CivilizationType = 'CIVILIZATION_NUBIA';

-- 努比亚ui可以建造在平原,草原,平原丘陵,草原丘陵,并且当ui建造在沙漠和沙漠丘陵时,基础产出翻倍；努比亚ua：每一种改良的加成或战略矿产资源为城市+10%锤
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_TA_SETI' and (ModifierId = 'TRAIT_LUXURY_MINE_GOLD' or ModifierId = 'TRAIT_BONUS_MINE_GOLD');
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
    ('TRAIT_CIVILIZATION_TA_SETI',  'HD_BONUS_MINE_GOLD'),
	('TRAIT_CIVILIZATION_TA_SETI',  'HD_LUXURY_MINE_GOLD');

insert or replace into Modifiers
    (ModifierId,                                    ModifierType,                                           SubjectRequirementSetId)
values
    ('HD_BONUS_MINE_GOLD',                       'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                    'PLOT_HAS_BONUS_MINE_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                    Name,           Value)
values  
    ('HD_BONUS_MINE_GOLD',						'YieldType',    'YIELD_GOLD'),
    ('HD_BONUS_MINE_GOLD',						'Amount',       2);

-- update ModifierArguments set Value = 10 where ModifierId = 'TRAIT_PYRAMID_DISTRICT_PRODUCTION_MODIFIER' and Name = 'Amount';

create TEMPORARY table 'Nubia_Resource'(
    'ResourceType' Text NOT NULL
);

create TEMPORARY table 'Nubia_Resource1'(
    'ResourceType' Text NOT NULL
);

insert or replace into Nubia_Resource
    (ResourceType)
select
    i.ResourceType
from Resources i, Improvement_ValidResources j
where i.ResourceType = j.ResourceType and (i.ResourceClassType = 'RESOURCECLASS_BONUS' or i.ResourceClassType = 'RESOURCECLASS_LUXURY') and j.ImprovementType = 'IMPROVEMENT_MINE';

insert or replace into Nubia_Resource1
    (ResourceType)
select
    i.ResourceType
from Resources i, Improvement_ValidResources j
where i.ResourceType = j.ResourceType and i.ResourceClassType = 'RESOURCECLASS_STRATEGIC' and j.ImprovementType = 'IMPROVEMENT_MINE';

insert or replace into TraitModifiers
    (TraitType,                     ModifierId)
select
    'TRAIT_CIVILIZATION_TA_SETI',  'TRAIT_' || ResourceType || '_MINE_GOLD_PERCENTAGE'
from Nubia_Resource;

insert or replace into Modifiers
    (ModifierId,                                                     ModifierType,                                           SubjectRequirementSetId)
select
    'TRAIT_' || ResourceType || '_MINE_GOLD_PERCENTAGE',     'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'HD_CITY_HAS_IMPROVED_' || ResourceType || '_REQUIRMENTS'
from Nubia_Resource;

insert or replace into ModifierArguments
    (ModifierId,                                                     Name,           Value)
select
    'TRAIT_' || ResourceType || '_MINE_GOLD_PERCENTAGE',     'YieldType',    'YIELD_GOLD'
from Nubia_Resource;

insert or replace into ModifierArguments
    (ModifierId,                                                     Name,           Value)
select
    'TRAIT_' || ResourceType || '_MINE_GOLD_PERCENTAGE',     'Amount',       10
from Nubia_Resource;

insert or replace into TraitModifiers (TraitType, ModifierId) select
	'TRAIT_CIVILIZATION_TA_SETI',    'TRAIT_'||ResourceType||'_MINE_PRODUCTION_RATIO'
from Nubia_Resource1;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) select
    'TRAIT_'||ResourceType||'_MINE_PRODUCTION_RATIO', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',  'HD_CITY_HAS_IMPROVED_' || ResourceType || '_REQUIRMENTS'
from Nubia_Resource1;

insert or replace into ModifierArguments (ModifierId, Name, Value) select
    'TRAIT_'||ResourceType||'_MINE_PRODUCTION_RATIO', 'YieldType',  'YIELD_PRODUCTION'
from Nubia_Resource1;

insert or replace into ModifierArguments (ModifierId, Name, Value) select
    'TRAIT_'||ResourceType||'_MINE_PRODUCTION_RATIO', 'Amount',  10
from Nubia_Resource1;