-- =======================================================================
-- Common helper functions to be used by other files.
-- =======================================================================
Utils = {};

Utils.HasBuildingWithinCountry = function( playerID, buildingID )
    local player = Players[playerID]
    local Allcity = player:GetCities()
    if player ~= nil and Allcity ~= nil then
        for _, city in Allcity:Members() do
            local CityHasBuilding = city:GetBuildings():HasBuilding(buildingID)
            if CityHasBuilding then
                return true
            end            
        end       
    end
    return false
end


Utils.CivilizationHasTrait = function(sCiv, sTrait)
    for tRow in GameInfo.CivilizationTraits() do
        if (tRow.CivilizationType == sCiv and tRow.TraitType == sTrait) then
            return true
        end
    end
    return false
end

Utils.LeaderHasTrait = function (sLeader, sTrait)
    for tRow in GameInfo.LeaderTraits() do
        if (tRow.LeaderType == sLeader and tRow.TraitType == sTrait) then return true end
    end
    return false
end

Utils.PlayerAttachModifierByID = function(playerID, sModifierID)
    local player = Players[playerID]
    if player ~= nil then
        player:AttachModifierByID(sModifierID)
    end
end

Utils.ChangeFaithBalance = function(capturerID, amount)
    local player = Players[capturerID]
    if player ~= nil then
        player:GetReligion():ChangeFaithBalance(amount)
    end
end

Utils.ChangeGoldBalance = function(playerID, amount)
    local player = Players[playerID]
    if player ~= nil then
        player:GetTreasury():ChangeGoldBalance(amount)
    end
end

Utils.GetPlotDistance = function(plotIndex, otherPlotIndex)
    return Map.GetPlotDistance(plotIndex, otherPlotIndex)
end

Utils.RemoveBuilding = function(playerID, cityID, buildingID)
    local city = CityManager.GetCity(playerID, cityID)
    if city ~= nil then
        local buildings = city:GetBuildings()
        buildings:RemoveBuilding(buildingID)
    end
end

Utils.CreateBuilding = function(playerID, cityID, buildingID)
    local city = CityManager.GetCity(playerID, cityID)
    if city ~= nil then
        local buildingQueue = city:GetBuildQueue()
        buildingQueue:CreateBuilding(buildingID)
    end
end

Utils.SetImprovementType = function(plotID, ImprovementID, OwnerID)
    local plot = Map.GetPlotByIndex(plotID)
    ImprovementBuilder.SetImprovementType(plot, ImprovementID, OwnerID)
end

Utils.SetPlotProperty = function(plotID, key, value)
    local plot = Map.GetPlotByIndex(plotID)
    print(plot:GetX(), plot:GetY(), plot)
    plot:SetProperty(key, value)
end

Utils.SetPlayerProperty = function(playerID, key, value)
    local player = Players[playerID]
    player:SetProperty(key, value)
end

Utils.SendEnvoy = function(playerID, citystateID)
    -- Need to make sure the second is citystate
    local player = Players[playerID]
    if player ~= nil then
        player:GetInfluence():GiveFreeTokenToPlayer(citystateID)
    end
end

Utils.AddGreatPeoplePoints = function(playerID, gppID, amount)
    local player = Players[playerID]
    if player ~= nil then
        player:GetGreatPeoplePoints():ChangePointsTotal(gppID, amount)
    end
end

Utils.SetUnitExperience = function(playerID, unitID, amount)
    local unit = UnitManager.GetUnit(playerID, unitID)
    if unit ~= nil then
        -- print('+exp', amount)
        unit:GetExperience():SetExperienceLocked(false);
        unit:GetExperience():ChangeExperience(amount);
    end
end

Utils.SetUnitStoredPromotions = function(playerID, unitID, amount)
    local unit = UnitManager.GetUnit(playerID, unitID)
    if amount == nil then 
        amount = 1
    end
    if unit ~= nil then
        unit:GetExperience():ChangeStoredPromotions(amount);
    end
end

-- Generic helper function to grant a relic to the given player.
Utils.GrantRelic = function(playerID)
    local player = Players[playerID];

    if player ~= nil then
        -- Grant relic here.
        player:AttachModifierByID("MODIFIER_RELIC_CREATOR");

        -- Cancel additional notification for the local player (the last RELIC_CREATED notification).
        local localPlayerId = Game.GetLocalPlayer();
        if localPlayerId == playerID then
            local lastRelicCreated = nil;
            local notificationIds = NotificationManager.GetList(localPlayerId);
            for _, notificationId in ipairs(notificationIds) do
                local notification = NotificationManager.Find(localPlayerId, notificationId);
                if notification ~= nil and notification:GetType() == NotificationTypes.RELIC_CREATED then
                    lastRelicCreated = notification;
                end
            end
            if lastRelicCreated ~= nil and not lastRelicCreated:IsDismissed() then
                NotificationManager.Dismiss(localPlayerId, lastRelicCreated:GetID());
            end
        end
    end
end

ExposedMembers.DLHD = ExposedMembers.DLHD or {};
ExposedMembers.DLHD.Utils = Utils;


-- --Evolution Theory Boost
-- function EvolutionheoryBoost(playerID, cityID, iX, iY)
--     local pPlayer = Players[playerID];

--     local iCampusPlot = Map.GetPlot(iX, iY);

--     local iCapital = Players:GetCities:GetCapitalCity();

--     local m_EvolutionTheory = GameInfo.Civics['CIVIC_EVOLUTION_THEORY'].Index;
    
--     pPlayer:GetCulture():TriggerBoost(m_EvolutionTheory, 0.4);
-- end

-- Events.CityBuilt.Add(EvolutionheoryBoost)

-- --city Built 触发这个事件的时候你判断这个位置是不是和首都位置不在同一个大陆