-------------------------------------
--     Technologies Adjustment     --
-------------------------------------

-- update Technologies set Cost = 80, EraType = 'ERA_ANCIENT' where TechnologyType = 'TECH_CELESTIAL_NAVIGATION';
-- update Technologies set Cost = 390 where TechnologyType = 'TECH_MACHINERY';
-- update ModifierArguments set Value = 50 where ModifierId = 'COMPUTERS_BOOST_ALL_TOURISM' and Name = 'Amount';

insert or replace into Technologies_XP2 (TechnologyType, RandomPrereqs, HiddenUntilPrereqComplete)
select TechnologyType, 0, 0 from Technologies where EraType = 'ERA_FUTURE';

insert or replace into TechnologyPrereqs 
	(Technology,				PrereqTech)
values
	-- 
	-- Future Era
	('TECH_FUTURE_TECH',			'TECH_OFFWORLD_MISSION'),
	('TECH_OFFWORLD_MISSION',		'TECH_ADVANCED_AI'),
	('TECH_OFFWORLD_MISSION',		'TECH_ADVANCED_POWER_CELLS'),
	('TECH_OFFWORLD_MISSION',		'TECH_CYBERNETICS'),
	('TECH_OFFWORLD_MISSION',		'TECH_SMART_MATERIALS'),

	('TECH_SEASTEADS',				'TECH_TELECOMMUNICATIONS'),
	('TECH_ADVANCED_AI',			'TECH_ROBOTICS'),
	('TECH_ADVANCED_POWER_CELLS',	'TECH_ROBOTICS'),
	('TECH_ADVANCED_POWER_CELLS',	'TECH_NUCLEAR_FUSION'),
	('TECH_CYBERNETICS',			'TECH_ROBOTICS'),
	('TECH_SMART_MATERIALS',		'TECH_ROBOTICS'),
	('TECH_SMART_MATERIALS',		'TECH_NUCLEAR_FUSION'),
	('TECH_SMART_MATERIALS',		'TECH_NANOTECHNOLOGY'),
	('TECH_PREDICTIVE_SYSTEMS',		'TECH_NANOTECHNOLOGY'),
	-- 
	('TECH_THE_WHEEL',				'TECH_ANIMAL_HUSBANDRY'),
	('TECH_ENGINEERING',			'TECH_MASONRY');

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

update Technologies set Cost = 3600 where Cost = 2600;
-- 
update Technologies set Cost = 3300 where Cost = 2500;
update TechnologyRandomCosts set Cost = 3100 where Cost = 2300;
update TechnologyRandomCosts set Cost = 3000 where Cost = 2200;
-- update Technologies set Cost = 2700 where Cost = 2200;
-- 
update Technologies set Cost = 2750 where Cost = 2155;
update Technologies set Cost = 2600 where Cost = 1850;
-- 
update Technologies set Cost = 2250 where Cost = 1660;
update Technologies set Cost = 2100 where Cost = 1480;
-- 
update Technologies set Cost = 1850 where Cost = 1370;
update Technologies set Cost = 1600 where Cost = 1250;
-- 
update Technologies set Cost = 1350 where Cost = 1070;
update Technologies set Cost = 1200 where Cost = 930;
-- 
update Technologies set Cost = 950 where Cost = 730;
update Technologies set Cost = 800 where Cost = 600;
-- 
update Technologies set Cost = 550 where Cost = 390;
update Technologies set Cost = 400 where Cost = 300;
-- 
update Technologies set Cost = 240 where Cost = 200;
update Technologies set Cost = 160 where Cost = 120;
-- Ancient
update Technologies set Cost = 100 where Cost = 80;
update Technologies set Cost = 60 where Cost = 50;
-- update Technologies set Cost = 25 where Cost = 25;

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

insert or replace into TechnologyPrereqs (Technology,PrereqTech) values
	('TECH_APPRENTICESHIP','TECH_IRON_WORKING');
