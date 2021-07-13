--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                                         Text)
values
    -- Reyna
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION_NAME",                     "Real Estate Developer"),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION_DESCRIPTION",              "This city receives +3 [ICON_Gold] Gold from each District, and receives +1 [ICON_Gold] Gold from each improved tile."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER_DESCRIPTION",                  "Commercial Hub and Harbor Districts receive +100% adjacency bonuses in the city."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT_DESCRIPTION",           "This city receives +4 [ICON_Gold] Gold from each unimproved feature. Tiles adjacent to unimproved features receive +1 Appeal in this city."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_DESCRIPTION",                 "+4 [ICON_Gold] Gold per turn for each [ICON_Citizen] Citizen in the city."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_NAME",                           "Financial Centre"),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_DESCRIPTION",                    "Each Commercial and Harbor building in the city increase city [ICON_Gold] Gold yield output by 10%."),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_NAME",                   "Multinational Corporations"),
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",            "Yields gained are doubled for international [ICON_TradeRoute] Trade Routes from this city when player has complete the Exploration Civic."),
    -- Victor
    ("LOC_GOVERNOR_PROMOTION_REDOUBT_DESCRIPTION",                                "Establishes in 3 turns. City cannot be put under siege. Increase City Defence [ICON_STRENGTH] Strength by 5. +30% Production speed toward Encampment districts, Harbor districts, and buildings for these districts."), --Your other cities within 9 tiles gain +4 Loyalty per turn towards your civilization. 
    ("LOC_GOVERNOR_PROMOTION_GARRISON_COMMANDER_DESCRIPTION",                     "Units defending within the city's territory get +5 [ICON_Strength] Combat Strength. City gains an additional [ICON_Ranged] Ranged Strike per turn. +100% building speed toward defensive buildings."),
    ("LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_NAME",                             "Logistics Supply"),
    ("LOC_GOVERNOR_PROMOTION_DEFENSE_LOGISTICS_DESCRIPTION",                      "One-time Strategic resource costs for units are discounted 80% in estabilished city. Accumulating Strategic resources in all cities gain an additional +2 per turn."),
    -- ("LOC_GOVERNOR_PROMOTION_EMBRASURE_DESCRIPTION",                              " "), -- Millitary Engineer trained in this city receive extra 2 charges. +100% [ICON_PRODUCTION] Production towards Millitary Engineer in this city.
    ("LOC_GOVERNOR_PROMOTION_CONSCRIPTION_NAME",                                  "Conscription"),
    ("LOC_GOVERNOR_PROMOTION_CONSCRIPTION_DESCRIPTION",                           "Military units trained in this city start with a free promotion that do not already start with a free promotion. Gain [ICON_SCIENCE] Science equal to 25% of the unit's cost when a non civilian unit is created in this city."), -- All millitary units trained in this city receive extra +25% Combat Experience permanently.
    ("LOC_GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT_NAME",                           "Arms Race Proponent"), -- +100% production speed
    ("LOC_GOVERNOR_PROMOTION_ARMS_RACE_PROPONENT_DESCRIPTION",                    "+100% production speed to all nuclear armament projects in the city. +30% Production speed towards all millitary units (50% more bonus when producing Air units and GDRs)."),
    ("LOC_GOVERNOR_PROMOTION_COMMANDER_NAME",                                     "Commander"),
    ("LOC_GOVERNOR_PROMOTION_COMMANDER_DESCRIPTION",                              "+5 [ICON_Strength] Combat Strength for units within 9 tiles."),
    ("LOC_VICTOR_COMMANDER_STRENGTH_BUFF_PREVIEW_TEXT",                           "from Commander"),
    -- Bishop
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_BISHOP_DESCRIPTION",                        "Religious pressure to adjacent cities is 100% stronger from this city. +1 [ICON_FAITH] Faith per turn for each [ICON_Citizen] Citizen in the city. Establishes in 3 turns."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR_NAME",                     "sayyid"),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_GRAND_INQUISITOR_DESCRIPTION",              "Apostle, Missionary, Guru and Inquistor trained in this city +1 [ICON_MOVEMENT] Movement and +1 charges permanently. Warrior Monk trained in this city +1 [ICON_MOVEMENT] Movement."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS_NAME",                   "Justice by faith"),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_LAYING_ON_OF_HANDS_DESCRIPTION",            "All Holy Sites within 4 tiles from the established city gains +100% adjacency bonuses, and yields [ICON_TOURISM] Tourism equal to the faith adjacency bonus."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD_NAME",                       "Divine Architect"),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_CITADEL_OF_GOD_DESCRIPTION",                "Allows city to purchase Districts, Shrine and Temple with [ICON_FAITH] Faith. Allow this city build one more district than the [ICON_Citizen] Population limit allows."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_PATRON_SAINT_DESCRIPTION",                  "Apostles and Warrior Monks trained in the city receive 1 extra promotion when receiving their first promotion. Warrior Monks trained in this city receive +5 [ICON_STRENGTH] Combat Strength and +100% Combat Experience permanently."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT_DESCRIPTION",              "All relic in this city receive +300% [ICON_TOURISM] Tourism and +50% [ICON_FAITH] Faith bonus."),
    ("LOC_GOVERNOR_PROMOTION_CARDINAL_DIVINE_ARCHITECT_NAME",                     "Oecumenical Patriarch"),
    -- Magnus
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_SURPLUS_LOGISTICS_DESCRIPTION",     "+20% [ICON_Food] Growth in the city. Your [ICON_TradeRoute] Trade Routes ending here provide +4 [ICON_Food] Food to their starting city."),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER_NAME",                "Ground Breaker"),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER_DESCRIPTION",         "+50% construction speed when constructing districts and buildings in the city. Allow this city build one more district than the [ICON_Citizen] Population limit allows."),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER_NAME",              "Quan'Nong"),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_BLACK_MARKETEER_DESCRIPTION",       "+15% [ICON_Food] Food and [ICON_Production] Production in the city."),
    ("LOC_BUILDING_DUMMY_MAGNUS_NAME",                                            "General Services Officer Magnus"),
    ("LOC_BUILDING_DUMMY_MAGNUS_DESCRIPTION",                                     "Created when Governor Magnus with General Services Officer title that estabilished within 6 tiles."),
    ("LOC_BUILDING_DUMMY_NO_MAGNUS_NAME",                                         "PlaceHolder"),
    ("LOC_BUILDING_DUMMY_NO_MAGNUS_DESCRIPTION",                                  "Please Ignore"),
    ("LOC_BUILDING_CONSTRUCT_REQUIRES_BUILDING_WITHOUT_SUFFIX",                   "This building requires {1_Building}."),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_NAME",                "General Services Officer"),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_DESCRIPTION",         "When the Governor Magnus estabilished in city, the General Service Office of the city can provide +3 of all yields to the cities within 6 tiles. "),
    ("LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION_DESCRIPTION",  "This city receives yields from all nearby district buildings with regional bonuses, not just from the first building of the same type."),
    -- Liang
    ("LOC_GOVERNOR_PROMOTION_AQUACULTURE_NAME",                                   "Rural Planning"),
    ("LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_NAME",                           "Architecture Master"),
    ("LOC_GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE_NAME",                     "Infrastructure"),
    ("LOC_GOVERNOR_PROMOTION_WATER_WORKS_NAME",                                   "Paradise"),
    ("LOC_GOVERNOR_PROMOTION_BUILDER_GUILDMASTER_DESCRIPTION",                    "All Builders trained in this city will get +1 build charge and +1 [ICON_Movement] Movement."),
    ("LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_DESCRIPTION",                    "This city gets +20% production speed towards wonders. When Wonders being built in this city, grant Great Engineer Points equal to 20% of the cost of the building."),
    ("LOC_GOVERNOR_PROMOTION_AQUACULTURE_DESCRIPTION",                            "+1 [ICON_Production] Production for all improved plots in this city ."),
    ("LOC_GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE_DESCRIPTION",              "This city’s improvements, buildings, and districts cannot be damaged by Environmental Effects. +100% districts adjacency yields in this city"),
    ("LOC_GOVERNOR_PROMOTION_WATER_WORKS_DESCRIPTION",                            "All improvements and National parks in this city gain 200%  extra [ICON_TOURISM] Tourism  ."),
    ("LOC_GOVERNOR_PROMOTION_PARKS_RECREATION_DESCRIPTION",                       "Can construct the City Park improvement (unlocked by Medieval Faires Civic) in this city. +1 [ICON_Culture] Culture and +2 Appeal to adjacent tiles. Cannot be adjacent to another City Park. When Liang is estabilished in this city, City Parks provide +1 of all yields to all adjacent tiles."),
    -- Amani
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY_DESCRIPTION",                    "Other cities within 9 tiles and not owned by you lose 3 Loyalty per turn. If she is estabilshed in a certain city, [ICON_FAITH] Faith can be used to cruit Spy inthat city and the cost is reduced by 25%. Spys trained in this city start with a free promotion that do not already start with a free promotion. "),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_MESSENGER_DESCRIPTION",                   "Can be assigned to a city-state, where she acts as 2 [ICON_Envoy] Envoys. Can also be assigned to other Civ' s [ICON_CAPITAL] Capital."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY_NAME",                           "Local Informants "),
    ("LOC_GOVERNOR_PROMOTION_LOCAL_INFORMANTS_NAME",                              "Disguise"),
    ("LOC_GOVERNOR_PROMOTION_LOCAL_INFORMANTS_DESCRIPTION",                       "If Amani is estabilished, Spy operations take 25% less time. All Spy act as +1 level."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR_DESCRIPTION",            "Immediately send one [ICON_Envoy] Envoy to all City States that you already met. Each City-State suzerain will provide +1 [ICON_SCIENCE], +1 [ICON_CULTURE] Culture, +1 [ICON_FAITH] Faith and +1 [ICON_GOLD] Gold."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_PUPPETEER_DESCRIPTION",                   "While established in a city-state, doubles the number of [ICON_Envoy] Envoys you have there. Enemy Spy level reduced by 1 in your lands. Your Spy level is increased by 1 for offensive operations."),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR_NAME",                   "Pay Tribute"),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_NAME",                          "Foreign Investor"),
    ("LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_DESCRIPTION",                   "City State units gain +4 [ICON_Strength] Combat Strength if you are the City State's Suzerain (including Leveraged Units) and it cost 20% less [ICON_GOLD] Gold to levy troops. Amani now acts as three [ICON_Envoy]envoys (instead of 2). While established in a city-state, accumulate its Strategic and Luxury resources. When suzerain receive double the amount of accumulated strategic and luxury resources.  "),
    ("GOV_CITYSTATES_LEVIED_COMBAT_STRENGTH_DESCRIPTION",                         "+4，from Governor's Promotion"),
    ("GOV_CITYSTATES_COMBAT_STRENGTH_DESCRIPTION",                                "+4，from Governor's Promotion"),
    -- Pingala
    ("LOC_GOVERNOR_PROMOTION_MERCHANT_CURATOR_DESCRIPTION",                       "+200% [ICON_Tourism] Tourism from Great Works of Art, Music, and Writing in the city.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                                         Text)
values
    -- 瑞纳
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION_NAME",                     "地产商人"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_LAND_ACQUISITION_DESCRIPTION",              "城市中每个区域+3 [ICON_Gold] 金币。城市中每个改良设施+1 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_HARBORMASTER_DESCRIPTION",                  "城市中商业中心和港口的相邻加成+100%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_FORESTRY_MANAGEMENT_DESCRIPTION",           "每个未改良的地貌可向该城市提供+4 [ICON_Gold] 金币。该城市中与未改良地貌相邻的单元格可获得+1魅力。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_TAX_COLLECTOR_DESCRIPTION",                 "城市中每位 [ICON_Citizen] 公民每回合可带来4 [ICON_Gold] 金币的收入。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_NAME",                           "金融中心"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_CONTRACTOR_DESCRIPTION",                    "城市中每有一座商业中心建筑和港口建筑，[ICON_Gold] 金币产出便+10%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_NAME",                   "跨国公司"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP_DESCRIPTION",            "当玩家研究探索市政后，从此城开始的国际 [ICON_TradeRoute] 贸易路线收益翻倍。"),
    ("zh_Hans_CN",  "LOC_CITY_GOLD_FROM_POPULATION",                                             "{Value : number +#.#;-#.#}来自额外税收"),
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
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_CARDINAL_BISHOP_DESCRIPTION",                        "此城对相邻城市释放的宗教压力强度加倍。每个公民产出1 [ICON_FAITH] 信仰。就职需要3回合。"),
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
    ("zh_Hans_CN",  "LOC_BUILDING_DUMMY_MAGNUS_DESCRIPTION",                                     "当拥有总务官头衔的马格努斯总督在6环内就职时会自动创建。"),
    ("zh_Hans_CN",  "LOC_BUILDING_DUMMY_NO_MAGNUS_NAME",                                         "请忽略"),
    ("zh_Hans_CN",  "LOC_BUILDING_DUMMY_NO_MAGNUS_DESCRIPTION",                                  "请忽略"),
    ("zh_Hans_CN",  "LOC_BUILDING_CONSTRUCT_REQUIRES_BUILDING_WITHOUT_SUFFIX",                   "该建筑需要{1_Building}。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_NAME",                "总务官"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST_DESCRIPTION",         "总督“马格努斯”就职的城市中的总务厅可为6个单元格之内的城市提供+3所有产出。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION_DESCRIPTION",  "此城市可从附近所有拥有区域辐射效果的建筑中获得 [ICON_Food] 食物、 [ICON_Production] 生产力、 [ICON_Gold] 金币、 [ICON_Science] 科技值和 [ICON_Culture] 文化值，而不仅是从相同类型的建筑中首个建成的建筑处获得。"),
    -- 梁
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AQUACULTURE_NAME",                                   "乡村规划"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_NAME",                           "建筑大师"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE_NAME",                     "基础设施"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_WATER_WORKS_NAME",                                   "世外天堂"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_BUILDER_GUILDMASTER_DESCRIPTION",                    "城市中生产的所有建造者+1建造次数，+1 [ICON_Movement] 移动力。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_ZONING_COMMISSIONER_DESCRIPTION",                    "城市在建造奇观时加速20%。此城市建成奇观后获得等同于其生产力20%的大工程师点数。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AQUACULTURE_DESCRIPTION",                            "本城已改良地块+1 [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_REINFORCED_INFRASTRUCTURE_DESCRIPTION",              "环境效应无法对此城市的改良设施、建筑与区域造成伤害。本城所有区域的相邻产出+100%。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_WATER_WORKS_DESCRIPTION",                            "本城所有改良设施和国家公园+200% [ICON_TOURISM] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_PARKS_RECREATION_DESCRIPTION",                       "可在城市中修建特色改良设施“市立公园”（由中世纪集市市政解锁）。产出1 [ICON_Culture] 文化值，为相邻单元格+2魅力。无法建在另一个市立公园旁。总督梁在此城市就职时，市立公园为每个相邻单元格提供+1所有产出。"),
    -- 阿玛尼
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY_DESCRIPTION",                    "9个单元格内其他文明的城市每回合失去3点忠诚度。 在己方文明城市就职时可在该城花费 [ICON_FAITH] 信仰招募间谍，花费减少25%。此城中生产的间谍可免费升级为探员。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_MESSENGER_DESCRIPTION",                   "可派遣至城邦，效力等同于2名 [ICON_Envoy] 使者。也可被派到其他文明的 [ICON_CAPITAL] 首都。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY_NAME",                           "本地线人"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_LOCAL_INFORMANTS_NAME",                              "伪装"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_LOCAL_INFORMANTS_DESCRIPTION",                       "就职期间间谍-25%出击行动时间。我方间谍行动时+1等级。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR_DESCRIPTION",            "立即给每个已相遇城邦+1 [ICON_Envoy] 使者。每个宗主的城邦提供+1 [ICON_SCIENCE] 科技，+1 [ICON_CULTURE] 文化，+1 [ICON_FAITH] 信仰和+1 [ICON_GOLD] 金币。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_PUPPETEER_DESCRIPTION",                   "派遣到城邦后使当地的 [ICON_Envoy] 使者数量加倍。我方间谍出击时+1级，在领土内敌方间谍等级下降1级。"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR_NAME",                   "朝贡"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_NAME",                          "外国投资者"),
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_AMBASSADOR_AFFLUENCE_DESCRIPTION",                   "对所有宗主的城邦，其单位+4 [ICON_Strength] 战斗力（包括征召单位），征兵时花费 [ICON_GOLD] 金币-20%。派遣至城邦时，效力等同于3名 [ICON_Envoy] 使者（而不是2名），可获得其奢侈和战略（宗主时翻倍）。"),
    ("zh_Hans_CN",  "GOV_CITYSTATES_LEVIED_COMBAT_STRENGTH_DESCRIPTION",                         "+4，来自总督晋升"),
    ("zh_Hans_CN",  "GOV_CITYSTATES_COMBAT_STRENGTH_DESCRIPTION",                                "+4，来自总督晋升"),
    -- 平旮旯
    ("zh_Hans_CN",  "LOC_GOVERNOR_PROMOTION_MERCHANT_CURATOR_DESCRIPTION",                       "城市中艺术、音乐和著作巨作提供的 [ICON_Tourism] 旅游业绩+200%。");

