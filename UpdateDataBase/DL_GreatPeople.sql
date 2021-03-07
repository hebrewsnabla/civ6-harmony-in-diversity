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


--GREAT_PERSON_INDIVIDUAL_JANAKI_AMMAL
update ModifierArguments set Value = 800 where ModifierId = 'GREATPERSON_ADJACENT_RAINFOREST_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_MARY_LEAKEY
update ModifierArguments set Value = 700 where ModifierId = 'GREATPERSON_ARTIFACT_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_MARGARET_MEAD
update ModifierArguments set Value = 3000 where ModifierId = 'GREAT_PERSON_GRANT_LOTSO_SCIENCE' and Name = 'Amount';

--GREAT_PERSON_INDIVIDUAL_ABDUS_SALAM
update ModifierArguments set Value = 'ERA_FUTURE' where ModifierId = 'GREATPERSON_ALLINFORMATIONTECHBOOSTS' and Name = 'EndEraType';
