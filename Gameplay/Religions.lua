-- Founder Belief

-- To the Glory of God:
-- 33% chance getting a relic when a GreatPerson is fully consumed.
function OnGreatPersonActivated(unitOwner, unitID, greatPersonClassID, greatPersonIndividualID)
    local owner = Players[unitOwner];
    if owner == nil then return end

    local unit = owner:GetUnits():FindID(unitID);

    if (unit ~= nil) and (unit:GetGreatPerson() ~= nil) and (unit:GetGreatPerson():GetActionCharges() == 0) then
        -- The great person unit has used up all the charges.
        -- Check if the owner has "To the Glory of God" belief.
        local religions = Game.GetReligion():GetReligions();
        for _, religion in ipairs(religions) do
            if (religion.Founder == unitOwner) then
                for _, beliefIndex in ipairs(religion.Beliefs) do
                    if GameInfo.Beliefs[beliefIndex].BeliefType == "BELIEF_TO_THE_GLORY_OF_GOD" then
                        -- The owner has "To the Glory of God" belief, give out a relic by 33% chance.
                        local rand = math.random(1, 100);
                        if (rand <= 33) then
                            GrantRelic(unitOwner);
                        end
                    end
                end
            end
        end
    end
end

-- Generic helper function to grant a relic to the given player.
function GrantRelic(playerID)
    local player = Players[playerID];
    if player == nil then return end

    local playerCities = player:GetCities()

    if playerCities ~= nil then
        local capitalCity = playerCities:GetCapitalCity();
        if capitalCity ~= nil then
            local capitalCityBuildings = capitalCity:GetBuildings();
            local buildingQueue = capitalCity:GetBuildQueue();
            if capitalCityBuildings ~= nil and buildingQueue ~= nil then
                local relicCreatorIndex = GameInfo.Buildings["BUILDING_RELIC_CREATOR"].Index;
                -- Remove Relic Creator from the city just in case.
                if capitalCityBuildings:HasBuilding(relicCreatorIndex) then
                    capitalCityBuildings:RemoveBuilding(relicCreatorIndex);
                end
                -- Create BUILDING_RELIC_CREATOR in the capital city.
                buildingQueue:CreateBuilding(relicCreatorIndex);
                -- The relic should be created by now. Remove the BUILDING_RELIC_CREATOR from the city.
                capitalCityBuildings:RemoveBuilding(relicCreatorIndex);

                -- Cancel additional notification for the local player (the last RELIC_CREATED notification).
                local lastRelicCreated = nil;
                local localPlayerId = Game.GetLocalPlayer();
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
end

Events.UnitGreatPersonActivated.Add(OnGreatPersonActivated)