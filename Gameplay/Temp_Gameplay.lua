--------------------------------
-- Temp Gameplay for DEBUG   --
--------------------------------

-- NOTE: The content here need a game load to reload.
-- NOTE: You can use ExposedMembers to provide functions to interface scripts.

if ExposedMembers.DLHD == nil then
	ExposedMembers.DLHD = {}
end

-- Do not change the above ones
-----------------------------------------------------------------------

-- Start debug
-- function EarnMoneyOnConquerCity( capturerID, ownerID, cityID, cityX, cityY )
-- 	print( 'capture city' )
-- 	local cPlayer = Players[ownerID]
-- 	local pPlayer = Players[capturerID]
-- 	local ConquerCity = CityManager.GetCityAt(cityX, cityY)
-- 	local citizen = ConquerCity:GetPopulation()
-- 	if cPlayer ~= nil and pPlayer ~= nil and ConquerCity ~= nil then	
-- 	 	local amount = citizen * 20 
-- 		Utils.ChangeGoldBalance(capturerID, amount)
-- 		if (ConquerCity:IsCapital() and cPlayer:IsMajor()) then
-- 			local amount_capital = citizen * 20
-- 			Utils.ChangeGoldBalance(capturerID, amount_capital) 
-- 			if (Utils.HasBuildingWithinCountry(playerID, cityID )) then
-- 				local amount_capitalandgov = citizen * 20
-- 				Utils.ChangeGoldBalance(capturerID, amount_capitalandgov) 
-- 				return
-- 			end
-- 		end
-- 		if (Utils.HasBuildingWithinCountry(playerID, cityID )) then
-- 			local amount_gov = citizen * 10
-- 			Utils.ChangeGoldBalance(capturerID, amount_gov)
-- 		end
-- 	end
-- end

-- GameEvents.CityConquered.Add(EarnMoneyOnConquerCity)
