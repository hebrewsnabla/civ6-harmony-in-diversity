-- Insert new text tag for replaced texts.

-------------------------------------------------------------------------------- 
-- Techs and Civics
update Technologies set Description = 'LOC_TECH_THE_WHEEL_DESCRIPTION' where TechnologyType = 'TECH_THE_WHEEL';
update Technologies set Description = 'LOC_TECH_MACHINERY_DESCRIPTION' where TechnologyType ='TECH_MACHINERY';
update Technologies set Description = 'LOC_TECH_RIFLING_DESCRIPTION' where TechnologyType ='TECH_RIFLING';
-- update Technologies set Description = NULL where TechnologyType ='TECH_APPRENTICESHIP';
update Technologies set Description = NULL where TechnologyType ='TECH_ROCKETRY';
update Technologies set Description = 'LOC_TECH_CONSTRUCTION_DESCRIPTION' where TechnologyType ='TECH_CONSTRUCTION';
update Technologies set Description = 'LOC_TECH_TELECOMMUNICATIONS_DESCRIPTION' where TechnologyType ='TECH_TELECOMMUNICATIONS';
update Technologies set Description = 'LOC_TECH_ARCHERY_DESCRIPTION' where TechnologyType ='TECH_ARCHERY';	
-- 
--update Technologies set Description = null where TechnologyType = 'TECH_STIRRUPS'; 
--update Technologies set Description = 'LOC_TECH_HORSEBACK_RIDING_DESCRIPTION' where TechnologyType = 'TECH_HORSEBACK_RIDING'; 

update Civics set Description = 'LOC_CIVIC_CIVIL_SERVICE_DL_DESCRIPTION' where CivicType ='CIVIC_CIVIL_SERVICE';
update Civics set Description = 'LOC_CIVIC_GUILDS_DL_DESCRIPTION' where CivicType ='CIVIC_GUILDS';
update Civics set Description = 'LOC_CIVIC_MEDIEVAL_FAIRES_DL_DESCRIPTION' where CivicType ='CIVIC_MEDIEVAL_FAIRES';
update Civics set Description = NULL where CivicType ='CIVIC_COLONIALISM';
update Civics set Description = 'LOC_CIVIC_FEUDALISM_DL_DESCRIPTION' where CivicType ='CIVIC_FEUDALISM';
update Civics set Description = 'LOC_CIVIC_MERCANTILISM_DL_DESCRIPTION' where CivicType ='CIVIC_MERCANTILISM';
update Civics set Description = 'LOC_CIVIC_GLOBALIZATION_DL_DESCRIPTION' where CivicType ='CIVIC_GLOBALIZATION';
update Civics set Description = 'LOC_CIVIC_ENVIRONMENTALISM_DL_DESCRIPTION' where CivicType ='CIVIC_ENVIRONMENTALISM';

--------------------------------------------------------------------------------
-- Buildings
update Buildings set Description = 'LOC_BUILDING_GRANARY_DESCRIPTION' where BuildingType = 'BUILDING_GRANARY';
update Buildings set Description = 'LOC_BUILDING_UNIVERSITY_DESCRIPTION' where BuildingType = 'BUILDING_UNIVERSITY';
update Buildings set Description = 'LOC_BUILDING_RESEARCH_LAB_DESCRIPTION' where BuildingType = 'BUILDING_RESEARCH_LAB';
update Buildings set Description = 'LOC_BUILDING_LIBRARY_DESCRIPTION' where BuildingType = 'BUILDING_LIBRARY';
-- update Buildings set Description = 'LOC_BUILDING_AMPHITHEATER_DESCRIPTION' where BuildingType = 'BUILDING_AMPHITHEATER';
update Buildings set Description = NULL where BuildingType = 'BUILDING_AMPHITHEATER';
update Buildings set Description = 'LOC_BUILDING_BROADCAST_CENTER_DESCRIPTION' where BuildingType = 'BUILDING_BROADCAST_CENTER';
update Buildings set Description = 'LOC_BUILDING_BANK_DESCRIPTION' where BuildingType = 'BUILDING_BANK';
update Buildings set Description = 'LOC_BUILDING_STOCK_EXCHANGE_DESCRIPTION' where BuildingType = 'BUILDING_STOCK_EXCHANGE';
update Buildings set Description = 'LOC_BUILDING_WORKSHOP_DESCRIPTION' where BuildingType = 'BUILDING_WORKSHOP';
update Buildings set Description = 'LOC_BUILDING_SEWER_DESCRIPTION' where BuildingType = 'BUILDING_SEWER';	

update Buildings set Description = 'LOC_BUILDING_CATHEDRAL_DL_DESCRIPTION' where BuildingType = 'BUILDING_CATHEDRAL';
update Buildings set Description = 'LOC_BUILDING_GURDWARA_DL_DESCRIPTION' where BuildingType = 'BUILDING_GURDWARA';
update Buildings set Description = 'LOC_BUILDING_MEETING_HOUSE_DL_DESCRIPTION' where BuildingType = 'BUILDING_MEETING_HOUSE';
update Buildings set Description = 'LOC_BUILDING_MOSQUE_DL_DESCRIPTION' where BuildingType = 'BUILDING_MOSQUE';
update Buildings set Description = 'LOC_BUILDING_SYNAGOGUE_DL_DESCRIPTION' where BuildingType = 'BUILDING_SYNAGOGUE';
update Buildings set Description = 'LOC_BUILDING_WAT_DL_DESCRIPTION' where BuildingType = 'BUILDING_WAT';
update Buildings set Description = 'LOC_BUILDING_STUPA_DL_DESCRIPTION' where BuildingType = 'BUILDING_STUPA';
update Buildings set Description = 'LOC_BUILDING_DAR_E_MEHR_DL_DESCRIPTION' where BuildingType = 'BUILDING_DAR_E_MEHR';
update Buildings set Description = 'LOC_BUILDING_PAGODA_DL_DESCRIPTION' where BuildingType = 'BUILDING_PAGODA';

update Buildings set Description = NULL where BuildingType = 'BUILDING_FERRIS_WHEEL';
update Buildings set Description = 'LOC_BUILDING_AQUARIUM_DL_DESCRIPTION' where BuildingType = 'BUILDING_AQUARIUM';
update Buildings set Description = 'LOC_BUILDING_AQUATICS_CENTER_DL_DESCRIPTION' where BuildingType = 'BUILDING_AQUATICS_CENTER';
update Buildings set Description = 'LOC_BUILDING_STADIUM_DL_DESCRIPTION' where BuildingType = 'BUILDING_STADIUM';

update Beliefs set Description = 'LOC_BELIEF_CATHEDRAL_DL_DESCRIPTION' where BeliefType = 'BELIEF_CATHEDRAL';
update Beliefs set Description = 'LOC_BELIEF_GURDWARA_DL_DESCRIPTION' where BeliefType = 'BELIEF_GURDWARA';
update Beliefs set Description = 'LOC_BELIEF_MEETING_HOUSE_DL_DESCRIPTION' where BeliefType = 'BELIEF_MEETING_HOUSE';
update Beliefs set Description = 'LOC_BELIEF_MOSQUE_DL_DESCRIPTION' where BeliefType = 'BELIEF_MOSQUE';
update Beliefs set Description = 'LOC_BELIEF_PAGODA_DL_DESCRIPTION' where BeliefType = 'BELIEF_PAGODA';
update Beliefs set Description = 'LOC_BELIEF_SYNAGOGUE_DL_DESCRIPTION' where BeliefType = 'BELIEF_SYNAGOGUE';
update Beliefs set Description = 'LOC_BELIEF_WAT_DL_DESCRIPTION' where BeliefType = 'BELIEF_WAT';
update Beliefs set Description = 'LOC_BELIEF_STUPA_DL_DESCRIPTION' where BeliefType = 'BELIEF_STUPA';
update Beliefs set Description = 'LOC_BELIEF_DAR_E_MEHR_DL_DESCRIPTION' where BeliefType = 'BELIEF_DAR_E_MEHR';

--------------------------------------------------------------------------------
-- Basic Improvements
update Improvements set Description = 'LOC_IMPROVEMENT_FARM_HD_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_FARM';
update Improvements set Description = 'LOC_IMPROVEMENT_FISHING_BOATS_HD_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_FISHING_BOATS';
update Improvements set Description = 'LOC_IMPROVEMENT_PASTURE_HD_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_PASTURE';
update Improvements set Description = 'LOC_IMPROVEMENT_CAMP_HD_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_CAMP';
update Improvements set Description = 'LOC_IMPROVEMENT_MINE_HD_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_MINE';
update Improvements set Description = 'LOC_IMPROVEMENT_QUARRY_HD_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_QUARRY';
update Improvements set Description = 'LOC_IMPROVEMENT_PLANTATION_HD_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_PLANTATION';
update Improvements set Description = 'LOC_IMPROVEMENT_LUMBER_MILL_HD_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';
update Improvements set Description = 'LOC_IMPROVEMENT_FISHERY_HD_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_FISHERY';
-- UI of Majors

-- UI of Minors

--------------------------------------------------------------------------------
-- Districts
update Districts set Description = 'LOC_DISTRICT_HOLY_SITE_HD_DESCRIPTION' where DistrictType = 'DISTRICT_HOLY_SITE';
update Districts set Description = 'LOC_DISTRICT_LAVRA_HD_DESCRIPTION' where DistrictType = 'DISTRICT_LAVRA';
update Districts set Description = 'LOC_DISTRICT_AQUEDUCT_HD_DESCRIPTION' where DistrictType = 'DISTRICT_AQUEDUCT';
update Districts set Description = 'LOC_DISTRICT_BATH_HD_DESCRIPTION' where DistrictType = 'DISTRICT_BATH';
update Districts set Description = 'LOC_DISTRICT_HANSA_HD_DESCRIPTION' where DistrictType = 'DISTRICT_HANSA';
update Districts set Description = 'LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION' where DistrictType = 'DISTRICT_OPPIDUM';
update Districts set Description = 'LOC_DISTRICT_HARBOR_HD_DESCRIPTION' where DistrictType = 'DISTRICT_HARBOR';
update Districts set Description = 'LOC_DISTRICT_COTHON_HD_DESCRIPTION' where DistrictType = 'DISTRICT_COTHON';
update Districts set Description = 'LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_HD_DESCRIPTION' where DistrictType = 'DISTRICT_ROYAL_NAVY_DOCKYARD';
update Districts set Description = 'LOC_DISTRICT_ENCAMPMENT_HD_DESCRIPTION' where DistrictType = 'DISTRICT_ENCAMPMENT';
update Districts set Description = 'LOC_DISTRICT_IKANDA_HD_DESCRIPTION' where DistrictType = 'DISTRICT_IKANDA';
update Districts set Description = 'LOC_DISTRICT_THANH_HD_DESCRIPTION' where DistrictType = 'DISTRICT_THANH';
update Districts set Description = 'LOC_DISTRICT_MBANZA_HD_DESCRIPTION' where DistrictType = 'DISTRICT_MBANZA';
update Districts set Description = 'LOC_DISTRICT_AERODROME_HD_DESCRIPTION' where DistrictType = 'DISTRICT_AERODROME';
update Districts set Description = 'LOC_DISTRICT_DIPLOMATIC_QUARTER_HD_DESCRIPTION' where DistrictType = 'DISTRICT_DIPLOMATIC_QUARTER';
update Districts set Description = 'LOC_DISTRICT_ACROPOLIS_HD_DESCRIPTION' where DistrictType = 'DISTRICT_ACROPOLIS';
update Districts set Description = 'LOC_DISTRICT_PRESERVE_HD_DESCRIPTION' where DistrictType = 'DISTRICT_PRESERVE';
update Districts set Description = 'LOC_DISTRICT_WATER_STREET_CARNIVAL_HD_DESCRIPTION' where DistrictType = 'DISTRICT_WATER_STREET_CARNIVAL';
update Districts set Description = 'LOC_DISTRICT_STREET_CARNIVAL_HD_DESCRIPTION' where DistrictType = 'DISTRICT_STREET_CARNIVAL';
update Districts set Description = 'LOC_DISTRICT_HIPPODROME_HD_DESCRIPTION' where DistrictType = 'DISTRICT_HIPPODROME';
update Districts set Description = 'LOC_DISTRICT_COMMERCIAL_HUB_HD_DESCRIPTION' where DistrictType = 'DISTRICT_COMMERCIAL_HUB';
update Districts set Description = 'LOC_DISTRICT_SUGUBA_HD_DESCRIPTION' where DistrictType = 'DISTRICT_SUGUBA';

--------------------------------------------------------------------------------
-- GreatWorks Theming
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_OXFORD_UNIVERSITY' where BuildingType = 'BUILDING_OXFORD_UNIVERSITY';

update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_HERMITAGE' where BuildingType = 'BUILDING_HERMITAGE';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_SYDNEY_OPERA_HOUSE' where BuildingType = 'BUILDING_SYDNEY_OPERA_HOUSE';
-- update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_APADANA' where BuildingType = 'BUILDING_APADANA';
--update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_GREAT_LIBRARY' where BuildingType = 'BUILDING_GREAT_LIBRARY';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_HERMITAGE' where BuildingType = 'BUILDING_HERMITAGE';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_SYDNEY_OPERA_HOUSE' where BuildingType = 'BUILDING_SYDNEY_OPERA_HOUSE';

update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_NEUSCHWANSTEIN' where BuildingType = 'BUILDING_NEUSCHWANSTEIN';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_UFFIZI' where BuildingType = 'BUILDING_UFFIZI';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_NOTRE_DAME' where BuildingType = 'BUILDING_NOTRE_DAME';

--------------------------------------------------------------------------------
-- Policies
update Policies set Description = 'LOC_POLICY_RAID_DL_DESCRIPTION' where PolicyType = 'POLICY_RAID';
update Policies set Description = 'LOC_POLICY_TOTAL_WAR_DL_DESCRIPTION' where PolicyType = 'POLICY_TOTAL_WAR';
update Policies set Description = 'LOC_POLICY_EQUESTRIAN_ORDERS_DL_DESCRIPTION' where PolicyType = 'POLICY_EQUESTRIAN_ORDERS';
update Policies set Description = 'LOC_POLICY_DRILL_MANUALS_DL_DESCRIPTION' where PolicyType = 'POLICY_DRILL_MANUALS';
update Policies set Description = 'LOC_POLICY_RESOURCE_MANAGEMENT_DL_DESCRIPTION' where PolicyType = 'POLICY_RESOURCE_MANAGEMENT';
update Policies set Description = 'LOC_POLICY_SIMULTANEUM_DL_DESCRIPTION' where PolicyType = 'POLICY_SIMULTANEUM';

update Policies set Description = 'LOC_POLICY_SCIENCE_FOUNDATIONS_DL_DESCRIPTION' where PolicyType = 'POLICY_NOBEL_PRIZE';

--------------------------------------------------------------------------------
-- Units
update Units set Description = 'LOC_UNIT_BUILDER_DL_DESCRIPTION' where UnitType = 'UNIT_BUILDER';

-- Unique Units