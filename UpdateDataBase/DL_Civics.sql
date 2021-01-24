-------------------------------------
--        Civics Adjustment        --
-------------------------------------

update Civics set Cost = Cost * 1.1 where EraType = 'ERA_CLASSICAL';
update Civics set Cost = Cost * 1.2 where EraType = 'ERA_MEDIEVAL' or EraType = 'ERA_RENAISSANCE';
update Civics set Cost = Cost * 1.3 where EraType = 'ERA_INDUSTRIAL' or EraType = 'ERA_MODERN';
update Civics set Cost = Cost * 1.4 where EraType = 'ERA_ATOMIC' or EraType = 'ERA_INFORMATION' or EraType = 'ERA_FUTURE';

update ModifierArguments set Value = 50 where ModifierId = 'ENVIRONMENTALISM_BOOST_ALL_TOURISM' and Name = 'Value';

