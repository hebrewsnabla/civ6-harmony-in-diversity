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
--百花齐放每个区域3文化
update ModifierArguments set Value =3 where ModifierId = 'COMMEMORATION_CULTURAL_DISTRICTCULTURE' and Name = 'Amount';

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
	GovernmentType = 'GOVERNMENT_COMMUNISM' and GovernmentSlotType = 'SLOT_WILDCARD';
update Government_SlotCounts set NumSlots = 2 where
	GovernmentType = 'GOVERNMENT_COMMUNISM' and GovernmentSlotType = 'SLOT_MILITARY';
update Government_SlotCounts set NumSlots = 3 where
	GovernmentType = 'GOVERNMENT_FASCISM' and GovernmentSlotType = 'SLOT_MILITARY';
update Government_SlotCounts set NumSlots = 2 where
	GovernmentType = 'GOVERNMENT_FASCISM' and GovernmentSlotType = 'SLOT_ECONOMIC';

update Policies set PrereqCivic = 'CIVIC_DIVINE_RIGHT' where PolicyType = 'POLICY_MEDINA_QUARTER';
update Policies set PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES' where PolicyType = 'POLICY_TRADE_CONFEDERATION';
update Policies set PrereqCivic = 'CIVIC_FEUDALISM' where PolicyType = 'POLICY_CIVIL_PRESTIGE';
update Policies set PrereqCivic = 'CIVIC_MERCENARIES' where PolicyType = 'POLICY_RETAINERS';
update Policies set PrereqCivic = 'CIVIC_CIVIL_SERVICE' where PolicyType = 'POLICY_GOTHIC_ARCHITECTURE';

update Policies set PrereqCivic = 'CIVIC_CLASS_STRUGGLE' where PolicyType = 'POLICY_FIVE_YEAR_PLAN';
update Policies set PrereqCivic = 'CIVIC_SUFFRAGE' where PolicyType = 'POLICY_ECONOMIC_UNION';
update Policies set PrereqCivic = 'CIVIC_TOTALITARIANISM' where PolicyType = 'POLICY_LIGHTNING_WARFARE';

update ModifierArguments set Value = 15 where ModifierId = 'COMMUNISM_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE' and Name = 'Amount';
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'COMMUNISM_PRODUCTIVE_PEOPLE'; 


insert or replace into PolicyModifiers
	(PolicyType,						ModifierId)
values
	('POLICY_CHARISMATIC_LEADER',		'CHARISMATICLEADER_OPENBORDERS'),
	('POLICY_SERFDOM',					'SERFDOM_BUILDERPRODUCTION');

insert or replace into Modifiers
	(ModifierId,						ModifierType)
values
	('CHARISMATICLEADER_OPENBORDERS',	'MODIFIER_ADJUST_OPEN_BORDERS_FROM_INFLUENCE'),
	('SERFDOM_BUILDERPRODUCTION',		'MODIFIER_PLAYER_UNITS_ADJUST_UNIT_PRODUCTION');

insert or replace into ModifierArguments
	(ModifierId,						Name,		Value)
values
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
	(Type,							Kind)
values
	('POLICY_PRIMITIVE_COMMUNE',	'KIND_POLICY'),
	('POLICY_SHAMAN',				'KIND_POLICY'),
	('POLICY_BARD',					'KIND_POLICY'),
	('POLICY_CIVILIZE',				'KIND_POLICY'),
	('POLICY_MINARET',				'KIND_POLICY');
	--('POLICY_FINE_ARTS',			'KIND_POLICY'),
	--('POLICY_FREE_THOUGHTS',		'KIND_POLICY'),
	--('POLICY_TREASURE_FLEETS',		'KIND_POLICY'),
	--('POLICY_WORKERS_FACULTIES',	'KIND_POLICY'),
	--('POLICY_ENTREPRENEURSHIP',		'KIND_POLICY');

insert or replace into Policies
	(PolicyType,					Name,									Description,								PrereqCivic,					GovernmentSlotType)
values
	('POLICY_PRIMITIVE_COMMUNE',	'LOC_POLICY_PRIMITIVE_COMMUNE_NAME',	'LOC_POLICY_PRIMITIVE_COMMUNE_DESCRIPTION',	'CIVIC_CODE_OF_LAWS',			'SLOT_ECONOMIC'),
	('POLICY_SHAMAN',				'LOC_POLICY_SHAMAN_NAME',				'LOC_POLICY_SHAMAN_DESCRIPTION',			'CIVIC_MYSTICISM',				'SLOT_ECONOMIC'),												
	('POLICY_BARD',					'LOC_POLICY_BARD_NAME',					'LOC_POLICY_BARD_DESCRIPTION',				'CIVIC_EARLY_EMPIRE',			'SLOT_DIPLOMATIC'),
	('POLICY_CIVILIZE',				'LOC_POLICY_CIVILIZE_NAME',				'LOC_POLICY_CIVILIZE_DESCRIPTION',			'CIVIC_STATE_WORKFORCE',		'SLOT_DIPLOMATIC'),
	-- 
	('POLICY_MINARET',				'LOC_POLICY_MINARET_NAME',				'LOC_POLICY_MINARET_DESCRIPTION',			'CIVIC_REFORMED_CHURCH',		'SLOT_ECONOMIC');
	--('POLICY_FINE_ARTS',			'LOC_POLICY_FINE_ARTS_NAME',			'LOC_POLICY_FINE_ARTS_DESCRIPTION',			'CIVIC_OPERA_BALLET',		'SLOT_ECONOMIC'),
	--('POLICY_FREE_THOUGHTS',		'LOC_POLICY_FREE_THOUGHTS_NAME',		'LOC_POLICY_FREE_THOUGHTS_DESCRIPTION',		'CIVIC_THE_ENLIGHTENMENT',	'SLOT_ECONOMIC'),
	--('POLICY_TREASURE_FLEETS',		'LOC_POLICY_TREASURE_FLEETS_NAME',		'LOC_POLICY_TREASURE_FLEETS_DESCRIPTION',	'CIVIC_COLONIALISM',		'SLOT_ECONOMIC'),
	--('POLICY_WORKERS_FACULTIES',	'LOC_POLICY_WORKERS_FACULTIES_NAME',	'LOC_POLICY_WORKERS_FACULTIES_DESCRIPTION',	'CIVIC_CIVIL_ENGINEERING',	'SLOT_ECONOMIC'),
	--('POLICY_ENTREPRENEURSHIP',		'LOC_POLICY_ENTREPRENEURSHIP_NAME',		'LOC_POLICY_ENTREPRENEURSHIP_DESCRIPTION',	'CIVIC_MERCANTILISM',		'SLOT_ECONOMIC');

--update ObsoletePolicies set ObsoletePolicy = 'POLICY_FINE_ARTS' where PolicyType = 'POLICY_AESTHETICS';
--update ObsoletePolicies set ObsoletePolicy = 'POLICY_FREE_THOUGHTS' where PolicyType = 'POLICY_NATURAL_PHILOSOPHY';
--update ObsoletePolicies set ObsoletePolicy = 'POLICY_TREASURE_FLEETS' where PolicyType = 'POLICY_NAVAL_INFRASTRUCTURE';
--update ObsoletePolicies set ObsoletePolicy = 'POLICY_WORKERS_FACULTIES' where PolicyType = 'POLICY_CRAFTSMEN';
--update ObsoletePolicies set ObsoletePolicy = 'POLICY_ENTREPRENEURSHIP' where PolicyType = 'POLICY_TOWN_CHARTERS';
insert or replace into ObsoletePolicies
	(PolicyType,					ObsoletePolicy)
values
--	('POLICY_FINE_ARTS',			'POLICY_SPORTS_MEDIA'),
--	('POLICY_FREE_THOUGHTS',		'POLICY_FIVE_YEAR_PLAN'),
--	('POLICY_TREASURE_FLEETS',		'POLICY_ECONOMIC_UNION'),
--	('POLICY_WORKERS_FACULTIES',	'POLICY_FIVE_YEAR_PLAN'),
--	('POLICY_ENTREPRENEURSHIP',		'POLICY_ECONOMIC_UNION');
	('POLICY_SCRIPTURE',			'POLICY_SIMULTANEUM');

delete from ObsoletePolicies where PolicyType = 'POLICY_URBAN_PLANNING';
delete from ObsoletePolicies where PolicyType = 'POLICY_RETAINERS';
delete from Modifiers where ModifierId = 'CARAVANSARIES_TRADEROUTEGOLD';
insert or replace into PolicyModifiers
	(PolicyType,					ModifierId)
values
	('POLICY_PRIMITIVE_COMMUNE',	'PRIMITIVE_COMMUNE_ALLCITYFOOD'),
	('POLICY_SHAMAN',				'SHAMAN_ALLCITYFAITH'),
	('POLICY_BARD',					'BARD_ALLCITYCULTURE'),
	('POLICY_CIVILIZE',				'CIVILIZE_ALLCITYSCIENCE'),
	('POLICY_CARAVANSARIES',		'CARAVANSARIES_ALLCITYGOLD'),
	('POLICY_MINARET',				'MINARET_TEMPLE_POP_FAITH'),
	('POLICY_MINARET',				'MINARET_TIER3_BUILDING_POP_FAITH'),
--	('POLICY_FINE_ARTS',			'FINE_ARTS_DISTRICTCULTURE'),
--	('POLICY_FREE_THOUGHTS',		'FREE_THOUGHTS_DISTRICTSCIENCE'),
--	('POLICY_TREASURE_FLEETS',		'TREASURE_FLEETS_HARBORGOLD'),
--	('POLICY_WORKERS_FACULTIES',	'WORKERS_FACULTIES_DISTRICTPRODUCTION'),
--	('POLICY_ENTREPRENEURSHIP',		'ENTREPRENEURSHIP_DISTRICTGOLD'),
	('POLICY_SIMULTANEUM',			'SIMULTANEUM_DISTRICTFAITH');

insert or replace into Modifiers
	(ModifierId,							ModifierType,												SubjectRequirementSetId)
values
	('MINARET_TEMPLE_POP_FAITH',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_TEMPLE_XP2'),
	('MINARET_TIER3_BUILDING_POP_FAITH',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_POPULATION',	'BUILDING_IS_TIER3_HOLY_SITE'),
	('PRIMITIVE_COMMUNE_ALLCITYFOOD',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
	('SHAMAN_ALLCITYFAITH',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
	('BARD_ALLCITYCULTURE',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
	('CIVILIZE_ALLCITYSCIENCE',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
	('CARAVANSARIES_ALLCITYGOLD',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE',			NULL),
--	('FINE_ARTS_DISTRICTCULTURE',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_THEATER'),
--	('FREE_THOUGHTS_DISTRICTSCIENCE',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_CAMPUS'),
--	('TREASURE_FLEETS_HARBORGOLD',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_HARBOR'),
--	('WORKERS_FACULTIES_DISTRICTPRODUCTION',	'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_INDUSTRIAL_ZONE'),
--	('ENTREPRENEURSHIP_DISTRICTGOLD',			'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_COMMERCIAL_HUB'),
	('SIMULTANEUM_DISTRICTFAITH',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',	'DISTRICT_IS_HOLY_SITE');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
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
	('SIMULTANEUM_DISTRICTFAITH',				'Amount',		100);

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

