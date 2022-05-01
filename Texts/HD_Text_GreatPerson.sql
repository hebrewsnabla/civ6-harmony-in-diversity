--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                 Text)
values
    ("LOC_GREATPERSON_CHARLES_DARWIN_ACTIVE",                             "Gain +1000 [ICON_Science] Science (on Standard speed) for each Natural Wonder tile here or adjacent."),
    ("LOC_GREATPERSON_GALILEO_GALILEI_ACTIVE",                            "Gain +400 [ICON_Science] Science (on Standard speed) for each adjacent Mountain tile."),
    ("LOC_GREAT_PERSON_GRANT_LOTSO_SCIENCE",                              "Gain +3000 [ICON_SCIENCE] Science and +1000 [ICON_CULTURE] Culture (on Standard speed)."),
    ("LOC_GREATPERSON_DIPLO_VISIBILITY",                                  "+{Amount} {Amount : plural 1?level; other?levels;} of diplomatic visibility with all other civilizations. Enemy Spy level reduced by 1 in your lands."),
    ("LOC_GREATPERSON_JAMES_WATT_ACTIVE",                                 "Industrial Zone's regional buildings reach {Amount} {Amount : plural 1?tile; other?tiles;} farther, and provide +3 [ICON_Science] Science."), -- Instantly builds a Factory and Workshop in this district. Factories provide +3 [ICON_Production] Production.
    ("LOC_PIERO_DE_BARDI_GOLD",                                           "Gain +300 [ICON_Gold] Gold."),
    ("LOC_JAKOB_FUGGER_GOLD",                                             "Gain +400 [ICON_Gold] Gold."),
    ("LOC_JOHN_JACOB_ASTOR_GOLD",                                         "Gain +600 [ICON_Gold] Gold."),
    ("LOC_ZHOU_DAGUAN_TOKENS",                                            "Gain +3 [ICON_Envoy] Envoys."),
    -- ("LOC_JOSEPH_PAXTON_REGIONAL_RANGE_BONUS",                            "This district's regional buildings reach 3 tiles farther."),
    -- ("LOC_TESLA_REGIONAL_RANGE_BONUS",                                    "This district's regional buildings reach 3 tiles farther."),
    ("LOC_ARYABHATA_CAMPUS_AMENITY",                                      "Chosen Campus provide +2 [ICON_AMENITIES] Amenities."),
    ("LOC_GREATPERSON_ALAN_TURING_ACTIVE",                                "Triggers the [ICON_TechBoosted] Eureka moment for Computers and 1 random technology from the Modern and Atomic era. If Computers is already boosted, instead complete the tech."),
    ("LOC_GREATPERSON_DMITRI_MENDELEEV_ACTIVE",                           "Reveals [ICON_RESOURCE_ALUMINUM] Aluminum without the normal technology requirement. Triggers the [ICON_TechBoosted] Eureka moment for Chemistry. If Chemistry is already boosted, instead complete the tech."),
    ("LOC_GREATPERSON_EUCLID_ACTIVE",                                     "Triggers the [ICON_TechBoosted] Eureka moment for Mathematics and 1 random technology from the Medieval era. If Mathematics is already boosted, instead complete the tech. Let this city build one more district than the population limit allows."),
    ("LOC_GREATPERSON_ISAAC_NEWTON_ACTIVE",                               "Instantly builds a University and Library in this district. Universities provide +4 [ICON_Science] Science."),
    ("LOC_GREATPERSON_JAMES_OF_ST_GEORGE_ACTIVE",                         "Instantly builds Ancient and Medieval Walls in this city. +1 Great Engineer point per turn for each level of wall."),
    ("LOC_GREAT_PERSON_HD_BOOST_OR_GRANT_PRINTING",                       "Triggers the [ICON_TechBoosted] Eureka moment for Printing. If Printing is already boosted, instead complete the tech."),
    ("LOC_GREATPERSON_2MODERNATOMICTECHBOOST",                            "Triggers the [ICON_TechBoosted] Eureka moment for {Amount} random {Amount : plural 1?technology; other?technologies;} from the Modern or Atomic era."),
    ("LOC_GREAT_PERSON_PLASTICS_TECHBOOST",                               "Triggers the [ICON_TechBoosted] Eureka moment for Plastic."),
    ("LOC_GREAT_PERSON_HD_BOOST_OR_GRANT_REFINING",                       "Triggers the [ICON_TechBoosted] Eureka moment for Refining. If Refining is already boosted, instead complete the tech."),
    ("LOC_GREAT_PERSON_HD_BOOST_OR_GRANT_SANITATION",                     "Triggers the [ICON_TechBoosted] Eureka moment for Sanitation. If Sanitation is already boosted, instead complete the tech."),
    ("LOC_GREATPERSON_NATIONAL_DISTRICT_SCIENCE_ADJACENCY_AS_TOURISM",    "All Districts you have built yield [ICON_TOURISM] Tourism equal to their adjacency bonus."),
    ("LOC_GREATPERSON_ELECTRICITY",                                       "Grants all Cities with +3 [ICON_POWER] Power from renewable water sources. +5% [ICON_Production] Production if this City is fully powered."),
    ("LOC_GREATPERSON_INDUSTRY_PRODUCTION_SCIENCE",                       "All Industrial Zone district's [ICON_Production] Production adjacency bonus provides [ICON_Science] Science as well."),
    ("LOC_GREATPERSON_NATIONAL_APPEAL",                                   "+1 Appeal to all tiles within your territoty. "),
    ("LOC_GREATPERSON_SINGLECITY_APPEAL",                                 "+2 Appeal to all tiles in this City. Wonder, Improvment and National Park in this City provide +100% [ICON_TOURISM] Tourism."),
    ("LOC_GREATPERSON_NATIONAL_APPEAL_BIG",                               "+2 Appeal to all tiles within your territory."),
    ("LOC_GREATPERSON_GPP_BOOST",                                         "Your Cities generate +25% Great Person points."),
    ("LOC_GREATPERSON_DISTRICT_CULTURE_BOMB",                             "Immediately complete target District (except Spaceport) in the city if the District is not completed. Culture Bomb adjacent tiles when completing such District in any city afterwards."),
    ("LOC_GREATPERSON_MIMAR_SINAN_ACTIVATION_HINT",                       "Must be on a District that is completed or under construction (except Spaceport). [COLOR_RED]If it does not work, try save and load.[ENDCOLOR]"),
    ("LOC_ARTEMISIA_LIGHTHOUSE",                                          "Instantly builds a Lighthouse in this district."),
    ("LOC_ARTEMISIA_LIGHTHOUSE_FOOD",                                     "Lighthouses provide +{Amount} [ICON_Food] Food."),
    ("LOC_GREATPERSON_GRANT_A_SETTLER",                                   "Grants a Settler."),
    ("LOC_GREATPERSON_LEIF_ERIKSON_EXPANSION2_ACTIVE",                    "+1 sight range for all naval units. Allows all Settlers and naval units to move over ocean tiles without the normal technology requirement."),
    ("LOC_GREATPERSON_NAVLA_RAIDER_BONUS",                                "Naval Raider units receive +2 [ICON_Strength] Combat Strength."),
    ("LOC_GREATPERSON_CHING_SHIH_EXPANSION2_ACTIVE",                      "Gain +500 [ICON_Gold] Gold (on Standard speed). Military units get +100% rewards for plundering sea [ICON_TradeRoute] Trade Routes."),
    ("LOC_HORATIO_NELSON_SHIPYARD_PRODUCTION",                            "Shipyards provide +{Amount} [ICON_Production] Production."),
    ("LOC_GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN",                   "Grants {Amount} [ICON_Production] Production towards wonder construction."),
    ("LOC_GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT",                    "Instantly builds a Seaport, Shipyard, and Lighthouse in this district."),
    ("LOC_GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING",            "Seaports provide +{Amount} [ICON_Housing] Housing."),
    ("LOC_GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT",          "+1 [Icon_Movement] Movement for all naval units."),
    ("LOC_GREATPERSON_CLANCY_FERNANDO_AMENITIES",                         "Harbors +{Amount} [ICON_Amenities] Amenity."),
    ("LOC_GREATPERSON_CHESTER_NIMITZ_EXPANSION2_ACTIVE",                  "Instantly creates a Aircraft Carrier unit with 1 promotion level. Grants 1 [ICON_RESOURCE_Oil] Oil per Turn. +20% [ICON_Production] Production towards Naval Raider units.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                 Text)
values
    ("zh_Hans_CN",  "LOC_GREATPERSON_CHARLES_DARWIN_ACTIVE",                             "在标准速度下，从此处或相邻的每个自然奇观单元格获得1000 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_GALILEO_GALILEI_ACTIVE",                            "在标准速度下，所在单元格每相邻一个山脉单元格获得400 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_GRANT_LOTSO_SCIENCE",                              "获得3000点 [ICON_SCIENCE] 科技值与1000点 [ICON_CULTURE] 文化值（标准速度下）。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_DIPLO_VISIBILITY",                                  "所有文明的外交能见度+{Amount} {Amount : plural 1?级; other?级;}。在您的领土内，敌方间谍等级降低1级。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_JAMES_WATT_ACTIVE",                                 "工业区内地区性建筑延伸3个单元格且+3 [ICON_Science] 科技值。"), --立即在该区域建造工厂和工作坊。工厂+3 [ICON_Production] 生产力。
    ("zh_Hans_CN",  "LOC_PIERO_DE_BARDI_GOLD",                                           "获得300 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_JAKOB_FUGGER_GOLD",                                             "获得400 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_JOHN_JACOB_ASTOR_GOLD",                                         "获得600 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_ZHOU_DAGUAN_TOKENS",                                            "获得3 [ICON_Envoy] 使者。"),
    -- ("zh_Hans_CN",  "LOC_JOSEPH_PAXTON_REGIONAL_RANGE_BONUS",                            "该区域的地区性建筑延伸3个单元格。"),
    -- ("zh_Hans_CN",  "LOC_TESLA_REGIONAL_RANGE_BONUS",                                    "该区域的地区性建筑延伸3个单元格。"),
    ("zh_Hans_CN",  "LOC_ARYABHATA_CAMPUS_AMENITY",                                      "选定的学院获得2点 [ICON_AMENITIES] 宜居度。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_ALAN_TURING_ACTIVE",                                "为电脑和现代或原子能时代的1个随机科技启动 [ICON_TechBoosted] 尤里卡时刻。若电脑尤里卡已被触发，则完成该科技。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_DMITRI_MENDELEEV_ACTIVE",                           "忽略普通科技要求，显示 [ICON_RESOURCE_ALUMINUM] 铝资源。为化学科技启动 [ICON_TechBoosted] 尤里卡时刻。若化学尤里卡已被触发，则完成该科技。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_EUCLID_ACTIVE",                                     "为数学和中世纪的1个随机科技启动 [ICON_TechBoosted] 尤里卡时刻。若数学尤里卡已被触发，则完成该科技。该城可无视人口限制，多建造一个区域。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_ISAAC_NEWTON_ACTIVE",                               "立即在该区域建造大学和图书馆。大学+4 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_JAMES_OF_ST_GEORGE_ACTIVE",                         "立即在本城建造远古和中世纪城墙。每级城墙每回合+1大工点。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_HD_BOOST_OR_GRANT_PRINTING",                       "为印刷术启动 [ICON_TechBoosted] 尤里卡时刻。若印刷术尤里卡已被触发，则完成该科技。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_2MODERNATOMICTECHBOOST",                            "为随机的{Amount}个现代或原子能时代{Amount : plural 1?科技; other?科技;}启动 [ICON_TechBoosted] 尤里卡时刻。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_PLASTICS_TECHBOOST",                               "为塑料启动 [ICON_TechBoosted] 尤里卡时刻。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_HD_BOOST_OR_GRANT_REFINING",                       "为精炼启动 [ICON_TechBoosted] 尤里卡时刻。若精炼已被触发，则完成该科技。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_HD_BOOST_OR_GRANT_SANITATION",                     "为卫生设备启动 [ICON_TechBoosted] 尤里卡时刻。若卫生设备已被触发，则完成该科技。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_NATIONAL_DISTRICT_SCIENCE_ADJACENCY_AS_TOURISM",    "激活时当前全国所有已建成的区域提供等于相邻加成的 [ICON_TOURISM] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_ELECTRICITY",                                       "向本文明所有城市提供+3点 [ICON_POWER] 电力，通电后额外为本城+5% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_INDUSTRY_PRODUCTION_SCIENCE",                       "所有工业区域的 [ICON_Production] 生产力相邻加成也提供 [ICON_Science] 科技值。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_NATIONAL_APPEAL",                                   "国境内的所有单元格+1魅力。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_SINGLECITY_APPEAL",                                 "本城+2魅力。本城来自奇观、改良设施和自然公园的业绩+100%。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_NATIONAL_APPEAL_BIG",                               "国境内的所有单元格+2魅力。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_GPP_BOOST",                                         "所有城市的伟人点积累速率+25%。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_OMAR_KHAYYAM_ACTIVE",                               "为两个中世纪或文艺复兴的随机科技启动 [ICON_TechBoosted] 尤里卡时刻，为中世纪和文艺复兴时期的一个随机市政启动 [ICON_CivicBoosted] 鼓舞时刻。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_DISTRICT_CULTURE_BOMB",                             "令该类型的区域获得文化炸弹的效果。若该区域未完成，则立刻完成该区域（宇航中心除外）。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_MIMAR_SINAN_ACTIVATION_HINT",                       "必须位于已完成或者正在建造的区域上（宇航中心除外）。[COLOR_RED]若未正常生效，请尝试存档后读档，若仍未生效，请在steam页面联系作者并提供存档。[ENDCOLOR]"),
    ("zh_Hans_CN",  "LOC_ARTEMISIA_LIGHTHOUSE",                                          "立即在该区域建造灯塔。"),
    ("zh_Hans_CN",  "LOC_ARTEMISIA_LIGHTHOUSE_FOOD",                                     "所有灯塔+{Amount} [ICON_Food] 食物。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_GRANT_A_SETTLER",                                   "获得一个开拓者。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_LEIF_ERIKSON_EXPANSION2_ACTIVE",                    "所有海军单位视野范围+1。所有海军单位与开拓者可在满足正常科技要求前进入海洋单元格。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_NAVLA_RAIDER_BONUS",                                "海军袭击者+2 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_CHING_SHIH_EXPANSION2_ACTIVE",                      "获得500 [ICON_Gold] 金币（标准速度下）。军事单位掠夺海上 [ICON_TradeRoute] 贸易路线时收益+100%。"),
    ("zh_Hans_CN",  "LOC_HORATIO_NELSON_SHIPYARD_PRODUCTION",                            "所有造船厂+{Amount} [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN",                   "为奇观建设赠予{Amount}点 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT",                    "立即在该区域建造码头、造船厂和灯塔。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING",            "所有码头+{Amount} [ICON_Housing] 住房。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT",          "所有海军单位+{Amount} [Icon_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_CLANCY_FERNANDO_AMENITIES",                         "所有港口+{Amount} [ICON_Amenities] 宜居度。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_CHESTER_NIMITZ_EXPANSION2_ACTIVE",                  "立即生产出拥有1次升级的航空母舰单位。每回合提供1点 [ICON_RESOURCE_Oil] 石油。生产海军突袭者类单位时+20% [ICON_Production] 生产力。");

--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                           Text)
values
    ("LOC_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES_NAME",             "Archimedes"),
    ("LOC_JNR_GREATPERSON_EUREKA_STRENGTH",                         "[ICON_TechBoosted] Eurekas provide 1% more progress."),
    ("LOC_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING_NAME",                "Li Bing"),
    ("LOC_JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS",                  "Can build Dam districts with Mathematics researched. +25% construction speed towards the Dam districts. Tiles next to a River yield +1 [ICON_PRODUCTION] Production for each Dam district in this City."),--Dams receive a [ICON_PRODUCTION] Production standard adjacency from districts
    ("LOC_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_NAME",                 "Ma Jun"),
    ("LOC_JNR_GREATPERSON_INDUSTRY_ZONE_RIVER_ADJACENCY",           "Standard adjacency bonus for Industrial Zones if next to a river."),
    ("LOC_JNR_GREATPERSON_TECH_MACHINERY",                          "Triggers [ICON_TechBoosted] Eureka for Machinery. If it is already boosted, complete the tech instead."),
    ("LOC_GREATPERSON_IMHOTEP_ACTIVE_JNR_UC",                       "Grants 55 [ICON_Production] Production (on Standard Speed) towards wonder construction, doubled if the wonder is from the Ancient or Classical Era."),
    ("LOC_GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU_NAME",   "Martine de Bertereau"),
    -- history
    ("LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES_CHAPTER_HISTORY_PARA_1", "Archimedes of Syracuse (c. 287 – c. 212 BC) was a Greek mathematician, physicist, engineer, astronomer, and inventor. Although few details of his life are known, he is regarded as one of the leading scientists in classical antiquity. Considered to be the greatest mathematician of ancient history, and one of the greatest of all time, Archimedes anticipated modern calculus and analysis by applying the concept of the infinitely small and the method of exhaustion to derive and rigorously prove a range of geometrical theorems, including: the area of a circle; the surface area and volume of a sphere; area of an ellipse; the area under a parabola; the volume of a segment of a paraboloid of revolution; the volume of a segment of a hyperboloid of revolution; and the area of a spiral."),
    ("LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES_CHAPTER_HISTORY_PARA_2", "His other mathematical achievements include deriving an accurate approximation of pi; defining and investigating the spiral that now bears his name; and devising a system using exponentiation for expressing very large numbers. He was also one of the first to apply mathematics to physical phenomena, founding hydrostatics and statics. Archimedes' achievements in this area include a proof of the principle of the lever, the widespread use of the concept of center of gravity, and the enunciation of the law of buoyancy. He is also credited with designing innovative machines, such as his screw pump, compound pulleys, and defensive war machines to protect his native Syracuse from invasion."),
    ("LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING_CHAPTER_HISTORY_PARA_1",   "Li Bing (Chinese: 李冰; pinyin: Lǐ Bīng; c. 3rd century BC) was a Chinese hydraulic engineer and official of the Warring States period. He served the state of Qin as an administrator and is revered for his work on the Dujiangyan River Control System, which both controlled flooding and provided irrigation water year-round, greatly increasing the productivity of the valley. Li Bing became a cultural icon, known as the vanquisher of the River God and is compared to the Great Yu."),
    ("LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING_CHAPTER_HISTORY_PARA_2",   "Dujiangyan is still in use today and is listed as a UNESCO World Heritage Site."),
    ("LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_CHAPTER_HISTORY_PARA_1",    "Ma Jun (fl. 220–265), courtesy name Deheng, was a Chinese mechanical engineer, inventor, and politician who lived in the state of Cao Wei during the Three Kingdoms period of China."),
    ("LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_CHAPTER_HISTORY_PARA_2",    "His most notable invention was that of the south-pointing chariot, a directional compass vehicle which actually had no magnetic function, but was operated by use of differential gears (which applies equal amount of torque to driving wheels rotating at different speeds). It is because of this revolutionary device (and other achievements) that Ma Jun is known as one of the most brilliant mechanical engineers and inventors of his day (alongside Zhang Heng of the earlier Eastern Han dynasty). The device was re-invented by many after Ma Jun, including the astronomer and mathematician Zu Chongzhi (429–500). In the later medieval dynastic periods, Ma Jun's south-pointing chariot was combined in a single device with the distance-measuring odometer."),
    ("LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_CHAPTER_HISTORY_PARA_3",    "One of Ma Jun's early inventions was an improved silk drawloom. He also invented a keel waterwheel to divert water from low to high ground; created a wheel-rotating stone firing machine that could continuously fire stones up to hundreds of paces; He once invented for the Wei emperor Cao Rui an intricate hydraulic-powered, mechanical-operated puppet theatre. Since then, Ma Jun has also modified the Zhuge crossbow, contributing to scientific development and technological progress.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                 Text)
values
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES_NAME",                  "阿基米德"),
    ("zh_Hans_CN",  "LOC_JNR_GREATPERSON_EUREKA_STRENGTH",                              "[ICON_TechBoosted] 尤里卡提供的科技值额外+1%。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING_NAME",                     "李冰"),
    ("zh_Hans_CN",  "LOC_JNR_GREATPERSON_DAM_UNLOCK_MATHEMATICS",                       "解锁科技“数学”即可建造堤坝。建造堤坝时加速25%，堤坝为所在城市的沿河地块+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_NAME",                      "马钧"),
    ("zh_Hans_CN",  "LOC_JNR_GREATPERSON_INDUSTRY_ZONE_RIVER_ADJACENCY",                "工业区若沿河可获得一份标准相邻加成。"),
    ("zh_Hans_CN",  "LOC_JNR_GREATPERSON_TECH_MACHINERY",                               "为机械科技启动 [ICON_TechBoosted] 尤里卡。 若已被触发，则完成该科技。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_IMHOTEP_ACTIVE_JNR_UC",                            "建造奇观时提供55点 [ICON_Production] 生产力，对于远古和古典时代的奇观加倍。"),
    -- ("zh_Hans_CN",  "LOC_GREATPERSON_JAMES_WATT_ACTIVE_JNR_UC",                         "此城所有与淡水源、水渠、堤坝以及运河相邻的单元格+1 [ICON_Production] 生产力。"), --JNR IZ EX
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_JNR_MARTINE_DE_BERTEREAU_NAME",        "玛蒂娜·德·贝尔特罗"),
    -- history
    ("zh_Hans_CN",  "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES_CHAPTER_HISTORY_PARA_1", "阿基米德（公元前287年—公元前212年），伟大的古希腊哲学家、百科式科学家、数学家、物理学家、力学家，静态力学和流体静力学的奠基人，并且享有“力学之父”的美称，阿基米德和高斯、牛顿并列为世界三大数学家。 阿基米德曾说过：“给我一个支点，我就能撬起整个地球。”"),
    ("zh_Hans_CN",  "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_ARCHIMEDES_CHAPTER_HISTORY_PARA_2", "阿基米德确立了静力学和流体静力学的基本原理。给出许多求几何图形重心，包括由一抛物线和其网平行弦线所围成图形的重心的方法。阿基米德证明物体在液体中所受浮力等于它所排开液体的重量，这一结果后被称为阿基米德原理。他还给出正抛物旋转体浮在液体中平衡稳定的判据。阿基米德发明的机械有引水用的水螺旋，能牵动满载大船的杠杆滑轮机械，能说明日食，月食现象的地球-月球-太阳运行模型。但他认为机械发明比纯数学低级，因而没写这方面的著作。阿基米德还采用不断分割法求椭球体、旋转抛物体等的体积，这种方法已具有积分计算的雏形。"),
    ("zh_Hans_CN",  "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING_CHAPTER_HISTORY_PARA_1",    "李冰（约公元前3世纪）是战国时代秦国水利工程专家。公元前256年—前251年被秦昭王任为蜀郡（今成都一带）郡守，任蜀郡郡守时他主持设计并建造了成都北部的都江堰，泄岷江洪水且用之于灌溉，为成都平原成为天府之国奠定了非常重要的基础。他在蜀郡还主持兴办了其他水利工程，并修筑桥梁，在广都主持开凿盐井等，为开发成都平原、发展农业生产作出了重大贡献。"),
    ("zh_Hans_CN",  "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_LI_BING_CHAPTER_HISTORY_PARA_2",    "都江堰至今仍在使用，并被列为联合国教科文组织的世界遗产地。"),
    ("zh_Hans_CN",  "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_CHAPTER_HISTORY_PARA_1",     "马钧，字德恒，三国时期魏国扶风（今陕西省兴平市）人，机械工程师、发明家和政治家。"),
    ("zh_Hans_CN",  "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_CHAPTER_HISTORY_PARA_2",     "他最引人注目的发明是指向南方的战车，这是一种定向罗盘车，实际上没有磁力功能，而是通过使用差动齿轮（对以不同速度旋转的驱动轮施加等量的扭矩）来操作。正是由于这一革命性的装置（以及其他成就），马钧被称为当时最杰出的机械工程师和发明家之一（与早期东汉的张衡齐名）。在马钧之后，许多人重新发明了这个装置，包括天文学家和数学家祖冲之（429-500）。在后来的中世纪王朝时期，马钧的指向南方的战车与测量距离的里程表合二为一。"),
    ("zh_Hans_CN",  "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN_CHAPTER_HISTORY_PARA_3",     "他还改进了当时操作笨重的织绫机；发明一种由低处向高地引水的龙骨水车；制作出一种轮转式发石机，能连续发射石块，远至数百步；把木制原动轮装于木偶下面，叫做“水转百戏图”。此后，马钧还改制了诸葛连弩，对科学发展和技术进步做出了贡献。");

--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                        Text)
values
    ("LOC_GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU_NAME",             "Zhuang Zhou"),
    ("LOC_GREATWORK_ZHUANG_ZHOU_1_NAME",                         "The Journey to Freedom"),
    ("LOC_GREATWORK_ZHUANG_ZHOU_1_QUOTE",                        "The supreme man has no self, the divine man has no merit, the sage has no name."),
    ("LOC_GREATWORK_ZHUANG_ZHOU_2_NAME",                         "The Essay on Qiwu"),
    ("LOC_GREATWORK_ZHUANG_ZHOU_2_QUOTE",                        "I wonder if Zhou's dream was of a butterfly? Is the dream of the butterfly Zhou's dream?"),
    ("LOC_GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN_NAME",              "Si Maqian"),
    ("LOC_GREATWORK_SI_MA_QIAN_1_NAME",                          "Shiji"),
    ("LOC_GREATWORK_SI_MA_QIAN_1_QUOTE",                         "All the world is bustling with profit."),
    ("LOC_GREATWORK_SI_MA_QIAN_2_NAME",                          "The Letter to Ren'an"),
    ("LOC_GREATWORK_SI_MA_QIAN_2_QUOTE",                         "To study the world of heaven and man, to understand the changes of the past and the present, and to form a family of words.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                             Text)
values
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_ZHUANG_ZHOU_NAME",                  "庄周"),
    ("zh_Hans_CN",  "LOC_GREATWORK_ZHUANG_ZHOU_1_NAME",                              "《逍遥游》"),
    ("zh_Hans_CN",  "LOC_GREATWORK_ZHUANG_ZHOU_1_QUOTE",                             "至人无己，神人无功，圣人无名。"),
    ("zh_Hans_CN",  "LOC_GREATWORK_ZHUANG_ZHOU_2_NAME",                              "《齐物论》"),
    ("zh_Hans_CN",  "LOC_GREATWORK_ZHUANG_ZHOU_2_QUOTE",                             "不知周之梦为胡蝶与？胡蝶之梦为周与？"),
    ("zh_Hans_CN",  "LOC_GREAT_PERSON_INDIVIDUAL_SI_MA_QIAN_NAME",                   "司马迁"),
    ("zh_Hans_CN",  "LOC_GREATWORK_SI_MA_QIAN_1_NAME",                               "《史记》"),
    ("zh_Hans_CN",  "LOC_GREATWORK_SI_MA_QIAN_1_QUOTE",                              "天下熙熙皆为利来，天下攘攘皆为利往。"),
    ("zh_Hans_CN",  "LOC_GREATWORK_SI_MA_QIAN_2_NAME",                               "《报任安书》"),
    ("zh_Hans_CN",  "LOC_GREATWORK_SI_MA_QIAN_2_QUOTE",                              "究天人之际，通古今之变，成一家之言。");

--大军改动 by先驱

-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                        Text)
values
    ("LOC_GREATPERSON_SUN_ZTU_ACTIVE",                           "All combat units gain +25% experience when attacking."),
    ("LOC_GREATPERSON_AETHELFLAED_ACTIVE",                       "Instantly builds a Barracks in this District. +3 [ICON_STRENGTH] Combat Strength when fighting Barbarians."),
    ("LOC_GREATPERSON_EL_CID_ACTIVE",                            "Forms a Corps out of a military land unit, and grants it 1 promotion level."),
    ("LOC_GREATPERSON_NAPOLEON_BONAPARTE_ACTIVE",                "Forms an Army out of a military land unit, and grants it 1 promotion level."),
    ("LOC_GREATPERSON_TIMUR_ACTIVE",                             "+1 [ICON_TRADEROUTE] Trade Route capacity. Grants a trader unit. "),
    ("LOC_GREATPERSON_GUSTAVUS_ADOLPHUS_ACTIVE",                 "Instantly creates a Bombard unit."),
    ("LOC_GREATPERSON_SIMON_BOLIVAR_ACTIVE",                     "Instantly creates a Cuirassier unit.");
    -- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                 Text)
values
    ("zh_Hans_CN",  "LOC_GREATPERSON_SUN_ZTU_ACTIVE",                                    "所有战斗单位的攻击经验+25%。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_AETHELFLAED_ACTIVE",                                "立即在该区域建造一座兵营。同蛮族战斗时，+3 [ICON_STRENGTH] 单位战斗力。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_EL_CID_ACTIVE",                                     "把一个军事陆地单位变成军团，并为该单位提供1次升级。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_NAPOLEON_BONAPARTE_ACTIVE",                         "把一个军事陆地单位变成军队，并为该单位提供1次升级。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_TIMUR_ACTIVE",                                      "增加1条 [ICON_TradeRoute] 贸易路线容量。获得一个商人单位。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_GUSTAVUS_ADOLPHUS_ACTIVE",                          "立即创建1个射石炮单位。"),
    ("zh_Hans_CN",  "LOC_GREATPERSON_SIMON_BOLIVAR_ACTIVE",                              "立即创建1个胸甲骑兵单位。");