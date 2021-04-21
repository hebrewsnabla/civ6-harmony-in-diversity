-------------------------------------
--            Vikings DLC          --
-------------------------------------

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

-- Muscat
insert into TraitModifiers 
    (TraitType,                                  ModifierId)
values
    ('MINOR_CIV_MUSCAT_TRAIT',                   'MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1');

insert into Modifiers
    (ModifierId,                                        ModifierType,                                       SubjectRequirementSetId)
values
    ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1',        'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',             'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS',           'MODIFIER_PLAYER_CITIES_ADJUST_CITY_AMENITIES_FROM_CITY_STATES', 'CITY_HAS_HARBOR');

insert into ModifierArguments
    (ModifierId,                                        Name,            Value)
values
    ('MINOR_CIV_MUSCAT_UNIQUE_INFLUENCE_BONUS1',        'ModifierId',    'MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS'),
    ('MINOR_CIV_MUSCAT_HARBOR_AMENITY_BONUS',           'Amount',        1);
