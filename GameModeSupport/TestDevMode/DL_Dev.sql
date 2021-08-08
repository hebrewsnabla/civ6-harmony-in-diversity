-------------------------------------
--          Dev Adjustment         --
-------------------------------------

-- Governors
update GlobalParameters set Value = 9 where Name = 'MAGNUS_GENERAL_SERVICES_OFFICE_EFFECT_DISTANCE';
update ModifierArguments set Value = 2 where Name = 'Amount' and ModifierId like 'GENERAL_SERVICE_REGIONAL_%_MODIFIER';

update GlobalParameters set Value = 50 where Name = 'REYNA_CONVERT_PERCENTAGE';
update ModifierArguments set Value = 5 where Name = 'Amount' and ModifierId like 'REYNA_%_PERCENTAGE_BOOST';

-- Districts
delete from District_Adjacencies where YieldChangeId = 'HD_Commercial_Hub_Gold';
delete from District_Adjacencies where YieldChangeId = 'HD_Suguba_Gold';
delete from District_Adjacencies where YieldChangeId = 'Commercial_Canal_Gold' and
    (DistrictType = 'DISTRICT_HARBOR' or DistrictType = 'DISTRICT_COTHON' or DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD');

-- Great Person
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE';

-- Techs
update Boosts set NumItems = 2 where TechnologyType = 'TECH_MASS_PRODUCTION';

-- Civs
update ModifierArguments set Value = 25 where Name = 'Amount' and ModifierId = 'LIBRARY_DISTRICT_PRODUCTION';
update ModifierArguments set Value = 25 where Name = 'Amount' and ModifierId = 'LIBRARY_BUILDING_PRODUCTION';

delete from TraitModifiers where TraitType = 'TRAIT_LEADER_GRAND_EMBASSY' and ModifierId = 'TRAIT_CAN_PURCHASE_HOLYSITE_BUILDING';
update ModifierArguments set Value = 1 where Name = 'Amount' and ModifierId = 'TRAIT_TUNDRA_DISTRICT_FOOD';

delete from TraitModifiers where TraitType = 'TRAIT_RADIO_ORANJE' and ModifierId = 'TRAIT_TRADER_SPEEDUP';

-- Wonders
update ModifierArguments set Value = 1 where ModifierId = 'HUEY_LAKE_FOOD_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 1 where ModifierId = 'ITSUKUSHIMA_HOLY_SITE_COAST_FAITH' and Name = 'Amount';
update ModifierArguments set Value = 1 where ModifierId = 'COLOSSUS_TRADE_ROUTE_FISHINGBOAT_GOLD' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'GREAT_ZIMBABWE_DOMESTICBONUSRESOURCEGOLD' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'GREAT_ZIMBABWE_INTERNATIONALBONUSRESOURCEGOLD' and Name = 'Amount';

-- Beliefs
delete from BeliefModifiers where BeliefType = 'BELIEF_GOD_OF_THE_SEA';
insert or replace into Types
    (Type,                              Kind)
values
    ('BELIEF_FISHING_TRADITION',        'KIND_BELIEF');

insert or replace into Beliefs
    (BeliefType,                        Name,                                       Description,                                            BeliefClassType)
values
    ('BELIEF_FISHING_TRADITION',        'LOC_BELIEF_FISHING_TRADITION_NAME',        'LOC_BELIEF_FISHING_TRADITION_DL_DESCRIPTION',          'BELIEF_CLASS_PANTHEON');

insert or replace into BeliefModifiers
    (BeliefType,                            ModifierID)
values
    ('BELIEF_GOD_OF_THE_SEA',               'GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET'),
    ('BELIEF_GOD_OF_THE_SEA',               'GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_FAITH'),
    ('BELIEF_GOD_OF_THE_SEA',               'GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD'),
    ('BELIEF_FISHING_TRADITION',            'FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION'),
    ('BELIEF_FISHING_TRADITION',            'FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD');

insert or replace into Modifiers
    (ModifierId,                                                    ModifierType,                                       SubjectRequirementSetId)
values
    ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET',                   'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),          
    ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET_MODIFIER',          'MODIFIER_SINGLE_CITY_ADJUST_GREAT_PERSON_POINT',   'GOD_OF_THE_SEA_CITY_HAS_FISHINGBOATS'),
    ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_FAITH',                 'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_AND_CITY_HAS_HOLYSITE'),
    ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_FAITH_MODIFIER',        'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_FISHINGBOATS_REQUIREMENTS'),
    ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD',                     'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD_MODIFIER',            'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_LUXURY_FISHING_BOATS_REQUIREMENTS'),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION',             'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION_MODIFIER',    'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_BONUS_FISHING_BOATS_REQUIREMENTS'),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD',                   'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',              'CITY_FOLLOWS_PANTHEON_REQUIREMENTS'),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD_MODIFIER',          'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',      'PLOT_HAS_BONUS_FISHING_BOATS_REQUIREMENTS');

insert or replace into ModifierArguments
    (ModifierId,                                                    Name,                   Value)
values
    ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET',                   'ModifierId',           'GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET_MODIFIER'),      
    ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET_MODIFIER',          'GreatPersonClassType', 'GREAT_PERSON_CLASS_PROPHET'),
    ('GOD_OF_THE_SEA_FISHINGBOATS_GREAT_PROPHET_MODIFIER',          'Amount',               2),
    ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_FAITH',                 'ModifierId',           'GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_FAITH_MODIFIER'),
    ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_FAITH_MODIFIER',        'YieldType',            'YIELD_FAITH'),
    ('GOD_OF_THE_SEA_HOLY_SITE_FISHINGBOATS_FAITH_MODIFIER',        'Amount',               1),
    ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD',                     'ModifierId',           'GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD_MODIFIER'),
    ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD_MODIFIER',            'YieldType',            'YIELD_FOOD'),
    ('GOD_OF_THE_SEA_LUXURY_FISHINGBOATS_FOOD_MODIFIER',            'Amount',               1),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION',             'ModifierId',           'FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION_MODIFIER'),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION_MODIFIER',    'YieldType',            'YIELD_PRODUCTION'),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_PRODUCTION_MODIFIER',    'Amount',               1),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD',                   'ModifierId',           'FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD_MODIFIER'),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD_MODIFIER',          'YieldType',            'YIELD_GOLD'),
    ('FISHING_TRADITION_BONUS_FISHINGBOATS_GOLD_MODIFIER',          'Amount',               2);

delete from BeliefModifiers where BeliefType = 'BELIEF_DANCE_OF_THE_AURORA' and ModifierId = 'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_FOOD';
delete from BeliefModifiers where BeliefType = 'BELIEF_DANCE_OF_THE_AURORA' and ModifierId = 'DANCE_OF_THE_AURORA_HOLYSITE_TUNDRA_HILL_FOOD';

delete from BeliefModifiers where BeliefType = 'BELIEF_PAPAL_PRIMACY' and ModifierId = 'PAPAL_PRIMACY_CULTURE_PER_TRIBUTARY';
update ModifierArguments set Value = 2 where Name = 'Amount' and ModifierId = 'PAPAL_PRIMACY_GOLD_PER_TRIBUTARY_MODIFIER';

-- Units
update UnitPromotions set Level = 2 where UnitPromotionType = 'PROMOTION_SENTRY';
update UnitPromotions set Level = 1 where UnitPromotionType = 'PROMOTION_SPYGLASS';

update UnitPromotionPrereqs set PrereqUnitPromotion = 'PROMOTION_SENTRY'
    where UnitPromotion = 'PROMOTION_AMBUSH' and PrereqUnitPromotion = 'PROMOTION_SPYGLASS';
update UnitPromotionPrereqs set UnitPromotion = 'PROMOTION_SENTRY', PrereqUnitPromotion = 'PROMOTION_SPYGLASS' 
    where UnitPromotion = 'PROMOTION_SPYGLASS' and PrereqUnitPromotion = 'PROMOTION_SENTRY';

-- Policies
-- insert or replace into ObsoletePolicies
--     (PolicyType,                    ObsoletePolicy)
-- values
--     ('POLICY_TRADE_CONFEDERATION',  'POLICY_MARKET_ECONOMY'),
--     ('POLICY_DOMESTIC_TRADE',       'POLICY_COLLECTIVIZATION');

update Policies set PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES' where PolicyType = 'POLICY_TRADE_CONFEDERATION' or PolicyType = 'POLICY_DOMESTIC_TRADE';
update Policies set PrereqCivic = 'CIVIC_MERCANTILISM' where PolicyType = 'POLICY_SILK_ROAD' or PolicyType = 'POLICY_HIGHWAY';

-- Dip
update DiplomaticActions set InitiatorPrereqCivic = 'CIVIC_FEUDALISM' where DiplomaticActionType = 'DIPLOACTION_DECLARE_TERRITORIAL_WAR';

-- Trade Route
