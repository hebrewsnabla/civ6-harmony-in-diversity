-- ===========================================================================
--	Unit Panel overrides for XP2
-- ===========================================================================
include( "UnitPanel_Expansion2.lua" )
-- modified from UnitPanel_KublaiKhanVietnam_XP2_MODE.lua

-- ===========================================================================
--	OVERRIDES
-- ===========================================================================
BASE_LateInitialize = LateInitialize;
BASE_AddActionToTable = AddActionToTable;
BASE_BuildActionModHook = BuildActionModHook;
BASE_OnUnitActionClicked_BuildImprovement = OnUnitActionClicked_BuildImprovement;

-- ===========================================================================
--	Add an action for the UI to display.
--	actionsTable	Table holding actions via categories
--	action			A command or operation
--	disabled		Is the action disabled (tutorial may disable even if enabled)
--	toolTipString	What the action does
--	actionHash		The hash of the action.
-- ===========================================================================
function AddActionToTable( actionsTable:table, action:table, disabled:boolean, toolTipString:string, actionHash:number, callbackFunc:ifunction, callbackVoid1, callbackVoid2, overrideIcon:string)
	-- Remove Dummy improvement.
	if action.CategoryInUI == 'BUILD' and action.Icon == 'ICON_IMPROVEMENT_DUMMY' then
		return
	end
	BASE_AddActionToTable(actionsTable, action, disabled, toolTipString, actionHash, callbackFunc, callbackVoid1, callbackVoid2, overrideIcon);
end

local m_TerrainPlainsHills = GameInfo.Terrains['TERRAIN_PLAINS_HILLS'].Index;
local m_TerrainGrassHills = GameInfo.Terrains['TERRAIN_GRASS_HILLS'].Index;
local m_ImprovementFarm = GameInfo.Improvements['IMPROVEMENT_FARM'].Index;
local m_CivicCivilEngineering = GameInfo.Civics['CIVIC_CIVIL_ENGINEERING'].Index;
local m_TechIrrigation = GameInfo.Technologies['TECH_IRRIGATION'].Index;
local m_DistrictAqueduct = GameInfo.Districts['DISTRICT_AQUEDUCT'].Index;
local m_DistrictBath = GameInfo.Districts['DISTRICT_BATH'].Index;

local m_ImprovementDummy = GameInfo.Improvements['IMPROVEMENT_DUMMY'].Index;
local m_HashImprovementFarm = GameInfo.Types['IMPROVEMENT_FARM'].Hash;
local m_HashImprovementDummy = GameInfo.Types['IMPROVEMENT_DUMMY'].Hash;

function AdjacentToAqueduct(plot)
	for i = 0, 5, 1 do
		local adjPlot = ExposedMembers.FOFH.GetAdjacentPlot(plot, i);
		if adjPlot ~= nil then
			local iDistrictType = adjPlot:GetDistrictType();
			-- print(i, iDistrictType)
			if iDistrictType == m_DistrictAqueduct or iDistrictType == m_DistrictBath then
				local pDistrict = CityManager.GetDistrictAt(adjPlot);
				-- TODO: check if pillaged
				if pDistrict:IsComplete() then
					return true;
				end
			end
		end
	end
	return false;
end

function CanPlaceFarmOnFreshHill(plot, player)
	-- print(plot, player)
	if plot == nil or player == nil then
		return false;
	end
	-- TODO only make invalid on visible resources.
	-- print(plot:GetResourceType());
	local owner = plot:GetOwner();
	local isFresh = plot:IsFreshWater();
	local terrainType = plot:GetTerrainType();
	if (owner == nil) then
		return false;
	end
	if (Players[owner] ~= player) then
		return false;
	end
	if (not plot:IsFreshWater() and not AdjacentToAqueduct(plot)) then
		return false;
	end
	if terrainType ~= m_TerrainPlainsHills and terrainType ~= m_TerrainGrassHills then
		return false;
	end
	if plot:GetResourceType() ~= -1 or plot:GetFeatureType() ~= -1 then
		return false;
	end
	if plot:GetImprovementType() ~= -1 or plot:GetDistrictType() ~= -1 then
		return false;
	end
	if player:GetCulture():HasCivic(m_CivicCivilEngineering) then
		return false;
	end
	if not player:GetTechs():HasTech(m_TechIrrigation) then
		return false;
	end
	return true;
end

-- we intercept this to change the tooltip for building an industry
function BuildActionModHook( instance:table, action:table )
	-- is this the "build improvement" action, and is it for an farm?
	if action.userTag == UnitOperationTypes.BUILD_IMPROVEMENT and action.IconId == "ICON_IMPROVEMENT_FARM" then
		-- do we have a selected player and unit?
		if(g_selectedPlayerId ~= nil and g_selectedPlayerId ~= -1 and g_UnitId ~= nil and g_UnitId ~= -1) then
			local player = Players[g_selectedPlayerId];
			local units = player:GetUnits();
			local unit = units:FindID(g_UnitId);
			if (unit ~= nil) then
				local unitPos:number = unit:GetPlotId();
				if (Map.IsPlot(unitPos)) then
					local plot:table = Map.GetPlotByIndex(unitPos);
					if plot ~= nil then
						if (CanPlaceFarmOnFreshHill(plot, player)) then
							action.Disabled = false;
						end
					end
				end
			end
		end
	end

	BASE_BuildActionModHook(instance, action);
end

function OnUnitActionClicked_BuildImprovement( improvementHash, unused )
	if (g_isOkayToProcess) then
		local pSelectedUnit = UI.GetHeadSelectedUnit();
		if (pSelectedUnit ~= nil) then
			local tParameters = {};
			local iX = pSelectedUnit:GetX();
			local iY = pSelectedUnit:GetY();
			local plot = Map.GetPlot(iX, iY)
			local owner = pSelectedUnit:GetOwner();
			tParameters[UnitOperationTypes.PARAM_X] = iX;
			tParameters[UnitOperationTypes.PARAM_Y] = iY;
			tParameters[UnitOperationTypes.PARAM_IMPROVEMENT_TYPE] = improvementHash;
			
			local placedFarmOnFreshHill = false;
			if owner ~= nil and improvementHash == m_HashImprovementFarm then
				-- If building a farm.
				local player = Players[owner];
				if CanPlaceFarmOnFreshHill(plot, player) then
					-- print(improvementHash, m_HashImprovementDummy)
					tParameters[UnitOperationTypes.PARAM_IMPROVEMENT_TYPE] = m_HashImprovementDummy;
					UnitManager.RequestOperation( pSelectedUnit, UnitOperationTypes.BUILD_IMPROVEMENT, tParameters );
					-- Fail to decrease the builder charge if change the improvement immediately.
					-- ExposedMembers.FOFH.SetPlotImprovementType(iX, iY, m_ImprovementFarm, owner);
					-- print('FarmsOnFreshHills placed');
					placedFarmOnFreshHill = true;
				end
			end
			if not placedFarmOnFreshHill then
				UnitManager.RequestOperation( pSelectedUnit, UnitOperationTypes.BUILD_IMPROVEMENT, tParameters );
			end
		end
		ContextPtr:RequestRefresh();
	end
	BASE_OnUnitActionClicked_BuildImprovement( improvementHash, unused )
end

function LateInitialize()
	print('FarmsOnFreshHills Enabled');
	BASE_LateInitialize();
end
