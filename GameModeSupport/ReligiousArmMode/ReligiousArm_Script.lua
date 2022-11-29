function GetCost(unit, percent)
	if unit == nil then
		return 0;
	end
	local unitInfo = GameInfo.Units[unit:GetType()];
	return math.ceil(percent * unitInfo.Combat);
end

GameEvents.HD_ReligiousArm_UniversalRestoration.Add(function (playerId, unitId)
	local unit = UnitManager.GetUnit(playerId, unitId);
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_UNIVERSAL_RESTORATION_COST);
	local player = Players[playerId];
	if (player:GetReligion():GetFaithBalance() >= cost) and (unit:GetMovesRemaining() >= 3) then
		player:GetReligion():ChangeFaithBalance(-cost);
		UnitManager.ChangeMovesRemaining(unit, -3);
		local location = unit:GetLocation();
		local x = location.x;
		local y = location.y;
		local unitInfo = GameInfo.Units[unit:GetType()];
		local damage = unitInfo.Combat;
		for direction = 0, 5 do
			local plot = Map.GetAdjacentPlot(x, y, direction);
			if plot then
				for enemyUnit in Map.GetUnitsAt(plot):Units() do
					local owner = enemyUnit:GetOwner();
					if player:GetDiplomacy():IsAtWarWith(owner) then
						local enemyUnitInfo = GameInfo.Units[enemyUnit:GetType()];
						if (enemyUnitInfo.FormationClass == 'FORMATION_CLASS_LAND_COMBAT') or (enemyUnitInfo.FormationClass == 'FORMATION_CLASS_NAVAL') or (enemyUnitInfo.FormationClass == 'FORMATION_CLASS_AIR') then
							enemyUnit:ChangeDamage(damage);
						end
					end
				end
			end
		end
	end
end);

local PUNCITIVE_LAND_USED_KEY = 'PUNCITIVE_LAND_USED';
GameEvents.HD_ReligiousArm_PunctiveLand.Add(function (playerId, unitId)
	local unit = UnitManager.GetUnit(playerId, unitId);
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_PUNCITIVE_LAND_COST);
	local player = Players[playerId];
	local turn = Game.GetCurrentGameTurn();
	local property = PUNCITIVE_LAND_USED_KEY .. turn;
	if (player:GetReligion():GetFaithBalance() >= cost) and (unit:GetProperty(property) == nil) then
		player:GetReligion():ChangeFaithBalance(-cost);
		unit:SetProperty(property, 1);
		UnitManager.RestoreMovement(unit);
	end
end);

local PROMISED_LAND_PENDING_KEY = 'PROMISED_LAND_PENDING';
local HORSES_INDEX = GameInfo.Resources['RESOURCE_HORSES'].Index;
GameEvents.HD_ReligiousArm_PromisedLand.Add(function (playerId, unitId)
	local unit = UnitManager.GetUnit(playerId, unitId);
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_PUNCITIVE_LAND_COST);
	local player = Players[playerId];
	if (player:GetReligion():GetFaithBalance() >= cost) and (player:GetResources():GetResourceAmount(HORSES_INDEX) >= 5) then
		player:SetProperty(PROMISED_LAND_PENDING_KEY, unitId);
	end
end);

GameEvents.HD_ReligiousArm_PromisedLandTeleportSwitch.Add(function (playerId, unitId, x, y, distance)
	local unit = UnitManager.GetUnit(playerId, unitId);
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_PUNCITIVE_LAND_COST);
	local player = Players[playerId];
	if player:GetProperty(PROMISED_LAND_PENDING_KEY) ~= nil then
		player:SetProperty(PROMISED_LAND_PENDING_KEY, nil);
		player:GetReligion():ChangeFaithBalance(-cost);
		player:GetResources():ChangeResourceAmount(HORSES_INDEX, -5);
		local remaining = unit:GetMovesRemaining();
		UnitManager.PlaceUnit(unit, x, y);
		UnitManager.ChangeMovesRemaining(unit, remaining - distance);
	end
end);

function GetRouteTypeForPlayer(player)
	local route = nil;
	local era = GameInfo.Eras[player:GetEra()];
	for routeType in GameInfo.Routes() do 
		if route == nil then
			route = routeType;
		else
			local prereq_era = GameInfo.Eras[routeType.PrereqEra];
			if prereq_era and era.ChronologyIndex >= prereq_era.ChronologyIndex  then
				route =  routeType;
			end
		end
	end
	return route.Index;
end
GameEvents.HD_ReligiousArm_Pilgrim.Add(function (playerId, unitId)
	local unit = UnitManager.GetUnit(playerId, unitId);
	local cost = GlobalParameters.RELIGIOUS_ARM_HD_PILGRIM_COST or 0;
	local player = Players[playerId];
	if player:GetReligion():GetFaithBalance() >= cost then
		local route = GetRouteTypeForPlayer(player);
		local location = unit:GetLocation();
		local x = location.x;
		local y = location.y;
		local plot = Map.GetPlot(x, y);
		player:GetReligion():ChangeFaithBalance(-cost);
		RouteBuilder.SetRouteType(plot, route);
	end
end);

GameEvents.HD_ReligiousArm_MindOverMatter.Add(function (playerId, unitId)
	local unit = UnitManager.GetUnit(playerId, unitId);
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_HD_PILGRIM_COST);
	local player = Players[playerId];
	if player:GetReligion():GetFaithBalance() >= cost then
		player:GetReligion():ChangeFaithBalance(-cost);
		UnitManager.RestoreUnitAttacks(unit);
	end
end);
