
if ExposedMembers.DLHD == nil then
    ExposedMembers.DLHD = {}
end

Utils = ExposedMembers.DLHD.Utils

function PotalaPalaceIncreaseFaithAmount( playerID, cityID, buildingID, plotID, bOriginalConstruction)
    local m_Potala_table = GameInfo.Buildings['BUILDING_POTALA_PALACE']
    if  (m_Potala_table ~= nil) then
        local m_Potala = m_Potala_table.Index
        if playerID >= 0 and buildingID == m_Potala then 
            local player = Players[playerID] 
            if not player:IsBarbarian() then
                local amount = player:GetReligion():GetFaithBalance()
                player:GetReligion():ChangeFaithBalance(amount * 0.5)
            end
        end
    end
end

GameEvents.BuildingConstructed.Add(PotalaPalaceIncreaseFaithAmount)

function TajOnPlayerEraScoreChanged(playerID, amountAwarded)
    local player = Players[playerID]
    local buildingID = GameInfo.Buildings['BUILDING_TAJ_MAHAL'].Index
    if player ~= nil then
        -- print(player)
        if player:IsMajor() and Utils.HasBuildingWithinCountry(playerID, buildingID) then
            player:GetTreasury():ChangeGoldBalance(amountAwarded * 40)
        end
    end
end

Events.PlayerEraScoreChanged.Add(TajOnPlayerEraScoreChanged)

-- local PROP_KEY_HAS_PLAYER_TURN_ACTIVATED = 'DLHasPlayerTurnActivated'
-- local PROP_KEY_HAS_ALHAMBRA_GRANTED = 'DLHasAlhambraGranted'
-- local PROP_KEY_HAS_BIG_BEN_GRANTED = 'DLHasBigBenGranted'
-- local PROP_KEY_HAS_POTALA_PALACE_GRANTED = 'DLHasPotalaPalaceGranted'
-- local PROP_KEY_HAS_FORBIDDEN_CITY_GRANTED = 'DLHasForbiddenCityGranted'
-- local m_AlhambraID = GameInfo.Buildings['BUILDING_ALHAMBRA'].Index
-- local m_BigBenID = GameInfo.Buildings['BUILDING_BIG_BEN'].Index
-- local m_PotalaPalaceID = GameInfo.Buildings['BUILDING_POTALA_PALACE'].Index
-- local m_ForbiddenCityID = GameInfo.Buildings['BUILDING_FORBIDDEN_CITY'].Index

-- function GrantGovermentSlotFromBuilding(player, buildingID)
--     if buildingID == m_AlhambraID then
--         player:AttachModifierByID('ALHAMBRA_MILITARY_GOVERNMENT_SLOT')
--         player:SetProperty(PROP_KEY_HAS_ALHAMBRA_GRANTED, true)
--     end
--     if buildingID == m_BigBenID then
--         player:AttachModifierByID('BIG_BEN_ECONOMIC_GOVERNMENT_SLOT')
--         player:SetProperty(PROP_KEY_HAS_BIG_BEN_GRANTED, true)
--     end
--     if buildingID == m_PotalaPalaceID then
--         player:AttachModifierByID('POTALA_PALACE_DIPLOMATIC_GOVERNMENT_SLOT')
--         player:SetProperty(PROP_KEY_HAS_POTALA_PALACE_GRANTED, true)
--     end
--     if buildingID == m_ForbiddenCityID then
--         player:AttachModifierByID('FORBIDDEN_CITY_WILDCARD_GOVERNMENT_SLOT')
--         player:SetProperty(PROP_KEY_HAS_FORBIDDEN_CITY_GRANTED, true)
--     end
-- end

-- function OnBuildingConstructed(playerID, cityID, buildingID, plotID, bOriginalConstruction)
--     local player = Players[playerID]
--     if player:GetProperty(PROP_KEY_HAS_PLAYER_TURN_ACTIVATED) then
--         GrantGovermentSlotFromBuilding(player, buildingID)
--     end
-- end

-- function OnPlayerTurnActivated(playerID, bIsFirstTime)
--     -- print('PlayerTurnActivated', playerID)
--     local player = Players[playerID]
--     player:SetProperty(PROP_KEY_HAS_PLAYER_TURN_ACTIVATED, true)

--     if not player:GetProperty(PROP_KEY_HAS_ALHAMBRA_GRANTED) then
--         if Utils.HasBuildingWithinCountry(playerID, m_AlhambraID) then
--             GrantGovermentSlotFromBuilding(player, m_AlhambraID)
--         end
--     end
--     if not player:GetProperty(PROP_KEY_HAS_BIG_BEN_GRANTED) then
--         if Utils.HasBuildingWithinCountry(playerID, m_BigBenID) then
--             GrantGovermentSlotFromBuilding(player, m_BigBenID)
--         end
--     end
--     if not player:GetProperty(PROP_KEY_HAS_POTALA_PALACE_GRANTED) then
--         if Utils.HasBuildingWithinCountry(playerID, m_PotalaPalaceID) then
--             GrantGovermentSlotFromBuilding(player, m_PotalaPalaceID)
--         end
--     end
--     if not player:GetProperty(PROP_KEY_HAS_FORBIDDEN_CITY_GRANTED) then
--         if Utils.HasBuildingWithinCountry(playerID, m_ForbiddenCityID) then
--             GrantGovermentSlotFromBuilding(player, m_ForbiddenCityID)
--         end
--     end
-- end

-- function OnPlayerTurnDeactivated(playerID)
--     -- print('OnPlayerTurnDeactivated', playerID)
--     local player = Players[playerID]
--     player:SetProperty(PROP_KEY_HAS_PLAYER_TURN_ACTIVATED, false)
-- end

-- GameEvents.BuildingConstructed.Add(OnBuildingConstructed)
-- Events.PlayerTurnActivated.Add(OnPlayerTurnActivated)
-- Events.PlayerTurnDeactivated.Add(OnPlayerTurnDeactivated)

