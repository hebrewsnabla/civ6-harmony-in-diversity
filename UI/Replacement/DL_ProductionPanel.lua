-- =================================================================================
-- Import base file
-- =================================================================================
local files = {
    "ProductionPanel_Babylon_Heroes.lua",
    "ProductionPanel.lua",
}

for _, file in ipairs(files) do
    include(file)
    if Initialize then
        print("DL_ProductionPanel Loading " .. file .. " as base file");
        break
    end
end

-- ===========================================================================
-- CACHE BASE FUNCTIONS
-- ===========================================================================
BASE_ComposeFailureReasonStrings = ComposeFailureReasonStrings;

-- ===========================================================================
-- OVERRIDE BASE FUNCTIONS
-- ===========================================================================
function ComposeFailureReasonStrings( isDisabled:boolean, results:table )
	local allReasonString = BASE_ComposeFailureReasonStrings(isDisabled, results);

    -- Update Magnus dummy building reason if it exists.
    local magnusDummyBuildingName = Locale.Lookup("LOC_BUILDING_DUMMY_MAGNUS_NAME");
    local expectedString = Locale.Lookup("LOC_BUILDING_CONSTRUCT_REQUIRES_BUILDING", magnusDummyBuildingName);
    if allReasonString:find(expectedString) then
        -- Replace original reason with the one without "building" suffix.
        local newString = Locale.Lookup("LOC_BUILDING_CONSTRUCT_REQUIRES_BUILDING_WITHOUT_SUFFIX", magnusDummyBuildingName);
        allReasonString = allReasonString:gsub(expectedString, newString);
    end

    return allReasonString;
end