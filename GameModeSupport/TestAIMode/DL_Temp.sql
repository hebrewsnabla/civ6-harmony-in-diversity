-------------------------------------
--     Temp Testing Adjustments    --
-------------------------------------

-- Production Scale: 85 + 15n
update ModifierArguments set Extra = 17
    where ModifierId = 'HIGH_DIFFICULTY_PRODUCTION_SCALING' and Name = 'Amount';

-- Science Scale: 40 + 15n
update ModifierArguments set Extra = 3
    where ModifierId like 'HIGH_DIFFICULTY_SCIENCE_SCALING_AT_LEAST_%' and Name = 'Amount';

-- Culture Scale: 40 + 15n
update ModifierArguments set Extra = 3
    where ModifierId like 'HIGH_DIFFICULTY_CULTURE_SCALING_AT_LEAST_%' and Name = 'Amount';

-- Gold Scale: 40 + 15n
update ModifierArguments set Extra = 8
    where ModifierId = 'HIGH_DIFFICULTY_GOLD_SCALING' and Name = 'Amount';

-- Faith Scale: 30 + 10n
