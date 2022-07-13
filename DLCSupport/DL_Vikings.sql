-------------------------------------
--            Vikings DLC          --
-------------------------------------

-- Natural Wonders
insert or replace into Feature_AdjacentYields
	(FeatureType,				YieldType,				YieldChange)
values
    ('FEATURE_LYSEFJORDEN',		'YIELD_PRODUCTION',		1);
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

-- Auckland
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

-- Mitla
update ModifierArguments set value = 20 where ModifierId = 'MINOR_CIV_PALENQUE_CAMPUS_GROWTH_BONUS' and Name = 'Amount';

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