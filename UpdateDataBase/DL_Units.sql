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

update Units set Cost = 75, CostProgressionParam1 = 5 where UnitType = 'UNIT_MISSIONARY';
update Units set Cost = 150, CostProgressionParam1 = 10 where UnitType = 'UNIT_APOSTLE';
update Units set Cost = 75, CostProgressionParam1 = 5 where UnitType = 'UNIT_INQUISITOR';
update Units set Cost = 120, CostProgressionParam1 = 10 where UnitType = 'UNIT_GURU';

update Units set Cost = 250 where UnitType = 'UNIT_ARCHAEOLOGIST';
update Units set Cost = 30 where UnitType = 'UNIT_SCOUT';
update Units set Cost = 35 where UnitType = 'UNIT_CREE_OKIHTCITAW';
update Units set Cost = 120 where UnitType = 'UNIT_SKIRMISHER';
update Units set Cost = 120 where UnitType = 'UNIT_INCA_WARAKAQ';
update Units set Cost = 300 where UnitType = 'UNIT_RANGER';
update Units set Cost = 300 where UnitType = 'UNIT_SCOTTISH_HIGHLANDER';
update Units set Cost = 450 where UnitType = 'UNIT_SPEC_OPS';

update Units set Cost = 180 where UnitType = 'UNIT_SULEIMAN_JANISSARY';

-- add worker's basic building charges
update Units set BuildCharges = 4 where UnitType = 'UNIT_BUILDER';
update Units set BuildCharges = 3 and BaseMoves = 3 where UnitType = 'UNIT_MILITARY_ENGINEER';

-- UNIT_MILITARY_ENGINEER
update Routes_XP2 set BuildWithUnitChargeCost = 0;
update District_BuildChargeProductions set PercentProductionPerCharge = 30;
--delete from Unit_BuildingPrereqs where Unit = 'UNIT_MILITARY_ENGINEER' and PrereqBuilding = 'BUILDING_ARMORY';
insert or replace into Route_ResourceCosts
    (RouteType,                 ResourceType,       BuildWithUnitCost)
values
    ('ROUTE_ANCIENT_ROAD',      'RESOURCE_HORSES',  1),
    ('ROUTE_MEDIEVAL_ROAD',     'RESOURCE_HORSES',  1),
    ('ROUTE_INDUSTRIAL_ROAD',   'RESOURCE_IRON',    1),
    ('ROUTE_MODERN_ROAD',       'RESOURCE_IRON',    1);

insert or replace into Route_ValidBuildUnits
    (RouteType,                 UnitType)
values
    ('ROUTE_ANCIENT_ROAD',      'UNIT_ROMAN_LEGION'),
    ('ROUTE_MEDIEVAL_ROAD',     'UNIT_ROMAN_LEGION');
/*
insert or replace into BuildingModifiers
	(BuildingType,					ModifierId)
values
    ('BUILDING_ARMORY',				'ARMORY_MILITARY_ENGINEER_PURCHASE_DISCOUNT');

insert or replace into Modifiers
	(ModifierId,											ModifierType)
values
	('ARMORY_MILITARY_ENGINEER_PURCHASE_GOLD_DISCOUNT',		'MODIFIER_SINGLE_CITY_ADJUST_UNIT_PURCHASE_COST');

insert or replace into ModifierArguments
	(ModifierId,									    Name,			Value)
values
	('ARMORY_MILITARY_ENGINEER_PURCHASE_GOLD_DISCOUNT',	'UnitType',	    'UNIT_MILITARY_ENGINEER'),
    ('ARMORY_MILITARY_ENGINEER_PURCHASE_GOLD_DISCOUNT',	'Amount',	    20);*/

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
-- update Units set PrereqCivic = 'CIVIC_MEDIEVAL_FAIRES' where UnitType ='UNIT_INDONESIAN_JONG';

update Units set
	CostProgressionModel = 'COST_PROGRESSION_PREVIOUS_COPIES',
	CostProgressionParam1 = 25,
	Cost = 200
where UnitType = 'UNIT_SPY';

update Units set Cost = 50 where UnitType = 'UNIT_SPEARMAN';
update Units set Cost = 55 where UnitType = 'UNIT_GREEK_HOPLITE';
update Units set Cost = 90 where UnitType = 'UNIT_HORSEMAN';
update Units set RangedCombat = 28 where UnitType = 'UNIT_PERSIAN_IMMORTAL';

update Units set BaseMoves = 1, Range = 3 where UnitType = 'UNIT_CHINESE_CROUCHING_TIGER';

update Units set ObsoleteCivic = null where UnitType = 'UNIT_SIEGE_TOWER';	
update Units set ObsoleteCivic = null where UnitType = 'UNIT_BATTERING_RAM';

--guru abilitity free promotion (combat_strength and movement bonus)
--todo

--worrior monk and nihang can have siege_tower and Battering_ram bonus
--to do
--update Units set PrereqCivic = 'CIVIC_THEOLOGY' where UnitType = 'UNIT_WARRIOR_MONK';
update Units set PrereqCivic = 'CIVIC_DIPLOMATIC_SERVICE' where UnitType ='UNIT_POLISH_HUSSAR';
update Units set Combat = 67 where UnitType = 'UNIT_POLISH_HUSSAR';