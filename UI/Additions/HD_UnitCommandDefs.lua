
--[[ =======================================================================

	HD Custom Unit Commands - Definitions

		Data and callbacks for enabling custom unit commands to appear and 
		work in the Unit Panel UI. These definitions mimic what appears in 
		data for common unit commands, and are used in the replacement 
		UnitPanel script.

-- =========================================================================]]
if ExposedMembers.DLHD == nil then
    ExposedMembers.DLHD = {};
end

Utils = ExposedMembers.DLHD.Utils;

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
	if pUnit == nil then
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
	if pUnit == nil or pUnit:GetMovesRemaining() == 0 then
		return true;
	end

	local iPlotId : number = pUnit:GetPlotId();
	local pPlot : object = Map.GetPlotByIndex(iPlotId);
	
	if pPlot == nil then
		return true;
	end
	
	if not pPlot:GetOwner() == pUnit:GetOwner() then
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
	if pUnit == nil then
		return false;
	end
	local formationClass = GameInfo.Units[pUnit:GetType()].FormationClass;
	return formationClass == 'FORMATION_CLASS_LAND_COMBAT' or formationClass == 'FORMATION_CLASS_AIR' or formationClass == 'FORMATION_CLASS_NAVAL';
end

local RECYCLING_PLANT_INDEX;
if GameInfo.Buildings['BUILDING_JNR_RECYCLING_PLANT'] ~= nil then
	RECYCLING_PLANT_INDEX = GameInfo.Buildings['BUILDING_JNR_RECYCLING_PLANT'].Index;
end
function m_HDUnitCommands.RECYCLE.IsVisible(pUnit : object)
	if pUnit == nil then
		return;
	end
	if GlobalParameters.RECYCLING_PLANT_PRODUCTION_PERCENT == nil then
		return false;
	end
	local formationClass = GameInfo.Units[pUnit:GetType()].FormationClass;
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
	local districtInfo = GameInfo.Districts[district:GetType()];
	local districtType = districtInfo.DistrictType;
	for row in GameInfo.DistrictReplaces() do
		if row.CivUniqueDistrictType == districtType then
			districtType = row.ReplacesDistrictType;
			break;
		end
	end
	if (formationClass == 'FORMATION_CLASS_LAND_COMBAT' or formationClass == 'FORMATION_CLASS_AIR') and districtType ~= 'DISTRICT_NEIGHBORHOOD' then
		return false;
	end
	if (formationClass == 'FORMATION_CLASS_NAVAL') and districtType ~= 'DISTRICT_HARBOR' then
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
	return pUnit:GetDamage() ~= 0;
end

-- 奇琴伊察的献祭按钮, by xiaoxiao
m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA = {};
m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.Properties = {};

-- UI Data
m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.EventName = "HDChiChenItzaSacrifice";
m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.CategoryInUI = "SPECIFIC";
m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.Icon = "ICON_UNITCOMMAND_SACRIFICE_CHICHEN_ITZA";
m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.ToolTipString = Locale.Lookup("LOC_UNITCOMMAND_SACRIFICE_CHICHEN_ITZA_NAME") .. "[NEWLINE][NEWLINE]" .. 
										Locale.Lookup("LOC_UNITCOMMAND_SACRIFICE_CHICHEN_ITZA_DESCRIPTION");
m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.DisabledToolTipString = Locale.Lookup("LOC_UNITCOMMAND_SACRIFICE_CHICHEN_ITZA_DISABLED_TT");
m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.VisibleInUI = true;
function m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.CanUse(pUnit : object)
	if pUnit == nil then
		return false;
	end
	return GameInfo.Units[pUnit:GetType()].FormationClass == "FORMATION_CLASS_LAND_COMBAT";
end

local SACRIFICED_CHICHEN_ITZA_KEY = 'SACRIFICED_CHICHEN_ITZA';
local CHICHEN_ITZA_INDEX = GameInfo.Buildings['BUILDING_CHICHEN_ITZA'].Index;
function m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.IsVisible(pUnit : object)
	local ownerId = pUnit:GetOwner();
	local owner = Players[ownerId];
	if not Utils.PlayerHasWonder(owner, CHICHEN_ITZA_INDEX) then
		return false;
	end
	local unitType = GameInfo.Units[pUnit:GetType()].UnitType;
	local sacrificed = owner:GetProperty(SACRIFICED_CHICHEN_ITZA_KEY) or {};
	if sacrificed[unitType] then
		return false;
	end
	return true;
end

-- ===========================================================================
function m_HDUnitCommands.SACRIFICE_CHICHEN_ITZA.IsDisabled(pUnit : object)
	if pUnit == nil then
		return true;
	end
	if pUnit:GetMovesRemaining() == 0 then
		return true;
	end
	local location = pUnit:GetLocation();
	local x = location.x;
	local y = location.y;
	local plot = Map.GetPlot(x, y);
	return (plot:GetWonderType() ~= CHICHEN_ITZA_INDEX) or (pUnit:GetDamage() ~= 0);
end

-- 高德院的出家按钮, by xiaoxiao
m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN = {};
m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.Properties = {};

-- UI Data
m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.EventName = "HDKotokuInPravrajya";
m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.CategoryInUI = "SPECIFIC";
m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.Icon = "ICON_UNITCOMMAND_PRAVRAJYA_KOTOKU_IN";
m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.ToolTipString = Locale.Lookup("LOC_UNITCOMMAND_PRAVRAJYA_KOTOKU_IN_NAME") .. "[NEWLINE][NEWLINE]" .. 
										Locale.Lookup("LOC_UNITCOMMAND_PRAVRAJYA_KOTOKU_IN_DESCRIPTION");
m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.DisabledToolTipString = Locale.Lookup("LOC_UNITCOMMAND_PRAVRAJYA_KOTOKU_IN_DISABLED_TT");
m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.VisibleInUI = true;
function m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.CanUse(pUnit : object)
	if pUnit == nil then
		return false;
	end
	local unitInfo = GameInfo.Units[pUnit:GetType()];
	return (unitInfo.FormationClass == "FORMATION_CLASS_CIVILIAN") and (unitInfo.ReligiousStrength == 0);
end

local KOTOKU_IN_INDEX = GameInfo.Buildings['BUILDING_KOTOKU_IN'].Index;
function m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.IsVisible(pUnit : object)
	local ownerId = pUnit:GetOwner();
	local owner = Players[ownerId];
	return Utils.PlayerHasWonder(owner, KOTOKU_IN_INDEX);
end

-- ===========================================================================
function m_HDUnitCommands.PRAVRAJYA_KOTOKU_IN.IsDisabled(pUnit : object)
	if pUnit == nil then
		return true;
	end
	if pUnit:GetMovesRemaining() == 0 then
		return true;
	end
	local location = pUnit:GetLocation();
	local x = location.x;
	local y = location.y;
	local plot = Map.GetPlot(x, y);
	return plot:GetWonderType() ~= KOTOKU_IN_INDEX;
end

-- 津巴布韦津巴布韦探路者 记录奢侈按钮, by xiaoxiao
local PATHFINDER_RESOURCE_KEY = "PATHFINDER_RESOURCE";
local PATHFINDER_TIME_KEY = "PATHFINDER_TIME";
m_HDUnitCommands.PATHFINDER_RECORD = {};
m_HDUnitCommands.PATHFINDER_RECORD.Properties = {};

-- UI Data
m_HDUnitCommands.PATHFINDER_RECORD.EventName = "HDPathfinderRecord";
m_HDUnitCommands.PATHFINDER_RECORD.CategoryInUI = "SPECIFIC";
m_HDUnitCommands.PATHFINDER_RECORD.Icon = "ICON_UNITCOMMAND_RECYCLE";
m_HDUnitCommands.PATHFINDER_RECORD.DoNotDelete = true;
m_HDUnitCommands.PATHFINDER_RECORD.GetToolTipString = function (unit)
	-- basic
	local s = Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_RECORD_NAME");
	-- currently recording
	if unit == nil then
		return s;
	end
	local resourceId = unit:GetProperty(PATHFINDER_RESOURCE_KEY);
	if resourceId ~= nil then
		local resourceInfo = GameInfo.Resources[resourceId];
		if resourceInfo ~= nil then
			s = s .. "[NEWLINE]" .. Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_RECORD_RECORDING") .. " [ICON_" .. resourceInfo.ResourceType .. '] ' .. Locale.Lookup(resourceInfo.Name);
		end
	end
	-- resource on plot
	local location = unit:GetLocation();
	local plot = Map.GetPlot(location.x, location.y);
	local resourceId = plot:GetResourceType();
	if resourceId ~= -1 then
		local resourceInfo = GameInfo.Resources[resourceId];
		if resourceInfo.ResourceClassType == 'RESOURCECLASS_LUXURY' then
			s = s .. "[NEWLINE]" .. Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_RECORD_CURRENT") .. " [ICON_" .. resourceInfo.ResourceType .. '] ' .. Locale.Lookup(resourceInfo.Name);
		end
	end
	return s;
end
m_HDUnitCommands.PATHFINDER_RECORD.DisabledToolTipString = Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_RECORD_DISABLED_TT");
m_HDUnitCommands.PATHFINDER_RECORD.VisibleInUI = true;
function m_HDUnitCommands.PATHFINDER_RECORD.CanUse(pUnit : object)
	if pUnit == nil then
		return false;
	end
	local unitInfo = GameInfo.Units[pUnit:GetType()];
	if unitInfo == nil then
		return false;
	end
	return unitInfo.UnitType == 'UNIT_ZIMBABWE_PATHFINDER';
end

function m_HDUnitCommands.PATHFINDER_RECORD.IsVisible(pUnit : object)
	if pUnit == nil then
		return false;
	end
	local times = pUnit:GetProperty(PATHFINDER_TIME_KEY) or 0;
	return times < (GlobalParameters.PATHFINDER_ACTIVATION_CHARGE or 0);
end

function m_HDUnitCommands.PATHFINDER_RECORD.IsDisabled(pUnit : object)
	if pUnit == nil then
		return true;
	end
	local location = pUnit:GetLocation();
	local plot = Map.GetPlot(location.x, location.y);
	local resourceId = plot:GetResourceType();
	if resourceId ~= -1 then
		local resourceInfo = GameInfo.Resources[resourceId];
		if resourceInfo.ResourceClassType == 'RESOURCECLASS_LUXURY' then
			return false;
		end
	end
	return true;
end

-- 津巴布韦津巴布韦探路者 种植奢侈按钮, by xiaoxiao
m_HDUnitCommands.PATHFINDER_PLANT = {};
m_HDUnitCommands.PATHFINDER_PLANT.Properties = {};

-- UI Data
m_HDUnitCommands.PATHFINDER_PLANT.EventName = "HDPathfinderPlant";
m_HDUnitCommands.PATHFINDER_PLANT.CategoryInUI = "SPECIFIC";
m_HDUnitCommands.PATHFINDER_PLANT.Icon = "ICON_UNITCOMMAND_PRAVRAJYA_KOTOKU_IN";
m_HDUnitCommands.PATHFINDER_PLANT.DoNotDelete = true;
m_HDUnitCommands.PATHFINDER_PLANT.GetToolTipString = function (unit)
	-- basic
	local s = Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_PLANT_NAME");
	if unit == nil then
		return s;
	end
	-- remaining times
	local times = (GlobalParameters.PATHFINDER_ACTIVATION_CHARGE or 0) - (unit:GetProperty(PATHFINDER_TIME_KEY) or 0);
	s = s .. "[NEWLINE]" .. Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_PLANT_CHARGES", times);
	-- currently recording
	local resourceId = unit:GetProperty(PATHFINDER_RESOURCE_KEY);
	if resourceId ~= nil then
		local resourceInfo = GameInfo.Resources[resourceId];
		if resourceInfo ~= nil then
			s = s .. "[NEWLINE]" .. Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_PLANT_RECORDING") .. " [ICON_" .. resourceInfo.ResourceType .. '] ' .. Locale.Lookup(resourceInfo.Name);
		end
	end
	return s;
end

local WATER_INDEX = GameInfo.Terrains['TERRAIN_COAST'].Index;
m_HDUnitCommands.PATHFINDER_PLANT.GetDisabledToolTipString = function (unit)
	if unit == nil then
		return "";
	end
	local resourceId = unit:GetProperty(PATHFINDER_RESOURCE_KEY);
	if resourceId == nil then
		return Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_PLANT_MUST_HAS_RECORD");
	end
	local resourceInfo = GameInfo.Resources[resourceId];
	local onWater = false;
	local onLand = resourceInfo.Frequency > 0;
	for row in GameInfo.Resource_ValidTerrains() do
		if row.ResourceType == resourceInfo.ResourceType then
			if row.TerrainType == 'TERRAIN_COAST' then
				onWater = true;
			else
				onLand = true;
			end
		end
	end
	local location = unit:GetLocation();
	local plot = Map.GetPlot(location.x, location.y);
	if plot:GetOwner() ~= unit:GetOwner() then
		return Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_PLANT_MUST_OWN");
	end
	if plot:GetDistrictType() ~= -1 then
		return Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_PLANT_MUST_HAVE_NO_DISTRICT");
	end
	local isWater = plot:GetTerrainType() == WATER_INDEX;
	if isWater and (not onWater) then
		return Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_PLANT_MUST_ON_LAND");
	end
	if (not isWater) and (not onLand) then
		return Locale.Lookup("LOC_UNITCOMMAND_PATHFINDER_PLANT_MUST_ON_WATER");
	end
	return "";
end
m_HDUnitCommands.PATHFINDER_PLANT.VisibleInUI = true;
function m_HDUnitCommands.PATHFINDER_PLANT.CanUse(pUnit : object)
	if pUnit == nil then
		return false;
	end
	local unitInfo = GameInfo.Units[pUnit:GetType()];
	if unitInfo == nil then
		return false;
	end
	return unitInfo.UnitType == 'UNIT_ZIMBABWE_PATHFINDER';
end

function m_HDUnitCommands.PATHFINDER_PLANT.IsVisible(pUnit : object)
	if pUnit == nil then
		return false;
	end
	local times = pUnit:GetProperty(PATHFINDER_TIME_KEY) or 0;
	return times < (GlobalParameters.PATHFINDER_ACTIVATION_CHARGE or 0);
end

function m_HDUnitCommands.PATHFINDER_PLANT.IsDisabled(pUnit : object)
	if pUnit == nil then
		return true;
	end
	local resourceId = pUnit:GetProperty(PATHFINDER_RESOURCE_KEY);
	if resourceId == nil then
		return true;
	end
	local resourceInfo = GameInfo.Resources[resourceId];
	local onWater = false;
	local onLand = resourceInfo.Frequency > 0;
	for row in GameInfo.Resource_ValidTerrains() do
		if row.ResourceType == resourceInfo.ResourceType then
			if row.TerrainType == 'TERRAIN_COAST' then
				onWater = true;
			else
				onLand = true;
			end
		end
	end
	local location = pUnit:GetLocation();
	local plot = Map.GetPlot(location.x, location.y);
	if plot:GetOwner() ~= pUnit:GetOwner() then
		return true;
	end
	if plot:GetDistrictType() ~= -1 then
		return true;
	end
	local isWater = plot:GetTerrainType() == WATER_INDEX;
	if isWater and (not onWater) then
		return true;
	end
	if (not isWater) and (not onLand) then
		return true;
	end
	return false;
end

-- 林肯的解放按钮, by 先驱
m_HDUnitCommands.LIBERATION_LINCOLN = {};
m_HDUnitCommands.LIBERATION_LINCOLN.Properties = {};

-- UI Data
m_HDUnitCommands.LIBERATION_LINCOLN.EventName = "HD_LIBERATION_LINCOLN";
m_HDUnitCommands.LIBERATION_LINCOLN.CategoryInUI = "SPECIFIC";
m_HDUnitCommands.LIBERATION_LINCOLN.Icon = "ICON_UNITCOMMAND_LIBERATION_LINCOLN";
m_HDUnitCommands.LIBERATION_LINCOLN.ToolTipString = Locale.Lookup("LOC_UNITCOMMAND_LIBERATION_LINCOLN_NAME") .. "[NEWLINE][NEWLINE]" .. 
										Locale.Lookup("LOC_UNITCOMMAND_LIBERATION_LINCOLN_DESCRIPTION");
m_HDUnitCommands.LIBERATION_LINCOLN.DisabledToolTipString = Locale.Lookup("LOC_UNITCOMMAND_LIBERATION_LINCOLN_DISABLED_TT");
m_HDUnitCommands.LIBERATION_LINCOLN.VisibleInUI = true;
function m_HDUnitCommands.LIBERATION_LINCOLN.CanUse(pUnit : object)
	if pUnit == nil then
		return false;
	end
	local unitInfo = GameInfo.Units[pUnit:GetType()];
	return unitInfo.UnitType == "UNIT_BUILDER";
end

function m_HDUnitCommands.LIBERATION_LINCOLN.IsVisible(pUnit : object)
	local ownerId = pUnit:GetOwner();
	local pPlayerConfig = PlayerConfigurations[ownerId];
    local sLeader = pPlayerConfig:GetLeaderTypeName()
    return LeaderHasTrait(sLeader, 'TRAIT_LEADER_LINCOLN');
end

-- ===========================================================================
function m_HDUnitCommands.LIBERATION_LINCOLN.IsDisabled(pUnit : object)
	if pUnit == nil then
		return true;
	end
	if pUnit:GetMovesRemaining() == 0 then
		return true;
	end
	local location = pUnit:GetLocation();
	local x = location.x;
	local y = location.y;
	local plot = Map.GetPlot(x, y);
	local districtInfo = GameInfo.Districts['DISTRICT_INDUSTRIAL_ZONE'];
	return districtInfo.Index ~= plot:GetDistrictType();
--	local districtInfo = GameInfo.Districts[plot:GetDistrictType()];
--	return districtInfo.DistrictType ~= 'DISTRICT_INDUSTRIAL_ZONE';
end