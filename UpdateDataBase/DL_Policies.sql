-------------------------------------
--      Policies Adjustments       --
-------------------------------------

-- Golden Age 

delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_INFRASTRUCTURE' and ModifierId = 'COMMEMORATION_INFRASTRUCTURE_GA_PURCHASE_CIVILIAN';
insert or replace into CommemorationModifiers (CommemorationType, ModifierId) values
	('COMMEMORATION_INFRASTRUCTURE', 'COMMEMORATION_INFRASTRUCTURE_GA_SETTLER_MOVEMENT');
update ModifierArguments set Value = 20 where ModifierId = 'COMMEMORATION_INFRASTRUCTURE_BUILDER_DISCOUNT_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 20 where ModifierId = 'COMMEMORATION_INFRASTRUCTURE_SETTLER_DISCOUNT_MODIFIER' and Name = 'Amount';

insert or replace into Modifiers
	(ModifierId,											ModifierType,								SubjectRequirementSetId)
values
	('COMMEMORATION_INFRASTRUCTURE_GA_SETTLER_MOVEMENT',	'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',	'UNIT_IS_GOLDEN_AGE_SETTLER');

insert or replace into ModifierArguments
	(ModifierId,											Name,		Value)
values
	('COMMEMORATION_INFRASTRUCTURE_GA_SETTLER_MOVEMENT',	'Amount',	2);

-- Policy Cards

update ModifierArguments set Value = 100 where ModifierID = 'RAID_DOUBLEPILLAGEIMPROVE';
update ModifierArguments set Value = 100 where ModifierID = 'SACK_DOUBLEPILLAGEDISTRICT';
update ModifierArguments set Value = 200 where ModifierID = 'TOTALWAR_DOUBLEPILLAGEIMPROVE';
update ModifierArguments set Value = 200 where ModifierID = 'TOTALWAR_DOUBLEPILLAGEDISTRICT';
update ModifierArguments set Value = 200 where ModifierID = 'TOTAL_WAR_PLUNDER_BONUS';

-- level-one district yield policies
update ModifierArguments set Value = 50 where Name = 'Amount'
 	and (ModifierID = 'AESTHETICS_DISTRICTCULTURE'
	or ModifierID = 'CRAFTSMEN_DISTRICTPRODUCTION'
	or ModifierID = 'NATURALPHILOSOPHY_DISTRICTSCIENCE'
	or ModifierID = 'NAVALINFRASTRUCTURE_HARBORGOLD'
	-- or ModifierID = 'SCRIPTURE_DISTRICTFAITH'
	or ModifierID = 'TOWNCHARTERS_DISTRICTGOLD');

update Governments set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where GovernmentType = 'GOVERNMENT_MONARCHY';
update Government_SlotCounts set NumSlots = 2 where
	GovernmentType = 'GOVERNMENT_MONARCHY' and GovernmentSlotType = 'SLOT_MILITARY';
update Government_SlotCounts set NumSlots = 2 where
	GovernmentType = 'GOVERNMENT_MONARCHY' and GovernmentSlotType = 'SLOT_ECONOMIC';
update Government_SlotCounts set NumSlots = 1 where
	GovernmentType = 'GOVERNMENT_THEOCRACY' and GovernmentSlotType = 'SLOT_ECONOMIC';
update Government_SlotCounts set NumSlots = 2 where
	GovernmentType = 'GOVERNMENT_THEOCRACY' and GovernmentSlotType = 'SLOT_WILDCARD';
update Government_SlotCounts set NumSlots = 2 where
	GovernmentType = 'GOVERNMENT_COMMUNISM' and GovernmentSlotType = 'SLOT_MILITARY';
update Government_SlotCounts set NumSlots = 2 where
	GovernmentType = 'GOVERNMENT_COMMUNISM' and GovernmentSlotType = 'SLOT_WILDCARD';

update Policies set PrereqCivic = 'CIVIC_DIVINE_RIGHT' where PolicyType = 'POLICY_MEDINA_QUARTER';
update Policies set PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES' where PolicyType = 'POLICY_TRADE_CONFEDERATION';
update Policies set PrereqCivic = 'CIVIC_FEUDALISM' where PolicyType = 'POLICY_CIVIL_PRESTIGE';
update Policies set PrereqCivic = 'CIVIC_MERCENARIES' where PolicyType = 'POLICY_RETAINERS';
update Policies set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where PolicyType = 'POLICY_GOTHIC_ARCHITECTURE';

update Policies set PrereqCivic = 'CIVIC_CLASS_STRUGGLE' where PolicyType = 'POLICY_FIVE_YEAR_PLAN';
update Policies set PrereqCivic = 'CIVIC_SUFFRAGE' where PolicyType = 'POLICY_ECONOMIC_UNION';
update Policies set PrereqCivic = 'CIVIC_TOTALITARIANISM' where PolicyType = 'POLICY_LIGHTNING_WARFARE';
insert or replace into Policy_GovernmentExclusives_XP2
	(PolicyType,					GovernmentType)
values
	('POLICY_FIVE_YEAR_PLAN',		'GOVERNMENT_COMMUNISM'),
	('POLICY_ECONOMIC_UNION',		'GOVERNMENT_DEMOCRACY'),
	('POLICY_LIGHTNING_WARFARE',	'GOVERNMENT_FASCISM'),
	('POLICY_FIVE_YEAR_PLAN',		'GOVERNMENT_SYNTHETIC_TECHNOCRACY'),
	('POLICY_ECONOMIC_UNION',		'GOVERNMENT_DIGITAL_DEMOCRACY'),
	('POLICY_LIGHTNING_WARFARE',	'GOVERNMENT_CORPORATE_LIBERTARIANISM');

update ModifierArguments set Value = 15 where ModifierId = 'COMMUNISM_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE' and Name = 'Amount';
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE'; 

update ModifierArguments set Value = 1 where ModifierId = 'SERFDOM_BUILDERCHARGES' and Name = 'Amount';

insert or replace into PolicyModifiers
	(PolicyType,		ModifierId)
values
	('POLICY_SERFDOM',	'SERFDOM_BUILDERPRODUCTION');

insert or replace into Modifiers
	(ModifierId,					ModifierType)
values
	('SERFDOM_BUILDERPRODUCTION',	'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION');

insert or replace into ModifierArguments
	(ModifierId,					Name,		Value)
values
	('SERFDOM_BUILDERPRODUCTION',	'UnitType',	'UNIT_BUILDER'),
	('SERFDOM_BUILDERPRODUCTION',	'Amount',	30);

-- Strategic Resource
update ModifierArguments set Value = 2 where Name = 'Amount' and
	(ModifierId = 'EQUESTRIAN_ORDERS_ADDITIONAL_HORSES_EXTRACTION'
	or ModifierId = 'EQUESTRIAN_ORDERS_ADDITIONAL_IRON_EXTRACTION'
	or ModifierId = 'DRILL_MANUALS_ADDITIONAL_NITER_EXTRACTION'
	or ModifierId = 'DRILL_MANUALS_ADDITIONAL_COAL_EXTRACTION'
	or ModifierId = 'RESOURCE_MANAGEMENT_ADDITIONAL_ALUMINUM_EXTRACTION'
	or ModifierId = 'RESOURCE_MANAGEMENT_ADDITIONAL_OIL_EXTRACTION');

-- POLICY_RATIONALISM
delete from PolicyModifiers where PolicyType = 'POLICY_RATIONALISM' and ModifierId = 'RATIONALISM_BUILDING_YIELDS_HIGH_ADJACENCY';
delete from PolicyModifiers where PolicyType = 'POLICY_RATIONALISM' and ModifierId = 'RATIONALISM_BUILDING_YIELDS_HIGH_POP';
-- POLICY_FREE_MARKET
delete from PolicyModifiers where PolicyType = 'POLICY_FREE_MARKET' and ModifierId = 'FREEMARKET_BUILDING_YIELDS_HIGH_ADJACENCY';
delete from PolicyModifiers where PolicyType = 'POLICY_FREE_MARKET' and ModifierId = 'FREEMARKET_BUILDING_YIELDS_HIGH_POP';
-- POLICY_GRAND_OPERA
delete from PolicyModifiers where PolicyType = 'POLICY_GRAND_OPERA' and ModifierId = 'GRANDOPERA_BUILDING_YIELDS_HIGH_ADJACENCY';
delete from PolicyModifiers where PolicyType = 'POLICY_GRAND_OPERA' and ModifierId = 'GRANDOPERA_BUILDING_YIELDS_HIGH_POP';


insert or replace into RequirementSets
	(RequirementSetId,											RequirementSetType)
values
	('BUILDING_IS_MUSEUM', 										'REQUIREMENTSET_TEST_ANY');


insert or replace into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	('BUILDING_IS_MUSEUM', 										'REQUIRES_CITY_HAS_BUILDING_MUSEUM_ART'),
	('BUILDING_IS_MUSEUM', 										'REQUIRES_CITY_HAS_BUILDING_MUSEUM_ARTIFACT');


insert or replace into PolicyModifiers
	(PolicyType,												ModifierId)
values
-- POLICY_RATIONALISM
	('POLICY_RATIONALISM',										'POLICY_RATIONALISM_REGIONAL_RANGE_BONUS'),
	('POLICY_RATIONALISM',										'POLICY_RATIONALISM_UNIVERSITY_POPULATION_SCIENCE'),
	('POLICY_RATIONALISM',										'POLICY_RATIONALISM_RESEARCH_LAB_POPULATION_SCIENCE'),
-- POLICY_FREE_MARKET
	('POLICY_FREE_MARKET',										'POLICY_FREE_MARKET_REGIONAL_RANGE_BONUS'),
	('POLICY_FREE_MARKET',										'POLICY_FREE_MARKET_BANK_POPULATION_GOLD'),
	('POLICY_FREE_MARKET',										'POLICY_FREE_MARKET_STOCK_EXCHANGE_POPULATION_GOLD'),
-- POLICY_GRAND_OPERA
	('POLICY_GRAND_OPERA',										'POLICY_GRAND_OPERA_REGIONAL_RANGE_BONUS'),
	('POLICY_GRAND_OPERA',										'POLICY_GRAND_OPERA_MUSEUM_POPULATION_CULTURE'),
	('POLICY_GRAND_OPERA',										'POLICY_GRAND_OPERA_BROADCAST_CENTER_POPULATION_CULTURE');


insert or replace into Modifiers
	(ModifierId,												ModifierType,												SubjectRequirementSetId)
values
-- POLICY_RATIONALISM
	('POLICY_RATIONALISM_REGIONAL_RANGE_BONUS',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',	'DISTRICT_IS_CAMPUS'	),
	('POLICY_RATIONALISM_UNIVERSITY_POPULATION_SCIENCE',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_UNIVERSITY'),
	('POLICY_RATIONALISM_RESEARCH_LAB_POPULATION_SCIENCE',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_RESEARCH_LAB'),
-- POLICY_FREE_MARKET
	('POLICY_FREE_MARKET_REGIONAL_RANGE_BONUS',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',	'DISTRICT_IS_COMMERCIAL_HUB'),
	('POLICY_FREE_MARKET_BANK_POPULATION_GOLD',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_BANK'),
	('POLICY_FREE_MARKET_STOCK_EXCHANGE_POPULATION_GOLD',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_STOCK_EXCHANGE'),
-- POLICY_GRAND_OPERA
	('POLICY_GRAND_OPERA_REGIONAL_RANGE_BONUS',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',	'DISTRICT_IS_THEATER'),
	('POLICY_GRAND_OPERA_MUSEUM_POPULATION_CULTURE',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_MUSEUM'),
	('POLICY_GRAND_OPERA_BROADCAST_CENTER_POPULATION_CULTURE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_BROADCAST_CENTER');


insert or replace into ModifierArguments
	(ModifierId,												Name,														Value)
values
-- POLICY_RATIONALISM
	('POLICY_RATIONALISM_REGIONAL_RANGE_BONUS',					'Amount',													3),
	('POLICY_RATIONALISM_UNIVERSITY_POPULATION_SCIENCE',		'YieldType',												'YIELD_SCIENCE'),
	('POLICY_RATIONALISM_UNIVERSITY_POPULATION_SCIENCE',		'Amount',													0.3),
	('POLICY_RATIONALISM_RESEARCH_LAB_POPULATION_SCIENCE',		'YieldType',												'YIELD_SCIENCE'),
	('POLICY_RATIONALISM_RESEARCH_LAB_POPULATION_SCIENCE',		'Amount',													0.5),
-- POLICY_FREE_MARKET
	('POLICY_FREE_MARKET_REGIONAL_RANGE_BONUS',					'Amount',													3),
	('POLICY_FREE_MARKET_BANK_POPULATION_GOLD',					'YieldType',												'YIELD_GOLD'),
	('POLICY_FREE_MARKET_BANK_POPULATION_GOLD',					'Amount',													0.6),
	('POLICY_FREE_MARKET_STOCK_EXCHANGE_POPULATION_GOLD',		'YieldType',												'YIELD_GOLD'),
	('POLICY_FREE_MARKET_STOCK_EXCHANGE_POPULATION_GOLD',		'Amount',													1),
-- POLICY_GRAND_OPERA
	('POLICY_GRAND_OPERA_REGIONAL_RANGE_BONUS',					'Amount',													3),
	('POLICY_GRAND_OPERA_MUSEUM_POPULATION_CULTURE',			'YieldType',												'YIELD_CULTURE'),
	('POLICY_GRAND_OPERA_MUSEUM_POPULATION_CULTURE',			'Amount',													0.3),
	('POLICY_GRAND_OPERA_BROADCAST_CENTER_POPULATION_CULTURE',	'YieldType',												'YIELD_CULTURE'),
	('POLICY_GRAND_OPERA_BROADCAST_CENTER_POPULATION_CULTURE',	'Amount',													0.5);

-- New Policy Cards
