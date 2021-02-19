--Khalwat Trigger ConservationBoost
function KhalwatTriggerConservationBoost( playerID,	cityID, buildingID, plotID, bOriginalConstruction)
	local m_Khalwat_table = GameInfo.Buildings['BUILDING_JNR_KHALWAT']
	local m_Conservation = GameInfo.Civics['CIVIC_CONSERVATION'].Index
	if  (m_Khalwat_table ~= nil) then
		local m_Khalwat = m_Khalwat_table.Index
		if playerID >= 0 and buildingID == m_Khalwat then 
			local player = Players[playerID] 
			if not player:IsBarbarian() then
				player:GetCulture():TriggerBoost(m_Conservation,1)
			end
		end
	end
end
GameEvents.BuildingConstructed.Add(KhalwatTriggerConservationBoost)

