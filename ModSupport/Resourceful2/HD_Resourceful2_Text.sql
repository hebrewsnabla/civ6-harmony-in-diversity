--------------------------
-- Resourceful 2 by xhh --
--------------------------

-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                         Text)
values
    ("LOC_RESOURCE_POPPIES_NAME",                                 "Corn Poppies"),
    ("LOC_RESOURCE_WHALES_NAME",                                  "Sperm Whale"),
    ("LOC_RESOURCE_TOXINS_NAME",                                  "Poison Dart Frog"),
    ("LOC_RESOURCE_MEDIHERBS_NAME",                               "Dendrobium Officinale"),
    ("LOC_RESOURCE_BERRIES_NAME",                                 "Mulberry"),
    ("LOC_RESOURCE_LIMESTONE_NAME",                               "Dolomite"),
    ("LOC_RESOURCE_BARLEY_NAME",                                  "Highland Barley"),
    ("LOC_RESOURCE_STONE_NAME",                                   "Andesite"),
    ("LOC_RESOURCE_FISH_NAME",                                    "Chum Salmon"),
    ("LOC_IMPROVEMENT_LUMBER_MILL_HD_DESCRIPTION",                "Unlocks the Builder ability to construct a Lumber Mill.[NEWLINE][NEWLINE]+1 [ICON_Production] Production. Once Bronze Working is unlocked, extra +1 [ICON_Production] Production if adjacent to a River.[NEWLINE][NEWLINE]Can be built on Woods or valid Resources. If built on Luxury resources, the city will gain use of that Resource. +1 [ICON_Production] Production for each adjacent Industrial Zone District (except Hansa District). Once Guilds is unlocked it can also be built on Rainforest."),
    ("LOC_DISTRICT_IKANDA_HD_DESCRIPTION",                        "A district unique to Zulu which replaces the Encampment. Provides +1 [ICON_Housing] Housing. Once the Civic or Technology prerequisite is met, Corps and Armies can be built outright. Buildings in the Ikanda receive +2 [ICON_GOLD] Gold and +1 [ICON_SCIENCE] Science. Faster Corps and Army creation.[NEWLINE] +30% [ICON_PRODUCTION] Production towards Land Military Units. +2 [ICON_PRODUCTION] Production for improved [ICON_RESOURCE_STONE] Andesite, [ICON_RESOURCE_LIMESTONE] Dolomite, [ICON_RESOURCE_GRANITE] Granite, [ICON_RESOURCE_COPPER] Copper, [ICON_RESOURCE_TIN] Tin and [ICON_RESOURCE_LEAD] Lead resource in this city. -1 Appeal to adjacent tiles. +2 Influence points per turn. +1 [Icon_Science] Science for improved Strategic resources in the city. Accumulating Strategic resources in the city gain an additional +2 per turn."),
    ("LOC_DISTRICT_THANH_HD_DESCRIPTION",                         "A district unique to Vietnam which replaces the Encampment. +2 [ICON_CULTURE] Culture for each adjacent District. After Flight is researched receive [ICON_TOURISM] Tourism equal to the [ICON_CULTURE] Culture output. This District does not require population, is cheaper to build, cannot be built adjacent to the city center, and is not a Specialty district.[NEWLINE]One per city. +10% [ICON_PRODUCTION] Production towards Land Military Units. +2 [ICON_PRODUCTION] Production for improved [ICON_RESOURCE_STONE] Andesite, [ICON_RESOURCE_LIMESTONE] Dolomite, [ICON_RESOURCE_GRANITE] Granite, [ICON_RESOURCE_COPPER] Copper, [ICON_RESOURCE_TIN] Tin and [ICON_RESOURCE_LEAD] Lead resource in this city. +2 Influence points per turn. +1 [Icon_Science] Science for improved Strategic resources in the city. Accumulating Strategic resources in the city gain an additional +2 per turn."),
    ("LOC_DISTRICT_ENCAMPMENT_HD_DESCRIPTION",                    "A district in your city for military facilities.[NEWLINE] +10% [ICON_PRODUCTION] Production towards Land Military Units. +2 [ICON_PRODUCTION] Production for improved [ICON_RESOURCE_STONE] Andesite, [ICON_RESOURCE_LIMESTONE] Dolomite, [ICON_RESOURCE_GRANITE] Granite, [ICON_RESOURCE_COPPER] Copper, [ICON_RESOURCE_TIN] Tin and [ICON_RESOURCE_LEAD] Lead resource in this city. +2 Influence points per turn. +1 [Icon_Science] Science for improved Strategic resources in the city. Accumulating Strategic resources in the city gain an additional +2 per turn. -1 Appeal to adjacent tiles."),
    ("LOC_BUILDING_STONEHENGE_DESCRIPTION",                       "Grants a free [ICON_GreatProphet] Great Prophet. [ICON_GreatProphet] Great Prophets may found a Religion on Stonehenge instead of a Holy Site. Must be adjacent to [ICON_RESOURCE_STONE] Andesite and on flat land."),
    ("LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_DESCRIPTION",           "+2 [ICON_Production] Production towards Districts, Buildings and Wonders if this city owns Quarries, Mines or Lumber Mills over Luxury or Bonus resources.[NEWLINE][NEWLINE]May not be built in cities that already have a Karez or Boot Camp.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                         Text)
values
    ("zh_Hans_CN",  "LOC_RESOURCE_POPPIES_NAME",                                 "虞美人"),
    ("zh_Hans_CN",  "LOC_RESOURCE_SAKURA_NAME",                                  "樱桃木"),
    ("zh_Hans_CN",  "LOC_RESOURCE_WHALES_NAME",                                  "抹香鲸"),
    ("zh_Hans_CN",  "LOC_RESOURCE_LAPIS_NAME",                                   "青金石"),
    ("zh_Hans_CN",  "LOC_RESOURCE_TOXINS_NAME",                                  "箭毒蛙"),
    ("zh_Hans_CN",  "LOC_RESOURCE_ORCA_NAME",                                    "虎鲸"),
    ("zh_Hans_CN",  "LOC_RESOURCE_MEDIHERBS_NAME",                               "铁皮石斛"),
    ("zh_Hans_CN",  "LOC_RESOURCE_LEAD_NAME",                                    "铅锌矿"),
    ("zh_Hans_CN",  "LOC_RESOURCE_BERRIES_NAME",                                 "桑葚"),
    ("zh_Hans_CN",  "LOC_RESOURCE_BARLEY_NAME",                                  "青稞"),
    ("zh_Hans_CN",  "LOC_RESOURCE_LIMESTONE_NAME",                               "白云石"),
    ("zh_Hans_CN",  "LOC_RESOURCE_DATES_NAME",                                   "椰枣"),
    ("zh_Hans_CN",  "LOC_RESOURCE_STONE_NAME",                                   "安山岩"),
    ("zh_Hans_CN",  "LOC_RESOURCE_FISH_NAME",                                    "马哈鱼"),
    ("zh_Hans_CN",  "LOC_RESOURCE_COPPER_NAME",                                  "铜矿"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_LUMBER_MILL_HD_DESCRIPTION",                "解锁建造者建造伐木场的能力。[NEWLINE][NEWLINE]+1 [ICON_Production] 生产力。研究“铸铜术”科技后，若沿河，额外+1 [ICON_Production] 生产力。[NEWLINE][NEWLINE]只能在森林或有效资源上建造。如果建在奢侈品资源上，城市则可以利用该资源。每相邻1个工业区（商业同业公会除外）单元格，额外+1 [ICON_Production] 生产力。解锁“公会”市政后也能建造在雨林上。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_IKANDA_HD_DESCRIPTION",                        "祖鲁特色区域，替代“军营”。+1 [ICON_Housing] 住房。解锁相应的市政或科技后即可生产军团和军队。伊坎达中的建筑+2 [ICON_GOLD] 金币、+1 [ICON_SCIENCE] 科技值。创建军团和军队的价格变为标准价格的75%。[NEWLINE] 对陆地军事单位+30% 建造速度。此城中训练的所有抗骑兵单位+1 [ICON_Movement] 移动力。为本城已开发的 [ICON_RESOURCE_STONE] 安山岩、 [ICON_RESOURCE_LIMESTONE] 白云石、 [ICON_RESOURCE_GRANITE] 花岗岩、 [ICON_RESOURCE_COPPER] 铜矿、 [ICON_RESOURCE_TIN] 锡矿、 [ICON_RESOURCE_LEAD] 铅锌矿+1 [ICON_PRODUCTION] 生产力。提供+2影响力点数。本城改良的战略资源+1 [ICON_Science] 科技值，正确改良的战略每回合积累+2。为相邻单元格-1魅力。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_THANH_HD_DESCRIPTION",                         "越南特色区域，替代“军营”。每与1个区域相邻，则+2 [ICON_CULTURE] 文化值。研究完“飞行”科技后，将获得与 [ICON_CULTURE] 文化值产量相等的 [ICON_TOURISM] 旅游业绩。此区域不需要人口、建造花费更低、无法建在市中心周围，也并非专业化区域。[NEWLINE]每个城市只允许建造1个。对陆地军事单位+10%建造速度。为本城已开发的 [ICON_RESOURCE_STONE] 安山岩、 [ICON_RESOURCE_LIMESTONE] 白云石、 [ICON_RESOURCE_GRANITE] 花岗岩、 [ICON_RESOURCE_COPPER] 铜矿、 [ICON_RESOURCE_TIN] 锡矿、 [ICON_RESOURCE_LEAD] 铅锌矿+1 [ICON_PRODUCTION] 生产力。提供+2影响力点数。本城改良的战略资源+1 [ICON_Science] 科技值，正确改良的战略每回合积累+2。"),
    ("zh_Hans_CN",  "LOC_DISTRICT_ENCAMPMENT_HD_DESCRIPTION",                    "您城市里的军事机构区。[NEWLINE] 对陆地军事单位+10%建造速度。为本城的已开发的 [ICON_RESOURCE_STONE] 安山岩、 [ICON_RESOURCE_LIMESTONE] 白云石、 [ICON_RESOURCE_GRANITE] 花岗岩、 [ICON_RESOURCE_COPPER] 铜矿、 [ICON_RESOURCE_TIN] 锡矿、 [ICON_RESOURCE_LEAD] 铅锌矿+1 [ICON_PRODUCTION] 生产力。提供+2影响力点数。本城改良的战略资源+1 [ICON_Science] 科技值，正确改良的战略每回合积累+2。为相邻单元格-1魅力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_STONEHENGE_DESCRIPTION",                       "免费获得1个 [ICON_GreatProphet] 大预言家。 [ICON_GreatProphet] 大预言家可在巨石阵（代替圣地）创立一个宗教。必须建在靠近 [ICON_RESOURCE_STONE] 安山岩的平坦地形上。"),
    ("zh_Hans_CN",  "LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_DESCRIPTION",           "如果城市拥有改良奢侈或加成资源的矿山、采石场或伐木场，则额外建造区域、建筑和奇观时+2 [ICON_Production] 生产力。[NEWLINE][NEWLINE]无法建造在已有坎儿井或训练营的城市中。");

--------------------------------------------------------------------------------
update LocalizedText set Text = Text || " +1 [ICON_Production] Production to Lumber Mills over bonus resources in this city." where Language = 'en_US' and
    (Tag = 'LOC_DISTRICT_INDUSTRIAL_ZONE_HD_DESCRIPTION' or Tag = 'LOC_DISTRICT_HANSA_HD_DESCRIPTION' or Tag = 'LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION');
update LocalizedText set Text = Text || "为本城改良加成资源的伐木场+1 [ICON_Production] 生产力。" where Language = 'zh_Hans_CN' and
    (Tag = 'LOC_DISTRICT_INDUSTRIAL_ZONE_HD_DESCRIPTION' or Tag = 'LOC_DISTRICT_HANSA_HD_DESCRIPTION' or Tag = 'LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION');