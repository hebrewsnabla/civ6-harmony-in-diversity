-------------------------------------
--     Wild Testing Adjustments    --
-------------------------------------

-------------------------------------
--耶稣会√
update ModifierArguments set Value = 0.2 where ModifierId = 'JESUIT_EDUCATION_POPULATION_SCIENCE_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 0.3 where ModifierId = 'JESUIT_EDUCATION_SHRINE_POPULATION_SCIENCE_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 0.5 where ModifierId = 'JESUIT_EDUCATION_TEMPLE_POPULATION_SCIENCE_MODIFIER' and Name = 'Amount';

-------------------------------------
--弥赛亚
update ModifierArguments set Value = 20 where ModifierId = 'MESSIAH_SHRINE_PURCHASE_DISCOUNT_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 20 where ModifierId = 'MESSIAH_TEMPLE_PURCHASE_DISCOUNT_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 20 where ModifierId = 'MESSIAH_SHRINE_FAITH_PERCENTAGE_BOOST_MODIFIER' and Name = 'Amount';
delete from BeliefModifiers where ModifierId = 'MESSIAH_HOLYSITE_BUILDING_PRODUCTION';
update ModifierArguments set Value = 8 where ModifierId = 'MESSIAH_SHRINE_FAITH_PERCENTAGE_BOOST_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 8 where ModifierId = 'MESSIAH_TEMPLE_FAITH_PERCENTAGE_BOOST_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 8 where ModifierId = 'MESSIAH_RELIGIOUS_FAITH_PERCENTAGE_BOOST_MODIFIER' and Name = 'Amount';
insert or replace into ModifierArguments	(ModifierId,	Name,	Value)
select 'MESSIAH_PURCHASE_DISCOUNT_' || BuildingType || '_MODIFIER',	'Amount',	20 from Buildings 
where PrereqDistrict = 'DISTRICT_HOLY_SITE' and PurchaseYield = 'YIELD_FAITH';

-------------------------------------
--禅修
update ModifierArguments set Value = 1 where ModifierId = 'ZEN_MEDITATION_CITY_CENTER_RIVER_HOUSING_MODIFIER' and Name = 'Amount';
update ModifierArguments set Value = 1 where ModifierId = 'ZEN_MEDITATION_HOLY_SITE_RIVER_HOUSING_MODIFIER' and Name = 'Amount';
insert or replace into BeliefModifiers
	(BeliefType,						ModifierID)
values
	('BELIEF_ZEN_MEDITATION',			'ZEN_MEDITATION_CITY_CENTER_RIVER_CULTURE'),
	('BELIEF_ZEN_MEDITATION',			'ZEN_MEDITATION_HOLY_SITE_RIVER_CULTURE');
insert or replace into Modifiers
	(ModifierId,												ModifierType,											SubjectRequirementSetId)
values
	('ZEN_MEDITATION_CITY_CENTER_RIVER_CULTURE',				'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',					'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('ZEN_MEDITATION_CITY_CENTER_RIVER_CULTURE_MODIFIER',		'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',		'CITYCENTER_ADJACENT_TO_RIVER_REQUIREMENTS'),
    ('ZEN_MEDITATION_HOLY_SITE_RIVER_CULTURE',				    'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',					'CITY_FOLLOWS_RELIGION_REQUIREMENTS'),
	('ZEN_MEDITATION_HOLY_SITE_RIVER_CULTURE_MODIFIER',		    'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',		'CITYCENTER_ADJACENT_TO_RIVER_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,												Name,						Value)
values
    ('ZEN_MEDITATION_CITY_CENTER_RIVER_CULTURE',				'ModifierId',	'ZEN_MEDITATION_CITY_CENTER_RIVER_CULTURE_MODIFIER'),
    ('ZEN_MEDITATION_CITY_CENTER_RIVER_CULTURE_MODIFIER',		'YieldType',	'YEILD_CULTURE'),
	('ZEN_MEDITATION_CITY_CENTER_RIVER_CULTURE_MODIFIER',		'Amount',		2),
    ('ZEN_MEDITATION_HOLY_SITE_RIVER_CULTURE',				    'ModifierId',	'ZEN_MEDITATION_CITY_CENTER_RIVER_CULTURE_MODIFIER'),
    ('ZEN_MEDITATION_HOLY_SITE_RIVER_CULTURE_MODIFIER',		    'YieldType',	'YEILD_CULTURE'),
	('ZEN_MEDITATION_HOLY_SITE_RIVER_CULTURE_MODIFIER',		    'Amount',		2);

-------------------------------------
--朝圣
update ModifierArguments set Value = 6 where ModifierId = 'PILGRIMAGE_FAITH_CITY_MODIFIER' and Name = 'Amount';

-------------------------------------
--宗教统一
update ModifierArguments set Value = 1 where ModifierId = 'RELIGIOUS_UNITY_FAITH_FOLLOWER_MODIFIER' and Name = 'PerXItems';
update ModifierArguments set Value = 1 where ModifierId = 'RELIGIOUS_UNITY_FAITH_FOLLOWER_MODIFIER' and Name = 'Amount';

-------------------------------------
--什一税
update ModifierArguments set Value = 1 where ModifierId = 'TITHE_GOLD_FOLLOWER_MODIFIER' and Name = 'PerXItems';
update ModifierArguments set Value = 2 where ModifierId = 'TITHE_GOLD_FOLLOWER_MODIFIER' and Name = 'Amount';

-------------------------------------
--犹太
update Building_YieldChanges set YieldChange = 8 where BuildingType = 'BUILDING_SYNAGOGUE';
update ModifierArguments set Value = 15 where ModifierId = 'SYNAGOGUE_FAITH_PERCENTAGE_BOOST' and Name = 'Amount';

-------------------------------------
--少林寺（拜火）
insert or replace into BuildingModifiers
	(BuildingType,						ModifierID)
values
	('BUILDING_DAR_E_MEHR',			    'DAR_E_MEHR_GRANTMONKS');
insert or replace into Modifiers
	(ModifierId,							RunOnce,	Permanent,	ModifierType)
values
	('DAR_E_MEHR_GRANTMONKS',				1,	        1,	        'MODIFIER_SINGLE_CITY_GRANT_UNIT_IN_CITY');
insert or replace into ModifierArguments
	(ModifierId,					Name,						Value)
values
    ('DAR_E_MEHR_GRANTMONKS',		'UnitType',	    			'UNIT_WARRIOR_MONK'),
	('DAR_E_MEHR_GRANTMONKS',		'AllowUniqueOverride',		1),
	('DAR_E_MEHR_GRANTMONKS',		'Amount',					1);

-------------------------------------
--自由探索
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_SCIENTIFIC' and ModifierId = 'COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB';

insert or replace into CommemorationModifiers
	(CommemorationType,					ModifierId)
values
	('COMMEMORATION_SCIENTIFIC',	    'COMMEMORATION_SCIENTIFIC_DISTRICTSCIENCE');
insert or replace into Modifiers
	(ModifierId,									ModifierType,								                OwnerRequirementSetId)
values
	('COMMEMORATION_SCIENTIFIC_DISTRICTSCIENCE',	'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT',	'PLAYER_HAS_GOLDEN_AGE');
insert or replace into ModifierArguments
	(ModifierId,									Name,		    Value)
values
	('COMMEMORATION_SCIENTIFIC_DISTRICTSCIENCE',	'YieldType',	'YIELD_SCIENCE'),
    ('COMMEMORATION_SCIENTIFIC_DISTRICTSCIENCE',	'Amount',	    2);
--奢侈加金
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'HD_Commercial_Luxury_Gold';
update Adjacency_YieldChanges set YieldChange = 4 where ID = 'HD_Commercial_Luxury_Gold_Late' ;

-------------------------------------
--刚果
--UA
insert or replace into TraitModifiers (TraitType, ModifierId) 
	select 'TRAIT_CIVILIZATION_NKISI' , 'TRAIT_GREAT_WORK_FAITH_' || GreatWorkObjectType
	from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into TraitModifiers (TraitType, ModifierId) 
	select 'TRAIT_CIVILIZATION_NKISI' , 'TRAIT_GREAT_WORK_FOOD_' || GreatWorkObjectType
	from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into TraitModifiers (TraitType, ModifierId) 
	select 'TRAIT_CIVILIZATION_NKISI' , 'TRAIT_GREAT_WORK_PRODUCTION_' || GreatWorkObjectType
	from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into TraitModifiers (TraitType, ModifierId) 
	select 'TRAIT_CIVILIZATION_NKISI' , 'TRAIT_GREAT_WORK_GOLD_' || GreatWorkObjectType
	from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into Modifiers(ModifierId,ModifierType)
    select ModifierId,'MODIFIER_PLAYER_CITIES_ADJUST_GREATWORK_YIELD'
    from TraitModifiers	where ModifierId like '%TRAIT_GREAT_WORK%';

insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_FAITH_' || GreatWorkObjectType,'GreatWorkObjectType',GreatWorkObjectType
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_FOOD_' || GreatWorkObjectType,'GreatWorkObjectType',GreatWorkObjectType
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_PRODUCTION_' || GreatWorkObjectType,'GreatWorkObjectType',GreatWorkObjectType
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_GOLD_' || GreatWorkObjectType,'GreatWorkObjectType',GreatWorkObjectType
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_FAITH_' || GreatWorkObjectType,'YieldType','YIELD_FAITH'
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_FOOD_' || GreatWorkObjectType,'YieldType','YIELD_FOOD'
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_PRODUCTION_' || GreatWorkObjectType,'YieldType','YIELD_PRODUCTION'
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_GOLD_' || GreatWorkObjectType,'YieldType','YIELD_GOLD'
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';

insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_FAITH_' || GreatWorkObjectType,'YieldChange',2
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_FOOD_' || GreatWorkObjectType,'YieldChange',2
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_PRODUCTION_' || GreatWorkObjectType,'YieldChange',2
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
insert or replace into ModifierArguments(ModifierId,Name,Value)
    select 'TRAIT_GREAT_WORK_GOLD_' || GreatWorkObjectType,'YieldChange',4
    from GreatWorks where GreatWorkObjectType != 'GREATWORKOBJECT_PRODUCT';
update ModifierArguments set Value = 1 where ModifierId = 'TRAIT_GREAT_WORK_FAITH_GREATWORKOBJECT_WRITING'or'TRAIT_GREAT_WORK_FOOD_GREATWORKOBJECT_WRITING'or'TRAIT_GREAT_WORK_PRODUCTION_GREATWORKOBJECT_WRITING' and Name = 'YieldChange';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_GREAT_WORK_GOLD_GREATWORKOBJECT_WRITING' and Name = 'YieldChange';

--LA 
insert or replace into TraitModifiers 
	(TraitType,						            ModifierId)
values
	('TRAIT_LEADER_RELIGIOUS_CONVERT',		    'YT_TRAIT_LEADER_CULTURAL_FAITH');
insert or replace into Modifiers
	(ModifierId,									ModifierType,														SubjectRequirementSetId)
values
    ('YT_TRAIT_LEADER_CULTURAL_FAITH',	    'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_BASED_ON_ADJACENCY_BONUS',	    'DISTRICT_IS_THEATER');
insert or replace into ModifierArguments
	(ModifierId,							        Name,			        Value)
values
	('YT_TRAIT_LEADER_CULTURAL_FAITH',		'YieldTypeToMirror',	'YIELD_CULTURE'),
	('YT_TRAIT_LEADER_CULTURAL_FAITH',		'YieldTypeToGrant',		'YIELD_FAITH');
--UD 
delete from DistrictModifiers where DistrictType = 'DISTRICT_MBANZA' and ModifierId = 'MBANZA_ADD_ADJACENT_JUNGLE_FOOD';
delete from DistrictModifiers where DistrictType = 'DISTRICT_MBANZA' and ModifierId = 'MBANZA_ADD_ADJACENT_FOREST_FOOD';
update Districts set Appeal = 1 where DistrictType = 'DISTRICT_MBANZA' ;

insert or replace into District_Adjacencies
	(DistrictType,				YieldChangeId)
values
	('DISTRICT_THEATER',	    'District_Culture_Mbanza'),
    ('DISTRICT_COMMERCIAL_HUB',	'District_Gold_Mbanza');
insert or replace into Adjacency_YieldChanges
	(ID,								Description,							YieldType,			YieldChange,	TilesRequired,  AdjacentDistrict,			PrereqCivic,	PrereqTech,			ObsoleteCivic,	ObsoleteTech)
values
	('District_Culture_Mbanza',		    'LOC_DISTRICT_CULTURE_MBANZA',		    'YIELD_CULTURE',	2,				1,	            'DISTRICT_MBANZA',			    NULL,			NULL,				NULL,			NULL),
    ('District_Gold_Mbanza',		    'LOC_DISTRICT_GOLD_MBANZA',				'YIELD_GOLD',	    2,				1,	            'DISTRICT_MBANZA',			    NULL,			NULL,				NULL,			NULL);


