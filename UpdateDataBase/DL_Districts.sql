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
 	-- or DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER'
 	-- or DistrictType = 'DISTRICT_GOVERNMENT';

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
update Districts set CitizenSlots = 5 where DistrictType = 'DISTRICT_NEIGHBORHOOD';
update Districts set CitizenSlots = 5 where DistrictType in 
(select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_NEIGHBORHOOD');

----------------------------------------
-- Expert yield
update District_CitizenYieldChanges set YieldChange = 2 where DistrictType = 'DISTRICT_HARBOR' and YieldType = 'YIELD_FOOD';
delete from District_CitizenYieldChanges where DistrictType = 'DISTRICT_HARBOR' and YieldType = 'YIELD_GOLD';

insert or replace into District_CitizenYieldChanges
	(DistrictType,				YieldType,			YieldChange)
values
	('DISTRICT_NEIGHBORHOOD',	'YIELD_PRODUCTION',	1);
	-- ('DISTRICT_GOVERNMENT',	'YIELD_SCIENCE',	1),
	-- ('DISTRICT_GOVERNMENT',	'YIELD_CULTURE',	1);

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
update Districts set PrereqTech = NULL, PrereqCivic = 'CIVIC_CIVIL_ENGINEERING' where DistrictType = 'DISTRICT_NEIGHBORHOOD'
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_NEIGHBORHOOD');
-- UD
update Districts set PrereqCivic = 'CIVIC_FEUDALISM' where DistrictType = 'DISTRICT_MBANZA';

-- [Require pop]
update Districts set RequiresPopulation = 0 where DistrictType = 'DISTRICT_AERODROME'
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_AERODROME');
update Districts set RequiresPopulation = 0 where DistrictType = 'DISTRICT_PRESERVE'
	or DistrictType in (select CivUniqueDistrictType from DistrictReplaces where ReplacesDistrictType = 'DISTRICT_PRESERVE');

-- Happiness adjust
update Districts set Entertainment = 3 where DistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX' or DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
update Districts set Entertainment = 4 where DistrictType in (select CivUniqueDistrictType from DistrictReplaces
		where ReplacesDistrictType = 'DISTRICT_ENTERTAINMENT_COMPLEX' or ReplacesDistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX');

-- update Districts set Maintenance = Maintenance * 2 where InternalOnly = 0;
update Districts set Maintenance = 50 where DistrictType = 'DISTRICT_SPACEPORT';

-- update Districts set Appeal = 2 where DistrictType = 'DISTRICT_PRESERVE';

-- delete from District_RequiredFeatures where DistrictType = 'DISTRICT_DAM';
-- delete from District_RequiredFeatures where DistrictType = 'DISTRICT_DAM';
-- update Districts_XP2 set OnePerRiver = 0 where DistrictType = 'DISTRICT_DAM';

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
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_ADD_STONE_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_ADD_COPPER_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_CITY_MILITARY_UNIT_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'ENCAMPMENT_CITY_NAVAL_UNIT_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',				'HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION'),
	('DISTRICT_COMMERCIAL_HUB',			'COMMERCIAL_HUB_BONUS_PASTURE_FOOD'),
	-- ('DISTRICT_COMMERCIAL_HUB',			'COMMERCIAL_HUB_PASTURE_GOLD'),
	('DISTRICT_COMMERCIAL_HUB',			'DOSMESTIC_TRADE_ROUTE_GOLD_BONUS'),
	('DISTRICT_COMMERCIAL_HUB',			'INTERNATIONAL_TRADE_ROUTE_SCIENCE_BONUS'),
	('DISTRICT_COMMERCIAL_HUB',			'INTERNATIONAL_TRADE_ROUTE_CULTURE_BONUS'),
	('DISTRICT_INDUSTRIAL_ZONE',		'HD_INDUSTRIAL_ZONE_POP_PRODUCTION'),
	('DISTRICT_AQUEDUCT',				'AQUEDUCT_ADD_FRESH_FARM_FOOD'),
	('DISTRICT_AQUEDUCT',				'AQUEDUCT_ADD_AQUEDUCT_FARM_FOOD'),
	('DISTRICT_AQUEDUCT',				'AQUEDUCT_REMOVE_FRESH_AND_AQUEDUCT_FARM_FOOD'),
	('DISTRICT_CANAL',					'CANAL_ADJACENT_GOLD'),
	('DISTRICT_DAM',					'DAM_ADJACENT_FARM_FOOD'),
	('DISTRICT_DAM',					'DAM_ADJACENT_PLANTATION_FOOD'),
	('DISTRICT_AERODROME',				'AERODROME_AIR_UNIT_PRODUCTION'),
	-- UD
	('DISTRICT_ROYAL_NAVY_DOCKYARD',	'HD_ENCAMPMENT_ADD_STRATEGIC_RESOURCE_ACCUMULATION'),
	('DISTRICT_IKANDA',					'IKANDA_CITY_MILITARY_UNIT_PRODUCTION'),
	('DISTRICT_IKANDA',					'IKANDA_CITY_NAVAL_UNIT_PRODUCTION'),
	('DISTRICT_IKANDA',					'IKANDA_CITY_ANTI_CAVALRY_MOVEMENT_BONUS'),
	('DISTRICT_HANSA',					'HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION'),
	('DISTRICT_MBANZA',					'MBANZA_ADD_ADJACENT_JUNGLE_FOOD'),
	('DISTRICT_MBANZA',					'MBANZA_ADD_ADJACENT_FOREST_FOOD'),
	-- Mbanza enable purchase of builder and settler as Kongo cannot build holy site.
	('DISTRICT_MBANZA',					'SHRINE_BUILDER_PURCHASE'),
	('DISTRICT_MBANZA',					'TEMPLE_SETTLER_PURCHASE');

insert or replace into DistrictModifiers
	(DistrictType,						ModifierId)
select
	'DISTRICT_INDUSTRIAL_ZONE',			'HD_INDUSTRIAL_ZONE_PEAT_PRODUCTION'
where exists (select ResourceType from Resources where ResourceType = 'RESOURCE_JNR_PEAT');

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
	('DOSMESTIC_TRADE_ROUTE_FOOD_BONUS',			'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
	('DOSMESTIC_TRADE_ROUTE_PRODUCTION_BONUS',		'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
	('INTERNATIONAL_TRADE_ROUTE_SCIENCE_BONUS',		'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
	('INTERNATIONAL_TRADE_ROUTE_CULTURE_BONUS',		'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
	('DIPLOMATIC_QUARTER_DUPLICATE_FIRST_INFLUENCE', 'MODIFIER_PLAYER_ADJUST_DUPLICATE_FIRST_INFLUENCE_TOKEN'),
	('DIPLOMATIC_QUARTER_GRANTS_SPY_CAPACITY',		'MODIFIER_PLAYER_GRANT_SPY');

update Modifiers set Permanent = 1 where ModifierId = 'IKANDA_CITY_ANTI_CAVALRY_MOVEMENT_BONUS';

insert or replace into Modifiers
	(ModifierId,										ModifierType,									SubjectRequirementSetId)
values
	-- Yield Modifiers
	('HARBOR_ADD_FISHING_BOATS_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
	('ENCAMPMENT_ADD_STONE_PRODUCTION',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_STONE'),
	('ENCAMPMENT_ADD_COPPER_PRODUCTION',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HAS_IMPROVED_COPPER'),
	('COMMERCIAL_HUB_BONUS_PASTURE_FOOD',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HD_PLOT_HAS_PASTURE_OVER_BONUS_RESOURCES'),
	-- ('COMMERCIAL_HUB_PASTURE_GOLD',						'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HD_PLOT_HAS_PASTURE'),
	-- Aqueduct
	('AQUEDUCT_ADD_FRESH_FARM_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'IS_FARM_ADJACENT_TO_FRESH_WATER'),
	('AQUEDUCT_ADD_AQUEDUCT_FARM_FOOD',					'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'IS_FARM_ADJACENT_TO_AQUEDUCT'),
	('AQUEDUCT_REMOVE_FRESH_AND_AQUEDUCT_FARM_FOOD',	'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'IS_FARM_ADJACENT_TO_FRESH_WATER_AND_AQUEDUCT'),
	-- 
	('HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'HANSA_ADJACENT_PRODUCTION_RESOURCE_REQUIREMENTS'),
	-- Mbanza
	('MBANZA_ADD_ADJACENT_JUNGLE_FOOD',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'MBANZA_ADJACENCY_FOOD_JUNGLE_REQUIREMENTS'),
	('MBANZA_ADD_ADJACENT_FOREST_FOOD',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'MBANZA_ADJACENCY_FOOD_FOREST_REQUIREMENTS'),
	('CANAL_ADJACENT_GOLD',								'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('DAM_ADJACENT_FARM_FOOD',							'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'ADJACENT_FARM_REQUIREMENTS'),
	('DAM_ADJACENT_PLANTATION_FOOD',					'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',			'ADJACENT_PLANTATION_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
values
	-- Yield Modifiers
	('HARBOR_ADD_FISHING_BOATS_FOOD',					'YieldType',	'YIELD_FOOD'),
	('HARBOR_ADD_FISHING_BOATS_FOOD',					'Amount',		1),
	('ENCAMPMENT_ADD_STONE_PRODUCTION',					'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_STONE_PRODUCTION',					'Amount',		1),
	('ENCAMPMENT_ADD_COPPER_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('ENCAMPMENT_ADD_COPPER_PRODUCTION',				'Amount',		1),
	('COMMERCIAL_HUB_BONUS_PASTURE_FOOD',				'YieldType',	'YIELD_FOOD'),
	('COMMERCIAL_HUB_BONUS_PASTURE_FOOD',				'Amount',		1),
	-- ('COMMERCIAL_HUB_PASTURE_GOLD',						'YieldType',	'YIELD_GOLD'),
	-- ('COMMERCIAL_HUB_PASTURE_GOLD',						'Amount',		2),
	-- Aqueduct
	('AQUEDUCT_ADD_FRESH_FARM_FOOD',					'YieldType',	'YIELD_FOOD'),
	('AQUEDUCT_ADD_FRESH_FARM_FOOD',					'Amount',		1),
	('AQUEDUCT_ADD_AQUEDUCT_FARM_FOOD',					'YieldType',	'YIELD_FOOD'),
	('AQUEDUCT_ADD_AQUEDUCT_FARM_FOOD',					'Amount',		1),
	('AQUEDUCT_REMOVE_FRESH_AND_AQUEDUCT_FARM_FOOD',	'YieldType',	'YIELD_FOOD'),
	('AQUEDUCT_REMOVE_FRESH_AND_AQUEDUCT_FARM_FOOD',	'Amount',		-1),
	--
	('HD_INDUSTRIAL_ZONE_POP_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
	('HD_INDUSTRIAL_ZONE_POP_PRODUCTION',				'Amount',		0.5),
	('HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
	('HANSA_ADD_ADJACENT_RESOURCE_PRODUCTION',			'Amount',		1),
	-- 
	('MBANZA_ADD_ADJACENT_JUNGLE_FOOD',					'YieldType',	'YIELD_FOOD'),
	('MBANZA_ADD_ADJACENT_JUNGLE_FOOD',					'Amount',		1),
	('MBANZA_ADD_ADJACENT_FOREST_FOOD',					'YieldType',	'YIELD_FOOD'),
	('MBANZA_ADD_ADJACENT_FOREST_FOOD',					'Amount',		1),
	--
	('DOSMESTIC_TRADE_ROUTE_GOLD_BONUS',				'YieldType',	'YIELD_GOLD'),
	('DOSMESTIC_TRADE_ROUTE_GOLD_BONUS',				'Amount',		2),
	('DOSMESTIC_TRADE_ROUTE_FOOD_BONUS',				'YieldType',	'YIELD_FOOD'),
	('DOSMESTIC_TRADE_ROUTE_FOOD_BONUS',				'Amount',		1),
	('DOSMESTIC_TRADE_ROUTE_PRODUCTION_BONUS',			'YieldType',	'YIELD_PRODUCTION'),
	('DOSMESTIC_TRADE_ROUTE_PRODUCTION_BONUS',			'Amount',		1),
	('INTERNATIONAL_TRADE_ROUTE_SCIENCE_BONUS',			'YieldType',	'YIELD_SCIENCE'),
	('INTERNATIONAL_TRADE_ROUTE_SCIENCE_BONUS',			'Amount',		1),
	('INTERNATIONAL_TRADE_ROUTE_CULTURE_BONUS',			'YieldType',	'YIELD_CULTURE'),
	('INTERNATIONAL_TRADE_ROUTE_CULTURE_BONUS',			'Amount',		1),
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
	('DAM_ADJACENT_FARM_FOOD',							'YieldType',	'YIELD_FOOD'),
	('DAM_ADJACENT_FARM_FOOD',							'Amount',		2),
	('DAM_ADJACENT_PLANTATION_FOOD',					'YieldType',	'YIELD_FOOD'),
	('DAM_ADJACENT_PLANTATION_FOOD',					'Amount',		2);

update ModifierArguments set Value = 30 where ModifierId = 'COTHON_NAVAL_UNIT_PRODUCTION';

insert or replace into RequirementSets 
	(RequirementSetId,						RequirementSetType) 
values
	('ADJACENT_FARM_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL'),
	('ADJACENT_PLANTATION_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');
	-- ('HD_PLOT_HAS_PASTURE',					'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
	(RequirementSetId,						RequirementId)
values
	('ADJACENT_FARM_REQUIREMENTS',			'ADJACENT_TO_OWNER'),
	('ADJACENT_FARM_REQUIREMENTS',			'REQUIRES_PLOT_HAS_FARM'),
	('ADJACENT_PLANTATION_REQUIREMENTS',	'ADJACENT_TO_OWNER'),
	('ADJACENT_PLANTATION_REQUIREMENTS',	'REQUIRES_PLOT_HAS_PLANTATION');
	-- ('HD_PLOT_HAS_PASTURE',					'REQUIRES_PLOT_HAS_PASTURE');

update ModifierArguments set Value = 3 where ModifierId = 'MBANZA_FOOD' and Name = 'Amount';
update ModifierArguments set Value = 5 where ModifierId = 'MBANZA_GOLD' and Name = 'Amount';

-- Culture bombs [for Great Eng]
insert or replace into Modifiers (ModifierId, ModifierType, RunOnce, Permanent)
select 'CULTURE_BOMB_TRIGGER_' || DistrictType , 'MODIFIER_PLAYER_ADD_CULTURE_BOMB_TRIGGER', 1, 1 from Districts;
insert or replace into ModifierArguments (ModifierId, Name, Value)
select 'CULTURE_BOMB_TRIGGER_' || DistrictType, 'DistrictType', DistrictType from Districts;
