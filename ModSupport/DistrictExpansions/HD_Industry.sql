-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

update Buildings set PrereqTech = 'TECH_WRITING' where BuildingType = 'BUILDING_ETEMENANKI';

-- Buildings
update Buildings set PurchaseYield = NULL where BuildingType = 'BUILDING_JNR_MILL_RACE';

update Buildings set Cost = 105, PrereqTech = 'TECH_IRON_WORKING' where BuildingType = 'BUILDING_JNR_WIND_MILL';
update Buildings set Cost = 180 where BuildingType = 'BUILDING_WORKSHOP';
update Buildings set Cost = 180, Maintenance = 3, CitizenSlots = 1, PrereqTech = 'TECH_APPRENTICESHIP' where BuildingType = 'BUILDING_JNR_MANUFACTURY';
update Buildings set Cost = 330, Maintenance = 7, PrereqTech = 'TECH_INDUSTRIALIZATION' where BuildingType = 'BUILDING_JNR_CHEMICAL';
update Buildings set Cost = 360, Maintenance = 8 where BuildingType = 'BUILDING_JNR_FREIGHT_YARD';

update Buildings set Cost = 360, Maintenance = 8, PrereqTech = 'TECH_ELECTRICITY', RegionalRange = 6, PrereqCivic = NULL, Name='LOC_BUILDING_ELECTRONICS_FACTORY_NAME',
    Description = 'LOC_BUILDING_ELECTRONICS_FACTORY_DESCRIPTION_UC_JNR' where BuildingType = 'BUILDING_ELECTRONICS_FACTORY';

update Buildings_XP2 set RequiredPower = 2 where BuildingType = 'BUILDING_ELECTRONICS_FACTORY';

-- Yield
insert or replace into Building_YieldChanges
    (BuildingType,                      YieldType,          YieldChange)
values
    ('BUILDING_JNR_MANUFACTURY',        'YIELD_PRODUCTION', 2),
    ('BUILDING_JNR_CHEMICAL',           'YIELD_PRODUCTION', 2),
    ('BUILDING_JNR_CHEMICAL',           'YIELD_SCIENCE',    2),
    ('BUILDING_POWER_PLANT',            'YIELD_SCIENCE',    3),
    ('BUILDING_ELECTRONICS_FACTORY',    'YIELD_SCIENCE',    2),
    ('BUILDING_ELECTRONICS_FACTORY',    'YIELD_CULTURE',    2);

delete from Buildings_XP2 where BuildingType = 'BUILDING_JNR_CHEMICAL';
delete from Building_YieldChangesBonusWithPower where BuildingType = 'BUILDING_JNR_CHEMICAL';
insert or replace into Building_YieldChangesBonusWithPower
    (BuildingType,                      YieldType,          YieldChange)
values
    ('BUILDING_ELECTRONICS_FACTORY',    'YIELD_SCIENCE',    2),
    ('BUILDING_ELECTRONICS_FACTORY',    'YIELD_CULTURE',    2);

update Building_YieldChanges set YieldChange = 3 where BuildingType = 'BUILDING_JNR_WIND_MILL' and YieldType = 'YIELD_PRODUCTION';
-- update Building_YieldChanges set YieldChange = 0 where BuildingType = 'BUILDING_COAL_POWER_PLANT' and YieldType = 'YIELD_PRODUCTION';
delete from Building_YieldChanges where BuildingType = 'BUILDING_COAL_POWER_PLANT' and YieldType = 'YIELD_PRODUCTION';
update Building_YieldChanges set YieldChange = 3 where BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT' and YieldType = 'YIELD_PRODUCTION';
update Building_YieldChanges set YieldChange = 4 where BuildingType = 'BUILDING_POWER_PLANT' and YieldType = 'YIELD_PRODUCTION';
update Building_GreatPersonPoints set PointsPerTurn = 1 where BuildingType = 'BUILDING_JNR_WIND_MILL' or BuildingType = 'BUILDING_IZ_WATER_MILL';

-- Citizen
insert or replace into Building_CitizenYieldChanges
    (BuildingType,                  YieldType,          YieldChange)
values
    ('BUILDING_IZ_WATER_MILL',      'YIELD_PRODUCTION', 1),
    ('BUILDING_IZ_WATER_MILL',      'YIELD_GOLD',       -1),
    ('BUILDING_JNR_WIND_MILL',      'YIELD_PRODUCTION', 1),
    ('BUILDING_JNR_WIND_MILL',      'YIELD_GOLD',       -1),
    ('BUILDING_WORKSHOP',           'YIELD_PRODUCTION', 1),
    ('BUILDING_WORKSHOP',           'YIELD_GOLD',       -1),
    ('BUILDING_JNR_MANUFACTURY',    'YIELD_PRODUCTION', 1),
    ('BUILDING_JNR_MANUFACTURY',    'YIELD_GOLD',       -1),
    ('BUILDING_JNR_CHEMICAL',       'YIELD_PRODUCTION', 1),
    ('BUILDING_JNR_CHEMICAL',       'YIELD_GOLD',       -1),
    ('BUILDING_JNR_FREIGHT_YARD',   'YIELD_PRODUCTION', 1),
    ('BUILDING_JNR_FREIGHT_YARD',   'YIELD_GOLD',       -1),
    ('BUILDING_ELECTRONICS_FACTORY', 'YIELD_PRODUCTION', 1),
    ('BUILDING_ELECTRONICS_FACTORY', 'YIELD_GOLD',       -1);

-- Bonus
delete from BuildingModifiers where ModifierId like 'JNR_%' and (
    BuildingType = 'BUILDING_WATER_MILL' or
    BuildingType = 'BUILDING_JNR_WIND_MILL' or
    BuildingType = 'BUILDING_WORKSHOP' or
    BuildingType = 'BUILDING_FACTORY');

-- Special Bonus
delete from BuildingModifiers where BuildingType = 'BUILDING_COAL_POWER_PLANT' and ModifierId = 'JNR_COAL_POWER_PLANT_APPEAL_PENALTY';
delete from BuildingModifiers where BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT' and ModifierId = 'JNR_FOSSILE_FUEL_POWER_PLANT_APPEAL_PENALTY';
delete from BuildingModifiers where BuildingType = 'BUILDING_JNR_FREIGHT_YARD' and ModifierId = 'JNR_FREIGHT_YARD_RESOURCE_STOCKPILE_CAP';
delete from BuildingModifiers where BuildingType = 'BUILDING_ELECTRONICS_FACTORY' and ModifierId = 'JNR_FREIGHT_YARD_RESOURCE_STOCKPILE_CAP';

insert or replace into BuildingModifiers
    (BuildingType,                  ModifierId)
values
    ('BUILDING_JNR_WIND_MILL',      'WIND_MILL_ADD_COASTAL_IMPROVEMENT_PRODUCTION'),
    ('BUILDING_JNR_MANUFACTURY',    'MANUFACTURY_ADD_RESOURCE_PRODUCTION'),
    ('BUILDING_JNR_MANUFACTURY',    'MANUFACTURY_ADD_RESOURCE_GOLD'),
    ('BUILDING_JNR_FREIGHT_YARD',   'FREIGHT_YARD_POP_PRODUCTION'),
    ('BUILDING_JNR_FREIGHT_YARD',   'FREIGHT_YARD_POP_GOLD'),
    ('BUILDING_JNR_FREIGHT_YARD',   'POWER_PLANT_BUILDING_PRODUCTION_PERCENTAGE_BOOST'),
    ('BUILDING_JNR_FREIGHT_YARD',   'POWER_PLANT_DISTRICT_PRODUCTION_PERCENTAGE_BOOST');

insert or replace into Modifiers
    (ModifierId,                                        ModifierType,                                           SubjectRequirementSetId)
values
    ('WIND_MILL_ADD_COASTAL_IMPROVEMENT_PRODUCTION',    'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',          'PLOT_IS_COASTAL_IMPROVED_LAND_REQUIREMENTS'),
    ('MANUFACTURY_ADD_RESOURCE_PRODUCTION',             'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',          'HD_PLOT_HAS_LUXURY_OR_BONUS_RESOURCE_REQUIREMENTS'),
    ('MANUFACTURY_ADD_RESOURCE_GOLD',                   'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD',          'HD_PLOT_HAS_LUXURY_OR_BONUS_RESOURCE_REQUIREMENTS'),
    ('FREIGHT_YARD_POP_PRODUCTION',                     'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION', NULL),
    ('FREIGHT_YARD_POP_GOLD',                           'MODIFIER_SINGLE_CITY_ADJUST_CITY_YIELD_PER_POPULATION', NULL);

insert or replace into ModifierArguments
    (ModifierId,                                        Name,           Value)
values
    ('WIND_MILL_ADD_COASTAL_IMPROVEMENT_PRODUCTION',    'YieldType',    'YIELD_PRODUCTION'),
    ('WIND_MILL_ADD_COASTAL_IMPROVEMENT_PRODUCTION',    'Amount',       1),
    ('MANUFACTURY_ADD_RESOURCE_PRODUCTION',             'YieldType',    'YIELD_PRODUCTION'),
    ('MANUFACTURY_ADD_RESOURCE_PRODUCTION',             'Amount',       1),
    ('MANUFACTURY_ADD_RESOURCE_GOLD',                   'YieldType',    'YIELD_GOLD'),
    ('MANUFACTURY_ADD_RESOURCE_GOLD',                   'Amount',       3),
    ('FREIGHT_YARD_POP_PRODUCTION',                     'YieldType',    'YIELD_PRODUCTION'),
    ('FREIGHT_YARD_POP_PRODUCTION',                     'Amount',       1),
    ('FREIGHT_YARD_POP_GOLD',                           'YieldType',    'YIELD_GOLD'),
    ('FREIGHT_YARD_POP_GOLD',                           'Amount',       2);

insert or replace into BuildingModifiers (BuildingType, ModifierId) select
    'BUILDING_JNR_CHEMICAL',    'CHEMICAL_HAS_'||ResourceType||'_BONUS_SCIENCE'
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) select
    'CHEMICAL_HAS_'||ResourceType||'_BONUS_SCIENCE', 'MODIFIER_BUILDING_YIELD_CHANGE',  'HD_CITY_HAS_IMPROVED_' || ResourceType || '_REQUIRMENTS'
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

insert or replace into ModifierArguments (ModifierId, Name, Value) select
    'CHEMICAL_HAS_'||ResourceType||'_BONUS_SCIENCE', 'BuildingType',    'BUILDING_JNR_CHEMICAL'
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
insert or replace into ModifierArguments (ModifierId, Name, Value) select
    'CHEMICAL_HAS_'||ResourceType||'_BONUS_SCIENCE', 'YieldType',  'YIELD_SCIENCE'
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';
insert or replace into ModifierArguments (ModifierId, Name, Value) select
    'CHEMICAL_HAS_'||ResourceType||'_BONUS_SCIENCE', 'Amount',  5
from Resources where ResourceClassType = 'RESOURCECLASS_STRATEGIC';

-- Projects, AI issue
delete from Types where Type = 'PROJECT_JNR_CONVERT_REACTOR_TO_FREIGHT';

--------------------------------------------------------------
-- Boosts
update Boosts set
    -- TriggerDescription = 'LOC_BOOST_TRIGGER_INDUSTRIALIZATION_XP2',
    TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_INDUSTRIALIZATION',
    BuildingType = 'BUILDING_WORKSHOP', NumItems = 2
where TechnologyType = 'TECH_INDUSTRIALIZATION';

update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', BuildingType = 'BUILDING_JNR_MANUFACTURY', ImprovementType = NULL, NumItems = 1, TriggerDescription = 'LOC_BOOST_TRIGGER_MASS_PRODUCTION_JNR_UC',
    TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_MASS_PRODUCTION_JNR_UC' where TechnologyType = 'TECH_MASS_PRODUCTION';
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', BuildingType = 'BUILDING_JNR_CHEMICAL', NumItems = 2, TriggerDescription = 'LOC_BOOST_TRIGGER_CHEMISTRY_JNR_UC',
    TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_CHEMISTRY_JNR_UC' where TechnologyType = 'TECH_CHEMISTRY';

update Boosts set BuildingType = 'BUILDING_FACTORY', NumItems = 2 where CivicType = 'CIVIC_CLASS_STRUGGLE';

--------------------------------------------------------------
-- Great Person
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JNR_LI_BING' and ModifierId = 'JNR_GREATPERSON_DAM_ADJACENCYPRODUCTION';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JNR_MA_JUN' and ModifierId = 'JNR_GREATPERSON_GREAT_WORK_WRITING_PRODUCTION';
delete from GreatPersonIndividualActionModifiers where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_LEONARDO_DA_VINCI' and ModifierId = 'JNR_GREATPERSON_WORKSHOP_PRODUCTION';
update GreatPersonIndividuals set ActionEffectTextOverride = NULL where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_LEONARDO_DA_VINCI';
update GreatPersonIndividuals set ActionEffectTextOverride = 'LOC_GREATPERSON_JAMES_WATT_ACTIVE' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAMES_WATT';

insert or replace into GreatPersonIndividualActionModifiers
    (GreatPersonIndividualType,                     ModifierId)
values
    ('GREAT_PERSON_INDIVIDUAL_LEONARDO_DA_VINCI',   'GREATPERSON_JNR_MANUFACTURY_CULTURE');

insert or replace into Modifiers
    (ModifierId,                                ModifierType,                                           Permanent)
values
    ('GREATPERSON_JNR_MANUFACTURY_CULTURE',     'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',  1);

insert or replace into ModifierArguments
    (ModifierId,                               Name,            Value)
values
    ('GREATPERSON_JNR_MANUFACTURY_CULTURE',    'BuildingType',  'BUILDING_JNR_MANUFACTURY'),
    ('GREATPERSON_JNR_MANUFACTURY_CULTURE',    'YieldType',     'YIELD_CULTURE'),
    ('GREATPERSON_JNR_MANUFACTURY_CULTURE',    'Amount',        3);

insert or replace into ModifierStrings
    (ModifierId,                                Context,    Text)
values
    ('GREATPERSON_JNR_MANUFACTURY_CULTURE',     'Summary',  'LOC_GREATPERSON_JNR_MANUFACTURY_CULTURE');

--------------------------------------------------------------
-- Reqs
insert or replace into RequirementSets
    (RequirementSetId,                                          RequirementSetType)
values
    ('PLOT_IS_COASTAL_IMPROVED_LAND_REQUIREMENTS',              'REQUIREMENTSET_TEST_ALL');

insert or replace into RequirementSetRequirements
    (RequirementSetId,                                          RequirementId)
values
    -- Pantheon
    ('PLOT_IS_COASTAL_IMPROVED_LAND_REQUIREMENTS',              'REQUIRES_PLOT_IS_IMPROVED'),
    ('PLOT_IS_COASTAL_IMPROVED_LAND_REQUIREMENTS',				'REQUIRES_PLOT_HAS_NOT_OCEAN'),
	('PLOT_IS_COASTAL_IMPROVED_LAND_REQUIREMENTS',				'REQUIRES_PLOT_HAS_NOT_COAST'),
	('PLOT_IS_COASTAL_IMPROVED_LAND_REQUIREMENTS',				'REQUIRES_PLOT_IS_ADJACENT_TO_COAST');
