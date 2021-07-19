-------------------------------------
--          Australia DLC          --
-------------------------------------

insert or replace into Adjacency_YieldChanges
    (ID,                        Description,    YieldType,      YieldChange,    TilesRequired,  AdjacentImprovement)
values
    ('Pasture_Outback_Food',    'Placeholder', 'YIELD_FOOD',    1,              2,              'IMPROVEMENT_OUTBACK_STATION');

update Adjacency_YieldChanges set PrereqCivic = NULL where ID = 'Outback_Outback_Food'; 

insert or replace into Improvement_Adjacencies
    (ImprovementType,       YieldChangeId)
values
    ('IMPROVEMENT_PASTURE', 'Pasture_Outback_Food');
