-- Governors_interface.lua
-- 

Utils = ExposedMembers.DLHD.Utils;

function isMinor(player)
    if player == nil then
        return false
    end
    if player:IsMajor() or player:IsBarbarian() or player:IsFreeCities() then
        return false
    end
    return true
end

local m_GovernorResourceManagerID = GameInfo.Governors['GOVERNOR_THE_RESOURCE_MANAGER'].Index
local m_GovernorAmbassadorID = GameInfo.Governors['GOVERNOR_THE_AMBASSADOR'].Index
local m_GovernorPromotion_GeneralServicesOfficerID = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST'].Index
local m_GeneralServicesOfficerHash = GameInfo.Types['GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST'].Hash
local m_GovernorPromotion_TributumID = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR'].Index

function AmbassadorTributumEnvoy(ePlayer, eGovernor, ePromotion)
    local player = Players[ePlayer]
    -- print(ePlayer, ambassadorID, tributumID, 'e', eGovernor, ePromotion)
    if player ~= nil then
        if (m_GovernorAmbassadorID == eGovernor) and (m_GovernorPromotion_TributumID == ePromotion) then
            local playersMetIDs = player:GetDiplomacy():GetPlayersMetIDs()
            if playersMetIDs ~= nil then
                for _, id in pairs(playersMetIDs) do
                    local other_player = Players[id]
                    if isMinor(other_player) then
                        Utils.SendEnvoy(ePlayer, id)
                    end
                end
            end
        end
    end
end

function GeneralServicesOfficerUpdateDummyBuilding(playerID, governorID)
    if (governorID ~= m_GovernorResourceManagerID) then
        return
    end
    print('update', playerID, governorID)
    local player = Players[playerID];
    local governors = player:GetGovernors();
    local governor = governors:GetGovernor(GameInfo.Governors[governorID].Hash);
    if governor then
        if (governor:HasPromotion(m_GeneralServicesOfficerHash)) then
            print('Has Prmotion')
        end
    end
end

function CheckGeneralServicesOfficer(ePlayer, eGovernor, ePromotion)
    print('IsPromoted', eGovernor, ePromotion)
    if (eGovernor == m_GovernorResourceManagerID) and (ePromotion == m_GovernorPromotion_GeneralServicesOfficerID) then
        GeneralServicesOfficerUpdateDummyBuilding(ePlayer, eGovernor)
    end
end

-- ===========================================================================
function OnGovernorEstablished()
    print('IsEstablished')
end

Events.GovernorPromoted.Add(AmbassadorTributumEnvoy)
Events.GovernorPromoted.Add(CheckGeneralServicesOfficer)
Events.GovernorChanged.Add(GeneralServicesOfficerUpdateDummyBuilding)
Events.GovernorEstablished.Add(OnGovernorEstablished)

function WonderToGreatEngineerPoints(iX, iY, buildingID, playerID, cityID, iPercentComplete, iUnknown)
    --print(iX, iY, buildingID, playerID, cityID, iPercentComplete, iUnknown)
    local player = Players[playerID]
    local city = CityManager.GetCity(playerID, cityID)
    local building = GameInfo.Buildings[buildingID]
    -- print(building.BuildingType)
    if player ~= nil and city ~= nil and building ~= nil then
        local promotion = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_ZONING_COMMISSIONER']
        local greatEngID = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_ENGINEER'].Index
        local amount = building.Cost * 0.2
        local governor = city:GetAssignedGovernor()
        if governor ~= nil and promotion ~= nil then
            -- print('WonderToGreatEngineerPoints', governor:HasPromotion(promotion.Hash), governor:IsEstablished())
            if governor:IsEstablished() and governor:HasPromotion(promotion.Hash) then
                Utils.AddGreatPeoplePoints(playerID, greatEngID, amount)
            end
        end
    end
end

Events.WonderCompleted.Add(WonderToGreatEngineerPoints)
