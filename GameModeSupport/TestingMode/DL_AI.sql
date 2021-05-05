-------------------------------------
--      AI Related Adjustments     --
-------------------------------------

-- [Version v0.6.8]
-- 优化ai的坐城倾向。
-- 少量增加ai的出兵和移民倾向。
-- 缩短ai最远攻击目标的距离。
-- TODO: 减小friend city的坐城权重。

update AiOperationDefs set MaxTargetDistInArea = 20 where OperationName = 'Attack Enemy City' or OperationName = 'Attack Walled City';
update AiOperationDefs set MaxTargetDistInArea = 30 where OperationName = 'Wartime Attack Enemy City' or OperationName = 'Wartime Attack Walled City';

delete from AiListTypes where ListType = 'DLAdjustPseudoYields';
delete from AiLists where ListType = 'DLAdjustPseudoYields';
delete from AiFavoredItems where ListType = 'DLAdjustPseudoYields';

--------------------------------------------------------------
-- Changed based on [MOD] Real Strategy
delete from AiFavoredItems where ListType = 'StandardSettlePlot';
insert or replace into AiFavoredItems (ListType, Item, Favored, Value, StringVal, TooltipString) values
('StandardSettlePlot', 'Cultural Pressure', 0, 1, NULL, NULL), -- 1
('StandardSettlePlot', 'Cultural Pressure', 1, -6, NULL, NULL), -- -6
('StandardSettlePlot', 'Foreign Continent', 1, -4, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_FOREIGN_CONTINENT'), -- -2
('StandardSettlePlot', 'Nearest Friendly City', 0, -8, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_NEAREST_CITY'), -- -10, be careful - expansion gives +3, naval +2/4
('StandardSettlePlot', 'Fresh Water', 0, 20, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_FRESH_WATER'), -- def
('StandardSettlePlot', 'Coastal', 0, 8, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_COAST'), -- 12
('StandardSettlePlot', 'Total Yield', 0, 1, 'YIELD_PRODUCTION', 'LOC_SETTLEMENT_RECOMMENDATION_TOTAL_YIELD'), -- 2
('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_FOOD',    'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1, RS:1
('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_PRODUCTION', 'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- def
-- ('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_GOLD',    'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- new
('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_SCIENCE', 'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1
('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_CULTURE', 'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1
('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_FAITH',   'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1
('StandardSettlePlot', 'New Resources', 0, 3, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_NEW_RESOURCES'), -- 4, RS:6
('StandardSettlePlot', 'Resource Class', 0, 2, 'RESOURCECLASS_BONUS',     'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- new, RS:2
('StandardSettlePlot', 'Resource Class', 0, 2, 'RESOURCECLASS_LUXURY',    'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- 2
('StandardSettlePlot', 'Resource Class', 0, 2, 'RESOURCECLASS_STRATEGIC', 'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- 2, RS:4
('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_HORSES', 'LOC_SETTLEMENT_RECOMMENDATION_RESOURCES'), -- 3
('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_IRON',   'LOC_SETTLEMENT_RECOMMENDATION_RESOURCES'), -- 5, RS:4
('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_NITER',  'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- def
--('StandardSettlePlot', 'Specific Resource', 0, 0, 'RESOURCE_COAL'), -- plenty
--('StandardSettlePlot', 'Specific Resource', 0, 0, 'RESOURCE_OIL'), -- plenty
-- ('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_ALUMINUM', 'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- new
-- ('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_URANIUM', 'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- new, RS:10
('StandardSettlePlot', 'Specific Feature', 0, -5, 'FEATURE_ICE', 'LOC_SETTLEMENT_RECOMMENDATION_FEATURES');
-- put Natural Wonders as generally good to be around
-- insert or replace into AiFavoredItems (ListType, Item, Favored, Value, StringVal, TooltipString)
-- select 'StandardSettlePlot', 'Specific Feature', 0, 1, FeatureType, 'LOC_SETTLEMENT_RECOMMENDATION_FEATURES' -- +1, RS:3
-- from Features where NaturalWonder = 1;

-- UPDATE AiFavoredItems SET Value = 40 WHERE ListType = 'DefaultCitySettlement' AND Item = 'SETTLEMENT_MIN_VALUE_NEEDED'; -- 30, RS:50
--------------------------------------------------------------
-- Updates to Settlement recommendations
UPDATE PlotEvalConditions SET PoorValue =-35, GoodValue =-14 WHERE ConditionType = 'Nearest Friendly City'; -- PoorValue="-50" GoodValue="-20"
UPDATE PlotEvalConditions SET PoorValue =  0, GoodValue =  3 WHERE ConditionType = 'New Resources'; -- PoorValue="0" GoodValue="4"
UPDATE PlotEvalConditions SET PoorValue = 12, GoodValue = 18 WHERE ConditionType = 'Inner Ring Yield'; -- PoorValue="18" GoodValue="26", RS:12~18
UPDATE PlotEvalConditions SET PoorValue = 10, GoodValue = 20 WHERE ConditionType = 'Total Yield'; -- PoorValue="30" GoodValue="50"
UPDATE PlotEvalConditions SET PoorValue = -1, GoodValue =  8 WHERE ConditionType = 'Coastal'; -- PoorValue="-1" GoodValue="12", RS:-1~8
--UPDATE PlotEvalConditions SET PoorValue = 00, GoodValue = 00 WHERE ConditionType = 'Fresh Water'; -- PoorValue="0" GoodValue="20"
UPDATE PlotEvalConditions SET PoorValue = -1, GoodValue =  2 WHERE ConditionType = 'Specific Resource'; -- PoorValue="-1" GoodValue="6"
UPDATE PlotEvalConditions SET PoorValue = -6, GoodValue =  6 WHERE ConditionType = 'Specific Feature'; -- PoorValue="-5" GoodValue="5"
UPDATE PlotEvalConditions SET PoorValue =  3, GoodValue =  6 WHERE ConditionType = 'Resource Class'; -- PoorValue="2" GoodValue="6"
UPDATE PlotEvalConditions SET PoorValue = -4, GoodValue = 15 WHERE ConditionType = 'Foreign Continent'; -- PoorValue="-2" GoodValue="50"

--------------------------------------------------------------
-- Yield biases
insert or replace into AiFavoredItems (ListType, Item, Favored, Value) values ('DefaultYieldBias', 'YIELD_FOOD', 1, 10); -- new
UPDATE AiFavoredItems SET Value = 30 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_PRODUCTION'; -- 25
UPDATE AiFavoredItems SET Value = 10 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_SCIENCE'; -- 10
UPDATE AiFavoredItems SET Value = 15 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_CULTURE'; -- 10
UPDATE AiFavoredItems SET Value = 10 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_GOLD';  -- 20, RS:0
UPDATE AiFavoredItems SET Value = -20 WHERE ListType = 'DefaultYieldBias' AND Item = 'YIELD_FAITH'; -- -25

--------------------------------------------------------------
-- See also [MOD] Real Strategy
-- UPDATE PseudoYields SET DefaultValue = 450 WHERE PseudoYieldType = 'PSEUDOYIELD_CITY_BASE'; --   450, important mostly early game, later valuations are in thousands (5000+)...
-- UPDATE PseudoYields SET DefaultValue =  50 WHERE PseudoYieldType = 'PSEUDOYIELD_CITY_DEFENDING_UNITS'; --    80 -- very important, especially late game, causes huge jumps in city valuation
-- UPDATE PseudoYields SET DefaultValue = 275 WHERE PseudoYieldType = 'PSEUDOYIELD_CITY_DEFENSES'; --   400 - very important for aggression mgmt!
UPDATE PseudoYields SET DefaultValue = 150 WHERE PseudoYieldType = 'PSEUDOYIELD_CITY_ORIGINAL_CAPITAL'; --  200, lower value should save Minors a bit, Conquest will boost it anyway
-- UPDATE PseudoYields SET DefaultValue =  75 WHERE PseudoYieldType = 'PSEUDOYIELD_CITY_POPULATION'; --     50, not so important overall

-- infrastructure & various
UPDATE PseudoYields SET DefaultValue =  2.0 WHERE PseudoYieldType = 'PSEUDOYIELD_CLEAR_BANDIT_CAMPS'; --    0.5, Ai+ 1.6
--UPDATE PseudoYields SET DefaultValue =  0.15 WHERE PseudoYieldType = 'PSEUDOYIELD_DIPLOMATIC_BONUS'; --   0.25 -- let's not change diplomacy yet
--UPDATE PseudoYields SET DefaultValue = 4.0 WHERE PseudoYieldType = 'PSEUDOYIELD_DISTRICT'; --     3.5, AI+ = 6.7! check if this helps with Holy Sites - this is the earliest available district!
-- UPDATE PseudoYields SET DefaultValue =  0.8 WHERE PseudoYieldType = 'PSEUDOYIELD_ENVIRONMENT'; --    0.5, AI+ 0.75
--UPDATE PseudoYields SET DefaultValue = X.X WHERE PseudoYieldType = 'PSEUDOYIELD_GOLDENAGE_POINT'; -- 1, R&F
--UPDATE PseudoYields SET DefaultValue = X.X WHERE PseudoYieldType = 'PSEUDOYIELD_HAPPINESS'; -- 1
UPDATE PseudoYields SET DefaultValue = 5.0 WHERE PseudoYieldType = 'PSEUDOYIELD_IMPROVEMENT'; --    3, 13.5 too much
UPDATE PseudoYields SET DefaultValue = 0.75 WHERE PseudoYieldType = 'PSEUDOYIELD_INFLUENCE'; --     0.5, envoys - Diplo? RS 0.55
UPDATE PseudoYields SET DefaultValue = 40 WHERE PseudoYieldType = 'PSEUDOYIELD_NUCLEAR_WEAPON'; --  25, AI+ 45
-- UPDATE PseudoYields SET DefaultValue = 100 WHERE PseudoYieldType = 'PSEUDOYIELD_SPACE_RACE'; -- 100
UPDATE PseudoYields SET DefaultValue = 1.15 WHERE PseudoYieldType = 'PSEUDOYIELD_STANDING_ARMY_NUMBER'; --  1 -- controls size of the army
UPDATE PseudoYields SET DefaultValue = 0.12 WHERE PseudoYieldType = 'PSEUDOYIELD_STANDING_ARMY_VALUE'; --   0.1 -- controls size of the army
--UPDATE PseudoYields SET DefaultValue = 1 WHERE PseudoYieldType = 'PSEUDOYIELD_TOURISM'; --    1

-- Changed based on Real Strategy
UPDATE PseudoYields SET DefaultValue = 1.3 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_COMBAT'; -- 1.0, AI+ 1.4, RS 1.1
-- UPDATE PseudoYields SET DefaultValue =  1.0 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_NAVAL_COMBAT'; --  1 -- leave for naval strategies
UPDATE PseudoYields SET DefaultValue = 1.1 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_EXPLORER'; --  1, RS 0.7
UPDATE PseudoYields SET DefaultValue = 0.75 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_RELIGIOUS'; -- 1, RS 0.8
UPDATE PseudoYields SET DefaultValue = 1.2 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_SETTLER'; -- 1 -- 1.4 seems to much, they build Settlers even with 0 army and undeveloped cities
UPDATE PseudoYields SET DefaultValue = 4.0 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_TRADE'; -- 1, AI+ 11 -- make sure they build them all

UPDATE PseudoYields SET DefaultValue = 2.0 WHERE PseudoYieldType = 'PSEUDOYIELD_GOLDENAGE_POINT'; -- 1, R&F, RS unchanged
UPDATE PseudoYields SET DefaultValue = 4.0 WHERE PseudoYieldType = 'PSEUDOYIELD_GOVERNOR'; -- 2, R&F, RS unchanged
UPDATE PseudoYields SET DefaultValue = 1.0 WHERE PseudoYieldType = 'PSEUDOYIELD_WONDER'; -- 2, AI+ 0.55, RS 0.6
UPDATE PseudoYields SET DefaultValue = 5.0 WHERE PseudoYieldType = 'PSEUDOYIELD_DISTRICT'; --   4.0, AI+ = 6.7! RS 4.0
UPDATE PseudoYields SET DefaultValue = 8.0 WHERE PseudoYieldType = 'PSEUDOYIELD_UNIT_SPY'; -- 20, RS not changed
UPDATE PseudoYields SET DefaultValue = -0.25 WHERE PseudoYieldType = 'PSEUDOYIELD_DIPLOMATIC_GRIEVANCE'; -- -0.5, RS not changed
