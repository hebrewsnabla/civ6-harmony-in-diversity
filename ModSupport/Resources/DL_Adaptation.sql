-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

delete from Resource_YieldChanges where ResourceType = 'RESOURCE_GOLD' and YieldType = 'YIELD_CULTURE';
update Resource_YieldChanges set YieldChange = 4 where ResourceType = 'RESOURCE_GOLD' and YieldType = 'YIELD_GOLD';
insert or ignore into Resource_ValidTerrains (ResourceType, TerrainType) values
    ('RESOURCE_GOLD',   'TERRAIN_PLAINS'),
    ('RESOURCE_GOLD',   'TERRAIN_PLAINS_HILLS');
delete from Resource_ValidTerrains where ResourceType = 'RESOURCE_LEU_P0K_QUINOA' and TerrainType = 'TERRAIN_DESERT';

insert or ignore into Improvement_ValidResources (ImprovementType, ResourceType, MustRemoveFeature) select
    'IMPROVEMENT_TERRACE_FARM', ResourceType,   0
from Resources where ResourceType = 'RESOURCE_LEU_P0K_QUINOA' or ResourceType = 'RESOURCE_LEU_P0K_POTATOES';

update Resources set Frequency = 4 where ResourceType = 'RESOURCE_LEU_P0K_POTATOES';

delete from Resource_Harvests where ResourceType = 'RESOURCE_SUK_CAMEL' and YieldType = 'YIELD_GOLD';
-- update Resource_YieldChanges set YieldChange = 2 where ResourceType = 'RESOURCE_SUK_CAMEL' and YieldType = 'YIELD_PRODUCTION';
-- delete from Resource_YieldChanges where ResourceType = 'RESOURCE_SUK_CAMEL' and YieldType = 'YIELD_GOLD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_SUK_CHEESE' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_SUK_SHARK' and YieldType = 'YIELD_PRODUCTION';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_P0K_PLUMS' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_CVS_POMEGRANATES' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_LEU_P0K_QUINOA' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_LEU_P0K_YERBAMATE' and YieldType = 'YIELD_FOOD';
delete from Resource_YieldChanges where ResourceType = 'RESOURCE_LEU_P0K_YERBAMATE' and YieldType = 'YIELD_PRODUCTION';
update Resource_YieldChanges set YieldChange = 1 where ResourceType = 'RESOURCE_LEU_P0K_CAPYBARAS' and YieldType = 'YIELD_FOOD';

insert or replace into Resource_YieldChanges (ResourceType, YieldType, YieldChange) select
    ResourceType,    'YIELD_FOOD',   1
from Resources where ResourceType = 'RESOURCE_SUK_CAMEL';

insert or replace into Resource_YieldChanges (ResourceType, YieldType, YieldChange) select
    ResourceType,    'YIELD_FAITH',   1
from Resources where ResourceType = 'RESOURCE_LEU_P0K_YERBAMATE';

insert or replace into Resource_YieldChanges (ResourceType, YieldType, YieldChange) select
    ResourceType,    'YIELD_GOLD',   1
from Resources where ResourceType = 'RESOURCE_SUK_OBSIDIAN'
    or ResourceType = 'RESOURCE_SUK_CHEESE'
    or ResourceType = 'RESOURCE_SUK_SHARK'
    or ResourceType = 'RESOURCE_P0K_PENGUINS'
    or ResourceType = 'RESOURCE_P0K_PLUMS'
    or ResourceType = 'RESOURCE_CVS_POMEGRANATES'
    or ResourceType = 'RESOURCE_LEU_P0K_QUINOA'
    or ResourceType = 'RESOURCE_LEU_P0K_CAPYBARAS'
    or ResourceType = 'RESOURCE_P0K_PAPYRUS'
    or ResourceType = 'RESOURCE_LEU_P0K_YERBAMATE';
