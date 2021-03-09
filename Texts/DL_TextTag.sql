-- Insert text tag for new texts.

update Technologies set Description = 'LOC_TECH_THE_WHEEL_DESCRIPTION' where TechnologyType = 'TECH_THE_WHEEL';
update Technologies set Description = 'LOC_TECH_MACHINERY_DESCRIPTION' where TechnologyType ='TECH_MACHINERY';
update Technologies set Description = 'LOC_TECH_RIFLING_DESCRIPTION' where TechnologyType ='TECH_RIFLING';
-- update Technologies set Description = NULL where TechnologyType ='TECH_APPRENTICESHIP';
update Technologies set Description = NULL where TechnologyType ='TECH_ROCKETRY';
update Technologies set Description = 'LOC_TECH_CONSTRUCTION_DESCRIPTION' where TechnologyType ='TECH_CONSTRUCTION';
update Technologies set Description = 'LOC_TECH_TELECOMMUNICATIONS_DESCRIPTION' where TechnologyType ='TECH_TELECOMMUNICATIONS';
update Technologies set Description = 'LOC_TECH_ARCHERY_DESCRIPTION' where TechnologyType ='TECH_ARCHERY';	
update Civics set Description = 'LOC_CIVIC_CIVIL_SERVICE_DESCRIPTION' where CivicType ='CIVIC_CIVIL_SERVICE';
update Civics set Description = 'LOC_CIVIC_GUILDS_DESCRIPTION' where CivicType ='CIVIC_GUILDS';
update Civics set Description = 'LOC_CIVIC_MEDIEVAL_FAIRES_DESCRIPTION' where CivicType ='CIVIC_MEDIEVAL_FAIRES';
update Civics set Description = NULL where CivicType ='CIVIC_COLONIALISM';
update Civics set Description = NULL where CivicType ='CIVIC_FEUDALISM';

update Buildings set Description = 'LOC_BUILDING_GRANARY_DESCRIPTION' where BuildingType = 'BUILDING_GRANARY';
update Buildings set Description = 'LOC_BUILDING_UNIVERSITY_DESCRIPTION' where BuildingType = 'BUILDING_UNIVERSITY';
update Buildings set Description = 'LOC_BUILDING_RESEARCH_LAB_DESCRIPTION' where BuildingType = 'BUILDING_RESEARCH_LAB';
update Buildings set Description = 'LOC_BUILDING_LIBRARY_DESCRIPTION' where BuildingType = 'BUILDING_LIBRARY';
update Buildings set Description = 'LOC_BUILDING_AMPHITHEATER_DESCRIPTION' where BuildingType = 'BUILDING_AMPHITHEATER';
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

update Beliefs set Description = 'LOC_BELIEF_CATHEDRAL_DL_DESCRIPTION' where BeliefType = 'BELIEF_CATHEDRAL';
update Beliefs set Description = 'LOC_BELIEF_GURDWARA_DL_DESCRIPTION' where BeliefType = 'BELIEF_GURDWARA';
update Beliefs set Description = 'LOC_BELIEF_MEETING_HOUSE_DL_DESCRIPTION' where BeliefType = 'BELIEF_MEETING_HOUSE';
update Beliefs set Description = 'LOC_BELIEF_MOSQUE_DL_DESCRIPTION' where BeliefType = 'BELIEF_MOSQUE';
update Beliefs set Description = 'LOC_BELIEF_PAGODA_DL_DESCRIPTION' where BeliefType = 'BELIEF_PAGODA';
update Beliefs set Description = 'LOC_BELIEF_SYNAGOGUE_DL_DESCRIPTION' where BeliefType = 'BELIEF_SYNAGOGUE';
update Beliefs set Description = 'LOC_BELIEF_WAT_DL_DESCRIPTION' where BeliefType = 'BELIEF_WAT';
update Beliefs set Description = 'LOC_BELIEF_STUPA_DL_DESCRIPTION' where BeliefType = 'BELIEF_STUPA';
update Beliefs set Description = 'LOC_BELIEF_DAR_E_MEHR_DL_DESCRIPTION' where BeliefType = 'BELIEF_DAR_E_MEHR';

update Civics set Description = 'LOC_CIVIC_CIVIL_SERVICE_DESCRIPTION' where CivicType = 'CIVIC_CIVIL_SERVICE';

update Improvements set Description = 'LOC_IMPROVEMENT_FARM_DL_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_FARM';
update Improvements set Description = 'LOC_IMPROVEMENT_FISHING_BOATS_DL_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_FISHING_BOATS';
update Improvements set Description = 'LOC_IMPROVEMENT_PASTURE_DL_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_PASTURE';
update Improvements set Description = 'LOC_IMPROVEMENT_CAMP_DL_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_CAMP';
update Improvements set Description = 'LOC_IMPROVEMENT_MINE_DL_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_MINE';
update Improvements set Description = 'LOC_IMPROVEMENT_QUARRY_DL_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_QUARRY';
update Improvements set Description = 'LOC_IMPROVEMENT_PLANTATION_DL_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_PLANTATION';
update Improvements set Description = 'LOC_IMPROVEMENT_LUMBER_MILL_DL_DESCRIPTION' where ImprovementType = 'IMPROVEMENT_LUMBER_MILL';

update Districts set Description = 'LOC_DISTRICT_HOLY_SITE_DL_DESCRIPTION' where DistrictType ='DISTRICT_HOLY_SITE';
update Districts set Description = 'LOC_DISTRICT_AQUEDUCT_DL_DESCRIPTION' where DistrictType ='DISTRICT_AQUEDUCT';
-- update Districts set Description = 'LOC_DISTRICT_BATH_DL_DESCRIPTION' where DistrictType ='DISTRICT_BATH';
update Districts set Description = 'LOC_DISTRICT_HARBOR_DL_DESCRIPTION' where DistrictType ='DISTRICT_HARBOR';
-- update Districts set Description = 'LOC_DISTRICT_COTHON_DL_DESCRIPTION' where DistrictType ='DISTRICT_COTHON';
-- update Districts set Description = 'LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_DL_DESCRIPTION' where DistrictType ='DISTRICT_ROYAL_NAVY_DOCKYARD';
-- update Districts set Description = 'LOC_DISTRICT_IKANDA_DL_DESCRIPTION' where DistrictType ='DISTRICT_IKANDA';
update Districts set Description = 'LOC_DISTRICT_ENCAMPMENT_DL_DESCRIPTION' where DistrictType ='DISTRICT_ENCAMPMENT';
-- update Districts set Description = 'LOC_DISTRICT_MBANZA_DL_DESCRIPTION' where DistrictType ='DISTRICT_MBANZA';
update Districts set Description = 'LOC_DISTRICT_AERODROME_DL_DESCRIPTION' where DistrictType ='DISTRICT_AERODROME';

update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_OXFORD_UNIVERSITY' where BuildingType = 'BUILDING_OXFORD_UNIVERSITY';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_GREAT_LIBRARY' where BuildingType = 'BUILDING_GREAT_LIBRARY';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_HERMITAGE' where BuildingType = 'BUILDING_HERMITAGE';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_SYDNEY_OPERA_HOUSE' where BuildingType = 'BUILDING_SYDNEY_OPERA_HOUSE';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_APADANA' where BuildingType = 'BUILDING_APADANA';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_GOV_CULTURE' where BuildingType = 'BUILDING_GOV_CULTURE';

update Policies set Description = 'LOC_POLICY_RAID_DL_DESCRIPTION' where PolicyType = 'POLICY_RAID';
update Policies set Description = 'LOC_POLICY_TOTAL_WAR_DL_DESCRIPTION' where PolicyType = 'POLICY_TOTAL_WAR';
update Policies set Description = 'LOC_POLICY_EQUESTRIAN_ORDERS_DL_DESCRIPTION' where PolicyType = 'POLICY_EQUESTRIAN_ORDERS';
update Policies set Description = 'LOC_POLICY_DRILL_MANUALS_DL_DESCRIPTION' where PolicyType = 'POLICY_DRILL_MANUALS';
update Policies set Description = 'LOC_POLICY_RESOURCE_MANAGEMENT_DL_DESCRIPTION' where PolicyType = 'POLICY_RESOURCE_MANAGEMENT';
update Policies set Description = 'LOC_POLICY_SIMULTANEUM_DL_DESCRIPTION' where PolicyType = 'POLICY_SIMULTANEUM';

update Policies set Description = 'LOC_POLICY_SCIENCE_FOUNDATIONS_DL_DESCRIPTION' where PolicyType = 'POLICY_NOBEL_PRIZE';

update Units set Description = 'LOC_UNIT_BUILDER_DL_DESCRIPTION' where UnitType = 'UNIT_BUILDER';
