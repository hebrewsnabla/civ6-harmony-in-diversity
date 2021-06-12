--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                     Text)
values
    ("LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION",                                   "A district unique to Gaul that is cheaper than the district it replaces, the Industrial Zone. The Oppidum district is defensible with a ranged attack. When the first Oppidum is constructed the Metal Casting technology is unlocked.[NEWLINE][NEWLINE]+2 [ICON_Production] Production adjacency bonus from Quarries and strategic resources. -1 Appeal to adjacent tiles."),
    ("LOC_BOOST_TRIGGER_METAL_CASTING",                                       "Have the Military Training Civic."),
    ("LOC_BOOST_TRIGGER_LONGDESC_METAL_CASTING",                              "Weapons evolve along with Military training, more advanced ways of making weapons are emerging."),
    ("LOC_BOOST_TRIGGER_MILITARY_TACTICS",                                    "Earn a Great General."),
    ("LOC_BOOST_TRIGGER_LONGDESC_MILITARY_TACTICS",                           "The Great General brings about new military tactics.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                 Text)
values
    ("zh_Hans_CN",  "LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION",                               "高卢特色区域，替代“工业区”，建造花费更低。“奥皮杜姆”区域具有防御力且可执行远程攻击。建成此区域后，即可解锁“金属铸造”科技。[NEWLINE][NEWLINE]每与一个采石场改良设施或战略资源相邻，则+2 [ICON_Production] 生产力。为相邻单元格-1魅力。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_METAL_CASTING",                                   "拥有军事训练市政。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_METAL_CASTING",                          "军事训练推进着武器不断的革新，新式的武器铸造方式也孕育而生。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_MILITARY_TACTICS",                                "获得一位大将军。"),
    ("zh_Hans_CN",  "LOC_BOOST_TRIGGER_LONGDESC_MILITARY_TACTICS",                       "大将军带来了全新的军事战术的思考。");

-- Korea
--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                             Text)
values
    ("LOC_TRAIT_CIVILIZATION_THREE_KINGDOMS_DESCRIPTION",             "Receive + 1 [Icon_Governor] Governor Title each time when Seowon or building inside Seowon District is constructed in [ICON_Capital] Capital."),
    ("LOC_TRAIT_LEADER_HWARANG_DESCRIPTION",                          "+3 [ICON_Amenities] Amenities, +5 [Icon_Housing] Housing and +20 Loyalty per turn for cities that are capital or have assigned Governor. -2 [ICON_Amenities] Amenities, -20 Loyalty per turn and -50% of all yields for cities that is not capital and not have assigned Governors. +15% [ICON_Production] Production and +15% [ICON_FOOD] Food for Cities have Seowon. +50% [ICON_PRODUCTION] Production towards Districts and Buildings for cities have Library. +100% Districts Adjacency (of corresponding yields) to all Districts for Cities have University. Cities have Research Lab gain +10% of all yields and the citizen yield extra +1 of all yields."),
    ("LOC_DISTRICT_SEOWON_DESCRIPTION",                               "A district unique to Korea. Replaces the Campus. +4 [Icon_Science] Science. Have more citizen slots.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                             Text)
values
    ("zh_Hans_CN",  "LOC_TRAIT_CIVILIZATION_THREE_KINGDOMS_DESCRIPTION",             "首都每次建造完成书院区域或书院中的建筑时获得一个总督点。"),
    ("zh_Hans_CN",  "LOC_TRAIT_LEADER_HWARANG_DESCRIPTION",                          "首都或派遣了总督的城市获得+3 [ICON_Amenities] 宜居度，+5 [Icon_Housing] 住房和+20忠诚度。非首都且未派遣总督的城市-2 [ICON_Amenities] 宜居度，-8忠诚度，-50%全部产出。 有书院的城市+15% [ICON_Food] 食物和 [Icon_production] 生产力；有图书馆的城市建造区域和建筑 +50% [Icon_Production] 生产力；有大学的城市，所有区域对应产出类型的相邻加成+100%；有实验室的城市所有产出+10%且每个人口额外1点全部产出。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_SEOWON_DESCRIPTION",                               "朝鲜特色区域，代替学院。+4 [Icon_Science] 科技值。拥有更多的专家槽位。");
