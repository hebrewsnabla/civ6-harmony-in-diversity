-------------------------------------
-- Remove Adjustments from the Mod --
-------------------------------------

-- remove tundra floodplains.
delete from Types where Type = 'FEATURE_FLOODPLAINS_TUNDRA';
delete from Types where Type = 'IMPROVEMENT_JNR_FLOOD_FARM';
delete from Types where Type = 'RESOURCE_JNR_SWAMP';
-- delete from Types where Type = 'RESOURCE_JNR_PEAT';

delete from Adjacency_YieldChanges where ID = 'Flood_Farms_MechanizedAdjacency';
delete from Improvement_Adjacencies where YieldChangeId = 'Flood_Farms_MechanizedAdjacency';
delete from RandomEvent_Yields where FeatureType = 'FEATURE_FLOODPLAINS_TUNDRA';
