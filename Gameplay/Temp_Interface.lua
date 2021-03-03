--------------------------------
-- Temp Interface for DEBUG   --
--------------------------------

-- NOTE: The content here can be loaded without game load.
-- NOTE: You can use ExposedMembers to call the functions in the Gameplay, see also Temp_Gameplay.lua

-- Do not change the above ones
-----------------------------------------------------------------------

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
                            ExposedMembers.DLHD.Utils.ChangeFaithBalance(playerID, amount)
                            return  
                        end
                        if (ExposedMembers.DLHD.Utils.CivilizationHasTrait(sCiv,sDarma)) then
                            for _, rel in ipairs(CityReligions) do
                                if rel.Religion == religion.Religion then
                                    if rel.Followers >= 1 then
                                        ExposedMembers.DLHD.Utils.ChangeFaithBalance(playerID, amount)
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
