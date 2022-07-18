update Improvement_ValidResources set ImprovementType = 'IMPROVEMENT_LUMBER_MILL'
	where ImprovementType = 'IMPROVEMENT_RES2_LUMBER_MILL' and ResourceType not in 
	(select ResourceType from Improvement_ValidResources where ImprovementType = 'IMPROVEMENT_LUMBER_MILL');
delete from Types where Type = 'IMPROVEMENT_RES2_LUMBER_MILL';