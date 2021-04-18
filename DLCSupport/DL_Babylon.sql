-------------------------------------
--            Babylon DLC          --
-------------------------------------

-- AYUTTHAYA
delete from ModifierArguments where Value = 'MINOR_CIV_AYUTTHAYA_CULTURE_COMPLETE_BUILDING';

insert or replace into Modifiers
    (ModifierId,                                        ModifierType,                                           SubjectRequirementSetId)
values
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE',           'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',               Null),
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER',  'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',   'MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                        Name,                                                   Value)
values
    ('MINOR_CIV_AYUTTHAYA_UNIQUE_INFLUENCE_BONUS',      'ModifierId',                                           'MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE'),
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE',           'ModifierId',                                           'MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER'),
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER',  'YieldType',                                            'YIELD_CULTURE'),
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER',  'Amount',                                               2);

-- Kenzo Tange
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_KENZO_TANGE';

insert or replace into GreatPersonIndividualActionModifiers 
    (GreatPersonIndividualType,                         ModifierId)
values
    ('GREAT_PERSON_INDIVIDUAL_KENZO_TANGE',             'GREATPERSON_NATIONAL_DISTRICT_SCIENCE_ADJACENCY_AS_TOURISM'),
    ('GREAT_PERSON_INDIVIDUAL_KENZO_TANGE',             'GREATPERSON_NATIONAL_DISTRICT_CULTURE_ADJACENCY_AS_TOURISM'),
    ('GREAT_PERSON_INDIVIDUAL_KENZO_TANGE',             'GREATPERSON_NATIONAL_DISTRICT_FAITH_ADJACENCY_AS_TOURISM'),
    ('GREAT_PERSON_INDIVIDUAL_KENZO_TANGE',             'GREATPERSON_NATIONAL_DISTRICT_PRODUCTION_ADJACENCY_AS_TOURISM'),
    ('GREAT_PERSON_INDIVIDUAL_KENZO_TANGE',             'GREATPERSON_NATIONAL_DISTRICT_GOLD_ADJACENCY_AS_TOURISM');

insert or replace into Modifiers
    (ModifierId,                                                    ModifierType,                                                   Runonce, Permanent)
values
    ('GREATPERSON_NATIONAL_DISTRICT_SCIENCE_ADJACENCY_AS_TOURISM',  'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',    1, 1),
    ('GREATPERSON_NATIONAL_DISTRICT_CULTURE_ADJACENCY_AS_TOURISM',  'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',    1, 1),
    ('GREATPERSON_NATIONAL_DISTRICT_FAITH_ADJACENCY_AS_TOURISM',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',    1, 1),
    ('GREATPERSON_NATIONAL_DISTRICT_PRODUCTION_ADJACENCY_AS_TOURISM','MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',   1, 1),
    ('GREATPERSON_NATIONAL_DISTRICT_GOLD_ADJACENCY_AS_TOURISM',     'MODIFIER_PLAYER_DISTRICTS_ADJUST_TOURISM_ADJACENCY_YIELD_MOFIFIER',    1, 1);

insert or replace into ModifierArguments
    (ModifierId,                                                        Name,                   Value)
values
    ('GREATPERSON_NATIONAL_DISTRICT_SCIENCE_ADJACENCY_AS_TOURISM',      'Amount',               100),
    ('GREATPERSON_NATIONAL_DISTRICT_SCIENCE_ADJACENCY_AS_TOURISM',      'YieldType',            'YIELD_SCIENCE'),
    ('GREATPERSON_NATIONAL_DISTRICT_CULTURE_ADJACENCY_AS_TOURISM',      'Amount',               100),
    ('GREATPERSON_NATIONAL_DISTRICT_CULTURE_ADJACENCY_AS_TOURISM',      'YieldType',            'YIELD_CULTURE'),
    ('GREATPERSON_NATIONAL_DISTRICT_FAITH_ADJACENCY_AS_TOURISM',        'Amount',               100),
    ('GREATPERSON_NATIONAL_DISTRICT_FAITH_ADJACENCY_AS_TOURISM',        'YieldType',            'YIELD_FAITH'),
    ('GREATPERSON_NATIONAL_DISTRICT_PRODUCTION_ADJACENCY_AS_TOURISM',   'Amount',               100),
    ('GREATPERSON_NATIONAL_DISTRICT_PRODUCTION_ADJACENCY_AS_TOURISM',   'YieldType',            'YIELD_PRODUCTION'),
    ('GREATPERSON_NATIONAL_DISTRICT_GOLD_ADJACENCY_AS_TOURISM',         'Amount',               100),
    ('GREATPERSON_NATIONAL_DISTRICT_GOLD_ADJACENCY_AS_TOURISM',         'YieldType',            'YIELD_GOLD');

insert or replace into ModifierStrings
    (ModifierId,                                                    Context,    Text)
values
    ('GREATPERSON_NATIONAL_DISTRICT_SCIENCE_ADJACENCY_AS_TOURISM',  'Summary',  'LOC_GREATPERSON_NATIONAL_DISTRICT_SCIENCE_ADJACENCY_AS_TOURISM');

-- Bug fix for the new great scientist IBN_KHALDUN.
update ModifierArguments set Value = 4
 where ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_HAPPY_SCIENCE' and Name = 'Amount'
    or ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_HAPPY_CULTURE' and Name = 'Amount'
    or ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_HAPPY_PRODUCTION' and Name = 'Amount'
    or ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_HAPPY_GOLD' and Name = 'Amount'
    or ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_HAPPY_FAITH' and Name = 'Amount';

update ModifierArguments set Value = 8
 where ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_ECSTATIC_SCIENCE' and Name = 'Amount'
    or ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_ECSTATIC_CULTURE' and Name = 'Amount'
    or ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_ECSTATIC_PRODUCTION' and Name = 'Amount'
    or ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_ECSTATIC_GOLD' and Name = 'Amount'
    or ModifierID = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_ECSTATIC_FAITH' and Name = 'Amount';

insert or replace into GreatPersonIndividualActionModifiers
    (GreatPersonIndividualType, ModifierId, AttachmentTargetType)
values
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_SCIENCE',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_CULTURE',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_PRODUCTION',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_GOLD',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_FAITH',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

insert or replace into Modifiers
    (ModifierID,                                                        ModifierType,                               RunOnce, Permanent)
values
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_SCIENCE',    'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    1,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_CULTURE',    'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    1,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    1,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_GOLD',       'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    1,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_FAITH',      'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    1,  1);

insert or replace into ModifierArguments
    (ModifierID,                                                            Name,               Value)
values
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_SCIENCE',        'HappinessType',    'HAPPINESS_DELIGHTED'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_SCIENCE',        'YieldType',        'YIELD_SCIENCE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_SCIENCE',        'Amount',           2),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_CULTURE',        'HappinessType',    'HAPPINESS_DELIGHTED'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_CULTURE',        'YieldType',        'YIELD_CULTURE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_CULTURE',        'Amount',           2),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_PRODUCTION',     'HappinessType',    'HAPPINESS_DELIGHTED'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_PRODUCTION',     'YieldType',        'YIELD_PRODUCTION'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_PRODUCTION',     'Amount',           2),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_GOLD',           'HappinessType',    'HAPPINESS_DELIGHTED'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_GOLD',           'YieldType',        'YIELD_GOLD'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_GOLD',           'Amount',           2),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_FAITH',          'HappinessType',    'HAPPINESS_DELIGHTED'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_FAITH',          'YieldType',        'YIELD_FAITH'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_FAITH',          'Amount',           2);