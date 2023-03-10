-- Warning: do not use replace 
insert into IconTextureAtlases
    (Name,                      IconSize,   IconsPerRow,    IconsPerColumn,     Filename)
values
    ('ICON_ATLAS_CIVICS_HD',    38,         4,              2,                  'HDCivicIcons_38.dds'),
    ('ICON_ATLAS_CIVICS_HD',    42,         4,              2,                  'HDCivicIcons_42.dds'),
    ('ICON_ATLAS_CIVICS_HD',    128,        4,              2,                  'HDCivicIcons_128.dds'),
    ('ICON_ATLAS_CIVICS_HD',    160,        4,              2,                  'HDCivicIcons_160.dds'),
    ('ICON_ATLAS_CIVICS_HD_FOW',42,         4,              2,                  'HDCivicIcons_FOW_42.dds'),

    ('ICON_ATLAS_TECHS_HD',     30,         2,              1,                  'HDTechIcons_30.dds'),
    ('ICON_ATLAS_TECHS_HD',     38,         2,              1,                  'HDTechIcons_38.dds'),
    ('ICON_ATLAS_TECHS_HD',     42,         2,              1,                  'HDTechIcons_42.dds'),
    ('ICON_ATLAS_TECHS_HD',     128,        2,              1,                  'HDTechIcons_128.dds'),
    ('ICON_ATLAS_TECHS_HD',     160,        2,              1,                  'HDTechIcons_160.dds'),
    ('ICON_ATLAS_TECHS_HD_FOW', 42,         2,              1,                  'HDTechIcons_FOW_42.dds'),

    ('ICON_ATLAS_TECH_CIVIC_2_HD',     30,         2,              3,                  'HDTechCivic_2_30.dds'),
    ('ICON_ATLAS_TECH_CIVIC_2_HD',     38,         2,              3,                  'HDTechCivic_2_38.dds'),
    ('ICON_ATLAS_TECH_CIVIC_2_HD',     42,         2,              3,                  'HDTechCivic_2_42.dds'),
    ('ICON_ATLAS_TECH_CIVIC_2_HD',     128,        2,              3,                  'HDTechCivic_2_128.dds'),
    ('ICON_ATLAS_TECH_CIVIC_2_HD',     160,        2,              3,                  'HDTechCivic_2_160.dds'),
    ('ICON_ATLAS_TECH_CIVIC_2_HD_FOW', 42,         2,              3,                  'HDTechCivic_2_42.dds');

insert or replace into IconDefinitions
    (Name,                                              Atlas,                  'Index')
values
    -- Techs
    ('ICON_TECH_CALENDAR_HD',                           'ICON_ATLAS_TECHS_HD',      1),
    ('ICON_TECH_PAPER_MAKING_HD',                       'ICON_ATLAS_TECH_CIVIC_2_HD',        0),
    ('ICON_TECH_COMPASS_HD',                            'ICON_ATLAS_CIVICS',        21),
    ('ICON_TECH_PHYSICS_HD',                            'ICON_ATLAS_TECHS_HD',      0),
    ('ICON_TECH_BIOLOGY_HD',                            'ICON_ATLAS_CIVICS',        31),
    ('ICON_TECH_CIVIL_ENGINEERING_HD',                  'ICON_ATLAS_CIVICS',        28),
    -- FOW
    ('ICON_TECH_CALENDAR_HD_FOW',                       'ICON_ATLAS_TECHS_HD_FOW',  1),
    ('ICON_TECH_PAPER_MAKING_HD_FOW',                   'ICON_ATLAS_TECH_CIVIC_2_HD_FOW',    1),
    ('ICON_TECH_COMPASS_HD_FOW',                        'ICON_ATLAS_CIVICS_FOW',    21),
    ('ICON_TECH_PHYSICS_HD_FOW',                        'ICON_ATLAS_TECHS_HD_FOW',  0),
    ('ICON_TECH_BIOLOGY_HD_FOW',                        'ICON_ATLAS_CIVICS_FOW',    31),
    ('ICON_TECH_CIVIL_ENGINEERING_HD_FOW',              'ICON_ATLAS_CIVICS_FOW',    28),
    -- Civics
    ('ICON_CIVIC_EXPLORATION',                          'ICON_ATLAS_TECH_CIVIC_2_HD',     4),
    ('ICON_CIVIC_DEFENSIVE_TACTICS',                    'ICON_ATLAS_CIVICS_HD',     1),
    ('ICON_CIVIC_LITERARY_TRADITION_HD',                'ICON_ATLAS_CIVICS_HD',     4),
    ('ICON_CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',       'ICON_ATLAS_CIVICS_HD',     2),
    ('ICON_CIVIC_EVOLUTION_THEORY_HD',                  'ICON_ATLAS_TECH_CIVIC_2_HD',     2),
    ('ICON_CIVIC_HISTORICAL_PHILOSOPHY_HD',             'ICON_ATLAS_CIVICS_HD',     7),
    ('ICON_CIVIC_ETHICS_HD',                            'ICON_ATLAS_CIVICS_HD',     5),
    ('ICON_CIVIC_SOCIAL_SCIENCE_HD',                    'ICON_ATLAS_CIVICS_HD',     6),
    ('ICON_CIVIC_NATURAL_HISTORY',                      'ICON_ATLAS_CIVICS_HD',     3),
    -- FOW
    ('ICON_CIVIC_EXPLORATION_FOW',                      'ICON_ATLAS_TECH_CIVIC_2_HD_FOW',  5),
    ('ICON_CIVIC_DEFENSIVE_TACTICS_FOW',                'ICON_ATLAS_CIVICS_HD_FOW', 1),
    ('ICON_CIVIC_LITERARY_TRADITION_HD_FOW',            'ICON_ATLAS_CIVICS_HD_FOW', 4),
    ('ICON_CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD_FOW',   'ICON_ATLAS_CIVICS_HD_FOW', 2),
    ('ICON_CIVIC_EVOLUTION_THEORY_HD_FOW',              'ICON_ATLAS_TECH_CIVIC_2_HD_FOW',  3),
    ('ICON_CIVIC_HISTORICAL_PHILOSOPHY_HD_FOW',         'ICON_ATLAS_CIVICS_HD_FOW', 7),
    ('ICON_CIVIC_ETHICS_HD_FOW',                        'ICON_ATLAS_CIVICS_HD_FOW', 5),
    ('ICON_CIVIC_SOCIAL_SCIENCE_HD_FOW',                'ICON_ATLAS_CIVICS_HD_FOW', 6),
    ('ICON_CIVIC_NATURAL_HISTORY_FOW',                  'ICON_ATLAS_CIVICS_HD_FOW', 3);
