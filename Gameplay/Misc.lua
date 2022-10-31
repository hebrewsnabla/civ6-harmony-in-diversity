include "HD_StateUtils"
Utils = ExposedMembers.DLHD.Utils;

ExposedMembers.GameEvents = GameEvents

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
--         if pFeature == GameInfo.Features['FEATURE_FOREST'].Index then
--             local pCity = Cities.GetPlotPurchaseCity(pPlot)
--             local pBuildingIndex = GameInfo.Buildings['BUILDING_OFFICIAL_RUN_HANDCRAFT'].Index
--             if pCity:GetBuildings():HasBuilding(pBuildingIndex) then
--                 local m_PaperMaking = GameInfo.Technologies['TECH_PAPER_MAKING_HD'].Index
--                 pPlayer:GetTechs():TriggerBoost(m_PaperMaking, 1)
--             end
--         end
--     end
-- end

-- Events.ImprovementAddedToMap.Add(PaperMakingBoost)

function SyncFavor(playerID)
    local player = Players[playerID]
    player:AttachModifierByID('HD_GRANT_ZERO_FAVOR')
end
GameEvents.ForceSyncFavor.Add(SyncFavor)

function ChangeFaithBalance(playerID, amount)
    local player = Players[playerID]
    if player ~= nil then
        player:GetReligion():ChangeFaithBalance(amount)
    end
end
GameEvents.RequestChangeFaithBalance.Add(ChangeFaithBalance)

GameEvents.RequestCreateBuilding.Add(function (playerID, cityID, buildingID)
    local city = CityManager.GetCity(playerID, cityID)
    print('HD DEBUG create building requested', playerID, cityID, buildingID)
    if city then
        local buildingQueue = city:GetBuildQueue()
        -- print(city, buildingQueue)
        buildingQueue:CreateBuilding(buildingID) 
    end
end)

GameEvents.RequestRemoveBuilding.Add(function (playerID, cityID, buildingID)
    local city = CityManager.GetCity(playerID, cityID)
    print('HD DEBUG remove building requested', playerID, cityID, buildingID)
    if city ~= nil then
        local buildings = city:GetBuildings()
        buildings:RemoveBuilding(buildingID)
    end
end)

GameEvents.ChangeUnitExperience.Add(function(playerID, unitID, amount)
    local unit = UnitManager.GetUnit(playerID, unitID)
    if unit ~= nil then
        print('HD DEBUG +exp', amount, playerID, unitID)
        unit:GetExperience():SetExperienceLocked(false);
        unit:GetExperience():ChangeExperience(amount);
    end
end)

GameEvents.SendEnvoytoCityState.Add(function(playerID, citystateID)
    -- Need to make sure the second is citystate
    local player = Players[playerID]
    if player ~= nil then
        player:GetInfluence():GiveFreeTokenToPlayer(citystateID)
    end
end)

GameEvents.AddGreatPeoplePoints.Add(function(playerID, gppID, amount)
    local player = Players[playerID]
    if player ~= nil then
        print('HD DEBUG add great people point', playerID, gppID, amount)
        player:GetGreatPeoplePoints():ChangePointsTotal(gppID, amount)
    end
end)

-- Archer for City State
local CITY_STATE_ARCHER_TURN_KEY = 'CITY_STATE_ARCHER_TURN';
function ArcherForCityState ()
	if Game.GetCurrentGameTurn() == 1 then
		local min = GlobalParameters.CITY_STATE_ARCHER_MIN_TURN;
		local max = GlobalParameters.CITY_STATE_ARCHER_MAX_TURN;
		if (min ~= nil) and (max ~= nil) and (min <= max) then
			for _, player in pairs(Players) do
				if (player ~= nil) and (player:GetInfluence() ~= nil) and player:GetInfluence():CanReceiveInfluence() then
					player:SetProperty(CITY_STATE_ARCHER_TURN_KEY, math.random(min, max));
				end
			end
		end
	end
	for _, player in pairs(Players) do
		if (player ~= nil) and (player:GetInfluence() ~= nil) then
			local turn = player:GetProperty(CITY_STATE_ARCHER_TURN_KEY);
			if (turn ~= nil) and (turn == Game.GetCurrentGameTurn()) then
				player:AttachModifierByID('CITY_STATE_GRANT_ARCHER');
			end
		end
	end
end
Events.TurnBegin.Add(ArcherForCityState);

-- Record Resources on Map
--local PRESERVE_MAP_HAS_KEY = 'HD_PRESERVE_MAP_HAS';
--local iProperty = "HD_MAP_HAS_"
--function HDvIn(tbl, value)
--    if tbl == nil then
--        return false
--    end
--    for k, v in ipairs(tbl) do
--        if v == value then
--            return true
--        end
--    end
--    return false
--end
--
--
--function calculateResourceOnMap ()
--	HD_MapResourcesArray = {};
--	local iW, iH;
--	iW, iH = Map.GetGridSize();
--	for x = 0, iW - 1 do
--		for y = 0, iH - 1 do
--			local i = y * iW + x;
--			local pPlot = Map.GetPlotByIndex(i);
--			if (pPlot ~= nil) then
--				local iResourceType = pPlot:GetResourceType();
--				if (iResourceType ~= nil and iResourceType ~= -1) then
--					local iResource = GameInfo.Resources[iResourceType];
--					if (iResource ~= nil and iResource.ResourceClassType ~= 'RESOURCECLASS_ARTIFACT') then
--						HD_MapResourcesArray[iResource.ResourceType] = 1;
--					end
--				end
--			end
--		end
--	end
--	Game.SetProperty(PRESERVE_MAP_HAS_KEY, HD_MapResourcesArray);
--	for resourceType, _ in pairs(HD_MapResourcesArray) do
--		local iPropertyKey = "" .. iProperty .. resourceType .. ""
--		Game.SetProperty(iPropertyKey, 1);
--	end
--end
--
-- Preserve Tier 3
--local PRESERVE_INDEX;
--if GameInfo.Districts['DISTRICT_PRESERVE'] ~= nil then
--	PRESERVE_INDEX = GameInfo.Districts['DISTRICT_PRESERVE'].Index;
--end
--function PreserveEpoSetProperty(playerID, districtID, cityID, iX, iY, districtType, percentComplete)
--	local HD_MapResourcesArray = Game.GetProperty(PRESERVE_MAP_HAS_KEY);
--	if HD_MapResourcesArray == nil then
--		calculateResourceOnMap();
--		HD_MapResourcesArray = Game.GetProperty(PRESERVE_MAP_HAS_KEY);
--	end
--	if (playerID >= 0) and (PRESERVE_INDEX ~= nil) and (districtID == PRESERVE_INDEX) then
--		local iPlot = Map.GetPlot(iX, iY);
--		for resourceType, _ in pairs(HD_MapResourcesArray) do
--			local iPropertyKey = "" .. iProperty .. resourceType;
--			iPlot:SetProperty(iPropertyKey, 1);
--		end
--	end
--end
--Events.DistrictAddedToMap.Add(PreserveEpoSetProperty)

-- Moon Landing
local MOON_LANDING_INDEX = GameInfo.Projects['PROJECT_LAUNCH_MOON_LANDING'].Index;
function MoonLandingBoost(playerId, cityId, projectId)
	if projectId ~= MOON_LANDING_INDEX then
		return;
	end
    local player = Players[playerId];
	local playerCulture = player:GetCulture();
	local boostPercent = 0;
	for row in GameInfo.ModifierArguments() do
		if (row.ModifierId == 'LAUNCH_MOON_LANDING_CIVIC_BOOST_PRECENTAGE') and (row.Name == 'Amount') then
			boostPercent = row.Value;
		end
	end
	print(boostPercent);
	for row in GameInfo.Civics() do
		if not playerCulture:HasCivic(row.Index) then
			if playerCulture:HasBoostBeenTriggered(row.Index) then
				local progress = Utils.GetCulturalProgress(playerId, row.Index);
				local cost = playerCulture:GetCultureCost(row.Index);
				playerCulture:SetCulturalProgress(row.Index, progress + cost * boostPercent / 100);
			else
				if row.EraType == 'ERA_FUTURE' then
					player:GetCulture():TriggerBoost(row.Index, 1);
				end
			end
		end
	end
end

Events.CityProjectCompleted.Add(MoonLandingBoost);

-- James Watt
local JAMES_WATT_INDEX = GameInfo.GreatPersonIndividuals['GREAT_PERSON_INDIVIDUAL_JAMES_WATT'].Index;
local JAMES_WATT_ACTIVATION_TIME_KEY = 'JAMES_WATT_ACTIVATION_TIME';
function JamesWattCounter (playerId, unitId, greatPersonClassId, greatPersonIndividualId)
	if greatPersonIndividualId == JAMES_WATT_INDEX then
		local player = Players[playerId];
		local watt = player:GetProperty(JAMES_WATT_ACTIVATION_TIME_KEY) or 0;
		player:SetProperty(JAMES_WATT_ACTIVATION_TIME_KEY, watt + 1);
	end
end
Events.UnitGreatPersonActivated.Add(JamesWattCounter);

-- Reyna
local REYNA_CULTURE_KEY = 'REYNA_CULTURE_';
GameEvents.ReynaChangeCurrentCulturalProgress.Add(function (playerId, amount)
	local player = Players[playerId];
	local turn = Game.GetCurrentGameTurn();
	local key = REYNA_CULTURE_KEY .. turn;
	if player:GetProperty(key) == nil then
		player:SetProperty(key, 1);
		player:GetCulture():ChangeCurrentCulturalProgress(amount);
	end
end);