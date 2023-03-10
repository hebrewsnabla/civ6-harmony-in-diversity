-------------------------------------
--         Boosts Adjustment       --
-------------------------------------

update Boosts set NumItems = 2 where TechnologyType = 'TECH_BRONZE_WORKING';

update Boosts set ImprovementType = 'IMPROVEMENT_PASTURE' where TechnologyType = 'TECH_THE_WHEEL';
update Boosts set BoostClass = 'BOOST_TRIGGER_IMPROVE_SPECIFIC_RESOURCE', ResourceType = 'RESOURCE_HORSES' where TechnologyType = 'TECH_HORSEBACK_RIDING';
update Boosts set NumItems = 2 where TechnologyType = 'TECH_MASS_PRODUCTION';
-- update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', ImprovementType = NULL, NumItems = 0, BoostingCivicType = 'CIVIC_NAVAL_TRADITION' where TechnologyType = 'TECH_MASS_PRODUCTION';
update Boosts set BoostClass = 'BOOST_TRIGGER_OWN_X_UNITS_OF_TYPE', NumItems = 1 where CivicType = 'CIVIC_NAVAL_TRADITION';
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_IMPROVEMENTS', NumItems = 2, ImprovementType = 'IMPROVEMENT_CAMP' where CivicType = 'CIVIC_GAMES_RECREATION';

update Boosts set NumItems = 3 where CivicType = 'CIVIC_MEDIEVAL_FAIRES';
update Boosts set NumItems = 1, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', DistrictType = NULL, BuildingType = 'BUILDING_LIBRARY' where CivicType = 'CIVIC_RECORDED_HISTORY';
update Boosts set NumItems = 2, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', Unit1Type = NULL, BuildingType = 'BUILDING_AMPHITHEATER' where CivicType = 'CIVIC_HUMANISM';

update Boosts set NumItems = 1, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', Unit1Type = NULL, BuildingType = 'BUILDING_MONUMENT' where TechnologyType = 'TECH_WRITING';
update Boosts set NumItems = 0, Unit1Type = 'UNIT_SCOUT', BoostClass = 'BOOST_TRIGGER_MEET_CIV' where CivicType = 'CIVIC_FOREIGN_TRADE';

-- update Boosts set NumItems = 2, BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS' where TechnologyType = 'TECH_ENGINEERING';

-- update Boosts set NumItems = 0, Unit1Type = 'UNIT_SPEARMAN', BoostClass = 'BOOST_TRIGGER_KILL_WITH' where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
update Boosts set Unit1Type = null, BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', BoostingCivicType = 'CIVIC_DEFENSIVE_TACTICS' where TechnologyType = 'TECH_MILITARY_TACTICS';

update Boosts set NumItems = 1, BoostClass = 'BOOST_TRIGGER_HAVE_X_DISTRICTS', Unit1Type = NULL, DistrictType = 'DISTRICT_DAM',
    TriggerDescription = 'LOC_BOOST_TRIGGER_ELECTRICITY_HD', TriggerLongDescription = 'LOC_BOOST_TRIGGER_LONGDESC_ELECTRICITY_HD' where TechnologyType = 'TECH_ELECTRICITY';

update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', BoostingCivicType = 'CIVIC_MILITARY_TRAINING',
    Unit1Type = NULL, NumItems = 0 where TechnologyType = 'TECH_METAL_CASTING';
update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', BoostingCivicType = 'CIVIC_DEFENSIVE_TACTICS',
    Unit1Type = NULL, NumItems = 0 where TechnologyType = 'TECH_CASTLES';
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_GREAT_GENERAL', NumItems = 0
    where TechnologyType = 'TECH_MILITARY_TACTICS';

-- ?????????????????????
insert or replace into Boosts
    (BoostID,   CivicType,                                  Boost,  TriggerDescription,                                     TriggerLongDescription,                                             Unit1Type,      BoostClass,                                         Unit2Type,      BuildingType,   ImprovementType,        BoostingTechType,           ResourceType,   NumItems,   DistrictType,           RequiresResource)
values
    (201,       'CIVIC_LITERARY_TRADITION_HD',              40,     'LOC_BOOST_TRIGGER_LITERARY_TRADITION_HD',              'LOC_BOOST_TRIGGER_LONGDESC_LITERARY_TRADITION_HD',                 Null,           'BOOST_TRIGGER_RESEARCH_TECH',                      Null,           Null,           Null,                   'TECH_PAPER_MAKING_HD',     Null,           0,          Null,                   0),
    (202,       'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD',     40,     'LOC_BOOST_TRIGGER_IMPERIAL_EXAMINATION_SYSTEM_HD',     'LOC_BOOST_TRIGGER_LONGDESC_IMPERIAL_EXAMINATION_SYSTEM_HD',        Null,           'BOOST_TRIGGER_HAVE_X_DISTRICTS',                   Null,           Null,           Null,                   Null,                       Null,           2,          'DISTRICT_CAMPUS',      0),
    (203,       'CIVIC_EVOLUTION_THEORY_HD',                40,     'LOC_BOOST_TRIGGER_EVOLUTION_THEORY_HD',                'LOC_BOOST_TRIGGER_LONGDESC_EVOLUTION_THEORY_HD',                   Null,           'BOOST_TRIGGER_NONE_LATE_GAME_CRITICAL_TECH',       Null,           Null,           Null,                   Null,                       Null,           1,          Null,                   0),
    (204,       'CIVIC_HISTORICAL_PHILOSOPHY_HD',           40,     'LOC_BOOST_TRIGGER_HISTORICAL_PHILOSOPHY_HD',           'LOC_BOOST_TRIGGER_LONGDESC_HISTORICAL_PHILOSOPHY_HD',              Null,           'BOOST_TRIGGER_HAVE_X_DISTRICTS',                   Null,           Null,           Null,                   Null,                       Null,           3,          'DISTRICT_THEATER',     0),
    (205,       'CIVIC_ETHICS_HD',                          40,     'LOC_BOOST_TRIGGER_ETHICS_HD',                          'LOC_BOOST_TRIGGER_LONGDESC_ETHICS_HD',                             Null,           'BOOST_TRIGGER_RESEARCH_TECH',                      Null,           Null,           Null,                   'TECH_PRINTING',            Null,           0,          Null,                   0),
    (206,       'CIVIC_SOCIAL_SCIENCE_HD',                  40,     'LOC_BOOST_TRIGGER_SOCIAL_SCIENCE_HD',                  'LOC_BOOST_TRIGGER_LONGDESC_SOCIAL_SCIENCE_HD',                     Null,           'BOOST_TRIGGER_HAVE_X_UNIQUE_SPECIALTY_DISTRICTS',  Null,           Null,           Null,                   Null,                       Null,           7,          Null,                   0);

-- ????????????????????????
insert or replace into Boosts
    (BoostID,   TechnologyType,                             Boost,  TriggerDescription,                                     TriggerLongDescription,                                             Unit1Type,                   BoostClass,                                         Unit2Type,      BuildingType,       ImprovementType,              BoostingTechType,        BoostingCivicType,          ResourceType,   NumItems,   DistrictType,           RequiresResource)
values
    (250,       'TECH_CALENDAR_HD',                         40,     'LOC_BOOST_TRIGGER_CALENDAR_HD',                       'LOC_BOOST_TRIGGER_LONGDESC_CALENDAR_HD',                            Null,                        'BOOST_TRIGGER_HAVE_X_BUILDINGS',                   Null,           'BUILDING_GRANARY', Null,                         Null,                    Null,                       Null,           1,          Null,                   0),
    (251,       'TECH_PAPER_MAKING_HD',                     40,     'LOC_BOOST_TRIGGER_PAPER_MAKING_HD',                   'LOC_BOOST_TRIGGER_LONGDESC_PAPER_MAKING_HD',                        Null,                        'BOOST_TRIGGER_HAVE_X_IMPROVEMENTS',                Null,           Null,               'IMPROVEMENT_PLANTATION',     Null,                    Null,                       Null,           1,          Null,                   0),
    (252,       'TECH_COMPASS_HD',                          40,     'LOC_BOOST_TRIGGER_COMPASS_HD',                        'LOC_BOOST_TRIGGER_LONGDESC_COMPASS_HD',                             Null,                        'BOOST_TRIGGER_RESEARCH_TECH',                      Null,           Null,               Null,                         'TECH_MATHEMATICS',      Null,                       Null,           0,          Null,                   0),
    (253,       'TECH_PHYSICS_HD',                          40,     'LOC_BOOST_TRIGGER_PHYSICS_HD',                        'LOC_BOOST_TRIGGER_LONGDESC_PHYSICS_HD',                             'UNIT_GREAT_SCIENTIST',      'BOOST_TRIGGER_TRAIN_UNIT',                         Null,           Null,               Null,                         Null,                    Null,                       Null,           0,          Null,                   0),
    (254,       'TECH_BIOLOGY_HD',                          40,     'LOC_BOOST_TRIGGER_BIOLOGY_HD',                        'LOC_BOOST_TRIGGER_LONGDESC_BIOLOGY_HD',                             Null,                        'BOOST_TRIGGER_HAVE_X_BUILDINGS',                   Null,           'BUILDING_ZOO',     Null,                         Null,                    Null,                       Null,           1,          Null,                   0),
    (255,       'TECH_CIVIL_ENGINEERING_HD',                40,     'LOC_BOOST_TRIGGER_CIVIL_ENGINEERING_HD',              'LOC_BOOST_TRIGGER_LONGDESC_CIVIL_ENGINEERING_HD',                   Null,                        'BOOST_TRIGGER_HAVE_X_BUILDINGS',                   Null,           'BUILDING_WORKSHOP',Null,                         Null,                    Null,                       Null,           2,          Null,                   0);

-- ??????????????? ?????????????????????&????????????
    -- ?????????????????????????????????????????????????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC', Unit1Type = Null, NumItems = 0,
    BoostingCivicType = 'CIVIC_IMPERIAL_EXAMINATION_SYSTEM_HD' where TechnologyType = 'TECH_EDUCATION';
    -- ???????????????????????????????????????????????????2?????????
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_CATAPULT', NumItems = 2,
    DistrictType = Null where TechnologyType = 'TECH_MILITARY_ENGINEERING';
    -- ?????????????????????????????????????????????1?????????
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_APOSTLE', NumItems = 1,
    BuildingType = Null where CivicType = 'CIVIC_DIVINE_RIGHT';
    -- ??????????????????????????????????????????2?????????
--update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_BUILDINGS', NumItems = 2,
--    BuildingType = 'BUILDING_TEMPLE' where CivicType = 'CIVIC_REFORMED_CHURCH';
    -- ?????????????????????????????????????????????????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_RESEARCH_TECH', Unit1Type = Null, NumItems = 0,
    BoostingTechType = 'TECH_THE_WHEEL' where CivicType = 'CIVIC_DEFENSIVE_TACTICS';
    -- ??????????????????????????????????????????2???????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_OBSERVATION_BALLOON',
    NumItems = 2 where TechnologyType = 'TECH_FLIGHT';
    -- ???????????????????????????????????????????????????????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_CULTURVATE_CIVIC',
    BoostingCivicType = 'CIVIC_COLONIALISM' where TechnologyType = 'TECH_RADIO';
    -- ????????????????????????????????????????????????2????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_TRAIN_UNIT', Unit1Type = 'UNIT_FIGHTER',
    NumItems = 2 where TechnologyType = 'TECH_GUIDANCE_SYSTEMS';
    -- ?????????????????????????????????????????????5?????????
update Boosts set NumItems = 5 where BoostID = 15;
    -- ??????????????????????????????????????????????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_IMPROVE_SPECIFIC_RESOURCE', ImprovementType = 'IMPROVEMENT_MINE', 
    ResourceType = 'RESOURCE_ALUMINUM', NumItems = 0, GovernmentTierType = NULL where TechnologyType = 'TECH_COMPUTERS';
    -- ????????????????????????????????????????????????????????????????????????????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_UNIT_AND_IMPROVEMENT', 
    Unit1Type = 'UNIT_HELICOPTER' where TechnologyType = 'TECH_NANOTECHNOLOGY';
    -- ?????????????????????????????????????????????4????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_X_DISTRICTS', BuildingType = NULL, 
    NumItems = 4, DistrictType = 'DISTRICT_INDUSTRIAL_ZONE' where TechnologyType = 'TECH_INDUSTRIALIZATION';
    -- ???????????????????????????????????????2?????????
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_ALLIANCE_LEVEL_X', NumItems = 2 where CivicType = 'CIVIC_DIPLOMATIC_SERVICE';
    -- ?????????????????????????????????????????????????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_NONE_LATE_GAME_CRITICAL_TECH', NumItems = 0, TriggerDescription = 'LOC_BOOST_TRIGGER_MUST_STEAL_NO_GREAT_SCIENTIST', 
    TriggerLongDescription = 'Critical late game tech - boost description not needed' where TechnologyType = 'TECH_CHEMISTRY';
    -- ??????????????????????????????????????????????????????????????????????????????????????????
update Boosts set BoostClass = 'BOOST_TRIGGER_HAVE_UNIT_AND_IMPROVEMENT', ImprovementType = 'IMPROVEMENT_MINE', 
    ResourceType = 'RESOURCE_NITER', Unit1Type = 'UNIT_CARAVEL' where TechnologyType = 'TECH_SQUARE_RIGGING';
    -- ??????????????????????????????????????????????????????????????????
--update Boosts set BoostClass = 'BOOST_TRIGGER_KILL_WITH', ImprovementType = NULL, 
--    ResourceType = Null, Unit1Type = 'UNIT_MUSKETMAN' where TechnologyType = 'TECH_RIFLING';
--??????????????????????????????????????????
--by ??????
update Boosts set BoostClass = "BOOST_TRIGGER_TRAIN_UNIT", NumItems = 2, Unit1Type = "UNIT_BOMBARD",
    ImprovementType = NULL, ResourceType = NULL where TechnologyType ="TECH_RIFLING";

-- update boost ratio at last
update Boosts set Boost = 34 where Boost = 40;
