-- 荷兰跳探索 未转正
-- insert or replace into GlobalParameters (Name,  Value) values ('NETHERLANDS_EXPLORATION',  1);
update DiplomaticStateActions set Cost = 1000000 where DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
update DiplomaticActions set InitiatorPrereqCivic = 'CIVIC_FUTURE_CIVIC' where DiplomaticActionType = 'DIPLOACTION_OPEN_BORDERS';
update CivicModifiers set CivicType = 'CIVIC_FUTURE_CIVIC' where ModifierId = 'CIVIC_ENFORCE_BORDERS';