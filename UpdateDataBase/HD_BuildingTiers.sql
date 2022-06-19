-- create table at LoadOrder -1
-- edit between 0 and 12000
-- post process at LocaOrder 12001
create table if not exists HD_BuildingTiers (
    BuildingType text not null primary key,
    PrereqDistrict text not null,
    Tier int not null default 1
);
insert or replace into HD_BuildingTiers
    (BuildingType,  PrereqDistrict)
select
    BuildingType,   PrereqDistrict
from Buildings;