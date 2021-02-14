-------------------------------------
--      Resources Adjustment       --
-------------------------------------

-- add more sheeps and copper.
update Resources set Frequency = 8 where ResourceType = 'RESOURCE_SHEEP';
update Resources set Frequency = 8 where ResourceType = 'RESOURCE_COPPER';
update Resource_Harvests set YieldType =  'YIELD_PRODUCTION' , Amount = 20  where ResourceType = 'RESOURCE_COPPER';
delete from Resource_ValidTerrains where ResourceType = 'RESOURCE_COPPER' and TerrainType = 'TERRAIN_SNOW_HILLS';
update Resource_YieldChanges  set YieldType =  'YIELD_PRODUCTION' ,  YieldChange = 1 where ResourceType = 'RESOURCE_COPPER';


insert or replace into Resource_Harvests (ResourceType, YieldType, Amount, PrereqTech) select
	ResourceType, 'YIELD_PRODUCTION', 40, PrereqTech from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into Resource_Harvests (ResourceType, YieldType, Amount, PrereqTech) select
	ResourceType, 'YIELD_GOLD', 80, NULL from Resources where ResourceClassType = 'RESOURCECLASS_LUXURY';

delete from Resource_Harvests where
	   ResourceType = 'RESOURCE_CLOVES'
	or ResourceType = 'RESOURCE_CINNAMON'
	or ResourceType = 'RESOURCE_TOYS'
	or ResourceType = 'RESOURCE_COSMETICS'
	or ResourceType = 'RESOURCE_PERFUME'
	or ResourceType = 'RESOURCE_JEANS';

update Resource_Harvests set PrereqTech = 'TECH_IRRIGATION' where
	   ResourceType = 'RESOURCE_CITRUS'
	or ResourceType = 'RESOURCE_COCOA'
	or ResourceType = 'RESOURCE_COFFEE'
	or ResourceType = 'RESOURCE_COTTON'
	or ResourceType = 'RESOURCE_DYES'
	or ResourceType = 'RESOURCE_INCENSE'
	or ResourceType = 'RESOURCE_OLIVES'
	or ResourceType = 'RESOURCE_SILK'
	or ResourceType = 'RESOURCE_SPICES'
	or ResourceType = 'RESOURCE_SUGAR'
	or ResourceType = 'RESOURCE_TEA'
	or ResourceType = 'RESOURCE_TOBACCO'
	or ResourceType = 'RESOURCE_WINE';

update Resource_Harvests set PrereqTech = 'TECH_MINING' where
	   ResourceType = 'RESOURCE_AMBER'
	or ResourceType = 'RESOURCE_DIAMONDS'
	or ResourceType = 'RESOURCE_JADE'
	or ResourceType = 'RESOURCE_MERCURY'
	or ResourceType = 'RESOURCE_SALT'
	or ResourceType = 'RESOURCE_SILVER'
	or ResourceType = 'RESOURCE_GOLD';

update Resource_Harvests set PrereqTech = 'TECH_ANIMAL_HUSBANDRY' where
	   ResourceType = 'RESOURCE_FURS'
	or ResourceType = 'RESOURCE_HONEY'
	or ResourceType = 'RESOURCE_IVORY'
	or ResourceType = 'RESOURCE_TRUFFLES';

update Resource_Harvests set PrereqTech = 'TECH_MASONRY' where
	   ResourceType = 'RESOURCE_GYPSUM'
	or ResourceType = 'RESOURCE_MARBLE';

update Resource_Harvests set PrereqTech = 'TECH_CELESTIAL_NAVIGATION' where
	   ResourceType = 'RESOURCE_PEARLS'
	or ResourceType = 'RESOURCE_TURTLES'
	or ResourceType = 'RESOURCE_WHALES';

-- failed
-- update Resource_Harvests, Improvement_ValidResources set Resource_Harvests.PrereqTech = 'TECH_IRRIGATION'
-- 	where Resource_Harvests.ResourceType = Improvement_ValidResources.ResourceType
-- 	and Improvement_ValidResources.ImprovementType = 'IMPROVEMENT_PLANTATION';

-- update Resource_Harvests, Improvement_ValidResources set Resource_Harvests.PrereqTech = 'TECH_ANIMAL_HUSBANDRY'
-- 	where Resource_Harvests.ResourceType = Improvement_ValidResources.ResourceType
-- 	and Improvement_ValidResources.ImprovementType = 'IMPROVEMENT_CAMP';

--add industries and corporation improvement&effect to gold
--insert or replace into ResourceCorporations
	--(ResourceType,	ResourceEffect,	ResourceEffectTExt)
--values
--('RESOURCE_GOLD','CORPORATION_GOLD_YIELD_BONUS','LOC_CORPORATION_GOLD_YIELD_BONUS_DESCRIPTION');

--insert or replace into ResourceIndustries
	--(ResourceType,	ResourceEffect,	ResourceEffectTExt)
--values
--('RESOURCE_GOLD','INDUSTRY_GOLD_YIELD_BONUS','LOC_INDUSTRY_GOLD_YIELD_BONUS_DESCRIPTION');

--insert or replace into Improvement_ValidResources
	--(ImprovementType,	ResourceType,	MustRemoveFeature)
--values
--('IMPROVEMENT_CORPORATION','RESOURCE_GOLD',1),
--('IMPROVEMENT_INDUSTRY','RESOURCE_GOLD',1);

update RequirementArguments set Value = 'RESOURCE_DIAMONDS, RESOURCE_GOLD, RESOURCE_JADE, RESOURCE_SILVER, RESOURCE_TRUFFLES'
	where Name = 'ResourceType' and RequirementId = 'REQUIREMENT_GOLD_BONUS_RESOURCE';












