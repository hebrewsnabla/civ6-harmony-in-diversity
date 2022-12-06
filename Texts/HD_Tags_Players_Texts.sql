-- Insert new text tag for replaced texts.

--------------------------------------------------------------------------------
-- Major Civs

-- UD
update PlayerItems set Description = 'LOC_DISTRICT_LAVRA_HD_DESCRIPTION'
    where Type = 'DISTRICT_LAVRA' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_HANSA_HD_DESCRIPTION'
    where Type = 'DISTRICT_HANSA' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_OPPIDUM_HD_DESCRIPTION'
    where Type = 'DISTRICT_OPPIDUM' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_COTHON_HD_DESCRIPTION'
    where Type = 'DISTRICT_COTHON' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_ROYAL_NAVY_DOCKYARD_HD_DESCRIPTION'
    where Type = 'DISTRICT_ROYAL_NAVY_DOCKYARD' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_IKANDA_HD_DESCRIPTION'
    where Type = 'DISTRICT_IKANDA' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_MBANZA_HD_DESCRIPTION'
    where Type = 'DISTRICT_MBANZA' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_ACROPOLIS_HD_DESCRIPTION'
    where Type = 'DISTRICT_ACROPOLIS' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_WATER_STREET_CARNIVAL_HD_DESCRIPTION'
    where Type = 'DISTRICT_WATER_STREET_CARNIVAL' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_STREET_CARNIVAL_HD_DESCRIPTION'
    where Type = 'DISTRICT_STREET_CARNIVAL' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_HIPPODROME_HD_DESCRIPTION'
    where Type = 'DISTRICT_HIPPODROME' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_SUGUBA_HD_DESCRIPTION'
    where Type = 'DISTRICT_SUGUBA' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_SEOWON_HD_DESCRIPTION'
    where Type = 'DISTRICT_SEOWON' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_OBSERVATORY_HD_DESCRIPTION'
    where Type = 'DISTRICT_OBSERVATORY' and Domain = 'Players:Expansion2_Players';
update PlayerItems set Description = 'LOC_DISTRICT_THANH_HD_DESCRIPTION'
    where Type = 'DISTRICT_THANH' and Domain = 'Players:Expansion2_Players';

insert into PlayerItems
    (Domain,                        CivilizationType,              LeaderType,              Type,                       Icon,                               Name,                                   Description,                                    SortIndex)
values
    ("Players:Expansion1_Players",  "CIVILIZATION_NETHERLANDS",    "LEADER_WILHELMINA",     "IMPROVEMENT_LAND_POLDER",  "ICON_IMPROVEMENT_LAND_POLDER",     "LOC_IMPROVEMENT_LAND_POLDER_NAME",     "LOC_IMPROVEMENT_LAND_POLDER_DESCRIPTION",      31),
    ("Players:Expansion2_Players",  "CIVILIZATION_NETHERLANDS",    "LEADER_WILHELMINA",     "IMPROVEMENT_LAND_POLDER",  "ICON_IMPROVEMENT_LAND_POLDER",     "LOC_IMPROVEMENT_LAND_POLDER_NAME",     "LOC_IMPROVEMENT_LAND_POLDER_DESCRIPTION",      31);

update PlayerItems set SortIndex = 30 where Type = 'IMPROVEMENT_POLDER';

insert into PlayerItems
    (Domain,                        CivilizationType,              LeaderType,              Type,                       Icon,                               Name,                                   Description,                                    SortIndex)
select
    "Players:Expansion2_Players",  "CIVILIZATION_AMERICA",   	   "LEADER_T_ROOSEVELT",    "BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS",  "ICON_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS",     "LOC_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_NAME",     "LOC_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_DESCRIPTION",      31
where exists (select CivilizationType from Players where CivilizationType = 'CIVILIZATION_ETHIOPIA');
insert into PlayerItems
    (Domain,                        CivilizationType,              LeaderType,              Type,                       Icon,                               Name,                                   Description,                                    SortIndex)
select
    "Players:Expansion2_Players",  "CIVILIZATION_AMERICA",   	   "LEADER_T_ROOSEVELT_ROUGHRIDER",    "BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS",  "ICON_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS",     "LOC_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_NAME",     "LOC_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_DESCRIPTION",      31
where exists (select CivilizationType from Players where CivilizationType = 'CIVILIZATION_ETHIOPIA');
insert into PlayerItems
    (Domain,                        CivilizationType,              LeaderType,              Type,                       Icon,                               Name,                                   Description,                                    SortIndex)
select
    "Players:Expansion2_Players",  "CIVILIZATION_AMERICA",   	   "LEADER_ABRAHAM_LINCOLN",    "BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS",  "ICON_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS",     "LOC_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_NAME",     "LOC_BUILDING_HD_WORLD_PARLIAMENT_HEADQUARTERS_DESCRIPTION",      31
where exists (select CivilizationType from Players where CivilizationType = 'CIVILIZATION_ETHIOPIA') and exists (select LeaderType from Players where LeaderType = 'LEADER_ABRAHAM_LINCOLN');