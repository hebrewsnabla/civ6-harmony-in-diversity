-- Basic yield
insert or replace into Building_YieldChanges
	(BuildingType,				YieldType,			YieldChange)
values
	('BUILDING_CATHEDRAL',		'YIELD_FAITH',		8),
	('BUILDING_GURDWARA',		'YIELD_FAITH',		8),
	('BUILDING_GURDWARA',		'YIELD_FOOD',		3),
	('BUILDING_MEETING_HOUSE',	'YIELD_FAITH',		8),
	('BUILDING_MEETING_HOUSE',	'YIELD_PRODUCTION',	3),
	('BUILDING_MOSQUE',			'YIELD_FAITH',		8),
	('BUILDING_PAGODA',			'YIELD_FAITH',		8),
	('BUILDING_PAGODA',			'YIELD_CULTURE',	3),
	('BUILDING_SYNAGOGUE',		'YIELD_FAITH',		12),
	('BUILDING_WAT',			'YIELD_FAITH',		8),
	('BUILDING_WAT',			'YIELD_SCIENCE',	3),
	('BUILDING_STUPA',			'YIELD_FAITH',		8),
	('BUILDING_DAR_E_MEHR',		'YIELD_FAITH',		8);
update Buildings set Housing = 2 where BuildingType = 'BUILDING_GURDWARA';
update Buildings set Entertainment = 2 where BuildingType = 'BUILDING_STUPA';
update Building_YieldsPerEra set YieldChange = 2 where BuildingType = 'BUILDING_DAR_E_MEHR';
update Building_GreatWorks set GreatWorkSlotType = 'GREATWORKSLOT_ART' where BuildingType = 'BUILDING_CATHEDRAL';
-- Modifiers
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_GURDWARA',			'GURDWARA_FOOD_PERCENTAGE_BOOST'),
	('BUILDING_MEETING_HOUSE',		'MEETING_HOUSE_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_WAT',				'WAT_SCIENCE_PERCENTAGE_BOOST'),
	('BUILDING_PAGODA',				'PAGODA_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_SYNAGOGUE',			'SYNAGOGUE_FAITH_PERCENTAGE_BOOST'),
	('BUILDING_STUPA',				'STUPA_AMENTITY_BONUS'),
	('BUILDING_MOSQUE',				'MOSQUE_TRAINED_STRENGTH_MODIFIER'),
	('BUILDING_DAR_E_MEHR',			'DAR_E_MEHR_FREE_MISSIONARY'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_RELIGIOUS_ART_TOURISM_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_SCULPTURE_TOURISM_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_PORTRAIT_TOURISM_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_LANDSCAPE_TOURISM_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_RELIGIOUS_ART_CULTURE_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_SCULPTURE_CULTURE_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_PORTRAIT_CULTURE_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_LANDSCAPE_CULTURE_BONUS');
insert or replace into Modifiers
	(ModifierId,									ModifierType)
values
	('GURDWARA_FOOD_PERCENTAGE_BOOST',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('MEETING_HOUSE_PRODUCTION_PERCENTAGE_BOOST',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('WAT_SCIENCE_PERCENTAGE_BOOST', 				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('PAGODA_CULTURE_PERCENTAGE_BOOST',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('SYNAGOGUE_FAITH_PERCENTAGE_BOOST',			'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('STUPA_AMENTITY_BONUS',						'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_AMENITY_FOR_LUXURY_DIVERSITY'),
	('CATHEDRAL_RELIGIOUS_ART_TOURISM_BONUS',		'MODIFIER_SINGLE_CITY_ADJUST_TOURISM'),
	('CATHEDRAL_SCULPTURE_TOURISM_BONUS',			'MODIFIER_SINGLE_CITY_ADJUST_TOURISM'),
	('CATHEDRAL_PORTRAIT_TOURISM_BONUS',			'MODIFIER_SINGLE_CITY_ADJUST_TOURISM'),
	('CATHEDRAL_LANDSCAPE_TOURISM_BONUS',			'MODIFIER_SINGLE_CITY_ADJUST_TOURISM'),
	('CATHEDRAL_RELIGIOUS_ART_CULTURE_BONUS',		'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD'),
	('CATHEDRAL_SCULPTURE_CULTURE_BONUS',			'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD'),
	('CATHEDRAL_PORTRAIT_CULTURE_BONUS',			'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD'),
	('CATHEDRAL_LANDSCAPE_CULTURE_BONUS',			'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD');
insert or replace into Modifiers
	(ModifierId,									RunOnce,	Permanent,	ModifierType)
values
	('DAR_E_MEHR_FREE_MISSIONARY',					1,			1,			'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY'),
	('MOSQUE_TRAINED_STRENGTH_MODIFIER',			0,			1,			'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS');
insert or replace into ModifierArguments
	(ModifierId,												Name,						Value)
values
	('GURDWARA_FOOD_PERCENTAGE_BOOST',							'YieldType',				'YIELD_FOOD'),
	('GURDWARA_FOOD_PERCENTAGE_BOOST',							'Amount',					10),
	('MEETING_HOUSE_PRODUCTION_PERCENTAGE_BOOST',				'YieldType',				'YIELD_PRODUCTION'),
	('MEETING_HOUSE_PRODUCTION_PERCENTAGE_BOOST',				'Amount',					10),
	('WAT_SCIENCE_PERCENTAGE_BOOST',							'YieldType',				'YIELD_SCIENCE'),
	('WAT_SCIENCE_PERCENTAGE_BOOST',							'Amount',					10),
	('PAGODA_CULTURE_PERCENTAGE_BOOST',							'YieldType',				'YIELD_CULTURE'),
	('PAGODA_CULTURE_PERCENTAGE_BOOST',							'Amount',					10),
	('SYNAGOGUE_FAITH_PERCENTAGE_BOOST',						'YieldType',				'YIELD_FAITH'),
	('SYNAGOGUE_FAITH_PERCENTAGE_BOOST',						'Amount',					10),
	('STUPA_AMENTITY_BONUS',									'Amount',					1),
	('MOSQUE_TRAINED_STRENGTH_MODIFIER',						'AbilityType',				'ABILITY_MOSQUE_TRAINED_UNIT_STRENGTH'),
	('DAR_E_MEHR_FREE_MISSIONARY',								'UnitType',					'UNIT_MISSIONARY'),
	('DAR_E_MEHR_FREE_MISSIONARY',								'Amount',					1),
	('CATHEDRAL_RELIGIOUS_ART_TOURISM_BONUS',					'GreatWorkObjectType',		'GREATWORKOBJECT_RELIGIOUS'),
	('CATHEDRAL_RELIGIOUS_ART_TOURISM_BONUS',					'ScalingFactor',			200),
	('CATHEDRAL_SCULPTURE_TOURISM_BONUS',						'GreatWorkObjectType',		'GREATWORKOBJECT_SCULPTURE'),
	('CATHEDRAL_SCULPTURE_TOURISM_BONUS',						'ScalingFactor',			200),
	('CATHEDRAL_PORTRAIT_TOURISM_BONUS',						'GreatWorkObjectType',		'GREATWORKOBJECT_PORTRAIT'),
	('CATHEDRAL_PORTRAIT_TOURISM_BONUS',						'ScalingFactor',			200),
	('CATHEDRAL_LANDSCAPE_TOURISM_BONUS',						'GreatWorkObjectType',		'GREATWORKOBJECT_LANDSCAPE'),
	('CATHEDRAL_LANDSCAPE_TOURISM_BONUS',						'ScalingFactor',			200),
	('CATHEDRAL_RELIGIOUS_ART_CULTURE_BONUS',					'GreatWorkObjectType',		'GREATWORKOBJECT_RELIGIOUS'),
	('CATHEDRAL_RELIGIOUS_ART_CULTURE_BONUS',					'YieldType',				'YIELD_CULTURE'),
	('CATHEDRAL_RELIGIOUS_ART_CULTURE_BONUS',					'ScalingFactor',			200),
	('CATHEDRAL_SCULPTURE_CULTURE_BONUS',						'GreatWorkObjectType',		'GREATWORKOBJECT_SCULPTURE'),
	('CATHEDRAL_SCULPTURE_CULTURE_BONUS',						'YieldType',				'YIELD_CULTURE'),
	('CATHEDRAL_SCULPTURE_CULTURE_BONUS',						'ScalingFactor',			200),
	('CATHEDRAL_PORTRAIT_CULTURE_BONUS',						'GreatWorkObjectType',		'GREATWORKOBJECT_PORTRAIT'),
	('CATHEDRAL_PORTRAIT_CULTURE_BONUS',						'YieldType',				'YIELD_CULTURE'),
	('CATHEDRAL_PORTRAIT_CULTURE_BONUS',						'ScalingFactor',			200),
	('CATHEDRAL_LANDSCAPE_CULTURE_BONUS',						'GreatWorkObjectType',		'GREATWORKOBJECT_LANDSCAPE'),
	('CATHEDRAL_LANDSCAPE_CULTURE_BONUS',						'YieldType',				'YIELD_CULTURE'),
	('CATHEDRAL_LANDSCAPE_CULTURE_BONUS',						'ScalingFactor',			200);