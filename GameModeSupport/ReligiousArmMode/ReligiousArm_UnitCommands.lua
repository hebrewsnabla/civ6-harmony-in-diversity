function GetCost(unit, percent)
	if unit == nil then
		return 0;
	end
	percent = percent or 0;
	local unitInfo = GameInfo.Units[unit:GetType()];
	return math.ceil(percent * unitInfo.Combat);
end
m_HDUnitCommands = m_HDUnitCommands or {};
m_HDUnitCommands.RELIGIOUS_ARM_NRYANA = {
	EventName = 'HD_ReligiousArm_Nryana',
	CategoryInUI = 'SPECIFIC',
	Icon = 'ICON_UNITCOMMAND_RELIGIOUS_ARM_NRYANA',
	DisabledToolTipString = Locale.Lookup('LOC_UNITCOMMAND_RELIGIOUS_ARM_DISABLED_TT'),
	VisibleInUI = true,
	DoNotDelete = true
};
function m_HDUnitCommands.RELIGIOUS_ARM_NRYANA.GetToolTipString(unit)
	local cost = GetCost(unit, GlobalParameters.RELIGIOUS_ARM_NRYANA_COST);
	return Locale.Lookup('LOC_PROMOTION_NRYANA_NAME') .. '[NEWLINE][NEWLINE]' .. Locale.Lookup('LOC_UNITCOMMAND_RELIGIOUS_ARM_NRYANA_DESCRIPTION', cost);
end
function m_HDUnitCommands.RELIGIOUS_ARM_NRYANA.CanUse(unit)
	if unit == nil then
		return false;
	end
	local unitInfo = GameInfo.Units[unit:GetType()];
	return true;-- unitInfo.PromotionClass == 'PROMOTION_CLASS_MONK';
end
function m_HDUnitCommands.RELIGIOUS_ARM_NRYANA.IsVisible(unit)
	if unit == nil then
		return false;
	end
	local promotionInfo = GameInfo.UnitPromotions['PROMOTION_NRYANA'];
	if promotionInfo == nil then
		return false;
	end
	return true;--unit:GetExperience():HasPromotion(promotionInfo.Index);
end
function m_HDUnitCommands.RELIGIOUS_ARM_NRYANA.IsDisabled(unit)
	if unit == nil then
		return false;
	end
	local player = Players[unit:GetOwner()];
	if player == nil then
		return false;
	end
	return player:GetReligion():GetFaithBalance() < GetCost(unit, GlobalParameters.RELIGIOUS_ARM_NRYANA_COST);
end