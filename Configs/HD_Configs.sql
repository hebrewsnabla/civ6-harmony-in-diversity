-------------------------------------
--             Configs             --
-------------------------------------

-- No longer supports WE
-- update Parameters set DefaultValue = 1 where ParameterId = 'WER_ADD_STEEL_N_THUNDER_UU';
-- delete from Parameters where ParameterId = 'WER_ADD_STEEL_N_THUNDER_UU';

insert or replace into Parameters
    (Key1,      Key2,                   ParameterId,                    Name,                                       Description,
    Domain,     DefaultValue,   ConfigurationGroup, ConfigurationId,                        GroupId,            SortIndex)
values
    ('Ruleset', 'RULESET_EXPANSION_2',  'CapturedSettlersAsBuilders',   'LOC_GAME_CAPTURE_SETTLERS_AS_BUILDERS',    'LOC_GAME_CAPTURE_SETTLERS_AS_BUILDERS_DESCRIPTION',
    'bool',     0,              'Game',             'GAME_CAPTURE_SETTLERS_AS_BUILDERS',    'AdvancedOptions',  2020),
    ('Ruleset', 'RULESET_EXPANSION_2',  'AIGetCopyforMilitaryUnits',    'LOC_GAME_AI_GET_COPY_FOR_MILITARY_UNITS',  'LOC_GAME_AI_GET_COPY_FOR_MILITARY_UNITS_DESCRIPTION',
    'bool',     0,              'Game',             'GAME_AI_GET_COPY_FOR_MILITARY_UNITS',  'AdvancedOptions',  2020);
