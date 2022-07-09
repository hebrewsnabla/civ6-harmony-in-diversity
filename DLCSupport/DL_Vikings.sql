-------------------------------------
--            Vikings DLC          --
-------------------------------------

-- Natural Wonders
insert or replace into Feature_AdjacentYields (FeatureType, YieldType, YieldChange) values
    -- ('FEATURE_TSINGY', 'YIELD_GOLD', 1),
    ('FEATURE_LYSEFJORDEN', 'YIELD_PRODUCTION', 1);

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                          RequirementId)
values
    ('GODDESS_OF_FIRE_CITY_HAS_VOLCANO',                        'REQUIRES_CITY_HAS_FEATURE_EYJAFJALLAJOKULL');

-- Modifiers in this table are attached to suzerain
create temporary table if not exists TraitAttachedModifiers (
    TraitType text not null,
    ModifierId text not null,
    primary key (TraitType, ModifierId)
);

--------------------------------------------------------------------------------------------------------------
-- Monastery (Armagh)
update Improvements set OnePerCity = 1 where ImprovementType = 'IMPROVEMENT_MONASTERY';
update Adjacency_YieldChanges set TilesRequired = 1, YieldChange = 2, ObsoleteCivic = 'CIVIC_REFORMED_CHURCH' where ID = 'Monastery_DistrictAdjacency';
insert or replace into Improvement_Adjacencies
    (ImprovementType,               YieldChangeId)
values 
    ('IMPROVEMENT_MONASTERY',       'Monastery_DistrictAdjacency_Divine_Right_Late');
insert or replace into Adjacency_YieldChanges
    (ID,												Description,	YieldType,		YieldChange,	OtherDistrictAdjacent,	PrereqCivic)  
values 
    ('Monastery_DistrictAdjacency_Divine_Right_Late',	'Placeholder',	'YIELD_FAITH',	3,				1,						'CIVIC_DIVINE_RIGHT');

--auckland
-- delete from TraitModifiers where ModifierId = 'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_BASE';
-- delete from TraitModifiers where ModifierId = 'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL';
-- delete from TraitModifiers where ModifierId = 'MINOR_CIV_AUCKLAND_SHALLOW_WATER_PRODUCTION_BONUS_BASE';
-- delete from TraitModifiers where ModifierId = 'MINOR_CIV_AUCKLAND_SHALLOW_WATER_PRODUCTION_BONUS_INDUSTRIAL';

--insert or replace into TraitModifiers
--	(TraitType,		ModifierId)
--values
	-- ('MINOR_CIV_AUCKLAND_TRAIT', 	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_HARBOR'),
--	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_LIGHTHOUSE'),
--	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SHIPYARD'),
--	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SEAPORT'),
--	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL2'),
--	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_BASE2');

--insert or replace into Modifiers
--	(ModifierId,													ModifierType,							--				SubjectRequirementSetId)
--values
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_HARBOR',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_LIGHTHOUSE',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SHIPYARD',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SEAPORT',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL2',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_BASE2',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
--	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_BASE',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
--	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_INDUSTRIAL',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'PLOT_HAS_FISHINGBOATS_AND_INDUSTRIAL_REQUIREMENTS'),
--	('MINOR_CIV_AUCKLAND_BONUS_LIGHTHOUSE',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'BUILDING_IS_LIGHTHOUSE'),
--	('MINOR_CIV_AUCKLAND_BONUS_SHIPYARD',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'BUILDING_IS_SHIPYARD'),
--	('MINOR_CIV_AUCKLAND_BONUS_SEAPORT',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'BUILDING_IS_SEAPORT'),
--	('MINOR_CIV_AUCKLAND_BONUS_HARBOR',								'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',		'DISTRICT_IS_HARBOR');

--insert or replace into ModifierArguments
--	(ModifierId,		Name,  		Value)
--values
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_HARBOR',			'ModifierId',		'MINOR_CIV_AUCKLAND_BONUS_HARBOR'),	
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_LIGHTHOUSE',		'ModifierId',		'MINOR_CIV_AUCKLAND_BONUS_LIGHTHOUSE'),
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SHIPYARD',			'ModifierId',		'MINOR_CIV_AUCKLAND_BONUS_SHIPYARD'),
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SEAPORT',			'ModifierId',		'MINOR_CIV_AUCKLAND_BONUS_SEAPORT'),
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL2',		'ModifierId',		'MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_INDUSTRIAL'),
--	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_BASE2',				'ModifierId',		'MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_BASE'),
--	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_BASE',					'YieldType',		'YIELD_PRODUCTION'),
--	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_BASE',					'Amount',			1),
--	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_INDUSTRIAL',				'YieldType',		'YIELD_PRODUCTION'),
--	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_INDUSTRIAL',				'Amount',			1),
--	('MINOR_CIV_AUCKLAND_BONUS_LIGHTHOUSE',							'YieldType',		'YIELD_PRODUCTION'),										
--	('MINOR_CIV_AUCKLAND_BONUS_LIGHTHOUSE',							'Amount',			2),
--	('MINOR_CIV_AUCKLAND_BONUS_SHIPYARD',							'YieldType',		'YIELD_PRODUCTION'),
--	('MINOR_CIV_AUCKLAND_BONUS_SHIPYARD',							'Amount',			2),
--	('MINOR_CIV_AUCKLAND_BONUS_SEAPORT',							'YieldType',		'YIELD_PRODUCTION'),
--	('MINOR_CIV_AUCKLAND_BONUS_SEAPORT',							'Amount',			2),
--	('MINOR_CIV_AUCKLAND_BONUS_HARBOR',								'YieldType',		'YIELD_PRODUCTION'),
--	('MINOR_CIV_AUCKLAND_BONUS_HARBOR',								'Amount',			2);

--insert or ignore into RequirementSetRequirements(RequirementSetId,RequirementId)values
--	('PLOT_HAS_FISHINGBOATS_AND_INDUSTRIAL_REQUIREMENTS','REQUIRES_PLOT_HAS_FISHINGBOATS'),
--	('PLOT_HAS_FISHINGBOATS_AND_INDUSTRIAL_REQUIREMENTS','REQUIRES_PLAYER_IS_INDUSTRIAL_ERA');

--insert or ignore into RequirementSets(RequirementSetId,RequirementSetType)values
--	('PLOT_HAS_FISHINGBOATS_AND_INDUSTRIAL_REQUIREMENTS','REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSets
    (RequirementSetId,                                      RequirementSetType)
values
	('PLOT_HAS_SHALLOW_WATER_AND_STEAM_POWER_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');
insert or ignore into RequirementSetRequirements
	(RequirementSetId,										RequirementId)
values
	('PLOT_HAS_SHALLOW_WATER_AND_STEAM_POWER_REQUIREMENTS',	'REQUIRES_PLOT_HAS_SHALLOW_WATER'),
	('PLOT_HAS_SHALLOW_WATER_AND_STEAM_POWER_REQUIREMENTS',	'HD_REQUIRES_PLAYER_HAS_TECH_STEAM_POWER');
update Modifiers set SubjectRequirementSetId = 'PLOT_HAS_SHALLOW_WATER_AND_STEAM_POWER_REQUIREMENTS' where ModifierId = 'MINOR_CIV_AUCKLAND_SHALLOW_WATER_PRODUCTION_BONUS_INDUSTRIAL';

-- Muscat
delete from TraitModifiers where TraitType = 'MINOR_CIV_MUSCAT_TRAIT';
insert or replace into TraitAttachedModifiers
    (TraitType,                 ModifierId)
values
    ('MINOR_CIV_MUSCAT_TRAIT',  'MINOR_CIV_MUSCAT_MINE_COMMERCIAL_HUB_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_TRAIT',  'MINOR_CIV_MUSCAT_QUARRY_COMMERCIAL_HUB_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_TRAIT',  'MINOR_CIV_MUSCAT_REEF_COMMERCIAL_HUB_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_TRAIT',  'MINOR_CIV_MUSCAT_MINE_HARBOR_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_TRAIT',  'MINOR_CIV_MUSCAT_QUARRY_HARBOR_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_TRAIT',  'MINOR_CIV_MUSCAT_REEF_HARBOR_ADJACENCY');
insert or replace into Modifiers
    (ModifierId,                                            ModifierType)
values
    ('MINOR_CIV_MUSCAT_MINE_COMMERCIAL_HUB_ADJACENCY',      'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_QUARRY_COMMERCIAL_HUB_ADJACENCY',    'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_REEF_COMMERCIAL_HUB_ADJACENCY',      'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_MINE_HARBOR_ADJACENCY',              'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_QUARRY_HARBOR_ADJACENCY',            'MODIFIER_PLAYER_CITIES_IMPROVEMENT_ADJACENCY'),
    ('MINOR_CIV_MUSCAT_REEF_HARBOR_ADJACENCY',              'MODIFIER_PLAYER_CITIES_FEATURE_ADJACENCY');
insert or replace into ModifierArguments
    (ModifierId,                                            Name,                   Value)
values
	('MINOR_CIV_MUSCAT_MINE_COMMERCIAL_HUB_ADJACENCY',	    'DistrictType',			'DISTRICT_COMMERCIAL_HUB'),
	('MINOR_CIV_MUSCAT_MINE_COMMERCIAL_HUB_ADJACENCY',	    'ImprovementType',	    'IMPROVEMENT_MINE'),
	('MINOR_CIV_MUSCAT_MINE_COMMERCIAL_HUB_ADJACENCY',	    'YieldType',			'YIELD_GOLD'),
	('MINOR_CIV_MUSCAT_MINE_COMMERCIAL_HUB_ADJACENCY',	    'Description',			'LOC_MINOR_CIV_MUSCAT_MINE_DESCRIPTION'),
	('MINOR_CIV_MUSCAT_MINE_COMMERCIAL_HUB_ADJACENCY',	    'Amount',				1),
	('MINOR_CIV_MUSCAT_QUARRY_COMMERCIAL_HUB_ADJACENCY',	'DistrictType',			'DISTRICT_COMMERCIAL_HUB'),
	('MINOR_CIV_MUSCAT_QUARRY_COMMERCIAL_HUB_ADJACENCY',	'ImprovementType',	    'IMPROVEMENT_QUARRY'),
	('MINOR_CIV_MUSCAT_QUARRY_COMMERCIAL_HUB_ADJACENCY',	'YieldType',			'YIELD_GOLD'),
	('MINOR_CIV_MUSCAT_QUARRY_COMMERCIAL_HUB_ADJACENCY',	'Description',			'LOC_MINOR_CIV_MUSCAT_QUARRY_DESCRIPTION'),
	('MINOR_CIV_MUSCAT_QUARRY_COMMERCIAL_HUB_ADJACENCY',	'Amount',				1),
	('MINOR_CIV_MUSCAT_REEF_COMMERCIAL_HUB_ADJACENCY',	    'DistrictType',			'DISTRICT_COMMERCIAL_HUB'),
	('MINOR_CIV_MUSCAT_REEF_COMMERCIAL_HUB_ADJACENCY',	    'FeatureType',	        'FEATURE_REEF'),
	('MINOR_CIV_MUSCAT_REEF_COMMERCIAL_HUB_ADJACENCY',	    'YieldType',			'YIELD_GOLD'),
	('MINOR_CIV_MUSCAT_REEF_COMMERCIAL_HUB_ADJACENCY',	    'Description',			'LOC_MINOR_CIV_MUSCAT_REEF_DESCRIPTION'),
	('MINOR_CIV_MUSCAT_REEF_COMMERCIAL_HUB_ADJACENCY',	    'Amount',				1),
	('MINOR_CIV_MUSCAT_MINE_HARBOR_ADJACENCY',	            'DistrictType',			'DISTRICT_HARBOR'),
	('MINOR_CIV_MUSCAT_MINE_HARBOR_ADJACENCY',	            'ImprovementType',	    'IMPROVEMENT_MINE'),
	('MINOR_CIV_MUSCAT_MINE_HARBOR_ADJACENCY',	            'YieldType',			'YIELD_GOLD'),
	('MINOR_CIV_MUSCAT_MINE_HARBOR_ADJACENCY',	            'Description',			'LOC_MINOR_CIV_MUSCAT_MINE_DESCRIPTION'),
	('MINOR_CIV_MUSCAT_MINE_HARBOR_ADJACENCY',	            'Amount',				1),
	('MINOR_CIV_MUSCAT_QUARRY_HARBOR_ADJACENCY',	        'DistrictType',			'DISTRICT_HARBOR'),
	('MINOR_CIV_MUSCAT_QUARRY_HARBOR_ADJACENCY',	        'ImprovementType',	    'IMPROVEMENT_QUARRY'),
	('MINOR_CIV_MUSCAT_QUARRY_HARBOR_ADJACENCY',	        'YieldType',			'YIELD_GOLD'),
	('MINOR_CIV_MUSCAT_QUARRY_HARBOR_ADJACENCY',	        'Description',			'LOC_MINOR_CIV_MUSCAT_QUARRY_DESCRIPTION'),
	('MINOR_CIV_MUSCAT_QUARRY_HARBOR_ADJACENCY',	        'Amount',				1),
	('MINOR_CIV_MUSCAT_REEF_HARBOR_ADJACENCY',	            'DistrictType',			'DISTRICT_HARBOR'),
	('MINOR_CIV_MUSCAT_REEF_HARBOR_ADJACENCY',	            'FeatureType',	        'FEATURE_REEF'),
	('MINOR_CIV_MUSCAT_REEF_HARBOR_ADJACENCY',	            'YieldType',			'YIELD_GOLD'),
	('MINOR_CIV_MUSCAT_REEF_HARBOR_ADJACENCY',	            'Description',			'LOC_MINOR_CIV_MUSCAT_REEF_DESCRIPTION'),
	('MINOR_CIV_MUSCAT_REEF_HARBOR_ADJACENCY',	            'Amount',				1);
-- delete from TraitModifiers where TraitType = 'MINOR_CIV_MUSCAT_TRAIT' and ModifierId = 'MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS';
--insert into TraitModifiers 
--    (TraitType,                                  ModifierId)
--values
--    ('MINOR_CIV_MUSCAT_TRAIT',                   'MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1');
    -- ('MINOR_CIV_MUSCAT_TRAIT',                   'MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS2');

--insert into Modifiers
--    (ModifierId,                                        ModifierType,                                                       SubjectRequirementSetId)
--values
--    ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1',        'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                             'PLAYER_IS_SUZERAIN'),
--    ('MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS',           'MODIFIER_PLAYER_CITIES_ADJUST_CITY_AMENITIES_FROM_CITY_STATES',    'CITY_HAS_HARBOR_REQUIREMENTS');
    -- ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS2',        'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                             'PLAYER_IS_SUZERAIN'),
    -- ('MINOR_CIV_MUSCAT_COMMERCIAL_HUB_BONUS',           'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'DISTRICT_IS_COMMERCIAL_HUB');

--insert into ModifierArguments
--    (ModifierId,                                        Name,                   Value)
--values
--    ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1',        'ModifierId',           'MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS'),
--    ('MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS',           'Amount',               1);
    -- ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS2',        'ModifierId',           'MINOR_CIV_MUSCAT_COMMERCIAL_HUB_BONUS'),
    -- ('MINOR_CIV_MUSCAT_COMMERCIAL_HUB_BONUS',           'YieldType',            'YIELD_GOLD'),
    -- ('MINOR_CIV_MUSCAT_COMMERCIAL_HUB_BONUS',           'Amount',               100);

-------------------------------------
--Mitla
update ModifierArguments set value = 20 where ModifierId = 'MINOR_CIV_PALENQUE_CAMPUS_GROWTH_BONUS' and Name = 'Amount';
--insert or replace into TraitModifiers 
--    (TraitType,                                 ModifierId)
--values
--    ('MINOR_CIV_PALENQUE_TRAIT',                'MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS');
--insert or replace into Modifiers
--    (ModifierId,                                                ModifierType,                                                       SubjectRequirementSetId)
--values
--    ('MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS',         'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                             'PLAYER_IS_SUZERAIN'),
    -- ('MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS_MODIFIER','MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',  'DISTRICT_IS_CAMPUS');
--    ('MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS_MODIFIER','MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',                    'DISTRICT_IS_CAMPUS');
--insert or replace into ModifierArguments
--    (ModifierId,                                                        Name,                   Value)
--values
--    ('MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS',                 'ModifierId',           'MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS_MODIFIER'),
    -- ('MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS_MODIFIER',        'YieldTypeToMirror',    'YIELD_SCIENCE'),
    -- ('MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS_MODIFIER',        'YieldTypeToGrant',     'YIELD_FOOD');
--    ('MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS_MODIFIER',        'Amount',               2),
--    ('MINOR_CIV_PALENQUE_CAMPUS_SCIENCE_TO_FOOD_BONUS_MODIFIER',        'YieldType',            'YIELD_FOOD');

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