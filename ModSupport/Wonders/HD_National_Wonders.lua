-- 民族史诗
function NationEpicGreatPersonAddYield( playerID, unitID, greatPersonClassID, greatPersonIndividualID)
	local pPlayer = Players[playerID]
	print('XHH1',greatPersonClassID)
end

Events.UnitGreatPersonCreated.Add(NationEpicGreatPersonAddYield)