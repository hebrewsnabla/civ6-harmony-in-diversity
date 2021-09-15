-------------------------------------
--     GreatPeople Adjustments     --
-------------------------------------

-- TODO: Great prophet grant 1 extra district slot.
-------------------------------------------------------------------------------------------------------------------------------------------
---  Great Engineer
-------------------------------------------------------------------------------------------------------------------------------------------
-- bisheng:if printing eruka is boosted grant this tech GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_MATHEMATICS
-- chengqiangge: +1 great engineer points for each level wall 
-- davinci: +1 production for workshop
-- CHARLES_CORREA: +2 appeal nationwide&ALVAR_AALTO: +1 appeal nationwide
-- SHAH_JAHAN :tourism from district adjacency nationwide
-- JOHN_A_ROEBLING: little goldengate + wonder tourism
-- SHAH_JAHAN: to renissance era
-- JOSEPH_PAXTON: to modern era, 2 charges +680 production for wonders 

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_PRINTINGTECHBOOST';
-- update ModifierArguments set Value = 2 where ModifierId = 'GREATPERSON_WORKSHOP_CULTURE' and Name = 'Amount';
-- delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_CULTURE_BOMB_TRIGGER_INDUSTRIAL_ZONE';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_CITY_APPEAL_SMALL';
update GreatPersonIndividuals set EraType = 'ERA_RENAISSANCE' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_SHAH_JAHAN';	
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_CHARLES_CORREA';
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE';
update GreatPersonIndividuals set EraType = 'ERA_MODERN', ActionCharges = 2, ActionRequiresIncompleteWonder = 1, ActionRequiresCompletedDistrictType = NULL where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON' and (ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_RANGE' or ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_ENTERTAINMENT');

insert or replace into GreatPersonIndividualActionModifiers 
	(GreatPersonIndividualType, 						ModifierId,										AttachmentTargetType)
values
	('GREAT_PERSON_INDIVIDUAL_JOHN_A_ROEBLING',			'GREATPERSON_SINGLECITY_APPEAL',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
	('GREAT_PERSON_INDIVIDUAL_JOHN_A_ROEBLING',			'GREATPERSON_SINGLECITY_WONDER_TOURISM',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
	('GREAT_PERSON_INDIVIDUAL_JOHN_A_ROEBLING',			'GREATPERSON_SINGLECITY_IMPROVEMENT_TOURISM',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
	('GREAT_PERSON_INDIVIDUAL_JOHN_A_ROEBLING',			'GREATPERSON_SINGLECITY_NATIONAL_PARK_TOURISM',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_CITY'),
	('GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON',			'GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_WONDER_IN_TILE');

insert or replace into GreatPersonIndividualActionModifiers 
	(GreatPersonIndividualType, 						ModifierId)
values
	('GREAT_PERSON_INDIVIDUAL_BI_SHENG', 				'GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_PRINTING'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE',		'GREAT_PERSON_INDIVIDUAL_WALL_GEP'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE',		'GREAT_PERSON_INDIVIDUAL_CASTLE_GEP'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_OF_ST_GEORGE',		'GREAT_PERSON_INDIVIDUAL_STAR_WALL_GEP'),
	-- ('GREAT_PERSON_INDIVIDUAL_LEONARDO_DA_VINCI',		'GREATPERSON_WORKSHOP_PRODUCTION'),
	('GREAT_PERSON_INDIVIDUAL_ALVAR_AALTO',				'GREATPERSON_NATIONAL_APPEAL'),
	('GREAT_PERSON_INDIVIDUAL_CHARLES_CORREA',			'GREATPERSON_NATIONAL_APPEAL_BIG');

insert or replace into Modifiers
	(ModifierId, 										ModifierType, 								Runonce, Permanent, SubjectRequirementSetId)
values
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_PRINTING',	'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',			1,1, 	NULL),
	('GREAT_PERSON_INDIVIDUAL_WALL_GEP',				'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT', 	0,1,	'CITY_HAS_ANCIENT_WALLS'),
	('GREAT_PERSON_INDIVIDUAL_CASTLE_GEP',				'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',		0,1,	'CITY_HAS_MEDIEVAL_WALLS'),
	('GREAT_PERSON_INDIVIDUAL_STAR_WALL_GEP',			'MODIFIER_PLAYER_CITIES_ADJUST_GREAT_PERSON_POINT',		0,1,	'CITY_HAS_RENAISSANCE_WALLS'),
	-- ('GREATPERSON_WORKSHOP_PRODUCTION',					'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE', 	0,1,	NULL),
	('GREATPERSON_NATIONAL_APPEAL',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',			0,1,	NULL),
	('GREATPERSON_SINGLECITY_APPEAL',					'MODIFIER_SINGLE_CITY_ADJUST_CITY_APPEAL',				0,1,	NULL),
	('GREATPERSON_SINGLECITY_WONDER_TOURISM',			'MODIFIER_SINGLE_CITY_ADJUST_TOURISM',					0,1,	NULL),
	('GREATPERSON_SINGLECITY_IMPROVEMENT_TOURISM',		'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_TOURISM',		0,1,	NULL),	
	('GREATPERSON_SINGLECITY_NATIONAL_PARK_TOURISM',	'MODIFIER_SINGLE_CITY_ADJUST_NATIONAL_PARK_TOURISM',	0,1,	NULL),
	('GREATPERSON_NATIONAL_APPEAL_BIG',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_APPEAL',			0,1,	NULL),
	('GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN',		'MODIFIER_SINGLE_CITY_GRANT_PRODUCTION_IN_CITY',		1,1,	NULL);

insert or replace into ModifierArguments
	(ModifierId, 													Name,					Value)
values
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_PRINTING',				'TechType',			 	'TECH_PRINTING'),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_PRINTING', 			'GrantTechIfBoosted', 	1),
	('GREAT_PERSON_INDIVIDUAL_WALL_GEP',							'GreatPersonClassType', 'GREAT_PERSON_CLASS_ENGINEER'),
	('GREAT_PERSON_INDIVIDUAL_WALL_GEP',							'Amount',				1),
	('GREAT_PERSON_INDIVIDUAL_CASTLE_GEP',							'GreatPersonClassType', 'GREAT_PERSON_CLASS_ENGINEER'),
	('GREAT_PERSON_INDIVIDUAL_CASTLE_GEP',							'Amount',				1),
	('GREAT_PERSON_INDIVIDUAL_STAR_WALL_GEP',						'GreatPersonClassType', 'GREAT_PERSON_CLASS_ENGINEER'),
	('GREAT_PERSON_INDIVIDUAL_STAR_WALL_GEP',						'Amount',				1),
	-- ('GREATPERSON_WORKSHOP_PRODUCTION',								'BuildingType',			'BUILDING_WORKSHOP'),
	-- ('GREATPERSON_WORKSHOP_PRODUCTION',								'Amount',				1),
	-- ('GREATPERSON_WORKSHOP_PRODUCTION',								'YieldType',			'YIELD_PRODUCTION'),
	('GREATPERSON_NATIONAL_APPEAL',									'Amount',				1),
	('GREATPERSON_SINGLECITY_APPEAL',								'Amount',				2),
	('GREATPERSON_SINGLECITY_IMPROVEMENT_TOURISM',					'Amount',				100),
	('GREATPERSON_SINGLECITY_NATIONAL_PARK_TOURISM',				'Amount',				100),
	('GREATPERSON_SINGLECITY_WONDER_TOURISM',						'BoostsWonders',		1),
	('GREATPERSON_SINGLECITY_WONDER_TOURISM',						'ScalingFactor',		200),
	('GREATPERSON_NATIONAL_APPEAL_BIG',								'Amount',				2),
	('GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN',					'Amount',				680),
	('GREATPERSON_GRANT_PRODUCTION_IN_CITY_MODERN',					'KeepOverflow',			0);
------------------------------------------------------------------------------------------------------------------------------
--- Great Scientist
-------------------------------------------------------------------------------------------------------------------------------
-- EUCLID +1 district capacity finish mathmatics if boosted
-- Darwin : +1000 science for each natural wonder tiles
-- galieo : +400 science for each ajacent mountain tiles
-- HILDEGARD_OF_BINGEN ： +200 faith when activate
-- ABU_AL_QASIM_AL_ZAHRAWI : sanitation boost or give full tech
-- issac_newton : university +1 sicence
-- ALFRED_NOBEL：+25%GPP acumulate speed
-- ALBERT_EINSTEIN: 2 boost
-- ALAN_TURING: finish computer if boosted; boost +era
-- DMITRI_MENDELEEV: finish chemistry if boosted; boost +era
-- JAMES_YOUNG: finish refining if boosted; boost plastic

update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_SNOWMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_TUNDRAMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_DESERTMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_PLAINSMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_GRASSMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 1000 where ModifierId = 'GREATPERSON_ADJACENT_NATURALWONDER_SCIENCE' and Name = 'Amount';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_1MEDIEVALRENAISSANCETECHBOOST';
update ModifierArguments set Value = 200 where ModifierId = 'GREATPERSON_FAITH' and  Name = 'Amount';
update ModifierArguments set Value = 2 where ModifierId = 'GREATPERSON_LIBRARIES_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 4 where ModifierId = 'GREATPERSON_UNIVERSITIES_SMALL_SCIENCE' and Name = 'Amount';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_MATHTECHBOOST' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_EUCLID';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_2INDUSTRIALMODERNTECHBOOSTS';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_1INDUSTRIALTECHBOOST';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_COMPUTERSTECHBOOST' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ALAN_TURING';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_1MODERNTECHBOOST' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ALAN_TURING';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_CHEMISTRYTECHBOOST';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_1MODERNATOMICTECHBOOST' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ALBERT_EINSTEIN';
	
insert or replace into GreatPersonIndividualActionModifiers 
	(GreatPersonIndividualType, 						ModifierId,									AttachmentTargetType)
values
	('GREAT_PERSON_INDIVIDUAL_EUCLID',					'GREATPERSON_EXTRA_DISTRICT_CAPACITY',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

insert or replace into GreatPersonIndividualActionModifiers 
	(GreatPersonIndividualType, 						ModifierId)
values
	('GREAT_PERSON_INDIVIDUAL_ALBERT_EINSTEIN',			'GREATPERSON_2MODERNATOMICTECHBOOST'),
	('GREAT_PERSON_INDIVIDUAL_ALAN_TURING',				'GREATPERSON_1MODERNATOMICTECHBOOST'),
	('GREAT_PERSON_INDIVIDUAL_DMITRI_MENDELEEV',		'GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS'),
	('GREAT_PERSON_INDIVIDUAL_ALAN_TURING',				'GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_COMPUTERS'),
	('GREAT_PERSON_INDIVIDUAL_DMITRI_MENDELEEV',		'GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_CHEMISTRY'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_YOUNG',				'GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_REFINING'),
	('GREAT_PERSON_INDIVIDUAL_JAMES_YOUNG',				'GREAT_PERSON_PLASTICS_TECHBOOST'),
	('GREAT_PERSON_INDIVIDUAL_EUCLID',					'GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_MATHEMATICS'),
	('GREAT_PERSON_INDIVIDUAL_ABU_AL_QASIM_AL_ZAHRAWI',	'GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_SANITATION');

insert or ignore into Modifiers
	(ModifierId, 											ModifierType, 	Runonce,   Permanent)
values
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_MATHEMATICS', 'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',	1,1);

insert or replace into Modifiers
	(ModifierId, 	ModifierType, 	Runonce,   Permanent,   SubjectRequirementSetId)
values
	('GREATPERSON_2MODERNATOMICTECHBOOST',				'MODIFIER_PLAYER_GRANT_RANDOM_TECHNOLOGY_BOOST_BY_ERA',1,1, 	NULL),
	('GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS',			'MODIFIER_PLAYER_GRANT_RANDOM_TECHNOLOGY_BOOST_BY_ERA',1,1, 	NULL),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_COMPUTERS', 'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',	1,1, 	NULL),
	('GREAT_PERSON_PLASTICS_TECHBOOST',					'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',	1,1, 	NULL),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_CHEMISTRY', 'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',	1,1, 	NULL),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_REFINING',	'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',	1,1, 	NULL),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_SANITATION','MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',	1,1, 	NULL);

insert or replace into GreatPersonIndividualActionModifiers (GreatPersonIndividualType, ModifierId)
select 'GREAT_PERSON_INDIVIDUAL_ALFRED_NOBEL', 'GREAT_PERSON_ADD_' || GreatPersonClassType from GreatPersonClasses
where not (GreatPersonClassType = 'GREAT_PERSON_CLASS_COMANDANTE_GENERAL');
insert or replace into Modifiers	(ModifierId,ModifierType, Runonce, Permanent)
select  'GREAT_PERSON_ADD_' || GreatPersonClassType , 'MODIFIER_PLAYER_ADJUST_GREAT_PERSON_POINTS_PERCENT',1,1 from GreatPersonClasses;
insert or replace into ModifierArguments (ModifierId,	Name,	Value)
select  'GREAT_PERSON_ADD_' || GreatPersonClassType ,	'GreatPersonClassType',  GreatPersonClassType from GreatPersonClasses;
insert or replace into ModifierArguments (ModifierId,	Name,	Value)
select  'GREAT_PERSON_ADD_' || GreatPersonClassType ,	'Amount', 25 from GreatPersonClasses;

insert or replace into ModifierArguments
	(ModifierId, 												Name,     				Value)
values
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_MATHEMATICS',		'TechType',				'TECH_MATHEMATICS'),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_MATHEMATICS',		'GrantTechIfBoosted',	1),
	('GREATPERSON_2MODERNATOMICTECHBOOST',						'Amount',				2),
	('GREATPERSON_2MODERNATOMICTECHBOOST',						'EndEraType',			'ERA_ATOMIC'),
	('GREATPERSON_2MODERNATOMICTECHBOOST',						'StartEraType',			'ERA_MODERN'),
	('GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS',					'Amount',				1),
	('GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS',					'EndEraType',			'ERA_MODERN'),
	('GREATPERSON_1INDUSTRIALMODERNTECHBOOSTS',					'StartEraType',			'ERA_INDUSTRIAL'),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_COMPUTERS',		'TechType',				'TECH_COMPUTERS'),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_COMPUTERS',		'GrantTechIfBoosted', 	1),
	('GREAT_PERSON_PLASTICS_TECHBOOST',							'TechType',			 	'TECH_PLASTICS'),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_CHEMISTRY',		'TechType',			 	'TECH_CHEMISTRY'),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_CHEMISTRY',		'GrantTechIfBoosted', 	1),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_REFINING',			'TechType',			 	'TECH_REFINING'),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_REFINING',			'GrantTechIfBoosted', 	1),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_SANITATION',		'TechType',			 	'TECH_SANITATION'),
	('GREAT_PERSON_INDIVIDUAL_BOOST_OR_GRANT_SANITATION',		'GrantTechIfBoosted', 	1);


-- insert or replace into GreatWorks
-- 	(GreatWorkType, GreatWorkObjectType, GreatPersonIndividualType, Name, Audio, Image, Quote, Tourism, Eratype)
-- values
-- 	('GREATWORK_NEWTON',	'GREATWORKOBJECT_WRITING',	'GREAT_PERSON_INDIVIDUAL_ISAAC_NEWTON',	'LOC_GREATWORK_NEWTON_NAME',	NULL,
-- 		NULL, 'LOC_GREATWORK_NEWTON_QUOTE',	3,	'ERA_RENAISSANCE');

-- insert or replace into GreatWorkModifiers (GreatWorkType, ModifierId)
-- values ('GREATWORK_NEWTON','PRODUCT_SCIENCE_YIELD_BONUS_TURTLES');

-- todo: add a button for Newton
-- and see if he is 30% sicence boost

--柯莱欧司具有2次使用次数
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_COLAEUS'; 

--马库斯克拉苏激活给100块
update ModifierArguments set Value = 100 where ModifierId = 'GREATPERSON_GOLD_TINY' and Name = 'Amount';

--拉贾托达马尔使内商从每个专业化区域+1金
update ModifierArguments set Value = 1 where ModifierId = 'GREATPERSON_DOMESTIC_ROUTE_GOLD_PER_SPECIALTY_DISTRICT' and Name = 'Amount';

--玛丽凯瑟琳同时也会使敌方间谍我方领土内降级
insert into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                             ModifierId)
values
        ('GREAT_PERSON_INDIVIDUAL_MARY_KATHERINE_GODDARD',     'MARY_KATHERINE_DEFENSE');

insert into Modifiers
	    (ModifierId,                      ModifierType)
values
        ('MARY_KATHERINE_DEFENSE',        'MODIFIER_PLAYER_ADJUST_SPY_BONUS');

insert into ModifierArguments
    	(ModifierId,                                     Name,                Value)
values
        ('MARY_KATHERINE_DEFENSE',                       'Amount',            1),
        ('MARY_KATHERINE_DEFENSE',                       'Offense',           0);

--瓦特给工厂+3锤
update ModifierArguments set Value = 3 where ModifierId = 'GREATPERSON_FACTORIES_PRODUCTION' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_JANAKI_AMMAL
update ModifierArguments set Value = 800 where ModifierId = 'GREATPERSON_ADJACENT_RAINFOREST_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_MARY_LEAKEY
update ModifierArguments set Value = 700 where ModifierId = 'GREATPERSON_ARTIFACT_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_MARGARET_MEAD
update ModifierArguments set Value = 3000 where ModifierId = 'GREAT_PERSON_GRANT_LOTSO_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_ABDUS_SALAM
update ModifierArguments set Value = 'ERA_FUTURE' where ModifierId = 'GREATPERSON_ALLINFORMATIONTECHBOOSTS' and Name = 'EndEraType';

--特斯拉改成全国效果。
insert into Modifiers
	    (ModifierId,                      ModifierType,                                                  SubjectRequirementSetId)
values
        ('TESLA_REGIONAL_RANGE_BONUS',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',       'DISTRICT_IS_INDUSTRIAL_ZONE');

insert into ModifierArguments
    	(ModifierId,                                     Name,                Value)
values
        ('TESLA_REGIONAL_RANGE_BONUS',                  'Amount',             3);

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA',       'TESLA_REGIONAL_RANGE_BONUS',        'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');
-- DL: Might Better to attach to Player (default value)

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_RANGE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA';

--皮耶罗·迪·巴尔迪现在给300金
insert into Modifiers
	    (ModifierId,                      ModifierType,                   RunOnce,              Permanent)
values
        ('PIERO_DE_BARDI_GOLD',           'MODIFIER_PLAYER_GRANT_YIELD',   1,                    1);

insert or replace into ModifierArguments
    	(ModifierId,                                     Name,          Type,                    Value)
values
        ('PIERO_DE_BARDI_GOLD',                          'Amount',      'ScaleByGameSpeed',      300),
        ('PIERO_DE_BARDI_GOLD',                          'YieldType',   'ARGTYPE_IDENTITY',    'YIELD_GOLD');

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_PIERO_DE_BARDI',     'PIERO_DE_BARDI_GOLD',                'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_GOLD_SMALL' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_PIERO_DE_BARDI';

--雅各布·富格尔现在给400金
insert into Modifiers
	    (ModifierId,                      ModifierType,                   RunOnce,              Permanent)
values
        ('JAKOB_FUGGER_GOLD',           'MODIFIER_PLAYER_GRANT_YIELD',   1,                    1);

insert or replace into ModifierArguments
    	(ModifierId,                                     Name,          Type,                    Value)
values
        ('JAKOB_FUGGER_GOLD',                          'Amount',      'ScaleByGameSpeed',      400),
        ('JAKOB_FUGGER_GOLD',                          'YieldType',   'ARGTYPE_IDENTITY',    'YIELD_GOLD');

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_JAKOB_FUGGER',     'JAKOB_FUGGER_GOLD',                'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_GOLD_SMALL' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAKOB_FUGGER';

--约翰·雅各·阿斯特现在给600金
insert into Modifiers
	    (ModifierId,                      ModifierType,                   RunOnce,              Permanent)
values
         ('JOHN_JACOB_ASTOR_GOLD',           'MODIFIER_PLAYER_GRANT_YIELD',   1,                    1);

insert or replace into ModifierArguments
    	(ModifierId,                                     Name,          Type,                    Value)
values
        ('JOHN_JACOB_ASTOR_GOLD',                       'Amount',      'ScaleByGameSpeed',      600),
        ('JOHN_JACOB_ASTOR_GOLD',                       'YieldType',   'ARGTYPE_IDENTITY',    'YIELD_GOLD');

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_JOHN_JACOB_ASTOR',     'JOHN_JACOB_ASTOR_GOLD',            'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_GOLD_LARGE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOHN_JACOB_ASTOR';

--周达观直接给3使者
insert into Modifiers
	    (ModifierId,                      ModifierType,                             RunOnce,              Permanent)
values
        ('ZHOU_DAGUAN_TOKENS',            'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',      1,                  1);

insert or replace into ModifierArguments
    	(ModifierId,                                     Name,          Type,                    Value)
values
        ('ZHOU_DAGUAN_TOKENS',                           'Amount',      'ARGTYPE_IDENTITY',      3);

update GreatPersonIndividuals set ActionRequiresCompletedDistrictType = 'DISTRICT_COMMERCIAL_HUB' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividuals set ActionRequiresCityStateTerritory = 0 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividuals set ActionRequiresNonHostileTerritory = 0 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividualActionModifiers set ModifierId = 'ZHOU_DAGUAN_TOKENS' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividualActionModifiers set AttachmentTargetType = 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';

-- 梅里塔·本茨额外+1商路容量
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MELITTA_BENTZ' and ModifierId = 'GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY';

insert or replace into GreatPersonIndividualActionModifiers 
	(GreatPersonIndividualType, 						ModifierId,										AttachmentTargetType)
values
	('GREAT_PERSON_INDIVIDUAL_MELITTA_BENTZ',			'GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY2',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

insert or replace into Modifiers
	(ModifierId, 										ModifierType, 									Runonce, Permanent, SubjectRequirementSetId)
values
	('GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY2',			'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY',	1,		 1, 		NULL);

insert or replace into ModifierArguments
	(ModifierId, 										Name,					Value)
values
	('GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY2',			'Amount',			 	2);

insert or replace into ModifierStrings
    (ModifierId,                                Context,    Text)
values
    ('GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY2',	'Summary',  'LOC_GREATPERSON_EXTRA_TRADE_ROUTE_CAPACITY');

-- 亚当·斯密 改为+1经济槽
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ADAM_SMITH' and (ModifierId = 'GREATPERSON_GOVERNOR_POINTS' or ModifierId = 'GREATPERSON_GOLD_LARGE');

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                  ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_ADAM_SMITH',       'GREATPERSON_ECONOMIC_POLICY_SLOT',   'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

--约瑟夫·帕克斯顿改成全国效果
insert or replace into RequirementSetRequirements
	    (RequirementSetId,                           RequirementId)
values
	    ('DISTRICT_IS_ENTERTAINMENT',        'REQUIRES_DISTRICT_IS_ENTERTAINMENT_COMPLEX');

insert or replace into RequirementSets
	    (RequirementSetId,                           RequirementSetType)
values
	    ('DISTRICT_IS_ENTERTAINMENT',                'REQUIREMENTSET_TEST_ALL');

insert into Modifiers
	    (ModifierId,                      ModifierType,                                                           SubjectRequirementSetId)
values
        ('JOSEPH_PAXTON_REGIONAL_RANGE_BONUS',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',       'DISTRICT_IS_ENTERTAINMENT');

insert into ModifierArguments
    	(ModifierId,                                     Name,                Value)
values
        ('JOSEPH_PAXTON_REGIONAL_RANGE_BONUS',          'Amount',             3);

/*insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON',       'JOSEPH_PAXTON_REGIONAL_RANGE_BONUS',        'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');*/

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_RANGE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON';

-- insert or replace into ModifierStrings
-- 	    (ModifierId,                      Context,                     Text)
-- values
-- 	    ('PIERO_DE_BARDI_GOLD',            'Summary',                   'LOC_PIERO_DE_BARDI_GOLD'),
-- 	    ('JAKOB_FUGGER_GOLD',            'Summary',                   'LOC_JAKOB_FUGGER_GOLD'),
-- 	    ('JOHN_JACOB_ASTOR_GOLD',            'Summary',                   'LOC_JOHN_JACOB_ASTOR_GOLD'),
-- 	    ('ZHOU_DAGUAN_TOKENS',            'Summary',                   'LOC_ZHOU_DAGUAN_TOKENS'),
-- 	    ('JOSEPH_PAXTON_REGIONAL_RANGE_BONUS',            'Summary',                   'LOC_JOSEPH_PAXTON_REGIONAL_RANGE_BONUS'),
-- 	    ('TESLA_REGIONAL_RANGE_BONUS',     'Summary',                    'LOC_TESLA_REGIONAL_RANGE_BONUS');

------------------------------------------------------------
-- great admiral
------------------------------------------------------------
-- GREAT_PERSON_INDIVIDUAL_ARTEMISIA grants a lighthouse and lighthouses +1 food
-- GREAT_PERSON_INDIVIDUAL_THEMISTOCLES grants an extra district capacity and an envoy
-- GREAT_PERSON_INDIVIDUAL_LEIF_ERIKSON grants a settler
-- GREAT_PERSON_INDIVIDUAL_HIMERIOS +1 charge
-- GREAT_PERSON_INDIVIDUAL_FRANCIS_DRAKE naval raider units +2 combat strength
-- GREAT_PERSON_INDIVIDUAL_FERDINAND_MAGELLAN grants a settler instead of luxulry resource
-- GREAT_PERSON_INDIVIDUAL_CHING_SHIH plunder bonus +100%
-- GREAT_PERSON_INDIVIDUAL_HORATIO_NELSON shipyards +2 production
-- GREAT_PERSON_INDIVIDUAL_LASKARINA_BOUBOULINA +2 charges
-- GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA grants a lighthouse, a shipyard, a seaport and all seaports +1 housing
-- GREAT_PERSON_INDIVIDUAL_SERGEY_GORSHKOV +1 charge
-- GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO +1 amenity for all harbors and -25% war weariness
-- GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO +1 Movement for all naval units

update GreatPersonIndividuals set ActionRequiresOwnedTile = 1, ActionRequiresMilitaryUnitDomain = NULL, ActionRequiresCompletedDistrictType = 'DISTRICT_HARBOR', ActionEffectTileHighlighting = 1, ActionRequiresUnitCanGainExperience = 0
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ARTEMISIA';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 1, ActionRequiresNoMilitaryUnit = 0, ActionRequiresCompletedDistrictType = 'DISTRICT_HARBOR', ActionEffectTileHighlighting = 1
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_THEMISTOCLES';
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_HIMERIOS';
update GreatPersonIndividuals set ActionRequiresVisibleLuxury = 0, ActionEffectTileHighlighting = 0 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_FERDINAND_MAGELLAN';
update ModifierArguments set Value = 100 where ModifierId = 'CHING_SHIH_PLUNDER_BONUS' and Name = 'Amount';
update GreatPersonIndividuals set ActionCharges = 3 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_LASKARINA_BOUBOULINA';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 1, ActionRequiresCompletedDistrictType = 'DISTRICT_HARBOR', ActionEffectTileHighlighting = 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA';
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_SERGEY_GORSHKOV';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 1, ActionRequiresMilitaryUnitDomain = NULL, ActionRequiresCompletedDistrictType = 'DISTRICT_HARBOR', ActionEffectTileHighlighting = 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 0, ActionRequiresCompletedDistrictType = NULL, ActionEffectTileHighlighting = 0 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO';

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_ARTEMISIA_ACTIVE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ARTEMISIA';
delete from GreatPersonIndividualActionModifiers where (ModifierId = 'GREATPERSON_THEMISTOCLES_ACTIVE' or ModifierId = 'GREATPERSON_THEMISTOCLES_NAVAL_RANGED') and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_THEMISTOCLES';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_FERDINAND_MAGELLAN_GRANT_PLOT_RESOURCE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_FERDINAND_MAGELLAN';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_JOAQUIM_MARQUES_LISBOA_ACTIVE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA';
delete from GreatPersonIndividualActionModifiers where (ModifierId = 'GREATPERSON_CLANCY_FERNANDO_ACTIVE' or ModifierId = 'GREATPERSON_CLANCY_FERNANDO_ACTIVE_UNIT_BONUS') and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO';
delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_TOGO_HEIHACHIRO_ACTIVE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO';

--update ModifierArguments set Value = 'TERRAIN_OCEAN,TERRAIN_COAST' where ModifierId = 'GREATPERSON_LEIF_ERIKSON_ACTIVE' and Name = 'TerrainType';
update RequirementSets set RequirementSetType = 'REQUIREMENTSET_TEST_ANY' where RequirementSetId = 'GREATPERSON_LEIF_ERIKSON_ACTIVE_REQUIREMENTS';
insert or replace into RequirementSetRequirements	(RequirementSetId,	RequirementId)	
values	('GREATPERSON_LEIF_ERIKSON_ACTIVE_REQUIREMENTS', 'REQUIREMENT_UNIT_IS_SETTLER');

insert or replace into GreatPersonIndividualActionModifiers
	(GreatPersonIndividualType,						ModifierId,												AttachmentTargetType)
values
    ('GREAT_PERSON_INDIVIDUAL_ARTEMISIA',			'ARTEMISIA_LIGHTHOUSE',									'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_ARTEMISIA',       	'ARTEMISIA_LIGHTHOUSE_FOOD',							'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_THEMISTOCLES',		'GREATPERSON_EXTRA_DISTRICT_CAPACITY',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_THEMISTOCLES',       	'GREATPERSON_INFLUENCE_TOKENS_SMALL',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_LEIF_ERIKSON',       	'GREATPERSON_GRANT_A_SETTLER',							'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_GREATPERSON'),
	('GREAT_PERSON_INDIVIDUAL_FRANCIS_DRAKE',       'GREATPERSON_NAVLA_RAIDER_BONUS',						'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_FERDINAND_MAGELLAN',  'GREATPERSON_GRANT_A_SETTLER',							'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_UNIT_GREATPERSON'),
	('GREAT_PERSON_INDIVIDUAL_HORATIO_NELSON',      'HORATIO_NELSON_SHIPYARD_PRODUCTION',					'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_LEIF_ERIKSON',		'GREATPERSON_SETTLER_EMBARK',							'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA',	'GREATPERSON_HORATIO_NELSON_LIGHTHOUSE',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA',  'GREATPERSON_HORATIO_NELSON_SHIPYARD',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA',	'GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT',		'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE'),
	('GREAT_PERSON_INDIVIDUAL_JOAQUIM_MARQUES_LISBOA',  'GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO',  	'GREATPERSON_JOAQUIM_MARQUES_LISBOA_ACTIVE',			'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_CLANCY_FERNANDO',  	'GREATPERSON_CLANCY_FERNANDO_AMENITIES',				'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'),
	('GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO',  	'GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT',	'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER');

insert into Modifiers
	(ModifierId,												ModifierType,											RunOnce,	Permanent)
values
    ('ARTEMISIA_LIGHTHOUSE',									'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',	1,			1),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	0,			1),
	('GREATPERSON_GRANT_A_SETTLER',								'MODIFIER_PLAYER_UNIT_GRANT_UNIT_WITH_EXPERIENCE',		1,			1),
	('GREATPERSON_NAVLA_RAIDER_BONUS',							'MODIFIER_PLAYER_UNITS_GRANT_ABILITY',					0,			1),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',	0,			1),
	('GREATPERSON_SETTLER_EMBARK',								'MODIFIER_PLAYER_ADJUST_EMBARK_UNIT_PASS',				0,			1),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT',				'MODIFIER_SINGLE_CITY_GRANT_BUILDING_IN_CITY_IGNORE',	1,			1),
	('GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT',	'MODIFIER_PLAYER_UNITS_ADJUST_SEA_MOVEMENT',			1,			1);

insert into Modifiers
	(ModifierId,											ModifierType,										RunOnce,		Permanent,	SubjectRequirementSetId)
values
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING',	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_HOUSING',	1,				1,			'BUILDING_IS_SEAPORT'),
	('GREATPERSON_CLANCY_FERNANDO_AMENITIES',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_AMENITIES_FROM_GREAT_PEOPLE',	1,	1,		'CITY_HAS_HARBOR');

insert into ModifierArguments
    	(ModifierId,											Name,				Value)
values
    ('ARTEMISIA_LIGHTHOUSE',									'BuildingType',		'BUILDING_LIGHTHOUSE'),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'BuildingType',		'BUILDING_LIGHTHOUSE'),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'YieldType',		'YIELD_FOOD'),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'Amount',			1),
	('GREATPERSON_GRANT_A_SETTLER',								'UnitType',			'UNIT_SETTLER'),
	('GREATPERSON_NAVLA_RAIDER_BONUS',							'AbilityType',		'ABILITY_NAVAL_RAIDER_BONUS'),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'BuildingType',		'BUILDING_SHIPYARD'),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'YieldType',		'YIELD_PRODUCTION'),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'Amount',			2),
	('GREATPERSON_SETTLER_EMBARK',								'UnitType',			'UNIT_SETTLER'),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT',				'BuildingType',		'BUILDING_SEAPORT'),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING',		'Amount',			1),
	('GREATPERSON_CLANCY_FERNANDO_AMENITIES',					'Amount',			1),
	('GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT',	'Amount',			1);
	
insert or replace into ModifierStrings
    (ModifierId,                                				Context,    Text)
values
    ('ARTEMISIA_LIGHTHOUSE',									'Summary',  'LOC_ARTEMISIA_LIGHTHOUSE'),
	('ARTEMISIA_LIGHTHOUSE_FOOD',								'Summary',  'LOC_ARTEMISIA_LIGHTHOUSE_FOOD'),
	('GREATPERSON_GRANT_A_SETTLER',								'Summary',  'LOC_GREATPERSON_GRANT_A_SETTLER'),
	('GREATPERSON_NAVLA_RAIDER_BONUS',							'Summary',  'LOC_GREATPERSON_NAVLA_RAIDER_BONUS'),
	('HORATIO_NELSON_SHIPYARD_PRODUCTION',						'Summary',  'LOC_HORATIO_NELSON_SHIPYARD_PRODUCTION'),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT',				'Summary',  'LOC_GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT'),
	('GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING',		'Summary',  'LOC_GREATPERSON_JOAQUIM_MARQUES_LISBOA_SEAPORT_HOUSING'),
	('GREATPERSON_CLANCY_FERNANDO_AMENITIES',					'Summary',  'LOC_GREATPERSON_CLANCY_FERNANDO_AMENITIES'),
	('GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT',	'Summary',  'LOC_GREAT_PERSON_INDIVIDUAL_TOGO_HEIHACHIRO_SEA_MOVEMENT');

update ModifierStrings set Text = 'LOC_PIERO_DE_BARDI_GOLD' where ModifierId = 'GREATPERSON_FERDINAND_MAGELLAN_ACTIVE';

-- Mimar Sinan.
insert or replace into Modifiers (ModifierId, ModifierType) values
("GREATPERSON_CULTURE_BOMB_MIMAR_SINAN", "MODIFIER_DO_NOTHING");
insert or replace into ModifierStrings (ModifierId, Context, Text) values
("GREATPERSON_CULTURE_BOMB_MIMAR_SINAN", "Summary", "LOC_GREATPERSON_DISTRICT_CULTURE_BOMB");

update GreatPersonIndividuals set
ActionCharges = 2,
ActionRequiresCompletedDistrictType = NULL,
ActionEffectTileHighlighting = 0
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MIMAR_SINAN';

update GreatPersonIndividualActionModifiers
set ModifierId = 'GREATPERSON_CULTURE_BOMB_MIMAR_SINAN', AttachmentTargetType = 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_PLAYER'
where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_MIMAR_SINAN';
