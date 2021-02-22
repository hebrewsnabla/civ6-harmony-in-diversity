-- Adding Relic Creator building as a dummy building. i.e. InternalOnly = true.
INSERT INTO Types (Type, Kind) VALUES
('BUILDING_RELIC_CREATOR', 'KIND_BUILDING');

INSERT INTO Buildings (BuildingType, Name, Cost, Description, InternalOnly) VALUES
('BUILDING_RELIC_CREATOR', 'LOC_BUILDING_RELIC_CREATOR_NAME', 1, 'LOC_BUILDING_RELIC_CREATOR_DESCRIPTION', 1);

-- Attach grant relic modifier to Relic Creator building
INSERT INTO BuildingModifiers (BuildingType, ModifierId) VALUES
('BUILDING_RELIC_CREATOR', 'MODIFIER_RELIC_CREATOR');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
('MODIFIER_RELIC_CREATOR', 'MODIFIER_PLAYER_GRANT_RELIC', 1, 1, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('MODIFIER_RELIC_CREATOR', 'Amount', '1');