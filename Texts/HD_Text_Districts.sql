--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
	(Tag,															 Text)
values
	("LOC_DISTRICT_HOLY_SITE_HD_DESCRIPTION",						 "A district in your city for religious worship. +10% [ICON_Faith] Faith if there exists a third-tier worship building in the district. +1 Appeal to adjacent tiles."),
	("LOC_DISTRICT_LAVRA_HD_DESCRIPTION",							 "A district unique to Russia for religious activity. Replaces the Holy Site district and cheaper to build.[NEWLINE][NEWLINE]The citizens working in this district also yield Great Writer, Artist and Musician points. Your city border grows by one tile each time a Great Person is expended in this city. +10% [ICON_Faith] Faith if there exists a third-tier worship building in the district. +1 Appeal to adjacent tiles."),
	("LOC_DISTRICT_INDUSTRIAL_ZONE_HD_DESCRIPTION",					"A district in your city for industrial activity. -1 Appeal to adjacent tiles. +1 [ICON_PRODUCTION] Production for Quarries over bonus resources in this city."), -- +1 [ICON_PRODUCTION] Production for Mines in this city. 
	("LOC_DISTRICT_HANSA_HD_DESCRIPTION",							 "A district unique to Germany for industrial activity. Replaces the Industrial Zone district and cheaper to build.[NEWLINE][NEWLINE]+2 [ICON_PRODUCTION] Production when adjacent to River. +2 [ICON_PRODUCTION] Production bonus for each adjacent Harbor, Aqueduct, and Dam districts. +2 [ICON_PRODUCTION] Production bonus for each adjacent Canal districts. +1 [ICON_PRODUCTION] Production bonus for each adjacent Commercial Hub districts and Resources (doubles after researching Apprenticeship). +1 [ICON_PRODUCTION] Production bonus for every two adjacent District tiles. +1 [Icon_Production] Production to adjacent Resources. Provides Major adjacency bonus to Commercial Hub Districts. -1 Appeal to adjacent tiles. +1 [ICON_PRODUCTION] Production for Quarries over bonus resources in this city."), -- +1 [ICON_PRODUCTION] Production for Mines in this city. 
	("LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION",							"A district unique to Gaul that is cheaper than the district it replaces, the Industrial Zone. The Oppidum district is defensible with a ranged attack. All [ICON_Citizen] citizens in this city provide +0.5 [ICON_PRODUCTION] Production. When the first Oppidum is constructed, the Metal Casting technology is unlocked.[NEWLINE][NEWLINE]+2 [ICON_PRODUCTION] Production adjacency bonus from Quarries and Strategic resources. -1 Appeal to adjacent tiles. +1 [ICON_PRODUCTION] Production for Quarries over bonus resources in this city."), -- +1 [ICON_PRODUCTION] Production for Mines in this city. 
	("LOC_DISTRICT_AQUEDUCT_HD_DESCRIPTION",							"A district that provides this city with a source of fresh water from an adjacent River, Lake, Oasis, or Mountain. Cities that do not yet have existing fresh water receive up to 6 [ICON_Housing] Housing. Cities that already have existing fresh water will instead get +2 [ICON_Housing] Housing. If built adjacent to a Geothermal Fissure, +1 [ICON_Amenities] Amenity. Prevents [ICON_Food] Food loss during Drought.[NEWLINE]Farms gain +1 [ICON_FOOD] Food. [NEWLINE] Must be built adjacent to the City Center. Military Engineers can spend a charge to complete 30% of an Aqueduct's production. One per city."),
	("LOC_DISTRICT_BATH_HD_DESCRIPTION",								"A district unique to Rome for city growth. Replaces the Aqueduct district and cheaper to build.[NEWLINE][NEWLINE]It provides this city with a source of fresh water from an adjacent River, Lake, Oasis, or Mountain. Cities that do not yet have existing fresh water receive up to 6 [ICON_Housing] Housing. Cities that already have existing fresh water will instead get +2 [ICON_Housing] Housing. If built adjacent to a Geothermal Fissure, +1 [ICON_Amenities] Amenity. In all cases the Bath provides an additional bonus of +2 [ICON_Housing] Housing and +1 [ICON_Amenities] Amenity. Prevents [ICON_Food] Food loss during Drought. Must be built adjacent to the City Center.[NEWLINE]Farms gain +1 [ICON_FOOD] Food. [NEWLINE]Must be built adjacent to the City Center. Military Engineers can spend a charge to complete 30% of an Aqueduct's production. One per city."),
	("LOC_DISTRICT_HARBOR_HD_DESCRIPTION",							"A district for naval activity in your city. Also removes the [ICON_Movement] Movement penalty for embarking and disembarking to and from this tile. Must be built on Coast or Lake Terrain adjacent to land. +2 [ICON_HOUSING] Housing if this city is adjacent to a Coast or a Lake. Fishing Boats produce +1 [ICON_FOOD] Food in this city. +10% [ICON_PRODUCTION] production towards all naval units."),
	("LOC_DISTRICT_COTHON_HD_DESCRIPTION",							"A district unique to Phoenicia for naval activity in your city. Replaces the Harbor district and cheaper to build. Must be built on Coast or Lake Terrain adjacent to land. +2 [ICON_HOUSING] Housing if this city is adjacent to a Coast or a Lake. Fishing Boats yield +1 [ICON_FOOD] Food in this city. +15% growth rate for this city.[NEWLINE][NEWLINE]+30% [ICON_PRODUCTION] Production towards naval units, +50% [ICON_PRODUCTION] Production towards Settlers in this city. All wounded naval units in this city’s borders heal +100 HP each turn."),
	("LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_HD_DESCRIPTION",				"A district unique to England for naval activity in your city. Replaces the Harbor district. Also removes the [ICON_Movement] Movement penalty for embarking and disembarking to and from this tile. Must be built on Coast or Lake Terrain adjacent to land. +2 [ICON_HOUSING] Housing if this city is adjacent to a Coast or a Lake. Fishing Boats yield +1 [ICON_FOOD] Food in this city. +10% [ICON_PRODUCTION] production towards all naval units.[NEWLINE][NEWLINE]+1 [ICON_Movement] Movement for all naval units built in Dockyard. +2 [ICON_Gold] Gold and +4 Loyalty per turn when built on a foreign continent. +2 [ICON_Gold] Gold bonus for each adjacent Industrial Zone. Properly improved Strategic resources in the city gain an additional +2 per turn."),
	("LOC_DISTRICT_IKANDA_HD_DESCRIPTION",							"A district unique to Zulu which replaces the Encampment. Provides +1 [ICON_Housing] Housing. Once the Civic or Technology prerequisite is met, Corps and Armies can be trained without Military Academy building. Culture bombs adjacent tiles when finished. -25% Corps and Army training cost. Buildings in the Ikanda provide +2 [ICON_GOLD] Gold and +1 [ICON_SCIENCE] Science.[NEWLINE]+30% [ICON_PRODUCTION] Production towards Land Military Units. Mines over bonus resources in this city provide +1 [ICON_PRODUCTION] Production.	Improved Strategic resources in the city provide +1 [Icon_Science] Science. Properly improved Strategic resources in the city gain an additional +2 per turn. -1 Appeal to adjacent tiles."),
	("LOC_DISTRICT_THANH_HD_DESCRIPTION",							 "A district unique to Vietnam which replaces the Encampment. +1 [ICON_PRODUCTION] Production for every 2 adjacent District. Provides [ICON_CULTURE] Culture equal to its [ICON_PRODUCTION] Production adjacency bonus. After Flight is researched receive [ICON_TOURISM] Tourism equal to the [ICON_PRODUCTION] Production yield. This District does not require population, is cheaper to build, cannot be built adjacent to the city center, and is not a Specialty district.[NEWLINE]One per city. +10% [ICON_PRODUCTION] Production towards Land Military Units. +1 [ICON_PRODUCTION] Production for Mines over bonus resources in this city. +1 [Icon_Science] Science for improved Strategic resources in the city. Properly improved Strategic resources in the city gain an additional +2 per turn."),
	("LOC_DISTRICT_ENCAMPMENT_HD_DESCRIPTION",						"A district in your city for military facilities.[NEWLINE]+10% [ICON_PRODUCTION] Production towards Land Military Units. +1 [ICON_PRODUCTION] Production for Mines over bonus resources in this city. +1 [Icon_Science] Science for improved Strategic resources in the city. Properly improved Strategic resources in the city gain an additional +2 per turn. -1 Appeal to adjacent tiles."),
	("LOC_DISTRICT_MBANZA_HD_DESCRIPTION",							"A district unique to Kongo that can only be constructed in Rainforest or Woods. Replaces the Neighborhood district but is available earlier and cheaper to build. Provides +3 [ICON_Housing] Housing, +2 [ICON_Food] Food, and +2 [ICON_Gold] Gold, regardless of Appeal. +1 [ICON_FOOD] Food and +1 Appeal to all adjacent tiles. +2 [ICON_PRODUCTION] Production if adjacent to bonus resources; +4 [ICON_Gold] Gold if adjacent to luxury resources; +2 [Icon_Science] Science if adjacent to strategic resources. Allows the purchasing of Settlers and Builders using [ICON_Faith] Faith."),
	("LOC_DISTRICT_AERODROME_HD_DESCRIPTION",						 "A district that allows you to build and store aircraft. Cannot be built on Hills. Can be built regardless of [ICON_CITIZEN] population. +25% [Icon_Production] Production towards Air Units. -1 Appeal to adjacent tiles. "),
	("LOC_DISTRICT_DIPLOMATIC_QUARTER_HD_DESCRIPTION",				"Districts recieve +1 adjacency bonuses from being adjacent to Diplomatic Quater. Your civilization receives +1 [ICON_FAVOR] Diplomatic Favor for each Delegation or Embassy from a foreign civilization through diplomacy. Awards 1 [ICON_Envoy] Envoy when completed. Enemy Spies operate at 2 levels below normal when targeting this District and adjacent Districts. Only 1 can exist in your empire at a time. Grants the ability to construct an additional Spy."), --	if built next to the city center
	("LOC_DISTRICT_ACROPOLIS_HD_DESCRIPTION",						 "A district unique to Greece for cultural sites. Replaces the Theater Square district and cheaper to build. Awards 1 [ICON_Envoy] Envoy when completed.[NEWLINE][NEWLINE]+1 [ICON_Culture] Culture bonus for each adjacent district and an additional +2 [ICON_Culture] Culture bonus for adjacent City Center. +1 [ICON_CULTURE] Culture when built on tiles with Charming Appeal. +3 [ICON_CULTURE] Culture when built on tiles with Breathtaking Appeal. Can only be built on Hills. +1 Appeal to adjacent tiles."),
	("LOC_DISTRICT_THEATER_HD_DESCRIPTION",							"A district in your city for cultural sites. +1 [ICON_CULTURE] Culture when built on tiles with Charming Appeal. +3 [ICON_CULTURE] Culture when built on tiles with Breathtaking Appeal."),
	("LOC_DISTRICT_WATER_ENTERTAINMENT_COMPLEX_HD_DESCRIPTION",		"A district placed out on a coastal tile dedicated to keeping your people happy by increasing [ICON_Amenities] Amenities. Cannot be built in a city with an Entertainment Complex."),
	("LOC_DISTRICT_PRESERVE_HD_DESCRIPTION",							"Triggers a Cultural Bomb on adjacent neutral tiles. Can be built on Forests, Rainforests and Marshes. Feature tiles in this city do not decrease the Appeal of adjacent tiles. Provides +1 Appeal to adjacent tiles."),
	("LOC_DISTRICT_WATER_STREET_CARNIVAL_HD_DESCRIPTION",			 "A district unique to Brazil. Replaces the Water Park district, and provides +4 [ICON_Amenities] Amenities.	When the first [ICON_GREATPERSON] Great People of each type is attracted or patronized, this district will provide +1 of the corresponding Yield (+1 [ICON_PRODUCTION] Production from [ICON_GREATGENERAL] Great General, +1 [ICON_FOOD] Food from [ICON_GREATADMIRAL] Great Admiral). Also unlocks the Carnival project, which grants an additional +1 [ICON_Amenities] Amenity when underway and a variety of [ICON_GreatPerson] Great People points once completed. Cannot be built in a city with a Street Carnival."),
	("LOC_DISTRICT_STREET_CARNIVAL_HD_DESCRIPTION",					"A district unique to Brazil. Replaces the Entertainment Complex district, and provides +4 [ICON_Amenities] Amenities. When the first [ICON_GREATPERSON] Great People of each type is attracted or patronized, this district will provide +1 of the corresponding Yield (+1 [ICON_PRODUCTION] Production from [ICON_GREATGENERAL] Great General, +1 [ICON_FOOD] Food from [ICON_GREATADMIRAL] Great Admiral). Also unlocks the Carnival project, which grants an additional +1 [ICON_Amenities] Amenity when underway and a variety of [ICON_GreatPerson] Great People points once completed. Cannot be built in a city with a Copacabana."),
	("LOC_DISTRICT_HIPPODROME_HD_DESCRIPTION",						"A district unique to Byzantium. Replaces the Entertainment Complex district, provides +4 [ICON_Amenities] Amenities, and is cheaper to build. When the Hippodrome and buildings in this district are constructed, receive a free Heavy Cavalry unit (no maintenance cost). Cannot be built if Water Park is already built. If adjacent to Stable or built in city with improved [ICON_HORSES] Horses, the city can build 1 one more district than the [ICON_CITIZEN] population limit allows."),
	("LOC_DISTRICT_COMMERCIAL_HUB_HD_DESCRIPTION",					"A district in your city specializing in finance and trade. +2 [ICON_Gold] Gold from [ICON_TradeRoute] Trade Routes starting from this city. +1 [ICON_Food] Food to Pastures over bonus resources in this city."),
	("LOC_DISTRICT_SUGUBA_HD_DESCRIPTION",							"A district unique to Mali specializing in finance and trade that replaces the Commercial Hub, gains major adjacency bonus when adjacent to Holy Site Districts. Enable purchasing Districts with [ICON_Gold] Gold in this city. Units, Buildings, and Districts are 20% cheaper to purchase with [ICON_GOLD] Gold and [ICON_FAITH] Faith in this City.[NEWLINE][NEWLINE]+2 [ICON_Gold] Gold from all domestic [ICON_TradeRoute] Trade Routes originated from this city. +1 [ICON_Culture] Culture and +1 [ICON_Science] Science from all international [ICON_TradeRoute] Trade Routes originated from this city. +1 [ICON_Food] Food to Pastures over bonus resources in this city."), --[NEWLINE][NEWLINE]+2 [ICON_Gold] Gold bonus for each adjacent Holy Site. +2 [ICON_Gold] Gold bonus for each adjacent Harbor.
	("LOC_DISTRICT_CANAL_HD_DESCRIPTION",							 "A district built on flat land to connect two bodies of water or a body of water to a City Center. +3 [ICON_Gold] Gold for adjacent tiles. Multiplier of	[ICON_Gold] Gold yield from districts at their destination [ICON_TradeRoute] Trade Routes passing through Canal is set to +100% (max. +100%). Canals may either go straight through the hex or bend by 60 degrees. However three-way Canal junctures are not allowed and Canals must have a full land tile on each side of the waterway they create. Military Engineers can spend a charge to complete 30% of a Canal's production."), -- [NEWLINE][NEWLINE]+1 [ICON_GreatWork_Product] Product Slot.
	("LOC_DISTRICT_DAM_HD_DESCRIPTION",								"A district built on a Floodplains tile to improve the comfort of living along a River. +1 [ICON_Food] Food and +1 [ICON_PRODUCTION] Production for adjacent Improvements. Prevents damage from flooding (though yields from flooding drop by 50%). Prevents [ICON_Food] Food loss during Drought. Only one may be built along each river's floodplain (whichever player completes one first) and the river must traverse at least two sides of the Dam hex. Military Engineers can spend a charge to complete 30% of a Dam's production."),
	("LOC_DISTRICT_SEOWON_HD_DESCRIPTION",							"A district unique to Korea. Replaces the Campus. +4 [Icon_Science] Science. Has more citizen slots."),
-- 社区
	("LOC_DISTRICT_NEIGHBORHOOD_HD_DESCRIPTION",						"A district for urban activities. Gives Housing according to the tile's appeal.[NEWLINE]Breathtaking: +5 [ICON_HOUSING] Housing.[NEWLINE]Charming: +4 [ICON_HOUSING] Housing.[NEWLINE]Average: +3 [ICON_HOUSING] Housing.[NEWLINE]Unappealing: +2 [ICON_HOUSING] Housing.[NEWLINE]Disgusting: +1 [ICON_HOUSING] Housing."),
	("LOC_DISTRICT_MBANZA_HD_DESCRIPTION",							"A district unique to the Congo that can only be constructed in Rainforest or Woods. Replaces the Neighborhood district but is available earlier. Provides +3 [ICON_HOUSING] Housing, +2 [ICON_FOOD] Food, and +2 [ICON_GOLD] Gold, regardless of Appeal. +1 [ICON_FOOD] Food and +1 Appeal to all adjacent tiles. Receives +1 [Icon_Production] Production from every Bonus Resource, +2 [Icon_Gold] Gold from every Luxury Resource and +1 [Icon_Science] Science from every Strategic Resource. Allows the purchasing of Settlers and Builders using [ICON_FAITH] Faith."),
	("LOC_DISTRICT_OBSERVATORY_HD_DESCRIPTION",             "A district unique to the Maya for scientific endeavors. Replaces the Campus district and cheaper to build.[NEWLINE][NEWLINE]+1 [ICON_Science] Science for every adjacent Luxury Resource, which becomes +2 after researching 'Astronomy' Technology. +1 [ICON_Science] Science for every 2 adjacent Farms, or for every 1 adjacent farm after progressing 'Feudalism' Civic.");


--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
	(Language,		Tag,															 Text)
values
	("zh_Hans_CN",	"LOC_DISTRICT_HOLY_SITE_HD_DESCRIPTION",						 "您城市里的宗教祭祀区。若该区域内含有三级宗教建筑，则本城+10% [ICON_Faith] 信仰值。为相邻单元格+1魅力。"),
	("zh_Hans_CN",	"LOC_DISTRICT_LAVRA_HD_DESCRIPTION",							 "俄罗斯特色宗教活动区域，替代“圣地”，建造费用更低。[NEWLINE][NEWLINE]该区域内的专家也产出大作家、大艺术家、大音乐家点数。此城市每消耗一位伟人，城市边界则扩张一个单元格。若该区域内含有三级宗教建筑，则本城+10% [ICON_Faith] 信仰值。为相邻单元格+1魅力。"),
	("zh_Hans_CN",	"LOC_DISTRICT_INDUSTRIAL_ZONE_HD_DESCRIPTION",					"您城市里的工业活动区。为相邻单元格-1魅力。[NEWLINE]为本城改良加成资源的采石场+1 [ICON_PRODUCTION] 生产力。"), 
	("zh_Hans_CN",	"LOC_DISTRICT_HANSA_HD_DESCRIPTION",							 "德国特色工业区域，替代“工业区”，建造费用更低。[NEWLINE][NEWLINE]相邻河流时获得+2 [ICON_PRODUCTION] 生产力加成。可从每个相邻的港口、水渠和堤坝区域处获得+2 [ICON_PRODUCTION] 生产力加成。可从每个相邻的运河区域处获得+3 [ICON_PRODUCTION] 生产力加成。可从每个相邻的商业中心和资源处获得+1 [ICON_PRODUCTION] 生产力加成（研究学徒后变为+2）。每两处相邻区域为其提供1点 [ICON_PRODUCTION] 生产力加成。为相邻的资源+1 [ICON_PRODUCTION] 生产力，为商业中心提供大量相邻加成。给相邻单元格-1魅力。[NEWLINE]为本城改良加成资源的采石场+1 [ICON_PRODUCTION] 生产力。"), 
	("zh_Hans_CN",	"LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION",							"高卢特色区域，替代“工业区”，建造花费更低。“奥皮杜姆”区域具有防御力且可执行远程攻击。本城每位 [ICON_Citizen] 公民+0.5 [ICON_PRODUCTION] 生产力。建成此区域后，即可解锁“金属铸造”科技。[NEWLINE][NEWLINE]每与一个采石场改良设施或战略资源相邻，则+2 [ICON_PRODUCTION] 生产力。为相邻单元格-1魅力。[NEWLINE]为本城改良加成资源的采石场+1 [ICON_PRODUCTION] 生产力。"),
	("zh_Hans_CN",	"LOC_DISTRICT_AQUEDUCT_HD_DESCRIPTION",							"区域从相邻河流、湖泊、绿洲或山脉引水，为该城市提供淡水资源。没有淡水资源的城市最多获得6个 [ICON_Housing] 住房。相反，已有淡水资源的城市 [ICON_Housing] 住房数量+2；若与地热裂缝相邻，提供+1 [ICON_Amenities] 宜居度。干旱时可防止 [ICON_Food] 食物损失。[NEWLINE]本城的农场+1 [ICON_FOOD] 食物。[NEWLINE] 必须修建在与市中心相邻的单元格中。军事工程师可消耗1次使用次数来完成水渠30%的修建进度。每个城市只允许建造1个。"),
	("zh_Hans_CN",	"LOC_DISTRICT_BATH_HD_DESCRIPTION",								"促进城市发展的罗马特色区域。取代水渠，建造费用更低。[NEWLINE][NEWLINE]从相邻河流、湖泊、绿洲或山脉引水，为该城市提供淡水资源。尚未拥有淡水资源的城市最多获得6个 [ICON_Housing] 住房。已有淡水资源的城市则+2 [ICON_Housing] 住房。若与地热裂缝相邻，提供+1 [ICON_Amenities] 宜居度。在任何情况下，浴场都能额外提供+2 [ICON_Housing] 住房和+1 [ICON_Amenities] 宜居度。干旱时可防止 [ICON_Food] 食物损失。必须修建在与市中心相邻的单元格中。[NEWLINE]本城的农场+1 [ICON_FOOD] 食物。[NEWLINE] 军事工程师可消耗1次使用次数来完成浴场30%的修建进度。每个城市只允许建造1个。"),
	("zh_Hans_CN",	"LOC_DISTRICT_HARBOR_HD_DESCRIPTION",							"城市中的海军活动区域。同时取消从该单元格上下船的 [ICON_Movement] 移动力消耗。必须修建在和陆地相邻的海岸或湖泊单元格上。如此城与海岸或湖边相邻，则+2 [ICON_HOUSING] 住房。为本城的渔船 +1 [ICON_FOOD] 食物。建造海军单位加速10%。"),
	("zh_Hans_CN",	"LOC_DISTRICT_COTHON_HD_DESCRIPTION",							"腓尼基特色城市海军活动区域，取代港口且建造成本更低。必须修建在和陆地相邻的海岸或湖泊单元格上。如此城与海岸或湖边相邻，则+2 [ICON_HOUSING] 住房。为本城的渔船 +1 [ICON_FOOD] 食物。本城的余粮+15%，建造海军单位和开拓者加速50%。海军单位在此城驻扎一回合可完全恢复。"),
	("zh_Hans_CN",	"LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_HD_DESCRIPTION",				"城市中的英国特色海军活动区域，取代港口且建造成本更低。同时移除该单元格的上船、下船 [ICON_Movement] 移动力减益。必须建在与陆地相邻的海岸或湖泊地形上。如此城与海岸或湖边相邻，则+2 [ICON_HOUSING] 住房。为本城的渔船 +1 [ICON_FOOD] 食物。建造海军单位加速10%。[NEWLINE][NEWLINE]皇家海军船坞中建造的所有海军单位+1 [ICON_Movement] 移动力。修建在外国大陆上时+2 [ICON_Gold] 金币、每回合的忠诚度+4。相邻每个工业区+2 [ICON_Gold] 金币。本城正确改良的战略每回合积累+2。"),
	("zh_Hans_CN",	"LOC_DISTRICT_IKANDA_HD_DESCRIPTION",							"祖鲁特色区域，替代“军营”。+1 [ICON_Housing] 住房。解锁相应的市政或科技后即可生产军团和军队。完成时对相邻的单元格施放文化炸弹。伊坎达和其中的建筑+2 [ICON_PRODUCTION] 生产力、+2 [ICON_SCIENCE] 科技值。创建军团和军队的价格变为标准价格的75%。[NEWLINE] 对陆地军事单位+30% 建造速度。此城中训练的所有抗骑兵单位+1 [ICON_Movement] 移动力。为本城改良加成资源的矿山+1 [ICON_PRODUCTION] 生产力。本城改良的战略资源+1 [ICON_Science] 科技值，正确改良的战略每回合积累+2。为相邻单元格-1魅力。"),
	("zh_Hans_CN",	"LOC_DISTRICT_THANH_HD_DESCRIPTION",							 "越南特色区域，替代“军营”。每与2个区域相邻+1 [ICON_PRODUCTION] 生产力。产出等同于 [ICON_PRODUCTION] 生产力相邻加成的 [ICON_CULTURE] 文化值。研究完“飞行”科技后，将获得与 [ICON_PRODUCTION] 生产力产量相等的 [ICON_TOURISM] 旅游业绩。此区域不需要人口、建造花费更低、无法建在市中心周围，也并非专业化区域。[NEWLINE]每个城市只允许建造1个。对陆地军事单位+10%建造速度。为本城改良加成资源的矿山+1 [ICON_PRODUCTION] 生产力。本城改良的战略资源+1 [ICON_Science] 科技值，正确改良的战略每回合积累+2。"),
	("zh_Hans_CN",	"LOC_DISTRICT_ENCAMPMENT_HD_DESCRIPTION",						"您城市里的军事机构区。[NEWLINE] 对陆地军事单位+10%建造速度。为本城改良加成资源的矿山+1 [ICON_PRODUCTION] 生产力。本城改良的战略资源+1 [ICON_Science] 科技值，正确改良的战略每回合积累+2。为相邻单元格-1魅力。"),
	("zh_Hans_CN",	"LOC_DISTRICT_AERODROME_HD_DESCRIPTION",						 "可用于建造和存放飞机的区域。不能建在丘陵上。建造不受人口限制。建造空中单位时，+25%建造速度。为相邻单元格-1魅力。"),
	("zh_Hans_CN",	"LOC_DISTRICT_DIPLOMATIC_QUARTER_HD_DESCRIPTION",				"使相邻区域获得的相邻加成+1。通过外交，外国文明的每个代表团或大使馆将为您的文明提供+1 [ICON_FAVOR] 外交支持。建成后奖励1名 [ICON_Envoy] 使者。敌方间谍将此区域和相邻区域当做目标时，其效果将降低2级。文明中一次仅限建造一座此区域。可额外招募一名间谍。"), --如建在市中心旁，则
	("zh_Hans_CN",	"LOC_DISTRICT_ACROPOLIS_HD_DESCRIPTION",						 "希腊特色文化遗址区域，替代“剧院广场”，建造费用更低。建成后奖励1名 [ICON_Envoy] 使者。[NEWLINE][NEWLINE]每个相邻区域+1 [ICON_Culture] 文化值，每个相邻市中心额外+2 [ICON_Culture] 文化值。若位于拥有迷人魅力的单元格+1 [ICON_Culture] 文化值，惊艳单元格则+3 [ICON_Culture] 文化值。只能建在丘陵上。为相邻单元格+1魅力。"),
	("zh_Hans_CN",	"LOC_DISTRICT_THEATER_HD_DESCRIPTION",							"您城市里的文化遗址区。若位于拥有迷人魅力的单元格+1 [ICON_Culture] 文化值，惊艳单元格则+3 [ICON_Culture] 文化值。"),
	("zh_Hans_CN",	"LOC_DISTRICT_WATER_ENTERTAINMENT_COMPLEX_HD_DESCRIPTION",		"建在海岸单元格上的区域，可增加 [ICON_Amenities] 宜居度，让人民生活幸福。无法建在拥有娱乐设施的城市中。"),
	("zh_Hans_CN",	"LOC_DISTRICT_PRESERVE_HD_DESCRIPTION",							"对相邻的中立单元格施放文化炸弹。可以建造在森林、雨林或沼泽上。本城的地貌不再降低魅力。为相邻单元格+1魅力。"),
	("zh_Hans_CN",	"LOC_DISTRICT_WATER_STREET_CARNIVAL_HD_DESCRIPTION",			 "巴西特色区域，替代“水上乐园”，+4 [ICON_Amenities] 宜居度。首次招募一种类型的 [ICON_GREATPERSON] 伟人时+1对应产出（ [ICON_GREATGENERAL] 大将军提供+1 [ICON_PRODUCTION]生产力， [ICON_GREATADMIRAL] 海军统帅提供+1 [ICON_FOOD] 食物）。可解锁“狂欢节”项目，项目进行时为本城提供+1 [ICON_Amenities] 宜居度，项目完成后可获得若干 [ICON_GreatPerson] 伟人点数。无法建在拥有“街头狂欢节”的城市中。"),
	("zh_Hans_CN",	"LOC_DISTRICT_STREET_CARNIVAL_HD_DESCRIPTION",					"巴西特色区域，替代“娱乐区”，+4 [ICON_Amenities] 宜居度。首次招募一种类型的 [ICON_GREATPERSON] 伟人时+1对应产出（ [ICON_GREATGENERAL] 大将军提供+1 [ICON_PRODUCTION]生产力， [ICON_GREATADMIRAL] 海军统帅提供+1 [ICON_FOOD] 食物）。可解锁“狂欢节”项目，项目进行时为本城提供+1 [ICON_Amenities] 宜居度，项目完成后可获得若干 [ICON_GreatPerson] 伟人点数。无法建在拥有“科帕卡瓦纳”的城市中。"),
	("zh_Hans_CN",	"LOC_DISTRICT_HIPPODROME_HD_DESCRIPTION",						"拜占庭特色区域。替代“娱乐区”，提供+4 [ICON_Amenities] 宜居度，且建造花费更低。建成跑马场及其中的建筑时，将获得1个重骑兵单位（此单位创建时不会消耗资源，也不会消耗资源维护）。无法建在拥有“水上乐园”的城市中。相邻马厩或所在城市有改良的 [ICON_RESOURCE_HORSES] 马时，所在城市可以无视 [ICON_CITIZEN] 人口限制额外建造1个区域。"),
	("zh_Hans_CN",	"LOC_DISTRICT_COMMERCIAL_HUB_HD_DESCRIPTION",					"城市中专注于金融和贸易的区域。本城出发的 [ICON_TradeRoute] 贸易路线+2 [ICON_Gold] 金币。改良加成资源的牧场+1 [ICON_Food] 食物。"),
	("zh_Hans_CN",	"LOC_DISTRICT_SUGUBA_HD_DESCRIPTION",							"马里特色区域，专精于经济与贸易，替代“商业中心”，与圣地相邻获得大相邻加成。允许本城使用金币购买区域。使用 [ICON_GOLD] 金币和 [ICON_FAITH] 信仰值在此城中购买单位、建筑和区域时，费用减少20%。[NEWLINE][NEWLINE]本城出发的 [ICON_TradeRoute] 贸易路线+2 [ICON_Gold] 金币。改良加成资源的牧场+1 [ICON_Food] 食物。"), --[NEWLINE][NEWLINE]每相邻一个圣地获得+2 [ICON_Gold] 金币加成。每相邻一个港口获得+2 [ICON_Gold] 金币加成。
	("zh_Hans_CN",	"LOC_DISTRICT_CANAL_HD_DESCRIPTION",							 "建在平原上的区域，连接两块水域单元格或将一块水域单元格与市中心连接。为相邻的单元格提供+3 [ICON_Gold] 金币。如 [ICON_TradeRoute] 贸易路线途径此处，其将从目的地的区域处获得成倍 [ICON_Gold] 金币。运河可笔直穿过单元格，也可在其中进行60度转向。无法建造三向连接运河，且运河在其所建水路的两侧皆必须含有一个完整的陆地单元格。军事工程师可消耗1次使用次数来完成运河30%的修建进度。"),
	("zh_Hans_CN",	"LOC_DISTRICT_DAM_HD_DESCRIPTION",								"建造在泛滥平原单元格上的区域，可改善此江河流域旁的民生质量（但来自洪水的产出减半）。为相邻的改良设施+1 [ICON_Food] 食物和+1 [ICON_PRODUCTION] 生产力。其可防止江河泛滥带来的损害，还可在干旱时防止 [ICON_Food] 食物损失。每条江河的泛滥平原中仅能建造1个（有文明建成便视为已建造），且江河必须至少穿过堤坝格位的两个面。军事工程师可消耗1次使用次数来完成堤坝30%的修建进度。"),
	("zh_Hans_CN",	"LOC_DISTRICT_SEOWON_HD_DESCRIPTION",							"朝鲜特色区域，替代“学院”。+4 [Icon_Science] 科技值。拥有更多的专家槽位。"),
-- 社区
	("zh_Hans_CN",	"LOC_DISTRICT_NEIGHBORHOOD_HD_DESCRIPTION",						"您城市里的市民活动区域。基于单元格的魅力提供住房，情况如下：[NEWLINE]惊艳的：+5 [ICON_HOUSING] 住房。[NEWLINE]迷人的：+4 [ICON_HOUSING] 住房。[NEWLINE]普通的：+3 [ICON_HOUSING] 住房。[NEWLINE]无吸引力的：+2 [ICON_HOUSING] 住房。[NEWLINE]令人厌恶的：+1 [ICON_HOUSING] 住房。"),
	("zh_Hans_CN",	"LOC_DISTRICT_MBANZA_HD_DESCRIPTION",							"刚果特色区域，替代“社区”，可更早建造。只能建在雨林或树林里。无视魅力值，固定提供+3 [ICON_Housing] 住房、+2 [ICON_Food] 食物和+2 [ICON_Gold] 金币。为相邻的单元格提供 +1 [ICON_FOOD] 食物和+1魅力。从每个相邻的加成资源获得+1 [ICON_PRODUCTION] 生产力；从每个相邻的奢侈品资源获得+2 [ICON_Gold] 金币；从每个相邻的战略资源获得+1 [ICON_Science] 科技值。允许使用 [ICON_Faith] 信仰值购买开拓者和建造者。"),
	("zh_Hans_CN",  "LOC_DISTRICT_OBSERVATORY_HD_DESCRIPTION",              "玛雅特色科学研究区域。替代“学院”区域，且建造花费更低。[NEWLINE][NEWLINE]每相邻1个奢侈品相邻+1 [ICON_Science] 科技值，解锁“天文学”科技后变为+2 [ICON_Science] 科技值。每相邻2个农场+1 [ICON_Science] 科技值，解锁“封建主义”市政后变为每相邻1个农场。");
    
insert or replace into EnglishText
	(Tag,												Text)
values
	-- Adjacent to district
	("LOC_DISTRICT_INDUSTRIAL_ZONE_GOLD",				"+{1_num} [ICON_GOLD] Gold from the adjacent Industrial Zone {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_HANSA_GOLD",							"+{1_num} [ICON_GOLD] Gold from the adjacent Hansa {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_CANAL_GOLD",							"+{1_num} [ICON_GOLD] Gold from the adjacent Canal {1_Num : plural 3?district; other?districts;}."),
	("LOC_DISTRICT_CITY_CENTER_CULTURE",				"+{1_num} [ICON_CULTURE] Culture from the adjacent City Center {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_CITY_CENTER_SCIENCE",				"+{1_num} [ICON_SCIENCE] Science from the adjacent City Center {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_AERODROME_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent Aerodrome {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_NEIGHBORHOOD_FAITH",					"+{1_num} [ICON_FAITH] Faith from the adjacent Neighborhood {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_MBANZA_FAITH",						"+{1_num} [ICON_FAITH] Faith from the adjacent Mbanza {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_PRESERVE_FAITH",						"+{1_num} [ICON_FAITH] Faith from the adjacent Preserve {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_HARBOR_INDUSTRIAL_PRODUCTION",		"+{1_num} [ICON_PRODUCTION] Production from the adjacent Harbor {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_ROYALDOCK_INDUSTRIAL_PRODUCTION",	"+{1_num} [ICON_PRODUCTION] Production from the adjacent RoyalDock {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_COTHON_INDUSTRIAL_PRODUCTION",		"+{1_num} [ICON_PRODUCTION] Production from the adjacent Cothon {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_HARBOR_HANSA_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] Production from the adjacent Harbor {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_ROYALDOCK_HANSA_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] Production from the adjacent RoyalDock {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_COTHON_HANSA_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] Production from the adjacent Cothon {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_SUGUBA_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] Production from the adjacent Suguba {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_ENCAMPMENT_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent Encampment {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_THANH_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] Production from the adjacent Thành {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_IKANDA_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] Production from the adjacent Ikanda {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_HOLY_SITE_FAITH",					"+{1_num} [ICON_CULTURE] Culture from the adjacent Holy Site {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_LAVRA_FAITH",						"+{1_num} [ICON_CULTURE] Culture from the adjacent Lavra {1_Num : plural 2?district; other?districts;}."),
	("LOC_DISTRICT_DIPLOMATIC_QUATER_GOLD",				"+{1_num} [ICON_GOLD] Gold from the adjacent Diplomatic Quater {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_DIPLOMATIC_QUATER_FAITH",			"+{1_num} [ICON_FAITH] Faith from the adjacent Diplomatic Quater {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_DIPLOMATIC_QUATER_SCIENCE",			"+{1_num} [ICON_SCIENCE] Science from the adjacent Diplomatic Quater {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_DIPLOMATIC_QUATER_CULTURE",			"+{1_num} [ICON_CULTURE] Culture from the adjacent Diplomatic Quater {1_Num : plural 1?district; other?districts;}."),
	("LOC_DISTRICT_DIPLOMATIC_QUATER_PRODUCTION",		"+{1_num} [ICON_PRODUCTION] Production from the adjacent Diplomatic Quater {1_Num : plural 1?district; other?districts;}."),
	-- Adjacent to improvement
	("LOC_DISTRICT_QUARRY_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] Production from the adjacent Quarry {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_MINE_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] Production from the adjacent Mine {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_LUMBER_MILL_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent Lumber Mill {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_QUARRY_HALF_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent Quarry improvements."),
	("LOC_DISTRICT_MINE_HALF_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent Mine improvements."),
	("LOC_DISTRICT_LUMBER_MILL_HALF_PRODUCTION",		"+{1_num} [ICON_PRODUCTION] Production from the adjacent Lumber Mill improvements."),
	("LOC_DISTRICT_OIL_WELL_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent Oil Well {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_OFFSHORE_OIL_RIG_PRODUCTION",		"+{1_num} [ICON_PRODUCTION] Production from the adjacent Offshore Oil Rig {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_AIRSTRIP_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent Airstrip {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_MAORI_PA_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent Pā {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_MISSILE_SILO_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] Production from the adjacent Missile Silo {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_MOUNTAIN_TUNNEL_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] Production from the adjacent Mountain Tunnel {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_FORT_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] Production from the adjacent Fort {1_Num : plural 1?improvement; other?improvements;}."),
	("LOC_DISTRICT_ROMAN_FORT_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent Roman Fort {1_Num : plural 1?improvement; other?improvements;}."),
	-- Adjacent to resource
	("LOC_DISTRICT_SEARESOURCE_GOLD",					"+{1_num} [ICON_GOLD] Gold from the adjacent coastal {1_Num : plural 2?resource; other?resources;}."),
	("LOC_DISTRICT_HD_STRATEGIC_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] Production from the adjacent Strategic {1_Num : plural 2?resource; other?resources;}."),
	("LOC_DISTRICT_BONUS_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] Production from the adjacent Bonus {1_Num : plural 1?resource; other?resources;}."),
	("LOC_DISTRICT_STRATEGIC_SCIENCE",					"+{1_num} [ICON_SCIENCE] Science from the adjacent Strategic {1_Num : plural 1?resource; other?resources;}."),
	-- Misc
	("LOC_DISTRICT_SELF_FOOD",							"+{1_num} [ICON_FOOD] Food."),
	("LOC_DISTRICT_SELF_GOLD",							"+{1_num} [ICON_GOLD] Gold."),
	("LOC_DISTRICT_RIVER_HANSA_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] Production from the adjacent river."),
	("LOC_DISTRICT_MARSH_SCIENCE",						"+{1_num} [ICON_SCIENCE] Science from the adjacent Marsh {1_Num : plural 1?tile; other?tiles;}."),
	("LOC_SWAMP_FAITH",									"+{1_num} [ICON_FAITH] Faith from the adjacent Swamp {1_Num : plural 1?tile; other?tiles;}."),
    ("LOC_KELP_FAITH",									"+{1_num} [ICON_FAITH] Faith from the adjacent Kelp Forest {1_Num : plural 1?tile; other?tiles;}."),
	-- plural replacement
	("LOC_DISTRICT_CANAL_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] Production from the adjacent Canal {1_Num : plural 3?district; other?districts;}."),
	("LOC_DISTRICT_LUXURY_GOLD",						"+{1_num} [ICON_GOLD] Gold from the adjacent Luxury {1_Num : plural 2?resource; other?resources;}."),
	("LOC_DISTRICT_FOREST_FAITH",						"+{1_num} [ICON_FAITH] Faith from the adjacent Woods {1_Num : plural 1?tile; other?tiles;}.");

insert or replace into LocalizedText
	(Language,		Tag,												Text)
values
	-- Adjacent to district
	("zh_Hans_CN",	"LOC_DISTRICT_INDUSTRIAL_GOLD",						"+{1_num} [ICON_GOLD] 金币来自相邻的工业区。"),
	("zh_Hans_CN",	"LOC_DISTRICT_HANSA_GOLD",							"+{1_num} [ICON_GOLD] 金币来自相邻的商业同业工会。"),
	("zh_Hans_CN",	"LOC_DISTRICT_CANAL_GOLD",							"+{1_num} [ICON_GOLD] 金币来自相邻的运河。"),
	("zh_Hans_CN",	"LOC_DISTRICT_CITY_CENTER_CULTURE",					"+{1_num} [ICON_CULTURE] 文化值来自相邻的市中心。"),
	("zh_Hans_CN",	"LOC_DISTRICT_CITY_CENTER_SCIENCE",					"+{1_num} [ICON_SCIENCE] 科技值来自相邻的市中心。"),
	("zh_Hans_CN",	"LOC_DISTRICT_AERODROME_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的航空港。"),
	("zh_Hans_CN",	"LOC_DISTRICT_NEIGHBORHOOD_FAITH",					"+{1_num} [ICON_FAITH] 信仰值来自相邻的社区。"),
	("zh_Hans_CN",	"LOC_DISTRICT_MBANZA_FAITH",						"+{1_num} [ICON_FAITH] 信仰值来自相邻的姆班赞。"),
	("zh_Hans_CN",	"LOC_DISTRICT_PRESERVE_FAITH",						"+{1_num} [ICON_FAITH] 信仰值来自相邻的保护区。"),
	("zh_Hans_CN",	"LOC_DISTRICT_HARBOR_INDUSTRIAL_PRODUCTION",		"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的港口。"),
	("zh_Hans_CN",	"LOC_DISTRICT_ROYALDOCK_INDUSTRIAL_PRODUCTION",		"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的皇家海军船坞。"),
	("zh_Hans_CN",	"LOC_DISTRICT_COTHON_INDUSTRIAL_PRODUCTION",		"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的U型港。"),
	("zh_Hans_CN",	"LOC_DISTRICT_HARBOR_HANSA_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的港口。"),
	("zh_Hans_CN",	"LOC_DISTRICT_ROYALDOCK_HANSA_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的皇家海军船坞。"),
	("zh_Hans_CN",	"LOC_DISTRICT_COTHON_HANSA_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的U型港。"),
	("zh_Hans_CN",	"LOC_DISTRICT_SUGUBA_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的曼丁哥市场。"),
	("zh_Hans_CN",	"LOC_DISTRICT_ENCAMPMENT_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的军营。"),
	("zh_Hans_CN",	"LOC_DISTRICT_THANH_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的城池。"),
	("zh_Hans_CN",	"LOC_DISTRICT_IKANDA_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的伊坎达。"),
	("zh_Hans_CN",	"LOC_DISTRICT_HOLY_SITE_FAITH",						"+{1_num} [ICON_CULTURE] 文化值来自相邻的圣地。"),
	("zh_Hans_CN",	"LOC_DISTRICT_LAVRA_FAITH",							"+{1_num} [ICON_CULTURE] 文化值来自相邻的拉夫拉修道院。"),
	("zh_Hans_CN",	"LOC_DISTRICT_DIPLOMATIC_QUATER_GOLD",				"+{1_num} [ICON_GOLD] 金币来自相邻的外交区。"),
	("zh_Hans_CN",	"LOC_DISTRICT_DIPLOMATIC_QUATER_FAITH",				"+{1_num} [ICON_FAITH] 信仰值来自相邻的外交区。"),
	("zh_Hans_CN",	"LOC_DISTRICT_DIPLOMATIC_QUATER_SCIENCE",			"+{1_num} [ICON_SCIENCE] 科技值来自相邻的外交区。"),
	("zh_Hans_CN",	"LOC_DISTRICT_DIPLOMATIC_QUATER_CULTURE",			"+{1_num} [ICON_CULTURE] 文化值自相邻的外交区。"),
	("zh_Hans_CN",	"LOC_DISTRICT_DIPLOMATIC_QUATER_PRODUCTION",		"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的外交区。"),
	-- Adjacent to improvement
	("zh_Hans_CN",  "LOC_DISTRICT_QUARRY_HALF_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的采石场。"),
	("zh_Hans_CN",  "LOC_DISTRICT_MINE_HALF_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的矿山。"),
	("zh_Hans_CN",  "LOC_DISTRICT_LUMBER_MILL_HALF_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的伐木场。"),
	("zh_Hans_CN",  "LOC_DISTRICT_QUARRY_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的采石场。"),
	("zh_Hans_CN",  "LOC_DISTRICT_MINE_PRODUCTION",						"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的矿山。"),
	("zh_Hans_CN",  "LOC_DISTRICT_LUMBER_MILL_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的伐木场。"),
	("zh_Hans_CN",	"LOC_DISTRICT_OIL_WELL_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] 生产力来自相邻油井。"),
	("zh_Hans_CN",	"LOC_DISTRICT_OFFSHORE_OIL_RIG_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] 生产力来自相邻海上钻机平台。"),
	("zh_Hans_CN",	"LOC_DISTRICT_AIRSTRIP_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的飞机跑道。"),
	("zh_Hans_CN",	"LOC_DISTRICT_MAORI_PA_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的帕堡。"),
	("zh_Hans_CN",	"LOC_DISTRICT_MISSILE_SILO_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的导弹发射井。"),
	("zh_Hans_CN",	"LOC_DISTRICT_MOUNTAIN_TUNNEL_PRODUCTION",			"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的穿山隧道。"),
	("zh_Hans_CN",	"LOC_DISTRICT_FORT_PRODUCTION",						"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的堡垒。"),
	("zh_Hans_CN",	"LOC_DISTRICT_ROMAN_FORT_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的古罗马堡垒。"),
	-- Adjacent to resource
	("zh_Hans_CN",	"LOC_DISTRICT_LUXURY_GOLD",							"+{1_num} [ICON_GOLD] 金币来自相邻的奢侈品资源。"),
	("zh_Hans_CN",	"LOC_DISTRICT_HD_STRATEGIC_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的战略资源。"),
	("zh_Hans_CN",	"LOC_DISTRICT_BONUS_PRODUCTION",					"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的加成资源。"),
	("zh_Hans_CN",	"LOC_DISTRICT_STRATEGIC_SCIENCE",					"+{1_num} [ICON_SCIENCE] 科技值来自相邻的战略资源。"),
	-- Misc
	("zh_Hans_CN",	"LOC_DISTRICT_SELF_FOOD",							"+{1_num} [ICON_FOOD] 食物。"),
	("zh_Hans_CN",	"LOC_DISTRICT_SELF_GOLD",							"+{1_num} [ICON_GOLD] 金币。"),
	("zh_Hans_CN",	"LOC_DISTRICT_RIVER_HANSA_PRODUCTION",				"+{1_num} [ICON_PRODUCTION] 生产力来自相邻的河流。"),
	("zh_Hans_CN",	"LOC_DISTRICT_MARSH_SCIENCE",						"+{1_num} [ICON_SCIENCE] 科技值来自相邻的{LOC_FEATURE_MARSH_NAME}。"),
	("zh_Hans_CN",	"LOC_SWAMP_FAITH",									"+{1_num} [ICON_FAITH] 信仰值来自相邻的木本沼泽。"),
	("zh_Hans_CN",	"LOC_KELP_FAITH",									"+{1_num} [ICON_FAITH] 信仰值来自相邻的海藻森林。");