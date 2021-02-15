-------------------------------------
--  Worship Buildings Adjustments  --
-------------------------------------

-- 大教堂 BUILDING_CATHEDRAL，2鸽1艺术槽，本城的雕塑和宗教画作+3鸽，且业绩翻倍
-- 谒师所 BUILDING_GURDWARA，2鸽3粮1住房，本城余粮+10%
-- 礼拜堂 BUILDING_MEETING_HOUSE，2鸽3锤，建造区域、建筑、奇观+10%
-- 清真 BUILDING_MOSQUE，2鸽，传教和使徒次数+1。（从本城购买的宗教单位在宗教战争辩论中+3力 暂未实装）
-- 佛塔 BUILDING_PAGODA，2鸽3琴，本城琴+10%
-- 犹太教堂 BUILDING_SYNAGOGUE，5鸽，本城鸽子+10%
-- 佛寺 BUILDING_WAT，2鸽3瓶，本城瓶+10%
-- 窣堵波 BUILDING_STUPA，2鸽2宜居，本城每种开发的奢侈资源1宜居
-- 拜火神庙 BUILDING_DAR_E_MEHR，2鸽，每时代1，完成送一个传教士

-- Implemented By 小小雨10101

insert or replace into Building_YieldChanges
	(BuildingType,				YieldType,			YieldChange)
values
	('BUILDING_CATHEDRAL',		'YIELD_FAITH',		2),
	('BUILDING_GURDWARA',		'YIELD_FAITH',		2),
	('BUILDING_GURDWARA',		'YIELD_FOOD',		3),
	('BUILDING_MEETING_HOUSE',	'YIELD_FAITH',		2),
	('BUILDING_MEETING_HOUSE',	'YIELD_PRODUCTION',	3),
	('BUILDING_MOSQUE',			'YIELD_FAITH',		2),
	('BUILDING_PAGODA',			'YIELD_FAITH',		2),
	('BUILDING_PAGODA',			'YIELD_CULTURE',	3),
	('BUILDING_SYNAGOGUE',		'YIELD_FAITH',		5),
	('BUILDING_WAT',			'YIELD_FAITH',		2),
	('BUILDING_WAT',			'YIELD_SCIENCE',	3),
	('BUILDING_STUPA',			'YIELD_FAITH',		2),
	('BUILDING_DAR_E_MEHR',		'YIELD_FAITH',		2);

update Buildings set Entertainment = 2 where BuildingType = 'BUILDING_STUPA';

insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	-- third tier buildings in holy cites
	('BUILDING_WAT',				'WAT_SCIENCE_PERCENTAGE_BOOST'),
	('BUILDING_PAGODA',				'PAGODA_CULTURE_PERCENTAGE_BOOST'),
	('BUILDING_SYNAGOGUE',			'SYNAGOGUE_FAITH_PERCENTAGE_BOOST'),
	--('BUILDING_MEETING_HOUSE',		'MEETING_HOUSE_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
	--('BUILDING_MEETING_HOUSE',		'MEETING_HOUSE_DISTRICT_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_MEETING_HOUSE',		'MEETING_HOUSE_PRODUCTION_PERCENTAGE_BOOST'),
	('BUILDING_STUPA',				'STUPA_AMENTITY_BONUS'),
	('BUILDING_MOSQUE',				'MOSQUE_TRAINED_STRENGTH_MODIFIER'),
	-- Cathedral
	('BUILDING_CATHEDRAL',			'CATHEDRAL_RELIGIOUS_ART_TOURISM_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_SCULPTURE_TOURISM_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_SCULPTURE_FAITH_BONUS'),
	('BUILDING_CATHEDRAL',			'CATHEDRAL_RELIGIOUS_ART_FAITH_BONUS'),
	-- Gurdwara
	('BUILDING_GURDWARA',			'GURDWARA_GROWTH_RATE'),
	-- Dar_e_mehr
	('BUILDING_DAR_E_MEHR',			'DAR_E_MEHR_FREE_MISSIONARY');

insert or replace into Modifiers
	(ModifierId,												ModifierType)
values
	('WAT_SCIENCE_PERCENTAGE_BOOST', 							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('PAGODA_CULTURE_PERCENTAGE_BOOST',							'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('SYNAGOGUE_FAITH_PERCENTAGE_BOOST',						'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('MEETING_HOUSE_BUILDING_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_BUILDING_PRODUCTION_MODIFIER'),
	('MEETING_HOUSE_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',		'MODIFIER_SINGLE_CITY_ADJUST_DISTRICT_PRODUCTION_MODIFIER'),
	('MEETING_HOUSE_PRODUCTION_PERCENTAGE_BOOST',				'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER'),
	('STUPA_AMENTITY_BONUS',									'MODIFIER_SINGLE_CITY_ADJUST_EXTRA_AMENITY_FOR_LUXURY_DIVERSITY'),
	('CATHEDRAL_RELIGIOUS_ART_TOURISM_BONUS',					'MODIFIER_SINGLE_CITY_ADJUST_TOURISM'),
	('CATHEDRAL_SCULPTURE_TOURISM_BONUS',						'MODIFIER_SINGLE_CITY_ADJUST_TOURISM'),
	('CATHEDRAL_RELIGIOUS_ART_FAITH_BONUS',						'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD'),
	('CATHEDRAL_SCULPTURE_FAITH_BONUS',							'MODIFIER_SINGLE_CITY_ADJUST_GREATWORK_YIELD'),
	('GURDWARA_GROWTH_RATE',									'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH'),
	('DAR_E_MEHR_FREE_MISSIONARY',								'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY');

-- Added by PineApple, MOSQUE extra 3 combat strength for religious units
insert or replace into Modifiers
	(ModifierId,												ModifierType,											Permanent)
values
	('MOSQUE_TRAINED_STRENGTH_MODIFIER',						'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS',	1);

insert or replace into ModifierArguments
	(ModifierId,												Name,						Value)
values
	-- Percentage boost
	('WAT_SCIENCE_PERCENTAGE_BOOST',							'YieldType',				'YIELD_SCIENCE'),
	('WAT_SCIENCE_PERCENTAGE_BOOST',							'Amount',					10),
	('PAGODA_CULTURE_PERCENTAGE_BOOST',							'YieldType',				'YIELD_CULTURE'),
	('PAGODA_CULTURE_PERCENTAGE_BOOST',							'Amount',					10),
	('SYNAGOGUE_FAITH_PERCENTAGE_BOOST',						'YieldType',				'YIELD_FAITH'),
	('SYNAGOGUE_FAITH_PERCENTAGE_BOOST',						'Amount',					10),
	('MEETING_HOUSE_BUILDING_PRODUCTION_PERCENTAGE_BOOST',		'Amount',					10),
	('MEETING_HOUSE_DISTRICT_PRODUCTION_PERCENTAGE_BOOST',		'Amount',					10),
	('MEETING_HOUSE_PRODUCTION_PERCENTAGE_BOOST',				'YieldType',				'YIELD_PRODUCTION'),
	('MEETING_HOUSE_PRODUCTION_PERCENTAGE_BOOST',				'Amount',					10),
	('GURDWARA_GROWTH_RATE',									'Amount',					10),
	-- Stupa
	('STUPA_AMENTITY_BONUS',									'Amount',					1),
	-- Mosque
	('MOSQUE_TRAINED_STRENGTH_MODIFIER',						'AbilityType',				'ABILITY_MOSQUE_TRAINED_UNIT_STRENGTH'),
	-- Cathedral
	('CATHEDRAL_RELIGIOUS_ART_TOURISM_BONUS',					'GreatWorkObjectType',		'GREATWORKOBJECT_RELIGIOUS'),
	('CATHEDRAL_RELIGIOUS_ART_TOURISM_BONUS',					'ScalingFactor',			200),
	('CATHEDRAL_SCULPTURE_TOURISM_BONUS',						'GreatWorkObjectType',		'GREATWORKOBJECT_SCULPTURE'),
	('CATHEDRAL_SCULPTURE_TOURISM_BONUS',						'ScalingFactor',			200),
	('CATHEDRAL_RELIGIOUS_ART_FAITH_BONUS',						'GreatWorkObjectType',		'GREATWORKOBJECT_RELIGIOUS'),
	('CATHEDRAL_RELIGIOUS_ART_FAITH_BONUS',						'YieldType',				'YIELD_FAITH'),
	('CATHEDRAL_RELIGIOUS_ART_FAITH_BONUS',						'YieldChange',				3),
	('CATHEDRAL_SCULPTURE_FAITH_BONUS',							'GreatWorkObjectType',		'GREATWORKOBJECT_SCULPTURE'),
	('CATHEDRAL_SCULPTURE_FAITH_BONUS',							'YieldType',				'YIELD_FAITH'),
	('CATHEDRAL_SCULPTURE_FAITH_BONUS',							'YieldChange',				3),
	-- Dar_e_mehr
	('DAR_E_MEHR_FREE_MISSIONARY',								'UnitType',					'UNIT_MISSIONARY'),
	('DAR_E_MEHR_FREE_MISSIONARY',								'Amount',					1);

insert or replace into GreatWork_ValidSubTypes
	(GreatWorkSlotType,					GreatWorkObjectType)
values
	('GREATWORKSLOT_CATHEDRAL',			'GREATWORKOBJECT_SCULPTURE');
