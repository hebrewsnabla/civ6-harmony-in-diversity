create temporary table HD_ModifiedPlantationRequirements (RequirementId text not null primary key);
insert or replace into HD_ModifiedPlantationRequirements (RequirementId) select RequirementId from Requirements where RequirementType = 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES'
	and RequirementId in (select RequirementId from RequirementArguments where Name = 'ImprovementType' and Value = 'IMPROVEMENT_PLANTATION');
insert or ignore into RequirementArguments
	(RequirementId,		Name,				Value)
select
	RequirementId,		'RequirementSetId',	'PLOT_HAS_PLANTATION_OR_HACIENDA_ADJACNENT_TO_PLANTATION'
from HD_ModifiedPlantationRequirements;
update Requirements set RequirementType = 'REQUIREMENT_REQUIREMENTSET_IS_MET' where RequirementId in HD_ModifiedPlantationRequirements;
insert or ignore into Requirements
	(RequirementId,													RequirementType)
values
	('REQUIRES_PLOT_HAS_IMPROVEMENT_PLANTATION_RAW',				'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES'),
	('REQUIRES_PLOT_HAS_HACIENDA_ADJACNENT_TO_PLANTATION',			'REQUIREMENT_REQUIREMENTSET_IS_MET');
insert or ignore into RequirementArguments
	(RequirementId,													Name,					Value)
values
	('REQUIRES_PLOT_HAS_IMPROVEMENT_PLANTATION_RAW',				'ImprovementType',		'IMPROVEMENT_PLANTATION'),
	('REQUIRES_PLOT_HAS_HACIENDA_ADJACNENT_TO_PLANTATION',			'RequirementSetId',		'PLOT_HAS_HACIENDA_ADJACNENT_TO_PLANTATION');
insert or ignore into RequirementSets
	(RequirementSetId,												RequirementSetType)
values
	('PLOT_HAS_PLANTATION_OR_HACIENDA_ADJACNENT_TO_PLANTATION',		'REQUIREMENTSET_TEST_ANY'),
	('PLOT_HAS_HACIENDA_ADJACNENT_TO_PLANTATION',					'REQUIREMENTSET_TEST_ALL');
insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
values
	('PLOT_HAS_PLANTATION_OR_HACIENDA_ADJACNENT_TO_PLANTATION',		'REQUIRES_PLOT_HAS_IMPROVEMENT_PLANTATION_RAW'),
	('PLOT_HAS_PLANTATION_OR_HACIENDA_ADJACNENT_TO_PLANTATION',		'REQUIRES_PLOT_HAS_HACIENDA_ADJACNENT_TO_PLANTATION'),
	('PLOT_HAS_HACIENDA_ADJACNENT_TO_PLANTATION',					'REQUIRES_PLOT_HAS_IMPROVEMENT_HACIENDA'),
	('PLOT_HAS_HACIENDA_ADJACNENT_TO_PLANTATION',					'REQUIRES_PLOT_ADJACENT_TO_IMPROVEMENT_PLANTATION');