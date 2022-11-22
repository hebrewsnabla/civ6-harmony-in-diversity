include("SupportFunctions");
function GetCost(unit, percent)
	if unit == nil then
		return 0;
	end
	local unitInfo = GameInfo.Units[unit:GetType()];
	return math.ceil(percent * unitInfo.Combat);
end

ExposedMembers.GameEvents.HD_ReligiousArm_PromisedLand.Add(function (playerId, unitId)
	local unit = UnitManager.GetUnit(playerId, unitId);
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_PUNCITIVE_LAND_COST);
	local player = Players[playerId];
	if (player:GetReligion():GetFaithBalance() >= cost) and (unit:GetMovesRemaining() > 0) then
		UILens.ClearLayerHexes(UILens.CreateLensLayerHash("Hex_Coloring_Great_People"));
		if UILens.IsLayerOn(UILens.CreateLensLayerHash("Hex_Coloring_Great_People")) then
			UILens.ToggleLayerOff(UILens.CreateLensLayerHash("Hex_Coloring_Great_People"));
		end
		local location = unit:GetLocation();
		local activationPlots = {};
		for _, plot in ipairs(Map.GetNeighborPlots(location.x, location.y, unit:GetMovesRemaining())) do
			table.insert(activationPlots, {"Great_People", plot:GetIndex()});
		end
		UILens.SetLayerHexesArea(UILens.CreateLensLayerHash("Hex_Coloring_Great_People"), Game.GetLocalPlayer(), {}, activationPlots);
		UILens.ToggleLayerOn(UILens.CreateLensLayerHash("Hex_Coloring_Great_People"));
	end
end);

local PROMISED_LAND_PENDING_KEY = 'PROMISED_LAND_PENDING';
LuaEvents.WorldInput_WBSelectPlot.Add(function (plotId, plotEdge, boolParam)
	print('select');
	if UILens.IsLayerOn(UILens.CreateLensLayerHash("Hex_Coloring_Great_People")) then
		UILens.ToggleLayerOff(UILens.CreateLensLayerHash("Hex_Coloring_Great_People"));
	end
	local localPlayerId = Game.GetLocalPlayer();
	local player = Players[localPlayerId];
	local pending = player:GetProperty(PROMISED_LAND_PENDING_KEY);
	if pending then
		local unit = UnitManager.GetUnit(playerId, pending);
		local location = unit:GetLocation();
		local target = Map.GetPlotByIndex(plotId);
		local distance = Map.GetPlotDistance(location.x, location.y, target:GetX(), target:GetY());
		if distance <= unit:GetMovesRemaining() then
			ExposedMembers.GameEvents.HD_ReligiousArm_PromisedLandTeleportSwitch.Call(playerId, unitId, target:GetX(), target:GetY(), distance);
		end
	end
	UILens.ToggleLayerOff(UILens.CreateLensLayerHash("Hex_Coloring_Great_People"));
end);
print('reload');
print(LuaEvents);
print(LuaEvents.WorldInput_WBSelectPlot);