delete from Types where Type = 'IMPROVEMENT_RES2_LUMBER_MILL';
update Improvement_ValidResources set ImprovementType = 'IMPROVEMENT_LUMBER_MILL', MustRemoveFeature = 0 where ResourceType = 'RESOURCE_OAK';
