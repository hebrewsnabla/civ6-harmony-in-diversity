-- 民族史诗
function NationEpicGreatPersonAddYield(playerID, unitID, greatPersonClassID, greatPersonIndividualID)
	local pPlayer = Players[playerID]
	if greatPersonClassID == 0 then
		pPlayer:AttachModifierByID('HD_NAT_NATIONALEPIC_YIELD_PRODUCTION_ATTACH')
	end
	if greatPersonClassID == 1 then
		pPlayer:AttachModifierByID('HD_NAT_NATIONALEPIC_YIELD_FOOD_ATTACH')
	end
	if greatPersonClassID == 2 then
		pPlayer:AttachModifierByID('HD_NAT_NATIONALEPIC_YIELD_PRODUCTION_ATTACH')
	end
	if greatPersonClassID == 3 then
		pPlayer:AttachModifierByID('HD_NAT_NATIONALEPIC_YIELD_GOLD_ATTACH')
	end
	if greatPersonClassID == 4 then
		pPlayer:AttachModifierByID('HD_NAT_NATIONALEPIC_YIELD_FAITH_ATTACH')
	end
	if greatPersonClassID == 5 then
		pPlayer:AttachModifierByID('HD_NAT_NATIONALEPIC_YIELD_SCIENCE_ATTACH')
	end
	if greatPersonClassID == 6 then
		pPlayer:AttachModifierByID('HD_NAT_NATIONALEPIC_YIELD_CULTURE_ATTACH')
	end
	if greatPersonClassID == 7 then
		pPlayer:AttachModifierByID('HD_NAT_NATIONALEPIC_YIELD_CULTURE_ATTACH')
	end
	if greatPersonClassID == 8 then
		pPlayer:AttachModifierByID('HD_NAT_NATIONALEPIC_YIELD_CULTURE_ATTACH')
	end
end

Events.UnitGreatPersonCreated.Add(NationEpicGreatPersonAddYield)