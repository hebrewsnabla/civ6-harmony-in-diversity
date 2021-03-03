-------------------------------------
--      Newly added Modifiers      --
-------------------------------------

-- need add to Types
insert or replace into Types
	(Type,														Kind)
values
	('MODIFIER_SINGLE_CIYT_ADJUST_BUILDING_PRODUCTION_CHANGE',	'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CIYT_ADJUST_DISTRICT_PRODUCTION_CHANGE',	'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CIYT_ADJUST_UNIT_PRODUCTION_CHANGE',		'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CIYT_ENABLE_UNIT_FAITH_PURCHASE',			'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER','KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER','KIND_MODIFIER'),
	('MODIFIER_SINGLE_CIYT_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS','KIND_MODIFIER'),
	('MODIFIER_REYNA_ADJUST_DISTRICTS_YIELD_CHANGE',			'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION',		'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_PLAYER_YIELD_CHANGE',		'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',		'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_YIELD_MODIFIER_PER_TRIBUTARY','KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',			'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_EXTRA_UNIT_COPY_TAG',			'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT',		'KIND_MODIFIER'),
	('MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT',	'KIND_MODIFIER'),
	--('MODIFIER_PLAYER_CITIES_ADJUST_TOURISM_LATE_ERAS',			'KIND_MODIFIER'),
	-- ('MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER',				'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_INNER_DEFENSE',				'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_OUTER_DEFENSE',				'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_RANGED_STRIKE',				'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',					'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_RIVER_ADJACENCY',					'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_RELIGION_EXTRA_PROMOTIONS',		'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_RELIGION_IGNORE_PRESSURE',			'KIND_MODIFIER'),
	('MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',				'KIND_MODIFIER'),
	('MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',	'KIND_MODIFIER'),
	('MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST',				'KIND_MODIFIER'),
	('MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',				'KIND_MODIFIER'),
	('MODIFIER_GRANT_BUILDING_IN_CAPITAL',						'KIND_MODIFIER'),
	('MODIFIER_PLAYER_GRANT_UNIT_BY_CLASS_IN_CAPITAL',			'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_WONDER_PRODUCTION',			'KIND_MODIFIER'),
	('MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_BY_CLASS_IN_CAPITAL_WITH_MODIFIER',	'KIND_MODIFIER');

insert into DynamicModifiers
	(ModifierType,												CollectionType,						EffectType)
values 
	('MODIFIER_SINGLE_CIYT_ADJUST_BUILDING_PRODUCTION_CHANGE',	'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_PRODUCTION_BUILDING'),
	('MODIFIER_SINGLE_CIYT_ADJUST_DISTRICT_PRODUCTION_CHANGE',	'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_PRODUCTION_DISTRICT'),
	('MODIFIER_SINGLE_CIYT_ADJUST_UNIT_PRODUCTION_CHANGE',		'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_PRODUCTION_UNIT'),
	('MODIFIER_SINGLE_CIYT_ENABLE_UNIT_FAITH_PURCHASE',			'COLLECTION_OWNER',					'EFFECT_ENABLE_UNIT_FAITH_PURCHASE'),
	('MODIFIER_SINGLE_CITY_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER','COLLECTION_OWNER',				'EFFECT_ADJUST_ALL_BUILDING_PRODUCTION_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER','COLLECTION_CITY_DISTRICTS',	'EFFECT_ADJUST_DISTRICT_TOURISM_ADJACENCY_YIELD_MOFIFIER'),
	('MODIFIER_SINGLE_CIYT_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS','COLLECTION_CITY_DISTRICTS','EFFECT_ADJUST_DISTRICT_YIELD_BASED_ON_ADJACENCY_BONUS'),
	('MODIFIER_REYNA_ADJUST_DISTRICTS_YIELD_CHANGE',			'COLLECTION_CITY_DISTRICTS',		'EFFECT_ADJUST_DISTRICT_YIELD_CHANGE'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION',		'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('MODIFIER_PLAYER_CITIES_ADJUST_PLAYER_YIELD_CHANGE',		'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_PLAYER_YIELD_CHANGE'),
	('MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',		'COLLECTION_CITY_DISTRICTS',		'EFFECT_ADJUST_DISTRICT_YIELD_CHANGE'),
	('MODIFIER_SINGLE_CITY_ADJUST_YIELD_MODIFIER_PER_TRIBUTARY','COLLECTION_OWNER_CITY',			'EFFECT_ADJUST_PLAYER_YIELD_MODIFIER_PER_TRIBUTARY'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',			'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_PURCHASE_COST'),
	('MODIFIER_SINGLE_CITY_ADJUST_EXTRA_UNIT_COPY_TAG',			'COLLECTION_OWNER',					'EFFECT_ADJUST_EXTRA_UNIT_COPY_TAG'),
	('MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT',		'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_POPULATION_UNIT_CREATED'),	
	('MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT', 'COLLECTION_OWNER_CITY',			'EFFECT_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
	-- ('MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION',		'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	-- ('MODIFIER_SINGLE_CITY_ADJUST_MILITARY_UNITS_PRODUCTION',	'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_ALL_MILITARY_UNITS_PRODUCTION'),
	-- ('MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER',					'COLLECTION_CITY_DISTRICTS',		'EFFECT_ATTACH_MODIFIER'),
	--('MODIFIER_PLAYER_CITIES_ADJUST_TOURISM_LATE_ERAS',			'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_TOURISM_LATE_ERAS'),
	('MODIFIER_SINGLE_CITY_ADJUST_INNER_DEFENSE',				'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_INNER_DEFENSE'),
	('MODIFIER_SINGLE_CITY_ADJUST_OUTER_DEFENSE',				'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_OUTER_DEFENSE'),
	('MODIFIER_SINGLE_CITY_ADJUST_RANGED_STRIKE',				'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_RANGED_STRIKE'),
	('MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',					'COLLECTION_OWNER',					'EFFECT_TERRAIN_ADJACENCY'),
	('MODIFIER_SINGLE_CITY_RIVER_ADJACENCY',					'COLLECTION_OWNER',					'EFFECT_RIVER_ADJACENCY'),
	('MODIFIER_PLAYER_CITIES_RELIGION_EXTRA_PROMOTIONS',		'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_RELIGION_EXTRA_PROMOTIONS'),
	('MODIFIER_PLAYER_CITIES_RELIGION_IGNORE_PRESSURE',			'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_RELIGION_IGNORE_PRESSURE'),
	('MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',				'COLLECTION_ALL_CITIES',			'EFFECT_IMPROVEMENT_ADJACENCY'),
	('MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',	'COLLECTION_OWNER',					'EFFECT_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'),
	('MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST',				'COLLECTION_OWNER',					'EFFECT_ADJUST_BUILDING_PURCHASE_COST'),
	('MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',				'COLLECTION_OWNER',					'EFFECT_ENABLE_UNIT_FAITH_PURCHASE'),
	('MODIFIER_GRANT_BUILDING_IN_CAPITAL',						'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_GRANT_BUILDING_IN_CITY_IGNORE'),
	('MODIFIER_PLAYER_GRANT_UNIT_BY_CLASS_IN_CAPITAL',			'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_GRANT_UNIT_BY_CLASS'),
	('MODIFIER_SINGLE_CITY_ADJUST_WONDER_PRODUCTION',			'COLLECTION_OWNER',					'EFFECT_ADJUST_WONDER_PRODUCTION'),
	('MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_BY_CLASS_IN_CAPITAL_WITH_MODIFIER',	'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_GRANT_UNIT_OF_CLASS_AND_APPLY_ABILITY');