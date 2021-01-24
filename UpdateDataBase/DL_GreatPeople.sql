-------------------------------------
--     GreatPeople Adjustments     --
-------------------------------------

-- TODO: Great prophet grant 1 extra district slot.


-- TODO: increase the GP points.
update ModifierArguments set Value = 2 where ModifierId = 'GREATPERSON_WORKSHOP_CULTURE' and Name = 'Amount';
