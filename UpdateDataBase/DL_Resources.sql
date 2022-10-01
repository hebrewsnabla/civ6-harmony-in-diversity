-------------------------------------
--      Resources Adjustment       --
-------------------------------------



update Resources set Frequency = 11 where ResourceType = 'RESOURCE_COAL';
update Resources set Frequency = 11 where ResourceType = 'RESOURCE_IRON';
update Resources set Frequency = 11 where ResourceType = 'RESOURCE_NITER';
update Resources set Frequency = 11 where ResourceType = 'RESOURCE_OIL';
update Resources set Frequency = 10 where ResourceType = 'RESOURCE_ALUMINUM';

-- add more sheeps and copper.
update Resources set Frequency = 8 where ResourceType = 'RESOURCE_SHEEP';
update Resources set Frequency = 8 where ResourceType = 'RESOURCE_COPPER';

-- 
update Resource_Harvests set YieldType =  'YIELD_PRODUCTION' , Amount = 40  where ResourceType = 'RESOURCE_COPPER';
delete from Resource_ValidTerrains where ResourceType = 'RESOURCE_COPPER' and TerrainType = 'TERRAIN_SNOW_HILLS';
update Resource_YieldChanges  set YieldType =  'YIELD_PRODUCTION' ,  YieldChange = 1 where ResourceType = 'RESOURCE_COPPER';

delete from Resource_ValidTerrains where ResourceType = 'RESOURCE_OIL' and TerrainType = 'TERRAIN_SNOW';

insert or replace into Resource_Harvests (ResourceType, YieldType, Amount, PrereqTech) select
	ResourceType, 'YIELD_PRODUCTION', 40, PrereqTech from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into Resource_Harvests (ResourceType, YieldType, Amount, PrereqTech) select
	ResourceType, 'YIELD_GOLD', 80, NULL from Resources where ResourceClassType = 'RESOURCECLASS_LUXURY';

insert or replace into Resource_Harvests (ResourceType, YieldType, Amount, PrereqTech) values
	('RESOURCE_ANTIQUITY_SITE',	'YIELD_CULTURE',	40,		NULL),
	('RESOURCE_SHIPWRECK',		'YIELD_CULTURE',	40,		NULL);

update Resource_Harvests set PrereqTech = 'TECH_SAILING' where ResourceType in
	(select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_FISHING_BOATS');
update Resource_Harvests set PrereqTech = 'TECH_IRRIGATION' where ResourceType in
	(select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_PLANTATION');
update Resource_Harvests set PrereqTech = 'TECH_MASONRY' where ResourceType in
	(select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_QUARRY');
update Resource_Harvests set PrereqTech = 'TECH_MINING' where ResourceType in
	(select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_MINE');
update Resource_Harvests set PrereqTech = 'TECH_ANIMAL_HUSBANDRY' where ResourceType in
	(select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_PASTURE');
update Resource_Harvests set PrereqTech = 'TECH_ANIMAL_HUSBANDRY' where ResourceType in
	(select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_CAMP');
update Resource_Harvests set PrereqTech = 'TECH_POTTERY' where ResourceType in
	(select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_FARM');
update Resource_Harvests set PrereqTech = 'TECH_BRONZE_WORKING' where ResourceType in
	(select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_LUMBER_MILL');

delete from Resource_Harvests where
	   ResourceType = 'RESOURCE_CLOVES'
	or ResourceType = 'RESOURCE_CINNAMON'
	or ResourceType = 'RESOURCE_TOYS'
	or ResourceType = 'RESOURCE_COSMETICS'
	or ResourceType = 'RESOURCE_PERFUME'
	or ResourceType = 'RESOURCE_JEANS';

-- Monopoly Resource Gold
update RequirementArguments set Value = 'RESOURCE_DIAMONDS, RESOURCE_GOLD, RESOURCE_JADE, RESOURCE_SILVER, RESOURCE_TRUFFLES'
	where Name = 'ResourceType' and RequirementId = 'REQUIREMENT_GOLD_BONUS_RESOURCE';

-- Harvest & chopping
update Resource_Harvests set Amount = 32 where YieldType = 'YIELD_FOOD';
update Resource_Harvests set Amount = 32 where YieldType = 'YIELD_PRODUCTION';
update Resource_Harvests set Amount = 64 where YieldType = 'YIELD_GOLD';
update Feature_Removes set Yield = 24 where FeatureType = 'FEATURE_FOREST';
update Feature_Removes set Yield = 24 where FeatureType = 'FEATURE_MARSH';
update Feature_Removes set Yield = 12 where FeatureType = 'FEATURE_JUNGLE' and YieldType = 'YIELD_FOOD';
update Feature_Removes set Yield = 12 where FeatureType = 'FEATURE_JUNGLE' and YieldType = 'YIELD_PRODUCTION';
-- Suk ocean
update Feature_Removes set Yield = 24 where FeatureType = 'FEATURE_SUK_KELP';

insert or replace into TechnologyModifiers (TechnologyType, ModifierId)
values ('TECH_MACHINERY', 'HD_TECH_INCREASE_HARVEST_YIELD');

insert or replace into Modifiers    (ModifierId,    ModifierType)
values ('HD_TECH_INCREASE_HARVEST_YIELD',   'MODIFIER_PLAYER_CITIES_ADJUST_RESOURCE_HARVEST_BONUS');

insert or replace into ModifierArguments    (ModifierId,    Name,   Value)
values ('HD_TECH_INCREASE_HARVEST_YIELD',   'Amount',   50);

delete from Resource_ValidTerrains where ResourceType = 'RESOURCE_STONE';


insert or replace into Resource_ValidFeatures
	(ResourceType,				FeatureType)
values
	('RESOURCE_STONE',			'FEATURE_GEOTHERMAL_FISSURE'),
	('RESOURCE_COPPER',			'FEATURE_GEOTHERMAL_FISSURE'),
	('RESOURCE_IRON',			'FEATURE_GEOTHERMAL_FISSURE'),
	('RESOURCE_IRON',			'FEATURE_JUNGLE'),
	('RESOURCE_PEARLS',			'FEATURE_REEF'),
	('RESOURCE_SALT',			'FEATURE_MARSH'),
    ('RESOURCE_ALUMINUM',       'FEATURE_MARSH'),
    ('RESOURCE_GYPSUM',       	'FEATURE_MARSH'),
    ('RESOURCE_COAL',       	'FEATURE_MARSH'),
    ('RESOURCE_AMBER',       	'FEATURE_MARSH');

insert or replace into Resource_ValidFeatures
	(ResourceType,				FeatureType)
select
	'RESOURCE_PEARLS',			'FEATURE_SUK_KELP'
where exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');

insert or replace into Resource_ValidTerrains
	(ResourceType,				TerrainType)
values
	('RESOURCE_STONE',			'TERRAIN_PLAINS'),
	('RESOURCE_STONE',			'TERRAIN_PLAINS_HILLS'),
	('RESOURCE_OLIVES',			'TERRAIN_GRASS_HILLS');

delete from Feature_ValidTerrains where FeatureType = 'FEATURE_GEOTHERMAL_FISSURE' and (TerrainType = 'TERRAIN_SNOW' or TerrainType = 'TERRAIN_SNOW_HILLS');

update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_MINE';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_QUARRY';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_FARM';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_PASTURE';
update Improvement_ValidResources set MustRemoveFeature = 0 where ImprovementType = 'IMPROVEMENT_FISHING_BOATS';

--硝石和铝产量多+1 （Resource_Consumption）
update Resource_Consumption set ImprovedExtractionRate = ImprovedExtractionRate +1 where ResourceType = 'RESOURCE_NITER';
update Resource_Consumption set ImprovedExtractionRate = ImprovedExtractionRate +1 where ResourceType = 'RESOURCE_ALUMINUM';

-- update Technologies set Description = 'LOC_TECH_MACHINERY_HD_ALT_DESCRIPTION' where TechnologyType ='TECH_MACHINERY';

-- 泛滥螃蟹
update Resources set Frequency = 4 where ResourceType = 'RESOURCE_CRABS';

insert or replace into Resource_ValidFeatures
	(ResourceType,				FeatureType)
values
    ('RESOURCE_CRABS',          'FEATURE_FLOODPLAINS_GRASSLAND'),
    ('RESOURCE_CRABS',          'FEATURE_FLOODPLAINS_PLAINS');

insert or replace into Improvement_ValidResources
    (ImprovementType,      ResourceType,           MustRemoveFeature)
values
    ('IMPROVEMENT_CAMP',   'RESOURCE_CRABS',       0);