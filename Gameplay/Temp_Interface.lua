--------------------------------
-- Temp Interface for DEBUG   --
--------------------------------

-- NOTE: The content here can be loaded without game load.
-- NOTE: You can use ExposedMembers to call the functions in the Gameplay, see also Temp_Gameplay.lua

-- Do not change the above ones
-----------------------------------------------------------------------
include "HD_StateUtils"

Utils = ExposedMembers.DLHD.Utils;

function DevineInspirationWonderFaith( iX, iY, buildingID, playerID, cityID, iPercentComplete, iUnknown )
    local pPlayerConfig = PlayerConfigurations[playerID]
    local player = Players[playerID]
    local city = CityManager.GetCity(playerID, cityID)
    local building = GameInfo.Buildings[buildingID]
    local sDarma = 'TRAIT_CIVILIZATION_DHARMA'
    local sCiv = pPlayerConfig:GetCivilizationTypeName()

    if player ~= nil and city ~= nil and building ~= nil then
        local amount = building.Cost * 0.5
        local belief = GameInfo.Beliefs['BELIEF_DIVINE_INSPIRATION'].Index
        local CityReligion = city:GetReligion()
        local Majority = CityReligion:GetMajorityReligion()
        local CityReligions = CityReligion:GetReligionsInCity()
        local religions = Game.GetReligion():GetReligions();
        if religions ~= nil then
            for _, religion in ipairs(religions) do
                for _, beliefIndex in ipairs(religion.Beliefs) do 
                    if  beliefIndex == belief then                      
                        if (religion.Religion == Majority) then
                            Utils.ChangeFaithBalance(playerID, amount)
                            return  
                        end
                        if (Utils.CivilizationHasTrait(sCiv,sDarma)) then
                            for _, rel in ipairs(CityReligions) do
                                if rel.Religion == religion.Religion then
                                    if rel.Followers >= 1 then
                                        Utils.ChangeFaithBalance(playerID, amount)
                                    end
                                end
                            end
                        end                         
                    end            
                end
            end
        end
    end
end

Events.WonderCompleted.Add(DevineInspirationWonderFaith)


-- local m_Walls = GameInfo.Buildings["BUILDING_WALLS"].Index
local m_Walls = GameInfo.Buildings["BUILDING_WALLS_EARLY"].Index
local PROP_KEY_HAVE_GRANT_WALL = 'HaveGrantWalls'

function FreeWallForCapital(playerID, cityID, iX, iY)
    local player = Players[playerID]
    local city = CityManager.GetCity(playerID, cityID)
    if player:IsMajor() then
        -- print('Capital', city:IsCapital(), 'original capital', city:IsOriginalCapital())
        local have_granted = player:GetProperty(PROP_KEY_HAVE_GRANT_WALL)
        if have_granted == nil then
            if (city:IsOriginalCapital()) then
                Utils.CreateBuilding(playerID, cityID, m_Walls)
                Utils.SetPlayerProperty(playerID, PROP_KEY_HAVE_GRANT_WALL, true)
            end
        end
    end
end
Events.CityAddedToMap.Add(FreeWallForCapital)

-- For korea
function getCityCenterPlotIndex(city)
    local x = city:GetX()
    local y = city:GetY()
    return Map.GetPlotIndex(x, y)
end

function UpdateCityHasGovernor(playerID)
    local player = Players[playerID]
    local pCities = player:GetCities()

    for _, city in pCities:Members() do
        local plotID = getCityCenterPlotIndex(city)
        local value = 0
        if city:GetAssignedGovernor() == nil then
            value = 0
        else
            value = 1
        end
        local plot = Map.GetPlotByIndex(plotID)
        -- print(plotID, value)
        SetObjectState(plot, g_PropertyKeys_HD.CityFlags.HasAssignedGovernor, value)
    end
end

function OnGovernorChanged(playerID, governorID)
    -- print('OnGovernorChanged', playerID, governorID)
    UpdateCityHasGovernor(playerID)
end

function OnGovernorAssigned(cityOwner, cityID, governorOwner, governorType)
    -- print('OnGovernorAssigned', cityOwner, cityID, governorOwner, governorType)
    UpdateCityHasGovernor(governorOwner)
end

Events.GovernorChanged.Add(OnGovernorChanged)
Events.GovernorAppointed.Add(OnGovernorChanged)
Events.GovernorAssigned.Add(OnGovernorAssigned)

-- Bug fix: When upgraded, free promotion will make the experience to 15 exp.
function getPropKey(playerID, unitID)
    return 'promotion_bug_fix_' .. tostring(playerID) .. '_' .. tostring(unitID);
end

function monitorPromotionAvailable(playerID, unitID, promotionID)
    -- print('promote available', playerID, unitID, promotionID)
    local player = Players[playerID]
    local unit = UnitManager.GetUnit(playerID, unitID)
    if (player ~= nil) and (unit == nil) then
        -- the promotion available was set before unit added and cause the bug.
        SetObjectState(player, getPropKey(playerID, unitID), 1)
    end
end

function monitorUnitUpgraded(playerID, unitID)
    -- print('upgraded', playerID, unitID)
    local player = Players[playerID]
    local unit = UnitManager.GetUnit(playerID, unitID)
    if (player == nil) or (unit == nil) then
        return
    end
    local value = GetObjectState(player, getPropKey(playerID, unitID))
    if value == 1 then
        -- print('reached');
        local amount = unit:GetExperience():GetExperienceForNextLevel()
        Utils.SetUnitExperience(playerID, unitID, amount)
        SetObjectState(player, getPropKey(playerID, unitID), 0)
    end
end

-- Events.UnitPromoted.Add(monitorPromotion)
Events.UnitPromotionAvailable.Add(monitorPromotionAvailable)
-- Events.UnitAddedToMap.Add(monitorUnitAdd)
Events.UnitUpgraded.Add(monitorUnitUpgraded)
-- Events.UnitRemovedFromMap.Add(monitorUnitRemove)

---------------------------------------------------------------------------
--[[
-- Espionage
function GovSpiesGetTechOnSpyMissionCompleted(playerID, missionID)
    local pPlayer:table = Players[playerID];
    local buildingID:number = GameInfo.Buildings['BUILDING_GOV_SPIES'].Index;
    if pPlayer and Utils.HasBuildingWithinCountry(playerID, buildingID) then
        local pPlayerDiplomacy:table = pPlayer:GetDiplomacy();
		if pPlayerDiplomacy then
			local mission = pPlayerDiplomacy:GetMission(playerID, missionID);
            local m_missionHistory = mission;
            if m_missionHistory then
                if mission.InitialResult == EspionageResultTypes.SUCCESS_UNDETECTED or 
                   mission.InitialResult == EspionageResultTypes.SUCCESS_MUST_ESCAPE then
                    local kOpDef:table = GameInfo.UnitOperations[m_missionHistory.Operation];
	                if kOpDef ~= nil then
		                if kOpDef.Hash == UnitOperationTypes.SPY_COUNTERSPY or 
                           kOpDef.Hash == UnitOperationTypes.SPY_LISTENING_POST or 
                           kOpDef.Hash == UnitOperationTypes.SPY_GAIN_SOURCES then 
                            return;
                        end 
                        local amount = 500;
			            pPlayer:GetTechs():ChangeCurrentResearchProgress(amount);
                        local message = '[COLOR:ResScienceLabelCS]+' .. tostring(amount) .. '[ENDCOLOR][ICON_Science]';
                        Game.AddWorldViewText(0, message, Map.GetPlotLocation(m_missionHistory.PlotIndex));
                    end
                end
            end
        end
    end
end

Events.SpyMissionCompleted.Add(GovSpiesGetTechOnSpyMissionCompleted)


-- Eleanor Judgement of Love
function ProjectEnemyCitiesChangeLoyalty(playerID, cityID, projectID)
--	local pPlayer = Players[playerID]
	local pCity = CityManager.GetCity(playerID, cityId)
	local districtID = GameInfo.Districts['DISTRICT_THEATER'].Index
--	local iDistrictPlotIndex = pCity:GetDistricts():GetDistrictLocation(districtID)
	local amount = -50
    if projectID == GameInfo.Projects['PROJECT_CIRCUSES_AND_BREAD'].Index then
		local players = Game.GetPlayers()
		for _, player in ipairs(players) do
			if player:GetID() == playerID then -- or player:IsMinor()
				return
			end
			local playerCities = player:GetCities()
			for _, city in playerCities:Members() do
				local distance = Map.GetPlotDistance(pCity:GetX(), pCity:GetY(), city:GetX(), city:GetY())
				if distance <= 9 then 
					local loyaltyPerTurn = city:GetCulturalIdentity():GetLoyaltyPerTurn()
					if loyaltyPerTurn < 0 then
        				city:ChangeLoyalty(amount)
					end
				end
			end
		end	
    end
end

Events.CityProjectCompleted.Add(ProjectEnemyCitiesChangeLoyalty)
---]]