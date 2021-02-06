include( "WorldViewIconsManager.lua" )

-- ===========================================================================
--	OVERRIDES
-- ===========================================================================
BASE_AddImprovementRecommendationsForCity = AddImprovementRecommendationsForCity;
BASE_OnUnitSelectionChanged = OnUnitSelectionChanged;
BASE_LateInitialize = LateInitialize;

-- ===========================================================================
function LateInitialize()
	print('replaced_Worldview');
	BASE_LateInitialize();
	-- TTManager:GetTypeControlTable("SettlerRecommendationTooltip", m_kSettlerTooltip);
end

-- ===========================================================================
function AddImprovementRecommendationsForCity( pCity:table, pSelectedUnit:table )
	local pCityAI:table = pCity:GetCityAI();
	print('!!!');
	if pCityAI then
		local recommendList:table = pCityAI:GetImprovementRecommendationsForBuilder(pSelectedUnit:GetComponentID());
		for key,value in pairs(recommendList) do
			print('!!!', value.ImprovementHash);
			local pRecommendedPlotInstance = GetInstanceAt(value.ImprovementLocation);

			-- Get improvement info
			local pImprovementInfo:table = GameInfo.Improvements[value.ImprovementHash];

			-- Update icon
			pRecommendedPlotInstance.ImprovementRecommendationIcon:TrySetIcon(pImprovementInfo.Icon, 256);

			-- Update tooltip
			pRecommendedPlotInstance.ImprovementRecommendationIcon:SetToolTipString(Locale.Lookup("LOC_TOOLTIP_IMPROVEMENT_RECOMMENDATION", pImprovementInfo.Name));

			-- Show recommendation and add to list for clean up later
			pRecommendedPlotInstance.ImprovementRecommendationBackground:SetHide(false);
			table.insert(m_RecommendedImprovementPlots, value.ImprovementLocation);
		end
	end
end

-- ===========================================================================
function OnUnitSelectionChanged(player, unitId, locationX, locationY, locationZ, isSelected, isEditable)
	print('!!!');
	ClearImprovementRecommendations();
	ClearSettlementRecommendations();

	-- Are we a builder?
	local pSelectedUnit:table = UI.GetHeadSelectedUnit();
	if pSelectedUnit then 
		if pSelectedUnit:GetBuildCharges() > 0 then
			-- If we're within a city then look for any recommended improvements
			local pPlot = Map.GetPlotIndex(pSelectedUnit:GetX(), pSelectedUnit:GetY());
			local pCity:table = Cities.GetPlotPurchaseCity(pPlot);
			if pCity and pCity:GetOwner() == player then
				AddImprovementRecommendationsForCity(pCity, pSelectedUnit);
			end
		elseif GameInfo.Units[pSelectedUnit:GetUnitType()].FoundCity then
			-- Add settlement recommendations if we're a settler
			AddSettlementRecommendations();
		end
	end
end
