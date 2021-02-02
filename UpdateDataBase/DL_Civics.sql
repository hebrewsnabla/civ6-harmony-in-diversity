-------------------------------------
--        Civics Adjustment        --
-------------------------------------

insert or replace into Civics_XP2 (CivicType, RandomPrereqs, HiddenUntilPrereqComplete)
select CivicType, 0, 0 from Civics where EraType = 'ERA_FUTURE';

delete from CivicPrereqs where Civic = 'CIVIC_FEUDALISM' and PrereqCivic = 'CIVIC_DEFENSIVE_TACTICS';
delete from CivicPrereqs where Civic = 'CIVIC_CIVIL_SERVICE' and PrereqCivic = 'CIVIC_DEFENSIVE_TACTICS';
delete from CivicPrereqs where Civic = 'CIVIC_CIVIL_SERVICE' and PrereqCivic = 'CIVIC_RECORDED_HISTORY';
delete from CivicPrereqs where Civic = 'CIVIC_MERCENARIES' and PrereqCivic = 'CIVIC_FEUDALISM';
delete from CivicPrereqs where Civic = 'CIVIC_MEDIEVAL_FAIRES' and PrereqCivic = 'CIVIC_FEUDALISM';
delete from CivicPrereqs where Civic = 'CIVIC_GUILDS' and PrereqCivic = 'CIVIC_FEUDALISM';
delete from CivicPrereqs where Civic = 'CIVIC_GUILDS' and PrereqCivic = 'CIVIC_CIVIL_SERVICE';
delete from CivicPrereqs where Civic = 'CIVIC_DIVINE_RIGHT' and PrereqCivic = 'CIVIC_CIVIL_SERVICE';
delete from CivicPrereqs where Civic = 'CIVIC_EXPLORATION' and PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES';
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
	-- 
	('CIVIC_MEDIEVAL_FAIRES',			'CIVIC_DEFENSIVE_TACTICS'),
	-- ('CIVIC_FEUDALISM',				'CIVIC_DEFENSIVE_TACTICS'),
	('CIVIC_FEUDALISM',					'CIVIC_RECORDED_HISTORY'),
	('CIVIC_MERCENARIES',				'CIVIC_MEDIEVAL_FAIRES'),
	('CIVIC_GUILDS',					'CIVIC_MEDIEVAL_FAIRES'),
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
update Civics set UITreeRow = 1 where CivicType = 'CIVIC_FEUDALISM';
update Civics set Cost = 300, UITreeRow = -1 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
update Civics set UITreeRow = -1 where CivicType = 'CIVIC_GUILDS';
update Civics set Cost = 420, UITreeRow = 1 where CivicType = 'CIVIC_CIVIL_SERVICE';

update Civics set Cost = Cost * 1.1 where EraType = 'ERA_CLASSICAL';
update Civics set Cost = Cost * 1.2 where EraType = 'ERA_MEDIEVAL' or EraType = 'ERA_RENAISSANCE';
update Civics set Cost = Cost * 1.3 where EraType = 'ERA_INDUSTRIAL' or EraType = 'ERA_MODERN';
update Civics set Cost = Cost * 1.3 where EraType = 'ERA_ATOMIC' or EraType = 'ERA_INFORMATION' or EraType = 'ERA_FUTURE';

update CivicRandomCosts set Cost = Cost * 1.3 where Cost = 3200 or Cost = 3300;

update ModifierArguments set Value = 50 where ModifierId = 'ENVIRONMENTALISM_BOOST_ALL_TOURISM' and Name = 'Amount';

