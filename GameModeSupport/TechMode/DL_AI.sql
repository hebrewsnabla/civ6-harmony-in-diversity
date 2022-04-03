-------------------------------------
--      AI Related Adjustments     --
-------------------------------------
-- add an city state district list to allow build city states build more districts
-- add adjustWeights list to adjust yield at different age.
insert or replace into AiListTypes (ListType) values
    ('DLAIImprovements'),
	('DLCityStateDistricts'),
	('DLAdjustWeights');

insert or replace into AiLists (ListType, LeaderType,	System) values
    ('DLAIImprovements',        NULL,                       'Improvements'),
	('DLAdjustWeights',			NULL, 						'Yields'),
	('DLCityStateDistricts',    'MINOR_CIV_DEFAULT_TRAIT',   'Districts');

-- improves granary tendancy, it is never too much.
update AiFavoredItems set Value = 100 where ListType = 'DLAdjustBuildings' and Item = 'BUILDING_GRANARY';
insert or replace into AiFavoredItems
	(ListType,					Item,									Favored,	Value)
values
-- removes farm and fishing farm from ai favored improvements
    ('DLAIImprovements','IMPROVEMENT_FARM',0,-200),
    ('DLAIImprovements','IMPROVEMENT_MINE',1,100),
    ('DLAIImprovements','IMPROVEMENT_QUARRY',1,100),
    ('DLAIImprovements','IMPROVEMENT_LUMBER_MILL',1,100),
    ('DLAIImprovements','IMPROVEMENT_PLANTATION',1,100),
    ('DLAIImprovements','IMPROVEMENT_FISHING_BOATS',1,100),
    ('DLAIImprovements','IMPROVEMENT_PASTURE',1,100),   
    ('DLAIImprovements','IMPROVEMENT_CAMP',1,100),  
-- ask ai to build more industrial zone
	('DLAdjustDistricts', 		'DISTRICT_INDUSTRIAL_ZONE', 			1, 			1000),
-- increase ai's favor to goverment plaza and diplomatic quarter
	('DLAdjustDistricts', 		'DISTRICT_GOVERNMENT', 					1, 			100),
    ('DLAdjustDistricts', 		'DISTRICT_DIPLOMATIC_QUARTER', 			1, 			100),
-- aqueduct is important, but since its price won't change, 100 should be enough
    ('DLAdjustDistricts', 		'DISTRICT_AQUEDUCT', 					1, 			100),
    ('DLAdjustDistricts', 		'DISTRICT_HARBOR', 						1, 			0),
    ('DLAdjustDistricts', 		'DISTRICT_CAMPUS', 						1, 			0),
    ('DLAdjustDistricts', 		'DISTRICT_THEATER',						1, 			0),
    ('DLAdjustDistricts', 		'DISTRICT_ENCAMPMENT', 					1, 			0),
    ('DLAdjustDistricts', 		'DISTRICT_ENTERTAINMENT_COMPLEX', 		1, 			0),
-- city state favors all district, avoid them to only build 1 district
-- city states more encampment for self protection
	('DLCityStateDistricts', 	'DISTRICT_HOLY_SITE', 					1, 			0),
	('DLCityStateDistricts', 	'DISTRICT_CAMPUS', 						1, 			0),
    ('DLCityStateDistricts', 	'DISTRICT_COMMERCIAL_HUB', 				1, 			100),
    ('DLCityStateDistricts', 	'DISTRICT_INDUSTRIAL_ZONE', 			1, 			0),
    ('DLCityStateDistricts', 	'DISTRICT_ENCAMPMENT', 					1, 			100),
    ('DLCityStateDistricts', 	'DISTRICT_THEATER', 					1, 			0),
    ('DLCityStateDistricts', 	'DISTRICT_HARBOR', 						1, 			100),
    ('DLCityStateDistricts', 	'DISTRICT_AQUEDUCT', 					1, 			100),
-- tech tendancy
	('DLAdjustTechs', 'TECH_MINING', 1, 6),
	-- commenting out animal_husbandry since I currently grant it to ai.
	--('DLAdjustTechs', 'TECH_ANIMAL_HUSBANDRY', 1, 10),
	('DLAdjustTechs', 'TECH_POTTERY', 1, 0),
	('DLAdjustTechs', 'TECH_ASTROLOGY', 1, 0),
    ('DLAdjustTechs', 'TECH_WRITING', 1, 0),
	-- set several tech goals for ai. maybe civil engineering is a good line.
    ('DLAdjustTechs', 'TECH_IRRIGATION', 0, 3),
	-- unlocks industrial zone for ai. hope they can build more.
    ('DLAdjustTechs', 'TECH_IRON_WORKING', 1, 10),
	--helps ai to goto machinery
	('DLAdjustTechs', 'TECH_ENGINEERING', 1, 20),
	--raise machinery tendancy so that they might unlock crossbowman earlier
    ('DLAdjustTechs', 'TECH_MACHINERY', 1, 20),
	-- unlocks industry level2 buildings and medival units
    ('DLAdjustTechs', 'TECH_METAL_CASTING', 1, 10),
    ('DLAdjustTechs', 'TECH_APPRENTICESHIP', 1, 10),
	-- unlocks campus 3rd level building. school of architecture is by no means a bad idea for them
    ('DLAdjustTechs', 'TECH_CIVIL_ENGINEERING', 1, 10),
	-- import tech towards science vicotry.
    ('DLAdjustTechs', 'TECH_CHEMISTRY', 1, 100),
    ('DLAdjustTechs', 'TECH_COMPUTERS', 1, 100),
    -- several important building unlocks.
    ('DLAdjustTechs', 'TECH_INDUSTRIALIZATION', 1, 20),
    ('DLAdjustTechs', 'TECH_CURRENCY', 1, 5),
    ('DLAdjustTechs', 'TECH_PAPER_MAKING_HD', 1, 5),
	-- adjust important civics ai should run.
    ('DLAdjustCivics',          'CIVIC_GAMES_RECREATION',               0,          -100),
	('DLAdjustCivics',          'CIVIC_POLITICAL_PHILOSOPHY',           1,          100),
	('DLAdjustCivics',          'CIVIC_MERCENARIES',           			1,          10),
	('DLAdjustCivics',			'CIVIC_GUILDS',							1,			10),
	('DLAdjustCivics',			'CIVIC_DRAMA_POETRY',					1,			200),
	('DLAdjustCivics',			'CIVIC_EXPLORATION',					1,			10),
	('DLAdjustCivics',			'CIVIC_OPERA_BALLET',					1,			10),
	-- this value should change as how much totems they build
	('DLAdjustBuildings', 'BUILDING_TOTEMS', 0, 0),
    ('DLAdjustBuildings', 'BUILDING_MONUMENT', 1, 100),
    ('DLAdjustBuildings', 'BUILDING_OFFICIAL_RUN_HANDCRAFT',1, 100),
	('DLAdjustBuildings', 'BUILDING_BOOTCAMP',1, 0),
	--ai would build walls but not to build them at first place.
    ('DLAdjustBuildings', 'BUILDING_CASTLE', 1, 0),
    ('DLAdjustBuildings', 'BUILDING_STAR_FORT', 1, 0),
	('DLAdjustBuildings', 'BUILDING_GRANARY', 1, 100),
    ('DLAdjustBuildings', 'BUILDING_JNR_WIND_MILL', 1, 30),
    ('DLAdjustBuildings', 'BUILDING_WORKSHOP', 1, 30),
    ('DLAdjustBuildings', 'BUILDING_FACTORY', 1, 30),
    ('DLAdjustBuildings', 'BUILDING_LIGHTHOUSE', 1, 100),
    ('DLAdjustBuildings', 'BUILDING_SHIPYARD', 1, 100),
    ('DLAdjustBuildings', 'BUILDING_SEAPORTS', 1, 100),
    ('DLAdjustBuildings', 'BUILDING_LIBRARY', 1, 20),
    ('DLAdjustBuildings', 'BUILDING_JNR_SCHOOL', 1, 30),
    ('DLAdjustBuildings', 'BUILDING_JNR_ARCHITECTURE', 1, 100),
	('DLAdjustBuildings', 'BUILDING_JNR_LIBERAL_ARTS', 0, -20),
    ('DLAdjustBuildings', 'BUILDING_JNR_EDUCATION', 1, 100),
	-- these commercial hub building should no longer have high priority.
    --('DLAdjustBuildings', 'BUILDING_MARKET', 1, 30),
    --('DLAdjustBuildings', 'BUIDLING_BANK', 1, 30),
    --('DLAdjustBuildings', 'BUILDING_STOCK_EXCHANGE', 1, 30),
    ('DLAdjustBuildings', 'BUILDING_JNR_ASSEMBLY', 1, 100),
    --('DLAdjustBuildings', 'BUILDING_JNR_CABINET', 1, 30),
    ('DLAdjustBuildings', 'BUILDING_JNR_OPERA', 1, 100),
	-- build some encampment buildings but no hurry.
    ('DLAdjustBuildings', 'BUILDING_BARRACKS', 1, 0),
    ('DLAdjustBuildings', 'BUILDING_ARMORY', 1, 0),
    ('DLAdjustBuildings', 'BUILDING_MILITARY_ACADEMY', 1, 0),
	-- build bathhouse to gain happiness.
    ('DLAdjustBuildings', 'BUILDING_JNR_BATHHOUSE', 1, 100),
    ('DLAdjustBuildings', 'BUILDING_SEWER', 1, 30);

-- 10 strategics per turn from mars, tries to relief strategic price problem and ai maintaining strategic unit problem.
--insert or replace into TraitModifiers (TraitType,   ModifierId)
--select 'TRAIT_LEADER_MAJOR_CIV',                    'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType
--from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
--
--insert or replace into Modifiers (ModifierId,           ModifierType,   OwnerRequirementSetId)
--select 'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType,   'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION', 'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI_CAN_SEE_' || ResourceType
--from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
--
--insert or replace into ModifierArguments (ModifierId,   Name,   Value)
--select 'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType,   'ResourceType', ResourceType
--from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
--insert or replace into ModifierArguments (ModifierId,   Name,   Value)
--select 'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType,   'Amount', 10
--from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

-- For high difficulty AI.
-- grant ai animal husbandry
-- grant city states production bonus to help protect themselves
insert or replace into TraitModifiers (TraitType,	ModifierId) values
	('MINOR_CIV_DEFAULT_TRAIT',						'HIGH_DIFFICULTY_PRODUCTION_SCALING'),
	('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_DIFFICULTY_AI_GRANT_ANIMAL_HUSBANDRY');

-- extra 10 speed for ai settlers to relief ai stuck at settle a city so that they won't build more cities/
-- in this sense, they will be able to build more cities since now they save time at the stage of find a spot to settle.
--remove it for now, maybe enters challenge mode in the future.
--insert or replace into TraitModifiers (TraitType,	ModifierId) values
--    ('TRAIT_LEADER_MAJOR_CIV',						'AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_SETTLER_SPEED');
insert or replace into Modifiers (ModifierId, ModifierType, Permanent, OwnerRequirementSetId, SubjectRequirementSetId) values
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_SETTLER_SPEED',	'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT', 1, 'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI', 'AI_SETTLER_SPEED_REQSET');
insert or replace into ModifierArguments (ModifierId,		Name,		Value) values
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_SETTLER_SPEED',        'Amount',   10);
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('AI_SETTLER_SPEED_REQSET', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('AI_SETTLER_SPEED_REQSET', 'REQUIRES_UNIT_IS_SETTLER');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType, Inverse) VALUES
    ('REQUIRES_UNIT_IS_SETTLER', 'REQUIREMENT_UNIT_TYPE_MATCHES', 0);
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('REQUIRES_UNIT_IS_SETTLER', 'UnitType', 'UNIT_SETTLER');

-- remove extra builder, even it should be added, it should be added started at a later era maybe classical or even medieval.
--insert or replace into TraitModifiers (TraitType, ModifierId) values
--    ('TRAIT_LEADER_MAJOR_CIV',  'AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_BUILDER');
insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) values
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_BUILDER',	'MODIFIER_PLAYER_BUILT_CITIES_GRANT_FREE_UNIT', 'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI');
insert or replace into ModifierArguments (ModifierId, Name, Value) values
    ('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_BUILDER', 'UnitType', 'UNIT_BUILDER'),
    ('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_BUILDER', 'Amount', 1);
-- 2 more extra amenities, reilief happiness problem when ai build more cities.
-- further relief problem of ai luxury price too high.
insert or replace into ModifierArguments (ModifierId,		Name,		Value) values
    ('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_AMENITY',          'Amount',   3);
-- Production Scale: 85 + 15n
-- Science Scale: 40 + 10n
-- Culture Scale: 40 + 10n
-- Gold Scale: 25 + 10n, remove + 10n only leaves 25%
--update ModifierArguments set Extra = 5
--	where ModifierId = 'HIGH_DIFFICULTY_GOLD_SCALING' and Name = 'Amount';
--insert or replace into TraitModifiers (TraitType, ModifierId)
--select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType
--from Eras where not EraType = 'ERA_ANCIENT';
--insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
--select	'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType,
--		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
--		'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
--from Eras where not EraType = 'ERA_ANCIENT';
--insert or replace into ModifierArguments (ModifierId, Name, Value)
--select 'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_GOLD'
--from Eras where not EraType = 'ERA_ANCIENT';
--insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
--select	'HIGH_DIFFICULTY_GOLD_SCALING_AT_LEAST_' || EraType, 'Amount',
--		'LinearScaleFromDefaultHandicap', 0, 0
--from Eras where not EraType = 'ERA_ANCIENT';

-- Faith Scale: 25 + 10n, removes +10n
--update ModifierArguments set Extra = 5
--	where ModifierId = 'HIGH_DIFFICULTY_FAITH_SCALING' and Name = 'Amount';
--insert or replace into TraitModifiers (TraitType, ModifierId)
--select 'TRAIT_LEADER_MAJOR_CIV', 'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType
--from Eras where not EraType = 'ERA_ANCIENT';
--insert or replace into Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
--select	'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType,
--		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',
--		'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
--from Eras where not EraType = 'ERA_ANCIENT';
--insert or replace into ModifierArguments (ModifierId, Name, Value)
--select 'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType, 'YieldType', 'YIELD_FAITH'
--from Eras where not EraType = 'ERA_ANCIENT';
--insert or replace into ModifierArguments (ModifierId, Name, Type, Value, Extra)
--select	'HIGH_DIFFICULTY_FAITH_SCALING_AT_LEAST_' || EraType, 'Amount',
--		'LinearScaleFromDefaultHandicap', 0, 0
--from Eras where not EraType = 'ERA_ANCIENT';

-- food, give back extra +10n
insert or replace into TraitModifiers (TraitType,   ModifierId) values
    ('TRAIT_LEADER_MAJOR_CIV',                      'HD_HIGH_DIFFICULTY_FOOD_SCALING');

insert or replace into Modifiers (ModifierId,               ModifierType,                                   OwnerRequirementSetId) values
    ('HD_HIGH_DIFFICULTY_FOOD_SCALING',                     'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',    'PLAYER_IS_HIGH_DIFFICULTY_AI');

insert or replace into ModifierArguments (ModifierId,       Name,           Value) values
    ('HD_HIGH_DIFFICULTY_FOOD_SCALING',                     'YieldType',    'YIELD_FOOD');

insert or replace into ModifierArguments (ModifierId,   Name,       Type,                               Value,  Extra) values
    ('HD_HIGH_DIFFICULTY_FOOD_SCALING',                 'Amount',   'LinearScaleFromDefaultHandicap',   0,      2);
--------------------------------------------------------------
-- Changed based on [MOD] Real Strategy
delete from AiFavoredItems where ListType = 'StandardSettlePlot';
insert or replace into AiFavoredItems (ListType, Item, Favored, Value, StringVal, TooltipString) values
('StandardSettlePlot', 'Cultural Pressure', 0, 1, NULL, NULL), -- 1
('StandardSettlePlot', 'Cultural Pressure', 1, -6, NULL, NULL), -- -6
--('StandardSettlePlot', 'Foreign Continent', 1, -4, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_FOREIGN_CONTINENT'), -- -2
-- just let them settle
('StandardSettlePlot', 'Foreign Continent', 0, 6, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_FOREIGN_CONTINENT'), -- -2
-- lowering down this value will let ai cities settle nearer.
('StandardSettlePlot', 'Nearest Friendly City', 0, -12, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_NEAREST_CITY'), -- -10, be careful - expansion gives +3, naval +2/4
('StandardSettlePlot', 'Fresh Water', 0, 20, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_FRESH_WATER'), -- def
('StandardSettlePlot', 'Coastal', 0, 8, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_COAST'), -- 12
('StandardSettlePlot', 'Total Yield', 0, 1, 'YIELD_PRODUCTION', 'LOC_SETTLEMENT_RECOMMENDATION_TOTAL_YIELD'), -- 2
('StandardSettlePlot', 'Inner Ring Yield', 0, 3, 'YIELD_FOOD',    'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1, RS:1 -- maybe compensate for decreased food yield
('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_PRODUCTION', 'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- def
-- ('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_GOLD',    'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- new
('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_SCIENCE', 'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1
('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_CULTURE', 'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1
('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_FAITH',   'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1
('StandardSettlePlot', 'New Resources', 0, 3, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_NEW_RESOURCES'), -- 4, RS:6
('StandardSettlePlot', 'Resource Class', 0, 2, 'RESOURCECLASS_BONUS',     'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- new, RS:2
('StandardSettlePlot', 'Resource Class', 0, 3, 'RESOURCECLASS_LUXURY',    'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- 2
('StandardSettlePlot', 'Resource Class', 0, 3, 'RESOURCECLASS_STRATEGIC', 'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- 2, RS:4
('StandardSettlePlot', 'Specific Resource', 0, 3, 'RESOURCE_HORSES', 'LOC_SETTLEMENT_RECOMMENDATION_RESOURCES'), -- 3
('StandardSettlePlot', 'Specific Resource', 0, 3, 'RESOURCE_IRON',   'LOC_SETTLEMENT_RECOMMENDATION_RESOURCES'), -- 5, RS:4
('StandardSettlePlot', 'Specific Resource', 0, 3, 'RESOURCE_NITER',  'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- def
--('StandardSettlePlot', 'Specific Resource', 0, 0, 'RESOURCE_COAL'), -- plenty
--('StandardSettlePlot', 'Specific Resource', 0, 0, 'RESOURCE_OIL'), -- plenty
-- ('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_ALUMINUM', 'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- new
-- ('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_URANIUM', 'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- new, RS:10
('StandardSettlePlot', 'Specific Feature', 0, -50, 'FEATURE_ICE', 'LOC_SETTLEMENT_RECOMMENDATION_FEATURES'); -- fuck maui
-- I would keep these parameters to keep adjust ai's tendancy to settle more cities.
-- but maybe I would comment these lines out to help test how are they behaving without shifting these
-- params towards expansion ai.
delete from AiFavoredItems where ListType = 'MedievalSettlements';
--UPDATE AiFavoredItems SET Value = -50 WHERE ListType = 'DefaultCitySettlement' and Item = 'SETTLEMENT_MIN_VALUE_NEEDED';
UPDATE AiFavoredItems SET Value = -1 WHERE  ListType = 'DefaultCitySettlement' and Item = 'SETTLEMENT_ADDITIONAL_VALUE_PER_CITY';
UPDATE AiFavoredItems SET Value = -3 WHERE  ListType = 'DefaultCitySettlement' and Item = 'SETTLEMENT_DECAY_TURNS';
UPDATE AiFavoredItems SET Value = -3 WHERE  ListType = 'DefaultCitySettlement' and Item = 'SETTLEMENT_DECAY_AMOUNT';
--UPDATE AiFavoredItems SET Value = 100 WHERE ListType = 'DefaultCitySettlement' and Item = 'SETTLEMENT_CITY_MINIMUM_VALUE';
--UPDATE AiFavoredItems SET Value = 1 WHERE  ListType = 'DefaultCitySettlement' and Item = 'SETTLEMENT_CITY_VALUE_MULTIPLIER';

-- --------------------------------------------------------------
-- apply yield bias to city states
--update AiLists set value = NULL Where ListType = 'DefaultYieldBias';
-- -- Yield biases
UPDATE AiFavoredItems SET Value = 5  WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_FOOD'; -- 10
UPDATE AiFavoredItems SET Value = 10 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_PRODUCTION'; -- 25
UPDATE AiFavoredItems SET Value = 10 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_SCIENCE'; -- 10
UPDATE AiFavoredItems SET Value = 10 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_CULTURE'; -- 10
UPDATE AiFavoredItems SET Value = 0 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_FAITH';
-- if yields are not updated here and use aifavored value instead, then it would be hard to accomodate
-- for favored value else where since they are all percent values.
--UPDATE AiFavoredItems SET Value = -34 where ListType = 'DefaultYieldBias' And Item = 'YIELD_FAITH';
--UPDATE AiFavoredItems SET Value = -34 where ListType = 'DefaultYieldBias' And Item = 'YIELD_GOLD';
UPDATE Yields SET DefaultValue = 0.333 where YieldType = 'Gold';
UPDATE Yields SET DefaultValue = 0.667 where YieldType = 'Faith';


-- Try to change AI's favor on great people projects by set the default value to half of it used to be, by FiveYear
UPDATE PseudoYields SET DefaultValue = 0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_GPP_GENERAL';
UPDATE PseudoYields SET DefaultValue = 0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_GPP_ADMIRAL';
UPDATE PseudoYields SET DefaultValue = 0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_GPP_ENGINEER';
UPDATE PseudoYields SET DefaultValue = 0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_GPP_MERCHANT';
-- keep prophet there so that ai will build holy sites and setup religion.
--UPDATE PseudoYields SET DefaultValue = 0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_GPP_PROPHET';
UPDATE PseudoYields SET DefaultValue = 0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_GPP_SCIENTIST';
UPDATE PseudoYields SET DefaultValue = 0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_GPP_WRITER';
UPDATE PseudoYields SET DefaultValue = 0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_GPP_ARTIST';
UPDATE PseudoYields SET DefaultValue = 0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_GPP_MUSICIAN';

--insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('AncientPseudoYields', 'PSEUDOYIELD_GPP_PROPHET', 1, 20);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('AncientPseudoYields', 'PSEUDOYIELD_DISTRICT', 1, 0);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('AncientPseudoYields', 'PSEUDOYIELD_UNIT_COMBAT', 1, 30);
-- perhaps they will build more scouts. if too high, they will fight with scouts
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('AncientPseudoYields', 'PSEUDOYIELD_UNIT_EXPLORER', 1, 40);
-- lowers relic price.
-- keep books unchanged, to better test on ai's price mechanism.
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('AncientPseudoYields', 'PSEUDOYIELD_TOURISM', 0, -200);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('AncientPseudoYields', 'PSEUDOYIELD_GREATWORK_RELIC', 0, -200);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ClassicalPseudoYields', 'PSEUDOYIELD_TOURISM', 0, -200);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ClassicalPseudoYields', 'PSEUDOYIELD_GREATWORK_RELIC', 0, -200);
--insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('AncientPseudoYields', 'PSEUDOYIELD_HAPPINESS', 1, 0);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ClassicalPseudoYields', 'PSEUDOYIELD_UNIT_COMBAT', 1, 30);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ClassicalPseudoYields', 'PSEUDOYIELD_HAPPINESS', 1, 0);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('MedievalPseudoYields', 'PSEUDOYIELD_UNIT_COMBAT', 1, 0);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissancePseudoYields', 'PSEUDOYIELD_UNIT_COMBAT', 1, 0);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ModernPseudoYields', 'PSEUDOYIELD_UNIT_COMBAT', 1, 0);
--balances land and naval units within naval strategy. previously -90 and +150.
UPDATE AiFavoredItems SET Value = -50 WHERE ListType = 'NavalUnitPreferences' AND Item = 'PSEUDOYIELD_UNIT_COMBAT';
UPDATE AiFavoredItems SET Value = 100 WHERE ListType = 'NavalUnitPreferences' AND Item = 'PSEUDOYIELD_UNIT_NAVAL_COMBAT';
-- more and more settler
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('AncientPseudoYields', 'PSEUDOYIELD_UNIT_SETTLER', 1, 31);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ClassicalPseudoYields', 'PSEUDOYIELD_UNIT_SETTLER', 1, 50);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('MedievalPseudoYields', 'PSEUDOYIELD_UNIT_SETTLER', 1, 50);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissancePseudoYields', 'PSEUDOYIELD_UNIT_SETTLER', 1, 50);

-- they should like writers.
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ClassicalPseudoYields', 'PSEUDOYIELD_GPP_WRITER', 1, 30);
-- after pseudoyield_gpp is adjusted, they should long for these great person again.
--UPDATE AiFavoredItems SET Favored = 30 WHERE ListType = 'ClassicalPseudoYields' AND Item = 'PSEUDOYIELD_GPP_MERCHANT';
UPDATE AiFavoredItems SET Value = 0 WHERE ListType = 'ClassicalYields' AND Item = 'YIELD_FOOD';
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ClassicalYields', 'YIELD_PRODUCTION', 1, 20);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ClassicalYields', 'YIELD_CULTURE', 1, 20);
UPDATE AiFavoredItems SET Value = 20 WHERE ListType = 'ClassicalYields' And Item = 'YIELD_SCIENCE';
UPDATE AiFavoredItems SET Value = 0 WHERE ListType = 'ClassicalYields' AND Item = 'YIELD_GOLD';
--UPDATE AiFavoredItems SET Favored = 0 WHERE ListType = 'ClassicalYields' AND Item = 'YIELD_GOLD';
UPDATE AiFavoredItems SET Value = 0 WHERE ListType = 'ClassicalYields' AND Item = 'YIELD_FAITH';


insert or replace into AiFavoredItems (ListType, Item, Favored) values ('ScienceVictoryProjects', 'PROJECT_ORBITAL_LASER',1);
insert or replace into AiFavoredItems (ListType, Item, Favored) values ('ScienceVictoryProjects', 'PROJECT_TERRESTRIAL_LASER',1);
insert or replace into AiFavoredItems (ListType, Item, Favored) values ('ScienceVictoryProjects', 'PROJECT_LAUNCH_MARS_BASE',1);
insert or replace into AiFavoredItems (ListType, Item, Favored) values ('ScienceVictoryProjects', 'PROJECT_LAUNCH_EXOPLANET_EXPEDITION',1);

insert or replace into AiFavoredItems (ListType, Item, Favored) values ('ScienceVictoryTechs', 'TECH_SMART_MATERIALS',1);
--insert or replace into AiFavoredItems (ListType, Item, Favored) values ('ScienceVictoryTechs', 'PROJECT_LAUNCH_EXOPLANET_EXPEDITION',1);
UPDATE AiFavoredItems set Value = 100 WHERE ListType='ScienceVictoryTechs' And Item = 'TECH_ROCKERY';
UPDATE AiFavoredItems set Value = 100 WHERE ListType='ScienceVictoryTechs' And Item = 'TECH_SATELLITES';
UPDATE AiFavoredItems set Value = -1 WHERE ListType='ScienceVictoryTechs' And Item = 'TECH_NANOTECHNOLOGY';
UPDATE AiFavoredItems set Favored = 0 WHERE ListType='ScienceVictoryTechs' And Item = 'TECH_ROBOTICS';
UPDATE AiFavoredItems set Favored = 0 WHERE ListType='ScienceVictoryTechs' And Item = 'TECH_NUCLEAR_FUSION';

UPDATE AiFavoredItems set Value = 100 WHERE ListType='ScienceVictoryDistricts' And Item = 'DISTRICT_SPACEPORT';

UPDATE AiFavoredItems SET Value = 0  WHERE ListType = 'MedievalYields' AND Item = 'YIELD_FOOD';
UPDATE AiFavoredItems SET Value = 25 WHERE ListType = 'MedievalYields' AND Item = 'YIELD_PRODUCTION';
UPDATE AiFavoredItems SET Value = 20 WHERE ListType = 'MedievalYields' And Item = 'YIELD_CULTURE';
UPDATE AiFavoredItems SET Value = 20 WHERE ListType = 'MedievalYields' And Item = 'YIELD_SCIENCE';
UPDATE AiFavoredItems SET Value = 0 WHERE ListType = 'MedievalYields' AND Item = 'YIELD_GOLD';
--UPDATE AiFavoredItems SET Favored = 0 WHERE ListType = 'MedievalYields' AND Item = 'YIELD_GOLD';
UPDATE AiFavoredItems SET Value = -25  WHERE ListType = 'MedievalYields' AND Item = 'YIELD_FAITH';

insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissanceYields', 'YIELD_SCIENCE', 1, 100);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissanceYields', 'YIELD_CULTURE', 1, 30);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissanceYields', 'YIELD_FAITH', 1, -25);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissanceYields', 'YIELD_PRODUCTION', 1, 20);
UPDATE AiFavoredItems SET Value = 20  WHERE ListType =  'RenaissanceYields' AND Item = 'YIELD_FOOD';
UPDATE AiFavoredItems SET Value = 0 WHERE ListType =  'RenaissanceYields' AND Item = 'YIELD_GOLD';

insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissanceYields', 'YIELD_SCIENCE', 1, 100);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissanceYields', 'YIELD_CULTURE', 1, 30);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissanceYields', 'YIELD_FOOD', 1, 20);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('RenaissanceYields', 'YIELD_PRODUTION', 1, 20);
UPDATE AiFavoredItems SET Value = -50  WHERE ListType = 'IndustrialYields' AND Item = 'YIELD_FAITH';
UPDATE AiFavoredItems SET Value = -25 WHERE ListType =  'IndustrialYields' AND Item = 'YIELD_GOLD';

insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ModernYields', 'YIELD_SCIENCE', 1, 100);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ModernYields', 'YIELD_CULTURE', 1, 30);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ModernYields', 'YIELD_FAITH', 1, -50);
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('ModernYields', 'YIELD_PRODUCTION', 1, 20);
UPDATE AiFavoredItems SET Value = 20  WHERE ListType =  'ModernYields' AND Item = 'YIELD_FOOD';
UPDATE AiFavoredItems SET Value = 0 WHERE ListType =  'ModernYields' AND Item = 'YIELD_GOLD';

UPDATE PseudoYields SET DefaultValue =  3.0 WHERE PseudoYieldType = 'PSEUDOYIELD_CLEAR_BANDIT_CAMPS'; --    0.5, Ai+ 1.6
--I'm doubting ai use this to check whether to remove their farms.
UPDATE PseudoYields SET DefaultValue = 0 WHERE PseudoYieldType = 'PSEUDOYIELD_IMPROVEMENT'; --    3, 13.5 too much
-- I honestly don't know about the following two params, so comment them out.
--UPDATE PseudoYields SET DefaultValue = 1.0 WHERE PseudoYieldType = 'PSEUDOYIELD_STANDING_ARMY_NUMBER'; --  1 -- controls size of the army
--UPDATE PseudoYields SET DefaultValue = 0.2 WHERE PseudoYieldType = 'PSEUDOYIELD_STANDING_ARMY_VALUE'; --   0.1 -- controls size of the army
UPDATE PseudoYields SET DefaultValue = 1.2 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_COMBAT'; -- 1.0, AI+ 1.4, RS 1.1 -- This is land combat units
UPDATE PseudoYields SET DefaultValue = 1.2 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_NAVAL_COMBAT'; --  1 -- leave for naval strategies
UPDATE PseudoYields SET DefaultValue = 1.2 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_EXPLORER'; --  1, RS 0.7
-- they shouldn't build wonders like a idiot.
UPDATE PseudoYields SET DefaultValue = 0.0 WHERE PseudoYieldType = 'PSEUDOYIELD_WONDER'; -- 2, AI+ 0.55, RS 0.6
UPDATE PseudoYields SET DefaultValue = 25.0 WHERE PseudoYieldType = 'PSEUDOYIELD_DISTRICT'; --   4.0, AI+ = 6.7! RS 4.0
UPDATE PseudoYields SET DefaultValue = 6.0 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_SPY'; -- 20, RS not changed
-- original way to lower relic price.
--UPDATE PseudoYields SET DefaultValue = 1 WHERE PseudoYieldType = 'PSEUDOYIELD_GREATWORK_RELIC';
-- gaurantees ocean maps classical time.
update Eras_XP1 set GameEraMinimumTurns = 30 where EraType = 'ERA_CLASSICAL'; -- for winged hussar

--update DiplomaticStateActions set Cost = 0 where StateType = 'DIPLO_STATE_ALLIED' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
--update DiplomaticStateActions set Cost = 5 where StateType = 'DIPLO_STATE_DECLARED_FRIEND' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
--update DiplomaticStateActions set Cost = 5 where StateType = 'DIPLO_STATE_FRIENDLY' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
--update DiplomaticStateActions set Cost = 10 where StateType = 'DIPLO_STATE_NEUTRAL' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
--update DiplomaticStateActions set Cost = 20 where StateType = 'DIPLO_STATE_UNFRIENDLY' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';

