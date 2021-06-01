-------------------------------------
--     Temp Testing Adjustments    --
-------------------------------------

update Buildings set Cost = 360 where BuildingType = 'BUILDING_FACTORY';

delete from Building_YieldChangesBonusWithPower where BuildingType = 'BUILDING_FACTORY';
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'BUILDING_FACTORY' and YieldType = 'YIELD_PRODUCTION';

update Building_YieldChangesBonusWithPower set YieldChange = 3 where BuildingType = 'BUILDING_ELECTRONICS_FACTORY' and YieldType = 'YIELD_PRODUCTION';
update Building_YieldChanges set YieldChange = 6 where BuildingType = 'BUILDING_ELECTRONICS_FACTORY' and YieldType = 'YIELD_PRODUCTION';
