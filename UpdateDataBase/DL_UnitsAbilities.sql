-------------------------------------
--   Units Abilities Adjustments   --
-------------------------------------

insert or replace into Types
	(Type,														Kind)
values
	('ABILITY_LEVY_DEBUFF_IN_ENEMY_TERRITORY',					'KIND_ABILITY'),
	('ABILITY_NAVAL_MELEE_ESCORT_MOBILITY_SHARED_MOVEMENT',		'KIND_ABILITY'),
	('ABILITY_SPY_AND_RECON_BONUS_SIGHT',						'KIND_ABILITY'),
	('ABILITY_CIVILIAN_BONUS_SIGHT',							'KIND_ABILITY'),
	('ABILITY_EAGLE_WARRIOR',									'KIND_ABILITY'),
	('ABILITY_HD_BATTLECRY',									'KIND_ABILITY'),
	('ABILITY_HD_GAIN_SCIENCE_WHEN_KILLS',						'KIND_ABILITY'),
	('ABILITY_HD_CAN_MOVE_AFTER_ATTACK',						'KIND_ABILITY'),
	('ABILITY_INCA_IGNORE_HILLS',								'KIND_ABILITY'),
	('ABILITY_KONGO_IGNORE_WOODS',								'KIND_ABILITY'),
	('ABILITY_AMANI_FERR_PROMOTION',							'KIND_ABILITY'),
	('ABILITY_MILLITARY_ENGINEER_IGNORE_TERRAIN',				'KIND_ABILITY'),
	('ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT',			'KIND_ABILITY'),
	('ABILITY_BISHOP_EXTRA_MOVEMENT',							'KIND_ABILITY'),
	('ABILITY_BISHOP_TRAINED_UNIT_STRENGTH',					'KIND_ABILITY'),
	('ABILITY_BISHOP_TRAINED_UNIT_EXP',							'KIND_ABILITY'),
	('ABILITY_VICTOR_TRAINED_UNIT_EXP',							'KIND_ABILITY'),
	('ABILITY_GOV_FAITH_COMBAT_STRENGTH',						'KIND_ABILITY'),
	('ABILITY_GOV_MILITARY_MOVEMENT',							'KIND_ABILITY'),
 	('ABILITY_GOV_MILITARY_COMBAT_STRENGTH',					'KIND_ABILITY'),
    ('ABILITY_VICTOR_COMMANDER_STRENGTH',                       'KIND_ABILITY'),
	('ABILITY_VICTOR_TRAINED_UNIT_STRENGTH',					'KIND_ABILITY'),
	('ABILITY_KOTOKU_IN_TRAINED_FREE_PROMOTION',				'KIND_ABILITY'),
	--dacaogu trained units
	('ABILITY_TRAINED_LIGHT_CAVALRY_EXTRA_PILLAGE_YIELD',		'KIND_ABILITY'),
	('ABILITY_TRAINED_LIGHT_CAVALRY_PILLAGE_LESS_MOVEMENT',		'KIND_ABILITY'),
	-- 
	('ABILITY_LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT',			'KIND_ABILITY'),
	('ABILITY_HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT',			'KIND_ABILITY'),
	-- 
	('ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH',					'KIND_ABILITY'),
	('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',					'KIND_ABILITY'),
	('ABILITY_STABLE_TRAINED_UNIT_STRENGTH',					'KIND_ABILITY'),
	('ABILITY_ORDU_TRAINED_UNIT_STRENGTH',						'KIND_ABILITY'),
	('ABILITY_MOSQUE_TRAINED_UNIT_STRENGTH',					'KIND_ABILITY'),
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',			'KIND_ABILITY'),
	('ABILITY_SEAPORT_TRAINED_UNIT_STRENGTH',					'KIND_ABILITY'),
	('ABILITY_SCHOLASTICISM_BUFF',								'KIND_ABILITY'),
	('ABILITY_IKANDA_ANTI_CAVALRY_MOVEMENT_BONUS',				'KIND_ABILITY'),
	('ABILITY_TERRITORY_COMBAT',								'KIND_ABILITY'),
	('ABILITY_NAVAL_RAIDER_BONUS',								'KIND_ABILITY'),
	('ABILITY_ARCHAEOLOGIST_IGNORE_HILLS',						'KIND_ABILITY'),
	('ABILITY_ARCHAEOLOGIST_IGNORE_FOREST',						'KIND_ABILITY'),
	-- Kotoku In
	('ABILITY_KOTOKU_IN_ENLIGHTENED',							'KIND_ABILITY');

insert or replace into TypeTags
	(Type,																Tag)
values
	('ABILITY_LEVY_DEBUFF_IN_ENEMY_TERRITORY',							'CLASS_MILITARY'),
	('ABILITY_NAVAL_MELEE_ESCORT_MOBILITY_SHARED_MOVEMENT',				'CLASS_NAVAL_MELEE'),
	('ABILITY_CIVILIAN_BONUS_SIGHT',									'CLASS_SETTLER'),
	('ABILITY_CIVILIAN_BONUS_SIGHT',									'CLASS_BUILDER'),
	('ABILITY_CIVILIAN_BONUS_SIGHT',									'CLASS_TRADER'),
	('ABILITY_SPY_AND_RECON_BONUS_SIGHT',								'CLASS_RECON'),
	('ABILITY_SPY_AND_RECON_BONUS_SIGHT',								'CLASS_SPY'),
	('ABILITY_HD_GAIN_SCIENCE_WHEN_KILLS',								'CLASS_HD_GAIN_SCIENCE_WHEN_KILLS'),
	('ABILITY_HD_CAN_MOVE_AFTER_ATTACK',								'CLASS_HD_CAN_MOVE_AFTER_ATTACK'),
	('ABILITY_AMANI_FERR_PROMOTION',									'CLASS_SPY'),
	('ABILITY_MILLITARY_ENGINEER_IGNORE_TERRAIN',						'CLASS_MILITARY_ENGINEER'),
	('ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT',					'CLASS_BUILDER'),
	('ABILITY_BISHOP_EXTRA_MOVEMENT',									'CLASS_WARRIOR_MONK'),
	('ABILITY_BISHOP_EXTRA_MOVEMENT',									'CLASS_RELIGIOUS_ALL'),
	('ABILITY_BISHOP_TRAINED_UNIT_EXP',									'CLASS_WARRIOR_MONK'),
	('ABILITY_BISHOP_TRAINED_UNIT_STRENGTH',							'CLASS_WARRIOR_MONK'),
	('ABILITY_VICTOR_TRAINED_UNIT_EXP',									'CLASS_MILITARY'),
	('ABILITY_GOV_FAITH_COMBAT_STRENGTH',								'CLASS_RELIGIOUS_ALL'),
	('ABILITY_GOV_MILITARY_MOVEMENT',									'CLASS_MILITARY'),
	('ABILITY_GOV_MILITARY_COMBAT_STRENGTH',							'CLASS_MILITARY'),
	('ABILITY_VICTOR_COMMANDER_STRENGTH',								'CLASS_MILITARY'),
	('ABILITY_VICTOR_TRAINED_UNIT_STRENGTH',							'CLASS_MILITARY'),							
	('ABILITY_KOTOKU_IN_TRAINED_FREE_PROMOTION',						'CLASS_WARRIOR_MONK'),
	('ABILITY_TRAINED_LIGHT_CAVALRY_EXTRA_PILLAGE_YIELD',				'CLASS_DACAOGU'),
	('ABILITY_TRAINED_LIGHT_CAVALRY_PILLAGE_LESS_MOVEMENT',				'CLASS_DACAOGU'),
	('ABILITY_LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT',					'CLASS_LIGHT_CAVALRY'),
	('ABILITY_HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT',					'CLASS_HEAVY_CAVALRY'),
	('ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH',							'CLASS_MELEE'),
	('ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH',							'CLASS_RANGED'),
	('ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH',							'CLASS_ANTI_CAVALRY'),
	('ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH',							'CLASS_RANGED_CAVALRY'),
	('ABILITY_BARRACKS_TRAINED_UNIT_XP',								'CLASS_RANGED_CAVALRY'),
	('ABILITY_STABLE_TRAINED_UNIT_STRENGTH',							'CLASS_LIGHT_CAVALRY'),
	('ABILITY_STABLE_TRAINED_UNIT_STRENGTH',							'CLASS_HEAVY_CAVALRY'),
	('ABILITY_STABLE_TRAINED_UNIT_STRENGTH',							'CLASS_SIEGE'),
	('ABILITY_STABLE_TRAINED_UNIT_STRENGTH',							'CLASS_RANGED_CAVALRY'),
	('ABILITY_STABLE_TRAINED_UNIT_XP',									'CLASS_RANGED_CAVALRY'),
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',					'CLASS_MELEE'),
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',					'CLASS_RANGED'),
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',					'CLASS_ANTI_CAVALRY'),
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',					'CLASS_SIEGE'),
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',					'CLASS_LIGHT_CAVALRY'),
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',					'CLASS_HEAVY_CAVALRY'),	
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',					'CLASS_RANGED_CAVALRY'),				
	('ABILITY_SEAPORT_TRAINED_UNIT_STRENGTH',							'CLASS_NAVAL_RANGED'),
	('ABILITY_SEAPORT_TRAINED_UNIT_STRENGTH',							'CLASS_NAVAL_MELEE'),
	('ABILITY_SEAPORT_TRAINED_UNIT_STRENGTH',							'CLASS_NAVAL_RAIDER'),
	('ABILITY_ORDU_TRAINED_UNIT_STRENGTH',								'CLASS_LIGHT_CAVALRY'),
	('ABILITY_ORDU_TRAINED_UNIT_STRENGTH',								'CLASS_HEAVY_CAVALRY'),
	('ABILITY_ORDU_TRAINED_UNIT_STRENGTH',								'CLASS_SIEGE'),
	('ABILITY_ORDU_TRAINED_UNIT_STRENGTH',								'CLASS_MONGOLIAN_KESHIG'),
	('ABILITY_MOSQUE_TRAINED_UNIT_STRENGTH',							'CLASS_RELIGIOUS_ALL'),
	('ABILITY_SCHOLASTICISM_BUFF',										'CLASS_RELIGIOUS_ALL'),
	('ABILITY_IKANDA_ANTI_CAVALRY_MOVEMENT_BONUS',				        'CLASS_ANTI_CAVALRY'),
	('ABILITY_TERRITORY_COMBAT',										'CLASS_MILITARY'),
	('ABILITY_NAVAL_RAIDER_BONUS',										'CLASS_NAVAL_RAIDER'),
	('ABILITY_ARCHAEOLOGIST_IGNORE_HILLS',								'CLASS_ARCHAEOLOGIST'),
	('ABILITY_ARCHAEOLOGIST_IGNORE_FOREST',								'CLASS_ARCHAEOLOGIST'),
	('ABILITY_KOTOKU_IN_ENLIGHTENED',									'CLASS_WARRIOR_MONK');

insert or replace into TypeTags	
	(Type,							Tag)
values
 	('ABILITY_INCA_IGNORE_HILLS',	'CLASS_LAND_UNITS'),
 	('ABILITY_KONGO_IGNORE_WOODS',	'CLASS_LAND_UNITS');

insert or replace into UnitAbilities (UnitAbilityType, Name, Description, Inactive) values
	('ABILITY_LEVY_DEBUFF_IN_ENEMY_TERRITORY',
    'LOC_ABILITY_LEVY_DEBUFF_IN_ENEMY_TERRITORY_NAME',
    'LOC_ABILITY_LEVY_DEBUFF_IN_ENEMY_TERRITORY_DESCRIPTION',
    1),
	('ABILITY_NAVAL_MELEE_ESCORT_MOBILITY_SHARED_MOVEMENT',
    'LOC_ABILITY_MONGOLIAN_KESHIG_NAME',
    'LOC_ABILITY_MONGOLIAN_KESHIG_DESCRIPTION',
    1),
	('ABILITY_SPY_AND_RECON_BONUS_SIGHT',
    'LOC_ABILITY_SPY_AND_RECON_BONUS_SIGHT_NAME',
    'LOC_ABILITY_SPY_AND_RECON_BONUS_SIGHT_DESCRIPTION',
    1),
    ('ABILITY_CIVILIAN_BONUS_SIGHT',
    'LOC_ABILITY_CIVILIAN_BONUS_SIGHT_NAME',
    'LOC_ABILITY_CIVILIAN_BONUS_SIGHT_DESCRIPTION',
    1),
    ('ABILITY_EAGLE_WARRIOR',
    'LOC_ABILITY_EAGLE_WARRIOR_NAME',
    'LOC_ABILITY_EAGLE_WARRIOR_DESCRIPTION',
    0),
	('ABILITY_HD_BATTLECRY',
	'LOC_ABILITY_HD_BATTLECRY_NAME',
 	'LOC_ABILITY_HD_BATTLECRY_DESCRIPTION',
 	0),
	('ABILITY_HD_GAIN_SCIENCE_WHEN_KILLS',
	'LOC_ABILITY_HD_GAIN_SCIENCE_WHEN_KILLS_NAME',
 	'LOC_ABILITY_HD_GAIN_SCIENCE_WHEN_KILLS_DESCRIPTION',
 	0),
	('ABILITY_HD_CAN_MOVE_AFTER_ATTACK',
	'LOC_ABILITY_HD_CAN_MOVE_AFTER_ATTACK_NAME',
 	'LOC_ABILITY_HD_CAN_MOVE_AFTER_ATTACK_DESCRIPTION',
 	0),
	('ABILITY_INCA_IGNORE_HILLS',
	'LOC_ABILITY_INCA_IGNORE_HILLS_NAME',
 	'LOC_ABILITY_INCA_IGNORE_HILLS_DESCRIPTION',
 	1),
	('ABILITY_KONGO_IGNORE_WOODS',
	'LOC_ABILITY_KONGO_IGNORE_WOODS_NAME',
 	'LOC_ABILITY_KONGO_IGNORE_WOODS_DESCRIPTION',
 	1),
	('ABILITY_AMANI_FERR_PROMOTION',
	'LOC_ABILITY_AMANI_FERR_PROMOTION_NAME',
 	'LOC_ABILITY_AMANI_FERR_PROMOTION_DESCRIPTION',
 	1),
	('ABILITY_MILLITARY_ENGINEER_IGNORE_TERRAIN',
	'LOC_ABILITY_MILLITARY_ENGINEER_IGNORE_TERRAIN_NAME',
 	'LOC_ABILITY_MILLITARY_ENGINEER_IGNORE_TERRAIN_DESCRIPTION',
 	0),
	('ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT',
	'LOC_ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT_NAME',
 	'LOC_ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT_DESCRIPTION',
 	1),	
	('ABILITY_BISHOP_EXTRA_MOVEMENT',
	'LOC_ABILITY_BISHOP_EXTRA_MOVEMENT_NAME',
 	'LOC_ABILITY_BISHOP_EXTRA_MOVEMENT_DESCRIPTION',
 	1),	
	('ABILITY_BISHOP_TRAINED_UNIT_STRENGTH',
	'LOC_ABILITY_BISHOP_TRAINED_UNIT_STRENGTH_NAME',
 	'LOC_ABILITY_BISHOP_TRAINED_UNIT_STRENGTH_DESCRIPTION',
 	1),	
	('ABILITY_BISHOP_TRAINED_UNIT_EXP',
	'LOC_ABILITY_BISHOP_TRAINED_UNIT_EXP_NAME',
 	'LOC_ABILITY_BISHOP_TRAINED_UNIT_EXP_DESCRIPTION',
 	1),
	('ABILITY_VICTOR_TRAINED_UNIT_EXP',
	'LOC_ABILITY_VICTOR_TRAINED_UNIT_EXP_NAME',
 	'LOC_ABILITY_VICTOR_TRAINED_UNIT_EXP_DESCRIPTION',
 	1),
	('ABILITY_GOV_FAITH_COMBAT_STRENGTH',
	'LOC_ABILITY_GOV_FAITH_COMBAT_STRENGTH_NAME',
 	'LOC_ABILITY_GOV_FAITH_COMBAT_STRENGTH_DESCRIPTION',
 	1),
    ('ABILITY_VICTOR_COMMANDER_STRENGTH',
    'LOC_ABILITY_VICTOR_COMMANDER_STRENGTH_NAME',
    'LOC_ABILITY_VICTOR_COMMANDER_STRENGTH_DESCRIPTION',
    1),
	('ABILITY_VICTOR_TRAINED_UNIT_STRENGTH',
	'LOC_ABILITY_VICTOR_TRAINED_UNIT_STRENGTH_NAME',
	'LOC_ABILITY_VICTOR_TRAINED_UNIT_STRENGTH_DESCRIPTION',
	1),
	('ABILITY_GOV_MILITARY_MOVEMENT',
	'LOC_ABILITY_GOV_MILITARY_MOVEMENT_NAME',
	'LOC_ABILITY_GOV_MILITARY_MOVEMENT_DESCRIPTION',
	1),
	('ABILITY_GOV_MILITARY_COMBAT_STRENGTH',
	'LOC_ABILITY_GOV_MILITARY_COMBAT_STRENGTH_NAME',
	'LOC_ABILITY_GOV_MILITARY_COMBAT_STRENGTH_DESCRIPTION',
	1),
	('ABILITY_KOTOKU_IN_TRAINED_FREE_PROMOTION',
	'LOC_ABILITY_KOTOKU_IN_TRAINED_FREE_PROMOTION_NAME',
	'LOC_ABILITY_KOTOKU_IN_TRAINED_FREE_PROMOTION_DESCRIPTION',
	1),
	('ABILITY_TRAINED_LIGHT_CAVALRY_EXTRA_PILLAGE_YIELD',
	'LOC_ABILITY_TRAINED_LIGHT_CAVALRY_EXTRA_PILLAGE_YIELD_NAME',
	'LOC_ABILITY_TRAINED_LIGHT_CAVALRY_EXTRA_PILLAGE_YIELD_DESCRIPTION',
	1),
	('ABILITY_TRAINED_LIGHT_CAVALRY_PILLAGE_LESS_MOVEMENT',
	'LOC_ABILITY_TRAINED_LIGHT_CAVALRY_PILLAGE_LESS_MOVEMENT_NAME',
	'LOC_ABILITY_TRAINED_LIGHT_CAVALRY_PILLAGE_LESS_MOVEMENT_DESCRIPTION',
	1),
	('ABILITY_LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT',
	'LOC_ABILITY_LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT_NAME',
	'LOC_ABILITY_LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT_DESCRIPTION',
	0),
	('ABILITY_HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT',
	'LOC_ABILITY_HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT_NAME',
	'LOC_ABILITY_HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT_DESCRIPTION',
	0),
	('ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH',
	'LOC_ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH_NAME',
	'LOC_ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH_DESCRIPTION',
	1),
	('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',
	'LOC_ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH_NAME',
	'LOC_ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH_DESCRIPTION',
	1),
	('ABILITY_STABLE_TRAINED_UNIT_STRENGTH',
	'LOC_ABILITY_STABLE_TRAINED_UNIT_STRENGTH_NAME',
	'LOC_ABILITY_STABLE_TRAINED_UNIT_STRENGTH_DESCRIPTION',
	1),
	('ABILITY_ORDU_TRAINED_UNIT_STRENGTH',
	'LOC_ABILITY_ORDU_TRAINED_UNIT_STRENGTH_NAME',
	'LOC_ABILITY_ORDU_TRAINED_UNIT_STRENGTH_DESCRIPTION',
	1),
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',
	'LOC_ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH_NAME',
	'LOC_ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH_DESCRIPTION',
	1),
	('ABILITY_SEAPORT_TRAINED_UNIT_STRENGTH',
	'LOC_ABILITY_SEAPORT_TRAINED_UNIT_STRENGTH_NAME',
	'LOC_ABILITY_SEAPORT_TRAINED_UNIT_STRENGTH_DESCRIPTION',
	1),
	('ABILITY_MOSQUE_TRAINED_UNIT_STRENGTH',
	'LOC_ABILITY_MOSQUE_TRAINED_UNIT_STRENGTH_NAME',
	'LOC_ABILITY_MOSQUE_TRAINED_UNIT_STRENGTH_DESCRIPTION',
	1),
	('ABILITY_SCHOLASTICISM_BUFF',
	'LOC_ABILITY_SCHOLASTICISM_BUFF_NAME',
	'LOC_ABILITY_SCHOLASTICISM_BUFF_DESCRIPTION',
	1),
	('ABILITY_IKANDA_ANTI_CAVALRY_MOVEMENT_BONUS',
	'LOC_ABILITY_IKANDA_ANTI_CAVALRY_MOVEMENT_BONUS_NAME',
	'LOC_ABILITY_IKANDA_ANTI_CAVALRY_MOVEMENT_BONUS_DESCRIPTION',
	1),
	('ABILITY_TERRITORY_COMBAT',
	'LOC_ABILITY_TERRITORY_COMBAT_HD_NAME',
	'LOC_ABILITY_TERRITORY_COMBAT_HD_DESCRIPTION',
	1),
	('ABILITY_NAVAL_RAIDER_BONUS',
	'LOC_ABILITY_NAVAL_RAIDER_BONUS_HD_NAME',
	'LOC_ABILITY_NAVAL_RAIDER_BONUS_HD_DESCRIPTION',
	1),
	('ABILITY_ARCHAEOLOGIST_IGNORE_HILLS',
	'LOC_ABILITY_ARCHAEOLOGIST_IGNORE_HILLS_HD_NAME',
	'LOC_ABILITY_ARCHAEOLOGIST_IGNORE_HILLS_HD_DESCRIPTION',
	1),
	('ABILITY_ARCHAEOLOGIST_IGNORE_FOREST',
	'LOC_ABILITY_ARCHAEOLOGIST_IGNORE_FOREST_HD_NAME',
	'LOC_ABILITY_ARCHAEOLOGIST_IGNORE_FOREST_HD_DESCRIPTION',
	1),
	('ABILITY_KOTOKU_IN_ENLIGHTENED',
	'LOC_ABILITY_KOTOKU_IN_ENLIGHTENED_HD_NAME',
	'LOC_ABILITY_KOTOKU_IN_ENLIGHTENED_HD_DESCRIPTION',
	1);

-- Support Persia DLC
insert or ignore into Modifiers
	(ModifierId,				ModifierType)
values
	('HETAIROI_FREE_PROMOTION',	'MODIFIER_PLAYER_UNIT_ADJUST_GRANT_EXPERIENCE');

insert or ignore into ModifierArguments
	(ModifierId,				Name,		Value)
values
	('HETAIROI_FREE_PROMOTION',	'Amount',	-1);

insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
	('ABILITY_NAVAL_MELEE_ESCORT_MOBILITY_SHARED_MOVEMENT',	'ESCORT_MOBILITY_SHARED_MOVEMENT'),
	('ABILITY_SPY_AND_RECON_BONUS_SIGHT',					'CATHERINE_BONUS_SIGHT_SPY_AND_RECON'),
	('ABILITY_CIVILIAN_BONUS_SIGHT',						'CATHERINE_BONUS_SIGHT_CIVILIAN'),
	('ABILITY_HD_CAN_MOVE_AFTER_ATTACK',					'COSSACK_MOVE_AND_ATTACK'),
	('ABILITY_INCA_IGNORE_HILLS',							'INCA_IGNORE_HILLS'),
	('ABILITY_KONGO_IGNORE_WOODS',							'KONGO_IGNORE_WOODS'),
	('ABILITY_AMANI_FERR_PROMOTION',						'HETAIROI_FREE_PROMOTION'),
	('ABILITY_BYPASS_WALLS_PROMOTION_CLASS',				'BYPASS_WALLS_WARRIOR_MONK'),
	('ABILITY_ENABLE_WALL_ATTACK_PROMOTION_CLASS',			'ENABLE_WALL_ATTACK_WARRIOR_MONK'),
	('ABILITY_MILLITARY_ENGINEER_IGNORE_TERRAIN',			'MOD_IGNORE_TERRAIN_COST'),
	('ABILITY_MILLITARY_ENGINEER_IGNORE_TERRAIN',			'MOD_IGNORE_CROSSING_RIVERS_COST'),
	('ABILITY_GUILDMASTER_TRAINED_BUILDER_MOVEMENT',		'LIANG_EXTRA_MOVEMENT'),
	('ABILITY_BISHOP_EXTRA_MOVEMENT',						'BISHOP_EXTRA_MOVEMENT'),
	('ABILITY_BISHOP_TRAINED_UNIT_STRENGTH',				'BISHOP_TRAINED_UNIT_STRENGTH'),
	('ABILITY_BISHOP_TRAINED_UNIT_EXP',						'BISHOP_TRAINED_UNIT_EXP'),
	('ABILITY_VICTOR_TRAINED_UNIT_EXP',						'VICTOR_TRAINED_UNIT_EXP'),
	('ABILITY_GOV_FAITH_COMBAT_STRENGTH',					'ABILITY_GOV_FAITH_COMBAT_STRENGTH_MODIFIER'),
    ('ABILITY_VICTOR_COMMANDER_STRENGTH',                   'VICTOR_COMMANDER_STRENGTH_BUFF'),
	('ABILITY_VICTOR_TRAINED_UNIT_STRENGTH',				'VICTOR_TRAINED_UNIT_STRENGTH'),
	('ABILITY_GOV_MILITARY_MOVEMENT',						'ABILITY_GOV_MILITARY_MOVEMENT_MODIFIER'),
	('ABILITY_GOV_MILITARY_COMBAT_STRENGTH',				'ABILITY_GOV_MILITARY_COMBAT_STRENGTH_MODIFIER'),
	('ABILITY_KOTOKU_IN_TRAINED_FREE_PROMOTION',			'HETAIROI_FREE_PROMOTION'),
	('ABILITY_TRAINED_LIGHT_CAVALRY_EXTRA_PILLAGE_YIELD',	'RAID_DOUBLEPILLAGEIMPROVE'),
	('ABILITY_TRAINED_LIGHT_CAVALRY_PILLAGE_LESS_MOVEMENT',	'MALON_RAIDER_LESS_MOVEMENT_PILLAGE'),
	('ABILITY_LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT',		'LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT'),
	('ABILITY_HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT',		'HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT'),
	('ABILITY_BARRACKS_TRAINED_UNIT_STRENGTH',				'BARRACKS_TRAINED_UNIT_STRENGTH'),
	('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',				'BASILIKOI_TRAINED_UNIT_STRENGTH'),
	('ABILITY_STABLE_TRAINED_UNIT_STRENGTH',				'STABLE_TRAINED_UNIT_STRENGTH'),
	('ABILITY_ORDU_TRAINED_UNIT_STRENGTH',					'ORDU_TRAINED_UNIT_STRENGTH'),
	('ABILITY_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',		'MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH'),
	('ABILITY_SEAPORT_TRAINED_UNIT_STRENGTH',				'SEAPORT_TRAINED_UNIT_STRENGTH'),
	('ABILITY_MOSQUE_TRAINED_UNIT_STRENGTH',				'MOSQUE_TRAINED_UNIT_STRENGTH'),
	('ABILITY_SCHOLASTICISM_BUFF',							'SCHOLASTICISM_COMBAT_STRENGTH_BUFF'),
	('ABILITY_IKANDA_ANTI_CAVALRY_MOVEMENT_BONUS',          'ORDU_ADJUST_MOVEMENT'),
	('ABILITY_TERRITORY_COMBAT',							'SCOTLAND_FRIENDLY_COMBAT'),
	('ABILITY_NAVAL_RAIDER_BONUS',							'FRANCIS_DRAKE_NAVAL_RAIDER_BONUS'),
	('ABILITY_ARCHAEOLOGIST_IGNORE_HILLS',					'TERRACOTTA_ARMY_IGNORE_HILLS'),
	('ABILITY_ARCHAEOLOGIST_IGNORE_FOREST',					'TERRACOTTA_ARMY_IGNORE_FOREST'),
	('ABILITY_KOTOKU_IN_ENLIGHTENED',						'KOTOKU_IN_CITY_CULTURE'),
	('ABILITY_KOTOKU_IN_ENLIGHTENED',						'KOTOKU_IN_CITY_FAITH'),
	('ABILITY_KOTOKU_IN_ENLIGHTENED',						'HETAIROI_FREE_PROMOTION');

insert or replace into Modifiers
	(ModifierId,										ModifierType,											SubjectRequirementSetId)
values
	('LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT',			'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',					'ATTACKING_DISTRICTS_REQUIREMENTS'),
	('HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT',			'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',					'ATTACKING_DISTRICTS_REQUIREMENTS');
insert or replace into Modifiers
	(ModifierId,					ModifierType,											OwnerRequirementSetId,					SubjectRequirementSetId,	SubjectStackLimit)
values
	('KOTOKU_IN_CITY_CULTURE',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'PLAYER_IS_AT_PEACE_WITH_ALL_MAJORS',	'HD_OBJECT_WITHIN_0_TILES',	1),
	('KOTOKU_IN_CITY_FAITH',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'PLAYER_IS_AT_WAR_WITH_ANY_MAJOR',		'HD_OBJECT_WITHIN_0_TILES',	1);

insert or replace into Modifiers
	(ModifierId,									ModifierType,							Permanent)
values
	('CATHERINE_BONUS_SIGHT_SPY_AND_RECON',			'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT',	1),
	('CATHERINE_BONUS_SIGHT_CIVILIAN',				'MODIFIER_PLAYER_UNIT_ADJUST_SIGHT',	1),
	('INCA_IGNORE_HILLS',							'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST',	1),
	('KONGO_IGNORE_WOODS',							'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST',	1),
	('BYPASS_WALLS_WARRIOR_MONK',					'MODIFIER_PLAYER_UNIT_ADJUST_BYPASS_WALLS_PROMOTION_CLASS',1),
	('ENABLE_WALL_ATTACK_WARRIOR_MONK',				'MODIFIER_PLAYER_UNIT_ADJUST_ENABLE_WALL_ATTACK_PROMOTION_CLASS',1),
	('LIANG_EXTRA_MOVEMENT',						'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',		1),
	('BISHOP_EXTRA_MOVEMENT',						'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',		1),
	('BISHOP_TRAINED_UNIT_STRENGTH',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('BISHOP_TRAINED_UNIT_EXP',						'MODIFIER_PLAYER_UNIT_ADJUST_UNIT_EXPERIENCE_MODIFIER',1),
	('VICTOR_TRAINED_UNIT_EXP',						'MODIFIER_PLAYER_UNIT_ADJUST_UNIT_EXPERIENCE_MODIFIER',1),
	('ABILITY_GOV_FAITH_COMBAT_STRENGTH_MODIFIER',	'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
    ('VICTOR_COMMANDER_STRENGTH_BUFF',              'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     0),
	('VICTOR_TRAINED_UNIT_STRENGTH',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('ABILITY_GOV_MILITARY_MOVEMENT_MODIFIER',	     'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT',	1),
	('ABILITY_GOV_MILITARY_COMBAT_STRENGTH_MODIFIER','MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',	1),
	('BARRACKS_TRAINED_UNIT_STRENGTH',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('BASILIKOI_TRAINED_UNIT_STRENGTH',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('STABLE_TRAINED_UNIT_STRENGTH',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('ORDU_TRAINED_UNIT_STRENGTH',					'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('MOSQUE_TRAINED_UNIT_STRENGTH',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('SEAPORT_TRAINED_UNIT_STRENGTH',				'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('SCHOLASTICISM_COMBAT_STRENGTH_BUFF',			'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('FRANCIS_DRAKE_NAVAL_RAIDER_BONUS',			'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		1),
	('TERRACOTTA_ARMY_IGNORE_HILLS',				'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST',	1),
	('TERRACOTTA_ARMY_IGNORE_FOREST',				'MODIFIER_PLAYER_UNIT_ADJUST_IGNORE_TERRAIN_COST',	1);

insert or replace into ModifierArguments
	(ModifierId,									Name,		Value)
values
	('CATHERINE_BONUS_SIGHT_SPY_AND_RECON',			'Amount',	2),
	('CATHERINE_BONUS_SIGHT_CIVILIAN',				'Amount',	1),
	('INCA_IGNORE_HILLS',							'Ignore',	1),
	('INCA_IGNORE_HILLS',							'Type',		'HILLS'),
	('KONGO_IGNORE_WOODS',							'Ignore',	1),
	('KONGO_IGNORE_WOODS',							'Type',		'FOREST'),
	('BYPASS_WALLS_WARRIOR_MONK',					'PromotionClass','PROMOTION_CLASS_MONK'),
	('ENABLE_WALL_ATTACK_WARRIOR_MONK',				'PromotionClass','PROMOTION_CLASS_MONK'),
	('LIANG_EXTRA_MOVEMENT',						'Amount',	1),
	('ABILITY_GOV_MILITARY_MOVEMENT_MODIFIER',		'Amount',	1),
	('BISHOP_EXTRA_MOVEMENT',						'Amount',	1),
	('BISHOP_TRAINED_UNIT_STRENGTH',				'Amount',	5),
	('BISHOP_TRAINED_UNIT_EXP',						'Amount',	100),
	('VICTOR_TRAINED_UNIT_EXP',						'Amount',	25),
	('ABILITY_GOV_FAITH_COMBAT_STRENGTH_MODIFIER',	'Amount',	5),
    ('VICTOR_COMMANDER_STRENGTH_BUFF',              'Amount',   5),
	('VICTOR_TRAINED_UNIT_STRENGTH',				'Amount',	2),
	('LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT',		'Amount',	-3),
	('HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT',		'Amount',	-3),
	('BARRACKS_TRAINED_UNIT_STRENGTH',				'Amount',	2),
	('BASILIKOI_TRAINED_UNIT_STRENGTH',				'Amount',	3),
	('STABLE_TRAINED_UNIT_STRENGTH',				'Amount',	2),
	('ORDU_TRAINED_UNIT_STRENGTH',					'Amount',	3),
	('MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',		'Amount',	3),
	('SEAPORT_TRAINED_UNIT_STRENGTH',				'Amount',	3),
	('MOSQUE_TRAINED_UNIT_STRENGTH',				'Amount',	3),
	('SCHOLASTICISM_COMBAT_STRENGTH_BUFF',			'Amount',	7),
	('FRANCIS_DRAKE_NAVAL_RAIDER_BONUS',			'Amount',	2),
	('TERRACOTTA_ARMY_IGNORE_HILLS',				'Ignore',	1),	
	('TERRACOTTA_ARMY_IGNORE_HILLS',				'Type',		'HILLS'),
	('TERRACOTTA_ARMY_IGNORE_FOREST',				'Ignore',	1),	
	('TERRACOTTA_ARMY_IGNORE_FOREST',				'Type',		'FOREST'),	
	('KOTOKU_IN_CITY_CULTURE',						'YieldType','YIELD_CULTURE'),
	('KOTOKU_IN_CITY_CULTURE',						'Amount',	'10'),
	('KOTOKU_IN_CITY_FAITH',						'YieldType','YIELD_FAITH'),
	('KOTOKU_IN_CITY_FAITH',						'Amount',	'10');

insert or replace into ModifierStrings
	(ModifierId,										Context,	Text)
values
	-- ('INCA_IGNORE_HILLS',								'Preview',	'{LOC_ABILITY_INCA_IGNORE_HILLS_DESCRIPTION} {LOC_ABILITY_DESCRIPTOR_PREVIEW_TEXT}'),
	('BISHOP_TRAINED_UNIT_STRENGTH',					'Preview',	'+{1_Amount} {LOC_BISHOP_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
	('BISHOP_TRAINED_UNIT_EXP',							'Preview',	'+{1_Amount} {LOC_BISHOP_TRAINED_UNIT_EXP_PREVIEW_TEXT}'),
	('VICTOR_TRAINED_UNIT_EXP',							'Preview',	'+{1_Amount} {LOC_VICTOR_TRAINED_UNIT_EXP_PREVIEW_TEXT}'),
	('ABILITY_GOV_FAITH_COMBAT_STRENGTH_MODIFIER',		'Preview',	'+{1_Amount} {LOC_ABILITY_GOV_FAITH_COMBAT_STRENGTH_MODIFIER_PREVIEW_TEXT}'),
	('VICTOR_COMMANDER_STRENGTH_BUFF',                  'Preview',  '+{1_Amount} {LOC_VICTOR_COMMANDER_STRENGTH_BUFF_PREVIEW_TEXT}'),
    ('VICTOR_TRAINED_UNIT_STRENGTH',					'Preview',	'+{1_Amount} {LOC_VICTOR_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
	('ABILITY_GOV_MILITARY_COMBAT_STRENGTH_MODIFIER',	'Preview',	'+{1_Amount} {LOC_ABILITY_GOV_MILITARY_COMBAT_STRENGTH_MODIFIER_PREVIEW_TEXT}'),
	('ABILITY_GOV_MILITARY_MOVEMENT_MODIFIER',			'Preview',	'+{1_Amount} {LOC_ABILITY_GOV_MILITARY_MOVEMENT_MODIFIER_PREVIEW_TEXT}'),
	('LIGHT_CAVALRY_WEAKER_ATTACKING_DISTRICT',			'Preview',	'{1_Amount} {LOC_CAVALRY_WEAKER_ATTACKING_DISTRICT_PREVIEW_TEXT}'),
	('HEAVY_CAVALRY_WEAKER_ATTACKING_DISTRICT',			'Preview',	'{1_Amount} {LOC_CAVALRY_WEAKER_ATTACKING_DISTRICT_PREVIEW_TEXT}'),
	('BARRACKS_TRAINED_UNIT_STRENGTH',					'Preview',	'+{1_Amount} {LOC_BARRACKS_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
	('BASILIKOI_TRAINED_UNIT_STRENGTH',					'Preview',	'+{1_Amount} {LOC_BASILIKOI_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
	('STABLE_TRAINED_UNIT_STRENGTH',					'Preview',	'+{1_Amount} {LOC_STABLE_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
	('ORDU_TRAINED_UNIT_STRENGTH',						'Preview',	'+{1_Amount} {LOC_ORDU_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
	('MOSQUE_TRAINED_UNIT_STRENGTH',					'Preview',	'+{1_Amount} {LOC_MOSQUE_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
	('SEAPORT_TRAINED_UNIT_STRENGTH',					'Preview',	'+{1_Amount} {LOC_SEAPORT_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
	('MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH',			'Preview',	'+{1_Amount} {LOC_MILITARY_ACADEMY_TRAINED_UNIT_STRENGTH_PREVIEW_TEXT}'),
	('SCHOLASTICISM_COMBAT_STRENGTH_BUFF',				'Preview',	'+{1_Amount} {LOC_SCHOLASTICISM_COMBAT_STRENGTH_BUFF_PREVIEW_TEXT}'),
	('FRANCIS_DRAKE_NAVAL_RAIDER_BONUS',				'Preview',	'+{1_Amount} {LOC_GREAT_PERSON_INDIVIDUAL_FRANCIS_DRAKE_NAME}');

-- <Row ModifierId="TOQUI_COMBAT_BUFF_VS_GOLDEN_AGE" Context="Preview" Text="LOC_ABILITY_TOQUI_COMBAT_BUFF_VS_GOLDEN_AGE_DESCRIPTION"/>

-- UnitAbilities for Unique Units
delete from UnitAbilityModifiers where UnitAbilityType = 'ABILITY_NAGAO' and ModifierId = 'NAGAO_FOREST_MOVEMENT';
insert or replace into UnitAbilityModifiers
	(UnitAbilityType,									ModifierId)
values
	('ABILITY_HD_BATTLECRY',							'HD_BATTLECRY_BONUS'),
	('ABILITY_HD_GAIN_SCIENCE_WHEN_KILLS',				'GAIN_SCIENCE_WHEN_KILLS'),
	('ABILITY_NAGAO',									'HD_FOREST_AND_JUNGLE_COMBAT_BONUS');

insert or replace into Modifiers
	(ModifierId,									ModifierType,								SubjectRequirementSetId)
values
	('HD_BATTLECRY_BONUS',							'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',		'BATTLECRY_REQUIREMENTS'),
	('GAIN_SCIENCE_WHEN_KILLS',						'MODIFIER_UNIT_ADJUST_POST_COMBAT_YIELD',	NULL);

insert or replace into ModifierArguments
	(ModifierId,									Name,						Value)
values
	('HD_BATTLECRY_BONUS',							'Amount',					7),
	('GAIN_SCIENCE_WHEN_KILLS',						'YieldType',				'YIELD_SCIENCE'),
	('GAIN_SCIENCE_WHEN_KILLS',						'PercentDefeatedStrength',	50);

insert or replace into ModifierStrings
	(ModifierId,										Context,	Text)
values
	('HD_BATTLECRY_BONUS',								'Preview',	'+{1_Amount} {LOC_HD_BATTLECRY_BONUS_PREVIEW_TEXT}');

-- Bug Fix
-- update ModifierArguments set Value = 1000 where ModifierId = 'HETAIROI_FREE_PROMOTION' and Name = 'Amount';
-- update ModifierArguments set Value = 1000 where ModifierId = 'CORBACI_FREE_PROMOTION' and Name = 'Amount';
-- update ModifierArguments set Value = 1000 where ModifierId = 'NAU_FREE_PROMOTION' and Name = 'Amount';