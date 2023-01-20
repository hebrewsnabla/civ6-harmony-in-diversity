--朱棣
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_YONGLE';
insert or replace into Modifiers
	(ModifierId,								ModifierType)
values
	('JUDY_TRADE_ENVOY',						'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN'),
	('JUDY_TRADE_GOLD_INTERNATIONAL',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_INTERNATIONAL'),
	('JUDY_TRADE_GOLD_DOMESTIC',				'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_FOR_DOMESTIC'),
	('JUDY_TRADE_ADD',							'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('JUDY_TRADE_ENVOY',						'Amount',		1),
	('JUDY_TRADE_GOLD_INTERNATIONAL',			'Amount',		2),
	('JUDY_TRADE_GOLD_INTERNATIONAL',			'YieldType',	'YIELD_GOLD'),
	('JUDY_TRADE_GOLD_DOMESTIC',				'Amount',		2),
	('JUDY_TRADE_GOLD_DOMESTIC',				'YieldType',	'YIELD_GOLD'),
	('JUDY_TRADE_ADD',							'Amount',		1);

--武则天
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_WU_ZETIAN';
insert or replace into TraitModifiers
	(TraitType,						ModifierId)
values
	('TRAIT_LEADER_WU_ZETIAN',		'WU_ZETIAN_GREAT_PERSON'),
	('TRAIT_LEADER_WU_ZETIAN',		'WU_ZETIAN_GREAT_PERSON_LATE');
insert or replace into Modifiers
	(ModifierId,								ModifierType,													SubjectRequirementSetId)
values
	('WU_ZETIAN_GREAT_PERSON',					'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT_BONUS',		'CITY_HAS_BUILDING_PALACE_REQUIREMENTS'),
	('WU_ZETIAN_GREAT_PERSON_LATE',				'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT_BONUS',		'WU_ZETIAN_GREAT_PERSON_LATE_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('WU_ZETIAN_GREAT_PERSON',					'Amount',		50),
	('WU_ZETIAN_GREAT_PERSON_LATE',				'Amount',		50);
insert or ignore into RequirementSets
	(RequirementSetId,										RequirementSetType)
values
	('WU_ZETIAN_GREAT_PERSON_LATE_REQUIREMENTS',			'REQUIREMENTSET_TEST_ALL');
insert or ignore into RequirementSetRequirements
	(RequirementSetId,										RequirementId)
values
	('WU_ZETIAN_GREAT_PERSON_LATE_REQUIREMENTS',			'REQUIRES_CITY_HAS_BUILDING_PALACE'),
	('WU_ZETIAN_GREAT_PERSON_LATE_REQUIREMENTS',			'REQUIRES_PLAYER_HAS_CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD');
insert or replace into Modifiers
	(ModifierId,								ModifierType,										SubjectRequirementSetId)
select
	'WU_ZETIAN_' || GreatPersonClassType,		'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',	'DISTRICT_IS_' || DistrictType || '_REQUIREMENTS'
from GreatPersonClasses;
insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
select
	'WU_ZETIAN_' || GreatPersonClassType,			'Amount',		2
from GreatPersonClasses;
insert or replace into ModifierArguments
	(ModifierId,									Name,			Value)
values	
	('WU_ZETIAN_GREAT_PERSON_CLASS_GENERAL',		'YieldType',	'YIELD_PRODUCTION'),
	('WU_ZETIAN_GREAT_PERSON_CLASS_ADMIRAL',		'YieldType',	'YIELD_FOOD'),
	('WU_ZETIAN_GREAT_PERSON_CLASS_ENGINEER',		'YieldType',	'YIELD_PRODUCTION'),
	('WU_ZETIAN_GREAT_PERSON_CLASS_MERCHANT',		'YieldType',	'YIELD_GOLD'),
	('WU_ZETIAN_GREAT_PERSON_CLASS_PROPHET',		'YieldType',	'YIELD_FAITH'),
	('WU_ZETIAN_GREAT_PERSON_CLASS_SCIENTIST',		'YieldType',	'YIELD_SCIENCE'),
	('WU_ZETIAN_GREAT_PERSON_CLASS_WRITER',			'YieldType',	'YIELD_CULTURE'),
	('WU_ZETIAN_GREAT_PERSON_CLASS_ARTIST',			'YieldType',	'YIELD_CULTURE'),
	('WU_ZETIAN_GREAT_PERSON_CLASS_MUSICIAN',		'YieldType',	'YIELD_CULTURE');