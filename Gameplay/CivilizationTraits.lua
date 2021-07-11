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

-- 老秦
function ChinaBuilderScience(playerID, unitID, newCharges, oldCharges)
	-- print(playerID, unitID, newCharges, oldCharges)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local amount = 6
	local sWisdonOfWorkingPeople = 'TRAIT_CIVILIZATION_DYNASTIC_CYCLE'
	if player:IsTurnActive() and CivilizationHasTrait(sCiv, sWisdonOfWorkingPeople) and (newCharges + 1 == oldCharges) then
		local unit = player:GetUnits():FindID(unitID)
		if unit ~= nil then
			-- print(unit:GetOwner(), unit:GetType(), unit:GetX(), unit:GetY())
			if unit:GetType() == GameInfo.Units['UNIT_BUILDER'].Index then
				player:GetTechs():ChangeCurrentResearchProgress(amount)
				if newCharges > 0 then
					-- 次数到0后会找不到单位(-9999, -9999)的原位置，无法显示浮动文本。
					local message = '[COLOR:ResScienceLabelCS]+' .. tostring(amount) .. '[ENDCOLOR][ICON_Science]'
					Game.AddWorldViewText(0, message, unit:GetX(), unit:GetY())
				end
			end
		end
	end
end

Events.UnitChargesChanged.Add(ChinaBuilderScience)

--Phoenicia Trigger Foreign Trade Boost
function DidoOnPlayerTurnActivated(playerID:number, bFirstTimeThisTurn:boolean)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local sMediterraneanColonies = 'TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES'
	local m_ForeignTrade = GameInfo.Civics['CIVIC_FOREIGN_TRADE'].Index
	if (not CivilizationHasTrait(sCiv, sMediterraneanColonies)) then return; end
	-- print(player, playerConfig, sCiv)
	player:GetCulture():TriggerBoost(m_ForeignTrade, 0.4)
end

Events.PlayerTurnActivated.Add(DidoOnPlayerTurnActivated)

function PedroGreatPersonFaith(playerID, unitID, greatPersonClassID, greatPersonIndividualID)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sLeader = playerConfig:GetLeaderTypeName()
	local sMagnanimous = 'TRAIT_LEADER_MAGNANIMOUS'
	local sModifierID = 'TRAIT_GREAT_PEOPLE_JUNGLE_FAITH'
	local PROP_KEY_NUMBER_GREAT_PEOPLE = 'NumberofGreatPeople'
	if LeaderHasTrait(sLeader, sMagnanimous) then
		local amount = player:GetProperty(PROP_KEY_NUMBER_GREAT_PEOPLE)
		if amount == nil then
			amount = 0
		end
		amount = amount + 1
		-- Every two greatperson add 1 faith to jungle.
		if amount == 2 then
			amount = 0
			player:AttachModifierByID(sModifierID)
		end
		player:SetProperty(PROP_KEY_NUMBER_GREAT_PEOPLE, amount)
	end
end

Events.UnitGreatPersonCreated.Add(PedroGreatPersonFaith)

--Mali EraScore +15 Gold
function MaliPlayerEraScoreChanged(playerID, amountAwarded)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sLeader = playerConfig:GetLeaderTypeName()
	local sMaliGoldDesert = 'TRAIT_LEADER_SAHEL_MERCHANTS'
	if (not LeaderHasTrait(sLeader, sMaliGoldDesert)) then return; end
	player:GetTreasury():ChangeGoldBalance(amountAwarded * 15)
end

Events.PlayerEraScoreChanged.Add(MaliPlayerEraScoreChanged)

-- Aztec
-- ===========================================================================
--	Sacrifice
-- ===========================================================================
function HD_Aztec_Sacrifice(eOwner : number, iUnitID : number)
	local pPlayer = Players[eOwner];
	if (pPlayer == nil) then
		return;
	end

	local pUnit = pPlayer:GetUnits():FindID(iUnitID);
	if (pUnit == nil) then
		return;
	end

	local city = CityManager.GetCityAt(pUnit:GetX(), pUnit:GetY());

	if city == nil then
		return;
	end
	local amount = 10 * pUnit:GetBuildCharges();
	pPlayer:GetCulture():ChangeCurrentCulturalProgress(amount);
	pPlayer:GetReligion():ChangeFaithBalance(amount);

	-- Flyover text
	local message:string  = Locale.Lookup("LOC_FLYOVER_AZTEC_SACRIFICE", amount);
	Game.AddWorldViewText(0, message, pUnit:GetX(), pUnit:GetY());

	-- Report to the application side that we did something.  This helps with visualization
	-- UnitManager.ReportActivation(pUnit, "DEMOLISH");

end
GameEvents.HD_Aztec_Sacrifice.Add(HD_Aztec_Sacrifice)
