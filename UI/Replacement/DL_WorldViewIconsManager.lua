-- =================================================================================
-- Import base file
-- =================================================================================
local files = {
    "WorldViewIconsManager_RAD.lua",
    "WorldViewIconsManager_CQUI.lua",
    "WorldViewIconsManager.lua",
}

for _, file in ipairs(files) do
    include(file)
    if Initialize then
        print("DL_WorldViewIconsManager Loading " .. file .. " as base file");
        break
    end
end

include("FarmsOnFreshHills_Common");

-- ===========================================================================
--  Cache base functions
-- ===========================================================================
BASE_AddImprovementRecommendationsForCity = AddImprovementRecommendationsForCity;
BASE_SetResourceIcon = SetResourceIcon;

-- =================================================================================
-- Overrides
-- =================================================================================
local m_RecommendedImprovementPlots :table = {};

-- Copied from original WorldViewIconsManager.lua.
function ClearImprovementRecommendations()
    -- Hide previous recommendations
    for i,plotIndex in ipairs(m_RecommendedImprovementPlots) do
        local pRecommendedPlotInstance = GetInstanceAt(plotIndex);
        pRecommendedPlotInstance.ImprovementRecommendationBackground:SetHide(true);
    end

    -- Clear table
    m_RecommendedImprovementPlots = {};
end

function AddImprovementRecommendationsForCity( pCity:table, pSelectedUnit:table )
    local pCityAI:table = pCity:GetCityAI();
    if pCityAI then
        local recommendList:table = pCityAI:GetImprovementRecommendationsForBuilder(pSelectedUnit:GetComponentID());
        for key, value in pairs(recommendList) do
            local pRecommendedPlotInstance = GetInstanceAt(value.ImprovementLocation);

            -- Get improvement info
            local pImprovementInfo:table = GameInfo.Improvements[value.ImprovementHash];
            local improvementIcon = pImprovementInfo.Icon;
            local improvementName = pImprovementInfo.Name;

            if pImprovementInfo.ImprovementType == "IMPROVEMENT_FARM" then
                -- Perform fresh water hill farm check.
                local playerID = Game.GetLocalPlayer();
                if playerID ~= nil and playerID ~= -1 then
                    local player = Players[playerID];
                    local plot = Map.GetPlotByIndex(value.ImprovementLocation);
                    if ShouldDisableHillFarm(plot, player) then
                        -- A non fresh water hill farm is being recommended but the player cannot place it.
                        -- Check if the player can place mine, i.e. has TECH_MINING.
                        if player:GetTechs():HasTech(GameInfo.Technologies['TECH_MINING'].Index) then
                            -- The player can place mine. If a hill farm can be placed, that means a mine can also be placed.
                            -- Therefore setting the improvementInfo to be mine.
                            local pMineInfo = GameInfo.Improvements["IMPROVEMENT_MINE"];
                            improvementIcon = pMineInfo.Icon;
                            improvementName = pMineInfo.Name;
                        else
                            -- Otherwise remove the recommendation.
                            improvementIcon = nil;
                            improvementName = nil;
                        end
                    end
                end
            end

            if improvementIcon ~= nil and improvementName ~= nil then
                -- Update icon
                pRecommendedPlotInstance.ImprovementRecommendationIcon:TrySetIcon(improvementIcon, 256);

                -- Update tooltip
                pRecommendedPlotInstance.ImprovementRecommendationIcon:SetToolTipString(Locale.Lookup("LOC_TOOLTIP_IMPROVEMENT_RECOMMENDATION", improvementName));

                -- Show recommendation and add to list for clean up later
                pRecommendedPlotInstance.ImprovementRecommendationBackground:SetHide(false);
                table.insert(m_RecommendedImprovementPlots, value.ImprovementLocation);
            end
        end
    end
end

function SetResourceIcon(pInstance:table, pPlot, type, state)
    BASE_SetResourceIcon(pInstance, pPlot, type, state);

    local resourceInfo = GameInfo.Resources[type];
    if pPlot and resourceInfo then
        local resourceType:string = resourceInfo.ResourceType;
        local featureType :string;
        local terrainType :string;

        local feature = GameInfo.Features[pPlot:GetFeatureType()];
        if(feature) then
            featureType = feature.FeatureType;
        end

        local terrain = GameInfo.Terrains[pPlot:GetTerrainType()];
        if(terrain) then
            terrainType = terrain.TerrainType;
        end

        if resourceInfo.ResourceClassType ~= "RESOURCECLASS_ARTIFACT" then
            local tValidImprovements:table = {}
            for row in GameInfo.Improvement_ValidResources() do
                -- print(GameInfo.Improvements[row.ImprovementType].TraitType)
                if (row.ResourceType == resourceType) and (GameInfo.Improvements[row.ImprovementType].TraitType == nil) then
                    if( terrainType == "TERRAIN_COAST") then
                        if ("DOMAIN_SEA" == GameInfo.Improvements[ row.ImprovementType].Domain) then
                            table.insert(tValidImprovements, row.ImprovementType);
                        elseif ("DOMAIN_LAND" == GameInfo.Improvements[ row.ImprovementType].Domain) then
                            valid_domain = false;
                        end
                    else
                        if ("DOMAIN_SEA" == GameInfo.Improvements[ row.ImprovementType].Domain) then
                            valid_domain = false;
                        elseif ("DOMAIN_LAND" == GameInfo.Improvements[ row.ImprovementType].Domain) then
                            table.insert(tValidImprovements, row.ImprovementType);
                        end
                    end
                end
            end

            local resourceImprovementType;
            if (table.count(tValidImprovements) > 0) then
                if (table.count(tValidImprovements) > 1) then
                    for i, improvement in ipairs(tValidImprovements) do
                        local improvementType = improvement;

                        local has_feature = false;
                        local valid_feature = false;
                        for inner_row in GameInfo.Improvement_ValidFeatures() do
                            if(inner_row.ImprovementType == improvementType) then
                                has_feature = true;
                                if(inner_row.FeatureType == featureType) then
                                    valid_feature = true;
                                end
                            end
                        end
                        valid_feature = not has_feature or valid_feature;

                        local has_terrain = false;
                        local valid_terrain = false;
                        for inner_row in GameInfo.Improvement_ValidTerrains() do
                            if(inner_row.ImprovementType == improvementType) then
                                has_terrain = true;
                                if(inner_row.TerrainType == terrainType) then
                                    valid_terrain = true;
                                end
                            end
                        end
                        valid_terrain = not has_terrain or valid_terrain;

                        -- if we match the resource in Improvement_ValidResources it's a get-out-of-jail-free card for feature and terrain checks
                        local valid_resources = false;
                        for inner_row in GameInfo.Improvement_ValidResources() do
                            if(inner_row.ImprovementType == improvementType) then
                                if(inner_row.ResourceType == resourceType) then
                                    valid_resources = true;
                                    break;
                                end
                            end
                        end

                        if ((valid_feature == true and valid_terrain == true) or (valid_resources == true)) then
                            resourceImprovementType = improvementType;
                            break;
                        end
                    end
                else
                    local improvementType = tValidImprovements[1];
                    resourceImprovementType = improvementType;
                end
            end

            -- Add some tooltip information about the resource
            local toolTipItems:table = {};
            table.insert(toolTipItems, pInstance.ResourceIcon:GetToolTipString());
            if resourceImprovementType ~= nil then
                local improvementString = Locale.Lookup(GameInfo.Improvements[resourceImprovementType].Name);
                table.insert(toolTipItems, Locale.Lookup("LOC_TOOLTIP_RESOURCE_IMPROVED_BY") .. improvementString);
                if GameInfo.HDMonopolyResourceEffects ~= nil then
                    local corpInfo = GameInfo.HDMonopolyResourceEffects[resourceType];
                    if corpInfo ~= nil then
                        local categoryString = Locale.Lookup("LOC_HD_PEDIA_CATEGORY_" .. corpInfo.Category .. "_NAME")
                        table.insert(toolTipItems, Locale.Lookup("LOC_TOOLTIP_RESOURCE_CORP_CATEGORY") .. categoryString);
                    end
                end
            end
            pInstance.ResourceIcon:SetToolTipString(table.concat(toolTipItems, "[NEWLINE]"));
        end
        -- -- Reveal Artifact Detaisl
        -- if resourceInfo.ResourceClassType == "RESOURCECLASS_ARTIFACT" then
        --     local artifactObj = Game.GetArtifactAtPlot(pPlot:GetIndex());
        --     if artifactObj then
        --         local era = GameInfo.Eras[artifactObj.ActingPlayerEra].Name;
        --         local player1 = PlayerConfigurations[artifactObj.ActingPlayerID]:GetPlayerName();
        --         local player2 = nil;
        --         if artifactObj.Type == 0 or artifactObj.Type == 3 or artifactObj.Type == 4 then
        --             player2 = PlayerConfigurations[artifactObj.TargetPlayerID]:GetPlayerName();
        --         end

        --         -- Update tooltip.
        --         local lines = {};
        --         table.insert(lines, pInstance.ResourceIcon:GetToolTipString());
        --         table.insert(lines, "[COLOR:Civ6Red]" .. Locale.Lookup(era) .. "[ENDCOLOR]");
        --         local playerStr = Locale.Lookup(player1);
        --         if player2 then
        --             playerStr = playerStr .. " / " .. Locale.Lookup(player2);
        --         end
        --         table.insert(lines, "[COLOR:Civ6Red]" .. playerStr .. "[ENDCOLOR]");
        --         pInstance.ResourceIcon:SetToolTipString(table.concat(lines, "[NEWLINE]"));
        --     end
        -- end
    end
end
