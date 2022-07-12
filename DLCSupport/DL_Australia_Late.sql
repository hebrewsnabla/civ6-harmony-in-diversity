create temporary table HD_ModifiedPastureRequirements (RequirementId text not null primary key);
insert or replace into HD_ModifiedPastureRequirements (RequirementId) select RequirementId from Requirements where RequirementType = 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES'
	and RequirementId in (select RequirementId from RequirementArguments where Name = 'ImprovementType' and Value = 'IMPROVEMENT_PASTURE');
insert or ignore into RequirementArguments
	(RequirementId,		Name,				Value)
select
	RequirementId,		'RequirementSetId',	'PLOT_HAS_PASTURE_OR_OUTBACK_STATION_ADJACNENT_TO_PASTURE'
from HD_ModifiedPastureRequirements;
update Requirements set RequirementType = 'REQUIREMENT_REQUIREMENTSET_IS_MET' where RequirementId in HD_ModifiedPastureRequirements;
insert or ignore into Requirements
	(RequirementId,												RequirementType)
values
	('REQUIRES_PLOT_HAS_IMPROVEMENT_PASTURE_RAW',				'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES'),
	('REQUIRES_PLOT_HAS_OUTBACK_STATION_ADJACNENT_TO_PASTURE',	'REQUIREMENT_REQUIREMENTSET_IS_MET');
insert or ignore into RequirementArguments
	(RequirementId,												Name,					Value)
values
	('REQUIRES_PLOT_HAS_IMPROVEMENT_PASTURE_RAW',				'ImprovementType',		'IMPROVEMENT_PASTURE'),
	('REQUIRES_PLOT_HAS_OUTBACK_STATION_ADJACNENT_TO_PASTURE',	'RequirementSetId',		'PLOT_HAS_OUTBACK_STATION_ADJACNENT_TO_PASTURE');
insert or ignore into RequirementSets
	(RequirementSetId,													RequirementSetType)
values
	('PLOT_HAS_PASTURE_OR_OUTBACK_STATION_ADJACNENT_TO_PASTURE',	'REQUIREMENTSET_TEST_ANY'),
	('PLOT_HAS_OUTBACK_STATION_ADJACNENT_TO_PASTURE',				'REQUIREMENTSET_TEST_ALL');
insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
values
	('PLOT_HAS_PASTURE_OR_OUTBACK_STATION_ADJACNENT_TO_PASTURE',	'REQUIRES_PLOT_HAS_IMPROVEMENT_PASTURE_RAW'),
	('PLOT_HAS_PASTURE_OR_OUTBACK_STATION_ADJACNENT_TO_PASTURE',	'REQUIRES_PLOT_HAS_OUTBACK_STATION_ADJACNENT_TO_PASTURE'),
	('PLOT_HAS_OUTBACK_STATION_ADJACNENT_TO_PASTURE',				'REQUIRES_PLOT_HAS_IMPROVEMENT_OUTBACK_STATION'),
	('PLOT_HAS_OUTBACK_STATION_ADJACNENT_TO_PASTURE',				'REQUIRES_PLOT_ADJACENT_TO_IMPROVEMENT_PASTURE');