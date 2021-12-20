-------------------------------------
--      Newly added Modifiers      --
-------------------------------------

-- need add to Types
insert or ignore into Types
	(Type,																		Kind)
values
	('MODIFIER_PLAYER_UNITS_PROMOTE_NO_FINISH_MOVES',							'KIND_MODIFIER'),
	('MODIFIER_CITY_ADJUST_CITY_YIELD_PER_TERRAIN_TYPE',						'KIND_MODIFIER'),
	('MODIFIER_PLAYER_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',					'KIND_MODIFIER'),
	('MODIFIER_PLAYER_ALLOW_PROJECT_CATHERINE',									'KIND_MODIFIER'),
	('MODIFIER_PLAYER_UNIT_ADJUST_BARBARIAN_COMBAT',							'KIND_MODIFIER'),
	('MODIFIER_PLAYER_ADJUST_EMBARK_UNIT_PASS',									'KIND_MODIFIER'),
	('MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_YIELD',					'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER',							'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER',			'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_RESOURCE_HARVEST_BONUS',					'KIND_MODIFIER'),
	('MODIFIER_PLAYER_UNIT_ADJUST_FAITH_ON_DISTRICT_PILLAGE',					'KIND_MODIFIER'),
	('MODIFIER_PLAYER_UNIT_ADJUST_FAITH_ON_IMPROVEMENT_PILLAGE',				'KIND_MODIFIER'),
	('MODIFIER_PLAYER_UNIT_ADJUST_STRENGTH_REDUCTION_FOR_DAMAGE_MODIFIER',		'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PURCHASE_COST',				'KIND_MODIFIER'),
	-- ('MODIFIER_PLAYER_UNITS_ADJUST_IGNORE_ZOC_HD',								'KIND_MODIFIER'),
	('MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',		'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_NATURAL_WONDER_AMENITY',						'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_PLOT_PURCHASE_COST',							'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION',							'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_CHANGE',					'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_CHANGE',					'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_CHANGE',						'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ENABLE_UNIT_FAITH_PURCHASE',							'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER',				'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',			'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',		'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_DISTRICT_ADJACENCY',									'KIND_MODIFIER'),
	('MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',								'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION',						'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_PLAYER_YIELD_CHANGE',						'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',						'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',							'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_EXTRA_UNIT_COPY_TAG',							'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT',						'KIND_MODIFIER'),
	-- ('MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT',					'KIND_MODIFIER'), -- Cannot convert to single city.
	-- ('MODIFIER_PLAYER_CITIES_ADJUST_TOURISM_LATE_ERAS',							'KIND_MODIFIER'),
	-- ('MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER',									'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_INNER_DEFENSE',								'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_OUTER_DEFENSE',								'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_RANGED_STRIKE',								'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',									'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_RIVER_ADJACENCY',									'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_RELIGION_EXTRA_PROMOTIONS',						'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_RELIGION_IGNORE_PRESSURE',							'KIND_MODIFIER'),
	('MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',								'KIND_MODIFIER'),
	('MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',					'KIND_MODIFIER'),
	('MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST',								'KIND_MODIFIER'),
	('MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',								'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_CITY_ALL_YIELDS_CHANGE',				'KIND_MODIFIER'),
	('MODIFIER_GRANT_BUILDING_IN_CAPITAL',										'KIND_MODIFIER'),
	('MODIFIER_PLAYER_GRANT_UNIT_BY_CLASS_IN_CAPITAL',							'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_WONDER_PRODUCTION',							'KIND_MODIFIER'),
	('MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_BY_CLASS_IN_CAPITAL_WITH_MODIFIER',	'KIND_MODIFIER'),
	('MODIFIER_DO_NOTHING', 													'KIND_MODIFIER'),
	('MODIFIER_GARRISON_ADJUST_CITY_LOYALTY',									'KIND_MODIFIER'),
	('MODIFIER_CITY_OWNER_ADJUST_POP_YIELD',									'KIND_MODIFIER'),
	('MODIFIER_CITY_OWNER_ATTACH_MODIFIER',										'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CAPTURED_CITY_ADJUST_BUILDING_YIELD_CHANGE',				'KIND_MODIFIER'),
	('MODIFIER_CITY_OWNER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',			'KIND_MODIFIER'),
	('MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',								'KIND_MODIFIER'),
	('MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',								'KIND_MODIFIER'),
	('MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_WITH_MODIFIER',						'KIND_MODIFIER'),
	('MODIFIER_ALLIANCES_PLAYERS_ATTACH_MODIFIER',								'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_CITY_AMENITIES_FROM_GREAT_PEOPLE',			'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_GRANT_BUILDING_IN_CITY_IGNORE',					'KIND_MODIFIER');

insert or ignore into DynamicModifiers
	(ModifierType,																CollectionType,						EffectType)
values
	('MODIFIER_PLAYER_UNITS_PROMOTE_NO_FINISH_MOVES',							'COLLECTION_PLAYER_UNITS',			'EFFECT_ADJUST_UNIT_PROMOTE_NO_FINISH_MOVES'),
	('MODIFIER_CITY_ADJUST_CITY_YIELD_PER_TERRAIN_TYPE',						'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_YIELD_PER_TERRAIN_TYPE'),
	('MODIFIER_PLAYER_TRAINED_UNITS_ADJUST_GRANT_EXPERIENCE',					'COLLECTION_PLAYER_TRAINED_UNITS',	'EFFECT_ADJUST_UNIT_GRANT_EXPERIENCE'),
	('MODIFIER_PLAYER_ALLOW_PROJECT_CATHERINE',									'COLLECTION_OWNER',					'EFFECT_ADD_PLAYER_PROJECT_AVAILABILITY'),
	('MODIFIER_PLAYER_UNIT_ADJUST_BARBARIAN_COMBAT',							'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_BARBARIAN_COMBAT'),
	('MODIFIER_PLAYER_ADJUST_EMBARK_UNIT_PASS',									'COLLECTION_OWNER',					'EFFECT_ADJUST_PLAYER_EMBARK_UNIT_PASS'),
	('MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_YIELD',					'COLLECTION_PLAYER_DISTRICTS',		'EFFECT_ADJUST_DISTRICT_EXTRA_REGIONAL_YIELD'),
	('MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER',							'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_ATTACH_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER',			'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_ALL_BUILDING_PRODUCTION_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_RESOURCE_HARVEST_BONUS',					'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_RESOURCE_HARVEST_BONUS'),
	('MODIFIER_PLAYER_UNIT_ADJUST_FAITH_ON_DISTRICT_PILLAGE',					'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_FAITH_ON_DISTRICT_PLUNDER'),
	('MODIFIER_PLAYER_UNIT_ADJUST_FAITH_ON_IMPROVEMENT_PILLAGE',				'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_FAITH_ON_IMPROVEMENT_PLUNDER'),
	('MODIFIER_PLAYER_UNIT_ADJUST_STRENGTH_REDUCTION_FOR_DAMAGE_MODIFIER',		'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_STRENGTH_REDUCTION_FOR_DAMAGE_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PURCHASE_COST',				'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_ALL_DISTRICTS_PURCHASE_COST'),
	-- ('MODIFIER_PLAYER_UNITS_ADJUST_IGNORE_ZOC_HD',								'COLLECTION_PLAYER_UNITS',			'EFFECT_ADJUST_UNIT_IGNORE_ZOC'),
	('MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',		'COLLECTION_PLAYER_DISTRICTS',		'EFFECT_ADJUST_DISTRICT_TOURISM_ADJACENCY_YIELD_MOFIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_NATURAL_WONDER_AMENITY',						'COLLECTION_OWNER',					'EFFECT_ADJUST_NATURAL_WONDER_AMENITY'),
	('MODIFIER_SINGLE_CITY_ADJUST_PLOT_PURCHASE_COST',							'COLLECTION_OWNER',					'EFFECT_ADJUST_PLOT_PURCHASE_COST'),
	('MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION',							'COLLECTION_OWNER',					'EFFECT_ADJUST_DISTRICT_PRODUCTION'),
	('MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_CHANGE',					'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_PRODUCTION_BUILDING'),
	('MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_CHANGE',					'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_PRODUCTION_DISTRICT'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_PRODUCTION_CHANGE',						'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_PRODUCTION_UNIT'),
	('MODIFIER_SINGLE_CITY_ENABLE_UNIT_FAITH_PURCHASE',							'COLLECTION_OWNER',					'EFFECT_ENABLE_UNIT_FAITH_PURCHASE'),
	('MODIFIER_SINGLE_CITY_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER',				'COLLECTION_OWNER',					'EFFECT_ADJUST_ALL_BUILDING_PRODUCTION_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',			'COLLECTION_CITY_DISTRICTS',		'EFFECT_ADJUST_DISTRICT_TOURISM_ADJACENCY_YIELD_MOFIFIER'),
	('MODIFIER_SINGLE_CITY_DISTRICT_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',		'COLLECTION_CITY_DISTRICTS',		'EFFECT_ADJUST_DISTRICT_YIELD_BASED_ON_ADJACENCY_BONUS'),
	('MODIFIER_SINGLE_CITY_DISTRICT_ADJACENCY',									'COLLECTION_OWNER',					'EFFECT_DISTRICT_ADJACENCY'),
	('MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',								'COLLECTION_CITY_DISTRICTS',		'EFFECT_ADJUST_DISTRICT_YIELD_CHANGE'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION',						'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	('MODIFIER_PLAYER_CITIES_ADJUST_PLAYER_YIELD_CHANGE',						'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_PLAYER_YIELD_CHANGE'),
	('MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',						'COLLECTION_CITY_DISTRICTS',		'EFFECT_ADJUST_DISTRICT_YIELD_CHANGE'),
	('MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',							'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_PURCHASE_COST'),
	('MODIFIER_SINGLE_CITY_ADJUST_EXTRA_UNIT_COPY_TAG',							'COLLECTION_OWNER',					'EFFECT_ADJUST_EXTRA_UNIT_COPY_TAG'),
	('MODIFIER_SINGLE_CITY_CHANGE_POPULATION_CREATE_UNIT',						'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_POPULATION_UNIT_CREATED'),	
	-- ('MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT', 				'COLLECTION_OWNER_CITY',			'EFFECT_ADJUST_GREAT_PERSON_POINTS_PERCENT'),
	-- ('MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION',						'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	-- ('MODIFIER_SINGLE_CITY_ADJUST_MILITARY_UNITS_PRODUCTION',					'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_ALL_MILITARY_UNITS_PRODUCTION'),
	-- ('MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER',									'COLLECTION_CITY_DISTRICTS',		'EFFECT_ATTACH_MODIFIER'),
	-- ('MODIFIER_PLAYER_CITIES_ADJUST_TOURISM_LATE_ERAS',							'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_TOURISM_LATE_ERAS'),
	('MODIFIER_SINGLE_CITY_ADJUST_INNER_DEFENSE',								'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_INNER_DEFENSE'),
	('MODIFIER_SINGLE_CITY_ADJUST_OUTER_DEFENSE',								'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_OUTER_DEFENSE'),
	('MODIFIER_SINGLE_CITY_ADJUST_RANGED_STRIKE',								'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_RANGED_STRIKE'),
	('MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',									'COLLECTION_OWNER',					'EFFECT_TERRAIN_ADJACENCY'),
	('MODIFIER_SINGLE_CITY_RIVER_ADJACENCY',									'COLLECTION_OWNER',					'EFFECT_RIVER_ADJACENCY'),
	('MODIFIER_PLAYER_CITIES_RELIGION_EXTRA_PROMOTIONS',						'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_RELIGION_EXTRA_PROMOTIONS'),
	('MODIFIER_PLAYER_CITIES_RELIGION_IGNORE_PRESSURE',							'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_RELIGION_IGNORE_PRESSURE'),
	('MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',								'COLLECTION_ALL_CITIES',			'EFFECT_IMPROVEMENT_ADJACENCY'),
	('MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',					'COLLECTION_OWNER',					'EFFECT_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'),
	('MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST',								'COLLECTION_OWNER',					'EFFECT_ADJUST_BUILDING_PURCHASE_COST'),
	('MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',								'COLLECTION_OWNER',					'EFFECT_ENABLE_UNIT_FAITH_PURCHASE'),
	('MODIFIER_GRANT_BUILDING_IN_CAPITAL',										'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_GRANT_BUILDING_IN_CITY_IGNORE'),
	('MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_CITY_ALL_YIELDS_CHANGE',				'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_ADJUST_CITY_ALL_YIELDS_CHANGE'),
	('MODIFIER_PLAYER_GRANT_UNIT_BY_CLASS_IN_CAPITAL',							'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_GRANT_UNIT_BY_CLASS'),
	('MODIFIER_SINGLE_CITY_ADJUST_WONDER_PRODUCTION',							'COLLECTION_OWNER',					'EFFECT_ADJUST_WONDER_PRODUCTION'),
	('MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_BY_CLASS_IN_CAPITAL_WITH_MODIFIER',	'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_GRANT_UNIT_OF_CLASS_AND_APPLY_ABILITY'),
	('MODIFIER_DO_NOTHING', 													'COLLECTION_OWNER', 				'EFFECT_DO_NOTHING'),
	('MODIFIER_GARRISON_ADJUST_CITY_LOYALTY',									'COLLECTION_UNIT_NEAREST_OWNER_CITY','EFFECT_ADJUST_CITY_IDENTITY_PER_TURN'),
	('MODIFIER_CITY_OWNER_ADJUST_POP_YIELD',									'COLLECTION_OWNER_CITY',			'EFFECT_ADJUST_CITY_YIELD_PER_POPULATION'),
	('MODIFIER_CITY_OWNER_ATTACH_MODIFIER',										'COLLECTION_OWNER_CITY',			'EFFECT_ATTACH_MODIFIER'),
	('MODIFIER_CITY_OWNER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',			'COLLECTION_OWNER_CITY', 			'EFFECT_ADJUST_CITY_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
	('MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',								'COLLECTION_PLAYER_DISTRICTS', 		'EFFECT_ATTACH_MODIFIER'),
	('MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',								'COLLECTION_OWNER',					'EFFECT_GRANT_PLAYER_SPECIFIC_TECH_BOOST_GREAT_PERSON'),
	('MODIFIER_PLAYER_GRANT_UNIT_OF_ABILITY_WITH_MODIFIER',						'COLLECTION_OWNER',					'EFFECT_GRANT_UNIT_OF_CLASS_AND_APPLY_ABILITY'),
	('MODIFIER_ALLIANCES_PLAYERS_ATTACH_MODIFIER',								'COLLECTION_ALLIANCE_PLAYERS',		'EFFECT_ATTACH_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_ADJUST_CITY_AMENITIES_FROM_GREAT_PEOPLE',			'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_AMENITIES_FROM_GREAT_PEOPLE'),
	('MODIFIER_PLAYER_CITIES_GRANT_BUILDING_IN_CITY_IGNORE',					'COLLECTION_PLAYER_CITIES',			'EFFECT_GRANT_BUILDING_IN_CITY_IGNORE');

