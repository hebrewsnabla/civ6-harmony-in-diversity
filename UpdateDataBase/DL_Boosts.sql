-------------------------------------
--         Boosts Adjustment       --
-------------------------------------

update Boosts set Boost = 33 where Boost = 40;

update Boosts set NumItems = 2 where TechnologyType = 'TECH_BRONZE_WORKING';

update Boosts set ImprovementType = 'IMPROVEMENT_PASTURE' where TechnologyType = 'TECH_THE_WHEEL';
update Boosts set BoostClass = 'BOOST_TRIGGER_IMPROVE_SPECIFIC_RESOURCE', ResourceType = 'RESOURCE_HORSES' where TechnologyType = 'TECH_HORSEBACK_RIDING';
update Boosts set NumItems = 3 where TechnologyType = 'TECH_MASS_PRODUCTION';
update Boosts set NumItems = 3 where TechnologyType = 'TECH_INDUSTRIALIZATION';
-- update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', ImprovementType = NULL, NumItems = 0, BoostingCivicType = 'CIVIC_NAVAL_TRADITION' where TechnologyType = 'TECH_MASS_PRODUCTION';
update Boosts set BoostClass = 'BOOST_TRIGGER_OWN_X_UNITS_OF_TYPE', NumItems = 1 where CivicType = 'CIVIC_NAVAL_TRADITION';
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_IMPROVEMENTS', NumItems = 2, ImprovementType = 'IMPROVEMENT_CAMP' where CivicType = 'CIVIC_GAMES_RECREATION';

update Boosts set NumItems = 3 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
update Boosts set NumItems = 1, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', DistrictType = NULL, BuildingType = 'BUILDING_LIBRARY' where CivicType = 'CIVIC_RECORDED_HISTORY';
update Boosts set NumItems = 2, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', Unit1Type = NULL, BuildingType = 'BUILDING_AMPHITHEATER' where CivicType = 'CIVIC_HUMANISM';

update Boosts set NumItems = 1, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', Unit1Type = NULL, BuildingType = 'BUILDING_MONUMENT' where TechnologyType = 'TECH_WRITING';
update Boosts set NumItems = 0, Unit1Type = 'UNIT_SCOUT', BoostClass = 'BOOST_TRIGGER_MEET_CIV' where CivicType = 'CIVIC_FOREIGN_TRADE';

-- update Boosts set NumItems = 2, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS' where TechnologyType = 'TECH_ENGINEERING';

update Boosts set NumItems = 0, Unit1Type = 'UNIT_SPEARMAN', BoostClass = 'BOOST_TRIGGER_KILL_WITH' where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
update Boosts set Unit1Type = null, BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', BoostingCivicType = 'CIVIC_DEFENSIVE_TACTICS' where TechnologyType = 'TECH_MILITARY_TACTICS';
