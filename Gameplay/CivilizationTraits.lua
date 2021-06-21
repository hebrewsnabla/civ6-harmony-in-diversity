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

--Mali EraScore +25 Gold
function MaliPlayerEraScoreChanged(playerID, amountAwarded)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local sMaliGoldDesert = 'TRAIT_CIVILIZATION_MALI_GOLD_DESERT'
	if (not CivilizationHasTrait(sCiv, sMaliGoldDesert)) then return; end
	player:GetTreasury():ChangeGoldBalance(amountAwarded * 25)
end

Events.PlayerEraScoreChanged.Add(MaliPlayerEraScoreChanged)