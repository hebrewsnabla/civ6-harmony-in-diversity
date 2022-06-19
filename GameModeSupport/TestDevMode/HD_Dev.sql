-- 城邦效果调整
-- 安善 和文艺学院冲突 未转正
delete from TraitModifiers where TraitType = 'MINOR_CIV_BABYLON_TRAIT' and ModifierId = 'MINOR_CIV_BABYLON_CAMPUS_TIER1_BONUS';
delete from TraitModifiers where TraitType = 'MINOR_CIV_BABYLON_TRAIT' and ModifierId = 'MINOR_CIV_BABYLON_THEATER_TIER1_BONUS';
insert or replace into TraitModifiers
    (TraitType,                             ModifierId)
values
    ('MINOR_CIV_BABYLON_TRAIT',             'MINOR_CIV_BABYLON_WRITING_BONUS');

-- 荷兰跳探索 未转正
insert or replace into GlobalParameters (Name,  Value) values ('NETHERLANDS_EXPLORATION',  1);