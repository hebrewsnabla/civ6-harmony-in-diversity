-- Insert new text tag for replaced texts.

-------------------------------------------------------------------------------- 
-- Techs and Civics

update Technologies set Description = 'LOC_TECH_ANIMAL_HUSBANDRY_HD_DESCRIPTION' where TechnologyType ='TECH_ANIMAL_HUSBANDRY';
update Technologies set Description = 'LOC_TECH_MINING_HD_DESCRIPTION' where TechnologyType ='TECH_MINING';
update Technologies set Description = 'LOC_TECH_MASONRY_HD_DESCRIPTION' where TechnologyType ='TECH_MASONRY';
update Technologies set Description = 'LOC_TECH_SAILING_HD_DESCRIPTION' where TechnologyType ='TECH_SAILING';
-- 
update Technologies set Description = 'LOC_TECH_ARCHERY_HD_DESCRIPTION' where TechnologyType ='TECH_ARCHERY';
update Technologies set Description = 'LOC_TECH_IRRIGATION_DESCRIPTION' where TechnologyType ='TECH_IRRIGATION';
update Technologies set Description = 'LOC_TECH_THE_WHEEL_HD_DESCRIPTION' where TechnologyType = 'TECH_THE_WHEEL';
update Technologies set Description = 'LOC_TECH_CELESTIAL_NAVIGATION_HD_DESCRIPTION' where TechnologyType ='TECH_CELESTIAL_NAVIGATION';
update Technologies set Description = 'LOC_TECH_CONSTRUCTION_HD_DESCRIPTION' where TechnologyType ='TECH_CONSTRUCTION';
-- update Technologies set Description = 'LOC_TECH_ENGINEERING_HD_DESCRIPTION' where TechnologyType = 'TECH_ENGINEERING';
-- update Technologies set Description = 'LOC_TECH_CURRENCY_HD_DESCRIPTION' where TechnologyType ='TECH_CURRENCY';
update Technologies set Description = 'LOC_TECH_APPRENTICESHIP_HD_DESCRIPTION' where TechnologyType ='TECH_APPRENTICESHIP';
update Technologies set Description = 'LOC_TECH_MACHINERY_HD_DESCRIPTION' where TechnologyType ='TECH_MACHINERY';
update Technologies set Description = NULL where TechnologyType = 'TECH_STIRRUPS';
update Technologies set Description = 'LOC_TECH_CASTLES_HD_DESCRIPTION' where TechnologyType = 'TECH_CASTLES';
update Technologies set Description = NULL where TechnologyType = 'TECH_ASTRONOMY';
update Technologies set Description = 'LOC_TECH_MASS_PRODUCTION_HD_DESCRIPTION' where TechnologyType = 'TECH_MASS_PRODUCTION';
-- update Technologies set Description = 'LOC_TECH_RIFLING_HD_DESCRIPTION' where TechnologyType ='TECH_RIFLING';
update Technologies set Description = 'LOC_TECH_SQUARE_RIGGING_HD_DESCRIPTION' where TechnologyType ='TECH_SQUARE_RIGGING';
update Technologies set Description = 'LOC_TECH_STEAM_POWER_HD_DESCRIPTION' where TechnologyType = 'TECH_STEAM_POWER';
update Technologies set Description = 'LOC_TECH_STEEL_HD_DESCRIPTION' where TechnologyType = 'TECH_STEEL';
update Technologies set Description = 'LOC_TECH_SCIENTIFIC_THEORY_HD_DESCRIPTION' where TechnologyType = 'TECH_SCIENTIFIC_THEORY';
update Technologies set Description = 'LOC_TECH_REPLACEABLE_PARTS_HD_DESCRIPTION' where TechnologyType ='TECH_REPLACEABLE_PARTS';
update Technologies set Description = 'LOC_TECH_TELECOMMUNICATIONS_HD_DESCRIPTION' where TechnologyType ='TECH_TELECOMMUNICATIONS';

update Technologies set Description = NULL where TechnologyType ='TECH_ROCKETRY';
-- update Technologies set Description = NULL where TechnologyType ='TECH_APPRENTICESHIP';
update Technologies set Description = 'LOC_TECH_HORSEBACK_RIDING_HD_DESCRIPTION' where TechnologyType = 'TECH_HORSEBACK_RIDING'; 

update Civics set Name = 'LOC_CIVIC_DEFENSIVE_TACTICS_HD_NAME' where CivicType ='CIVIC_DEFENSIVE_TACTICS';
update Civics set Name = 'LOC_CIVIC_NATURAL_HISTORY_HD_NAME' where CivicType ='CIVIC_NATURAL_HISTORY';

update Civics set Description = 'LOC_CIVIC_CIVIL_SERVICE_HD_DESCRIPTION' where CivicType ='CIVIC_CIVIL_SERVICE';
update Civics set Description = 'LOC_CIVIC_GUILDS_HD_DESCRIPTION' where CivicType ='CIVIC_GUILDS';
-- update Civics set Description = 'LOC_CIVIC_MEDIEVAL_FAIRES_HD_DESCRIPTION' where CivicType ='CIVIC_MEDIEVAL_FAIRES';
-- update Civics set Description = 'LOC_CIVIC_EXPLORATION_HD_DESCRIPTION' where CivicType ='CIVIC_EXPLORATION';
update Civics set Description = NULL where CivicType ='CIVIC_COLONIALISM';
update Civics set Description = 'LOC_CIVIC_FEUDALISM_HD_DESCRIPTION' where CivicType ='CIVIC_FEUDALISM';
update Civics set Description = NULL where CivicType ='CIVIC_MERCANTILISM'; -- LOC_CIVIC_MERCANTILISM_HD_DESCRIPTION
update Civics set Description = 'LOC_CIVIC_COLONIALISM_HD_DESCRIPTION' where CivicType ='CIVIC_COLONIALISM';
update Civics set Description = 'LOC_CIVIC_NATIONALISM_HD_DESCRIPTION' where CivicType ='CIVIC_NATIONALISM';
update Civics set Description = 'LOC_CIVIC_CIVIL_ENGINEERING_HD_DESCRIPTION' where CivicType ='CIVIC_CIVIL_ENGINEERING';
update Civics set Description = 'LOC_CIVIC_CONSERVATION_HD_DESCRIPTION' where CivicType ='CIVIC_CONSERVATION';
update Civics set Description = 'LOC_CIVIC_GLOBALIZATION_HD_DESCRIPTION' where CivicType ='CIVIC_GLOBALIZATION';
update Civics set Description = 'LOC_CIVIC_ENVIRONMENTALISM_HD_DESCRIPTION' where CivicType ='CIVIC_ENVIRONMENTALISM';
update Civics set Description = 'LOC_POLICY_FUTURE_VICTORY_CULTURE_DESCRIPTION' where CivicType ='CIVIC_CULTURAL_HEGEMONY'; --temp

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
update Buildings set Description = 'LOC_BUILDING_FACTORY_DL_DESCRIPTION' where BuildingType = 'BUILDING_FACTORY';
update Buildings set Description = 'LOC_BUILDING_COAL_POWER_PLANT_DL_DESCRIPTION' where BuildingType = 'BUILDING_COAL_POWER_PLANT';
update Buildings set Description = 'LOC_BUILDING_FOSSIL_FUEL_POWER_PLANT_DL_DESCRIPTION' where BuildingType = 'BUILDING_FOSSIL_FUEL_POWER_PLANT';
update Buildings set Description = 'LOC_BUILDING_POWER_PLANT_DL_DESCRIPTION' where BuildingType = 'BUILDING_POWER_PLANT';
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

update Buildings set Description = 'LOC_BUILDING_FERRIS_WHEEL_DESCRIPTION_HD' where BuildingType = 'BUILDING_FERRIS_WHEEL';
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
update Districts set Description = 'LOC_DISTRICT_INDUSTRIAL_ZONE_HD_DESCRIPTION' where DistrictType = 'DISTRICT_INDUSTRIAL_ZONE';
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
update Districts set Description = 'LOC_DISTRICT_CANAL_HD_DESCRIPTION' where DistrictType = 'DISTRICT_CANAL';
update Districts set Description = 'LOC_DISTRICT_DAM_HD_DESCRIPTION' where DistrictType = 'DISTRICT_DAM';
update Districts set Description = 'LOC_DISTRICT_SEOWON_HD_DESCRIPTION' where DistrictType = 'DISTRICT_SEOWON';
update Districts set Description = 'LOC_DISTRICT_WATER_ENTERTAINMENT_COMPLEX_HD_DESCRIPTION' where DistrictType = 'DISTRICT_WATER_ENTERTAINMENT_COMPLEX';
update Districts set Description = 'LOC_DISTRICT_THEATER_HD_DESCRIPTION' where DistrictType = 'DISTRICT_THEATER';


--------------------------------------------------------------------------------
-- GreatWorks Theming
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_OXFORD_UNIVERSITY' where BuildingType = 'BUILDING_OXFORD_UNIVERSITY';

update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_HERMITAGE' where BuildingType = 'BUILDING_HERMITAGE';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_SYDNEY_OPERA_HOUSE' where BuildingType = 'BUILDING_SYDNEY_OPERA_HOUSE';
-- update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_APADANA' where BuildingType = 'BUILDING_APADANA';
-- update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_GREAT_LIBRARY' where BuildingType = 'BUILDING_GREAT_LIBRARY';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_HERMITAGE' where BuildingType = 'BUILDING_HERMITAGE';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_SYDNEY_OPERA_HOUSE' where BuildingType = 'BUILDING_SYDNEY_OPERA_HOUSE';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_GOV_CULTURE' where BuildingType = 'BUILDING_GOV_CULTURE';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_NEUSCHWANSTEIN' where BuildingType = 'BUILDING_NEUSCHWANSTEIN';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_UFFIZI' where BuildingType = 'BUILDING_UFFIZI';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_NOTRE_DAME' where BuildingType = 'BUILDING_NOTRE_DAME';
update Building_GreatWorks set ThemingBonusDescription = 'LOC_BUILDING_THEMINGBONUS_DL_STPETERSBASILICA' where BuildingType = 'BUILDING_AL_STPETERSBASILICA';

--------------------------------------------------------------------------------
-- Policies
update Policies set Description = 'LOC_POLICY_RAID_DL_DESCRIPTION' where PolicyType = 'POLICY_RAID';
update Policies set Description = 'LOC_POLICY_TOTAL_WAR_DL_DESCRIPTION' where PolicyType = 'POLICY_TOTAL_WAR';
update Policies set Description = 'LOC_POLICY_EQUESTRIAN_ORDERS_DL_DESCRIPTION' where PolicyType = 'POLICY_EQUESTRIAN_ORDERS';
update Policies set Description = 'LOC_POLICY_DRILL_MANUALS_DL_DESCRIPTION' where PolicyType = 'POLICY_DRILL_MANUALS';
update Policies set Description = 'LOC_POLICY_RESOURCE_MANAGEMENT_DL_DESCRIPTION' where PolicyType = 'POLICY_RESOURCE_MANAGEMENT';
update Policies set Description = 'LOC_POLICY_SIMULTANEUM_DL_DESCRIPTION' where PolicyType = 'POLICY_SIMULTANEUM';

update Policies set Description = 'LOC_POLICY_SCIENCE_FOUNDATIONS_DL_DESCRIPTION' where PolicyType = 'POLICY_NOBEL_PRIZE';

-- Military
update Policies set Description = 'LOC_POLICY_AGOGE_HD_DESCRIPTION' where PolicyType = 'POLICY_AGOGE';
update Policies set Description = 'LOC_POLICY_FEUDAL_CONTRACT_HD_DESCRIPTION' where PolicyType = 'POLICY_FEUDAL_CONTRACT';
update Policies set Description = 'LOC_POLICY_GRANDE_ARMEE_HD_DESCRIPTION' where PolicyType = 'POLICY_GRANDE_ARMEE';
update Policies set Description = 'LOC_POLICY_MILITARY_FIRST_HD_DESCRIPTION' where PolicyType = 'POLICY_MILITARY_FIRST';

update Policies set Description = 'LOC_POLICY_MARITIME_INDUSTRIES_HD_DESCRIPTION' where PolicyType = 'POLICY_MARITIME_INDUSTRIES';
update Policies set Description = 'LOC_POLICY_PRESS_GANGS_HD_DESCRIPTION' where PolicyType = 'POLICY_PRESS_GANGS';
update Policies set Description = 'LOC_POLICY_INTERNATIONAL_WATERS_HD_DESCRIPTION' where PolicyType = 'POLICY_INTERNATIONAL_WATERS';

update Policies set Description = 'LOC_POLICY_LIGHTNING_WARFARE_HD_DESCRIPTION' where PolicyType = 'POLICY_LIGHTNING_WARFARE';

--------------------------------------------------------------------------------
-- Units
update Units set Description = 'LOC_UNIT_BUILDER_DL_DESCRIPTION' where UnitType = 'UNIT_BUILDER';

-- Unique Units




-- Late oprations
UPDATE Buildings SET Description = "{" || Description || "}{LOC_EPSTWEAK_WONDER_WORDING_TOURISM}" WHERE IsWonder = 1;
