--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
	(Tag,																	 Text)
values
	("LOC_BUILDING_DUMMY_POLAND_NAME",										"PlaceHolder"),
	("LOC_BUILDING_DUMMY_POLAND_DESCRIPTION",								 "Please Ignore"),
	-- UI Texts
	("LOC_HD_MESSAGE",														"Harmony in Diversity"),
	("LOC_PANTHEON_SELECTED_BY_OTHERS",									   "This pantheon has been selected by others."),
	("LOC_BELIEF_SELECTED_BY_OTHERS",										 "This religion belief has been selected by others."),
	("LOC_UNITCOMMAND_SACRIFICE_NAME",										"Human Sacrifice"),
	("LOC_UNITCOMMAND_SACRIFICE_DESCRIPTION",								 "Sacrifice this unit. Gain +10 [ICON_Culture] Culture and +10 [ICON_Faith] Faith for each builder charge the unit has."),
	("LOC_UNITCOMMAND_SACRIFICE_DISABLED_TT",								 "[COLOR_RED]Must occupy City Center[ENDCOLOR]"),
	("LOC_FLYOVER_AZTEC_SACRIFICE",										   "Human Sacrifice[COLOR:ResCultureLabelCS]+{1_Amount}[ENDCOLOR][ICON_Culture][COLOR:ResFaithLabelCS]+{1_Amount}[ENDCOLOR][ICON_Faith]"),
	-- Main
	("LOC_EPSTWEAK_WONDER_WORDING_TOURISM",								   "[NEWLINE][NEWLINE]+2 [ICON_Tourism] Tourism[NEWLINE]+1 [ICON_Tourism] extra per Era that you've advanced past this Wonder's era"),
	("LOC_DISTRICT_HD_IS_SPECIALTY_DISTRICT",								 "Specialty District"),
	("LOC_DISTRICT_HD_IS_NOT_SPECIALTY_DISTRICT",							 "District"),
	("LOC_TOOLTIP_COST_PROGRESSION_PARAM",									"Cost Progression Param: {1_num}"),
	("LOC_TOOLTIP_BUILDING_CITIZEN_YIELDS_HEADER",							"Citizen Yields change (per citizen in this district):"),
	("LOC_TOOLTIP_DISTRICT_CITIZEN_YIELDS_HEADER",							"Citizen Yields (per citizen in this district):"),
	("LOC_TOOLTIP_RESOURCE_IMPROVED_BY",									  "Can be improved by: "),
	("LOC_TOOLTIP_RESOURCE_CORP_CATEGORY",									"Luxury categorized as: "),
	("LOC_UI_PEDIA_CITIZEN_YIELDS",										   "Citizen Yields (per citizen in this district)"),
	("LOC_TOOLTIP_REGIONAL_EFFECT_RANGE",										"{1_num}-tile Regional Effect: The basic yields of this Wonder are extend to other cities within {1_num} tiles."),
	("LOC_TOOLTIP_REGIONAL_EFFECT_RANGE_MODIFIER",								"{1_num}-tile Regional Effect: Cities with City Center or Neighborhood within {1_num} tiles of this building recieve the following bonuses, except those cities that have already recieved this bonus from the same building:"),
	("LOC_TYPE_TRAIT_AMENITY_ENTERTAINMENT_POWER_ENHANCEMENT",				"{1_Amount: number +#,###;-#,###} [ICON_Amenities] {1_Amount : plural 1?Amenity; other?Amenities;} additionally when this city is [ICON_Power] Powered"),
	("LOC_TYPE_TRAIT_YIELD_POWER_ENHANCEMENT",								"{1_Amount: number +#,###;-#,###} {2_Icon} {3_Name} additionally when this city is [ICON_Power] Powered"),
	("LOC_HAPPINESS_DELIGHTED_NAME",										  "Delighted"),
	("LOC_HAPPINESS_JOYFUL_NAME",											 "Joyful"),
	("LOC_IMPROVEMENT_GOODY_BUILDER_NAME",									"Please Ignore"),
	("LOC_LOYALTY_LEVEL_4_NAME",											  "Unswervingly Loyal"),
	("LOC_LOYALTY_LEVEL_4_DESCRIPTION",									   "The Citizens are Unswervingly Loyal to your civilization!"),
	("LOC_TURNS_BEFORE_DESTROY_HD",										   "Completely destroy after {1_num} turns"),
	("LOC_CANNOT_REMOVE_FEATURE_USING_RECONS",								"Cannot remove features using Recon units"),
	("LOC_VIZSOURCE_CHANCERY",												"Built Building Chancery"),
	("LOC_VIZSOURCE_ACTION_CHANCERY",										 "Build Building Chancery"),
	("LOC_GOSSIP_SOURCE_CHANCERY",											"Your officier from Chancery informed that "),
	("LOC_GOSSIP_SOURCE_GOV_SPIES",										   "Your senator informed that "),
	("LOC_VIZSOURCE_GOV_SPIES",											   "Built Building International parliamentary Body"),
	("LOC_VIZSOURCE_ACTION_GOV_SPIES",										"Build Building International parliamentary Body"),
	("LOC_DISTRICT_LUMBER_MILL_1_PRODUCTION",								 "+{1_num} [ICON_Production] Production from the adjacent Lumber Mill."),
	("LOC_UNIVERSITY_JUNGLE_SCIENCE",										 "+{1_num} [ICON_Science] Science from the adjacent {1_num : plural 1?Jungle; other?Jungles;}."),
	("LOC_DISTRICT_DESERT_SCIENCE",										   "+{1_num} [ICON_Science] Science from adjacent Desert {1_Num : plural 1?Tile; other?Tiles;}."),
	("LOC_DISTRICT_DESERT_HILLS_SCIENCE",									 "+{1_num} [ICON_Science] Science from adjacent Desert hill {1_Num : plural 1?Tile; other?Tiles;}."),
	("LOC_DISTRICT_HARBOR_HANSA_PRODUCTION",								  "+{1_num} [ICON_Production] Production from adjacent Harbor {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_ROYALDOCK_HANSA_PRODUCTION",							   "+{1_num} [ICON_Production] Production from adjacent RoyalDock {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_COTHON_HANSA_PRODUCTION",								  "+{1_num} [ICON_Production] Production from adjacent Cothon {1_Num : plural 2?district; other?districts;}."),
	("LOC_ALLIANCE_LV2_RESEARCH_EFFECT_1",									"Every 10 turns (on Standard), you unlock a [ICON_TechBoosted] Eureka for a tech that your ally has researched or boosted, but you have not."),
	("LOC_ALLIANCE_LV1_MILITARY_EFFECT_2",									"+2 [ICON_Production] Production from [ICON_TradeRoute] Trade Routes to your ally"),
	("LOC_ALLIANCE_LV1_MILITARY_EFFECT_3",									"+1 [ICON_Production] Production from [ICON_TradeRoute] Trade Routes from your ally"),
	("LOC_TOOLTIP_COLLECTED",												"Collected: "),
	("LOC_TOOLTIP_UNCOLLECTED",												"Uncollected: "),
	("LOC_TOOLTIP_FULL_COLLECTED",											"All items collected.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
	(Language,	  Tag,																	 Text)
values
	("zh_Hans_CN",  "LOC_BUILDING_DUMMY_POLAND_NAME",										"请忽略"),
	("zh_Hans_CN",  "LOC_BUILDING_DUMMY_POLAND_DESCRIPTION",								 "请忽略"),
	-- UI texts 
	("zh_Hans_CN",  "LOC_HD_MESSAGE",														"和而不同"),
	("zh_Hans_CN",  "LOC_PANTHEON_SELECTED_BY_OTHERS",									   "该万神殿已被他人选取"),
	("zh_Hans_CN",  "LOC_BELIEF_SELECTED_BY_OTHERS",										 "该宗教信仰已被他人选取"),
	("zh_Hans_CN",  "LOC_UNITCOMMAND_SACRIFICE_NAME",										"活人献祭"),
	("zh_Hans_CN",  "LOC_UNITCOMMAND_SACRIFICE_DESCRIPTION",								 "向神明献祭该单位，每有一次剩余劳动力获得10点 [ICON_Culture] 文化值和10点 [ICON_Faith] 信仰值，移除该单位。"),
	("zh_Hans_CN",  "LOC_UNITCOMMAND_SACRIFICE_DISABLED_TT",								 "[COLOR_RED]必须位于市中心[ENDCOLOR]"),
	("zh_Hans_CN",  "LOC_FLYOVER_AZTEC_SACRIFICE",										   "活人献祭[COLOR:ResCultureLabelCS]+{1_Amount}[ENDCOLOR][ICON_Culture][COLOR:ResFaithLabelCS]+{1_Amount}[ENDCOLOR][ICON_Faith]"),
	-- Main
	("zh_Hans_CN",  "LOC_GOVERNMENT_INHERENT_BONUS",										 "传承效果"), -- 官方好像在ui上面写反了。

	("zh_Hans_CN",  "LOC_EPSTWEAK_WONDER_WORDING_TOURISM",								   "[NEWLINE][NEWLINE]+2 [ICON_Tourism] 旅游业绩。[NEWLINE]您所处时代每超越该奇观所属的时代一个时代，则+1 [ICON_Tourism] 旅游业绩。"),
	("zh_Hans_CN",  "LOC_DISTRICT_HD_IS_SPECIALTY_DISTRICT",								 "专业化区域"),
	("zh_Hans_CN",  "LOC_DISTRICT_HD_IS_NOT_SPECIALTY_DISTRICT",							 "非专业化区域"),
	("zh_Hans_CN",  "LOC_TOOLTIP_COST_PROGRESSION_PARAM",									"涨价系数：{1_num}"),
	("zh_Hans_CN",  "LOC_TOOLTIP_BUILDING_CITIZEN_YIELDS_HEADER",							"在此区域中工作的 [ICON_Citizen] 专家收益变动："),
	("zh_Hans_CN",  "LOC_TOOLTIP_DISTRICT_CITIZEN_YIELDS_HEADER",							"每个在此区域中工作的 [ICON_Citizen] 专家收益："),
	("zh_Hans_CN",  "LOC_TOOLTIP_RESOURCE_IMPROVED_BY",									  "改良设施类型："),
	("zh_Hans_CN",  "LOC_TOOLTIP_RESOURCE_CORP_CATEGORY",									"奢侈品所属类别："),
	("zh_Hans_CN",  "LOC_UI_PEDIA_CITIZEN_YIELDS",										   "每个在此区域中工作的 [ICON_Citizen] 专家收益"),
	("zh_Hans_CN",  "LOC_TYPE_TRAIT_CITIZENS",											   "{1_Amount: number +#,###;-#,###} [ICON_Citizen] 专家{1_Amount : plural 1?槽位; other?槽位;}"),
	("zh_Hans_CN",  "LOC_TYPE_TRAIT_CITIZENSLOTS",										   "{1_Amount: number +#,###;-#,###} [ICON_Citizen] 专家{1_Amount : plural 1?槽位; other?槽位;}"),
	("zh_Hans_CN",  "LOC_TOOLTIP_REGIONAL_EFFECT_RANGE",									 "{1_num}环辐射：此奇观的基础产出延伸到{1_num}个单元格内的其它城市。"),
	("zh_Hans_CN",  "LOC_TOOLTIP_REGIONAL_EFFECT_RANGE_MODIFIER",							"{1_num}环辐射：拥有在此建筑{1_num}个单元格内的市中心或社区的城市获得以下加成，但不包括已经从相同建筑获得过此加成的城市："),
	("zh_Hans_CN",  "LOC_TYPE_TRAIT_AMENITY_ENTERTAINMENT_POWER_ENHANCEMENT",				"此城 [ICON_Power] 供电充足时，额外{1_Amount: number +#,###;-#,###} [ICON_Amenities] {1_Amount : plural 1?宜居度; other?宜居度;}"),
	("zh_Hans_CN",  "LOC_TYPE_TRAIT_YIELD_POWER_ENHANCEMENT",								"此城 [ICON_Power] 供电充足时，额外{1_Amount: number +#,###;-#,###} {2_Icon} {3_Name}"),
	("zh_Hans_CN",  "LOC_HAPPINESS_DELIGHTED_NAME",										  "愉悦"),
	("zh_Hans_CN",  "LOC_HAPPINESS_JOYFUL_NAME",											 "喜悦"),
	("zh_Hans_CN",  "LOC_IMPROVEMENT_GOODY_BUILDER_NAME",									"请忽略"),
	("zh_Hans_CN",  "LOC_LOYALTY_LEVEL_4_NAME",											  "绝对忠诚"),
	("zh_Hans_CN",  "LOC_LOYALTY_LEVEL_4_DESCRIPTION",									   "您的公民绝对忠于您的文明。"),
	("zh_Hans_CN",  "LOC_TURNS_BEFORE_DESTROY_HD",										   "将在{1_num}回合后被彻底摧毁"),
	("zh_Hans_CN",  "LOC_DISTRICT_BASE_DISTRICT_SCIENCE",									"+{1_Num} [ICON_Science] 科技值。"),
	("zh_Hant_HK",  "LOC_DISTRICT_BASE_DISTRICT_SCIENCE",									"+{1_Num} [ICON_Science] 科技值。"),
	("zh_Hans_CN",  "LOC_CANNOT_REMOVE_FEATURE_USING_RECONS",								"侦察类单位不能移除地貌"),
	("zh_Hans_CN",  "LOC_VIZSOURCE_CHANCERY",												"建造了外交办"),
	("zh_Hans_CN",  "LOC_VIZSOURCE_ACTION_CHANCERY",										 "建造外交办"),
	("zh_Hans_CN",  "LOC_GOSSIP_SOURCE_CHANCERY",											"外交办的官员 帝普罗杰克 获悉"),
	("zh_Hans_CN",  "LOC_GOSSIP_SOURCE_GOV_SPIES",										   "议会议员 五字老师 获悉"),
	("zh_Hans_CN",  "LOC_VIZSOURCE_GOV_SPIES",											   "建造了国际议会机构"),
	("zh_Hans_CN",  "LOC_VIZSOURCE_ACTION_GOV_SPIES",										"建造国际议会机构"),
	("zh_Hans_CN",  "LOC_PROMOTION_SHELLS_DESCRIPTION",									  "与区域防御战斗时+10 [ICON_Strength] 战斗力。"),
	("zh_Hans_CN",  "LOC_UNIT_GAUL_GAESATAE_DESCRIPTION",									"高卢特色远古时代单位，替代勇士。此单位拥有更高花费。与基础战斗力更高的单位作战时+10 [ICON_Strength] 战斗力。与区域防御战斗时+5 [ICON_Strength] 战斗力。"),
	("zh_Hans_CN",  "LOC_DISTRICT_LUMBER_MILL_1_PRODUCTION",								 "相邻伐木场提供+{1_num} [ICON_Production] 生产力。"),
	("zh_Hans_CN",  "LOC_UNIVERSITY_JUNGLE_SCIENCE",										 "+{1_num} [ICON_Science] 科技值来自相邻雨林{1_Num : plural 1?单元格; other?单元格;}。"),
	("zh_Hans_CN",  "LOC_DISTRICT_DESERT_SCIENCE",										   "+{1_num} [ICON_Science] 科技值来自相邻的沙漠单元格。"),
	("zh_Hans_CN",  "LOC_DISTRICT_DESERT_HILLS_SCIENCE",									 "+{1_num} [ICON_Science] 科技值来自相邻的沙漠（丘陵）单元格。"),
	("zh_Hans_CN",  "LOC_ALLIANCE_LV2_RESEARCH_EFFECT_1",									"每10回合（标准游戏速度下）解锁1个您盟友已研究或提升，而您尚未研究之科技的 [ICON_TechBoosted] 尤里卡"),
	("zh_Hans_CN",  "LOC_ALLIANCE_LV1_MILITARY_EFFECT_2",									"从通往盟友城市的 [ICON_TradeRoute] 贸易路线处获得的 [ICON_Production] 生产力+2"),
	("zh_Hans_CN",  "LOC_ALLIANCE_LV1_MILITARY_EFFECT_3",									"从源自盟友城市的 [ICON_TradeRoute] 贸易路线处获得的 [ICON_Production] 生产力+1"),
	("zh_Hans_CN",  "LOC_TOOLTIP_COLLECTED",												"已收集："),
	("zh_Hans_CN",  "LOC_TOOLTIP_UNCOLLECTED",												"未收集："),
	("zh_Hans_CN",  "LOC_TOOLTIP_FULL_COLLECTED",											"已完成全收集。");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
	(Language,	  Tag,																 Text)
values
	("zh_Hans_CN",  "LOC_RESOURCE_GOLD_NAME",											"黄金"),
	("zh_Hans_CN",  "LOC_PEDIA_RESOURCES_PAGE_RESOURCE_GOLD_CHAPTER_HISTORY_PARA_1",	 "黄金是一种柔软、有光泽和延展性的金属，在历史上一直受到人们的珍视。这是一种稀有金属，它的稀有性大大增加了它的价值。尽管黄金有一些工业和医疗用途，但它主要用作铸币或装饰用途，装饰珠宝、杯子、器皿以及超级富豪和权贵的马桶。 ");

--------------------------------------------------------------------------------
-- projects
-- Language: en_US
insert or replace into EnglishText
	(Tag,																	 Text)
values
	("LOC_PROJECT_LAUNCH_MOON_LANDING_DESCRIPTION",							  "Space Race project which launches a large rocket to land a human on the moon. [ICON_CIVICBOOSTED] Inspirations provide +10% [ICON_CULTURE] Culture after finishing this Project (including [ICON_CIVICBOOSTED] Inspirations that are already triggered). Trigger the [ICON_CIVICBOOSTED] Inspiration of all Future Era Civics. Marks the second step towards the Science Victory."),
	("LOC_PROJECT_BREAD_AND_CIRCUSES_DESCRIPTION",							"City project which increases the Loyalty Pressure that this city exerts on itself and other cities nearby.[NEWLINE][NEWLINE]While active, each of your [ICON_Citizen] Citizens here exerts +1 Loyalty pressure to this city. This pressure also affects other cities within 9 tiles, but is 10% less effective per tile. Once completed, instantly gain +20 Loyalty in this city.[NEWLINE][NEWLINE]Requires: Entertainment Complex district."),
	("LOC_PROJECT_CIRCUSES_AND_BREAD_HD_NAME",								"Judgement of Love"),
	("LOC_PROJECT_CIRCUSES_AND_BREAD_HD_SHORT_NAME",						  "Judgement of Love"),
	("LOC_PROJECT_CIRCUSES_AND_BREAD_HD_DESCRIPTION",						 "Once completed, other Civilizations' cities within 9 tiles and having negative Loyalty per turn will instantly lose all Loyalty."),
	("LOC_PROJECT_ENDLESS_MONEY_HD_NAME",									 "Endless Money"),
	("LOC_PROJECT_ENDLESS_MONEY_HD_SHORT_NAME",							   "Endless Money"),
	("LOC_PROJECT_ENDLESS_MONEY_HD_DESCRIPTION",							  "City project which provides a huge amount of [ICON_Gold] Gold every turn."),
	("LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_NAME",							 "Mule Breeding"),
	("LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_SHORT_NAME",					   "Mule Breeding"),
	("LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_DESCRIPTION",					  "Stable project. Once completed, instantly gain +20 [ICON_RESOURCE_HORSES] Horses."),
	("LOC_PROJECT_GRANT_RESOURCE_IRON_HD_NAME",							   "Recycling Ironware"),
	("LOC_PROJECT_GRANT_RESOURCE_IRON_HD_SHORT_NAME",						 "Recycling Ironware"),
	("LOC_PROJECT_GRANT_RESOURCE_IRON_HD_DESCRIPTION",						"Barracks project. Once completed, instantly gain +20 [ICON_RESOURCE_IRON] Iron."),
	("LOC_PROJECT_GRANT_RESOURCE_NITER_HD_NAME",							  "Droit de Fouille"),
	("LOC_PROJECT_GRANT_RESOURCE_NITER_HD_SHORT_NAME",						"Droit de Fouille"),
	("LOC_PROJECT_GRANT_RESOURCE_NITER_HD_DESCRIPTION",					   "Armory project. Once completed, instantly gain +20 [ICON_RESOURCE_NITER] Niter."),
	("LOC_PROJECT_GRANT_RESOURCE_COAL_HD_NAME",							   "Charcoal Production"),
	("LOC_PROJECT_GRANT_RESOURCE_COAL_HD_SHORT_NAME",						 "Charcoal Production"),
	("LOC_PROJECT_GRANT_RESOURCE_COAL_HD_DESCRIPTION",						"Armory project. Once completed, instantly gain +20 [ICON_RESOURCE_COAL] Coal."),
	("LOC_PROJECT_GRANT_RESOURCE_OIL_HD_NAME",								"Shale Oil Extraction"),
	("LOC_PROJECT_GRANT_RESOURCE_OIL_HD_SHORT_NAME",						  "Shale Oil Extraction"),
	("LOC_PROJECT_GRANT_RESOURCE_OIL_HD_DESCRIPTION",						 "Military academy project. Once completed, instantly gain +20 [ICON_RESOURCE_OIL] Oil."),
	("LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_NAME",						   "Selective Silica Removal"),
	("LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_SHORT_NAME",					 "Selective Silica Removal"),
	("LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_DESCRIPTION",					"Military academy project. Once completed, instantly gain +20 [ICON_RESOURCE_ALUMINUM] Aluminum."),
	("LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_NAME",							"Breeder Reactor"),
	("LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_SHORT_NAME",					  "Breeder Reactor"),
	("LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_DESCRIPTION",					 "Military Academy project. Once completed, instantly gain +20 [ICON_RESOURCE_URANIUM] Uranium.");
	-- ("LOC_PROJECT_RECRUIT_WORKERS_HD_NAME",								   "Recruit Workers"),
	-- ("LOC_PROJECT_RECRUIT_WORKERS_HD_SHORT_NAME",							 "Recruit Workers"),
	-- ("LOC_PROJECT_RECRUIT_WORKERS_HD_DESCRIPTION",							"City project. If this city has at least 2 [ICON_Citizen] Citizens, this project grants a builder and reduces 1 [ICON_Citizen] Citizen.[NEWLINE]If this city has only 1 [ICON_Citizen] Citizen, this project will take effect later when the population of this city increases next time.");

-- Language: zh_Hans_CN
insert or replace into LocalizedText
	(Language,	  Tag,																	Text)
values
	("zh_Hans_CN",	"LOC_PROJECT_LAUNCH_MOON_LANDING_DESCRIPTION",							 "发射火箭让人类登陆月球的太空竞赛项目。完成此项目后，[ICON_CIVICBOOSTED] 鼓舞额外提供+10% [ICON_CULTURE] 文化值（包括已经获得的 [ICON_CIVICBOOSTED] 鼓舞）。所有未来时代的市政获得 [ICON_CIVICBOOSTED] 鼓舞。标志着科技胜利的第二步。"),
	("zh_Hans_CN",  "LOC_PROJECT_BREAD_AND_CIRCUSES_DESCRIPTION",							"城市项目，可增加此城市对自身和对附近其他城市施加的忠诚度压力。[NEWLINE][NEWLINE]项目启动后，每位 [ICON_Citizen] 公民每回合对此城所施加的忠诚度压力+1。此忠诚度压力还将影响9个单元格以内的其他城市，但每远离1个单元格，效果减弱10%。项目完成后此城立即+20忠诚度。[NEWLINE][NEWLINE]需要先建成“娱乐设施”区域。"),
	("zh_Hans_CN",  "LOC_PROJECT_CIRCUSES_AND_BREAD_HD_NAME",								"爱之审判"),
	("zh_Hans_CN",  "LOC_PROJECT_CIRCUSES_AND_BREAD_HD_SHORT_NAME",						  "爱之审判"),
	("zh_Hans_CN",  "LOC_PROJECT_CIRCUSES_AND_BREAD_HD_DESCRIPTION",						 "完成时将使9个单元格以内每回合忠诚度在减少的其他文明城市失去全部忠诚度。"),
	("zh_Hans_CN",  "LOC_PROJECT_ENDLESS_MONEY_HD_NAME",									 "多钱善贾"),
	("zh_Hans_CN",  "LOC_PROJECT_ENDLESS_MONEY_HD_SHORT_NAME",							   "多钱善贾"),
	("zh_Hans_CN",  "LOC_PROJECT_ENDLESS_MONEY_HD_DESCRIPTION",							  "城市项目，每回合提供巨额 [ICON_Gold] 金币。"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_NAME",							 "良驹育种"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_SHORT_NAME",					   "良驹育种"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_HORSES_HD_DESCRIPTION",					  "马厩项目，项目完成后提供20点 [ICON_RESOURCE_HORSES] 马。"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_IRON_HD_NAME",							   "土制高炉"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_IRON_HD_SHORT_NAME",						 "土制高炉"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_IRON_HD_DESCRIPTION",						"兵营项目，项目完成后提供20点 [ICON_RESOURCE_IRON] 铁。"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_NITER_HD_NAME",							  "烈性炸药"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_NITER_HD_SHORT_NAME",						"烈性炸药"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_NITER_HD_DESCRIPTION",					   "兵工厂项目，项目完成后提供20点 [ICON_RESOURCE_NITER] 硝石。"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_COAL_HD_NAME",							   "特种燃料"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_COAL_HD_SHORT_NAME",						 "特种燃料"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_COAL_HD_DESCRIPTION",						"兵工厂项目，项目完成后提供20点 [ICON_RESOURCE_COAL] 煤。"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_OIL_HD_NAME",								"页岩提取"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_OIL_HD_SHORT_NAME",						  "页岩提取"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_OIL_HD_DESCRIPTION",						 "军事学院项目，项目完成后提供20点 [ICON_RESOURCE_OIL] 石油。"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_NAME",						   "稀土研究"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_SHORT_NAME",					 "稀土研究"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_ALUMINUM_HD_DESCRIPTION",					"军事学院项目，项目完成后提供20点 [ICON_RESOURCE_ALUMINUM] 铝。"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_NAME",							"气体离心"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_SHORT_NAME",					  "气体离心"),
	("zh_Hans_CN",  "LOC_PROJECT_GRANT_RESOURCE_URANIUM_HD_DESCRIPTION",					 "军事学院项目，项目完成后提供20点 [ICON_RESOURCE_URANIUM] 铀。");
	-- ("zh_Hans_CN",  "LOC_PROJECT_RECRUIT_WORKERS_HD_NAME",								   "征发民夫"),
	-- ("zh_Hans_CN",  "LOC_PROJECT_RECRUIT_WORKERS_HD_SHORT_NAME",							 "征发民夫"),
	-- ("zh_Hans_CN",  "LOC_PROJECT_RECRUIT_WORKERS_HD_DESCRIPTION",							"城市项目，项目完成后，若此城至少有2 [ICON_Citizen] 人口，则获得1名建造者，城市-1 [ICON_Citizen] 人口；若该城市只有1 [ICON_Citizen] 人口，则在下一次人口增长时，获得1名建造者，城市-1 [ICON_Citizen] 人口。");

--------------------------------------------------------------------------------   
-- error texts
-- Language: en_US
insert or replace into EnglishText
	(Tag,																	 Text)
values
	("LOC_CITY_YIELD_MODIFIER_PER_GOVERNOR_TITLE_TOOLTIP",					"{Value : number +#;-#}% ({ActualValue : number +#.#;-#.#}) from [ICON_Governor] Governor with {1} {1 : plural 1?Promotion; other?Promotions;}");

-- Language: zh_Hans_CN
insert or replace into LocalizedText
	(Language,	  Tag,																 Text)
values
	("zh_Hans_CN",  "LOC_CITY_YIELD_FROM_TERRAIN_TOOLTIP",							   "{Value : number +#.#;-#.#}来自地形"),
	("zh_Hans_CN",  "LOC_PLAYER_YIELD_FAITH_FROM_BELIEFS",							   "{Value : number +#.#;-#.#}来自信仰"),
	("zh_Hans_CN",  "LOC_PLAYER_YIELD_CULTURE_FROM_TRIBUTARIES",						 "{Value : number +#.#;-#.#}来自您是领主的城邦"),
	("zh_Hans_CN",  "LOC_CITY_YIELD_MODIFIER_PER_GOVERNOR_TITLE_TOOLTIP",				"{Value : number +#;-#}%（{ActualValue : number +#.#;-#.#}）来自拥有{1}次{1 : plural 1?升级; other?升级;}的 [ICON_Governor] 总督");

insert or replace into LocalizedText (Language, Tag, Text) values
("en_US", "LOC_CITY_NAME_HANDAN", "Handan"),
("zh_Hans_CN", "LOC_CITY_NAME_HANDAN", "邯郸"),
("en_US", "LOC_CITY_NAME_LUOYANG", "Luoyang"),
("zh_Hans_CN", "LOC_CITY_NAME_LUOYANG", "洛阳"),
("en_US", "LOC_CITY_NAME_CHANGAN", "Chang'an"),
("zh_Hans_CN", "LOC_CITY_NAME_CHANGAN", "长安"),
("en_US", "LOC_CITY_NAME_JINLING", "Jinling"),
("zh_Hans_CN", "LOC_CITY_NAME_JINLING", "金陵"),
("en_US", "LOC_CITY_NAME_BA", "Ba"),
("zh_Hans_CN", "LOC_CITY_NAME_BA", "巴"),
("en_US", "LOC_CITY_NAME_YING", "Ying"),
("zh_Hans_CN", "LOC_CITY_NAME_YING", "郢"),
("en_US", "LOC_CITY_NAME_SHOUCHUN", "Shouchun"),
("zh_Hans_CN", "LOC_CITY_NAME_SHOUCHUN", "寿春"),
("en_US", "LOC_CITY_NAME_CHENGDU", "Chengdu"),
("zh_Hans_CN", "LOC_CITY_NAME_CHENGDU", "成都"),
("en_US", "LOC_CITY_NAME_CHANGSHA", "Changsha"),
("zh_Hans_CN", "LOC_CITY_NAME_CHANGSHA", "长沙"),
("en_US", "LOC_CITY_NAME_KUAIJI", "Kuaiji"),
("zh_Hans_CN", "LOC_CITY_NAME_KUAIJI", "会稽"),
("en_US", "LOC_CITY_NAME_GUANGLING", "Guangling"),
("zh_Hans_CN", "LOC_CITY_NAME_GUANGLING", "广陵"),
("en_US", "LOC_CITY_NAME_PANYU", "Panyu"),
("zh_Hans_CN", "LOC_CITY_NAME_PANYU", "番禺"),
("en_US", "LOC_CITY_NAME_YE", "Ye"),
("zh_Hans_CN", "LOC_CITY_NAME_YE", "邺"),
("en_US", "LOC_CITY_NAME_YANGDI", "Yangdi"),
("zh_Hans_CN", "LOC_CITY_NAME_YANGDI", "阳翟"),
("en_US", "LOC_CITY_NAME_LANGYA", "Langya"),
("zh_Hans_CN", "LOC_CITY_NAME_LANGYA", "琅琊"),
("en_US", "LOC_CITY_NAME_SHANGCAI", "Shangcai"),
("zh_Hans_CN", "LOC_CITY_NAME_SHANGCAI", "上蔡"),
("en_US", "LOC_CITY_NAME_JYULU", "Jyulu"),
("zh_Hans_CN", "LOC_CITY_NAME_JYULU", "巨鹿"),
("en_US", "LOC_CITY_NAME_YUNZHONG", "Yunzhong"),
("zh_Hans_CN", "LOC_CITY_NAME_YUNZHONG", "云中"),
("en_US", "LOC_CITY_NAME_YINGCHUAN", "Yingchuan"),
("zh_Hans_CN", "LOC_CITY_NAME_YINGCHUAN", "颍川"),
("en_US", "LOC_CITY_NAME_JIMO", "Jimo"),
("zh_Hans_CN", "LOC_CITY_NAME_JIMO", "即墨"),
("en_US", "LOC_CITY_NAME_LIAOYANG", "Liaoyang"),
("zh_Hans_CN", "LOC_CITY_NAME_LIAOYANG", "辽阳"),
("en_US", "LOC_CITY_NAME_GUSU", "Gusu"),
("zh_Hans_CN", "LOC_CITY_NAME_GUSU", "姑苏"),
("en_US", "LOC_CITY_NAME_SHANGDANG", "Shangdang"),
("zh_Hans_CN", "LOC_CITY_NAME_SHANGDANG", "上党"),
("en_US", "LOC_CITY_NAME_DALIANG", "Daliang"),
("zh_Hans_CN", "LOC_CITY_NAME_DALIANG", "大梁"),
("en_US", "LOC_CITY_NAME_TAIYUAN", "Taiyuan"),
("zh_Hans_CN", "LOC_CITY_NAME_TAIYUAN", "太原"),
("en_US", "LOC_CITY_NAME_LINZI", "Linzi"),
("zh_Hans_CN", "LOC_CITY_NAME_LINZI", "临淄"),
("en_US", "LOC_CITY_NAME_LANLING", "Lanling"),
("zh_Hans_CN", "LOC_CITY_NAME_LANLING", "兰陵"),
("en_US", "LOC_CITY_NAME_PUYANG", "Puyang"),
("zh_Hans_CN", "LOC_CITY_NAME_PUYANG", "濮阳"),
("en_US", "LOC_CITY_NAME_YEWANG", "Yewang"),
("zh_Hans_CN", "LOC_CITY_NAME_YEWANG", "野王"),
("en_US", "LOC_CITY_NAME_XINZHENG", "Xinzheng"),
("zh_Hans_CN", "LOC_CITY_NAME_XINZHENG", "新郑"),
("en_US", "LOC_CITY_NAME_PENGCHENG", "Pengcheng"),
("zh_Hans_CN", "LOC_CITY_NAME_PENGCHENG", "彭城"),
("en_US", "LOC_CITY_NAME_WAN", "Wan"),
("zh_Hans_CN", "LOC_CITY_NAME_WAN", "宛"),
("en_US", "LOC_CITY_NAME_XIANGYANG", "Xiangyang"),
("zh_Hans_CN", "LOC_CITY_NAME_XIANGYANG", "襄阳"),
("en_US", "LOC_CITY_NAME_HUAIYIN", "Huaiyin"),
("zh_Hans_CN", "LOC_CITY_NAME_HUAIYIN", "淮阴"),
("en_US", "LOC_CITY_NAME_ZHAOGE", "Zhaoge"),
("zh_Hans_CN", "LOC_CITY_NAME_ZHAOGE", "朝歌"),
("en_US", "LOC_CITY_NAME_QUFU", "Qufu"),
("zh_Hans_CN", "LOC_CITY_NAME_QUFU", "曲阜"),
("en_US", "LOC_CITY_NAME_JIANGLING", "Jiangling"),
("zh_Hans_CN", "LOC_CITY_NAME_JIANGLING", "江陵"),
("en_US", "LOC_CITY_NAME_PINGYAO", "Pingyao"),
("zh_Hans_CN", "LOC_CITY_NAME_PINGYAO", "平陶"),
("en_US", "LOC_CITY_NAME_YUHANG", "Yuhang"),
("zh_Hans_CN", "LOC_CITY_NAME_YUHANG", "余杭"),
("en_US", "LOC_CITY_NAME_FENG", "Feng"),
("zh_Hans_CN", "LOC_CITY_NAME_FENG", "丰"),
("en_US", "LOC_CITY_NAME_PEI", "Pei"),
("zh_Hans_CN", "LOC_CITY_NAME_PEI", "沛"),
("en_US", "LOC_CITY_NAME_JI", "Ji"),
("zh_Hans_CN", "LOC_CITY_NAME_JI", "蓟"),
("en_US", "LOC_CITY_NAME_BEIPING", "Beiping"),
("zh_Hans_CN", "LOC_CITY_NAME_BEIPING", "北平"),
("en_US", "LOC_CITY_NAME_SONGJIANG", "Songjiang"),
("zh_Hans_CN", "LOC_CITY_NAME_SONGJIANG", "松江"),
("en_US", "LOC_CITY_NAME_CANGWU", "Cangwu"),
("zh_Hans_CN", "LOC_CITY_NAME_CANGWU", "苍梧"),
("en_US", "LOC_CITY_NAME_GUILIN", "Guilin"),
("zh_Hans_CN", "LOC_CITY_NAME_GUILIN", "桂林"),
("en_US", "LOC_CITY_NAME_GUZANG", "Guzang"),
("zh_Hans_CN", "LOC_CITY_NAME_GUZANG", "姑臧"),
("en_US", "LOC_CITY_NAME_ZHANGYE", "Zhangye"),
("zh_Hans_CN", "LOC_CITY_NAME_ZHANGYE", "张掖"),
("en_US", "LOC_CITY_NAME_DUNHUANG", "Dunhuang"),
("zh_Hans_CN", "LOC_CITY_NAME_DUNHUANG", "敦煌"),
("en_US", "LOC_CITY_NAME_JIUQUAN", "Jiuquan"),
("zh_Hans_CN", "LOC_CITY_NAME_JIUQUAN", "酒泉"),
("en_US", "LOC_CITY_XIANYANG", "Xianyang"),
("zh_Hans_CN", "LOC_CITY_XIANYANG", "咸阳"),
("en_US", "LOC_CITY_DADU", "Dayidu"),
("zh_Hans_CN", "LOC_CITY_DADU", "大都"),
("en_US", "LOC_NAMED_DESERT_GOBI_NAME", "Gobi Desert"),
("zh_Hans_CN", "LOC_NAMED_DESERT_GOBI_NAME", "大漠"),
("en_US", "LOC_NAMED_DESERT_TAKLAMAKAN_NAME", "Taklamakan Desert"),
("zh_Hans_CN", "LOC_NAMED_DESERT_TAKLAMAKAN_NAME", "流沙"),
("en_US", "LOC_NAMED_LAKE_CHAO_LAKE_NAME", "Dayeze Lake"),
("zh_Hans_CN", "LOC_NAMED_LAKE_CHAO_LAKE_NAME", "大野泽"),
("en_US", "LOC_NAMED_LAKE_DONGTING_LAKE_NAME", "Dongting Lake"),
("zh_Hans_CN", "LOC_NAMED_LAKE_DONGTING_LAKE_NAME", "云梦泽"),
("en_US", "LOC_NAMED_LAKE_HONGZE_LAKE_NAME", "Leichi Lake"),
("zh_Hans_CN", "LOC_NAMED_LAKE_HONGZE_LAKE_NAME", "雷池"),
("en_US", "LOC_NAMED_LAKE_HULUN_LAKE_NAME", "Mianchi Lake"),
("zh_Hans_CN", "LOC_NAMED_LAKE_HULUN_LAKE_NAME", "渑池"),
("en_US", "LOC_NAMED_LAKE_LAKE_KHANKA_NAME", "Lake Baikal"),
("zh_Hans_CN", "LOC_NAMED_LAKE_LAKE_KHANKA_NAME", "北海"),
("en_US", "LOC_NAMED_LAKE_LAKE_TAI_NAME", "Lake Tai"),
("zh_Hans_CN", "LOC_NAMED_LAKE_LAKE_TAI_NAME", "震泽"),
("en_US", "LOC_NAMED_LAKE_POYANG_LAKE_NAME", "Poyang Lake"),
("zh_Hans_CN", "LOC_NAMED_LAKE_POYANG_LAKE_NAME", "彭蠡泽"),
("en_US", "LOC_NAMED_LAKE_QINGHAI_LAKE_NAME", "Qinghai Lake"),
("zh_Hans_CN", "LOC_NAMED_LAKE_QINGHAI_LAKE_NAME", "西海"),
("en_US", "LOC_NAMED_LAKE_WEST_LAKE_NAME", "Etsi-gol"),
("zh_Hans_CN", "LOC_NAMED_LAKE_WEST_LAKE_NAME", "居延泽"),
("en_US", "LOC_NAMED_MOUNTAIN_HENGDUAN_NAME", "Bashan Mountains"),
("zh_Hans_CN", "LOC_NAMED_MOUNTAIN_HENGDUAN_NAME", "巴山"),
("en_US", "LOC_NAMED_MOUNTAIN_HIMALAYAS_NAME", "Qilian Mountains"),
("zh_Hans_CN", "LOC_NAMED_MOUNTAIN_HIMALAYAS_NAME", "祁连山"),
("en_US", "LOC_NAMED_MOUNTAIN_HINDU_KUSH_NAME", "Mount Taishan"),
("zh_Hans_CN", "LOC_NAMED_MOUNTAIN_HINDU_KUSH_NAME", "泰山"),
("en_US", "LOC_NAMED_MOUNTAIN_KARAKORAM_NAME", "Taihang Mountains"),
("zh_Hans_CN", "LOC_NAMED_MOUNTAIN_KARAKORAM_NAME", "太行山"),
("en_US", "LOC_NAMED_MOUNTAIN_KHINGAN_NAME", "Khangai Mountains"),
("zh_Hans_CN", "LOC_NAMED_MOUNTAIN_KHINGAN_NAME", "燕然山"),
("en_US", "LOC_NAMED_MOUNTAIN_KUNLUN_NAME", "Kunlun Mountains"),
("zh_Hans_CN", "LOC_NAMED_MOUNTAIN_KUNLUN_NAME", "昆仑山"),
("en_US", "LOC_NAMED_MOUNTAIN_PAMIRS_NAME", "Pamir Mountains"),
("zh_Hans_CN", "LOC_NAMED_MOUNTAIN_PAMIRS_NAME", "葱岭"),
("en_US", "LOC_NAMED_MOUNTAIN_QINLING_NAME", "Qinling"),
("zh_Hans_CN", "LOC_NAMED_MOUNTAIN_QINLING_NAME", "秦岭"),
("en_US", "LOC_NAMED_MOUNTAIN_TIEN_SHAN_NAME", "Tian Shan"),
("zh_Hans_CN", "LOC_NAMED_MOUNTAIN_TIEN_SHAN_NAME", "天山"),
("en_US", "LOC_NAMED_RIVER_AMUR_NAME", "Yangtze River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_AMUR_NAME", "江水"),
("en_US", "LOC_NAMED_RIVER_HAI_NAME", "Yellow River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_HAI_NAME", "河水"),
("en_US", "LOC_NAMED_RIVER_PEARL_NAME", "Ruo Shui"),
("zh_Hans_CN", "LOC_NAMED_RIVER_PEARL_NAME", "弱水"),
("en_US", "LOC_NAMED_RIVER_SALWEEN_NAME", "Jing River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_SALWEEN_NAME", "泾水"),
("en_US", "LOC_NAMED_RIVER_SONGHUA_RIVER_NAME", "Fen River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_SONGHUA_RIVER_NAME", "汾水"),
("en_US", "LOC_NAMED_RIVER_TARIM_NAME", "Han River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_TARIM_NAME", "汉水"),
("en_US", "LOC_NAMED_RIVER_WEI_NAME", "Liao River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_WEI_NAME", "辽水"),
("en_US", "LOC_NAMED_RIVER_YANGTZE_NAME", "Qiantang River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_YANGTZE_NAME", "浙水"),
("en_US", "LOC_NAMED_RIVER_YELLOW_NAME", "Wei River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_YELLOW_NAME", "渭水"),
("en_US", "LOC_NAMED_RIVER_XIANGJIANG_NAME", "Xiang River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_XIANGJIANG_NAME", "湘水"),
("en_US", "LOC_NAMED_RIVER_JISHUI_NAME", "Ji River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_JISHUI_NAME", "济水"),
("en_US", "LOC_NAMED_RIVER_SISHUI_NAME", "Si River"),
("zh_Hans_CN", "LOC_NAMED_RIVER_SISHUI_NAME", "泗水"),
("en_US", "LOC_NAMED_SEA_BO_HAI_NAME", "Bo Hai"),
("zh_Hans_CN", "LOC_NAMED_SEA_BO_HAI_NAME", "渤海"),
("en_US", "LOC_NAMED_SEA_EAST_CHINA_SEA_NAME", "East China Sea"),
("zh_Hans_CN", "LOC_NAMED_SEA_EAST_CHINA_SEA_NAME", "东海"),
("en_US", "LOC_NAMED_SEA_GULF_OF_TONKIN_NAME", "Lingdingyang Bay"),
("zh_Hans_CN", "LOC_NAMED_SEA_GULF_OF_TONKIN_NAME", "零丁洋"),
("en_US", "LOC_NAMED_SEA_SOUTH_CHINA_SEA_NAME", "South China Sea"),
("zh_Hans_CN", "LOC_NAMED_SEA_SOUTH_CHINA_SEA_NAME", "南海"),
("en_US", "LOC_NAMED_SEA_YELLOW_SEA_NAME", "Yellow Sea"),
("zh_Hans_CN", "LOC_NAMED_SEA_YELLOW_SEA_NAME", "黄海"),
("en_US", "LOC_NAMED_VOLCANO_PAEKTU_NAME", "Mount Paektu"),
("zh_Hans_CN", "LOC_NAMED_VOLCANO_PAEKTU_NAME", "长白山");