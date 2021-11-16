
GreatPersonUtils = {};

local CITY_CENTER_INDEX = GameInfo.Districts["DISTRICT_CITY_CENTER"].Index;
local SPACE_PORT_INDEX = GameInfo.Districts["DISTRICT_SPACEPORT"].Index;
local DISTRICT_WONDER_INDEX = GameInfo.Districts["DISTRICT_WONDER"].Index;

local MIMAR_SINAN_INDEX = GameInfo.GreatPersonIndividuals["GREAT_PERSON_INDIVIDUAL_MIMAR_SINAN"].Index;

local MIMAR_SINAN_INVALID_DISTRICTS = {};
MIMAR_SINAN_INVALID_DISTRICTS[CITY_CENTER_INDEX] = true;
MIMAR_SINAN_INVALID_DISTRICTS[SPACE_PORT_INDEX] = true;
MIMAR_SINAN_INVALID_DISTRICTS[DISTRICT_WONDER_INDEX] = true;

-- Return table of plot index
GreatPersonUtils.GetActivationPlots = function(playerID, greatPersonIndividualID)
    local player = Players[playerID];
    if greatPersonIndividualID == MIMAR_SINAN_INDEX then
        local activationPlots = {};
        for _, district in player:GetDistricts():Members() do
            if (district ~= nil and not MIMAR_SINAN_INVALID_DISTRICTS[district:GetType()]) then
                local isValid = false;
                if district:IsComplete() then
                    isValid = true;
                else
                    local districtCity = district:GetCity();
                    if districtCity ~= nil then
                        local currentlyBuilding = districtCity:GetBuildQueue():CurrentlyBuilding();
                        local districtType = GameInfo.Districts[district:GetType()].DistrictType;
                        print('HD_DEBUG', currentlyBuilding, districtType)
                        if districtType == currentlyBuilding then
                            isValid = true;
                        end
                    end
                end
                if isValid then
                    local districtPlot:table = Map.GetPlot(district:GetX(), district:GetY());
                    print('HD_DEBUG plot', district:GetX(), district:GetY(), districtPlot)
                    if districtPlot ~= nil then
                        table.insert(activationPlots, districtPlot:GetIndex());
                    end
                end
            end
        end
        return activationPlots;
    end
    return nil;
end

GreatPersonUtils.HandleActivation = function(unitOwner, unitID, greatPersonIndividualID)
    local owner = Players[unitOwner];
    if greatPersonIndividualID == MIMAR_SINAN_INDEX then
        if unitOwner == Game.GetLocalPlayer() then
            -- local player activation.
            local unit = UnitManager.GetUnit(unitOwner, unitID);
            local unitPlot = Map.GetPlot(unit:GetX(), unit:GetY());
            local districtAtPlot = CityManager.GetDistrictAt(unitPlot);
            if districtAtPlot ~= nil then
                -- Attach culture bomb modifier.
                local districtIndex = districtAtPlot:GetType();
                local districtType = GameInfo.Districts[districtIndex].DistrictType;
                owner:AttachModifierByID("CULTURE_BOMB_TRIGGER_" .. districtType);
                -- Complete district at plot if not completed.
                if not districtAtPlot:IsComplete() then
                    local districtCity = districtAtPlot:GetCity();
                    if districtCity ~= nil then
                        -- The activatable plot's district must be building the district. (Checked in GetActivationPlots call).
                        districtCity:GetBuildQueue():FinishProgress();
                    end
                end
            end
        elseif owner:IsAI() then
            -- AI activation, give AI random district culture bomb.
            local randPool = {};
            for row in GameInfo.Districts() do
                if not MIMAR_SINAN_INVALID_DISTRICTS[row.Index] then
                    if (row.PrereqTech == nil or owner:GetTechs():HasTech(GameInfo.Technologies[row.PrereqTech].Index))
                        and (row.PrereqCivic == nil or owner:GetCulture():HasCivic(GameInfo.Civics[row.PrereqCivic].Index)) then
                            table.insert(randPool, row.DistrictType);
                    end
                end
            end
            if #randPool > 0 then
                local rand = TerrainBuilder.GetRandomNumber(#randPool, "Mimar Sinan AI random pool");
                owner:AttachModifierByID("CULTURE_BOMB_TRIGGER_" .. randPool[rand]);
            end
        end
    end
end

ExposedMembers.DLHD = ExposedMembers.DLHD or {};
ExposedMembers.DLHD.GreatPersonUtils = GreatPersonUtils;