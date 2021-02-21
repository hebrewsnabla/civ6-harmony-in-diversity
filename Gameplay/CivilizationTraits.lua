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
function DidoOnPlayerTurnActivated(ePlayer:number, bFirstTimeThisTurn:boolean)
	local pPlayer = Players[ePlayer]
	local pPlayerConfig = PlayerConfigurations[ePlayer]
	local sCiv = pPlayerConfig:GetCivilizationTypeName()
	local sMediterraneanColonies = 'TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES'
	local m_ForeignTrade = GameInfo.Civics['CIVIC_FOREIGN_TRADE'].Index
	if (not CivilizationHasTrait(sCiv,sMediterraneanColonies)) then return; end
	--print(pPlayer,pPlayerConfig,sCiv)
	pPlayer:GetCulture():TriggerBoost(m_ForeignTrade,0.4)
end
Events.PlayerTurnActivated.Add(DidoOnPlayerTurnActivated)