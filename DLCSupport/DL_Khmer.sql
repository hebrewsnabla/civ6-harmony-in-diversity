-------------------------------------
--            Khmer DLC            --
-------------------------------------
--delete from CivilizationTraits where TraitType = 'TRAIT_CIVILIZATION_BUILDING_PRASAT';
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_BUILDING_PRASAT';

insert or replace into Building_CitizenYieldChanges
    (BuildingType,                          YieldType,          YieldChange)
values
    ('BUILDING_PRASAT',                     'YIELD_FAITH',      1); --ub (高棉)

insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
values
    ('BUILDING_PRASAT',             'TEMPLE_SETTLER_PURCHASE'),
    ('BUILDING_PRASAT',             'TEMPLE_FAITH_PERCENTAGE_BOOST');

--CIVILIZATION_INDONESIA
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_NUSANTARA_COAST_HOLY_SITE' and Name = 'TilesRequired';
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_NUSANTARA_COAST_CAMPUS' and Name = 'TilesRequired';
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_NUSANTARA_COAST_INDUSTRIAL_ZONE' and Name = 'TilesRequired';
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_NUSANTARA_COAST_THEATER' and Name = 'TilesRequired';

insert or replace into Improvement_ValidFeatures
	(ImprovementType,			FeatureType) 
values 
	('IMPROVEMENT_KAMPUNG',		'FEATURE_REEF');
insert or replace into Improvement_ValidFeatures
	(ImprovementType, FeatureType)
select
	'IMPROVEMENT_KAMPUNG',		'FEATURE_SUK_KELP'
where exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');
update Improvements set Description = 'LOC_IMPROVEMENT_KAMPUNG_KELP_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_KAMPUNG' and exists (select FeatureType from Features where FeatureType = 'FEATURE_SUK_KELP');

update Improvement_YieldChanges set YieldChange = 1 where ImprovementType = 'IMPROVEMENT_KAMPUNG' and YieldType = 'YIELD_FOOD';
update Adjacency_YieldChanges set YieldType = 'YIELD_PRODUCTION' where ID = 'Kampung_FoodFishingBoats';
update Improvement_Tourism set TourismSource = 'TOURISMSOURCE_PRODUCTION' where ImprovementType = 'IMPROVEMENT_KAMPUNG';
update RequirementSetRequirements set RequirementId = 'HD_REQUIRES_PLAYER_HAS_TECH_CIVIL_ENGINEERING_HD'  -- RequirementId = 'REQUIRES_PLAYER_HAS_CIVIC_CIVIL_ENGINEERING' 
where RequirementSetId = 'PLAYER_HAS_KAMPUNG_TECHNOLOGY_REQUIREMENTS' and RequirementId = 'REQUIRES_PLAYER_HAS_MASS_PRODUCTION_TECHNOLOGY';

insert or replace into Improvement_Adjacencies
    (ImprovementType,               YieldChangeId)
values
    ('IMPROVEMENT_KAMPUNG',         'Kampung_ProductionCityCenter'),
    ('IMPROVEMENT_FISHING_BOATS',   'Fishingboats_Kampung_Production');

insert or replace into Adjacency_YieldChanges
	(ID,				                Description,	YieldType,			YieldChange,	TilesRequired,  AdjacentImprovement,    AdjacentDistrict, 		    PrereqCivic)
values
    ('Kampung_ProductionCityCenter',	'Placeholder', 'YIELD_PRODUCTION',  1,				1,              NULL,                   'DISTRICT_CITY_CENTER', 	NULL),
	('Fishingboats_Kampung_Production',	'Placeholder', 'YIELD_PRODUCTION',	1,				2,              'IMPROVEMENT_KAMPUNG',  NULL,                       'CIVIC_CIVIL_ENGINEERING');