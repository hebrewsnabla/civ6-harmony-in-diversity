-- Governors.lua
-- 

-- if ExposedMembers.DLHD == nil then
--     ExposedMembers.DLHD = {}
-- end


-- function sendEnvoy(playerID, citystateID)
--     -- Need to make sure the second is citystate
--     local player = Players[playerID]
--     if player ~= nil then
--         player:GetInfluence():GiveFreeTokenToPlayer(citystateID)
--     end
-- end

-- ExposedMembers.DLHD.sendEnvoy = sendEnvoy

-- function AddGreatPeoplePoints(playerID, gppID, amount)
--     local player = Players[playerID]
--     if player ~= nil then
--         player:GetGreatPeoplePoints():ChangePointsTotal(gppID, amount)
--     end
-- end

-- ExposedMembers.DLHD.AddGreatPeoplePoints = AddGreatPeoplePoints
-- -- 
-- -- Trade Route doubles
-- function OnPlayerTurnStarted(playerID)
--     print(playerID)
--     local p = Players[playerID];
--     -- print(p)
--     -- local tManager = Game.GetTradeManager();
--     local pCity = p:GetCities()
--     for _, city in pCity:Members() do
--         print('city', city)
--         for j, k in pairs(city) do
--            print(j, k)
--         end
--         print(city == nil)
--         local trade = city:GetTrade();
--         print('trade', trade)
--     end
-- end

-- GameEvents.PlayerTurnStarted.Add(OnPlayerTurnStarted)
