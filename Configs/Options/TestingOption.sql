update Buildings set Cost = 1;

update Districts set Cost = 1, CostProgressionModel = 'NO_COST_PROGRESSION', CostProgressionParam1 = 0;

update Units set Cost = 1, CostProgressionModel = 'NO_COST_PROGRESSION', CostProgressionParam1 = 0;
update Units set BaseMoves = BaseMoves * 10;

update Civics set Cost = 1;
-- update CivicRandomCosts set Cost = 1;

update Technologies set Cost = 1;
-- update TechnologyRandomCosts set Cost = 1;
