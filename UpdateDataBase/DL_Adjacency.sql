-------------------------------------
--       Adjacency Adjustments     --
-------------------------------------

-- delete from District_Adjacencies where DistrictType = 'DISTRICT_INDUSTRIAL_ZONE';

delete from District_Adjacencies where DistrictType = 'DISTRICT_ACROPOLIS' and YieldChangeId = 'District_Culture_City_Center';

insert or replace into District_Adjacencies
	(DistrictType,					YieldChangeId)
values
	('DISTRICT_INDUSTRIAL_ZONE',	'Oil_INDUSTRIAL_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'AERODROME_INDUSTRIAL_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'SEAOil_INDUSTRIAL_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'Harbor_INDUSTRIAL_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'RoyalDock_INDUSTRIAL_Production'),
	('DISTRICT_INDUSTRIAL_ZONE',	'Cothon_INDUSTRIAL_Production'),
	('DISTRICT_HANSA',				'Oil_INDUSTRIAL_Production'),
	('DISTRICT_HANSA',				'AERODROME_INDUSTRIAL_Production'),
	('DISTRICT_HANSA',				'SEAOil_INDUSTRIAL_Production'),
	('DISTRICT_HANSA',				'River_HANSA_Production'),
	('DISTRICT_HANSA',				'Harbor_HANSA_Production'),
	('DISTRICT_HANSA',				'RoyalDock_HANSA_Production'),
	('DISTRICT_HANSA',				'Cothon_HANSA_Production'),
	('DISTRICT_COMMERCIAL_HUB',		'Commercial_Luxury_Gold'),
	('DISTRICT_COMMERCIAL_HUB',		'Commercial_Luxury_Gold_Late'),
	('DISTRICT_COMMERCIAL_HUB',		'Commercial_Canal_Gold'),
	('DISTRICT_SUGUBA',				'Commercial_Luxury_Gold'),
	('DISTRICT_SUGUBA',				'Commercial_Luxury_Gold_Late'),
	('DISTRICT_SUGUBA',				'Commercial_Canal_Gold'),
	-- ('DISTRICT_CAMPUS',				'Geothermal_Science_Late'),
	-- ('DISTRICT_CAMPUS',				'Reef_Science_Late'),
	-- ('DISTRICT_CAMPUS',				'District_Science_City_Center'),
	('DISTRICT_COMMERCIAL_HUB',		'District_Gold_Hansa'),
	('DISTRICT_SUGUBA',				'District_Gold_Hansa'),
	('DISTRICT_SUGUBA',				'Harbor_Gold'),
	-- ('DISTRICT_COMMERCIAL_HUB',		'District_Gold_City_Center'),
	-- ('DISTRICT_SUGUBA',				'District_Gold_City_Center'),
	('DISTRICT_THEATER',			'District_Culture_City_Center'),
	('DISTRICT_ACROPOLIS',			'District_Culture_Double_City_Center'),
	-- 
	-- ('DISTRICT_HARBOR',				'HD_Suguba_Gold'),
	-- ('DISTRICT_HARBOR',				'HD_Commercial_Hub_Gold'),
	-- ('DISTRICT_HARBOR',				'Commercial_Canal_Gold'),
	-- ('DISTRICT_COTHON',				'HD_Commercial_Hub_Gold'),
	-- ('DISTRICT_COTHON',				'Commercial_Canal_Gold'),
	-- ('DISTRICT_ROYAL_NAVY_DOCKYARD', 'HD_Commercial_Hub_Gold'),
	('DISTRICT_ROYAL_NAVY_DOCKYARD', 'District_Gold_Industrial_Zone'),
	-- ('DISTRICT_ROYAL_NAVY_DOCKYARD', 'Commercial_Canal_Gold'),
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
	('DISTRICT_HANSA',				'Commerical_Hub_Production_Late'), -- TODO: Hansa & Suguba
	('DISTRICT_HANSA',				'Resource_Production_Late');

-- UD supports
insert or ignore into District_Adjacencies  (DistrictType,	YieldChangeId)
select b.CivUniqueDistrictType,	a.YieldChangeId from District_Adjacencies a, DistrictReplaces b
where a.DistrictType = b.ReplacesDistrictType 
	and b.CivUniqueDistrictType != 'DISTRICT_COTHON' 
	and b.CivUniqueDistrictType != 'DISTRICT_ROYAL_NAVY_DOCKYARD' 
	and b.CivUniqueDistrictType != 'DISTRICT_OBSERVATORY' 
	and b.CivUniqueDistrictType != 'DISTRICT_SEOWON' 
	and b.CivUniqueDistrictType != 'DISTRICT_OPPIDUM' 
	and b.CivUniqueDistrictType != 'DISTRICT_HANSA';

insert or replace into Improvement_Adjacencies
	(ImprovementType,				YieldChangeId)
values
	('IMPROVEMENT_MINE',			'Mine_Industrial_Production'),
	('IMPROVEMENT_QUARRY',			'Quarry_Industrial_Production'),
	('IMPROVEMENT_LUMBER_MILL',		'Lumber_Mill_River_Production'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Commercial_Gold'),
	('IMPROVEMENT_PLANTATION',		'Plantation_Suguba_Gold'),
	('IMPROVEMENT_CAMP',			'Camp_Entertainment_Gold'),
	('IMPROVEMENT_CAMP',			'Camp_Street_Carnival_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Harbor_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Royal_Navy_Gold'),
	('IMPROVEMENT_FISHING_BOATS',	'Fishing_Boats_Cothon_Gold');

update Adjacency_YieldChanges set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where ID = 'Farms_MedievalAdjacency';
update Adjacency_YieldChanges set YieldChange = 1 where ID = 'Harbor_City_Gold' or ID = 'RoyalDock_City_Gold';

insert or replace into Adjacency_YieldChanges
	(ID,								Description,									YieldType,			YieldChange,	TilesRequired,
	AdjacentRiver,	AdjacentDistrict, 		PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech,	AdjacentResourceClass)
values
	('AERODROME_INDUSTRIAL_Production',	'LOC_DISTRICT_AERODROME_INDUSTRIAL_PRODUCTION', 'YIELD_PRODUCTION', 2,				1,
	0, 				'DISTRICT_AERODROME', 	NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Commercial_Canal_Gold',			'LOC_DISTRICT_CANAL_GOLD', 						'YIELD_GOLD',		3,				1,
	0, 				'DISTRICT_CANAL', 		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('HD_Commercial_Hub_Gold',			'LOC_DISTRICT_COMMERCIAL_GOLD', 				'YIELD_GOLD',		2,				1,
	0, 				'DISTRICT_COMMERCIAL_HUB',	NULL,		NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('HD_Suguba_Gold',					'LOC_DISTRICT_SUGUBA_GOLD', 					'YIELD_GOLD',		2,				1,
	0, 				'DISTRICT_SUGUBA',		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Commercial_Luxury_Gold',			'LOC_DISTRICT_LUXURY_GOLD', 					'YIELD_GOLD',		1,				1,
	0,				NULL,					NULL,			NULL,		'CIVIC_MEDIEVAL_FAIRES', NULL,	'RESOURCECLASS_LUXURY'),
	('Commercial_Luxury_Gold_Late',		'LOC_DISTRICT_LUXURY_GOLD', 					'YIELD_GOLD',		2,				1,
	0,				NULL,					'CIVIC_MEDIEVAL_FAIRES', NULL, NULL,		NULL,			'RESOURCECLASS_LUXURY');
	
insert or replace into Adjacency_YieldChanges
	(ID,								Description,	YieldType,			YieldChange,	TilesRequired,	AdjacentRiver,
	AdjacentDistrict, 				PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech,	AdjacentResourceClass)
values
	('Mine_Industrial_Production',		'Placeholder', 'YIELD_PRODUCTION',	1,				1,				0,
	'DISTRICT_INDUSTRIAL_ZONE',		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Quarry_Industrial_Production',	'Placeholder', 'YIELD_PRODUCTION',	1,				1,				0,
	'DISTRICT_INDUSTRIAL_ZONE',		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Lumber_Mill_River_Production', 	'Placeholder', 'YIELD_PRODUCTION',	1,				1,				1,
	NULL,							NULL,			NULL,		NULL,			'TECH_MACHINERY',	'NO_RESOURCECLASS'),
	('Plantation_Commercial_Gold', 		'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_COMMERCIAL_HUB',		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Plantation_Suguba_Gold', 			'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_SUGUBA',				NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Camp_Entertainment_Gold', 		'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_ENTERTAINMENT_COMPLEX', NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Camp_Street_Carnival_Gold', 		'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_STREET_CARNIVAL',		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Fishing_Boats_Harbor_Gold', 		'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_HARBOR',				NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Fishing_Boats_Royal_Navy_Gold', 	'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_ROYAL_NAVY_DOCKYARD',	NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Fishing_Boats_Cothon_Gold', 		'Placeholder', 'YIELD_GOLD',		2,				1,				0,
	'DISTRICT_COTHON',				NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('BATEY_Street_Carnival_Culture', 	'Placeholder', 'YIELD_CULTURE',		1,				1,				0,
	'DISTRICT_STREET_CARNIVAL',		NULL,			NULL,		'CIVIC_HUMANISM',	NULL,		'NO_RESOURCECLASS'),
	('BATEY_Late_Street_Carnival_Culture', 	'Placeholder', 'YIELD_CULTURE',	2,				1,				0,
	'DISTRICT_STREET_CARNIVAL',		'CIVIC_HUMANISM',	NULL,	NULL,			NULL,			'NO_RESOURCECLASS');

-- update Adjacency_YieldChanges set PrereqTech = 'TECH_ASTRONOMY'
--  where ID = 'Mountains_Science1'
-- 	or ID = 'Mountains_Science2'
-- 	or ID = 'Mountains_Science3'
-- 	or ID = 'Mountains_Science4'
-- 	or ID = 'Mountains_Science5'
-- ;

-- Industry zone : Mine : production
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_INDUSTRIALIZATION' where ID = 'Minel_HalfProduction';
update Adjacency_YieldChanges set PrereqTech = 'TECH_INDUSTRIALIZATION' where ID = 'Mine_Production';
update Adjacency_YieldChanges set ObsoleteTech = 'TECH_STEEL' where ID = 'LumberMill_HalfProduction';
-- update Adjacency_YieldChanges set Description = 'LOC_DISTRICT_LUMBER_MILL_HALF_PRODUCTION' where ID = 'LumberMill_HalfProduction';
update Adjacency_YieldChanges set PrereqTech = 'TECH_GUNPOWDER' where ID = 'Quarry_Production';
-- Industry zone : Aqueduct
-- update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_STEAM_POWER' where ID = 'Aqueduct_Production';
-- update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_STEAM_POWER' where ID = 'Bath_Production';
update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_APPRENTICESHIP' where ID = 'Commerical_Hub_Production';
update Adjacency_YieldChanges set TilesRequired = 1, ObsoleteTech = 'TECH_APPRENTICESHIP' where ID = 'Resource_Production';
-- Campus : Geothermal & Reef
-- update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_SCIENTIFIC_THEORY' where ID = 'Geothermal_Science';
-- update Adjacency_YieldChanges set YieldChange = 1, ObsoleteTech = 'TECH_BUTTRESS' where ID = 'Reef_Science';
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'SeaResource_Gold';
-- insert or replace into Adjacency_YieldChanges
-- 	(ID,							Description,							YieldType,			YieldChange,	TilesRequired,
-- 	AdjacentFeature,				PrereqCivic,	PrereqTech,					ObsoleteCivic,	ObsoleteTech)
-- values
-- 	('Geothermal_Science_Late',		'LOC_DISTRICT_GEOTHERMAL_SCIENCE_LATE',	'YIELD_SCIENCE',	2,				1,
-- 	'FEATURE_GEOTHERMAL_FISSURE',	NULL,			'TECH_SCIENTIFIC_THEORY',	NULL,			NULL),
-- 	('Reef_Science_Late',			'LOC_DISTRICT_REEF_SCIENCE_LATE',		'YIELD_SCIENCE',	2,				1,
-- 	'FEATURE_REEF',					NULL,			'TECH_BUTTRESS',			NULL,			NULL);

insert or replace into Adjacency_YieldChanges
	(ID,								Description,									YieldType,			YieldChange,	TilesRequired,
	AdjacentImprovement,			PrereqCivic,	PrereqTech,			ObsoleteCivic,	ObsoleteTech)
values
	('SEAOil_INDUSTRIAL_Production',	'LOC_DISTRICT_SEAOIL_INDUSTRIAL_PRODUCTION',	'YIELD_PRODUCTION',	1,				1,
	'IMPROVEMENT_OFFSHORE_OIL_RIG',	NULL,			NULL,				NULL,			NULL),
	('Oil_INDUSTRIAL_Production',		'LOC_DISTRICT_OIL_INDUSTRIAL_PRODUCTION',		'YIELD_PRODUCTION',	1,				1,
	'IMPROVEMENT_OIL_WELL',			NULL,			NULL,				NULL,			NULL),
	('Quarry_HalfProduction',			'LOC_DISTRICT_QUARRY_HALF_PRODUCTION',			'YIELD_PRODUCTION',	1,				2,
	'IMPROVEMENT_QUARRY',			NULL,			NULL,				NULL,			'TECH_GUNPOWDER'),
	('LumberMill_Production',			'LOC_DISTRICT_LUMBER_MILL_PRODUCTION',			'YIELD_PRODUCTION',	1,				1,
	'IMPROVEMENT_LUMBER_MILL',		NULL,			'TECH_STEEL',		NULL,			NULL);

insert or replace into Adjacency_YieldChanges
	(ID,								Description,								YieldType,			YieldChange,	TilesRequired,
	AdjacentDistrict,				PrereqCivic,	PrereqTech,		ObsoleteCivic,	ObsoleteTech)
values
	('District_Gold_Hansa',				'LOC_DISTRICT_GOLD_HANSA',					'YIELD_GOLD',		2,				1,	
	'DISTRICT_HANSA',				NULL,			NULL,			NULL,			NULL),
	('District_Gold_Industrial_Zone',	'LOC_DISTRICT_GOLD_INDUSTRIAL_ZONE',		'YIELD_GOLD',		2,				1,	
	'DISTRICT_INDUSTRIAL_ZONE',		NULL,			NULL,			NULL,			NULL),
	-- ('District_Science_City_Center',	'LOC_District_Science_City_Center',				'YIELD_SCIENCE',	1,				1,	
	-- 'DISTRICT_CITY_CENTER',			NULL,			NULL,			NULL,			NULL),
	('District_Gold_City_Center',		'LOC_DISTRICT_GOLD_CITY_CENTER',				'YIELD_GOLD',		1,				1,	
	'DISTRICT_CITY_CENTER',			NULL,			NULL,			NULL,			NULL),
	('District_Culture_Double_City_Center',	'LOC_DISTRICT_CULTURE_DOUBLE_CITY_CENTER',	'YIELD_CULTURE',	2,				1,	
	'DISTRICT_CITY_CENTER',			NULL,			NULL,			NULL,			NULL),
	-- ('Aqueduct_Production_Late',		'LOC_DISTRICT_AQUEDUCT_PRODUCTION_LATE',	'YIELD_PRODUCTION',	2,				1,
	-- 'DISTRICT_AQUEDUCT',			NULL,			'TECH_STEAM_POWER',		NULL,			NULL),
	-- ('Bath_Production_Late',			'LOC_DISTRICT_BATH_PRODUCTION_LATE',		'YIELD_PRODUCTION',	2,				1,
	-- 'DISTRICT_BATH',				NULL,			'TECH_STEAM_POWER',		NULL,			NULL),
	('Commerical_Hub_Production_Late',	'LOC_DISTRICT_COMMERCIAL_HUB_PRODUCTION',		'YIELD_PRODUCTION',	2,				1,
	'DISTRICT_COMMERCIAL_HUB',		NULL,			'TECH_APPRENTICESHIP',	NULL,	NULL);

insert or replace into Adjacency_YieldChanges
	(ID, Description, YieldType, YieldChange, TilesRequired, PrereqTech, AdjacentResource) values
	('Resource_Production_Late', 'LOC_DISTRICT_RESOURCE_PRODUCTION', 'YIELD_PRODUCTION', 2, 1, 'TECH_APPRENTICESHIP', 1);

insert or replace into Adjacency_YieldChanges
	(ID, Description, YieldType, YieldChange, TilesRequired, OtherDistrictAdjacent, PrereqCivic) values
	('Golf_District_Culture', 'placeholder', 'YIELD_CULTURE', 1, 1, 1, 'CIVIC_HUMANISM');

-- delete from District_Adjacencies where YieldChangeId = 'Jungle_Science';
 
 -- Cree Mekewap change: Each bonus resource -> +1 Food 
-- By PineApple 20210330

update Adjacency_YieldChanges set PrereqCivic = NULL where ID = 'Mekewap_SecondBonusAdjacency';
delete from Adjacency_YieldChanges where ID = 'Mekewap_FirstBonusAdjacency';
delete from Improvement_Adjacencies where YieldChangeId = 'Mekewap_FirstBonusAdjacency';
update Adjacency_YieldChanges set YieldChange = 3 where ID = 'Canal_Production';

--industrial zone and hansa adjacent to harbor
insert or replace into Adjacency_YieldChanges
	(ID,								Description,									YieldType,			YieldChange,	TilesRequired,
	AdjacentRiver,	AdjacentDistrict, 		PrereqCivic,	PrereqTech,	ObsoleteCivic,	ObsoleteTech,	AdjacentResourceClass)
values
	('Harbor_INDUSTRIAL_Production',	'LOC_DISTRICT_HARBOR_INDUSTRIAL_PRODUCTION', 	'YIELD_PRODUCTION', 1,				1,
	0, 				'DISTRICT_HARBOR', 		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('RoyalDock_INDUSTRIAL_Production',	'LOC_DISTRICT_ROYALDOCK_INDUSTRIAL_PRODUCTION', 'YIELD_PRODUCTION', 1,				1,
	0, 				'DISTRICT_ROYAL_NAVY_DOCKYARD', NULL,	NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Cothon_INDUSTRIAL_Production',	'LOC_DISTRICT_COTHON_INDUSTRIAL_PRODUCTION', 	'YIELD_PRODUCTION', 1,				1,
	0, 				'DISTRICT_COTHON', 		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('River_HANSA_Production',			'LOC_DISTRICT_RIVER_HANSA_PRODUCTION', 			'YIELD_PRODUCTION', 2,				1,
	1, 				NULL, 					NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Harbor_HANSA_Production',			'LOC_DISTRICT_HARBOR_HANSA_PRODUCTION',			'YIELD_PRODUCTION', 2,				1,
	0, 				'DISTRICT_HARBOR', 		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('RoyalDock_HANSA_Production',		'LOC_DISTRICT_ROYALDOCK_HANSA_PRODUCTION',		'YIELD_PRODUCTION', 2,				1,
	0, 				'DISTRICT_ROYAL_NAVY_DOCKYARD', NULL,	NULL,		NULL,			NULL,			'NO_RESOURCECLASS'),
	('Cothon_HANSA_Production',			'LOC_DISTRICT_COTHON_HANSA_PRODUCTION',			'YIELD_PRODUCTION', 2,				1,
	0, 				'DISTRICT_COTHON', 		NULL,			NULL,		NULL,			NULL,			'NO_RESOURCECLASS');