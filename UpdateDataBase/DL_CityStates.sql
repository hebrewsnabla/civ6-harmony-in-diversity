-- Modifiers in this table are attached to suzerain
create temporary table if not exists TraitAttachedModifiers (
    TraitType text not null,
    ModifierId text not null,
    primary key (TraitType, ModifierId)
);

-- Antananarivo
update GlobalParameters set Value = 15 where Name = 'YIELD_MODIFIER_PER_EARNED_GREAT_PERSON_MAXIMUM';
update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_ANTANANARIVO_CULTURE_FROM_EARNED_GREAT_PEOPLE_BONUS' and Name = 'Amount';

-- Mohenjo Daro
insert or replace into TraitAttachedModifiers 
	(TraitType,								ModifierId)
values
	('MINOR_CIV_MOHENJO_DARO_TRAIT',		'MOHENJO_DARO_THEATER_POPULATION_CULTURE'),
	('MINOR_CIV_MOHENJO_DARO_TRAIT',		'MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE');
insert or replace into	Modifiers
	(ModifierId,									ModifierType,												SubjectRequirementSetId)
values
	('MOHENJO_DARO_THEATER_POPULATION_CULTURE',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'CITY_HAS_THEATER_REQUIREMENTS'),
	('MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'CITY_HAS_AQUEDUCT_REQUIREMENTS');
insert or replace into	ModifierArguments
	(ModifierId, 									Name,			Value)
values
	('MOHENJO_DARO_THEATER_POPULATION_CULTURE',		'YieldType',	'YIELD_CULTURE'),
	('MOHENJO_DARO_THEATER_POPULATION_CULTURE',		'Amount',		0.3),
	('MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE',	'YieldType',	'YIELD_CULTURE'),
	('MOHENJO_DARO_AQUEDUCT_POPULATION_CULTURE',	'Amount',		0.3);

-- Kumasi
delete from TraitModifiers where TraitType = 'MINOR_CIV_KUMASI_TRAIT' and ModifierId = 'MINOR_CIV_KUMASI_UNIQUE_INFLUENCE_TRADE_GOLD_BONUS';
update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_KUMASI_CULTURE_TRADE_ROUTE_YIELD_BONUS' and Name = 'Amount';

-- Kandy
update ModifierArguments set Value = 200 where ModifierId = 'MINOR_CIV_KANDY_BETTER_RELIC_BONUS' and Name = 'ScalingFactor';
delete from TraitModifiers where TraitType = 'MINOR_CIV_KANDY_TRAIT' and ModifierId = 'MINOR_CIV_KANDY_UNIQUE_INFLUENCE_GRANT_BONUS';

-- Venice (Antioch)
delete from TraitModifiers where TraitType = 'MINOR_CIV_ANTIOCH_TRAIT' and ModifierId = 'MINOR_CIV_ANTIOCH_UNIQUE_INFLUENCE_BONUS';
insert or replace into TraitAttachedModifiers 
	(TraitType,									ModifierId)
values
	('MINOR_CIV_ANTIOCH_TRAIT',					'MINOR_CIV_ANTIOCH_GOVERNOR_DISCOUNT');
insert or replace into	Modifiers
	(ModifierId,								ModifierType,													SubjectRequirementSetId)
values
	('MINOR_CIV_ANTIOCH_GOVERNOR_DISCOUNT',		'MODIFIER_PLAYER_CITIES_ADJUST_ALL_BUILDINGS_PURCHASE_COST',	'CITY_HAS_GOVERNOR_REQUIREMENTS');
insert or replace into	ModifierArguments
	(ModifierId, 								Name,			Value)
values
	('MINOR_CIV_ANTIOCH_GOVERNOR_DISCOUNT',		'Amount',		15);

-- Bandar Brunei (Jakarta)
delete from TraitModifiers where TraitType = 'MINOR_CIV_JAKARTA_TRAIT';
insert or replace into TraitAttachedModifiers 
	(TraitType,									ModifierId)
values
	('MINOR_CIV_JAKARTA_TRAIT',					'MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS');
insert or replace into Modifiers
	(ModifierId,								ModifierType,									    SubjectRequirementSetId)
values
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST');
insert or replace into ModifierArguments
	(ModifierId,								Name,			 Value)
values
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',	'YieldType',	 'YIELD_GOLD'),
	('MINOR_CIV_JAKARTA_DISTRICT_GOLD_BONUS',	'Amount',	     3);

-- Lisbon (Mogadishu)
insert or replace into TraitAttachedModifiers 
	(TraitType,						ModifierId)
values
	('MINOR_CIV_LISBON_TRAIT',		'TRAIT_LISBON_DOMESTIC_FOOD'),
	('MINOR_CIV_LISBON_TRAIT',		'TRAIT_LISBON_DOMESTIC_PRODUCTION'),
	('MINOR_CIV_LISBON_TRAIT',		'TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD'),
	('MINOR_CIV_LISBON_TRAIT',		'TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION');
insert or replace into Modifiers
	(ModifierId,											ModifierType)
values
	('TRAIT_LISBON_DOMESTIC_FOOD',							'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
	('TRAIT_LISBON_DOMESTIC_PRODUCTION',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC');
insert or replace into ModifierArguments
	(ModifierId,											Name,			 	Value)
values
	('TRAIT_LISBON_DOMESTIC_FOOD',							'YieldType',	 	'YIELD_FOOD'),
	('TRAIT_LISBON_DOMESTIC_FOOD',							'Amount',	 	 	1),
	('TRAIT_LISBON_DOMESTIC_PRODUCTION',					'YieldType',	 	'YIELD_PRODUCTION'),
	('TRAIT_LISBON_DOMESTIC_PRODUCTION',					'Amount',	 	 	1),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD',			'YieldType',	 	'YIELD_FOOD'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD',			'Amount',	 	 	1),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_FOOD',			'Intercontinental',	1),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION',	'YieldType',	 	'YIELD_PRODUCTION'),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION',	'Amount',	 	 	1),
	('TRAIT_LISBON_INTERCONTINENTAL_DOMESTIC_PRODUCTION',	'Intercontinental',	1);

-- Hattusa
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_HORSES'   where ModifierId = 'MINOR_CIV_HATTUSA_HORSES_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_IRON'     where ModifierId = 'MINOR_CIV_HATTUSA_IRON_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_NITER'    where ModifierId = 'MINOR_CIV_HATTUSA_NITER_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_COAL'     where ModifierId = 'MINOR_CIV_HATTUSA_COAL_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_OIL'      where ModifierId = 'MINOR_CIV_HATTUSA_OIL_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_ALUMINUM' where ModifierId = 'MINOR_CIV_HATTUSA_ALUMINUM_RESOURCE_XP2';
update Modifiers set SubjectRequirementSetId = 'PLAYER_CAN_SEE_URANIUM'  where ModifierId = 'MINOR_CIV_HATTUSA_URANIUM_RESOURCE_XP2';
insert or replace into TraitAttachedModifiers 
	(TraitType,						ModifierId)
values
	('MINOR_CIV_HATTUSA_TRAIT',		'MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE');
insert or replace into Modifiers
	(ModifierId,										ModifierType,									    SubjectRequirementSetId)
values
	('MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 				'PLOT_HAS_STRATEGIC_IMPROVED_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
values
	('MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE', 	'YieldType',    'YIELD_SCIENCE'),
	('MINOR_CIV_HATTUSA_STRATEGIC_RESOURCE_SCIENCE', 	'Amount',    	1);

--Fez
delete from TraitModifiers where TraitType = 'MINOR_CIV_FEZ_TRAIT' and ModifierId = 'MINOR_CIV_FEZ_UNIQUE_INFLUENCE_BONUS';
insert or replace into TraitAttachedModifiers
	(TraitType,					ModifierId)
select
	'MINOR_CIV_FEZ_TRAIT',		'MINOR_CIV_FEZ_' || BuildingType || '_SCIENCE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_HOLY_SITE';
insert or replace into Modifiers
	(ModifierId,										ModifierType)
select
	'MINOR_CIV_FEZ_' || BuildingType || '_SCIENCE',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_HOLY_SITE';
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'MINOR_CIV_FEZ_' || BuildingType || '_SCIENCE',		'BuildingType',		BuildingType
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_HOLY_SITE';
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'MINOR_CIV_FEZ_' || BuildingType || '_SCIENCE',		'YieldType',		'YIELD_SCIENCE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_HOLY_SITE';
insert or replace into ModifierArguments
	(ModifierId,										Name,				Value)
select
	'MINOR_CIV_FEZ_' || BuildingType || '_SCIENCE',		'Amount',			2
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_HOLY_SITE';

-- Anshan (Babylon)
delete from TraitModifiers where TraitType = 'MINOR_CIV_BABYLON_TRAIT';
insert or replace into TraitAttachedModifiers
	(TraitType,						ModifierId)
values
	('MINOR_CIV_BABYLON_TRAIT',		'MINOR_CIV_BABYLON_HILL_CITY_SCIENCE');
insert or replace into Modifiers
	(ModifierId,								ModifierType,										SubjectRequirementSetId)
values
	('MINOR_CIV_BABYLON_HILL_CITY_SCIENCE',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'PLOT_IS_HILLS');
insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('MINOR_CIV_BABYLON_HILL_CITY_SCIENCE',		'YieldType',	'YIELD_SCIENCE'),
	('MINOR_CIV_BABYLON_HILL_CITY_SCIENCE',		'Amount',		1);
create temporary table HD_BabylonAdjacencies (TerrainType text not null primary key);
insert or replace into HD_BabylonAdjacencies
	(TerrainType)
values
	('TERRAIN_GRASS_HILLS'),
	('TERRAIN_PLAINS_HILLS'),
	('TERRAIN_DESERT_HILLS'),
	('TERRAIN_TUNDRA_HILLS'),
	('TERRAIN_SNOW_HILLS');
insert or replace into TraitAttachedModifiers
	(TraitType,						ModifierId)
select
	'MINOR_CIV_BABYLON_TRAIT',		'MINOR_CIV_BABYLON_' || TerrainType || '_CAMPUS_ADJACENCY'
from HD_BabylonAdjacencies;
insert or replace into Modifiers
	(ModifierId,													ModifierType)
select
	'MINOR_CIV_BABYLON_' || TerrainType || '_CAMPUS_ADJACENCY',		'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY'
from HD_BabylonAdjacencies;
insert or replace into ModifierArguments
	(ModifierId,													Name,				Value)
select
	'MINOR_CIV_BABYLON_' || TerrainType || '_CAMPUS_ADJACENCY',		'DistrictType',		'DISTRICT_CAMPUS'
from HD_BabylonAdjacencies;
insert or replace into ModifierArguments
	(ModifierId,													Name,				Value)
select
	'MINOR_CIV_BABYLON_' || TerrainType || '_CAMPUS_ADJACENCY',		'TerrainType',		TerrainType
from HD_BabylonAdjacencies;
insert or replace into ModifierArguments
	(ModifierId,													Name,				Value)
select
	'MINOR_CIV_BABYLON_' || TerrainType || '_CAMPUS_ADJACENCY',		'YieldType',		'YIELD_SCIENCE'
from HD_BabylonAdjacencies;
insert or replace into ModifierArguments
	(ModifierId,													Name,				Value)
select
	'MINOR_CIV_BABYLON_' || TerrainType || '_CAMPUS_ADJACENCY',		'Amount',			1
from HD_BabylonAdjacencies;
insert or replace into ModifierArguments
	(ModifierId,													Name,				Value)
select
	'MINOR_CIV_BABYLON_' || TerrainType || '_CAMPUS_ADJACENCY',		'Description',		'LOC_MINOR_CIV_BABYLON_HILLS_CAMPUS_ADJACENCY_DESCRIPTION'
from HD_BabylonAdjacencies;

-- Cardiff
update ModifierArguments set Value = 0 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_LIGHTHOUSE' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_SHIPYARD' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'MINOR_CIV_CARDIFF_POWER_SEAPORT' and Name = 'Amount';

-- Preslav
delete from TraitModifiers where TraitType = 'MINOR_CIV_PRESLAV_TRAIT';
insert or replace into TraitAttachedModifiers 
	(TraitType,							ModifierId)
values
	('MINOR_CIV_PRESLAV_TRAIT',			'MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE');
insert or replace into Modifiers
	(ModifierId,									ModifierType,										SubjectRequirementSetId)
values
	('MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'DISTRICT_IS_DISTRICT_ENCAMPMENT_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,									Name,				 Value)
values
	('MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE',		'YieldType',		'YIELD_SCIENCE'),
	('MINOR_CIV_PRESLAV_ENCAMPMENT_SCIENCE',		'Amount',			2);
insert or replace into TraitAttachedModifiers
	(TraitType,						ModifierId)
select
	'MINOR_CIV_PRESLAV_TRAIT',		'MINOR_CIV_PRESLAV_' || BuildingType || '_SCIENCE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_ENCAMPMENT';
insert or replace into Modifiers
	(ModifierId,											ModifierType)
select
	'MINOR_CIV_PRESLAV_' || BuildingType || '_SCIENCE',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_ENCAMPMENT';
insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'MINOR_CIV_PRESLAV_' || BuildingType || '_SCIENCE',		'BuildingType',		BuildingType
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_ENCAMPMENT';
insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'MINOR_CIV_PRESLAV_' || BuildingType || '_SCIENCE',		'YieldType',		'YIELD_SCIENCE'
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_ENCAMPMENT';
insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
select
	'MINOR_CIV_PRESLAV_' || BuildingType || '_SCIENCE',		'Amount',			2
from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_ENCAMPMENT';

-- Vilnius
insert or replace into TraitAttachedModifiers
	(TraitType,							ModifierId)
values
	('MINOR_CIV_VILNIUS_TRAIT',			'MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0');
insert or replace into Modifiers	
	(ModifierId,												ModifierType,											SubjectRequirementSetId)
values
	('MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',		'DISTRICT_IS_THEATER');	
insert or replace into ModifierArguments
	(ModifierId,												Name,						Value)
values
	('MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0',		'YieldType',		'YIELD_CULTURE'),	
	('MINOR_CIV_VILNIUS_UNIQUE_INFLUENCE_ALLIANCE_LEVEL_0',		'Amount',			50);

--Nan Madol
update Modifiers set SubjectRequirementSetId = 'NON_CITYCENTER_PLOT_IS_OR_ADJACENT_TO_COAST' where ModifierId = 'MINOR_CIV_NAN_MADOL_DISTRICTS_CULTURE_BONUS';
update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_NAN_MADOL_DISTRICTS_CULTURE_BONUS' and Name = 'Amount';

-- Akkad
delete from TraitModifiers where TraitType = 'MINOR_CIV_AKKAD_TRAIT';
insert or replace into TraitAttachedModifiers
	(TraitType,						ModifierId)
values
 	('MINOR_CIV_AKKAD_TRAIT',		'MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT'),
	('MINOR_CIV_AKKAD_TRAIT',		'MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT');
insert or replace into Modifiers	
	(ModifierId,											ModifierType)
values
	('MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT',				'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE'),
	('MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');
insert or replace into ModifierArguments
	(ModifierId,											Name,				Value)
values
	('MINOR_CIV_AKKAD_FAITH_PURCHASE_SUPPORT',				'Tag',				'CLASS_SUPPORT'),
	('MINOR_CIV_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		'AbilityType',		'ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT');
insert or replace into Types
	(Type,													Kind)
values
	('ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		'KIND_ABILITY');
insert or replace into TypeTags
	(Type,													Tag)
select
	'ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		Tag
from TypeTags where Type = 'ABILITY_WOLIN_LAND_UNITS';
insert or replace into UnitAbilities
	(UnitAbilityType,										Inactive)
values	
	('ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		1);
insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
	('ABILITY_AKKAD_ESCORT_MOBILITY_SHARED_MOVEMENT',		'ESCORT_MOBILITY_SHARED_MOVEMENT');

--Bologna
update ModifierArguments set Value = 3 where ModifierId like 'MINOR_CIV_BOLOGNA_GREAT_%_BONUS' and Name = 'Amount';

--Wolin
update ModifierArguments set Value = 100 where ModifierId = 'WOLIN_GREAT_GENERAL_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where ModifierId = 'WOLIN_GREAT_ADMIRAL_POINTS' and Name = 'Amount';

-- Yerevan
insert or replace into TraitAttachedModifiers
	(TraitType,						ModifierId)
values
	('MINOR_CIV_YEREVAN_TRAIT',		'MINOR_CIV_YEREVAN_RELIGIOUS_ALL_INCREASED_MOVEMENT');
insert or replace into Modifiers	
	(ModifierId,													ModifierType)
values
	('MINOR_CIV_YEREVAN_RELIGIOUS_ALL_INCREASED_MOVEMENT',			'MODIFIER_PLAYER_UNITS_GRANT_ABILITY'),
	('RELIGIOUS_ALL_INCREASED_MOVEMENT',           					'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT');
insert or replace into	ModifierArguments
	(ModifierId, 												Name,				Value)
values
	('MINOR_CIV_YEREVAN_RELIGIOUS_ALL_INCREASED_MOVEMENT',		'AbilityType',		'ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT'),
    ('RELIGIOUS_ALL_INCREASED_MOVEMENT',						'Amount',			1);
insert or replace into Types
	(Type,												Kind)
values
	('ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT',		'KIND_ABILITY');
insert or replace into TypeTags		
	(Type,												Tag)
select 
	'ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT',			'CLASS_RELIGIOUS_ALL';
insert or replace into UnitAbilities 
	(UnitAbilityType, 									Inactive) 
values	
	('ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT',  		1);
insert or replace into UnitAbilityModifiers
	(UnitAbilityType,									ModifierId)
values
	('ABILITY_RELIGIOUS_ALL_INCREASED_MOVEMENT',		'RELIGIOUS_ALL_INCREASED_MOVEMENT');

-- Johannesburg
delete from TraitModifiers where TraitType = 'MINOR_CIV_JOHANNESBURG_TRAIT';
create temporary table JohannesburgResources (ResourceType text not null primary key);
insert or replace into JohannesburgResources (ResourceType) select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_MINE' or ImprovementType = 'IMPROVEMENT_QUARRY';
insert or replace into TraitAttachedModifiers
    (TraitType,                   		ModifierId)
select
    'MINOR_CIV_JOHANNESBURG_TRAIT',		'MINOR_CIV_JOHANNESBURG_' || ResourceType
from JohannesburgResources;
insert or replace into Modifiers
    (ModifierId,                                    ModifierType,                               		SubjectRequirementSetId)
select
    'MINOR_CIV_JOHANNESBURG_' || ResourceType,    	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',	'HD_CITY_HAS_IMPROVED_' || ResourceType || '_REQUIRMENTS'
from JohannesburgResources;
insert or replace into ModifierArguments
    (ModifierId,                           		Name,           Value)
select
    'MINOR_CIV_JOHANNESBURG_' || ResourceType,	'Amount',       1
from JohannesburgResources;
insert or replace into ModifierArguments
    (ModifierId,                         		Name,           Value)
select
    'MINOR_CIV_JOHANNESBURG_' || ResourceType,	'YieldType',    'YIELD_PRODUCTION'
from JohannesburgResources;

-- Geneva
update ModifierArguments set Value = 10 where ModifierId = 'MINOR_CIV_GENEVA_SCIENCE_AT_PEACE_BONUS' and Name = 'Amount';

-- Ngazargamu
delete from TraitModifiers where TraitType = 'MINOR_CIV_NGAZARGAMU_TRAIT';
insert or replace into TraitAttachedModifiers
	(TraitType,                   	ModifierId)
values
	('MINOR_CIV_NGAZARGAMU_TRAIT',	'MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_ADJACENCY'),
	('MINOR_CIV_NGAZARGAMU_TRAIT',	'MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_FOOD');
insert or replace into Modifiers
	(ModifierId,										ModifierType,														SubjectRequirementSetId)
values
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_ADJACENCY',	'MODIFIER_PLAYER_CITIES_TERRAIN_ADJACENCY',							null),
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_FOOD',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	'ENCAMPMENT_ADJACENT_TO_LAKE');
insert or replace into ModifierArguments
	(ModifierId,										Name,					Value)
values
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_ADJACENCY',	'DistrictType',			'DISTRICT_ENCAMPMENT'),
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_ADJACENCY',	'TerrainType',			'TERRAIN_COAST'),
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_ADJACENCY',	'YieldType',			'YIELD_PRODUCTION'),
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_ADJACENCY',	'Description',			'LOC_MINOR_CIV_NGAZARGAMU_COAST_ENCAMPMENT_DESCRIPTION'),
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_ADJACENCY',	'Amount',				1),
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_ADJACENCY',	'TilesRequired',		2),
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_FOOD',		'YieldTypeToMirror',	'YIELD_PRODUCTION'),
	('MINOR_CIV_NGAZARGAMU_LAKE_ENCAMPMENT_FOOD',		'YieldTypeToGrant',		'YIELD_FOOD');

-- Buenos Aires
delete from TraitModifiers where TraitType = 'MINOR_CIV_BUENOS_AIRES_TRAIT';
insert or replace into TraitAttachedModifiers
	(TraitType,                   		ModifierId)
select
	'MINOR_CIV_BUENOS_AIRES_TRAIT',		'MINOR_CIV_BUENOS_AIRES_' || DistrictType
from HD_DistrictPseudoYields;
insert or replace into Modifiers
	(ModifierId,								ModifierType,									SubjectRequirementSetId)
select
	'MINOR_CIV_BUENOS_AIRES_' || DistrictType,	'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',	'DISTRICT_IS_' || DistrictType || '_AND_HAS_HIGH_ADJACENCY'
from HD_DistrictPseudoYields;
insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
select
	'MINOR_CIV_BUENOS_AIRES_' || DistrictType,	'ModifierId',	'MINOR_CIV_BUENOS_AIRES_' || YieldType
from HD_DistrictPseudoYields;
insert or replace into Modifiers
	(ModifierId,								ModifierType)
select distinct
	'MINOR_CIV_BUENOS_AIRES_' || YieldType,		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'
from HD_DistrictPseudoYields;
insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
select distinct
	'MINOR_CIV_BUENOS_AIRES_' || YieldType,		'YieldType',	YieldType
from HD_DistrictPseudoYields;
insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
select distinct
	'MINOR_CIV_BUENOS_AIRES_' || YieldType,		'Amount',		6
from HD_DistrictPseudoYields;

-- Attach modifiers in TraitAttachedModifiers to suzerain
insert or ignore into TraitModifiers
    (TraitType, ModifierId)
select
    TraitType,  ModifierId || '_ATTACH'
from TraitAttachedModifiers;
insert or ignore into Modifiers
    (ModifierId,                ModifierType,                               SubjectRequirementSetId)
select
    ModifierId || '_ATTACH',    'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',     'PLAYER_IS_SUZERAIN'
from TraitAttachedModifiers;
insert or ignore into ModifierArguments
    (ModifierId,                Name,           Value)
select
    ModifierId || '_ATTACH',    'ModifierId',   ModifierId
from TraitAttachedModifiers;
drop table TraitAttachedModifiers;

-- Archer Modifier for City State
insert or replace into Modifiers
	(ModifierId,					ModifierType,								RunOnce)
values
	('CITY_STATE_GRANT_ARCHER',		'MODIFIER_PLAYER_GRANT_UNIT_IN_CAPITAL',	1);
insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
values
	('CITY_STATE_GRANT_ARCHER',		'UnitType',		'UNIT_ARCHER'),
	('CITY_STATE_GRANT_ARCHER',		'Amount',		1);
insert or replace into GlobalParameters
	(Name,							Value)
values
	('CITY_STATE_ARCHER_MIN_TURN',	10),
	('CITY_STATE_ARCHER_MAX_TURN',	20);