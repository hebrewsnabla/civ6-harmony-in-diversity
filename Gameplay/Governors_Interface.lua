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

-- ===========================================================================
local m_GovernorResourceManagerID = GameInfo.Governors['GOVERNOR_THE_RESOURCE_MANAGER'].Index
local m_GovernorAmbassadorID = GameInfo.Governors['GOVERNOR_THE_AMBASSADOR'].Index
local m_GovernorPromotion_GeneralServicesOfficerID = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST'].Index
local m_GeneralServicesOfficerHash = GameInfo.Types['GOVERNOR_PROMOTION_RESOURCE_MANAGER_INDUSTRIALIST'].Hash
local m_GovernorPromotion_TributumID = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_AMBASSADOR_FOREIGN_INVESTOR'].Index

local m_DummyMagnus = GameInfo.Buildings["BUILDING_DUMMY_MAGNUS"].Index
local m_DummyNoMagnus = GameInfo.Buildings["BUILDING_DUMMY_NO_MAGNUS"].Index
-- TODO: change to global parameters in the dataset.
local m_EffectDistance = 9

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

function getCityCenterPlotIndex(city)
    local x = city:GetX()
    local y = city:GetY()
    return Map.GetPlotIndex(x, y)
end

function GeneralServicesOfficerUpdateDummyBuilding(player, governorID)
    if ((player == nil) or (governorID ~= m_GovernorResourceManagerID)) then
        return
    end
    -- print('update', player:GetID(), governorID)
    local pCities = player:GetCities()
    local governors = player:GetGovernors()
    local governor = governors:GetGovernor(GameInfo.Governors[governorID].Hash)
    local validCities = {}
    if governor then
        if (governor:HasPromotion(m_GeneralServicesOfficerHash)) then
            print('DEBUG: Has Prmotion')
            if governor:IsEstablished() then
                print('DEBUG: Is Established')
                local pAssignedCity:table = governor:GetAssignedCity()
                if pAssignedCity ~= nil then
                    local plotIndex = getCityCenterPlotIndex(pAssignedCity)
                    print('DEBUG: Assigned City', pAssignedCity:GetID())
                    for _, city in pCities:Members() do
                        local otherPlotIndex = getCityCenterPlotIndex(city)
                        local distance = Utils.GetPlotDistance(plotIndex, otherPlotIndex)
                        print(plotIndex, otherPlotIndex, distance)
                        if distance <= m_EffectDistance then
                            validCities[city:GetID()] = true
                            local buildings = city:GetBuildings()
                            if not buildings:HasBuilding(m_DummyMagnus) then
                                Utils.CreateBuilding(player:GetID(), city:GetID(), m_DummyMagnus)
                                print('Dummy Magnus created', player:GetID(), city:GetID())
                            end
                            if buildings:HasBuilding(m_DummyNoMagnus) then
                                Utils.RemoveBuilding(player:GetID(), city:GetID(), m_DummyNoMagnus)
                                print('Dummy NoMagnus removed', player:GetID(), city:GetID())
                            end
                        end
                    end
                end
            end
        end
    end
    -- Clean
    for _, city in pCities:Members() do
        local buildings = city:GetBuildings()
        print(city:GetID(), validCities[city:GetID()])
        if validCities[city:GetID()] == nil then
            if buildings:HasBuilding(m_DummyMagnus) then
                Utils.RemoveBuilding(player:GetID(), city:GetID(), m_DummyMagnus)
                print('Dummy Magnus removed', player:GetID(), city:GetID())
            end
            if not buildings:HasBuilding(m_DummyNoMagnus) then
                Utils.CreateBuilding(player:GetID(), city:GetID(), m_DummyNoMagnus)
                print('Dummy NoMagnus created', player:GetID(), city:GetID())
            end
        end
    end
end

function CheckGeneralServicesOfficer(ePlayer, eGovernor, ePromotion)
    print('IsPromoted', eGovernor, ePromotion)
    if (eGovernor == m_GovernorResourceManagerID) and (ePromotion == m_GovernorPromotion_GeneralServicesOfficerID) then
        local player = Players[ePlayer]
        GeneralServicesOfficerUpdateDummyBuilding(player, eGovernor)
    end
end

function OnGovernorChanged(playerID, governorID)
    print('IsChanged', playerID, governorID)
    local player = Players[playerID]
    GeneralServicesOfficerUpdateDummyBuilding(player, governorID)
end

function OnGovernorEstablished()
    print('IsEstablished')
    -- local players = Game.GetPlayers{Major = true};
    -- for _, player in ipairs(players) do
    --     GeneralServicesOfficerUpdateDummyBuilding(player, m_GovernorResourceManagerID)
    -- end
end

Events.GovernorPromoted.Add(AmbassadorTributumEnvoy)
Events.GovernorPromoted.Add(CheckGeneralServicesOfficer)
Events.GovernorChanged.Add(OnGovernorChanged)
-- Events.GovernorEstablished.Add(OnGovernorEstablished)
-- ===========================================================================

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
