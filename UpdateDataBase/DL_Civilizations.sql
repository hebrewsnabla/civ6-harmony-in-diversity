-------------------------------------
--     Civilization Adjustment     --
-------------------------------------

-- Babylon
update ModifierArguments set Value = 59 where ModifierId = 'TRAIT_EUREKA_INCREASE';

-- Maori
delete from TraitModifiers where TraitType = 'TRAIT_CIVILIZATION_MAORI_MANA' and ModifierId = 'TRAIT_MAORI_PREVENT_HARVEST';

insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE'),
	('TRAIT_CIVILIZATION_MAORI_MANA', 'TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE')
;

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) values
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_JUNGLE_CIVIL_SERVICE_REQUIREMENTS'),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'PLOT_HAS_FOREST_CIVIL_SERVICE_REQUIREMENTS')
;

insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 'YieldType', 'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_RAINFOREST_CIVIL_SERVICE', 'Amount', 1),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 'YieldType', 'YIELD_PRODUCTION'),
	('TRAIT_MAORI_PRODUCTION_WOODS_CIVIL_SERVICE', 'Amount', 1)
;

update ModifierArguments set Value = 1 where
	ModifierId = 'TRAIT_MAORI_PRODUCTION_RAINFOREST_CONSERVATION' and Name = 'Amount';
update ModifierArguments set Value = 1 where
	ModifierId = 'TRAIT_MAORI_PRODUCTION_WOODS_CONSERVATION' and Name = 'Amount';

-- Kongo
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_WRITER_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_ARTIST_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_MUSICIAN_POINTS' and Name = 'Amount';
update ModifierArguments set Value = 100 where
	ModifierId = 'TRAIT_DOUBLE_MERCHANT_POINTS' and Name = 'Amount';

-- Mali
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_LEADER_SAHEL_MERCHANTS', 'DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN');

insert or replace into Modifiers (ModifierId, ModifierType) values
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_YIELD_PER_TERRAIN_DOMESTIC');

insert or replace into ModifierArguments
	(ModifierId,								Name,			Value)
values
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',	'YieldType',	'YIELD_GOLD'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',	'TerrainType',	'TERRAIN_DESERT'),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',	'Origin',		1),
	('DOMESTIC_TRADE_ROUTE_GOLD_DESERT_ORIGIN',	'Amount',		1);

-- Maya
update Modifiers set SubjectRequirementSetId = 'OBJECT_IS_6_TILES_FROM_CAPITAL_REQUIREMENTS'
	where ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_GAIN_YIELDS';
update Modifiers set SubjectRequirementSetId = 'OBJECT_IS_10_OR_MORE_TILES_FROM_CAPITAL_REQUIREMENTS'
	where ModifierId = 'TRAIT_LEADER_NEARBY_CITIES_LOSE_YIELDS';

insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAIT_CIVILIZATION_MAYAB', 'MAYAB_EXTRA_HOUSING');
insert or replace into Modifiers (ModifierId, ModifierType) values
	('MAYAB_EXTRA_HOUSING', 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING');
insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('MAYAB_EXTRA_HOUSING', 'Amount', 1);

-- Rome
insert or replace into TraitModifiers (TraitType, ModifierId) values
	('TRAJANS_COLUMN_TRAIT', 'TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION');
insert or replace into Modifiers (ModifierId, ModifierType) values
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_PRODUCTION');
insert or replace into ModifierArguments (ModifierId, Name, Value) values
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 'DistrictType', 'DISTRICT_CITY_CENTER'),
	('TRAIT_ADJUST_CITY_CENTER_BUILDINGS_PRODUCTION', 'Amount', 25);

-- Minor Civs, City states

-- Rapa nui, opinion: only plots adjacent to coast/lake can build moai, but cannot enable the placement on VOLCANIC_SOIL.
delete from Improvement_InvalidAdjacentFeatures where ImprovementType = 'IMPROVEMENT_MOAI';
update Improvements set ValidAdjacentTerrainAmount = 1 where ImprovementType = 'IMPROVEMENT_MOAI';
insert into Improvement_ValidAdjacentTerrains (ImprovementType, TerrainType) values
	('IMPROVEMENT_MOAI', 'TERRAIN_COAST');

-- Kumasi
update ModifierArguments set Value = 1 where ModifierId = 'MINOR_CIV_KUMASI_CULTURE_TRADE_ROUTE_YIELD_BONUS' and Name = 'Amount';
-- Chinguetti
update ModifierArguments set Value = 0.5 where ModifierId = 'MINOR_CIV_CHINGUETTI_FAITH_FOLLOWERS' and Name = 'Amount';
-- Kandy
update ModifierArguments set Value = 200 where ModifierId = 'MINOR_CIV_KANDY_BETTER_RELIC_BONUS' and Name = 'ScalingFactor';
delete from TraitModifiers where TraitType = 'MINOR_CIV_KANDY_TRAIT' and ModifierId = 'MINOR_CIV_KANDY_UNIQUE_INFLUENCE_GRANT_BONUS';
-- Nalanda
delete from TraitModifiers where TraitType = 'MINOR_CIV_NALANDA_TRAIT' and ModifierId = 'MINOR_CIV_NALANDA_FREE_TECHNOLOGY';

--Egypt
--泛滥区域上的建筑加1粮
--建造完奇观以后送工人
--UI为相邻泛滥田+1粮
--la商路翻倍
--to do
