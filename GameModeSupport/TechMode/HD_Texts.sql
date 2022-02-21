-- --------------------------------------------------------------------------------
-- -- Language: en_US
-- insert or replace into EnglishText
--     (Tag,                                                                     Text)
-- values
--     ("LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION",                                   "");
    
-- --------------------------------------------------------------------------------
-- -- Language: zh_Hans_CN
-- insert or replace into LocalizedText
--     (Language,      Tag,                                                                 Text)
-- values
--     ("zh_Hans_CN",  "LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION",                               "");
insert or replace into EnglishText
    (Tag,                                                       Text)
values
    ("LOC_IMPROVEMENT_PLANTATION_HD_DESCRIPTION",               "Unlocks the Builder ability to construct Plantations.[NEWLINE][NEWLINE]+2 [ICON_Gold] Gold. Once Irrigation is unlocked, extra +1 [ICON_Food] Food if adjacent to fresh water or Aqueduct District. (obsolete with Feudalism Civic). +2 [ICON_Gold] Gold for each adjacent Commercial Hub District. [NEWLINE][NEWLINE]Can only be built on valid resources. If built on Luxury resources, the city will gain use of that resource." ),
    ("LOC_TECH_MINING_HD_DESCRIPTION",                          "Allows chopping of Woods and Rainforest, and harvesting of resources improved by Mines."),
    ("LOC_TECH_BRONZE_WORKING_DESCRIPTION",                     "Reveals [ICON_RESOURCE_IRON] Iron."),
    ("LOC_CIVIC_CONSERVATION_HD_DESCRIPTION",                   "Awards 3 [ICON_Envoy] Envoys. Allows the building of National Parks and the purchase of Naturalists with [ICON_Faith] Faith. Woods in your territory that have never been removed (old-growth) gain +1 Appeal. Receives +1 [ICON_Amenities] Amenity when city center is adjacent to woods. Receive [ICON_TOURISM] Tourism from Walls."),
    ("LOC_CIVIC_GUILDS_HD_DESCRIPTION",                         "Lumber Mills and Camps can be built on Rainforest. Allows Builders to plant Woods (second-growth)."),
        ("LOC_TRAIT_CIVILIZATION_VIETNAM_DESCRIPTION",          "All Districts (except City Centers) do not remove Forest, Rainforest and Marsh. Receive the following yields for every building and Districts itself on these features: +2 [ICON_Production] Production in Forest, +2 [ICON_Food] Food in Rainforest and +2 [ICON_Science] in Marsh. Woods can be planted with the Mysticism civic.");
insert or replace into LocalizedText
    (Language,      Tag,                                            Text)
values
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_PLANTATION_HD_DESCRIPTION",    "解锁建造者建造种植园的能力。[NEWLINE][NEWLINE]+2 [ICON_Gold] 金币。研究“灌溉”科技后，拥有淡水或相邻蓄水池的种植园+1 [ICON_FOOD] 食物（封建后失效）。每相邻1个商业中心单元格则+2 [ICON_Gold] 金币。[NEWLINE][NEWLINE]只能在有效资源上建造。如果建在奢侈品资源上，城市则可以利用该资源。"),
    ("zh_Hans_CN",  "LOC_TECH_MINING_HD_DESCRIPTION",               "允许砍伐树林、雨林和收获由矿山改良的资源。"),
    ("zh_Hans_CN",  "LOC_TECH_BRONZE_WORKING_DESCRIPTION",          "显示 [ICON_RESOURCE_IRON] 铁资源。"),
    ("zh_Hans_CN",  "LOC_CIVIC_CONSERVATION_HD_DESCRIPTION",        "奖励3位 [ICON_Envoy] 使者。允许使用 [ICON_Faith] 信仰值建造国家公园和购买自然学家。您领土上从未被移除的树林（非人造林）获得+1魅力。市中心相邻森林的城市+1 [ICON_Amenities] 宜居度。从城墙获得 [ICON_TOURISM] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_CIVIC_GUILDS_HD_DESCRIPTION",              "允许在雨林上建造伐木场和营地。允许建造者植树造林（人造林）。"),
    ("zh_Hans_CN",  "LOC_TRAIT_CIVILIZATION_VIETNAM_DESCRIPTION",   "所有区域（除市中心外）不移除树林、雨林、沼泽地貌。建在这些区域中的建筑以及区域本体和奇观将获得以下收益：建在树林上提供+2 [ICON_Production] 生产力、建在雨林上提供+2 [ICON_Food] 食物、建在沼泽上提供+2 [ICON_Science] 科技值。拥有“神秘主义”市政后即可栽种树林。");