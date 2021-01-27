-------------------------------------
--  Temporary update database sql  --
-------------------------------------
--TRAIT_CIVILIZATION_NKISI
--TRAIT_DOUBLE_ARTIST_POINTS

insert or replace into DynamicModifiers
	(ModifierType,                                              CollectionType,           EffectType)
values
    ('MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT', 'COLLECTION_OWNER_CITY' , 'EFFECT_ADJUST_GREAT_PERSON_POINTS_PERCENT' );


insert or replace into BuildingModifiers
	(BuildingType,                                              ModifierId)
values
    ('BUILDING_MILITARY_ACADEMY',                               'MILITARY_ACADEMY_ADDHALF_GREAT_GENERAL_POINTS'),
    ('BUILDING_SEAPORT'         ,                               'SEAPORT_ADDHALF_GREAT_ADMIRAL_POINTS'         );


insert or replace into Modifiers
	(ModifierId,                                                ModifierType)
values
-- Military Academy, Seaport
    ('MILITARY_ACADEMY_ADDHALF_GREAT_GENERAL_POINTS',           'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT'),
    ('SEAPORT_ADDHALF_GREAT_ADMIRAL_POINTS'         ,           'MODIFIER_PLAYER_ADJUST_CITY_GREAT_PERSON_POINTS_PERCENT');


insert or replace into ModifierArguments
	(ModifierId,                                                Name,                     Value)
values
    ('MILITARY_ACADEMY_ADDHALF_GREAT_GENERAL_POINTS',           'GreatPersonClassType' ,  'GREAT_PERSON_CLASS_General' ),
    ('MILITARY_ACADEMY_ADDHALF_GREAT_GENERAL_POINTS',           'Amount'               ,  50                           ),
    ('SEAPORT_ADDHALF_GREAT_ADMIRAL_POINTS'         ,           'GreatPersonClassType' ,  'GREAT_PERSON_CLASS_ADMIRAL' ),
    ('SEAPORT_ADDHALF_GREAT_ADMIRAL_POINTS'         ,           'Amount'               ,  50                           );