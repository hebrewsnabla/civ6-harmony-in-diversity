-------------------------------------
--        Civics Adjustment        --
-------------------------------------

insert or replace into Civics_XP2 (CivicType, RandomPrereqs, HiddenUntilPrereqComplete)
select CivicType, 0, 0 from Civics where EraType = 'ERA_FUTURE';

-- v2
-- delete from CivicPrereqs where Civic = 'CIVIC_GAMES_RECREATION' and PrereqCivic = 'CIVIC_STATE_WORKFORCE';
delete from CivicPrereqs where Civic = 'CIVIC_DEFENSIVE_TACTICS' and PrereqCivic = 'CIVIC_POLITICAL_PHILOSOPHY';
-- delete from CivicPrereqs where Civic = 'CIVIC_DEFENSIVE_TACTICS' and PrereqCivic = 'CIVIC_GAMES_RECREATION';
delete from CivicPrereqs where Civic = 'CIVIC_MILITARY_TRAINING' and PrereqCivic = 'CIVIC_MILITARY_TRADITION';
-- delete from CivicPrereqs where Civic = 'CIVIC_MILITARY_TRAINING' and PrereqCivic = 'CIVIC_GAMES_RECREATION';
-- delete from CivicPrereqs where Civic = 'CIVIC_MERCENARIES' and PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES';
-- delete from CivicPrereqs where Civic = 'CIVIC_EXPLORATION' and PrereqCivic = 'CIVIC_MERCENARIES';
-- v1
delete from CivicPrereqs where Civic = 'CIVIC_NAVAL_TRADITION' and PrereqCivic = 'CIVIC_DEFENSIVE_TACTICS';
delete from CivicPrereqs where Civic = 'CIVIC_FEUDALISM' and PrereqCivic = 'CIVIC_DEFENSIVE_TACTICS';
delete from CivicPrereqs where Civic = 'CIVIC_CIVIL_SERVICE' and PrereqCivic = 'CIVIC_DEFENSIVE_TACTICS';
delete from CivicPrereqs where Civic = 'CIVIC_CIVIL_SERVICE' and PrereqCivic = 'CIVIC_RECORDED_HISTORY';
delete from CivicPrereqs where Civic = 'CIVIC_MERCENARIES' and PrereqCivic = 'CIVIC_FEUDALISM';
delete from CivicPrereqs where Civic = 'CIVIC_MERCENARIES' and PrereqCivic = 'CIVIC_MILITARY_TRAINING';
delete from CivicPrereqs where Civic = 'CIVIC_MEDIEVAL_FAIRES' and PrereqCivic = 'CIVIC_FEUDALISM';
delete from CivicPrereqs where Civic = 'CIVIC_GUILDS' and PrereqCivic = 'CIVIC_FEUDALISM';
delete from CivicPrereqs where Civic = 'CIVIC_GUILDS' and PrereqCivic = 'CIVIC_CIVIL_SERVICE';
delete from CivicPrereqs where Civic = 'CIVIC_DIVINE_RIGHT' and PrereqCivic = 'CIVIC_CIVIL_SERVICE';
delete from CivicPrereqs where Civic = 'CIVIC_EXPLORATION' and PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES'; -- v2
delete from CivicPrereqs where Civic = 'CIVIC_HUMANISM' and PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES';
delete from CivicPrereqs where Civic = 'CIVIC_REFORMED_CHURCH' and PrereqCivic = 'CIVIC_GUILDS';
-- delete from CivicPrereqs where Civic = 'CIVIC_HUMANISM' and PrereqCivic = 'CIVIC_GUILDS';
insert or replace into CivicPrereqs
	(Civic,								PrereqCivic)
values
	-- Future era
	('CIVIC_FUTURE_CIVIC',				'CIVIC_GLOBAL_WARMING_MITIGATION'),
	('CIVIC_FUTURE_CIVIC',				'CIVIC_SMART_POWER_DOCTRINE'),
	('CIVIC_FUTURE_CIVIC',				'CIVIC_INFORMATION_WARFARE'),
	('CIVIC_FUTURE_CIVIC',				'CIVIC_EXODUS_IMPERATIVE'),
	('CIVIC_FUTURE_CIVIC',				'CIVIC_CULTURAL_HEGEMONY'),
	('CIVIC_GLOBAL_WARMING_MITIGATION',	'CIVIC_NEAR_FUTURE_GOVERNANCE'),
	('CIVIC_SMART_POWER_DOCTRINE',		'CIVIC_CORPORATE_LIBERTARIANISM'),
	('CIVIC_INFORMATION_WARFARE',		'CIVIC_DIGITAL_DEMOCRACY'),
	('CIVIC_EXODUS_IMPERATIVE',			'CIVIC_SYNTHETIC_TECHNOCRACY'),
	('CIVIC_CULTURAL_HEGEMONY',			'CIVIC_NEAR_FUTURE_GOVERNANCE'),
	-- v2 
	-- ('CIVIC_GAMES_RECREATION',			'CIVIC_CRAFTSMANSHIP'),
	('CIVIC_DEFENSIVE_TACTICS',			'CIVIC_MILITARY_TRADITION'),
	-- ('CIVIC_DEFENSIVE_TACTICS',			'CIVIC_STATE_WORKFORCE'),
	-- ('CIVIC_MILITARY_TRAINING',			'CIVIC_DEFENSIVE_TACTICS'),
	('CIVIC_MILITARY_TRAINING',			'CIVIC_POLITICAL_PHILOSOPHY'),
	('CIVIC_NAVAL_TRADITION',			'CIVIC_MILITARY_TRADITION'),
	('CIVIC_FEUDALISM',					'CIVIC_MILITARY_TRAINING'),
	-- ('CIVIC_MEDIEVAL_FAIRES',			'CIVIC_DEFENSIVE_TACTICS'),
	('CIVIC_EXPLORATION',				'CIVIC_NAVAL_TRADITION'),
	-- ('CIVIC_MEDIEVAL_FAIRES',			'CIVIC_NAVAL_TRADITION'),
	-- ('CIVIC_MEDIEVAL_FAIRES',			'CIVIC_MERCENARIES'),
	-- ('CIVIC_GUILDS',					'CIVIC_MERCENARIES'),
	-- v1
	('CIVIC_MEDIEVAL_FAIRES',			'CIVIC_MILITARY_TRAINING'), -- (v2)
	-- ('CIVIC_FEUDALISM',				'CIVIC_DEFENSIVE_TACTICS'),
	('CIVIC_MERCENARIES',				'CIVIC_DEFENSIVE_TACTICS'),
	('CIVIC_FEUDALISM',					'CIVIC_RECORDED_HISTORY'),
	('CIVIC_MERCENARIES',				'CIVIC_MEDIEVAL_FAIRES'), -- (v2)
	('CIVIC_GUILDS',					'CIVIC_MEDIEVAL_FAIRES'),  -- (v2)
	-- ('CIVIC_CIVIL_SERVICE',			'CIVIC_MEDIEVAL_FAIRES'),
	('CIVIC_CIVIL_SERVICE',				'CIVIC_FEUDALISM'),
	-- ('CIVIC_GUILDS',					'CIVIC_FEUDALISM'),
	('CIVIC_DIVINE_RIGHT',				'CIVIC_FEUDALISM'),
	-- ('CIVIC_EXPLORATION',				'CIVIC_GUILDS'),
	-- ('CIVIC_HUMANISM',				'CIVIC_CIVIL_SERVICE'),
	('CIVIC_DIPLOMATIC_SERVICE',		'CIVIC_CIVIL_SERVICE'),
	('CIVIC_REFORMED_CHURCH',			'CIVIC_CIVIL_SERVICE'),
	('CIVIC_CIVIL_ENGINEERING',			'CIVIC_THE_ENLIGHTENMENT');

update CivicModifiers set CivicType = 'CIVIC_CIVIL_SERVICE' where
	CivicType = 'CIVIC_MEDIEVAL_FAIRES' and ModifierId = 'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS';
update CivicModifiers set CivicType = 'CIVIC_MILITARY_TRAINING' where
	CivicType = 'CIVIC_DEFENSIVE_TACTICS' and ModifierId = 'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS';
update CivicModifiers set CivicType = 'CIVIC_DEFENSIVE_TACTICS' where
	CivicType = 'CIVIC_MILITARY_TRAINING' and ModifierId = 'CIVIC_AWARD_ONE_INFLUENCE_TOKEN';

update Civics set UITreeRow = 1 where CivicType = 'CIVIC_FEUDALISM';
-- update Civics set UITreeRow = -1, Cost = 300 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_GUILDS';
update Civics set UITreeRow = 1, Cost = 420 where CivicType = 'CIVIC_CIVIL_SERVICE';

-- v2 adjustments
-- update Civics set UITreeRow = -2 where CivicType = 'CIVIC_MILITARY_TRADITION';
-- update Civics set UITreeRow = -2 where CivicType = 'CIVIC_GAMES_RECREATION';
update Civics set UITreeRow = -2, Cost = 120 where CivicType = 'CIVIC_DEFENSIVE_TACTICS'; -- 110
update Civics set UITreeRow = -1, Cost = 175 where CivicType = 'CIVIC_MILITARY_TRAINING';
update Civics set UITreeRow = -3 where CivicType = 'CIVIC_NAVAL_TRADITION';
update Civics set UITreeRow = -2, Cost = 340 where CivicType = 'CIVIC_MERCENARIES';
update Civics set UITreeRow = -1, Cost = 300 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';

update ModifierArguments set Value = 50 where ModifierId = 'ENVIRONMENTALISM_BOOST_ALL_TOURISM' and Name = 'Amount';

insert or replace into CivicModifiers (CivicType, ModifierId) 
values
	('CIVIC_CULTURAL_HEGEMONY',		'FUTURE_VICTORY_CULTURE_ROCK_BAND_PROMOTIONS'),
	('CIVIC_NATIONALISM',			'NATIONALIDENTITY_REDUCESTRENGTHREDUCTIONFORDAMAGE'),
	('CIVIC_CONSERVATION',			'CITY_CENTER_ADJACENT_TO_FOREST');

insert or replace into Modifiers
    (ModifierId,                                      ModifierType,                                       SubjectRequirementSetId)
values
    ('CITY_CENTER_ADJACENT_TO_FOREST',                'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY',     'ADJACENT_TO_FOREST_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                    Name,      Value)
values
    ('CITY_CENTER_ADJACENT_TO_FOREST',              'Amount',  1);

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
update Civics set Cost = 180 where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
update Civics set Cost = 240 where CivicType = 'CIVIC_RECORDED_HISTORY';
update Civics set Cost = 180 where CivicType = 'CIVIC_THEOLOGY';
update Civics set Cost = 300 where CivicType = 'CIVIC_NAVAL_TRADITION';
update Civics set Cost = 450 where CivicType = 'CIVIC_FEUDALISM';
update Civics set Cost = 600 where CivicType = 'CIVIC_CIVIL_SERVICE';
update Civics set Cost = 500 where CivicType = 'CIVIC_MERCENARIES';
update Civics set Cost = 450 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
update Civics set Cost = 600 where CivicType = 'CIVIC_GUILDS';
update Civics set Cost = 500 where CivicType = 'CIVIC_DIVINE_RIGHT';
update Civics set Cost = 660 where CivicType = 'CIVIC_EXPLORATION';
update Civics set Cost = 900 where CivicType = 'CIVIC_HUMANISM';
update Civics set Cost = 900 where CivicType = 'CIVIC_DIPLOMATIC_SERVICE';
update Civics set Cost = 660 where CivicType = 'CIVIC_REFORMED_CHURCH';
update Civics set Cost = 1050 where CivicType = 'CIVIC_MERCANTILISM';
update Civics set Cost = 1050 where CivicType = 'CIVIC_THE_ENLIGHTENMENT';
update Civics set Cost = 1150 where CivicType = 'CIVIC_COLONIALISM';
update Civics set Cost = 1450 where CivicType = 'CIVIC_CIVIL_ENGINEERING';
update Civics set Cost = 1450 where CivicType = 'CIVIC_NATIONALISM';
update Civics set Cost = 1150 where CivicType = 'CIVIC_OPERA_BALLET';
update Civics set Cost = 1500 where CivicType = 'CIVIC_NATURAL_HISTORY';
update Civics set Cost = 1700 where CivicType = 'CIVIC_SCORCHED_EARTH';
update Civics set Cost = 1700 where CivicType = 'CIVIC_URBANIZATION';
update Civics set Cost = 2100 where CivicType = 'CIVIC_CONSERVATION';
update Civics set Cost = 2150 where CivicType = 'CIVIC_CAPITALISM';
update Civics set Cost = 2500 where CivicType = 'CIVIC_NUCLEAR_PROGRAM';
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
