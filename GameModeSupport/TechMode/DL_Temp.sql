-------------------------------------
--     Temp Testing Adjustments    --
-------------------------------------

update Buildings set Cost = 360 where BuildingType = 'BUILDING_FACTORY';
update Buildings_XP2 set RequiredPower = 0 where BuildingType = 'BUILDING_FACTORY';

delete from Building_YieldChangesBonusWithPower where BuildingType = 'BUILDING_FACTORY';
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'BUILDING_FACTORY' and YieldType = 'YIELD_PRODUCTION';

update Building_YieldChangesBonusWithPower set YieldChange = 3 where BuildingType = 'BUILDING_ELECTRONICS_FACTORY' and YieldType = 'YIELD_PRODUCTION';
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'BUILDING_ELECTRONICS_FACTORY' and YieldType = 'YIELD_PRODUCTION';

------------------------------------------------------------------------------------------------
-- Korea ability updated
delete from TraitModifiers where ModifierId = 'TRAIT_ADJUST_CITY_CULTURE_PER_GOVERNOR_TITLE_MODIFIER';
delete from TraitModifiers where ModifierId = 'TRAIT_ADJUST_CITY_SCIENCE_PER_GOVERNOR_TITLE_MODIFIER';  
delete from Adjacency_YieldChanges where ID = 'Mine_ScienceSeowonAdjacency';
delete from Adjacency_YieldChanges where ID = 'Farm_FoodSeowonAdjacency';
delete from District_Adjacencies where YieldChangeId = 'NegativeDistrict_Science';

insert or replace into TraitModifiers (TraitType,   ModifierId)
select  'TRAIT_LEADER_HWARANG', 'HWARANG_RESEARCHLAB_POP' || YieldType from Yields;
insert or replace into Modifiers (ModifierId,   ModifierType,   SubjectRequirementSetId)
select  'HWARANG_RESEARCHLAB_POP' || YieldType, 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION', 'CITY_HAS_BUILDING_RESEARCH_LAB' from Yields;
insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select  'HWARANG_RESEARCHLAB_POP' || YieldType, 'YieldType', YieldType from Yields;
insert or replace into ModifierArguments (ModifierId,   Name,   Value)
select  'HWARANG_RESEARCHLAB_POP' || YieldType, 'Amount', 1 from Yields;

insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('TRAIT_LEADER_HWARANG',                'HWARANG_ALLBUFF'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_HOUSING'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_LOYALTY'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_AMENITY'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_LOYALTY_DEBUFF'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_AMENITY_DEBUFF'),
    ('TRAIT_LEADER_HWARANG',                'HWARANG_ALLDEBUFF'),
    ('TRAIT_LEADER_HWARANG',                'SEWON_FOOD'),
    ('TRAIT_LEADER_HWARANG',                'SEWON_PRODUCTION'),
    ('TRAIT_LEADER_HWARANG',                'LIBRARY_DISTRICT_PRODUCTION'),
    ('TRAIT_LEADER_HWARANG',                'LIBRARY_BUILDING_PRODUCTION'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_CAMPUS_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_THEATER_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_COMMEICIAL_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_HARBOR_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_INDUSTRIAL_ADJACENCY'),
    ('TRAIT_LEADER_HWARANG',                'UNIVERSITY_HOLY_SITE_ADJACENCY'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_SEWON_TITLE'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_LIBRARY_TITLE'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_UNIVERSITY_TITLE'),
    ('TRAIT_CIVILIZATION_THREE_KINGDOMS',   'CAPITAL_RESERCHLAB_TITLE');

insert or replace into Modifiers
    (ModifierId,                        ModifierType,                                                       SubjectRequirementSetId)
values
    ('HWARANG_ALLBUFF',                 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'CITY_HAS_BUILDING_RESEARCH_LAB'),
    ('HWARANG_HOUSING',                 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',                     'CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL'),
    ('HWARANG_LOYALTY',                 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',                  'CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL'),
    ('HWARANG_AMENITY',                 'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',                      'CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL'),
    ('HWARANG_LOYALTY_DEBUFF',          'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN',                  'CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL'),
    ('HWARANG_AMENITY_DEBUFF',          'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',                      'CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL'),
    ('HWARANG_ALLDEBUFF',               'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL'),
    ('SEWON_FOOD',                      'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'CITY_HAS_DISTRICT_SEOWON'),
    ('SEWON_PRODUCTION',                'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',                'CITY_HAS_DISTRICT_SEOWON'),
    ('LIBRARY_DISTRICT_PRODUCTION',     'MODIFIER_PLAYER_CITIES_ADJUST_ALL_DISTRICTS_PRODUCTION',           'CITY_HAS_BUILDING_LIBRARY'),
    ('LIBRARY_BUILDING_PRODUCTION',     'MODIFIER_PLAYER_CITIES_ADJUST_ALLBUILDING_PRODUCTION_MODIFIER',    'CITY_HAS_BUILDING_LIBRARY'),
    ('UNIVERSITY_CAMPUS_ADJACENCY',     'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_CAMPUS_REQUIRMENTS'),
    ('UNIVERSITY_THEATER_ADJACENCY',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_THEATER_REQUIRMENTS'),
    ('UNIVERSITY_COMMEICIAL_ADJACENCY', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS'),
    ('UNIVERSITY_HARBOR_ADJACENCY',     'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_HARBOR_REQUIRMENTS'),
    ('UNIVERSITY_INDUSTRIAL_ADJACENCY', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS'),
    ('UNIVERSITY_HOLY_SITE_ADJACENCY',  'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',                  'UNIVERSITY_AND_HOLYSITE_REQUIRMENTS');

insert or replace into Modifiers
    (ModifierId,                    ModifierType)
values
    ('CAPITAL_SEWON_TITLE',         'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
    ('CAPITAL_LIBRARY_TITLE',       'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
    ('CAPITAL_UNIVERSITY_TITLE',    'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER'),
    ('CAPITAL_RESERCHLAB_TITLE',    'MODIFIER_PLAYER_CAPITAL_CITY_ATTACH_MODIFIER');

insert or replace into Modifiers
    (ModifierId,                            ModifierType,                               SubjectRequirementSetId,        RunOnce,    Permanent)
values
    ('CAPITAL_SEWON_TITLE_MODIFIER',        'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_SEOWON_REQUIREMENTS',       1,  1),
    ('CAPITAL_LIBRARY_TITLE_MODIFIER',      'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_LIBRARY_REQUIREMENTS',      1,  1),
    ('CAPITAL_UNIVERSITY_TITLE_MODIFIER',   'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_UNIVERSITY_REQUIREMENTS',   1,  1),
    ('CAPITAL_RESERCHLAB_TITLE_MODIFIER',   'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS',   'PALACE_AND_REEARCHLAB_REQUIREMENTS',   1,  1);

insert or replace into ModifierArguments
    (ModifierId,                            Name,           Value)
values
    ('HWARANG_ALLBUFF',                     'YieldType',    'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'),
    ('HWARANG_ALLBUFF',                     'Amount',       '10,10,10,10,10,10'),
    ('HWARANG_HOUSING',                     'Amount',       5),
    ('HWARANG_LOYALTY',                     'Amount',       20),
    ('HWARANG_AMENITY',                     'Amount',       3),
    ('HWARANG_LOYALTY_DEBUFF',              'Amount',       -8),
    ('HWARANG_AMENITY_DEBUFF',              'Amount',       -2),
    ('HWARANG_ALLDEBUFF',                   'YieldType',    'YIELD_PRODUCTION, YIELD_FOOD, YIELD_SCIENCE,YIELD_CULTURE, YIELD_GOLD, YIELD_FAITH'),
    ('HWARANG_ALLDEBUFF',                   'Amount',       '-50,-50,-50,-50,-50,-50'),
    -- 
    ('SEWON_FOOD',                          'YieldType',    'YIELD_FOOD'),
    ('SEWON_FOOD',                          'Amount',       15),
    ('SEWON_PRODUCTION',                    'YieldType',    'YIELD_PRODUCTION'),
    ('SEWON_PRODUCTION',                    'Amount',       15),
    -- 
    ('LIBRARY_DISTRICT_PRODUCTION',         'Amount',       50),
    ('LIBRARY_BUILDING_PRODUCTION',         'IsWonder',     0),
    ('LIBRARY_BUILDING_PRODUCTION',         'Amount',       50),
    -- 
    ('UNIVERSITY_CAMPUS_ADJACENCY',         'YieldType',    'YIELD_SCIENCE'),
    ('UNIVERSITY_CAMPUS_ADJACENCY',         'Amount',       100),
    ('UNIVERSITY_THEATER_ADJACENCY',        'YieldType',    'YIELD_CULTURE'),
    ('UNIVERSITY_THEATER_ADJACENCY',        'Amount',       100),
    ('UNIVERSITY_COMMEICIAL_ADJACENCY',     'YieldType',    'YIELD_GOLD'),
    ('UNIVERSITY_COMMEICIAL_ADJACENCY',     'Amount',       100),
    ('UNIVERSITY_HARBOR_ADJACENCY',         'YieldType',    'YIELD_GOLD'),
    ('UNIVERSITY_HARBOR_ADJACENCY',         'Amount',       100),
    ('UNIVERSITY_INDUSTRIAL_ADJACENCY',     'YieldType',    'YIELD_PRODUCTION'),
    ('UNIVERSITY_INDUSTRIAL_ADJACENCY',     'Amount',       100),
    ('UNIVERSITY_HOLY_SITE_ADJACENCY',      'YieldType',    'YIELD_FAITH'),
    ('UNIVERSITY_HOLY_SITE_ADJACENCY',      'Amount',       100),
    -- 
    ('CAPITAL_SEWON_TITLE',                 'ModifierId',   'CAPITAL_SEWON_TITLE_MODIFIER'),
    ('CAPITAL_LIBRARY_TITLE',               'ModifierId',   'CAPITAL_LIBRARY_TITLE_MODIFIER'),
    ('CAPITAL_UNIVERSITY_TITLE',            'ModifierId',   'CAPITAL_UNIVERSITY_TITLE_MODIFIER'),
    ('CAPITAL_RESERCHLAB_TITLE',            'ModifierId',   'CAPITAL_RESERCHLAB_TITLE_MODIFIER'),
    ('CAPITAL_SEWON_TITLE_MODIFIER',        'Delta',        1),
    ('CAPITAL_LIBRARY_TITLE_MODIFIER',      'Delta',        1),
    ('CAPITAL_UNIVERSITY_TITLE_MODIFIER',   'Delta',        1),
    ('CAPITAL_RESERCHLAB_TITLE_MODIFIER',   'Delta',        1);

insert or replace into Requirements
    (RequirementId,                             RequirementType,                        Inverse)
values
    ('REQUIRES_CITY_NON_CAPITAL',               'REQUIREMENT_CITY_HAS_BUILDING',        1),
    ('REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD', 'REQUIREMENT_PLOT_PROPERTY_MATCHES',    0),
    ('REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD',  'REQUIREMENT_PLOT_PROPERTY_MATCHES',    1);

insert or replace into RequirementArguments
    (RequirementId,                             Name,               Value)
values
    ('REQUIRES_CITY_NON_CAPITAL',               'BuildingType',     'BUILDING_PALACE'),
    ('REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD', 'PropertyName',     'HD_HasAssignedGovernor'),
    ('REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD', 'PropertyMinimum',  1),
    ('REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD',  'PropertyName',     'HD_HasAssignedGovernor'),
    ('REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD',  'PropertyMinimum',  1);

insert or replace into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
values
    ('PALACE_AND_SEOWON_REQUIREMENTS',                  'REQUIREMENTSET_TEST_ALL'),
    ('PALACE_AND_LIBRARY_REQUIREMENTS',                 'REQUIREMENTSET_TEST_ALL'),
    ('PALACE_AND_UNIVERSITY_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL'),
    ('PALACE_AND_REEARCHLAB_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL',           'REQUIREMENTSET_TEST_ANY'),
    ('CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL',  'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_DISTRICT_SEOWON',                        'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_BUILDING_LIBRARY',                       'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_CAMPUS_REQUIRMENTS',               'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_THEATER_REQUIRMENTS',              'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS',           'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_HARBOR_REQUIRMENTS',               'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS',           'REQUIREMENTSET_TEST_ALL'),
    ('UNIVERSITY_AND_HOLYSITE_REQUIRMENTS',             'REQUIREMENTSET_TEST_ALL'),
    ('CITY_HAS_BUILDING_RESEARCH_LAB',                  'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
values
    ('PALACE_AND_SEOWON_REQUIREMENTS',                  'REQUIRES_CITY_HAS_DISTRICT_SEOWON'),
    ('PALACE_AND_SEOWON_REQUIREMENTS',                  'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('PALACE_AND_LIBRARY_REQUIREMENTS',                 'REQUIRES_CITY_HAS_BUILDING_LIBRARY'),
    ('PALACE_AND_LIBRARY_REQUIREMENTS',                 'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('PALACE_AND_UNIVERSITY_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('PALACE_AND_UNIVERSITY_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('PALACE_AND_REEARCHLAB_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_RESEARCH_LAB'),
    ('PALACE_AND_REEARCHLAB_REQUIREMENTS',              'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    -- 
    ('CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL',           'REQUIRES_CITY_HAS_BUILDING_PALACE'),
    ('CITY_HAS_ASSIGNED_GOVERNOR_OR_CAPITAL',           'REQUIRES_CITY_HAVE_ASSIGNED_GOVERNOR_HD'),
    ('CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL',  'REQUIRES_CITY_NON_CAPITAL'),
    ('CITY_HAS_NOT_ASSIGNED_GOVERNOR_AND_NON_CAPITAL',  'REQUIRES_CITY_NOT_ASSIGNED_GOVERNOR_HD'),
    -- 
    ('CITY_HAS_DISTRICT_SEOWON',                        'REQUIRES_CITY_HAS_DISTRICT_SEOWON'),
    ('CITY_HAS_BUILDING_LIBRARY',                       'REQUIRES_CITY_HAS_BUILDING_LIBRARY'),
    ('UNIVERSITY_AND_CAMPUS_REQUIRMENTS',               'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_CAMPUS_REQUIRMENTS',               'REQUIRES_DISTRICT_IS_DISTRICT_CAMPUS'),
    ('UNIVERSITY_AND_THEATER_REQUIRMENTS',              'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_THEATER_REQUIRMENTS',              'REQUIRES_DISTRICT_IS_DISTRICT_THEATER'),
    ('UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS',           'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_COMMERCIAL_REQUIRMENTS',           'REQUIRES_DISTRICT_IS_DISTRICT_COMMERCIAL_HUB'),
    ('UNIVERSITY_AND_HARBOR_REQUIRMENTS',               'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_HARBOR_REQUIRMENTS',               'REQUIRES_DISTRICT_IS_DISTRICT_HARBOR'),
    ('UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS',           'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_INDUSTRIAL_REQUIRMENTS',           'REQUIRES_DISTRICT_IS_DISTRICT_INDUSTRIAL_ZONE'),
    ('UNIVERSITY_AND_HOLYSITE_REQUIRMENTS',             'REQUIRES_CITY_HAS_BUILDING_UNIVERSITY'),
    ('UNIVERSITY_AND_HOLYSITE_REQUIRMENTS',             'REQUIRES_DISTRICT_IS_DISTRICT_HOLY_SITE'),
    ('CITY_HAS_BUILDING_RESEARCH_LAB',                  'REQUIRES_CITY_HAS_BUILDING_RESEARCH_LAB');

delete from District_ValidTerrains where DistrictType = 'DISTRICT_SEOWON';
delete from StartBiasTerrains where CivilizationType = 'CIVILIZATION_KOREA';
