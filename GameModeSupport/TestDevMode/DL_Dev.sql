-------------------------------------
--          Dev Adjustment         --
-------------------------------------

update GlobalParameters set Value = 50 where Name = 'REYNA_CONVERT_PERCENTAGE';

update ModifierArguments set Value = 5 where Name = 'Amount' and ModifierId like 'REYNA_%_PERCENTAGE_BOOST';
