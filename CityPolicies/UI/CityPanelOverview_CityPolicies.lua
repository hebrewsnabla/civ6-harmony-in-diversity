include( "CityPanelOverview_Expansion2" )

local m_kBuildingsIM		:table = InstanceManager:new( "BuildingInstance",			"Top");
local m_kDistrictsIM		:table = InstanceManager:new( "DistrictInstance",			"Top", Controls.BuildingAndDistrictsStack );
local m_kTradingPostsIM		:table = InstanceManager:new( "TradingPostInstance",		"Top", Controls.TradingPostsStack );
local m_kWondersIM			:table = InstanceManager:new( "WonderInstance",				"Top", Controls.WondersStack );

-- ===========================================================================
function ViewPanelBreakdown( data:table )
	Controls.DistrictsNum:SetText( data.DistrictsNum );
	Controls.DistrictsConstructed:SetText( Locale.Lookup("LOC_HUD_CITY_DISTRICTS_CONSTRUCTED", data.DistrictsNum) );	
	Controls.DistrictsPossibleNum:SetText( data.DistrictsPossibleNum );

	m_kBuildingsIM:ResetInstances();
	m_kDistrictsIM:ResetInstances();	
	m_kTradingPostsIM:ResetInstances();
	m_kWondersIM:ResetInstances();
	local playerID = Game.GetLocalPlayer();

	-- Add districts (and their buildings)
	for _, district in ipairs(data.BuildingsAndDistricts) do
		if district.isBuilt then
			local kInstanceDistrict:table = m_kDistrictsIM:GetInstance();
			local districtName = district.Name;
			if district.isPillaged then
				districtName = districtName .. "[ICON_Pillaged]";
			end
			kInstanceDistrict.DistrictName:SetText( districtName );
			kInstanceDistrict.DistrictYield:SetText( district.YieldBonus );
			kInstanceDistrict.Icon:SetIcon( district.Icon );
			local sToolTip = ToolTipHelper.GetToolTip(district.Type, playerID)
			kInstanceDistrict.Top:SetToolTipString( sToolTip);
			for _,building in ipairs(district.Buildings) do
				if building.isBuilt and not IsCityPolicy(building) then -- City policy changes
					local kInstanceBuild:table = m_kBuildingsIM:GetInstance(kInstanceDistrict.BuildingStack);
					local buildingName = building.Name;
					if building.isPillaged then
						buildingName = buildingName .. "[ICON_Pillaged]";
					end
					kInstanceBuild.BuildingName:SetText( buildingName );
					kInstanceBuild.Icon:SetIcon( building.Icon );
					local pRow = GameInfo.Buildings[building.Type];
					local sToolTip = ToolTipHelper.GetBuildingToolTip( pRow.Hash, playerID, m_pCity );
					kInstanceBuild.Top:SetToolTipString( sToolTip);
					local yieldString:string = "";
					for _,kYield in ipairs(building.Yields) do
						yieldString = yieldString .. GetYieldString(kYield.YieldType,kYield.YieldChange);
					end
					kInstanceBuild.BuildingYield:SetText( yieldString );
					kInstanceBuild.BuildingYield:SetTruncateWidth( kInstanceBuild.Top:GetSizeX() - kInstanceBuild.BuildingName:GetSizeX() - 10 );
				end
			end
			kInstanceDistrict.BuildingStack:CalculateSize();
		end
	end

	-- Add wonders
	local hideWondersInfo :boolean = not GameCapabilities.HasCapability("CAPABILITY_CITY_HUD_WONDERS");
	local isHasWonders :boolean = (table.count(data.Wonders) > 0)
	Controls.NoWondersArea:SetHide(hideWondersInfo or isHasWonders);
	Controls.WondersArea:SetHide(hideWondersInfo or not isHasWonders);
	Controls.WondersHeader:SetHide(hideWondersInfo);

	for _, wonder in ipairs(data.Wonders) do
		local kInstanceWonder:table = m_kWondersIM:GetInstance();
		kInstanceWonder.WonderName:SetText( wonder.Name );
		local pRow = GameInfo.Buildings[wonder.Type];
		local sToolTip = ToolTipHelper.GetBuildingToolTip( pRow.Hash, playerID, m_pCity );
		kInstanceWonder.Top:SetToolTipString( sToolTip );
		local yieldString:string = "";
		for _,kYield in ipairs(wonder.Yields) do
			yieldString = yieldString .. GetYieldString(kYield.YieldType,kYield.YieldChange);
		end
		kInstanceWonder.WonderYield:SetText( yieldString );
		kInstanceWonder.Icon:SetIcon( wonder.Icon );
	end

	-- Add trading posts
	local hideTradingPostsInfo :boolean = not GameCapabilities.HasCapability("CAPABILITY_CITY_HUD_TRADING_POSTS");
	local isHasTradingPosts :boolean = (table.count(data.TradingPosts) > 0);
	Controls.NoTradingPostsArea:SetHide(hideTradingPostsInfo or isHasTradingPosts);
	Controls.TradingPostsArea:SetHide(hideTradingPostsInfo or not isHasTradingPosts);
	Controls.TradingPostsHeader:SetHide(hideTradingPostsInfo);

	if isHasTradingPosts then
		for _, tradePostPlayerId in ipairs(data.TradingPosts) do
			local pTradePostPlayer:table = Players[tradePostPlayerId]
			local pTradePostPlayerConfig:table = PlayerConfigurations[tradePostPlayerId];
			local kInstanceTradingPost	:table = m_kTradingPostsIM:GetInstance();		
			local playerName			:string = Locale.Lookup( pTradePostPlayerConfig:GetPlayerName() );

			local iconName:string = "";
			local iconSize:number = SIZE_LEADER_ICON;
			local iconColor = UI.GetColorValue("COLOR_WHITE");
			if pTradePostPlayer:IsMinor() then
				-- If we're a city-state display our city-state icon instead of leader since we don't have one
				local civType:string = pTradePostPlayerConfig:GetCivilizationTypeName();
				local primaryColor, secondaryColor = UI.GetPlayerColors(tradePostPlayerId);	
				iconName = "ICON_"..civType;
				iconColor = secondaryColor;
				iconSize = SIZE_CITYSTATE_ICON;
			else
				iconName = "ICON_"..pTradePostPlayerConfig:GetLeaderTypeName();
			end
			
			local textureOffsetX :number, textureOffsetY:number, textureSheet:string = IconManager:FindIconAtlas(iconName, iconSize);
			kInstanceTradingPost.LeaderPortrait:SetTexture(textureOffsetX, textureOffsetY, textureSheet);
			kInstanceTradingPost.LeaderPortrait:SetColor(iconColor);
			kInstanceTradingPost.LeaderPortrait:SetHide(false);
							
			if tradePostPlayerId == m_pPlayer:GetID() then
				playerName = playerName .. " (" .. Locale.Lookup("LOC_HUD_CITY_YOU") .. ")";
			end
			kInstanceTradingPost.TradingPostName:SetText( playerName );
		end
	end

	-- Add city policy
	LuaEvents.CityPanelOverview_CityPolicies(playerID, data)
end

-- ===========================================================================
-- City Policies Mod addition
-- ===========================================================================
function IsCityPolicy( building:table )
	local buildingType:string = building.Type;
	return buildingType:match "^BUILDING_CITY_POLICY_";	
end