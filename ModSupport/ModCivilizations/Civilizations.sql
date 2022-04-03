-- ZIMBABWE bug fix
update ModifierArguments set YieldType = 'YIELD_GOLD' where ModifierId = 'GEDEMO_ZIMBABWE_TRAIT_GOLD_IMPROVEMENT_PLANTATION_TRADE';
-- ZIMBABWE UA UI LA
-- update ModifierArguments set Amount = 1 where ModifierId = 'GEDEMO_ZIMBABWE_TRAIT_CULTURE_IMPROVEMENT_PLANTATION_TRADE';

-- delete from TraitModifiers where ModifierId = DZIMBABWE_BUFF_ADJACENT_TILES;
-- update Modifiers set SubjectRequirementSetId = 'MUTOTA_PLAYER_HAS_FEUDALISM_REQUIREMENTS' where ModifierId = 'DZIMBABWE_AMENITY_MAX_ONE';
-- insert or replace into Improvement_Adjacencies
-- 	(ImprovementType,				YieldChangeId)
-- values
--     ('IMPROVEMENT_GEDEMO_DZIMBABWE','IMPROVEMENT_GEDEMO_DZIMBABWE_Adjacency_Plantation'),
--     ('IMPROVEMENT_GEDEMO_DZIMBABWE','IMPROVEMENT_GEDEMO_DZIMBABWE_Adjacency_Camp'),
--     ('IMPROVEMENT_GEDEMO_DZIMBABWE','IMPROVEMENT_GEDEMO_DZIMBABWE_Adjacency_Pasture');
-- insert or replace into Adjacency_YieldChanges
-- 	(ID,								Description,	YieldType,			YieldChange,	TilesRequired)
-- values
--     ('IMPROVEMENT_GEDEMO_DZIMBABWE_Adjacency_Plantation', 'Placeholder', 'YIELD_FOOD', 1, 1),
--     ('IMPROVEMENT_GEDEMO_DZIMBABWE_Adjacency_Camp', 'Placeholder', 'YIELD_FOOD', 1, 1),
--     ('IMPROVEMENT_GEDEMO_DZIMBABWE_Adjacency_Pasture', 'Placeholder', 'YIELD_FOOD', 1, 1, );


