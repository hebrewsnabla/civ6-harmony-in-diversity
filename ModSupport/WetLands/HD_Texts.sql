--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                             Text)
values
    ("LOC_IMPROVEMENT_JNR_OASIS_FARM_DESCRIPTION",    "Unlocks the Builder ability to construct an Oasis Garden.[NEWLINE][NEWLINE]+1 [ICON_Culture] Culture. +1 [ICON_AMENITIES] Amenity. [NEWLINE]Can only be built on Oases."),
    ("LOC_IMPROVEMENT_JNR_REED_HOME_DESCRIPTION",     "Unlocks the Builder ability to construct a Reed Home.[NEWLINE][NEWLINE]+1 [ICON_Production] Production. Additional +1 [ICON_Production] Production from each adjacent Aqueduct District or Dam District. [NEWLINE][NEWLINE]Can only be built on Marsh or Swamp or Floodplains."),
    
    ("LOC_CIVIC_GUILDS_HD_DESCRIPTION",               "+1 [ICON_PRODUCTION] Production from the Camp improvement. +1 [ICON_Science] Science from the Reed Home improvement. Lumber Mills and Camps can be built on Rainforest. Allows Builders to plant Woods (second-growth)."),
    ("LOC_TECH_BIOLOGY_HD_DESCRIPTION",               "Farms provide +1 [ICON_Food] Food from every adjacent Farms instead of two.[NEWLINE]+1 [ICON_Science] Science from the Reed Home improvement. +1 [ICON_Culture] Culture from the Oasis Garden improvement."),
    ("LOC_TECH_BUTTRESS_DESCRIPTION",                 "+1 [ICON_Production] Production from the Reed Home improvement. +2 [ICON_Gold] Gold from the Oasis Garden improvement."),
    ("LOC_TECH_NANOTECHNOLOGY_DESCRIPTION",           "+1 [ICON_Production] Production from the Reed Home improvement."),
    ("LOC_CIVIC_GAMES_RECREATION_HD_DESCRIPTION",     "+1 [ICON_Science] Science from the Reed Home improvement."),
    ("LOC_TECH_SYNTHETIC_MATERIALS_HD_DESCRIPTION",   "+2 [ICON_Gold] Gold to Camps. +2 [ICON_Gold] Gold from the Oasis Garden improvement."),
    ("LOC_FEATURE_HD_SWAMP_NAME",                     "Swamp"),
    ("LOC_BELIEF_JNR_JINJA_DL_DESCRIPTION",           "Allows construction of Jinja (+8 [ICON_Faith] Faith; +2 [ICON_FOOD] Food for Forest tiles, +2 [ICON_PRODUCTION] Production for Rainforest tiles, +2 [ICON_CULTURE] Culture for Marsh tiles, and +2 [ICON_SCIENCE] Science for Swamp tiles in this city.)"),
    ("LOC_BUILDING_JNR_JINJA_DL_DESCRIPTION",         "+2 [ICON_FOOD] Food for Forest tiles, +2 [ICON_PRODUCTION] Production for Rainforest tiles, +2 [ICON_CULTURE] Culture for Marsh tiles, and +2 [ICON_SCIENCE] Science for Swamp tiles in this city."),
    ("LOC_BELIEF_HD_DRUID_DL_DESCRIPTION",            "Forest tiles provide +1 [ICON_Food] Food. Rainforest tiles provide +1 [ICON_Production] Production. Swamp tiles provide +1 [ICON_CULTURE] Culture and +2 [ICON_PRODUCTION] Production."),
    ("LOC_BUILDING_ETEMENANKI_DESCRIPTION",           "+2 [ICON_SCIENCE] Science and +1 [ICON_PRODUCTION] Production to all Marsh tiles in your empire. +2 [ICON_CULTURE] Culture and +1 [ICON_PRODUCTION] Production to all Swamp tiles in your empire. +1 [ICON_SCIENCE] Science and +1 [ICON_PRODUCTION] Production on all Floodplains tiles for this city.[NEWLINE][NEWLINE]Must be built on Floodplains or Marsh or Swamp."),
    ("LOC_BUILDING_MONT_ST_MICHEL_DESCRIPTION",       "All Apostles you create gain the Martyr ability in addition to a second ability you chose normally. Must be built on Floodplains or Marsh or Swamp."),
    ("LOC_TRAIT_CIVILIZATION_VIETNAM_DESCRIPTION",    "All Districts (except City Centers) do not remove Forest, Rainforest and Marsh. Receive the following yields for every building and Districts itself on these features: +2 [ICON_Production] Production in Forest, +2 [ICON_Food] Food in Rainforest, +2 [ICON_Science] Science in Marsh and +2 [ICON_Culture] Culture in Swamp. Woods can be planted with the Mysticism civic."),
    ("LOC_ABILITY_SCOUNT_IGNORE_ALL_HD_DESCRIPTION",  "Ignore the extra [ICON_Movement] Movement cost from Marsh or Swamp."),
	("LOC_IMPROVEMENT_GREAT_WALL_EXPANSION2_DESCRIPTION",		"Unlocks the Builder ability to construct the Great Wall, unique to China.[NEWLINE][NEWLINE]+1 [ICON_Food] Food, +2 [ICON_GOLD] Gold. Provides an increase to [ICON_Strength] Defense. Enemy military units get -2 [ICON_Strength] Strength for each adjacent Great Wall. +2 [ICON_Culture] Culture for each adjacent Great Wall. +2 [ICON_Gold] Gold for each adjacent Great Wall after researching 'Castles' Technology. Must be built in a line along the borders of your empire. Can be built on Mountain, Forest or Swamp tiles. Can only be pillaged (never destroyed) by natural disasters."),
	("LOC_IMPROVEMENT_MOAI_DESCRIPTION",						"Unlocks the Builder ability to construct a Moai.[NEWLINE][NEWLINE]+2 [ICON_Culture] Culture. +2 [ICON_Culture] Culture if on or adjacent to a Volcanic Soil. +1 [ICON_Culture] Culture if adjacent to Coast or Lake. +1 [ICON_Culture] Culture for every 2 adjacent Moai or for every adjacent Moai after progress 'Medieval Faires' Civic. Can be built on Plains, Plains Hills, Grassland, Grassland Hills, or Volcanic Soil. Cannot be built adjacent to Woods, Rainforest or Swamp tiles."),
	("LOC_SWAMP_FAITH",									"+{1_num} [ICON_FAITH] Faith from the adjacent Swamp {1_Num : plural 1?tile; other?tiles;}."),
	("LOC_TECH_IRRIGATION_DESCRIPTION",					"+2 [ICON_GOLD] Gold from Plantations adjacent to fresh water or Aqueduct.[NEWLINE]Allows clearing of Marsh and Swamp, and harvesting of resources improved by Plantations. Allows Builders to build Farms on Plains Hills or Grassland Hills adjacent to fresh water or Aqueduct.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                             Text)
values
    ("zh_Hans_CN",  "LOC_RESOURCE_JNR_PEAT_NAME",                    "泥炭"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_JNR_OASIS_FARM_NAME",           "绿洲花园"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_JNR_OASIS_FARM_DESCRIPTION",    "解锁建造者建造绿洲花园的能力。[NEWLINE][NEWLINE]+1 [ICON_Culture] 文化值，+1 [ICON_AMENITIES] 宜居度。每相邻1个剧院广场或社区单元格，额外+1 [ICON_Culture] 文化值。[NEWLINE]只可建造在绿洲上。"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_JNR_REED_HOME_NAME",            "芦苇屋"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_JNR_REED_HOME_DESCRIPTION",     "解锁建造者建造芦苇屋的能力。[NEWLINE][NEWLINE]+1 [ICON_Production] 生产力。每相邻1个水渠或堤坝单元格，额外+1 [ICON_Production] 生产力。[NEWLINE][NEWLINE]可建造在沼泽或泛滥平原上。"),
    
    -- ("zh_Hans_CN",  "LOC_CIVIC_GUILDS_HD_DESCRIPTION",               "营地+1 [ICON_production] 生产力。芦苇屋+1 [ICON_Science] 科技值。[newline]允许在雨林上建造伐木场和营地。[newline]允许建造者植树造林（人造林）。"),
    ("zh_Hans_CN",  "LOC_TECH_BIOLOGY_HD_DESCRIPTION",               "每与1个农场相邻，农场+1 [ICON_Food] 食物。[NEWLINE]芦苇屋+1 [ICON_Science] 科技值。绿洲花园+1 [ICON_Culture] 文化值。"),
    ("zh_Hans_CN",  "LOC_TECH_BUTTRESS_DESCRIPTION",                 "芦苇屋+1 [ICON_Production] 生产力。绿洲花园+2 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_TECH_NANOTECHNOLOGY_DESCRIPTION",           "芦苇屋+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_CIVIC_GAMES_RECREATION_HD_DESCRIPTION",     "芦苇屋+1 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_TECH_SYNTHETIC_MATERIALS_HD_DESCRIPTION",   "营地+2 [ICON_Gold] 金币。绿洲花园+2 [ICON_Gold] 金币。"),
    
    ("zh_Hans_CN",  "LOC_FEATURE_MARSH_NAME",                        "草本沼泽"),
    ("zh_Hans_CN",  "LOC_FEATURE_HD_SWAMP_NAME",                     "木本沼泽"),
    ("zh_Hans_CN",  "LOC_BELIEF_JNR_JINJA_DL_DESCRIPTION",           "允许建造神道教神社（+8 [ICON_Faith] 信仰值；本城的森林+2 [ICON_FOOD] 食物，雨林+2 [ICON_PRODUCTION] 生产力，草本沼泽+2 [ICON_CULTURE] 文化值，木本沼泽+2 [ICON_SCIENCE] 科技值。）"),
    ("zh_Hans_CN",  "LOC_BUILDING_JNR_JINJA_DL_DESCRIPTION",         "本城的森林+2 [ICON_FOOD] 食物，雨林+2 [ICON_PRODUCTION] 生产力，草本沼泽+2 [ICON_CULTURE] 文化值，木本沼泽+2 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_BELIEF_HD_DRUID_DL_DESCRIPTION",            "森林单元格+1 [ICON_Food] 粮食，雨林单元格+1 [ICON_Production] 生产力。木本沼泽单元格+2 [ICON_PRODUCTION] 生产力，+1 [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_BUILDING_ETEMENANKI_DESCRIPTION",           "帝国中的所有草本沼泽单元格+2 [ICON_SCIENCE] 科技值、+1 [ICON_PRODUCTION] 生产力，木本沼泽单元格+2 [ICON_CULTURE] 文化值、+1 [ICON_PRODUCTION] 生产力。此城市的所有泛滥平原单元格+1 [ICON_SCIENCE] 科技值、+1 [ICON_PRODUCTION] 生产力。[NEWLINE][NEWLINE]必须建在泛滥平原或沼泽上。"),
    ("zh_Hans_CN",  "LOC_TRAIT_CIVILIZATION_VIETNAM_DESCRIPTION",    "所有区域（除市中心外）不移除树林、雨林、沼泽地貌。建在这些区域中的建筑以及区域本体和奇观将获得以下收益：建在树林上提供+2 [ICON_Production] 生产力、建在雨林上提供+2 [ICON_Food] 食物、建在草本沼泽上提供+2 [ICON_Science] 科技值、建在木本沼泽上提供+2 [ICON_CULTURE] 文化值。拥有“神秘主义”市政后即可栽种树林。"),
	("zh_Hans_CN",	"LOC_IMPROVEMENT_GREAT_WALL_EXPANSION2_DESCRIPTION", 		"解锁建造者建造中国特色改良设施长城的能力。[NEWLINE][NEWLINE]+1 [ICON_Food] 食物，+2 [ICON_GOLD] 金币。提升 [ICON_Strength] 防御力。敌方军事单位每相邻一段长城-2 [ICON_Strength] 战斗力。每相邻1个长城+2 [ICON_Culture] 文化值。解锁“城堡”科技后，每相邻1个长城+2 [ICON_GOLD] 金币。必须沿着帝国的边界线建造。可以修建在山脉、树林和木本沼泽上。仅能被自然灾害掠夺（不会遭到破坏）。"),
	("zh_Hans_CN",	"LOC_IMPROVEMENT_MOAI_DESCRIPTION",							"解锁建造者建造摩艾石像的能力。[NEWLINE][NEWLINE]+2 [ICON_Culture] 文化值。在火山土上或与其相邻时+2 [ICON_Culture] 文化值。相邻湖泊或近海时+1 [ICON_Culture] 文化值。与每2个摩艾石像相邻+1 [ICON_Culture] 文化值，解锁“中世纪集市”后变为每与1个摩艾石像相邻。获得等同于 [ICON_Culture] 文化值产出的 [ICON_Tourism] 旅游业绩。只可建在平原、平原丘陵、草原、草原丘陵或火山土单元格之上。无法建在与树林、雨林或木本沼泽相邻的单元格上。"),
	("zh_Hans_CN",	"LOC_SWAMP_FAITH",									"+{1_num} [ICON_FAITH] 信仰值来自相邻的木本沼泽。");