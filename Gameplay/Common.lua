-- =======================================================================
-- Common helper functions to be used by other files.
-- =======================================================================

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

-- Change city yield to the given amount.
function ChangeCityYield(playerID, cityID, yieldAmount, yieldType)
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