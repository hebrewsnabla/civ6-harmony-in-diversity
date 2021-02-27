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
Utils = ExposedMembers.DLHD.Utils

-- Start debug
function EarnMoneyOnConquerCity( capturerID, ownerID, cityID, cityX, cityY )
	local cPlayer = Players[ownerID]
	local pPlayer = Players[capturerID]
	local ConquerCity = CityManager.GetCityAt(cityX, cityY)
	local citizen = ConquerCity:GetPopulation()
	local buildingID = GameInfo.Buildings['BUILDING_GOV_CONQUEST'].Index
	if cPlayer ~= nil and pPlayer ~= nil and ConquerCity ~= nil then	
	 	local amount = 0
	 	if 	citizen ~= nil then		
			local amount = citizen * 20 + amount
			if (Utils.HasBuildingWithinCountry(capturerID, buildingID )) then
					local amount = citizen * 20 + amount
					Utils.ChangeGoldBalance(capturerID, amount) 
					return
			end
		end
	end
end

GameEvents.CityConquered.Add(EarnMoneyOnConquerCity)
