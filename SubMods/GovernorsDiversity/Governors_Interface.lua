-- Governors_interface.lua
-- 

Utils = ExposedMembers.DLHD.Utils;
CityYield = ExposedMembers.DLHD.CityYield;

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

local m_GovernorMerchantID = GameInfo.Governors['GOVERNOR_THE_MERCHANT'].Index
local m_GovernorMerchantHash = GameInfo.Governors['GOVERNOR_THE_MERCHANT'].Hash
local m_GovernorPromotion_MultinationalCorpID = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP'].Index
local m_GovernorPromotion_MultinationalCorpHash = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_MERCHANT_MULTINATIONAL_CORP'].Hash
local m_CivicExploration = GameInfo.Civics['CIVIC_EXPLORATION'].Index

local m_DummyMagnus = GameInfo.Buildings['BUILDING_DUMMY_MAGNUS'].Index
local m_DummyNoMagnus = GameInfo.Buildings['BUILDING_DUMMY_NO_MAGNUS'].Index
local m_EffectDistance = GlobalParameters.MAGNUS_GENERAL_SERVICES_OFFICE_EFFECT_DISTANCE
local m_LiangWonderGreatEngineerPercentage = GlobalParameters.LIANG_WONDER_GREAT_ENGINEER_PERCENTAGE
local m_ReynaConvertPercentage = GlobalParameters.REYNA_CONVERT_PERCENTAGE

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
            -- print('DEBUG: Has Prmotion')
            if governor:IsEstablished() then
                -- print('DEBUG: Is Established')
                local pAssignedCity:table = governor:GetAssignedCity()
                if pAssignedCity ~= nil then
                    local plotIndex = getCityCenterPlotIndex(pAssignedCity)
                    -- print('DEBUG: Assigned City', pAssignedCity:GetID())
                    for _, city in pCities:Members() do
                        local otherPlotIndex = getCityCenterPlotIndex(city)
                        local distance = Utils.GetPlotDistance(plotIndex, otherPlotIndex)
                        -- print(plotIndex, otherPlotIndex, distance)
                        if distance <= m_EffectDistance then
                            validCities[city:GetID()] = true
                            local buildings = city:GetBuildings()
                            if not buildings:HasBuilding(m_DummyMagnus) then
                                Utils.CreateBuilding(player:GetID(), city:GetID(), m_DummyMagnus)
                                -- print('Dummy Magnus created', player:GetID(), city:GetID())
                            end
                            if buildings:HasBuilding(m_DummyNoMagnus) then
                                Utils.RemoveBuilding(player:GetID(), city:GetID(), m_DummyNoMagnus)
                                -- print('Dummy NoMagnus removed', player:GetID(), city:GetID())
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
        -- print(city:GetID(), validCities[city:GetID()])
        if validCities[city:GetID()] == nil then
            if buildings:HasBuilding(m_DummyMagnus) then
                Utils.RemoveBuilding(player:GetID(), city:GetID(), m_DummyMagnus)
                -- print('Dummy Magnus removed', player:GetID(), city:GetID())
            end
            if not buildings:HasBuilding(m_DummyNoMagnus) then
                Utils.CreateBuilding(player:GetID(), city:GetID(), m_DummyNoMagnus)
                -- print('Dummy NoMagnus created', player:GetID(), city:GetID())
            end
        end
    end
end

function CheckGeneralServicesOfficer(ePlayer, eGovernor, ePromotion)
    -- print('IsPromoted', eGovernor, ePromotion)
    if (eGovernor == m_GovernorResourceManagerID) and (ePromotion == m_GovernorPromotion_GeneralServicesOfficerID) then
        local player = Players[ePlayer]
        GeneralServicesOfficerUpdateDummyBuilding(player, eGovernor)
    end
end

function OnGovernorChanged(playerID, governorID)
    -- print('IsChanged', playerID, governorID)
    local player = Players[playerID]
    GeneralServicesOfficerUpdateDummyBuilding(player, governorID)
end

-- function OnGovernorEstablished()
--     print('IsEstablished')
--     -- local players = Game.GetPlayers{Major = true};
--     -- for _, player in ipairs(players) do
--     --     GeneralServicesOfficerUpdateDummyBuilding(player, m_GovernorResourceManagerID)
--     -- end
-- end

Events.GovernorPromoted.Add(AmbassadorTributumEnvoy)
Events.GovernorPromoted.Add(CheckGeneralServicesOfficer)
Events.GovernorChanged.Add(OnGovernorChanged)
-- Events.GovernorEstablished.Add(OnGovernorEstablished)
-- ===========================================================================

function WonderToGreatEngineerPoints(iX, iY, buildingID, playerID, cityID, iPercentComplete, iUnknown)
    --print(iX, iY, buildingID, playerID, cityID, iPercentComplete, iUnknown)
    local gameSpeed = GameConfiguration.GetGameSpeedType()
    local iSpeedCostMultiplier = GameInfo.GameSpeeds[gameSpeed].CostMultiplier * 0.01
    local player = Players[playerID]
    local city = CityManager.GetCity(playerID, cityID)
    local building = GameInfo.Buildings[buildingID]
    -- print(building.BuildingType)
    if player ~= nil and city ~= nil and building ~= nil then
        local promotion = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_ZONING_COMMISSIONER']
        local greatEngID = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_ENGINEER'].Index
        local amount = building.Cost * m_LiangWonderGreatEngineerPercentage * 0.01 * iSpeedCostMultiplier
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

-- Reyna
local m_ReynaAssignedCity = {};

function UpdateReynaTradeRoutesYield(playerID)
    local player = Players[playerID];
    if (player == nil) then
        return
    end
    local governors = player:GetGovernors();
    local governor = governors:GetGovernor(m_GovernorMerchantHash);

    -- Enable when player has Exploration Civic
    if governor and player:GetCulture():HasCivic(m_CivicExploration) then
        -- Update Reya current city yield if needed.
        local currentCity:table = governor:GetAssignedCity();
        if currentCity and governor:HasPromotion(m_GovernorPromotion_MultinationalCorpHash) and governor:IsEstablished() then
            -- Reyna has multinational corporation promotion and is established in the city.
            -- Init yield map to all 0s.
            local totalYields = {};
            totalYields["YIELD_CULTURE"] = 0;
            totalYields["YIELD_FAITH"] = 0;
            totalYields["YIELD_FOOD"] = 0;
            totalYields["YIELD_GOLD"] = 0;
            totalYields["YIELD_PRODUCTION"] = 0;
            totalYields["YIELD_SCIENCE"] = 0;

            -- Get outgoing international trade routes.
            local outgoingRoutes = currentCity:GetTrade():GetOutgoingRoutes();
            for _, route in ipairs(outgoingRoutes) do
                -- Check that the destination city owner is not the current player.
                if route.DestinationCityPlayer ~= playerID then
                    for _, yieldInfo in ipairs(route.OriginYields) do
                        if yieldInfo.Amount > 0 then
                            local yieldDetails = GameInfo.Yields[yieldInfo.YieldIndex];
                            -- Round amount to integer.
                            local roundedValue = math.floor(yieldInfo.Amount * m_ReynaConvertPercentage / 100.0 + 0.5);
                            totalYields[yieldDetails.YieldType] = totalYields[yieldDetails.YieldType] + roundedValue;
                        end
                    end
                end
            end

            -- Need to update city yields no matter the player has trade routes or not, in case the trade routes are cancelled or raided.
            -- Change the city yields.
            for yieldType, amount in pairs(totalYields) do
                CityYield.ChangeYield(playerID, currentCity:GetID(), amount, yieldType, CityYield.Type.MULTINATIONAL_CORP);
            end

            -- Remember current player's Reyna assigned city.
            m_ReynaAssignedCity[playerID] = currentCity:GetID();
        elseif m_ReynaAssignedCity[playerID] ~= nil then
            -- Reyna had multinational corporation promotion and was assigned to a city,
            -- but she doesn't have effect in that city anymore, either she's not assigned to that city or not established anymore.
            -- i.e. failed the first if check.
            -- Clear the city yield for her previously assigned city.
            CityYield.ClearYield(playerID, m_ReynaAssignedCity[playerID], CityYield.Type.MULTINATIONAL_CORP);
            -- Clear the assigned city cache to prevent double clearing.
            m_ReynaAssignedCity[playerID] = nil;
        end
    end
end

function OnGovernorAssignedCheckReyna(cityPlayer, cityID, playerID, governorID)
    -- Reyna logic.
    if governorID == m_GovernorMerchantID or m_ReynaAssignedCity[playerID] == cityID then
        -- Reyna is assigned to some city,
        -- or a new governor is assigned to Reyna's current city,
        -- update the city yields.
        UpdateReynaTradeRoutesYield(playerID);
    end
end

function OnGovernorUpdatedCheckReyna(playerID, governorID, promotionID)
    -- Reyna logic.
    if governorID == m_GovernorMerchantID then
        if promotionID == nil or promotionID == m_GovernorPromotion_MultinationalCorpID then
            -- Try updating city yields if it's not a promotion update or it's multinational corporation promotion.
            UpdateReynaTradeRoutesYield(playerID);
        end
    end
end

Events.GovernorAssigned.Add(OnGovernorAssignedCheckReyna)
Events.GovernorChanged.Add(OnGovernorUpdatedCheckReyna)
Events.GovernorPromoted.Add(OnGovernorUpdatedCheckReyna)

Events.TradeRouteActivityChanged.Add(UpdateReynaTradeRoutesYield)
Events.CityWorkerChanged.Add(UpdateReynaTradeRoutesYield);
Events.PlayerTurnDeactivated.Add(UpdateReynaTradeRoutesYield);
