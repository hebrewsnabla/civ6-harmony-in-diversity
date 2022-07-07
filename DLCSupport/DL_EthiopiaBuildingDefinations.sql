-- New Diplomatic Quater buildings
insert or ignore into Types
	(Type,								                                Kind)
values
	('BUILDING_HD_REGIONAL_COUNCIL_CENTER',		                        'KIND_BUILDING'),
	('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',	                    'KIND_BUILDING');

insert into Buildings
	(BuildingType,			                        PrereqDistrict,				    PrereqCivic,				Cost,	Maintenance,    PurchaseYield,		AdvisorType,			Name,								                    Description)
values
	('BUILDING_HD_REGIONAL_COUNCIL_CENTER',	        'DISTRICT_DIPLOMATIC_QUARTER',	'CIVIC_IDEOLOGY',			750,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_REGIONAL_COUNCIL_CENTER_NAME',		    'LOC_BUILDING_HD_REGIONAL_COUNCIL_CENTER_DESCRIPTION'),
	('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',	'DISTRICT_DIPLOMATIC_QUARTER',	'CIVIC_URBANIZATION',		750,	7,				'YIELD_GOLD',		'ADVISOR_GENERIC',		'LOC_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_NAME',	'LOC_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_DESCRIPTION');
update Buildings set TraitType = 'TRAIT_CIVILIZATION_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS' where BuildingType = 'BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS';

insert or ignore into BuildingPrereqs
	(Building,							            PrereqBuilding)
values
	('BUILDING_HD_REGIONAL_COUNCIL_CENTER',			'BUILDING_CHANCERY'),
	('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',	'BUILDING_CHANCERY');

insert or ignore into BuildingReplaces
	(CivUniqueBuildingType,							ReplacesBuildingType)
values
	('BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS',	'BUILDING_HD_REGIONAL_COUNCIL_CENTER');