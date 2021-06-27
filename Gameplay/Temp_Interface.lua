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
            for _, religion in pairs(religions) do
                for _, beliefIndex in pairs(religion.Beliefs) do 
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
        -- print(plot, value)
        SetObjectState(plot, g_PropertyKeys_HD.CityFlags.HasAssignedGovernor, value)
    end
end

function OnGovernorChanged(playerID, governorID)
    -- print('OnGovernorChanged')
    UpdateCityHasGovernor(playerID)
end

function OnGovernorAssigned(cityOwner, cityID, governorOwner, governorType)
    -- print('OnGovernorAssigned')
    UpdateCityHasGovernor(governorOwner)
end

Events.GovernorChanged.Add(OnGovernorChanged)
Events.GovernorAppointed.Add(OnGovernorChanged)
Events.GovernorAssigned.Add(OnGovernorAssigned)
