-------------------------------------
--            Vikings DLC          --
-------------------------------------

-- Norway
insert or replace into TraitModifiers
    (TraitType, ModifierId)
values
    ('TRAIT_LEADER_MELEE_COASTAL_RAIDS', 'TRAIT_LEADER_PILLAGE_SCIENCE_FARMS'),
    ('TRAIT_LEADER_MELEE_COASTAL_RAIDS', 'TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS');

insert or replace into Modifiers
    (ModifierId,                                    ModifierType)
values
    ('TRAIT_LEADER_PILLAGE_SCIENCE_FARMS',          'MODIFIER_PLAYER_ADJUST_ADDITIONAL_PILLAGING'),
    ('TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS',   'MODIFIER_PLAYER_ADJUST_ADDITIONAL_PILLAGING');

insert or replace into ModifierArguments
    (ModifierId,                                    Name,               Value)
values
    ('TRAIT_LEADER_PILLAGE_SCIENCE_FARMS',          'PlunderType',      'PLUNDER_SCIENCE'),
    ('TRAIT_LEADER_PILLAGE_SCIENCE_FARMS',          'ImprovementType',  'IMPROVEMENT_FARM'),
    ('TRAIT_LEADER_PILLAGE_SCIENCE_FARMS',          'Amount',           15),
    ('TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS',   'PlunderType',      'PLUNDER_SCIENCE'),
    ('TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS',   'ImprovementType',  'IMPROVEMENT_LUMBER_MILL'),
    ('TRAIT_LEADER_PILLAGE_SCIENCE_LUMBER_MILLS',   'Amount',           15);

-- Natural Wonders
insert or replace into Feature_AdjacentYields (FeatureType, YieldType, YieldChange) values
    -- ('FEATURE_TSINGY', 'YIELD_GOLD', 1),
    ('FEATURE_LYSEFJORDEN', 'YIELD_PRODUCTION', 1);

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                          RequirementId)
values
    ('GODDESS_OF_FIRE_CITY_HAS_VOLCANO',                        'REQUIRES_CITY_HAS_FEATURE_EYJAFJALLAJOKULL');

--------------------------------------------------------------------------------------------------------------
-- Armagh
update Adjacency_YieldChanges set TilesRequired = 1 , ObsoleteCivic = 'CIVIC_DIVINE_RIGHT' where ID = 'Monastery_DistrictAdjacency';
insert or replace into Improvement_Adjacencies
    (ImprovementType,               YieldChangeId)
values 
    ('IMPROVEMENT_MONASTERY',       'Monastery_DistrictAdjacency_Divine_Right_Late');
insert or replace into Adjacency_YieldChanges
    (ID, Description, YieldType, YieldChange, TilesRequired, OtherDistrictAdjacent, PrereqCivic)  
values 
    ('Monastery_DistrictAdjacency_Divine_Right_Late', 'Placeholder', 'YIELD_FAITH', 2, 1, 1, 'CIVIC_DIVINE_RIGHT');

--auckland
delete from TraitModifiers where ModifierId = 'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_BASE';
delete from TraitModifiers where ModifierId = 'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL';
-- delete from TraitModifiers where ModifierId = 'MINOR_CIV_AUCKLAND_SHALLOW_WATER_PRODUCTION_BONUS_BASE';
-- delete from TraitModifiers where ModifierId = 'MINOR_CIV_AUCKLAND_SHALLOW_WATER_PRODUCTION_BONUS_INDUSTRIAL';

insert or replace into TraitModifiers
	(TraitType,		ModifierId)
values
	-- ('MINOR_CIV_AUCKLAND_TRAIT', 	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_HARBOR'),
	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_LIGHTHOUSE'),
	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SHIPYARD'),
	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SEAPORT'),
	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL2'),
	('MINOR_CIV_AUCKLAND_TRAIT',	'MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_BASE2');

insert or replace into Modifiers
	(ModifierId,													ModifierType,											SubjectRequirementSetId)
values
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_HARBOR',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_LIGHTHOUSE',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SHIPYARD',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SEAPORT',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL2',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_BASE2',				'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',					'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_BASE',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_INDUSTRIAL',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'PLOT_HAS_FISHINGBOATS_AND_INDUSTRIAL_REQUIREMENTS'),
	('MINOR_CIV_AUCKLAND_BONUS_LIGHTHOUSE',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'BUILDING_IS_LIGHTHOUSE'),
	('MINOR_CIV_AUCKLAND_BONUS_SHIPYARD',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'BUILDING_IS_SHIPYARD'),
	('MINOR_CIV_AUCKLAND_BONUS_SEAPORT',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'BUILDING_IS_SEAPORT'),
	('MINOR_CIV_AUCKLAND_BONUS_HARBOR',								'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',		'DISTRICT_IS_HARBOR');

insert or replace into ModifierArguments
	(ModifierId,		Name,  		Value)
values
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_HARBOR',			'ModifierId',		'MINOR_CIV_AUCKLAND_BONUS_HARBOR'),	
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_LIGHTHOUSE',		'ModifierId',		'MINOR_CIV_AUCKLAND_BONUS_LIGHTHOUSE'),
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SHIPYARD',			'ModifierId',		'MINOR_CIV_AUCKLAND_BONUS_SHIPYARD'),
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_SEAPORT',			'ModifierId',		'MINOR_CIV_AUCKLAND_BONUS_SEAPORT'),
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_INDUSTRIAL2',		'ModifierId',		'MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_INDUSTRIAL'),
	('MINOR_CIV_AUCKLAND_UNIQUE_INFLUENCE_BONUS_BASE2',				'ModifierId',		'MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_BASE'),
	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_BASE',					'YieldType',		'YIELD_PRODUCTION'),
	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_BASE',					'Amount',			1),
	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_INDUSTRIAL',				'YieldType',		'YIELD_PRODUCTION'),
	('MINOR_CIV_AUCKLAND_FISHINGBOAT_BONUS_INDUSTRIAL',				'Amount',			1),
	('MINOR_CIV_AUCKLAND_BONUS_LIGHTHOUSE',							'YieldType',		'YIELD_PRODUCTION'),										
	('MINOR_CIV_AUCKLAND_BONUS_LIGHTHOUSE',							'Amount',			2),
	('MINOR_CIV_AUCKLAND_BONUS_SHIPYARD',							'YieldType',		'YIELD_PRODUCTION'),
	('MINOR_CIV_AUCKLAND_BONUS_SHIPYARD',							'Amount',			2),
	('MINOR_CIV_AUCKLAND_BONUS_SEAPORT',							'YieldType',		'YIELD_PRODUCTION'),
	('MINOR_CIV_AUCKLAND_BONUS_SEAPORT',							'Amount',			2),
	('MINOR_CIV_AUCKLAND_BONUS_HARBOR',								'YieldType',		'YIELD_PRODUCTION'),
	('MINOR_CIV_AUCKLAND_BONUS_HARBOR',								'Amount',			2);

insert or replace into RequirementSetRequirements(RequirementSetId,RequirementId)values
	('PLOT_HAS_FISHINGBOATS_AND_INDUSTRIAL_REQUIREMENTS','REQUIRES_PLOT_HAS_FISHINGBOATS'),
	('PLOT_HAS_FISHINGBOATS_AND_INDUSTRIAL_REQUIREMENTS','REQUIRES_PLAYER_IS_INDUSTRIAL_ERA');

insert or replace into RequirementSets(RequirementSetId,RequirementSetType)values
	('PLOT_HAS_FISHINGBOATS_AND_INDUSTRIAL_REQUIREMENTS','REQUIREMENTSET_TEST_ALL');


---------------------------------------------------------------------------------------------------------
--Muscat马斯喀特
-- delete from TraitModifiers where TraitType = 'MINOR_CIV_MUSCAT_TRAIT' and ModifierId = 'MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS';
insert into TraitModifiers 
    (TraitType,                                  ModifierId)
values
    -- ('MINOR_CIV_MUSCAT_TRAIT',                   'MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1'),
    ('MINOR_CIV_MUSCAT_TRAIT',                   'MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS2');

insert into Modifiers
    (ModifierId,                                        ModifierType,                                                       SubjectRequirementSetId)
values
    -- ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1',        'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                             'PLAYER_IS_SUZERAIN'),
    -- ('MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS',           'MODIFIER_PLAYER_CITIES_ADJUST_CITY_AMENITIES_FROM_CITY_STATES',    'CITY_HAS_COMMERCIAL_HUB_REQUIREMENTS'),
    ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS2',        'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_MUSCAT_COMMERCIAL_HUB_BONUS',           'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'DISTRICT_IS_COMMERCIAL_HUB');

insert into ModifierArguments
    (ModifierId,                                        Name,                   Value)
values
    -- ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1',        'ModifierId',           'MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS'),
    -- ('MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS',           'Amount',               1),
    ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS2',        'ModifierId',           'MINOR_CIV_MUSCAT_COMMERCIAL_HUB_BONUS'),
    ('MINOR_CIV_MUSCAT_COMMERCIAL_HUB_BONUS',           'YieldType',            'YIELD_GOLD'),
    ('MINOR_CIV_MUSCAT_COMMERCIAL_HUB_BONUS',           'Amount',               100);
