--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                     Text)
values
    ("LOC_UNIT_MACHINE_GUN_DESCRIPTION",                                      "Atomic era Ranged unit."),
    ("LOC_UNIT_MORTAR_DESCRIPTION",                                           "Modern era Ranged unit."),
    ("LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION",                                 "Information era Siege unit. Cannot move and attack on the same turn unless player has Military Training Civic."),
    ("LOC_UNIT_SELF_PROPELLED_ARTILLERY_DESCRIPTION",                         "Atomic era Siege unit. Cannot move and attack on the same turn unless player has Military Training Civic.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                     Text)
values
    ("zh_Hans_CN",  "LOC_UNIT_MACHINE_GUN_DESCRIPTION",                                      "原子能时代远程单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_MORTAR_DESCRIPTION",                                           "现代远程单位。"),
    ("zh_Hans_CN",  "LOC_UNIT_ROCKET_ARTILLERY_DESCRIPTION",                                 "信息时代攻城单位。无法在一回合内移动并攻击（除非玩家已拥有军事训练市政）。"),
    ("zh_Hans_CN",  "LOC_UNIT_SELF_PROPELLED_ARTILLERY_DESCRIPTION",                         "原子能时代攻城单位。无法在一回合内移动并攻击（除非玩家已拥有军事训练市政）。");
