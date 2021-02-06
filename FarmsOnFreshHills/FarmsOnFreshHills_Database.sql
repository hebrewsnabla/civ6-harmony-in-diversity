insert or replace into Types (Type, Kind) values ('IMPROVEMENT_DUMMY', 'KIND_IMPROVEMENT');

insert or replace into Improvements
	(ImprovementType,		Name,							PrereqTech,		Buildable,
	Description,							PlunderType,	Icon)
values
	('IMPROVEMENT_DUMMY',	'LOC_IMPROVEMENT_DUMMY_NAME',	NULL,			1,
	'LOC_IMPROVEMENT_DUMMY_DESCRIPTION',	'NO_PLUNDER',	'ICON_IMPROVEMENT_DUMMY');

insert or replace into Improvement_ValidBuildUnits (ImprovementType, UnitType)
	values ('IMPROVEMENT_DUMMY', 'UNIT_BUILDER');

insert or replace into Improvement_ValidTerrains
	(ImprovementType,		TerrainType)
values
	('IMPROVEMENT_DUMMY',	'TERRAIN_PLAINS_HILLS'),
	('IMPROVEMENT_DUMMY',	'TERRAIN_GRASS_HILLS');
