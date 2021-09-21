-------------------------------------
--       Monopoly Adjustment       --
-------------------------------------

insert or replace into GlobalParameters
        (Name,                                                      Value)
values  ('MONOPOLY_REQUIRED_RESOURCE_CONTROL_PERCENTAGE',           101),
        ('MONOPOLY_REQUIRED_RESOURCE_CONTROL_PERCENTAGE_MED',       101),
        ('MONOPOLY_REQUIRED_RESOURCE_CONTROL_PERCENTAGE_MAX',       101);

delete from ImprovementModifiers where
	ImprovementType = 'IMPROVEMENT_INDUSTRY' or ImprovementType = 'IMPROVEMENT_CORPORATION';
insert or replace into ImprovementModifiers
	(ImprovementType,			ModifierId)
values
	('IMPROVEMENT_INDUSTRY',	'INDUSTRY_HD_GROWTH_BONUS'),
	('IMPROVEMENT_INDUSTRY',	'INDUSTRY_HD_FAITH_BONUS'),
	('IMPROVEMENT_INDUSTRY',	'INDUSTRY_HD_GPP_BONUS'),
	('IMPROVEMENT_INDUSTRY',	'INDUSTRY_HD_TRADER_BONUS'),
	('IMPROVEMENT_INDUSTRY',	'INDUSTRY_HD_FOOD_BONUS'),
	('IMPROVEMENT_INDUSTRY',	'INDUSTRY_HD_AMENITY_BONUS'),
	('IMPROVEMENT_INDUSTRY',	'INDUSTRY_HD_WONDER_BONUS'),
	('IMPROVEMENT_INDUSTRY',	'INDUSTRY_HD_TOURISM_BONUS'),
	('IMPROVEMENT_INDUSTRY',	'INDUSTRY_HD_FISHERY_BONUS'),
	('IMPROVEMENT_CORPORATION',	'CORPORATION_HD_GROWTH_BONUS'),
	('IMPROVEMENT_CORPORATION',	'CORPORATION_HD_FAITH_BONUS'),
	('IMPROVEMENT_CORPORATION',	'CORPORATION_HD_GPP_BONUS'),
	('IMPROVEMENT_CORPORATION',	'CORPORATION_HD_TRADER_BONUS'),
	('IMPROVEMENT_CORPORATION',	'CORPORATION_HD_FOOD_BONUS'),
	('IMPROVEMENT_CORPORATION',	'CORPORATION_HD_AMENITY_BONUS'),
	('IMPROVEMENT_CORPORATION',	'CORPORATION_HD_WONDER_BONUS'),
	('IMPROVEMENT_CORPORATION',	'CORPORATION_HD_TOURISM_BONUS'),
	('IMPROVEMENT_CORPORATION',	'CORPORATION_HD_FISHERY_BONUS');

create table 'HDCounter'(
	'Count' INT NOT NULL,
	PRIMARY KEY(Count)
);
insert or replace into HDCounter (Count) values (1),(2),(3),(4),(5);

create table 'MonopolyResourceEffects'(
	'ResourceType' TEXT NOT NULL,
	'Category' TEXT NOT NULL,
	'IndustryEffect' TEXT NOT NULL,
	'CorporationEffect' TEXT NOT NULL,
	PRIMARY KEY(ResourceType)
	FOREIGN KEY(ResourceType) REFERENCES Resources(ResourceType) ON DELETE CASCADE ON UPDATE CASCADE
);

insert or replace into MonopolyResourceEffects
	(ResourceType, 	Category,	IndustryEffect,					CorporationEffect)
select
	ResourceType,	'AMENITY',	'INDUSTRY_HD_AMENITY_BONUS',	'CORPORATION_HD_AMENITY_BONUS'
from Resources where ResourceClassType = 'RESOURCECLASS_LUXURY';

update MonopolyResourceEffects set Category = 'GROWTH', IndustryEffect = 'INDUSTRY_HD_GROWTH_BONUS', CorporationEffect = 'CORPORATION_HD_GROWTH_BONUS'
	where ResourceType = 'RESOURCE_SPICES' or ResourceType = 'RESOURCE_SALT' or ResourceType = 'RESOURCE_SUGAR' or ResourceType = 'RESOURCE_HONEY';
update MonopolyResourceEffects set Category = 'FAITH', IndustryEffect = 'INDUSTRY_HD_FAITH_BONUS', CorporationEffect = 'CORPORATION_HD_FAITH_BONUS'
	where ResourceType = 'RESOURCE_INCENSE' or ResourceType = 'RESOURCE_TOBACCO' or ResourceType = 'RESOURCE_DYES';
update MonopolyResourceEffects set Category = 'GPP', IndustryEffect = 'INDUSTRY_HD_GPP_BONUS', CorporationEffect = 'CORPORATION_HD_GPP_BONUS'
	where ResourceType = 'RESOURCE_COCOA' or ResourceType = 'RESOURCE_COFFEE' or ResourceType = 'RESOURCE_TEA';
update MonopolyResourceEffects set Category = 'TRADER', IndustryEffect = 'INDUSTRY_HD_TRADER_BONUS', CorporationEffect = 'CORPORATION_HD_TRADER_BONUS'
	where ResourceType = 'RESOURCE_SILK' or ResourceType = 'RESOURCE_SILVER' or ResourceType = 'RESOURCE_GOLD' or ResourceType = 'RESOURCE_DIAMONDS';
update MonopolyResourceEffects set Category = 'FOOD', IndustryEffect = 'INDUSTRY_HD_FOOD_BONUS', CorporationEffect = 'CORPORATION_HD_FOOD_BONUS'
	where ResourceType = 'RESOURCE_WINE' or ResourceType = 'RESOURCE_CITRUS' or ResourceType = 'RESOURCE_TRUFFLES'; -- caviar
-- Default: Amenity, RESOURCE_COTTON, RESOURCE_FURS, RESOURCE_OLIVES
update MonopolyResourceEffects set Category = 'WONDER', IndustryEffect = 'INDUSTRY_HD_WONDER_BONUS', CorporationEffect = 'CORPORATION_HD_WONDER_BONUS'
	where ResourceType = 'RESOURCE_MARBLE' or ResourceType = 'RESOURCE_GYPSUM' or ResourceType = 'RESOURCE_MERCURY';
update MonopolyResourceEffects set Category = 'TOURISM', IndustryEffect = 'INDUSTRY_HD_TOURISM_BONUS', CorporationEffect = 'CORPORATION_HD_TOURISM_BONUS'
	where ResourceType = 'RESOURCE_IVORY' or ResourceType = 'RESOURCE_JADE' or ResourceType = 'RESOURCE_AMBER'; -- coral
update MonopolyResourceEffects set Category = 'FISHERY', IndustryEffect = 'INDUSTRY_HD_FISHERY_BONUS', CorporationEffect = 'CORPORATION_HD_FISHERY_BONUS'
	where ResourceType = 'RESOURCE_TRUFFLES' or ResourceType = 'RESOURCE_WHALES' or ResourceType = 'RESOURCE_PEARLS'; -- lobster

insert or replace into Modifiers
	(ModifierId,					ModifierType,										SubjectRequirementSetId)
values
	('INDUSTRY_HD_GROWTH_BONUS',	'MODIFIER_SINGLE_CITY_ADJUST_CITY_GROWTH',			'REQUIRES_CITY_GROWTH_RESOURCE'),
	('INDUSTRY_HD_FAITH_BONUS',		'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_MODIFIER',	'REQUIRES_CITY_GROWTH_RESOURCE');

insert or replace into ModifierArguments
	(ModifierId,					Name,			Value)
values
	('INDUSTRY_HD_GROWTH_BONUS',	'Amount',		10),
	('INDUSTRY_HD_FAITH_BONUS',		'YieldType',	'YIELD_FAITH'),
	('INDUSTRY_HD_FAITH_BONUS',		'Amount',		25);

delete from ResourceIndustries;
delete from ResourceCorporations;
insert or replace into ResourceIndustries
	(ResourceType,	ResourceEffect,	ResourceEffectTExt)
select
	ResourceType,	IndustryEffect,	'LOC_'||IndustryEffect||'_DESCRIPTION'
from MonopolyResourceEffects;
insert or replace into ResourceCorporations
	(ResourceType,	ResourceEffect,	ResourceEffectTExt)
select
	ResourceType,	CorporationEffect,	'LOC_'||CorporationEffect||'_DESCRIPTION'
from MonopolyResourceEffects;

delete from GreatWorkModifiers where GreatWorkType like 'GREATWORK_PRODUCT_%';
-- Tourism
update GreatWorks set Tourism = 6 where GreatWorkType like 'GREATWORK_PRODUCT_%';
update GreatWorks set Tourism = 12 where GreatWorkType in
	(select 'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count
		from MonopolyResourceEffects a, HDCounter b where Category = 'TOURISM');

-- TODO: Amenity Housing need modifier.
delete from GreatWork_YieldChanges where GreatWorkType like 'GREATWORK_PRODUCT_%';
insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_FOOD',		8
from MonopolyResourceEffects a, HDCounter b where Category = 'GROWTH';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_FAITH',		5
from MonopolyResourceEffects a, HDCounter b where Category = 'FAITH';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_GOLD',		6
from MonopolyResourceEffects a, HDCounter b where Category = 'FAITH';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_SCIENCE',	3
from MonopolyResourceEffects a, HDCounter b where Category = 'GPP';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_CULTURE',	3
from MonopolyResourceEffects a, HDCounter b where Category = 'GPP';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_GOLD',		16
from MonopolyResourceEffects a, HDCounter b where Category = 'TRADER';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_FOOD',		4
from MonopolyResourceEffects a, HDCounter b where Category = 'FOOD';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_GOLD',		8
from MonopolyResourceEffects a, HDCounter b where Category = 'FOOD';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_PRODUCTION',	8
from MonopolyResourceEffects a, HDCounter b where Category = 'WONDER';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_CULTURE',	4
from MonopolyResourceEffects a, HDCounter b where Category = 'TOURISM';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_SCIENCE',	2
from MonopolyResourceEffects a, HDCounter b where Category = 'FISHERY';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_FOOD',		2
from MonopolyResourceEffects a, HDCounter b where Category = 'FISHERY';

insert or replace into GreatWork_YieldChanges
	(GreatWorkType,													YieldType,			YieldChange)
select
	'GREATWORK_PRODUCT_'||substr(a.ResourceType, 10)||'_'||b.Count,	'YIELD_PRODUCTION',	2
from MonopolyResourceEffects a, HDCounter b where Category = 'FISHERY';
