-------------------------------------
--    Newly added Requirements     --
-------------------------------------

-- River
insert or replace into Requirements (RequirementId, RequirementType, Inverse) values 
	('REQUIRES_PLOT_NOT_ADJACENT_TO_RIVER', 'REQUIREMENT_PLOT_ADJACENT_TO_RIVER', 1);

-- Units
insert or replace into Requirements (RequirementId, RequirementType) values 
	('REQUIREMENT_UNIT_IS_SETTLER', 'REQUIREMENT_UNIT_TYPE_MATCHES');
insert or replace into RequirementArguments (RequirementId, Name, Value) values
	('REQUIREMENT_UNIT_IS_SETTLER', 'UnitType', 'UNIT_SETTLER');

-- Resource
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_' || ResourceType || '_IN_PLOT', 'ResourceType', ResourceType from Resources;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_' || ResourceType || '_IN_PLOT', 'REQUIREMENT_PLOT_RESOURCE_TYPE_MATCHES' from Resources;

insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_CITY_HAS_IMPROVED_' || ResourceType, 'ResourceType', ResourceType from Resources;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_CITY_HAS_IMPROVED_' || ResourceType, 'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED' from Resources;

-- Techs
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_PLAYER_HAS_' || TechnologyType, 'TechnologyType', TechnologyType from Technologies;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_PLAYER_HAS_' || TechnologyType, 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY' from Technologies;

-- Civic
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_PLAYER_HAS_' || CivicType, 'CivicType', CivicType from Civics;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_PLAYER_HAS_' || CivicType, 'REQUIREMENT_PLAYER_HAS_CIVIC' from Civics;

-- Districts plots
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_PLOT_ADJACENT_TO_' || DistrictType, 'DistrictType', DistrictType from Districts;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_PLOT_ADJACENT_TO_' || DistrictType, 'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES' from Districts;

-- District 
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_DISTRICT_IS_' || DistrictType, 'DistrictType', DistrictType from Districts;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_DISTRICT_IS_' || DistrictType,	'REQUIREMENT_DISTRICT_TYPE_MATCHES' from Districts;

-- Buildings
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_CITY_HAS_' || BuildingType, 'BuildingType', BuildingType from Buildings;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_CITY_HAS_' || BuildingType, 'REQUIREMENT_CITY_HAS_BUILDING' from Buildings;

-- Eras
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_PLAYER_IS_' || EraType, 'EraType', EraType from Eras;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_PLAYER_IS_' || EraType, 'REQUIREMENT_PLAYER_ERA_AT_LEAST' from Eras;

-- Features & Natural Wonders
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_CITY_HAS_' || FeatureType, 'FeatureType', FeatureType from Features;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_CITY_HAS_' || FeatureType, 'REQUIREMENT_CITY_HAS_FEATURE' from Features;

--civlization
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'PLAYER_IS_' || CivilizationType, 'CivilizationType'	, CivilizationType from Civilizations;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'PLAYER_IS_' || CivilizationType, 'REQUIREMENT_PLAYER_TYPE_MATCHES' from Civilizations;

-- City has X Pop
insert or replace into RequirementArguments (RequirementId, Name, Value)
	select 'REQUIRES_CITY_HAS_'  || Pop || '_POPULATION', 'Amount', Pop from PopulationMaintenance;
insert or replace into Requirements (RequirementId, RequirementType)
	select 'REQUIRES_CITY_HAS_'  || Pop || '_POPULATION', 'REQUIREMENT_CITY_HAS_X_POPULATION' from PopulationMaintenance;
insert or replace into RequirementSets (RequirementSetId, RequirementSetType)
	select 'CITY_HAS_' || Pop || '_POPULATION', 'REQUIREMENTSET_TEST_ALL' from PopulationMaintenance;
insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)
	select 'CITY_HAS_' || Pop || '_POPULATION', 'REQUIRES_CITY_HAS_'  || Pop || '_POPULATION' from PopulationMaintenance;

-- Misc
insert or replace into Requirements
	(RequirementId,								RequirementType,					Inverse)
values
	('REQUIRES_CITY_HAS_NO_FILM_STUDIO',		'REQUIREMENT_CITY_HAS_BUILDING',	1);

insert or replace into Requirements
	(RequirementId,								RequirementType)
values
	('REQUIRES_AIRPORT_AND_WITHIN_9TILES',		'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES'),
	('REQUIRES_PLOT_WITHIN_EIGHT_CITY_CENTER',	'REQUIREMENT_PLOT_ADJACENT_DISTRICT_TYPE_MATCHES');
-- 	('REQUIRES_CITY_HAS_IMPROVED_COPPER',		'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_DIAMONDS',		'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_JADE',			'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_MERCURY',		'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_SALT',			'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_SILVER',		'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_GOLD',			'REQUIREMENT_CITY_HAS_RESOURCE_TYPE_IMPROVED');

insert or replace into RequirementArguments
	(RequirementId,								Name,				Value)
values
	('REQUIRES_CITY_HAS_NO_FILM_STUDIO',		'BuildingType',		'BUILDING_FILM_STUDIO'),
	('REQUIRES_CITY_HAS_NO_FILM_STUDIO',		'MustBeFunctioning',	1),
	('REQUIRES_AIRPORT_AND_WITHIN_9TILES',		'BuildingType',		'BUILDING_AIRPORT'),	
	('REQUIRES_AIRPORT_AND_WITHIN_9TILES',		'BuildingType',		'BUILDING_AIRPORT'),						
	('REQUIRES_AIRPORT_AND_WITHIN_9TILES',		'MinRange',			0),
	('REQUIRES_AIRPORT_AND_WITHIN_9TILES',		'MaxRange',			9),
	('REQUIRES_PLOT_WITHIN_EIGHT_CITY_CENTER',	'DistrictType',		'DISTRICT_CITY_CENTER'),
	('REQUIRES_PLOT_WITHIN_EIGHT_CITY_CENTER',	'MinRange',			0),
	('REQUIRES_PLOT_WITHIN_EIGHT_CITY_CENTER',	'MaxRange',			8);
-- 	('REQUIRES_CITY_HAS_IMPROVED_COPPER',		'ResourceType',	'RESOURCE_COPPER'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_DIAMONDS',		'ResourceType',	'RESOURCE_DIAMONDS'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_JADE',			'ResourceType',	'RESOURCE_JADE'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_MERCURY',		'ResourceType',	'RESOURCE_MERCURY'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_SALT',			'ResourceType',	'RESOURCE_SALT'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_SILVER',		'ResourceType',	'RESOURCE_SILVER'),
-- 	('REQUIRES_CITY_HAS_IMPROVED_GOLD',			'ResourceType',	'RESOURCE_GOLD');

-- RequirementSets
insert or replace into RequirementSets
	(RequirementSetId,									RequirementSetType)
values
	('ATTACKING_DISTRICTS_REQUIREMENTS',				'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,									RequirementId)
values
	('ATTACKING_DISTRICTS_REQUIREMENTS',				'PLAYER_IS_ATTACKER_REQUIREMENTS'),
	('ATTACKING_DISTRICTS_REQUIREMENTS',				'OPPONENT_IS_DISTRICT');

-- RequirementSets
insert or replace into RequirementSets
	(RequirementSetId,									RequirementSetType)
values
	-- Techs
	('HAS_COPPER_RESOURCE_AND_BRONZE_WORKING',			'REQUIREMENTSET_TEST_ALL'),
	('PLOT_ADJACENT_TO_MOUNTAIN',						'REQUIREMENTSET_TEST_ANY'),
	('HAS_APPRENTICESHIP_AND_PLOT_ADJACENT_TO_MOUNTAIN','REQUIREMENTSET_TEST_ALL'),
	('PLOT_ADJACENT_TO_INDUSTRIAL_ZONE',				'REQUIREMENTSET_TEST_ANY'),
	-- ('HAS_CONSTRUCTION_AND_PLOT_ADJACENT_TO_RIVER_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL'),
	('HAS_LUXURY_RESOURCE_AND_CURRENCY',				'REQUIREMENTSET_TEST_ALL'),
	('HAS_BONUS_RESOURCE_AND_CURRENCY',					'REQUIREMENTSET_TEST_ALL'),
	('HAS_STRATEGIC_RESOURCE_AND_CURRENCY',				'REQUIREMENTSET_TEST_ALL'),
	-- buildings
	-- ('HAS_GRANARY_RESOURCE', 'REQUIREMENTSET_TEST_ANY'),
	('HAS_IMPROVED_BANANAS',							'REQUIREMENTSET_TEST_ALL'),
	('HAS_IMPROVED_DEER',								'REQUIREMENTSET_TEST_ALL'),
	('HAS_LIGHTHOUSE_RESOURCE',							'REQUIREMENTSET_TEST_ANY'),
	('HAS_IMPROVED_STONE',								'REQUIREMENTSET_TEST_ALL'),
	('HAS_IMPROVED_SHEEP',								'REQUIREMENTSET_TEST_ALL'),
	('HAS_IMPROVED_CATTLE',								'REQUIREMENTSET_TEST_ALL'),
	('HAS_IMPROVED_HORSES',								'REQUIREMENTSET_TEST_ALL'),
	-- ('HAS_STABLE_RESOURCE', 'REQUIREMENTSET_TEST_ANY'),
	-- ('HAS_BARRACKS_RESOURCE', 'REQUIREMENTSET_TEST_ANY'),
	('HAS_IMPROVED_IRON',								'REQUIREMENTSET_TEST_ALL'),
	('HAS_IMPROVED_COPPER',								'REQUIREMENTSET_TEST_ALL'),
	('HAS_ARMORY_RESOURCE',								'REQUIREMENTSET_TEST_ANY'),
	('HAS_FACTORY_RESOURCE',							'REQUIREMENTSET_TEST_ANY'),
	('HAS_MILITARY_ACADEMY_RESOURCE',					'REQUIREMENTSET_TEST_ANY'),
	-- 
	('IS_FARM_ADJACENT_TO_FRESH_WATER',					'REQUIREMENTSET_TEST_ALL'),
	('IS_FARM_ADJACENT_TO_AQUEDUCT',					'REQUIREMENTSET_TEST_ALL'),
	('IS_FARM_ADJACENT_TO_FRESH_WATER_AND_AQUEDUCT',	'REQUIREMENTSET_TEST_ALL'),
	('UNIVERSITY_ADJACENCY_SCIENCE_JUNGLE_REQUIREMENTS','REQUIREMENTSET_TEST_ALL'),
	('MBANZA_ADJACENCY_FOOD_JUNGLE_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL'),
	('MBANZA_ADJACENCY_FOOD_FOREST_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL'),
	('PLOT_HAS_MINE_OR_QUARRY',							'REQUIREMENTSET_TEST_ANY'),
	-- Airport
	('HAS_AIRPORT_WITHIN_9_TILES',						'REQUIREMENTSET_TEST_ALL'),
	('CITY_HAS_NO_FILM_STUDIO',							'REQUIREMENTSET_TEST_ALL'),
	-- Hill
	('PLOT_IS_TERRAIN_HILL',							'REQUIREMENTSET_TEST_ANY'),
	-- Maori
	('PLOT_HAS_JUNGLE_CIVIL_SERVICE_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL'),
	('PLOT_HAS_FOREST_CIVIL_SERVICE_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL'),
	-- not used
	('IS_FARM_ADJACENT_TO_RIVER',						'REQUIREMENTSET_TEST_ALL'),
	('IS_FARM_NOT_ADJACENT_TO_RIVER',					'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,									RequirementId)
values
	-- Copper
	('HAS_COPPER_RESOURCE_AND_BRONZE_WORKING',			'REQUIRES_RESOURCE_COPPER_IN_PLOT'),
	('HAS_COPPER_RESOURCE_AND_BRONZE_WORKING',			'REQUIRES_PLAYER_HAS_TECH_BRONZE_WORKING'),
	-- Mine
	('PLOT_ADJACENT_TO_MOUNTAIN',						'REQUIRES_PLOT_ADJACENT_TO_MOUNTAIN'),
	('HAS_APPRENTICESHIP_AND_PLOT_ADJACENT_TO_MOUNTAIN','REQUIRES_PLOT_ADJACENT_TO_MOUNTAIN'),
	('HAS_APPRENTICESHIP_AND_PLOT_ADJACENT_TO_MOUNTAIN','REQUIRES_PLAYER_HAS_TECH_APPRENTICESHIP'),
	('PLOT_ADJACENT_TO_INDUSTRIAL_ZONE',				'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_INDUSTRIAL_ZONE'),
	('PLOT_ADJACENT_TO_INDUSTRIAL_ZONE',				'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_HANSA'),
	('PLOT_ADJACENT_TO_INDUSTRIAL_ZONE',				'REQUIRES_PLOT_ADJACENT_TO_DISTRICT_OPPIDUM'),
	('HAS_LUXURY_RESOURCE_AND_CURRENCY',				'REQUIRES_PLOT_HAS_LUXURY'),
	('HAS_LUXURY_RESOURCE_AND_CURRENCY',				'REQUIRES_PLAYER_HAS_TECH_CURRENCY'),
	('HAS_BONUS_RESOURCE_AND_CURRENCY',					'REQUIRES_PLOT_HAS_BONUS'),
	('HAS_BONUS_RESOURCE_AND_CURRENCY',					'REQUIRES_PLAYER_HAS_TECH_CURRENCY'),
	('HAS_STRATEGIC_RESOURCE_AND_CURRENCY',				'REQUIRES_PLOT_HAS_STRATEGIC'),
	('HAS_STRATEGIC_RESOURCE_AND_CURRENCY',				'REQUIRES_PLAYER_HAS_TECH_CURRENCY'),
	-- Lumber mill
	-- ('HAS_CONSTRUCTION_AND_PLOT_ADJACENT_TO_RIVER_REQUIREMENTS',	'REQUIRES_PLOT_ADJACENT_TO_RIVER'),
	-- ('HAS_CONSTRUCTION_AND_PLOT_ADJACENT_TO_RIVER_REQUIREMENTS',	'REQUIRES_PLAYER_HAS_TECH_CONSTRUCTION'),
	-- Granary
	('HAS_IMPROVED_BANANAS',							'REQUIRES_RESOURCE_BANANAS_IN_PLOT'),
	('HAS_IMPROVED_BANANAS',							'REQUIRES_PLOT_HAS_PLANTATION'),
	('HAS_IMPROVED_DEER',								'REQUIRES_RESOURCE_DEER_IN_PLOT'),
	('HAS_IMPROVED_DEER',								'REQUIRES_PLOT_HAS_CAMP'),
	-- ('HAS_GRANARY_RESOURCE', 'REQUIRES_RESOURCE_BANANAS_IN_PLOT'),
	-- ('HAS_GRANARY_RESOURCE', 'REQUIRES_RESOURCE_DEER_IN_PLOT'),
	-- ('HAS_GRANARY_RESOURCE', 'REQUIRES_RESOURCE_SHEEP_IN_PLOT'),
	-- ('HAS_GRANARY_RESOURCE', 'REQUIRES_RESOURCE_CATTLE_IN_PLOT'),
	-- Move back to watermill.
	-- ('HAS_GRANARY_RESOURCE', 'REQUIRES_RESOURCE_RICE_IN_PLOT'),
	-- ('HAS_GRANARY_RESOURCE', 'REQUIRES_RESOURCE_WHEAT_IN_PLOT'),
	-- ('HAS_GRANARY_RESOURCE', 'REQUIRES_RESOURCE_MAIZE_IN_PLOT'),
	-- Lighthouse
	('HAS_LIGHTHOUSE_RESOURCE',							'REQUIRES_RESOURCE_CRABS_IN_PLOT'),
	('HAS_LIGHTHOUSE_RESOURCE',							'REQUIRES_RESOURCE_FISH_IN_PLOT'),
	('HAS_LIGHTHOUSE_RESOURCE',							'REQUIRES_RESOURCE_WHALES_IN_PLOT'),
	('HAS_LIGHTHOUSE_RESOURCE',							'REQUIRES_RESOURCE_PEARLS_IN_PLOT'),
	-- ('HAS_LIGHTHOUSE_RESOURCE', 'REQUIRES_RESOURCE_TURTLES_IN_PLOT'),
	-- Stable
	('HAS_IMPROVED_SHEEP',								'REQUIRES_RESOURCE_SHEEP_IN_PLOT'),
	('HAS_IMPROVED_SHEEP',								'REQUIRES_PLOT_HAS_PASTURE'),
	('HAS_IMPROVED_CATTLE',								'REQUIRES_RESOURCE_CATTLE_IN_PLOT'),
	('HAS_IMPROVED_CATTLE',								'REQUIRES_PLOT_HAS_PASTURE'),
	('HAS_IMPROVED_HORSES',								'REQUIRES_RESOURCE_HORSES_IN_PLOT'),
	('HAS_IMPROVED_HORSES',								'REQUIRES_PLOT_HAS_PASTURE'),
	-- ('HAS_STABLE_RESOURCE', 'REQUIRES_RESOURCE_CATTLE_IN_PLOT'),
	-- ('HAS_STABLE_RESOURCE', 'REQUIRES_RESOURCE_HORSES_IN_PLOT'),
	-- Barracks
	-- temporary add stone to barracks. -- removed
	('HAS_IMPROVED_COPPER',								'REQUIRES_RESOURCE_COPPER_IN_PLOT'),
	('HAS_IMPROVED_COPPER',								'REQUIRES_PLOT_HAS_MINE'),
	('HAS_IMPROVED_IRON',								'REQUIRES_RESOURCE_IRON_IN_PLOT'),
	('HAS_IMPROVED_IRON',								'REQUIRES_PLOT_HAS_MINE'),
	-- ('HAS_BARRACKS_RESOURCE', 'REQUIRES_RESOURCE_STONE_IN_PLOT'),
	-- ('HAS_BARRACKS_RESOURCE', 'REQUIRES_RESOURCE_COPPER_IN_PLOT'),
	-- ('HAS_BARRACKS_RESOURCE', 'REQUIRES_RESOURCE_IRON_IN_PLOT'),
	-- Encampment
	('HAS_IMPROVED_STONE',								'REQUIRES_RESOURCE_STONE_IN_PLOT'),
	('HAS_IMPROVED_STONE',								'REQUIRES_PLOT_HAS_QUARRY'),
	-- Armory
	('HAS_ARMORY_RESOURCE',								'REQUIRES_RESOURCE_NITER_IN_PLOT'),
	('HAS_ARMORY_RESOURCE',								'REQUIRES_RESOURCE_OIL_IN_PLOT'),
	-- Factory
	('HAS_FACTORY_RESOURCE',							'REQUIRES_RESOURCE_COAL_IN_PLOT'),
	-- Military Academy
	('HAS_MILITARY_ACADEMY_RESOURCE',					'REQUIRES_RESOURCE_ALUMINUM_IN_PLOT'),
	('HAS_MILITARY_ACADEMY_RESOURCE',					'REQUIRES_RESOURCE_URANIUM_IN_PLOT'),
	-- Aqueduct
	('IS_FARM_ADJACENT_TO_AQUEDUCT',					'REQUIRES_PLOT_ADJACENT_TO_AQUEDUCT'),
	('IS_FARM_ADJACENT_TO_AQUEDUCT',					'REQUIRES_PLOT_HAS_FARM'),
	('IS_FARM_ADJACENT_TO_FRESH_WATER',					'REQUIRES_PLOT_IS_FRESH_WATER'),
	('IS_FARM_ADJACENT_TO_FRESH_WATER',					'REQUIRES_PLOT_HAS_FARM'),
	('IS_FARM_ADJACENT_TO_FRESH_WATER_AND_AQUEDUCT',	'REQUIRES_PLOT_ADJACENT_TO_AQUEDUCT'),
	('IS_FARM_ADJACENT_TO_FRESH_WATER_AND_AQUEDUCT',	'REQUIRES_PLOT_IS_FRESH_WATER'),
	('IS_FARM_ADJACENT_TO_FRESH_WATER_AND_AQUEDUCT',	'REQUIRES_PLOT_HAS_FARM'),
	-- Mbanza, add food to adjacent jungle or forest.
	('MBANZA_ADJACENCY_FOOD_JUNGLE_REQUIREMENTS',		'REQUIRES_PLOT_HAS_JUNGLE'),
	('MBANZA_ADJACENCY_FOOD_JUNGLE_REQUIREMENTS',		'ADJACENT_TO_OWNER'),
	('MBANZA_ADJACENCY_FOOD_FOREST_REQUIREMENTS',		'PLOT_IS_FOREST_REQUIREMENT'),
	('MBANZA_ADJACENCY_FOOD_FOREST_REQUIREMENTS',		'ADJACENT_TO_OWNER'),
	-- University add science to adjacent rainforest
	('UNIVERSITY_ADJACENCY_SCIENCE_JUNGLE_REQUIREMENTS','REQUIRES_PLOT_HAS_JUNGLE'),
	('UNIVERSITY_ADJACENCY_SCIENCE_JUNGLE_REQUIREMENTS','ADJACENT_TO_OWNER'),
	-- Workshop
	('PLOT_HAS_MINE_OR_QUARRY',							'REQUIRES_PLOT_HAS_MINE'),
	('PLOT_HAS_MINE_OR_QUARRY',							'REQUIRES_PLOT_HAS_QUARRY'),
	-- Airport vs film studio
	('HAS_AIRPORT_WITHIN_9_TILES',						'REQUIRES_AIRPORT_AND_WITHIN_9TILES'),
	-- ('HAS_AIRPORT_WITHIN_9_TILES',						'REQUIRES_CITY_HAS_NO_FILM_STUDIO'),
	('CITY_HAS_NO_FILM_STUDIO',							'REQUIRES_CITY_HAS_NO_FILM_STUDIO'),
	-- Hill
	('PLOT_IS_TERRAIN_HILL',							'PLOT_IS_GRASS_HILLS_TERRAIN_REQUIREMENT'),
	('PLOT_IS_TERRAIN_HILL',							'PLOT_IS_PLAINS_HILLS_TERRAIN_REQUIREMENT'),
	('PLOT_IS_TERRAIN_HILL',							'PLOT_IS_TUNDRA_HILLS_TERRAIN_REQUIREMENT'),
	('PLOT_IS_TERRAIN_HILL',							'PLOT_IS_DESERT_HILLS_TERRAIN_REQUIREMENT'),
	('PLOT_IS_TERRAIN_HILL',							'PLOT_IS_SNOW_HILLS_TERRAIN_REQUIREMENT'),
	-- Maori
	('PLOT_HAS_JUNGLE_CIVIL_SERVICE_REQUIREMENTS',		'REQUIRES_PLAYER_HAS_CIVIL_SERVICE'),
	('PLOT_HAS_JUNGLE_CIVIL_SERVICE_REQUIREMENTS',		'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'),
	('PLOT_HAS_JUNGLE_CIVIL_SERVICE_REQUIREMENTS',		'PLOT_IS_JUNGLE_REQUIREMENT'),
	('PLOT_HAS_FOREST_CIVIL_SERVICE_REQUIREMENTS',		'REQUIRES_PLAYER_HAS_CIVIL_SERVICE'),
	('PLOT_HAS_FOREST_CIVIL_SERVICE_REQUIREMENTS',		'REQUIRES_PLOT_HAS_NO_IMPROVEMENT'),
	('PLOT_HAS_FOREST_CIVIL_SERVICE_REQUIREMENTS',		'PLOT_IS_FOREST_REQUIREMENT'),
	-- not used
	('IS_FARM_ADJACENT_TO_RIVER',						'REQUIRES_PLOT_ADJACENT_TO_RIVER'),
	('IS_FARM_ADJACENT_TO_RIVER',						'REQUIRES_PLOT_HAS_FARM'),
	('IS_FARM_NOT_ADJACENT_TO_RIVER',					'REQUIRES_PLOT_NOT_ADJACENT_TO_RIVER'),
	('IS_FARM_NOT_ADJACENT_TO_RIVER',					'REQUIRES_PLOT_HAS_FARM');

-- Golden Age Policies
insert or replace into RequirementSets
	(RequirementSetId,				RequirementSetType)
values
	('UNIT_IS_GOLDEN_AGE_SETTLER', 'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,				RequirementId)
values
	('UNIT_IS_GOLDEN_AGE_SETTLER',	'REQUIREMENT_UNIT_IS_SETTLER'),
	('UNIT_IS_GOLDEN_AGE_SETTLER',	'REQUIRES_PLAYER_HAS_GOLDEN_AGE');

-- Beliefs
insert or replace into RequirementSets
	(RequirementSetId,											RequirementSetType)
values
	-- Pantheon
	('CITY_FOLLOWS_PANTHEON_AND_HOLYSITE_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL'),
	('CITY_FOLLOWS_RELIGION_AND_HOLYSITE_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL'),
	('HOLYSITE_TUNDRA_REQUIREMENTS',							'REQUIREMENTSET_TEST_ALL'),
	('HOLYSITE_TUNDRA_HILL_REQUIREMENTS',						'REQUIREMENTSET_TEST_ALL'),
	('HOLYSITE_DESERT_REQUIREMENTS',							'REQUIREMENTSET_TEST_ALL'),
	('HOLYSITE_DESERT_HILL_REQUIREMENTS',						'REQUIREMENTSET_TEST_ALL'),
	('HOLYSITE_JUNGLE_REQUIREMENTS',							'REQUIREMENTSET_TEST_ALL'),
	('PLOT_HAS_TUNDRA_OR_TUNDRA_HILL_REQUIREMENTS',				'REQUIREMENTSET_TEST_ANY'),
	('PLOT_HAS_DESERT_OR_DESERT_HILL_REQUIREMENTS',				'REQUIREMENTSET_TEST_ANY'),
	('GODDESS_OF_FIRE_CITY_HAS_VOLCANO',						'REQUIREMENTSET_TEST_ANY'),
	('RELIGIOUS_IDOLS_CITY_HAS_LUXURY_OR_BONUS_MINE',			'REQUIREMENTSET_TEST_ANY'),
	('STONE_CIRCLES_CITY_HAS_QUARRY',							'REQUIREMENTSET_TEST_ANY'),
	('ONE_WITH_NATURE_CITY_HAS_NATURAL_WONDER',					'REQUIREMENTSET_TEST_ANY'),
	('HOLYSITE_PLANTATION_REQUIREMENTS',						'REQUIREMENTSET_TEST_ALL'),
	('HOLYSITE_PASTURE_REQUIREMENTS',							'REQUIREMENTSET_TEST_ALL'),
	('PLOT_EIGHT_INCLUDE_CITY_CENTER',							'REQUIREMENTSET_TEST_ALL'),
	('CITY_HAS_GRANARY',										'REQUIREMENTSET_TEST_ALL'),
	('CITY_HAS_MONUMENT',										'REQUIREMENTSET_TEST_ALL'),
	('PLOT_HAS_FARM_RESOURCE_REQUIREMENTS',						'REQUIREMENTSET_TEST_ANY'),
	('PLOT_IS_COAST_NOT_LAKE_REQUIREMENTS',						'REQUIREMENTSET_TEST_ALL'),
	('PLOT_IS_OCEAN_REQUIREMENTS',								'REQUIREMENTSET_TEST_ALL'),
	('PLOT_HAS_CAMP_AND_RESOURCE_REQUIREMENTS',					'REQUIREMENTSET_TEST_ALL'),
	-- Follower
	('RELIGIOUS_ART_ADJACENCY_CULTURE_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	-- Pantheon
	('CITY_FOLLOWS_PANTHEON_AND_HOLYSITE_REQUIREMENTS',			'REQUIRES_CITY_FOLLOWS_PANTHEON'),
	('CITY_FOLLOWS_PANTHEON_AND_HOLYSITE_REQUIREMENTS',			'REQUIRES_DISTRICT_IS_HOLY_SITE'),
	('CITY_FOLLOWS_RELIGION_AND_HOLYSITE_REQUIREMENTS',			'REQUIRES_CITY_FOLLOWS_RELIGION'),
	('CITY_FOLLOWS_RELIGION_AND_HOLYSITE_REQUIREMENTS',			'REQUIRES_DISTRICT_IS_HOLY_SITE'),
	('HOLYSITE_TUNDRA_REQUIREMENTS',							'REQUIRES_PLOT_HAS_TUNDRA'),
	('HOLYSITE_TUNDRA_REQUIREMENTS',							'ADJACENT_TO_OWNER'),
	('HOLYSITE_TUNDRA_HILL_REQUIREMENTS',						'REQUIRES_PLOT_HAS_TUNDRA_HILLS'),
	('HOLYSITE_TUNDRA_HILL_REQUIREMENTS',						'ADJACENT_TO_OWNER'),
	('HOLYSITE_DESERT_REQUIREMENTS',							'REQUIRES_PLOT_HAS_DESERT'),
	('HOLYSITE_DESERT_REQUIREMENTS',							'ADJACENT_TO_OWNER'),
	('HOLYSITE_DESERT_HILL_REQUIREMENTS',						'REQUIRES_PLOT_HAS_DESERT_HILLS'),
	('HOLYSITE_DESERT_HILL_REQUIREMENTS',						'ADJACENT_TO_OWNER'),
	('HOLYSITE_JUNGLE_REQUIREMENTS',							'REQUIRES_PLOT_HAS_JUNGLE'),
	('HOLYSITE_JUNGLE_REQUIREMENTS',							'ADJACENT_TO_OWNER'),
	('PLOT_HAS_TUNDRA_OR_TUNDRA_HILL_REQUIREMENTS',				'REQUIRES_PLOT_HAS_TUNDRA'),
	('PLOT_HAS_TUNDRA_OR_TUNDRA_HILL_REQUIREMENTS',				'REQUIRES_PLOT_HAS_TUNDRA_HILLS'),
	('PLOT_HAS_DESERT_OR_DESERT_HILL_REQUIREMENTS',				'REQUIRES_PLOT_HAS_DESERT'),
	('PLOT_HAS_DESERT_OR_DESERT_HILL_REQUIREMENTS',				'REQUIRES_PLOT_HAS_DESERT_HILLS'),
	('GODDESS_OF_FIRE_CITY_HAS_VOLCANO',						'REQUIRES_CITY_HAS_FEATURE_GEOTHERMAL_FISSURE'),
	('GODDESS_OF_FIRE_CITY_HAS_VOLCANO',						'REQUIRES_CITY_HAS_FEATURE_VOLCANIC_SOIL'),
	('GODDESS_OF_FIRE_CITY_HAS_VOLCANO',						'REQUIRES_CITY_HAS_FEATURE_VOLCANO'),
	('GODDESS_OF_FIRE_CITY_HAS_VOLCANO',						'REQUIRES_CITY_HAS_FEATURE_EYJAFJALLAJOKULL'),
	('GODDESS_OF_FIRE_CITY_HAS_VOLCANO',						'REQUIRES_CITY_HAS_FEATURE_VESUVIUS'),
	('GODDESS_OF_FIRE_CITY_HAS_VOLCANO',						'REQUIRES_CITY_HAS_FEATURE_KILIMANJARO'),
	('RELIGIOUS_IDOLS_CITY_HAS_LUXURY_OR_BONUS_MINE',			'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_COPPER'),
	('RELIGIOUS_IDOLS_CITY_HAS_LUXURY_OR_BONUS_MINE',			'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_DIAMONDS'),
	('RELIGIOUS_IDOLS_CITY_HAS_LUXURY_OR_BONUS_MINE',			'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_JADE'),
	('RELIGIOUS_IDOLS_CITY_HAS_LUXURY_OR_BONUS_MINE',			'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_MERCURY'),
	('RELIGIOUS_IDOLS_CITY_HAS_LUXURY_OR_BONUS_MINE',			'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_SALT'),
	('RELIGIOUS_IDOLS_CITY_HAS_LUXURY_OR_BONUS_MINE',			'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_SILVER'),
	('RELIGIOUS_IDOLS_CITY_HAS_LUXURY_OR_BONUS_MINE',			'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_GOLD'),
	('STONE_CIRCLES_CITY_HAS_QUARRY',							'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_STONE'),
	('STONE_CIRCLES_CITY_HAS_QUARRY',							'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_MARBLE'),
	('STONE_CIRCLES_CITY_HAS_QUARRY',							'REQUIRES_CITY_HAS_IMPROVED_RESOURCE_GYPSUM'),
	('HOLYSITE_PLANTATION_REQUIREMENTS',						'REQUIRES_PLOT_HAS_PLANTATION'),
	('HOLYSITE_PLANTATION_REQUIREMENTS',						'ADJACENT_TO_OWNER'),
	('HOLYSITE_PASTURE_REQUIREMENTS',							'REQUIRES_PLOT_HAS_PASTURE'),
	('HOLYSITE_PASTURE_REQUIREMENTS',							'ADJACENT_TO_OWNER'),
	('PLOT_EIGHT_INCLUDE_CITY_CENTER',							'REQUIRES_PLOT_WITHIN_EIGHT_CITY_CENTER'),
	('CITY_HAS_GRANARY',										'REQUIRES_CITY_HAS_BUILDING_GRANARY'),
	('CITY_HAS_MONUMENT',										'REQUIRES_CITY_HAS_BUILDING_MONUMENT'),
	('PLOT_HAS_FARM_RESOURCE_REQUIREMENTS',						'REQUIRES_WHEAT_IN_PLOT'),
	('PLOT_HAS_FARM_RESOURCE_REQUIREMENTS',						'REQUIRES_RICE_IN_PLOT'),
	('PLOT_HAS_FARM_RESOURCE_REQUIREMENTS',						'REQUIRES_MAIZE_IN_PLOT'),
	('PLOT_IS_COAST_NOT_LAKE_REQUIREMENTS',						'PLOT_IS_NOT_LAKE_REQUIREMENTS'),
	('PLOT_IS_COAST_NOT_LAKE_REQUIREMENTS',						'REQUIRES_PLOT_HAS_COAST'),
	('PLOT_IS_OCEAN_REQUIREMENTS',								'REQUIRES_TERRAIN_OCEAN'),
	('PLOT_HAS_CAMP_AND_RESOURCE_REQUIREMENTS',					'REQUIRES_PLOT_HAS_CAMP'),
	('PLOT_HAS_CAMP_AND_RESOURCE_REQUIREMENTS',					'PLOT_HAS_RESOURCE_REQUIREMENTS'),
	-- Follower
	('RELIGIOUS_ART_ADJACENCY_CULTURE_REQUIREMENTS',			'REQUIRES_PLOT_HAS_HOLY_SITE'),
	('RELIGIOUS_ART_ADJACENCY_CULTURE_REQUIREMENTS',			'REQUIRES_CITY_FOLLOWS_RELIGION');

insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)
	select 'ONE_WITH_NATURE_CITY_HAS_NATURAL_WONDER', 'REQUIRES_CITY_HAS_' || FeatureType from Features where NaturalWonder = 1;

-- AI 
insert or replace into RequirementSets (RequirementSetId, RequirementSetType)
select 'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType, 'REQUIREMENTSET_TEST_ALL' from Eras;

insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)
select 'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType, 'REQUIRES_PLAYER_IS_AI' from Eras;
insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)
select 'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType, 'REQUIRES_HIGH_DIFFICULTY' from Eras;
insert or replace into RequirementSetRequirements (RequirementSetId, RequirementId)
select 'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType, 'REQUIRES_PLAYER_IS_' || EraType from Eras;

-- 6 or 8 difficulty.
insert or replace into RequirementArguments (RequirementId,		Name,		Value) values
	('REQUIRES_DIFFICULTY_AT_LEAST_EMPEROR',					'Handicap',	'DIFFICULTY_EMPEROR'),
	('REQUIRES_DIFFICULTY_AT_LEAST_IMMORTAL',					'Handicap',	'DIFFICULTY_IMMORTAL'),
	('REQUIRES_DIFFICULTY_AT_LEAST_DEITY',						'Handicap',	'DIFFICULTY_DEITY');

insert or replace into Requirements (RequirementId,				RequirementType) values
	('REQUIRES_DIFFICULTY_AT_LEAST_EMPEROR',					'REQUIREMENT_PLAYER_HANDICAP_AT_OR_ABOVE'),
	('REQUIRES_DIFFICULTY_AT_LEAST_IMMORTAL',					'REQUIREMENT_PLAYER_HANDICAP_AT_OR_ABOVE'),
	('REQUIRES_DIFFICULTY_AT_LEAST_DEITY',						'REQUIREMENT_PLAYER_HANDICAP_AT_OR_ABOVE');

insert or replace into RequirementSets (RequirementSetId,		RequirementSetType) values
	('PLAYER_IS_AT_LEAST_EMPEROR_DIFFICULTY_AI',				'REQUIREMENTSET_TEST_ALL'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI',					'REQUIREMENTSET_TEST_ALL'),
	('PLAYER_IS_AT_LEAST_IMMORTAL_DIFFICULTY_HUMAN',			'REQUIREMENTSET_TEST_ALL'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN',				'REQUIREMENTSET_TEST_ALL'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN_AND_HAS_CITY',	'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	('PLAYER_IS_AT_LEAST_EMPEROR_DIFFICULTY_AI',				'REQUIRES_PLAYER_IS_AI'),
	('PLAYER_IS_AT_LEAST_EMPEROR_DIFFICULTY_AI',				'REQUIRES_DIFFICULTY_AT_LEAST_EMPEROR'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI',					'REQUIRES_PLAYER_IS_AI'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI',					'REQUIRES_DIFFICULTY_AT_LEAST_DEITY'),
	('PLAYER_IS_AT_LEAST_IMMORTAL_DIFFICULTY_HUMAN',			'REQUIRES_PLAYER_IS_HUMAN'),
	('PLAYER_IS_AT_LEAST_IMMORTAL_DIFFICULTY_HUMAN',			'REQUIRES_DIFFICULTY_AT_LEAST_IMMORTAL'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN',				'REQUIRES_PLAYER_IS_HUMAN'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN',				'REQUIRES_DIFFICULTY_AT_LEAST_DEITY'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN_AND_HAS_CITY',	'REQUIRES_PLAYER_IS_HUMAN'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN_AND_HAS_CITY',	'REQUIRES_DIFFICULTY_AT_LEAST_DEITY'),
	('PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_HUMAN_AND_HAS_CITY',	'REQUIRES_PLAYER_HAS_AT_LEAST_ONE_CITY');

-- PLOT IS IMPROVED
insert or replace into Requirements (RequirementId,	RequirementType,	Inverse)	values
	('REQUIRES_PLOT_IS_IMPROVED',	'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT',	0);
insert or replace into RequirementSetRequirements (RequirementSetId,	RequirementId)	values
	('PLOT_IS_IMPROVED',	'REQUIRES_PLOT_IS_IMPROVED');
insert or replace into RequirementSets (RequirementSetId,	RequirementSetType)	values
	('PLOT_IS_IMPROVED',	'REQUIREMENTSET_TEST_ALL');

-- City Park
insert or replace into RequirementSets 
	(RequirementSetId,												RequirementSetType) 
values
	('CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION_AND_ADJACENT',	'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
values
	('CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION_AND_ADJACENT',	'ADJACENT_TO_OWNER'),
	('CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION_AND_ADJACENT',	'REQUIRES_CITY_HAS_GOVERNOR_PROMOTION_PARKS_RECREATION');
