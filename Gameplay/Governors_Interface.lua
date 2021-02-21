function isMinor(player)
    if player == nil then
        return false
    end
    if player:IsMajor() or player:IsBarbarian() or player:IsFreeCities() then
        return false
    end
    return true
end

function AmbassadorTributumEnvoy(ePlayer, eGovernor, ePromotion)
    local player = Players[ePlayer]
    local ambassadorID = GameInfo.Governors['GOVERNOR_THE_AMBASSADOR'].Index
    local tributumID = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_AMBASSADOR_EMISSARY'].Index
    -- print(ePlayer, ambassadorID, tributumID, 'e', eGovernor, ePromotion)
    if player ~= nil then
        if (ambassadorID == eGovernor) and (tributumID == ePromotion) then
            local playersMetIDs = player:GetDiplomacy():GetPlayersMetIDs()
            if playersMetIDs ~= nil then
                for _, id in pairs(playersMetIDs) do
                    local other_player = Players[id]
                    if isMinor(other_player) then
                        ExposedMembers.DLHD.sendEnvoy(ePlayer, id)
                    end
                end
            end
        end
    end
end

Events.GovernorPromoted.Add(AmbassadorTributumEnvoy)
