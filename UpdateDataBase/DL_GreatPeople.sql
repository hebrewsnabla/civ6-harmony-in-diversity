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

