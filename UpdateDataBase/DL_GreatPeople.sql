-------------------------------------
--     GreatPeople Adjustments     --
-------------------------------------

-- TODO: Great prophet grant 1 extra district slot.


-- TODO: increase the GP points.
update ModifierArguments set Value = 2 where ModifierId = 'GREATPERSON_WORKSHOP_CULTURE' and Name = 'Amount';

update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_SNOWMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_TUNDRAMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_DESERTMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_PLAINSMOUNTAIN_SCIENCE' and Name = 'Amount';
update ModifierArguments set Value = 400 where ModifierId = 'GREATPERSON_ADJACENT_GRASSMOUNTAIN_SCIENCE' and Name = 'Amount';

update ModifierArguments set Value = 1000 where ModifierId = 'GREATPERSON_ADJACENT_NATURALWONDER_SCIENCE' and Name = 'Amount';

--柯莱欧司具有2次使用次数
update GreatPersonIndividuals set ActionCharges = 2 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_COLAEUS'; 

--马库斯克拉苏激活给100块
update ModifierArguments set Value = 100 where ModifierId = 'GREATPERSON_GOLD_TINY' and Name = 'Amount';

--拉贾托达马尔使内商从每个特色区域+1金
update ModifierArguments set Value = 1 where ModifierId = 'GREATPERSON_DOMESTIC_ROUTE_GOLD_PER_SPECIALTY_DISTRICT' and Name = 'Amount';

--玛丽凯瑟琳同时也会使敌方间谍我方领土内降级
insert into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                             ModifierId)
values
        ('GREAT_PERSON_INDIVIDUAL_MARY_KATHERINE_GODDARD',     'MARY_KATHERINE_DEFENSE');

insert into Modifiers
	    (ModifierId,                      ModifierType)
values
        ('MARY_KATHERINE_DEFENSE',        'MODIFIER_PLAYER_ADJUST_SPY_BONUS');

insert into ModifierArguments
    	(ModifierId,                                     Name,                Value)
values
        ('MARY_KATHERINE_DEFENSE',                       'Amount',            1),
        ('MARY_KATHERINE_DEFENSE',                       'Offense',           0);

--瓦特给工厂+3锤
update ModifierArguments set Value = 3 where ModifierId = 'GREATPERSON_FACTORIES_PRODUCTION' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_JANAKI_AMMAL
update ModifierArguments set Value = 800 where ModifierId = 'GREATPERSON_ADJACENT_RAINFOREST_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_MARY_LEAKEY
update ModifierArguments set Value = 700 where ModifierId = 'GREATPERSON_ARTIFACT_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_MARGARET_MEAD
update ModifierArguments set Value = 3000 where ModifierId = 'GREAT_PERSON_GRANT_LOTSO_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_ABDUS_SALAM
update ModifierArguments set Value = 'ERA_FUTURE' where ModifierId = 'GREATPERSON_ALLINFORMATIONTECHBOOSTS' and Name = 'EndEraType';

--特斯拉改成全国效果。
insert into Modifiers
	    (ModifierId,                      ModifierType,                                                  SubjectRequirementSetId)
values
        ('TESLA_REGIONAL_RANGE_BONUS',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',       'DISTRICT_IS_INDUSTRIAL_ZONE');

insert into ModifierArguments
    	(ModifierId,                                     Name,                Value)
values
        ('TESLA_REGIONAL_RANGE_BONUS',                  'Amount',             3);

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA',       'TESLA_REGIONAL_RANGE_BONUS',        'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_RANGE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_NIKOLA_TESLA';

--皮耶罗·迪·巴尔迪现在给300金
insert into Modifiers
	    (ModifierId,                      ModifierType,                   RunOnce,              Permanent)
values
        ('PIERO_DE_BARDI_GOLD',           'MODIFIER_PLAYER_GRANT_YIELD',   1,                    1);

insert or replace into ModifierArguments
    	(ModifierId,                                     Name,          Type,                    Value)
values
        ('PIERO_DE_BARDI_GOLD',                          'Amount',      'ScaleByGameSpeed',      300),
        ('PIERO_DE_BARDI_GOLD',                          'YieldType',   'ARGTYPE_IDENTITY',    'YIELD_GOLD');

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_PIERO_DE_BARDI',     'PIERO_DE_BARDI_GOLD',                'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_GOLD_SMALL' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_PIERO_DE_BARDI';

--雅各布·富格尔现在给400金
insert into Modifiers
	    (ModifierId,                      ModifierType,                   RunOnce,              Permanent)
values
        ('JAKOB_FUGGER_GOLD',           'MODIFIER_PLAYER_GRANT_YIELD',   1,                    1);

insert or replace into ModifierArguments
    	(ModifierId,                                     Name,          Type,                    Value)
values
        ('JAKOB_FUGGER_GOLD',                          'Amount',      'ScaleByGameSpeed',      400),
        ('JAKOB_FUGGER_GOLD',                          'YieldType',   'ARGTYPE_IDENTITY',    'YIELD_GOLD');

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_JAKOB_FUGGER',     'JAKOB_FUGGER_GOLD',                'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_GOLD_SMALL' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JAKOB_FUGGER';

--约翰·雅各·阿斯特现在给600金
insert into Modifiers
	    (ModifierId,                      ModifierType,                   RunOnce,              Permanent)
values
         ('JOHN_JACOB_ASTOR_GOLD',           'MODIFIER_PLAYER_GRANT_YIELD',   1,                    1);

insert or replace into ModifierArguments
    	(ModifierId,                                     Name,          Type,                    Value)
values
        ('JOHN_JACOB_ASTOR_GOLD',                       'Amount',      'ScaleByGameSpeed',      600),
        ('JOHN_JACOB_ASTOR_GOLD',                       'YieldType',   'ARGTYPE_IDENTITY',    'YIELD_GOLD');

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_JOHN_JACOB_ASTOR',     'JOHN_JACOB_ASTOR_GOLD',            'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_GOLD_LARGE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOHN_JACOB_ASTOR';

--周达观直接给3使者
insert into Modifiers
	    (ModifierId,                      ModifierType,                             RunOnce,              Permanent)
values
        ('ZHOU_DAGUAN_TOKENS',            'MODIFIER_PLAYER_GRANT_INFLUENCE_TOKEN',      1,                  1);

insert or replace into ModifierArguments
    	(ModifierId,                                     Name,          Type,                    Value)
values
        ('ZHOU_DAGUAN_TOKENS',                           'Amount',      'ARGTYPE_IDENTITY',      3)

update GreatPersonIndividuals set ActionRequiresCompletedDistrictType = 'DISTRICT_COMMERCIAL_HUB' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividuals set ActionRequiresCityStateTerritory = 0 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividuals set ActionRequiresNonHostileTerritory = 0 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividuals set ActionRequiresOwnedTile = 1 where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividualActionModifiers set ModifierId = 'ZHOU_DAGUAN_TOKENS' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';
update GreatPersonIndividualActionModifiers set AttachmentTargetType = 'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE' where GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_ZHOU_DAGUAN';

--约瑟夫·帕克斯顿改成全国效果
insert or replace into RequirementSetRequirements
	    (RequirementSetId,                           RequirementId)
values
	    ('DISTRICT_IS_ENTERTAINMENT',        'REQUIRES_DISTRICT_IS_ENTERTAINMENT_COMPLEX');

insert or replace into RequirementSets
	    (RequirementSetId,                           RequirementSetType)
values
	    ('DISTRICT_IS_ENTERTAINMENT',                'REQUIREMENTSET_TEST_ALL');

insert into Modifiers
	    (ModifierId,                      ModifierType,                                                           SubjectRequirementSetId)
values
        ('JOSEPH_PAXTON_REGIONAL_RANGE_BONUS',    'MODIFIER_PLAYER_DISTRICTS_ADJUST_EXTRA_REGIONAL_RANGE',       'DISTRICT_IS_ENTERTAINMENT');

insert into ModifierArguments
    	(ModifierId,                                     Name,                Value)
values
        ('JOSEPH_PAXTON_REGIONAL_RANGE_BONUS',          'Amount',             3);

insert or replace into GreatPersonIndividualActionModifiers
	    (GreatPersonIndividualType,                    ModifierId,                           AttachmentTargetType)
values
        ('GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON',       'JOSEPH_PAXTON_REGIONAL_RANGE_BONUS',        'GREAT_PERSON_ACTION_ATTACHMENT_TARGET_DISTRICT_IN_TILE');

delete from GreatPersonIndividualActionModifiers where ModifierId = 'GREATPERSON_EXTRA_REGIONAL_BUILDING_RANGE' and GreatPersonIndividualType = 'GREAT_PERSON_INDIVIDUAL_JOSEPH_PAXTON';

insert or replace into ModifierStrings
	    (ModifierId,                      Context,                     Text)
values
	    ('PIERO_DE_BARDI_GOLD',            'Summary',                   'LOC_PIERO_DE_BARDI_GOLD'),
	    ('JAKOB_FUGGER_GOLD',            'Summary',                   'LOC_JAKOB_FUGGER_GOLD'),
	    ('JOHN_JACOB_ASTOR_GOLD',            'Summary',                   'LOC_JOHN_JACOB_ASTOR_GOLD'),
	    ('ZHOU_DAGUAN_TOKENS',            'Summary',                   'LOC_ZHOU_DAGUAN_TOKENS'),
	    ('JOSEPH_PAXTON_REGIONAL_RANGE_BONUS',            'Summary',                   'LOC_JOSEPH_PAXTON_REGIONAL_RANGE_BONUS'),
	    ('TESLA_REGIONAL_RANGE_BONUS',     'Summary',                    'LOC_TESLA_REGIONAL_RANGE_BONUS');
