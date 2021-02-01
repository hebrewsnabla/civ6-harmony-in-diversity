-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

-- The Worships mod already did the support for religious city state bonus.
-- The citizen yield are already done by the mod.

-- The new buildings
-- 'BUILDING_JNR_CANDI'
-- 'BUILDING_JNR_DAOGUAN'
-- 'BUILDING_JNR_JINJA'
-- 'BUILDING_JNR_KHALWAT'
-- 'BUILDING_JNR_MANDIR'
-- 'BUILDING_JNR_MBARI'
-- 'BUILDING_JNR_PERIPTEROS'
-- 'BUILDING_JNR_SOBOR'
-- 'BUILDING_JNR_TZACUALLI'

-- The yield of original building will be adjusted again in the main part of our mod.
-- Need to setup the Building_YieldChanges for the new buildings.


-- Need to update the Maintenance (and cost) for the new buildings.
-- e.g. all 4 golds.


-- Need to assign special effect for 3-rd tier holy site buildings.


-- Text updates
update Beliefs set Description = 'LOC_BELIEF_JNR_CANDI_DL_DESCRIPTION' 			where BeliefType = 'BELIEF_JNR_CANDI';
update Beliefs set Description = 'LOC_BELIEF_JNR_DAOGUAN_DL_DESCRIPTION' 		where BeliefType = 'BELIEF_JNR_DAOGUAN';
update Beliefs set Description = 'LOC_BELIEF_JNR_JINJA_DL_DESCRIPTION' 			where BeliefType = 'BELIEF_JNR_JINJA';
update Beliefs set Description = 'LOC_BELIEF_JNR_KHALWAT_DL_DESCRIPTION' 		where BeliefType = 'BELIEF_JNR_KHALWAT';
update Beliefs set Description = 'LOC_BELIEF_JNR_MANDIR_DL_DESCRIPTION' 		where BeliefType = 'BELIEF_JNR_MANDIR';
update Beliefs set Description = 'LOC_BELIEF_JNR_MBARI_DL_DESCRIPTION' 			where BeliefType = 'BELIEF_JNR_MBARI';
update Beliefs set Description = 'LOC_BELIEF_JNR_PERIPTEROS_DL_DESCRIPTION' 	where BeliefType = 'BELIEF_JNR_PERIPTEROS';
update Beliefs set Description = 'LOC_BELIEF_JNR_SOBOR_DL_DESCRIPTION' 			where BeliefType = 'BELIEF_JNR_SOBOR';
update Beliefs set Description = 'LOC_BELIEF_JNR_TZACUALLI_DL_DESCRIPTION' 		where BeliefType = 'BELIEF_JNR_TZACUALLI';

update Buildings set Description = 'LOC_BUILDING_JNR_CANDI_DL_DESCRIPTION'		where BuildingType = 'BUILDING_JNR_CANDI';
update Buildings set Description = 'LOC_BUILDING_JNR_DAOGUAN_DL_DESCRIPTION'	where BuildingType = 'BUILDING_JNR_DAOGUAN';
update Buildings set Description = 'LOC_BUILDING_JNR_JINJA_DL_DESCRIPTION'		where BuildingType = 'BUILDING_JNR_JINJA';
update Buildings set Description = 'LOC_BUILDING_JNR_KHALWAT_DL_DESCRIPTION'	where BuildingType = 'BUILDING_JNR_KHALWAT';
update Buildings set Description = 'LOC_BUILDING_JNR_MANDIR_DL_DESCRIPTION'		where BuildingType = 'BUILDING_JNR_MANDIR';
update Buildings set Description = 'LOC_BUILDING_JNR_MBARI_DL_DESCRIPTION'		where BuildingType = 'BUILDING_JNR_MBARI';
update Buildings set Description = 'LOC_BUILDING_JNR_PERIPTEROS_DL_DESCRIPTION'	where BuildingType = 'BUILDING_JNR_PERIPTEROS';
update Buildings set Description = 'LOC_BUILDING_JNR_SOBOR_DL_DESCRIPTION'		where BuildingType = 'BUILDING_JNR_SOBOR';
update Buildings set Description = 'LOC_BUILDING_JNR_TZACUALLI_DL_DESCRIPTION'	where BuildingType = 'BUILDING_JNR_TZACUALLI';
