-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

update Units set Cost = 200, CostProgressionParam1 = 20, MustPurchase = 0, PrereqTech = 'TECH_MASS_PRODUCTION' where UnitType = 'UNIT_LEU_TYCOON';

delete from Improvement_Tourism where ImprovementType = 'IMPROVEMENT_LEU_STATION';
update Improvements set Appeal = 0, YieldFromAppeal = NULL, YieldFromAppealPercent = 100 where ImprovementType = 'IMPROVEMENT_LEU_STATION';

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

-- BUG Fixing
update ModifierArguments set Value = 'YIELD_PRODUCTION' where Value = 'YIELD_PRODUCION' and Name = 'YieldType';

insert or ignore into RequirementSetRequirements
		(RequirementSetId,		RequirementId)
select	'LEU_IS_'||ResourceType||'_CORPORATION',		'REQUIRES_LEU_CORPORATION_PLOT'
FROM ResourceCorporations;
