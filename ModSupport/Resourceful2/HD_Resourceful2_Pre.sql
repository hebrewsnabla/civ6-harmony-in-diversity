--------------------------
-- Resourceful 2 by xhh --
--------------------------

-- 该文件于DL_Resources.sql文件之前加载

create table "HDResourceful2_Basic"(
    "ResourceType"  TEXT NOT NULL,
    "Class"  TEXT NOT NULL,
    "Harvests"  TEXT NOT NULL,
    "Frequency"  INTEGER NOT NULL,
    "SeaFrequency"  INTEGER NOT NULL,
    PRIMARY KEY(ResourceType)
    FOREIGN KEY(ResourceType) REFERENCES Resources(ResourceType) ON DELETE CASCADE ON UPDATE CASCADE
);
insert or replace into HDResourceful2_Basic
    (ResourceType,				Class,      					Harvests,				Frequency,		SeaFrequency)
values
	-- 奢侈
    ('RESOURCE_WOLF',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_TRAVERTINE',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_TOXINS',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_TIGER',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_STRAWBERRY',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_SPONGE',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			0,				5),
	('RESOURCE_SEA_URCHIN',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			0,				5),
	('RESOURCE_SANDALWOOD',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_SAKURA',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_SAFFRON',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_RUBY',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_POPPIES',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_PLATINUM',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_ORCA',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			0,				1),
	('RESOURCE_LION',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_LAPIS',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_EBONY',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_CASHMERE',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_BAMBOO',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_ALABASTER',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_COD',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			0,				1),
	('RESOURCE_SALMON',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			0,				1),
	('RESOURCE_ALOE',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_MEDIHERBS',		'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	('RESOURCE_QUARTZ',			'RESOURCECLASS_LUXURY',			'YIELD_GOLD',			2,				0),
	-- 加成
	('RESOURCE_TOMATO',			'RESOURCECLASS_BONUS',			'YIELD_FOOD',			2,				0),
	('RESOURCE_TIN',			'RESOURCECLASS_BONUS',			'YIELD_PRODUCTION',		3,				0),
	('RESOURCE_RUBBER',			'RESOURCECLASS_BONUS',			'YIELD_PRODUCTION',		4,				0),
	('RESOURCE_PINE',			'RESOURCECLASS_BONUS',			'YIELD_PRODUCTION',		4,				0),
	('RESOURCE_OAK',			'RESOURCECLASS_BONUS',			'YIELD_PRODUCTION',		4,				0),
	('RESOURCE_MUSSELS',		'RESOURCECLASS_BONUS',			'YIELD_PRODUCTION',		0,				4),
	('RESOURCE_MUSHROOMS',		'RESOURCECLASS_BONUS',			'YIELD_FOOD',			2,				0),
	('RESOURCE_GRANITE',		'RESOURCECLASS_BONUS',			'YIELD_PRODUCTION',		4,				0),
	('RESOURCE_LIMESTONE',		'RESOURCECLASS_BONUS',			'YIELD_PRODUCTION',		3,				0),
	('RESOURCE_LEAD',			'RESOURCECLASS_BONUS',			'YIELD_PRODUCTION',		2,				0),
	('RESOURCE_HAM',			'RESOURCECLASS_BONUS',			'YIELD_FOOD',			4,				0),
	('RESOURCE_DATES',			'RESOURCECLASS_BONUS',			'YIELD_FOOD',			1,				0),
	('RESOURCE_BERRIES',		'RESOURCECLASS_BONUS',			'YIELD_FOOD',			3,				0),
	('RESOURCE_BARLEY',			'RESOURCECLASS_BONUS',			'YIELD_FOOD',			2,				0);

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
delete from Types where Type = 'RESOURCE_POTATO';

delete from Resource_YieldChanges where ResourceType in (select ResourceType from HDResourceful2_Basic);
delete from Resource_ValidTerrains where ResourceType in (select ResourceType from HDResourceful2_Basic);
delete from Resource_ValidFeatures where ResourceType in (select ResourceType from HDResourceful2_Basic);
delete from Resource_Harvests where ResourceType in (select ResourceType from HDResourceful2_Basic);

update Resources set ResourceClassType = 'RESOURCECLASS_LUXURY', Happiness = 4 
	where ResourceType = 'RESOURCE_COD' or ResourceType = 'RESOURCE_SALMON' or ResourceType = 'RESOURCE_ALOE' or ResourceType = 'RESOURCE_MEDIHERBS' or ResourceType = 'RESOURCE_QUARTZ';
update Resources set Happiness = 4 where ResourceType = 'RESOURCE_RUBY';

-- Harvest
insert or replace into Resource_Harvests
	(ResourceType,				YieldType,			Amount)
select
	ResourceType,				Harvests,			80
from HDResourceful2_Basic where Harvests = 'YIELD_GOLD';

insert or replace into Resource_Harvests
	(ResourceType,				YieldType,			Amount)
select
	ResourceType,				Harvests,			40
from HDResourceful2_Basic where Harvests = 'YIELD_FOOD' or Harvests = 'YIELD_PRODUCTION';