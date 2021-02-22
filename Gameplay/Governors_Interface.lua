-- Governors_interface.lua
-- 

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

function WonderToGreatEngineerPoints(iX, iY, buildingID, playerID, cityID, iPercentComplete, iUnknown)
    --print(iX, iY, buildingID, playerID, cityID, iPercentComplete, iUnknown)
    local player = Players[playerID]
    local city = CityManager.GetCity(playerID, cityID)
    local building = GameInfo.Buildings[buildingID]
    -- print(building.BuildingType)
    if player ~= nil and city ~= nil and building ~= nil then
        local promotion = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_RESOURCE_MANAGER_GROUNDBREAKER']
        local greatEngID = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_ENGINEER'].Index
        local amount = building.Cost * 0.1
        local governor = city:GetAssignedGovernor()
        if governor ~= nil and promotion ~= nil then
            -- print('WonderToGreatEngineerPoints', governor:HasPromotion(promotion.Hash), governor:IsEstablished())
            if governor:IsEstablished() and governor:HasPromotion(promotion.Hash) then
                ExposedMembers.DLHD.AddGreatPeoplePoints(playerID, greatEngID, amount)
            end
        end
    end
end

Events.WonderCompleted.Add(WonderToGreatEngineerPoints)
