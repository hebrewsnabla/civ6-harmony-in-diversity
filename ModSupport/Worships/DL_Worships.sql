-------------------------------------
--   Support Building Functions    --
-------------------------------------

-- Write the new building functions here.
--Khalwat (Druze)
--建成第一个时获得“保护地球”市政的鼓舞，本城所有未改良地貌为相邻地块加一魅力，本城购买自然学家的花费减50%。

--unlock boost of Conservation
--lua needed(specific civic boost rather than eruka ) 

--+1 appeal to all feature tiles 
insert or replace into BuildingModifiers
	(BuildingType,				ModifierId)
values
	--('BUILDING_JNR_KHALWAT',	'UNLOCK_CONSERVATION_BOOST'),
	('BUILDING_JNR_KHALWAT',	'FORESTRY_MANAGEMENT_FEATURE_NO_IMPROVEMENT_APPEAL'),
	('BUILDING_JNR_KHALWAT',	'NATURALIST_DISCOUNT');

insert or replace into Modifiers
	(ModifierId,					ModifierType,								RunOnce,SubjectRequirementSetId)
values
	('UNLOCK_CONSERVATION_BOOST',	'MODIFIER_PLAYER_GRANT_SPECIFIC_CIVIC_BOOST',		1,NULL),
	('NATURALIST_DISCOUNT',			'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST',	0,NULL);

insert or replace into ModifierArguments
	(ModifierId,						Name,				Value)
values
	('NATURALIST_DISCOUNT',				'UnitType',			'UNIT_NATURALIST'),
	('NATURALIST_DISCOUNT',				'Amount',			50),
	('UNLOCK_CONSERVATION_BOOST',		'CivicType',		'CIVIC_CONSERVATION');

--
