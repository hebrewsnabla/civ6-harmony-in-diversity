-------------------------------------
--   Support Building Functions    --
-------------------------------------

-- Write the new building functions here.
insert or replace into BuildingModifiers
	(BuildingType					,ModifierId)
values
	-- ('BUILDING_JNR_MBARI',			'Mbari_Gold'),
	-- ('BUILDING_JNR_MBARI',			'Mbari_GoldPercent'),
	('BUILDING_JNR_MBARI',			'MBARI_TRADEROUTE');
insert or replace into Modifiers
	(ModifierId,					ModifierType)
values
	-- ('Mbari_Gold',					'MODIFIER_BUILDING_YIELD_CHANGE'),
	-- ('Mbari_GoldPercent',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('MBARI_TRADEROUTE',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY');
insert or replace into ModifierArguments
	(ModifierId,					Name,				Value)
values
	-- ('Mbari_Gold',					'YieldType',		'YIELD_GOLD'),
	-- ('Mbari_Gold',					'Amount',			6),
	-- ('Mbari_Gold',					'BuildingType',		'BUILDING_JNR_MBARI'),
	-- ('Mbari_GoldPercent',			'YieldType',		'YIELD_GOLD'),
	-- ('Mbari_GoldPercent',			'Amount',			10),
	('MBARI_TRADEROUTE',			'Amount',			1);
--Khalwat (Druze)
--建成第一个时获得“保护地球”市政的鼓舞，本城所有地块加一魅力，本城购买自然学家的花费减50%。

--unlock boost of Conservation
--lua needed(specific civic boost rather than eruka ) 
--+1 appeal to all tiles 
insert or replace into BuildingModifiers
	(BuildingType,				ModifierId)
values
	--('BUILDING_JNR_KHALWAT',	'UNLOCK_CONSERVATION_BOOST'),
	('BUILDING_JNR_KHALWAT',	'KHALWA_SINGLE_CITY_APPEAL_BONUS'),
	('BUILDING_JNR_KHALWAT',	'NATURALIST_DISCOUNT');

insert or replace into Modifiers
	(ModifierId,						ModifierType,								RunOnce,SubjectRequirementSetId)
values
	('KHALWA_SINGLE_CITY_APPEAL_BONUS',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL',			0,NULL),
	('UNLOCK_CONSERVATION_BOOST',		'MODIFIER_PLAYER_GRANT_SPECIFIC_CIVIC_BOOST',		1,NULL),
	('NATURALIST_DISCOUNT',				'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',	0,NULL);

insert or replace into ModifierArguments
	(ModifierId,						Name,				Value)
values
	('KHALWA_SINGLE_CITY_APPEAL_BONUS',	'Amount',			1),
	('NATURALIST_DISCOUNT',				'UnitType',			'UNIT_NATURALIST'),
	('NATURALIST_DISCOUNT',				'Amount',			50),
	('UNLOCK_CONSERVATION_BOOST',		'CivicType',		'CIVIC_CONSERVATION');

-- 塔祠，神道教神社和羽蛇神庙
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
-- 塔祠
	('BUILDING_JNR_CANDI',					'CANDI_CULTURE'),
	('BUILDING_JNR_CANDI',					'CANDI_FAITH'),
	-- ('BUILDING_JNR_CANDI',					'CANDI_APPEAL'),

-- 神道教神社
	--('BUILDING_JNR_JINJA',					'JNR_JINJA_COMBAT_STRENGTH'),
	--('BUILDING_JNR_JINJA',					'JNR_JINJA_GRANT_FAITH'),
	('BUILDING_JNR_JINJA',					'JNR_JINJA_FOREST_FOOD'),
	('BUILDING_JNR_JINJA',					'JNR_JINJA_JUNGLE_SCIENCE'),
	('BUILDING_JNR_JINJA',					'JNR_JINJA_MARSH_CULTURE'),
-- 羽蛇神庙
	--('BUILDING_JNR_TZACUALLI',				'JNR_TZACUALLI_CIVIC_BOOST'),
	--('BUILDING_JNR_TZACUALLI',				'JNR_TZACUALLI_TECHNOLOGY_BOOST')
	('BUILDING_JNR_TZACUALLI',				'JNR_TZACUALLI_CIVIC_BOOST_MDF'),
	('BUILDING_JNR_TZACUALLI',				'JNR_TZACUALLI_TECHNOLOGY_BOOST_MDF');
insert or replace into Modifiers
	(ModifierId,							ModifierType,										SubjectRequirementSetId,		SubjectStackLimit)
values
-- 塔祠
	('CANDI_CULTURE',						'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_IS_LAND_ADJACENT_TO_COAST',	Null),
	('CANDI_FAITH',							'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_IS_LAND_ADJACENT_TO_COAST',	Null),
	-- ('CANDI_APPEAL',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL',			'PLOT_IS_ADJACENT_TO_COAST',	Null),

-- 神道教神社
	--('JNR_JINJA_COMBAT_STRENGTH',			'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH',		'UNIT_IS_LAND_COMBAT',			5),
	--('JNR_JINJA_GRANT_FAITH',				'MODIFIER_SINGLE_CITY_GRANT_YIELD_PER_UNIT_COST',	Null,							Null),
	('JNR_JINJA_FOREST_FOOD',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_FOREST_REQUIREMENT',	NULL),
	('JNR_JINJA_JUNGLE_SCIENCE',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_JUNGLE_REQUIREMENTS',	NULL),
	('JNR_JINJA_MARSH_CULTURE',				'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',		'PLOT_HAS_MARSH_REQUIREMENTS',	NULL),
-- 羽蛇神庙
	--('JNR_TZACUALLI_CIVIC_BOOST',			'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',				Null,							Null),
	('JNR_TZACUALLI_CIVIC_BOOST_MDF',		'MODIFIER_PLAYER_ADJUST_CIVIC_BOOST',				Null,							10),
	--('JNR_TZACUALLI_TECHNOLOGY_BOOST',		'MODIFIER_ALL_PLAYERS_ATTACH_MODIFIER',				Null,							Null),
	('JNR_TZACUALLI_TECHNOLOGY_BOOST_MDF',	'MODIFIER_PLAYER_ADJUST_TECHNOLOGY_BOOST',			Null,							10);

insert or replace into ModifierArguments
	(ModifierId,							Name,												Value)
values
-- 塔祠
	('CANDI_CULTURE',						'YieldType',										'YIELD_CULTURE'),
	('CANDI_CULTURE',						'Amount',											2),
	('CANDI_FAITH',							'YieldType',										'YIELD_FAITH'),
	('CANDI_FAITH',							'Amount',											2),
	-- ('CANDI_APPEAL',						'Amount',											2),
-- 神道教神社
	--('JNR_JINJA_COMBAT_STRENGTH',			'Amount',											2),
	--('JNR_JINJA_GRANT_FAITH',				'YieldType',										'YIELD_FAITH'),
	--('JNR_JINJA_GRANT_FAITH',				'UnitProductionPercent',							30),
	('JNR_JINJA_FOREST_FOOD',				'YieldType',										'YIELD_FOOD'),
	('JNR_JINJA_FOREST_FOOD',				'Amount',											2),
	('JNR_JINJA_JUNGLE_SCIENCE',			'YieldType',										'YIELD_SCIENCE'),
	('JNR_JINJA_JUNGLE_SCIENCE',			'Amount',											2),
	('JNR_JINJA_MARSH_CULTURE',				'YieldType',										'YIELD_CULTURE'),
	('JNR_JINJA_MARSH_CULTURE',				'Amount',											2),
-- 羽蛇神庙
	--('JNR_TZACUALLI_CIVIC_BOOST',			'ModifierId',										'JNR_TZACUALLI_CIVIC_BOOST_MDF'),
	('JNR_TZACUALLI_CIVIC_BOOST_MDF',		'Amount',											1),
	--('JNR_TZACUALLI_TECHNOLOGY_BOOST',		'ModifierId',										'JNR_TZACUALLI_TECHNOLOGY_BOOST_MDF'),
	('JNR_TZACUALLI_TECHNOLOGY_BOOST_MDF',	'Amount',											1);

-- insert or replace into ModifierStrings
-- 	(ModifierId,					Context,		Text)
-- values
-- 	('JNR_JINJA_COMBAT_STRENGTH',	'Preview',		'LOC_JINJA_COMBAT_STRENGTH_DESCRIPTION');

--Mandir
insert or replace into BuildingModifiers
	(BuildingType,				ModifierId)
values
	('BUILDING_JNR_MANDIR',		'MANDIR_SPECIAL_DISTRICT_FOOD');
	-- ('BUILDING_JNR_MANDIR',		'MANDIR_SPECIAL_DISTRICT_FAITH');

insert or replace into Modifiers
	(ModifierId,							ModifierType,											SubjectRequirementSetId)
values
	('MANDIR_SPECIAL_DISTRICT_FOOD',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',	'DISTRICT_IS_SPECIALITY_DISTRICT'),
	('MANDIR_SPECIAL_DISTRICT_FAITH',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_YIELD_CHANGE',	'DISTRICT_IS_SPECIALITY_DISTRICT');

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('MANDIR_SPECIAL_DISTRICT_FOOD',	'YieldType',		'YIELD_FOOD'),	
	('MANDIR_SPECIAL_DISTRICT_FOOD',	'Amount',			3),
	('MANDIR_SPECIAL_DISTRICT_FAITH',	'YieldType',		'YIELD_FAITH'),
	('MANDIR_SPECIAL_DISTRICT_FAITH',	'Amount',			1);

-- Peripteros
insert or replace into BuildingModifiers
	(BuildingType,				ModifierId)
values
	('BUILDING_JNR_PERIPTEROS',		'CIVIC_AWARD_ONE_INFLUENCE_TOKEN');
-- 	('BUILDING_JNR_PERIPTEROS',		'CIVIC_AWARD_ONE_INFLUENCE_TOKEN'),
-- 	('BUILDING_JNR_PERIPTEROS',		'PERIPTEROS_ADJUST_SINGLE_CITY_CULTURE_PERCENTAGE_PER_SUZEREN'),
-- 	('BUILDING_JNR_PERIPTEROS',		'PERIPTEROS_ADJUST_SINGLE_CITY_FAITH_PERCENTAGE_PER_SUZEREN');

-- insert or replace into Modifiers
-- 	(ModifierId,												ModifierType,							SubjectRequirementSetId)
-- values
-- 	('PERIPTEROS_ADJUST_SINGLE_CITY_CULTURE_PERCENTAGE_PER_SUZEREN','MODIFIER_SINGLE_CITY_ADJUST_YIELD_MODIFIER_PER_TRIBUTARY',NULL),
-- 	('PERIPTEROS_ADJUST_SINGLE_CITY_FAITH_PERCENTAGE_PER_SUZEREN',	'MODIFIER_SINGLE_CITY_ADJUST_YIELD_MODIFIER_PER_TRIBUTARY',NULL);

-- insert or replace into ModifierArguments
-- 	(ModifierId,												Name,			Value)
-- values
-- 	('PERIPTEROS_ADJUST_SINGLE_CITY_CULTURE_PERCENTAGE_PER_SUZEREN','YieldType',	'YIELD_CULTURE'),
-- 	('PERIPTEROS_ADJUST_SINGLE_CITY_CULTURE_PERCENTAGE_PER_SUZEREN','Amount',		2),
-- 	('PERIPTEROS_ADJUST_SINGLE_CITY_FAITH_PERCENTAGE_PER_SUZEREN',	'YieldType',	'YIELD_FAITH'),
-- 	('PERIPTEROS_ADJUST_SINGLE_CITY_FAITH_PERCENTAGE_PER_SUZEREN',	'Amount',		2);

--
-- (by 念诗)
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_GREATADMIRALPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_GREATENGINEERPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_GREATGENERALPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_GREATMERCHANTPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_GREATPROPHETPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_GREATSCIENTISTPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_GREATWRITERPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_GREATMUSICIANPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_GREATARTISTPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_ADDGREATADMIRALPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_ADDGREATENGINEERPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_ADDGREATGENERALPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_ADDGREATMERCHANTPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_ADDGREATPROPHETPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_ADDGREATSCIENTISTPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_ADDGREATWRITERPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_ADDGREATMUSICIANPOINTS'),
	('BUILDING_JNR_DAOGUAN',		'DAOGUAN_ADDGREATARTISTPOINTS');

insert or replace into Modifiers
	(ModifierId,						ModifierType,													SubjectRequirementSetId)	
values
	('DAOGUAN_GREATADMIRALPOINTS',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',	'DISTRICT_IS_HARBOR'),
	('DAOGUAN_GREATENGINEERPOINTS',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',	'DISTRICT_IS_INDUSTRIAL_ZONE'),
	('DAOGUAN_GREATGENERALPOINTS',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',	'DISTRICT_IS_ENCAMPMENT'),
	('DAOGUAN_GREATMERCHANTPOINTS',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',	'DISTRICT_IS_COMMERCIAL_HUB'),
	('DAOGUAN_GREATPROPHETPOINTS',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',	'DISTRICT_IS_HOLY_SITE'),
	('DAOGUAN_GREATSCIENTISTPOINTS',	'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',	'DISTRICT_IS_CAMPUS'),
	('DAOGUAN_GREATWRITERPOINTS',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',	'DISTRICT_IS_THEATER'),
	('DAOGUAN_GREATMUSICIANPOINTS',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',	'DISTRICT_IS_THEATER'),
	('DAOGUAN_GREATARTISTPOINTS',		'MODIFIER_SINGLE_CITY_DISTRICTS_ADJUST_GREAT_PERSON_POINTS',	'DISTRICT_IS_THEATER'),
	('DAOGUAN_ADDGREATADMIRALPOINTS',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',					'BUILDING_IS_LIGHTHOUSE'),
	('DAOGUAN_ADDGREATENGINEERPOINTS',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',					'BUILDING_IS_WORKSHOP'),
	('DAOGUAN_ADDGREATGENERALPOINTS',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',					'BUILDING_IS_BARRACKS_STABLE_MILITARITIC_CITY_STATE'),
	('DAOGUAN_ADDGREATMERCHANTPOINTS',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',					'BUILDING_IS_MARKET'),
	('DAOGUAN_ADDGREATPROPHETPOINTS',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',					'BUILDING_IS_SHRINE'),
	('DAOGUAN_ADDGREATSCIENTISTPOINTS',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',					'BUILDING_IS_LIBRARY'),
	('DAOGUAN_ADDGREATWRITERPOINTS',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',					'BUILDING_IS_AMPHITHEATER'),
	('DAOGUAN_ADDGREATMUSICIANPOINTS',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',					'BUILDING_IS_AMPHITHEATER'),
	('DAOGUAN_ADDGREATARTISTPOINTS',	'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS',					'BUILDING_IS_AMPHITHEATER');

insert or replace into ModifierArguments
	(ModifierId,							name,															value)
values
	('DAOGUAN_GREATADMIRALPOINTS',			'GreatPersonClassType',											'GREAT_PERSON_CLASS_ADMIRAL'),
	('DAOGUAN_GREATADMIRALPOINTS',			'Amount',														2),
	('DAOGUAN_GREATENGINEERPOINTS',			'GreatPersonClassType',											'GREAT_PERSON_CLASS_ENGINEER'),
	('DAOGUAN_GREATENGINEERPOINTS',			'Amount',														2),
	('DAOGUAN_GREATGENERALPOINTS',			'GreatPersonClassType',											'GREAT_PERSON_CLASS_GENERAL'),
	('DAOGUAN_GREATGENERALPOINTS',			'Amount',														2),
	('DAOGUAN_GREATMERCHANTPOINTS',			'GreatPersonClassType',											'GREAT_PERSON_CLASS_MERCHANT'),
	('DAOGUAN_GREATMERCHANTPOINTS',			'Amount',														2),
	('DAOGUAN_GREATPROPHETPOINTS',			'GreatPersonClassType',											'GREAT_PERSON_CLASS_PROPHET'),
	('DAOGUAN_GREATPROPHETPOINTS',			'Amount',														2),
	('DAOGUAN_GREATSCIENTISTPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_SCIENTIST'),
	('DAOGUAN_GREATSCIENTISTPOINTS',		'Amount',														2),
	('DAOGUAN_GREATWRITERPOINTS',			'GreatPersonClassType',											'GREAT_PERSON_CLASS_WRITER'),
	('DAOGUAN_GREATWRITERPOINTS',			'Amount',														2),
	('DAOGUAN_GREATMUSICIANPOINTS',			'GreatPersonClassType',											'GREAT_PERSON_CLASS_MUSICIAN'),
	('DAOGUAN_GREATMUSICIANPOINTS',			'Amount',														2),
	('DAOGUAN_GREATARTISTPOINTS',			'GreatPersonClassType',											'GREAT_PERSON_CLASS_ARTIST'),
	('DAOGUAN_GREATARTISTPOINTS',			'Amount',														2),
	('DAOGUAN_ADDGREATADMIRALPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_ADMIRAL'),
	('DAOGUAN_ADDGREATADMIRALPOINTS',		'Amount',														2),
	('DAOGUAN_ADDGREATENGINEERPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_ENGINEER'),
	('DAOGUAN_ADDGREATENGINEERPOINTS',		'Amount',														2),
	('DAOGUAN_ADDGREATGENERALPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_GENERAL'),
	('DAOGUAN_ADDGREATGENERALPOINTS',		'Amount',														2),
	('DAOGUAN_ADDGREATMERCHANTPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_MERCHANT'),
	('DAOGUAN_ADDGREATMERCHANTPOINTS',		'Amount',														2),
	('DAOGUAN_ADDGREATPROPHETPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_PROPHET'),
	('DAOGUAN_ADDGREATPROPHETPOINTS',		'Amount',														2),
	('DAOGUAN_ADDGREATSCIENTISTPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_SCIENTIST'),
	('DAOGUAN_ADDGREATSCIENTISTPOINTS',		'Amount',														2),
	('DAOGUAN_ADDGREATWRITERPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_WRITER'),
	('DAOGUAN_ADDGREATWRITERPOINTS',		'Amount',														2),
	('DAOGUAN_ADDGREATMUSICIANPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_MUSICIAN'),
	('DAOGUAN_GREATMUSICIANPOINTS',			'Amount',														2),
	('DAOGUAN_ADDGREATARTISTPOINTS',		'GreatPersonClassType',											'GREAT_PERSON_CLASS_ARTIST'),
	('DAOGUAN_ADDGREATARTISTPOINTS',		'Amount',														2);

-- BUILDING_JNR_SOBOR
insert or replace into Building_GreatWorks
	(BuildingType,			GreatWorkSlotType,		NumSlots)
values
	('BUILDING_JNR_SOBOR',	'GREATWORKSLOT_RELIC',	1);

insert or replace into BuildingModifiers
	(BuildingType,				ModifierId)
values
	('BUILDING_JNR_SOBOR',		'SOBOR_RELIC_FAITH'),
	('BUILDING_JNR_SOBOR',		'SOBOR_RELIC_TOURISM');

insert or replace into Modifiers
	(ModifierId,				ModifierType)	
values
	('SOBOR_RELIC_FAITH',		'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD'),
	('SOBOR_RELIC_TOURISM',		'MODIFIER_SINGLE_CITY_ADJUST_TOURISM');

insert or replace into ModifierArguments
	(ModifierId,				name,					value)
values
	('SOBOR_RELIC_FAITH',		'GreatWorkObjectType',	'GREATWORKOBJECT_RELIC'),
	('SOBOR_RELIC_FAITH',		'YieldType',			'YIELD_FAITH'),
	('SOBOR_RELIC_FAITH',		'ScalingFactor',		200),
	('SOBOR_RELIC_TOURISM',		'GreatWorkObjectType',	'GREATWORKOBJECT_RELIC'),
	('SOBOR_RELIC_TOURISM',		'ScalingFactor',		200);
