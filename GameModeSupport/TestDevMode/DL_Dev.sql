-------------------------------------
--          Dev Adjustment         --
-------------------------------------
-- MEENAKSHI_TEMPLE
delete from BuildingModifiers where BuildingType = 'BUILDING_MEENAKSHI_TEMPLE';
update UnitAbilities set Inactive = 0 where UnitAbilityType = 'ABILITY_SAGE_COMBAT_AOE_RELIGIOUS' or UnitAbilityType = 'ABILITY_GUIDE_MOVEMENT_AOE_RELIGIOUS';
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_BUILDER_PURCHASE'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_SETTLER_PURCHASE'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_HOLY_SITE_FOOD'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_DISTRICT_HOLY_SITE_FOOD'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_SHRINE_FOOD'),
	('BUILDING_MEENAKSHI_TEMPLE',			'MEENAKSHI_TEMPLE_FOOD');

insert or replace into Modifiers
	(ModifierId, 									ModifierType,											SubjectRequirementSetId)
values
	('MEENAKSHI_BUILDER_PURCHASE',					'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE',	NULL),
	('MEENAKSHI_SETTLER_PURCHASE',					'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE',	NULL),
	('MEENAKSHI_HOLY_SITE_FOOD',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',		'DISTRICT_IS_HOLY_SITE'),
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD',			'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',			'DISTRICT_IS_HOLY_SITE'),
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD_MODIFIER',  'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                    'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('MEENAKSHI_SHRINE_FOOD',						'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',			'HOLY_SITE_HAS_SHRINE'),
	('MEENAKSHI_SHRINE_FOOD_MODIFIER',  			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                    'REQUIRE_PLOT_ADJACENT_TO_OWNER'),
	('MEENAKSHI_TEMPLE_FOOD',						'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',			'HOLY_SITE_HAS_TEMPLE'),
	('MEENAKSHI_TEMPLE_FOOD_MODIFIER',  			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',                    'REQUIRE_PLOT_ADJACENT_TO_OWNER');

insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values
	('MEENAKSHI_BUILDER_PURCHASE',					'Tag',			'CLASS_BUILDER'),		
	('MEENAKSHI_SETTLER_PURCHASE',					'Tag',			'CLASS_SETTLER'),
	('MEENAKSHI_HOLY_SITE_FOOD',					'YieldType',	'YIELD_FOOD'),
	('MEENAKSHI_HOLY_SITE_FOOD',					'Amount',		2),
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD',           'ModifierId',  	'MEENAKSHI_DISTRICT_HOLY_SITE_FOOD_MODIFIER'),	
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD_MODIFIER',	'YieldType',   	'YIELD_FOOD'),
	('MEENAKSHI_DISTRICT_HOLY_SITE_FOOD_MODIFIER',	'Amount',	   	1),
	('MEENAKSHI_SHRINE_FOOD',             			'ModifierId',  	'MEENAKSHI_SHRINE_FOOD_MODIFIER'),
	('MEENAKSHI_SHRINE_FOOD_MODIFIER',    			'YieldType',   	'YIELD_FOOD'),
	('MEENAKSHI_SHRINE_FOOD_MODIFIER',    			'Amount',	   	1),
	('MEENAKSHI_TEMPLE_FOOD',              			'ModifierId',  	'MEENAKSHI_TEMPLE_FOOD_MODIFIER'),
	('MEENAKSHI_TEMPLE_FOOD_MODIFIER',				'YieldType',   	'YIELD_FOOD'),
	('MEENAKSHI_TEMPLE_FOOD_MODIFIER',				'Amount',      	1);

insert or replace into RequirementSetRequirements
	(RequirementSetId,								RequirementId)
values
	('HOLY_SITE_HAS_SHRINE',                      	'REQUIRES_DISTRICT_IS_HOLY_SITE'),
	('HOLY_SITE_HAS_SHRINE',                      	'REQUIRES_CITY_HAS_SHRINE'),
	('HOLY_SITE_HAS_TEMPLE',                      	'REQUIRES_DISTRICT_IS_HOLY_SITE'),
	('HOLY_SITE_HAS_TEMPLE',                      	'REQUIRES_CITY_HAS_TEMPLE');

insert or replace into RequirementSets
	(RequirementSetId,                           RequirementSetType)
values
	('HOLY_SITE_HAS_SHRINE',       				'REQUIREMENTSET_TEST_ALL'),
	('HOLY_SITE_HAS_TEMPLE',       				'REQUIREMENTSET_TEST_ALL');

-- Buildings
update Buildings set cost = 80 where BuildingType = 'BUILDING_SHRINE';

--great person ARYABHATA
insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,						ModifierId,												AttachmentTargetType)
values
    ('GREAT_PERSON_INDIVIDUAL_ARYABHATA',			'GREAT_PERSON_INDIVIDUAL_ARYABHATA_CAMPUS_AMENITY',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

insert into Modifiers
	(ModifierId,												ModifierType,								RunOnce,	Permanent)
values
    ('GREAT_PERSON_INDIVIDUAL_ARYABHATA_CAMPUS_AMENITY',		'MODIFIER_ADJUST_AMENITIES_IN_DISTRICT',	1,			1);

insert into ModifierArguments
    (ModifierId,											 Name,				Value)
values
	('GREAT_PERSON_INDIVIDUAL_ARYABHATA_CAMPUS_AMENITY',	'Amount',			2);
	
insert or replace into ModifierStrings
    (ModifierId,                                				Context,    Text)
values
    ('GREAT_PERSON_INDIVIDUAL_ARYABHATA_CAMPUS_AMENITY',		'Summary',  'LOC_ARYABHATA_CAMPUS_AMENITY');

update ModifierArguments set Value = 150 where ModifierId = 'PAPAL_PRIMACY_PRESSURE_ON_ADOPTION' and Name = 'Amount';

--inca ：Reduces the purchase cost of mountain tiles by 50%
insert or replace into TraitModifiers   
    (TraitType,	                            ModifierId)
select  'TRAIT_CIVILIZATION_GREAT_MOUNTAINS',   TerrainType || 'PLOT_COST' from Terrains 
where TerrainType = 'TERRAIN_GRASS_MOUNTAIN' 
    or TerrainType = 'TERRAIN_PLAINS_MOUNTAIN' 
    or TerrainType = 'TERRAIN_DESERT_MOUNTAIN' 
    or TerrainType = 'TERRAIN_TUNDRA_MOUNTAIN' 
    or TerrainType = 'TERRAIN_SNOW_MOUNTAIN';

insert or replace into Modifiers
	(ModifierId,			        ModifierType)
select TerrainType || 'PLOT_COST', 'MODIFIER_PLAYER_CITIES_ADJUST_PLOT_PURCHASE_COST_TERRAIN'  from Terrains 
where TerrainType = 'TERRAIN_GRASS_MOUNTAIN' 
    or TerrainType = 'TERRAIN_PLAINS_MOUNTAIN' 
    or TerrainType = 'TERRAIN_DESERT_MOUNTAIN' 
    or TerrainType = 'TERRAIN_TUNDRA_MOUNTAIN' 
    or TerrainType = 'TERRAIN_SNOW_MOUNTAIN';

insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
select TerrainType || 'PLOT_COST',  'TerrainType',  TerrainType   from Terrains 
where TerrainType = 'TERRAIN_GRASS_MOUNTAIN' 
    or TerrainType = 'TERRAIN_PLAINS_MOUNTAIN' 
    or TerrainType = 'TERRAIN_DESERT_MOUNTAIN' 
    or TerrainType = 'TERRAIN_TUNDRA_MOUNTAIN' 
    or TerrainType = 'TERRAIN_SNOW_MOUNTAIN';

insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
select TerrainType || 'PLOT_COST',  'Amount',       -50   from Terrains 
where TerrainType = 'TERRAIN_GRASS_MOUNTAIN' 
    or TerrainType = 'TERRAIN_PLAINS_MOUNTAIN' 
    or TerrainType = 'TERRAIN_DESERT_MOUNTAIN' 
    or TerrainType = 'TERRAIN_TUNDRA_MOUNTAIN' 
    or TerrainType = 'TERRAIN_SNOW_MOUNTAIN';

-- Policies
update Policies set PrereqCivic = 'CIVIC_EXPLORATION' where PolicyType = 'POLICY_HIGHWAY' or PolicyType = 'POLICY_SILK_ROAD';

-- Wonders
-- update ModifierArguments set Value = 3 where ModifierId = 'GREAT_ZIMBABWE_DOMESTICBONUSRESOURCEGOLD' and Name = 'Amount';
-- update ModifierArguments set Value = 3 where ModifierId = 'GREAT_ZIMBABWE_INTERNATIONALBONUSRESOURCEGOLD' and Name = 'Amount';

-- update ModifierArguments set Value = 2 where ModifierId = 'CONTRATACION_GOVERNOR_POINTS' and Name = 'Delta';

update RequirementSetRequirements set RequirementId = 'HD_KINKAKU_PLOT_WITHIN_4_REQ' where RequirementId = 'KINKAKU_PLOT_WITHIN_6_REQ';

-- ORSZAGHAZ
-- update Buildings set PrereqTech = NULL, PrereqCivic = 'CIVIC_NATIONALISM', Cost = 1360 where BuildingType = 'BUILDING_ORSZAGHAZ';
-- delete from BuildingModifiers where BuildingType = 'BUILDING_ORSZAGHAZ' and ModifierId = 'ORSZAGHAZ_DOUBLE_FAVOR_SUZERAIN';
-- insert or replace into BuildingModifiers (BuildingType, ModifierId)values   ('BUILDING_ORSZAGHAZ',  'CIVIC_GRANT_PLAYER_GOVERNOR_POINTS');

-- insert or replace into AllianceEffects (LevelRequirement,  AllianceType,    ModifierID)
-- select distinct 1,   AllianceType,  'ORSZAGHAZ_' || AllianceType from AllianceEffects;

-- insert or replace into Modifiers    (ModifierId,    ModifierType,   SubjectRequirementSetId)
-- select distinct 'ORSZAGHAZ_' || AllianceType,    'MODIFIER_ALLIANCES_PLAYERS_ATTACH_MODIFIER',   'PLAYER_HAS_BUILDING_ORSZAGHAZ' from AllianceEffects;

-- insert or replace into Modifiers    (ModifierId,    ModifierType)
-- select distinct 'ORSZAGHAZ_' || AllianceType || '_MODIFIER',    'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER' from AllianceEffects;

-- insert or replace into ModifierArguments    (ModifierId,    Name,   Value)
-- select distinct 'ORSZAGHAZ_' || AllianceType,  'ModifierId',  'ORSZAGHAZ_' || AllianceType || '_MODIFIER' from AllianceEffects;

-- insert or replace into ModifierArguments    
--     (ModifierId,                                 Name,          Value)
-- values 
--     ('ORSZAGHAZ_ALLIANCE_CULTURAL_MODIFIER',     'YieldType',   'YIELD_CULTURE'),
--     ('ORSZAGHAZ_ALLIANCE_CULTURAL_MODIFIER',     'Amount',      5),
--     ('ORSZAGHAZ_ALLIANCE_ECONOMIC_MODIFIER',     'YieldType',   'YIELD_GOLD'),
--     ('ORSZAGHAZ_ALLIANCE_ECONOMIC_MODIFIER',     'Amount',      5),
--     ('ORSZAGHAZ_ALLIANCE_MILITARY_MODIFIER',     'YieldType',   'YIELD_PRODUCTION'),
--     ('ORSZAGHAZ_ALLIANCE_MILITARY_MODIFIER',     'Amount',      5),
--     ('ORSZAGHAZ_ALLIANCE_RELIGIOUS_MODIFIER',    'YieldType',   'YIELD_FAITH'),
--     ('ORSZAGHAZ_ALLIANCE_RELIGIOUS_MODIFIER',    'Amount',      5),
--     ('ORSZAGHAZ_ALLIANCE_RESEARCH_MODIFIER',     'YieldType',   'YIELD_SCIENCE'),
--     ('ORSZAGHAZ_ALLIANCE_RESEARCH_MODIFIER',     'Amount',      5);

-- insert or replace into Requirements
--     (RequirementId,                             RequirementType)
-- values
--     ('REQUIRES_PLAYER_HAS_BUILDING_ORSZAGHAZ',  'REQUIREMENT_PLAYER_HAS_BUILDING');

-- insert or replace into RequirementArguments
--     (RequirementId,                             Name,               Value)
-- values
--     ('REQUIRES_PLAYER_HAS_BUILDING_ORSZAGHAZ',  'BuildingType',     'BUILDING_ORSZAGHAZ');

-- insert or replace into RequirementSets
--     (RequirementSetId,                                 RequirementSetType)
-- values
--     ('PLAYER_HAS_BUILDING_ORSZAGHAZ',                  'REQUIREMENTSET_TEST_ALL');

-- insert or replace into RequirementSetRequirements
--     (RequirementSetId,                                 RequirementId)
-- values
--     ('PLAYER_HAS_BUILDING_ORSZAGHAZ',                  'REQUIRES_PLAYER_HAS_BUILDING_ORSZAGHAZ');

--------------------------------------------------------------------------------------------------------------------------------
-- dev used for v1.0.7
--------------------------------------------------------------------------------------------------------------------------------
-- -- Belief:
-- update ModifierArguments set Value = 1 where ModifierId = 'WORK_ETHIC_SPECIAL_DISTRICT_PRODUCTION_MODIFIER' and Name = 'Amount';
-- -- Great People
-- update ModifierArguments set Value = 20 where ModifierId = 'TRAIT_PATRONAGE_DISCOUNT_FAITH_PERCENT' and Name = 'Amount';
-- update ModifierArguments set Value = 20 where ModifierId = 'TRAIT_PATRONAGE_DISCOUNT_GOLD_PERCENT' and Name = 'Amount';
-- update ModifierArguments set Value = 20 where ModifierId = 'ORACLE_PATRONAGE_FAITH_DISCOUNT' and Name = 'Amount';
-- update ModifierArguments set Value = 20 where ModifierId = 'TO_THE_GLORY_OF_GOD_GREAT_PRESON_DISCOUNT_MODIFIER' and Name = 'Amount';
-- update ModifierArguments set Value = 8 where ModifierId = 'TRAIT_GREAT_PERSON_DISCOUNT' and Name = 'Amount';

-- update GlobalParameters set Value = 0.5 where Name = 'FAITH_PER_UNUSED_GREAT_PERSON_POINT';

-- -- Gov
-- delete from GovernmentModifiers where GovernmentType = 'GOVERNMENT_AUTOCRACY' and ModifierId = 'AUTOCRACY_GOV';
-- delete from PolicyModifiers where PolicyType = 'POLICY_GOV_AUTOCRACY' and ModifierId = 'AUTOCRACY_GOV';
-- delete from GovernmentModifiers where GovernmentType = 'GOVERNMENT_AUTOCRACY' and ModifierId = 'AUTOCRACY_DIP';
-- delete from PolicyModifiers where PolicyType = 'POLICY_GOV_AUTOCRACY' and ModifierId = 'AUTOCRACY_DIP';

-- -- CityStates
-- update GlobalParameters set Value = 20 where Name = 'YIELD_MODIFIER_PER_EARNED_GREAT_PERSON_MAXIMUM';

--------------------------------------------------------------------------------------------------------------------------------
-- dev used for v1.0.5
--------------------------------------------------------------------------------------------------------------------------------
-- Amenity
-- update Happinesses set GrowthModifier = 5 where HappinessType = 'HAPPINESS_DELIGHTED';
-- update Happinesses set GrowthModifier = 10 where HappinessType = 'HAPPINESS_HAPPY';
-- update Happinesses set GrowthModifier = 20 where HappinessType = 'HAPPINESS_ECSTATIC'; 

-- Governors
-- update GlobalParameters set Value = 9 where Name = 'MAGNUS_GENERAL_SERVICES_OFFICE_EFFECT_DISTANCE';
-- update ModifierArguments set Value = 2 where Name = 'Amount' and ModifierId like 'GENERAL_SERVICE_REGIONAL_%_MODIFIER';

-- update GlobalParameters set Value = 50 where Name = 'REYNA_CONVERT_PERCENTAGE';
-- update ModifierArguments set Value = 5 where Name = 'Amount' and ModifierId like 'REYNA_%_PERCENTAGE_BOOST';

-- Buildings
-- insert or replace into BuildingModifiers
--     (BuildingType,                          ModifierId)
-- values
--     ('BUILDING_WORKSHOP',                    'WORKSHOP_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
--     ('BUILDING_WORKSHOP',                    'WORKSHOP_DISTRICT_PRODUCTION_PERCENTAGE_BOOST');

-- Districts
-- delete from District_Adjacencies where YieldChangeId = 'HD_Commercial_Hub_Gold';
-- delete from District_Adjacencies where YieldChangeId = 'HD_Suguba_Gold';
-- delete from District_Adjacencies where YieldChangeId = 'Commercial_Canal_Gold' and
--     (DistrictType = 'DISTRICT_HARBOR' or DistrictType = 'DISTRICT_COTHON' or DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD');

-- Great Person
-- update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE';

-- Techs
-- update Boosts set NumItems = 2 where TechnologyType = 'TECH_MASS_PRODUCTION';
-- insert or replace into TechnologyPrereqs
--     (Technology,                PrereqTech)
-- values
--     ('TECH_PREDICTIVE_SYSTEMS', 'TECH_STEALTH_TECHNOLOGY'),
--     ('TECH_OFFWORLD_MISSION',   'TECH_PREDICTIVE_SYSTEMS');

-- Civs
-- update ModifierArguments set Value = 25 where Name = 'Amount' and ModifierId = 'LIBRARY_DISTRICT_PRODUCTION';
-- update ModifierArguments set Value = 25 where Name = 'Amount' and ModifierId = 'LIBRARY_BUILDING_PRODUCTION';

-- delete from TraitModifiers where TraitType = 'TRAIT_LEADER_GRAND_EMBASSY' and ModifierId = 'TRAIT_CAN_PURCHASE_HOLYSITE_BUILDING';
-- update ModifierArguments set Value = 1 where Name = 'Amount' and ModifierId = 'TRAIT_TUNDRA_DISTRICT_FOOD';

-- delete from TraitModifiers where TraitType = 'TRAIT_RADIO_ORANJE' and ModifierId = 'TRAIT_TRADER_SPEEDUP';

-- Wonders
-- update ModifierArguments set Value = 1 where ModifierId = 'HUEY_LAKE_FOOD_MODIFIER' and Name = 'Amount';
-- update ModifierArguments set Value = 1 where ModifierId = 'ITSUKUSHIMA_HOLY_SITE_COAST_FAITH' and Name = 'Amount';
-- update ModifierArguments set Value = 1 where ModifierId = 'COLOSSUS_TRADE_ROUTE_FISHINGBOAT_GOLD' and Name = 'Amount';

-- Beliefs
-- delete from BeliefModifiers where BeliefType = 'BELIEF_GOD_OF_THE_SEA';
-- insert or replace into Types
--     (Type,                              Kind)
-- values
--     ('BELIEF_FISHING_TRADITION',        'KIND_BELIEF');

-- insert or replace into Beliefs
--     (BeliefType,                        Name,                                       Description,                                            BeliefClassType)
-- values
--     ('BELIEF_FISHING_TRADITION',        'LOC_BELIEF_FISHING_TRADITION_NAME',        'LOC_BELIEF_FISHING_TRADITION_DL_DESCRIPTION',          'BELIEF_CLASS_PANTHEON');

-- insert or replace into BeliefModifiers
--     (BeliefType,                            ModifierID)
-- values
--     ('BELIEF_GOD_OF_THE_SEA',               'GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET'),
--     ('BELIEF_GOD_OF_THE_SEA',               'GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_SCIENCE'),
--     ('BELIEF_GOD_OF_THE_SEA',               'GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD'),
--     ('BELIEF_FISHING_TRADITION',            'FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION'),
--     ('BELIEF_FISHING_TRADITION',            'FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD');

-- insert or replace into Modifiers
--     (ModifierId,                                                    ModifierType,                                       SubjectRequirementSetId)
-- values
--     ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET',                   'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),          
--     ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET_MODIFIER',          'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT',   'GOD_OF_THE_SEA_CITY_HAS_FISHINGBOATS'),
--     ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_SCIENCE',               'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_AND_CITY_HAS_HOLYSITE'),
--     ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_SCIENCE_MODIFIER',      'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
--     ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD',                     'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
--     ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD_MODIFIER',            'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_LUXURY_FISHING_BOATS_REQUIREMENTS'),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION',             'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION_MODIFIER',    'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_BONUS_FISHING_BOATS_REQUIREMENTS'),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD',                   'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD_MODIFIER',          'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_BONUS_FISHING_BOATS_REQUIREMENTS');

-- insert or replace into ModifierArguments
--     (ModifierId,                                                    Name,                   Value)
-- values
--     ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET',                   'ModifierId',           'GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET_MODIFIER'),      
--     ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET_MODIFIER',          'GreatPersonClassType', 'GREAT_PERSON_CLASS_PROPHET'),
--     ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET_MODIFIER',          'Amount',               2),
--     ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_SCIENCE',               'ModifierId',           'GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_SCIENCE_MODIFIER'),
--     ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_SCIENCE_MODIFIER',      'YieldType',            'YIELD_SCIENCE'),
--     ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_SCIENCE_MODIFIER',      'Amount',               1),
--     ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD',                     'ModifierId',           'GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD_MODIFIER'),
--     ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD_MODIFIER',            'YieldType',            'YIELD_FOOD'),
--     ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD_MODIFIER',            'Amount',               1),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION',             'ModifierId',           'FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION_MODIFIER'),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION_MODIFIER',    'YieldType',            'YIELD_PRODUCTION'),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION_MODIFIER',    'Amount',               1),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD',                   'ModifierId',           'FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD_MODIFIER'),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD_MODIFIER',          'YieldType',            'YIELD_GOLD'),
--     ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD_MODIFIER',          'Amount',               2);

-- delete from BeliefModifiers where BeliefType = 'BELIEF_DANCE_OF_THE_AURORA' and ModifierId = 'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD';
-- delete from BeliefModifiers where BeliefType = 'BELIEF_DANCE_OF_THE_AURORA' and ModifierId = 'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD';

-- delete from BeliefModifiers where BeliefType = 'BELIEF_PAPAL_PRIMACY' and ModifierId = 'PAPAL_PRIMACY_CULTURE_PER_TRIBUTARY';
-- update ModifierArguments set Value = 2 where Name = 'Amount' and ModifierId = 'PAPAL_PRIMACY_GOLD_PER_TRIBUTARY_MODIFIER';

-- Units
-- update UnitPromotions set Level = 2 where UnitPromotionType = 'PROMOTION_SENTRY';
-- update UnitPromotions set Level = 1 where UnitPromotionType = 'PROMOTION_SPYGLASS';

-- update UnitPromotionPrereqs set PrereqUnitPromotion = 'PROMOTION_SENTRY'
--     where UnitPromotion = 'PROMOTION_AMBUSH' and PrereqUnitPromotion = 'PROMOTION_SPYGLASS';
-- update UnitPromotionPrereqs set UnitPromotion = 'PROMOTION_SENTRY', PrereqUnitPromotion = 'PROMOTION_SPYGLASS' 
--     where UnitPromotion = 'PROMOTION_SPYGLASS' and PrereqUnitPromotion = 'PROMOTION_SENTRY';

-- Policies
-- insert or replace into ObsoletePolicies
--     (PolicyType,                    ObsoletePolicy)
-- values
--     ('POLICY_TRADE_CONFEDERATION',  'POLICY_MARKET_ECONOMY'),
--     ('POLICY_DOMESTIC_TRADE',       'POLICY_COLLECTIVIZATION');

-- update Policies set PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES' where PolicyType = 'POLICY_TRADE_CONFEDERATION' or PolicyType = 'POLICY_DOMESTIC_TRADE';
-- update Policies set PrereqCivic = 'CIVIC_MERCANTILISM' where PolicyType = 'POLICY_SILK_ROAD' or PolicyType = 'POLICY_HIGHWAY';

-- Dip
-- update DiplomaticActions set InitiatorPrereqCivic = 'CIVIC_FEUDALISM' where DiplomaticActionType = 'DIPLOACTION_DECLARE_TERRITORIAL_WAR';

-- insert or replace into ModifierArguments
--     (ModifierId,                                                    Name,                   Value)
-- values
--     ('STANDARD_DIPLOMACY_TRADE_RELATIONS',                          'TradeBonus',           4);

-- Trade Route
-- update District_TradeRouteYields set YieldChangeAsInternationalDestination = 3 where DistrictType = 'DISTRICT_GOVERNMENT' and YieldType = 'YIELD_GOLD';

-- insert or replace into DistrictModifiers (DistrictType, ModifierId)
-- select DistrictType, 'HD_ONE_GOLD_FROM_INCOMING_FOREIGN_ROUTES' from District_TradeRouteYields
-- where YieldChangeAsInternationalDestination != 0;

-- insert or replace into Modifiers
--     (ModifierId,                                                    ModifierType)
-- values
--     ('HD_ONE_GOLD_FROM_INCOMING_FOREIGN_ROUTES',                    'MODIFIER_SINGLE_CITY_ADJUST_TRADE_ROUTE_YIELD_FROM_OTHERS');

-- insert or replace into ModifierArguments
--     (ModifierId,                                                    Name,                   Value)
-- values
--     ('HD_ONE_GOLD_FROM_INCOMING_FOREIGN_ROUTES',                    'YieldType',            'YIELD_GOLD'),
--     ('HD_ONE_GOLD_FROM_INCOMING_FOREIGN_ROUTES',                    'Amount',               1);

-- Naval Melee 
-- delete from TypeTags where Type = 'ABILITY_MONGOLIAN_KESHIG' and Tag = 'CLASS_NAVAL_MELEE';

-- insert or replace into TechnologyModifiers
--     (TechnologyType,                                        ModifierId)
-- values
--     ('TECH_SQUARE_RIGGING',                                 'HD_NAVAL_MELEE_ESCORT_MOBILITY_SHARED_MOVEMENT');

-- insert or replace into Modifiers
--     (ModifierId,                                            ModifierType)
-- values
--     ('HD_NAVAL_MELEE_ESCORT_MOBILITY_SHARED_MOVEMENT',      'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

-- insert or replace into ModifierArguments
--     (ModifierId,                                            Name,           Value)
-- values
--     ('HD_NAVAL_MELEE_ESCORT_MOBILITY_SHARED_MOVEMENT',      'AbilityType',  'ABILITY_NAVAL_MELEE_ESCORT_MOBILITY_SHARED_MOVEMENT');