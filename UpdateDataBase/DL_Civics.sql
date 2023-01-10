-------------------------------------
--        Civics Adjustment        --
-------------------------------------

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

-- 设定市政的名称 描述 时代 花费 UI树行位置
insert or replace into Civics
	(CivicType,										Name,													Description,										Cost,	EraType,			UITreeRow,	AdvisorType)
values
	('CIVIC_LITERARY_TRADITION_HD',					'LOC_CIVIC_LITERARY_TRADITION_HD_NAME',					Null,												240,	'ERA_CLASSICAL',	2,			'ADVISOR_CULTURE'),
	('CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		'LOC_CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD_NAME',		Null,												450,	'ERA_MEDIEVAL',		2,			'ADVISOR_TECHNOLOGY'),
	('CIVIC_EVOLUTION_THEORY_HD',					'LOC_CIVIC_EVOLUTION_THEORY_HD_NAME',					'LOC_CIVIC_EVOLUTION_THEORY_HD_DESCRIPTION',		1050,	'ERA_RENAISSANCE',	-2,			'ADVISOR_GENERIC'),
	('CIVIC_HISTORICAL_PHILOSOPHY_HD',				'LOC_CIVIC_HISTORICAL_PHILOSOPHY_HD_NAME',				'LOC_CIVIC_HISTORICAL_PHILOSOPHY_HD_DESCRIPTION',	1050,	'ERA_RENAISSANCE',	0,			'ADVISOR_GENERIC'),
	('CIVIC_ETHICS_HD',								'LOC_CIVIC_ETHICS_HD_NAME',								Null,												1050,	'ERA_RENAISSANCE',	2,			'ADVISOR_GENERIC'),
	('CIVIC_SOCIAL_SCIENCE_HD',						'LOC_CIVIC_SOCIAL_SCIENCE_HD_NAME',						Null,												1450,	'ERA_INDUSTRIAL',	0,			'ADVISOR_GENERIC');

delete from CivicQuotes where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
delete from CivicQuotes where CivicType = 'CIVIC_NATURAL_HISTORY';
insert or replace into CivicQuotes
    (CivicType,            						Quote,                                  				QuoteAudio)
values
    ('CIVIC_DEFENSIVE_TACTICS',    				'LOC_CIVIC_SUPPLY_HD_QUOTE_1',     						'Play_SupplyHD_Quote_1'),
    ('CIVIC_DEFENSIVE_TACTICS',    				'LOC_CIVIC_SUPPLY_HD_QUOTE_2',     						'Play_SupplyHD_Quote_2'),
    ('CIVIC_NATURAL_HISTORY',    				'LOC_CIVIC_ARCHAEOLOGY_HD_QUOTE_1',     				'Play_ArchaeologyHD_Quote_1'),
    ('CIVIC_NATURAL_HISTORY',    				'LOC_CIVIC_ARCHAEOLOGY_HD_QUOTE_2',     				'Play_ArchaeologyHD_Quote_2'),
    ('CIVIC_LITERARY_TRADITION_HD',    			'LOC_CIVIC_LITERARY_TRADITION_HD_QUOTE_1',     			'Play_LiteraryTraditionHD_Quote_1'),
    ('CIVIC_LITERARY_TRADITION_HD',    			'LOC_CIVIC_LITERARY_TRADITION_HD_QUOTE_2',     			'Play_LiteraryTraditionHD_Quote_2'),
    ('CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',	'LOC_CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD_QUOTE_1',   	'Play_ImperialExaminationSystemHD_Quote_1'),
    ('CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',    'LOC_CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD_QUOTE_2',   	'Play_ImperialExaminationSystemHD_Quote_2'),
    ('CIVIC_EVOLUTION_THEORY_HD',    			'LOC_CIVIC_EVOLUTION_THEORY_HD_QUOTE_1',     			'Play_EvolutionTheoryHD_Quote_1'),
    ('CIVIC_EVOLUTION_THEORY_HD',    			'LOC_CIVIC_EVOLUTION_THEORY_HD_QUOTE_2',     			'Play_EvolutionTheoryHD_Quote_2'),
    ('CIVIC_HISTORICAL_PHILOSOPHY_HD',			'LOC_CIVIC_HISTORICAL_PHILOSOPHY_HD_QUOTE_1',     		'Play_HistoricalPhilosophyHD_Quote_1'),
    ('CIVIC_HISTORICAL_PHILOSOPHY_HD',    		'LOC_CIVIC_HISTORICAL_PHILOSOPHY_HD_QUOTE_2',     		'Play_HistoricalPhilosophyHD_Quote_2'),
    ('CIVIC_ETHICS_HD',    						'LOC_CIVIC_ETHICS_HD_QUOTE_1',     						'Play_EthicsHD_Quote_1'),
    ('CIVIC_ETHICS_HD',    						'LOC_CIVIC_ETHICS_HD_QUOTE_2',     						'Play_EthicsHD_Quote_2'),
    ('CIVIC_SOCIAL_SCIENCE_HD',    				'LOC_CIVIC_SOCIAL_SCIENCE_HD_QUOTE_1',     				'Play_SocialScienceHD_Quote_1'),
    ('CIVIC_SOCIAL_SCIENCE_HD',    				'LOC_CIVIC_SOCIAL_SCIENCE_HD_QUOTE_2',     				'Play_SocialScienceHD_Quote_2');

-- 设定市政的总督头衔、使者等效果
delete from CivicModifiers where ModifierId = 'CIVIC_AWARD_ONE_INFLUENCE_TOKEN';
delete from CivicModifiers where ModifierId = 'CIVIC_AWARD_TWO_INFLUENCE_TOKENS';
delete from CivicModifiers where ModifierId = 'CIVIC_AWARD_THREE_INFLUENCE_TOKENS';
delete from CivicModifiers where ModifierId = 'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS';

insert or replace into CivicModifiers
	(CivicType,										ModifierId) 
values
	-- 使者
		-- 1使者
	('CIVIC_MYSTICISM',								'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
	('CIVIC_LITERARY_TRADITION_HD',					'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
	('CIVIC_THEOLOGY',								'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
	('CIVIC_MERCENARIES',							'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
	('CIVIC_DIVINE_RIGHT',							'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
	('CIVIC_NAVAL_TRADITION',						'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
	('CIVIC_EVOLUTION_THEORY_HD',					'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
	('CIVIC_ETHICS_HD',								'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
		-- 2使者
	('CIVIC_NATIONALISM',							'CIVIC_AWARD_TWO_INFLUENCE_TOKENS'),
	('CIVIC_OPERA_BALLET',							'CIVIC_AWARD_TWO_INFLUENCE_TOKENS'),
	('CIVIC_NATURAL_HISTORY',						'CIVIC_AWARD_TWO_INFLUENCE_TOKENS'),
	('CIVIC_SCORCHED_EARTH',						'CIVIC_AWARD_TWO_INFLUENCE_TOKENS'),
		-- 3使者
	('CIVIC_CONSERVATION',							'CIVIC_AWARD_THREE_INFLUENCE_TOKENS'),
	('CIVIC_CULTURAL_HERITAGE',						'CIVIC_AWARD_THREE_INFLUENCE_TOKENS'),
	('CIVIC_NEAR_FUTURE_GOVERNANCE',				'CIVIC_AWARD_THREE_INFLUENCE_TOKENS'),
	('CIVIC_GLOBAL_WARMING_MITIGATION',				'CIVIC_AWARD_THREE_INFLUENCE_TOKENS'),
	-- 总督头衔
	('CIVIC_STATE_WORKFORCE',						'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_EARLY_EMPIRE',							'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_DEFENSIVE_TACTICS',						'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_RECORDED_HISTORY',						'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_GUILDS',								'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_CIVIL_SERVICE',							'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_COLONIALISM',							'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_SOCIAL_SCIENCE_HD',						'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_MASS_MEDIA',							'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_MOBILIZATION',							'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_GLOBALIZATION',							'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_SOCIAL_MEDIA',							'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_NEAR_FUTURE_GOVERNANCE',				'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	('CIVIC_FUTURE_CIVIC',							'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS'),
	-- 被动效果
	('CIVIC_CIVIL_SERVICE',							'CIVILPRESTIGE_GOVAMENITY'),
	('CIVIC_CIVIL_SERVICE',							'CIVILPRESTIGE_GOVHOUSING'),
	('CIVIC_NUCLEAR_PROGRAM',						'NUCLEAR_PROGRAM_MANHATTAN_PROJECT_PRODUCTION'),
	('CIVIC_NUCLEAR_PROGRAM',						'NUCLEAR_PROGRAM_IVY_PROJECT_PRODUCTION'),
	('CIVIC_NUCLEAR_PROGRAM',						'NUCLEAR_PROGRAM_NUCLEAR_DEVICE_PRODUCTION'),
	('CIVIC_NUCLEAR_PROGRAM',						'NUCLEAR_PROGRAM_THERMONUCLEAR_DEVICE_PRODUCTION'),
	('CIVIC_NUCLEAR_PROGRAM',						'NUCLEAR_PROGRAM_NUCLEAR_POWER_STATION_PRODUCTION'),
	('CIVIC_CULTURAL_HEGEMONY',						'FUTURE_VICTORY_CULTURE_ROCK_BAND_PROMOTIONS'),
	('CIVIC_CONSERVATION',							'CITY_CENTER_ADJACENT_TO_FOREST'),
	-- 军团 军队
	('CIVIC_COLONIALISM',							'COLONIALISM_NAVAL_CORPS'),
	('CIVIC_NATIONALISM',							'NATIONALISM_LAND_CORPS');

insert or replace into Modifiers
	(ModifierId,						ModifierType)
values
	('COLONIALISM_NAVAL_CORPS',			'MODIFIER_PLAYER_CORPS_ARMY_PREREQ'),
	('NATIONALISM_LAND_CORPS',			'MODIFIER_PLAYER_CORPS_ARMY_PREREQ');

insert or replace into ModifierArguments
	(ModifierId,						Name,					Value)
values
	('COLONIALISM_NAVAL_CORPS',			'Corps',				1),
	('COLONIALISM_NAVAL_CORPS',			'Domain',				'DOMAIN_SEA'),
	('COLONIALISM_NAVAL_CORPS',			'CivicType',			'CIVIC_COLONIALISM'),
	('NATIONALISM_LAND_CORPS',			'Corps',				1),
	('NATIONALISM_LAND_CORPS',			'Domain',				'DOMAIN_LAND'),
	('NATIONALISM_LAND_CORPS',			'CivicType',			'CIVIC_NATIONALISM');

update UnitCommands set PrereqCivic = 'CIVIC_MOBILIZATION' where CommandType = 'UNITCOMMAND_FORM_CORPS';

update ModifierArguments set Value = 20 where ModifierId = 'ENVIRONMENTALISM_BOOST_ALL_TOURISM' and Name = 'Amount';

insert or replace into Modifiers
    (ModifierId,                                     		 	ModifierType,                                      		 SubjectRequirementSetId)
values
    ('CITY_CENTER_ADJACENT_TO_FOREST',                			'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY',     		'ADJACENT_TO_FOREST_REQUIREMENTS'),
    ('NUCLEAR_PROGRAM_MANHATTAN_PROJECT_PRODUCTION',  			'MODIFIER_PLAYER_CITIES_ADJUST_PROJECT_PRODUCTION', 		Null),
    ('NUCLEAR_PROGRAM_IVY_PROJECT_PRODUCTION',  				'MODIFIER_PLAYER_CITIES_ADJUST_PROJECT_PRODUCTION', 		Null),
    ('NUCLEAR_PROGRAM_NUCLEAR_DEVICE_PRODUCTION',  				'MODIFIER_PLAYER_CITIES_ADJUST_PROJECT_PRODUCTION', 		Null),
    ('NUCLEAR_PROGRAM_THERMONUCLEAR_DEVICE_PRODUCTION',  		'MODIFIER_PLAYER_CITIES_ADJUST_PROJECT_PRODUCTION', 		Null),
    ('NUCLEAR_PROGRAM_NUCLEAR_POWER_STATION_PRODUCTION',  		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION', 		Null);

insert or replace into ModifierArguments
    (ModifierId,                                   			Name,      			Value)
values
    ('CITY_CENTER_ADJACENT_TO_FOREST',              		'Amount',  			1),
    ('NUCLEAR_PROGRAM_MANHATTAN_PROJECT_PRODUCTION',		'ProjectType',		'PROJECT_MANHATTAN_PROJECT'),
    ('NUCLEAR_PROGRAM_MANHATTAN_PROJECT_PRODUCTION',		'Amount',			50),
    ('NUCLEAR_PROGRAM_IVY_PROJECT_PRODUCTION',				'ProjectType',		'PROJECT_OPERATION_IVY'),
    ('NUCLEAR_PROGRAM_IVY_PROJECT_PRODUCTION',				'Amount',			50),
    ('NUCLEAR_PROGRAM_NUCLEAR_DEVICE_PRODUCTION',			'ProjectType',		'PROJECT_BUILD_NUCLEAR_DEVICE'),
    ('NUCLEAR_PROGRAM_NUCLEAR_DEVICE_PRODUCTION',			'Amount',			50),
    ('NUCLEAR_PROGRAM_THERMONUCLEAR_DEVICE_PRODUCTION',		'ProjectType',		'PROJECT_BUILD_THERMONUCLEAR_DEVICE'),
    ('NUCLEAR_PROGRAM_THERMONUCLEAR_DEVICE_PRODUCTION',		'Amount',			50),
    ('NUCLEAR_PROGRAM_NUCLEAR_POWER_STATION_PRODUCTION',	'BuildingType',		'BUILDING_POWER_PLANT'),
    ('NUCLEAR_PROGRAM_NUCLEAR_POWER_STATION_PRODUCTION',	'Amount',			50);

------------------------------------------------------------------------------------------------------------

update Civics set Description = 'LOC_CIVIC_NUCLEAR_PROGRAM_DESCRIPTION' where CivicType = 'CIVIC_NUCLEAR_PROGRAM';

insert or replace into Civics_XP2 (CivicType, RandomPrereqs, HiddenUntilPrereqComplete)
select CivicType, 0, 0 from Civics where EraType = 'ERA_FUTURE';

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
	('CIVIC_EXPLORATION',							'CIVIC_GUILDS'),
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
	('CIVIC_NATURAL_HISTORY',						'CIVIC_COLONIALISM'),
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
	('CIVIC_MOBILIZATION',							'CIVIC_SCORCHED_EARTH'),
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
	('CIVIC_GLOBALIZATION',							'CIVIC_SPACE_RACE'),
	('CIVIC_GLOBALIZATION',							'CIVIC_RAPID_DEPLOYMENT'),
	('CIVIC_SOCIAL_MEDIA',							'CIVIC_SPACE_RACE'),
	('CIVIC_ENVIRONMENTALISM',						'CIVIC_CULTURAL_HERITAGE'),
	('CIVIC_CORPORATE_LIBERTARIANISM',				'CIVIC_GLOBALIZATION'),-- 对齐极权主义
	('CIVIC_CORPORATE_LIBERTARIANISM',				'CIVIC_SOCIAL_MEDIA'),
	('CIVIC_DIGITAL_DEMOCRACY',						'CIVIC_GLOBALIZATION'),-- 对齐民主主义
	('CIVIC_DIGITAL_DEMOCRACY',						'CIVIC_SOCIAL_MEDIA'),
	('CIVIC_SYNTHETIC_TECHNOCRACY',					'CIVIC_GLOBALIZATION'),-- 对齐社会主义
	('CIVIC_SYNTHETIC_TECHNOCRACY',					'CIVIC_SOCIAL_MEDIA'),
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

-- 原有市政UI树位置调整
	-- 远古 --
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_STATE_WORKFORCE';
	-- 古典 --
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_MILITARY_TRAINING';
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
	-- 中世纪 --
update Civics set UITreeRow = -3 where CivicType = 'CIVIC_NAVAL_TRADITION';
update Civics set UITreeRow = 0 where CivicType = 'CIVIC_FEUDALISM';
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_GUILDS';
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
update Civics set UITreeRow = 2 where CivicType = 'CIVIC_CIVIL_SERVICE';
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
update Civics set UITreeRow = 0 where CivicType = 'CIVIC_FUTURE_CIVIC';
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_INFORMATION_WARFARE';
update Civics set UITreeRow = 0 where CivicType = 'CIVIC_EXODUS_IMPERATIVE';
update Civics set UITreeRow = 1 where CivicType = 'CIVIC_SMART_POWER_DOCTRINE';
update Civics set UITreeRow = -2 where CivicType = 'CIVIC_GLOBAL_WARMING_MITIGATION';
update Civics set UITreeRow = -3 where CivicType = 'CIVIC_CULTURAL_HEGEMONY';

-- Civic Tree v3
update Civics set Cost = 20 where CivicType = 'CIVIC_CODE_OF_LAWS';
update Civics set Cost = 40 where CivicType = 'CIVIC_CRAFTSMANSHIP';
update Civics set Cost = 40 where CivicType = 'CIVIC_FOREIGN_TRADE';
update Civics set Cost = 50 where CivicType = 'CIVIC_MILITARY_TRADITION';
update Civics set Cost = 70 where CivicType = 'CIVIC_STATE_WORKFORCE';
update Civics set Cost = 70 where CivicType = 'CIVIC_EARLY_EMPIRE';
update Civics set Cost = 50 where CivicType = 'CIVIC_MYSTICISM';
update Civics set Cost = 120 where CivicType = 'CIVIC_GAMES_RECREATION';
update Civics set Cost = 150 where CivicType = 'CIVIC_POLITICAL_PHILOSOPHY';
update Civics set Cost = 120 where CivicType = 'CIVIC_DRAMA_POETRY';
update Civics set Cost = 240 where CivicType = 'CIVIC_MILITARY_TRAINING';
update Civics set Cost = 240 where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
update Civics set Cost = 240 where CivicType = 'CIVIC_RECORDED_HISTORY';
update Civics set Cost = 240 where CivicType = 'CIVIC_THEOLOGY';
update Civics set Cost = 450 where CivicType = 'CIVIC_NAVAL_TRADITION';
update Civics set Cost = 450 where CivicType = 'CIVIC_FEUDALISM';
update Civics set Cost = 600 where CivicType = 'CIVIC_CIVIL_SERVICE';
update Civics set Cost = 600 where CivicType = 'CIVIC_MERCENARIES';
update Civics set Cost = 450 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
update Civics set Cost = 600 where CivicType = 'CIVIC_GUILDS';
update Civics set Cost = 450 where CivicType = 'CIVIC_DIVINE_RIGHT';
update Civics set Cost = 750 where CivicType = 'CIVIC_EXPLORATION';
update Civics set Cost = 900 where CivicType = 'CIVIC_HUMANISM';
update Civics set Cost = 900 where CivicType = 'CIVIC_DIPLOMATIC_SERVICE';
update Civics set Cost = 750 where CivicType = 'CIVIC_REFORMED_CHURCH';
update Civics set Cost = 1050 where CivicType = 'CIVIC_MERCANTILISM';
update Civics set Cost = 1050 where CivicType = 'CIVIC_THE_ENLIGHTENMENT';
update Civics set Cost = 1450 where CivicType = 'CIVIC_COLONIALISM';
update Civics set Cost = 1450 where CivicType = 'CIVIC_CIVIL_ENGINEERING';
update Civics set Cost = 1450 where CivicType = 'CIVIC_NATIONALISM';
update Civics set Cost = 1450 where CivicType = 'CIVIC_OPERA_BALLET';
update Civics set Cost = 1700 where CivicType = 'CIVIC_NATURAL_HISTORY';
update Civics set Cost = 1700 where CivicType = 'CIVIC_SCORCHED_EARTH';
update Civics set Cost = 1700 where CivicType = 'CIVIC_URBANIZATION';
update Civics set Cost = 2100 where CivicType = 'CIVIC_CONSERVATION';
update Civics set Cost = 2250 where CivicType = 'CIVIC_CAPITALISM';
update Civics set Cost = 2400 where CivicType = 'CIVIC_NUCLEAR_PROGRAM';
update Civics set Cost = 2100 where CivicType = 'CIVIC_MASS_MEDIA';
update Civics set Cost = 2100 where CivicType = 'CIVIC_MOBILIZATION';
update Civics set Cost = 2250 where CivicType = 'CIVIC_IDEOLOGY';
update Civics set Cost = 2250 where CivicType = 'CIVIC_SUFFRAGE';
update Civics set Cost = 2250 where CivicType = 'CIVIC_TOTALITARIANISM';
update Civics set Cost = 2250 where CivicType = 'CIVIC_CLASS_STRUGGLE';
update Civics set Cost = 3000 where CivicType = 'CIVIC_COLD_WAR';
update Civics set Cost = 3000 where CivicType = 'CIVIC_PROFESSIONAL_SPORTS';
update Civics set Cost = 2800 where CivicType = 'CIVIC_CULTURAL_HERITAGE';
update Civics set Cost = 3500 where CivicType = 'CIVIC_RAPID_DEPLOYMENT';
update Civics set Cost = 3500 where CivicType = 'CIVIC_SPACE_RACE';
update Civics set Cost = 4100 where CivicType = 'CIVIC_GLOBALIZATION';
update Civics set Cost = 4100 where CivicType = 'CIVIC_SOCIAL_MEDIA';
update Civics set Cost = 4100 where CivicType = 'CIVIC_ENVIRONMENTALISM';
update Civics set Cost = 4300 where CivicType = 'CIVIC_CORPORATE_LIBERTARIANISM';
update Civics set Cost = 4300 where CivicType = 'CIVIC_DIGITAL_DEMOCRACY';
update Civics set Cost = 4300 where CivicType = 'CIVIC_SYNTHETIC_TECHNOCRACY';
update Civics set Cost = 4600 where CivicType = 'CIVIC_NEAR_FUTURE_GOVERNANCE';
update Civics set Cost = 4800 where CivicType = 'CIVIC_GLOBAL_WARMING_MITIGATION';
update Civics set Cost = 4800 where CivicType = 'CIVIC_SMART_POWER_DOCTRINE';
update Civics set Cost = 4800 where CivicType = 'CIVIC_INFORMATION_WARFARE';
update Civics set Cost = 4800 where CivicType = 'CIVIC_EXODUS_IMPERATIVE';
update Civics set Cost = 4800 where CivicType = 'CIVIC_CULTURAL_HEGEMONY';
update Civics set Cost = 5200 where CivicType = 'CIVIC_FUTURE_CIVIC';

update CivicRandomCosts set Cost = 4800 where Cost = 3200;
update CivicRandomCosts set Cost = 4900 where Cost = 3300;
update CivicRandomCosts set Cost = 4800 where Cost = 4160;
update CivicRandomCosts set Cost = 4900 where Cost = 4290;

--同盟
update DiplomaticActions set InitiatorPrereqCivic = 'CIVIC_POLITICAL_PHILOSOPHY' where DiplomaticActionType like 'DIPLOACTION_ALLIANCE%';
update DiplomaticActions set TargetPrereqCivic = 'CIVIC_POLITICAL_PHILOSOPHY' where DiplomaticActionType like 'DIPLOACTION_ALLIANCE%';
insert or replace into RequirementSetRequirements 
    (RequirementSetId,						RequirementId) 
values
	('ROUTE_BETWEEN_ALLIES_REQUIREMENTS',					'REQUIRES_PLAYER_HAS_CIVIC_CIVIL_SERVICE');

-- 未来市政鼓舞
with C
	(BoostID,	CivicType)
as (values
	(300,		'CIVIC_CULTURAL_HEGEMONY'),
	(301,		'CIVIC_GLOBAL_WARMING_MITIGATION'),
	(302,		'CIVIC_INFORMATION_WARFARE'),
	(303,		'CIVIC_EXODUS_IMPERATIVE'),
	(304,		'CIVIC_SMART_POWER_DOCTRINE')
) insert or replace into Boosts
	(BoostID,	CivicType,	Boost,	TriggerDescription,					TriggerLongDescription,						BoostClass)
select
	BoostID,	CivicType,	34,		'LOC_BOOST_TRIGGER_MOON_LANDING',	'LOC_BOOST_TRIGGER_LONGDESC_MOON_LANDING',	'BOOST_TRIGGER_NONE_LATE_GAME_CRITICAL_TECH'
from C;

-- 遏制直接给冷战
insert or replace into CivicModifiers
	(CivicType,				ModifierId)
values
	('CIVIC_COLD_WAR',		'CONTAINMENT_DUPLICATETOKENWHENRIVALGOVERNMENT');
--区域项目
update Projects set UnlocksFromEffect = 1 where ProjectType like 'PROJECT_ENHANCE_DISTRICT_%';
insert or replace into CivicModifiers
	(CivicType,								ModifierId)
select
	'CIVIC_HISTORICAL_PHILOSOPHY_HD',		ProjectType || '_MODIFIER'
from Projects where ProjectType like 'PROJECT_ENHANCE_DISTRICT_%';
insert or replace into Modifiers
	(ModifierId,							ModifierType)
select
	ProjectType || '_MODIFIER',				'MODIFIER_PLAYER_ALLOW_PROJECT_CATHERINE'
from Projects where ProjectType like 'PROJECT_ENHANCE_DISTRICT_%';
insert or replace into ModifierArguments
	(ModifierId,							Name,					Value)
select
	ProjectType || '_MODIFIER',				'ProjectType',			ProjectType
from Projects where ProjectType like 'PROJECT_ENHANCE_DISTRICT_%';