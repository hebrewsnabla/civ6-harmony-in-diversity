-------------------------------------
--      GreatWorks Adjustments     --
-------------------------------------

update GlobalParameters set Value = 5 where Name = 'GREATWORK_ART_LOCK_TIME';

update GreatWorks set Tourism = 3 where GreatWorkObjectType = 'GREATWORKOBJECT_WRITING';
update GreatWorks set Tourism = 6 where GreatWorkObjectType = 'GREATWORKOBJECT_MUSIC';

update GreatWorks set Tourism = 4 where GreatWorkObjectType = 'GREATWORKOBJECT_ARTIFACT';
update GreatWorks set Tourism = 4
 where GreatWorkObjectType = 'GREATWORKOBJECT_SCULPTURE'
	or GreatWorkObjectType = 'GREATWORKOBJECT_RELIGIOUS'
	or GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE'
	or GreatWorkObjectType = 'GREATWORKOBJECT_PORTRAIT';

-- replace into GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
-- 	select GreatWorkType, 'YIELD_CULTURE', '3' from GreatWorks where GreatWorkObjectType = 'GREATWORKOBJECT_WRITING';
replace into GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
	select GreatWorkType, 'YIELD_CULTURE', 3 from GreatWorks where GreatWorkObjectType = 'GREATWORKOBJECT_WRITING';
replace into GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
	select GreatWorkType, 'YIELD_CULTURE', 6 from GreatWorks where GreatWorkObjectType = 'GREATWORKOBJECT_MUSIC';

replace into GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
	select GreatWorkType, 'YIELD_CULTURE', 4 from GreatWorks where GreatWorkObjectType = 'GREATWORKOBJECT_ARTIFACT';
replace into GreatWork_YieldChanges (GreatWorkType, YieldType, YieldChange)
	select GreatWorkType, 'YIELD_CULTURE', 4 from GreatWorks
 where GreatWorkObjectType = 'GREATWORKOBJECT_SCULPTURE'
	or GreatWorkObjectType = 'GREATWORKOBJECT_RELIGIOUS'
	or GreatWorkObjectType = 'GREATWORKOBJECT_LANDSCAPE'
	or GreatWorkObjectType = 'GREATWORKOBJECT_PORTRAIT';

