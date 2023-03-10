-- Modifiers
INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES
('TRAIT_LEADER_MAJOR_CIV', 'FRESH_WATER_GRASS_HILL_FARMS'),
('TRAIT_LEADER_MAJOR_CIV', 'FRESH_WATER_PLAINS_HILL_FARMS'),
('TRAIT_LEADER_LAST_BEST_WEST', 'FRESH_WATER_TUNDRA_HILL_FARMS');

INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
('FRESH_WATER_GRASS_HILL_FARMS', 'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN', 'PLAYER_IS_HUMAN', 'FRESH_WATER_HILL_FARM_TECH_REQUIREMENTS'),
('FRESH_WATER_PLAINS_HILL_FARMS', 'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN', 'PLAYER_IS_HUMAN', 'FRESH_WATER_HILL_FARM_TECH_REQUIREMENTS'),
('FRESH_WATER_TUNDRA_HILL_FARMS', 'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_VALID_TERRAIN', 'PLAYER_IS_HUMAN', 'FRESH_WATER_HILL_FARM_TECH_REQUIREMENTS');

INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES
('FRESH_WATER_GRASS_HILL_FARMS', 'ImprovementType', 'IMPROVEMENT_FARM'),
('FRESH_WATER_PLAINS_HILL_FARMS', 'ImprovementType', 'IMPROVEMENT_FARM'),
('FRESH_WATER_TUNDRA_HILL_FARMS', 'ImprovementType', 'IMPROVEMENT_FARM'),
('FRESH_WATER_GRASS_HILL_FARMS', 'TerrainType', 'TERRAIN_GRASS_HILLS'),
('FRESH_WATER_PLAINS_HILL_FARMS', 'TerrainType', 'TERRAIN_PLAINS_HILLS'),
('FRESH_WATER_TUNDRA_HILL_FARMS', 'TerrainType', 'TERRAIN_TUNDRA_HILLS');

-- RequirementSets
INSERT OR REPLACE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('FRESH_WATER_HILL_FARM_TECH_REQUIREMENTS', 'REQUIREMENTSET_TEST_ALL');

INSERT OR REPLACE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('FRESH_WATER_HILL_FARM_TECH_REQUIREMENTS', 'REQUIRES_PLAYER_HAS_TECH_IRRIGATION_FOFH');

-- Requirements
INSERT OR REPLACE INTO Requirements (RequirementId, RequirementType) VALUES
('REQUIRES_PLAYER_HAS_TECH_IRRIGATION_FOFH', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');

INSERT OR REPLACE INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQUIRES_PLAYER_HAS_TECH_IRRIGATION_FOFH', 'TechnologyType', 'TECH_IRRIGATION');
