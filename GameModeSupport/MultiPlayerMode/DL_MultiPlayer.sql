-------------------------------------
--     Multi Player Adjustment     --
-------------------------------------


-------------------------------------
--              全局               --
-------------------------------------
update GlobalParameters set Value = 0 where Name = 'HD_CITY_ROADS_REQUIRE_WHEEL';
update Technologies set Description = NULL where TechnologyType ='TECH_THE_WHEEL';
update Civics set Description = 'LOC_CIVIC_HUMANISM_HD_DESCRIPTION' where CivicType ='CIVIC_HUMANISM';
update Technologies set Description = null where TechnologyType ='TECH_RIFLING';
update Technologies set Description = 'LOC_TECH_SIEGE_TACTICS_HD_DESCRIPTION' where TechnologyType = 'TECH_SIEGE_TACTICS';

-- ranged unit cause 50% damage to walls instead of 75% (but -17 strength still remains)
update GlobalParameters set Value = 50 where Name = 'COMBAT_DEFENSE_DAMAGE_PERCENT_RANGED';
--宣战不扣外交点
UPDATE GlobalParameters SET Value='0' WHERE Name='FAVOR_GRIEVANCES_MINIMUM';
--海商山洞商路无额外加成
UPDATE GlobalParameters SET Value='0' WHERE Name='TRADE_ROUTE_TRANSPORTATION_EFFICIENCY_SCORE_BEST_ROUTE_TILE';
UPDATE GlobalParameters SET Value='0' WHERE Name='TRADE_ROUTE_TRANSPORTATION_EFFICIENCY_SCORE_WATER_TILE';
--自由探索
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_SCIENTIFIC' and ModifierId = 'COMMEMORATION_SCIENTIFIC_GA_COMMERCIAL_HUB';
delete from CommemorationModifiers where CommemorationType = 'COMMEMORATION_SCIENTIFIC' and ModifierId = 'COMMEMORATION_SCIENTIFIC_GA_HARBOR';
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
--墙
update Buildings set OuterDefenseHitPoints = 1 where BuildingType = 'BUILDING_WALLS_EARLY';
update Buildings set OuterDefenseHitPoints = 49 where BuildingType = 'BUILDING_WALLS';
update Buildings set OuterDefenseHitPoints = 75 where BuildingType = 'BUILDING_CASTLE';
update Buildings set OuterDefenseHitPoints = 75 where BuildingType = 'BUILDING_STAR_FORT';
update Buildings set OuterDefenseHitPoints = 100 where BuildingType = 'BUILDING_TSIKHE';

--结盟回调
update DiplomaticActions set InitiatorPrereqCivic = 'CIVIC_CIVIL_SERVICE' where DiplomaticActionType like 'DIPLOACTION_ALLIANCE%';
update DiplomaticActions set TargetPrereqCivic = 'CIVIC_CIVIL_SERVICE' where DiplomaticActionType like 'DIPLOACTION_ALLIANCE%';

--兵工厂给近战抗骑兵1速
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
	('BUILDING_ARMORY',	    'PVP_ARMORY_GAIN_MOVEMENT');
insert or replace into Modifiers
	(ModifierId,					ModifierType)
values
	('PVP_ARMORY_GAIN_MOVEMENT',	'MODIFIER_SINGLE_CITY_GRANT_ABILITY_FOR_TRAINED_UNITS');
update Modifiers set Permanent = 1 where ModifierId = 'PVP_ARMORY_GAIN_MOVEMENT';
insert or replace into ModifierArguments
	(ModifierId,							Name,		    Value)
values
	('PVP_ARMORY_GAIN_MOVEMENT',			'AbilityType',	'ABILITY_PVP_ARMORY_GAIN_MOVEMENT_BONUS');
insert or replace into Types
	(Type,														Kind)
values
	('ABILITY_PVP_ARMORY_GAIN_MOVEMENT_BONUS',					'KIND_ABILITY');
insert or replace into TypeTags
	(Type,															Tag)
values
	('ABILITY_PVP_ARMORY_GAIN_MOVEMENT_BONUS',				        'CLASS_ANTI_CAVALRY'),
	('ABILITY_PVP_ARMORY_GAIN_MOVEMENT_BONUS',						'CLASS_MELEE');
insert or replace into UnitAbilities (UnitAbilityType, Name, Description, Inactive) values
	('ABILITY_PVP_ARMORY_GAIN_MOVEMENT_BONUS',
	'LOC_ABILITY_PVP_ARMORY_GAIN_MOVEMENT_BONUS_NAME',
	'LOC_ABILITY_PVP_ARMORY_GAIN_MOVEMENT_BONUS_DESCRIPTION',
	1);
insert or replace into UnitAbilityModifiers
	(UnitAbilityType,										ModifierId)
values
	('ABILITY_PVP_ARMORY_GAIN_MOVEMENT_BONUS',          'ORDU_ADJUST_MOVEMENT');

-- 城市政策
update Projects set PrereqDistrict = NULL, RequiredBuilding = 'BUILDING_JNR_WAYSTATION' where
    ProjectType = 'PROJECT_CITY_POLICY_ENABLE_FREIGHT'
and exists (select BuildingType from Buildings where BuildingType = 'BUILDING_JNR_WAYSTATION');
update Projects set PrereqDistrict = NULL, RequiredBuilding = 'BUILDING_JNR_TOOLING_SHOP' where
    ProjectType = 'PROJECT_CITY_POLICY_ENABLE_FORGING_IRON'
and exists (select BuildingType from Buildings where BuildingType = 'BUILDING_JNR_TOOLING_SHOP');
delete from BuildingModifiers where BuildingType = 'BUILDING_JNR_WAYSTATION' and ModifierId = 'WAYSTATION_FREIGHT_PRODUCTION';
delete from BuildingModifiers where BuildingType = 'BUILDING_JNR_TOOLING_SHOP' and ModifierId = 'TOOLING_SHOP_FORGING_IRON_PRODUCTION';

-------------------------------------
--              总督               --
-------------------------------------
-- 总督就位时间
update Governors set TransitionStrength = 150 ;
update Governors set TransitionStrength = 250 where GovernorType = 'GOVERNOR_THE_DEFENDER' or GovernorType = 'GOVERNOR_THE_CARDINAL' or GovernorType = 'GOVERNOR_IBRAHIM';
--维克多左1改为3
update ModifierArguments set Value = 3 where ModifierId = 'GARRISON_COMMANDER_ADJUST_CITY_COMBAT_BONUS' AND Name='Amount';
--平回调
update ModifierArguments set Value = 1 where (ModifierId = 'RESEARCHER_SCIENCE_CITIZEN' or ModifierId = 'CONNOISSEUR_CULTURE_CITIZEN') and Name = 'Amount';
update ModifierArguments set Value = 15 where (ModifierId = 'LIBRARIAN_CULTURE_YIELD_BONUS' or ModifierId = 'LIBRARIAN_SCIENCE_YIELD_BONUS') and Name = 'Amount';

-------------------------------------
--              信条               --
-------------------------------------
--随军牧师，信仰守护
update ModifierArguments set Value = 3 where ModifierId = 'DEFENDER_OF_FAITH_COMBAT_BONUS_MODIFIER' AND Name='Amount';
update ModifierArguments set Value = 3 where ModifierId = 'ABILITY_JUST_WAR_STRENGTH' AND Name='Amount';


-------------------------------------
--              兵种               --
-------------------------------------
-- 弩手
update Units set Combat = 30 , RangedCombat = 44 where UnitType = 'UNIT_CROSSBOWMAN';
-- 追猎及追猎UU
update Units set Combat = Combat -1 where UnitType = 'UNIT_COURSER';
update Units set PrereqTech = 'TECH_BUTTRESS' where UnitType = 'UNIT_COURSER';
--线列改膛线
update Units set Cost = 240 , PrereqTech = 'TECH_RIFLING' where UnitType = 'UNIT_CUIRASSIER';
update Units set Cost = 270 , PrereqTech = 'TECH_RIFLING' where UnitType = 'UNIT_AMERICAN_ROUGH_RIDER';
update Units set PrereqTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_RANGER';
update Units set PrereqTech = 'TECH_BALLISTICS' where UnitType = 'UNIT_SCOTTISH_HIGHLANDER';

-------------------------------------
--              文明               --
-------------------------------------
------------------------------------------------------------------------------------------------------------------------------------
--阿拉伯
--UA
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_SCIENCE_PER_FOREIGN_CITY_FOLLOWING_RELIGION' AND Name = 'Amount';
--骆驼骑手
update Units set Combat = 25 , RangedCombat = 38 , BaseMoves = 3 where UnitType = 'UNIT_ARABIAN_CAMEL_ARCHER';

------------------------------------------------------------------------------------------------------------------------------------
--阿兹特克
--LA(献祭待改)

--UU
update Units set Combat = 35 where UnitType = 'UNIT_AZTEC_EAGLE_WARRIOR';
update Units set Combat = 35 where UnitType = 'UNIT_AZTEC_JAGUAR';

------------------------------------------------------------------------------------------------------------------------------------
--埃及
--UU
update Units set Combat = 35 where UnitType = 'UNIT_EGYPTIAN_KHOPESH';
update ModifierArguments set Value = 5 where ModifierId = 'HD_BATTLECRY_BONUS' AND Name='Amount';
update Units set Cost = 60 where UnitType = 'UNIT_AZTEC_JAGUAR';

------------------------------------------------------------------------------------------------------------------------------------
--埃塞
--UU
update Units set PrereqTech = 'TECH_BUTTRESS' where UnitType = 'UNIT_ETHIOPIAN_OROMO_CAVALRY'; 
update Units set Combat = Combat -1 where UnitType = 'UNIT_ETHIOPIAN_OROMO_CAVALRY';

------------------------------------------------------------------------------------------------------------------------------------
--奥斯曼
--大维齐尔
update ModifierArguments set Value = 3 where ModifierId = 'GRAND_VISIER_ALLIANCE_COMBAT_STRENGTH_MODIFIER'  AND Name='Amount';
--西帕希
update Units set Combat = 52 where UnitType = 'UNIT_OTTOMAN_SIPAHI';
--苏丹亲兵
delete from UnitReplaces where CivUniqueUnitType = 'UNIT_SULEIMAN_JANISSARY';

------------------------------------------------------------------------------------------------------------------------------------
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
--矿工军团
update ModifierArguments set Value = 0 where ModifierId = 'DIGGER_BONUS_ON_COAST' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--巴比伦
update ModifierArguments set Value = 35 where ModifierId = 'TRAIT_EUREKA_INCREASE' AND Name='Amount';
update ModifierArguments set Value = -30 where ModifierId = 'TRAIT_SCIENCE_DECREASE' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--巴西

------------------------------------------------------------------------------------------------------------------------------------
--拜占庭
update ModifierArguments set Value = 2 where ModifierId = 'BYZANTIUM_COMBAT_HOLY_CITIES' AND Name = 'Amount';
update Units set Combat = 30 where UnitType = 'UNIT_BYZANTINE_DROMON';
delete from Typetags where Type = 'ABILITY_DROMON' and Tag = 'CLASS_DROMON';
update Units set Combat = 55 where UnitType = 'UNIT_BYZANTINE_TAGMA';

------------------------------------------------------------------------------------------------------------------------------------
--波兰

------------------------------------------------------------------------------------------------------------------------------------
--波斯
--长生军
update Units set Combat = 38 where UnitType = 'UNIT_PERSIAN_IMMORTAL';
update Units set RangedCombat = 30 where UnitType = 'UNIT_PERSIAN_IMMORTAL';
update Units set Range = 1 where UnitType = 'UNIT_PERSIAN_IMMORTAL';

------------------------------------------------------------------------------------------------------------------------------------
--朝鲜
update Adjacency_YieldChanges set YieldChange = 3 where Id = 'BaseDistrict_Science';
update Districts set CitizenSlots = 2 where DistrictType = 'DISTRICT_SEOWON';
update ModifierArguments set Value = 2 where ModifierId = 'HWARANG_AMENITY' AND Name='Amount';
update ModifierArguments set Value = 3 where ModifierId = 'HWARANG_HOUSING' AND Name='Amount';
delete from TraitModifiers where ModifierId = 'CAPITAL_LIBRARY_TITLE';
delete from TraitModifiers where ModifierId = 'CAPITAL_UNIVERSITY_TITLE';
delete from TraitModifiers where ModifierId = 'CAPITAL_RESERCHLAB_TITLE';
delete from TraitModifiers where ModifierId = 'CAPITAL_CAMPUS_TIER4_TITLE';

------------------------------------------------------------------------------------------------------------------------------------
--大哥
update TypeTags set Tag = 'CLASS_SETTLER' where Type = 'ABILITY_EJERCITO_PATRIOTA_EXTRA_MOVEMENT';
insert or replace into TypeTags 
    (Type,                                          Tag)
values
    ('ABILITY_EJERCITO_PATRIOTA_EXTRA_MOVEMENT',    'CLASS_BUILDER');
update ModifierArguments set Value = 3 where ModifierId = 'COMANDANTE_AOE_STRENGTH' AND Name='Amount';
update ModifierArguments set Value = 2 where ModifierId = 'COMMANDANTE_CAVALRY_BUFF' AND Name='Amount';
update ModifierArguments set Value = 5 where ModifierId = 'COMMANDANTE_UNIT_STRENGTH_BUFF' AND Name='Amount';


------------------------------------------------------------------------------------------------------------------------------------
--德国

------------------------------------------------------------------------------------------------------------------------------------
--毛子
--公国骑兵
update Units set PrereqTech = 'TECH_BUTTRESS' where UnitType = 'UNIT_RUSSIAN_DRUZHINA'; 
update Units set Combat = Combat -1 where UnitType = 'UNIT_RUSSIAN_DRUZHINA';

------------------------------------------------------------------------------------------------------------------------------------
--法国
--宪兵
update Units set Combat = 55 where UnitType = 'UNIT_FRENCH_GENDARME';
update ModifierArguments set Value = 3 where ModifierId = 'PLUS_5_WHEN_ATTACKING_COMBAT_BONUS' AND Name='Amount';
--帝国卫队
update Units set Combat = 68 where UnitType = 'UNIT_FRENCH_GARDE_IMPERIALE';
update ModifierArguments set Value = 5 where ModifierId = 'GARDE_CONTINENT_COMBAT' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--腓尼基

------------------------------------------------------------------------------------------------------------------------------------
--刚果

------------------------------------------------------------------------------------------------------------------------------------
--高卢
update ModifierArguments set Value = 1 where ModifierId = 'AMBIORIX_NEIGHBOR_COMBAT' AND Name='Amount';
delete from DistrictModifiers where ModifierId = 'OPPIDUM_GRANT_TECH_APPRENTICESHIP' and DistrictType = 'DISTRICT_OPPIDUM';
delete from TraitModifiers where ModifierId = 'TRAIT_GRANT_CULTURE_UNIT_TRAINED';

-- insert or replace into DistrictModifiers
--     (DistrictType,          ModifierId)
-- values
--     ('DISTRICT_OPPIDUM',    'OPPIDUM_GRANT_TECH_METAL_CASTING');
-- insert or replace into Modifiers 
--     (ModifierId,                               ModifierType,                                   RunOnce,    Permanent)
-- values
--     ('OPPIDUM_GRANT_TECH_METAL_CASTING',      'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST',    1,          1);
-- insert or replace into ModifierArguments 
--     (ModifierId,                               Name,                        Value)
-- values
--     ('OPPIDUM_GRANT_TECH_METAL_CASTING',      'TechType',                  'TECH_METAL_CASTING'),
--     ('OPPIDUM_GRANT_TECH_METAL_CASTING',      'GrantTechIfBoosted',        1);
--高卢战车
update Units set Combat = 30 where UnitType = 'UNIT_GAUL_CARRUS';

------------------------------------------------------------------------------------------------------------------------------------
--高棉
--独木战船
update Units set Combat = 35 where UnitType = 'UNIT_KHMER_WAR_CANOE';
--高棉战象
update Units set Bombard = 45 where UnitType = 'UNIT_KHMER_DOMREY';
insert or replace into TypeTags
    (Type,                                              Tag)
values
    ('ABILITY_COMBAT_STRENGTH_BONUS_TO_LAND_COMBAT',    'CLASS_DOMREY'),
    ('UNIT_KHMER_DOMREY',                               'CLASS_DOMREY');
insert or replace into Tags
    (Tag,               Vocabulary)
values
    ('CLASS_DOMREY',    'ABILITY_CLASS');

------------------------------------------------------------------------------------------------------------------------------------
--格鲁吉亚
--塔兹卢利骑兵
update Units set Combat = 52 where UnitType = 'UNIT_GEORGIAN_TADZREULI';
update ModifierArguments set Value = 5 where ModifierId = 'KHEVSURETI_HILLS_BUFF' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--荷兰
--公民卫队
update Units set StrategicResource = null where UnitType = 'UNIT_DUTCH_SCHUTTERIJ';
update ModifierArguments set Value = 7 where ModifierId = 'PLUS_10_WHEN_DEFENDING_DISTRICT_BONUS' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--加拿大

------------------------------------------------------------------------------------------------------------------------------------
--克里
delete from TraitModifiers where ModifierId = 'TRAIT_STATE_WORKFORCE_TRADE_ROUTE';
delete from TraitModifiers where ModifierId = 'TRAIT_STATE_WORKFORCE_ADD_TRADER';

------------------------------------------------------------------------------------------------------------------------------------
--罗马
--弩炮
update Units set Bombard = 35 where UnitType = 'UNIT_ROMAN_ONAGER';
insert or replace into Types
    (Type,                                              Kind)
values
    ('ABILITY_COMBAT_STRENGTH_BONUS_TO_LAND_COMBAT',    'KIND_ABILITY');
insert or replace into TypeTags
    (Type,                                              Tag)
select
    'ABILITY_COMBAT_STRENGTH_BONUS_TO_LAND_COMBAT',    'CLASS_ROMAN_ONAGER'
from Units where UnitType = 'UNIT_ROMAN_ONAGER';
insert or replace into UnitAbilities
    (UnitAbilityType,                                   Name,    Description,                                                        Permanent)
values
    ('ABILITY_COMBAT_STRENGTH_BONUS_TO_LAND_COMBAT',    null,    'LOC_ABILITY_COMBAT_STRENGTH_BONUS_TO_LAND_COMBAT_DESCRIPTION',     1);
insert or ignore into UnitAbilityModifiers
    (UnitAbilityType,                                   ModifierId)
values
    ('ABILITY_COMBAT_STRENGTH_BONUS_TO_LAND_COMBAT',    'MOD_ABILITY_COMBAT_STRENGTH_BONUS_TO_LAND_COMBAT');
insert or replace into Modifiers
    (ModifierId,                                        ModifierType,                           SubjectRequirementSetId)
values
    ('MOD_ABILITY_COMBAT_STRENGTH_BONUS_TO_LAND_COMBAT','MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH','GRAPE_SHOT_REQUIREMENTS');
insert or replace into ModifierArguments
    (ModifierId,                                        Name,                           Value)
values
    ('MOD_ABILITY_COMBAT_STRENGTH_BONUS_TO_LAND_COMBAT','Amount',                       17);

------------------------------------------------------------------------------------------------------------------------------------
--马里
UPDATE ModifierArguments SET Value='-15' WHERE ModifierId='TRAIT_LESS_BUILDING_PRODUCTION' AND Name='Amount';
UPDATE ModifierArguments SET Value='-15' WHERE ModifierId='TRAIT_LESS_UNIT_PRODUCTION' AND Name='Amount';
update Adjacency_YieldChanges set YieldChange = 1 where Id = 'Holy_Site_Gold';
UPDATE ModifierArguments SET Value='-10' WHERE ModifierId='SUGUBA_CHEAPER_BUILDING_PURCHASE' AND Name='Amount';
UPDATE ModifierArguments SET Value='-10' WHERE ModifierId='SUGUBA_CHEAPER_DISTRICT_PURCHASE' AND Name='Amount';
update GlobalParameters set Value = 5 where Name = 'MALI_EXTRA_GOLD_FOR_EVERY_ERA_SCORE';
--曼德鲁卡
update Units set Combat = 55 where UnitType = 'UNIT_MALI_MANDEKALU_CAVALRY';
--奴隶射手

------------------------------------------------------------------------------------------------------------------------------------
--马普切
update ModifierArguments set Value = 5 where ModifierId = 'TRAIT_TOQUI_COMBAT_BONUS_VS_GOLDEN_AGE_CIV' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--马其顿
update Units set Combat = 25 , Cost = 50 where UnitType = 'UNIT_MACEDONIAN_PEZHETAIROS';
update Units set Combat = 38 , Cost = 80 where UnitType = 'UNIT_MACEDONIAN_HETAIROI';
delete from UnitAbilityModifiers where ModifierId = 'HETAIROI_GREAT_GENERAL_POINTS';

------------------------------------------------------------------------------------------------------------------------------------
--玛雅
update ModifierArguments set Value = 3 where ModifierId = 'MUTAL_NEAR_CAPITAL_COMBAT' AND Name = 'Amount';
--黑曜石
update Units set Combat = 48 where UnitType = 'UNIT_MAYAN_HOLKAN';

------------------------------------------------------------------------------------------------------------------------------------
--毛利
--UA
delete from TraitModifiers where ModifierId = 'TRAIT_MAORI_MANA_SHIPBUILDING';
delete from TraitModifiers where ModifierId = 'TRAIT_MAORI_FISHING_BOAT_FOOD';

--托阿，托塔帕拉
update Units set Combat = 38 where UnitType = 'UNIT_MAORI_TOA';
update Units set RangedCombat = 50 where UnitType = 'UNIT_MAORI_TUPARA';

------------------------------------------------------------------------------------------------------------------------------------
--美国
--莽骑兵
update ModifierArguments set Value = 5 where ModifierId = 'ROUGH_RIDER_BONUS_ON_HILLS' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--蒙古
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_EACH_DIPLO_VISIBILITY_COMBAT_MODIFIER';
--怯薛
update Units set Combat = 20 , RangedCombat = 30 , BaseMoves = 4 where UnitType = 'UNIT_MONGOLIAN_KESHIG';

------------------------------------------------------------------------------------------------------------------------------------
--努比亚

------------------------------------------------------------------------------------------------------------------------------------
--挪威
--符文牧师
update Units set BaseMoves = 4 where UnitType = 'UNIT_NORWEGIAN_ULFHEDNAR';
--狂暴武士
update Units set Combat = 45 where UnitType = 'UNIT_NORWEGIAN_BERSERKER';
update ModifierArguments set Value = 7 where ModifierId = 'UNIT_STRONG_WHEN_ATTACKING' AND Name='Amount';
update ModifierArguments set Value = -3 where ModifierId = 'UNIT_WEAK_WHEN_DEFENDING' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--葡萄牙
UPDATE Modifiers SET ModifierType='MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY' WHERE ModifierId='TRAIT_JOAO_TRADE_ROUTE_ON_MEET';
UPDATE ModifierArguments SET Value= 4 WHERE ModifierId='TRAIT_JOAO_TRADE_ROUTE_ON_MEET' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--日本

------------------------------------------------------------------------------------------------------------------------------------
--瑞典


------------------------------------------------------------------------------------------------------------------------------------
--斯基泰
delete from TraitModifiers where ModifierId = 'TRAIT_EXTRALIGHTCAVALRY';
delete from TraitModifiers where ModifierId = 'TRAIT_EXTRASAKAHORSEARCHER';
delete from TraitModifiers where ModifierId = 'TRAIT_TECH_ANIMAL_HUSBANDRY';
delete from TraitModifiers where ModifierId = 'TRAIT_EXTRA_SCYTHIAN_AMAZON';
update ModifierArguments set Value = 3 where ModifierId = 'TOMYRIS_BONUS_VS_WOUNDED_UNITS' AND Name = 'Amount';
update ModifierArguments set Value = 10 where ModifierId = 'TOMYRIS_HEAL_AFTER_DEFEATING_UNIT' AND Name = 'Amount';
update Modifiers set SubjectRequirementSetId = 'PVP_SCYTHIA_PASTURE_PRODUCTION_REQUIRES' where ModifierId = 'TRAIT_PASTURE_PRODUCTION';
insert or ignore into RequirementSets
	(RequirementSetId,												RequirementSetType)
values
	('PVP_SCYTHIA_PASTURE_PRODUCTION_REQUIRES',						'REQUIREMENTSET_TEST_ALL');
insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
values
	('PVP_SCYTHIA_PASTURE_PRODUCTION_REQUIRES',						'REQUIRES_PLOT_HAS_PASTURE'),
    ('PVP_SCYTHIA_PASTURE_PRODUCTION_REQUIRES',						'HD_REQUIRES_PLAYER_HAS_TECH_HORSEBACK_RIDING');
insert or replace into TraitModifiers(TraitType,	ModifierId)
select 'TRAIT_CIVILIZATION_EXTRA_LIGHT_CAVALRY','TRAIT_'||EraType||'_RANGED_UNIT_PRODUCTION' from Eras;
insert or replace into Modifiers(ModifierId,ModifierType)
select 'TRAIT_'||EraType||'_RANGED_UNIT_PRODUCTION','MODIFIER_PLAYER_CITIES_ADJUST_UNIT_TAG_ERA_PRODUCTION' from Eras;
insert or replace into ModifierArguments(ModifierId,Name,Value)
select 'TRAIT_'||EraType||'_RANGED_UNIT_PRODUCTION','UnitPromotionClass','PROMOTION_CLASS_LIGHT_CAVALRY' from Eras;
insert or replace into ModifierArguments(ModifierId,Name,Value)
select 'TRAIT_'||EraType||'_RANGED_UNIT_PRODUCTION','EraType',EraType from Eras;
insert or replace into ModifierArguments(ModifierId,Name,Value)
select 'TRAIT_'||EraType||'_RANGED_UNIT_PRODUCTION','Amount',50 from Eras;
--萨卡弓骑
update Units set Combat = 15 , RangedCombat = 25 , Range = 1 where UnitType = 'UNIT_SCYTHIAN_HORSE_ARCHER';

------------------------------------------------------------------------------------------------------------------------------------
--苏格兰

------------------------------------------------------------------------------------------------------------------------------------
--苏美尔
delete from TraitModifiers where ModifierId = 'TRAIT_ATTACH_ALLIANCE_COMBAT_ADJUSTMENT';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_ADJUST_JOINTWAR_EXPERIENCE' AND Name='Range';
update ModifierArguments set Value = 2 where ModifierId = 'TRAIT_ADJUST_JOINTWAR_PLUNDER' AND Name='Range';
--铜盾方阵
update Units set BaseMoves = 3 where UnitType = 'UNIT_SUMERIAN_PHALANX';
--驴车
update Units set PrereqTech = 'TECH_THE_WHEEL' where UnitType = 'UNIT_SUMERIAN_WAR_CART';

------------------------------------------------------------------------------------------------------------------------------------
--希腊
update ModifierArguments set Value = 5 where ModifierId = 'PELTAST_NEIGHBOR_COMBAT_HD_MODIFIER' AND Name='Amount';
update ModifierArguments set Value = 7 where ModifierId = 'HOPLITE_NEIGHBOR_COMBAT' AND Name='Amount';
update Units set Cost = 50 where UnitType = 'UNIT_GREEK_HOPLITE';
delete from TraitModifiers where ModifierId = 'UNIQUE_LEADER_CULTURE_KILLS';
update TraitModifiers set TraitType = 'TRAIT_CIVILIZATION_PLATOS_REPUBLIC' where ModifierId = 'ACROPOLIS_DUPLICATE_FIRST_INFLUENCE_TOKEN';
update TraitModifiers set TraitType = 'TRAIT_LEADER_SURROUNDED_BY_GLORY' where ModifierId = 'TRAIT_WILDCARD_GOVERNMENT_SLOT';

------------------------------------------------------------------------------------------------------------------------------------
--西班牙
update ModifierArguments set Value = 3 where ModifierId = 'PHILIP_II_COMBAT_BONUS_OTHER_RELIGION' AND Name='Amount';
-- 征服者
update Units set Combat = 55 where UnitType = 'UNIT_SPANISH_CONQUISTADOR';
update ModifierArguments set Value = 5 where ModifierId = 'CONQUISTADOR_SPECIFIC_UNIT_COMBAT' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--匈牙利
--骠骑
update Units set Combat = Combat -4 where UnitType = 'UNIT_HUNGARY_BLACK_ARMY';
update Units set PrereqTech = 'TECH_BUTTRESS' where UnitType = 'UNIT_HUNGARY_BLACK_ARMY';
update ModifierArguments set Value = 3 where ModifierId = 'LEVY_MILITARY_TWO_FREE_ENVOYS' AND Name='Amount';

------------------------------------------------------------------------------------------------------------------------------------
--印度
update Units set Maintenance = 0 where UnitType = 'UNIT_INDIAN_SEPOY';
insert or replace into TraitModifiers
    (TraitType,                               ModifierId)
values
    ('TRAIT_LEADER_ARTHASHASTRA',             'PVP_FRIENDLY_MOVEMENT_BONUS');
insert or replace into Modifiers
	(ModifierId,							ModifierType)
values
	('PVP_FRIENDLY_MOVEMENT_BONUS',			'MODIFIER_PLAYER_UNITS_ADJUST_FRIENDLY_TERRITORY_START_MOVEMENT');
insert or replace into ModifierArguments
	(ModifierId,					Name,						Value)
values
	('PVP_FRIENDLY_MOVEMENT_BONUS',		'Amount',				2);
--文印度
update Modifiers set SubjectRequirementSetId = NULL where ModifierId = 'PEACE_ADDGROWTH';

------------------------------------------------------------------------------------------------------------------------------------
--印度尼西亚
--克里斯
update Units set Combat = 42 where UnitType = 'UNIT_INDONESIAN_KRIS_SWORDSMAN';

------------------------------------------------------------------------------------------------------------------------------------
--印加

------------------------------------------------------------------------------------------------------------------------------------
--英国
--红衫军
update Units set Combat = 68 where UnitType = 'UNIT_ENGLISH_REDCOAT';
update ModifierArguments set Value = 5 where ModifierId = 'REDCOAT_FOREIGN_COMBAT' AND Name='Amount';
------------------------------------------------------------------------------------------------------------------------------------
--越南
delete from UnitAbilityModifiers where ModifierId = 'TRIEU_FRIENDLY_COMBAT';
delete from UnitAbilityModifiers where ModifierId = 'TRIEU_UNFRIENDLY_MOVEMENT';
delete from UnitAbilityModifiers where ModifierId = 'TRIEU_UNFRIENDLY_COMBAT';
-- update Districts set RequiresPopulation = 1 where UnitType = 'DISTRICT_THANH';
update ModifierArguments set Value = 1 where ModifierId = 'TRIEU_FRIENDLY_MOVEMENT' AND Name = 'Amount';
--越南象兵
update Units set Combat = 30 , RangedCombat = 35 , BaseMoves = 2 where UnitType = 'UNIT_VIETNAMESE_VOI_CHIEN';

------------------------------------------------------------------------------------------------------------------------------------
--中国
update Adjacency_YieldChanges set YieldType = 'YIELD_GOLD' where ID = 'GreatWall_Culture';
update Adjacency_YieldChanges set YieldType = 'YIELD_CULTURE' where ID = 'GreatWall_Gold';
--诸葛连弩
update Units set Combat = 25 , RangedCombat = 35 where UnitType = 'UNIT_CHINESE_CHOKONU';
--虎蹲炮
update Units set Combat = 40 , RangedCombat = 52 where UnitType = 'UNIT_CHINESE_CROUCHING_TIGER';

------------------------------------------------------------------------------------------------------------------------------------
--祖鲁
delete from TraitModifiers where ModifierId = 'TRAIT_LAND_CORPS_EARLY' or ModifierId = 'TRAIT_LAND_ARMIES_EARLY';
delete from TraitModifiers where ModifierId = 'HD_IKANDA_CULTURE_BOMB';
update Units set PrereqTech = 'TECH_MACHINERY' where UnitType = 'UNIT_ZULU_ASSEGAI';
update ModifierArguments set Value = 3 where ModifierId = 'TRAIT_LAND_CORPS_COMBAT_STRENGTH' AND Name = 'Amount';
update ModifierArguments set Value = 3 where ModifierId = 'TRAIT_LAND_ARMIES_COMBAT_STRENGTH' AND Name = 'Amount';
update ModifierArguments set Value = 1 where ModifierId = 'HD_IKANDA_SCIENCE' AND Name = 'Amount';
update Units set Combat = 43 where UnitType = 'UNIT_ZULU_IMPI';

-------------------------------------
--           市政&科技             --
-------------------------------------
--远程
--占领区域加力
delete from CivicModifiers where ModifierId = 'HD_RANGED_GARRISON_BONUS';
insert or replace into TechnologyModifiers
    (TechnologyType,                               ModifierId)
values
    ('TECH_MACHINERY',                             'HD_RANGED_GARRISON_BONUS');
--境内进攻5力
delete from TechnologyModifiers where ModifierId = 'HD_RANGED_HILLS_STRENGTH';
insert or replace into CivicModifiers
    (CivicType,                               ModifierId)
values
    ('CIVIC_HUMANISM',                        'HD_RANGED_ATTACK_BONUS');
insert or replace into Modifiers
	(ModifierId,							ModifierType)
values
	('HD_RANGED_ATTACK_BONUS',				'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');
insert or replace into ModifierArguments
	(ModifierId,					Name,						Value)
values
	('HD_RANGED_ATTACK_BONUS',		'AbilityType',				'ABILITY_HD_RANGED_ATTACK_BONUS');
insert or replace into Types
    (Type,                                                      Kind)
values
    ('ABILITY_HD_RANGED_ATTACK_BONUS',                          'KIND_ABILITY');
insert or replace into TypeTags
    (Type,                                                      Tag)
values
    ('ABILITY_HD_RANGED_ATTACK_BONUS',                          'CLASS_RANGED');
insert or replace into UnitAbilities 
    (UnitAbilityType,                                           Name,   Description,                                                            Inactive) 
values
    ('ABILITY_HD_RANGED_ATTACK_BONUS',                          NULL,   'LOC_ABILITY_HD_RANGED_ATTACK_BONUS_DESCRIPTION',                       1);
insert or ignore into UnitAbilityModifiers
    (UnitAbilityType,                                           ModifierId)
values
    ('ABILITY_HD_RANGED_ATTACK_BONUS',                        'ABILITY_HD_RANGED_ATTACK_BONUS_MODIFIER');
insert or replace into Modifiers
    (ModifierId,                                         ModifierType,                           OwnerRequirementSetId,                                     SubjectRequirementSetId)
values
    ('ABILITY_HD_RANGED_ATTACK_BONUS_MODIFIER',        'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',   'HD_UNIT_IN_FRIENDLY_TERRITORY_DEFENCE_REQUIREMENTS',      'HD_RANGED_ATTACK_BONUS_REQUIREMENTS');
insert or replace into ModifierArguments
	(ModifierId,					                Name,						Value)
values
	('ABILITY_HD_RANGED_ATTACK_BONUS_MODIFIER',		'Amount',				    5);
insert or ignore into RequirementSets
	(RequirementSetId,												RequirementSetType)
values
	('HD_RANGED_ATTACK_BONUS_REQUIREMENTS',							'REQUIREMENTSET_TEST_ALL');
insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
values
	('HD_RANGED_ATTACK_BONUS_REQUIREMENTS',							'PLAYER_IS_ATTACKER_REQUIREMENTS');


--抗骑兵
delete from  TechnologyModifiers where ModifierId = 'HD_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION';
insert or replace into TechnologyModifiers
    (TechnologyType,                               ModifierId)
values
    ('TECH_MILITARY_TACTICS',                             'HD_ANTIC_IGNORE_DAMAGED_STRENGTH_REDUCTION');
delete from  CivicModifiers where ModifierId = 'HD_ANTIC_HILLS_DEFEND_BONUS';
insert or replace into CivicModifiers
    (CivicType,                                       ModifierId)
values
    ('CIVIC_MERCENARIES',                             'HD_ANTIC_HILLS_DEFEND_BONUS');
--后勤补给文本改动    
update Civics set Description = null where CivicType ='CIVIC_DEFENSIVE_TACTICS';


--重骑兵
--封建打伤兵5力
update CivicModifiers set CivicType = 'CIVIC_FEUDALISM' where ModifierId ='HD_HEAVYC_OPEN_AREA_STRENGTH';

-- insert or replace into CivicModifiers
--     (CivicType,                                       ModifierId)
-- values
--     ('CIVIC_FEUDALISM',                             'HD_HEAVYC_HEAL_AFTER_KILL');
--火药光环2力
delete from  TechnologyModifiers where ModifierId = 'HD_HEAVYC_HEAL_AFTER_KILL';
insert or replace into TechnologyModifiers
    (TechnologyType,                               ModifierId)
values
    ('TECH_GUNPOWDER',                             'HD_HC_AOE_STRENGRH');
insert or replace into Modifiers
	(ModifierId,							ModifierType)
values
	('HD_HC_AOE_STRENGRH',			        'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');
insert or replace into ModifierArguments
	(ModifierId,					Name,						Value)
values
	('HD_HC_AOE_STRENGRH',		    'AbilityType',				'ABILITY_TAGMA');
update TypeTags set Tag = 'CLASS_HEAVY_CAVALRY' where Type = 'ABILITY_TAGMA';
update ModifierArguments set Value = 2 where ModifierId = 'TAGMA_COMBAT_STRENGTH' AND Name = 'Amount';
update RequirementArguments set Value = 'CLASS_HEAVY_CAVALRY' where RequirementId = 'REQUIRES_UNIT_IS_NOTCENTER_ADJACENT_TAGMA' AND Name = 'Tag';
update UnitAbilities set Inactive = 1 where UnitAbilityType = 'ABILITY_TAGMA';

--轻骑兵
--雇佣兵市政调整
insert or replace into Modifiers
	(ModifierId,							ModifierType,                               SubjectRequirementSetId)
values
	('HD_ENEMY_MOVEMENT',			        'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH',     'BERSERKER_PLOT_IS_ENEMY_TERRITORY');
insert or replace into ModifierArguments
	(ModifierId,					Name,						Value)
values
	('HD_ENEMY_MOVEMENT',		    'Amount',				    3);
update CivicModifiers set CivicType = 'CIVIC_MILITARY_TRAINING' where ModifierId = 'HD_ENEMY_MOVEMENT';
update TechnologyModifiers set TechnologyType = 'TECH_MILITARY_TACTICS' where ModifierId = 'HD_LIGHTC_AGAINST_UNIT_BONUS';


--升级调整（文本√）
delete from UnitPromotionPrereqs where UnitPromotion = 'PROMOTION_LIGHTC_MILITANT' or UnitPromotion = 'PROMOTION_LIGHTC_MOBILE_WARFARE';
delete from UnitPromotionPrereqs where PrereqUnitPromotion = 'PROMOTION_LIGHTC_MILITANT' or PrereqUnitPromotion = 'PROMOTION_LIGHTC_MOBILE_WARFARE';
insert or replace into UnitPromotionPrereqs
	(UnitPromotion,					    PrereqUnitPromotion)
values
    ('PROMOTION_LIGHTC_MOBILE_WARFARE',	'PROMOTION_DEPREDATION'),
	('PROMOTION_LIGHTC_MILITANT',	'PROMOTION_LIGHTC_MOBILE_WARFARE'),
	('PROMOTION_PURSUIT',	'PROMOTION_LIGHTC_MOBILE_WARFARE'),
	('PROMOTION_LIGHTC_MILITANT',	'PROMOTION_LIGHTC_SHOCK'),
	('PROMOTION_ESCORT_MOBILITY',	'PROMOTION_LIGHTC_MILITANT');
update UnitPromotions set Level = 2 where UnitPromotionType = 'PROMOTION_LIGHTC_MOBILE_WARFARE';
update UnitPromotions set Level = 3 where UnitPromotionType = 'PROMOTION_LIGHTC_MILITANT';
update ModifierArguments set Value = 7 where ModifierId = 'PROMOTION_LIGHTC_MILITANT';


--攻城单位
--膛线改攻城（文本√）
delete from  TechnologyModifiers where ModifierId = 'HD_SIEGE_ATTACK_DISTRICT_BONUS';
insert or replace into TechnologyModifiers
    (TechnologyType,                               ModifierId)
values
    ('TECH_SIEGE_TACTICS',                      'HD_SIEGE_ATTACK_DISTRICT_BONUS');
--封建友好2速（文本√）
update CivicModifiers set CivicType = 'CIVIC_FEUDALISM' where ModifierId = 'HD_SIEGE_ATTACK_AFTER_MOVE';
update Modifiers set ModifierType = 'MODIFIER_PLAYER_UNITS_ADJUST_FRIENDLY_TERRITORY_START_MOVEMENT' , SubjectRequirementSetId = 'HD_UNIT_IS_SEIGE_REQUIREMENTS' where ModifierId = 'HD_ATTACK_AFTER_MOVE';
update ModifierArguments set Name = 'Amount' , Value = 2 where ModifierId = 'HD_ATTACK_AFTER_MOVE';
insert or ignore into RequirementSets
	(RequirementSetId,												RequirementSetType)
values
	('HD_UNIT_IS_SEIGE_REQUIREMENTS',							'REQUIREMENTSET_TEST_ANY');
insert or ignore into RequirementSetRequirements
	(RequirementSetId,												RequirementId)
values
	('HD_UNIT_IS_SEIGE_REQUIREMENTS',							'HD_REQUIRES_UNIT_IS_PROMOTION_CLASS_SIEGE');

--侦查单位
--无视zoc移到雇佣兵
update CivicModifiers set CivicType = 'CIVIC_MERCENARIES' where ModifierId = 'HD_RECON_IGNORE_ZOC';


insert or ignore into UnitAbilityModifiers
    (UnitAbilityType,                                           ModifierId)
values
    ('ABILITY_LIGHTC_ENEMY_MOVEMENT_HD',                        'HD_ENEMY_MOVEMENT');
--兵种造价增幅
update Units set cost = cost * 1.2 where PromotionClass != 'FORMATION_CLASS_CIVILIAN';
