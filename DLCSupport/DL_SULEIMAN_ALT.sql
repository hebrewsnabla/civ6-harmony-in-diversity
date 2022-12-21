delete from TraitModifiers where ModifierId = 'TRAIT_SULEIMAN_ALT_SCIENCE_CULTURE_GOLDEN_AGE' or ModifierId = 'SULEIMAN_ALT_COMBAT_ABILITY';
--update Modifiers set SubjectStackLimit = 1 where ModifierId in (select ModifierId from CommemorationModifiers);

create temporary table HD_SULEIMAN
	(CommemorationType text not null,
	ModifierId text not null primary key,
	MinimumGameEra text not null,
	MaximumGameEra text not null);

insert or replace into HD_SULEIMAN
	(CommemorationType,		ModifierId,			MinimumGameEra,			MaximumGameEra)
select
	t.CommemorationType,	ModifierId,			MinimumGameEra,			case when MaximumGameEra != NULL then MaximumGameEra else 'ERA_FUTURE' end
from (CommemorationTypes t inner join CommemorationModifiers m on t.CommemorationType = m.CommemorationType);
insert or replace into TraitModifiers
	(TraitType,								ModifierId)
select
	'TRAIT_LEADER_SULEIMAN_ALT',    		ModifierId || '_ATTACH'
from HD_SULEIMAN;
insert or replace into Modifiers
	(ModifierId,					ModifierType,										SubjectRequirementSetId)
select
	ModifierId || '_ATTACH',		'MODIFIER_PLAYER_ATTACH_MODIFIER',					MinimumGameEra || '_' || MaximumGameEra
from HD_SULEIMAN;
insert or replace into ModifierArguments
	(ModifierId,					Name,					Value)
select
	ModifierId || '_ATTACH',		'ModifierId',			ModifierId
from HD_SULEIMAN;
insert or ignore into RequirementSets
	(RequirementSetId,								RequirementSetType)
select distinct
	MinimumGameEra || '_' || MaximumGameEra,		'REQUIREMENTSET_TEST_ANY'
from HD_SULEIMAN;
insert or ignore into RequirementSetRequirements
	(RequirementSetId,								RequirementId)
select distinct
	MinimumGameEra || '_' || MaximumGameEra,		'REQUIRES_ERA_IS_' || EraType
from (HD_SULEIMAN s cross join Eras e) where (select ChronologyIndex from Eras er where er.EraType = MinimumGameEra) <= e.ChronologyIndex and (select ChronologyIndex from Eras er where er.EraType = MaximumGameEra) >= e.ChronologyIndex;