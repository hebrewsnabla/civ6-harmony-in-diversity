-------------------------------------
--      Newly added Modifiers      --
-------------------------------------

-- need add to Types
insert or replace into Types
	(Type,														Kind)
values
	--('MODIFIER_PLAYER_CITIES_ADJUST_TOURISM_LATE_ERAS',			'KIND_MODIFIER'),
	-- ('MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER',				'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_INNER_DEFENSE',				'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_OUTER_DEFENSE',				'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_ADJUST_RANGED_STRIKE',				'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',					'KIND_MODIFIER'),
	('MODIFIER_SINGLE_CITY_RIVER_ADJACENCY',					'KIND_MODIFIER'),
	('MODIFIER_PLAYER_CITIES_RELIGION_IGNORE_PRESSURE',			'KIND_MODIFIER'),
	('MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',				'KIND_MODIFIER'),
	('MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',	'KIND_MODIFIER'),
	('MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST',				'KIND_MODIFIER'),
	('MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',				'KIND_MODIFIER'),
	('MODIFIER_PLAYER_GRANT_UNIT_BY_CLASS_IN_CAPITAL',			'KIND_MODIFIER');

insert into DynamicModifiers
	(ModifierType,												CollectionType,						EffectType)
values 
	-- ('MODIFIER_SINGLE_CITY_ADJUST_UNIT_TAG_ERA_PRODUCTION',		'COLLECTION_OWNER',					'EFFECT_ADJUST_UNIT_TAG_ERA_PRODUCTION'),
	-- ('MODIFIER_SINGLE_CITY_ADJUST_MILITARY_UNITS_PRODUCTION',	'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_ALL_MILITARY_UNITS_PRODUCTION'),
	-- ('MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER',					'COLLECTION_CITY_DISTRICTS',		'EFFECT_ATTACH_MODIFIER'),
	--('MODIFIER_PLAYER_CITIES_ADJUST_TOURISM_LATE_ERAS',			'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_TOURISM_LATE_ERAS'),
	('MODIFIER_SINGLE_CITY_ADJUST_INNER_DEFENSE',				'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_INNER_DEFENSE'),
	('MODIFIER_SINGLE_CITY_ADJUST_OUTER_DEFENSE',				'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_OUTER_DEFENSE'),
	('MODIFIER_SINGLE_CITY_ADJUST_RANGED_STRIKE',				'COLLECTION_OWNER',					'EFFECT_ADJUST_CITY_RANGED_STRIKE'),
	('MODIFIER_SINGLE_CITY_TERRAIN_ADJACENCY',					'COLLECTION_OWNER',					'EFFECT_TERRAIN_ADJACENCY'),
	('MODIFIER_SINGLE_CITY_RIVER_ADJACENCY',					'COLLECTION_OWNER',					'EFFECT_RIVER_ADJACENCY'),
	('MODIFIER_PLAYER_CITIES_RELIGION_IGNORE_PRESSURE',			'COLLECTION_PLAYER_CITIES',			'EFFECT_ADJUST_CITY_RELIGION_IGNORE_PRESSURE'),
	('MODIFIER_ALL_CITIES_IMPROVEMENT_ADJACENCY',				'COLLECTION_ALL_CITIES',			'EFFECT_IMPROVEMENT_ADJACENCY'),
	('MODIFIER_CITY_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE',	'COLLECTION_OWNER',					'EFFECT_ENABLE_SPECIFIC_BUILDING_FAITH_PURCHASE'),
	('MODIFIER_CITY_ADJUST_BUILDING_PURCHASE_COST',				'COLLECTION_OWNER',					'EFFECT_ADJUST_BUILDING_PURCHASE_COST'),
	('MODIFIER_CITY_ENABLE_UNIT_FAITH_PURCHASE',				'COLLECTION_OWNER',					'EFFECT_ENABLE_UNIT_FAITH_PURCHASE'),
	('MODIFIER_PLAYER_GRANT_UNIT_BY_CLASS_IN_CAPITAL',			'COLLECTION_PLAYER_CAPITAL_CITY',	'EFFECT_GRANT_UNIT_BY_CLASS');
