-------------------------------------
--     Technologies Adjustment     --
-------------------------------------

update Technologies set EmbarkAll = 1 where TechnologyType = 'TECH_CELESTIAL_NAVIGATION';
-- update Technologies set EmbarkAll = 0 where TechnologyType = 'TECH_SHIPBUILDING';

-- update Technologies set Cost = 300 where TechnologyType = 'TECH_CASTLES';
-- update Technologies set Cost = 390 where TechnologyType = 'TECH_MACHINERY';
-- update ModifierArguments set Value = 50 where ModifierId = 'COMPUTERS_BOOST_ALL_TOURISM' and Name = 'Amount';

insert or replace into Technologies_XP2 (TechnologyType, RandomPrereqs, HiddenUntilPrereqComplete)
select TechnologyType, 0, 0 from Technologies where EraType = 'ERA_FUTURE';

-- update Technologies set UITreeRow = -3 where TechnologyType = 'TECH_ASTROLOGY';
-- update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_SAILING';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_THE_WHEEL';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_BRONZE_WORKING';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_MASONRY';
-- update Technologies set UITreeRow = -3 where TechnologyType = 'TECH_CELESTIAL_NAVIGATION';
-- update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_SHIPBUILDING';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_IRON_WORKING';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_ENGINEERING';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_CONSTRUCTION';
update Technologies set UITreeRow = -2 where TechnologyType = 'TECH_BUTTRESS';
update Technologies set UITreeRow = 1 where TechnologyType = 'TECH_CASTLES';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_APPRENTICESHIP';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_STIRRUPS';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_MILITARY_ENGINEERING';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_MACHINERY';
update Technologies set UITreeRow = 0 where TechnologyType = 'TECH_MILITARY_TACTICS';
update Technologies set UITreeRow = -1 where TechnologyType = 'TECH_EDUCATION';
update Technologies set UITreeRow = 2 where TechnologyType = 'TECH_GUNPOWDER';
update Technologies set UITreeRow = 3 where TechnologyType = 'TECH_SIEGE_TACTICS';
update Technologies set UITreeRow = 4 where TechnologyType = 'TECH_PRINTING';

delete from TechnologyPrereqs where Technology = 'TECH_BUTTRESS' and PrereqTech = 'TECH_SHIPBUILDING';
delete from TechnologyPrereqs where Technology = 'TECH_APPRENTICESHIP' and PrereqTech = 'TECH_HORSEBACK_RIDING';
delete from TechnologyPrereqs where Technology = 'TECH_APPRENTICESHIP' and PrereqTech = 'TECH_CURRENCY';
-- delete from TechnologyPrereqs where Technology = 'TECH_MILITARY_TACTICS' and PrereqTech = 'TECH_MATHEMATICS';
delete from TechnologyPrereqs where Technology = 'TECH_CONSTRUCTION' and PrereqTech = 'TECH_HORSEBACK_RIDING';
delete from TechnologyPrereqs where Technology = 'TECH_MACHINERY' and PrereqTech = 'TECH_IRON_WORKING';
delete from TechnologyPrereqs where Technology = 'TECH_MACHINERY' and PrereqTech = 'TECH_ENGINEERING';
delete from TechnologyPrereqs where Technology = 'TECH_CASTLES' and PrereqTech = 'TECH_CONSTRUCTION';
delete from TechnologyPrereqs where Technology = 'TECH_MILITARY_ENGINEERING' and PrereqTech = 'TECH_ENGINEERING';
-- delete from TechnologyPrereqs where Technology = 'TECH_STIRRUPS' and PrereqTech = 'TECH_HORSEBACK_RIDING';
delete from TechnologyPrereqs where Technology = 'TECH_STIRRUPS' and PrereqTech = 'TECH_APPRENTICESHIP';
delete from TechnologyPrereqs where Technology = 'TECH_EDUCATION' and PrereqTech = 'TECH_APPRENTICESHIP';
delete from TechnologyPrereqs where Technology = 'TECH_GUNPOWDER' and PrereqTech = 'TECH_STIRRUPS';
delete from TechnologyPrereqs where Technology = 'TECH_SIEGE_TACTICS' and PrereqTech = 'TECH_CASTLES';
delete from TechnologyPrereqs where Technology = 'TECH_MASS_PRODUCTION' and PrereqTech = 'TECH_MILITARY_TACTICS';

insert or replace into TechnologyPrereqs
	(Technology,					PrereqTech)
values
	('TECH_MATHEMATICS',			'TECH_IRRIGATION'),
	('TECH_MILITARY_TACTICS',		'TECH_CURRENCY'),
	('TECH_APPRENTICESHIP',			'TECH_ENGINEERING'),
	('TECH_STIRRUPS',				'TECH_MILITARY_TACTICS'),
	('TECH_MACHINERY',				'TECH_CONSTRUCTION'),
	('TECH_MACHINERY',				'TECH_IRON_WORKING'),
	('TECH_CASTLES',				'TECH_HORSEBACK_RIDING'),
	('TECH_CASTLES',				'TECH_ENGINEERING'),
	-- ('TECH_CASTLES',				'TECH_CURRENCY'),
	-- ('TECH_MILITARY_TACTICS',		'TECH_ENGINEERING'),
	('TECH_MILITARY_ENGINEERING',	'TECH_IRON_WORKING'),
	('TECH_CARTOGRAPHY',			'TECH_SHIPBUILDING'),
	('TECH_SIEGE_TACTICS',			'TECH_MILITARY_ENGINEERING'),
	('TECH_METAL_CASTING',			'TECH_CASTLES'),
	--
	('TECH_THE_WHEEL',				'TECH_ANIMAL_HUSBANDRY'),
	-- ('TECH_ENGINEERING',			'TECH_MASONRY'),
	('TECH_BUTTRESS',				'TECH_CELESTIAL_NAVIGATION'),
	('TECH_APPRENTICESHIP',			'TECH_IRON_WORKING'),
	-- Future Era
	('TECH_FUTURE_TECH',			'TECH_OFFWORLD_MISSION'),
	('TECH_OFFWORLD_MISSION',		'TECH_ADVANCED_AI'),
	('TECH_OFFWORLD_MISSION',		'TECH_ADVANCED_POWER_CELLS'),
	('TECH_OFFWORLD_MISSION',		'TECH_CYBERNETICS'),
	('TECH_OFFWORLD_MISSION',		'TECH_SMART_MATERIALS'),
	-- 
	('TECH_SEASTEADS',				'TECH_TELECOMMUNICATIONS'),
	('TECH_ADVANCED_AI',			'TECH_ROBOTICS'),
	('TECH_ADVANCED_POWER_CELLS',	'TECH_ROBOTICS'),
	('TECH_ADVANCED_POWER_CELLS',	'TECH_NUCLEAR_FUSION'),
	('TECH_CYBERNETICS',			'TECH_ROBOTICS'),
	('TECH_SMART_MATERIALS',		'TECH_ROBOTICS'),
	('TECH_SMART_MATERIALS',		'TECH_NUCLEAR_FUSION'),
	('TECH_SMART_MATERIALS',		'TECH_NANOTECHNOLOGY'),
	('TECH_PREDICTIVE_SYSTEMS',		'TECH_NANOTECHNOLOGY');

-- v1
-- update Technologies set Cost = 4000 where Cost = 2600;
-- update Technologies set Cost = 3500 where Cost = 2500;
-- update Technologies set Cost = 3000 where Cost = 2200;
-- update Technologies set Cost = 2600 where Cost = 2155;
-- update Technologies set Cost = 2400 where Cost = 1850;
-- update Technologies set Cost = 2200 where Cost = 1660;
-- update Technologies set Cost = 2000 where Cost = 1480;
-- update Technologies set Cost = 1800 where Cost = 1370;
-- update Technologies set Cost = 1600 where Cost = 1250;
-- update Technologies set Cost = 1400 where Cost = 1070;
-- update Technologies set Cost = 1200 where Cost = 930;
-- update Technologies set Cost = 900 where Cost = 730;
-- update Technologies set Cost = 700 where Cost = 600;
-- update Technologies set Cost = 500 where Cost = 390;
-- update Technologies set Cost = 360 where Cost = 300;
-- update Technologies set Cost = 240 where Cost = 200;
-- update Technologies set Cost = 150 where Cost = 120;
-- update Technologies set Cost = 100 where Cost = 80;
-- update Technologies set Cost = 60 where Cost = 50;

-- v2
-- update Technologies set Cost = 3600 where Cost = 2600;
-- -- 
-- update Technologies set Cost = 3300 where Cost = 2500;
-- update TechnologyRandomCosts set Cost = 3100 where Cost = 2300;
-- update TechnologyRandomCosts set Cost = 3000 where Cost = 2200;
-- -- update Technologies set Cost = 2700 where Cost = 2200;
-- -- 
-- update Technologies set Cost = 2750 where Cost = 2155;
-- update Technologies set Cost = 2600 where Cost = 1850;
-- -- 
-- update Technologies set Cost = 2250 where Cost = 1660;
-- update Technologies set Cost = 2100 where Cost = 1480;
-- -- 
-- update Technologies set Cost = 1850 where Cost = 1370;
-- update Technologies set Cost = 1600 where Cost = 1250;
-- -- 
-- update Technologies set Cost = 1350 where Cost = 1070;
-- update Technologies set Cost = 1200 where Cost = 930;
-- -- 
-- update Technologies set Cost = 950 where Cost = 730;
-- update Technologies set Cost = 800 where Cost = 600;
-- -- 
-- update Technologies set Cost = 550 where Cost = 390;
-- update Technologies set Cost = 400 where Cost = 300;
-- -- 
-- update Technologies set Cost = 240 where Cost = 200;
-- update Technologies set Cost = 160 where Cost = 120;
-- -- Ancient
-- update Technologies set Cost = 100 where Cost = 80;
-- update Technologies set Cost = 60 where Cost = 50;
-- update Technologies set Cost = 25 where Cost = 25;

-- v3
update Technologies set Cost = 4500 where Cost = 2600;
-- 
update Technologies set Cost = 4000 where Cost = 2500;
update TechnologyRandomCosts set Cost = 3700 where Cost = 2300;
update TechnologyRandomCosts set Cost = 3600 where Cost = 2200;
-- update Technologies set Cost = 2700 where Cost = 2200;
-- 
update Technologies set Cost = 3100 where Cost = 2155;
update Technologies set Cost = 3000 where Cost = 1850;
-- 
update Technologies set Cost = 2500 where Cost = 1660;
update Technologies set Cost = 2400 where Cost = 1480;
-- 
update Technologies set Cost = 1900 where Cost = 1370;
update Technologies set Cost = 1800 where Cost = 1250;
-- 
update Technologies set Cost = 1400 where Cost = 1070;
update Technologies set Cost = 1300 where Cost = 930;
-- 
update Technologies set Cost = 950 where Cost = 730;
update Technologies set Cost = 850 where Cost = 600;
-- 
update Technologies set Cost = 550 where Cost = 390;
update Technologies set Cost = 450 where Cost = 300;
-- 
update Technologies set Cost = 280 where Cost = 200;
update Technologies set Cost = 160 where Cost = 120;
-- Ancient
update Technologies set Cost = 80 where Cost = 80;
update Technologies set Cost = 50 where Cost = 50;

insert or replace into TechnologyModifiers
	(TechnologyType,							ModifierId)
values
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_WRITING_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_LANDSCAPE_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_PORTRAIT_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_SCULPTURE_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_MUSIC_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_RELIGIOUS_YIELD_BOOST'),
	('TECH_TELECOMMUNICATIONS',					'TECH_TELECOMMUNICATIONS_ARTIFACTS_YIELD_BOOST');

insert or replace into Modifiers
	(ModifierId,													ModifierType)
values
	('TECH_TELECOMMUNICATIONS_WRITING_YIELD_BOOST',					'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),
	('TECH_TELECOMMUNICATIONS_LANDSCAPE_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),					
	('TECH_TELECOMMUNICATIONS_PORTRAIT_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),
	('TECH_TELECOMMUNICATIONS_SCULPTURE_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),	
	('TECH_TELECOMMUNICATIONS_MUSIC_YIELD_BOOST',					'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),
	('TECH_TELECOMMUNICATIONS_RELIGIOUS_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM'),
	('TECH_TELECOMMUNICATIONS_ARTIFACTS_YIELD_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM');

insert or replace into ModifierArguments
	(ModifierId,												Name,						Value)
values
	('TECH_TELECOMMUNICATIONS_WRITING_YIELD_BOOST',				'GreatWorkObjectType',		'GREATWORKOBJECT_WRITING'),
	('TECH_TELECOMMUNICATIONS_WRITING_YIELD_BOOST',				'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_LANDSCAPE_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_LANDSCAPE'),
	('TECH_TELECOMMUNICATIONS_LANDSCAPE_YIELD_BOOST',			'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_PORTRAIT_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_PORTRAIT'),
	('TECH_TELECOMMUNICATIONS_PORTRAIT_YIELD_BOOST',			'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_SCULPTURE_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_SCULPTURE'),
	('TECH_TELECOMMUNICATIONS_SCULPTURE_YIELD_BOOST',			'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_MUSIC_YIELD_BOOST',				'GreatWorkObjectType',		'GREATWORKOBJECT_MUSIC'),
	('TECH_TELECOMMUNICATIONS_MUSIC_YIELD_BOOST',				'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_RELIGIOUS_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_RELIGIOUS'),
	('TECH_TELECOMMUNICATIONS_RELIGIOUS_YIELD_BOOST',			'ScalingFactor',			150),
	('TECH_TELECOMMUNICATIONS_ARTIFACTS_YIELD_BOOST',			'GreatWorkObjectType',		'GREATWORKOBJECT_ARTIFACT'),
	('TECH_TELECOMMUNICATIONS_ARTIFACTS_YIELD_BOOST',			'ScalingFactor',			150);
