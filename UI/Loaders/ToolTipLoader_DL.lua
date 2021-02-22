-- Cache original GetDistrictToolTip.
Base_GetDistrictToolTip = ToolTipHelper.GetDistrictToolTip;

-------------------------------------------------------------------------------
ToolTipHelper.GetDistrictToolTip = function(districtType)

    -- ToolTip Format
    -- <Name>
    -- <Static Description>
    -- <Great Person Points>
    local district = GameInfo.Districts[districtType];

    local name = district.Name;
    local description = district.Description;

    local replaces_district;
    local replaces = GameInfo.DistrictReplaces[districtType];
    if(replaces) then
        replaces_district = GameInfo.Districts[replaces.ReplacesDistrictType];
    end
    
    -- Build ze tip!
    -- Build the tool tip line by line.
    local toolTipLines = {};
    table.insert(toolTipLines, Locale.ToUpper(name));

    if(replaces_district) then
        table.insert(toolTipLines, Locale.Lookup("LOC_DISTRICT_NAME_REPLACES", replaces_district.Name));
    else
        table.insert(toolTipLines, Locale.Lookup("LOC_DISTRICT_NAME"));
    end
    
    if(not Locale.IsNilOrWhitespace(description)) then
        table.insert(toolTipLines, "[NEWLINE]" .. Locale.Lookup(description));
    end

    local stats = {};
    for row in GameInfo.District_GreatPersonPoints() do
        if(row.DistrictType== districtType) then
            local gpClass = GameInfo.GreatPersonClasses[row.GreatPersonClassType];
            if(gpClass) then
                table.insert(stats, Locale.Lookup("LOC_TYPE_TRAIT_GREAT_PERSON_POINTS", row.PointsPerTurn, gpClass.IconString, gpClass.Name));
            end
        end
    end

    if(district.Housing ~= 0) then
        table.insert(stats, Locale.Lookup("LOC_TYPE_TRAIT_HOUSING", district.Housing));
    end

    if(district.Entertainment ~= 0) then
        table.insert(stats, Locale.Lookup("LOC_TYPE_TRAIT_AMENITY_ENTERTAINMENT", district.Entertainment));
    end

    local airSlots = district.AirSlots or 0;
    if(airSlots ~= 0) then
        table.insert(stats, Locale.Lookup("LOC_TYPE_TRAIT_AIRSLOTS", airSlots));
    end

    local citizens = tonumber(district.CitizenSlots) or 0;
    if(citizens ~= 0) then
        table.insert(stats, Locale.Lookup("LOC_TYPE_TRAIT_CITIZENSLOTS", citizens));
    end

    local adjacency_yields = ToolTipHelper.GetAdjacencyBonuses(GameInfo.District_Adjacencies, "DistrictType", districtType)
    if(adjacency_yields) then
        for i,v in ipairs(adjacency_yields) do
            table.insert(stats, v);
        end
    end

    local citizen_yields = {};
    for row in GameInfo.District_CitizenYieldChanges() do
        if(row.DistrictType == districtType) then
            local yield = GameInfo.Yields[row.YieldType];
            if(yield) then
                table.insert(citizen_yields, "[ICON_Bullet] " .. Locale.Lookup("LOC_TYPE_TRAIT_YIELD", row.YieldChange, yield.IconString, yield.Name));
            end
        end
    end

    for row in GameInfo.District_CitizenGreatPersonPoints() do
        if(row.DistrictType == districtType) then
            local gpClass = GameInfo.GreatPersonClasses[row.GreatPersonClassType];
            local amount = row.PointsPerTurn * 2
            if(gpClass) then
                table.insert(citizen_yields, "[ICON_Bullet] " .. Locale.Lookup("LOC_TYPE_TRAIT_GREAT_PERSON_POINTS", amount, gpClass.IconString, gpClass.Name));
            end
        end
    end

    for i,v in ipairs(stats) do
        if(i == 1) then
            table.insert(toolTipLines, "[NEWLINE]" .. v);
        else
            table.insert(toolTipLines, v);
        end
    end

    for i,v in ipairs(citizen_yields) do
        if(i == 1) then
            table.insert(toolTipLines, "[NEWLINE]" .. Locale.Lookup("LOC_TOOLTIP_DISTRICT_CITIZEN_YIELDS_HEADER"));
            table.insert(toolTipLines, v);
        else
            table.insert(toolTipLines, v);
        end
    end

    if (district.NoAdjacentCity) then
        table.insert(toolTipLines, Locale.Lookup("LOC_DISTRICT_REQUIRE_NOT_ADJACENT_TO_CITY"));
    end
    -- Return the composite tooltip!
    return table.concat(toolTipLines, "[NEWLINE]");

end

g_ToolTipGenerators.KIND_DISTRICT = ToolTipHelper.GetDistrictToolTip;
