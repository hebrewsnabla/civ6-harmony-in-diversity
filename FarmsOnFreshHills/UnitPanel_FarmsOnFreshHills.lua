-- =================================================================================
-- Import base file
-- =================================================================================
local files = {
    "UnitPanel_Expansion2.lua",
    "UnitPanel_Expansion1.lua",
    "UnitPanel.lua",
}

for _, file in ipairs(files) do
    include(file)
    if Initialize then
        print("Loading " .. file .. " as base file");
        break
    end
end

-- =================================================================================
-- Cache base functions
-- =================================================================================
local BASE_BuildActionModHook = BuildActionModHook;

-- =================================================================================
-- Main logic
-- =================================================================================
function HasFreshWater(plot)
    if plot:IsFreshWater() then
        return true;
    end

    -- Check if has an adjacent Aqueduct.
    local adjPlots = Map.GetAdjacentPlots(plot:GetX(), plot:GetY());
    for i, plot in ipairs(adjPlots) do
        if plot ~= nil then
            local districtTypeId = plot:GetDistrictType();
            if districtTypeId ~= nil and districtTypeId ~= -1 then
                local districtType = GameInfo.Districts[districtTypeId].DistrictType;
                if districtType == 'DISTRICT_AQUEDUCT' or districtType == 'DISTRICT_BATH' then
                    local district = CityManager.GetDistrictAt(plot);
                    if district ~= nil and district:IsComplete() then
                        -- Check if pillaged.
                        local cityDistricts = district:GetCity():GetDistricts();
                        if not cityDistricts:IsPillaged(districtTypeId, plot:GetIndex()) then
                            return true;
                        end
                    end
                end
            end
        end
    end

    return false;
end

-- Only need to check if player cannot place farm on this plot due to non fresh water hills, since normal farms check should have already been done.
-- i.e. If the plot doesn't belong to the user, has features (forrest, jungle, etc.), has resources, has district, etc.
function ShouldDisableHillFarm(plot, player)
    if plot == nil or player == nil then
        -- Shouldn't be executed.
        return true;
    end

    -- Should disable hill farm if the player doesn't have CIVIL_ENGINEERING and the hill doesn't have fresh water.
    if player:GetCulture():HasCivic(m_CivicCivilEngineering) then
        return false;
    end

    -- If reached here, player doesn't have CIVIL_ENGINEERING.
    local terrainType = GameInfo.Terrains[plot:GetTerrainType()].TerrainType;
    if terrainType ~= 'TERRAIN_PLAINS_HILLS'
        and terrainType ~= 'TERRAIN_GRASS_HILLS'
        and terrainType ~= 'TERRAIN_TUNDRA_HILLS' then
            return false;
    end

    -- If reached here, player doesn't have CIVIL_ENGINEERING and the plot is a hill.
    if not HasFreshWater(plot) then
        -- Should disable hill farm since this hill is not a fresh water hill.
        return true;
    end

    -- Don't need to disable by default since it allows normal farm to check itself.
    return false;
end

function BuildActionModHook(instance:table, action:table)
    -- is this the "build improvement" action, and is it for an farm?
    if action.userTag == UnitOperationTypes.BUILD_IMPROVEMENT and action.IconId == "ICON_IMPROVEMENT_FARM" then
        -- do we have a selected player and unit?
        if g_selectedPlayerId ~= nil and g_selectedPlayerId ~= -1 and g_UnitId ~= nil and g_UnitId ~= -1 then
            local player = Players[g_selectedPlayerId];
            local unit =  player:GetUnits():FindID(g_UnitId);
            if unit ~= nil then
                local unitPos:number = unit:GetPlotId();
                if Map.IsPlot(unitPos) then
                    local plot:table = Map.GetPlotByIndex(unitPos);
                    if plot ~= nil then
                        if ShouldDisableHillFarm(plot, player) then
                            action.Disabled = true;
                        end
                    end
                end
            end
        end
    end
    BASE_BuildActionModHook(instance, action);
end
