-------------------------------------
--       Wonders Adjustments       --
-------------------------------------

-- Oracle gives 4 great person points each.
-- update ModifierArguments set Value = 4 where left(ModifierId, 12) == ORACLE_GREAT and Name = 'Amount';

-- ARTEMIS does not affect empty camp.
insert into RequirementSets (RequirementSetId, RequirementSetType) values
	('TEMPLE_ARTEMIS_AND_HAS_RESOURCE_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL')
;

insert into RequirementSetRequirements values
	('TEMPLE_ARTEMIS_AND_HAS_RESOURCE_REQUIREMENTS', 'PLOT_HAS_RESOURCE_REQUIREMENTS'),
	('TEMPLE_ARTEMIS_AND_HAS_RESOURCE_REQUIREMENTS', 'REQUIRES_PLOT_HAS_ARTEMIS_WITHIN_4')
;

update Modifiers set SubjectRequirementSetId = 'TEMPLE_ARTEMIS_AND_HAS_RESOURCE_REQUIREMENTS'
	where ModifierId = 'TEMPLE_ARTEMIS_CAMP_AMENITY';

-- Petra
update ModifierArguments set Value = '3,2,1' where ModifierId = 'PETRA_YIELD_MODIFIER' and Name = 'Amount';

-- MEENAKSHI_TEMPLE
update Buildings set PrereqCivic = 'CIVIC_DIVINE_RIGHT' where BuildingType = 'BUILDING_MEENAKSHI_TEMPLE';
