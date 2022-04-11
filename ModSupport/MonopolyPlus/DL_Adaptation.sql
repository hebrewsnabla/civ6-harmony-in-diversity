-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

update Units set Cost = 200, CostProgressionParam1 = 20, MustPurchase = 0, PrereqTech = 'TECH_MASS_PRODUCTION' where UnitType = 'UNIT_LEU_TYCOON';

update Improvements set Appeal = 0, YieldFromAppeal = NULL, YieldFromAppealPercent = 100, Removable = 1 where ImprovementType = 'IMPROVEMENT_LEU_STATION';

delete from ImprovementModifiers where ImprovementType = 'IMPROVEMENT_LEU_STATION' and 
    ((ModifierId like 'LEU_STATION_DOMESTIC_CULTURE_%_OTHERS') or (ModifierId like 'LEU_STATION_DOMESTIC_CULTURE_%_OTHERS_POWERED') or
     (ModifierId like 'LEU_STATION_DOMESTIC_FOOD_%_OTHERS') or (ModifierId like 'LEU_STATION_DOMESTIC_FOOD_%_OTHERS_POWERED'));
update ModifierArguments set Value = 2 where Name = 'Amount' and (ModifierId like 'LEU_STATION_DOMESTIC_PRODUCTION_%_OTHERS');
update ModifierArguments set Value = 1 where Name = 'Amount' and (ModifierId like 'LEU_STATION_DOMESTIC_PRODUCTION_%_OTHERS_POWERED');
-- TODO：外商给双方+2粮+2琴
-- delete from ModifierArguments where Name = 'Domestic' and
--     ((ModifierId like 'LEU_STATION_DOMESTIC_CULTURE_%_OTHERS%') or (ModifierId like 'LEU_STATION_DOMESTIC_FOOD_%_OTHERS%'); or
--      (ModifierId like 'LEU_STATION_DOMESTIC_CULTURE_%_OTHERS_POWERED') or (ModifierId like 'LEU_STATION_DOMESTIC_FOOD_%_OTHERS_POWERED'));

insert or replace into ImprovementModifiers
    (ImprovementType,           ModifierId)
values
    ('IMPROVEMENT_LEU_STATION', 'LEU_STATION_IMPROVEMENT_TOURISM');

insert or replace into Modifiers
    (ModifierId,                                                ModifierType)
values
    ('LEU_STATION_IMPROVEMENT_TOURISM',                         'MODIFIER_SINGLE_CITY_ADJUST_IMPROVEMENT_TOURISM');

insert or replace into ModifierArguments
    (ModifierId,                                                Name,                                           Value)
values
    ('LEU_STATION_IMPROVEMENT_TOURISM',                         'Amount',                                       50);

-- Boost
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_IMPROVEMENTS', ImprovementType = 'IMPROVEMENT_LEU_STATION', NumItems = 2, TriggerDescription = 'LOC_BOOST_TRIGGER_COMBUSTION_LEU_MO',
    TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_COMBUSTION_LEU_MO'
where TechnologyType = 'TECH_COMBUSTION';

    -- by xhh
delete from ImprovementModifiers where ModifierId = 'LEU_STATION_REQUIRED_POWER';

CREATE TEMPORARY TABLE 'HD_DistrictBonus_Mono'(
    'DistrictType' TEXT NOT NULL,
    'YieldType' TEXT NOT NULL
);

insert or replace into HD_DistrictBonus_Mono
    (DistrictType,                  YieldType)
values
    ('DISTRICT_HOLY_SITE',          'YIELD_FAITH'),
    ('DISTRICT_CAMPUS',             'YIELD_SCIENCE'),
    ('DISTRICT_HARBOR',             'YIELD_GOLD'),
    ('DISTRICT_COMMERCIAL_HUB',     'YIELD_GOLD'),
    ('DISTRICT_THEATER',            'YIELD_CULTURE'),
    ('DISTRICT_INDUSTRIAL_ZONE',    'YIELD_PRODUCTION');
    
update Adjacency_YieldChanges set YieldChange = 1 where ID = 'Station_Production_From_Industry';
delete from District_Adjacencies where YieldChangeId = 'Station_Production';
update Improvement_YieldChanges set YieldChange = 1 where ImprovementType = 'IMPROVEMENT_LEU_STATION' and YieldType = 'YIELD_PRODUCTION';

update Improvement_Tourism set PrereqTech = 'TECH_FLIGHT' where ImprovementType = 'IMPROVEMENT_LEU_STATION';
insert or ignore into Adjacency_YieldChanges
    (ID,                                        Description,   YieldType,               YieldChange,    TilesRequired,  AdjacentDistrict)
values
    ('HD_INDUSTRIAL_STATION_PRODUCTION',       'Placeholder', 'YIELD_PRODUCTION',       1,              1,              'DISTRICT_INDUSTRIAL_ZONE'),
    ('HD_COMMERCIAL_STATION_PRODUCTION',       'Placeholder', 'YIELD_PRODUCTION',       1,              1,              'DISTRICT_COMMERCIAL_HUB'),
    ('HD_HARBOR_STATION_PRODUCTION',           'Placeholder', 'YIELD_PRODUCTION',       1,              1,              'DISTRICT_HARBOR'),
    ('HD_AERODROME_STATION_PRODUCTION',        'Placeholder', 'YIELD_PRODUCTION',       1,              1,              'DISTRICT_AERODROME');
insert or ignore into Improvement_Adjacencies
    (ImprovementType,           YieldChangeId)
values
    ('IMPROVEMENT_LEU_STATION', 'HD_INDUSTRIAL_STATION_PRODUCTION'),
    ('IMPROVEMENT_LEU_STATION', 'HD_COMMERCIAL_STATION_PRODUCTION'),
    ('IMPROVEMENT_LEU_STATION', 'HD_HARBOR_STATION_PRODUCTION'),
    ('IMPROVEMENT_LEU_STATION', 'HD_AERODROME_STATION_PRODUCTION');

insert or ignore into Improvement_ValidTerrains
    (ImprovementType,               TerrainType)
values
    ('IMPROVEMENT_LEU_STATION',     'TERRAIN_GRASS_HILLS'),
    ('IMPROVEMENT_LEU_STATION',     'TERRAIN_PLAINS_HILLS'),
    ('IMPROVEMENT_LEU_STATION',     'TERRAIN_DESERT_HILLS'),
    ('IMPROVEMENT_LEU_STATION',     'TERRAIN_TUNDRA_HILLS'),
    ('IMPROVEMENT_LEU_STATION',     'TERRAIN_SNOW_HILLS');

insert or ignore into ImprovementModifiers
    (ImprovementType,               ModifierId)
select
    'IMPROVEMENT_LEU_STATION',      'HD_STATION_' || DistrictType || '_BONUS'
from HD_DistrictBonus_Mono;

insert or ignore into Modifiers
    (ModifierId,                                ModifierType,                                       SubjectRequirementSetId)
select
    'HD_STATION_' || DistrictType || '_BONUS',  'MODIFIER_CITY_DISTRICTS_ADJUST_YIELD_MODIFIER',    'DISTRICT_IS_' || substr(DistrictType,10)
from HD_DistrictBonus_Mono;

insert or ignore into ModifierArguments
    (ModifierId,                                Name,           Value)
select
    'HD_STATION_' || DistrictType || '_BONUS',  'YieldType',    YieldType
from HD_DistrictBonus_Mono;

insert or ignore into ModifierArguments
    (ModifierId,                                Name,           Value)
select
    'HD_STATION_' || DistrictType || '_BONUS',  'Amount',       25
from HD_DistrictBonus_Mono;

insert or ignore into ImprovementModifiers
    (ImprovementType,               ModifierId)
select
    'IMPROVEMENT_LEU_STATION',      'HD_STATION_' || DistrictType || '_BONUS_POWERED'
from HD_DistrictBonus_Mono;

insert or ignore into Modifiers
    (ModifierId,                                        ModifierType,                                       OwnerRequirementSetId,  SubjectRequirementSetId)
select
    'HD_STATION_' || DistrictType || '_BONUS_POWERED',  'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_MODIFIER',  'CITY_IS_POWERED',      'HD_DISTRICT_IS_' || DistrictType || '_ADJACENT'
from HD_DistrictBonus_Mono;

insert or ignore into ModifierArguments
    (ModifierId,                                        Name,           Value)
select
    'HD_STATION_' || DistrictType || '_BONUS_POWERED',  'YieldType',    YieldType
from HD_DistrictBonus_Mono;

insert or ignore into ModifierArguments
    (ModifierId,                                        Name,           Value)
select
    'HD_STATION_' || DistrictType || '_BONUS_POWERED',  'Amount',       25
from HD_DistrictBonus_Mono;

insert or ignore into RequirementSets
    (RequirementSetId,                                  RequirementSetType)
select
    'HD_DISTRICT_IS_' || DistrictType || '_ADJACENT',   'REQUIREMENTSET_TEST_ALL'
from HD_DistrictBonus_Mono;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select
    'HD_DISTRICT_IS_' || DistrictType || '_ADJACENT',   'ADJACENT_TO_OWNER'
from HD_DistrictBonus_Mono;

insert or ignore into RequirementSetRequirements
    (RequirementSetId,                                  RequirementId)
select
    'HD_DISTRICT_IS_' || DistrictType || '_ADJACENT',   'REQUIRES_DISTRICT_IS_'  || substr(DistrictType,10)
from HD_DistrictBonus_Mono;

-- BUG Fixing
update ModifierArguments set Value = 'YIELD_PRODUCTION' where Value = 'YIELD_PRODUCION' and Name = 'YieldType';

insert or ignore into RequirementSetRequirements
		(RequirementSetId,		RequirementId)
select	'LEU_IS_'||ResourceType||'_CORPORATION',		'REQUIRES_LEU_CORPORATION_PLOT'
FROM ResourceCorporations;

-- 
insert or ignore into Unit_BuildingPrereqs
        (Unit,                      PrereqBuilding)
select  'UNIT_LEU_TYCOON',          BuildingType
from Buildings where BuildingType = 'BUILDING_JNR_MANUFACTURY';
