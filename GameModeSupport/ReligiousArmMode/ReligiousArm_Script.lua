function GetCost(unit, percent)
	if unit == nil then
		return 0;
	end
	local unitInfo = GameInfo.Units[unit:GetType()];
	return math.ceil(percent * unitInfo.Combat);
end
GameEvents.HD_ReligiousArm_Nryana.Add(function (playerId, unitId)
	local unit = UnitManager.GetUnit(playerId, unitId);
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_NRYANA_COST);
	local player = Players[playerId];
	if player:GetReligion():GetFaithBalance() >= cost then
		player:GetReligion():ChangeFaithBalance(-cost);
		unit:SetFortifyTurns(unit:GetFortifyTurns() + 1);
		--Events.UnitFortificationChanged.Call(playerId, unitId); --闪退
		--UnitManager.RestoreMovement(unit);
		--UnitManager.RequestOperation(unit, UnitOperationTypes.FORTIFY); --只能在UI环境调用
	end
end);