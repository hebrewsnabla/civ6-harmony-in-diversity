-------------------------------------
--  Temporary update database sql  --
-------------------------------------

update Units set Combat = Combat - 3 where Combat > 45 and PromotionClass = 'PROMOTION_CLASS_HEAVY_CAVALRY';

delete from District_CitizenGreatPersonPoints where DistrictType = 'DISTRICT_SUGUBA';
delete from District_CitizenYieldChanges where DistrictType = 'DISTRICT_SUGUBA';
delete from DistrictModifiers where DistrictType = 'DISTRICT_SUGUBA';
update Districts set CitizenSlots = NULL where DistrictType = 'DISTRICT_SUGUBA';

insert or ignore into District_CitizenGreatPersonPoints (DistrictType,	GreatPersonClassType,	PointsPerTurn)
select CivUniqueDistrictType,	GreatPersonClassType,	PointsPerTurn from District_CitizenGreatPersonPoints, DistrictReplaces
where DistrictType = ReplacesDistrictType;

insert or replace into Districts (DistrictType, CitizenSlots)
select CivUniqueDistrictType,	CitizenSlots from Districts, DistrictReplaces
where DistrictType = ReplacesDistrictType and CivUniqueDistrictType != 'DISTRICT_SEOWON';

insert or ignore into District_CitizenYieldChanges  (DistrictType,	YieldType,	YieldChange)
select CivUniqueDistrictType,	YieldType,	YieldChange from District_CitizenYieldChanges, DistrictReplaces
where DistrictType = ReplacesDistrictType;

insert or ignore into DistrictModifiers   (DistrictType,	ModifierId)
select CivUniqueDistrictType,	ModifierId from DistrictModifiers, DistrictReplaces
where DistrictType = ReplacesDistrictType;