-------------------------------------
--            Babylon DLC          --
-------------------------------------

---------------------------------------------------------------------------------------------------------
--Samarkand
update ModifierArguments set Value = 2 where ModifierId = 'MINOR_CIV_SAMARKAND_TRADE_GOLD_MODIFIER' and Name = 'Amount';
insert or replace into Improvement_YieldChanges
    (ImprovementType,               YieldType,          YieldChange)
values
    ('IMPROVEMENT_TRADING_DOME',    'YIELD_FOOD',       0),
    ('IMPROVEMENT_TRADING_DOME',    'YIELD_PRODUCTION', 0);
insert or replace into Improvement_BonusYieldChanges
    (Id,    ImprovementType,            YieldType,         BonusYieldChange,    PrereqCivic)
values
    (555,   'IMPROVEMENT_TRADING_DOME', 'YIELD_GOLD',       2,                  'CIVIC_MEDIEVAL_FAIRES');

insert or replace into ImprovementModifiers
    (ImprovementType,       ModifierId)
values
    ('IMPROVEMENT_TRADING_DOME', 'TRADING_DOME_DESERT_FOOD');
 --    ('IMPROVEMENT_TRADING_DOME', 'TRADING_DOME_DESERT_PRODUCTION'),
    -- ('IMPROVEMENT_TRADING_DOME', 'TRADING_DOME_ADJECENT_LUXURY_GOLD');
insert or replace into Modifiers
    (ModifierId,                            ModifierType,                               SubjectRequirementSetId)
values
    ('TRADING_DOME_DESERT_FOOD',            'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',  'PETRA_YIELD_MODIFIER_REQUIREMENTS');
 --    ('TRADING_DOME_DESERT_PRODUCTION',      'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',  'PETRA_YIELD_MODIFIER_REQUIREMENTS'),
    -- ('TRADING_DOME_ADJECENT_LUXURY_GOLD',   'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',         'TRADING_DOME_REQUIREMENTS');
insert or replace into ModifierArguments
    (ModifierId,                                Name,               Value)
values
    ('TRADING_DOME_DESERT_FOOD',                'YieldType',        'YIELD_FOOD'),
    ('TRADING_DOME_DESERT_FOOD',                'Amount',           3);
 --    ('TRADING_DOME_DESERT_PRODUCTION',           'YieldType',        'YIELD_PRODUCTION'),
 --    ('TRADING_DOME_DESERT_PRODUCTION',           'Amount',           1),
    -- ('TRADING_DOME_ADJECENT_LUXURY_GOLD',       'YieldType',     'YIELD_GOLD'),
 --    ('TRADING_DOME_ADJECENT_LUXURY_GOLD',       'Amount',        2);
 
-- insert or replace into RequirementSets
--  (RequirementSetId,                                      RequirementSetType)
-- values
--  ('TRADING_DOME_REQUIREMENTS',                           'REQUIREMENTSET_TEST_ALL');
-- insert or replace into RequirementSetRequirements
--  (RequirementSetId,                                      RequirementId)
-- values
--  ('TRADING_DOME_REQUIREMENTS',                           'REQUIRES_PLOT_HAS_LUXURY');
update Adjacency_YieldChanges set YieldChange = 2 where ID ='TradingDome_LuxuryAdjacency';

-- AYUTTHAYA
-- delete from ModifierArguments where Value = 'MINOR_CIV_AYUTTHAYA_CULTURE_COMPLETE_BUILDING';
delete from TraitModifiers where TraitType = 'MINOR_CIV_AYUTTHAYA_TRAIT';
insert or replace into TraitModifiers
    (TraitType,                     ModifierID)
values
    ('MINOR_CIV_AYUTTHAYA_TRAIT',   'MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE'),
    ('MINOR_CIV_AYUTTHAYA_TRAIT',   'MINOR_CIV_AYUTTHAYA_RIVIER_DISTRICTS_CULTURE');

insert or replace into Modifiers
    (ModifierId,                                                ModifierType,                                           SubjectRequirementSetId)
values
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE',                   'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                 'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER',          'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',        'MINOR_3DISTRICTS_CULTURE_REQUIREMENTS'),
    ('MINOR_CIV_AYUTTHAYA_RIVIER_DISTRICTS_CULTURE',            'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',                 'PLAYER_IS_SUZERAIN'),
    ('MINOR_CIV_AYUTTHAYA_RIVIER_DISTRICTS_CULTURE_MODIFIER',   'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',        'MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                                Name,           Value)
values
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE',                   'ModifierId',   'MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER'),
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER',          'YieldType',    'YIELD_CULTURE'),
    ('MINOR_CIV_AYUTTHAYA_DISTRICTS_CULTURE_MODIFIER',          'Amount',       1),
    ('MINOR_CIV_AYUTTHAYA_RIVIER_DISTRICTS_CULTURE',            'ModifierId',   'MINOR_CIV_AYUTTHAYA_RIVIER_DISTRICTS_CULTURE_MODIFIER'),
    ('MINOR_CIV_AYUTTHAYA_RIVIER_DISTRICTS_CULTURE_MODIFIER',   'YieldType',    'YIELD_CULTURE'),
    ('MINOR_CIV_AYUTTHAYA_RIVIER_DISTRICTS_CULTURE_MODIFIER',   'Amount',       1);

-- Chinguetti
update ModifierArguments set Value = 0.3 where ModifierId = 'MINOR_CIV_CHINGUETTI_FAITH_FOLLOWERS' and Name = 'Amount';
insert or replace into TraitModifiers(TraitType,ModifierID)values
	('MINOR_CIV_CHINGUETTI_TRAIT','MINOR_CIV_CHINGUETTI_UNIQUE_INFLUENCE_BONUS2');
insert or replace into Modifiers
	(ModifierId,                                       ModifierType,                               SubjectRequirementSetId)
values
	('MINOR_CIV_CHINGUETTI_UNIQUE_INFLUENCE_BONUS2',   'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',     'PLAYER_IS_SUZERAIN'),
	('MINOR_CIV_CHINGUETTI_FAITH',                     'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD', NULL);

insert or replace into ModifierArguments
	(ModifierId,                                       Name,           Value)
values
	('MINOR_CIV_CHINGUETTI_UNIQUE_INFLUENCE_BONUS2',   'ModifierId',   'MINOR_CIV_CHINGUETTI_FAITH'),
	('MINOR_CIV_CHINGUETTI_FAITH',                     'YieldType',    'YIELD_FAITH'),
	('MINOR_CIV_CHINGUETTI_FAITH',                     'Amount',       3);

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

update Modifiers set RunOnce = 0 where ModifierId like 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_%';

-- Add on for new happiness level.
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
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_SCIENCE',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_CULTURE',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_PRODUCTION',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_GOLD',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN',
    'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_FAITH',
    'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

update GreatPersonIndividualActionModifiers set AttachmentTargetType = 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER' 
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN' and ModifierId like 'GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_%';

insert or replace into Modifiers
    (ModifierID,                                                        ModifierType,                               RunOnce, Permanent)
values
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_SCIENCE',    'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_CULTURE',    'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_GOLD',       'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_FAITH',      'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_SCIENCE',       'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_CULTURE',       'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_PRODUCTION',    'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_GOLD',          'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_FAITH',         'MODIFIER_PLAYER_CITIES_ADJUST_HAPPINESS_YIELD_BAB',    0,  1);

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
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_DELIGHTED_FAITH',          'Amount',           2),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_SCIENCE',           'HappinessType',    'HAPPINESS_JOYFUL'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_SCIENCE',           'YieldType',        'YIELD_SCIENCE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_SCIENCE',           'Amount',           6),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_CULTURE',           'HappinessType',    'HAPPINESS_JOYFUL'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_CULTURE',           'YieldType',        'YIELD_CULTURE'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_CULTURE',           'Amount',           6),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_PRODUCTION',        'HappinessType',    'HAPPINESS_JOYFUL'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_PRODUCTION',        'YieldType',        'YIELD_PRODUCTION'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_PRODUCTION',        'Amount',           6),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_GOLD',              'HappinessType',    'HAPPINESS_JOYFUL'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_GOLD',              'YieldType',        'YIELD_GOLD'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_GOLD',              'Amount',           6),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_FAITH',             'HappinessType',    'HAPPINESS_JOYFUL'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_FAITH',             'YieldType',        'YIELD_FAITH'),
    ('GREAT_PERSON_INDIVIDUAL_IBN_KHALDUN_EMPIRE_JOYFUL_FAITH',             'Amount',           6);