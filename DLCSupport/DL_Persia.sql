-------------------------------------
--            Persia DLC           --
-------------------------------------

-- Apadana
delete from BuildingModifiers where ModifierId = 'APADANA_AWARD_TWO_INFLUENCE_TOKEN';
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('BUILDING_APADANA',					'APADANA_AWARD_ONE_INFLUENCE_TOKEN');

insert or replace into Modifiers
	(ModifierId,									ModifierType,												SubjectRequirementSetId)
values
	('APADANA_AWARD_ONE_INFLUENCE_TOKEN',       	'MODIFIER_PLAYER_DISTRICTS_ATTACH_MODIFIER',				'PLOT_HAS_COMPLETE_WONDER'),
	('APADANA_AWARD_ONE_INFLUENCE_TOKEN_MODIFIER',	'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',					NULL);

insert or replace into ModifierArguments
	(ModifierId,										Name,			Value)
values
	('APADANA_AWARD_ONE_INFLUENCE_TOKEN',				'ModifierId',	'APADANA_AWARD_ONE_INFLUENCE_TOKEN_MODIFIER'),
	('APADANA_AWARD_ONE_INFLUENCE_TOKEN_MODIFIER',		'Amount',		1);

insert or replace into Building_CitizenYieldChanges
    (BuildingType,                          YieldType,          YieldChange)
values
    ('BUILDING_BASILIKOI_PAIDES',           'YIELD_PRODUCTION', 1), -- ub
    ('BUILDING_BASILIKOI_PAIDES',           'YIELD_GOLD',       -1); -- ub

insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
values
    -- ('BUILDING_BASILIKOI_PAIDES',    'BARRACKS_ADD_COPPER_PRODUCTION'), --ub
    ('BUILDING_BASILIKOI_PAIDES',   'BARRACKS_ADD_IRON_PRODUCTION'), --ub
    ('BUILDING_BASILIKOI_PAIDES',   'BASILIKOI_TRAINED_STRENGTH_MODIFIER'); --ub
    -- ('BUILDING_BASILIKOI_PAIDES', 'BASILIKOI_PAIDES_INCREASED_MOVEMENT_MODIFIER'),

-- Ability from Basilikoi
insert or replace into TypeTags
    (Type,                                                              Tag)
values
    ('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',                         'CLASS_MELEE'),
    ('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',                         'CLASS_RANGED'),
    ('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',                         'CLASS_ANTI_CAVALRY'),
    ('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',                         'CLASS_SIEGE'),
    ('ABILITY_BASILIKOI_TRAINED_UNIT_STRENGTH',                         'CLASS_HETAIROI');

-----------------------------------------------------------------------------------------------------------------------
--Persia
--??????LA?????????????????????+5??????????????????????????????+5??????
--???????????????28?????????33?????? (???DL_Units????????????)
--????????????????????????+1???????????????????????????1????????????+1???
--??????UA??????+1?????????+2???
--???????????????????????????????????????????????????????????????????????????????????????4???????????????DL_StartBias???????????????
--????????????????????????????????????????????????????????????+1????????????
insert or replace into Improvement_YieldChanges
	(ImprovementType,				YieldType,		YieldChange)
values
	('IMPROVEMENT_PAIRIDAEZA',		'YIELD_FOOD',	0);
update Adjacency_YieldChanges set YieldType = 'YIELD_FOOD' where ID = 'Pairidaeza_CityCenterAdjacency';
update Adjacency_YieldChanges set YieldChange = 2 where ID = 'Pairidaeza_CommercialHubAdjacency';
update Improvements set Appeal = 2 where ImprovementType = 'IMPROVEMENT_PAIRIDAEZA';
insert or replace into ImprovementModifiers
	(ImprovementType,				ModifierId)
values
	('IMPROVEMENT_PAIRIDAEZA',		'PAIRIDAEZA_GOVERNMENT_CULTURE'),
	('IMPROVEMENT_PAIRIDAEZA',		'PAIRIDAEZA_GOVERNMENT_TIER_1_CULTURE'),
	('IMPROVEMENT_PAIRIDAEZA',		'PAIRIDAEZA_GOVERNMENT_TIER_2_CULTURE'),
	('IMPROVEMENT_PAIRIDAEZA',		'PAIRIDAEZA_GOVERNMENT_TIER_3_CULTURE');
insert or replace into Modifiers
	(ModifierId,								ModifierType,								SubjectRequirementSetId)
values
	('PAIRIDAEZA_GOVERNMENT_CULTURE',			'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLAYER_HAS_DISTRICT_GOVERNMENT_REQUIREMENTS'),
	('PAIRIDAEZA_GOVERNMENT_TIER_1_CULTURE',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLAYER_HAS_DISTRICT_GOVERNMENT_TIER_1_BUILDING_REQUIREMENTS'),
	('PAIRIDAEZA_GOVERNMENT_TIER_2_CULTURE',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLAYER_HAS_DISTRICT_GOVERNMENT_TIER_2_BUILDING_REQUIREMENTS'),
	('PAIRIDAEZA_GOVERNMENT_TIER_3_CULTURE',	'MODIFIER_SINGLE_PLOT_ADJUST_PLOT_YIELDS',	'PLAYER_HAS_DISTRICT_GOVERNMENT_TIER_3_BUILDING_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('PAIRIDAEZA_GOVERNMENT_CULTURE',			'YieldType',	'YIELD_CULTURE'),
	('PAIRIDAEZA_GOVERNMENT_CULTURE',			'Amount',		1),
	('PAIRIDAEZA_GOVERNMENT_TIER_1_CULTURE',	'YieldType',	'YIELD_CULTURE'),
	('PAIRIDAEZA_GOVERNMENT_TIER_1_CULTURE',	'Amount',		1),
	('PAIRIDAEZA_GOVERNMENT_TIER_2_CULTURE',	'YieldType',	'YIELD_CULTURE'),
	('PAIRIDAEZA_GOVERNMENT_TIER_2_CULTURE',	'Amount',		1),
	('PAIRIDAEZA_GOVERNMENT_TIER_3_CULTURE',	'YieldType',	'YIELD_CULTURE'),
	('PAIRIDAEZA_GOVERNMENT_TIER_3_CULTURE',	'Amount',		1);
/*insert or replace into ImprovementModifiers
    (ImprovementType,                           ModifierId)
values
    ('IMPROVEMENT_PAIRIDAEZA',                  'PAIRIDAEZA_AMENITY_MAX_ONE');

insert into Modifiers
        (ModifierId,                                    ModifierType,                                           SubjectStackLimit)
values
        ('PAIRIDAEZA_AMENITY_MAX_ONE',                  'MODIFIER_CITY_OWNER_ADJUST_IMPROVEMENT_AMENITY',       1);

insert into ModifierArguments
        (ModifierId,                                     Name,                Value)
values
        ('PAIRIDAEZA_AMENITY_MAX_ONE',                  'Amount',             1);*/

insert or replace into ModifierArguments 
    (ModifierId,                                Name,               Value) 
values
    ('TRAIT_SATRAPIES_INTERNAL_TRADE_CULTURE',  'Amount',           2);

INSERT OR REPLACE INTO TraitModifiers (TraitType, ModifierId) VALUES 
('TRAIT_CIVILIZATION_SATRAPIES', 'PERSIA_GOVERNOR_POINTS');

INSERT OR REPLACE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES 
('PERSIA_GOVERNOR_POINTS', 'MODIFIER_PLAYER_ADJUST_GOVERNOR_POINTS', 'PLAYER_HAS_POLITICAL_PHILOSOPHY');

INSERT OR REPLACE INTO ModifierArguments (ModifierId, Name, Value) VALUES 
('PERSIA_GOVERNOR_POINTS', 'Delta', '1');


update Modifiers set ModifierType = 'MODIFIER_PLAYER_CITIES_ADJUST_IDENTITY_PER_TURN' where ModifierId = 'TRAIT_ADDITIONAL_MARTIAL_LAW';
update Modifiers set SubjectRequirementSetId = 'CITY_HAS_GARRISON_UNIT_REQUIERMENT' where ModifierId = 'TRAIT_ADDITIONAL_MARTIAL_LAW';