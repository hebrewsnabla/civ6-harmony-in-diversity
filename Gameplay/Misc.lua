Utils = {};

function OnPlayerEraScoreChanged(playerID, amountAwarded)
    local player = Players[playerID]
    if player ~= nil then
        -- print(player)
        if player:IsMajor() then
            local amount = tonumber(GameInfo.GlobalParameters['GOLD_FOR_EVERY_ERA_SCORE'].Value)
            player:GetTreasury():ChangeGoldBalance(amountAwarded * amount)
        end
    end
end

Events.PlayerEraScoreChanged.Add(OnPlayerEraScoreChanged)

local m_FortID = GameInfo.Improvements['IMPROVEMENT_FORT'].Index;
local m_WatchTower = GameInfo.Improvements['IMPROVEMENT_SAILOR_WATCHTOWER'];
local m_WatchTowerID = -1;
if m_WatchTower ~= nil then
    m_WatchTowerID = m_WatchTower.Index;
end
local PROP_IMPROVEMENT_PILLAGED_TURNS = "ImprovementsPillagedTurns";
local needTurn = GlobalParameters.TURNS_BEFORE_DESTROY_AFTER_PILLAGE;

-- Countdown for Pillaged Watchtower or Fort.
GameEvents.OnGameTurnStarted.Add(function (currentTurn)
    local mapsize = GameInfo.Maps[Map.GetMapSize()];
    local iH = mapsize.GridHeight;
    local iW = mapsize.GridWidth;
    for x = 0, iW - 1 do
        for y = 0, iH - 1 do
            local plot = Map.GetPlotXY(x, y);
            if (plot ~= nil) then
                local eImprovement = plot:GetImprovementType();
                -- Fort or Watchtower Improvement (outside territory).
                if (eImprovement == m_FortID or eImprovement == m_WatchTowerID) and plot:GetOwner() == -1 then
                    local turns = plot:GetProperty(PROP_IMPROVEMENT_PILLAGED_TURNS) or 0;
                    if (plot:IsImprovementPillaged()) then
                        if turns == needTurn then
                            -- destroy the improvement.
                            ImprovementBuilder.SetImprovementType(plot, -1, -1);
                            print('Improvement completely destroyed: ', plot:GetX(), plot:GetY());
                            break;
                        end
                        message = Locale.Lookup("LOC_TURNS_BEFORE_DESTROY_HD", needTurn - turns);
                        turns = turns + 1;
                        Game.AddWorldViewText(0, message, plot:GetX(), plot:GetY());
                        -- UI.AddWorldViewText(EventSubTypes.PLOT, message, plot:GetX(), plot:GetY(), 0);
                    else
                        turns = 0;
                    end
                    plot:SetProperty(PROP_IMPROVEMENT_PILLAGED_TURNS, turns)
                end
            end
        end
    end
end);

-- BUG
-- Events.ImprovementAddedToMap.Add(function (iX, iY, improvementID, playerID)
--     local plot = Map.GetPlotXY(iX, iY);
--     -- The Wrong plot. 
--     print(iX, iY, improvementID, playerID);
--     if improvementID == m_FortID then
--         plot:SetOwner(playerID);
--     end
-- end);

-- strategic projects
function ProjectStrategicResourcesChange(playerID, projectID)
    local player = Players[playerID]
    local m_project_table = GameInfo.Projects['PROJECT_BREEDING_GOOD_FOALS'].Index  
    local resourceInfo = GameInfo.Resources();
	local playerResources = Players[playerID]:GetResources();
    if  (m_project_table ~= nil) then  
        local m_project = m_project_table.Index
        if projectID == m_project then
	        for resource in GameInfo.Resources() do
	            if resource.ResourceType == "RESOURCE_HORSES" then
		        playerResources:ChangeResourceAmount(resource.Index, 20);
	            end
            end
        end
	end
end

Events.CityProjectCompleted.Add(ProjectStrategicResourcesChange)