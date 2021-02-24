-- =======================================================================
-- Common helper functions to be used by other files.
-- =======================================================================
Utils = {};

-- Available numbers in descending order.
local m_YieldAvailableNums = { 10, 5, 2, 1 };
-- Cache city yield in this format:
-- {
--      "123" = {               -- CityID
--          "YIELD_GOLD" = 10,
--          "YIELD_FOOD" = 5,
--          ...
--      }
--      ...
-- }
--
local m_CachedCityYield = {};

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

Utils.ChangeFaithBalance = function(playerID, amount)
    local player = Players[playerID]
    if player ~= nil then
        player:GetReligion():ChangeFaithBalance(amount)
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

-- Change city yield to the given amount.
Utils.ChangeCityYield = function(playerID, cityID, yieldAmount, yieldType)
    local city:table = CityManager.GetCity(playerID, cityID);

    if city ~= nil then
        local deltaYield = yieldAmount;

        local cityYield = m_CachedCityYield[cityID];
        if cityYield ~= nil then
            local currentYield = cityYield[yieldType];
            if currentYield ~= nil then
                deltaYield = yieldAmount - currentYield;
            end
        end
        local modifierList = GetModifierList(deltaYield, yieldType);

        -- Grant the yields to the city.
        for _, modifier in ipairs(modifierList) do
            city:AttachModifierByID(modifier);
        end

        -- Update local cache.
        m_CachedCityYield[cityID] = m_CachedCityYield[cityID] or {};
        m_CachedCityYield[cityID][yieldType] = yieldAmount;
    end
end

-- Helper function to get list of modifiers to be used to get the yield amount using recursion.
function GetModifierList(yieldAmount, yieldType)
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
            local yieldName = string.gsub(yieldType, "YIELD_", "");
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

ExposedMembers.DLHD = ExposedMembers.DLHD or {};
ExposedMembers.DLHD.Utils = Utils;