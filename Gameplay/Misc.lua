function OnPlayerEraScoreChanged(playerID, amountAwarded)
    local player = Players[playerID]
    if player ~= nil then
        -- print(player)
        if player:IsMajor() then
            player:GetTreasury():ChangeGoldBalance(amountAwarded * 10)
        end
    end
end

Events.PlayerEraScoreChanged.Add(OnPlayerEraScoreChanged)
