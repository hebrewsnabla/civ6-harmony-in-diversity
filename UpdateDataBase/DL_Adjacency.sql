-------------------------------------
--       Adjacency Adjustments     --
-------------------------------------

-- delete from District_Adjacencies where DistrictType = 'DISTRICT_INDUSTRIAL_ZONE';

delete from District_Adjacencies where DistrictType = 'DISTRICT_ACROPOLIS' and YieldChangeId = 'District_Culture_City_Center';

insert or replace into District_Adjacencies
	(DistrictType,					YieldChangeId)
values
	('DISTRICT_COMMERCIAL_HUB',		'Commercial_Luxury_Gold'),
	('DISTRICT_SUGUBA',				'Commercial_Luxury_Gold'),
	-- ('DISTRICT_CAMPUS',				'Geothermal_Science_Late'),
	-- ('DISTRICT_CAMPUS',				'Reef_Science_Late'),
	('DISTRICT_CAMPUS',				'District_Science_City_Center'),
	('DISTRICT_COMMERCIAL_HUB',		'District_Gold_City_Center'),
	('DISTRICT_SUGUBA',				'District_Gold_City_Center'),
	('DISTRICT_THEATER',			'District_Culture_City_Center'),
	('DISTRICT_ACROPOLIS',			'District_Culture_Double_City_Center'),
	-- 
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Minel_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',	'Mine_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'Quarry_HalfProduction'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Quarry_Production'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'LumberMill_HalfProduction'),
	('DISTRICT_INDUSTRIAL_ZONE',	'LumberMill_Production'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Strategic_Production'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'District_Production'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Government_Production'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Aqueduct_Production'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Aqueduct_Production_Late'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Bath_Production'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Bath_Production_Late'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Dam_Production'),
	-- ('DISTRICT_INDUSTRIAL_ZONE',	'Canal_Production');
	-- 
	-- ('DISTRICT_HANSA',				'Aqueduct_Production_Late'),
	('DISTRICT_HANSA',				'Bath_Production'),
	-- ('DISTRICT_HANSA',				'Bath_Production_Late'),
	('DISTRICT_HANSA',				'Commerical_Hub_Production_Late'),
	('DISTRICT_HANSA',				'Resource_Production_Late');

insert or replace into Improvement_Adjacencies
	(ImprovementType,				YieldChangeId)
values
	('IMPROVEMENT_MINE',			'Mine_Industrial_Production'),
	('IMPROVEMENT_MINE',			'Mine_Oppidum_Production'),
	('IMPROVEMENT_MINE',			'Mine_Hansa_Production'),
	('IMPROVEMENT_QUARRY',			'Quarry_Industrial_Production'),
	('IMPROVEMENT_QUARRY',			'Quarry_Oppidum_Production'),
	('IMPROVEMENT_QUARRY',			'Quarry_Hansa_Production'),
	('IMPROVEMENT_LUMBER_MILL',		'Lumber_Mill_River_Production'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Commercial_Gold'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Suguba_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Harbor_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Royal_Navy_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Cothon_Gold');

update Adjacency_YieldChanges set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where ID = 'Farms_MedievalAdjacency';

insert or replace into Adjacency_YieldChanges
		(ID, Description, YieldType, YieldChange, TilesRequired, AdjacentRiver,
		AdjacentDistrict, PrereqCivic, PrereqTech, ObsoleteCivic, ObsoleteTech, AdjacentResourceClass) values
	('Commercial_Luxury_Gold', 'LOC_DISTRICT_LUXURY_GOLD', 'YIELD_GOLD', 2, 1, 0, NULL, NULL, NULL, NULL, NULL, 'RESOURCECLASS_LUXURY'),
	('Mine_Industrial_Production', 'Placeholder', 'YIELD_PRODUCTION', 1, 1, 0, 'DISTRICT_INDUSTRIAL_ZONE', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Mine_Oppidum_Production', 'Placeholder', 'YIELD_PRODUCTION', 1, 1, 0, 'DISTRICT_OPPIDUM', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Mine_Hansa_Production', 'Placeholder', 'YIELD_PRODUCTION', 1, 1, 0, 'DISTRICT_HANSA', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Quarry_Industrial_Production', 'Placeholder', 'YIELD_PRODUCTION', 1, 1, 0, 'DISTRICT_INDUSTRIAL_ZONE', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Quarry_Oppidum_Production', 'Placeholder', 'YIELD_PRODUCTION', 1, 1, 0, 'DISTRICT_OPPIDUM', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Quarry_Hansa_Production', 'Placeholder', 'YIELD_PRODUCTION', 1, 1, 0, 'DISTRICT_HANSA', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Lumber_Mill_River_Production', 'Placeholder', 'YIELD_PRODUCTION', 1, 1, 1, NULL, NULL, NULL, NULL, 'TECH_STEAM_POWER', 'NO_RESOURCECLASS'),
	('Plantation_Commercial_Gold', 'Placeholder', 'YIELD_GOLD', 2, 1, 0, 'DISTRICT_COMMERCIAL_HUB', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Plantation_Suguba_Gold', 'Placeholder', 'YIELD_GOLD', 2, 1, 0, 'DISTRICT_SUGUBA', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Fishing_Boats_Harbor_Gold', 'Placeholder', 'YIELD_GOLD', 2, 1, 0, 'DISTRICT_HARBOR', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Fishing_Boats_Royal_Navy_Gold', 'Placeholder', 'YIELD_GOLD', 2, 1, 0, 'DISTRICT_ROYAL_NAVY_DOCKYARD', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS'),
	('Fishing_Boats_Cothon_Gold', 'Placeholder', 'YIELD_GOLD', 2, 1, 0, 'DISTRICT_COTHON', NULL, NULL, NULL, NULL, 'NO_RESOURCECLASS')
;

update Adjacency_YieldChanges set PrereqTech = 'TECH_ASTRONOMY'
 where ID = 'Mountains_Science1'
	or ID = 'Mountains_Science2'
	or ID = 'Mountains_Science3'
	or ID = 'Mountains_Science4'
	or ID = 'Mountains_Science5'
;

-- Industry zone : Mine : production
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_INDUSTRIALIZATION' where ID = 'Minel_HalfProduction';
update Adjacency_YieldChanges set PrereqTech = 'TECH_INDUSTRIALIZATION' where ID = 'Mine_Production';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_STEEL' where ID = 'LumberMill_HalfProduction';
-- update Adjacency_YieldChanges set Description = 'LOC_DISTRICT_LUMBER_MILL_HALF_PRODUCTION' where ID = 'LumberMill_HalfProduction';
update Adjacency_YieldChanges set PrereqTech = 'TECH_GUNPOWDER' where ID = 'Quarry_Production';
-- Industry zone : Aqueduct
-- update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_STEAM_POWER' where ID = 'Aqueduct_Production';
-- update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_STEAM_POWER' where ID = 'Bath_Production';
update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_BANKING' where ID = 'Commerical_Hub_Production';
update Adjacency_YieldChanges set TilesRequired = 2, ObsoleteTech = 'TECH_APPRENTICESHIP' where ID = 'Resource_Production';
-- Campus : Geothermal & Reef
-- update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_SCIENTIFIC_THEORY' where ID = 'Geothermal_Science';
-- update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_BUTTRESS' where ID = 'Reef_Science';

-- insert or replace into Adjacency_YieldChanges
-- 	(ID,							Description,							YieldType,			YieldChange,	TilesRequired,
-- 	AdjacentFeature,				PrereqCivic,	PrereqTech,					ObsoleteCivic,	ObsoleteTech)
-- values
-- 	('Geothermal_Science_Late',		'LOC_DISTRICT_GEOTHERMAL_SCIENCE_LATE',	'YIELD_SCIENCE',	2,				1,
-- 	'FEATURE_GEOTHERMAL_FISSURE',	NULL,			'TECH_SCIENTIFIC_THEORY',	NULL,			NULL),
-- 	('Reef_Science_Late',			'LOC_DISTRICT_REEF_SCIENCE_LATE',		'YIELD_SCIENCE',	2,				1,
-- 	'FEATURE_REEF',					NULL,			'TECH_BUTTRESS',			NULL,			NULL);

insert or replace into Adjacency_YieldChanges
	(ID,						Description,								YieldType,		YieldChange,	TilesRequired,
	AdjacentImprovement,		PrereqCivic,	PrereqTech,		ObsoleteCivic,	ObsoleteTech)
values
	('Quarry_HalfProduction',	'LOC_DISTRICT_QUARRY_HALF_PRODUCTION',	'YIELD_PRODUCTION',	1,				2,
	'IMPROVEMENT_QUARRY',		NULL,			NULL,			NULL,			'TECH_GUNPOWDER'),
	('LumberMill_Production',	'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',	'YIELD_PRODUCTION',	1,				1,
	'IMPROVEMENT_LUMBER_MILL',	NULL,			'TECH_STEEL',	NULL,			NULL);

insert or replace into Adjacency_YieldChanges
	(ID,								Description,								YieldType,			YieldChange,	TilesRequired,
	AdjacentDistrict,			PrereqCivic,	PrereqTech,				ObsoleteCivic,	ObsoleteTech)
values
	('District_Science_City_Center',	'LOC_District_Science_City_Center',			'YIELD_SCIENCE',	1,				1,	
	'DISTRICT_CITY_CENTER',		NULL,				NULL,				NULL,			NULL),
	('District_Gold_City_Center',		'LOC_District_Gold_City_Center',			'YIELD_GOLD',		1,				1,	
	'DISTRICT_CITY_CENTER',		NULL,				NULL,				NULL,			NULL),
	('District_Culture_Double_City_Center',	'LOC_District_Culture_Double_City_Center',	'YIELD_CULTURE',	2,				1,	
	'DISTRICT_CITY_CENTER',		NULL,				NULL,				NULL,			NULL),
	-- ('Aqueduct_Production_Late',		'LOC_DISTRICT_AQUEDUCT_PRODUCTION_LATE',	'YIELD_PRODUCTION',	2,				1,
	-- 'DISTRICT_AQUEDUCT',		NULL,			'TECH_STEAM_POWER',		NULL,			NULL),
	-- ('Bath_Production_Late',			'LOC_DISTRICT_BATH_PRODUCTION_LATE',		'YIELD_PRODUCTION',	2,				1,
	-- 'DISTRICT_BATH',			NULL,			'TECH_STEAM_POWER',		NULL,			NULL),
	('Commerical_Hub_Production_Late',	'LOC_DISTRICT_COMMERCIAL_HUB_PRODUCTION',	'YIELD_PRODUCTION',	2,				1,
	'DISTRICT_COMMERCIAL_HUB',	NULL,			'TECH_BANKING',			NULL,			NULL);

insert or replace into Adjacency_YieldChanges
	(ID, Description, YieldType, YieldChange, TilesRequired, PrereqTech, AdjacentResource) values
	('Resource_Production_Late', 'LOC_DISTRICT_RESOURCE_PRODUCTION', 'YIELD_PRODUCTION', 1, 1, 'TECH_APPRENTICESHIP', 1);

delete from District_Adjacencies where YieldChangeId = 'Jungle_Science';
 