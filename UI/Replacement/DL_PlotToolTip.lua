-- =================================================================================
-- Import base file
-- =================================================================================
local files = {
    "PlotToolTip_Expansion2_BarbarianClansMode.lua",
    "PlotToolTip_BarbarianClansMode.lua",
    "PlotToolTip_Expansion2.lua",
    "PlotToolTip.lua",
}

for _, file in ipairs(files) do
    include(file)
    if Initialize then
        print("DL_PlotToolTip Loading " .. file .. " as base file");
        break
    end
end

-- ===========================================================================
-- CACHE BASE FUNCTIONS
-- ===========================================================================
BASE_FetchAdditionalData = FetchAdditionalData;

-- ===========================================================================
-- OVERRIDE BASE FUNCTIONS
-- ===========================================================================

function FetchAdditionalData( pPlot:table, kPlotData:table )
    BASE_FetchAdditionalData(pPlot, kPlotData);

    -- Filter data's building names to exclude city policies and internal buildings.
    local indexToBeRemoved = {};
    local buildingTypes = kPlotData.BuildingTypes;
    for index, type in ipairs(buildingTypes) do
        local building = GameInfo.Buildings[type];
        if building.InternalOnly or building.BuildingType:match("^BUILDING_CITY_POLICY_") then
            -- Insert to table in descending order.
            table.insert(indexToBeRemoved, 1, index);
        end
    end

    -- Remove the buildings that we don't want to show in the list from the back, so the indices stay valid.
    for _, index in ipairs(indexToBeRemoved) do
        table.remove(kPlotData.BuildingTypes, index);
        table.remove(kPlotData.BuildingNames, index);
        table.remove(kPlotData.BuildingsPillaged, index);
    end
end