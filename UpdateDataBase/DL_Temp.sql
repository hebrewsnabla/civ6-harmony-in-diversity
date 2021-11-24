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

	--政策卡修改：【哥特式建筑】改为【扶壁】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_GOTHIC_ARCHITECTURE';
update Policies set PrereqTech = 'TECH_BUTTRESS' where PolicyType = 'POLICY_GOTHIC_ARCHITECTURE';

	--政策卡修改：【三角贸易】改为【制图学】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_TRIANGULAR_TRADE';
update Policies set PrereqTech = 'TECH_CARTOGRAPHY' where PolicyType = 'POLICY_TRIANGULAR_TRADE';

	--政策卡修改：【自由市场】改为【银行业】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_FREE_MARKET';
update Policies set PrereqTech = 'TECH_BANKING' where PolicyType = 'POLICY_FREE_MARKET';

	--政策卡修改：【公共交通】改为【内燃机】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_PUBLIC_TRANSPORT';
update Policies set PrereqTech = 'TECH_COMBUSTION' where PolicyType = 'POLICY_PUBLIC_TRANSPORT';

	--政策卡修改：【公共卫生】改为【卫生设备】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_EXPROPRIATION';
update Policies set PrereqTech = 'TECH_SANITATION' where PolicyType = 'POLICY_EXPROPRIATION';

	--政策卡修改：【经济同盟】改为【电力】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_ECONOMIC_UNION';
update Policies set PrereqTech = 'TECH_ELECTRICITY' where PolicyType = 'POLICY_ECONOMIC_UNION';

	--政策卡修改：【高速公路】改为【内燃机】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_COLLECTIVIZATION';
update Policies set PrereqTech = 'TECH_COMBUSTION' where PolicyType = 'POLICY_COLLECTIVIZATION';
update Policy_GovernmentExclusives_XP2 set GovernmentType = Null where PolicyType = 'POLICY_COLLECTIVIZATION';

	--政策卡修改：【电子商务】改为【远程通讯】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_ECOMMERCE';
update Policies set PrereqTech = 'TECH_TELECOMMUNICATIONS' where PolicyType = 'POLICY_ECOMMERCE';

	--政策卡修改：【采邑】改为【城堡】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_WALL_HOUSING';
update Policies set PrereqTech = 'TECH_CASTLES' where PolicyType = 'POLICY_WALL_HOUSING';

	--政策卡修改：【生产建设兵团】改为【军事学】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_CONSTRUCTION_CROPS';
update Policies set PrereqTech = 'TECH_MILITARY_SCIENCE' where PolicyType = 'POLICY_CONSTRUCTION_CROPS';

	--政策卡修改：【交通线】改为【战术】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_LOGISTICS';
update Policies set PrereqTech = 'TECH_MILITARY_TACTICS' where PolicyType = 'POLICY_LOGISTICS';

	--政策卡修改：【军事研究】改为【军事学】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_MILITARY_RESEARCH';
update Policies set PrereqTech = 'TECH_MILITARY_SCIENCE' where PolicyType = 'POLICY_MILITARY_RESEARCH';

	--政策卡修改：【资源管理】改为【无线电】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_RESOURCE_MANAGEMENT';
update Policies set PrereqTech = 'TECH_RADIO' where PolicyType = 'POLICY_RESOURCE_MANAGEMENT';

	--政策卡修改：【公海】改为【联合作战】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_INTERNATIONAL_WATERS';
update Policies set PrereqTech = 'TECH_COMBINED_ARMS' where PolicyType = 'POLICY_INTERNATIONAL_WATERS';

	--政策卡修改：【战略空军】改为【现代航空】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_STRATEGIC_AIR_FORCE';
update Policies set PrereqTech = 'TECH_ADVANCED_FLIGHT' where PolicyType = 'POLICY_STRATEGIC_AIR_FORCE';

	--政策卡修改：【二次攻击能力】改为【核裂变】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_SECOND_STRIKE_CAPABILITY';
update Policies set PrereqTech = 'TECH_NUCLEAR_FISSION' where PolicyType = 'POLICY_SECOND_STRIKE_CAPABILITY';

	--政策卡修改：【训练手册】改为【膛线】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_DRILL_MANUALS';
update Policies set PrereqTech = 'TECH_RIFLING' where PolicyType = 'POLICY_DRILL_MANUALS';

	--政策卡修改：【不结盟运动】改为【卫星】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_COLLECTIVE_ACTIVISM';
update Policies set PrereqTech = 'TECH_SATELLITES' where PolicyType = 'POLICY_COLLECTIVE_ACTIVISM';

	--政策卡修改：【贸易银行】改为【银行业】科技解锁
update Policies set PrereqCivic = NULL where PolicyType = 'POLICY_WISSELBANKEN';
update Policies set PrereqTech = 'TECH_BANKING' where PolicyType = 'POLICY_WISSELBANKEN';

	--政策卡修改：【军队现代化】改为【动员】市政解锁
update Policies set PrereqCivic = 'CIVIC_MOBILIZATION' where PolicyType = 'POLICY_FORCE_MODERNIZATION';

	--政策卡修改：【常春藤联盟】改为【资本主义】市政解锁
update Policies set PrereqCivic = 'CIVIC_CAPITALISM' where PolicyType = 'POLICY_FIVE_YEAR_PLAN';

	--政策卡修改：【采风】改为【文学传统】市政解锁
update Policies set PrereqCivic = 'CIVIC_LITERARY_TRADITION_HD' where PolicyType = 'POLICY_LITERARY_TRADITION';

----------------------
-- 创建新市政 by xhh --
----------------------

-- 定义新市政
insert or replace into Types
	(Type,								Kind)
values
	('CIVIC_LITERARY_TRADITION_HD',		'KIND_CIVIC');

-- 设定市政的名称 描述 时代 话费 UI树行位置
insert or replace into Civics
	(CivicType,							Name,										Description,										Cost,	EraType,			UITreeRow,	AdvisorType)
values
	('CIVIC_LITERARY_TRADITION_HD',		'LOC_CIVIC_LITERARY_TRADITION_HD_NAME',		Null,												240,	'ERA_CLASSICAL',	2,			'ADVISOR_CULTURE');

-- 设定市政的前置
insert or replace into CivicPrereqs
	(Civic,								PrereqCivic)
values
	('CIVIC_LITERARY_TRADITION_HD',		'CIVIC_DRAMA_POETRY');

-- 设定市政的修改器(被动效果、总督头衔、使者等)
insert or replace into CivicModifiers
	(CivicType,							ModifierId) 
values
	('CIVIC_LITERARY_TRADITION_HD',		'CIVIC_AWARD_ONE_INFLUENCE_TOKEN');

-- 设定市政的鼓舞
insert or replace into Boosts
	(BoostID,	CivicType,						Boost,	TriggerDescription,								TriggerLongDescription,									Unit1Type,		BoostClass,							Unit2Type,		BuildingType,		ImprovementType,		BoostingTechType,ResourceType,NumItems,DistrictType,RequiresResource)
values
	(,			'CIVIC_LITERARY_TRADITION_HD',	40,		'LOC_BOOST_TRIGGER_LITERARY_TRADITION_HD',		'LOC_BOOST_TRIGGER_LONGDESC_LITERARY_TRADITION_HD',		Null,			'BOOST_TRIGGER_RESEARCH_TECH',		Null,			Null,				Null,					);
