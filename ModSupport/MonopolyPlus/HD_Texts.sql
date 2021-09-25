update LocalizedText
set Text = replace(Text, "[NEWLINE][NEWLINE]Moving the [ICON_GREATWORK_PRODUCT] Product to another city or civilization grants this Corporation's tile +1 [ICON_GOLD] Gold. Consumes 2 [ICON_POWER] Power while produced.[NEWLINE]",
"[NEWLINE][NEWLINE]移动 [ICON_GREATWORK_PRODUCT] 产品到另一个城市或文明会给该公司所在单元格+1 [ICON_GOLD] 金币。在生产时消耗2点 [ICON_POWER] 电力。[NEWLINE]")
where Tag LIKE "LOC_PROJECT_CREATE_CORPORATION_PRODUCT_%_DESCRIPTION" and Language = 'zh_Hans_CN';

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                               Text)
values
    ("zh_Hans_CN",  "LOC_UNIT_LEU_TYCOON_NAME",                        "大亨"),
    ("zh_Hans_CN",  "LOC_UNIT_LEU_TYCOON_NOMONOPOLY_DESCRIPTION",      "需要“工作坊”方可购买的高价平民单位。[NEWLINE][NEWLINE]大亨们可以创建铁路和火车站来改善你的领土上的贸易和[ICON_PRODUCTION]生产。"),
    ("zh_Hans_CN",  "LOC_STATION_ADJ_PRODUCTION",                      "+{1_num} [ICON_PRODUCTION] 生产力来自相邻火车站"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_LEU_STATION_NAME",                "火车站"),
    ("zh_Hans_CN",  "LOC_IMPROVEMENT_LEU_STATION_DESCRIPTION",         "Improvement built by Tycoons. May only be built in flat terrain, but may be built in tiles with Forests, Floodplains and Rainforests.Only one may be built in each city, and may not be built adjacent to another Station[NEWLINE][NEWLINE]Stations provide [ICON_PRODUCTION] Production equal to 75% the Appeal of their tile. Adjacent tiles receive Railroads instantly and +1 Appeal. Receives [ICON_TOURISM] Tourism equal to the [icon_production] Production of the tile after the discovery of Steel.[NEWLINE][NEWLINE]Domestic Trade Routes to and from this city receive +4 [ICON_PRODUCTION] Production, +4 [ICON_GOLD] Gold, +2 [ICON_FOOD] Food and +2 [ICON_CULTURE] Culture. This bonus is applied both to the Origin City as to the Destination city. This bonus is increased by 50% if the city is [ICON_POWER] Powered.[NEWLINE][NEWLINE]Increases [ICON_POWER] Power Consumption at their city by 2.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                               Text)
values
    ("zh_Hans_CN", 
    "LOC_PEDIA_IMPROVEMENTS_PAGE_IMPROVEMENT_LEU_STATION_CHAPTER_HISTORY_PARA_1",                   
    "列车站、火车站、铁路站或车厂是一个铁路设施或区域，列车定期在此停靠以装载或卸载乘客、货物或两者均由。它通常由至少一个轨边站台和一个提供票务销售、候车室和行李/货运服务等辅助服务的车站建筑（车厂）组成。如果一个车站位于单轨线上，它通常有一个通行环路，以方便交通移动。"),

    ("zh_Hans_CN", 
    "LOC_PEDIA_IMPROVEMENTS_PAGE_IMPROVEMENT_LEU_STATION_CHAPTER_HISTORY_PARA_2",                   
    "在现代化进程中，高效运输货物和人员的能力一直很重要。以蒸汽为动力的机车产生了最深远的影响。火车是一种重型的、快速的、全年的运输解决方案。随着时间的推移，它们成为商业运输的首选。美国最早的铁路只覆盖短距离。1827年，马里兰州巴尔的摩市的一群商人成立了一个公司，建造了第一条主要铁路。它在他们的城市和俄亥俄河之间运行。在南北战争（1861-1865）之前的几十年里，还有许多私人铁路企业相继成立。1840年至1860年间，全国铺设的铁路数量增加了10倍。第一条横贯大陆的线路是在1869年建立的。最终，铁路降低了许多种货物的远距离运输成本。"),

    ("zh_Hans_CN", 
    "LOC_PEDIA_IMPROVEMENTS_PAGE_IMPROVEMENT_LEU_STATION_CHAPTER_HISTORY_PARA_3",                   
    "这些运输方面的进步有助于推动北美西部地区的定居。它们对于国家的工业化也是至关重要的。由此带来的生产力的增长是惊人的。繁忙的交通联系促进了城市的发展。运输系统有助于在全世界范围内建立一个国家规模的工业经济。"),

    ("zh_Hans_CN", 
    "LOC_PEDIA_UNITS_PAGE_UNIT_LEU_TYCOON_CHAPTER_HISTORY_PARA_1",                  
    "大亨一词来源于日本的taikun，意思是“大领主”，用作对幕府将军的称呼。这个词在1857年随着佩里准将返回美国而进入英语。美国总统林肯被他的助手约翰-尼古拉和约翰-海幽默地称为大亨。这个词传到了商业界，并一直使用到现在。大亨(mogul)、大亨(Tycoon)和男爵(baron)这些词经常被用于19世纪末和20世纪初北美的商业巨头，如采矿、伐木和石油等采掘业，航运和铁路等运输领域，汽车制造和钢铁制造等制造业，以及银行和报纸出版业。他们的统治地位被称为第二次工业革命，镀金时代，或强盗男爵时代。"),

    ("zh_Hans_CN", 
    "LOC_PEDIA_UNITS_PAGE_UNIT_LEU_TYCOON_CHAPTER_HISTORY_PARA_2",                  
    "在美国的镀金时代——横跨19世纪后半叶的大部分时间，从1870年左右到1900年——经通货膨胀调整后的财富和美国最杰出人物的影响远远超过了我们今天所看到的情况。"),

    ("zh_Hans_CN", 
    "LOC_PEDIA_UNITS_PAGE_UNIT_LEU_TYCOON_CHAPTER_HISTORY_PARA_3",                  
    "像约翰-D-洛克菲勒、科尼利厄斯-范德比尔特、亨利-福特和安德鲁-卡内基这样的人的财富，按照今天的标准，将以数千亿美元计算——远远超过埃隆-马斯克、比尔-盖茨、马克-扎克伯格等科技巨头，甚至是截至2019年世界上最富有的个人杰夫-贝佐斯。如此庞大的财富往往能凸显一个时代的金融不平等。正是这种面对未解决的社会问题的宏伟想法，导致马克-吐温在其1873年的小说《镀金时代：今天的故事》中创造了“镀金时代”这个词。这个标题表明，精英阶层薄薄的财富外衣掩盖了许多中下阶层的更广泛的问题。"),

    ("zh_Hans_CN", 
    "LOC_PEDIA_UNITS_PAGE_UNIT_LEU_TYCOON_CHAPTER_HISTORY_PARA_4",                  
    "但美国在镀金时代取得的进步是不可否认的。作为第二次工业革命的一部分，美国经历了令人印象深刻的经济扩张——由当时比生命更重要的财富和权力人物领导。这种增长在很大程度上得益于铁路——现在从海岸延伸到海岸——以及工厂、钢铁和煤矿业。大企业蓬勃发展，打字机、收银机和加钞机等技术有助于改变人们的工作方式。经济爆炸不仅包括工业增长，还包括农业技术的增长，如机械收割机。"),

    ("zh_Hans_CN", 
    "LOC_PEDIA_UNITS_PAGE_UNIT_LEU_TYCOON_CHAPTER_HISTORY_PARA_5",                  
    "在这样一个巨幅扩张的时代，围绕财富和商业行为的法规较少，环境非常适合占社会很小比例的极度富有的个人阶层的崛起。他们有能力和手段为许多人创造机会和工作，尽管社会对工人权利的重视程度较低，但歧视、剥削和低工资等问题是这个时代的特点。");

-- TODO: Great People from MOD

-- GREAT PERSON TEXT
--==========================================================================================================================
-- INSERT OR REPLACE INTO LocalizedText
--         (Language, Tag, Text)
-- VALUES
-- --------------------------------------------------------------------
-- -- Basic Great Person Info
-- --------------------------------------------------------------------
--         ("en_US", 
--         "LOC_GREAT_PERSON_INDIVIDUAL_LEU_ANDREW_CARNEGIE_NAME",                 
--         "Andrew Carnegie"),

-- --------------------------------------------------------------------
-- -- Great Person Abilities / Great Works
-- --------------------------------------------------------------------
--         ("en_US", 
--         "LOC_GREAT_PERSON_INDIVIDUAL_LEU_ANDREW_CARNEGIE_ACTIVE",                   
--         "+1 [Icon_Charges] Charge for Tycoons.[NEWLINE]Receives a free Tycoon in this distrit's city."),

-- --------------------------------------------------------------------
-- -- Great Person Pedia
-- --------------------------------------------------------------------
--         -- Andrew Carnegie
--         ("en_US", 
--         "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_LEU_ANDREW_CARNEGIE_CHAPTER_HISTORY_PARA_1",                    
--         "The Scottish-born American industrialist and philanthropist Andrew Carnegie was the leader of the American steel industry from 1873 to 1901. He donated large sums of his fortune to educational, cultural, and scientific institutions."),

--         ("en_US", 
--         "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_LEU_ANDREW_CARNEGIE_CHAPTER_HISTORY_PARA_2",                    
--         "Andrew Carnegie was born on November 25, 1835, in Dunfermline, Scotland, the son of William Carnegie, a weaver, and Margaret Morrison Carnegie. The invention of weaving machines replaced the work Carnegie's father did, and eventually the family was forced into poverty. In 1848 the family left Scotland and settled in Allegheny City, Pennsylvania. Carnegie's father found a job in a cotton factory, but he soon quit to return to his home handloom, making linens and trying to sell them door to door. Carnegie also worked in the cotton factory, but after his father died in 1855, his strong desire to help take care of the family pushed him to educate himself. He became an avid reader, a theatergoer, and a lover of music. Carnegie became a messenger boy for the Pittsburgh telegraph office. He later became a telegraph operator. Thomas A. Scott, superintendent of the western division of the Pennsylvania Railroad, made the eighteen-year-old Carnegie his secretary. Carnegie was soon earning enough salary to buy a house for his mother. During the Civil War (1861–65), when Scott was named assistant secretary of war in charge of transportation, Carnegie helped organize the military telegraph system. But he soon returned to Pittsburgh to take Scott's old job with the railroad."),

--         ("en_US", 
--         "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_LEU_ANDREW_CARNEGIE_CHAPTER_HISTORY_PARA_3",                    
--         "Between 1865 and 1870 Carnegie made money through investments in several small iron mills and factories. He also traveled throughout England, selling the bonds of small United States railroads and bridge companies. Carnegie began to see that steel was eventually going to replace iron for the manufacture of rails, structural shapes, pipe, and wire. In 1873 he organized a steel rail company. The first steel furnace at Braddock, Pennsylvania, began to roll rails in 1874. Carnegie continued building by cutting prices, driving out competitors, shaking off weak partners, and putting earnings back into the company. He never went public (sold shares of his company in order to raise money). Instead he obtained capital (money) from profits—and, when necessary, from local banks—and he kept on growing, making heavy steel alone. By 1878 the company was valued at $1.25 million. In the 1880s Carnegie's purchases included a majority stake in the H. C. Frick."),
        
--         ("en_US", 
--         "LOC_PEDIA_GREATPEOPLE_PAGE_GREAT_PERSON_INDIVIDUAL_LEU_ANDREW_CARNEGIE_CHAPTER_HISTORY_PARA_4",                    
--         "Company, which had vast coal lands and over one thousand ovens in Connellsville, Pennsylvania, and the Homestead mills outside of Pittsburgh, Pennsylvania. Frick became his partner and eventually chairman of the Carnegie Company. Carnegie had moved to New York City in 1867 to be close to the marketing centers for steel products; Frick stayed in Pittsburgh as the general manager. They made a good team. Behind the scenes, Carnegie planned new projects, cost controls, and the improvement of plants; Frick was the working director who watched over the mass-production programs that helped keep prices down. Carnegie spent his leisure time traveling. He also wrote several books, including Triumphant Democracy (1886), which pointed out the advantages of American life over the unequal societies of Britain and other European countries. To Carnegie access to education was the key to America's political stability and industrial accomplishments. In 1889 he published an article, ''Wealth'', stating his belief that rich men had a duty to use their money to improve the welfare of the community. Carnegie remained a bachelor until his mother died in 1886. A year later he married Louise Whitfield. They had one child together. The couple began to spend six months each year in Scotland, though Carnegie kept an eye on business developments and problems.");        

-- --==========================================================================================================================
-- --==========================================================================================================================
