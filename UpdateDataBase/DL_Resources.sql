-------------------------------------
--      Resources Adjustment       --
-------------------------------------



update Resources set Frequency = 11 where ResourceType = 'RESOURCE_COAL';
update Resources set Frequency = 11 where ResourceType = 'RESOURCE_IRON';
update Resources set Frequency = 11 where ResourceType = 'RESOURCE_NITER';
update Resources set Frequency = 11 where ResourceType = 'RESOURCE_OIL';

-- add more sheeps and copper.
update Resources set Frequency = 8 where ResourceType = 'RESOURCE_SHEEP';
update Resources set Frequency = 8 where ResourceType = 'RESOURCE_COPPER';
-- remove some maize. 
update Resources set Frequency = 4 where ResourceType = 'RESOURCE_MAIZE';
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

update Resource_Harvests set PrereqTech = 'TECH_CELESTIAL_NAVIGATION' where ResourceType in
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
