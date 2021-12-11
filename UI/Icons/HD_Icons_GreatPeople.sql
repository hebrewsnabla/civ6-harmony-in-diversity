insert or replace into IconTextureAtlases
    (Name,                                              IconSize,   IconsPerRow,    IconsPerColumn,     Filename)
values
    ('ICON_ATLAS_GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU',  160,        1,              1,                  'GreatPeople_ZhuangZhou_160.dds'),
    ('ICON_ATLAS_GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN',   160,        1,              1,                  'GreatPeople_SiNaQian_160.dds');

insert or replace into IconDefinitions
    (Name,                                              Atlas,                                              'Index')
values
    ('ICON_GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU',        'ICON_ATLAS_GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU',   0),
    ('ICON_GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN',         'ICON_ATLAS_GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN',    0);
