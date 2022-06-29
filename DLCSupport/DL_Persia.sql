-------------------------------------
--            Persia DLC           --
-------------------------------------

-- Apadana
--insert or replace into BuildingModifiers
--    (BuildingType,                      ModifierId)
--values
--    ('BUILDING_APADANA',                'APADANA_TRIBUTARY_CULTURE');

--insert or replace into Modifiers
--    (ModifierId,                        ModifierType)
--values
--    ('APADANA_TRIBUTARY_CULTURE',       'MODIFIER_PLAYER_ADJUST_YIELD_CHANGE_PER_TRIBUTARY');

--insert or replace into ModifierArguments
--    (ModifierId,                        Name,           Value)
--values
--    ('APADANA_TRIBUTARY_CULTURE',       'YieldType',    'YIELD_CULTURE'),
--    ('APADANA_TRIBUTARY_CULTURE',       'Amount',       2);

-- 
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
--波斯LA从占领城市驻军+5忠诚变成全部城市驻军+5忠诚
--长生军变成28远程，33近战 (在DL_Units里面修改)
--波斯庭院相邻港口+1金，相邻市中心除了1金外额外+1粮
--波斯UA内商+1琴改为+2琴
--波斯、马其顿、罗马、刚果、日本、格鲁吉亚、挪威增加铁关联（4级关联，在DL_StartBias里面修改）
--城市中建造的首座波斯庭院改良设施可以提供+1点宜居度
insert or replace into Improvement_YieldChanges
    (ImprovementType,                           YieldType,          YieldChange)
values
    ('IMPROVEMENT_PAIRIDAEZA',                  'YIELD_FOOD',       0);

insert or replace into Improvement_Adjacencies 
    (ImprovementType,                           YieldChangeId)
values
    ('IMPROVEMENT_PAIRIDAEZA',                  'Pairidaeza_CityCenterAdjacency_Food'),
    ('IMPROVEMENT_PAIRIDAEZA',                  'Pairidaeza_HarborAdjacency');

insert or replace into Adjacency_YieldChanges
    (ID,                                        Description,        YieldType,      YieldChange,    AdjacentDistrict)
values
    ('Pairidaeza_CityCenterAdjacency_Food',     'Placeholder',      'YIELD_FOOD',   1,              'DISTRICT_CITY_CENTER'),
    ('Pairidaeza_HarborAdjacency',              'Placeholder',      'YIELD_GOLD',   1,              'DISTRICT_HARBOR');

update Improvements set Appeal = 2 where ImprovementType = 'IMPROVEMENT_PAIRIDAEZA';

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

insert or replace into Improvement_ValidFeatures (ImprovementType, FeatureType, PrereqTech, PrereqCivic) values
    ('IMPROVEMENT_PAIRIDAEZA', 'FEATURE_FLOODPLAINS', 'TECH_BUTTRESS', NULL),
	('IMPROVEMENT_PAIRIDAEZA', 'FEATURE_FLOODPLAINS_GRASSLAND', 'TECH_BUTTRESS', NULL),
	('IMPROVEMENT_PAIRIDAEZA', 'FEATURE_FLOODPLAINS_PLAINS', 'TECH_BUTTRESS', NULL);