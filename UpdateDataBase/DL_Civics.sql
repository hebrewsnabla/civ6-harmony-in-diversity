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
delete from CivicPrereqs where Civic = 'CIVIC_EXPLORATION' and PrereqCivic = 'CIVIC_MERCENARIES';
-- v1
delete from CivicPrereqs where Civic = 'CIVIC_FEUDALISM' and PrereqCivic = 'CIVIC_DEFENSIVE_TACTICS';
delete from CivicPrereqs where Civic = 'CIVIC_CIVIL_SERVICE' and PrereqCivic = 'CIVIC_DEFENSIVE_TACTICS';
delete from CivicPrereqs where Civic = 'CIVIC_CIVIL_SERVICE' and PrereqCivic = 'CIVIC_RECORDED_HISTORY';
delete from CivicPrereqs where Civic = 'CIVIC_MERCENARIES' and PrereqCivic = 'CIVIC_FEUDALISM';
delete from CivicPrereqs where Civic = 'CIVIC_MEDIEVAL_FAIRES' and PrereqCivic = 'CIVIC_FEUDALISM';
delete from CivicPrereqs where Civic = 'CIVIC_GUILDS' and PrereqCivic = 'CIVIC_FEUDALISM';
delete from CivicPrereqs where Civic = 'CIVIC_GUILDS' and PrereqCivic = 'CIVIC_CIVIL_SERVICE';
delete from CivicPrereqs where Civic = 'CIVIC_DIVINE_RIGHT' and PrereqCivic = 'CIVIC_CIVIL_SERVICE';
-- delete from CivicPrereqs where Civic = 'CIVIC_EXPLORATION' and PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES'; -- v2
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
	-- ('CIVIC_NAVAL_TRADITION',			'CIVIC_GAMES_RECREATION'),
	('CIVIC_FEUDALISM',					'CIVIC_MILITARY_TRAINING'),
	-- ('CIVIC_MEDIEVAL_FAIRES',			'CIVIC_DEFENSIVE_TACTICS'),
	-- ('CIVIC_EXPLORATION',				'CIVIC_NAVAL_TRADITION'),
	('CIVIC_MEDIEVAL_FAIRES',			'CIVIC_NAVAL_TRADITION'),
	-- ('CIVIC_MEDIEVAL_FAIRES',			'CIVIC_MERCENARIES'),
	('CIVIC_GUILDS',					'CIVIC_MERCENARIES'),
	-- v1
	-- ('CIVIC_MEDIEVAL_FAIRES',			'CIVIC_DEFENSIVE_TACTICS'), -- (v2)
	-- ('CIVIC_FEUDALISM',				'CIVIC_DEFENSIVE_TACTICS'),
	('CIVIC_FEUDALISM',					'CIVIC_RECORDED_HISTORY'),
	-- ('CIVIC_MERCENARIES',				'CIVIC_MEDIEVAL_FAIRES'), -- (v2)
	-- ('CIVIC_GUILDS',					'CIVIC_MEDIEVAL_FAIRES'),  -- (v2)
	-- ('CIVIC_CIVIL_SERVICE',			'CIVIC_MEDIEVAL_FAIRES'),
	('CIVIC_CIVIL_SERVICE',				'CIVIC_FEUDALISM'),
	-- ('CIVIC_GUILDS',					'CIVIC_FEUDALISM'),
	('CIVIC_DIVINE_RIGHT',				'CIVIC_FEUDALISM'),
	('CIVIC_EXPLORATION',				'CIVIC_GUILDS'),
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
update Civics set UITreeRow = -3, Cost = 120 where CivicType = 'CIVIC_DEFENSIVE_TACTICS'; -- 110
update Civics set UITreeRow = -1, Cost = 175 where CivicType = 'CIVIC_MILITARY_TRAINING';
update Civics set UITreeRow = -3 where CivicType = 'CIVIC_NAVAL_TRADITION';
update Civics set UITreeRow = -1, Cost = 300 where CivicType = 'CIVIC_MERCENARIES';
update Civics set UITreeRow = -3, Cost = 340 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
-- update Civics set UITreeRow = -2, Cost = 300 where CivicType = 'CIVIC_MEDIEVAL_FAIRES'; -- MAYBE

update Civics set Cost = Cost * 1.1 where EraType = 'ERA_CLASSICAL';
update Civics set Cost = Cost * 1.2 where EraType = 'ERA_MEDIEVAL' or EraType = 'ERA_RENAISSANCE';
update Civics set Cost = Cost * 1.3 where EraType = 'ERA_INDUSTRIAL' or EraType = 'ERA_MODERN';
update Civics set Cost = Cost * 1.4 where EraType = 'ERA_ATOMIC' or EraType = 'ERA_INFORMATION' or EraType = 'ERA_FUTURE';

update CivicRandomCosts set Cost = Cost * 1.3 where Cost = 3200 or Cost = 3300;

update ModifierArguments set Value = 50 where ModifierId = 'ENVIRONMENTALISM_BOOST_ALL_TOURISM' and Name = 'Amount';

insert or replace into CivicModifiers (CivicType, ModifierId) values
	('CIVIC_MEDIEVAL_FAIRES',	'CIVIC_GRANT_ONE_TRADE_ROUTE');
