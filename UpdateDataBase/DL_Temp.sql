-------------------------------------
--  Temporary update database sql  --
-------------------------------------

update Units set Combat = Combat - 3 where Combat > 45 and PromotionClass = 'PROMOTION_CLASS_HEAVY_CAVALRY';

-----------------------------
-- 政策卡解锁时间修改 by xhh --
-----------------------------

	-- 政策卡修改：【工商食官】改为【轮子】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_WAREHOUSE';
update Policies set PrereqTech = 'TECH_THE_WHEEL' where PolicyType = 'POLICY_WAREHOUSE';

	-- 政策卡修改：【城市公社】改为【批量生产】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_SAFETY_BOX';
update Policies set PrereqTech = 'TECH_MASS_PRODUCTION' where PolicyType = 'POLICY_SAFETY_BOX';

	-- 政策卡修改：【楼房】改为【砌砖】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_INSULAE';
update Policies set PrereqTech = 'TECH_MASONRY' where PolicyType = 'POLICY_INSULAE';

	-- 政策卡修改：【古老城区】改为【学徒】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_MEDINA_QUARTER';
update Policies set PrereqTech = 'TECH_APPRENTICESHIP' where PolicyType = 'POLICY_MEDINA_QUARTER';

	-- 政策卡修改：【哥特式建筑】改为【扶壁】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_GOTHIC_ARCHITECTURE';
update Policies set PrereqTech = 'TECH_BUTTRESS' where PolicyType = 'POLICY_GOTHIC_ARCHITECTURE';

	-- 政策卡修改：【三角贸易】改为【制图学】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_TRIANGULAR_TRADE';
update Policies set PrereqTech = 'TECH_CARTOGRAPHY' where PolicyType = 'POLICY_TRIANGULAR_TRADE';

	-- 政策卡修改：【自由市场】改为【银行业】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_FREE_MARKET';
update Policies set PrereqTech = 'TECH_BANKING' where PolicyType = 'POLICY_FREE_MARKET';

	-- 政策卡修改：【公共交通】改为【内燃机】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_PUBLIC_TRANSPORT';
update Policies set PrereqTech = 'TECH_COMBUSTION' where PolicyType = 'POLICY_PUBLIC_TRANSPORT';

	-- 政策卡修改：【公共卫生】改为【卫生设备】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_EXPROPRIATION';
update Policies set PrereqTech = 'TECH_SANITATION' where PolicyType = 'POLICY_EXPROPRIATION';

	-- 政策卡修改：【经济同盟】改为【电力】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_ECONOMIC_UNION';
update Policies set PrereqTech = 'TECH_ELECTRICITY' where PolicyType = 'POLICY_ECONOMIC_UNION';

	-- 政策卡修改：【高速公路】改为【内燃机】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_COLLECTIVIZATION';
update Policies set PrereqTech = 'TECH_COMBUSTION' where PolicyType = 'POLICY_COLLECTIVIZATION';
update Policy_GovernmentExclusives_XP2 set GovernmentType = Null where PolicyType = 'POLICY_COLLECTIVIZATION';

	-- 政策卡修改：【电子商务】改为【远程通讯】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_ECOMMERCE';
update Policies set PrereqTech = 'TECH_TELECOMMUNICATIONS' where PolicyType = 'POLICY_ECOMMERCE';

	-- 政策卡修改：【采邑】改为【城堡】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_WALL_HOUSING';
update Policies set PrereqTech = 'TECH_CASTLES' where PolicyType = 'POLICY_WALL_HOUSING';

	-- 政策卡修改：【生产建设兵团】改为【军事学】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_CONSTRUCTION_CROPS';
update Policies set PrereqTech = 'TECH_MILITARY_SCIENCE' where PolicyType = 'POLICY_CONSTRUCTION_CROPS';

	-- 政策卡修改：【交通线】改为【战术】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_LOGISTICS';
update Policies set PrereqTech = 'TECH_MILITARY_TACTICS' where PolicyType = 'POLICY_LOGISTICS';

	-- 政策卡修改：【军事研究】改为【军事学】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_MILITARY_RESEARCH';
update Policies set PrereqTech = 'TECH_MILITARY_SCIENCE' where PolicyType = 'POLICY_MILITARY_RESEARCH';

	-- 政策卡修改：【资源管理】改为【无线电】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_RESOURCE_MANAGEMENT';
update Policies set PrereqTech = 'TECH_RADIO' where PolicyType = 'POLICY_RESOURCE_MANAGEMENT';

	-- 政策卡修改：【公海】改为【联合作战】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_INTERNATIONAL_WATERS';
update Policies set PrereqTech = 'TECH_COMBINED_ARMS' where PolicyType = 'POLICY_INTERNATIONAL_WATERS';

	-- 政策卡修改：【战略空军】改为【现代航空】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_STRATEGIC_AIR_FORCE';
update Policies set PrereqTech = 'TECH_ADVANCED_FLIGHT' where PolicyType = 'POLICY_STRATEGIC_AIR_FORCE';

	-- 政策卡修改：【二次攻击能力】改为【核裂变】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_SECOND_STRIKE_CAPABILITY';
update Policies set PrereqTech = 'TECH_NUCLEAR_FISSION' where PolicyType = 'POLICY_SECOND_STRIKE_CAPABILITY';

	-- 政策卡修改：【训练手册】改为【膛线】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_DRILL_MANUALS';
update Policies set PrereqTech = 'TECH_RIFLING' where PolicyType = 'POLICY_DRILL_MANUALS';

	-- 政策卡修改：【不结盟运动】改为【卫星】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_COLLECTIVE_ACTIVISM';
update Policies set PrereqTech = 'TECH_SATELLITES' where PolicyType = 'POLICY_COLLECTIVE_ACTIVISM';

	-- 政策卡修改：【贸易银行】改为【银行业】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_WISSELBANKEN';
update Policies set PrereqTech = 'TECH_BANKING' where PolicyType = 'POLICY_WISSELBANKEN';

	-- 政策卡修改：【鼓舞】改为【造纸术】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_INSPIRATION';
update Policies set PrereqTech = 'TECH_PAPER_MARKING_HD' where PolicyType = 'POLICY_INSPIRATION';

	-- 政策卡修改：【军队现代化】改为【动员】市政解锁
update Policies set PrereqCivic = 'CIVIC_MOBILIZATION' where PolicyType = 'POLICY_FORCE_MODERNIZATION';

	-- 政策卡修改：【常春藤联盟】改为【资本主义】市政解锁
update Policies set PrereqCivic = 'CIVIC_CAPITALISM' where PolicyType = 'POLICY_FIVE_YEAR_PLAN';

	-- 政策卡修改：【采风】改为【文学传统】市政解锁
update Policies set PrereqCivic = 'CIVIC_LITERARY_TRADITION_HD' where PolicyType = 'POLICY_LITERARY_TRADITION';

	-- 政策卡修改：【教育学】改为【社会科学】市政解锁
update Policies set PrereqCivic = 'CIVIC_SOCIAL_SCIENCE_HD' where PolicyType = 'POLICY_GRAND_OPERA';

	-- 政策卡修改：【殖民地办事处】改为【演化论】市政解锁
update Policies set PrereqCivic = 'CIVIC_EVOLUTION_THEORY_HD' where PolicyType = 'POLICY_COLONIAL_OFFICES';

	-- 政策卡修改：【发明】改为【历史哲学】市政解锁
update Policies set PrereqCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD' where PolicyType = 'POLICY_INVENTION';


----------------------
-- 创建新市政 by xhh --
----------------------

-- 定义新市政
insert or replace into Types
	(Type,											Kind)
values
	('CIVIC_LITERARY_TRADITION_HD',					'KIND_CIVIC'),
	('CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		'KIND_CIVIC'),
	('CIVIC_EVOLUTION_THEORY_HD',					'KIND_CIVIC'),
	('CIVIC_HISTORICAL_PHILOSOPHY_HD',				'KIND_CIVIC'),
	('CIVIC_ETHICS_HD',								'KIND_CIVIC'),
	('CIVIC_SOCIAL_SCIENCE_HD',						'KIND_CIVIC');

-- 设定市政的名称 描述 时代 话费 UI树行位置
insert or replace into Civics
	(CivicType,										Name,													Description,										Cost,	EraType,			UITreeRow,	AdvisorType)
values
	('CIVIC_LITERARY_TRADITION_HD',					'LOC_CIVIC_LITERARY_TRADITION_HD_NAME',					Null,												180,	'ERA_CLASSICAL',	2,			'ADVISOR_CULTURE'),
	('CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		'LOC_CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD_NAME',		Null,												450,	'ERA_MEDIEVAL',		1,			'ADVISOR_TECHNOLOGY'),
	('CIVIC_EVOLUTION_THEORY_HD',					'LOC_CIVIC_EVOLUTION_THEORY_HD_NAME',					Null,												1050,	'ERA_RENAISSANCE',	-2,			'ADVISOR_GENERIC'),
	('CIVIC_HISTORICAL_PHILOSOPHY_HD',				'LOC_CIVIC_HISTORICAL_PHILOSOPHY_HD_NAME',				Null,												1050,	'ERA_RENAISSANCE',	0,			'ADVISOR_GENERIC'),
	('CIVIC_ETHICS_HD',								'LOC_CIVIC_ETHICS_HD_NAME',								Null,												1050,	'ERA_RENAISSANCE',	3,			'ADVISOR_GENERIC'),
	('CIVIC_SOCIAL_SCIENCE_HD',						'LOC_CIVIC_SOCIAL_SCIENCE_HD_NAME',						Null,												1450,	'ERA_INDUSTRIAL',	0,			'ADVISOR_GENERIC');

-- 设定市政的修改器(被动效果、总督头衔、使者等)
insert or replace into CivicModifiers
	(CivicType,										ModifierId) 
values
	('CIVIC_LITERARY_TRADITION_HD',					'CIVIC_AWARD_ONE_INFLUENCE_TOKEN');

-- 设定市政的鼓舞
insert or replace into Boosts
	(BoostID,	CivicType,									Boost,	TriggerDescription,										TriggerLongDescription,												Unit1Type,		BoostClass,											Unit2Type,		BuildingType,		ImprovementType,		BoostingTechType,			ResourceType,	NumItems,	DistrictType,			RequiresResource)
values
	(201,		'CIVIC_LITERARY_TRADITION_HD',				40,		'LOC_BOOST_TRIGGER_LITERARY_TRADITION_HD',				'LOC_BOOST_TRIGGER_LONGDESC_LITERARY_TRADITION_HD',					Null,			'BOOST_TRIGGER_RESEARCH_TECH',						Null,			Null,				Null,					'TECH_PAPER_MARKING_HD',	Null,			0,			Null,					0),
	(202,		'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		40,		'LOC_BOOST_TRIGGER_IMPERIAL_EXAMINATION_SYSTEM_HD',		'LOC_BOOST_TRIGGER_LONGDESC_IMPERIAL_EXAMINATION_SYSTEM_HD',		Null,			'BOOST_TRIGGER_HAVE_X_DISTRICTS',					Null,			Null,				Null,					Null,						Null,			2,			'DISTRICT_CAMPUS',		0),
	--(203,		'CIVIC_EVOLUTION_THEORY_HD',				40,		'LOC_BOOST_TRIGGER_EVOLUTION_THEORY_HD',				'LOC_BOOST_TRIGGER_LONGDESC_EVOLUTION_THEORY_HD',					Null,			Null,												Null,			Null,				Null,					Null,						Null,			0,			Null,					0),
	--(204,		'CIVIC_HISTORICAL_PHILOSOPHY_HD',			40,		'LOC_BOOST_TRIGGER_HISTORICAL_PHILOSOPHY_HD',			'LOC_BOOST_TRIGGER_LONGDESC_HISTORICAL_PHILOSOPHY_HD',				Null,			Null,												Null,			Null,				Null,					Null,						Null,			0,			Null,					0),
	(205,		'CIVIC_ETHICS_HD',							40,		'LOC_BOOST_TRIGGER_ETHICS_HD',							'LOC_BOOST_TRIGGER_LONGDESC_ETHICS_HD',								Null,			'BOOST_TRIGGER_RESEARCH_TECH',						Null,			Null,				Null,					'TECH_PRINTING',			Null,			0,			Null,					0),
	(206,		'CIVIC_SOCIAL_SCIENCE_HD',					40,		'LOC_BOOST_TRIGGER_SOCIAL_SCIENCE_HD',					'LOC_BOOST_TRIGGER_LONGDESC_SOCIAL_SCIENCE_HD',						Null,			'BOOST_TRIGGER_HAVE_X_UNIQUE_SPECIALTY_DISTRICTS',	Null,			Null,				Null,					Null,						Null,			7,			Null,					0);

-- 新科文版本 原有科文尤里卡&鼓舞调整
	-- 【教育】科技尤里卡改为：拥有科举制市政
update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', Unit1Type = Null, NumItems = 0,
	BoostingCivicType = 'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD' where TechnologyType = 'TECH_EDUCATION';
	-- 【军事工程学】科技尤里卡改为：训练2个石弩
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_CATAPULT', NumItems = 2,
	DistrictType = Null where TechnologyType = 'TECH_MILITARY_ENGINEERING';
	-- 【王权神授】市政鼓舞改为：训练1个使徒
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_APOSTLE', NumItems = 1,
	BuildingType = Null where CivicType = 'CIVIC_DIVINE_RIGHT';
	-- 【归正会】市政鼓舞改为：建造2座寺庙
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', NumItems = 2,
	BuildingType = 'BUILDING_TEMPLE' where CivicType = 'CIVIC_REFORMED_CHURCH';

-- 原【土木工程】市政解锁内容搬运到新【土木工程】科技上
	-- 【摩天大楼】
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_SKYSCRAPERS';
update Policies set PrereqTech = 'TECH_CIVIL_ENGINEERING_HD' where PolicyType = 'POLICY_SKYSCRAPERS';
	-- 【公共工程】
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_PUBLIC_WORKS';
update Policies set PrereqTech = 'TECH_CIVIL_ENGINEERING_HD' where PolicyType = 'POLICY_PUBLIC_WORKS';
	-- 【摩天轮】
update Buildings set PrereqCivic = NULL where BuildingType = 'BUILDING_FERRIS_WHEEL';
update Buildings set PrereqTech = 'TECH_CIVIL_ENGINEERING_HD' where BuildingType = 'BUILDING_FERRIS_WHEEL';
	-- 【社区】
update Districts set PrereqCivic = NULL where DistrictType = 'DISTRICT_NEIGHBORHOOD';
update Districts set PrereqTech = 'TECH_CIVIL_ENGINEERING_HD' where DistrictType = 'DISTRICT_NEIGHBORHOOD';
	-- 【水上乐园】
update Districts set PrereqCivic = NULL where DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
update Districts set PrereqTech = 'TECH_CIVIL_ENGINEERING_HD' where DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
	-- 【水上嘉年华】
update Districts set PrereqCivic = NULL where DistrictType = 'DISTRICT_WATER_STREET_CARNIVAL';
update Districts set PrereqTech = 'TECH_CIVIL_ENGINEERING_HD' where DistrictType = 'DISTRICT_WATER_STREET_CARNIVAL';
	-- 被动效果：丘陵农场
update Improvement_ValidTerrains set PrereqCivic = NULL, PrereqTech = 'TECH_CIVIL_ENGINEERING_HD' where PrereqCivic = 'CIVIC_CIVIL_ENGINEERING';
	-- 被动效果：伐木场、圩田、甘榜屋
update Improvement_BonusYieldChanges set PrereqCivic = NULL, PrereqTech = 'TECH_CIVIL_ENGINEERING_HD' where PrereqCivic = 'CIVIC_CIVIL_ENGINEERING';
	-- 相关modifier (包括但不限于加拿大冻土丘陵农场)
--update Requirements set RequirementType = 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY' where RequirementId = 'REQUIRES_PLAYER_HAS_CIVIL_ENGINEERING_CIVIC';
--update RequirementArguments set Value = 'TECH_CIVIL_ENGINEERING_HD' where RequirementId = 'REQUIRES_PLAYER_HAS_CIVIL_ENGINEERING_CIVIC';
--update Requirements set RequirementType = 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY' where RequirementId = 'REQUIRES_PLAYER_HAS_CIVIC_CIVIL_ENGINEERING';
--update RequirementArguments set Value = 'TECH_CIVIL_ENGINEERING_HD' where RequirementId = 'REQUIRES_PLAYER_HAS_CIVIC_CIVIL_ENGINEERING';
update Requirements set RequirementType = 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY' where RequirementId = 'HD_REQUIRES_PLAYER_HAS_NO_CIVIC_CIVIL_ENGINEERING';
update RequirementArguments set Value = 'TECH_CIVIL_ENGINEERING_HD' where RequirementId = 'HD_REQUIRES_PLAYER_HAS_NO_CIVIC_CIVIL_ENGINEERING';
	-- 删除【土木工程】市政
--delete from CivicModifiers where CivicType = 'CIVIC_CIVIL_ENGINEERING';
--delete from Civics where CivicType = 'CIVIC_CIVIL_ENGINEERING';

	-- 给f设擦屁股环节
insert or replace into Requirements
	(RequirementId,											RequirementType,								Reverse)
values
	('REQUIRES_PLAYER_HAS_CIVIC_CIVIL_ENGINEERING',			'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',			'0'),
	('REQUIRES_PLAYER_HAS_CIVIL_ENGINEERING_CIVIC',			'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',			'0');
	--('HD_REQUIRES_PLAYER_HAS_NO_CIVIC_CIVIL_ENGINEERING',	'REQUIREMENT_PLAYER_HAS_TECHNOLOGY',			'1');

insert or replace into RequirementArguments
	(RequirementId,											Name,								Value)
values
	('REQUIRES_PLAYER_HAS_CIVIC_CIVIL_ENGINEERING',			'CivicType',						'TECH_CIVIL_ENGINEERING_HD'),
	('REQUIRES_PLAYER_HAS_CIVIL_ENGINEERING_CIVIC',			'CivicType',						'TECH_CIVIL_ENGINEERING_HD');

insert or replace into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	('PLAYER_HAS_KAMPUNG_TECHNOLOGY_REQUIREMENTS',				'REQUIRES_PLAYER_HAS_CIVIC_CIVIL_ENGINEERING'),
	('PLAYER_HAS_CIVIL_ENGINEERING',							'REQUIRES_PLAYER_HAS_CIVIL_ENGINEERING_CIVIC');

-- 原有市政UI树位置调整
	-- 远古 --

	-- 古典 --
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_MILITARY_TRAINING';
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
	-- 中世纪 --
update Civics set UITreeRow = 0 where CivicType = 'CIVIC_FEUDALISM';
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
update Civics set UITreeRow = 0 where CivicType = 'CIVIC_MERCENARIES';
	-- 文艺复兴 --
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_DIPLOMATIC_SERVICE';
update Civics set UITreeRow = 1 where CivicType = 'CIVIC_HUMANISM';
	-- 工业 --
update Civics set UITreeRow = 2 where CivicType = 'CIVIC_NATIONALISM';
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_COLONIALISM';
update Civics set UITreeRow = -3 where CivicType = 'CIVIC_OPERA_BALLET';
	-- 现代 --
update Civics set UITreeRow = 2 where CivicType = 'CIVIC_MOBILIZATION';
update Civics set UITreeRow = 2 where CivicType = 'CIVIC_IDEOLOGY';
update Civics set UITreeRow = 2 where CivicType = 'CIVIC_NUCLEAR_PROGRAM';
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_SUFFRAGE';
update Civics set UITreeRow = 1 where CivicType = 'CIVIC_TOTALITARIANISM';
update Civics set UITreeRow = 0 where CivicType = 'CIVIC_CLASS_STRUGGLE';
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_MASS_MEDIA';
	-- 原子能 --
update Civics set UITreeRow = 2 where CivicType = 'CIVIC_COLD_WAR';
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_PROFESSIONAL_SPORTS';
update Civics set UITreeRow = 2 where CivicType = 'CIVIC_RAPID_DEPLOYMENT';
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_SPACE_RACE';
	-- 信息 --
update Civics set UITreeRow = 2 where CivicType = 'CIVIC_GLOBALIZATION';
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_SOCIAL_MEDIA';
update Civics set UITreeRow = -3 where CivicType = 'CIVIC_ENVIRONMENTALISM';
update Civics set UITreeRow = 1 where CivicType = 'CIVIC_CORPORATE_LIBERTARIANISM';
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_DIGITAL_DEMOCRACY';
update Civics set UITreeRow = 0 where CivicType = 'CIVIC_SYNTHETIC_TECHNOCRACY';
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_NEAR_FUTURE_GOVERNANCE';
	-- 未来 --

-- 市政树重建(重设所有市政的前置)
delete from CivicPrereqs;
insert or replace into CivicPrereqs
	(Civic,											PrereqCivic)
values
	-- 远古 --
	('CIVIC_CRAFTSMANSHIP',							'CIVIC_CODE_OF_LAWS'),
	('CIVIC_FOREIGN_TRADE',							'CIVIC_CODE_OF_LAWS'),
	('CIVIC_MILITARY_TRADITION',					'CIVIC_CRAFTSMANSHIP'),
	('CIVIC_MYSTICISM',								'CIVIC_FOREIGN_TRADE'),
	('CIVIC_STATE_WORKFORCE',						'CIVIC_CRAFTSMANSHIP'),
	('CIVIC_EARLY_EMPIRE',							'CIVIC_FOREIGN_TRADE'),
	-- 古典 --
	('CIVIC_GAMES_RECREATION',						'CIVIC_STATE_WORKFORCE'),
	('CIVIC_POLITICAL_PHILOSOPHY',					'CIVIC_STATE_WORKFORCE'),
	('CIVIC_POLITICAL_PHILOSOPHY',					'CIVIC_EARLY_EMPIRE'),
	('CIVIC_DRAMA_POETRY',							'CIVIC_EARLY_EMPIRE'),
	('CIVIC_MILITARY_TRAINING',						'CIVIC_MILITARY_TRADITION'),
	('CIVIC_MILITARY_TRAINING',						'CIVIC_GAMES_RECREATION'),
	('CIVIC_THEOLOGY',								'CIVIC_MYSTICISM'),
	('CIVIC_THEOLOGY',								'CIVIC_DRAMA_POETRY'),
	('CIVIC_DEFENSIVE_TACTICS',						'CIVIC_GAMES_RECREATION'),
	('CIVIC_DEFENSIVE_TACTICS',						'CIVIC_POLITICAL_PHILOSOPHY'),
	('CIVIC_RECORDED_HISTORY',						'CIVIC_DRAMA_POETRY'),
	('CIVIC_RECORDED_HISTORY',						'CIVIC_POLITICAL_PHILOSOPHY'),
	('CIVIC_LITERARY_TRADITION_HD',					'CIVIC_DRAMA_POETRY'),
	-- 中世纪 --
	('CIVIC_NAVAL_TRADITION',						'CIVIC_MILITARY_TRADITION'),
	('CIVIC_FEUDALISM',								'CIVIC_RECORDED_HISTORY'),
	('CIVIC_FEUDALISM',								'CIVIC_DEFENSIVE_TACTICS'),
	('CIVIC_CIVIL_SERVICE',							'CIVIC_FEUDALISM'),
	('CIVIC_CIVIL_SERVICE',							'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD'),
	('CIVIC_MERCENARIES',							'CIVIC_FEUDALISM'),
	('CIVIC_DIVINE_RIGHT',							'CIVIC_THEOLOGY'),
	('CIVIC_DIVINE_RIGHT',							'CIVIC_LITERARY_TRADITION_HD'),
	('CIVIC_MEDIEVAL_FAIRES',						'CIVIC_DEFENSIVE_TACTICS'),
	('CIVIC_MEDIEVAL_FAIRES',						'CIVIC_MILITARY_TRAINING'),
	('CIVIC_GUILDS',								'CIVIC_MEDIEVAL_FAIRES'),
	('CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		'CIVIC_LITERARY_TRADITION_HD'),
	('CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		'CIVIC_RECORDED_HISTORY'),
	-- 文艺复兴 --
	('CIVIC_EXPLORATION',							'CIVIC_MEDIEVAL_FAIRES'),
	('CIVIC_EXPLORATION',							'CIVIC_NAVAL_TRADITION'),
	('CIVIC_REFORMED_CHURCH',						'CIVIC_DIVINE_RIGHT'),
	('CIVIC_REFORMED_CHURCH',						'CIVIC_CIVIL_SERVICE'),
	('CIVIC_HUMANISM',								'CIVIC_CIVIL_SERVICE'),
	('CIVIC_DIPLOMATIC_SERVICE',					'CIVIC_MERCENARIES'),
	('CIVIC_DIPLOMATIC_SERVICE',					'CIVIC_GUILDS'),
	('CIVIC_MERCANTILISM',							'CIVIC_DIPLOMATIC_SERVICE'),
	('CIVIC_THE_ENLIGHTENMENT',						'CIVIC_HUMANISM'),
	('CIVIC_EVOLUTION_THEORY_HD',					'CIVIC_EXPLORATION'),
	('CIVIC_HISTORICAL_PHILOSOPHY_HD',				'CIVIC_HUMANISM'),
	('CIVIC_ETHICS_HD',								'CIVIC_REFORMED_CHURCH'),
	-- 工业 --
	('CIVIC_COLONIALISM',							'CIVIC_MERCANTILISM'),
	('CIVIC_COLONIALISM',							'CIVIC_EVOLUTION_THEORY_HD'),
	('CIVIC_OPERA_BALLET',							'CIVIC_EXPLORATION'),
	('CIVIC_NATIONALISM',							'CIVIC_THE_ENLIGHTENMENT'),
	('CIVIC_NATIONALISM',							'CIVIC_ETHICS_HD'),
	('CIVIC_NATURAL_HISTORY',						'CIVIC_OPERA_BALLET'),
	('CIVIC_SCORCHED_EARTH',						'CIVIC_NATIONALISM'),
	('CIVIC_URBANIZATION',							'CIVIC_COLONIALISM'),
	('CIVIC_URBANIZATION',							'CIVIC_SOCIAL_SCIENCE_HD'),
	('CIVIC_SOCIAL_SCIENCE_HD',						'CIVIC_HISTORICAL_PHILOSOPHY_HD'),
	('CIVIC_SOCIAL_SCIENCE_HD',						'CIVIC_THE_ENLIGHTENMENT'),
	-- 现代 --
	('CIVIC_CONSERVATION',							'CIVIC_NATURAL_HISTORY'),
	('CIVIC_MASS_MEDIA',							'CIVIC_URBANIZATION'),
	('CIVIC_MASS_MEDIA',							'CIVIC_NATURAL_HISTORY'),
	('CIVIC_MOBILIZATION',							'CIVIC_URBANIZATION'),
	('CIVIC_MOBILIZATION',							'CIVIC_NATIONALISM'),
	('CIVIC_CAPITALISM',							'CIVIC_MASS_MEDIA'),
	('CIVIC_IDEOLOGY',								'CIVIC_MASS_MEDIA'),
	('CIVIC_IDEOLOGY',								'CIVIC_MOBILIZATION'),
	('CIVIC_SUFFRAGE',								'CIVIC_IDEOLOGY'),
	('CIVIC_SUFFRAGE',								'CIVIC_CAPITALISM'),
	('CIVIC_TOTALITARIANISM',						'CIVIC_IDEOLOGY'),
	('CIVIC_TOTALITARIANISM',						'CIVIC_CAPITALISM'),
	('CIVIC_CLASS_STRUGGLE',						'CIVIC_IDEOLOGY'),
	('CIVIC_CLASS_STRUGGLE',						'CIVIC_CAPITALISM'),
	('CIVIC_NUCLEAR_PROGRAM',						'CIVIC_IDEOLOGY'),
	-- 原子能 --
	('CIVIC_CULTURAL_HERITAGE',						'CIVIC_CAPITALISM'),
	('CIVIC_CULTURAL_HERITAGE',						'CIVIC_CONSERVATION'),
	('CIVIC_COLD_WAR',								'CIVIC_NUCLEAR_PROGRAM'),
	('CIVIC_PROFESSIONAL_SPORTS',					'CIVIC_CAPITALISM'),
	('CIVIC_RAPID_DEPLOYMENT',						'CIVIC_COLD_WAR'),
	('CIVIC_SPACE_RACE',							'CIVIC_COLD_WAR'),
	('CIVIC_SPACE_RACE',							'CIVIC_PROFESSIONAL_SPORTS'),
	-- 信息 --
	('CIVIC_GLOBALIZATION',							'CIVIC_RAPID_DEPLOYMENT'),
	('CIVIC_SOCIAL_MEDIA',							'CIVIC_SPACE_RACE'),
	('CIVIC_ENVIRONMENTALISM',						'CIVIC_CULTURAL_HERITAGE'),
	('CIVIC_CORPORATE_LIBERTARIANISM',				'CIVIC_GLOBALIZATION'),-- 对齐极权主义
	('CIVIC_CORPORATE_LIBERTARIANISM',				'CIVIC_GLOBALIZATION'),
	('CIVIC_CORPORATE_LIBERTARIANISM',				'CIVIC_TOTALITARIANISM'),
	('CIVIC_DIGITAL_DEMOCRACY',						'CIVIC_GLOBALIZATION'),-- 对齐民主主义
	('CIVIC_DIGITAL_DEMOCRACY',						'CIVIC_GLOBALIZATION'),
	('CIVIC_DIGITAL_DEMOCRACY',						'CIVIC_SUFFRAGE'),
	('CIVIC_SYNTHETIC_TECHNOCRACY',					'CIVIC_GLOBALIZATION'),-- 对齐社会主义
	('CIVIC_SYNTHETIC_TECHNOCRACY',					'CIVIC_GLOBALIZATION'),
	('CIVIC_SYNTHETIC_TECHNOCRACY',					'CIVIC_CLASS_STRUGGLE'),
	('CIVIC_NEAR_FUTURE_GOVERNANCE',				'CIVIC_GLOBALIZATION'),
	('CIVIC_NEAR_FUTURE_GOVERNANCE',				'CIVIC_SOCIAL_MEDIA'),
	('CIVIC_NEAR_FUTURE_GOVERNANCE',				'CIVIC_ENVIRONMENTALISM'),
	-- 未来 --
	('CIVIC_GLOBAL_WARMING_MITIGATION',				'CIVIC_NEAR_FUTURE_GOVERNANCE'),
	('CIVIC_SMART_POWER_DOCTRINE',					'CIVIC_CORPORATE_LIBERTARIANISM'),
	('CIVIC_INFORMATION_WARFARE',					'CIVIC_DIGITAL_DEMOCRACY'),
	('CIVIC_EXODUS_IMPERATIVE',						'CIVIC_SYNTHETIC_TECHNOCRACY'),
	('CIVIC_CULTURAL_HEGEMONY',						'CIVIC_NEAR_FUTURE_GOVERNANCE'),
	('CIVIC_FUTURE_CIVIC',							'CIVIC_GLOBAL_WARMING_MITIGATION'),
	('CIVIC_FUTURE_CIVIC',							'CIVIC_SMART_POWER_DOCTRINE'),
	('CIVIC_FUTURE_CIVIC',							'CIVIC_INFORMATION_WARFARE'),
	('CIVIC_FUTURE_CIVIC',							'CIVIC_EXODUS_IMPERATIVE'),
	('CIVIC_FUTURE_CIVIC',							'CIVIC_CULTURAL_HEGEMONY');