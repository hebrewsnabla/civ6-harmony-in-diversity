-------------------------------------
--         Boosts Adjustment       --
-------------------------------------

update Boosts set NumItems = 2 where TechnologyType = 'TECH_BRONZE_WORKING';

update Boosts set ImprovementType = 'IMPROVEMENT_LUMBER_MILL', RequiresResource = 0 where TechnologyType = 'TECH_THE_WHEEL';
update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', ImprovementType = NULL, NumItems = 0, BoostingCivicType = 'CIVIC_NAVAL_TRADITION' where TechnologyType = 'TECH_MASS_PRODUCTION';
update Boosts set BoostClass = 'BOOST_TRIGGER_OWN_X_UNITS_OF_TYPE', NumItems = 1 where CivicType = 'CIVIC_NAVAL_TRADITION';
