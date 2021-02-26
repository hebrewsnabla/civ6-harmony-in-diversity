-- =======================================================================
-- Common helper functions to be used by other files.
-- =======================================================================
Utils = {};

-- Available numbers in descending order.
local m_YieldAvailableNums = { 10, 5, 2, 1 };
-- Cache city yield in this format:
-- {
--      "0_123" = {               -- PlayerID_CityID
--          "GOLD" = 10,
--          "FOOD" = 5,
--          ...
--      }
--      ...
-- }
--
local m_CachedCityYield = {};

Utils.HasBuildingWithinCountry = function(playerID, cityID )
    local player = Players[playerID]
    local Allcity = CityManager.GetCity(playerID, cityID)
    local building = GameInfo.Buildings['BUILDING_GOV_CONQUEST'].Index
    if player ~= nil and Allcity ~= nil and building ~= nil then
        for _, city in pairs(Allcity) do
            local CityHasBuilding = city:GetBuildings():HasBuilding(building)
            if CityHasBuilding then
                return true
            end
            return false
        end
    end
end


Utils.CivilizationHasTrait = function(sCiv, sTrait)
    for tRow in GameInfo.CivilizationTraits() do
        if (tRow.CivilizationType == sCiv and tRow.TraitType == sTrait) then
            return true
        end
    end
    return false
end

Utils.LeaderHasTrait = function (sLeader, sTrait)
    for tRow in GameInfo.LeaderTraits() do
        if (tRow.LeaderType == sLeader and tRow.TraitType == sTrait) then return true end
    end
    return false
end

Utils.ChangeFaithBalance = function(capturerID, amount)
    local player = Players[capturerID]
    if player ~= nil then
        player:GetReligion():ChangeFaithBalance(amount)
    end
end

Utils.ChangeGoldBalance = function(playerID, amount)
    local player = Players[playerID]
    if player ~= nil then
        player:GetTreasury():ChangeGoldBalance(amount)
    end
end

Utils.GetPlotDistance = function(plotIndex, otherPlotIndex)
    return Map.GetPlotDistance(plotIndex, otherPlotIndex)
end

Utils.RemoveBuilding = function(playerID, cityID, buildingID)
    local city = CityManager.GetCity(playerID, cityID)
    if city ~= nil then
        local buildings = city:GetBuildings()
        buildings:RemoveBuilding(buildingID)
    end
end

Utils.CreateBuilding = function(playerID, cityID, buildingID)
    local city = CityManager.GetCity(playerID, cityID)
    if city ~= nil then
        local buildingQueue = city:GetBuildQueue()
        buildingQueue:CreateBuilding(buildingID)
    end
end

Utils.SendEnvoy = function(playerID, citystateID)
    -- Need to make sure the second is citystate
    local player = Players[playerID]
    if player ~= nil then
        player:GetInfluence():GiveFreeTokenToPlayer(citystateID)
    end
end

Utils.AddGreatPeoplePoints = function(playerID, gppID, amount)
    local player = Players[playerID]
    if player ~= nil then
        player:GetGreatPeoplePoints():ChangePointsTotal(gppID, amount)
    end
end

-- Generic helper function to grant a relic to the given player.
Utils.GrantRelic = function(playerID)
    local player = Players[playerID];
    if player == nil then return end

    local playerCities = player:GetCities()

    if playerCities ~= nil then
        local capitalCity = playerCities:GetCapitalCity();
        if capitalCity ~= nil then
            capitalCity:AttachModifierByID("MODIFIER_RELIC_CREATOR");

            -- Cancel additional notification for the local player (the last RELIC_CREATED notification).
            local lastRelicCreated = nil;
            local localPlayerId = Game.GetLocalPlayer();
            local notificationIds = NotificationManager.GetList(localPlayerId);
            for _, notificationId in ipairs(notificationIds) do
                local notification = NotificationManager.Find(localPlayerId, notificationId);
                if notification ~= nil and notification:GetType() == NotificationTypes.RELIC_CREATED then
                    lastRelicCreated = notification;
                end
            end
            if lastRelicCreated ~= nil and not lastRelicCreated:IsDismissed() then
                NotificationManager.Dismiss(localPlayerId, lastRelicCreated:GetID());
            end
        end
    end
end

-- Clear city's all types of yield to 0.
Utils.ClearCityYield = function(playerID, cityID)
    local yields = {};
    yields["YIELD_CULTURE"] = 0;
    yields["YIELD_FAITH"] = 0;
    yields["YIELD_FOOD"] = 0;
    yields["YIELD_GOLD"] = 0;
    yields["YIELD_PRODUCTION"] = 0;
    yields["YIELD_SCIENCE"] = 0;
    for yieldType, amount in pairs(yields) do
        Utils.ChangeCityYield(playerID, cityID, amount, yieldType);
    end
end

-- Change the given city's yield to the given amount.
Utils.ChangeCityYield = function(playerID, cityID, yieldAmount, yieldType)
    local city:table = CityManager.GetCity(playerID, cityID);

    if city ~= nil then
        local cacheKey = GetCityYieldCacheKey(playerID, cityID);
        local yieldName = string.gsub(yieldType, "YIELD_", "");

        local deltaYield = yieldAmount;

        local cityYield = m_CachedCityYield[cacheKey];
        if cityYield ~= nil then
            local currentYield = cityYield[yieldName];
            if currentYield ~= nil then
                deltaYield = yieldAmount - currentYield;
            end
        end

        if deltaYield == 0 then return end

        local modifierList = GetModifierList(deltaYield, yieldName);

        -- Grant the yields to the city.
        for _, modifier in ipairs(modifierList) do
            city:AttachModifierByID(modifier);
        end

        -- Update local cache.
        m_CachedCityYield[cacheKey] = m_CachedCityYield[cacheKey] or {};
        m_CachedCityYield[cacheKey][yieldName] = yieldAmount;
    end
end

function GetCityYieldCacheKey(playerID, cityID)
    return tostring(playerID) .. "_" .. tostring(cityID);
end

-- Helper function to get list of modifiers to be used to get the yield amount using recursion.
function GetModifierList(yieldAmount, yieldName)
    if yieldAmount == 0 then
        return {};
    end

    local isNegative = yieldAmount < 0;
    local absAmount = yieldAmount;
    if yieldAmount < 0 then
        absAmount = -yieldAmount
    end

    -- Start trying with available numbers.
    for _, number in ipairs(m_YieldAvailableNums) do
        if number <= absAmount then
            -- Use the modifier of this number
            local modifierBuilding = "YIELD_CREATOR_" .. yieldName .. "_" .. number;
            local newNum = absAmount - number;
            if isNegative then
                modifierBuilding = modifierBuilding .. "_N";
                newNum = -newNum;
            end
            -- Subtract number from the absAmount and continue with the remaining number.
            local result = GetModifierList(newNum, yieldName);
            table.insert(result, 1, modifierBuilding);
            return result;
        end
    end

    -- This line shouldn't be executed.
    return {};
end

function OnGameLoadPopulateCityYieldCache()
    m_CachedCityYield = {};
    -- Get available modifiers.
    local modifiers = GameEffects.GetModifiers();
    for i, modifier in ipairs(modifiers) do
        local modifierID = GameEffects.GetModifierDefinition(modifier).Id;

        if modifierID:match "^YIELD_CREATOR_" then
            -- Yield creator modifiers
            local yieldInfo = string.gsub(modifierID, "YIELD_CREATOR_", "");
            local type, amount, neg = yieldInfo:match("([^_]+)_(%d+)_?([^%d]?)");
            amount = tonumber(amount);
            if neg == "N" then
                amount = -amount;
            end

            -- Get the owner and city id.
            local owner = GameEffects.GetModifierOwner(modifier);
            local ownerString = GameEffects.GetObjectString(owner);
            -- The string is like: City (65536), Owner: 0, Name: LOC_CITY_NAME_AMSTERDAM
            local cityID, ownerID = ownerString:match("[^%d]*(%d+)[^%d]*(%d+).*");

            local cacheKey = GetCityYieldCacheKey(ownerID, cityID);

            -- Update cache
            m_CachedCityYield[cacheKey] = m_CachedCityYield[cacheKey] or {};
            m_CachedCityYield[cacheKey][type] = m_CachedCityYield[cacheKey][type] or 0;
            -- Add all modifiers' amount together.
            m_CachedCityYield[cacheKey][type] = m_CachedCityYield[cacheKey][type] + amount;
        end
    end
end

Events.LoadScreenClose.Add(OnGameLoadPopulateCityYieldCache);

ExposedMembers.DLHD = ExposedMembers.DLHD or {};
ExposedMembers.DLHD.Utils = Utils;
