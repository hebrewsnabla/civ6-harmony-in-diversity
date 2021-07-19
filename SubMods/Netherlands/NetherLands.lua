--------------------------------
--  Civ Rework -- Netherlands --
--------------------------------

function CivilizationHasTrait(sCiv, sTrait)
    for tRow in GameInfo.CivilizationTraits() do
        if (tRow.CivilizationType == sCiv and tRow.TraitType == sTrait) then
            return true
        end
    end
    return false
end

local m_Shipyard = GameInfo.Buildings['BUILDING_SHIPYARD'].Index
local m_Bank = GameInfo.Buildings['BUILDING_BANK'].Index

function OnCityProductionCompleted(playerID, cityID, iConstructionType, itemID, bCancelled)
    local player = Players[playerID]
    local pPlayerConfig = PlayerConfigurations[playerID]
    local city = CityManager.GetCity(playerID, cityID)
    local gameSpeed = GameConfiguration.GetGameSpeedType()
    local iSpeedCostMultiplier = GameInfo.GameSpeeds[gameSpeed].CostMultiplier * 0.01
    local sCiv = pPlayerConfig:GetCivilizationTypeName()
    local sGroteRivieren = 'TRAIT_CIVILIZATION_GROTE_RIVIEREN'
    if iConstructionType == 0 and CivilizationHasTrait(sCiv, sGroteRivieren) then -- Units, Netherlands
        local unit = GameInfo.Units[itemID]
        if unit ~= nil and city ~= nil then
            if unit.Domain == 'DOMAIN_SEA' then
                -- Only grant gold when built sea units.
                local multiplier = 0
                if city:GetBuildings():HasBuilding(m_Shipyard) then
                    multiplier = 1
                    if city:GetBuildings():HasBuilding(m_Bank) then
                        multiplier = 2
                    end
                end
                local amount = math.floor(unit.Cost * multiplier * iSpeedCostMultiplier)
                if amount > 0 then
                    player:GetTreasury():ChangeGoldBalance(amount)
                    local message = '[COLOR:ResGoldLabelCS]+' .. tostring(amount) .. '[ENDCOLOR][ICON_Gold]'
                    Game.AddWorldViewText(0, message, city:GetX(), city:GetY())
                end
            end
        end
    end
end

Events.CityProductionCompleted.Add(OnCityProductionCompleted);
