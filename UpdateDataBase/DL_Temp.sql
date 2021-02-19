-------------------------------------
--  Temporary update database sql  --
-------------------------------------
insert or replace into Types
	(Type,															Kind)
values
	-- Buildings
	('BUILDING_NILOMETER',											'KIND_BUILDING'),
	('BUILDING_TRIUMPHAL_ARCH',										'KIND_BUILDING'),
	('BUILDING_OFFCIAL_RUN_HANDCRAFT',								'KIND_BUILDING'),	
	('BUILDING_FAIR',												'KIND_BUILDING'),
	('BUILDING_TOTEMS',												'KIND_BUILDING');

insert or replace into Buildings 
	(BuildingType, 						Name, 										Cost, 		Description,										
		PrereqTech,						PrereqCivic,								PrereqDistrict) 
values
	('BUILDING_NILOMETER', 				'LOC_BUILDING_NILOMETER_NAME', 				75, 		'LOC_BUILDING_NILOMETER_DESCRIPTION',				
	'TECH_IRRIGATION',					null,										'DISTRICT_CITY_CENTER'),
	('BUILDING_TRIUMPHAL_ARCH', 		'LOC_BUILDING_TRIUMPHAL_ARCH_NAME', 		75, 		'LOC_BUILDING_TRIUMPHAL_ARCH_DESCRIPTION',			
	null,								'CIVIC_EARLY_EMPIRE',						'DISTRICT_CITY_CENTER'),
	('BUILDING_OFFCIAL_RUN_HANDCRAFT', 	'LOC_BUILDING_OFFCIAL_RUN_HANDCRAFT_NAME', 	60,			'LOC_BUILDING_OFFCIAL_RUN_HANDCRAFT_DESCRIPTION',	
	'TECH_MINING',						null,										'DISTRICT_CITY_CENTER'),
	('BUILDING_FAIR', 					'LOC_BUILDING_FAIR_NAME', 					60, 		'LOC_BUILDING_FAIR_DESCRIPTION',										
	'TECH_ANIMAL_HUSBANDRY',			null,										'DISTRICT_CITY_CENTER'),
	('BUILDING_TOTEMS', 				'LOC_BUILDING_TOTEMS_NAME', 				60, 		'LOC_BUILDING_TOTEMS_DESCRIPTION',		
	null,								'CIVIC_CODE_OF_LAWS',						'DISTRICT_CITY_CENTER');
	
insert or replace into Building_YieldChanges 
	(BuildingType,													YieldType,					YieldChange)
values 
	('BUILDING_NILOMETER',											'YIELD_SCIENCE',			2),
	('BUILDING_TRIUMPHAL_ARCH',										'YIELD_CULTURE',			3),
	('BUILDING_OFFCIAL_RUN_HANDCRAFT',								'YIELD_PRODUCTION',			2),	
	('BUILDING_FAIR',												'YIELD_GOLD',				4),
	('BUILDING_TOTEMS',												'YIELD_FAITH',				2);

insert or replace into BuildingModifiers 
 	(BuildingType,													ModifierId)
values 
 	('BUILDING_NILOMETER',											'NILOMETER_SCIENCE'),
 	('BUILDING_TRIUMPHAL_ARCH',										'TRIUMPHAL_ARCH_CULTURE'),
 	('BUILDING_OFFCIAL_RUN_HANDCRAFT',								'OFFCIAL_RUN_HANDCRAFT_PRODUCTIAN'),	
 	('BUILDING_FAIR',												'FAIR_GOLD'),
 	('BUILDING_TOTEMS',												'TOTEMS_FAITH');



insert or replace into Modifiers
	(ModifierId,							ModifierType,											SubjectRequirementSetId)
values
	('NILOMETER_SCIENCE',					'MODIFIER_BUILDING_YIELD_CHANGE',						'PLOT_FLOODPLAINS_REQUIREMENTS'),
 	('TRIUMPHAL_ARCH_CULTURE',				'MODIFIER_BUILDING_YIELD_CHANGE',						'CITY_HAS_WONDER_REQUIREMENTS'),
 	('OFFCIAL_RUN_HANDCRAFT_PRODUCTIAN'	,	'MODIFIER_BUILDING_YIELD_CHANGE',						'RELIGIOUS_IDOLS_CITY_HAS_LUXURY_OR_BONUS_MINE'),	
 	('FAIR_GOLD',							'MODIFIER_BUILDING_YIELD_CHANGE',						'PLOT_ADJACENT_TO_LUXURY_REQUIREMENTS'),
 	('TOTEMS_FAITH',						'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT',		'TOTEMS_ADJACENT');
	

INSERT INTO RequirementSets 
	(RequirementSetId, 						RequirementSetType) 
VALUES
	('TOTEMS_ADJACENT', 					'REQUIREMENTSET_TEST_ANY');

INSERT INTO RequirementSetRequirements 
	(RequirementSetId, 						RequirementId) 
VALUES
	('TOTEMS_ADJACENT', 					'REQUIRES_PLOT_ADJACENT_FOREST_ROOSEVELT'),
	('TOTEMS_ADJACENT', 					'REQUIRES_PLOT_ADJACENT_TO_MOUNTAIN');

insert or replace into ModifierArguments
	(ModifierId,							Name,												Value)
values
	('NILOMETER_SCIENCE',					'BuildingType',										'BUILDING_NILOMETER'),
	('NILOMETER_SCIENCE',					'YieldType',										'YIELD_SCIENCE'),
	('NILOMETER_SCIENCE',					'Amount',											2),
	('TRIUMPHAL_ARCH_CULTURE',				'BuildingType',										'BUILDING_TRIUMPHAL_ARCH'),
	('TRIUMPHAL_ARCH_CULTURE',				'YieldType',										'YIELD_CULTURE'),
	('TRIUMPHAL_ARCH_CULTURE',				'Amount',											2),
	('OFFCIAL_RUN_HANDCRAFT_PRODUCTIAN',	'BuildingType',										'BUILDING_OFFCIAL_RUN_HANDCRAFT'),
	('OFFCIAL_RUN_HANDCRAFT_PRODUCTIAN',	'YieldType',										'YIELD_PRODUCTION'),
	('OFFCIAL_RUN_HANDCRAFT_PRODUCTIAN',	'Amount',											2),
	('FAIR_GOLD',							'BuildingType',										'BUILDING_FAIR'),
	('FAIR_GOLD',							'YieldType',										'YIELD_GOLD'),
	('FAIR_GOLD',							'Amount',											4),
	('TOTEMS_FAITH',						'GreatPersonClassType',								'GREAT_PERSON_CLASS_PROPHET'),
	('TOTEMS_FAITH',						'Amount',											1);

insert or replace into MutuallyExclusiveBuildings
	(Building,								MutuallyExclusiveBuilding)
values
	('BUILDING_NILOMETER',					'BUILDING_TRIUMPHAL_ARCH'),
	('BUILDING_TRIUMPHAL_ARCH',				'BUILDING_NILOMETER'),
	('BUILDING_OFFCIAL_RUN_HANDCRAFT',		'BUILDING_FAIR'),
	('BUILDING_OFFCIAL_RUN_HANDCRAFT',		'BUILDING_TOTEMS'),	
	('BUILDING_FAIR',						'BUILDING_OFFCIAL_RUN_HANDCRAFT'),
	('BUILDING_FAIR',						'BUILDING_TOTEMS'),
	('BUILDING_TOTEMS',						'BUILDING_OFFCIAL_RUN_HANDCRAFT'),
	('BUILDING_TOTEMS',						'BUILDING_FAIR');
