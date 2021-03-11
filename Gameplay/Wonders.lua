
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
