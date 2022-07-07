-- New City Center buildings
insert or replace into Types
	(Type,										Kind)
values
	('BUILDING_NILOMETER_HD',					'KIND_BUILDING'),
	('BUILDING_TRIUMPHAL_ARCH',					'KIND_BUILDING'),
	('BUILDING_KAREZ',							'KIND_BUILDING'),
	('BUILDING_OFFICIAL_RUN_HANDCRAFT',			'KIND_BUILDING'),
	('BUILDING_BOOTCAMP',						'KIND_BUILDING'),
	('BUILDING_FAIR',							'KIND_BUILDING'),
	('BUILDING_TOTEMS',							'KIND_BUILDING');

insert or replace into Buildings
	(BuildingType, 						Name, 										Cost, 		Description,										
		PrereqTech,						PrereqCivic,								PrereqDistrict,			PurchaseYield,			Housing) 
values
	('BUILDING_NILOMETER_HD',			'LOC_BUILDING_NILOMETER_HD_NAME', 			65,			'LOC_BUILDING_NILOMETER_HD_DESCRIPTION',				
	'TECH_IRRIGATION',					null,										'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_TRIUMPHAL_ARCH',			'LOC_BUILDING_TRIUMPHAL_ARCH_NAME', 		65,			'LOC_BUILDING_TRIUMPHAL_ARCH_DESCRIPTION',			
	null,								'CIVIC_EARLY_EMPIRE',						'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_KAREZ',					'LOC_BUILDING_KAREZ_NAME',					65,			'LOC_BUILDING_KAREZ_DESCRIPTION',	
	'TECH_POTTERY',						null,										'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			1),
	('BUILDING_OFFICIAL_RUN_HANDCRAFT',	'LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_NAME', 70,			'LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_DESCRIPTION',	
	'TECH_MINING',						null,										'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_BOOTCAMP',				'LOC_BUILDING_BOOTCAMP_NAME',				60,			'LOC_BUILDING_BOOTCAMP_DESCRIPTION',	
	'TECH_ANIMAL_HUSBANDRY',			null,										'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_FAIR',					'LOC_BUILDING_FAIR_NAME', 					55,			'LOC_BUILDING_FAIR_DESCRIPTION',
	null,								'CIVIC_FOREIGN_TRADE',						'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null),
	('BUILDING_TOTEMS',					'LOC_BUILDING_TOTEMS_NAME', 				55,			'LOC_BUILDING_TOTEMS_DESCRIPTION',
	null,								'CIVIC_CODE_OF_LAWS',						'DISTRICT_CITY_CENTER',	'YIELD_GOLD',			null);

insert or replace into MutuallyExclusiveBuildings
	(Building,								MutuallyExclusiveBuilding)
values
	('BUILDING_NILOMETER_HD',				'BUILDING_TRIUMPHAL_ARCH'),
	('BUILDING_TRIUMPHAL_ARCH',				'BUILDING_NILOMETER_HD'),
	('BUILDING_KAREZ',						'BUILDING_OFFICIAL_RUN_HANDCRAFT'),
	('BUILDING_KAREZ',						'BUILDING_BOOTCAMP'),
	('BUILDING_OFFICIAL_RUN_HANDCRAFT',		'BUILDING_KAREZ'),
	('BUILDING_OFFICIAL_RUN_HANDCRAFT',		'BUILDING_BOOTCAMP'),
	('BUILDING_BOOTCAMP',					'BUILDING_KAREZ'),
	('BUILDING_BOOTCAMP',					'BUILDING_OFFICIAL_RUN_HANDCRAFT'),
	('BUILDING_FAIR',						'BUILDING_TOTEMS'),
	('BUILDING_TOTEMS',						'BUILDING_FAIR');

-- New Neighborhood buildings
insert or ignore into Types
	(Type,								Kind)
values
	('BUILDING_HD_TAVERN',				'KIND_BUILDING'),
	('BUILDING_HD_INN',					'KIND_BUILDING');

insert into Buildings
	(BuildingType,			PrereqDistrict,				PrereqCivic,								Cost,	Maintenance,	CitizenSlots,	Housing,	Entertainment,		PurchaseYield,		AdvisorType,			Name,								Description)
values
	('BUILDING_HD_TAVERN',	'DISTRICT_NEIGHBORHOOD',	'CIVIC_MEDIEVAL_FAIRES',					185,	1,				1,				0,			1,					'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_TAVERN_NAME',		'LOC_BUILDING_HD_TAVERN_DESCRIPTION'),
	('BUILDING_HD_INN',		'DISTRICT_NEIGHBORHOOD',	'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		185,	1,				1,				2,			0,					'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_INN_NAME',			'LOC_BUILDING_HD_INN_DESCRIPTION');

insert or ignore into MutuallyExclusiveBuildings
	(Building,							MutuallyExclusiveBuilding)
values
	('BUILDING_HD_TAVERN',				'BUILDING_HD_INN'),
	('BUILDING_HD_INN',					'BUILDING_HD_TAVERN');

insert or ignore into BuildingPrereqs
	(Building,							PrereqBuilding)
values
	('BUILDING_FOOD_MARKET',			'BUILDING_HD_TAVERN'),
	('BUILDING_SHOPPING_MALL',			'BUILDING_HD_TAVERN'),
	('BUILDING_FOOD_MARKET',			'BUILDING_HD_INN'),
	('BUILDING_SHOPPING_MALL',			'BUILDING_HD_INN');