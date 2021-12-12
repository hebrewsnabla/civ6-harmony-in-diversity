--------------------------
-- Resourceful 2 by xhh --
--------------------------

-- Delete
delete from Types where Type = 'RESOURCE_MAPLE';
delete from Types where Type = 'RESOURCE_CORAL';
delete from Types where Type = 'RESOURCE_CAVIAR';
delete from Types where Type = 'RESOURCE_SORGHUM';
delete from Types where Type = 'RESOURCE_SEASHELLS';
delete from Types where Type = 'RESOURCE_OXEN';
delete from Types where Type = 'RESOURCE_MACKEREL';
delete from Types where Type = 'RESOURCE_ALGAE';
delete from Types where Type = 'RESOURCE_GOLD2';

delete from Resource_YieldChanges where ResourceType = 'RESOURCE_WOLF' or ResourceType = 'RESOURCE_TRAVERTINE' or ResourceType = 'RESOURCE_TOXINS' 
	or ResourceType = 'RESOURCE_TIGER' or ResourceType = 'RESOURCE_STRAWBERRY' or ResourceType = 'RESOURCE_SPONGE' or ResourceType = 'RESOURCE_SEA_URCHIN' 
	or ResourceType = 'RESOURCE_SANDALWOOD' or ResourceType = 'RESOURCE_SAKURA' or ResourceType = 'RESOURCE_SAFFRON' or ResourceType = 'RESOURCE_RUBY' 
	or ResourceType = 'RESOURCE_POPPIES' or ResourceType = 'RESOURCE_PLATINUM' or ResourceType = 'RESOURCE_ORCA' or ResourceType = 'RESOURCE_LION' 
	or ResourceType = 'RESOURCE_LAPIS' or ResourceType = 'RESOURCE_EBONY' or ResourceType = 'RESOURCE_CASHMERE' or ResourceType = 'RESOURCE_BAMBOO' 
	or ResourceType = 'RESOURCE_ALABASTER' or ResourceType = 'RESOURCE_TOMATO' or ResourceType = 'RESOURCE_TIN' or ResourceType = 'RESOURCE_SALMON' 
	or ResourceType = 'RESOURCE_RUBBER' or ResourceType = 'RESOURCE_QUARTZ' or ResourceType = 'RESOURCE_PINE' or ResourceType = 'RESOURCE_OAK' 
	or ResourceType = 'RESOURCE_MUSSELS' or ResourceType = 'RESOURCE_MUSHROOMS' or ResourceType = 'RESOURCE_MEDIHERBS' or ResourceType = 'RESOURCE_LIMESTONE' 
	or ResourceType = 'RESOURCE_LEAD' or ResourceType = 'RESOURCE_HAM' or ResourceType = 'RESOURCE_GRANITE' or ResourceType = 'RESOURCE_DATES' 
	or ResourceType = 'RESOURCE_COD' or ResourceType = 'RESOURCE_BERRIES' or ResourceType = 'RESOURCE_BARLEY' or ResourceType = 'RESOURCE_ALOE';

-- Basic
update Resources set ResourceClassType = 'RESOURCECLASS_LUXURY', Happiness = 4 
	where ResourceType = 'RESOURCE_COD' or ResourceType = 'RESOURCE_SALMON' or ResourceType = 'RESOURCE_ALOE' or ResourceType = 'RESOURCE_MEDIHERBS' or ResourceType = 'RESOURCE_QUARTZ';
update Resources set Happiness = 4 where ResourceType = 'RESOURCE_RUBY';

-- Yield
insert or replace into Resource_YieldChanges
	(ResourceType,				YieldType,				YieldChange)
values
	-- 奢侈
	('RESOURCE_WOLF',			'YIELD_CULTURE',		1),
	('RESOURCE_WOLF',			'YIELD_GOLD',			1),
	('RESOURCE_TRAVERTINE',		'YIELD_SCIENCE',		1),
	('RESOURCE_TRAVERTINE',		'YIELD_GOLD',			1),
	('RESOURCE_TOXINS',			'YIELD_SCIENCE',		1),
	('RESOURCE_TOXINS',			'YIELD_GOLD',			1),
	('RESOURCE_TIGER',			'YIELD_CULTURE',		1),
	('RESOURCE_TIGER',			'YIELD_GOLD',			1),
	('RESOURCE_STRAWBERRY',		'YIELD_FOOD',			1),
	('RESOURCE_STRAWBERRY',		'YIELD_GOLD',			1),
	('RESOURCE_SPONGE',			'YIELD_SCIENCE',		1),
	('RESOURCE_SPONGE',			'YIELD_GOLD',			1),
	('RESOURCE_SEA_URCHIN',		'YIELD_FOOD',			1),
	('RESOURCE_SEA_URCHIN',		'YIELD_GOLD',			1),
	('RESOURCE_SANDALWOOD',		'YIELD_FAITH',			1),
	('RESOURCE_SANDALWOOD',		'YIELD_GOLD',			1),
	('RESOURCE_SAKURA',			'YIELD_CULTURE',		1),
	('RESOURCE_SAKURA',			'YIELD_GOLD',			1),
	('RESOURCE_SAFFRON',		'YIELD_CULTURE',		1),
	('RESOURCE_SAFFRON',		'YIELD_GOLD',			1),
	('RESOURCE_RUBY',			'YIELD_PRODUCTION',		1),
	('RESOURCE_RUBY',			'YIELD_GOLD',			1),
	('RESOURCE_POPPIES',		'YIELD_CULTURE',		1),
	('RESOURCE_POPPIES',		'YIELD_GOLD',			1),
	('RESOURCE_PLATINUM',		'YIELD_PRODUCTION',		1),
	('RESOURCE_PLATINUM',		'YIELD_GOLD',			1),
	('RESOURCE_ORCA',			'YIELD_GOLD',			3),
	('RESOURCE_LION',			'YIELD_CULTURE',		1),
	('RESOURCE_LION',			'YIELD_GOLD',			1),
	('RESOURCE_LAPIS',			'YIELD_SCIENCE',		1),
	('RESOURCE_LAPIS',			'YIELD_GOLD',			1),
	('RESOURCE_EBONY',			'YIELD_CULTURE',		1),
	('RESOURCE_EBONY',			'YIELD_GOLD',			1),
	('RESOURCE_CASHMERE',		'YIELD_GOLD',			3),
	('RESOURCE_BAMBOO',			'YIELD_PRODUCTION',		1),
	('RESOURCE_BAMBOO',			'YIELD_GOLD',			1),
	('RESOURCE_ALABASTER',		'YIELD_CULTURE',		1),
	('RESOURCE_ALABASTER',		'YIELD_GOLD',			3),
	('RESOURCE_COD',			'YIELD_SCIENCE',		1),
	('RESOURCE_COD',			'YIELD_GOLD',			1),
	('RESOURCE_SALMON',			'YIELD_CULTURE',		1),
	('RESOURCE_SALMON',			'YIELD_GOLD',			1),
	('RESOURCE_ALOE',			'YIELD_FOOD',			1),
	('RESOURCE_ALOE',			'YIELD_GOLD',			1),
	('RESOURCE_MEDIHERBS',		'YIELD_SCIENCE',		1),
	('RESOURCE_MEDIHERBS',		'YIELD_GOLD',			1),
	('RESOURCE_QUARTZ',			'YIELD_FAITH',			1),
	('RESOURCE_QUARTZ',			'YIELD_GOLD',			1),
	-- 加成
	('RESOURCE_TOMATO',			'YIELD_FOOD',			1),
	('RESOURCE_TIN',			'YIELD_GOLD',			2),
	('RESOURCE_RUBBER',			'YIELD_PRODUCTION',		1),
	('RESOURCE_PINE',			'YIELD_PRODUCTION',		1),
	('RESOURCE_OAK',			'YIELD_FOOD',			1),
	('RESOURCE_MUSSELS',		'YIELD_PRODUCTION',		1),
	('RESOURCE_MUSHROOMS',		'YIELD_FAITH',			1),
	('RESOURCE_LIMESTONE',		'YIELD_PRODUCTION',		1),
	('RESOURCE_GRANITE',		'YIELD_FOOD',			-1),
	('RESOURCE_GRANITE',		'YIELD_PRODUCTION',		1),
	('RESOURCE_GRANITE',		'YIELD_GOLD',			2),
	('RESOURCE_LEAD',			'YIELD_FOOD',			-1),
	('RESOURCE_LEAD',			'YIELD_PRODUCTION',		2),
	('RESOURCE_HAM',			'YIELD_FOOD',			1),
	('RESOURCE_DATES',			'YIELD_FOOD',			1),
	('RESOURCE_BERRIES',		'YIELD_FOOD',			2),
	('RESOURCE_BARLEY',			'YIELD_FOOD',			1),
	('RESOURCE_BARLEY',			'YIELD_GOLD',			1);

