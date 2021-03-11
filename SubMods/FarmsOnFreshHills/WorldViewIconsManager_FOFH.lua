-- =================================================================================
-- Import base file
-- =================================================================================
local files = {
    "WorldViewIconsManager.lua",
}

for _, file in ipairs(files) do
    include(file)
    if Initialize then
        print("FOFH Loading " .. file .. " as base file");
        break
    end
end

include("FarmsOnFreshHills_Common");

-- ===========================================================================
--	Cache base functions
-- ===========================================================================
BASE_AddImprovementRecommendationsForCity = AddImprovementRecommendationsForCity;

-- =================================================================================
-- Overrides
-- =================================================================================
local m_RecommendedImprovementPlots	:table = {};

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
