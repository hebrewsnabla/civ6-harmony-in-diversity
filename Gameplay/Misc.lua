Utils = ExposedMembers.DLHD.Utils;

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
function ProjectStrategicResourcesChange(playerID, cityID, projectID)
    local player = Players[playerID]
    -- print(GameInfo.Projects['PROJECT_GRANT_RESOURCE_HORSES'].Index, projectID)
    local project_name = GameInfo.Projects[projectID].ProjectType
    local resource_name = string.sub(project_name, 15)
    if string.sub(project_name, 1, 14) == 'PROJECT_GRANT_' then
        local playerResources = Players[playerID]:GetResources()
        local resource_id = GameInfo.Resources[resource_name].Index
        playerResources:ChangeResourceAmount(resource_id, 20)
    end
end

Events.CityProjectCompleted.Add(ProjectStrategicResourcesChange)

-- great admiral free strategic resource for heal
function GreatAdmiralFreeStrategicResource(unitOwner, unitID, greatPersonClassID, greatPersonIndividualID)
	local owner = Players[unitOwner]
    if greatPersonIndividualID == GameInfo.GreatPersonIndividuals["GREAT_PERSON_INDIVIDUAL_YI_SUN_SIN"].Index or 
       greatPersonIndividualID == GameInfo.GreatPersonIndividuals["GREAT_PERSON_INDIVIDUAL_FRANZ_VON_HIPPER"].Index then    
        local resource_id = GameInfo.Resources["RESOURCE_COAL"].Index
		owner:GetResources():ChangeResourceAmount(resource_id, 1)
	end
    if greatPersonIndividualID == GameInfo.GreatPersonIndividuals["GREAT_PERSON_INDIVIDUAL_CHESTER_NIMITZ"].Index then    
        local resource_id = GameInfo.Resources["RESOURCE_OIL"].Index
		owner:GetResources():ChangeResourceAmount(resource_id, 1)
	end
end

Events.UnitGreatPersonActivated.Add(GreatAdmiralFreeStrategicResource)


-- Evolution Theory Boost
function EvolutionheoryBoost(playerID, districtID, iX, iY)
    local pPlayer = Players[playerID]
    if pPlayer ~= nil then
        local plot = Map.GetPlot(iX, iY)
        local districtType = plot:GetDistrictType()
        if Utils.IsDistrictType(districtType, 'DISTRICT_CAMPUS') then
            local iDistrictContinent = plot:GetContinentType()
            local iCapital = pPlayer:GetCities():GetCapitalCity()
            local iCapitalPlot = Map.GetPlot(iCapital:GetX(), iCapital:GetY())
            local iCapitalContinent = iCapitalPlot:GetContinentType()
            if (iDistrictContinent ~= nil and iCapitalContinent ~= nil and iDistrictContinent ~= iCapitalContinent) then
                local m_EvolutionTheory = GameInfo.Civics['CIVIC_EVOLUTION_THEORY_HD'].Index;
                pPlayer:GetCulture():TriggerBoost(m_EvolutionTheory, 1);
            end
        end
    end
end

GameEvents.OnDistrictConstructed.Add(EvolutionheoryBoost)

-- -- Paper Making Boost
-- function PaperMakingBoost(iX, iY, eImprovement, playerID, resource, isPillaged, isWorked)
--     local pPlayer = Players[playerID]
--     if pPlayer ~= nil then
--         local pPlot = Map.GetPlot(iX, iY)
--         local pFeature = pPlot:GetFeatureType() 
--         local pCity = CityManager.GetCityAt(iX, iY)
    
--         local m_PaperMaking = GameInfo.Technologies['TECH_PAPER_MAKING_HD'].Index;
--         pPlayer:GetTechs():TriggerBoost(m_PaperMaking, 1);

--     end
-- end

-- Events.ImprovementAddedToMap.Add(PaperMakingBoost)