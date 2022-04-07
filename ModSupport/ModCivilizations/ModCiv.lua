--------------------------------------------------------------------------------
-- Get Players with Trait, defined in HD.
function GetPlayersWithTrait_DL(sTrait)
	local tValid = {}
	local iCount = 0
	for k, v in pairs(PlayerManager.GetWasEverAliveIDs()) do
		local leaderType = PlayerConfigurations[v]:GetLeaderTypeName()
		for trait in GameInfo.LeaderTraits() do
			if trait.LeaderType == leaderType and trait.TraitType == sTrait then 
				tValid[v] = true
				iCount = iCount + 1
			end;
		end
		if not tValid[v] then
			local civType = PlayerConfigurations[v]:GetCivilizationTypeName()
			for trait in GameInfo.CivilizationTraits() do
				if trait.CivilizationType == civType and trait.TraitType == sTrait then 
					tValid[v] = true 
					iCount = iCount + 1
				end;
			end
		end
	end
	return tValid, iCount
end
--------------------------------------------------------------------------------
-- 暹罗-朱拉隆功-蒙通体系-TRAIT_LEADER_SUK_MONTHON_SYSTEM_DL
local tMonthonPlayers, iMonthonPlayers	= GetPlayersWithTrait_DL("TRAIT_LEADER_SUK_MONTHON_SYSTEM_DL")
local tValidTypes_MONTHON_SYSTEM_DL		= {}
tValidTypes_MONTHON_SYSTEM_DL["DISTRICT_GOVERNMENT"] = true
for tBuilding in GameInfo.Buildings() do 
    if tBuilding.PrereqDistrict == "DISTRICT_GOVERNMENT" then tValidTypes_MONTHON_SYSTEM_DL[tBuilding.BuildingType] = true end
end
function MONTHON_SYSTEM_DL(iPlayer, iCity, iOrder, iType, bCanceled, iTypeMod)
	if bCanceled or not tMonthonPlayers[iPlayer] then 
        return 
    end
	-- Get type
	local tType
	local sType = ""
	if iOrder == 0  then -- OrderTypes.ORDER_TRAIN
		tType = GameInfo.Units[iType]
		if tType ~= nil then
			sType = tType.UnitType
		end
	elseif iOrder == 1  then -- OrderTypes.ORDER_CONSTRUCT
		tType = GameInfo.Buildings[iType]
		if tType ~= nil then
			sType = tType.BuildingType
		end
	elseif iOrder == 2  then -- OrderTypes.ORDER_ZONE
		tType = GameInfo.Districts[iType]
		if tType ~= nil then
			sType = tType.DistrictType
		end
	end
	-- Add governor
	if (tValidTypes_MONTHON_SYSTEM_DL[sType]) then
        local pPlayer			= Players[iPlayer]
        local pPlayerInfl		= pPlayer:GetInfluence()
        local pPlayerGov		= pPlayer:GetGovernors()
        local iMinReq           = 2 -- Envy number needed
        local iGovernorAdd      = 1 -- Governor number to add
        local iEnvoys			= pPlayerInfl:GetTokensToGive()
        if iEnvoys > iMinReq then 
            pPlayerInfl:ChangeTokensToGive(-iMinReq) -- 
            pPlayerGov:ChangeGovernorPoints(iGovernorAdd)
        end
    end
end
if iMonthonPlayers > 0 then
    -- Events.CityProductionCompleted.Add(MONTHON_SYSTEM_DL);
    -- print("lud code for TRAIT_LEADER_SUK_MONTHON_SYSTEM_DL loaded.");
end
--------------------------------------------------------------------------------