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

	player:SetProperty(PROMISED_LAND_PENDING_KEY, null);
	player:GetReligion():ChangeFaithBalance(-cost);
	player:GetResources():ChangeResourceAmount(HORSES_INDEX, -5);
	UnitManager.PlaceUnit(unit, x, y);
	UnitManager.ChangeMovesRemaining(unit, -distance);
end);