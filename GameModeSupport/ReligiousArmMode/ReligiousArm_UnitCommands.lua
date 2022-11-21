function GetCost(unit, percent)
	if unit == nil then
		return 0;
	end
	percent = percent or 0;
	local unitInfo = GameInfo.Units[unit:GetType()];
	return math.ceil(percent * unitInfo.Combat);
end
m_HDUnitCommands = m_HDUnitCommands or {};
m_HDUnitCommands.RELIGIOUS_ARM_UNIVERSAL_RESTORATION = {
	EventName = 'HD_ReligiousArm_UniversalRestoration',
	CategoryInUI = 'SPECIFIC',
	Icon = 'ICON_UNITCOMMAND_RELIGIOUS_ARM_UNIVERSAL_RESTORATION',
	DisabledToolTipString = Locale.Lookup('LOC_UNITCOMMAND_RELIGIOUS_ARM_UNIVERSAL_RESTORATION_DISABLED_TT'),
	VisibleInUI = true,
	DoNotDelete = true
};
function m_HDUnitCommands.RELIGIOUS_ARM_UNIVERSAL_RESTORATION.GetToolTipString(unit)
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_UNIVERSAL_RESTORATION_COST);
	local unitInfo = GameInfo.Units[unit:GetType()];
	return Locale.Lookup('LOC_PROMOTION_UNIVERSAL_RESTORATION_NAME') .. '[NEWLINE][NEWLINE]' .. 
		Locale.Lookup('LOC_UNITCOMMAND_RELIGIOUS_ARM_UNIVERSAL_RESTORATION_DESCRIPTION', cost, unitInfo.Combat);
end
function m_HDUnitCommands.RELIGIOUS_ARM_UNIVERSAL_RESTORATION.CanUse(unit)
	if unit == nil then
		return false;
	end
	local unitInfo = GameInfo.Units[unit:GetType()];
	return true;-- unitInfo.PromotionClass == 'PROMOTION_CLASS_MONK';
end
function m_HDUnitCommands.RELIGIOUS_ARM_UNIVERSAL_RESTORATION.IsVisible(unit)
	if unit == nil then
		return false;
	end
	local promotionInfo = GameInfo.UnitPromotions['PROMOTION_UNIVERSAL_RESTORATION'];
	if promotionInfo == nil then
		return false;
	end
	return true;--unit:GetExperience():HasPromotion(promotionInfo.Index);
end
function m_HDUnitCommands.RELIGIOUS_ARM_UNIVERSAL_RESTORATION.IsDisabled(unit)
	if unit == nil then
		return false;
	end
	local player = Players[unit:GetOwner()];
	if player == nil then
		return false;
	end
	return (player:GetReligion():GetFaithBalance() < GetCost(unit, GlobalParameters.RELIGIOUS_ARM_UNIVERSAL_RESTORATION_COST))
		or (unit:GetMovesRemaining() < 3);
end

local PUNCITIVE_LAND_USED_KEY = 'PUNCITIVE_LAND_USED';
m_HDUnitCommands.RELIGIOUS_ARM_PUNCITIVE_LAND = {
	EventName = 'HD_ReligiousArm_PunctiveLand',
	CategoryInUI = 'SPECIFIC',
	Icon = 'ICON_UNITCOMMAND_RELIGIOUS_ARM_PUNCITIVE_LAND',
	DisabledToolTipString = Locale.Lookup('LOC_UNITCOMMAND_RELIGIOUS_ARM_PUNCITIVE_LAND_DISABLED_TT'),
	VisibleInUI = true,
	DoNotDelete = true
};
function m_HDUnitCommands.RELIGIOUS_ARM_PUNCITIVE_LAND.GetToolTipString(unit)
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_PUNCITIVE_LAND_COST);
	local unitInfo = GameInfo.Units[unit:GetType()];
	return Locale.Lookup('LOC_PROMOTION_PUNCITIVE_LAND_NAME') .. '[NEWLINE][NEWLINE]' .. 
		Locale.Lookup('LOC_UNITCOMMAND_RELIGIOUS_ARM_PUNCITIVE_LAND_DESCRIPTION', cost, unitInfo.Combat);
end
function m_HDUnitCommands.RELIGIOUS_ARM_PUNCITIVE_LAND.CanUse(unit)
	if unit == nil then
		return false;
	end
	local unitInfo = GameInfo.Units[unit:GetType()];
	return true;-- unitInfo.PromotionClass == 'PROMOTION_CLASS_MONK';
end
function m_HDUnitCommands.RELIGIOUS_ARM_PUNCITIVE_LAND.IsVisible(unit)
	if unit == nil then
		return false;
	end
	local promotionInfo = GameInfo.UnitPromotions['PROMOTION_PUNCITIVE_LAND'];
	if promotionInfo == nil then
		return false;
	end
	return true;--unit:GetExperience():HasPromotion(promotionInfo.Index);
end
function m_HDUnitCommands.RELIGIOUS_ARM_PUNCITIVE_LAND.IsDisabled(unit)
	if unit == nil then
		return false;
	end
	local player = Players[unit:GetOwner()];
	if player == nil then
		return false;
	end
	local turn = Game.GetCurrentGameTurn();
	return (player:GetReligion():GetFaithBalance() < GetCost(unit, GlobalParameters.RELIGIOUS_ARM_PUNCITIVE_LAND_COST))
		or (unit:GetProperty(PUNCITIVE_LAND_USED_KEY .. turn) ~= nil);
end

m_HDUnitCommands.RELIGIOUS_ARM_PROMISED_LAND = {
	EventName = 'HD_ReligiousArm_PromisedLand',
	CategoryInUI = 'SPECIFIC',
	Icon = 'ICON_UNITCOMMAND_RELIGIOUS_ARM_PROMISED_LAND',
	DisabledToolTipString = Locale.Lookup('LOC_UNITCOMMAND_RELIGIOUS_ARM_PROMISED_LAND_DISABLED_TT'),
	VisibleInUI = true,
	DoNotDelete = true
};
function m_HDUnitCommands.RELIGIOUS_ARM_PROMISED_LAND.GetToolTipString(unit)
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_PROMISED_LAND_COST);
	local unitInfo = GameInfo.Units[unit:GetType()];
	return Locale.Lookup('LOC_PROMOTION_PROMISED_LAND_NAME') .. '[NEWLINE][NEWLINE]' .. 
		Locale.Lookup('LOC_UNITCOMMAND_RELIGIOUS_ARM_PROMISED_LAND_DESCRIPTION', cost, unitInfo.Combat);
end
function m_HDUnitCommands.RELIGIOUS_ARM_PROMISED_LAND.CanUse(unit)
	if unit == nil then
		return false;
	end
	local unitInfo = GameInfo.Units[unit:GetType()];
	return true;-- unitInfo.PromotionClass == 'PROMOTION_CLASS_MONK';
end
function m_HDUnitCommands.RELIGIOUS_ARM_PROMISED_LAND.IsVisible(unit)
	if unit == nil then
		return false;
	end
	local promotionInfo = GameInfo.UnitPromotions['PROMOTION_PROMISED_LAND'];
	if promotionInfo == nil then
		return false;
	end
	return true;--unit:GetExperience():HasPromotion(promotionInfo.Index);
end
function m_HDUnitCommands.RELIGIOUS_ARM_PROMISED_LAND.IsDisabled(unit)
	if unit == nil then
		return false;
	end
	local player = Players[unit:GetOwner()];
	if player == nil then
		return false;
	end
	local turn = Game.GetCurrentGameTurn();
	return (player:GetReligion():GetFaithBalance() < GetCost(unit, GlobalParameters.RELIGIOUS_ARM_PROMISED_LAND_COST))
		or (player:GetResources():GetResourceAmount(GameInfo.Resources['RESOURCE_HORSES'].Index) < 5);
end