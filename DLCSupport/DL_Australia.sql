-------------------------------------
--		Australia DLC		--
-------------------------------------
update Improvements set PrereqCivic = null, PrereqTech = 'TECH_ARCHERY' where ImprovementType = 'IMPROVEMENT_OUTBACK_STATION';
insert or replace into Improvement_YieldChanges
	(ImprovementType,					YieldType,		YieldChange)
values
	('IMPROVEMENT_OUTBACK_STATION',		'YIELD_FOOD',	0);
insert or replace into Improvement_ValidTerrains
	(ImprovementType,					TerrainType,				PrereqTech)
values
	('IMPROVEMENT_OUTBACK_STATION',		'TERRAIN_GRASS_HILLS',		'TECH_MACHINERY'),
	('IMPROVEMENT_OUTBACK_STATION',		'TERRAIN_PLAINS_HILLS',		'TECH_MACHINERY'),
	('IMPROVEMENT_OUTBACK_STATION',		'TERRAIN_DESERT_HILLS',		'TECH_MACHINERY');
delete from Improvement_Adjacencies where ImprovementType = 'IMPROVEMENT_PASTURE' and YieldChangeId = 'Pasture_Outback_Production';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_MASS_PRODUCTION' where ID = 'Outback_Pasture_Food';
update Adjacency_YieldChanges set PrereqTech = null, ObsoleteTech = 'TECH_MACHINERY' where ID = 'Outback_Outback_Production';
update Adjacency_YieldChanges set TilesRequired = 1, PrereqCivic = 'CIVIC_GUILDS' where ID = 'Outback_Outback_Food'; 
insert or replace into Improvement_Adjacencies
	(ImprovementType,					YieldChangeId)
values
	('IMPROVEMENT_PASTURE',				'Pasture_Outback_Food'),
	('IMPROVEMENT_PASTURE',				'Pasture_Outback_Gold'),
	('IMPROVEMENT_OUTBACK_STATION',		'Outback_Pasture_Food_Late'),
	('IMPROVEMENT_OUTBACK_STATION',		'Outback_Pasture_Production'),
	('IMPROVEMENT_OUTBACK_STATION',		'Outback_Outback_Production_Late'),
	('IMPROVEMENT_OUTBACK_STATION',		'Outback_Outback_Production_Final');
insert or replace into Adjacency_YieldChanges
	(ID,									Description,	YieldType,			YieldChange,	TilesRequired,	AdjacentImprovement,			PrereqCivic,			PrereqTech)
values
	('Pasture_Outback_Food',				'Placeholder',	'YIELD_FOOD',		1,				2,				'IMPROVEMENT_OUTBACK_STATION',	null,					null),
	('Pasture_Outback_Gold',				'Placeholder',	'YIELD_GOLD',		2,				2,				'IMPROVEMENT_OUTBACK_STATION',	'CIVIC_MERCANTILISM',	null),
	('Outback_Pasture_Food_Late',			'Placeholder',	'YIELD_FOOD',		2,				1,				'IMPROVEMENT_PASTURE',			null,					'TECH_MASS_PRODUCTION'),
	('Outback_Pasture_Production',			'Placeholder',	'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_PASTURE',			'CIVIC_FEUDALISM',		null),
	('Outback_Outback_Production_Late',		'Placeholder',	'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_OUTBACK_STATION',	null,					'TECH_MACHINERY'),
	('Outback_Outback_Production_Final',	'Placeholder',	'YIELD_PRODUCTION',	1,				1,				'IMPROVEMENT_OUTBACK_STATION',	null,					'TECH_STEAM_POWER');


