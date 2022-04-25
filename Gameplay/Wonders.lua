
if ExposedMembers.DLHD == nil then
    ExposedMembers.DLHD = {}
end

Utils = ExposedMembers.DLHD.Utils

function CityHasDistrict(city, DistrictType)
    local district_index = Utils.GetDistrictIndex(DistrictType)
    if city:GetDistricts():HasDistrict(district_index) then return true end
    
    for row in GameInfo.DistrictReplaces() do
        if row.ReplacesDistrictType == DistrictType then
            district_index = Utils.GetDistrictIndex(district_type)
            if city:GetDistricts():HasDistrict(district_index) then
                return true
            end
        end
    end
end

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
            player:GetTreasury():ChangeGoldBalance(amountAwarded * 45)
        end
    end
end

Events.PlayerEraScoreChanged.Add(TajOnPlayerEraScoreChanged)

-- 自由女神像: 建成时送每个港口当前可以建造的最便宜建筑 by xiaoxiao
function BuildingIsCheaper (a, b)
    if a.BuildingType == 'BUILDING_LIGHTHOUSE' then return true end
    if b.BuildingType == 'BUILDING_LIGHTHOUSE' then return false end
    return a.Cost < b.Cost
end
function StatueLibertyGrantBuilding (playerID, cityID, buildingID, plotID, bOriginalConstruction)
    local statue_table = GameInfo.Buildings['BUILDING_STATUE_LIBERTY']
    if statue_table == nil then return end
    local statue = statue_table.Index
    if playerID >= 0 and buildingID == statue then
        print('Statu of Liberty Completed!')

        -- find harbor buildings
        local tier1 = {}
        local tier2 = {}
        local tier3 = {}
        for row in GameInfo.Buildings() do
            if row.PrereqDistrict == 'DISTRICT_HARBOR' and not row.IsWonder then
                local building = row.BuildingType
                local isTier2 = false
                local isTier3 = false
                for row2 in GameInfo.BuildingPrereqs() do
                    if row2.Building == building and row2.PrereqBuilding == 'BUILDING_LIGHTHOUSE' then
                        isTier2 = true
                    end
                    if row2.Building == building and row2.PrereqBuilding == 'BUILDING_SHIPYARD' then
                        isTier3 = true
                    end
                end
                if isTier2 then
                    table.insert(tier2, row)
                end
                if isTier3 then
                    table.insert(tier3, row)
                end
                if not isTier2 and not isTier3 then
                    table.insert(tier1, row)
                end
            end
        end
        table.sort(tier1, BuildingIsCheaper)
        table.sort(tier2, BuildingIsCheaper)
        table.sort(tier3, BuildingIsCheaper)

        local player = Players[playerID]
        for _, city in player:GetCities():Members() do
            if CityHasDistrict(city, 'DISTRICT_HARBOR') then
                local cityHasTier1 = false
                local cityHasTier2 = false
                local cityHasTier3 = false
                for _, row in pairs(tier1) do
                    if city:GetBuildings():HasBuilding(row.Index) then
                        cityHasTier1 = true
                    end
                end
                for _, row in pairs(tier2) do
                    if city:GetBuildings():HasBuilding(row.Index) then
                        cityHasTier2 = true
                    end
                end
                for _, row in pairs(tier3) do
                    if city:GetBuildings():HasBuilding(row.Index) then
                        cityHasTier3 = true
                    end
                end
                if not cityHasTier1 then
                    city:GetBuildQueue():CreateBuilding(tier1[1].Index)
                end
                if cityHasTier1 and not cityHasTier2 then
                    city:GetBuildQueue():CreateBuilding(tier2[1].Index)
                end
                if cityHasTier2 and not cityHasTier3 then
                    city:GetBuildQueue():CreateBuilding(tier3[1].Index)
                end
            end
        end
    end
end

GameEvents.BuildingConstructed.Add(StatueLibertyGrantBuilding)

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

