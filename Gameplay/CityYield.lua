CityYield = {};
-- ==================================================================
-- Cache city yield in the following format inside city properties:
-- {
--      "CityYield" = {
--          {SourceType} = {
--              "GOLD" = 10,
--              "FOOD" = 5,
--              ...
--          }
--      }
--      ...
-- }
-- ==================================================================

local m_PropKey_CityYield = "CityYield";
local MAX_YIELD_MODIFIER_VALUE = 50;

-- Source type constants.
CityYield.TYPE_DEFAULT = "Default";
CityYield.TYPE_MULTINATIONAL_CORP = "MultinationalCorp";

-- Clear city's all types of yield to 0.
CityYield.ClearYield = function(playerID, cityID, sourceType)
    local yields = {};
    yields["YIELD_CULTURE"] = 0;
    yields["YIELD_FAITH"] = 0;
    yields["YIELD_FOOD"] = 0;
    yields["YIELD_GOLD"] = 0;
    yields["YIELD_PRODUCTION"] = 0;
    yields["YIELD_SCIENCE"] = 0;
    for yieldType, amount in pairs(yields) do
        CityYield.ChangeYield(playerID, cityID, amount, yieldType, sourceType);
    end
end

-- Change the given city's yield to the given amount for the specific source type.
CityYield.ChangeYield = function(playerID, cityID, yieldAmount, yieldType, sourceType)
    local city:table = CityManager.GetCity(playerID, cityID);

    if city ~= nil then
        local cityProps:table = city:GetProperty(m_PropKey_CityYield);
        if cityProps == nil then
            cityProps = {};
        end

        sourceType = sourceType or CityYield.TYPE_DEFAULT;

        local yieldName = string.gsub(yieldType, "YIELD_", "");
        local deltaYield = yieldAmount;

        local cityYield = cityProps[sourceType];
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

        -- Update city cache.
        cityYield = cityYield or {};
        cityYield[yieldName] = yieldAmount;
        cityProps[sourceType] = cityYield;
        city:SetProperty(m_PropKey_CityYield, cityProps);
    end
end

-- Helper function to get list of modifiers to be used to get the yield amount using recursion.
function GetModifierList(yieldAmount, yieldName)
    local result = {};

    local isNegative = yieldAmount < 0;
    local absAmount = yieldAmount;
    if isNegative then
        absAmount = -yieldAmount
    end

    while MAX_YIELD_MODIFIER_VALUE <= absAmount do
        table.insert(result, "YIELD_CREATOR_" .. yieldName .. "_" .. MAX_YIELD_MODIFIER_VALUE);
        absAmount = absAmount - MAX_YIELD_MODIFIER_VALUE;
    end

    -- The remaining amount should have an existing modifier.
    if absAmount > 0 then
        table.insert(result, "YIELD_CREATOR_" .. yieldName .. "_" .. absAmount);
    end

    if isNegative then
        for index, modifierName in ipairs(result) do
            result[index] = modifierName .. "_N";
        end
    end

    return result;
end

ExposedMembers.DLHD = ExposedMembers.DLHD or {};
ExposedMembers.DLHD.CityYield = CityYield;
