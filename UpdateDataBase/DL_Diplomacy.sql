-------------------------------------
--      Diplomacy Adjustments      --
-------------------------------------

update DiplomaticActions set InitiatorPrereqCivic = 'CIVIC_DIVINE_RIGHT' where DiplomaticActionType = 'DIPLOACTION_DECLARE_HOLY_WAR';
update DiplomaticActions set InitiatorPrereqCivic = 'CIVIC_FEUDALISM' where DiplomaticActionType = 'DIPLOACTION_DECLARE_TERRITORIAL_WAR';

-- update DiplomaticStateActions set Cost = 20 where StateType = 'DIPLO_STATE_ALLIED' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
-- update DiplomaticStateActions set Cost = 40 where StateType = 'DIPLO_STATE_DECLARED_FRIEND' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
-- update DiplomaticStateActions set Cost = 40 where StateType = 'DIPLO_STATE_FRIENDLY' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
-- update DiplomaticStateActions set Cost = 60 where StateType = 'DIPLO_STATE_NEUTRAL' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
-- update DiplomaticStateActions set Cost = 80 where StateType = 'DIPLO_STATE_UNFRIENDLY' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
-- update DiplomaticStateActions set Cost = 1000 where StateType = 'DIPLO_STATE_DENOUNCED' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';

-- update DiplomaticStateActions set Cost = 0 where StateType = 'DIPLO_STATE_ALLIED' and DiplomaticActionType = 'DIPLOACTION_OPEN_BORDERS';
-- update DiplomaticStateActions set Cost = -20 where StateType = 'DIPLO_STATE_DECLARED_FRIEND' and DiplomaticActionType = 'DIPLOACTION_OPEN_BORDERS';
-- update DiplomaticStateActions set Cost = -20 where StateType = 'DIPLO_STATE_FRIENDLY' and DiplomaticActionType = 'DIPLOACTION_OPEN_BORDERS';
-- update DiplomaticStateActions set Cost = -40 where StateType = 'DIPLO_STATE_NEUTRAL' and DiplomaticActionType = 'DIPLOACTION_OPEN_BORDERS';
-- update DiplomaticStateActions set Cost = -60 where StateType = 'DIPLO_STATE_UNFRIENDLY' and DiplomaticActionType = 'DIPLOACTION_OPEN_BORDERS';
-- update DiplomaticStateActions set Cost = 1000 where StateType = 'DIPLO_STATE_DENOUNCED' and DiplomaticActionType = 'DIPLOACTION_OPEN_BORDERS';

update DiplomaticStateActions set Cost = 5 where StateType = 'DIPLO_STATE_ALLIED' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
update DiplomaticStateActions set Cost = 10 where StateType = 'DIPLO_STATE_DECLARED_FRIEND' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
update DiplomaticStateActions set Cost = 10 where StateType = 'DIPLO_STATE_FRIENDLY' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
update DiplomaticStateActions set Cost = 15 where StateType = 'DIPLO_STATE_NEUTRAL' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
update DiplomaticStateActions set Cost = 20 where StateType = 'DIPLO_STATE_UNFRIENDLY' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';
update DiplomaticStateActions set Cost = 1000 where StateType = 'DIPLO_STATE_DENOUNCED' and DiplomaticActionType = 'DIPLOACTION_PROPOSE_TRADE';

-- Useless for adjust trading.
-- update GlobalParameters set Value = 0 where Name = 'AI_BASE_LUXURY_VALUE';

-- attempt to enable surprise war during declared friend state.
-- insert into DiplomaticStateActions (StateType, DiplomaticActionType, Worth, Cost) values 
-- 	('DIPLO_STATE_DECLARED_FRIEND', 'DIPLOACTION_DECLARE_SURPRISE_WAR', 0, 0)
-- ;
-- delete from DiplomaticStateActions where DiplomaticActionType = 'DIPLOACTION_DECLARE_SURPRISE_WAR';

-- Make declare friend harder.
-- update DiplomaticStateTransitions set RequireTransitionMax = 35, AllowTransitionMin = 15 where
-- 	BaseState = 'DIPLO_STATE_FRIENDLY' and TransitionState = 'DIPLO_STATE_DECLARED_FRIEND';

-- lower the one side trades influence.
update ModifierArguments set Value = 50 where
	ModifierId = 'STANDARD_DIPLOMATIC_ONE_SIDED_TRADES' and Name = 'TradeValuePerModifierPoint';

update ModifierArguments set Value = 6 where
	ModifierId = 'STANDARD_DIPLOMATIC_WARMONGER' and Name = 'PercentOfGrievances';
-- 第三方文明因不满产出的不满
update ModifierArguments set Value = 3 where
	ModifierId = 'STANDARD_DIPLOMATIC_THIRD_PARTY_WARMONGER' and Name = 'PercentOfGrievancesDelta';

insert or replace into ModifierArguments
    (ModifierId,                                                    Name,                   Value)
values
    ('STANDARD_DIPLOMACY_TRADE_RELATIONS',                          'TradeBonus',           4);

-- 宗教好感和异教红字
insert or replace into ModifierArguments
    (ModifierId,                                                    Name,                   Value)
values
    ('AGENDA_INTOLERANT_SAME_RELIGION',                          	'InitialValue',         9),
	('AGENDA_INTOLERANT_ENCROACHING_RELIGION',                      'InitialValue',         -12);