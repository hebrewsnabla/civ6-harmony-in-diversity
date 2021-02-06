-- Farms On Fresh Hills

local m_ImprovementFarm = GameInfo.Improvements['IMPROVEMENT_FARM'].Index;
local m_ImprovementDummy = GameInfo.Improvements['IMPROVEMENT_DUMMY'].Index;

-- function ChangeTerrain(iX, iY, iTerrain)
-- 	local pPlot = Map.GetPlot(iX, iY)
-- 	TerrainBuilder.SetTerrainType(pPlot, iTerrain)
-- end

function GetAdjacentPlot(pPlot, iDir)
	-- local pPlot = Map.GetPlot(iX, iY)
	return Map.GetAdjacentPlot(pPlot:GetX(), pPlot:GetY(), iDir)
end

function SetPlotImprovementType(iX, iY, iImprovement, owner)
	local pPlot = Map.GetPlot(iX, iY)
	ImprovementBuilder.SetImprovementType(pPlot, iImprovement, owner)
end

function OnImprovementAddedToMap(locationX, locationY, improvementType, eImprovementOwner, resource, isPillaged, isWorked)
	-- print(locationX, locationY, improvementType, eImprovementOwner)
	if improvementType == m_ImprovementDummy then
		SetPlotImprovementType(locationX, locationY, m_ImprovementFarm, eImprovementOwner)
	end
end

if ExposedMembers.FOFH == nil then
	ExposedMembers.FOFH = {}
end

ExposedMembers.FOFH.GetAdjacentPlot = GetAdjacentPlot

Events.ImprovementAddedToMap.Add(OnImprovementAddedToMap)