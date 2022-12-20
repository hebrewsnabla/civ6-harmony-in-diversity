-- Starting units
update MajorStartingUnits set NotStartTile = 0, OnDistrictCreated = 1, DifficultyDelta = 0.5
	where Unit = 'UNIT_WARRIOR'  and Era = 'ERA_ANCIENT'   and AiOnly = 1;
update MajorStartingUnits set NotStartTile = 0, OnDistrictCreated = 1, DifficultyDelta = 0.5
	where Unit = 'UNIT_SPEARMAN' and Era = 'ERA_CLASSICAL' and AiOnly = 1;
update MajorStartingUnits set DifficultyDelta = 0 where Unit = 'UNIT_SETTLER' and AiOnly = 1;
insert or replace into MajorStartingUnits
	(Unit,			Era,				NotStartTile,	AiOnly,	MinDifficulty)
values
	('UNIT_SCOUT',	'ERA_ANCIENT',		1,				1,		'DIFFICULTY_EMPEROR'),
	('UNIT_SCOUT',	'ERA_CLASSICAL',	1,				1,		'DIFFICULTY_EMPEROR');

-- High difficulty AI buff
-- Free strategic resource for deity AI.
insert or replace into TraitModifiers
	(TraitType,						ModifierId)
select
	'TRAIT_LEADER_MAJOR_CIV',		'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
insert or replace into Modifiers
	(ModifierId,									ModifierType,												OwnerRequirementSetId)
select
	'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType,	'MODIFIER_PLAYER_ADJUST_FREE_RESOURCE_IMPORT_EXTRACTION',	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI_CAN_SEE_' || ResourceType
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
select
	'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType,	'ResourceType',	ResourceType
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
select
	'HD_DEITY_AI_FREE_STRATEGIC_' || ResourceType,	'Amount',		1
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
-- Amenity and Housing
insert or replace into TraitModifiers
	(TraitType,						ModifierId)
values
	('TRAIT_LEADER_MAJOR_CIV',		'AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_AMENITY'),
	('TRAIT_LEADER_MAJOR_CIV',		'AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_AMENITY'),
	('TRAIT_LEADER_MAJOR_CIV',		'AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_HOUSING'),
	('TRAIT_LEADER_MAJOR_CIV',		'AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_HOUSING');
insert or replace into Modifiers
	(ModifierId,											ModifierType,									OwnerRequirementSetId)
values
	('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_AMENITY',		'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',	'PLAYER_IS_AT_LEAST_EMPEROR_DIFFICULTY_AI'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_AMENITY',			'MODIFIER_PLAYER_CITIES_ADJUST_TRAIT_AMENITY',	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI'),
	('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_HOUSING',		'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',	'PLAYER_IS_AT_LEAST_EMPEROR_DIFFICULTY_AI'),
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_HOUSING',			'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',	'PLAYER_IS_AT_LEAST_DEITY_DIFFICULTY_AI');
insert or replace into ModifierArguments
	(ModifierId,											Name,		Value)
values
	('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_AMENITY',		'Amount',	1),
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_AMENITY',			'Amount',	1),
	('AT_LEAST_EMPEROR_DIFFICULTY_AI_EXTRA_HOUSING',		'Amount',	1),
	('AT_LEAST_DEITY_DIFFICULTY_AI_EXTRA_HOUSING',			'Amount',	1);
-- Yield scale
-- Production Scale: 60 + 15n
-- Science & Culture Scale: 40 + 10n
-- Gold & Faith Scale: 25 + 10n
-- Basic value
update ModifierArguments set Extra = 12	where ModifierId = 'HIGH_DIFFICULTY_PRODUCTION_SCALING' and Name = 'Amount';
update ModifierArguments set Extra = 8 where ModifierId = 'HIGH_DIFFICULTY_SCIENCE_SCALING' and Name = 'Amount';
update ModifierArguments set Extra = 8 where ModifierId = 'HIGH_DIFFICULTY_CULTURE_SCALING' and Name = 'Amount';
update ModifierArguments set Extra = 5 where ModifierId = 'HIGH_DIFFICULTY_GOLD_SCALING' and Name = 'Amount';
update ModifierArguments set Extra = 5 where ModifierId = 'HIGH_DIFFICULTY_FAITH_SCALING' and Name = 'Amount';
-- Era bonus
create temporary table HD_AIYieldScales (
	EraType text not null,
	YieldType text not null,
	Extra int not null,
	ModifierId text,
	primary key (EraType, YieldType)
);
with Y
	(YieldType,				Extra)
as (values
	('YIELD_PRODUCTION',	3),
	('YIELD_SCIENCE',		2),
	('YIELD_CULTURE',		2),
	('YIELD_GOLD',			2),
	('YIELD_FAITH',			2))
insert or replace into HD_AIYieldScales
	(EraType,	YieldType,	Extra)
select
	EraType,	YieldType,	Extra
from (Eras cross join Y) where EraType != 'ERA_ANCIENT';
update HD_AIYieldScales set ModifierId = 'HIGH_DIFFICULTY_' || YieldType || '_SCALING_AT_LEAST_' || EraType;
insert or replace into TraitModifiers
	(TraitType,					ModifierId)
select
	'TRAIT_LEADER_MAJOR_CIV',	ModifierId
from HD_AIYieldScales;
insert or replace into Modifiers
	(ModifierId,	ModifierType,											OwnerRequirementSetId)
select
	ModifierId,		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',	'PLAYER_IS_HIGH_DIFFICULTY_AI_AT_LEAST_' || EraType
from HD_AIYieldScales;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'YieldType',	YieldType
from HD_AIYieldScales;
insert or replace into ModifierArguments
	(ModifierId,	Name,		Type,								Value,	Extra)
select
	ModifierId,		'Amount',	'LinearScaleFromDefaultHandicap',	0,		Extra
from HD_AIYieldScales;

-- AI great person points buff
create temporary table HD_AIGreatPersonPoints (
	ObjectType text not null,
	GreatPersonClassType text not null,
	ModifierId text,
	primary key (ObjectType, GreatPersonClassType)
);
insert or replace into HD_AIGreatPersonPoints
	(ObjectType,					GreatPersonClassType)
values
	('DISTRICT_COMMERCIAL_HUB',		'GREAT_PERSON_CLASS_MERCHANT'),
	('DISTRICT_HARBOR',				'GREAT_PERSON_CLASS_ADMIRAL'),
	('DISTRICT_HOLY_SITE',			'GREAT_PERSON_CLASS_PROPHET'),
	('DISTRICT_CAMPUS',				'GREAT_PERSON_CLASS_SCIENTIST'),
	('DISTRICT_ENCAMPMENT',			'GREAT_PERSON_CLASS_GENERAL'),
	('DISTRICT_THEATER',			'GREAT_PERSON_CLASS_WRITER'),
	('DISTRICT_THEATER',			'GREAT_PERSON_CLASS_ARTIST'),
	('DISTRICT_THEATER',			'GREAT_PERSON_CLASS_MUSICIAN'),
	('DISTRICT_INDUSTRIAL_ZONE',	'GREAT_PERSON_CLASS_ENGINEER');
insert or replace into HD_AIGreatPersonPoints
	(ObjectType,					GreatPersonClassType)
select
	BuildingType,					GreatPersonClassType
from (HD_BuildingTiers b inner join HD_AIGreatPersonPoints a on b.PrereqDistrict = a.ObjectType) where ReplacesOther = 0;
update HD_AIGreatPersonPoints set ModifierId = 'HD_AI_' || ObjectType || '_' || GreatPersonClassType;
insert or replace into BuildingModifiers
	(BuildingType,		ModifierId)
select
	ObjectType,			ModifierId
from HD_AIGreatPersonPoints where ObjectType in (select BuildingType from Buildings);
insert or replace into DistrictModifiers
	(DistrictType,		ModifierId)
select
	ObjectType,			ModifierId
from HD_AIGreatPersonPoints where ObjectType in (select DistrictType from Districts);
insert or replace into Modifiers
	(ModifierId,	ModifierType,											OwnerRequirementSetId)
select
	ModifierId,		'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT',		'PLAYER_IS_HIGH_DIFFICULTY_AI'
from HD_AIGreatPersonPoints;
insert or replace into ModifierArguments
	(ModifierId,	Name,						Value)
select
	ModifierId,		'GreatPersonClassType',		GreatPersonClassType
from HD_AIGreatPersonPoints union all select
	ModifierId,		'Amount',					1
from HD_AIGreatPersonPoints;

-- adjust district priority
update Yields set DefaultValue = 0.333 where YieldType = 'YIELD_GOLD';
update Yields set DefaultValue = 0.667 where YieldType = 'YIELD_FAITH';
insert or replace into AiFavoredItems
	(ListType,				Item,			Favored,	Value) 
values
	('DefaultYieldBias',	'YIELD_FOOD',	1,			10);
update AiFavoredItems set Value = 0 WHERE ListType = 'DefaultYieldBias';
update AiFavoredItems set Value = 0 WHERE ListType = 'ClassicalYields';
update PseudoYields set DefaultValue = 1 where PseudoYieldType like 'PSEUDOYIELD_GPP_%' and PseudoYieldType != 'PSEUDOYIELD_GPP_SCIENTIST';

-- xiaoxiaocat: changes below are not reorganized
-- AiFavoredItems
insert or replace into Strategy_Priorities
	(StrategyType,						ListType)
values
	('STRATEGY_MEDIEVAL_CHANGES',		'DLMedievalDistricts'),
	('STRATEGY_RENAISSANCE_CHANGES',	'DLRenaissanceDistricts');

-- 1. Decrease AI happiness pseudo yield to decrease the value of luxury when buy.
-- 2. Increase AI luxury pseudo yield to increase the value of luxury when sell.
-- 3. Higher improvement pseudo yield to increase the desire for build improvemnts.
-- 4. Make AI less favor to declare war on city states.
insert or replace into AiListTypes (ListType) values
	('DLMedievalDistricts'),
	('DLRenaissanceDistricts'),
	('DLAdjustBuildings'),
	('DLAdjustDistricts'),
	('DLAdjustCivics'),
	('DLAdjustTechs'),
	('DLAdjustUnits'),
	('DLAdjustUnitPCBuilds'),
	('DLFewerWaronCityStates');
insert or replace into AiLists
	(ListType,					LeaderType,					System)
values
	('DLMedievalDistricts',		null,						'Districts'),
	('DLRenaissanceDistricts',	null,						'Districts'),
	('DLAdjustBuildings',		'TRAIT_LEADER_MAJOR_CIV',	'Buildings'),
	('DLAdjustDistricts',		'TRAIT_LEADER_MAJOR_CIV',	'Districts'),
	('DLAdjustCivics',			'TRAIT_LEADER_MAJOR_CIV',	'Civics'),
	('DLAdjustTechs',			'TRAIT_LEADER_MAJOR_CIV',	'Technologies'),
	('DLAdjustUnits',			'TRAIT_LEADER_MAJOR_CIV',	'Units'),
	('DLAdjustUnitPCBuilds',	'TRAIT_LEADER_MAJOR_CIV',	'UnitPromotionClasses'),
	('DLFewerWaronCityStates',	'TRAIT_LEADER_MAJOR_CIV',	'DiplomaticActions');
insert or replace into AiFavoredItems
	(ListType,					Item,									Favored,	Value)
values
	('DLAdjustBuildings',		'BUILDING_GRANARY',						1,			0),
	('DLAdjustBuildings',		'BUILDING_WALLS',						1,			0),
	('DLAdjustBuildings',		'BUILDING_GOV_TALL',					1,			0),
	('DLAdjustBuildings',		'BUILDING_GOV_CITYSTATES',				1,			0),
	('DLAdjustBuildings',		'BUILDING_GOV_FAITH',					1,			0),
	('DLAdjustBuildings',		'BUILDING_GOV_SPIES',					1,			0),
	('DLAdjustDistricts',		'DISTRICT_GOVERNMENT',					1,			0),
	('DLAdjustDistricts',		'DISTRICT_INDUSTRIAL_ZONE',				1,			1000),
    ('DLAdjustTechs',			'TECH_CALENDAR_HD',						1,			0),
    ('DLAdjustTechs',			'TECH_IRON_WORKING',					1,			0),
    ('DLAdjustTechs',			'TECH_CURRENCY',						1,			0),
    ('DLAdjustTechs',			'TECH_EDUCATION',						1,			0),
    ('DLAdjustTechs',			'TECH_CIVIL_ENGINEERING_HD',			1,			0),
    ('DLAdjustTechs',			'TECH_COMPUTERS',						1,			0),
    ('DLAdjustCivics',			'CIVIC_FOREIGN_TRADE',					1,			0),
    ('DLAdjustCivics',			'CIVIC_DRAMA_POETRY',					1,			0),
    ('DLAdjustCivics',			'CIVIC_CIVIL_SERVICE',					1,			0),
    ('DLAdjustCivics',			'CIVIC_HISTORICAL_PHILOSOPHY_HD',		1,			0),
    ('DLAdjustCivics',			'CIVIC_URBANIZATION',					1,			0),
    ('DLAdjustCivics',			'CIVIC_IDEOLOGY',						1,			0),
    ('DLAdjustCivics',			'CIVIC_GLOBALIZATION',					1,			0),
	('DLFewerWaronCityStates',	'DIPLOACTION_DECLARE_WAR_MINOR_CIV',	0,			0),
	('AgressiveDiplomacy',		'DIPLOACTION_DECLARE_WAR_MINOR_CIV',	1,			0);

/*
These Pseudos affect the valuation of Civics and Technologies
However, each is applied to a separate tree respectively, and since the trees are separate they don't clash
Tweaking these probaby would result in a bit different ORDER of selecting civics and techs, but without the details
of the algorithm it is hard to predict results
I determined only that:
a) Each civic and tech has a residual valuation that can be seen when setting those Pseudos to 0
b) The pseudo default value is multiplied by a factor of 30..100 and added to the valuation
c) The bias value (from AiFavoredItems) affects this factor even further, so formula is: factor * def_value * ( 1 + bias_percentage )
UPDATE PseudoYields SET DefaultValue = 5 WHERE PseudoYieldType = 'PSEUDOYIELD_CIVIC';
UPDATE PseudoYields SET DefaultValue = 5 WHERE PseudoYieldType = 'PSEUDOYIELD_TECHNOLOGY';
*/

update PseudoYields set DefaultValue = 3 where PseudoYieldType = 'PSEUDOYIELD_RESOURCE_LUXURY';
update AiFavoredItems set Value = 30 where ListType = 'CatherineAltLuxuries';
update PseudoYields set DefaultValue = 0.2 where PseudoYieldType = 'PSEUDOYIELD_HAPPINESS';

-- For different Leaders 
insert or replace into AiListTypes (ListType) values
	('BarbarossaBuildings'),
	('BarbarossaDistricts'),
	('BarbarossaYields');
insert or replace into AiLists
	(ListType,					LeaderType,							System)
values
	('BarbarossaBuildings',		'TRAIT_LEADER_HOLY_ROMAN_EMPEROR',	'Buildings'),
	('BarbarossaDistricts',		'TRAIT_LEADER_HOLY_ROMAN_EMPEROR',	'Districts'),
	('BarbarossaYields',		'TRAIT_LEADER_HOLY_ROMAN_EMPEROR',	'Yields');
insert or replace into AiFavoredItems
	(ListType,					Item,						Favored,	Value)
values
	('BarbarossaBuildings',		'BUILDING_WORKSHOP',		1,			0),
	('BarbarossaDistricts',		'DISTRICT_HANSA',			1,			0),
	('BarbarossaTechs',			'TECH_IRON_WORKING',		1,			0),
	('BarbarossaTechs',			'TECH_CURRENCY',			1,			0),
	('BarbarossaYields',		'YIELD_FAITH',				1,			-20),
	('BarbarossaYields',		'YIELD_GOLD',				1,			10),
	('BarbarossaYields',		'YIELD_PRODUCTION',			1,			10);
update AiFavoredItems set Item = 'CIVIC_CIVIL_SERVICE' where ListType = 'JadwigaCivics' and Item = 'CIVIC_MERCENARIES';


-- From AI Testing mode.
-------------------------------------
--		AI Related Adjustments	 --
-------------------------------------

update AiOperationDefs set MaxTargetDistInArea = 20, MinOddsOfSuccess = 0.6, MustHaveUnits = 6 where OperationName = 'Attack Enemy City';
update AiOperationDefs set MaxTargetDistInArea = 30, MinOddsOfSuccess = 0.3, MustHaveUnits = 4 where OperationName = 'Wartime Attack Enemy City';
update AiOperationDefs set MaxTargetDistInArea = 20, MinOddsOfSuccess = 0.72, MustHaveUnits = 12 where OperationName = 'Attack Walled City';
update AiOperationDefs set MaxTargetDistInArea = 30, MinOddsOfSuccess = 0.48, MustHaveUnits = 8 where OperationName = 'Wartime Attack Walled City';

insert or replace into AiFavoredItems
	(ListType,					Item,									Favored,	Value)
values
	('DLAdjustCivics',			'CIVIC_CRAFTSMANSHIP',					1,			0),
	('DLAdjustCivics',			'CIVIC_FOREIGN_TRADE',					1,			0),
	('DLAdjustCivics',			'CIVIC_STATE_WORKFORCE',				1,			0),
	('DLAdjustCivics',			'CIVIC_EARLY_EMPIRE',					1,			0),
	('DLAdjustCivics',			'CIVIC_POLITICAL_PHILOSOPHY',			1,			0),
	('DLMedievalDistricts',		'DISTRICT_AQUEDUCT',					1,			0);

-- [Real Strategy]
update AiFavoredItems set Favored = 0, Value = 40 where ListType = 'SettleAllContinents' and Item = 'Foreign Continent'; -- Victoria, down from 120 (!)
update AiFavoredItems set Favored = 0, Value = 40 where ListType = 'PhilipForeignSettlement' and Item = 'Foreign Continent'; -- Philip II, def. 60
update AiFavoredItems set Value = 50 where ListType = 'LastVikingKingNavalPreference' and Item = 'PSEUDOYIELD_UNIT_NAVAL_COMBAT'; -- def. 100

--------------------------------------------------------------
-- Changed based on [MOD] Real Strategy
delete from AiFavoredItems where ListType = 'StandardSettlePlot';
insert or replace into AiFavoredItems
    (ListType, Item, Favored, Value, StringVal, TooltipString)
values
    ('StandardSettlePlot', 'Cultural Pressure', 0, 1, NULL, NULL), -- 1
    ('StandardSettlePlot', 'Cultural Pressure', 1, -6, NULL, NULL), -- -6
    ('StandardSettlePlot', 'Foreign Continent', 1, -4, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_FOREIGN_CONTINENT'), -- -2
    ('StandardSettlePlot', 'Nearest Friendly City', 0, -8, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_NEAREST_CITY'), -- -10, be careful - expansion gives +3, naval +2/4
    ('StandardSettlePlot', 'Fresh Water', 0, 20, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_FRESH_WATER'), -- def
    ('StandardSettlePlot', 'Coastal', 0, 8, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_COAST'), -- 12
    ('StandardSettlePlot', 'Total Yield', 0, 1, 'YIELD_PRODUCTION', 'LOC_SETTLEMENT_RECOMMENDATION_TOTAL_YIELD'), -- 2
    ('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_FOOD',	'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1, RS:1
    ('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_PRODUCTION', 'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- def
    ('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_SCIENCE', 'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1
    ('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_CULTURE', 'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1
    ('StandardSettlePlot', 'Inner Ring Yield', 0, 1, 'YIELD_FAITH',	'LOC_SETTLEMENT_RECOMMENDATION_INNER_YIELD'), -- 1
    ('StandardSettlePlot', 'New Resources', 0, 2, NULL, 'LOC_SETTLEMENT_RECOMMENDATION_NEW_RESOURCES'), -- 4, RS:6
    ('StandardSettlePlot', 'Resource Class', 0, 1, 'RESOURCECLASS_BONUS',	 'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- new, RS:2
    ('StandardSettlePlot', 'Resource Class', 0, 1, 'RESOURCECLASS_LUXURY',	'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- 2
    ('StandardSettlePlot', 'Resource Class', 0, 1, 'RESOURCECLASS_STRATEGIC', 'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- 2, RS:4
    ('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_HORSES', 'LOC_SETTLEMENT_RECOMMENDATION_RESOURCES'), -- 3
    ('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_IRON',	'LOC_SETTLEMENT_RECOMMENDATION_RESOURCES'), -- 5, RS:4
    ('StandardSettlePlot', 'Specific Resource', 0, 2, 'RESOURCE_NITER',	'LOC_SETTLEMENT_RECOMMENDATION_STRATEGIC_RESOURCES'), -- def
    ('StandardSettlePlot', 'Specific Feature', 0, -5, 'FEATURE_ICE', 'LOC_SETTLEMENT_RECOMMENDATION_FEATURES');
--------------------------------------------------------------
-- Updates to Settlement recommendations
UPDATE PlotEvalConditions SET PoorValue =-40, GoodValue =-16 WHERE ConditionType = 'Nearest Friendly City'; -- PoorValue="-50" GoodValue="-20"
UPDATE PlotEvalConditions SET PoorValue =	0, GoodValue =	2 WHERE ConditionType = 'New Resources'; -- PoorValue="0" GoodValue="4"
UPDATE PlotEvalConditions SET PoorValue = 12, GoodValue = 18 WHERE ConditionType = 'Inner Ring Yield'; -- PoorValue="18" GoodValue="26", RS:12~18
UPDATE PlotEvalConditions SET PoorValue = 10, GoodValue = 20 WHERE ConditionType = 'Total Yield'; -- PoorValue="30" GoodValue="50"
UPDATE PlotEvalConditions SET PoorValue = -1, GoodValue =	8 WHERE ConditionType = 'Coastal'; -- PoorValue="-1" GoodValue="12", RS:-1~8
UPDATE PlotEvalConditions SET PoorValue = -1, GoodValue =	2 WHERE ConditionType = 'Specific Resource'; -- PoorValue="-1" GoodValue="6"
UPDATE PlotEvalConditions SET PoorValue = -6, GoodValue =	6 WHERE ConditionType = 'Specific Feature'; -- PoorValue="-5" GoodValue="5"
UPDATE PlotEvalConditions SET PoorValue =	1, GoodValue =	3 WHERE ConditionType = 'Resource Class'; -- PoorValue="2" GoodValue="6"
UPDATE PlotEvalConditions SET PoorValue = -4, GoodValue = 15 WHERE ConditionType = 'Foreign Continent'; -- PoorValue="-2" GoodValue="50"

--------------------------------------------------------------
-- See also [MOD] Real Strategy
insert or replace into PseudoYields
    (PseudoYieldType,                       DefaultValue)
values
    ('PSEUDOYIELD_CITY_ORIGINAL_CAPITAL',   150),
    ('PSEUDOYIELD_CLEAR_BANDIT_CAMPS',      1.5),
-- infrastructure & various
    ('PSEUDOYIELD_IMPROVEMENT',             5.0),
    ('PSEUDOYIELD_INFLUENCE',               0.75),
    ('PSEUDOYIELD_NUCLEAR_WEAPON',          30),
    ('PSEUDOYIELD_STANDING_ARMY_NUMBER',    1.25),
    ('PSEUDOYIELD_STANDING_ARMY_VALUE',     0.13),
    ('PSEUDOYIELD_TOURISM',                 0),
-- Changed based on Real Strategy
    ('PSEUDOYIELD_UNIT_COMBAT',             1.4),
    ('PSEUDOYIELD_UNIT_EXPLORER',           1.1),
    ('PSEUDOYIELD_UNIT_RELIGIOUS',          0.75),
    ('PSEUDOYIELD_UNIT_SETTLER',            1.2),
    ('PSEUDOYIELD_UNIT_TRADE',              4.0),

    ('PSEUDOYIELD_GOLDENAGE_POINT',         2.0),
    ('PSEUDOYIELD_GOVERNOR',                4.0),
    ('PSEUDOYIELD_WONDER',                  1.0),
    ('PSEUDOYIELD_DISTRICT',                6.0),
    ('PSEUDOYIELD_UNIT_SPY',                10.0),
    ('PSEUDOYIELD_DIPLOMATIC_GRIEVANCE',    -0.25);