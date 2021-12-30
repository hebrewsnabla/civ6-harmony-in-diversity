-------------------------------------
--     RandomCosts Adjustment      --
-------------------------------------

insert or replace into Technologies_XP2 (TechnologyType, RandomPrereqs, HiddenUntilPrereqComplete)
select TechnologyType, 1, 1 from Technologies 
where TechnologyType != 'TECH_POTTERY' and TechnologyType != 'TECH_ANIMAL_HUSBANDRY' and TechnologyType != 'TECH_MINING';

-- v3
update TechnologyRandomCosts set Cost = 4500 where Cost = 2600;
-- Future
update TechnologyRandomCosts set Cost = 4000 where Cost = 2500;
update TechnologyRandomCosts set Cost = 3700 where Cost = 2300;
update TechnologyRandomCosts set Cost = 3600 where Cost = 2200;
-- Information
update TechnologyRandomCosts set Cost = 3100 where Cost = 2155;
update TechnologyRandomCosts set Cost = 3000 where Cost = 1850;
-- Atomic
update TechnologyRandomCosts set Cost = 2500 where Cost = 1660;
update TechnologyRandomCosts set Cost = 2400 where Cost = 1480;
-- Modern
update TechnologyRandomCosts set Cost = 1900 where Cost = 1370;
update TechnologyRandomCosts set Cost = 1800 where Cost = 1250;
-- Industrial
update TechnologyRandomCosts set Cost = 1400 where Cost = 1070;
update TechnologyRandomCosts set Cost = 1300 where Cost = 930;
-- Renaissance
update TechnologyRandomCosts set Cost = 950 where Cost = 730;
update TechnologyRandomCosts set Cost = 850 where Cost = 600;
-- Medival
update TechnologyRandomCosts set Cost = 550 where Cost = 390;
update TechnologyRandomCosts set Cost = 450 where Cost = 300;
-- Classical
update TechnologyRandomCosts set Cost = 280 where Cost = 200;
update TechnologyRandomCosts set Cost = 160 where Cost = 120;
-- Ancient
update TechnologyRandomCosts set Cost = 80 where Cost = 80;
update TechnologyRandomCosts set Cost = 50 where Cost = 50;

-- update Civics set Cost = Cost * 1.1 where EraType = 'ERA_CLASSICAL';
-- update Civics set Cost = Cost * 1.2 where EraType = 'ERA_MEDIEVAL' or EraType = 'ERA_RENAISSANCE';
-- update Civics set Cost = Cost * 1.3 where EraType = 'ERA_INDUSTRIAL' or EraType = 'ERA_MODERN';
-- update Civics set Cost = Cost * 1.4 where EraType = 'ERA_ATOMIC' or EraType = 'ERA_INFORMATION' or EraType = 'ERA_FUTURE';

insert or replace into Civics_XP2 (CivicType, RandomPrereqs, HiddenUntilPrereqComplete)
select CivicType, 1, 1 from Civics where CivicType != 'CIVIC_CODE_OF_LAWS';

-- v3
update CivicRandomCosts set Cost = 5200 where Cost = 3500;
-- 
update CivicRandomCosts set Cost = 4800 where Cost = 3300;
update CivicRandomCosts set Cost = 4600 where Cost = 3200;
-- Information
update CivicRandomCosts set Cost = 4300 where Cost = 3000;
update CivicRandomCosts set Cost = 4100 where Cost = 2880;
-- Atomic
update CivicRandomCosts set Cost = 3500 where Cost = 2415;
update CivicRandomCosts set Cost = 2900 where Cost = 1955; --average 2100
-- Modern
update CivicRandomCosts set Cost = 2300 where Cost = 1640;
update CivicRandomCosts set Cost = 2100 where Cost = 1540;
-- Industrial
update CivicRandomCosts set Cost = 1550 where Cost = 1210; -- average 1150
update CivicRandomCosts set Cost = 1300 where Cost = 800; -- average 905
-- Renaissance
update CivicRandomCosts set Cost = 1050 where Cost = 720;
update CivicRandomCosts set Cost = 780 where Cost = 440; -- average 520
-- Medival
update CivicRandomCosts set Cost = 550 where Cost = 420;
update CivicRandomCosts set Cost = 400 where Cost = 300;
-- Classical
update CivicRandomCosts set Cost = 210 where Cost = 175;
update CivicRandomCosts set Cost = 140 where Cost = 110;
-- Ancient
update CivicRandomCosts set Cost = 70 where Cost = 70;
update CivicRandomCosts set Cost = 50 where Cost = 50;
