-------------------------------------
--             Aztec DLC           --
-------------------------------------

delete from TraitModifiers where TraitType = 'TRAIT_LEADER_GIFTS_FOR_TLATOANI' and 'TRAIT_COMBAT_BONUS_PER_LUXURY';
delete from TraitModifiers where TraitType = 'TRAIT_LEADER_GIFTS_FOR_TLATOANI' and 'TRAIT_OWNED_LUXURY_EXTRA_AMENITIES';

insert or replace into TraitModifiers (TraitType, ModifierId) values 
    ('TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS', 'TRAIT_COMBAT_BONUS_PER_LUXURY'),
    ('TRAIT_CIVILIZATION_LEGEND_FIVE_SUNS', 'TRAIT_OWNED_LUXURY_EXTRA_AMENITIES'),
    -- ('TRAIT_LEADER_GIFTS_FOR_TLATOANI',      'TRAIT_LEADER_FAITH_KILLS'),
    ('TRAIT_LEADER_GIFTS_FOR_TLATOANI',     'TRAIT_LEADER_MELEE_CAPTIVE_WORKERS');

insert or replace into Modifiers (ModifierId,   ModifierType) values
    ('TRAIT_LEADER_MELEE_CAPTIVE_WORKERS',      'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

insert or replace into ModifierArguments (ModifierId,   Name,   Value) values
    ('TRAIT_LEADER_MELEE_CAPTIVE_WORKERS',      'AbilityType',   'ABILITY_CAPTIVE_WORKERS');

update UnitAbilities set Inactive = 1 where UnitAbilityType = 'ABILITY_CAPTIVE_WORKERS';

insert or replace into TypeTags (Type, Tag)
    select UnitType,    'CLASS_CAPTURE_WORKER' from Units where PromotionClass = 'PROMOTION_CLASS_MELEE';

update Units set Cost = 65 where UnitType = 'UNIT_AZTEC_EAGLE_WARRIOR';


-- Wonder
-- Huey Lake +1 Gold
update Buildings set PrereqTech = 'TECH_ENGINEERING' where BuildingType = 'BUILDING_HUEY_TEOCALLI';
update ModifierArguments set Value = 2 where ModifierId = 'HUEY_LAKE_FOOD_MODIFIER' and Name = 'Amount';
update Modifiers set SubjectRequirementSetId = 'HD_PLOT_LAKE_OR_RESOURCE_ADJACENT_TO_LAKE' where ModifierId = 'HUEY_LAKE_FOOD_MODIFIER' or ModifierId = 'HUEY_LAKE_PRODUCTION_MODIFIER';
insert or replace into BuildingModifiers
	(BuildingType,							ModifierId)
values
	('BUILDING_HUEY_TEOCALLI',				'HUEY_LAKE_FAITH');

insert or replace into Modifiers
	(ModifierId, 							ModifierType,									SubjectRequirementSetId)
values
	('HUEY_LAKE_FAITH',						'MODIFIER_ALL_CITIES_ATTACH_MODIFIER',			'FOODHUEY_PLAYER_REQUIREMENTS'),		
	('HUEY_LAKE_FAITH_MODIFIER',			'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',	'HD_PLOT_LAKE_OR_RESOURCE_ADJACENT_TO_LAKE');		

insert or replace into ModifierArguments
	(ModifierId,							Name,			Value)
values
	('HUEY_LAKE_FAITH',						'ModifierId',	'HUEY_LAKE_FAITH_MODIFIER'),		
	('HUEY_LAKE_FAITH_MODIFIER',			'YieldType',	'YIELD_FAITH'),		
	('HUEY_LAKE_FAITH_MODIFIER',			'Amount',		1);
-- update ModifierArguments set Value = 2 where ModifierId = 'HUEY_LAKE_FOOD_MODIFIER' and Name = 'Amount';
