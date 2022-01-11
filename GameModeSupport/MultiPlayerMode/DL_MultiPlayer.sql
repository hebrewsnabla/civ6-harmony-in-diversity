-------------------------------------
--     Multi Player Adjustment     --
-------------------------------------


-------------------------------------
--              全局               --
-------------------------------------
-- ranged unit cause 50% damage to walls instead of 75% (but -17 strength still remains)
update GlobalParameters set Value = 50 where Name = 'COMBAT_DEFENSE_DAMAGE_PERCENT_RANGED';
--宣战不扣外交点
UPDATE GlobalParameters SET Value='0' WHERE Name='FAVOR_GRIEVANCES_MINIMUM';
--海商山洞商路无额外加成
UPDATE GlobalParameters SET Value='0' WHERE Name='TRADE_ROUTE_TRANSPORTATION_EFFICIENCY_SCORE_BEST_ROUTE_TILE';
UPDATE GlobalParameters SET Value='0' WHERE Name='TRADE_ROUTE_TRANSPORTATION_EFFICIENCY_SCORE_WATER_TILE';


-------------------------------------
--              总督               --
-------------------------------------
-- 总督就位时间
update Governors set TransitionStrength = 150 ;
update Governors set TransitionStrength = 250 where GovernorType = 'GOVERNOR_THE_DEFENDER' or GovernorType = 'GOVERNOR_THE_CARDINAL' or GovernorType = 'GOVERNOR_IBRAHIM';
--维克多左1改为3
update ModifierArguments set Value = 3 where ModifierId = 'GARRISON_COMMANDER_ADJUST_CITY_COMBAT_BONUS' AND Name='Amount';


-------------------------------------
--              信条               --
-------------------------------------
--随军牧师，信仰守护
update ModifierArguments set Value = 3 where ModifierId = 'DEFENDER_OF_FAITH_COMBAT_BONUS_MODIFIER' AND Name='Amount';
update ModifierArguments set Value = 3 where ModifierId = 'ABILITY_JUST_WAR_STRENGTH' AND Name='Amount';


-------------------------------------
--              兵种               --
-------------------------------------
--造价调整
update Units set cost = cost * 1.2 where PromotionClass != 'FORMATION_CLASS_CIVILIAN';


--------------------------------------------------------------------------------------------------------------------------------------
-- 力调整
-- 法国宪兵
update Units set Combat = 55 where UnitType = 'UNIT_FRENCH_GENDARME';
update ModifierArguments set Value = 3 where ModifierId = 'PLUS_5_WHEN_ATTACKING_COMBAT_BONUS' AND Name='Amount';
-- 弩手
update Units set Combat = 30 , RangedCombat = 44 where UnitType = 'UNIT_CROSSBOWMAN';
-- 玛雅披甲
update Units set Combat = 48 where UnitType = 'UNIT_MAYAN_HOLKAN';
-- 英法线列
update Units set Combat = 68 where UnitType = 'UNIT_ENGLISH_REDCOAT';
update Units set Combat = 68 where UnitType = 'UNIT_FRENCH_GARDE_IMPERIALE';
update ModifierArguments set Value = 5 where ModifierId = 'REDCOAT_FOREIGN_COMBAT' AND Name='Amount';
update ModifierArguments set Value = 5 where ModifierId = 'GARDE_CONTINENT_COMBAT' AND Name='Amount';
-- 西班牙征服者
update ModifierArguments set Value = 5 where ModifierId = 'CONQUISTADOR_SPECIFIC_UNIT_COMBAT' AND Name='Amount';
-- 追猎及追猎UU
update Units set Combat = Combat -1 where UnitType = 'UNIT_COURSER';
update Units set Combat = Combat -1 where UnitType = 'UNIT_HUNGARY_BLACK_ARMY';
update Units set Combat = Combat -1 where UnitType = 'UNIT_RUSSIAN_DRUZHINA';
update Units set PrereqTech = 'TECH_BUTTRESS' where UnitType = 'UNIT_COURSER';
update Units set PrereqTech = 'TECH_BUTTRESS' where UnitType = 'UNIT_HUNGARY_BLACK_ARMY';
update Units set PrereqTech = 'TECH_BUTTRESS' where UnitType = 'UNIT_RUSSIAN_DRUZHINA'; 

-------------------------------------
--              文明               --
-------------------------------------
--斯基泰
delete from TraitModifiers where ModifierId = 'TRAIT_TECH_ANIMAL_HUSBANDRY' or ModifierId = 'TRAIT_PASTURE_PRODUCTION';
--祖鲁
delete from TraitModifiers where ModifierId = 'TRAIT_LAND_CORPS_COMBAT_STRENGTH' or ModifierId = 'TRAIT_LAND_ARMIES_COMBAT_STRENGTH';
update Units set PrereqTech = 'TECH_MACHINERY' where UnitType = 'UNIT_ZULU_ASSEGAI';
--高卢
update ModifierArguments set Value = 1 where ModifierId = 'AMBIORIX_NEIGHBOR_COMBAT' AND Name='Amount';
delete from DistrictModifiers where ModifierId = 'OPPIDUM_GRANT_TECH_APPRENTICESHIP' and DistrictType = 'DISTRICT_OPPIDUM';
insert or replace into DistrictModifiers
    (DistrictType,          ModifierId)
values
    ('DISTRICT_OPPIDUM',    'OPPIDUM_GRANT_TECH_METAL_CASTING');
insert or replace into Modifiers 
    (ModifierId,                               ModifierType,                                   RunOnce,    Permanent)
values
    ('OPPIDUM_GRANT_TECH_METAL_CASTING',      'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',    1,          1);
insert or replace into ModifierArguments 
    (ModifierId,                               Name,                        Value)
values
    ('OPPIDUM_GRANT_TECH_METAL_CASTING',      'TechType',                  'TECH_METAL_CASTING'),
    ('OPPIDUM_GRANT_TECH_METAL_CASTING',      'GrantTechIfBoosted',        1);
--越南
update ModifierArguments set Value = 3 where ModifierId = 'TRIEU_UNFRIENDLY_COMBAT' AND Name='Amount';
update ModifierArguments set Value = 6 where ModifierId = 'TRIEU_FRIENDLY_COMBAT' AND Name='Amount';
--玛雅
update ModifierArguments set Value = 3 where ModifierId = 'MUTAL_NEAR_CAPITAL_COMBAT' AND Name='Amount';
--巴比伦
update ModifierArguments set Value = 50 where ModifierId = 'TRAIT_EUREKA_INCREASE' AND Name='Amount';
--苏美尔
delete from TraitModifiers where ModifierId = 'TRAIT_ATTACH_ALLIANCE_COMBAT_ADJUSTMENT';
--朝鲜
update Adjacency_YieldChanges set YieldChange = 3 where Id = 'BaseDistrict_Science';
update Districts set CitizenSlots = 2 where DistrictType = 'DISTRICT_SEOWON';
update ModifierArguments set Value = 2 where ModifierId = 'HWARANG_AMENITY' AND Name='Amount';
update ModifierArguments set Value = 3 where ModifierId = 'HWARANG_HOUSING' AND Name='Amount';
--西班牙
update ModifierArguments set Value = 3 where ModifierId = 'PHILIP_II_COMBAT_BONUS_OTHER_RELIGION' AND Name='Amount';
--马普切
update ModifierArguments set Value = 5 where ModifierId = 'TRAIT_TOQUI_COMBAT_BONUS_VS_GOLDEN_AGE_CIV' AND Name='Amount';
--阿拉伯
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION' AND Name='Amount';
--澳大利亚
update ModifierArguments set Value = 50 where ModifierId = 'TRAIT_CITADELCIVILIZATION_DEFENSIVE_PRODUCTION'  AND Name='Amount';
update ModifierArguments set Value = 50 where ModifierId = 'TRAIT_CITADELCIVILIZATION_LIBERATION_PRODUCTION_XP2'  AND Name='Amount';
insert or replace into TraitModifiers 
    (TraitType,                             ModifierId)
values
    ('TRAIT_LEADER_CITADEL_CIVILIZATION',   'TRAIT_CITADELCIVILIZATION_PASTURE_FOOD');
insert or replace into Modifiers 
    (ModifierId,                                    ModifierType,                           SubjectRequirementSetId)
values
    ('TRAIT_CITADELCIVILIZATION_PASTURE_FOOD',      'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',    'PLOT_HAS_PASTURE_REQUIREMENTS');
insert or replace into ModifierArguments 
    (ModifierId,                                    Name,           Value)
values
    ('TRAIT_CITADELCIVILIZATION_PASTURE_FOOD',      'YieldType',    'YIELD_FOOD'),
    ('TRAIT_CITADELCIVILIZATION_PASTURE_FOOD',      'Amount',       1);
--马里
UPDATE ModifierArguments SET Value='-15' WHERE ModifierId='TRAIT_LESS_BUILDING_PRODUCTION' AND Name='Amount';
UPDATE ModifierArguments SET Value='-15' WHERE ModifierId='TRAIT_LESS_UNIT_PRODUCTION' AND Name='Amount';
update Adjacency_YieldChanges set YieldChange = 1 where Id = 'Holy_Site_Gold';
UPDATE ModifierArguments SET Value='-10' WHERE ModifierId='SUGUBA_CHEAPER_BUILDING_PURCHASE' AND Name='Amount';
UPDATE ModifierArguments SET Value='-10' WHERE ModifierId='SUGUBA_CHEAPER_DISTRICT_PURCHASE' AND Name='Amount';
update GlobalParameters set Value = 5 where Name = 'MALI_EXTRA_GOLD_FOR_EVERY_ERA_SCORE';
--葡萄牙
UPDATE Modifiers SET ModifierType='MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY' WHERE ModifierId='TRAIT_JOAO_TRADE_ROUTE_ON_MEET';
UPDATE ModifierArguments SET Value= 2 WHERE ModifierId='TRAIT_JOAO_TRADE_ROUTE_ON_MEET' AND Name='Amount';

--市政&科技
--远程占领区域加力
delete from CivicModifiers where ModifierId = "HD_RANGED_GARRISON_BONUS";
insert or replace into TechnologyModifiers
    (TechnologyType,                               ModifierId)
values
    ('TECH_MACHINERY',                             'HD_RANGED_GARRISON_BONUS');
--抗骑兵
delete from  TechnologyModifiers where ModifierId = "HD_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION";
insert or replace into TechnologyModifiers
    (TechnologyType,                               ModifierId)
values
    ('TECH_MILITARY_TACTICS',                             'HD_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION');
delete from  CivicModifiers where ModifierId = "HD_ANTIC_HILLS_DEFEND_BONUS";
insert or replace into CivicModifiers
    (CivicType,                                       ModifierId)
values
    ('CIVIC_MERCENARIES',                             'HD_ANTIC_HILLS_DEFEND_BONUS');
--后勤补给文本改动    
update Civics set Description = null where CivicType ='CIVIC_DEFENSIVE_TACTICS';
--重骑兵
delete from  CivicModifiers where ModifierId = "HD_HEAVYC_OPEN_AREA_STRENGTH";
insert or replace into CivicModifiers
    (CivicType,                                       ModifierId)
values
    ('CIVIC_FEUDALISM',                               'HD_HEAVYC_OPEN_AREA_STRENGTH');
--攻城单位
delete from  TechnologyModifiers where ModifierId = "HD_SIEGE_ATTACK_DISTRICT_BONUS";
insert or replace into TechnologyModifiers
    (TechnologyType,                               ModifierId)
values
    ('TECH_SIEGE_TACTICS',                      'HD_SIEGE_ATTACK_DISTRICT_BONUS');
update Technologies set Description = null where TechnologyType ='TECH_RIFLING';
update Technologies set Description = "LOC_TECH_SIEGE_TACTICS_HD_DESCRIPTION" where TechnologyType = 'TECH_SIEGE_TACTICS';
