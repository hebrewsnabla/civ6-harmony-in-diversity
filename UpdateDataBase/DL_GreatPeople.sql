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