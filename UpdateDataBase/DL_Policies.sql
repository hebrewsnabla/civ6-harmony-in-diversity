-- Golden Age Commemorations
-- Era Adjustment
update CommemorationTypes set MaximumGameEra = 'ERA_INDUSTRIAL' where CommemorationType = 'COMMEMORATION_EXPLORATION' or CommemorationType = 'COMMEMORATION_ECONOMIC';
update CommemorationTypes set MaximumGameEra = 'ERA_MEDIEVAL' where CommemorationType = 'COMMEMORATION_INFRASTRUCTURE';
update CommemorationTypes set MinimumGameEra = 'ERA_MODERN' where CommemorationType = 'COMMEMORATION_TOURISM' or CommemorationType = 'COMMEMORATION_ESPIONAGE' or CommemorationType = 'COMMEMORATION_MILITARY';
-- Free Inquiry
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_SCIENTIFIC' and ModifierId = 'COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB';
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_SCIENTIFIC' and ModifierId = 'COMMEMORATION_SCIENTIFIC_GA_HARBOR';
create temporary table FreeInquiryBuffedObjects (ObjectType text not null primary key);
insert or replace into FreeInquiryBuffedObjects (ObjectType) select BuildingType from HD_BuildingTiers;
insert or replace into FreeInquiryBuffedObjects (ObjectType) select DistrictType from Districts where DistrictType != 'DISTRICT_WONDER';
insert or replace into RequirementSets
    (RequirementSetId,                             RequirementSetType)
select
    'PLAYER_HAS_GOLDEN_AGE_AND_' || ObjectType,    'REQUIREMENTSET_TEST_ALL'
from FreeInquiryBuffedObjects;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                             RequirementId)
select
    'PLAYER_HAS_GOLDEN_AGE_AND_' || ObjectType,    'REQUIRES_PLAYER_HAS_' || ObjectType
from FreeInquiryBuffedObjects;
insert or replace into RequirementSetRequirements
    (RequirementSetId,                             RequirementId)
select
    'PLAYER_HAS_GOLDEN_AGE_AND_' || ObjectType,    'REQUIRES_PLAYER_HAS_GOLDEN_AGE'
from FreeInquiryBuffedObjects;
insert or replace into CommemorationModifiers
    (CommemorationType,         ModifierId)
select
    'COMMEMORATION_SCIENTIFIC', 'COMMEMORATION_SCIENTIFIC_' || ObjectType || '_SCIENCE'
from FreeInquiryBuffedObjects;
insert or replace into Modifiers
    (ModifierId,                                              ModifierType,                                               OwnerRequirementSetId)
select
    'COMMEMORATION_SCIENTIFIC_' || ObjectType || '_SCIENCE',  'MODIFIER_PLAYER_CAPITAL_CITY_ADJUST_CITY_YIELD_CHANGE',    'PLAYER_HAS_GOLDEN_AGE_AND_' || ObjectType
from FreeInquiryBuffedObjects;
insert or replace into ModifierArguments
    (ModifierId,                                              Name,           Value)
select
    'COMMEMORATION_SCIENTIFIC_' || ObjectType || '_SCIENCE',  'YieldType',    'YIELD_SCIENCE'
from FreeInquiryBuffedObjects;
insert or replace into ModifierArguments
    (ModifierId,                                              Name,           Value)
select
    'COMMEMORATION_SCIENTIFIC_' || ObjectType || '_SCIENCE',  'Amount',       1
from FreeInquiryBuffedObjects;
-- Pen, Brush, and Voice
update ModifierArguments set Value = 2 where ModifierId = 'COMMEMORATION_CULTURAL_DISTRICTCULTURE' and Name = 'Amount';
-- Monumentality
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_INFRASTRUCTURE' and ModifierId != 'COMMEMORATION_INFRASTRUCTURE_QUEST';
insert or replace into CommemorationModifiers
	(CommemorationType,					ModifierId)
values
	('COMMEMORATION_INFRASTRUCTURE',	'COMMEMORATION_WONDER_PRODUCTION'),
	('COMMEMORATION_INFRASTRUCTURE',	'COMMEMORATION_WONDER_CULTURE'),
	('COMMEMORATION_INFRASTRUCTURE',	'COMMEMORATION_WONDER_FAITH'),
	('COMMEMORATION_INFRASTRUCTURE',	'COMMEMORATION_WONDER_EXTRA_DISTRICT');
insert or replace into Modifiers
	(ModifierId,								ModifierType,											OwnerRequirementSetId,		SubjectRequirementSetId)
values
	('COMMEMORATION_WONDER_PRODUCTION',			'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_PRODUCTION',		'PLAYER_HAS_GOLDEN_AGE',	null),
	('COMMEMORATION_WONDER_CULTURE',			'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_YIELD_CHANGE',	'PLAYER_HAS_GOLDEN_AGE',	null),
	('COMMEMORATION_WONDER_FAITH',				'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_YIELD_CHANGE',	'PLAYER_HAS_GOLDEN_AGE',	null),
	('COMMEMORATION_WONDER_EXTRA_DISTRICT',		'MODIFIER_PLAYER_CITIES_EXTRA_DISTRICT',				'PLAYER_HAS_GOLDEN_AGE',	'DL_CITY_HAS_WONDER_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,								Name,												Value)
values
	('COMMEMORATION_WONDER_PRODUCTION',			'Amount',		15),
	('COMMEMORATION_WONDER_CULTURE',			'YieldType',	'YIELD_CULTURE'),
	('COMMEMORATION_WONDER_CULTURE',			'Amount',		1),
	('COMMEMORATION_WONDER_FAITH',				'YieldType',	'YIELD_FAITH'),
	('COMMEMORATION_WONDER_FAITH',				'Amount',		1),
	('COMMEMORATION_WONDER_EXTRA_DISTRICT',		'Amount',		1);
-- Exodus of the Evangelists
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_RELIGIOUS' and (ModifierId = 'COMMEMORATION_RELIGIOUS_GA_GREAT_PROPHET_POINTS' or ModifierId = 'COMMEMORATION_RELIGIOUS_GA_CHARGES');
insert or replace into CommemorationModifiers
	(CommemorationType,					ModifierId)
values
	('COMMEMORATION_RELIGIOUS',			'COMMEMORATION_RELIGIOUS_FAITH'),
	('COMMEMORATION_RELIGIOUS',			'COMMEMORATION_RELIGIOUS_CHARGE');
insert or replace into Modifiers
	(ModifierId,								ModifierType,											OwnerRequirementSetId,		SubjectRequirementSetId)
values
	('COMMEMORATION_RELIGIOUS_FAITH',			'MODIFIER_PLAYER_RELIGION_ADD_PLAYER_BELIEF_YIELD',		'PLAYER_HAS_GOLDEN_AGE',	null),
	('COMMEMORATION_RELIGIOUS_CHARGE',			'MODIFIER_PLAYER_UNITS_RELIGIOUS_SPREADS',				'PLAYER_HAS_GOLDEN_AGE',	'UNIT_IS_RELIGIOUS');
insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
values
	('COMMEMORATION_RELIGIOUS_FAITH',			'BeliefYieldType',		'BELIEF_YIELD_PER_FOREIGN_CITY'),
	('COMMEMORATION_RELIGIOUS_FAITH',			'PerXItems',			1),
	('COMMEMORATION_RELIGIOUS_FAITH',			'YieldType',			'YIELD_FAITH'),
	('COMMEMORATION_RELIGIOUS_FAITH',			'Amount',				6),
	('COMMEMORATION_RELIGIOUS_CHARGE',			'Amount',				2);
-- New Commemoration: Enlightened Despotism
insert or replace into Types
	(Type,								Kind)
values
	('COMMEMORATION_GOVERNMENT',		'KIND_MOMENT_OUTCOME');
insert or replace into CommemorationTypes
	(CommemorationType,					CategoryDescription,				GoldenAgeBonusDescription,							NormalAgeBonusDescription,							DarkAgeBonusDescription,							MinimumGameEra,			MaximumGameEra)
values
	('COMMEMORATION_GOVERNMENT',		'LOC_MOMENT_CATEGORY_GOVERNMENT',	'LOC_MOMENT_CATEGORY_GOVERNMENT_BONUS_GOLDEN_AGE',	'LOC_MOMENT_CATEGORY_GOVERNMENT_BONUS_NORMAL_AGE',	'LOC_MOMENT_CATEGORY_GOVERNMENT_BONUS_DARK_AGE',	'ERA_RENAISSANCE',		'ERA_INDUSTRIAL');
insert or replace into CommemorationModifiers
	(CommemorationType,					ModifierId)
values
	('COMMEMORATION_GOVERNMENT',		'COMMEMORATION_GOVERNMENT_ADD_SLOT'),
	('COMMEMORATION_GOVERNMENT',		'COMMEMORATION_GOVERNMENT_BOOST_CULTURE'),
	('COMMEMORATION_GOVERNMENT',		'COMMEMORATION_GOVERNMENT_QUEST');
insert or replace into Modifiers
	(ModifierId,								ModifierType,													OwnerRequirementSetId,		SubjectRequirementSetId)
values
	('COMMEMORATION_GOVERNMENT_ADD_SLOT',		'MODIFIER_PLAYER_CULTURE_ADJUST_GOVERNMENT_SLOTS_MODIFIER',		'PLAYER_HAS_GOLDEN_AGE',	null),
	('COMMEMORATION_GOVERNMENT_BOOST_CULTURE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',			'PLAYER_HAS_GOLDEN_AGE',	null),
	('COMMEMORATION_GOVERNMENT_QUEST',			'MODIFIER_PLAYER_ADJUST_PLAYER_ERA_SCORE_PER_PRIDE_MOMENT',		null,						'PLAYER_ELIGIBLE_FOR_COMMEMORATION_QUEST');
insert or replace into ModifierArguments
	(ModifierId,								Name,					Value)
values
	('COMMEMORATION_GOVERNMENT_ADD_SLOT',		'GovernmentSlotType',	'SLOT_WILDCARD'),
	('COMMEMORATION_GOVERNMENT_BOOST_CULTURE',	'YieldType',			'YIELD_CULTURE'),
	('COMMEMORATION_GOVERNMENT_BOOST_CULTURE',	'Amount',				5),
	('COMMEMORATION_GOVERNMENT_QUEST',			'Amount',				1),
	('COMMEMORATION_GOVERNMENT_QUEST',			'MinScore',				1);
-- Heartbeat of Steam
insert or replace into CommemorationModifiers 
	(CommemorationType,				ModifierId)
values
	('COMMEMORATION_INDUSTRIAL',	'COMMEMORATION_INUDSTRIAL_GA_INDUSTRIAL_ZONE');
insert or replace into Modifiers
	(ModifierId,												ModifierType,														OwnerRequirementSetId,		SubjectRequirementSetId)
values
	('COMMEMORATION_INUDSTRIAL_GA_INDUSTRIAL_ZONE',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',							'PLAYER_HAS_GOLDEN_AGE',	null),
	('COMMEMORATION_INUDSTRIAL_GA_INDUSTRIAL_ZONE_MODIFIER',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	null,						'DISTRICT_IS_INDUSTRIAL_ZONE');
insert or replace into ModifierArguments
	(ModifierId,												Name,					Value)
values
	('COMMEMORATION_INUDSTRIAL_GA_INDUSTRIAL_ZONE',				'ModifierId',			'COMMEMORATION_INUDSTRIAL_GA_INDUSTRIAL_ZONE_MODIFIER'),
	('COMMEMORATION_INUDSTRIAL_GA_INDUSTRIAL_ZONE_MODIFIER',	'YieldTypeToMirror',	'YIELD_PRODUCTION'),
	('COMMEMORATION_INUDSTRIAL_GA_INDUSTRIAL_ZONE_MODIFIER',	'YieldTypeToGrant',		'YIELD_SCIENCE');
-- To Arms!
update ModifierArguments set Value = 30 where ModifierId = 'COMMEMORATION_MILITARY_GA_PRODUCTION' and Name = 'Amount';
-- Wish You Were Here
update Modifiers set SubjectRequirementSetId = 'PLAYER_HAS_GOLDEN_AGE' where ModifierId = 'COMMEMORATION_TOURISM_GA_WONDERS';
update ModifierArguments set Value = 200 where ModifierId = 'COMMEMORATION_TOURISM_GA_WONDERS' and Name = 'ScalingFactor';

-- Governments
-- Government Slots
insert or replace into Government_SlotCounts
	(GovernmentType,					GovernmentSlotType,		NumSlots)
values
	('GOVERNMENT_MONARCHY',				'SLOT_MILITARY',		2),
	('GOVERNMENT_MONARCHY',				'SLOT_ECONOMIC',		2),
	('GOVERNMENT_MONARCHY',				'SLOT_DIPLOMATIC',		1),
	('GOVERNMENT_MONARCHY',				'SLOT_WILDCARD',		1),

	('GOVERNMENT_THEOCRACY',			'SLOT_MILITARY',		2),
	('GOVERNMENT_THEOCRACY',			'SLOT_ECONOMIC',		1),
	('GOVERNMENT_THEOCRACY',			'SLOT_DIPLOMATIC',		1),
	('GOVERNMENT_THEOCRACY',			'SLOT_WILDCARD',		2),

	('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_MILITARY',		1),
	('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_ECONOMIC',		2),
	('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_DIPLOMATIC',		1),
	('GOVERNMENT_MERCHANT_REPUBLIC',	'SLOT_WILDCARD',		2),

	('GOVERNMENT_FASCISM',				'SLOT_MILITARY',		3),
	('GOVERNMENT_FASCISM',				'SLOT_ECONOMIC',		2),
	('GOVERNMENT_FASCISM',				'SLOT_DIPLOMATIC',		1),
	('GOVERNMENT_FASCISM',				'SLOT_WILDCARD',		2),

	('GOVERNMENT_COMMUNISM',			'SLOT_MILITARY',		2),
	('GOVERNMENT_COMMUNISM',			'SLOT_ECONOMIC',		3),
	('GOVERNMENT_COMMUNISM',			'SLOT_DIPLOMATIC',		1),
	('GOVERNMENT_COMMUNISM',			'SLOT_WILDCARD',		2),

	('GOVERNMENT_DEMOCRACY',			'SLOT_MILITARY',		1),
	('GOVERNMENT_DEMOCRACY',			'SLOT_ECONOMIC',		3),
	('GOVERNMENT_DEMOCRACY',			'SLOT_DIPLOMATIC',		2),
	('GOVERNMENT_DEMOCRACY',			'SLOT_WILDCARD',		2);
-- Autocracy
update ModifierArguments set Value = 2 where Name = 'Amount' and ModifierId in (
	'AUTOCRACY_CAPITAL',
	'AUTOCRACY_TIER1',
	'AUTOCRACY_TIER2',
	'AUTOCRACY_TIER3',
	'CONSULATE_TIER1',
	'CHANCERY_TIER2');
-- Monarchy
update Governments set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where GovernmentType = 'GOVERNMENT_MONARCHY';
delete from GovernmentModifiers where GovernmentType = 'GOVERNMENT_MONARCHY' and ModifierId in (
	'MONARCHY_WALLS_HOUSING',
	'MONARCHY_CASTLE_HOUSING',
	'MONARCHY_STARFORT_HOUSING',
	'MONARCHY_STARFORT_FAVOR');
delete from PolicyModifiers where PolicyType = 'POLICY_GOV_MONARCHY' and ModifierId in (
	'MONARCHY_WALLS_HOUSING',
	'MONARCHY_CASTLE_HOUSING',
	'MONARCHY_STARFORT_HOUSING',
	'MONARCHY_STARFORT_FAVOR');
insert or replace into GovernmentModifiers
	(GovernmentType,						ModifierId)
values
	('GOVERNMENT_MONARCHY',					'MONARCHY_CITYGROWTH_BONUS'),
	('GOVERNMENT_MONARCHY',					'MONARCHY_GOLD_BONUS'),
	('GOVERNMENT_MONARCHY',					'MONARCHY_UNITPRODUCTION_BONUS');
insert or replace into PolicyModifiers
	(PolicyType,							ModifierId)
values
	('POLICY_GOV_MONARCHY',					'MONARCHY_CITYGROWTH_BONUS'),
	('POLICY_GOV_MONARCHY',					'MONARCHY_GOLD_BONUS');
insert or replace into Modifiers
	(ModifierId,							ModifierType,												SubjectRequirementSetId)
values
	('MONARCHY_CITYGROWTH_BONUS',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH',				'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
	('MONARCHY_GOLD_BONUS',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',		'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
	('MONARCHY_UNITPRODUCTION_BONUS',		'MODIFIER_PLAYER_CITIES_ADJUST_UNIT_PRODUCTION_MODIFIER',	'CITY_HAS_GARRISON_UNIT_REQUIERMENT');
insert or replace into ModifierArguments
	(ModifierId,							Name,														Value)
values
	('MONARCHY_CITYGROWTH_BONUS',			'Amount',													10),
	('MONARCHY_GOLD_BONUS',					'YieldType',												'YIELD_GOLD'),
	('MONARCHY_GOLD_BONUS',					'Amount',													10),
	('MONARCHY_UNITPRODUCTION_BONUS',		'Amount',													20);
-- Theocracy
update Modifiers set SubjectRequirementSetId = 'CITY_HAS_HOLY_SITE_OR_MBANZA' where ModifierID = 'THEOCRACY_RELIGIOUS_PEOPLE';
update ModifierArguments set Value = 1 where ModifierID = 'THEOCRACY_RELIGIOUS_PEOPLE' and Name = 'Amount';
insert or replace into GovernmentModifiers
	(GovernmentType,			ModifierID)
values
	('GOVERNMENT_THEOCRACY',	'THEOCRACY_HOLY_SITE_PURCHASE_MILITARY');
insert or replace into Modifiers
	(ModifierId,								ModifierType,											SubjectRequirementSetId)
values
	('THEOCRACY_HOLY_SITE_PURCHASE_MILITARY',	'MODIFIER_PLAYER_CITIES_ENABLE_UNIT_FAITH_PURCHASE',	'CITY_HAS_HOLY_SITE');
insert or replace into ModifierArguments
	(ModifierId,								Name,	Value)
values
	('THEOCRACY_HOLY_SITE_PURCHASE_MILITARY',	'Tag',	'CLASS_LAND_COMBAT');
insert or replace into Policy_GovernmentExclusives_XP2
	(PolicyType,					GovernmentType)
values
	('POLICY_MINARET',				'GOVERNMENT_THEOCRACY');
-- Merchant Republic
update ModifierArguments set Value = 20 where ModifierId = 'MERCHANT_REPUBLIC_DISTRICTS' and Name = 'Amount';
update ModifierArguments set Value = 20 where ModifierId = 'MERCHANT_REPUBLIC_GOLD_MODIFIER' and Name = 'Amount';
insert or replace into GovernmentModifiers
	(GovernmentType,					ModifierId)
values
	('GOVERNMENT_MERCHANT_REPUBLIC',	'LANDSURVEYORS_PLOTPURCHASECOST');
insert or replace into PolicyModifiers
	(PolicyType,						ModifierID)
values
	('POLICY_GOV_MERCHANT_REPUBLIC',	'MERCHANT_REPUBLIC_DISTRICTS');
-- Democracy
update ModifierArguments set Value = 3 where Name = 'Amount' and ModifierId in
	(select ModifierId from GovernmentModifiers where GovernmentType = 'GOVERNMENT_DEMOCRACY');
insert or replace into GovernmentModifiers
	(GovernmentType,								ModifierId)
values
	('GOVERNMENT_DEMOCRACY',						'DEMOCRACY_ENABLE_DISTRICT_PURCHASE');
insert or replace into PolicyModifiers
	(PolicyType,									ModifierId)
values
	('POLICY_GOV_DEMOCRACY',						'DEMOCRACY_ENABLE_DISTRICT_PURCHASE');
insert or replace into Modifiers
	(ModifierId,									ModifierType)
values
	('DEMOCRACY_ENABLE_DISTRICT_PURCHASE',			'MODIFIER_PLAYER_CITIES_ENABLE_DISTRICT_PURCHASE');
insert or replace into ModifierArguments
	(ModifierId,									Name,											Value)
values
	('DEMOCRACY_ENABLE_DISTRICT_PURCHASE',			'CanPurchase',									1);
update ModifierArguments set Value = 25 where ModifierId = 'DEMOCRACY_GOLD_PURCHASE' and Name = 'Amount';
-- Communism
update ModifierArguments set Value = 1 where ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE' and Name = 'Amount';
update Modifiers set SubjectRequirementSetId = null where ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE';
update ModifierArguments set Value = 15 where ModifierId = 'COMMUNISM_SCIENCE' and Name = 'Amount';

-- Policy Cards
-- New Policy Cards
insert or replace into Types
	(Type,									Kind)
values
	('POLICY_FREELANCERS',					'KIND_POLICY'),
	('POLICY_MARITIME_INFRASTRUCTURE',		'KIND_POLICY'),
	('POLICY_SEABORNE_SUPPLY',				'KIND_POLICY'),
	('POLICY_GARRISON_RECLAMATION',			'KIND_POLICY'),
	('POLICY_PRIMITIVE_COMMUNE',			'KIND_POLICY'),
	('POLICY_OVERALL_PLANNING',				'KIND_POLICY'),
	--('POLICY_BARD',							'KIND_POLICY'),
	--('POLICY_CIVILIZE',						'KIND_POLICY'),
	('POLICY_DOMESTIC_TRADE',				'KIND_POLICY'),
	('POLICY_HIGHWAY',						'KIND_POLICY'),
	('POLICY_SILK_ROAD',					'KIND_POLICY'),
	('POLICY_WAREHOUSE',					'KIND_POLICY'),
	('POLICY_SAFETY_BOX',					'KIND_POLICY'),
	('POLICY_WALL_HOUSING',					'KIND_POLICY'),
	--('POLICY_ARENA_TICKETS',				'KIND_POLICY'),
	('POLICY_WRESTING_AND_MANEUVERS',		'KIND_POLICY'),
	('POLICY_WONDERS_MISLEAD_COUNTRY',		'KIND_POLICY'),
	('POLICY_CITY_CENTRALIZATION',			'KIND_POLICY'),
	('POLICY_CONSTRUCTION_CROPS',			'KIND_POLICY'),
	('POLICY_DRILL',						'KIND_POLICY'),
	('POLICY_TRIBUTE_TRADE',				'KIND_POLICY'),
	('POLICY_SELF_DETERMINATION',			'KIND_POLICY'),
	('POLICY_SOCIAL_STATISTICS',			'KIND_POLICY'),
	('POLICY_PLUTONOMY',					'KIND_POLICY'),
	('POLICY_PHILOSOPHY_EDUCATION',			'KIND_POLICY'),
	('POLICY_PURITAN',						'KIND_POLICY'),
	('POLICY_SCIENTIFIC_EXPEDITIONS',		'KIND_POLICY'),
	('POLICY_SISHU',						'KIND_POLICY'),
	('POLICY_COMPILE',						'KIND_POLICY'),
	('POLICY_SUPPLY_LINES',					'KIND_POLICY'),
	('POLICY_SCHOLAR_BUREAUCRAT',			'KIND_POLICY'),
	('POLICY_NEW_ROUTE',					'KIND_POLICY'),
	('POLICY_WATER_TRANSPORT',				'KIND_POLICY'),
	('POLICY_TEXTBOOK',						'KIND_POLICY'),
	('POLICY_SUPERPOWER',					'KIND_POLICY'),
	('POLICY_DEEP_WATER_PORT',				'KIND_POLICY'), 
	('POLICY_GREEN_CITY',					'KIND_POLICY'),
	('POLICY_TRAVEL_BLOGGER', 				'KIND_POLICY'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',	'KIND_POLICY'),
	('POLICY_WEAPONS_MANAGEMENT_SERVICE',	'KIND_POLICY'),
	('POLICY_FORTIFICATIONS',				'KIND_POLICY'),
	('POLICY_INTERNATIONALISM',				'KIND_POLICY'),
	('POLICY_SOCIAL_DARWINISM',				'KIND_POLICY'),
	('POLICY_WELL_FIELD',					'KIND_POLICY'),
	--('POLICY_HD_FIVE_YEAR_PLAN',			'KIND_POLICY'),
	('POLICY_HOUSEHOOD_REGISTRATION',		'KIND_POLICY'),
	('POLICY_HAJJ',							'KIND_POLICY'),
	('POLICY_MARTIAL_ELECTION',				'KIND_POLICY'),
	('POLICY_GLADIATORIAL_GAME',			'KIND_POLICY'),
	('POLICY_MINARET',						'KIND_POLICY'),
	('POLICY_MAGGIOR_CONSIGLIO',            'KIND_POLICY'),
	('POLICY_BREEDING',            			'KIND_POLICY'),
	('POLICY_FORGING',            			'KIND_POLICY'),
	('POLICY_GUNPOWDER_RESEARCH',           'KIND_POLICY'),
	('POLICY_ELECTROLYTIC_ALUMINIUM',       'KIND_POLICY'),
	('POLICY_SUSTAINABLE_DEVELOPEMENT',     'KIND_POLICY');
insert or replace into Policies
	(PolicyType,							Name,											Description,											PrereqCivic,								PrereqTech,					GovernmentSlotType)
values	
	('POLICY_FREELANCERS',					'LOC_POLICY_FREELANCERS_NAME',					'LOC_POLICY_FREELANCERS_DESCRIPTION',					'CIVIC_MERCENARIES',						null,						'SLOT_MILITARY'),
	('POLICY_MARITIME_INFRASTRUCTURE',		'LOC_POLICY_MARITIME_INFRASTRUCTURE_NAME',		'LOC_POLICY_MARITIME_INFRASTRUCTURE_DESCRIPTION',		'CIVIC_NAVAL_TRADITION',					null,						'SLOT_ECONOMIC'),
	('POLICY_SEABORNE_SUPPLY',				'LOC_POLICY_SEABORNE_SUPPLY_NAME',				'LOC_POLICY_SEABORNE_SUPPLY_DESCRIPTION',				'CIVIC_EXPLORATION',						null,						'SLOT_ECONOMIC'),
	('POLICY_GARRISON_RECLAMATION',			'LOC_POLICY_GARRISON_RECLAMATION_NAME',			'LOC_POLICY_GARRISON_RECLAMATION_DESCRIPTION',			'CIVIC_FEUDALISM',							null,						'SLOT_MILITARY'),
	('POLICY_PRIMITIVE_COMMUNE',			'LOC_POLICY_PRIMITIVE_COMMUNE_NAME',			'LOC_POLICY_PRIMITIVE_COMMUNE_DESCRIPTION',				'CIVIC_CODE_OF_LAWS',						null,						'SLOT_ECONOMIC'),
	('POLICY_OVERALL_PLANNING',				'LOC_POLICY_OVERALL_PLANNING_NAME',				'LOC_POLICY_OVERALL_PLANNING_DESCRIPTION',				'CIVIC_URBANIZATION',						null,						'SLOT_ECONOMIC'),												
	--('POLICY_BARD',							'LOC_POLICY_BARD_NAME',							'LOC_POLICY_BARD_DESCRIPTION',							'CIVIC_DRAMA_POETRY',						null,						'SLOT_DIPLOMATIC'),
	--('POLICY_CIVILIZE',						'LOC_POLICY_CIVILIZE_NAME',						'LOC_POLICY_CIVILIZE_DESCRIPTION',						'CIVIC_GAMES_RECREATION',					null,						'SLOT_DIPLOMATIC'),
	('POLICY_DOMESTIC_TRADE',				'LOC_POLICY_DOMESTIC_TRADE_NAME',				'LOC_POLICY_DOMESTIC_TRADE_DESCRIPTION',				'CIVIC_DEFENSIVE_TACTICS',					null,						'SLOT_ECONOMIC'),
	('POLICY_HIGHWAY',						'LOC_POLICY_HIGHWAY_NAME',						'LOC_POLICY_HIGHWAY_DESCRIPTION',						'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		null,						'SLOT_ECONOMIC'),
	('POLICY_SILK_ROAD',					'LOC_POLICY_SILK_ROAD_NAME',					'LOC_POLICY_SILK_ROAD_DESCRIPTION',						'CIVIC_MEDIEVAL_FAIRES',					null,						'SLOT_ECONOMIC'),
	('POLICY_WAREHOUSE',					'LOC_POLICY_WAREHOUSE_NAME',					'LOC_POLICY_WAREHOUSE_DESCRIPTION',						'CIVIC_STATE_WORKFORCE',					null,						'SLOT_ECONOMIC'),
	('POLICY_SAFETY_BOX',					'LOC_POLICY_SAFETY_BOX_NAME',					'LOC_POLICY_SAFETY_BOX_DESCRIPTION',					'CIVIC_EXPLORATION',						null,						'SLOT_ECONOMIC'),
	('POLICY_WALL_HOUSING',					'LOC_POLICY_WALL_HOUSING_NAME',					'LOC_POLICY_WALL_HOUSING_DESCRIPTION',					'CIVIC_DIVINE_RIGHT',						null,						'SLOT_MILITARY'),
	--('POLICY_ARENA_TICKETS',				'LOC_POLICY_ARENA_TICKETS_NAME',				'LOC_POLICY_ARENA_TICKETS_DESCRIPTION',					'CIVIC_GAMES_RECREATION',					null,						'SLOT_ECONOMIC'),
	('POLICY_WRESTING_AND_MANEUVERS',		'LOC_POLICY_WRESTING_AND_MANEUVERS_NAME',		'LOC_POLICY_WRESTING_AND_MANEUVERS_DESCRIPTION',		'CIVIC_MERCENARIES',						null,						'SLOT_MILITARY'),
	('POLICY_WONDERS_MISLEAD_COUNTRY',		'LOC_POLICY_WONDERS_MISLEAD_COUNTRY_NAME',		'LOC_POLICY_WONDERS_MISLEAD_COUNTRY_DESCRIPTION',		null,										null,						'SLOT_WILDCARD'),
	('POLICY_CITY_CENTRALIZATION',			'LOC_POLICY_CITY_CENTRALIZATION_NAME',			'LOC_POLICY_CITY_CENTRALIZATION_DESCRIPTION',			'CIVIC_URBANIZATION',						null,						'SLOT_ECONOMIC'),
	('POLICY_CONSTRUCTION_CROPS',			'LOC_POLICY_CONSTRUCTION_CROPS_NAME',			'LOC_POLICY_CONSTRUCTION_CROPS_DESCRIPTION',			'CIVIC_URBANIZATION',						null,						'SLOT_MILITARY'),
	('POLICY_DRILL',						'LOC_POLICY_DRILL_NAME',						'LOC_POLICY_DRILL_DESCRIPTION',							'CIVIC_MILITARY_TRAINING',					null,						'SLOT_MILITARY'),
	('POLICY_TRIBUTE_TRADE',				'LOC_POLICY_TRIBUTE_TRADE_NAME',				'LOC_POLICY_TRIBUTE_TRADE_DESCRIPTION',					'CIVIC_RECORDED_HISTORY',					null,						'SLOT_DIPLOMATIC'),
	('POLICY_SELF_DETERMINATION',			'LOC_POLICY_SELF_DETERMINATION_NAME',			'LOC_POLICY_SELF_DETERMINATION_DESCRIPTION',			'CIVIC_NATIONALISM',						null,						'SLOT_DIPLOMATIC'),
	('POLICY_SOCIAL_STATISTICS',			'LOC_POLICY_SOCIAL_STATISTICS_NAME',			'LOC_POLICY_SOCIAL_STATISTICS_DESCRIPTION',				'CIVIC_SOCIAL_SCIENCE_HD',					null,						'SLOT_ECONOMIC'),
	('POLICY_PLUTONOMY',					'LOC_POLICY_PLUTONOMY_NAME',					'LOC_POLICY_PLUTONOMY_DESCRIPTION',						'CIVIC_SOCIAL_SCIENCE_HD',					null,						'SLOT_ECONOMIC'),
	('POLICY_PHILOSOPHY_EDUCATION',			'LOC_POLICY_PHILOSOPHY_EDUCATION_NAME',			'LOC_POLICY_PHILOSOPHY_EDUCATION_DESCRIPTION',			'CIVIC_HISTORICAL_PHILOSOPHY_HD',			null,						'SLOT_WILDCARD'),
	('POLICY_PURITAN',						'LOC_POLICY_PURITAN_NAME',						'LOC_POLICY_PURITAN_DESCRIPTION',						'CIVIC_ETHICS_HD',							null,						'SLOT_ECONOMIC'),
	('POLICY_SCIENTIFIC_EXPEDITIONS',		'LOC_POLICY_SCIENTIFIC_EXPEDITIONS_NAME',		'LOC_POLICY_SCIENTIFIC_EXPEDITIONS_DESCRIPTION',		'CIVIC_EVOLUTION_THEORY_HD',				null,						'SLOT_DIPLOMATIC'),
	('POLICY_SISHU',						'LOC_POLICY_SISHU_NAME',						'LOC_POLICY_SISHU_DESCRIPTION',							'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		null,						'SLOT_ECONOMIC'),
	('POLICY_COMPILE',						'LOC_POLICY_COMPILE_NAME',						'LOC_POLICY_COMPILE_DESCRIPTION',						null,										'TECH_PAPER_MAKING_HD',		'SLOT_GREAT_PERSON'),
	('POLICY_SUPPLY_LINES',					'LOC_POLICY_SUPPLY_LINES_NAME',					'LOC_POLICY_SUPPLY_LINES_DESCRIPTION',					null,										'TECH_MILITARY_TACTICS',	'SLOT_MILITARY'),
	('POLICY_SCHOLAR_BUREAUCRAT',			'LOC_POLICY_SCHOLAR_BUREAUCRAT_NAME',			'LOC_POLICY_SCHOLAR_BUREAUCRAT_DESCRIPTION',			'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		null,						'SLOT_GREAT_PERSON'),
	('POLICY_NEW_ROUTE',					'LOC_POLICY_NEW_ROUTE_NAME',					'LOC_POLICY_NEW_ROUTE_DESCRIPTION',						'CIVIC_MERCANTILISM',						Null,						'SLOT_ECONOMIC'),
	('POLICY_WATER_TRANSPORT',				'LOC_POLICY_WATER_TRANSPORT_NAME',				'LOC_POLICY_WATER_TRANSPORT_DESCRIPTION',				'CIVIC_MERCANTILISM',						null,						'SLOT_ECONOMIC'),
	('POLICY_TEXTBOOK',						'LOC_POLICY_TEXTBOOK_NAME',						'LOC_POLICY_TEXTBOOK_DESCRIPTION',						null,										'TECH_PRINTING',			'SLOT_GREAT_PERSON'),
	('POLICY_SUPERPOWER',					'LOC_POLICY_SUPERPOWER_NAME',					'LOC_POLICY_SUPERPOWER_DESCRIPTION',					'CIVIC_COLD_WAR',							null,						'SLOT_DIPLOMATIC'),
	('POLICY_DEEP_WATER_PORT',				'LOC_POLICY_DEEP_WATER_PORT_NAME',				'LOC_POLICY_DEEP_WATER_PORT_DESCRIPTION',				'CIVIC_URBANIZATION',						null,						'SLOT_ECONOMIC'), 
	('POLICY_GREEN_CITY',					'LOC_POLICY_GREEN_CITY_NAME',					'LOC_POLICY_GREEN_CITY_DESCRIPTION',					'CIVIC_ENVIRONMENTALISM',					null,						'SLOT_ECONOMIC'),
	('POLICY_TRAVEL_BLOGGER', 				'LOC_POLICY_TRAVEL_BLOGGER_NAME', 				'LOC_POLICY_TRAVEL_BLOGGER_DESCRIPTION', 				'CIVIC_SOCIAL_MEDIA', 						null,						'SLOT_ECONOMIC'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',	'LOC_POLICY_INFRASTRUCTURE_CONSTRUCTION_NAME',	'LOC_POLICY_INFRASTRUCTURE_CONSTRUCTION_DESCRIPTION',	'CIVIC_URBANIZATION',						null,						'SLOT_ECONOMIC'),
	('POLICY_WEAPONS_MANAGEMENT_SERVICE',	'LOC_POLICY_WEAPONS_MANAGEMENT_SERVICE_NAME',	'LOC_POLICY_WEAPONS_MANAGEMENT_SERVICE_DESCRIPTION',	'CIVIC_MILITARY_TRAINING',					null,			    		'SLOT_MILITARY'),
	('POLICY_FORTIFICATIONS',				'LOC_POLICY_FORTIFICATIONS_NAME',				'LOC_POLICY_FORTIFICATIONS_DESCRIPTION',				null,										'TECH_ENGINEERING',			'SLOT_MILITARY'),
	('POLICY_INTERNATIONALISM',				'LOC_POLICY_INTERNATIONALISM_NAME',				'LOC_POLICY_INTERNATIONALISM_DESCRIPTION',				'CIVIC_CLASS_STRUGGLE',						null,			    		'SLOT_DIPLOMATIC'),
	('POLICY_SOCIAL_DARWINISM',				'LOC_POLICY_SOCIAL_DARWINISM_NAME',				'LOC_POLICY_SOCIAL_DARWINISM_DESCRIPTION',				'CIVIC_EVOLUTION_THEORY_HD',				null,			    		'SLOT_MILITARY'),
	('POLICY_WELL_FIELD',					'LOC_POLICY_WELL_FIELD_NAME',					'LOC_POLICY_WELL_FIELD_DESCRIPTION',					null,										'TECH_CALENDAR_HD',    		'SLOT_ECONOMIC'),
	--('POLICY_HD_FIVE_YEAR_PLAN',			'LOC_POLICY_HD_FIVE_YEAR_PLAN_NAME',			'LOC_POLICY_HD_FIVE_YEAR_PLAN_DESCRIPTION',				'CIVIC_CLASS_STRUGGLE',						null,			    		'SLOT_ECONOMIC'),
	('POLICY_HOUSEHOOD_REGISTRATION',		'LOC_POLICY_HOUSEHOOD_REGISTRATION_NAME',		'LOC_POLICY_HOUSEHOOD_REGISTRATION_DESCRIPTION',		'CIVIC_CIVIL_SERVICE',						null,			    		'SLOT_ECONOMIC'),
	('POLICY_HAJJ',							'LOC_POLICY_HAJJ_NAME',							'LOC_POLICY_HAJJ_DESCRIPTION',							'CIVIC_POLITICAL_PHILOSOPHY',				null,			    		'SLOT_DIPLOMATIC'),
	('POLICY_MARTIAL_ELECTION',				'LOC_POLICY_MARTIAL_ELECTION_NAME',				'LOC_POLICY_MARTIAL_ELECTION_DESCRIPTION',				'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',		null,			    		'SLOT_GREAT_PERSON'),
	('POLICY_GLADIATORIAL_GAME',			'LOC_POLICY_GLADIATORIAL_GAME_NAME',			'LOC_POLICY_GLADIATORIAL_GAME_DESCRIPTION',				'CIVIC_GAMES_RECREATION',					null,			    		'SLOT_MILITARY'),
	('POLICY_MINARET',						'LOC_POLICY_MINARET_NAME',						'LOC_POLICY_MINARET_DESCRIPTION',						'CIVIC_REFORMED_CHURCH',					null,			    		'SLOT_ECONOMIC'),
    ('POLICY_MAGGIOR_CONSIGLIO',            'LOC_POLICY_MAGGIOR_CONSIGLIO_NAME',            'LOC_POLICY_MAGGIOR_CONSIGLIO_DESCRIPTION',             'CIVIC_EXPLORATION',                        null,                       'SLOT_DIPLOMATIC'),
    ('POLICY_BREEDING',          			'LOC_POLICY_BREEDING_NAME',            			'LOC_POLICY_BREEDING_DESCRIPTION',             			'CIVIC_STATE_WORKFORCE',                    null,                       'SLOT_MILITARY'),
    ('POLICY_FORGING',          			'LOC_POLICY_FORGING_NAME',            			'LOC_POLICY_FORGING_DESCRIPTION',             			'CIVIC_STATE_WORKFORCE',                    null,                       'SLOT_MILITARY'),
    ('POLICY_GUNPOWDER_RESEARCH',          	'LOC_POLICY_GUNPOWDER_RESEARCH_NAME',           'LOC_POLICY_GUNPOWDER_RESEARCH_DESCRIPTION',            'CIVIC_GUILDS',               			    null,                       'SLOT_MILITARY'),
    ('POLICY_ELECTROLYTIC_ALUMINIUM',       'LOC_POLICY_ELECTROLYTIC_ALUMINIUM_NAME',       'LOC_POLICY_ELECTROLYTIC_ALUMINIUM_DESCRIPTION',        'CIVIC_CONSERVATION',             		    null,                       'SLOT_MILITARY'),
    ('POLICY_SUSTAINABLE_DEVELOPEMENT',     'LOC_POLICY_SUSTAINABLE_DEVELOPEMENT_NAME',     'LOC_POLICY_SUSTAINABLE_DEVELOPEMENT_DESCRIPTION',      'CIVIC_COLD_WAR',                  			null,                       'SLOT_MILITARY');
-- Obsolete Policies
delete from ObsoletePolicies where ObsoletePolicy is null or PolicyType in
	(values	('POLICY_URBAN_PLANNING'), ('POLICY_RETAINERS'), ('POLICY_CARAVANSARIES'), ('POLICY_MILITARY_RESEARCH'), ('POLICY_REVELATION'));
update ObsoletePolicies set RequiresAvailableGreatPersonClass = null;
insert or replace into ObsoletePolicies
	(PolicyType,							ObsoletePolicy)
values
	('POLICY_MARITIME_INFRASTRUCTURE', 		'POLICY_SEABORNE_SUPPLY'),
	('POLICY_CHARISMATIC_LEADER',			'POLICY_DIPLOMATIC_LEAGUE'),
	('POLICY_DIPLOMATIC_LEAGUE',			'POLICY_GUNBOAT_DIPLOMACY'),
	('POLICY_DOMESTIC_TRADE',				'POLICY_HIGHWAY'),
	('POLICY_DOMESTIC_TRADE',				'POLICY_COLLECTIVIZATION'),
	('POLICY_HIGHWAY',						'POLICY_COLLECTIVIZATION'),
	('POLICY_DOMESTIC_TRADE',				'POLICY_WATER_TRANSPORT'),
	('POLICY_HIGHWAY',						'POLICY_WATER_TRANSPORT'),
	('POLICY_TRADE_CONFEDERATION',			'POLICY_SILK_ROAD'),
	('POLICY_TRADE_CONFEDERATION',			'POLICY_MARKET_ECONOMY'),
	('POLICY_SILK_ROAD',					'POLICY_MARKET_ECONOMY'),
	('POLICY_TRADE_CONFEDERATION',			'POLICY_NEW_ROUTE'),
	('POLICY_SILK_ROAD',					'POLICY_NEW_ROUTE'),
	('POLICY_WAREHOUSE',					'POLICY_SAFETY_BOX'),
	('POLICY_PRIMITIVE_COMMUNE',			'POLICY_WELL_FIELD'),
	('POLICY_URBAN_PLANNING',				'POLICY_WELL_FIELD'),
	('POLICY_PRIMITIVE_COMMUNE',			'POLICY_CITY_CENTRALIZATION'),
	('POLICY_URBAN_PLANNING',				'POLICY_CITY_CENTRALIZATION'),
	('POLICY_WELL_FIELD',					'POLICY_CITY_CENTRALIZATION'),
	--('POLICY_BARD',							'POLICY_CITY_CENTRALIZATION'),
	--('POLICY_CIVILIZE',						'POLICY_CITY_CENTRALIZATION'),
	('POLICY_CARAVANSARIES',				'POLICY_CITY_CENTRALIZATION'),
	('POLICY_SCRIPTURE',					'POLICY_SIMULTANEUM'),
	('POLICY_GARRISON_RECLAMATION',			'POLICY_CONSTRUCTION_CROPS'),
	('POLICY_WALL_HOUSING',					'POLICY_CONSTRUCTION_CROPS'),
	('POLICY_DRILL',						'POLICY_AFTER_ACTION_REPORTS'),
	('POLICY_RETAINERS',					'POLICY_FREELANCERS'),
	('POLICY_SISHU',						'POLICY_SOCIAL_STATISTICS'),
	('POLICY_LOGISTICS',					'POLICY_SUPPLY_LINES'),
	('POLICY_VETERANCY',					'POLICY_SUPPLY_LINES'),
	('POLICY_FORTIFICATIONS',				'POLICY_BASTIONS'),
	('POLICY_LIMES',						'POLICY_BASTIONS'),
	('POLICY_NEW_ROUTE',					'POLICY_MARKET_ECONOMY'),
	('POLICY_WATER_TRANSPORT',				'POLICY_COLLECTIVIZATION'),
	('POLICY_TRIBUTE_TRADE',				'POLICY_SELF_DETERMINATION'),
	('POLICY_MAGGIOR_CONSIGLIO',            'POLICY_SELF_DETERMINATION'),
	('POLICY_OVERALL_PLANNING',				'POLICY_FIVE_YEAR_PLAN'),
	('POLICY_OVERALL_PLANNING',				'POLICY_SPORTS_MEDIA'),
	('POLICY_SEABORNE_SUPPLY',				'POLICY_DEEP_WATER_PORT'),
	('POLICY_WEAPONS_MANAGEMENT_SERVICE',	'POLICY_MILITARY_RESEARCH'),
	('POLICY_HOUSEHOOD_REGISTRATION',		'POLICY_INFRASTRUCTURE_CONSTRUCTION'),
	('POLICY_HAJJ',							'POLICY_RAJ'),
	('POLICY_GLADIATORIAL_GAME',			'POLICY_LIBERALISM'),
	-- Great Person Policies
	('POLICY_INSPIRATION',					'POLICY_COMPILE'),
	('POLICY_INSPIRATION',					'POLICY_TEXTBOOK'),
	('POLICY_COMPILE',						'POLICY_TEXTBOOK'),
	('POLICY_COMPILE',						'POLICY_NOBEL_PRIZE'),
	('POLICY_TEXTBOOK',						'POLICY_NOBEL_PRIZE'),
	('POLICY_LITERARY_TRADITION',			'POLICY_SCHOLAR_BUREAUCRAT'),
	('POLICY_STRATEGOS',					'POLICY_MARTIAL_ELECTION'),
	('POLICY_MARTIAL_ELECTION',				'POLICY_MILITARY_ORGANIZATION'),
	-- Resource Policies
	('POLICY_BREEDING',						'POLICY_EQUESTRIAN_ORDERS'),
	('POLICY_FORGING',						'POLICY_EQUESTRIAN_ORDERS'),
	('POLICY_EQUESTRIAN_ORDERS',			'POLICY_DRILL_MANUALS'),
	('POLICY_GUNPOWDER_RESEARCH',			'POLICY_DRILL_MANUALS'),
	('POLICY_DRILL_MANUALS',				'POLICY_SUSTAINABLE_DEVELOPEMENT'),
	('POLICY_RESOURCE_MANAGEMENT',			'POLICY_SUSTAINABLE_DEVELOPEMENT'),
	('POLICY_ELECTROLYTIC_ALUMINIUM',		'POLICY_SUSTAINABLE_DEVELOPEMENT');
insert or replace into ObsoletePolicies
	(PolicyType,							RequiresAvailableGreatPersonClass)
values
	('POLICY_REVELATION',					'GREAT_PERSON_CLASS_PROPHET'),
	('POLICY_INSPIRATION',					'GREAT_PERSON_CLASS_SCIENTIST'),
	('POLICY_COMPILE',						'GREAT_PERSON_CLASS_SCIENTIST'),
	('POLICY_TEXTBOOK',						'GREAT_PERSON_CLASS_SCIENTIST'),
	('POLICY_LITERARY_TRADITION',			'GREAT_PERSON_CLASS_WRITER'),
	('POLICY_SCHOLAR_BUREAUCRAT',			'GREAT_PERSON_CLASS_WRITER'),
	('POLICY_FRESCOES',						'GREAT_PERSON_CLASS_ARTIST'),
	('POLICY_SYMPHONIES',					'GREAT_PERSON_CLASS_MUSICIAN'),
	('POLICY_STRATEGOS',					'GREAT_PERSON_CLASS_GENERAL'),
	('POLICY_MARTIAL_ELECTION',				'GREAT_PERSON_CLASS_GENERAL'),
	('POLICY_MILITARY_ORGANIZATION',		'GREAT_PERSON_CLASS_GENERAL'),
	('POLICY_TRAVELING_MERCHANTS',			'GREAT_PERSON_CLASS_MERCHANT'),
	('POLICY_LAISSEZ_FAIRE',				'GREAT_PERSON_CLASS_MERCHANT'),
	('POLICY_NAVIGATION',					'GREAT_PERSON_CLASS_ADMIRAL'),
	('POLICY_INVENTION',					'GREAT_PERSON_CLASS_ENGINEER');

-- Policy Prereqs
update Policies set PrereqCivic = null, PrereqTech = 'TECH_THE_WHEEL'			where PolicyType = 'POLICY_WAREHOUSE';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_MASS_PRODUCTION'		where PolicyType = 'POLICY_SAFETY_BOX';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_MASONRY'				where PolicyType = 'POLICY_INSULAE';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_APPRENTICESHIP'		where PolicyType = 'POLICY_MEDINA_QUARTER';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_BUTTRESS'			where PolicyType = 'POLICY_GOTHIC_ARCHITECTURE';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_CARTOGRAPHY'			where PolicyType = 'POLICY_TRIANGULAR_TRADE';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_BANKING'				where PolicyType = 'POLICY_FREE_MARKET';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_SANITATION'			where PolicyType = 'POLICY_EXPROPRIATION';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_ELECTRICITY'			where PolicyType = 'POLICY_ECONOMIC_UNION';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_CASTLES'				where PolicyType = 'POLICY_WALL_HOUSING';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_MILITARY_SCIENCE'	where PolicyType = 'POLICY_MILITARY_RESEARCH';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_COMBINED_ARMS'		where PolicyType = 'POLICY_INTERNATIONAL_WATERS';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_ROCKETRY'			where PolicyType = 'POLICY_STRATEGIC_AIR_FORCE';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_MILITARY_SCIENCE'	where PolicyType = 'POLICY_CONSTRUCTION_CROPS';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_NUCLEAR_FISSION'		where PolicyType = 'POLICY_SECOND_STRIKE_CAPABILITY';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_CIVIL_ENGINEERING_HD'where PolicyType = 'POLICY_DRILL_MANUALS';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_BANKING'				where PolicyType = 'POLICY_WISSELBANKEN';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_SIEGE_TACTICS'		where PolicyType = 'POLICY_BASTIONS';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_MASONRY'				where PolicyType = 'POLICY_LIMES';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_COMBUSTION'			where PolicyType = 'POLICY_COLLECTIVIZATION';
update Policies set PrereqCivic = null, PrereqTech = 'TECH_WRITING' 			where PolicyType = 'POLICY_INSPIRATION';
update Policies set PrereqCivic = 'CIVIC_URBANIZATION'				where PolicyType = 'POLICY_PUBLIC_TRANSPORT';
update Policies set PrereqCivic = 'CIVIC_MOBILIZATION'				where PolicyType = 'POLICY_FORCE_MODERNIZATION';
update Policies set PrereqCivic = 'CIVIC_CAPITALISM'				where PolicyType = 'POLICY_FIVE_YEAR_PLAN';
update Policies set PrereqCivic = 'CIVIC_SOCIAL_SCIENCE_HD'			where PolicyType = 'POLICY_GRAND_OPERA';
update Policies set PrereqCivic = 'CIVIC_EVOLUTION_THEORY_HD'		where PolicyType = 'POLICY_COLONIAL_OFFICES';
update Policies set PrereqCivic = 'CIVIC_HISTORICAL_PHILOSOPHY_HD'	where PolicyType = 'POLICY_INVENTION';
update Policies set PrereqCivic = 'CIVIC_ETHICS_HD'					where PolicyType = 'POLICY_NATIONAL_IDENTITY';
update Policies set PrereqCivic = 'CIVIC_LITERARY_TRADITION_HD'		where PolicyType = 'POLICY_AESTHETICS';
update Policies set PrereqCivic = 'CIVIC_DEFENSIVE_TACTICS'			where PolicyType = 'POLICY_LOGISTICS';
update Policies set PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES'			where PolicyType = 'POLICY_TOWN_CHARTERS';
update Policies set PrereqCivic = 'CIVIC_CONSERVATION' 				where PolicyType = 'POLICY_RESOURCE_MANAGEMENT';

-- Governement Exclusive Policies
delete from Policy_GovernmentExclusives_XP2 where PolicyType = 'POLICY_COLLECTIVIZATION';
insert or replace into Policy_GovernmentExclusives_XP2
	(PolicyType,					GovernmentType)
values
	('POLICY_INTERNATIONALISM',		'GOVERNMENT_COMMUNISM');

-- Dark Age Policies
-- Era Adjustment
update Policies_XP1 set MaximumGameEra = 'ERA_RENAISSANCE' where PolicyType = 'POLICY_ISOLATIONISM' or PolicyType = 'POLICY_ELITE_FORCES';
update Policies_XP1 set MaximumGameEra = 'ERA_MEDIEVAL' where PolicyType = 'POLICY_TWILIGHT_VALOR';
-- Twilight Valor
insert or replace into PolicyModifiers
	(PolicyType,				ModifierId)
select
	'POLICY_TWILIGHT_VALOR',	'LIMITANEI_GARRISONIDENTITY'
where exists (select PolicyType from Policies where PolicyType = 'POLICY_TWILIGHT_VALOR');
-- Isolationism
update ModifierArguments set Value = 3 where ModifierId = 'ISOLATIONISM_DOMESTIC_TRADE_ROUTE_FODD' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'ISOLATIONISM_DOMESTIC_TRADE_ROUTE_PRODUCTION' and Name = 'Amount';
insert or replace into PolicyModifiers
	(PolicyType,				ModifierId)
values
	('POLICY_ISOLATIONISM',		'ISOLATIONISM_DISABLE_BUILD_BUILDER');
insert or replace into Modifiers
	(ModifierId,										ModifierType)
values
	('ISOLATIONISM_DISABLE_BUILD_BUILDER',				'MODIFIER_PLAYER_UNIT_BUILD_DISABLED');
insert or replace into ModifierArguments
	(ModifierId,										Name,		Value)
values
	('ISOLATIONISM_DISABLE_BUILD_BUILDER',				'UnitType',	'UNIT_BUILDER');
-- Removes
delete from Policies where PolicyType = 'POLICY_INQUISITION' or PolicyType = 'POLICY_COLLECTIVISM';
delete from Policies_XP1 where PolicyType = 'POLICY_INQUISITION' or PolicyType = 'POLICY_COLLECTIVISM';
-- Wonder-Obsession
insert into Policies_XP1	
	(PolicyType,						MinimumGameEra,		MaximumGameEra,		RequiresDarkAge)
values
	('POLICY_WONDERS_MISLEAD_COUNTRY',	'ERA_CLASSICAL',	'ERA_RENAISSANCE',	1);

-- Policy Cards Modifiers
delete from Policies where PolicyType = 'POLICY_LAND_SURVEYORS';
delete from PolicyModifiers where PolicyType = 'POLICY_GOD_KING' and ModifierId = 'GOD_KING_GOLD';
update ModifierArguments set Value = 2 where ModifierId = 'GOD_KING_FAITH' and Name = 'Amount';

update ModifierArguments set Value = 10 where ModifierId = 'DISCIPLINE_BARBARIANCOMBAT' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'INSULAE_SPECIALTYHOUSING' and Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'CIVILPRESTIGE_GOVHOUSING' and Name = 'Amount';
update ModifierArguments set Value = 4 where ModifierId = 'MEDINAQUARTER_SPECIALTYHOUSING' and Name = 'Amount';

update ModifierArguments set Value = 5 where ModifierId = 'LIMITANEI_GARRISONIDENTITY' and Name = 'Amount';
update ModifierArguments set Value = 5 where ModifierId = 'PRAETORIUM_GOVERNORIDENTITY' and Name = 'Amount';

delete from PolicyModifiers where PolicyType = 'POLICY_MARKET_ECONOMY' and ModifierId = 'MARKETECONOMY_TRADEROUTEGOLDPERLUXURY' or ModifierId = 'MARKETECONOMY_TRADEROUTEGOLDPERSTRATEGIC';
update ModifierArguments set Value = 4 where ModifierId = 'MARKETECONOMY_TRADEROUTECULTURE' and Name = 'Amount';
update ModifierArguments set Value = 4 where ModifierId = 'MARKETECONOMY_TRADEROUTESCIENCE' and Name = 'Amount';

-- Remove effect: 25% less operation time for spy.
-- delete from PolicyModifiers where PolicyType = 'POLICY_MACHIAVELLIANISM' and ModifierId = 'MACHIAVELLIANISM_OFFENSIVESPYTIME';
-- Remove the Machiavellisnism Policy Card time reduction and 100% production boost now
-- delete from Policies where PolicyType = 'POLICY_MACHIAVELLIANISM';
delete from PolicyModifiers where ModifierID = 'MACHIAVELLIANISM_OFFENSIVESPYTIME';
update ModifierArguments set Value = 100 where ModifierID = 'MACHIAVELLIANISM_SPYPRODUCTION' and Name = 'Amount ';
-- delete from Policies where PolicyType = 'POLICY_DIPLOMATIC_LEAGUE';
delete from Policies where PolicyType = 'POLICY_PROFESSIONAL_ARMY';
-- delete from Policies where PolicyType = 'POLICY_FORCE_MODERNIZATION';
-- 
delete from Policies where PolicyType = 'POLICY_NATIVE_CONQUEST';
delete from Policies where PolicyType = 'POLICY_PROPAGANDA';
delete from Policies where PolicyType = 'POLICY_NUCLEAR_ESPIONAGE';
-- delete from Policies where PolicyType = 'POLICY_AFTER_ACTION_REPORTS';
delete from Policies where PolicyType = 'POLICY_COMMUNICATIONS_OFFICE';
delete from Policies where PolicyType = 'POLICY_FUTURE_VICTORY_CULTURE';
delete from Policies where PolicyType = 'POLICY_CIVIL_PRESTIGE';

update ModifierArguments set Value = 100 where ModifierID = 'RAID_DOUBLEPILLAGEIMPROVE';
update ModifierArguments set Value = 100 where ModifierID = 'SACK_DOUBLEPILLAGEDISTRICT';
update ModifierArguments set Value = 200 where ModifierID = 'TOTALWAR_DOUBLEPILLAGEIMPROVE';
update ModifierArguments set Value = 200 where ModifierID = 'TOTALWAR_DOUBLEPILLAGEDISTRICT';
update ModifierArguments set Value = 200 where ModifierID = 'TOTAL_WAR_PLUNDER_BONUS';
update ModifierArguments set Value = 100 where ModifierID = 'NATIONALIDENTITY_REDUCESTRENGTHREDUCTIONFORDAMAGE';
update ModifierArguments set Value = 100 where ModifierID = 'AFTERACTIONREPORTS_EXPERIENCE';

update Policies set PrereqCivic = 'CIVIC_MOBILIZATION' where PolicyType = 'POLICY_AFTER_ACTION_REPORTS';


update Policies set PrereqCivic = 'CIVIC_MILITARY_TRADITION' where PolicyType = 'POLICY_CONSCRIPTION';
update Policies set PrereqCivic = 'CIVIC_STATE_WORKFORCE' where PolicyType = 'POLICY_INSULAE';
-- 
-- update Policies set PrereqCivic = 'CIVIC_DIVINE_RIGHT' where PolicyType = 'POLICY_MEDINA_QUARTER';
update Policies set PrereqCivic = Null, PrereqTech = 'TECH_CURRENCY' where PolicyType = 'POLICY_TRADE_CONFEDERATION';
-- update Policies set PrereqCivic = 'CIVIC_FEUDALISM' where PolicyType = 'POLICY_CIVIL_PRESTIGE';
update Policies set PrereqCivic = 'CIVIC_MERCENARIES' where PolicyType = 'POLICY_RETAINERS';
-- update Policies set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where PolicyType = 'POLICY_GOTHIC_ARCHITECTURE';
update Policies set PrereqCivic = 'CIVIC_DIPLOMATIC_SERVICE' where PolicyType = 'POLICY_DIPLOMATIC_LEAGUE';

-- update Policies set PrereqCivic = 'CIVIC_CLASS_STRUGGLE' where PolicyType = 'POLICY_FIVE_YEAR_PLAN';
-- update Policies set PrereqCivic = 'CIVIC_SUFFRAGE' where PolicyType = 'POLICY_ECONOMIC_UNION';
-- update Policies set PrereqCivic = 'CIVIC_TOTALITARIANISM' where PolicyType = 'POLICY_LIGHTNING_WARFARE';

update Policies set PrereqCivic = 'CIVIC_MILITARY_TRADITION' where PolicyType = 'POLICY_LIMITANEI';
update Policies set PrereqCivic = 'CIVIC_NAVAL_TRADITION' where PolicyType = 'POLICY_PRESS_GANGS';
-- update Policies set PrereqCivic = 'CIVIC_EXPLORATION' where PolicyType = 'POLICY_NAVIGATION';
update Policies set PrereqCivic = 'CIVIC_MILITARY_TRADITION' where PolicyType = 'POLICY_RETAINERS';

update ModifierArguments set Value = 4 where ModifierId = 'COLLECTIVIZATION_INTERNAL_TRADE_PRODUCTION' and Name = 'Amount';
-- update Modifiers set SubjectRequirementSetId = 'PLAYER_HAS_NO_DIPLOMATIC_QUARTER' where ModifierId = 'DIPLOMATICLEAGUE_DUPLICATEFIRSTINFLUENCETOKEN';

delete from PolicyModifiers where PolicyType = 'POLICY_DIPLOMATIC_LEAGUE' and ModifierId = 'DIPLOMATICLEAGUE_DUPLICATEFIRSTINFLUENCETOKEN';

delete from PolicyModifiers where PolicyType = 'POLICY_COLONIAL_OFFICES' and ModifierId = 'COLONIALOFFICES_FOREIGNGROWTH';

insert or replace into PolicyModifiers
	(PolicyType,						ModifierId)
values
	('POLICY_TRAVELING_MERCHANTS',		'TRAVELING_MERCHANTS_MARKET'),
	('POLICY_NAVIGATION',				'NAVIGATION_ADMIRAL_LIGHTHOUSE'),
	('POLICY_CHARISMATIC_LEADER',		'CHARISMATICLEADER_OPENBORDERS'),
	('POLICY_DIPLOMATIC_LEAGUE',		'DIPLOMATIC_LEAGUE_INFLUENCEPOINTS'),
	('POLICY_DIPLOMATIC_LEAGUE',		'CHARISMATICLEADER_OPENBORDERS'),
	('POLICY_SERFDOM',					'SERFDOM_BUILDERPRODUCTION'),
	-- ('POLICY_PUBLIC_TRANSPORT',			'PUBLICTRANSPORT_CHARMING_NEIGHBORHOOD_HOUSING'),
	-- ('POLICY_PUBLIC_TRANSPORT',			'PUBLICTRANSPORT_BREATHTAKING_NEIGHBORHOOD_HOUSING'),
	('POLICY_COLONIAL_OFFICES',			'COLONIALOFFICES_FOREIGNFOOD'),
	('POLICY_COLONIAL_OFFICES',			'COLONIALOFFICES_FOREIGNFOODPERCENTAGE'),
	('POLICY_MILITARY_RESEARCH',		'HD_MILITARY_RESEARCH_UNIT_TRAIN_GRANT_SCIENCE_XHH');

insert or replace into Modifiers
	(ModifierId,											ModifierType,											SubjectRequirementSetId)
values
	('TRAVELING_MERCHANTS_MARKET',							'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',		'BUILDING_IS_MARKET'),
	('NAVIGATION_ADMIRAL_LIGHTHOUSE',						'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',		'BUILDING_IS_LIGHTHOUSE'),
	('PUBLICTRANSPORT_CHARMING_NEIGHBORHOOD_HOUSING',		'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',				'DISTRICT_IS_CHARMING_NEIGHBORHOOD'),
	('PUBLICTRANSPORT_BREATHTAKING_NEIGHBORHOOD_HOUSING',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING',				'DISTRICT_IS_BREATHTAKING_NEIGHBORHOOD'),
	('COLONIALOFFICES_FOREIGNFOOD',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',		'CITY_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS'),
	('COLONIALOFFICES_FOREIGNFOODPERCENTAGE',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_GROWTH',	'CITY_NOT_OWNER_CAPITAL_CONTINENT_REQUIREMENTS');

insert or replace into Modifiers
	(ModifierId,													ModifierType)
values
	('CHARISMATICLEADER_OPENBORDERS',								'MODIFIER_ADJUST_OPEN_BORDERS_FROM_INFLUENCE'),
	('DIPLOMATIC_LEAGUE_INFLUENCEPOINTS',							'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN'),
	('SERFDOM_BUILDERPRODUCTION',									'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION'),
	('HD_MILITARY_RESEARCH_UNIT_TRAIN_GRANT_SCIENCE_XHH',			'MODIFIER_PLAYER_CITIES_GRANT_YIELD_PER_UNIT_COST');

insert or replace into ModifierArguments
	(ModifierId,											Name,					Value)
values
	('DIPLOMATIC_LEAGUE_INFLUENCEPOINTS',					'Amount',				6),
	('TRAVELING_MERCHANTS_MARKET',							'GreatPersonClassType',	'GREAT_PERSON_CLASS_MERCHANT'),
	('TRAVELING_MERCHANTS_MARKET',							'Amount',				4),
	('NAVIGATION_ADMIRAL_LIGHTHOUSE',						'GreatPersonClassType',	'GREAT_PERSON_CLASS_ADMIRAL'),
	('NAVIGATION_ADMIRAL_LIGHTHOUSE',						'Amount',				4),
	('SERFDOM_BUILDERPRODUCTION',							'UnitType',				'UNIT_BUILDER'),
	('SERFDOM_BUILDERPRODUCTION',							'Amount',				30),
	('PUBLICTRANSPORT_CHARMING_NEIGHBORHOOD_HOUSING',		'Amount',				1),
	('PUBLICTRANSPORT_BREATHTAKING_NEIGHBORHOOD_HOUSING',	'Amount',				1),
	('COLONIALOFFICES_FOREIGNFOOD',							'YieldType',			'YIELD_FOOD'),
	('COLONIALOFFICES_FOREIGNFOOD',							'Amount',				5),
	('COLONIALOFFICES_FOREIGNFOODPERCENTAGE',				'Amount',				10),
	('HD_MILITARY_RESEARCH_UNIT_TRAIN_GRANT_SCIENCE_XHH',	'YieldType',			'YIELD_SCIENCE'),
	('HD_MILITARY_RESEARCH_UNIT_TRAIN_GRANT_SCIENCE_XHH',	'UnitProductionPercent',75);

update ModifierArguments set Value = 5 where ModifierId = 'MILITARYRESEARCH_MILITARY_ACADEMY_SCIENCE_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 5 where ModifierId = 'MILITARYRESEARCH_SEAPORT_SCIENCE_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 5 where ModifierId = 'MILITARYRESEARCH_RENAISSANCE_WALLS_SCIENCE_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 50 where ModifierId = 'ILKUM_BUILDERPRODUCTION' and Name = 'Amount';
update ModifierArguments set Value = 50 where ModifierId = 'SERFDOM_BUILDERPRODUCTION' and Name = 'Amount';
update ModifierArguments set Value = 50 where ModifierId = 'PUBLICWORKS_BUILDERPRODUCTION' and Name = 'Amount';
update ModifierArguments set Value = 1 where ModifierId = 'SERFDOM_BUILDERCHARGES' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'WISSELBANKEN_ALLIANCEPOINTS';
update ModifierArguments set Value = 3 where ModifierId = 'PUBLICTRANSPORT_BREATHTAKING_NEIGHBORHOOD_FOOD' and Name = 'Amount';
-- dip cards
update ModifierArguments set Value = 3 where ModifierId = 'CHARISMATICLEADER_INFLUENCEPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 9 where ModifierId = 'GUNBOATDIPLOMACY_INFLUENCEPOINTS' and Name = 'Amount';
update ModifierArguments set Value = 3 where Name = 'Amount' and ModifierId = 'DIPLOMATIC_LEAGUE_INFLUENCEPOINTS' and exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
update ModifierArguments set Value = 3 where Name = 'Amount' and ModifierId = 'GUNBOATDIPLOMACY_INFLUENCEPOINTS' and exists (select DistrictType from Districts where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER');
update ModifierArguments set Value = 5 where ModifierId = 'COLONIALOFFICES_FOREIGNIDENTITY' and Name = 'Amount';

-- Strategic Resource
update ModifierArguments set Value = 3 where Name = 'Amount' and
	(ModifierId = 'EQUESTRIAN_ORDERS_ADDITIONAL_HORSES_EXTRACTION'
	or ModifierId = 'EQUESTRIAN_ORDERS_ADDITIONAL_IRON_EXTRACTION'
	or ModifierId = 'DRILL_MANUALS_ADDITIONAL_NITER_EXTRACTION'
	or ModifierId = 'DRILL_MANUALS_ADDITIONAL_COAL_EXTRACTION'
	or ModifierId = 'RESOURCE_MANAGEMENT_ADDITIONAL_ALUMINUM_EXTRACTION'
	or ModifierId = 'RESOURCE_MANAGEMENT_ADDITIONAL_OIL_EXTRACTION');
delete from PolicyModifiers where PolicyType = 'POLICY_RESOURCE_MANAGEMENT' and ModifierId = 'RESOURCE_MANAGEMENT_ADDITIONAL_ALUMINUM_EXTRACTION';
insert or replace into PolicyModifiers
	(PolicyType,						ModifierId)
values
	('POLICY_BREEDING',					'EQUESTRIAN_ORDERS_ADDITIONAL_HORSES_EXTRACTION'),
	('POLICY_FORGING',					'EQUESTRIAN_ORDERS_ADDITIONAL_IRON_EXTRACTION'),
	('POLICY_GUNPOWDER_RESEARCH',		'DRILL_MANUALS_ADDITIONAL_NITER_EXTRACTION'),
	('POLICY_DRILL_MANUALS',			'EQUESTRIAN_ORDERS_ADDITIONAL_HORSES_EXTRACTION'),
	('POLICY_DRILL_MANUALS',			'EQUESTRIAN_ORDERS_ADDITIONAL_IRON_EXTRACTION'),
	('POLICY_ELECTROLYTIC_ALUMINIUM',	'RESOURCE_MANAGEMENT_ADDITIONAL_ALUMINUM_EXTRACTION'),
	('POLICY_SUSTAINABLE_DEVELOPEMENT',	'EQUESTRIAN_ORDERS_ADDITIONAL_HORSES_EXTRACTION'),
	('POLICY_SUSTAINABLE_DEVELOPEMENT',	'EQUESTRIAN_ORDERS_ADDITIONAL_IRON_EXTRACTION'),
	('POLICY_SUSTAINABLE_DEVELOPEMENT',	'DRILL_MANUALS_ADDITIONAL_NITER_EXTRACTION'),
	('POLICY_SUSTAINABLE_DEVELOPEMENT',	'DRILL_MANUALS_ADDITIONAL_COAL_EXTRACTION'),
	('POLICY_SUSTAINABLE_DEVELOPEMENT',	'RESOURCE_MANAGEMENT_ADDITIONAL_ALUMINUM_EXTRACTION'),
	('POLICY_SUSTAINABLE_DEVELOPEMENT',	'RESOURCE_MANAGEMENT_ADDITIONAL_OIL_EXTRACTION');

delete from PolicyModifiers where PolicyType = 'POLICY_SIMULTANEUM';

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

insert or ignore into RequirementSets
	(RequirementSetId,											RequirementSetType)
values
	('BUILDING_IS_MUSEUM', 										'REQUIREMENTSET_TEST_ANY');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	('BUILDING_IS_MUSEUM', 										'REQUIRES_CITY_HAS_BUILDING_MUSEUM_ART'),
	('BUILDING_IS_MUSEUM', 										'REQUIRES_CITY_HAS_BUILDING_MUSEUM_ARTIFACT');

insert or replace into PolicyModifiers
	(PolicyType,												ModifierId)
values
-- POLICY_RATIONALISM
	--('POLICY_RATIONALISM',										'POLICY_RATIONALISM_REGIONAL_RANGE_BONUS'),
	('POLICY_RATIONALISM',										'POLICY_RATIONALISM_UNIVERSITY_POPULATION_SCIENCE'),
	('POLICY_RATIONALISM',										'POLICY_RATIONALISM_RESEARCH_LAB_POPULATION_SCIENCE'),
-- POLICY_FREE_MARKET
	--('POLICY_FREE_MARKET',										'POLICY_FREE_MARKET_REGIONAL_RANGE_BONUS'),
	('POLICY_FREE_MARKET',										'POLICY_FREE_MARKET_BANK_POPULATION_GOLD'),
	('POLICY_FREE_MARKET',										'POLICY_FREE_MARKET_STOCK_EXCHANGE_POPULATION_GOLD'),
-- POLICY_GRAND_OPERA
	--('POLICY_GRAND_OPERA',										'POLICY_GRAND_OPERA_REGIONAL_RANGE_BONUS'),
	('POLICY_GRAND_OPERA',										'POLICY_GRAND_OPERA_MUSEUM_POPULATION_CULTURE'),
	('POLICY_GRAND_OPERA',										'POLICY_GRAND_OPERA_BROADCAST_CENTER_POPULATION_CULTURE');

insert or replace into Modifiers
	(ModifierId,												ModifierType,												SubjectRequirementSetId)
values
-- POLICY_RATIONALISM
	--('POLICY_RATIONALISM_REGIONAL_RANGE_BONUS',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',	'DISTRICT_IS_CAMPUS'	),
	('POLICY_RATIONALISM_UNIVERSITY_POPULATION_SCIENCE',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_UNIVERSITY'),
	('POLICY_RATIONALISM_RESEARCH_LAB_POPULATION_SCIENCE',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_RESEARCH_LAB'),
-- POLICY_FREE_MARKET
	--('POLICY_FREE_MARKET_REGIONAL_RANGE_BONUS',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',	'DISTRICT_IS_COMMERCIAL_HUB'),
	('POLICY_FREE_MARKET_BANK_POPULATION_GOLD',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_BANK'),
	('POLICY_FREE_MARKET_STOCK_EXCHANGE_POPULATION_GOLD',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_STOCK_EXCHANGE'),
-- POLICY_GRAND_OPERA
	--('POLICY_GRAND_OPERA_REGIONAL_RANGE_BONUS',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',	'DISTRICT_IS_THEATER'),
	('POLICY_GRAND_OPERA_MUSEUM_POPULATION_CULTURE',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_MUSEUM'),
	('POLICY_GRAND_OPERA_BROADCAST_CENTER_POPULATION_CULTURE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_BROADCAST_CENTER');

insert or replace into ModifierArguments
	(ModifierId,												Name,														Value)
values
-- POLICY_RATIONALISM
	--('POLICY_RATIONALISM_REGIONAL_RANGE_BONUS',					'Amount',													3),
	('POLICY_RATIONALISM_UNIVERSITY_POPULATION_SCIENCE',		'YieldType',												'YIELD_SCIENCE'),
	('POLICY_RATIONALISM_UNIVERSITY_POPULATION_SCIENCE',		'Amount',													0.3),
	('POLICY_RATIONALISM_RESEARCH_LAB_POPULATION_SCIENCE',		'YieldType',												'YIELD_SCIENCE'),
	('POLICY_RATIONALISM_RESEARCH_LAB_POPULATION_SCIENCE',		'Amount',													0.5),
-- POLICY_FREE_MARKET
	--('POLICY_FREE_MARKET_REGIONAL_RANGE_BONUS',					'Amount',													3),
	('POLICY_FREE_MARKET_BANK_POPULATION_GOLD',					'YieldType',												'YIELD_GOLD'),
	('POLICY_FREE_MARKET_BANK_POPULATION_GOLD',					'Amount',													0.6),
	('POLICY_FREE_MARKET_STOCK_EXCHANGE_POPULATION_GOLD',		'YieldType',												'YIELD_GOLD'),
	('POLICY_FREE_MARKET_STOCK_EXCHANGE_POPULATION_GOLD',		'Amount',													1),
-- POLICY_GRAND_OPERA
	--('POLICY_GRAND_OPERA_REGIONAL_RANGE_BONUS',					'Amount',													3),
	('POLICY_GRAND_OPERA_MUSEUM_POPULATION_CULTURE',			'YieldType',												'YIELD_CULTURE'),
	('POLICY_GRAND_OPERA_MUSEUM_POPULATION_CULTURE',			'Amount',													0.3),
	('POLICY_GRAND_OPERA_BROADCAST_CENTER_POPULATION_CULTURE',	'YieldType',												'YIELD_CULTURE'),
	('POLICY_GRAND_OPERA_BROADCAST_CENTER_POPULATION_CULTURE',	'Amount',													0.5);

-- level-one district yield policies
--update ModifierArguments set Value = 50 where Name = 'Amount'
 	--and (ModifierID = 'AESTHETICS_DISTRICTCULTURE'
	--or ModifierID = 'CRAFTSMEN_DISTRICTPRODUCTION'
	--or ModifierID = 'NATURALPHILOSOPHY_DISTRICTSCIENCE'
	--or ModifierID = 'NAVALINFRASTRUCTURE_HARBORGOLD'
	--or ModifierID = 'SCRIPTURE_DISTRICTFAITH'
	--or ModifierID = 'TOWNCHARTERS_DISTRICTGOLD');
update ModifierArguments set Value = 50 where Name = 'Amount' and ModifierID = 'SCRIPTURE_DISTRICTFAITH';

-- update ModifierArguments set Value = 4 where Name = 'Amount' and (ModifierId = 'MARKETECONOMY_TRADEROUTECULTURE' or ModifierId = 'MARKETECONOMY_TRADEROUTESCIENCE');

update ModifierArguments set Value = 2 where Name = 'Amount' and ModifierId = 'INTERNATIONALSPACEAGENCY_SCIENCEPERTRIBUTARY';



delete from PolicyModifiers where PolicyType = 'POLICY_CARAVANSARIES';
delete from PolicyModifiers where PolicyType = 'POLICY_RAJ' and ModifierId = 'RAJ_CITY_TRADE_ROUTE_GOLD';
-- delete from Modifiers where ModifierId = 'CARAVANSARIES_TRADEROUTEGOLD';
insert or replace into PolicyModifiers
	(PolicyType,								ModifierId)
values
	('POLICY_FREELANCERS',						'FREELANCERS_GARRISON_GOLD'),
	('POLICY_FREELANCERS',						'RETAINERS_AMENITYBONUS'),
	('POLICY_MARITIME_INFRASTRUCTURE',			'MARITIME_INFRASTRUCTURE_COASTAL_CITY_PROD'),
	('POLICY_SEABORNE_SUPPLY',					'SEABORNE_SUPPLY_COASTAL_CITY_PROD'),
	('POLICY_GARRISON_RECLAMATION',				'GARRISON_RECLAMATION_ENCAMPMENT_FOOD'),
	('POLICY_GARRISON_RECLAMATION',				'GARRISON_RECLAMATION_ENCAMPMENT_HOUSING'),
	('POLICY_PRIMITIVE_COMMUNE',				'PRIMITIVE_COMMUNE_ALLCITYFOOD'),
	-- this Modifier is not removed with the Regional Range rewrite in DL_PostProcess.sql in order to make Power Plants provides power to more cities.
	('POLICY_OVERALL_PLANNING',					'MINOR_CIV_MEXICO_CITY_REGIONAL_RANGE_BONUS'),
	--('POLICY_BARD',								'BARD_ALLCITYCULTURE'),
	--('POLICY_CIVILIZE',							'CIVILIZE_ALLCITYSCIENCE'),
	('POLICY_CARAVANSARIES',					'CARAVANSARIES_ALLCITYGOLD'),
	-- ('POLICY_MINARET',							'MINARET_TEMPLE_POP_FAITH'),
	-- ('POLICY_MINARET',							'MINARET_TIER3_BUILDING_POP_FAITH'),
--	('POLICY_FINE_ARTS',						'FINE_ARTS_DISTRICTCULTURE'),
--	('POLICY_FREE_THOUGHTS',					'FREE_THOUGHTS_DISTRICTSCIENCE'),
--	('POLICY_TREASURE_FLEETS',					'TREASURE_FLEETS_HARBORGOLD'),
--	('POLICY_WORKERS_FACULTIES',				'WORKERS_FACULTIES_DISTRICTPRODUCTION'),
--	('POLICY_ENTREPRENEURSHIP',					'ENTREPRENEURSHIP_DISTRICTGOLD'),
	('POLICY_SIMULTANEUM',						'SIMULTANEUM_DISTRICTFAITH'),
	('POLICY_MINARET',							'MINARET_TEMPLE_POP_FAITH'),
	('POLICY_MINARET',							'MINARET_TIER3_BUILDING_POP_FAITH'),
	--
	('POLICY_DOMESTIC_TRADE',					'POLICY_DOMESTIC_TRADE_ROUTE_FOOD'),
	('POLICY_DOMESTIC_TRADE',					'POLICY_DOMESTIC_TRADE_ROUTE_PRODUCTION'),
	('POLICY_HIGHWAY',							'HIGHWAY_DOMESTIC_TRADE_ROUTE_FOOD'),
	('POLICY_HIGHWAY',							'HIGHWAY_DOMESTIC_TRADE_ROUTE_PRODUCTION'),
	('POLICY_SILK_ROAD',						'SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_CULTURE'),
	('POLICY_SILK_ROAD',						'SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_SCIENCE'),
	('POLICY_WAREHOUSE',						'WAREHOUSE_PRODUCTION_FOR_COMMERCIAL_HUB'),
	('POLICY_SAFETY_BOX',						'SAFETY_BOX_PRODUCTION_FOR_COMMERCIAL_HUB'),
	('POLICY_WALL_HOUSING',						'MONARCHY_WALLS_HOUSING'),
	('POLICY_WALL_HOUSING',						'MONARCHY_CASTLE_HOUSING'),
	('POLICY_WALL_HOUSING',						'MONARCHY_STARFORT_HOUSING'),
	('POLICY_WALL_HOUSING',						'WALLS_EARLY_HOUSING'),
	--('POLICY_ARENA_TICKETS',					'ARENA_TICKETS_ENTERTAINMENT_GOLD'),
	--('POLICY_ARENA_TICKETS',					'ARENA_TICKETS_ARENA_GOLD'),
	('POLICY_WRESTING_AND_MANEUVERS',			'WRESTING_AND_MANEUVERS_ARENA_AMENITY'),
	('POLICY_WONDERS_MISLEAD_COUNTRY',			'ANCIENTRENAISSANCEWONDER'),
	('POLICY_WONDERS_MISLEAD_COUNTRY',			'POLICY_WONDER_LESS_GOLD'),
	('POLICY_CITY_CENTRALIZATION',				'CITY_CENTRALIZATION_ALLCITYALLYIELD'),
	('POLICY_CITY_CENTRALIZATION',				'CITY_CENTRALIZATION_ALLCITYGOLD'),
	('POLICY_CONSTRUCTION_CROPS',				'GARRISON_RECLAMATION_ENCAMPMENT_FOOD'),
	('POLICY_CONSTRUCTION_CROPS',				'SEABORNE_SUPPLY_COASTAL_CITY_PROD'),
	('POLICY_CONSTRUCTION_CROPS',				'WALLS_EARLY_HOUSING'),
	('POLICY_CONSTRUCTION_CROPS',				'MONARCHY_WALLS_HOUSING'),
	('POLICY_CONSTRUCTION_CROPS',				'MONARCHY_CASTLE_HOUSING'),
	('POLICY_CONSTRUCTION_CROPS',				'MONARCHY_STARFORT_HOUSING'),
	('POLICY_DRILL',							'DRILL_EXPERIENCE'),
	('POLICY_TRIBUTE_TRADE',					'COMMERCIAL_HUB_INFLUENCEPOINTS'),
	('POLICY_TRIBUTE_TRADE',					'TRADE_ROUTE_GOLD_TO_CITY_STATES'),
	('POLICY_SELF_DETERMINATION',				'SELF_DETERMINATION_COMMERCIAL_HUB_INFLUENCEPOINTS'),
	('POLICY_SELF_DETERMINATION',				'SELF_DETERMINATION_HARBOR_INFLUENCEPOINTS'),
	('POLICY_SELF_DETERMINATION',				'SELF_DETERMINATION_TRADE_ROUTE_GOLD_TO_CITY_STATES'),
	('POLICY_SOCIAL_STATISTICS',				'SOCIAL_STATISTICS_POPULATION_SCIENCE'),
	('POLICY_SOCIAL_STATISTICS',				'SOCIAL_STATISTICS_POPULATION_CULTURE'),
	('POLICY_PLUTONOMY',						'PLUTONOMY_THEATER_GOLD_PERCENTAGE_BOOST'),
	('POLICY_PLUTONOMY',						'PLUTONOMY_CAMPUS_PRODUCTION_PERCENTAGE_BOOST'),
	('POLICY_PHILOSOPHY_EDUCATION',				'PHILOSOPHY_EDUCATION_WONDER_GREAT_PERSON_POINTS'),
	('POLICY_PURITAN',							'PURITAN_WORKSHIP_GOLD_PERCENTAGE_BOOST'),
	('POLICY_PURITAN',							'PURITAN_WORKSHIP_PRODUCTION_PERCENTAGE_BOOST'),
	('POLICY_SCIENTIFIC_EXPEDITIONS',			'SCIENTIFIC_EXPEDITIONS_SCIENCE'),
	('POLICY_SCIENTIFIC_EXPEDITIONS',			'SCIENTIFIC_EXPEDITIONS_CULTURE'),
	('POLICY_SISHU',							'SISHU_POPULATION_SCIENCE'),
	('POLICY_SISHU',							'SISHU_POPULATION_CULTURE'),
	('POLICY_COMPILE',							'COMPILE_FIXED_SCIENTIST_POINTS'),
	('POLICY_COMPILE',							'COMPILE_LIBRARY_SCIENTIST_POINTS'),
	('POLICY_SUPPLY_LINES',						'LOGISTICS_FRIENDLYTERRITORYMOVEMENTBONUS'),
	('POLICY_SUPPLY_LINES',						'VETERANCY_ENCAMPMENT_PRODUCTION'),
	('POLICY_SUPPLY_LINES',						'VETERANCY_ENCAMPMENT_BUILDINGS_PRODUCTION'),
	('POLICY_SUPPLY_LINES',						'VETERANCY_HARBOR_PRODUCTION'),
	('POLICY_SUPPLY_LINES',						'VETERANCY_HARBOR_BUILDINGS_PRODUCTION'),
	('POLICY_BASTIONS',							'LIMES_CASTLEPRODUCTION'),
	('POLICY_BASTIONS',							'LIMES_WALLSPRODUCTION'),
	('POLICY_BASTIONS',							'LIMES_STARFORTPRODUCTION'),
	('POLICY_BASTIONS',							'LIMES_TSIKHEPRODUCTION'),
	('POLICY_SCHOLAR_BUREAUCRAT',				'SCHOLAR_BUREAUCRAT_GREATWRITERPOINTS'),
	('POLICY_SCHOLAR_BUREAUCRAT',				'SCHOLAR_BUREAUCRAT_THEATER_TIER1_GREATWRITERPOINTS'),
	('POLICY_NEW_ROUTE',						'NEW_ROUTE_INTERNATIONAL_TRADE_ROUTE_CULTURE'),
	('POLICY_NEW_ROUTE',						'NEW_ROUTE_INTERNATIONAL_TRADE_ROUTE_SCIENCE'),
	('POLICY_WATER_TRANSPORT',					'WATER_TRANSPORT_DOMESTIC_TRADE_ROUTE_FOOD'),
	('POLICY_WATER_TRANSPORT',					'WATER_TRANSPORT_DOMESTIC_TRADE_ROUTE_PRODUCTION'),
	('POLICY_TEXTBOOK',							'TEXTBOOK_FIXED_SCIENTIST_POINTS'),
	('POLICY_TEXTBOOK',							'TEXTBOOK_TIER2_SCIENTIST_POINTS'),
	('POLICY_SUPERPOWER',						'SUPERPOWER_SCIENCE_ATTACH'),
	('POLICY_SUPERPOWER',						'SUPERPOWER_CULTURE_ATTACH'),
	('POLICY_LIBERALISM',						'LIBERALISM_ENTERTAINMENT_PRODUCTION'),
	('POLICY_LIBERALISM',						'LIBERALISM_ENTERTAINMENT_BUILDING_PRODUCTION'),
	('POLICY_LIBERALISM',						'LIBERALISM_WATHER_ENTERTAINMENT_PRODUCTION'),
	('POLICY_LIBERALISM',						'LIBERALISM_WATHER_ENTERTAINMENT_BUILDING_PRODUCTION'),
	('POLICY_FIVE_YEAR_PLAN',					'FIVE_YEAR_PLAN_INDUSTRIAL_RANGE'),
	--('POLICY_SPORTS_MEDIA',						'SPORTS_MEDIA_ENTERTAINMENT_RANGE'),
	('POLICY_DEEP_WATER_PORT',					'SEABORNE_SUPPLY_COASTAL_CITY_PROD'),
	('POLICY_DEEP_WATER_PORT',					'DEEPWATERPORT_GOLD'),
	('POLICY_DEEP_WATER_PORT',					'DEEPWATERPORT_HOUSING'), 
	('POLICY_GREEN_CITY',						'HD_GREEN_CITY_WONDER_TOURISM'),
	('POLICY_GREEN_CITY',						'HD_GREEN_CITY_NATIONALPARK_TOURISM'),
	('POLICY_TRAVEL_BLOGGER',					'TRAVEL_BLOGGER_TOURISM'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',		'INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',		'INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT_BUILDING'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',		'INFRASTRUCTURE_CONSTRUCTION_DAM'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',		'INFRASTRUCTURE_CONSTRUCTION_DAM_BUILDING'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',		'INFRASTRUCTURE_CONSTRUCTION_CANAL'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',		'INFRASTRUCTURE_CONSTRUCTION_CANAL_BUILDING'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',		'INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD'),
	('POLICY_INFRASTRUCTURE_CONSTRUCTION',		'INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD_BUILDING'),
	('POLICY_RAJ',								'RAJ_CAPTURED_CITY_CULTURE'),
	('POLICY_RAJ',								'RAJ_CAPTURED_CITY_SCIENCE'),
	('POLICY_RAJ',								'RAJ_CAPTURED_CITY_GOLD'),
	('POLICY_RAJ',								'RAJ_CAPTURED_CITY_FAITH'),
	('POLICY_INTERNATIONALISM',					'INTERNATIONALISM_DELEGATION_FAVOR'),
	('POLICY_INTERNATIONALISM',					'INTERNATIONALISM_EMBASSY_FAVOR'),
	('POLICY_INTERNATIONALISM',					'INTERNATIONALISM_INFLUENCE_POINTS'),
	('POLICY_SOCIAL_DARWINISM',					'SOCIAL_DARWINISM_CULTURE_ATTACH'),
	('POLICY_SOCIAL_DARWINISM',					'SOCIAL_DARWINISM_SCIENCE_ATTACH'),
	('POLICY_WELL_FIELD',						'PRIMITIVE_COMMUNE_ALLCITYFOOD'),
	('POLICY_WELL_FIELD',						'URBAN_PLANNING_ALLCITYPRODUCTION'),
	--('POLICY_HD_FIVE_YEAR_PLAN',				'FIVE_YEAR_PLAN_DISTRICT_PRODUCTION'),
	('POLICY_HOUSEHOOD_REGISTRATION',			'INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT'),
	('POLICY_HOUSEHOOD_REGISTRATION',			'INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT_BUILDING'),
	('POLICY_HOUSEHOOD_REGISTRATION',			'INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD'),
	('POLICY_HOUSEHOOD_REGISTRATION',			'INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD_BUILDING'),
	('POLICY_HAJJ',								'HAJJ_SCIENCEPERTRIBUTARY'),
	('POLICY_HAJJ',								'HAJJ_CULTUREPERTRIBUTARY'),
	('POLICY_MARTIAL_ELECTION',					'MARTIAL_ELECTION_GREAT_GENERAL_POINTS'),
	('POLICY_MARTIAL_ELECTION',					'MARTIAL_ELECTION_BUILDING_GREAT_GENERAL_POINTS'),
	('POLICY_GLADIATORIAL_GAME',				'GLADIATORIAL_GAME_ENTERTAINMENT_PRODUCTION'),
	('POLICY_GLADIATORIAL_GAME',				'GLADIATORIAL_GAME_ENTERTAINMENT_BUILDING_PRODUCTION'),
	('POLICY_MAGGIOR_CONSIGLIO',				'HARBOR_HUB_INFLUENCEPOINTS'),
    ('POLICY_MAGGIOR_CONSIGLIO',				'TRADE_ROUTE_GOLD_TO_CITY_STATES');

update ModifierArguments set Value = 2 where Name = 'Amount' and (ModifierId = 'MONARCHY_WALLS_HOUSING' or ModifierId = 'MONARCHY_CASTLE_HOUSING' or ModifierId = 'MONARCHY_STARFORT_HOUSING');

insert or replace into Modifiers
	(ModifierId,											ModifierType,															SubjectRequirementSetId)
values
	('FREELANCERS_GARRISON_GOLD',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_HAS_GARRISON_UNIT_REQUIERMENT'),
	('MARITIME_INFRASTRUCTURE_COASTAL_CITY_PROD', 			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'PLOT_IS_ADJACENT_TO_COAST'),
	('SEABORNE_SUPPLY_COASTAL_CITY_PROD', 					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'PLOT_IS_ADJACENT_TO_COAST'),
	('GARRISON_RECLAMATION_ENCAMPMENT_FOOD',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_HAS_ENCAMPMENT'),
	('GARRISON_RECLAMATION_ENCAMPMENT_HOUSING',				'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',							'CITY_HAS_ENCAMPMENT'),
	('MINARET_TEMPLE_POP_FAITH',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'CITY_HAS_DISTRICT_HOLY_SITE_TIER_2_BUILDING_REQUIREMENTS'),
	('MINARET_TIER3_BUILDING_POP_FAITH',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'BUILDING_IS_TIER3_HOLY_SITE'),
	('PRIMITIVE_COMMUNE_ALLCITYFOOD',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						null),
	('SHAMAN_ALLCITYFAITH',									'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						null),
	--('BARD_ALLCITYCULTURE',									'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						null),
	--('CIVILIZE_ALLCITYSCIENCE',								'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						null),
	('CARAVANSARIES_ALLCITYGOLD',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						null),
--	('FINE_ARTS_DISTRICTCULTURE',							'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',						'DISTRICT_IS_THEATER'),
--	('FREE_THOUGHTS_DISTRICTSCIENCE',						'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',						'DISTRICT_IS_CAMPUS'),
--	('TREASURE_FLEETS_HARBORGOLD',							'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',						'DISTRICT_IS_HARBOR'),
--	('WORKERS_FACULTIES_DISTRICTPRODUCTION',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',						'DISTRICT_IS_INDUSTRIAL_ZONE'),
--	('ENTREPRENEURSHIP_DISTRICTGOLD',						'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',						'DISTRICT_IS_COMMERCIAL_HUB'),
	('SIMULTANEUM_DISTRICTFAITH',							'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',						'DISTRICT_IS_HOLY_SITE'),
	--
	('POLICY_DOMESTIC_TRADE_ROUTE_FOOD',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',				null),
	('POLICY_DOMESTIC_TRADE_ROUTE_PRODUCTION',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',				null),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_FOOD',					'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',				null),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_PRODUCTION',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',				null),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_CULTURE',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',			null),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_SCIENCE',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',			null),
	('WAREHOUSE_PRODUCTION_FOR_COMMERCIAL_HUB',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_HAS_COMMERCIAL_HUB_REQUIREMENTS'),
	('SAFETY_BOX_PRODUCTION_FOR_COMMERCIAL_HUB',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_HAS_COMMERCIAL_HUB_REQUIREMENTS'),
--	('ARENA_TICKETS_ENTERTAINMENT_GOLD',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',						'DL_PLOT_IS_DISTRICT_IS_ENTERTAINMENT_REQUIRMENTS'),
--	('ARENA_TICKETS_ARENA_GOLD',							'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',					null),
	('WRESTING_AND_MANEUVERS_ARENA_AMENITY',				'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								'CITY_HAS_ARENA_AND_8_POP'),
	('WALLS_EARLY_HOUSING',									'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',							'CITY_HAS_WALLS_EARLY'),
	('ANCIENTRENAISSANCEWONDER',							'MODIFIER_PLAYER_CITIES_ADJUST_WONDER_ERA_PRODUCTION',					null),
	('POLICY_WONDER_LESS_GOLD',								'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',					null),
	('DRILL_EXPERIENCE',									'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_EXPERIENCE_MODIFIER',				null),
	('COMMERCIAL_HUB_INFLUENCEPOINTS',						'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',							'DISTRICT_IS_COMMERCIAL_HUB'),
	('COMMERCIAL_HUB_INFLUENCEPOINTS_MODIFIER',				'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',						null),
	('SELF_DETERMINATION_COMMERCIAL_HUB_INFLUENCEPOINTS',	'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',							'DISTRICT_IS_COMMERCIAL_HUB'),
	('SELF_DETERMINATION_COMMERCIAL_HUB_INFLUENCEPOINTS_MODIFIER',	'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',				null),
	('SELF_DETERMINATION_HARBOR_INFLUENCEPOINTS',	        'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',							'DISTRICT_IS_HARBOR'),
    ('SELF_DETERMINATION_HARBOR_INFLUENCEPOINTS_MODIFIER',	'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',						null),
	('TRADE_ROUTE_GOLD_TO_CITY_STATES',						'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE',	null),
	('SELF_DETERMINATION_TRADE_ROUTE_GOLD_TO_CITY_STATES',	'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_ORIGIN_YIELD_FOR_SUZERAIN_ROUTE',	null),
	('SOCIAL_STATISTICS_POPULATION_SCIENCE',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'CITY_HAS_3_SPECIALTY_DISTRICTS_REQUIREMENTS'),
	('SOCIAL_STATISTICS_POPULATION_CULTURE',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'CITY_HAS_3_SPECIALTY_DISTRICTS_REQUIREMENTS'),
	('PLUTONOMY_THEATER_GOLD_PERCENTAGE_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',					'HD_CITY_HAS_DISTRICT_THEATER_XHH'),
	('PLUTONOMY_CAMPUS_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',					'HD_CITY_HAS_DISTRICT_CAMPUS_XHH'),
	('PHILOSOPHY_EDUCATION_WONDER_GREAT_PERSON_POINTS',		'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT_BONUS',				'HD_CITY_HAS_DISTRICT_WONDER_XHH'),
	('PURITAN_WORKSHIP_GOLD_PERCENTAGE_BOOST',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',					'HD_CITY_HAS_RELIGIOUS_TIER_3_BUILDING_REQUIREMENTS'),
	('PURITAN_WORKSHIP_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',					'HD_CITY_HAS_RELIGIOUS_TIER_3_BUILDING_REQUIREMENTS'),
	('SCIENTIFIC_EXPEDITIONS_SCIENCE',						'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								'HD_OVERSEAS_CITY_HAS_TIER_2_COMMERCIAL_HUB_BUILDINGS'),
	('SCIENTIFIC_EXPEDITIONS_SCIENCE_MODIFIER',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'THE_HOME_CONTINENT_NEW_REQUIREMENT'),
	('SCIENTIFIC_EXPEDITIONS_CULTURE',						'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								'HD_OVERSEAS_CITY_HAS_TIER_2_HARBOR_BUILDINGS'),
	('SCIENTIFIC_EXPEDITIONS_CULTURE_MODIFIER',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'THE_HOME_CONTINENT_NEW_REQUIREMENT'),
	('SISHU_POPULATION_SCIENCE',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'CITY_HAS_2_SPECIALTY_DISTRICTS_REQUIREMENTS'),
	('SISHU_POPULATION_CULTURE',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',				'CITY_HAS_2_SPECIALTY_DISTRICTS_REQUIREMENTS'),
	('COMPILE_FIXED_SCIENTIST_POINTS',						'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',							null),
	('COMPILE_LIBRARY_SCIENTIST_POINTS',					'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',						'HD_CITY_HAS_SCIENTIFIC_TIER_1_BUILDING_REQUIREMENTS'),
	('SUPPLY_LINES_MOVEMENT_BONUS',							'MODIFIER_PLAYER_UNITS_ADJUST_FRIENDLY_TERRITORY_START_MOVEMENT',		null),
	('SCHOLAR_BUREAUCRAT_GREATWRITERPOINTS',				'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',							null),
	('SCHOLAR_BUREAUCRAT_THEATER_TIER1_GREATWRITERPOINTS',	'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',						'HD_CITY_HAS_CULTURAL_TIER_1_BUILDING_REQUIREMENTS'),
	('WATER_TRANSPORT_DOMESTIC_TRADE_ROUTE_FOOD',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',				null),
	('WATER_TRANSPORT_DOMESTIC_TRADE_ROUTE_PRODUCTION',		'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC',				null),
	('NEW_ROUTE_INTERNATIONAL_TRADE_ROUTE_CULTURE',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',			null),
	('NEW_ROUTE_INTERNATIONAL_TRADE_ROUTE_SCIENCE',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL',			null),
	('TEXTBOOK_FIXED_SCIENTIST_POINTS',						'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',							null),
	('TEXTBOOK_TIER2_SCIENTIST_POINTS',						'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',						'HD_CITY_HAS_SCIENTIFIC_TIER_2_BUILDING_REQUIREMENTS'),
	('SUPERPOWER_SCIENCE_ATTACH',							'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								'HD_CITY_HAS_SCIENTIFIC_TIER_3_BUILDING_REQUIREMENTS'),
	('SUPERPOWER_CULTURE_ATTACH',							'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								'HD_CITY_HAS_CULTURAL_TIER_3_BUILDING_REQUIREMENTS'),
	('SUPERPOWER_SCIENCE',									'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',					null),
	('SUPERPOWER_CULTURE',									'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER',					null),
	('LIBERALISM_ENTERTAINMENT_PRODUCTION',					'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',					null),
	('LIBERALISM_ENTERTAINMENT_BUILDING_PRODUCTION',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',					null),
	('LIBERALISM_WATHER_ENTERTAINMENT_PRODUCTION',			'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',					null),
	('LIBERALISM_WATHER_ENTERTAINMENT_BUILDING_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',					null),
	('FIVE_YEAR_PLAN_INDUSTRIAL_RANGE',						'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',				'DISTRICT_IS_INDUSTRIAL_ZONE'),
	--('SPORTS_MEDIA_ENTERTAINMENT_RANGE',					'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',				'HD_DISTRICT_IS_ENTERTAINMENT_OR_WARTERPARK'),
	('DEEPWATERPORT_GOLD',									'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'HD_CITY_HAS_HARBOR_TIER_3_BUILDING_REQUIREMENTS'),
	('DEEPWATERPORT_HOUSING',								'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING',							'HD_CITY_HAS_HARBOR_TIER_3_BUILDING_REQUIREMENTS'),
	('HD_GREEN_CITY_NATIONALPARK_TOURISM',					'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								null),
	('HD_GREEN_CITY_NATIONALPARK_TOURISM_MODIFIER',			'MODIFIER_SINGLE_CITY_ADJUST_NATIONAL_PARK_TOURISM',					'PLOT_BREATHTAKING_APPEAL'),
	('HD_GREEN_CITY_WONDER_TOURISM',						'MODIFIER_PLAYER_CITIES_ADJUST_TOURISM',								'PLOT_BREATHTAKING_APPEAL'),
	('TRAVEL_BLOGGER_TOURISM', 								'MODIFIER_PLAYER_CITIES_ADJUST_IMPROVEMENT_TOURISM', 					'CITY_IS_POWERED'),
	('INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT',				'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',					null),
	('INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT_BUILDING',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',					null),
	('INFRASTRUCTURE_CONSTRUCTION_DAM',						'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',					null),
	('INFRASTRUCTURE_CONSTRUCTION_DAM_BUILDING',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',					null),
	('INFRASTRUCTURE_CONSTRUCTION_CANAL',					'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',					null),
	('INFRASTRUCTURE_CONSTRUCTION_CANAL_BUILDING',			'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',					null),
	('INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD',			'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',					null),
	('INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD_BUILDING',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',					null),
	('RAJ_CAPTURED_CITY_CULTURE',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_WAS_NOT_FOUNDED'),
	('RAJ_CAPTURED_CITY_SCIENCE',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_WAS_NOT_FOUNDED'),
	('RAJ_CAPTURED_CITY_GOLD',								'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_WAS_NOT_FOUNDED'),
	('RAJ_CAPTURED_CITY_FAITH',								'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_WAS_NOT_FOUNDED'),
	('INTERNATIONALISM_DELEGATION_FAVOR',					'MODIFIER_PLAYER_ADJUST_FAVOR_FROM_DELEGATIONS',						null),
	('INTERNATIONALISM_EMBASSY_FAVOR',						'MODIFIER_PLAYER_ADJUST_FAVOR_FROM_EMBASSIES',							null),
	('INTERNATIONALISM_INFLUENCE_POINTS',					'MODIFIER_PLAYER_GOVERNMENT_FLAT_BONUS',								null),
	('SOCIAL_DARWINISM_CULTURE_ATTACH',						'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								'CITY_WAS_NOT_FOUNDED'),
	('SOCIAL_DARWINISM_SCIENCE_ATTACH',						'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',								'CITY_WAS_NOT_FOUNDED'),
	('SOCIAL_DARWINISM_CULTURE',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_WAS_FOUNDED'),
	('SOCIAL_DARWINISM_SCIENCE',							'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						'CITY_WAS_FOUNDED'),
	('CITY_CENTRALIZATION_ALLCITYALLYIELD',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_ALL_YIELDS_CHANGE',					null),
	('CITY_CENTRALIZATION_ALLCITYGOLD',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',						null),
	--('FIVE_YEAR_PLAN_DISTRICT_PRODUCTION',					'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION_MODIFIER',			null),
	('HAJJ_SCIENCEPERTRIBUTARY',							'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE_PER_TRIBUTARY',					null),
	('HAJJ_CULTUREPERTRIBUTARY',							'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE_PER_TRIBUTARY',					null),
	('MARTIAL_ELECTION_GREAT_GENERAL_POINTS',				'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',							null),
	('MARTIAL_ELECTION_BUILDING_GREAT_GENERAL_POINTS',		'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',						'CITY_HAS_DISTRICT_ENCAMPMENT_TIER_1_BUILDING_REQUIREMENTS'),
	('GLADIATORIAL_GAME_ENTERTAINMENT_PRODUCTION',			'MODIFIER_PLAYER_CITIES_ADJUST_DISTRICT_PRODUCTION',					null),
	('GLADIATORIAL_GAME_ENTERTAINMENT_BUILDING_PRODUCTION',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION',					null),
	('HARBOR_HUB_INFLUENCEPOINTS',					        'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',							'DISTRICT_IS_HARBOR'),
    ('HARBOR_HUB_INFLUENCEPOINTS_MODIFIER',                 'MODIFIER_PLAYER_ADJUST_INFLUENCE_POINTS_PER_TURN',						null);
insert or replace into Modifiers
	(ModifierId,										ModifierType,												SubjectRequirementSetId,								SubjectStackLimit)
values
	('WRESTING_AND_MANEUVERS_ARENA_AMENITY_MODIFIER',	'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_AMENITY',				'WRESTING_AND_MANEUVERS_ARENA_AMENITY_REQUIREMENTS',	1);
insert or replace into ModifierArguments
	(ModifierId,															Name,							Value)
values
	('FREELANCERS_GARRISON_GOLD',											'YieldType',					'YIELD_GOLD'),
	('FREELANCERS_GARRISON_GOLD',											'Amount',						5),
	('MARITIME_INFRASTRUCTURE_COASTAL_CITY_PROD', 							'YieldType',					'YIELD_PRODUCTION'),
	('MARITIME_INFRASTRUCTURE_COASTAL_CITY_PROD', 							'Amount',						2),
	('SEABORNE_SUPPLY_COASTAL_CITY_PROD',									'YieldType',					'YIELD_PRODUCTION'),
	('SEABORNE_SUPPLY_COASTAL_CITY_PROD',									'Amount',						4),
	('GARRISON_RECLAMATION_ENCAMPMENT_FOOD',								'YieldType',					'YIELD_FOOD'),
	('GARRISON_RECLAMATION_ENCAMPMENT_FOOD',								'Amount',						4),
	('GARRISON_RECLAMATION_ENCAMPMENT_HOUSING',								'Amount',						2),
	('PRIMITIVE_COMMUNE_ALLCITYFOOD',										'YieldType',					'YIELD_FOOD'),
	('PRIMITIVE_COMMUNE_ALLCITYFOOD',										'Amount',						1),
	('SHAMAN_ALLCITYFAITH',													'YieldType',					'YIELD_FAITH'),
	('SHAMAN_ALLCITYFAITH',													'Amount',						1),
	--('BARD_ALLCITYCULTURE',													'YieldType',					'YIELD_CULTURE'),
	--('BARD_ALLCITYCULTURE',													'Amount',						1),
	--('CIVILIZE_ALLCITYSCIENCE',												'YieldType',					'YIELD_SCIENCE'),
	--('CIVILIZE_ALLCITYSCIENCE',												'Amount',						1),
	('CARAVANSARIES_ALLCITYGOLD',											'YieldType',					'YIELD_GOLD'),
	('CARAVANSARIES_ALLCITYGOLD',											'Amount',						2),
	('MINARET_TEMPLE_POP_FAITH',											'YieldType',					'YIELD_FAITH'),
	('MINARET_TEMPLE_POP_FAITH',											'Amount',						0.3),
	('MINARET_TIER3_BUILDING_POP_FAITH',									'YieldType',					'YIELD_FAITH'),
	('MINARET_TIER3_BUILDING_POP_FAITH',									'Amount',						0.5),
--	('FINE_ARTS_DISTRICTCULTURE',											'YieldType',					'YIELD_CULTURE'),
--	('FINE_ARTS_DISTRICTCULTURE',											'Amount',						100),
--	('FREE_THOUGHTS_DISTRICTSCIENCE',										'YieldType',					'YIELD_SCIENCE'),
--	('FREE_THOUGHTS_DISTRICTSCIENCE',										'Amount',						100),
--	('TREASURE_FLEETS_HARBORGOLD',											'YieldType',					'YIELD_GOLD'),
--	('TREASURE_FLEETS_HARBORGOLD',											'Amount',						100),
--	('WORKERS_FACULTIES_DISTRICTPRODUCTION',								'YieldType',					'YIELD_PRODUCTION'),
--	('WORKERS_FACULTIES_DISTRICTPRODUCTION',								'Amount',						100),
--	('ENTREPRENEURSHIP_DISTRICTGOLD',										'YieldType',					'YIELD_GOLD'),
--	('ENTREPRENEURSHIP_DISTRICTGOLD',										'Amount',						100),
	('SIMULTANEUM_DISTRICTFAITH',											'YieldType',					'YIELD_FAITH'),
	('SIMULTANEUM_DISTRICTFAITH',											'Amount',						100),
	--
	('POLICY_DOMESTIC_TRADE_ROUTE_FOOD',									'YieldType',					'YIELD_FOOD'),
	('POLICY_DOMESTIC_TRADE_ROUTE_FOOD',									'Amount',						1),
	('POLICY_DOMESTIC_TRADE_ROUTE_PRODUCTION',								'YieldType',					'YIELD_PRODUCTION'),
	('POLICY_DOMESTIC_TRADE_ROUTE_PRODUCTION',								'Amount',						1),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_FOOD',									'YieldType',					'YIELD_FOOD'),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_FOOD',									'Amount',						2),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_PRODUCTION',								'YieldType',					'YIELD_PRODUCTION'),
	('HIGHWAY_DOMESTIC_TRADE_ROUTE_PRODUCTION',								'Amount',						2),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_CULTURE',							'YieldType',					'YIELD_CULTURE'),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_CULTURE',							'Amount',						2),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_SCIENCE',							'YieldType',					'YIELD_SCIENCE'),
	('SILK_ROAD_INTERNATIONAL_TRADE_ROUTE_SCIENCE',							'Amount',						2),
	('WAREHOUSE_PRODUCTION_FOR_COMMERCIAL_HUB',								'YieldType',					'YIELD_PRODUCTION'),
	('WAREHOUSE_PRODUCTION_FOR_COMMERCIAL_HUB',								'Amount',						2),
	('SAFETY_BOX_PRODUCTION_FOR_COMMERCIAL_HUB',							'YieldType',					'YIELD_PRODUCTION'),
	('SAFETY_BOX_PRODUCTION_FOR_COMMERCIAL_HUB',							'Amount',						4),
--	('ARENA_TICKETS_ENTERTAINMENT_GOLD',									'YieldType',					'YIELD_GOLD'),
--	('ARENA_TICKETS_ENTERTAINMENT_GOLD',									'Amount',						6),
--	('ARENA_TICKETS_ARENA_GOLD',											'BuildingType',					'BUILDING_ARENA'),
--	('ARENA_TICKETS_ARENA_GOLD',											'YieldType',					'YIELD_GOLD'),
--	('ARENA_TICKETS_ARENA_GOLD',											'Amount',						10),
	('WRESTING_AND_MANEUVERS_ARENA_AMENITY',								'ModifierId',					'WRESTING_AND_MANEUVERS_ARENA_AMENITY_MODIFIER'),
	('WRESTING_AND_MANEUVERS_ARENA_AMENITY_MODIFIER',						'Amount',										2),
	('WALLS_EARLY_HOUSING',													'Amount',						2),
	('ANCIENTRENAISSANCEWONDER',											'Amount',						15),
	('ANCIENTRENAISSANCEWONDER',											'IsWonder',						1),
	('ANCIENTRENAISSANCEWONDER',											'StartEra',						'ERA_ANCIENT'),
	('ANCIENTRENAISSANCEWONDER',											'EndEra',						'ERA_RENAISSANCE'),
	('POLICY_WONDER_LESS_GOLD',												'YieldType',					'YIELD_GOLD'),
	('POLICY_WONDER_LESS_GOLD',												'Amount',						-50),
	('DRILL_EXPERIENCE',													'Amount',						50),
	('COMMERCIAL_HUB_INFLUENCEPOINTS',										'ModifierId',					'COMMERCIAL_HUB_INFLUENCEPOINTS_MODIFIER'),
	('COMMERCIAL_HUB_INFLUENCEPOINTS_MODIFIER',								'Amount',						1),
	('TRADE_ROUTE_GOLD_TO_CITY_STATES',										'YieldType',					'YIELD_GOLD'),
	('TRADE_ROUTE_GOLD_TO_CITY_STATES',										'Amount',						3),
	('SELF_DETERMINATION_COMMERCIAL_HUB_INFLUENCEPOINTS',					'ModifierId',					'SELF_DETERMINATION_COMMERCIAL_HUB_INFLUENCEPOINTS_MODIFIER'),
	('SELF_DETERMINATION_COMMERCIAL_HUB_INFLUENCEPOINTS_MODIFIER',			'Amount',						2),
	('SELF_DETERMINATION_HARBOR_INFLUENCEPOINTS',					        'ModifierId',					'SELF_DETERMINATION_HARBOR_INFLUENCEPOINTS_MODIFIER'),
    ('SELF_DETERMINATION_HARBOR_INFLUENCEPOINTS_MODIFIER',  			    'Amount',						2),
	('SELF_DETERMINATION_TRADE_ROUTE_GOLD_TO_CITY_STATES',					'YieldType',					'YIELD_GOLD'),
	('SELF_DETERMINATION_TRADE_ROUTE_GOLD_TO_CITY_STATES',					'Amount',						5),
	('SOCIAL_STATISTICS_POPULATION_SCIENCE',								'YieldType',					'YIELD_SCIENCE'),
	('SOCIAL_STATISTICS_POPULATION_SCIENCE',								'Amount',						0.6),
	('SOCIAL_STATISTICS_POPULATION_CULTURE',								'YieldType',					'YIELD_CULTURE'),
	('SOCIAL_STATISTICS_POPULATION_CULTURE',								'Amount',						0.6),
	('PLUTONOMY_THEATER_GOLD_PERCENTAGE_BOOST',								'YieldType',					'YIELD_GOLD'),
	('PLUTONOMY_THEATER_GOLD_PERCENTAGE_BOOST',								'Amount',						5),
	('PLUTONOMY_CAMPUS_PRODUCTION_PERCENTAGE_BOOST',						'YieldType',					'YIELD_PRODUCTION'),
	('PLUTONOMY_CAMPUS_PRODUCTION_PERCENTAGE_BOOST',						'Amount',						5),
	('PHILOSOPHY_EDUCATION_WONDER_GREAT_PERSON_POINTS',						'Amount',						25),
	('PURITAN_WORKSHIP_GOLD_PERCENTAGE_BOOST',								'YieldType',					'YIELD_GOLD'),
	('PURITAN_WORKSHIP_GOLD_PERCENTAGE_BOOST',								'Amount',						7),
	('PURITAN_WORKSHIP_PRODUCTION_PERCENTAGE_BOOST',						'YieldType',					'YIELD_PRODUCTION'),
	('PURITAN_WORKSHIP_PRODUCTION_PERCENTAGE_BOOST',						'Amount',						7),
	('SCIENTIFIC_EXPEDITIONS_SCIENCE',										'ModifierId',					'SCIENTIFIC_EXPEDITIONS_SCIENCE_MODIFIER'),
	('SCIENTIFIC_EXPEDITIONS_SCIENCE_MODIFIER',								'YieldType',					'YIELD_SCIENCE'),
	('SCIENTIFIC_EXPEDITIONS_SCIENCE_MODIFIER',								'Amount',						3),
	('SCIENTIFIC_EXPEDITIONS_CULTURE',										'ModifierId',					'SCIENTIFIC_EXPEDITIONS_CULTURE_MODIFIER'),
	('SCIENTIFIC_EXPEDITIONS_CULTURE_MODIFIER',								'YieldType',					'YIELD_CULTURE'),
	('SCIENTIFIC_EXPEDITIONS_CULTURE_MODIFIER',								'Amount',						3),
	('SISHU_POPULATION_SCIENCE',											'YieldType',					'YIELD_SCIENCE'),
	('SISHU_POPULATION_SCIENCE',											'Amount',						0.3),
	('SISHU_POPULATION_CULTURE',											'YieldType',					'YIELD_CULTURE'),
	('SISHU_POPULATION_CULTURE',											'Amount',						0.3),
	('COMPILE_FIXED_SCIENTIST_POINTS',										'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
	('COMPILE_FIXED_SCIENTIST_POINTS',										'Amount',						4),
	('COMPILE_LIBRARY_SCIENTIST_POINTS',									'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
	('COMPILE_LIBRARY_SCIENTIST_POINTS',									'Amount',						2),
	('SUPPLY_LINES_MOVEMENT_BONUS',											'Amount',						2),
	('SCHOLAR_BUREAUCRAT_GREATWRITERPOINTS',								'GreatPersonClassType',			'GREAT_PERSON_CLASS_WRITER'),
	('SCHOLAR_BUREAUCRAT_GREATWRITERPOINTS',								'Amount',						4),
	('SCHOLAR_BUREAUCRAT_THEATER_TIER1_GREATWRITERPOINTS',					'GreatPersonClassType',			'GREAT_PERSON_CLASS_WRITER'),
	('SCHOLAR_BUREAUCRAT_THEATER_TIER1_GREATWRITERPOINTS',					'Amount',						2),
	('WATER_TRANSPORT_DOMESTIC_TRADE_ROUTE_FOOD',							'YieldType',					'YIELD_FOOD'),
	('WATER_TRANSPORT_DOMESTIC_TRADE_ROUTE_FOOD',							'Amount',						3),
	('WATER_TRANSPORT_DOMESTIC_TRADE_ROUTE_PRODUCTION',						'YieldType',					'YIELD_PRODUCTION'),
	('WATER_TRANSPORT_DOMESTIC_TRADE_ROUTE_PRODUCTION',						'Amount',						3),
	('NEW_ROUTE_INTERNATIONAL_TRADE_ROUTE_CULTURE',							'YieldType',					'YIELD_CULTURE'),
	('NEW_ROUTE_INTERNATIONAL_TRADE_ROUTE_CULTURE',							'Amount',						3),
	('NEW_ROUTE_INTERNATIONAL_TRADE_ROUTE_SCIENCE',							'YieldType',					'YIELD_SCIENCE'),
	('NEW_ROUTE_INTERNATIONAL_TRADE_ROUTE_SCIENCE',							'Amount',						3),
	('TEXTBOOK_FIXED_SCIENTIST_POINTS',										'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
	('TEXTBOOK_FIXED_SCIENTIST_POINTS',										'Amount',						4),
	('TEXTBOOK_TIER2_SCIENTIST_POINTS',										'GreatPersonClassType',			'GREAT_PERSON_CLASS_SCIENTIST'),
	('TEXTBOOK_TIER2_SCIENTIST_POINTS',										'Amount',						4),
	('SUPERPOWER_SCIENCE_ATTACH',											'ModifierId',					'SUPERPOWER_SCIENCE'),
	('SUPERPOWER_CULTURE_ATTACH',											'ModifierId',					'SUPERPOWER_CULTURE'),
	('SUPERPOWER_SCIENCE',													'Amount',						2),
	('SUPERPOWER_SCIENCE',													'YieldType',					'YIELD_SCIENCE'),
	('SUPERPOWER_CULTURE',													'Amount',						2),
	('SUPERPOWER_CULTURE',													'YieldType',					'YIELD_CULTURE'),
	('LIBERALISM_ENTERTAINMENT_PRODUCTION',	 								'DistrictType',					'DISTRICT_ENTERTAINMENT_COMPLEX'),
	('LIBERALISM_ENTERTAINMENT_PRODUCTION',	  								'Amount',						50),
	('LIBERALISM_ENTERTAINMENT_BUILDING_PRODUCTION',	 					'DistrictType',					'DISTRICT_ENTERTAINMENT_COMPLEX'),
	('LIBERALISM_ENTERTAINMENT_BUILDING_PRODUCTION',	  					'Amount',						50),
	('LIBERALISM_WATHER_ENTERTAINMENT_PRODUCTION',	 						'DistrictType',					'DISTRICT_WATER_ENTERTAINMENT_COMPLEX'),
	('LIBERALISM_WATHER_ENTERTAINMENT_BUILDING_PRODUCTION',	  				'Amount',						50),
	('LIBERALISM_WATHER_ENTERTAINMENT_PRODUCTION',	 						'DistrictType',					'DISTRICT_WATER_ENTERTAINMENT_COMPLEX'),
	('LIBERALISM_WATHER_ENTERTAINMENT_BUILDING_PRODUCTION',	  				'Amount',						50),
	('FIVE_YEAR_PLAN_INDUSTRIAL_RANGE',	  									'Amount',						3),
	--('SPORTS_MEDIA_ENTERTAINMENT_RANGE',	  								'Amount',						3),
	('DEEPWATERPORT_GOLD',													'YieldType',					'YIELD_GOLD'),
	('DEEPWATERPORT_GOLD',													'Amount',						6),
	('DEEPWATERPORT_HOUSING',												'Amount',						3), 
	('HD_GREEN_CITY_WONDER_TOURISM',										'BoostsWonders',				1),
	('HD_GREEN_CITY_WONDER_TOURISM',										'ScalingFactor',				200),
	('HD_GREEN_CITY_NATIONALPARK_TOURISM',									'ModifierId',					'HD_GREEN_CITY_NATIONALPARK_TOURISM_MODIFIER'),
	('HD_GREEN_CITY_NATIONALPARK_TOURISM_MODIFIER',							'Amount',						100),
	('TRAVEL_BLOGGER_TOURISM',												'Amount', 						200),
    ('INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT',                    			'DistrictType',                 'DISTRICT_AQUEDUCT'),
    ('INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT',                    			'Amount',                       50),
    ('INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT_BUILDING',                    	'DistrictType',                 'DISTRICT_AQUEDUCT'),
    ('INFRASTRUCTURE_CONSTRUCTION_AQUEDUCT_BUILDING',                    	'Amount',                       50),
    ('INFRASTRUCTURE_CONSTRUCTION_DAM',                    					'DistrictType',                 'DISTRICT_DAM'),
    ('INFRASTRUCTURE_CONSTRUCTION_DAM',                    					'Amount',                       50),
    ('INFRASTRUCTURE_CONSTRUCTION_DAM_BUILDING',                    		'DistrictType',                 'DISTRICT_DAM'),
    ('INFRASTRUCTURE_CONSTRUCTION_DAM_BUILDING',                    		'Amount',                       50),
    ('INFRASTRUCTURE_CONSTRUCTION_CANAL',                    				'DistrictType',                 'DISTRICT_CANAL'),
    ('INFRASTRUCTURE_CONSTRUCTION_CANAL',                    				'Amount',                       50),
    ('INFRASTRUCTURE_CONSTRUCTION_CANAL_BUILDING',                    		'DistrictType',                 'DISTRICT_CANAL'),
    ('INFRASTRUCTURE_CONSTRUCTION_CANAL_BUILDING',                    		'Amount',                       50),
    ('INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD',                    		'DistrictType',                 'DISTRICT_NEIGHBORHOOD'),
    ('INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD',                    		'Amount',                       50),
    ('INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD_BUILDING',                   'DistrictType',                 'DISTRICT_NEIGHBORHOOD'),
    ('INFRASTRUCTURE_CONSTRUCTION_NEIGHBORHOOD_BUILDING',                   'Amount',                       50),
	('RAJ_CAPTURED_CITY_CULTURE',											'YieldType',					'YIELD_CULTURE'),
	('RAJ_CAPTURED_CITY_CULTURE',											'Amount',						2),
	('RAJ_CAPTURED_CITY_SCIENCE',											'YieldType',					'YIELD_SCIENCE'),
	('RAJ_CAPTURED_CITY_SCIENCE',											'Amount',						2),
	('RAJ_CAPTURED_CITY_GOLD',												'YieldType',					'YIELD_GOLD'),
	('RAJ_CAPTURED_CITY_GOLD',												'Amount',						2),
	('RAJ_CAPTURED_CITY_FAITH',												'YieldType',					'YIELD_FAITH'),
	('RAJ_CAPTURED_CITY_FAITH',												'Amount',						2),
	('INTERNATIONALISM_DELEGATION_FAVOR',									'Amount',						3),
	('INTERNATIONALISM_EMBASSY_FAVOR',										'Amount',						3),
	('INTERNATIONALISM_INFLUENCE_POINTS',									'BonusType',					'GOVERNMENTBONUS_ENVOYS'),
	('INTERNATIONALISM_INFLUENCE_POINTS',									'Amount',						30),
	('SOCIAL_DARWINISM_CULTURE_ATTACH',										'ModifierId',					'SOCIAL_DARWINISM_CULTURE'),
	('SOCIAL_DARWINISM_SCIENCE_ATTACH',										'ModifierId',					'SOCIAL_DARWINISM_SCIENCE'),
	('SOCIAL_DARWINISM_CULTURE',											'YieldType',					'YIELD_CULTURE'),
	('SOCIAL_DARWINISM_CULTURE',											'Amount',						1),
	('SOCIAL_DARWINISM_SCIENCE',											'YieldType',					'YIELD_SCIENCE'),
	('SOCIAL_DARWINISM_SCIENCE',											'Amount',						1),
	('CITY_CENTRALIZATION_ALLCITYALLYIELD',									'Amount',						2),
	('CITY_CENTRALIZATION_ALLCITYGOLD',										'YieldType',					'YIELD_GOLD'),
	('CITY_CENTRALIZATION_ALLCITYGOLD',										'Amount',						2),
	--('FIVE_YEAR_PLAN_DISTRICT_PRODUCTION',									'Amount',						30),
	('HAJJ_SCIENCEPERTRIBUTARY',											'YieldType',					'YIELD_SCIENCE'),
	('HAJJ_SCIENCEPERTRIBUTARY',											'Amount',						1),
	('HAJJ_CULTUREPERTRIBUTARY',											'YieldType',					'YIELD_CULTURE'),
	('HAJJ_CULTUREPERTRIBUTARY',											'Amount',						1),
	('MARTIAL_ELECTION_GREAT_GENERAL_POINTS',								'GreatPersonClassType',			'GREAT_PERSON_CLASS_GENERAL'),
	('MARTIAL_ELECTION_GREAT_GENERAL_POINTS',								'Amount',						4),
	('MARTIAL_ELECTION_BUILDING_GREAT_GENERAL_POINTS',						'GreatPersonClassType',			'GREAT_PERSON_CLASS_GENERAL'),
	('MARTIAL_ELECTION_BUILDING_GREAT_GENERAL_POINTS',						'Amount',						2),
	('GLADIATORIAL_GAME_ENTERTAINMENT_PRODUCTION',	 						'DistrictType',					'DISTRICT_ENTERTAINMENT_COMPLEX'),
	('GLADIATORIAL_GAME_ENTERTAINMENT_PRODUCTION',	  						'Amount',						30),
	('GLADIATORIAL_GAME_ENTERTAINMENT_BUILDING_PRODUCTION',	 				'DistrictType',					'DISTRICT_ENTERTAINMENT_COMPLEX'),
	('GLADIATORIAL_GAME_ENTERTAINMENT_BUILDING_PRODUCTION',	  				'Amount',						30),
	('HARBOR_HUB_INFLUENCEPOINTS',										    'ModifierId',					'HARBOR_HUB_INFLUENCEPOINTS_MODIFIER'),
    ('HARBOR_HUB_INFLUENCEPOINTS_MODIFIER',								    'Amount',						1);

insert or ignore into RequirementArguments (RequirementId,		Name,		Value) values
	('REQUIRES_PLOT_HAS_ARENA_WITHIN_4',		'BuildingType',	'BUILDING_ARENA'),
	('REQUIRES_PLOT_HAS_ARENA_WITHIN_4',		'MinRange',		0),
	('REQUIRES_PLOT_HAS_ARENA_WITHIN_4',		'MaxRange',		4),
	('REQUIRES_CITY_HAS_SEAPORT',				'BuildingType',	'BUILDING_SEAPORT'),
	('REQUIRES_CITY_HAS_TIER_2_HARBOR_BUILDINGS_MET','RequirementSetId',	'REQUIRES_CITY_HAS_TIER_2_HARBOR_BUILDINGS'),
	('REQUIRES_CITY_HAS_TIER_2_COMMERCIAL_HUB_BUILDINGS_MET','RequirementSetId',	'REQUIRES_CITY_HAS_TIER_2_COMMERCIAL_HUB_BUILDINGS');


insert or ignore into Requirements (RequirementId,		RequirementType) values
	('REQUIRES_PLOT_HAS_ARENA_WITHIN_4',		'REQUIREMENT_PLOT_ADJACENT_BUILDING_TYPE_MATCHES'),
	('REQUIRES_CITY_HAS_SEAPORT',				'REQUIREMENT_CITY_HAS_BUILDING'),
	('REQUIRES_CITY_HAS_TIER_2_HARBOR_BUILDINGS_MET',				'REQUIREMENT_REQUIREMENTSET_IS_MET'),
	('REQUIRES_CITY_HAS_TIER_2_COMMERCIAL_HUB_BUILDINGS_MET',				'REQUIREMENT_REQUIREMENTSET_IS_MET');

insert or ignore into RequirementSets
	(RequirementSetId,											RequirementSetType)
values
	('WRESTING_AND_MANEUVERS_ARENA_AMENITY_REQUIREMENTS', 		'REQUIREMENTSET_TEST_ALL'),
	('CITY_HAS_WALLS_EARLY', 									'REQUIREMENTSET_TEST_ALL'),
	('CITY_HAS_TSIKHE', 										'REQUIREMENTSET_TEST_ALL'),
	('HD_CITY_HAS_DISTRICT_THEATER_XHH', 						'REQUIREMENTSET_TEST_ALL'),
	('HD_CITY_HAS_DISTRICT_CAMPUS_XHH', 						'REQUIREMENTSET_TEST_ALL'),
	('HD_CITY_HAS_DISTRICT_WONDER_XHH', 						'REQUIREMENTSET_TEST_ALL'),
	('HD_OVERSEAS_CITY_HAS_TIER_2_COMMERCIAL_HUB_BUILDINGS', 			'REQUIREMENTSET_TEST_ALL'),
	('HD_OVERSEAS_CITY_HAS_TIER_2_HARBOR_BUILDINGS', 					'REQUIREMENTSET_TEST_ALL');

insert or ignore into RequirementSetRequirements
	(RequirementSetId,											RequirementId)
values
	('WRESTING_AND_MANEUVERS_ARENA_AMENITY_REQUIREMENTS', 		'REQUIRES_PLOT_HAS_ARENA_WITHIN_4'),
	('CITY_HAS_WALLS_EARLY', 									'REQUIRES_CITY_HAS_BUILDING_WALLS_EARLY'),
	('CITY_HAS_TSIKHE', 										'REQUIRES_CITY_HAS_BUILDING_TSIKHE'),
	('HD_CITY_HAS_DISTRICT_THEATER_XHH', 						'REQUIRES_CITY_HAS_DISTRICT_THEATER'),
	('HD_CITY_HAS_DISTRICT_CAMPUS_XHH', 						'REQUIRES_CITY_HAS_DISTRICT_CAMPUS'),
	('HD_CITY_HAS_DISTRICT_WONDER_XHH', 						'REQUIRES_CITY_HAS_WONDER'),
	('HD_OVERSEAS_CITY_HAS_TIER_2_COMMERCIAL_HUB_BUILDINGS', 	'REQUIRES_HD_CITY_HAS_COMMERCIAL_TIER_2_BUILDING'),
	('HD_OVERSEAS_CITY_HAS_TIER_2_COMMERCIAL_HUB_BUILDINGS', 	'REQUIRES_CITY_IS_NOT_OWNER_CAPITAL_CONTINENT'),
	('HD_OVERSEAS_CITY_HAS_TIER_2_HARBOR_BUILDINGS', 			'REQUIRES_HD_CITY_HAS_HARBOR_TIER_2_BUILDING'),
	('HD_OVERSEAS_CITY_HAS_TIER_2_HARBOR_BUILDINGS', 			'REQUIRES_CITY_IS_NOT_OWNER_CAPITAL_CONTINENT');



-- policy housing
update ModifierArguments set Value = 2 where ModifierId = 'INSULAE_SPECIALTYHOUSING';
update ModifierArguments set Value = 4 where ModifierId = 'MEDINAQUARTER_SPECIALTYHOUSING';		

delete from PolicyModifiers where PolicyType = 'POLICY_LIGHTNING_WARFARE';
insert or replace into PolicyModifiers
	(PolicyType,							ModifierId)
values
	('POLICY_LIGHTNING_WARFARE',			'LIGHTNING_WARFARE_CAVALRY_MOVEMENT'),
	('POLICY_LIGHTNING_WARFARE',			'LIGHTNING_WARFARE_CAVALRY_STRENGTH');

insert or replace into Modifiers
	(ModifierId,							ModifierType,										SubjectRequirementSetId)
values
	('LIGHTNING_WARFARE_CAVALRY_MOVEMENT',	'MODIFIER_PLAYER_UNITS_ADJUST_MOVEMENT',			'UNIT_IS_CAVALRY_REQUIREMENTS'),
	('LIGHTNING_WARFARE_CAVALRY_STRENGTH',	'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH',		'UNIT_IS_CAVALRY_REQUIREMENTS');

insert or replace into ModifierArguments
	(ModifierId,							Name,		Value)
values
	('LIGHTNING_WARFARE_CAVALRY_MOVEMENT',	'Amount',	1),
	('LIGHTNING_WARFARE_CAVALRY_STRENGTH',	'Amount',	5);

insert or replace into ModifierStrings
	(ModifierId,							Context,	Text)
values
	('LIGHTNING_WARFARE_CAVALRY_STRENGTH',	'Preview',	'+{1_Amount} {LOC_LIGHTNING_WARFARE_CAVALRY_STRENGTH_PREVIEW_TEXT}');
-------------------------------------------------------------------------------------------------------------------
-- Military production cards
-- land
-- POLICY_AGOGE, Ancient & classic
-- POLICY_FEUDAL_CONTRACT, + medival, renaissance
-- POLICY_GRANDE_ARMEE,	+ industrial, morden
-- POLICY_MILITARY_FIRST, all
-- naval
-- POLICY_MARITIME_INDUSTRIES, Ancient & classic
-- POLICY_PRESS_GANGS, until industrial
-- POLICY_INTERNATIONAL_WATERS, all

delete from Policies where PolicyType = 'POLICY_MANEUVER';
delete from Policies where PolicyType = 'POLICY_CHIVALRY';

delete from PolicyModifiers where
	PolicyType = 'POLICY_AGOGE' or
	PolicyType = 'POLICY_FEUDAL_CONTRACT' or
	PolicyType = 'POLICY_GRANDE_ARMEE' or
	PolicyType = 'POLICY_MILITARY_FIRST' or
	PolicyType = 'POLICY_MARITIME_INDUSTRIES' or
	PolicyType = 'POLICY_PRESS_GANGS' or
	PolicyType = 'POLICY_INTERNATIONAL_WATERS';

create table 'PolicyUnitProductionValidEras'(
	'PolicyType' TEXT NOT null,
	'EraType' TEXT NOT null,
	'SpeedUpAmount' INTEGER NOT null DEFAULT 0,
	'SpeedUpPerTier' INTEGER NOT null DEFAULT 0,
	PRIMARY KEY('PolicyType', 'EraType'),
	FOREIGN KEY('PolicyType') REFERENCES Policies('PolicyType') ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY('EraType') REFERENCES Eras('EraType') ON DELETE CASCADE ON UPDATE CASCADE);

create table 'PolicyUnitProductionValidClasses'(
	'PolicyType' TEXT NOT null,
	'PromotionClassType' TEXT NOT null,
	'UnitDomain' TEXT,
	PRIMARY KEY('PolicyType', 'PromotionClassType'),
	FOREIGN KEY('PolicyType') REFERENCES Policies('PolicyType') ON DELETE CASCADE ON UPDATE CASCADE,
	FOREIGN KEY('PromotionClassType') REFERENCES UnitPromotionClasses('PromotionClassType') ON DELETE CASCADE ON UPDATE CASCADE);

insert or replace into PolicyUnitProductionValidEras
	(PolicyType,					EraType 			)
values
	('POLICY_AGOGE',				'ERA_ANCIENT' 		),
	('POLICY_AGOGE',				'ERA_CLASSICAL' 	),
	('POLICY_FEUDAL_CONTRACT',		'ERA_ANCIENT' 		),
	('POLICY_FEUDAL_CONTRACT',		'ERA_CLASSICAL' 	),
	('POLICY_FEUDAL_CONTRACT',		'ERA_MEDIEVAL' 		),
	('POLICY_FEUDAL_CONTRACT',		'ERA_RENAISSANCE' 	),
	('POLICY_GRANDE_ARMEE',			'ERA_ANCIENT' 		),
	('POLICY_GRANDE_ARMEE',			'ERA_CLASSICAL' 	),
	('POLICY_GRANDE_ARMEE',			'ERA_MEDIEVAL' 		),
	('POLICY_GRANDE_ARMEE',			'ERA_RENAISSANCE' 	),
	('POLICY_GRANDE_ARMEE',			'ERA_INDUSTRIAL' 	),
	('POLICY_GRANDE_ARMEE',			'ERA_MODERN' 		),
	('POLICY_MILITARY_FIRST',		'ERA_ANCIENT' 		),
	('POLICY_MILITARY_FIRST',		'ERA_CLASSICAL' 	),
	('POLICY_MILITARY_FIRST',		'ERA_MEDIEVAL' 		),
	('POLICY_MILITARY_FIRST',		'ERA_RENAISSANCE' 	),
	('POLICY_MILITARY_FIRST',		'ERA_INDUSTRIAL' 	),
	('POLICY_MILITARY_FIRST',		'ERA_MODERN' 		),
	('POLICY_MILITARY_FIRST',		'ERA_ATOMIC' 		),
	('POLICY_MILITARY_FIRST',		'ERA_INFORMATION' 	),
	('POLICY_MARITIME_INDUSTRIES',	'ERA_ANCIENT' 		),
	('POLICY_MARITIME_INDUSTRIES',	'ERA_CLASSICAL' 	),
	('POLICY_PRESS_GANGS',			'ERA_ANCIENT' 		),
	('POLICY_PRESS_GANGS',			'ERA_CLASSICAL' 	),
	('POLICY_PRESS_GANGS',			'ERA_MEDIEVAL' 		),
	('POLICY_PRESS_GANGS',			'ERA_RENAISSANCE' 	),
	('POLICY_PRESS_GANGS',			'ERA_INDUSTRIAL' 	),
	('POLICY_INTERNATIONAL_WATERS',	'ERA_ANCIENT' 		),
	('POLICY_INTERNATIONAL_WATERS',	'ERA_CLASSICAL' 	),
	('POLICY_INTERNATIONAL_WATERS',	'ERA_MEDIEVAL' 		),
	('POLICY_INTERNATIONAL_WATERS',	'ERA_RENAISSANCE' 	),
	('POLICY_INTERNATIONAL_WATERS',	'ERA_INDUSTRIAL' 	),
	('POLICY_INTERNATIONAL_WATERS',	'ERA_MODERN' 		),
	('POLICY_INTERNATIONAL_WATERS',	'ERA_ATOMIC' 		),
	('POLICY_INTERNATIONAL_WATERS',	'ERA_INFORMATION' 	);

-- Land
update PolicyUnitProductionValidEras set SpeedUpAmount = 30, SpeedUpPerTier = 10 where
	PolicyType = 'POLICY_AGOGE' or PolicyType = 'POLICY_FEUDAL_CONTRACT' or PolicyType = 'POLICY_GRANDE_ARMEE' or PolicyType = 'POLICY_MILITARY_FIRST';

-- Sea
update PolicyUnitProductionValidEras set SpeedUpAmount = 50, SpeedUpPerTier = 10 where
	PolicyType = 'POLICY_MARITIME_INDUSTRIES' or PolicyType = 'POLICY_PRESS_GANGS' or PolicyType = 'POLICY_INTERNATIONAL_WATERS';

insert or replace into PolicyUnitProductionValidClasses	(PolicyType,	PromotionClassType,	UnitDomain)
select a.PolicyType, b.PromotionClassType,	'Land' from Policies a CROSS JOIN UnitPromotionClasses b where (
	a.PolicyType = 'POLICY_AGOGE' or
	a.PolicyType = 'POLICY_FEUDAL_CONTRACT' or
	a.PolicyType = 'POLICY_GRANDE_ARMEE' or
	a.PolicyType = 'POLICY_MILITARY_FIRST' ) and (
	b.PromotionClassType = 'PROMOTION_CLASS_RECON' or
	b.PromotionClassType = 'PROMOTION_CLASS_MELEE' or
	b.PromotionClassType = 'PROMOTION_CLASS_RANGED' or
	b.PromotionClassType = 'PROMOTION_CLASS_SIEGE' or
	b.PromotionClassType = 'PROMOTION_CLASS_ANTI_CAVALRY' or
	b.PromotionClassType = 'PROMOTION_CLASS_LIGHT_CAVALRY' or
	b.PromotionClassType = 'PROMOTION_CLASS_HEAVY_CAVALRY');

insert or replace into PolicyUnitProductionValidClasses (PolicyType,	PromotionClassType,	UnitDomain)
select a.PolicyType, b.PromotionClassType,	'Sea' from Policies a CROSS JOIN UnitPromotionClasses b where (
	a.PolicyType = 'POLICY_MARITIME_INDUSTRIES' or
	a.PolicyType = 'POLICY_PRESS_GANGS' or
	a.PolicyType = 'POLICY_INTERNATIONAL_WATERS' ) and (
	b.PromotionClassType = 'PROMOTION_CLASS_NAVAL_MELEE' or
	b.PromotionClassType = 'PROMOTION_CLASS_NAVAL_RANGED' or
	b.PromotionClassType = 'PROMOTION_CLASS_NAVAL_RAIDER');

insert or replace into PolicyModifiers
	(PolicyType,							ModifierId)
values
	-- ('POLICY_ART_PATRONS',					'ART_PATRONS_THEATER_SPEEDUP'),
	-- ('POLICY_ART_PATRONS',					'ART_PATRONS_COMMERCIAL_SPEEDUP'),
	-- ('POLICY_HISTORICAL_PROGRESS',			'HISTORICAL_PROGRESS_IND_SPEEDUP'),
	-- ('POLICY_HISTORICAL_PROGRESS',			'HISTORICAL_PROGRESS_CMP_SPEEDUP'),
	('POLICY_FORTIFICATIONS',				'BASTIONS_OUTERDEFENSE'),
	('POLICY_FORTIFICATIONS',				'BASTIONS_RANGEDSTRIKE'),
	('POLICY_WEAPONS_MANAGEMENT_SERVICE',	'WEAPONS_MANAGEMENT_SERVICE_ENCAMPMENT_DOUBLE_1'),
	('POLICY_MILITARY_RESEARCH',			'WEAPONS_MANAGEMENT_SERVICE_ENCAMPMENT_DOUBLE_1');

-- insert or replace into Modifiers
-- 	(ModifierId,						ModifierType)
-- values
-- 	('ART_PATRONS_THEATER_SPEEDUP',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'),
-- 	('ART_PATRONS_COMMERCIAL_SPEEDUP',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'),
-- 	('HISTORICAL_PROGRESS_IND_SPEEDUP',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION'),
-- 	('HISTORICAL_PROGRESS_CMP_SPEEDUP',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
insert or replace into Modifiers
	(ModifierId,										ModifierType,												SubjectRequirementSetId)
values
	('WEAPONS_MANAGEMENT_SERVICE_ENCAMPMENT_DOUBLE_1',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',			'DISTRICT_IS_ENCAMPMENT');

insert or replace into ModifierArguments
	(ModifierId,										Name, 				Value)
values
	-- ('ART_PATRONS_THEATER_SPEEDUP',	     				'DistrictType',		'DISTRICT_THEATER'),
	-- ('ART_PATRONS_THEATER_SPEEDUP',	    				'Amount',			30),
	-- ('ART_PATRONS_COMMERCIAL_SPEEDUP',	 				'DistrictType',		'DISTRICT_COMMERCIAL_HUB'),
	-- ('ART_PATRONS_COMMERCIAL_SPEEDUP',	  				'Amount',			30),
	-- ('HISTORICAL_PROGRESS_IND_SPEEDUP',	   				'DistrictType',		'DISTRICT_INDUSTRIAL_ZONE'),
	-- ('HISTORICAL_PROGRESS_IND_SPEEDUP',	  				'Amount',			30),
	-- ('HISTORICAL_PROGRESS_CMP_SPEEDUP',	  				'DistrictType',		'DISTRICT_CAMPUS'),
	-- ('HISTORICAL_PROGRESS_CMP_SPEEDUP',	 				'Amount',			30),
	('WEAPONS_MANAGEMENT_SERVICE_ENCAMPMENT_DOUBLE_1',	'YieldType',		'YIELD_PRODUCTION'),
	('WEAPONS_MANAGEMENT_SERVICE_ENCAMPMENT_DOUBLE_1',	'Amount',			100);
--军事研究政策卡：删除造兵给瓶能力，替代且并入“军器监”政策。
delete from PolicyModifiers where PolicyType = 'POLICY_MILITARY_RESEARCH' and ModifierId = 'HD_MILITARY_RESEARCH_UNIT_TRAIN_GRANT_SCIENCE_XHH';


-- 公共交通 by xhh
delete from PolicyModifiers where PolicyType = 'POLICY_PUBLIC_TRANSPORT';

insert or ignore into Requirements
	(RequirementId,									RequirementType)
values
	('REQUIRES_PLOT_AT_RADIUS_ONE_OF_OWNER',		'REQUIREMENT_PLOT_ADJACENT_TO_OWNER'),
	('REQUIRES_PLOT_AT_RADIUS_THREE_OF_OWNER',		'REQUIREMENT_PLOT_ADJACENT_TO_OWNER');

insert or ignore into RequirementArguments
	(RequirementId,									Name,				Value)
values
	('REQUIRES_PLOT_AT_RADIUS_ONE_OF_OWNER',		'MinDistance',		1),
	('REQUIRES_PLOT_AT_RADIUS_ONE_OF_OWNER',		'MaxDistance',		1),
	('REQUIRES_PLOT_AT_RADIUS_THREE_OF_OWNER',		'MinDistance',		3),
	('REQUIRES_PLOT_AT_RADIUS_THREE_OF_OWNER',		'MaxDistance',		3);

CREATE TEMPORARY TABLE 'HD_DistrictBonus'(
    'DistrictType' TEXT NOT null,
    'YieldType' TEXT NOT null
);

insert or replace into HD_DistrictBonus
	(DistrictType,					YieldType)
values
	('DISTRICT_HOLY_SITE',			'YIELD_FAITH'),
	('DISTRICT_CAMPUS',				'YIELD_SCIENCE'),
	('DISTRICT_HARBOR',				'YIELD_GOLD'),
	('DISTRICT_COMMERCIAL_HUB',		'YIELD_GOLD'),
	('DISTRICT_THEATER',			'YIELD_CULTURE'),
	('DISTRICT_INDUSTRIAL_ZONE',	'YIELD_PRODUCTION'),
	('DISTRICT_ENCAMPMENT',			'YIELD_PRODUCTION');

insert or replace into PolicyModifiers (PolicyType, ModifierId)
	select 'POLICY_PUBLIC_TRANSPORT', 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_ATTACH' from HD_DistrictBonus;
insert or replace into PolicyModifiers (PolicyType, ModifierId)
	select 'POLICY_PUBLIC_TRANSPORT', 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_ATTACH' from HD_DistrictBonus;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_ATTACH', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 'CITY_HAS_15_POPULATION' from HD_DistrictBonus;
insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_ATTACH', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 'CITY_HAS_15_POPULATION' from HD_DistrictBonus;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_ATTACH', 'ModifierId', 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_ATTACH2' from HD_DistrictBonus;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_ATTACH','ModifierId', 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_ATTACH2' from HD_DistrictBonus;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_ATTACH2', 'MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER', 'HD_DISTRICT_IS_CITY_CENTER_OR_NEIGHBORHOOD' from HD_DistrictBonus;
insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_ATTACH2', 'MODIFIER_CITY_DISTRICTS_ATTACH_MODIFIER', 'HD_DISTRICT_IS_CITY_CENTER_OR_NEIGHBORHOOD' from HD_DistrictBonus;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_ATTACH2', 'ModifierId', 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_MODIFIER' from HD_DistrictBonus;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_ATTACH2','ModifierId', 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_MODIFIER' from HD_DistrictBonus;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, SubjectStackLimit)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_MODIFIER', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER', 'HD_DISTRICT_IS_' || DistrictType || '_AT_RADIUS_ONE', 1 from HD_DistrictBonus;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_MODIFIER', 'YieldType', YieldType from HD_DistrictBonus;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_ONE_MODIFIER', 'Amount', 50 from HD_DistrictBonus;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, SubjectStackLimit)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_MODIFIER', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS', 'HD_DISTRICT_IS_' || DistrictType || '_AT_RADIUS_THREE', 1 from HD_DistrictBonus;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_MODIFIER', 'YieldTypeToMirror',	YieldType from HD_DistrictBonus;
insert or replace into ModifierArguments (ModifierId, Name, Value)
	select 'PUBLIC_TRANSPORT_' || DistrictType || '_AT_RADIUS_THREE_MODIFIER', 'YieldTypeToGrant', 'YIELD_GOLD' from HD_DistrictBonus;

insert or ignore into RequirementSets (RequirementSetId, RequirementSetType)
	select 'HD_DISTRICT_IS_' || DistrictType || '_AT_RADIUS_ONE', 'REQUIREMENTSET_TEST_ALL' from HD_DistrictBonus;
insert or ignore into RequirementSetRequirements (RequirementSetId, RequirementId)
	select 'HD_DISTRICT_IS_' || DistrictType || '_AT_RADIUS_ONE', 'REQUIRES_DISTRICT_IS_' || DistrictType from HD_DistrictBonus;
insert or ignore into RequirementSetRequirements (RequirementSetId, RequirementId)
	select 'HD_DISTRICT_IS_' || DistrictType || '_AT_RADIUS_ONE', 'REQUIRES_PLOT_AT_RADIUS_ONE_OF_OWNER' from HD_DistrictBonus;

insert or ignore into RequirementSets (RequirementSetId, RequirementSetType)
	select 'HD_DISTRICT_IS_' || DistrictType || '_AT_RADIUS_THREE', 'REQUIREMENTSET_TEST_ALL' from HD_DistrictBonus;
insert or ignore into RequirementSetRequirements(RequirementSetId, RequirementId)
	select 'HD_DISTRICT_IS_' || DistrictType || '_AT_RADIUS_THREE',	'REQUIRES_DISTRICT_IS_' || DistrictType from HD_DistrictBonus;
insert or ignore into RequirementSetRequirements (RequirementSetId, RequirementId)
	select 'HD_DISTRICT_IS_' || DistrictType || '_AT_RADIUS_THREE', 'REQUIRES_PLOT_AT_RADIUS_THREE_OF_OWNER' from HD_DistrictBonus;

-- 隐修会
-- update ModifierArguments set Value = 50 where ModifierId = 'MONASTICISM_HOLYSITE_SCIENCE' and Name = 'Amount';
-- 敛财大亨
-- update ModifierArguments set Value = 25 where ModifierId = 'ROBBERBARONS_STOCKEXCHANGE_GOLD' and Name = 'Amount';
-- update ModifierArguments set Value = 15 where ModifierId = 'ROBBERBARONS_FACTORY_PRODUCTION' and Name = 'Amount';
update Modifiers set SubjectRequirementSetId = "HD_CITY_HAS_INDUSTRIAL_TIER_3_BUILDING_REQUIREMENTS" where ModifierId = 'ROBBERBARONS_FACTORY_PRODUCTION';
update Modifiers set SubjectRequirementSetId = "HD_CITY_HAS_COMMERCIAL_TIER_3_BUILDING_REQUIREMENTS" where ModifierId = 'ROBBERBARONS_STOCKEXCHANGE_GOLD';
-- 殖民地税收
-- update ModifierArguments set Value = 15 where ModifierId = 'COLONIALTAXES_FOREIGNGOLD' and Name = 'Amount';
-- update ModifierArguments set Value = 5 where ModifierId = 'COLONIALTAXES_FOREIGNPRODUCTION' and Name = 'Amount';
-- 统治
-- update ModifierArguments set Value = 1 where ModifierId = 'RAJ_SCIENCEPERTRIBUTARY' and Name = 'Amount';
-- update ModifierArguments set Value = 1 where ModifierId = 'RAJ_CULTUREPERTRIBUTARY' and Name = 'Amount';

update ModifierArguments set Value = 2 where ModifierId = 'TRIANGULARTRADE_TRADEROUTEFAITH' and Name = 'Amount';
delete from PolicyModifiers where PolicyType = 'POLICY_SPORTS_MEDIA' and ModifierId = 'SPORTSMEDIA_STADIUMENTERTAINMENT';

-- Third Alternative
delete from PolicyModifiers where PolicyType = 'POLICY_THIRD_ALTERNATIVE';
create temporary table HD_ThirdAlternativeBuffedBuildings (
	BuildingType text not null,
	YieldType text not null default 'YIELD_CULTURE',
	Amount int not null default 2,
	ModifierId text,
	primary key (BuildingType, YieldType)
);
insert or replace into HD_ThirdAlternativeBuffedBuildings (BuildingType) select BuildingType from HD_BuildingTiers
	where PrereqDistrict = 'DISTRICT_CAMPUS' and Tier = 4 and ReplacesOther = 0;
insert or replace into HD_ThirdAlternativeBuffedBuildings (BuildingType) select BuildingType from HD_BuildingTiers
	where PrereqDistrict = 'DISTRICT_CAMPUS' and Tier = 3 and not exists (select BuildingType from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_CAMPUS' and Tier = 4) and ReplacesOther = 0;
insert or replace into HD_ThirdAlternativeBuffedBuildings (BuildingType) select BuildingType from HD_BuildingTiers
	where PrereqDistrict = 'DISTRICT_ENCAMPMENT' and Tier = 3 and ReplacesOther = 0;
insert or replace into HD_ThirdAlternativeBuffedBuildings (BuildingType) select BuildingType from HD_BuildingTiers
	where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and Tier = 4 and ReplacesOther = 0;
insert or replace into HD_ThirdAlternativeBuffedBuildings (BuildingType) select BuildingType from HD_BuildingTiers
	where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and Tier = 3 and not exists (select BuildingType from HD_BuildingTiers where PrereqDistrict = 'DISTRICT_INDUSTRIAL_ZONE' and Tier = 4) and ReplacesOther = 0;
insert or replace into HD_ThirdAlternativeBuffedBuildings
	(BuildingType,	YieldType,		Amount)
select
	BuildingType,	'YIELD_GOLD',	4
from HD_ThirdAlternativeBuffedBuildings;
update HD_ThirdAlternativeBuffedBuildings set ModifierId = 'THIRD_ALTERNATIVE_' || BuildingType || '_' || YieldType;
insert or replace into PolicyModifiers
	(PolicyType,					ModifierId)
select
	'POLICY_THIRD_ALTERNATIVE',		ModifierId
from HD_ThirdAlternativeBuffedBuildings;
insert or replace into Modifiers
	(ModifierId,	ModifierType)
select
	ModifierId,		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
from HD_ThirdAlternativeBuffedBuildings;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'BuildingType',	BuildingType
from HD_ThirdAlternativeBuffedBuildings;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'YieldType',	YieldType
from HD_ThirdAlternativeBuffedBuildings;
insert or replace into ModifierArguments
	(ModifierId,	Name,			Value)
select
	ModifierId,		'Amount',		Amount
from HD_ThirdAlternativeBuffedBuildings;