delete from Types where Type = 'IMPROVEMENT_RES2_LUMBER_MILL';
insert or replace into Improvement_ValidResources
	(ImprovementType,				ResourceType,		MustRemoveFeature)
values
	('IMPROVEMENT_LUMBER_MILL',		'RESOURCE_OAK',		0);