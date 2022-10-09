-------------------------------------
--      Districts Adjustments      --
-------------------------------------

-------------------------------------------------------------------------------
-- Expert yield & great person points
-------------------------------------------------------------------------------
-- Add citizen great person points yields (NOTE: 1 represents 2 points).
insert or replace into District_CitizenGreatPersonPoints
	(DistrictType,						GreatPersonClassType,				PointsPerTurn)
values
	("DISTRICT_CAMPUS",					"GREAT_PERSON_CLASS_SCIENTIST",		2),
	("DISTRICT_COMMERCIAL_HUB",			"GREAT_PERSON_CLASS_MERCHANT",		2),
	("DISTRICT_ENCAMPMENT",				"GREAT_PERSON_CLASS_GENERAL",		2),
	("DISTRICT_HARBOR",					"GREAT_PERSON_CLASS_ADMIRAL",		2),
	("DISTRICT_HOLY_SITE",				"GREAT_PERSON_CLASS_PROPHET",		2),
	("DISTRICT_INDUSTRIAL_ZONE",		"GREAT_PERSON_CLASS_ENGINEER",		2),
	("DISTRICT_THEATER",				"GREAT_PERSON_CLASS_WRITER",		2),
	("DISTRICT_THEATER",				"GREAT_PERSON_CLASS_ARTIST",		2),
	("DISTRICT_THEATER",				"GREAT_PERSON_CLASS_MUSICIAN",		2);

-- UD support
insert or ignore into District_CitizenGreatPersonPoints (DistrictType, GreatPersonClassType, PointsPerTurn)
select b.CivUniqueDistrictType,	a.GreatPersonClassType,	a.PointsPerTurn
from District_CitizenGreatPersonPoints a, DistrictReplaces b where a.DistrictType = b.ReplacesDistrictType;

insert or replace into District_CitizenGreatPersonPoints
	(DistrictType,						GreatPersonClassType,				PointsPerTurn)
values
	("DISTRICT_LAVRA",					"GREAT_PERSON_CLASS_PROPHET",		1),
	("DISTRICT_LAVRA",					"GREAT_PERSON_CLASS_WRITER",		1),
	("DISTRICT_LAVRA",					"GREAT_PERSON_CLASS_ARTIST",		1),
	("DISTRICT_LAVRA",					"GREAT_PERSON_CLASS_MUSICIAN",		1);

----------------------------------------
-- increase citizen slot for districts
update Districts set CitizenSlots = 1 
 where DistrictType = 'DISTRICT_CAMPUS'
 	or DistrictType = 'DISTRICT_COMMERCIAL_HUB'
 	or DistrictType = 'DISTRICT_ENCAMPMENT'
 	or DistrictType = 'DISTRICT_HARBOR'
 	or DistrictType = 'DISTRICT_HOLY_SITE'
 	or DistrictType = 'DISTRICT_INDUSTRIAL_ZONE'
 	or DistrictType = 'DISTRICT_THEATER';

-- UD support
update Districts set CitizenSlots = 1 where DistrictType in 
(select CivUniqueDistrictType from DistrictReplaces 
 where ReplacesDistrictType = 'DISTRICT_CAMPUS'
 	or ReplacesDistrictType = 'DISTRICT_COMMERCIAL_HUB'
 	or ReplacesDistrictType = 'DISTRICT_ENCAMPMENT'
 	or ReplacesDistrictType = 'DISTRICT_HARBOR'
 	or ReplacesDistrictType = 'DISTRICT_HOLY_SITE'
 	or ReplacesDistrictType = 'DISTRICT_INDUSTRIAL_ZONE'
 	or ReplacesDistrictType = 'DISTRICT_THEATER');

update Districts set CitizenSlots = 4 where DistrictType = 'DISTRICT_SEOWON';
-- increase citizen slot for Neighbourhood
update Districts set CitizenSlots = 4, Cost = 90, Housing = 3, Description = 'LOC_DISTRICT_NEIGHBORHOOD_HD_DESCRIPTION' where DistrictType = 'DISTRICT_NEIGHBORHOOD';
update Districts set CitizenSlots = 4 where DistrictType in 
(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_NEIGHBORHOOD');

----------------------------------------
-- Expert yield
update District_CitizenYieldChanges set YieldChange = 2 where DistrictType = 'DISTRICT_HARBOR' and YieldType = 'YIELD_FOOD';
delete from District_CitizenYieldChanges where DistrictType = 'DISTRICT_HARBOR' and YieldType = 'YIELD_GOLD';

delete from District_CitizenYieldChanges where (DistrictType = 'DISTRICT_ENCAMPMENT' or DistrictType = 'DISTRICT_IKANDA' or DistrictType = 'DISTRICT_THANH') and YieldType = 'YIELD_GOLD';

insert or replace into District_CitizenYieldChanges
	(DistrictType,				YieldType,			YieldChange)
values
	('DISTRICT_NEIGHBORHOOD',	'YIELD_PRODUCTION',	1),
	('DISTRICT_NEIGHBORHOOD',	'YIELD_FOOD',		1),
	('DISTRICT_ENCAMPMENT',		'YIELD_FOOD',		1);

delete from District_CitizenYieldChanges where ((YieldType = 'YIELD_GOLD') or (YieldType = 'YIELD_FOOD')) and
(DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR'));

insert or ignore into District_CitizenYieldChanges  (DistrictType,	YieldType,	YieldChange)
select b.CivUniqueDistrictType,	a.YieldType,	a.YieldChange from District_CitizenYieldChanges a, DistrictReplaces b
where a.DistrictType = b.ReplacesDistrictType;

----------------------------------------
-- reduce the great person points of District base
update District_GreatPersonPoints set PointsPerTurn = PointsPerTurn - 1 where DistrictType != 'DISTRICT_HOLY_SITE';
update District_GreatPersonPoints set PointsPerTurn = PointsPerTurn + 1 where 
	DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HOLY_SITE');

-------------------------------------------------------------------------------
-- Properties
-------------------------------------------------------------------------------
-- [Unlock]
-- Canal
update Districts set PrereqTech = 'TECH_MASS_PRODUCTION' where DistrictType = 'DISTRICT_CANAL';
-- Harbor
update Districts set PrereqTech = 'TECH_SAILING' where DistrictType = 'DISTRICT_HARBOR' 
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_HARBOR');
-- Commercial hub
update Districts set PrereqTech = NULL, PrereqCivic = 'CIVIC_FOREIGN_TRADE' where DistrictType = 'DISTRICT_COMMERCIAL_HUB'
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_COMMERCIAL_HUB');
-- Industrial Zone
update Districts set PrereqTech = 'TECH_IRON_WORKING' where DistrictType = 'DISTRICT_INDUSTRIAL_ZONE'
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_INDUSTRIAL_ZONE');
-- WATER_ENTERTAINMENT_COMPLEX
update Districts set PrereqTech = NULL, PrereqCivic = 'CIVIC_CIVIL_ENGINEERING' where DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX'
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX');
update Districts set PrereqTech = NULL, PrereqCivic = 'CIVIC_FEUDALISM' where DistrictType = 'DISTRICT_NEIGHBORHOOD'
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_NEIGHBORHOOD');
-- UD

-- [Require pop]
update Districts set RequiresPopulation = 0 where DistrictType = 'DISTRICT_AERODROME'
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_AERODROME');
update Districts set RequiresPopulation = 0 where DistrictType = 'DISTRICT_PRESERVE'
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_PRESERVE');

-- Happiness adjust
update Districts set Entertainment = 3 where DistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX' or DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
update Districts set Entertainment = 4 where DistrictType in (select CivUniqueDistrictType from DistrictReplaces
		where ReplacesDistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX' or ReplacesDistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX');

update Districts set Maintenance = 50 where DistrictType = 'DISTRICT_SPACEPORT';

-------------------------------------------------------------------------------
-- Modifiers
-------------------------------------------------------------------------------
-- habor gives +10% production towards naval units. (cothon gives 30%)
-- Encampment gives +10% production towards land military units. (Ikanda gives 30%)
insert or replace into DistrictModifiers
	(DistrictType,						ModifierId)
values
	-- Yield Modifiers
	('DISTRICT_HARBOR',					'HARBOR_ADD_FISHING_BOATS_FOOD'),
	('DISTRICT_HARBOR',					'LIGHTHOUSE_COASTAL_CITY_HOUSING'),
	('DISTRICT_HARBOR',					'HARBOR_CITY_NAVAL_UNIT_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_ADD_MINE_BONUS_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION'),
	('DISTRICT_ENCAMPMENT',				'HD_ENCAMPMENT_ADD_STRATEGIC_SCIENCE'),
	('DISTRICT_COMMERCIAL_HUB',			'COMMERCIAL_HUB_BONUS_PASTURE_FOOD'),
	('DISTRICT_COMMERCIAL_HUB',			'DOSMESTIC_TRADE_ROUTE_GOLD_BONUS'),
	('DISTRICT_COMMERCIAL_HUB',			'INTERNATIONAL_TRADE_ROUTE_SCIENCE_BONUS'),
	('DISTRICT_INDUSTRIAL_ZONE',		'INDUSTRIAL_ZONE_ADD_QUARRY_BONUS_PRODUCTION'),
	('DISTRICT_INDUSTRIAL_ZONE',		'INDUSTRIAL_ZONE_ADD_LUMBER_MILL_BONUS_PRODUCTION'),
	('DISTRICT_AQUEDUCT',				'AQUEDUCT_ADD_FRESH_FARM_FOOD'),
	('DISTRICT_CANAL',					'CANAL_ADJACENT_GOLD'),
	('DISTRICT_DAM',					'DAM_ADJACENT_FARM_FOOD'),
	('DISTRICT_AERODROME',				'AERODROME_AIR_UNIT_PRODUCTION'),
	-- UD
	('DISTRICT_ROYAL_NAVY_DOCKYARD',	'HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION'),
	('DISTRICT_IKANDA',					'IKANDA_CITY_MILITARY_UNIT_PRODUCTION'),
	('DISTRICT_IKANDA',					'IKANDA_CITY_NAVAL_UNIT_PRODUCTION'),
	('DISTRICT_IKANDA',					'IKANDA_CITY_ANTI_CAVALRY_MOVEMENT_BONUS'),
	('DISTRICT_HANSA',					'HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION');

-- support for ud
insert or ignore into DistrictModifiers   (DistrictType,	ModifierId)
select b.CivUniqueDistrictType,	a.ModifierId from DistrictModifiers a, DistrictReplaces b
where a.DistrictType = b.ReplacesDistrictType;
delete from DistrictModifiers where DistrictType = 'DISTRICT_HANSA' and ModifierId = 'HD_INDUSTRIAL_ZONE_POP_PRODUCTION';
delete from DistrictModifiers where DistrictType = 'DISTRICT_COTHON' and ModifierId = 'HARBOR_CITY_NAVAL_UNIT_PRODUCTION';
delete from DistrictModifiers where DistrictType = 'DISTRICT_IKANDA' and ModifierId = 'ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION';
delete from DistrictModifiers where DistrictType = 'DISTRICT_IKANDA' and ModifierId = 'ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION';


insert or replace into Modifiers
	(ModifierId,									ModifierType)
values
	('HARBOR_CITY_NAVAL_UNIT_PRODUCTION',			'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	('AERODROME_AIR_UNIT_PRODUCTION',				'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	('HD_INDUSTRIAL_ZONE_POP_PRODUCTION',  			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION'),
	-- Encampment
	('HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION',	'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_ACCUMULATION'),
	('ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION',	'MODIFIER_SINGLE_CITY_ADJUST_MILITARY_UNITS_PRODUCTION'),
	('ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION',		'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	('IKANDA_CITY_MILITARY_UNIT_PRODUCTION',		'MODIFIER_SINGLE_CITY_ADJUST_MILITARY_UNITS_PRODUCTION'),
	('IKANDA_CITY_NAVAL_UNIT_PRODUCTION',			'MODIFIER_CITY_ADJUST_UNIT_DOMAIN_PRODUCTION'),
	('IKANDA_CITY_ANTI_CAVALRY_MOVEMENT_BONUS',		'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS'),
	('DOSMESTIC_TRADE_ROUTE_GOLD_BONUS',			'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
	('INTERNATIONAL_TRADE_ROUTE_SCIENCE_BONUS',		'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
	('DIPLOMATIC_QUARTER_DUPLICATE_FIRST_INFLUENCE', 'MODIFIER_PLAYER_ADJUST_DUPLICATE_FIRST_INFLUENCE_TOKEN'),
	('DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY',		'MODIFIER_PLAYER_GRANT_SPY');

update Modifiers set Permanent = 1 where ModifierId = 'IKANDA_CITY_ANTI_CAVALRY_MOVEMENT_BONUS';

insert or replace into Modifiers
	(ModifierId,										ModifierType,									SubjectRequirementSetId)
values
	-- Yield Modifiers
	('HARBOR_ADD_FISHING_BOATS_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
	('ENCAMPMENT_ADD_MINE_BONUS_PRODUCTION',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_MINE_BONUS'),
	('HD_ENCAMPMENT_ADD_STRATEGIC_SCIENCE',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'PLOT_HAS_STRATEGIC_IMPROVED_REQUIREMENTS'),
	('COMMERCIAL_HUB_BONUS_PASTURE_FOOD',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HD_PLOT_HAS_PASTURE_OVER_BONUS_RESOURCES'),
	-- Aqueduct
	('AQUEDUCT_ADD_FRESH_FARM_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'REQUIREMENTS_PLOT_HAS_FARM'),
	('INDUSTRIAL_ZONE_ADD_QUARRY_BONUS_PRODUCTION',		'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_QUARRY_BONUS'),
	('INDUSTRIAL_ZONE_ADD_LUMBER_MILL_BONUS_PRODUCTION','MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_LUMBER_MILL_BONUS'),
	('HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'HANSA_ADJACENT_PRODUCTION_RESOURCE_REQUIREMENTS'),
	('CANAL_ADJACENT_GOLD',								'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('DAM_ADJACENT_FARM_FOOD',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'PLOT_IS_IMPROVED_ADJACENT');

insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
values
	-- Yield Modifiers
	('HARBOR_ADD_FISHING_BOATS_FOOD',					'YieldType',	'YIELD_FOOD'),
	('HARBOR_ADD_FISHING_BOATS_FOOD',					'Amount',		1),
	('ENCAMPMENT_ADD_MINE_BONUS_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_MINE_BONUS_PRODUCTION',			'Amount',		1),
	('INDUSTRIAL_ZONE_ADD_QUARRY_BONUS_PRODUCTION',		'YieldType',	'YIELD_PRODUCTION'),
	('INDUSTRIAL_ZONE_ADD_QUARRY_BONUS_PRODUCTION',		'Amount',		1),
	('INDUSTRIAL_ZONE_ADD_LUMBER_MILL_BONUS_PRODUCTION','YieldType',	'YIELD_PRODUCTION'),
	('INDUSTRIAL_ZONE_ADD_LUMBER_MILL_BONUS_PRODUCTION','Amount',		1),
	('HD_ENCAMPMENT_ADD_STRATEGIC_SCIENCE',				'YieldType',	'YIELD_SCIENCE'),
	('HD_ENCAMPMENT_ADD_STRATEGIC_SCIENCE',				'Amount',		1),
	('COMMERCIAL_HUB_BONUS_PASTURE_FOOD',				'YieldType',	'YIELD_FOOD'),
	('COMMERCIAL_HUB_BONUS_PASTURE_FOOD',				'Amount',		1),
	-- Aqueduct
	('AQUEDUCT_ADD_FRESH_FARM_FOOD',					'YieldType',	'YIELD_FOOD'),
	('AQUEDUCT_ADD_FRESH_FARM_FOOD',					'Amount',		1),
	--
	('HD_INDUSTRIAL_ZONE_POP_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('HD_INDUSTRIAL_ZONE_POP_PRODUCTION',				'Amount',		0.5),
	('HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
	('HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION',			'Amount',		1),
	--
	('DOSMESTIC_TRADE_ROUTE_GOLD_BONUS',				'YieldType',	'YIELD_GOLD'),
	('DOSMESTIC_TRADE_ROUTE_GOLD_BONUS',				'Amount',		2),
	('INTERNATIONAL_TRADE_ROUTE_SCIENCE_BONUS',			'YieldType',	'YIELD_GOLD'),
	('INTERNATIONAL_TRADE_ROUTE_SCIENCE_BONUS',			'Amount',		2),
	-- Military
	('HARBOR_CITY_NAVAL_UNIT_PRODUCTION',				'Domain',		'DOMAIN_SEA'),
	('HARBOR_CITY_NAVAL_UNIT_PRODUCTION',				'Amount',		10),
	('AERODROME_AIR_UNIT_PRODUCTION',					'Domain',		'DOMAIN_AIR'),
	('AERODROME_AIR_UNIT_PRODUCTION',					'Amount',		25),
	-- Note(TODO): ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION - ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION, still remains air units.
	('ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION',		'Amount',		10),
	('ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION',			'Domain',		'DOMAIN_SEA'),
	('ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION',			'Amount',		-10),
	('HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION', 'Amount',		2),
	('IKANDA_CITY_MILITARY_UNIT_PRODUCTION',			'Amount',		30),
	('IKANDA_CITY_NAVAL_UNIT_PRODUCTION',				'Domain',		'DOMAIN_SEA'),
	('IKANDA_CITY_NAVAL_UNIT_PRODUCTION',				'Amount',		-30),
	('IKANDA_CITY_ANTI_CAVALRY_MOVEMENT_BONUS',			'AbilityType',	'ABILITY_IKANDA_ANTI_CAVALRY_MOVEMENT_BONUS'),
	('DIPLOMATIC_QUARTER_DUPLICATE_FIRST_INFLUENCE',	'Amount',		1),
	('DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY',			'Amount',		1),
	('CANAL_ADJACENT_GOLD',								'YieldType',	'YIELD_GOLD'),
	('CANAL_ADJACENT_GOLD',								'Amount',		3),
	('DAM_ADJACENT_FARM_FOOD',							'YieldType',	'YIELD_FOOD,YIELD_PRODUCTION'),
	('DAM_ADJACENT_FARM_FOOD',							'Amount',		'1,1');

update ModifierArguments set Value = 30 where ModifierId = 'COTHON_NAVAL_UNIT_PRODUCTION' and Name = 'Amount';

-- Culture bombs [for Great Eng]
insert or replace into Modifiers (ModifierId, ModifierType, RunOnce, Permanent)
select 'CULTURE_BOMB_TRIGGER_' || DistrictType , 'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', 1, 1 from Districts;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'CULTURE_BOMB_TRIGGER_' || DistrictType, 'DistrictType', DistrictType from Districts;

-- MBANZA
update Districts set PrereqCivic = 'CIVIC_STATE_WORKFORCE', Cost = 90, Appeal = 1, Housing = 3 where DistrictType = 'DISTRICT_MBANZA';

delete from DistrictModifiers where ModifierId in ('MBANZA_FOOD','MBANZA_GOLD') and DistrictType = 'DISTRICT_MBANZA';

insert or replace into DistrictModifiers
	(DistrictType,						ModifierId)
values
	('DISTRICT_MBANZA',					'MBANZA_ADD_ADJACENT_FOOD'),
	('DISTRICT_MBANZA',					'SHRINE_BUILDER_PURCHASE'),
	('DISTRICT_MBANZA',					'TEMPLE_SETTLER_PURCHASE');

insert or replace into Modifiers
	(ModifierId,							ModifierType,											SubjectRequirementSetId)
values
	('MBANZA_ADD_ADJACENT_FOOD',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',					'MBANZA_ADJACENCY_FOOD_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('MBANZA_ADD_ADJACENT_FOOD',			'YieldType',	'YIELD_FOOD'),
	('MBANZA_ADD_ADJACENT_FOOD',			'Amount',		1);

insert or replace into RequirementSets
	(RequirementSetId,							RequirementSetType)
values
	('MBANZA_ADJACENCY_FOOD_REQUIREMENTS',		'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,							RequirementId)
values
	('MBANZA_ADJACENCY_FOOD_REQUIREMENTS',		'ADJACENT_TO_OWNER');

-- 巴西UD改动, by xiaoxiao
insert or replace into Modifiers
	(ModifierId,								ModifierType,										SubjectRequirementSetId,	OwnerStackLimit)
select
	'HD_BRAZIL_UD_' || GreatPersonClassType,	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'DISTRICT_IS_BRAZIL_UD',	1
from GreatPersonClasses;
insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
select
	'HD_BRAZIL_UD_' || GreatPersonClassType,		'Amount',		1
from GreatPersonClasses;
insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values	
	('HD_BRAZIL_UD_GREAT_PERSON_CLASS_GENERAL',		'YieldType',	'YIELD_PRODUCTION'),
	('HD_BRAZIL_UD_GREAT_PERSON_CLASS_ADMIRAL',		'YieldType',	'YIELD_FOOD'),
	('HD_BRAZIL_UD_GREAT_PERSON_CLASS_ENGINEER',	'YieldType',	'YIELD_PRODUCTION'),
	('HD_BRAZIL_UD_GREAT_PERSON_CLASS_MERCHANT',	'YieldType',	'YIELD_GOLD'),
	('HD_BRAZIL_UD_GREAT_PERSON_CLASS_PROPHET',		'YieldType',	'YIELD_FAITH'),
	('HD_BRAZIL_UD_GREAT_PERSON_CLASS_SCIENTIST',	'YieldType',	'YIELD_SCIENCE'),
	('HD_BRAZIL_UD_GREAT_PERSON_CLASS_WRITER',		'YieldType',	'YIELD_CULTURE'),
	('HD_BRAZIL_UD_GREAT_PERSON_CLASS_ARTIST',		'YieldType',	'YIELD_CULTURE'),
	('HD_BRAZIL_UD_GREAT_PERSON_CLASS_MUSICIAN',	'YieldType',	'YIELD_CULTURE');
insert or replace into RequirementSets
	(RequirementSetId,			RequirementSetType)
values
	('DISTRICT_IS_BRAZIL_UD',	'REQUIREMENTSET_TEST_ANY');
insert or replace into RequirementSetRequirements
	(RequirementSetId,			RequirementId)
values
	('DISTRICT_IS_BRAZIL_UD',	'REQUIRES_DISTRICT_IS_DISTRICT_STREET_CARNIVAL'),
	('DISTRICT_IS_BRAZIL_UD',	'REQUIRES_DISTRICT_IS_DISTRICT_WATER_STREET_CARNIVAL');
