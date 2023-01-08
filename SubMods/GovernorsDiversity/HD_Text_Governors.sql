--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                         Text)
values
    -- Reyna
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_NAME",                        "Trade Supervisorate"),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION_NAME",                     "Real Estate Developer"),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION_DESCRIPTION",              "[ICON_CITIZEN] Citizens in this city provide +3 [ICON_GOLD] Gold."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER_DESCRIPTION",                  "+100% adjacency bonuses to Commercial Hub and Harbor districts in the city. This city can built one more district than the [ICON_CITIZEN] population limit allows if having both a Commercial Hub and a Harbor."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT_DESCRIPTION",           "-20% cost when purchasing units in this city. Extra -20% cost when purchasing a Trader unit in this city."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_DESCRIPTION",                 "+3 [ICON_TRADEROUTE] Trade Route capacity. "),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_NAME",                           "Financial Centre"),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_DESCRIPTION",                    "City generates +8% [ICON_GOLD] Gold for each building in its Commercial and Harbor districts."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_NAME",                   "Multinational Corporations"),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",            "Each building in its Commercial and Harbor districts provides +6 [ICON_GOLD] Gold for international [ICON_TRADEROUTE] Trade Routes in this city."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION_CORP",       "Each building in its Commercial and Harbor districts provides +6 [ICON_GOLD] Gold for international [ICON_TRADEROUTE] Trade Routes in this city. [ICON_Greatwork_Product] Product provide +100% [ICON_Tourism] Tourism in this City after finishing the 'Capitalism' Civic."),
    ("LOC_CITY_GOLD_FROM_POPULATION",                                             "{Value : number +#.#;-#.#}from additional taxes"),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT_NAME",                  "Chancellor of the Exchequer"),
    -- Victor
    ("LOC_GOVERNOR_PROMOTION_REDOUBT_DESCRIPTION",                                "Establishes in 2 turns. The city cannot be put under siege. +5 [ICON_STRENGTH] City Defense. +30% Production speed toward Encampment districts, Harbor districts, and buildings for these districts."), -- Your other cities within 9 tiles gain +4 Loyalty per turn towards your civilization. 
    ("LOC_GOVERNOR_PROMOTION_GARRISON_COMMANDER_DESCRIPTION",                     "Units defending within the city's territory get +5 [ICON_Strength] Combat Strength. The city gains an additional [ICON_Ranged] Ranged Strike per turn. +100% building speed toward defensive buildings."),
    ("LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_NAME",                             "Logistics Supply"),
    ("LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_DESCRIPTION",                      "80% discount on Strategic Resource cost for units trained in the city. Properly improved Strategic resources in all cities gain an additional +2 per turn."),
    -- ("LOC_GOVERNOR_PROMOTION_EMBRASURE_DESCRIPTION",                              " "), -- Millitary Engineer trained in this city receive extra 2 charges. +100% [ICON_PRODUCTION] Production towards Millitary Engineer in this city.
    ("LOC_GOVERNOR_PROMOTION_CONSCRIPTION_NAME",                                  "Conscription"),
    ("LOC_GOVERNOR_PROMOTION_CONSCRIPTION_DESCRIPTION",                           "Military units trained in this city start with a free promotion (does not stack). Gain [ICON_SCIENCE] Science equal to 25% of the unit's cost when a non-civilian unit is created in this city."), -- All millitary units trained in this city receive extra +25% Combat Experience permanently.
    ("LOC_GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT_NAME",                           "Arms Race Proponent"), -- +100% production speed
    ("LOC_GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT_DESCRIPTION",                    "+100% production speed to Nuclear Armament projects in the city. +30% Production speed towards all millitary units (50% more bonus when producing Air units and GDRs)."),
    ("LOC_GOVERNOR_PROMOTION_COMMANDER_NAME",                                     "Commander"),
    ("LOC_GOVERNOR_PROMOTION_COMMANDER_DESCRIPTION",                              "+5 [ICON_Strength] Combat Strength for units within 9 tiles."),
    ("LOC_VICTOR_COMMANDER_STRENGTH_BUFF_PREVIEW_TEXT",                           "from Commander"),
    -- Bishop
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_BISHOP_DESCRIPTION",                        "Establishes in 3 turns. +100% Religious Pressure from the city. [ICON_Citizen] Citizens in the city produce +2 [ICON_FAITH] Faith."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR_NAME",                     "Sayyid"),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR_DESCRIPTION",              "Apostle, Missionary, Guru and Inquistor trained in the city have +1 [ICON_MOVEMENT] Movement and +1 Charge. Warrior Monk trained in the city have +1 [ICON_MOVEMENT] Movement."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS_NAME",                   "Justice by Faith"),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS_DESCRIPTION",            "All Holy Sites within 4 tiles of the city gain +100% adjacency bonuses, and yields [ICON_TOURISM] Tourism equal to their faith adjacency bonus."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD_NAME",                       "Divine Architect"),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD_DESCRIPTION",                "Allows the city to purchase Districts, Shrine and Temple with [ICON_FAITH] Faith. Allow the city to build one more district than the [ICON_Citizen] Population limit allows."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT_DESCRIPTION",                  "Apostles and Warrior Monks trained in the city receive 1 extra promotion when receiving their first one. Warrior Monks trained in the city have +5 [ICON_STRENGTH] Combat Strength and +100% Combat Experience."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT_DESCRIPTION",              "Relics in the city produce +300% [ICON_TOURISM] Tourism and +50% [ICON_FAITH] Faith."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT_NAME",                     "Oecumenical Patriarch"),
    -- Magnus
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS_DESCRIPTION",     "+20% Growth in the city. Domestic [ICON_TradeRoute] Trade Routes ending here provide +4 [ICON_Food] Food to their starting city."), 
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER_NAME",                "Ground Breaker"),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER_DESCRIPTION",         "+50% construction speed when constructing Districts and buildings in the city. Allow the city to build one more district than the [ICON_Citizen] Population limit allows."),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER_NAME",              "Agricultural Overseer"), -- Quan'Nong
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER_DESCRIPTION",       "+15% [ICON_Food] Food and +15% [ICON_Production] Production in the city."),
    ("LOC_BUILDING_DUMMY_MAGNUS_NAME",                                            "Elected Officer Magnus"),
    ("LOC_BUILDING_DUMMY_MAGNUS_DESCRIPTION",                                     "Created when Governor Magnus with the Elected Officer title establishes within 9 tiles."),
    ("LOC_BUILDING_DUMMY_NO_MAGNUS_NAME",                                         "PlaceHolder"),
    ("LOC_BUILDING_DUMMY_NO_MAGNUS_DESCRIPTION",                                  "Please Ignore"),
    ("LOC_BUILDING_CONSTRUCT_REQUIRES_BUILDING_WITHOUT_SUFFIX",                   "This building requires {1_Building}."),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_NAME",                "Elected Officer"),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_DESCRIPTION",         "Government Plaza in this city provides +1 [ICON_Food] Food, +1 [ICON_Production] Production, +1 [ICON_Science] Science and +1 [ICON_Culture] Culture to all cities within 8 tiles of the Government Plaza. This bonus is doubled for each building in the Government Plaza."),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_VIETNAM_DESCRIPTION", "Government Plaza in this city provides +1 [ICON_Food] Food and +1 [ICON_Production] Production to all cities within 8 tiles of the Government Plaza. Diplomatic Quater in this city provides +1 [ICON_Science] Science and +1 [ICON_Culture] Culture to all cities within 8 tiles of the Diplomatic Quater. These bonuses is doubled for each building in the corresponding district."),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION_DESCRIPTION",  "The city receives the Regional effects bonuses from all nearby buildings (not just from the first one)."),
    -- Liang
    ("LOC_GOVERNOR_PROMOTION_AQUACULTURE_NAME",                                   "Rural Planning"),
    ("LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_NAME",                           "Architecture Master"),
    ("LOC_GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE_NAME",                     "Infrastructure"),
    ("LOC_GOVERNOR_PROMOTION_WATER_WORKS_NAME",                                   "Paradise"),
    ("LOC_GOVERNOR_PROMOTION_BUILDER_GUILDMASTER_DESCRIPTION",                    "All Builders trained in the city get +1 build charge and +1 [ICON_Movement] Movement."),
    ("LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_DESCRIPTION",                    "The city gets +20% production speed towards Wonders. When a Wonder is completed in the city, gain Great Engineer points equal to 20% of the cost."),
    ("LOC_GOVERNOR_PROMOTION_AQUACULTURE_DESCRIPTION",                            "Improved tiles in the City have +1 [ICON_Production] Production. Each [ICON_Citizen] Citizen in the city provides +0.5 [ICON_PRODUCTION] Production."), -- +1 [ICON_Food] Food and 
    ("LOC_GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE_DESCRIPTION",              "The city's improvements, buildings, and Districts cannot be damaged by Environmental Effects. +100% Districts adjacency yields in the city"),
    ("LOC_GOVERNOR_PROMOTION_WATER_WORKS_DESCRIPTION",                            "All improvements and National parks in the city provide +200% extra [ICON_TOURISM] Tourism. Allows you to construct the City Park improvement across your nation when the 'Urbanization Civic' is unlocked."),
    ("LOC_GOVERNOR_PROMOTION_PARKS_RECREATION_DESCRIPTION",                       "Can construct the City Park improvement in this city. Provides +1 [ICON_Culture] Culture, and adjacent tiles receive +2 Appeal. Cannot be placed adjacent to another City Park. When Liang is established in the city, City Parks provide +1 of all yields to all adjacent tiles."), -- (unlocked by Games and Recreation civic) 
    -- Amani
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY_DESCRIPTION",                    "+2 Spy capacity. If established in your city, can use [ICON_FAITH] Faith to purchase Spy and -50% purchase cost when purchasing Spy in the city. Spys trained in the city start with a free promotion."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_MESSENGER_DESCRIPTION",                   "Can be assigned to a city-state, where she acts as 2 [ICON_Envoy] Envoys. Can also be assigned to other Civ' s [ICON_CAPITAL] Capital."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY_NAME",                           "Alamut"),
    ("LOC_GOVERNOR_PROMOTION_LOCAL_INFORMANTS_NAME",                              "Disguise"),
    ("LOC_GOVERNOR_PROMOTION_LOCAL_INFORMANTS_DESCRIPTION",                       "All Spies act as +2 level and Spy operations take 25% less time."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR_DESCRIPTION",            "Immediately sends one [ICON_Envoy] Envoy to all city-states that you've already met. Each Suzerainty will provide +1 [ICON_SCIENCE] Science, +1 [ICON_CULTURE] Culture, +1 [ICON_FAITH] Faith and +1 [ICON_GOLD] Gold."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_PUPPETEER_DESCRIPTION",                   "While established in a city-state, doubles the number of [ICON_Envoy] Envoys you have there. Enemy Spy level reduced by 2 in your lands. Your Spy level is increased by 2 for all offensive operations."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR_NAME",                   "Pay Tribute"),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_NAME",                          "Foreign Investor"),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_DESCRIPTION",                   "City-state units gain +4 [ICON_Strength] Combat Strength if you are its Suzerain (including Leveraged Units) and cost 20% less [ICON_GOLD] Gold to levy troops. Amani now acts as 3 [ICON_Envoy] envoys (instead of 2). When established in a city-state, provide you with its Strategic and Luxury resources, doubled if you are its Suzerain."),
    ("GOV_CITYSTATES_LEVIED_COMBAT_STRENGTH_DESCRIPTION",                         "+4，from Governor's Promotion"),
    ("GOV_CITYSTATES_COMBAT_STRENGTH_DESCRIPTION",                                "+4，from Governor's Promotion"),
    -- Pingala
    ("LOC_GOVERNOR_PROMOTION_EDUCATOR_LIBRARIAN_DESCRIPTION",                     "20% increase in [ICON_Science] Science and [ICON_Culture] Culture generated by the city."),
    ("LOC_GOVERNOR_PROMOTION_EDUCATOR_CONNOISSEUR_DESCRIPTION",                   "+1.2 [ICON_CULTURE] Culture per turn for each [ICON_Citizen] Citizen in the city."),
    ("LOC_GOVERNOR_PROMOTION_EDUCATOR_RESEARCHER_DESCRIPTION",                    "+1.2 [ICON_SCIENCE] Science per turn for each [ICON_Citizen] Citizen in the city."),
    ("LOC_GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE_NAME",                     "Science and Education"),
    ("LOC_GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE_DESCRIPTION_HD",           "Each building in Campus district provides +5 [ICON_SCIENCE] Science. City generates +10% [ICON_Science] Science for each building in its Campus districts. {LOC_GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE_DESCRIPTION}"),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_CURATOR_DESCRIPTION",                       "+200% [ICON_Tourism] Tourism from Great Works of Art, Artifact, Music, and Writing in the city."),
    -- Ibrahim
    ("LOC_COMBAT_PREVIEW_CITY_GOVERNOR_ATTACK_DISTRICT_COMBAT_BONUS",             "+{1_Amount} Pasha"),
    ("LOC_GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH_MODIFIER_PREVIEW_TEXT",           "+{1_Amount} Grand Visier"),
    ("LOC_GOVERNOR_PROMOTION_PASHA_DESCRIPTION",                                  "Each [ICON_Citizen] Citizen in the city provides +1 [ICON_PRODUCTION] Production. Gain [ICON_SCIENCE] Science equal to 25% of the unit's cost when a non-civilian unit is trained in this city. Establishes in 3 turns."),
    ("LOC_GOVERNOR_PROMOTION_HEAD_FALCONER_DESCRIPTION",                          "+30% production speed toward Encampment buildings in this city. +3 [ICON_SCIENCE] Science for each Encampment and Encampment building in this city."),
    ("LOC_GOVERNOR_PROMOTION_SERASKER_DESCRIPTION",                               "Units within 10 tiles of the City Center get +10 [ICON_STRENGTH] Combat Strength when attacking defensible districts."),
    ("LOC_GOVERNOR_PROMOTION_KHASS_ODA_BASHI_DESCRIPTION",                        "When established in a foreign [ICON_Capital] Capital, [ICON_STAT_GRIEVANCE] Grievances from the city owner against you are reduced by 5 more per turn; none of the owner's cities exert Loyalty pressure on your cities."),
    ("LOC_GOVERNOR_PROMOTION_CAPOU_AGHA_DESCRIPTION",                             "+20% [ICON_Production] Production towards military units in the city. Receive a copy of unit each time you train a Renaissance era or later melee/siege unit."),
    ("LOC_GOVERNOR_PROMOTION_GRAND_VISIER_DESCRIPTION",                           "+5 [ICON_Strength] Combat Strength when fighting your and your allies' enemy.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                         Text)
values
    -- 瑞纳
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_NAME",                        "市舶榷务"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION_NAME",                     "地产商人"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION_DESCRIPTION",              "此城每 [ICON_CITIZEN] 人口产出3 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER_DESCRIPTION",                  "此城的商业中心和港口的相邻加成+100%。如果此城有商业中心和港口，可以无视 [ICON_CITIZEN] 人口数量限制额外建造一个区域。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT_DESCRIPTION",           "在此城中购买单位时-20%花费，购买商人时额外-20%花费。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_DESCRIPTION",                 "+3 [ICON_TRADEROUTE] 贸易路线容量。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_NAME",                           "金融中心"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_DESCRIPTION",                    "城市中每有一座商业中心建筑或港口建筑，[ICON_GOLD] 金币产出便+8%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_NAME",                   "跨国公司"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",            "城市中每有一座商业中心建筑或港口建筑，从此城开始的国际 [ICON_TRADEROUTE] 贸易路线 +6 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION_CORP",       "城市中每有一座商业中心建筑或港口建筑，从此城开始的国际 [ICON_TRADEROUTE] 贸易路线 +6 [ICON_GOLD] 金币。研究资本主义市政后此城的 [ICON_GreatWork_Product] 产品提供的 [ICON_Tourism] 旅游业绩+100%。"),
    ("zh_Hans_CN",  "LOC_CITY_GOLD_FROM_POPULATION",                                             "{Value : number +#.#;-#.#}来自额外税收"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT_NAME",                  "财政大臣"),
    -- 维克多
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_REDOUBT_DESCRIPTION",                                "2回合就职。就职城市无法被围攻，城市防御+5 [ICON_STRENGTH] 战斗力。建造军营、港口和这些区域中的建筑时加速30%。"), -- 您在9个单元格内的其他城市每回合获得对您文明的4点忠诚度
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_GARRISON_COMMANDER_DESCRIPTION",                     "城市领土内的单位防御时可+5 [ICON_Strength] 战斗力。城市每回合获得一次额外的 [ICON_Ranged] 远程攻击机会。建造防御性建筑时加速100%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_NAME",                             "后勤补给"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_DESCRIPTION",                      "就职城市生产单位所需的一次性战略资源花费减少80%。在任意城市就职时，全国所有被正确改良的战略资源每回合积累+2。"),
    -- ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_EMBRASURE_DESCRIPTION",                              ""), --本城生产的军事工程师次数+2，且生产军事工程师时+100% [ICON_PRODUCTION] 生产力。
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CONSCRIPTION_NAME",                                  "征兵入伍"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CONSCRIPTION_DESCRIPTION",                           "此城中生产的所有军事单位若初始未拥有免费晋升，则其初始可获得免费晋升。非平民单位在就职城市中创建时，获得等同于单位花费25%的 [ICON_SCIENCE] 科技值。"), --本城训练的所有军事单位获得永久+25%战斗经验值。
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT_NAME",                           "军备竞赛倡导者"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT_DESCRIPTION",                    "在城市中进行核武器项目时加速100%。本城生产所有军事单位时加速+30%，生产空中单位和末日机甲时额外加速50%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_COMMANDER_NAME",                                     "指挥官"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_COMMANDER_DESCRIPTION",                              "9个单元格内的单位+5 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_VICTOR_COMMANDER_STRENGTH_BUFF_PREVIEW_TEXT",                           "来自指挥官"),
    -- 主教
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_BISHOP_DESCRIPTION",                        "此城对相邻城市释放的宗教压力强度加倍。每个公民产出2 [ICON_FAITH] 信仰。就职需要3回合。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR_NAME",                     "赛义德"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR_DESCRIPTION",              "此城训练的使徒、传教士、上师、审判+1 [ICON_MOVEMENT] 移动力，+1使用次数。此城训练的武僧+1 [ICON_MOVEMENT] 移动力。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS_NAME",                   "因信称义"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS_DESCRIPTION",            "距离就职城市市中心4个单元格内的圣地的相邻加成+100%，并获得等于其相邻加成的[ICON_TOURISM] 旅游业绩产出。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD_NAME",                       "神圣建筑师"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD_DESCRIPTION",                "城市可使用 [ICON_FAITH] 信仰值购买区域、神社和寺庙。该城市可无视 [ICON_Citizen] 人口数量限制再建造一个区域。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT_DESCRIPTION",                  "此城中生产的使徒和武僧首次升级时将额外获得1次升级。本城训练的武僧永久+5 [ICON_STRENGTH] 战斗力和+100% 战斗经验值。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT_DESCRIPTION",              "本城遗物+300% [ICON_TOURISM] 旅游业绩产出和+50% [ICON_FAITH] 信仰值产出。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT_NAME",                     "普世牧首"),
    -- 老马
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS_DESCRIPTION",     "城市的 [ICON_Food] 增长+20%。以此处为终点的 [ICON_TradeRoute] 贸易路线（属于玩家）为起源城市+4 [ICON_Food] 食物。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER_NAME",                "大兴土木"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER_DESCRIPTION",         "在城市中建造区域和建筑时加速50%。该城市可无视 [ICON_Citizen] 人口数量限制再建造一个区域。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER_NAME",              "督农制"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER_DESCRIPTION",       "城市的 [ICON_Food] 食物和 [ICON_Production] 生产力+15%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_DUMMY_MAGNUS_NAME",                                            "总务官马格努斯"),
    ("zh_Hans_CN",  "LOC_BUILDING_DUMMY_MAGNUS_DESCRIPTION",                                     "当拥有总务官头衔的马格努斯总督在9环内就职时会自动创建。"),
    ("zh_Hans_CN",  "LOC_BUILDING_DUMMY_NO_MAGNUS_NAME",                                         "请忽略"),
    ("zh_Hans_CN",  "LOC_BUILDING_DUMMY_NO_MAGNUS_DESCRIPTION",                                  "请忽略"),
    ("zh_Hans_CN",  "LOC_BUILDING_CONSTRUCT_REQUIRES_BUILDING_WITHOUT_SUFFIX",                   "该建筑需要{1_Building}。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_NAME",                "总务官"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_DESCRIPTION",         "就职的城市中的市政广场为市政广场8个单元格内的城市提供+1 [ICON_Food] 食物、+1 [ICON_Production] 生产力、+1 [ICON_Science] 科技值和+1 [ICON_Culture] 文化值。市政广场中每有一个建筑，该加成便翻一次倍。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_VIETNAM_DESCRIPTION", "就职的城市中的市政广场为市政广场8个单元格内的城市提供+1 [ICON_Food] 食物和+1 [ICON_Production] 生产力。外交区为外交区8个单元格内的城市提供 +1 [ICON_Science] 科技值和+1 [ICON_Culture] 文化值。这些区域中每有一个建筑，该区域提供的加成便翻一次倍。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION_DESCRIPTION",  "此城从附近所有建筑获得辐射加成，而不是仅限首个建筑。"),
    -- 梁
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AQUACULTURE_NAME",                                   "乡村规划"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_NAME",                           "建筑大师"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE_NAME",                     "基础设施"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_WATER_WORKS_NAME",                                   "世外天堂"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_BUILDER_GUILDMASTER_DESCRIPTION",                    "城市中生产的所有建造者+1建造次数，+1 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_DESCRIPTION",                    "城市在建造奇观时加速20%。此城市建成奇观后获得等同于其生产力20%的大工程师点数。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AQUACULTURE_DESCRIPTION",                            "本城已改良单元格+1 [ICON_Production] 生产力。城市中每位 [ICON_Citizen] 公民提供+0.5 [ICON_PRODUCTION] 生产力。"), -- +1 [ICON_Food] 食物、
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE_DESCRIPTION",              "环境效应无法对此城市的改良设施、建筑与区域造成伤害。本城所有区域的相邻产出+100%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_WATER_WORKS_DESCRIPTION",                            "本城所有改良设施和国家公园+200% [ICON_TOURISM] 旅游业绩。解锁“城市化”后可在全国修建“市立公园”。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_PARKS_RECREATION_DESCRIPTION",                       "可在城市中修建特色改良设施“市立公园”。产出1 [ICON_Culture] 文化值，为相邻单元格+2魅力。无法建在另一个市立公园旁。总督梁在此城市就职时，市立公园为每个相邻单元格提供+1所有产出。"), -- （由游戏与娱乐市政解锁）
    -- 阿玛尼
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY_DESCRIPTION",                    "+2间谍容量。在我方城市就职时，在此城中可使用 [ICON_FAITH] 信仰购买间谍且购买间谍的花费减少50%，此城生产的间谍可免费升级为探员。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_MESSENGER_DESCRIPTION",                   "在我方城市就职时，影响力点数每回合+5。可派遣至城邦，效力等同于2名 [ICON_Envoy] 使者。也可被派到其他文明的 [ICON_CAPITAL] 首都。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY_NAME",                           "鹰巢"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_LOCAL_INFORMANTS_NAME",                              "伪装"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_LOCAL_INFORMANTS_DESCRIPTION",                       "就职时使我方间谍出击时+2级成功率，执行任务的时间缩短25%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR_DESCRIPTION",            "立即给每个已相遇城邦+1 [ICON_Envoy] 使者。每个宗主的城邦提供+1 [ICON_SCIENCE] 科技，+1 [ICON_CULTURE] 文化，+1 [ICON_FAITH] 信仰和+1 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_PUPPETEER_DESCRIPTION",                   "就职时使我方间谍出击时+2级成功率，领土内的敌方间谍下降2级。派遣到城邦后使当地的 [ICON_Envoy] 使者数量加倍。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR_NAME",                   "朝贡"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_NAME",                          "外国投资者"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_DESCRIPTION",                   "就职时使所有宗主的城邦其单位+4 [ICON_Strength] 战斗力（包括征召单位），征兵花费 [ICON_GOLD] 金币-20%。派遣至城邦时，效力等同于3名 [ICON_Envoy] 使者，可获得其奢侈和战略（宗主时翻倍）。"),
    ("zh_Hans_CN",  "GOV_CITYSTATES_LEVIED_COMBAT_STRENGTH_DESCRIPTION",                         "+4，来自总督晋升"),
    ("zh_Hans_CN",  "GOV_CITYSTATES_COMBAT_STRENGTH_DESCRIPTION",                                "+4，来自总督晋升"),
    -- 平伽拉
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_EDUCATOR_LIBRARIAN_DESCRIPTION",                     "城市每回合产出的 [ICON_Science] 科技值和 [ICON_Culture] 文化值+20%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_EDUCATOR_CONNOISSEUR_DESCRIPTION",                   "城市中每位 [ICON_Citizen] 公民 +1.2 [ICON_CULTURE] 文化值产出。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_EDUCATOR_RESEARCHER_DESCRIPTION",                    "城市中每位 [ICON_Citizen] 公民 +1.2 [ICON_SCIENCE] 科技值产出。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE_NAME",                     "科教兴国"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE_DESCRIPTION_HD",           "城市中每座学院建筑提供 +5 [ICON_SCIENCE] 科技值，并为城市每回合产出的 [ICON_Science] 科技值+10%。{LOC_GOVERNOR_PROMOTION_EDUCATOR_SPACE_INITIATIVE_DESCRIPTION}"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_CURATOR_DESCRIPTION",                       "城市中艺术、文物、音乐和著作巨作提供的 [ICON_Tourism] 旅游业绩+200%。"),
    -- 易卜拉欣
    ("zh_Hans_CN",  "LOC_COMBAT_PREVIEW_CITY_GOVERNOR_ATTACK_DISTRICT_COMBAT_BONUS",             "+{1_Amount} 帕夏"),
    ("zh_Hans_CN",  "LOC_GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH_MODIFIER_PREVIEW_TEXT",           "+{1_Amount} 大维齐尔"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_PASHA_DESCRIPTION",                                  "城市中每位 [ICON_Citizen] 公民提供+1 [ICON_PRODUCTION] 生产力。生产非平民单位时，获得等同于单位花费25%的 [ICON_SCIENCE] 科技值。就职需要3回合。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_HEAD_FALCONER_DESCRIPTION",                          "建造军营区域中的建筑时+30%建造速度。城市中建成的每个军营及军营区域建筑提供+3 [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_SERASKER_DESCRIPTION",                               "攻击防御性区域时，市中心周围10个单元格内的所有单位+10 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_KHASS_ODA_BASHI_DESCRIPTION",                        "在外国 [ICON_Capital] 首都就职时，此文明对您的 [ICON_STAT_GRIEVANCE] 不满每回合多降低5点，此文明的任何城市皆无法对您的城市施加忠诚度压力。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_GRAND_VISIER_DESCRIPTION",                           "与本方及本方盟友的交战方作战时+5 [ICON_STRENGTH] 战斗力。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CAPOU_AGHA_DESCRIPTION",                             "城市建造任意军事单位时+20%建造速度，训练文艺复兴及之后时代的近战和攻城单位时可以额外获得一个相同的单位。");

insert or replace into LocalizedText
    (Language,      Tag,                                                                         Text)
select
    "zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT_DESCRIPTION",           "在此城中购买单位时-20%花费，购买商人、大亨或投资人时额外-20%花费。"
where exists (select Tag from LocalizedText where Tag = "LOC_UNIT_LEU_TYCOON_NAME");
insert or replace into EnglishText
  	(Tag,                                                                         Text)
select
    "LOC_GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT_DESCRIPTION",           "-20% cost when purchasing units in this city. Extra -20% cost when purchasing a Trader, Tycoon or Investor unit in this city."
where exists (select Tag from LocalizedText where Tag = "LOC_UNIT_LEU_TYCOON_NAME");

--insert or replace into LocalizedText
--    (Language,      Tag,                                                                         Text)
--select
--    "zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_DESCRIPTION",                    "全国每个商业中心建筑、贸易码头和商港给本城+2% [ICON_Gold] 金币。"
--where exists (select Tag from LocalizedText where Tag = "LOC_BUILDING_JNR_MINT_NAME");
--insert or replace into EnglishText
--    (Tag,                                                                         Text)
--select
--    "LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_DESCRIPTION",                     "Each Commercial Hub buildings, Trade Port and Entrepot in your empire provides +2% [ICON_Gold] Gold to this city."
--where exists (select Tag from LocalizedText where Tag = "LOC_BUILDING_JNR_MINT_NAME");
--
--insert or replace into LocalizedText
--    (Language,      Tag,                                                                         Text)
--select
--    "zh_Hans_CN",   "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",            "全国每个商业中心建筑、贸易码头和商港给从本城出发的国际 [ICON_TRADEROUTE] 贸易路线+1 [ICON_GOLD] 金币。"
--where exists (select Tag from LocalizedText where Tag = "LOC_BUILDING_JNR_MINT_NAME");
--insert or replace into LocalizedText
--    (Language,      Tag,                                                                         Text)
--select
--    "zh_Hans_CN",   "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION_CORP",       "全国每个商业中心建筑、贸易码头和商港给从本城出发的国际 [ICON_TRADEROUTE] 贸易路线+1 [ICON_GOLD] 金币。研究资本主义市政后此城的 [ICON_GreatWork_Product] 产品提供的 [ICON_Tourism] 旅游业绩+100%。"
--where exists (select Tag from LocalizedText where Tag = "LOC_BUILDING_JNR_MINT_NAME");
--insert or replace into EnglishText
--    (Tag,                                                                         Text)
--select
--    "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",             "Each Commercial Hub building, Trade Port and Entrepot in your empire provides +1 [ICON_GOLD] Gold for international [ICON_TRADEROUTE] Trade Routes starting from this city."
--where exists (select Tag from LocalizedText where Tag = "LOC_BUILDING_JNR_MINT_NAME");
--insert or replace into EnglishText
--    (Tag,                                                                         Text)
--select
--    "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION_CORP",        "Each Commercial Hub building, Trade Port and Entrepot in your empire provides +1 [ICON_GOLD] Gold for international [ICON_TRADEROUTE] Trade Routes starting from this city. [ICON_Greatwork_Product] Product provide +100% [ICON_Tourism] Tourism in this City after finishing the 'Capitalism' Civic."
--where exists (select Tag from LocalizedText where Tag = "LOC_BUILDING_JNR_MINT_NAME");