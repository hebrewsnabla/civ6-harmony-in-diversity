-------------------------------------
--         Units Adjustments       --
-------------------------------------
-- DL_RemoveGameCostEscalation
update Units set
	CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES',
	CostProgressionParam1 = 5,
	Cost = 40
where UnitType = 'UNIT_TRADER';

update Units set
	CostProgressionModel = 'NO_COST_PROGRESSION',
	CostProgressionParam1 = 0
 where UnitType = 'UNIT_LAHORE_NIHANG';
-- TODO increase NIHANG cost by techs.

update Units set Cost = 50, CostProgressionParam1 = 5 where UnitType = 'UNIT_MISSIONARY';
update Units set Cost = 150, CostProgressionParam1 = 10 where UnitType = 'UNIT_APOSTLE';
update Units set Cost = 75, CostProgressionParam1 = 5 where UnitType = 'UNIT_INQUISITOR';
update Units set Cost = 120, CostProgressionParam1 = 10 where UnitType = 'UNIT_GURU';

-- add worker's basic building charges
update Units set BuildCharges = 4 where UnitType = 'UNIT_BUILDER';
update Units set BuildCharges = 3 where UnitType = 'UNIT_MILITARY_ENGINEER';

-- balance adjustments
-- update Units set Cost = 70 where UnitType = 'UNIT_SETTLER';
-- update Units set Cost = 45, CostProgressionParam1 = 3 where UnitType = 'UNIT_BUILDER';
-- update Units set Cost = 25 where UnitType = 'UNIT_SCOUT';
-- update Units set Cost = 30 where UnitType = 'UNIT_SLINGER';
-- update Units set Cost = 30 where UnitType = 'UNIT_BABYLONIAN_SABUM_KIBITTUM';
-- update Units set Cost = 35 where UnitType = 'UNIT_WARRIOR';
-- update Units set Cost = 150, CostProgressionParam1 = 50 where UnitType = 'UNIT_SPY';


--update the civis requirment of WINGHUSSAR to DIVINE RIGHT

update Units set PrereqCivic = 'CIVIC_DIVINE_RIGHT' where UnitType ='UNIT_POLISH_HUSSAR';
update Units set PrereqCivic = 'CIVIC_GUILDS' where UnitType ='UNIT_OTTOMAN_BARBARY_CORSAIR';

update Units set
	CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES',
	CostProgressionParam1 = 25,
	Cost = 200
where UnitType = 'UNIT_SPY';
