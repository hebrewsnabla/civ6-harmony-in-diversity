-- =======================================================================
-- Common helper functions to be used by other files.
-- =======================================================================

-- Available numbers in descending order.
local m_YieldAvailableNums = { 10, 5, 2, 1 };

function ClearCityYield(playerID, cityID)
    local city:table = CityManager.GetCity(playerID, cityID);
    if city ~= nil then
        local buildings = city:GetBuildings();
        local yieldCreatorIndex = GameInfo.Buildings["BUILDING_YIELD_CREATOR"].Index;
        buildings:RemoveBuilding(yieldCreatorIndex);
    end
end

function AddCityYield(playerID, cityID, yieldAmount, yieldType)
    local city:table = CityManager.GetCity(playerID, cityID);

    if city ~= nil then
        local buildings = city:GetBuildings();
        local buildingQueue = city:GetBuildQueue();

        -- Create Yield Creator if it doesn't exist.
        local yieldCreatorIndex = GameInfo.Buildings["BUILDING_YIELD_CREATOR"].Index;
        -- Remove Relic Creator from the city just in case.
        if not buildings:HasBuilding(yieldCreatorIndex) then
            buildingQueue:CreateBuilding(yieldCreatorIndex);
        end

        -- Get yield creator workers for the given yield amount and type.
        local yieldName = nil;
        if yieldType == YieldTypes.CULTURE then 
            yieldName = "CULTURE";
        elseif yieldType == YieldTypes.FAITH then 
            yieldName = "FAITH";
        elseif yieldType == YieldTypes.FOOD then 
            yieldName = "FOOD";
        elseif yieldType == YieldTypes.GOLD then 
            yieldName = "GOLD";
        elseif yieldType == YieldTypes.PRODUCTION then 
            yieldName = "PRODUCTION";
        elseif yieldType == YieldTypes.SCIENCE then 
            yieldName = "SCIENCE";
        end
        local modifierList = GetModifierList(yieldAmount, yieldName);

        -- Grant the yields to the Yield Creator building.
        for _, modifier in ipairs(modifierList) do
            local index = GameInfo.Buildings[modifier].Index;
            buildingQueue:CreateBuilding(index);
            buildings:RemoveBuilding(index);
        end
    end
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
            local modifierBuilding = "BUILDING_YIELD_CREATOR_WORKER_" .. yieldName .. "_" .. number;
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