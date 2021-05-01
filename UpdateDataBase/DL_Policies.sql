-------------------------------------
--      Policies Adjustments       --
-------------------------------------

-- Golden Age 
--雄伟壮丽移除信仰购买，打折变为20%
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_INFRASTRUCTURE' and ModifierId = 'COMMEMORATION_INFRASTRUCTURE_GA_PURCHASE_CIVILIAN';
insert or replace into CommemorationModifiers (CommemorationType, ModifierId) values
	('COMMEMORATION_INFRASTRUCTURE', 'COMMEMORATION_INFRASTRUCTURE_GA_SETTLER_MOVEMENT');
update ModifierArguments set Value = 20 where ModifierId = 'COMMEMORATION_INFRASTRUCTURE_BUILDER_DISCOUNT_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 20 where ModifierId = 'COMMEMORATION_INFRASTRUCTURE_SETTLER_DISCOUNT_MODIFIER' and Name = 'Amount';
--百花齐放每个区域2文化
update ModifierArguments set Value =2 where ModifierId = 'COMMEMORATION_CULTURAL_DISTRICTCULTURE' and Name = 'Amount';

insert or replace into Modifiers
	(ModifierId,											ModifierType,								SubjectRequirementSetId)
values
	('COMMEMORATION_INFRASTRUCTURE_GA_SETTLER_MOVEMENT',	'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',	'UNIT_IS_GOLDEN_AGE_SETTLER');

insert or replace into ModifierArguments
	(ModifierId,											Name,		Value)
values
	('COMMEMORATION_INFRASTRUCTURE_GA_SETTLER_MOVEMENT',	'Amount',	2);

-- Policy Cards
update ModifierArguments set Value = 2 where ModifierId = 'INSULAE_SPECIALTYHOUSING' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'CIVILPRESTIGE_GOVHOUSING' and Name = 'Amount';
update ModifierArguments set Value = 4 where ModifierId = 'MEDINAQUARTER_SPECIALTYHOUSING' and Name = 'Amount';

update ModifierArguments set Value = 5 where ModifierId = 'LIMITANEI_GARRISONIDENTITY' and Name = 'Amount';
update ModifierArguments set Value = 5 where ModifierId = 'PRAETORIUM_GOVERNORIDENTITY' and Name = 'Amount';

update ModifierArguments set Value = 3 where ModifierId = 'MARKETECONOMY_TRADEROUTECULTURE' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'MARKETECONOMY_TRADEROUTESCIENCE' and Name = 'Amount';

-- Remove effect: 25% less operation time for spy.
-- delete from PolicyModifiers where PolicyType = 'POLICY_MACHIAVELLIANISM' and ModifierId = 'MACHIAVELLIANISM_OFFENSIVESPYTIME';
-- Remove the Machiavellisnism Policy Card
delete from Policies where PolicyType = 'POLICY_MACHIAVELLIANISM';
delete from Policies where PolicyType = 'POLICY_DIPLOMATIC_LEAGUE';
delete from Policies where PolicyType = 'POLICY_PROFESSIONAL_ARMY';
delete from Policies where PolicyType = 'POLICY_FORCE_MODERNIZATION';
-- 
delete from Policies where PolicyType = 'POLICY_NATIVE_CONQUEST';
delete from Policies where PolicyType = 'POLICY_NATIONAL_IDENTITY';
delete from Policies where PolicyType = 'POLICY_PROPAGANDA';
delete from Policies where PolicyType = 'POLICY_NUCLEAR_ESPIONAGE';
delete from Policies where PolicyType = 'POLICY_AFTER_ACTION_REPORTS';
delete from Policies where PolicyType = 'POLICY_COMMUNICATIONS_OFFICE';

update ModifierArguments set Value = 100 where ModifierID = 'RAID_DOUBLEPILLAGEIMPROVE';
update ModifierArguments set Value = 100 where ModifierID = 'SACK_DOUBLEPILLAGEDISTRICT';
update ModifierArguments set Value = 200 where ModifierID = 'TOTALWAR_DOUBLEPILLAGEIMPROVE';
update ModifierArguments set Value = 200 where ModifierID = 'TOTALWAR_DOUBLEPILLAGEDISTRICT';
update ModifierArguments set Value = 200 where ModifierID = 'TOTAL_WAR_PLUNDER_BONUS';

update Governments set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where GovernmentType = 'GOVERNMENT_MONARCHY';

insert or replace into Government_SlotCounts
	(GovernmentType,					GovernmentSlotType,	NumSlots)
values
	('GOVERNMENT_MONARCHY',				'SLOT_MILITARY',	2),
	('GOVERNMENT_MONARCHY',				'SLOT_ECONOMIC',	2),
	('GOVERNMENT_MONARCHY',				'SLOT_DIPLOMATIC',	1),
	('GOVERNMENT_MONARCHY',				'SLOT_WILDCARD',	1),
	-- 
	('GOVERNMENT_THEOCRACY',			'SLOT_MILITARY',	2),
	('GOVERNMENT_THEOCRACY',			'SLOT_ECONOMIC',	1),
	('GOVERNMENT_THEOCRACY',			'SLOT_DIPLOMATIC',	1),
	('GOVERNMENT_THEOCRACY',			'SLOT_WILDCARD',	2),
	-- 
	('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_MILITARY',	1),
	('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_ECONOMIC',	2),
	('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_DIPLOMATIC',	1),
	('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_WILDCARD',	2),
	-- 
	('GOVERNMENT_FASCISM',				'SLOT_MILITARY',	3),
	('GOVERNMENT_FASCISM',				'SLOT_ECONOMIC',	2),
	('GOVERNMENT_FASCISM',				'SLOT_DIPLOMATIC',	1),
	('GOVERNMENT_FASCISM',				'SLOT_WILDCARD',	2),
	-- 
	('GOVERNMENT_COMMUNISM',			'SLOT_MILITARY',	2),
	('GOVERNMENT_COMMUNISM',			'SLOT_ECONOMIC',	3),
	('GOVERNMENT_COMMUNISM',			'SLOT_DIPLOMATIC',	1),
	('GOVERNMENT_COMMUNISM',			'SLOT_WILDCARD',	2),
	-- 
	('GOVERNMENT_DEMOCRACY',			'SLOT_MILITARY',	1),
	('GOVERNMENT_DEMOCRACY',			'SLOT_ECONOMIC',	3),
	('GOVERNMENT_DEMOCRACY',			'SLOT_DIPLOMATIC',	2),
	('GOVERNMENT_DEMOCRACY',			'SLOT_WILDCARD',	2);

-- update Government_SlotCounts set NumSlots = 2 where
-- 	GovernmentType = 'GOVERNMENT_MONARCHY' and GovernmentSlotType = 'SLOT_MILITARY';
-- update Government_SlotCounts set NumSlots = 2 where
-- 	GovernmentType = 'GOVERNMENT_MONARCHY' and GovernmentSlotType = 'SLOT_ECONOMIC';
-- update Government_SlotCounts set NumSlots = 1 where
-- 	GovernmentType = 'GOVERNMENT_MONARCHY' and GovernmentSlotType = 'SLOT_DIPLOMATIC';
-- update Government_SlotCounts set NumSlots = 1 where
-- 	GovernmentType = 'GOVERNMENT_MONARCHY' and GovernmentSlotType = 'SLOT_WILDCARD';
-- update Government_SlotCounts set NumSlots = 1 where
-- 	GovernmentType = 'GOVERNMENT_THEOCRACY' and GovernmentSlotType = 'SLOT_ECONOMIC';
-- update Government_SlotCounts set NumSlots = 2 where
-- 	GovernmentType = 'GOVERNMENT_THEOCRACY' and GovernmentSlotType = 'SLOT_WILDCARD';
-- update Government_SlotCounts set NumSlots = 2 where
-- 	GovernmentType = 'GOVERNMENT_COMMUNISM' and GovernmentSlotType = 'SLOT_WILDCARD';
-- update Government_SlotCounts set NumSlots = 2 where
-- 	GovernmentType = 'GOVERNMENT_COMMUNISM' and GovernmentSlotType = 'SLOT_MILITARY';
-- update Government_SlotCounts set NumSlots = 3 where
-- 	GovernmentType = 'GOVERNMENT_FASCISM' and GovernmentSlotType = 'SLOT_MILITARY';
-- update Government_SlotCounts set NumSlots = 2 where
-- 	GovernmentType = 'GOVERNMENT_FASCISM' and GovernmentSlotType = 'SLOT_ECONOMIC';

update Policies set PrereqCivic = 'CIVIC_MILITARY_TRADITION' where PolicyType = 'POLICY_CONSCRIPTION';
update Policies set PrereqCivic = 'CIVIC_STATE_WORKFORCE' where PolicyType = 'POLICY_INSULAE';
-- 
-- update Policies set PrereqCivic = 'CIVIC_DIVINE_RIGHT' where PolicyType = 'POLICY_MEDINA_QUARTER';
update Policies set PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES' where PolicyType = 'POLICY_TRADE_CONFEDERATION';
update Policies set PrereqCivic = 'CIVIC_FEUDALISM' where PolicyType = 'POLICY_CIVIL_PRESTIGE';
update Policies set PrereqCivic = 'CIVIC_MERCENARIES' where PolicyType = 'POLICY_RETAINERS';
-- update Policies set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where PolicyType = 'POLICY_GOTHIC_ARCHITECTURE';

update Policies set PrereqCivic = 'CIVIC_CLASS_STRUGGLE' where PolicyType = 'POLICY_FIVE_YEAR_PLAN';
update Policies set PrereqCivic = 'CIVIC_SUFFRAGE' where PolicyType = 'POLICY_ECONOMIC_UNION';
update Policies set PrereqCivic = 'CIVIC_TOTALITARIANISM' where PolicyType = 'POLICY_LIGHTNING_WARFARE';

update Policies set PrereqCivic = 'CIVIC_MILITARY_TRADITION' where PolicyType = 'POLICY_LIMITANEI';
update Policies set PrereqCivic = 'CIVIC_NAVAL_TRADITION' where PolicyType = 'POLICY_PRESS_GANGS';
update Policies set PrereqCivic = 'CIVIC_EXPLORATION' where PolicyType = 'POLICY_NAVIGATION';
update Policies set PrereqCivic = 'CIVIC_GAMES_RECREATION' where PolicyType = 'POLICY_TRADE_CONFEDERATION';

update ModifierArguments set Value = 15 where ModifierId = 'COMMUNISM_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE' and Name = 'Amount';
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE';
update ModifierArguments set Value = 4 where ModifierId = 'COLLECTIVIZATION_INTERNAL_TRADE_PRODUCTION' and Name = 'Amount';
update Modifiers set SubjectRequirementSetId = 'PLAYER_HAS_NO_DIPLOMATIC_QUARTER' where ModifierId = 'DIPLOMATICLEAGUE_DUPLICATEFIRSTINFLUENCETOKEN';

insert or replace into PolicyModifiers
	(PolicyType,						ModifierId)
values
	('POLICY_TRAVELING_MERCHANTS',		'TRAVELING_MERCHANTS_MARKET'),
	('POLICY_NAVIGATION',				'NAVIGATION_ADMIRAL_LIGHTHOUSE'),
	('POLICY_CHARISMATIC_LEADER',		'CHARISMATICLEADER_OPENBORDERS'),
	('POLICY_SERFDOM',					'SERFDOM_BUILDERPRODUCTION');

insert or replace into Modifiers
	(ModifierId,						ModifierType,											SubjectRequirementSetId)
values
	('TRAVELING_MERCHANTS_MARKET',		'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',		'BUILDING_IS_MARKET'),
	('NAVIGATION_ADMIRAL_LIGHTHOUSE',	'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',		'BUILDING_IS_LIGHTHOUSE');

insert or replace into Modifiers
	(ModifierId,						ModifierType)
values
	('CHARISMATICLEADER_OPENBORDERS',	'MODIFIER_ADJUST_OPEN_BORDERS_FROM_INFLUENCE'),
	('SERFDOM_BUILDERPRODUCTION',		'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION');

insert or replace into ModifierArguments
	(ModifierId,						Name,		Value)
values
	('TRAVELING_MERCHANTS_MARKET',		'GreatPersonClassType',	'GREAT_PERSON_CLASS_MERCHANT'),
	('TRAVELING_MERCHANTS_MARKET',		'Amount',	4),
	('NAVIGATION_ADMIRAL_LIGHTHOUSE',	'GreatPersonClassType',	'GREAT_PERSON_CLASS_ADMIRAL'),
	('NAVIGATION_ADMIRAL_LIGHTHOUSE',	'Amount',	4),
	('SERFDOM_BUILDERPRODUCTION',		'UnitType',	'UNIT_BUILDER'),
	('SERFDOM_BUILDERPRODUCTION',		'Amount',	30);

update ModifierArguments set Value = 1 where ModifierId = 'SERFDOM_BUILDERCHARGES' and Name = 'Amount';
-- dip cards
update ModifierArguments set Value = 3 where ModifierId = 'CHARISMATICLEADER_INFLUENCEPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 9 where ModifierId = 'GUNBOATDIPLOMACY_INFLUENCEPOINTS' and Name = 'Amount';

-- Strategic Resource
update ModifierArguments set Value = 2 where Name = 'Amount' and
	(ModifierId = 'EQUESTRIAN_ORDERS_ADDITIONAL_HORSES_EXTRACTION'
	or ModifierId = 'EQUESTRIAN_ORDERS_ADDITIONAL_IRON_EXTRACTION'
	or ModifierId = 'DRILL_MANUALS_ADDITIONAL_NITER_EXTRACTION'
	or ModifierId = 'DRILL_MANUALS_ADDITIONAL_COAL_EXTRACTION'
	or ModifierId = 'RESOURCE_MANAGEMENT_ADDITIONAL_ALUMINUM_EXTRACTION'
	or ModifierId = 'RESOURCE_MANAGEMENT_ADDITIONAL_OIL_EXTRACTION');

delete from PolicyModifiers where PolicyType = 'POLICY_SIMULTANEUM';

-- delete MONARCHY_STARFORT_FAVOR
delete from PolicyModifiers where ModifierId = 'MONARCHY_STARFORT_FAVOR';
delete from GovernmentModifiers where ModifierId = 'MONARCHY_STARFORT_FAVOR';

-- 陈又
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

-- 民主购买区域
insert or replace into Types
	(Type,											Kind)
values
	('MODIFIER_DEMOCRACY_ENABLE_DISTRICT_PURCHASE',	'KIND_MODIFIER');

insert or replace into DynamicModifiers
	(ModifierType,									CollectionType,									EffectType)
values
	('MODIFIER_DEMOCRACY_ENABLE_DISTRICT_PURCHASE',	'COLLECTION_OWNER',								'EFFECT_ADJUST_CITY_CAN_PURCHASE_DISTRICTS');

insert or replace into Modifiers
	(ModifierId,									ModifierType)
values
	('DEMOCRACY_ENABLE_DISTRICT_PURCHASE',			'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER'),
	('DEMOCRACY_ENABLE_DISTRICT_PURCHASE_MODIFIER',	'MODIFIER_DEMOCRACY_ENABLE_DISTRICT_PURCHASE');

insert or replace into GovernmentModifiers
	(GovernmentType,								ModifierId)
values
	('GOVERNMENT_DEMOCRACY',						'DEMOCRACY_ENABLE_DISTRICT_PURCHASE');

insert or replace into PolicyModifiers
	(PolicyType,									ModifierId)
values
	('POLICY_GOV_DEMOCRACY',						'DEMOCRACY_ENABLE_DISTRICT_PURCHASE');

insert or replace into ModifierArguments
	(ModifierId,									Name,											Value)
values
	('DEMOCRACY_ENABLE_DISTRICT_PURCHASE',			'ModifierId',									'DEMOCRACY_ENABLE_DISTRICT_PURCHASE_MODIFIER'),
	('DEMOCRACY_ENABLE_DISTRICT_PURCHASE_MODIFIER',	'CanPurchase',									1);

update ModifierArguments set Value = 25 where ModifierId = 'DEMOCRACY_GOLD_PURCHASE' and Name = 'Amount';

-- level-one district yield policies
--update ModifierArguments set Value = 50 where Name = 'Amount'
 	--and (ModifierID = 'AESTHETICS_DISTRICTCULTURE'
	--or ModifierID = 'CRAFTSMEN_DISTRICTPRODUCTION'
	--or ModifierID = 'NATURALPHILOSOPHY_DISTRICTSCIENCE'
	--or ModifierID = 'NAVALINFRASTRUCTURE_HARBORGOLD'
	--or ModifierID = 'SCRIPTURE_DISTRICTFAITH'
	--or ModifierID = 'TOWNCHARTERS_DISTRICTGOLD');

update ModifierArguments set Value = 50 where Name = 'Amount' and ModifierID = 'SCRIPTURE_DISTRICTFAITH';
-- New Policy Cards
insert or replace into Types
	(Type,								Kind)
values
	('POLICY_FREELANCERS',				'KIND_POLICY'),
	('POLICY_MARITIME_INFRASTRUCTURE',	'KIND_POLICY'),
	('POLICY_SEABORNE_SUPPLY',			'KIND_POLICY'),
	('POLICY_GARRISON_RECLAMATION',		'KIND_POLICY'),
	('POLICY_PRIMITIVE_COMMUNE',		'KIND_POLICY'),
	('POLICY_OVERALL_PLANNING',			'KIND_POLICY'),
	('POLICY_BARD',						'KIND_POLICY'),
	('POLICY_CIVILIZE',					'KIND_POLICY'),
	('POLICY_MINARET',					'KIND_POLICY'),
	('POLICY_DOMESTIC_TRADE',			'KIND_POLICY'),
	('POLICY_HIGHWAY',					'KIND_POLICY'),
	('POLICY_SILK_ROAD',				'KIND_POLICY'),
	('POLICY_WAREHOUSE',				'KIND_POLICY'),
	('POLICY_SAFETY_BOX',				'KIND_POLICY');
	--('POLICY_FINE_ARTS',				'KIND_POLICY'),
	--('POLICY_FREE_THOUGHTS',			'KIND_POLICY'),
	--('POLICY_TREASURE_FLEETS',			'KIND_POLICY'),
	--('POLICY_WORKERS_FACULTIES',		'KIND_POLICY'),
	--('POLICY_ENTREPRENEURSHIP',			'KIND_POLICY');

insert or replace into Policies
	(PolicyType,						Name,										Description,										PrereqCivic,					GovernmentSlotType)
values
	('POLICY_FREELANCERS',				'LOC_POLICY_FREELANCERS_NAME',				'LOC_POLICY_FREELANCERS_DESCRIPTION',				'CIVIC_MERCENARIES',			'SLOT_MILITARY'),
	('POLICY_MARITIME_INFRASTRUCTURE',	'LOC_POLICY_MARITIME_INFRASTRUCTURE_NAME',	'LOC_POLICY_MARITIME_INFRASTRUCTURE_DESCRIPTION',	'CIVIC_NAVAL_TRADITION',		'SLOT_ECONOMIC'),
	('POLICY_SEABORNE_SUPPLY',			'LOC_POLICY_SEABORNE_SUPPLY_NAME',			'LOC_POLICY_SEABORNE_SUPPLY_DESCRIPTION',			'CIVIC_EXPLORATION',			'SLOT_ECONOMIC'),
	('POLICY_GARRISON_RECLAMATION',		'LOC_POLICY_GARRISON_RECLAMATION_NAME',		'LOC_POLICY_GARRISON_RECLAMATION_DESCRIPTION',		'CIVIC_FEUDALISM',				'SLOT_MILITARY'),
	('POLICY_PRIMITIVE_COMMUNE',		'LOC_POLICY_PRIMITIVE_COMMUNE_NAME',		'LOC_POLICY_PRIMITIVE_COMMUNE_DESCRIPTION',			'CIVIC_CODE_OF_LAWS',			'SLOT_ECONOMIC'),
	('POLICY_OVERALL_PLANNING',			'LOC_POLICY_OVERALL_PLANNING_NAME',			'LOC_POLICY_OVERALL_PLANNING_DESCRIPTION',			'CIVIC_URBANIZATION',			'SLOT_ECONOMIC'),												
	('POLICY_BARD',						'LOC_POLICY_BARD_NAME',						'LOC_POLICY_BARD_DESCRIPTION',						'CIVIC_DRAMA_POETRY',			'SLOT_DIPLOMATIC'), -- 'CIVIC_EARLY_EMPIRE'
	('POLICY_CIVILIZE',					'LOC_POLICY_CIVILIZE_NAME',					'LOC_POLICY_CIVILIZE_DESCRIPTION',					'CIVIC_GAMES_RECREATION',		'SLOT_DIPLOMATIC'), --'CIVIC_STATE_WORKFORCE'
	-- 
	('POLICY_MINARET',					'LOC_POLICY_MINARET_NAME',					'LOC_POLICY_MINARET_DESCRIPTION',					'CIVIC_REFORMED_CHURCH',		'SLOT_ECONOMIC'),
	--
	('POLICY_DOMESTIC_TRADE',			'LOC_POLICY_DOMESTIC_TRADE_NAME',			'LOC_POLICY_DOMESTIC_TRADE_DESCRIPTION',			'CIVIC_GAMES_RECREATION',		'SLOT_ECONOMIC'),
	('POLICY_HIGHWAY',					'LOC_POLICY_HIGHWAY_NAME',					'LOC_POLICY_HIGHWAY_DESCRIPTION',					'CIVIC_MEDIEVAL_FAIRES',		'SLOT_ECONOMIC'),
	('POLICY_SILK_ROAD',				'LOC_POLICY_SILK_ROAD_NAME',				'LOC_POLICY_SILK_ROAD_DESCRIPTION',					'CIVIC_MEDIEVAL_FAIRES',		'SLOT_ECONOMIC'),
	('POLICY_WAREHOUSE',				'LOC_POLICY_WAREHOUSE_NAME',				'LOC_POLICY_WAREHOUSE_DESCRIPTION',					'CIVIC_STATE_WORKFORCE',		'SLOT_ECONOMIC'), --'CIVIC_GAMES_RECREATION',
	('POLICY_SAFETY_BOX',				'LOC_POLICY_SAFETY_BOX_NAME',				'LOC_POLICY_SAFETY_BOX_DESCRIPTION',				'CIVIC_EXPLORATION',			'SLOT_ECONOMIC');
	--('POLICY_FINE_ARTS',			'LOC_POLICY_FINE_ARTS_NAME',			'LOC_POLICY_FINE_ARTS_DESCRIPTION',				'CIVIC_OPERA_BALLET',		'SLOT_ECONOMIC'),
	--('POLICY_FREE_THOUGHTS',		'LOC_POLICY_FREE_THOUGHTS_NAME',		'LOC_POLICY_FREE_THOUGHTS_DESCRIPTION',			'CIVIC_THE_ENLIGHTENMENT',	'SLOT_ECONOMIC'),
	--('POLICY_TREASURE_FLEETS',		'LOC_POLICY_TREASURE_FLEETS_NAME',		'LOC_POLICY_TREASURE_FLEETS_DESCRIPTION',	'CIVIC_COLONIALISM',		'SLOT_ECONOMIC'),
	--('POLICY_WORKERS_FACULTIES',	'LOC_POLICY_WORKERS_FACULTIES_NAME',	'LOC_POLICY_WORKERS_FACULTIES_DESCRIPTION',		'CIVIC_CIVIL_ENGINEERING',	'SLOT_ECONOMIC'),
	--('POLICY_ENTREPRENEURSHIP',		'LOC_POLICY_ENTREPRENEURSHIP_NAME',		'LOC_POLICY_ENTREPRENEURSHIP_DESCRIPTION',	'CIVIC_MERCANTILISM',		'SLOT_ECONOMIC');

--update ObsoletePolicies set ObsoletePolicy = 'POLICY_FINE_ARTS' where PolicyType = 'POLICY_AESTHETICS';
--update ObsoletePolicies set ObsoletePolicy = 'POLICY_FREE_THOUGHTS' where PolicyType = 'POLICY_NATURAL_PHILOSOPHY';
--update ObsoletePolicies set ObsoletePolicy = 'POLICY_TREASURE_FLEETS' where PolicyType = 'POLICY_NAVAL_INFRASTRUCTURE';
--update ObsoletePolicies set ObsoletePolicy = 'POLICY_WORKERS_FACULTIES' where PolicyType = 'POLICY_CRAFTSMEN';
--update ObsoletePolicies set ObsoletePolicy = 'POLICY_ENTREPRENEURSHIP' where PolicyType = 'POLICY_TOWN_CHARTERS';
insert or replace into ObsoletePolicies
	(PolicyType,					ObsoletePolicy)
values
	('POLICY_MARITIME_INFRASTRUCTURE', 'POLICY_SEABORNE_SUPPLY'),
--	('POLICY_FINE_ARTS',			'POLICY_SPORTS_MEDIA'),
--	('POLICY_FREE_THOUGHTS',		'POLICY_FIVE_YEAR_PLAN'),
--	('POLICY_TREASURE_FLEETS',		'POLICY_ECONOMIC_UNION'),
--	('POLICY_WORKERS_FACULTIES',	'POLICY_FIVE_YEAR_PLAN'),
--	('POLICY_ENTREPRENEURSHIP',		'POLICY_ECONOMIC_UNION');
	('POLICY_SCRIPTURE',			'POLICY_SIMULTANEUM'),
	--
	('POLICY_DOMESTIC_TRADE',		'POLICY_HIGHWAY'),
	('POLICY_HIGHWAY',				'POLICY_COLLECTIVIZATION'),
	('POLICY_TRADE_CONFEDERATION',	'POLICY_SILK_ROAD'),
	('POLICY_SILK_ROAD',			'POLICY_MARKET_ECONOMY'),
	('POLICY_WAREHOUSE',			'POLICY_SAFETY_BOX');

delete from ObsoletePolicies where PolicyType = 'POLICY_URBAN_PLANNING';
delete from ObsoletePolicies where PolicyType = 'POLICY_RETAINERS';
delete from ObsoletePolicies where PolicyType = 'POLICY_CARAVANSARIES';
delete from Modifiers where ModifierId = 'CARAVANSARIES_TRADEROUTEGOLD';
insert or replace into PolicyModifiers
	(PolicyType,						ModifierId)
values
	('POLICY_FREELANCERS',				'FREELANCERS_GARRISON_GOLD'),
	('POLICY_MARITIME_INFRASTRUCTURE',	'MARITIME_INFRASTRUCTURE_COASTAL_CITY_PROD'),
	('POLICY_SEABORNE_SUPPLY',			'SEABORNE_SUPPLY_COASTAL_CITY_PROD'),
	('POLICY_GARRISON_RECLAMATION',		'GARRISON_RECLAMATION_ENCAMPMENT_FOOD'),
	('POLICY_GARRISON_RECLAMATION',		'GARRISON_RECLAMATION_ENCAMPMENT_HOUSING'),
	('POLICY_PRIMITIVE_COMMUNE',		'PRIMITIVE_COMMUNE_ALLCITYFOOD'),
	('POLICY_OVERALL_PLANNING',			'MINOR_CIV_MEXICO_CITY_REGIONAL_RANGE_BONUS'),
	('POLICY_BARD',						'BARD_ALLCITYCULTURE'),
	('POLICY_CIVILIZE',					'CIVILIZE_ALLCITYSCIENCE'),
	('POLICY_CARAVANSARIES',			'CARAVANSARIES_ALLCITYGOLD'),
	('POLICY_MINARET',					'MINARET_TEMPLE_POP_FAITH'),
	('POLICY_MINARET',					'MINARET_TIER3_BUILDING_POP_FAITH'),
--	('POLICY_FINE_ARTS',				'FINE_ARTS_DISTRICTCULTURE'),
--	('POLICY_FREE_THOUGHTS',			'FREE_THOUGHTS_DISTRICTSCIENCE'),
--	('POLICY_TREASURE_FLEETS',			'TREASURE_FLEETS_HARBORGOLD'),
--	('POLICY_WORKERS_FACULTIES',		'WORKERS_FACULTIES_DISTRICTPRODUCTION'),
--	('POLICY_ENTREPRENEURSHIP',			'ENTREPRENEURSHIP_DISTRICTGOLD'),
	('POLICY_SIMULTANEUM',				'SIMULTANEUM_DISTRICTFAITH'),
	--
	('POLICY_DOMESTIC_TRADE',			'POLICY_DOMESTIC_TRADE_ROUTE_FOOD'),
	('POLICY_DOMESTIC_TRADE',			'POLICY_DOMESTIC_TRADE_ROUTE_PRODUCTION'),
	('POLICY_HIGHWAY',					'HIGHWAY_DOMESTIC_TRADE_ROUTE_FOOD'),
	('POLICY_HIGHWAY',					'HIGHWAY_DOMESTIC_TRADE_ROUTE_PRODUCTION'),
	('POLICY_SILK_ROAD',				'SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_CULTURE'),
	('POLICY_SILK_ROAD',				'SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_SCIENCE'),
	('POLICY_WAREHOUSE',				'WAREHOUSE_PRODUCTION_FOR_COMMERCIAL_HUB'),
	('POLICY_SAFETY_BOX',				'SAFETY_BOX_PRODUCTION_FOR_COMMERCIAL_HUB');

insert or replace into Modifiers
	(ModifierId,								ModifierType,												SubjectRequirementSetId)
values
	('FREELANCERS_GARRISON_GOLD',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
	('MARITIME_INFRASTRUCTURE_COASTAL_CITY_PROD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'PLOT_IS_ADJACENT_TO_COAST'),
	('SEABORNE_SUPPLY_COASTAL_CITY_PROD', 		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			'PLOT_IS_ADJACENT_TO_COAST'),
	('GARRISON_RECLAMATION_ENCAMPMENT_FOOD',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			'CITY_HAS_ENCAMPMENT'),
	('GARRISON_RECLAMATION_ENCAMPMENT_HOUSING',	'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',				'CITY_HAS_ENCAMPMENT'),
	('MINARET_TEMPLE_POP_FAITH',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_TEMPLE_XP2'),
	('MINARET_TIER3_BUILDING_POP_FAITH',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_TIER3_HOLY_SITE'),
	('PRIMITIVE_COMMUNE_ALLCITYFOOD',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
	('SHAMAN_ALLCITYFAITH',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
	('BARD_ALLCITYCULTURE',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
	('CIVILIZE_ALLCITYSCIENCE',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
	('CARAVANSARIES_ALLCITYGOLD',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
--	('FINE_ARTS_DISTRICTCULTURE',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_THEATER'),
--	('FREE_THOUGHTS_DISTRICTSCIENCE',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_CAMPUS'),
--	('TREASURE_FLEETS_HARBORGOLD',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_HARBOR'),
--	('WORKERS_FACULTIES_DISTRICTPRODUCTION',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_INDUSTRIAL_ZONE'),
--	('ENTREPRENEURSHIP_DISTRICTGOLD',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_COMMERCIAL_HUB'),
	('SIMULTANEUM_DISTRICTFAITH',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_HOLY_SITE'),
	--
	('POLICY_DOMESTIC_TRADE_ROUTE_FOOD',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',	NULL),
	('POLICY_DOMESTIC_TRADE_ROUTE_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',	NULL),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_FOOD',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',	NULL),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',	NULL),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_CULTURE',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',	NULL),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_SCIENCE',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',	NULL),
	('WAREHOUSE_PRODUCTION_FOR_COMMERCIAL_HUB',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			'CITY_HAS_COMMERCIAL_HUB_REQUIREMENTS'),
	('SAFETY_BOX_PRODUCTION_FOR_COMMERCIAL_HUB',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'CITY_HAS_COMMERCIAL_HUB_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('FREELANCERS_GARRISON_GOLD',				'YieldType',	'YIELD_GOLD'),
	('FREELANCERS_GARRISON_GOLD',				'Amount',		5),
	('MARITIME_INFRASTRUCTURE_COASTAL_CITY_PROD', 'YieldType',	'YIELD_PRODUCTION'),
	('MARITIME_INFRASTRUCTURE_COASTAL_CITY_PROD', 'Amount',		2),
	('SEABORNE_SUPPLY_COASTAL_CITY_PROD',		'YieldType',	'YIELD_PRODUCTION'),
	('SEABORNE_SUPPLY_COASTAL_CITY_PROD',		'Amount',		4),
	('GARRISON_RECLAMATION_ENCAMPMENT_FOOD',	'YieldType',	'YIELD_FOOD'),
	('GARRISON_RECLAMATION_ENCAMPMENT_FOOD',	'Amount',		4),
	('GARRISON_RECLAMATION_ENCAMPMENT_HOUSING',	'Amount',		2),
	('PRIMITIVE_COMMUNE_ALLCITYFOOD',			'YieldType',	'YIELD_FOOD'),
	('PRIMITIVE_COMMUNE_ALLCITYFOOD',			'Amount',		1),
	('SHAMAN_ALLCITYFAITH',						'YieldType',	'YIELD_FAITH'),
	('SHAMAN_ALLCITYFAITH',						'Amount',		1),
	('BARD_ALLCITYCULTURE',						'YieldType',	'YIELD_CULTURE'),
	('BARD_ALLCITYCULTURE',						'Amount',		1),
	('CIVILIZE_ALLCITYSCIENCE',					'YieldType',	'YIELD_SCIENCE'),
	('CIVILIZE_ALLCITYSCIENCE',					'Amount',		1),
	('CARAVANSARIES_ALLCITYGOLD',				'YieldType',	'YIELD_GOLD'),
	('CARAVANSARIES_ALLCITYGOLD',				'Amount',		2),
	('MINARET_TEMPLE_POP_FAITH',				'YieldType',	'YIELD_FAITH'),
	('MINARET_TEMPLE_POP_FAITH',				'Amount',		0.3),
	('MINARET_TIER3_BUILDING_POP_FAITH',		'YieldType',	'YIELD_FAITH'),
	('MINARET_TIER3_BUILDING_POP_FAITH',		'Amount',		0.5),
--	('FINE_ARTS_DISTRICTCULTURE',				'YieldType',	'YIELD_CULTURE'),
--	('FINE_ARTS_DISTRICTCULTURE',				'Amount',		100),
--	('FREE_THOUGHTS_DISTRICTSCIENCE',			'YieldType',	'YIELD_SCIENCE'),
--	('FREE_THOUGHTS_DISTRICTSCIENCE',			'Amount',		100),
--	('TREASURE_FLEETS_HARBORGOLD',				'YieldType',	'YIELD_GOLD'),
--	('TREASURE_FLEETS_HARBORGOLD',				'Amount',		100),
--	('WORKERS_FACULTIES_DISTRICTPRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
--	('WORKERS_FACULTIES_DISTRICTPRODUCTION',	'Amount',		100),
--	('ENTREPRENEURSHIP_DISTRICTGOLD',			'YieldType',	'YIELD_GOLD'),
--	('ENTREPRENEURSHIP_DISTRICTGOLD',			'Amount',		100),
	('SIMULTANEUM_DISTRICTFAITH',				'YieldType',	'YIELD_FAITH'),
	('SIMULTANEUM_DISTRICTFAITH',				'Amount',		100),
	--
	('POLICY_DOMESTIC_TRADE_ROUTE_FOOD',		'YieldType',	'YIELD_FOOD'),
	('POLICY_DOMESTIC_TRADE_ROUTE_FOOD',		'Amount',		1),
	('POLICY_DOMESTIC_TRADE_ROUTE_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('POLICY_DOMESTIC_TRADE_ROUTE_PRODUCTION',	'Amount',		1),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_FOOD',		'YieldType',	'YIELD_FOOD'),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_FOOD',		'Amount',		2),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_PRODUCTION',	'Amount',		2),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_CULTURE',	'YieldType',	'YIELD_CULTURE'),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_CULTURE',	'Amount',		2),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_SCIENCE',	'YieldType',	'YIELD_SCIENCE'),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_SCIENCE',	'Amount',		2),
	('WAREHOUSE_PRODUCTION_FOR_COMMERCIAL_HUB',	'YieldType',	'YIELD_PRODUCTION'),
	('WAREHOUSE_PRODUCTION_FOR_COMMERCIAL_HUB',	'Amount',		2),
	('SAFETY_BOX_PRODUCTION_FOR_COMMERCIAL_HUB',	'YieldType',	'YIELD_PRODUCTION'),
	('SAFETY_BOX_PRODUCTION_FOR_COMMERCIAL_HUB',	'Amount',		4);

-- DeepLogic
-- 独裁效果调整
update ModifierArguments set Value = 2 where Name = 'Amount' and (
	ModifierId = 'AUTOCRACY_CAPITAL'
 or ModifierId = 'AUTOCRACY_TIER1'
 or ModifierId = 'AUTOCRACY_TIER2'
 or ModifierId = 'AUTOCRACY_TIER3'
 or ModifierId = 'CONSULATE_TIER1'
 or ModifierId = 'CHANCERY_TIER2');

insert or replace into PolicyModifiers
	(PolicyType,	ModifierId)
values
	('POLICY_GOV_AUTOCRACY',	'AUTOCRACY_GOV');

insert or replace into GovernmentModifiers
	(GovernmentType,	ModifierId)
values
	('GOVERNMENT_AUTOCRACY',	'AUTOCRACY_GOV');

insert or replace into Modifiers
	(ModifierId,		ModifierType,	SubjectRequirementSetId)
values
	('AUTOCRACY_GOV',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE',	'CITY_HAS_GOV_DISTRICT');

insert or replace into ModifierArguments
	(ModifierId, 			Name, 		Value)
values
	('AUTOCRACY_GOV',		'Amount',	2);

--By 利牙菠萝 君主制及传承效果调整
delete from GovernmentModifiers where GovernmentType = 'GOVERNMENT_MONARCHY' and ModifierId = 'MONARCHY_WALLS_HOUSING';
delete from GovernmentModifiers where GovernmentType = 'GOVERNMENT_MONARCHY' and ModifierId = 'MONARCHY_CASTLE_HOUSING';
delete from GovernmentModifiers where GovernmentType = 'GOVERNMENT_MONARCHY' and ModifierId = 'MONARCHY_STARFORT_HOUSING';

delete from PolicyModifiers where PolicyType = 'POLICY_GOV_MONARCHY' and ModifierId = 'MONARCHY_WALLS_HOUSING';
delete from PolicyModifiers where PolicyType = 'POLICY_GOV_MONARCHY' and ModifierId = 'MONARCHY_CASTLE_HOUSING';
delete from PolicyModifiers where PolicyType = 'POLICY_GOV_MONARCHY' and ModifierId = 'MONARCHY_STARFORT_HOUSING';

insert or replace into GovernmentModifiers
	(GovernmentType,						ModifierId)
values
	('GOVERNMENT_MONARCHY',					'MONARCHY_CITYGROWTH_BONUS'),
	('GOVERNMENT_MONARCHY',					'MONARCHY_UNITPRODUCTION_BONUS'),
	('GOVERNMENT_MONARCHY',					'MONARCHY_GOLD_BONUS');

insert or replace into PolicyModifiers
	(PolicyType,							ModifierId)
values
	('POLICY_GOV_MONARCHY',					'MONARCHY_CITYGROWTH_BONUS'),
	('POLICY_GOV_MONARCHY',					'MONARCHY_UNITPRODUCTION_BONUS'),
	('POLICY_GOV_MONARCHY',					'MONARCHY_GOLD_BONUS');

insert or replace into Modifiers
	(ModifierId,							ModifierType,												SubjectRequirementSetId)
values
	('MONARCHY_CITYGROWTH_BONUS',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH',				'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
	('MONARCHY_UNITPRODUCTION_BONUS',		'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PRODUCTION_MODIFIER',	'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
	('MONARCHY_GOLD_BONUS',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'CITY_HAS_GARRISON_UNIT_REQUIERMENT');

insert or replace into ModifierArguments
	(ModifierId,							Name,														Value)
values
	('MONARCHY_CITYGROWTH_BONUS',			'Amount',													10),
	('MONARCHY_UNITPRODUCTION_BONUS',		'Amount',													20),
	('MONARCHY_GOLD_BONUS',					'YieldType',												'YIELD_GOLD'),
	('MONARCHY_GOLD_BONUS',					'Amount',													10);

insert or replace into Policy_GovernmentExclusives_XP2
	(PolicyType,					GovernmentType)
values
	('POLICY_MINARET',				'GOVERNMENT_THEOCRACY'),
	('POLICY_FIVE_YEAR_PLAN',		'GOVERNMENT_COMMUNISM'),
	('POLICY_ECONOMIC_UNION',		'GOVERNMENT_DEMOCRACY'),
	('POLICY_LIGHTNING_WARFARE',	'GOVERNMENT_FASCISM'),
	('POLICY_FIVE_YEAR_PLAN',		'GOVERNMENT_SYNTHETIC_TECHNOCRACY'),
	('POLICY_ECONOMIC_UNION',		'GOVERNMENT_DIGITAL_DEMOCRACY'),
	('POLICY_LIGHTNING_WARFARE',	'GOVERNMENT_CORPORATE_LIBERTARIANISM');

--Democracy discount -25%
--update ModifierArguments set Value = 25 where ModifierId = 'DEMOCRACY_GOLD_PURCHASE' and Name = 'Amount';

delete from Policies where PolicyType = 'POLICY_LAND_SURVEYORS';

-- 商共效果
insert or replace into GovernmentModifiers
	(GovernmentType,					ModifierId)
values
	('GOVERNMENT_MERCHANT_REPUBLIC',	'MERCHANT_REPUBLIC_GOLD_PURCHASE'),
	('GOVERNMENT_MERCHANT_REPUBLIC',	'LANDSURVEYORS_PLOTPURCHASECOST');

insert or replace into Modifiers
	(ModifierId,							ModifierType)
values
	('MERCHANT_REPUBLIC_GOLD_PURCHASE',		'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS');

insert or replace into ModifierArguments
	(ModifierId,						Name,			Value)
values
	('MERCHANT_REPUBLIC_GOLD_PURCHASE',	'BonusType',	'GOVERNMENTBONUS_GOLD_PURCHASES'),
	('MERCHANT_REPUBLIC_GOLD_PURCHASE',	'Amount',		15);

-- Speed Up Military Cards
update ModifierArguments set Value = 30 where Name = 'Amount' and
	(  ModifierId = 'MANEUVER_ANCIENT_HEAVY_CAVALRY_PRODUCTION'
	or ModifierId = 'MANEUVER_CLASSICAL_HEAVY_CAVALRY_PRODUCTION'
	or ModifierId = 'MANEUVER_ANCIENT_LIGHT_CAVALRY_PRODUCTION'
	or ModifierId = 'MANEUVER_CLASSICAL_LIGHT_CAVALRY_PRODUCTION'
	or ModifierId = 'CHIVALRY_MEDIEVAL_HEAVY_CAVALRY_PRODUCTION'
	or ModifierId = 'CHIVALRY_RENAISSANCE_HEAVY_CAVALRY_PRODUCTION'
	or ModifierId = 'CHIVALRY_INDUSTRIAL_HEAVY_CAVALRY_PRODUCTION'
	or ModifierId = 'CHIVALRY_MEDIEVAL_LIGHT_CAVALRY_PRODUCTION'
	or ModifierId = 'CHIVALRY_RENAISSANCE_LIGHT_CAVALRY_PRODUCTION'
	or ModifierId = 'CHIVALRY_INDUSTRIAL_LIGHT_CAVALRY_PRODUCTION'
	-- 
	or ModifierId = 'AGOGE_ANCIENT_MELEE_PRODUCTION'
	or ModifierId = 'AGOGE_CLASSICAL_MELEE_PRODUCTION'
	or ModifierId = 'AGOGE_ANCIENT_ANTI_CAVALRY_PRODUCTION'
	or ModifierId = 'AGOGE_CLASSICAL_ANTI_CAVALRY_PRODUCTION'
	or ModifierId = 'AGOGE_ANCIENT_RANGED_PRODUCTION'
	or ModifierId = 'FEUDALCONTRACT_MEDIEVAL_MELEE_PRODUCTION'
	or ModifierId = 'FEUDALCONTRACT_RENAISSANCE_MELEE_PRODUCTION'
	or ModifierId = 'FEUDALCONTRACT_MEDIEVAL_ANTI_CAVALRY_PRODUCTION'
	or ModifierId = 'FEUDALCONTRACT_RENAISSANCE_ANTI_CAVALRY_PRODUCTION'
	or ModifierId = 'FEUDALCONTRACT_MEDIEVAL_RANGED_PRODUCTION'
	or ModifierId = 'FEUDALCONTRACT_RENAISSANCE_RANGED_PRODUCTION');

update ModifierArguments set Value = 60 where Name = 'Amount' and
	(  ModifierId = 'MARITIMIEINDUSTRIES_ANCIENT_NAVAL_MELEE_PRODUCTION'
	or ModifierId = 'MARITIMIEINDUSTRIES_CLASSICAL_NAVAL_MELEE_PRODUCTION'
	or ModifierId = 'MARITIMIEINDUSTRIES_ANCIENT_NAVAL_RANGED_PRODUCTION'
	or ModifierId = 'MARITIMIEINDUSTRIES_CLASSICAL_NAVAL_RANGED_PRODUCTION'
	or ModifierId = 'MARITIMIEINDUSTRIES_ANCIENT_NAVAL_RAIDER_PRODUCTION'
	or ModifierId = 'MARITIMIEINDUSTRIES_CLASSICAL_NAVAL_RAIDER_PRODUCTION'
	or ModifierId = 'PRESSGANGS_MEDIEVAL_NAVAL_MELEE_PRODUCTION'
	or ModifierId = 'PRESSGANGS_MEDIEVAL_NAVAL_RANGED_PRODUCTION'
	or ModifierId = 'PRESSGANGS_MEDIEVAL_NAVAL_RAIDER_PRODUCTION'
	or ModifierId = 'PRESSGANGS_RENAISSANCE_NAVAL_MELEE_PRODUCTION'
	or ModifierId = 'PRESSGANGS_INDUSTRIAL_NAVAL_MELEE_PRODUCTION'
	or ModifierId = 'PRESSGANGS_RENAISSANCE_NAVAL_RANGED_PRODUCTION'
	or ModifierId = 'PRESSGANGS_INDUSTRIAL_NAVAL_RANGED_PRODUCTION'
	or ModifierId = 'PRESSGANGS_RENAISSANCE_NAVAL_RAIDER_PRODUCTION'
	or ModifierId = 'PRESSGANGS_INDUSTRIAL_NAVAL_RAIDER_PRODUCTION');

update ModifierArguments set Value = 2 where ModifierId = 'INSULAE_SPECIALTYHOUSING';
update ModifierArguments set Value = 4 where ModifierId = 'MEDINAQUARTER_SPECIALTYHOUSING';	

--集体主义合成砖家可用。
insert or replace into Policy_GovernmentExclusives_XP2
	(PolicyType,                    GovernmentType)
values
	('POLICY_COLLECTIVIZATION',     'GOVERNMENT_SYNTHETIC_TECHNOCRACY');