
--[[ =======================================================================

	HD Custom Unit Commands - Definitions

		Data and callbacks for enabling custom unit commands to appear and 
		work in the Unit Panel UI. These definitions mimic what appears in 
		data for common unit commands, and are used in the replacement 
		UnitPanel script.

-- =========================================================================]]

m_HDUnitCommands = {};

--[[ =======================================================================
	SACRIFICE

	Usable by Builders to sacrifice.
-- =========================================================================]]
m_HDUnitCommands.SACRIFICE = {};
m_HDUnitCommands.SACRIFICE.Properties = {};

-- UI Data
m_HDUnitCommands.SACRIFICE.EventName		= "HD_Aztec_Sacrifice";
m_HDUnitCommands.SACRIFICE.CategoryInUI		= "SPECIFIC";
m_HDUnitCommands.SACRIFICE.Icon				= "ICON_UNITCOMMAND_AZTEC_SACRIFICE";
m_HDUnitCommands.SACRIFICE.ToolTipString	= Locale.Lookup("LOC_UNITCOMMAND_SACRIFICE_NAME") .. "[NEWLINE][NEWLINE]" .. 
												Locale.Lookup("LOC_UNITCOMMAND_SACRIFICE_DESCRIPTION");
m_HDUnitCommands.SACRIFICE.DisabledToolTipString = Locale.Lookup("LOC_UNITCOMMAND_SACRIFICE_DISABLED_TT");
m_HDUnitCommands.SACRIFICE.VisibleInUI	= true;

----CivilizationandLeaderHasTrait
function CivilizationHasTrait(sCiv, sTrait)
	for tRow in GameInfo.CivilizationTraits() do
		if (tRow.CivilizationType == sCiv and tRow.TraitType == sTrait) then
			return true
		end
	end
	return false
end

function LeaderHasTrait(sLeader, sTrait)
	for tRow in GameInfo.LeaderTraits() do
		if (tRow.LeaderType == sLeader and tRow.TraitType == sTrait) then return true end
	end
	return false
end

-- ===========================================================================
function m_HDUnitCommands.SACRIFICE.CanUse(pUnit : object)
	if (pUnit == nil) then
		return false;
	end

	return GameInfo.Units[pUnit:GetType()].UnitType == "UNIT_BUILDER";
	-- or GameInfo.Units[pUnit:GetType()].UnitType == "UNIT_MILITARY_ENGINEER";
end

-- ===========================================================================
function m_HDUnitCommands.SACRIFICE.IsVisible(pUnit : object)
	local playerID = pUnit:GetOwner();
	local player = Players[playerID];
	local playerConfig = PlayerConfigurations[playerID]
	local sLeader = playerConfig:GetLeaderTypeName()
	local sMontezumaTrair = 'TRAIT_LEADER_GIFTS_FOR_TLATOANI'
	if LeaderHasTrait(sLeader, sMontezumaTrair) then
		return pUnit ~= nil and pUnit:GetMovesRemaining() > 0;
	end
	return false;
end

-- ===========================================================================
function m_HDUnitCommands.SACRIFICE.IsDisabled(pUnit : object)
	if (pUnit == nil or pUnit:GetMovesRemaining() == 0) then
		return true;
	end

	local iPlotId : number = pUnit:GetPlotId();
	local pPlot : object = Map.GetPlotByIndex(iPlotId);
	
	if (pPlot == nil) then
		return true;
	end
	
	if (not pPlot:GetOwner() == pUnit:GetOwner()) then
		return true;
	end
	local city = CityManager.GetCityAt(pUnit:GetX(), pUnit:GetY());
	
	return city == nil;
end

-- 垃圾回收中心的回收按钮, by xiaoxiao
m_HDUnitCommands.RECYCLE = {};
m_HDUnitCommands.RECYCLE.Properties = {};

-- UI Data
m_HDUnitCommands.RECYCLE.EventName = "HDRecyclingPlantRecycle";
m_HDUnitCommands.RECYCLE.CategoryInUI = "SPECIFIC";
m_HDUnitCommands.RECYCLE.Icon = "ICON_UNITCOMMAND_RECYCLE";
m_HDUnitCommands.RECYCLE.ToolTipString = Locale.Lookup("LOC_UNITCOMMAND_RECYCLE_NAME") .. "[NEWLINE][NEWLINE]" .. 
										Locale.Lookup("LOC_UNITCOMMAND_RECYCLE_DESCRIPTION");
m_HDUnitCommands.RECYCLE.DisabledToolTipString = Locale.Lookup("LOC_UNITCOMMAND_RECYCLE_DISABLED_TT");
m_HDUnitCommands.RECYCLE.VisibleInUI = true;
function m_HDUnitCommands.RECYCLE.CanUse(pUnit : object)
	if (pUnit == nil) then
		return false;
	end
	return GameInfo.Units[pUnit:GetType()].FormationClass == "FORMATION_CLASS_LAND_COMBAT";
end

local NEIGHBORHOOD_INDEX = GameInfo.Districts['DISTRICT_NEIGHBORHOOD'].Index;
local RECYCLING_PLANT_INDEX = GameInfo.Buildings['BUILDING_JNR_RECYCLING_PLANT'].Index;
function m_HDUnitCommands.RECYCLE.IsVisible(pUnit : object)
	if pUnit == nil then
		return;
	end
	local playerID = pUnit:GetOwner();
	local player = Players[playerID];
	local location = pUnit:GetLocation();
	local x = location.x;
	local y = location.y;
	local plot = Map.GetPlot(x, y);
	if plot:GetOwner() ~= playerID then
		return false;
	end
	local district = CityManager.GetDistrictAt(x, y);
	if district == nil then
		return false;
	end
	if district:GetType() ~= NEIGHBORHOOD_INDEX then
		return false;
	end
	local city = district:GetCity();
	return city:GetBuildings():HasBuilding(RECYCLING_PLANT_INDEX);
end

-- ===========================================================================
function m_HDUnitCommands.RECYCLE.IsDisabled(pUnit : object)
	if pUnit == nil then
		return true;
	end
	if pUnit:GetMovesRemaining() == 0 then
		return true;
	end
	print(pUnit:GetDamage());
	return pUnit:GetDamage() ~= 0;
end