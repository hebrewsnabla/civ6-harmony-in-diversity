
------------------------------------------------------------------------------
include "MapEnums"
include "MapUtilities"
print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");
print("--- || Zegangani's: Origin - Real Start Locations Mod Loaded!! || ---");
print("- - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -");

------------------------------------------------------------------------------
AssignStartingPlots = {};
------------------------------------------------------------------------------
function AssignStartingPlots.Create(args)
	
	local gridWidth, gridHeight = Map.GetGridSize();
	local instance  = {

		-- Core Process member methods
		__InitStartingData					= AssignStartingPlots.__InitStartingData,
		__SetStartMajor						= AssignStartingPlots.__SetStartMajor,
		__SetStartMinor						= AssignStartingPlots.__SetStartMinor,
		__GetWaterCheck						= AssignStartingPlots.__GetWaterCheck,
		__GetValidAdjacent					= AssignStartingPlots.__GetValidAdjacent,
		__NaturalWonderBuffer				= AssignStartingPlots.__NaturalWonderBuffer,
		__BonusResource						= AssignStartingPlots.__BonusResource,
		__TryToRemoveBonusResource			= AssignStartingPlots.__TryToRemoveBonusResource,
		__LuxuryBuffer						= AssignStartingPlots.__LuxuryBuffer,
		__StrategicBuffer					= AssignStartingPlots.__StrategicBuffer,
		__MinorMajorCivBuffer				= AssignStartingPlots.__MinorMajorCivBuffer,
		__MinorMinorCivBuffer				= AssignStartingPlots.__MinorMinorCivBuffer,
		__BaseFertility						= AssignStartingPlots.__BaseFertility,
		__WeightedFertility					= AssignStartingPlots.__WeightedFertility,
		__AddBonusFoodProduction			= AssignStartingPlots.__AddBonusFoodProduction,
		__AddFood							= AssignStartingPlots.__AddFood,
		__AddProduction						= AssignStartingPlots.__AddProduction,
		__InitStartBias						= AssignStartingPlots.__InitStartBias,
		__StartBiasResources				= AssignStartingPlots.__StartBiasResources,
		__StartBiasFeatures					= AssignStartingPlots.__StartBiasFeatures,
		__StartBiasTerrains					= AssignStartingPlots.__StartBiasTerrains,
		__StartBiasRivers					= AssignStartingPlots.__StartBiasRivers,
		__StartBiasPlotRemoval				= AssignStartingPlots.__StartBiasPlotRemoval,
		__SortByArray						= AssignStartingPlots.__SortByArray,
		__ArraySize							= AssignStartingPlots.__ArraySize,
		__AddResourcesBalanced				= AssignStartingPlots.__AddResourcesBalanced,
		__AddResourcesStandard				= AssignStartingPlots.__AddResourcesStandard,
		__AddResourcesLegendary				= AssignStartingPlots.__AddResourcesLegendary,
		__BalancedStrategic					= AssignStartingPlots.__BalancedStrategic,
		__FindSpecificStrategic				= AssignStartingPlots.__FindSpecificStrategic,
		__AddStrategic						= AssignStartingPlots.__AddStrategic,
		__AddLuxury							= AssignStartingPlots.__AddLuxury,
		__AddLeyLine						= AssignStartingPlots.__AddLeyLine,
		__AddBonus							= AssignStartingPlots.__AddBonus,
		__IsContinentalDivide				= AssignStartingPlots.__IsContinentalDivide,
		__RemoveBonus						= AssignStartingPlots.__RemoveBonus,
		
		-- Zegangani
		__InitStartBiasMajor				= AssignStartingPlots.__InitStartBiasMajor,
		__StartBiasResourcesMajor			= AssignStartingPlots.__StartBiasResourcesMajor,
		__StartBiasFeaturesMajor			= AssignStartingPlots.__StartBiasFeaturesMajor,
		__StartBiasTerrainsMajor			= AssignStartingPlots.__StartBiasTerrainsMajor,
		__StartBiasRiversMajor				= AssignStartingPlots.__StartBiasRiversMajor,
		__StartBiasPlotRemovalMajor			= AssignStartingPlots.__StartBiasPlotRemovalMajor,
		__StartBiasDistanceMajor			= AssignStartingPlots.__StartBiasDistanceMajor,
		__MajorCivBuffer					= AssignStartingPlots.__MajorCivBuffer,
		__SortPlayersByStartBiases			= AssignStartingPlots.__SortPlayersByStartBiases,
		__GetPlotDistance					= AssignStartingPlots.__GetPlotDistance,
		
		possibleMajorPlots = {},
		g_iW = gridWidth,
		g_iH = gridHeight,
		-- Zegangani

		iNumMajorCivs = 0,	
		iNumWaterMajorCivs = 0,
		iResourceEraModifier = 1,
		iNumMinorCivs = 0,			
		iNumRegions		= 0,
		iDefaultNumberMajor = 0,
		iDefaultNumberMinor = 0,
		uiMinMajorCivFertility = args.MIN_MAJOR_CIV_FERTILITY or 0,
		uiMinMinorCivFertility = args.MIN_MINOR_CIV_FERTILITY or 0,
		uiStartMinY = args.START_MIN_Y or 0,
		uiStartMaxY = args.START_MAX_Y or 0,
		uiStartConfig = args.START_CONFIG or 2,
		waterMap  = args.WATER or false,
		landMap  = args.LAND or false,
		----GS------
		noStartBiases = args.IGNORESTARTBIAS or false,
		startAllOnLand = args.STARTALLONLAND or false,
		startLargestLandmassOnly = args.START_LARGEST_LANDMASS_ONLY or false,
		--------
		majorStartPlots = {},
		majorCopy = {},
		minorStartPlots = {},	
		minorCopy = {},
		majorList		= {},
		minorList		= {},
		playerstarts = {},
		sortedArray = {},
		sortedFertilityArray = {},

		-- Team info variables (not used in the core process, but necessary to many Multiplayer map scripts)
		
	}

	instance:__InitStartingData()

	return instance
end
------------------------------------------------------------------------------
function AssignStartingPlots:__InitStartingData()

	if(self.uiMinMajorCivFertility <= 0) then
		self.uiMinMajorCivFertility = 5;
	end

	if(self.uiMinMinorCivFertility <= 0) then
		self.uiMinMinorCivFertility = 5;
	end

	--Find Default Number
	MapSizeTypes = {};
	for row in GameInfo.Maps() do
		MapSizeTypes[row.RowId] = row.DefaultPlayers;
	end
	local sizekey = Map.GetMapSize() + 1;
	local iDefaultNumberPlayers = MapSizeTypes[sizekey] or 8;
	self.iDefaultNumberMajor = iDefaultNumberPlayers ;
	self.iDefaultNumberMinor = math.floor(iDefaultNumberPlayers * 1.5);

	-- See if there are any civs starting out in the water
	local tempMajorList = {};
	self.majorList = {};
	self.waterMajorList = {};
	self.iNumMajorCivs = 0;
	self.iNumWaterMajorCivs = 0;

	tempMajorList = PlayerManager.GetAliveMajorIDs();
	for i = 1, PlayerManager.GetAliveMajorsCount() do
		local leaderType = PlayerConfigurations[tempMajorList[i]]:GetLeaderTypeName();
		if (not self.startAllOnLand and GameInfo.Leaders_XP2 and GameInfo.Leaders_XP2[leaderType] ~= nil and GameInfo.Leaders_XP2[leaderType].OceanStart == true) then --GS
			table.insert(self.waterMajorList, tempMajorList[i]);
			self.iNumWaterMajorCivs = self.iNumWaterMajorCivs + 1;
			print ("Found the Maori");
		else
			table.insert(self.majorList, tempMajorList[i]);
			self.iNumMajorCivs = self.iNumMajorCivs + 1;
		end
	end 

	-- Do we have enough water on this map for the number of water civs specified?
	local TILES_NEEDED_FOR_WATER_START = 8;
	if (self.waterMap == true) then
		TILES_NEEDED_FOR_WATER_START = 1;
	end
	local iCandidateWaterTiles = StartPositioner.GetTotalOceanStartCandidates and StartPositioner.GetTotalOceanStartCandidates(self.waterMap) or 0;
	if (iCandidateWaterTiles < (TILES_NEEDED_FOR_WATER_START * self.iNumWaterMajorCivs)) then

		-- Not enough so reset so all civs start on land
		self.iNumMajorCivs = 0;
		self.majorList = {};
		for i = 1, PlayerManager.GetAliveMajorsCount() do
			table.insert(self.majorList, tempMajorList[i]);
			self.iNumMajorCivs = self.iNumMajorCivs + 1;
		end
	end

	self.iNumMinorCivs = PlayerManager.GetAliveMinorsCount();
	self.minorList = {};
	self.minorList = PlayerManager.GetAliveMinorIDs();
	self.iNumRegions = self.iNumMajorCivs + self.iNumMinorCivs;
	local iMinNumBarbarians = self.iNumMajorCivs / 2;

	StartPositioner.DivideMapIntoMajorRegions(self.iNumMajorCivs, self.uiMinMajorCivFertility, self.uiMinMinorCivFertility, self.startLargestLandmassOnly); --GS
	local iMajorCivStartLocs = StartPositioner.GetNumMajorCivStarts();
	
	self.majorStartPlots = {};
	self.possibleMajorPlots = {};
	
	majorCivPlots = GetCustomStartingPlots();
	
	majorPlayers = {};
	for i = self.iNumMajorCivs - 1, 0, - 1  do
		table.insert(majorPlayers, i);
	end
	
	sortedMajPlayers = self:__SortPlayersByStartBiases(majorPlayers); -- Sort Players prioritising the Human Player and Players with higher and more Start Bias Tiers
		
	self:__SetStartMajor(majorCivPlots);
	
	self:__InitStartBiasMajor(false);

	if(self.uiStartConfig == 1 ) then
		self:__AddResourcesBalanced();
	elseif(self.uiStartConfig == 2) then
		self:__AddResourcesStandard();
	elseif(self.uiStartConfig == 3 ) then
		self:__AddResourcesLegendary();
	end
	
	local aMajorStartPlotIndices = {};
	for i = 1, self.iNumMajorCivs do
		local player = Players[self.majorList[i]]
		
		if(player == nil) then
			print("THIS PLAYER FAILED");
		else
			local hasPlot = false;
			for k, v in ipairs(self.playerStartsMajor[i]) do 
				if(v~= nil and hasPlot == false) then
					local playerID = (self.majorList[i])
					hasPlot = true;
					self:__AddLeyLine(v);
					self:__TryToRemoveBonusResource(v);
					self:__AddBonusFoodProduction(v);
					player:SetStartingPlot(v);
					table.insert(aMajorStartPlotIndices, v:GetIndex());
					print("Major Player: ", playerID, "Major Start X: ", v:GetX(), "Major Start Y: ", v:GetY());
				end
			end
		end
	end

	StartPositioner.DivideMapIntoMinorRegions(self.iNumMinorCivs);

	local iMinorCivStartLocs = StartPositioner.GetNumMinorCivStarts();
	local i = 0;
	local valid = 0;
	while i <= iMinorCivStartLocs - 1 and valid < self.iNumMinorCivs do
		plots = StartPositioner.GetMinorCivStartPlots(i);
		local startPlot = self:__SetStartMinor(plots);
		info = StartPositioner.GetMinorCivStartInfo(i);
		if(startPlot ~= nil) then
			table.insert(self.minorStartPlots, startPlot);
--			print ("Minor ContinentType: " .. tostring(info.ContinentType));
--			print ("Minor LandmassID: " .. tostring(info.LandmassID));
--			print ("Minor Fertility: " .. tostring(info.Fertility));
--			print ("Minor TotalPlots: " .. tostring(info.TotalPlots));
--			print ("Minor WestEdge: " .. tostring(info.WestEdge));
--			print ("Minor EastEdge: " .. tostring(info.EastEdge));
--			print ("Minor NorthEdge: " .. tostring(info.NorthEdge));
--			print ("Minor SouthEdge: " .. tostring(info.SouthEdge));
			valid = valid + 1;
		else
			print ("-- START FAILED MINOR --");
			print ("Minor ContinentType: " .. tostring(info.ContinentType));
			print ("Minor LandmassID: " .. tostring(info.LandmassID));
			print ("Minor Fertility: " .. tostring(info.Fertility));
			print ("Minor TotalPlots: " .. tostring(info.TotalPlots));
			print ("Minor WestEdge: " .. tostring(info.WestEdge));
			print ("Minor EastEdge: " .. tostring(info.EastEdge));
			print ("Minor NorthEdge: " .. tostring(info.NorthEdge));
			print ("Minor SouthEdge: " .. tostring(info.SouthEdge));
			print ("-- END FAILED MINOR --");
		end
		
		i = i + 1;
	end

	for k, plot in ipairs(self.minorStartPlots) do
		table.insert(self.minorCopy, plot);
	end

	--Begin Start Bias for minor
	--GS
	if (self.noStartBiases or (GameInfo.StartBiasResources() == nil and GameInfo.StartBiasFeatures() == nil and GameInfo.StartBiasTerrains() == nil and GameInfo.StartBiasRivers() == nil)) then
		self.playerStarts = {};
		for i = 1, self.iNumMinorCivs do
			local playerStart = {}
			for j, plot in ipairs(self.minorStartPlots) do
				playerStart[j] = plot;
			end
			self.playerStarts[self.iNumMajorCivs + i] = playerStart
		end

		for j, playerIndex in ipairs(self.minorList) do
			local hasPlot = false;
			local index = playerIndex + 1;

			if(index > 0 and self:__ArraySize(self.playerStarts, index) > 1) then
				for k, v in pairs(self.playerStarts[index]) do
					if(v~= nil and hasPlot == false) then
						hasPlot = true;
						--Call Removal
						self:__StartBiasPlotRemoval(v, true, index);
					end
				end
			end
		end
	else
		self:__InitStartBias(true);
	end

	for i = 1, self.iNumMinorCivs do
		local player = Players[self.minorList[i]]
		
		if(player == nil) then
			print("THIS PLAYER FAILED");
		else
			local hasPlot = false;
			for k, v in pairs(self.playerStarts[i + self.iNumMajorCivs]) do
				if(v~= nil and hasPlot == false) then
					hasPlot = true;
					player:SetStartingPlot(v);
					print("Minor Player: ", (self.minorList[i]), "Minor Start X: ", v:GetX(), "Minor Start Y: ", v:GetY());
				end
			end
		end
	end

	-- Finally place the ocean civs
	if (self.iNumWaterMajorCivs > 0) then
		local iWaterCivs = StartPositioner.PlaceOceanStartCivs(self.waterMap, self.iNumWaterMajorCivs, aMajorStartPlotIndices);
		for i = 1, iWaterCivs do
			local waterPlayer = Players[self.waterMajorList[i]]
			local iStartIndex = StartPositioner.GetOceanStartTile(i - 1);  -- Indices start at 0 here
			local pStartPlot = Map.GetPlotByIndex(iStartIndex);
			waterPlayer:SetStartingPlot(pStartPlot);
			print("Water Start X: ", pStartPlot:GetX(), "Water Start Y: ", pStartPlot:GetY());
		end
		if (iWaterCivs < self.iNumWaterMajorCivs) then
			print("FAILURE PLACING WATER CIVS - Missing civs: " .. tostring(self.iNumWaterMajorCivs - iWaterCivs));
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__SetStartMinor(plots)
	-- Sort by fertility of all the plots
	-- eliminate them if they do not meet the following:
	-- distance to another civilization
	-- distance to a natural wonder
	-- minimum production
	-- minimum food

	sortedPlots ={};
	
	if plots == nil then
		return;
	end
	
	local iSize = #plots;

	-- Nothing there?  Just exit, returing nil
	if iSize == 0 then
		return;
	end

	local iContinentIndex = 1;
	
	for i, plot in ipairs(plots) do
		row = {};
		row.Plot = plot;
		row.Fertility = self:__BaseFertility(plot);
		table.insert (sortedPlots, row);
	end

	table.sort (sortedPlots, function(a, b) return a.Fertility > b.Fertility; end);

	local pFallback:table = Map.GetPlotByIndex(sortedPlots[1].Plot);
	local iFallBackScore = -1;
	while iSize >= iContinentIndex do
		-- Wrap the function in a repeat so that we can break out of it
		repeat
			local NWMinor = 2;
			pTempPlot = Map.GetPlotByIndex(sortedPlots[iContinentIndex].Plot);
			iContinentIndex = iContinentIndex + 1;
			
			-- Checks to see if the plot is impassable
			if(pTempPlot:IsImpassable() == true) then
				break
			else
				local iFallBackScoreTemp = 0;
				if (iFallBackScore < iFallBackScoreTemp) then
					pFallback = pTempPlot;
					iFallBackScore = iFallBackScoreTemp;
				end
			end

			-- Checks to see if the plot is water
			if(pTempPlot:IsWater() == true) then
				break
			else
				local iFallBackScoreTemp = 1;
				if (iFallBackScore < iFallBackScoreTemp) then
					pFallback = pTempPlot;
					iFallBackScore = iFallBackScoreTemp;
				end
			end
		
			-- Checks to see if there are any minor civs in the given distance
			local bMinorCivCheck = self:__MinorMajorCivBuffer(pTempPlot); 
			if(bMinorCivCheck == false) then
				break
			else
				local iFallBackScoreTemp = 2;
				if (iFallBackScore < iFallBackScoreTemp) then
					pFallback = pTempPlot;
					iFallBackScore = iFallBackScoreTemp;
				end
			end		

			-- Checks to see if there are any minor civs in the given distance
			local bMinorCivCheck = self:__MinorMinorCivBuffer(pTempPlot); 
			if(bMinorCivCheck == false) then
				break
			else
				local iFallBackScoreTemp = 3;
				if (iFallBackScore < iFallBackScoreTemp) then
					pFallback = pTempPlot;
					iFallBackScore = iFallBackScoreTemp;
				end
			end		

			local bValidAdjacentCheck = self:__GetValidAdjacent(pTempPlot, 2); 
			if(bValidAdjacentCheck == false) then
				break
			else
				local iFallBackScoreTemp = 4;
				if (iFallBackScore < iFallBackScoreTemp) then
					pFallback = pTempPlot;
					iFallBackScore = iFallBackScoreTemp;
				end
			end

			-- Checks to see if there are natural wonders in the given distance
			local bNaturalWonderCheck = self:__NaturalWonderBuffer(pTempPlot, true); 
			if(bNaturalWonderCheck == false) then
				break
			else
				local iFallBackScoreTemp = 5;
				if (iFallBackScore < iFallBackScoreTemp) then
					pFallback = pTempPlot;
					iFallBackScore = iFallBackScoreTemp;
				end
			end

			-- Checks to see if there are resources
			if(pTempPlot:GetResourceCount() > 0 and not self:__BonusResource(pTempPlot)) then
				break
			else
				local iFallBackScoreTemp = 6;
				if (iFallBackScore < iFallBackScoreTemp) then
					pFallback = pTempPlot;
					iFallBackScore = iFallBackScoreTemp;
				end
			end

			-- Checks to see if there is an Oasis
			local featureType = pTempPlot:GetFeatureType();
			if(featureType == g_FEATURE_OASIS) then
				break
			end

			-- If the plots passes all the checks then the plot equals the temp plot
			self:__TryToRemoveBonusResource(pTempPlot);
			return pTempPlot;
		until true
	end
 
	return pFallback;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__GetWaterCheck(plot)

	--Checks to see if there is water: rivers, it is a coastal hex, or adjacent fresh water
	local gridWidth, gridHeight = Map.GetGridSize();

	if(plot:IsFreshWater() == true) then
		return true;
	elseif( plot:IsCoastalLand() == true) then
		return true;
	end

	return false;
end
------------------------------------------------------------------------------
function AssignStartingPlots:__GetValidAdjacent(plot, minor)
	
	local impassable = 0;
	local food = 0;
	local production = 0;
	local water = 0;
	local desert = 0;
	local snow = 0;
	local gridWidth, gridHeight = Map.GetGridSize();
	local terrainType = plot:GetTerrainType();

	-- Add to the Snow Desert counter if snow shows up
	if(terrainType == g_TERRAIN_TYPE_SNOW or terrainType == g_TERRAIN_TYPE_SNOW_HILLS) then
		snow = snow + 1;
	end
	
	-- Add to the Snow Desert counter if desert shows up
	if(terrainType == g_TERRAIN_TYPE_DESERT or terrainType == g_TERRAIN_TYPE_DESERT_HILLS) then
		desert = desert + 1;
	end

	local max = 0;
	local min = 0; 
	if(minor == 0) then
		max = math.ceil(gridHeight * self.uiStartMaxY / 100);
		min = math.ceil(gridHeight * self.uiStartMinY / 100);
	end

	if(plot:GetY() <= min or plot:GetY() > gridHeight - max or (max == 0 and min == 0 and minor == 0)) then
		return false;
	end

	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local adjacentPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), direction);
		if (adjacentPlot ~= nil) then
			terrainType = adjacentPlot:GetTerrainType();
			if(adjacentPlot:GetX() >= 0 and adjacentPlot:GetY() < gridHeight) then
				-- Checks to see if the plot is impassable
				if(adjacentPlot:IsImpassable() == true) then
					impassable = impassable + 1;
				end

				-- Checks to see if the plot is water
				if(adjacentPlot:IsWater() == true) then
					water = water + 1;
				end

				-- Add to the Snow Desert counter if snow shows up
				if(terrainType == g_TERRAIN_TYPE_SNOW or terrainType == g_TERRAIN_TYPE_SNOW_HILLS) then
					snow = snow + 1;
				end
			
				-- Add to the Snow Desert counter if desert shows up
				if(terrainType == g_TERRAIN_TYPE_DESERT or terrainType == g_TERRAIN_TYPE_DESERT_HILLS) then
					desert = desert + 1;
				end

				food = food + adjacentPlot:GetYield(g_YIELD_FOOD);
				production = production + adjacentPlot:GetYield(g_YIELD_PRODUCTION);
			else
				impassable = impassable + 1;
			end
		end
	end 

	--if(minor == 0) then
	--	print("X: ", plot:GetX(), " Y: ", plot:GetY(), " Food ", food, "Production: ", production);
	--end

	local balancedStart = 0;
	if(self.uiStartConfig == 1 and  minor == 0) then
		balancedStart = 1;
	end

	if((impassable >= 2 + minor - balancedStart or (self.landMap == true and impassable >= 2 + minor)) and self.waterMap == false) then
		return false;
	elseif(self.waterMap == true and impassable >= 2 + minor * 2 - balancedStart) then
		return false;
	elseif(water + impassable  >= 4 + minor - balancedStart and self.waterMap == false) then
		return false;
	elseif(water >= 3 + minor - balancedStart) then
		return false;
	elseif(water >= 4 + minor and self.waterMap == true) then
		return false;
	elseif(minor == 0 and desert > 2 - balancedStart) then
		return false;
	elseif(minor == 0 and snow > 1 - balancedStart) then
		return false;
	elseif(minor > 0 and snow > 2) then
		return false;
	else
		return true;
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__BaseFertility(plot)

	-- Calculate the fertility of the starting plot
	local pPlot = Map.GetPlotByIndex(plot);
	local iFertility = StartPositioner.GetPlotFertility(pPlot:GetIndex(), -1);
	return iFertility;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__WeightedFertility(plot, iMajorIndex, bCheckOthers)

	-- Calculate the fertility of the starting plot
	local pPlot = Map.GetPlotByIndex(plot);
	local iFertility = StartPositioner.GetPlotFertility(pPlot:GetIndex(), iMajorIndex, bCheckOthers);
	return iFertility;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__NaturalWonderBuffer(plot, minor)
	-- Returns false if the player can start because there is a natural wonder too close.

	-- If Start position config equals legendary you can start near Natural wonders
	if(self.uiStartConfig == 3) then
		return true;
	end

	local iMaxNW = 4;
	
	
	if(minor == true) then
		iMaxNW = GlobalParameters.START_DISTANCE_MINOR_NATURAL_WONDER or 3;
	else
		iMaxNW = GlobalParameters.START_DISTANCE_MAJOR_NATURAL_WONDER or 3;
	end


	local plotX = plot:GetX();
	local plotY = plot:GetY();
	for dx = -iMaxNW, iMaxNW do
		for dy = -iMaxNW,iMaxNW do
			local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, iMaxNW);
			if(otherPlot and otherPlot:IsNaturalWonder()) then
				return false;
			end
		end
	end 

	return true;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__BonusResource(plot)
	--Finds bonus resources

	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Index;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	--Find bonus resource
	for row = 0, iResourcesInDB do
		if (eResourceClassType[row] == "RESOURCECLASS_BONUS") then
			if(eResourceType[row] == plot:GetResourceType()) then
				return true;
			end
		end		
	end 

	return false;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__TryToRemoveBonusResource(plot)
	--Removes Bonus Resources underneath starting players

	--Remove bonus resource
	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Index;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	for row = 0, iResourcesInDB do
		if (eResourceClassType[row] == "RESOURCECLASS_BONUS") then
			if(eResourceType[row] == plot:GetResourceType()) then
				ResourceBuilder.SetResourceType(plot, -1);
			end
		end		
	end 
end

------------------------------------------------------------------------------
function AssignStartingPlots:__LuxuryBuffer(plot)
	-- Checks to see if there are luxuries in the given distance

	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Index;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	local plotX = plot:GetX();
	local plotY = plot:GetY();
	
	local range = 3;
	for dx = -range, range - 1, 1 do
		for dy = -range,range -1, 1 do
			local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
	--for dx = -2, 2 do
		--for dy = -2,2 do
			--local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, 2);
			if(otherPlot) then
				if(otherPlot:GetResourceCount() > 0) then
					for row = 0, iResourcesInDB do
						if (eResourceClassType[row]== "RESOURCECLASS_LUXURY") then
							if(eResourceType[row] == otherPlot:GetResourceType()) then
								return true;
							end
						end
					end
				end
			end
		end
	end 

	return false;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StrategicBuffer(plot)
	-- Checks to see if there are strategics in the given distance

	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Index;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	local plotX = plot:GetX();
	local plotY = plot:GetY();
	for dx = -2, 2 do
		for dy = -2,2 do
			local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, 2);
			if(otherPlot) then
				if(otherPlot:GetResourceCount() > 0) then
					for row = 0, iResourcesInDB do
						if (eResourceClassType[row]== "RESOURCECLASS_STRATEGIC") then
							if(eResourceType[row] == otherPlot:GetResourceType()) then
								return true;
							end
						end
					end
				end
			end
		end
	end 
	
	return false;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__MinorMajorCivBuffer(plot)
	-- Checks to see if there are majors in the given distance for this minor civ

	local iMaxStart = MapConfiguration.GetValue("StartDistanceMinorMajorCivs") or GlobalParameters.START_DISTANCE_MINOR_MAJOR_CIVILIZATION or 6;
	
	local iSourceIndex = plot:GetIndex();
	local plotX = plot:GetX();
	local plotY = plot:GetY();
	
	if(self.waterMap == true) then
		iMaxStart = iMaxStart - 1;
	end
	
	local bTooClose = false;
	for i, majorPlot in ipairs(self.majorStartPlots) do
		local iMajorPlotX = majorPlot:GetX()
		local iMajorPlotY = majorPlot:GetY()
		local Distance = Map.GetPlotDistance(plotX, plotY, iMajorPlotX, iMajorPlotY);
		if (iSourceIndex == majorPlot:GetIndex() or (plotX == iMajorPlotX and plotY == iMajorPlotY)) then
			return false;
		elseif (Distance <= iMaxStart) then
			return false;
		end
	end 
	
	return true;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__MinorMinorCivBuffer(plot)
	-- Checks to see if there are minors in the given distance for this minor civ

	local iMaxStart = MapConfiguration.GetValue("StartDistanceMinorCivs") or GlobalParameters.START_DISTANCE_MINOR_CIVILIZATION_START or 5;

	local iSourceIndex = plot:GetIndex();
	local plotX = plot:GetX();
	local plotY = plot:GetY();

	local bTooClose = false;
	for i, minorPlot in ipairs(self.minorStartPlots) do
		local iMajorPlotX = minorPlot:GetX()
		local iMajorPlotY = minorPlot:GetY()
		local Distance = Map.GetPlotDistance(plotX, plotY, iMajorPlotX, iMajorPlotY);
		local Distance2 = self:__GetPlotDistance(plot, minorPlot)
		if (iSourceIndex == minorPlot:GetIndex() or (plotX == iMajorPlotX and plotY == iMajorPlotY)) then
			return false;
		elseif (Distance <= iMaxStart) then
			return false;
		end
	end 
	
	return true;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__AddBonusFoodProduction(plot)
	local food = 0;
	local production = 0;
	local maxFood = 0;
	local maxProduction = 0;
	local gridWidth, gridHeight = Map.GetGridSize();
	local terrainType = plot:GetTerrainType();

	for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local adjacentPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), direction);
		if (adjacentPlot ~= nil) then
			terrainType = adjacentPlot:GetTerrainType();
			if(adjacentPlot:GetX() >= 0 and adjacentPlot:GetY() < gridHeight) then
				-- Gets the food and productions
				food = food + adjacentPlot:GetYield(g_YIELD_FOOD);
				production = production + adjacentPlot:GetYield(g_YIELD_PRODUCTION);

				--Checks the maxFood
				if(maxFood <=  adjacentPlot:GetYield(g_YIELD_FOOD)) then
					maxFood = adjacentPlot:GetYield(g_YIELD_FOOD);
				end

				--Checks the maxProduction
				if(maxProduction <=  adjacentPlot:GetYield(g_YIELD_PRODUCTION)) then
					maxProduction = adjacentPlot:GetYield(g_YIELD_PRODUCTION);
				end
			end
		end
	end 

	if(food < 7 or maxFood < 3) then
		--print("X: ", plot:GetX(), " Y: ", plot:GetY(), " Food Time");
		self:__AddFood(plot); 
	end

	if(production < 5 or maxProduction < 2) then
		--print("X: ", plot:GetX(), " Y: ", plot:GetY(), " Production Time");
		self:__AddProduction(plot); 
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__AddFood(plot)
	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};
	aBonus = {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Hash;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	for row = 0, iResourcesInDB do
		if (eResourceClassType[row] == "RESOURCECLASS_BONUS") then
			for row2 in GameInfo.TypeTags() do
				if(GameInfo.Resources[row2.Type] ~= nil) then
					if(GameInfo.Resources[row2.Type].Index== eResourceType[row] and row2.Tag=="CLASS_FOOD") then
						table.insert(aBonus, eResourceType[row]);
					end
				end
			end
		end
	end

	local dir = TerrainBuilder.GetRandomNumber(DirectionTypes.NUM_DIRECTION_TYPES, "Random Direction");
	for i = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local adjacentPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), dir);
		if (adjacentPlot ~= nil) then
			aShuffledBonus =  GetShuffledCopyOfTable(aBonus);
			for i, bonus in ipairs(aShuffledBonus) do
				if(ResourceBuilder.CanHaveResource(adjacentPlot, bonus)) then
					--print("X: ", adjacentPlot:GetX(), " Y: ", adjacentPlot:GetY(), " Resource #: ", bonus);
					ResourceBuilder.SetResourceType(adjacentPlot, bonus, 1);
					return;
				end
			end
		end


		if(dir == DirectionTypes.NUM_DIRECTION_TYPES - 1) then
			dir = 0;
		else
			dir = dir + 1;
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__AddProduction(plot)
	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};
	aBonus = {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Hash;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	for row = 0, iResourcesInDB do
		if (eResourceClassType[row] == "RESOURCECLASS_BONUS") then
			for row2 in GameInfo.TypeTags() do
				if(GameInfo.Resources[row2.Type] ~= nil) then
					if(GameInfo.Resources[row2.Type].Hash == eResourceType[row] and row2.Tag=="CLASS_PRODUCTION") then
						table.insert(aBonus, eResourceType[row]);
					end
				end
			end
		end
	end

	local dir = TerrainBuilder.GetRandomNumber(DirectionTypes.NUM_DIRECTION_TYPES, "Random Direction");
	for i = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
		local adjacentPlot = Map.GetAdjacentPlot(plot:GetX(), plot:GetY(), dir);
		if (adjacentPlot ~= nil) then
			aShuffledBonus =  GetShuffledCopyOfTable(aBonus);
			for i, bonus in ipairs(aShuffledBonus) do
				if(ResourceBuilder.CanHaveResource(adjacentPlot, bonus)) then
					--print("X: ", adjacentPlot:GetX(), " Y: ", adjacentPlot:GetY(), " Resource #: ", bonus);
					ResourceBuilder.SetResourceType(adjacentPlot, bonus, 1);
					return;
				end
			end
		end


		if(dir == DirectionTypes.NUM_DIRECTION_TYPES - 1) then
			dir = 0;
		else
			dir = dir + 1;
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__AddLeyLine(plot)
	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};
	aBonus = {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Hash;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	for row = 0, iResourcesInDB do
		if (eResourceClassType[row] == "RESOURCECLASS_LEY_LINE") then
			if(eResourceType[row] ~= nil) then
				table.insert(aBonus, eResourceType[row]);
			end
		end
	end

	local plotX = plot:GetX();
	local plotY = plot:GetY();
	
	aShuffledBonus =  GetShuffledCopyOfTable(aBonus);
	for i, resource in ipairs(aShuffledBonus) do
		for dx = -2, 2, 1 do
			for dy = -2,2, 1 do
				local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, 2);
				if(otherPlot) then
					if(ResourceBuilder.CanHaveResource(otherPlot, resource) and otherPlot:GetIndex() ~= plot:GetIndex()) then
						ResourceBuilder.SetResourceType(otherPlot, resource, 1);
						return;
					end
				end
			end
		end 
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__InitStartBias(minor)
	--Create an array of each starting plot for each civ
	self.playerStarts = {};
	if (minor == true) then
		for i = 1, self.iNumMinorCivs do
			local playerStart = {}
			for j, plot in ipairs(self.minorStartPlots) do
				playerStart[j] = plot;
			end
			self.playerStarts[self.iNumMajorCivs + i] = playerStart
		end
	else
		for i = 1, self.iNumMajorCivs do
			local playerStart = {}
			for j, plot in ipairs(self.majorStartPlots) do
				playerStart[j] = plot;
			end
			self.playerStarts[i] = playerStart;
		end
	end

	--Find the Max tier
	local max = 0; 
	for row in GameInfo.StartBiasResources() do
		if( row.Tier > max) then
			max = row.Tier;
		end
	end
	for row in GameInfo.StartBiasFeatures() do
		if( row.Tier > max) then
			max = row.Tier;
		end
	end
	for row in GameInfo.StartBiasTerrains() do
		if( row.Tier > max) then
			max = row.Tier;
		end
	end
	for row in GameInfo.StartBiasRivers() do
		if(row.Tier > max) then
			max = row.Tier;
		end
	end

	
	for i = 1, max do
		players = {};
		
		--Add all the civs that are in this tier to a table
		if(minor == true) then
			for j = 1, self.iNumMinorCivs do
				local playerIndex = self.iNumMajorCivs + j;
				local civilizationType = PlayerConfigurations[self.minorList[j]]:GetCivilizationTypeName();

				for row in GameInfo.StartBiasResources() do
					if(row.CivilizationType == civilizationType) then
						if( row.Tier == i) then
							table.insert(players, playerIndex);
						end
					end
				end

				for row in GameInfo.StartBiasFeatures() do
					if(row.CivilizationType == civilizationType) then
						if( row.Tier == i) then
							table.insert(players, playerIndex);
						end
					end
				end

				for row in GameInfo.StartBiasTerrains() do
					if(row.CivilizationType == civilizationType) then
						if( row.Tier == i) then
							table.insert(players, playerIndex);
						end
					end
				end

				for row in GameInfo.StartBiasRivers() do
					if(row.CivilizationType == civilizationType) then
						if( row.Tier == i) then
							table.insert(players, playerIndex);
						end
					end
				end
			end
		else
			for j = 1, self.iNumMajorCivs do
				local playerIndex = j;
				local civilizationType = PlayerConfigurations[self.majorList[j]]:GetCivilizationTypeName();
				
				for row in GameInfo.StartBiasResources() do
					if(row.CivilizationType == civilizationType) then
						if( row.Tier == i) then
							table.insert(players, playerIndex);
						end
					end
				end

				for row in GameInfo.StartBiasFeatures() do
					if(row.CivilizationType == civilizationType) then
						if( row.Tier == i) then
							table.insert(players, playerIndex);
						end
					end
				end

				for row in GameInfo.StartBiasTerrains() do
					if(row.CivilizationType == civilizationType) then
						if( row.Tier == i) then
							table.insert(players, playerIndex);
						end
					end
				end

				for row in GameInfo.StartBiasRivers() do
					if(row.CivilizationType == civilizationType) then
						if( row.Tier == i) then
							table.insert(players, playerIndex);
						end
					end
				end
			end
		end


		players =  GetShuffledCopyOfTable(players); -- Shuffle the table
		
		-- Go through all the players in this tier
		for j, playerIndex in ipairs(players) do
			local playerId = (playerIndex > self.iNumMajorCivs) and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
			local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
			
			--Check if this player has a resource bias then it calls that method
			local resource = false;
			for row in GameInfo.StartBiasResources() do
				if(row.CivilizationType == civilizationType) then
					if( row.Tier == i) then
						resource = true;
					end
				end
			end
			if(resource == true) then
				self:__StartBiasResources(playerIndex, i, minor);
			end

			--Check if this player has a feature bias then it calls that method
			local feature = false;
			for row in GameInfo.StartBiasFeatures() do
				if(row.CivilizationType == civilizationType) then
					if( row.Tier == i) then
						feature = true;
					end
				end
			end
			if(feature == true) then
				self:__StartBiasFeatures(playerIndex, i, minor);
			end

			--Check if this player has a terrain bias then it calls that method
			local terrain = false;
			for row in GameInfo.StartBiasTerrains() do
				if(row.CivilizationType == civilizationType) then
					if( row.Tier == i) then
						terrain = true;
					end
				end
			end
			if(terrain == true) then
				self:__StartBiasTerrains(playerIndex, i, minor);
			end

			--Check if this player has a river bias then it calls that method
			local river = false;
			for row in GameInfo.StartBiasRivers() do
				if(row.CivilizationType == civilizationType) then
					if( row.Tier == i) then
						river = true;
					end
				end
			end
			if(river == true) then
				self:__StartBiasRivers(playerIndex, i, minor);
			end
		end

		local minorModifier = 0;
		if(minor == true) then
			minorModifier = self.iNumMajorCivs;
		end

		if(i == max) then
			local loop = self.iNumMajorCivs;

			if(minor == true) then
				loop = self.iNumMinorCivs;
			end

			for j = 1, loop do
				if(self:__ArraySize(self.playerStarts, j + minorModifier) > 1) then
					for k, v in pairs(self.playerStarts[j + minorModifier]) do
						if(v~= nil) then
							--Call Removal
							self:__StartBiasPlotRemoval(v, minor, j + minorModifier);
						end
					end
				end
			end
		else
			for j, playerIndex in ipairs(players) do
				local hasPlot = false;
				
				if(self:__ArraySize(self.playerStarts, playerIndex) > 1) then
					for k, v in pairs(self.playerStarts[playerIndex]) do
						if(v~= nil and hasPlot == false) then
							hasPlot = true;
							--Call Removal
							self:__StartBiasPlotRemoval(v, minor, playerIndex);
						end
					end
				end
			end
		end
	end
	

	-- Safety net for starting plots
	playerRestarts = {};
	local loop = 0;
	if (minor == true) then
		loop = self.iNumMinorCivs;
		
		for k, plot in ipairs(self.minorCopy) do
			table.insert(playerRestarts, plot);
		end

		for i = 1, self.iNumMinorCivs do
			local removed = false;
			for j, plot in pairs(self.playerStarts[i + self.iNumMajorCivs]) do
				for k, rePlot in ipairs(playerRestarts) do
					if(plot:GetIndex() == rePlot:GetIndex() and removed == false) then
						table.remove(playerRestarts, k);
						removed = true;
					end
				end
			end
		end
	else
		loop = self.iNumMajorCivs;
		
		for k, plot in ipairs(self.majorCopy) do
			table.insert(playerRestarts, plot);
		end

		for i = 1, self.iNumMajorCivs do
			local removed = false;
			for j, plot in pairs(self.playerStarts[i]) do
				for k, rePlot in ipairs(playerRestarts) do
					if(plot:GetIndex() == rePlot:GetIndex() and removed == false) then
						table.remove(playerRestarts, k);
						removed = true;
					end
				end
			end
		end
	end

	
	for i = 1, loop do
		local bHasStart = false;

		local offset = minor and self.iNumMajorCivs or 0;

		for j, plot in pairs(self.playerStarts[i + offset]) do
			if(plot ~= nil) then
				bHasStart = true;
			end
		end

		if(bHasStart == false) then
			local bNeedPlot = true;
			local index = -1;
			for j, plot in ipairs(playerRestarts) do
				if (plot ~= nil and bNeedPlot == true) then
					bNeedPlot = false;
					index = j;
				end
			end
			if(bNeedPlot == true) then
				--print("Start Bias Error");
			else
				table.insert(self.playerStarts[i + offset], playerRestarts[index]);
				table.remove(playerRestarts, index);
			end
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasResources(playerIndex, tier, minor)
	local numResource = 0;
	resources = {}

	local playerId = minor and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
	local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
	local playerStart = self.playerStarts[playerIndex];

	-- Find the resouces in this tier
	for row in GameInfo.StartBiasResources() do
		if(row.CivilizationType == civilizationType) then
			if( row.Tier == tier) then
				table.insert(resources,  row.ResourceType);
			end
		end
	end

	--Change the range if it is a minor civ
	local range = 2;
	if(minor == true) then
		range = 1;
	end

	resourcePlots = {};

	Resources = {};

	for row in GameInfo.Resources() do
		table.insert(Resources, row.ResourceType);
	end

	--Loop through all the starting plots
	for k, v in pairs(playerStart) do
		--Count the starting plots with the given resource(s) in this tier and add them to an array
		if(v ~= nil) then
			local plotX = v:GetX();
			local plotY = v:GetY();

			local hasResource = false;

			for dx = -range, range, 1 do
				for dy = -range,range, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(otherPlot:GetResourceCount() > 0) then
							for j, resource in ipairs(resources) do
								if(Resources[otherPlot:GetResourceType()+1] == resource) then
									hasResource = true;
								end
							end
						end
					end
				end
			end

			if (hasResource == true) then
				numResource = numResource + 1;
				table.insert(resourcePlots, v);
			end
		end
	end 
	
	print("numResource: ", numResource)

	--If more than 1 has this resource(s) within 3
	if(numResource  > 1) then
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		for i, resourcePlot in ipairs(resourcePlots) do
			table.insert(playerStart, resourcePlot);
		end
	elseif (numResource  == 1) then
		local startPlot = resourcePlots[1];
		
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			if(startPlot:GetIndex() == v:GetIndex()) then
					playerStart[k] = startPlot;
			else
					playerStart[k] = nil;
			end
		end

		-- Remove this starting plot from all other civ's list
		-- Check to to see if they have one starting spot left if so remove it from all other players
		self:__StartBiasPlotRemoval(startPlot, minor, playerIndex);

	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasFeatures(playerIndex, tier, minor)
	local numFeature = 0;
	features = {}

	local playerId = minor and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
	local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
	local playerStart = self.playerStarts[playerIndex];

	-- Find the features in this tier
	for row in GameInfo.StartBiasFeatures() do
		if(row.CivilizationType == civilizationType) then
			if( row.Tier == tier) then
				table.insert(features,  row.FeatureType);
			end
		end
	end

	--Change the range if it is a minor civ
	local range = 3;
	if(minor == true) then
		range = 2;
	end

	featurePlots = {};

	Features = {};

	for row in GameInfo.Features() do
		table.insert(Features, row.FeatureType);
	end

	--Loop through all the starting plots
	for k, v in pairs(playerStart) do
		--Count the starting plots with the given feature(s) in this tier and add them to an array
		if(v ~= nil) then
			local plotX = v:GetX();
			local plotY = v:GetY();

			local hasFeature = false;

			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(otherPlot:GetFeatureType() ~= g_FEATURE_NONE) then
							for j, feature in ipairs(features) do
								if(Features[otherPlot:GetFeatureType()+1] == feature) then
									hasFeature = true;
								end
							end
						end
					end
				end
			end

			if (hasFeature == true) then
				numFeature = numFeature + 1;
				table.insert(featurePlots, v);
			end
		end
	end 

	--If more than 1 has this feature(s) within 3
	if(numFeature  > 1) then
		-- Remove all other starting plots from this civ’s list.
		local featureValue = table.fill(0, #featurePlots);

		for i, featurePlot in ipairs(featurePlots) do
			local plotX = featurePlot:GetX();
			local plotY = featurePlot:GetY();


			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(featurePlot:GetIndex() ~= otherPlot:GetIndex()) then
							if(otherPlot:GetFeatureType() ~= g_FEATURE_NONE) then
								for j, feature in ipairs(features) do
									if(Features[otherPlot:GetFeatureType()+1] == feature) then
										featureValue[i] = featureValue[i] + 1;
									end
								end
							end
						end
					end
				end
			end
		end

		self.sortedArray = {};
		self:__SortByArray(featurePlots, featureValue);

		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		for i, featurePlot in ipairs(self.sortedArray) do
			table.insert(playerStart, featurePlot);
		end
	elseif (numFeature  == 1) then
		local startPlot = featurePlots[1];

		-- Remove all other starting plots from this civ’s list.
		for k, v in pairs(playerStart) do
			if(startPlot:GetIndex() == v:GetIndex()) then
				playerStart[k] = startPlot;
			else
				playerStart[k] = nil;
			end
		end

		-- Remove this starting plot from all other civ's list
		-- Check to to see if they have one starting spot left if so remove it from all other players
		self:__StartBiasPlotRemoval(startPlot, minor, playerIndex);

	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasTerrains(playerIndex, tier, minor)
	local numTerrain = 0;
	terrains = {}

	local playerId = minor and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
	local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
	local playerStart = self.playerStarts[playerIndex];

	-- Find the terrains in this tier
	for row in GameInfo.StartBiasTerrains() do
		if(row.CivilizationType == civilizationType) then
			if( row.Tier == tier) then
				table.insert(terrains,  row.TerrainType);
			end
		end
	end

	--Change the range if it is a minor civ
	local range = 3;
	if(minor == true) then
		range = 2;
	end

	terrainPlots = {};

	Terrains = {};

	for row in GameInfo.Terrains() do
		table.insert(Terrains, row.TerrainType);
	end

	--Loop through all the starting plots
	for k, v in pairs(playerStart) do
		--Count the starting plots with the given terrain(s) in this tier and add them to an array
		if(v ~= nil) then
			local plotX = v:GetX();
			local plotY = v:GetY();

			local hasTerrain = false;

			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(v:GetIndex() ~= otherPlot:GetIndex()) then
							if(otherPlot:GetTerrainType() ~= g_TERRAIN_NONE) then
								for j, terrain in ipairs(terrains) do
									if(Terrains[otherPlot:GetTerrainType()+1] == terrain) then
										hasTerrain = true;
									end
								end
							end
						end
					end
				end
			end

			if (hasTerrain == true) then
				numTerrain = numTerrain + 1;
				table.insert(terrainPlots, v);
			end
		end
	end 

	--If more than 1 has this terrain(s) within 3
	if(numTerrain  > 1) then
		-- Remove all other starting plots from this civ’s list.
		local terrainValue = table.fill(0, #terrainPlots);

		for i, terrainPlot in ipairs(terrainPlots) do
			local plotX = terrainPlot:GetX();
			local plotY = terrainPlot:GetY();


			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(otherPlot:GetTerrainType() ~= g_TERRAIN_NONE) then
							for j, terrain in ipairs(terrains) do
								if(Terrains[otherPlot:GetTerrainType()+1] == terrain) then
									terrainValue[i] = terrainValue[i] + 1;
								end
							end
						end
					end
				end
			end
		end

		self.sortedArray = {};
		self:__SortByArray(terrainPlots, terrainValue);

		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		for i, terrainPlot in ipairs(self.sortedArray) do
			table.insert(playerStart, terrainPlot);
		end
	elseif (numTerrain  == 1) then
		local startPlot = terrainPlots[1];

		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			if(startPlot:GetIndex() == v:GetIndex()) then
				playerStart[k] = startPlot;
			else
				playerStart[k] = nil;
			end
		end

		-- Remove this starting plot from all other civ's list
		-- Check to to see if they have one starting spot left if so remove it from all other players
		self:__StartBiasPlotRemoval(startPlot, minor, playerIndex);

	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasRivers(playerIndex, tier, minor)
	local numRiver = 0;

	--The range is 1 in the beginning
	local range = 1;

	riverPlots = {};

	local playerId = minor and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
	local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
	local playerStart = self.playerStarts[playerIndex];

	--Loop through all the starting plots
	for k, v in pairs(playerStart) do
		--Count the starting plots with the given river(s) in this tier and add them to an array
		if(v ~= nil) then
			local plotX = v:GetX();
			local plotY = v:GetY();

			local hasRiver = false;

			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(otherPlot:IsRiver()) then
							hasRiver = true;
						end
					end
				end
			end

			if (hasRiver == true) then
				numRiver = numRiver + 1;
				table.insert(riverPlots, v);
			end
		end
	end 

	--If more than 1 has this river(s) within 3
	if(numRiver  > 1) then
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		for i, riverPlot in ipairs(riverPlots) do
			table.insert(playerStart, riverPlot);
		end
	elseif (numRiver  == 1) then
		local startPlot = riverPlots[1];
		
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			if(startPlot:GetIndex() == v:GetIndex()) then
				playerStart[k] = startPlot;
			else
				playerStart[k] = nil;
			end
		end

		-- Remove this starting plot from all other civ's list
		-- Check to to see if they have one starting spot left if so remove it from all other players
		self:__StartBiasPlotRemoval(startPlot, minor, playerIndex);

	elseif(minor == false) then
		--Change the range if no rivers within 3 and major
		local numRiver = 0;
		local range = 3;

		riverPlots = {};

		--Loop through all the starting plots
		for k, v in pairs(playerStart) do
			--Count the starting plots with the given river(s) in this tier and add them to an array
			if(v ~= nil) then
				local plotX = v:GetX();
				local plotY = v:GetY();

				local hasRiver = false;

				for dx = -range, range - 1, 1 do
					for dy = -range,range -1, 1 do
						local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
						if(otherPlot) then
							if(otherPlot:IsRiver()) then
								hasRiver = true;
							end
						end
					end
				end

				if (hasRiver == true) then
					numRiver = numRiver + 1;
					table.insert(riverPlots, v);
				end
			end
		end 

		if(numRiver  > 1) then
			-- Remove all other starting plots from this civ's list.
			for k, v in pairs(playerStart) do
				playerStart[k] = nil;
			end
			for i, riverPlot in ipairs(riverPlots) do
				table.insert(playerStart, riverPlot);
			end
		elseif (numRiver  == 1) then
			local startPlot = riverPlots[1];
		
			-- Remove all other starting plots from this civ's list.
			for k, v in pairs(playerStart) do
				if(startPlot:GetIndex() == v:GetIndex()) then
					playerStart[k] = startPlot;
				else
					playerStart[k] = nil;
				end
			end

			-- Remove this starting plot from all other civ's list
			-- Check to to see if they have one starting spot left if so remove it from all other players
			self:__StartBiasPlotRemoval(startPlot, minor, playerIndex);
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasPlotRemoval(startPlot, minor, playerIndex)
	
	if(startPlot == nil) then
		print("Nil1 Starting Plot");
	end
 
	local start = 1;
	local finish = self.iNumMajorCivs; 

	if (minor == true) then
		start = self.iNumMajorCivs + 1;
		finish = self.iNumMajorCivs + self.iNumMinorCivs;
	end

	for i = start, finish do
		if(i ~= playerIndex) then
			local plotID  = -1;

			for k, v in pairs(self.playerStarts[i]) do
				if(v~= nil and v:GetIndex() == startPlot:GetIndex()) then
					plotID = k;
				end
			end

			--If only one left remove it. And remove it from others...
			if(plotID > -1) then
				if(self:__ArraySize(self.playerStarts, i) == 1) then
					--print("Deleting the last entry will have bad results. Minor is ", minor);
				end

				self.playerStarts[i][plotID] = nil;

				if(self:__ArraySize(self.playerStarts, i) == 1) then
					local hasPlot = false;
					for k, v in pairs(self.playerStarts[i]) do
						if(v~= nil and hasPlot == false) then
							hasPlot = true;
							--Call Removal
							self:__StartBiasPlotRemoval(v, minor, i)
						end
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__SortByArray(sorted, keyArray)
	local greatestValue = -1;
	local index  = -1;

	for k, key in ipairs(keyArray) do
		if(key ~= nil and key > greatestValue) then
			index = k;
			greatestValue = key;
		end
	end

	if(index > 0 and sorted[index] ~= nil) then
		table.insert(self.sortedArray,sorted[index]);
		table.remove(sorted,index);
		table.remove(keyArray,index);
	else
		print("Nil");
	end 

	if(#keyArray > 0) then
		self:__SortByArray(sorted, keyArray);
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:__ArraySize(array, index)
	local count = 0;
	
	if( array ~= nil and array[index] ~= nil) then
		for v in pairs(array[index]) do 
			if(v~=nil) then
				count = count + 1;
			end
		end
	end

 	return count;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__AddResourcesBalanced()
	local iStartEra = GameInfo.Eras[ GameConfiguration.GetStartEra() ];
	local iStartIndex = 1;
	if iStartEra ~= nil then
		iStartIndex = iStartEra.ChronologyIndex;
	end

	local iHighestFertility = 0;
	for i, plot in ipairs(self.majorStartPlots) do
		self:__RemoveBonus(plot);
		
		self:__BalancedStrategic(plot, iStartIndex);
		
		if(self:__BaseFertility(plot:GetIndex()) > iHighestFertility) then
			iHighestFertility = self:__BaseFertility(plot:GetIndex());
		end
	end

	for i, plot in ipairs(self.majorStartPlots) do
		local iFertilityLeft = self:__BaseFertility(plot:GetIndex());

		if(iFertilityLeft > 0) then
			if(self:__IsContinentalDivide(plot) == true) then
				local iContinentalWeight = GlobalParameters.START_FERTILITY_WEIGHT_CONTINENTAL_DIVIDE or 250;
				iFertilityLeft = iFertilityLeft - iContinentalWeight
			else
				local bAddLuxury = true;
				local iLuxWeight = GlobalParameters.START_FERTILITY_WEIGHT_LUXURY or 250;
				while iFertilityLeft >= iLuxWeight and bAddLuxury == true do 
					bAddLuxury = self:__AddLuxury(plot);
					if(bAddLuxury == true) then
						iFertilityLeft = iFertilityLeft - iLuxWeight;
					end
				end
			end
			local bAddBonus = true;
			local iBonusWeight = GlobalParameters.START_FERTILITY_WEIGHT_BONUS or 75;
			while iFertilityLeft >= iBonusWeight and bAddBonus == true do 
				bAddBonus = self:__AddBonus(plot);
				if(bAddBonus == true) then
					iFertilityLeft = iFertilityLeft - iBonusWeight;
				end
			end
		end
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:__AddResourcesStandard() --wraps the balance strategic function inside.
	local iStartEra = GameInfo.Eras[ GameConfiguration.GetStartEra() ];
	local iStartIndex = 1;
	if iStartEra ~= nil then
		iStartIndex = iStartEra.ChronologyIndex;
	end

	local iHighestFertility = 0;
	for i, plot in ipairs(self.majorStartPlots) do
		self:__BalancedStrategic(plot, iStartIndex);
	end
end
------------------------------------------------------------------------------
function AssignStartingPlots:__AddResourcesLegendary()
	local iStartEra = GameInfo.Eras[ GameConfiguration.GetStartEra() ];
	local iStartIndex = 1;
	if iStartEra ~= nil then
		iStartIndex = iStartEra.ChronologyIndex;
	end

	local iLegendaryBonusResources = GlobalParameters.START_LEGENDARY_BONUS_QUANTITY or 2;
	local iLegendaryLuxuryResources = GlobalParameters.START_LEGENDARY_LUXURY_QUANTITY or 1;
	for i, plot in ipairs(self.majorStartPlots) do
		self:__BalancedStrategic(plot, iStartIndex);

		if(self:__IsContinentalDivide(plot) == true) then
			iLegendaryLuxuryResources = iLegendaryLuxuryResources - 1;
		else	
			local bAddLuxury = true;
			while iLegendaryLuxuryResources > 0 and bAddLuxury == true do 
				bAddLuxury = self:__AddLuxury(plot);
				if(bAddLuxury == true) then
						iLegendaryLuxuryResources = iLegendaryLuxuryResources - 1;
				end
			end
		end

		local bAddBonus = true;
		iLegendaryBonusResources = iLegendaryBonusResources + 2 * iLegendaryLuxuryResources;
		while iLegendaryBonusResources > 0 and bAddBonus == true do 
			bAddBonus = self:__AddBonus(plot);
			if(bAddBonus == true) then
					iLegendaryBonusResources = iLegendaryBonusResources - 1;
			end
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__BalancedStrategic(plot, iStartIndex)
	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};	
	eRevealedEra = {};	
	local iRange = STRATEGIC_RESOURCE_FERTILITY_STARTING_ERA_RANGE or 1;

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Hash;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
		eRevealedEra[iResourcesInDB] = row.RevealedEra;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	for row = 0, iResourcesInDB do
		if (eResourceClassType[row]== "RESOURCECLASS_STRATEGIC") then
			--if(iStartIndex - iRange <= eRevealedEra[row] and iStartIndex + iRange >= eRevealedEra[row]) then
			local bHasResource = false;
			bHasResource = self:__FindSpecificStrategic(eResourceType[row], plot);	
			if(bHasResource == false) then
				self:__AddStrategic(eResourceType[row], plot)
				--print("Placed!");
			end
			--end
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__FindSpecificStrategic(eResourceType, plot)
	-- Checks to see if there is a specific strategic in a given distance

	local plotX = plot:GetX();
	local plotY = plot:GetY();
	local range = 3
	for dx = -range, range do
		for dy = -range,range do
			local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
			if(otherPlot) then
				if(otherPlot:GetResourceCount() > 0) then
					if(eResourceType == otherPlot:GetResourceType() ) then
						return true;
					end 
				end
			end
		end
	end 

	return false;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__AddStrategic(eResourceType, plot)
	-- Checks to see if it can place a specific strategic

	local plotX = plot:GetX();
	local plotY = plot:GetY();
	local range = 7;
--[[
	for dx = -range, range, 1 do
		for dy = -range, range, 1 do
			local otherPlot = Map.GetPlotXY(plotX+dx, plotY+dy);
			if(otherPlot and otherPlot ~= nil) then
				if(ResourceBuilder.CanHaveResource(otherPlot, eResourceType) and otherPlot:GetIndex() ~= plot:GetIndex()) then
					ResourceBuilder.SetResourceType(otherPlot, eResourceType, 1);
					current_count += 1
					if (current_count >= add_count) then
						return;
				end
			end
		end
	end 
]]--
	for ring = 4, range do
		for dx = -ring, ring do
			for dy = -ring, ring do
				local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, ring);
				if(otherPlot) then
					if(ResourceBuilder.CanHaveResource(otherPlot, eResourceType) and otherPlot:GetIndex() ~= plot:GetIndex()) then
						ResourceBuilder.SetResourceType(otherPlot, eResourceType, 1);
						print(eResourceType, " added successfully.")
						return;
					end
				end
			end
		end
	end
	return
	--print("Failed");
end

------------------------------------------------------------------------------
function AssignStartingPlots:__AddLuxury(plot)
	-- Checks to see if it can place a nearby luxury

	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType	= {};
	eAddLux	= {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Hash;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
		iResourcesInDB = iResourcesInDB + 1;
	end

	local plotX = plot:GetX();
	local plotY = plot:GetY();
	for dx = -4, 4 do
		for dy = -4, 4 do
			local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, 4);
			if(otherPlot) then
				if(otherPlot:GetResourceCount() > 0) then
					for row = 0, iResourcesInDB do
						if (eResourceClassType[row]== "RESOURCECLASS_LUXURY") then
							if(otherPlot:GetResourceType() == eResourceType[row]) then
								table.insert(eAddLux, eResourceType[row]);
							end
						end
					end
				end
			end
		end
	end 

	for dx = -2, 2 do
		for dy = -2, 2 do
			local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, 2);
			if(otherPlot) then
				eAddLux =  GetShuffledCopyOfTable(eAddLux);
				for i, resource in ipairs(eAddLux) do
					if(ResourceBuilder.CanHaveResource(otherPlot, resource) and otherPlot:GetIndex() ~= plot:GetIndex()) then
						ResourceBuilder.SetResourceType(otherPlot, resource, 1);
						--print("Yeah Lux");
						return true;
					end
				end
			end
		end
	end 

	--print("Failed Lux");
	return false;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__AddBonus(plot)
	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};
	aBonus = {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Hash;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	for row = 0, iResourcesInDB do
		if (eResourceClassType[row] == "RESOURCECLASS_BONUS") then
			for row2 in GameInfo.TypeTags() do
				if(GameInfo.Resources[row2.Type] ~= nil) then
					table.insert(aBonus, eResourceType[row]);
				end
			end
		end
	end

	local plotX = plot:GetX();
	local plotY = plot:GetY();
	aBonus =  GetShuffledCopyOfTable(aBonus);
	for i, resource in ipairs(aBonus) do
		for dx = -2, 2 do
			for dy = -2, 2 do
				local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, 2);
				if(otherPlot) then
					if(ResourceBuilder.CanHaveResource(otherPlot, resource) and otherPlot:GetIndex() ~= plot:GetIndex()) then
						ResourceBuilder.SetResourceType(otherPlot, resource, 1);
						--print("Yeah Bonus");
						return true;
					end
				end
			end
		end
	end 

	--print("Failed Bonus");
	return false
end

------------------------------------------------------------------------------
function AssignStartingPlots:__IsContinentalDivide(plot)
	local plotX = plot:GetX();
	local plotY = plot:GetY();

	eContinents	= {};

	for dx = -4, 4 do
		for dy = -4, 4 do
			local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, 4);
			if(otherPlot) then
				if(otherPlot:GetContinentType() ~= nil) then
					if(#eContinents == 0) then
						table.insert(eContinents, otherPlot:GetContinentType());
					else
						if(eContinents[1] ~= otherPlot:GetContinentType()) then
							return true;
						end
					end
				end
			end
		end
	end 
	
	return false;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__RemoveBonus(plot)
	local plotX = plot:GetX();
	local plotY = plot:GetY();
	local iResourcesInDB = 0;
	eResourceType	= {};
	eResourceClassType = {};
	aBonus = {};

	for row in GameInfo.Resources() do
		eResourceType[iResourcesInDB] = row.Hash;
		eResourceClassType[iResourcesInDB] = row.ResourceClassType;
	    iResourcesInDB = iResourcesInDB + 1;
	end

	for row = 0, iResourcesInDB do
		if (eResourceClassType[row] == "RESOURCECLASS_BONUS") then
			for row2 in GameInfo.TypeTags() do
				if(GameInfo.Resources[row2.Type] ~= nil) then
					table.insert(aBonus, eResourceType[row]);
				end
			end
		end
	end

	for i, resource in ipairs(eResourceType) do
		for dx = -3, 3, 1 do
			for dy = -3,3, 1 do
				local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, 3);
				if(otherPlot) then
					if(resource  == otherPlot:GetResourceTypeHash()) then
						ResourceBuilder.SetResourceType(otherPlot, -1);
						return;
					end
				end
			end
		end
	end 
end

--#######################################################################################################
-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
-- Zegangani Additional Functions -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- --
---------------------------------------------------------------------------------------------------------

function AssignStartingPlots:__SetStartMajor(plots)
	-- Sort by fertility of all the plots
	-- eliminate them if they do not meet the following:
	-- distance to another civilization
	-- distance to a natural wonder
	-- minimum production
	-- minimum food
	-- minimum luxuries
	-- minimum strategic

	local sortedPlots = plots;

	if plots == nil then
		return;
	end
	
	-- Nothing there?  Just exit, returing nil
	if iSize == 0 then
		return;
	end
	
	table.sort (sortedPlots, function(a, b) return a.Fertility > b.Fertility; end); --GS
	
	local iSize = #plots;
	local iContinentIndex = 1;
	
	while iSize >= iContinentIndex do
		-- Wrap the function in a repeat so that we can break out of it
		repeat
			
			pTempPlot = sortedPlots[iContinentIndex].Plot;
			iContinentIndex = iContinentIndex + 1;

			-- Checks to see if the plot is impassable
			if(pTempPlot:IsImpassable() == true) then
				break
			end

			-- Checks to see if the plot is water
			if(pTempPlot:IsWater() == true) then
				break
			end

			-- Checks to see if there are luxuries
			--if (math.ceil(self.iDefaultNumberMajor * 1.25) + self.iDefaultNumberMinor > self.iNumMinorCivs + self.iNumMajorCivs) then
				local bLuxuryCheck = self:__LuxuryBuffer(pTempPlot); 
				if(bLuxuryCheck  == false) then
					break
				end
			--end

			-- Checks to see if there is fresh water or coast
			local bWaterCheck = self:__GetWaterCheck(pTempPlot); 
			if(bWaterCheck == false) then
				break
			end

			local bValidAdjacentCheck = self:__GetValidAdjacent(pTempPlot, 0); 
			if(bValidAdjacentCheck == false) then
				break
			end

			-- Checks to see if there is a resource blocking our placement
			if(pTempPlot:GetResourceCount() > 0 and not self:__BonusResource(pTempPlot)) then
				break
			end
			
			-- Checks to see if there is an Oasis
			local featureType = pTempPlot:GetFeatureType();
			if(featureType == g_FEATURE_OASIS) then
				break
			end
			
			table.insert(self.possibleMajorPlots, pTempPlot);

		-- End of the block: all our breaks send us here, instead of breaking the outer for loop
		until iSize == iContinentIndex - 1
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__InitStartBiasMajor(minor)
	--Create an array of each starting plot for each civ
	
	self.playerStartsMajor = {};
	if (minor == false) then
		for i = 1, self.iNumMajorCivs do
			local playerStart = {}
			for j, plot in ipairs(self.possibleMajorPlots) do
				playerStart[j] = plot;
			end
			self.playerStartsMajor[i] = playerStart;
		end
	end

	--Find the Max tier
	local max = 0; 
	for row in GameInfo.StartBiasResources() do
		if( row.Tier > max) then
			max = row.Tier;
		end
	end
	for row in GameInfo.StartBiasFeatures() do
		if( row.Tier > max) then
			max = row.Tier;
		end
	end
	for row in GameInfo.StartBiasTerrains() do
		if( row.Tier > max) then
			max = row.Tier;
		end
	end
	for row in GameInfo.StartBiasRivers() do
		if(row.Tier > max) then
			max = row.Tier;
		end
	end

	
	--tierPlayers =  {};
	playersCompleted = {};
		
	for i = 1, max do
		players = {};
		-- Go through all the players in this tier
		for j, playerIndex in ipairs(sortedMajPlayers) do
			
			local playerId = (playerIndex > self.iNumMajorCivs) and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
			local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName();
			local player = Players[playerId];
			
			local bPlayerCompleted = false;
			for i, playerId in ipairs(playersCompleted) do
				if playerId == playerIndex then
					bPlayerCompleted = true
				end
			end
			if bPlayerCompleted then
				break
			end
			
			local IsInTier = false
			
			
			self:__StartBiasDistanceMajor(playerIndex);
			

			--Check if this player has a resource bias then it calls that method
			local resource = false;
			for row in GameInfo.StartBiasResources() do
				if(row.CivilizationType == civilizationType) then
					if( row.Tier == i) then
						resource = true;
					end
				end
			end
			if(resource == true) then
				IsInTier = true
				self:__StartBiasResourcesMajor(playerIndex, i, minor);
			end

			--Check if this player has a feature bias then it calls that method
			local feature = false;
			for row in GameInfo.StartBiasFeatures() do
				if(row.CivilizationType == civilizationType) then
					if( row.Tier == i) then
						feature = true;
					end
				end
			end
			if(feature == true) then
				IsInTier = true
				self:__StartBiasFeaturesMajor(playerIndex, i, minor);
			end

			--Check if this player has a terrain bias then it calls that method
			local terrain = false;
			for row in GameInfo.StartBiasTerrains() do
				if(row.CivilizationType == civilizationType) then
					if( row.Tier == i) then
						terrain = true;
					end
				end
			end
			if(terrain == true) then
				IsInTier = true
				self:__StartBiasTerrainsMajor(playerIndex, i, minor);
			end

			--Check if this player has a river bias then it calls that method
			local river = false;
			for row in GameInfo.StartBiasRivers() do
				if(row.CivilizationType == civilizationType) then
					if( row.Tier == i) then
						river = true;
					end
				end
			end
			if(river == true) then
				IsInTier = true
				self:__StartBiasRiversMajor(playerIndex, i, minor);
			end
			
			for j = 1, max do
				if (IsInTier and j > i) or (not IsInTier) then
					
					local resource = false;
					for row in GameInfo.StartBiasResources() do
						if(row.CivilizationType == civilizationType) then
							if( row.Tier == j) then
								resource = true;
							end
						end
					end
					if(resource == true) then
						self:__StartBiasResourcesMajor(playerIndex, j, minor);
					end

					--Check if this player has a feature bias then it calls that method
					local feature = false;
					for row in GameInfo.StartBiasFeatures() do
						if(row.CivilizationType == civilizationType) then
							if( row.Tier == j) then
								feature = true;
							end
						end
					end
					if(feature == true) then
						self:__StartBiasFeaturesMajor(playerIndex, j, minor);
					end

					--Check if this player has a terrain bias then it calls that method
					local terrain = false;
					for row in GameInfo.StartBiasTerrains() do
						if(row.CivilizationType == civilizationType) then
							if( row.Tier == j) then
								terrain = true;
							end
						end
					end
					if(terrain == true) then
						self:__StartBiasTerrainsMajor(playerIndex, j, minor);
					end

					--Check if this player has a river bias then it calls that method
					local river = false;
					for row in GameInfo.StartBiasRivers() do
						if(row.CivilizationType == civilizationType) then
							if( row.Tier == j) then
								river = true;
							end
						end
					end
					if(river == true) then
						self:__StartBiasRiversMajor(playerIndex, j, minor);
					end
		
				end
			end
			
			------------ Saving everything in tables
			local playerId = self.majorList[playerIndex];
			local playerStart = self.playerStartsMajor[playerIndex];
			
			if (self.playerStartsMajor[playerIndex][1] ~= nil) then
				local pStartPlot = self.playerStartsMajor[playerIndex][1]
				for k, v in pairs(playerStart) do
					playerStart[k] = nil;
				end
				
				local iStartPlotIndex = pStartPlot:GetIndex();
				local iStartPlotX = pStartPlot:GetX()
				local iStartPlotY = pStartPlot:GetY()
				
				self.playerStartsMajor[playerIndex][1] = pStartPlot;
				
				for i, tPlayerStarts in pairs(self.playerStartsMajor) do
					local playerId = self.majorList[i];
					if i ~= playerIndex then
						for k, pPlot in ipairs(self.playerStartsMajor[i]) do
							local iPlotIndex = pPlot:GetIndex();
							local iPlotX = pPlot:GetX()
							local iPlotY = pPlot:GetY()
							if (iPlotIndex == iStartPlotIndex) or (iStartPlotX == iPlotX and iStartPlotY == iPlotY) then
								table.remove(self.playerStartsMajor[i], k);
							end
						end
					end
				end
				
				table.insert(self.majorStartPlots, pStartPlot);
				table.insert(playersCompleted, playerIndex);
				print("***** Player with ID: "..playerId.." Got a Starting Plot!! at: "..iStartPlotX..","..iStartPlotY)
				
			else
				print("No Plot found for Player with ID: ", playerId, ". Player will get assigned a random Plot.")
			end
		end	
	end

	-- Safety net for starting plots
	playerRestarts = {};
	local loop = 0;
	if (minor == false) then
		loop = self.iNumMajorCivs;
		
		for k, plot in ipairs(self.possibleMajorPlots) do
			table.insert(playerRestarts, plot);
		end

		for i = 1, self.iNumMajorCivs do
			local removed = false;
			for j, plot in ipairs(self.playerStartsMajor[i]) do --pairs
				for k, rePlot in ipairs(playerRestarts) do
					if (j == 1) and (plot:GetIndex() == rePlot:GetIndex() and removed == false) then
						table.remove(playerRestarts, k);
						removed = true;
					end
				end
			end
		end
	end

	
	for i = 1, loop do
		local bHasStart = false;

		local offset = minor and self.iNumMajorCivs or 0;

		for j, plot in ipairs(self.playerStartsMajor[i + offset]) do --pairs
			if (j == 1) and (plot ~= nil) then
				bHasStart = true;
			end
		end

		if(bHasStart == false) then
			local bNeedPlot = true;
			local index = -1;
			for j, plot in ipairs(playerRestarts) do
				if (plot ~= nil and bNeedPlot == true) then
					bNeedPlot = false;
					index = j;
				end
			end
			if(bNeedPlot == true) then
				--print("Start Bias Error");
			else
				table.insert(self.playerStartsMajor[i + offset], playerRestarts[index]);
				table.remove(playerRestarts, index);
			end
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasDistanceMajor(playerIndex)

	local playerId = minor and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
	local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
	local playerStart = self.playerStartsMajor[playerIndex];
	
	local tValidPlots = {};
	local numValidPlots = 0;
	
	for k, plot in pairs(playerStart) do
		local bMajorCivCheck = self:__MajorCivBuffer(plot, playerIndex); 
		if bMajorCivCheck then
			numValidPlots = numValidPlots + 1;
			table.insert(tValidPlots,  plot);
		end
	end
	
	--If more than 1 has this resource(s) within 3
	if(numValidPlots  > 1) then
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		for i, plot in ipairs(tValidPlots) do
			table.insert(playerStart, plot);
		end
	elseif (numValidPlots  == 1) then
		local startPlot = tValidPlots[1];
		
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		playerStart[1] = startPlot;
	end
end

------------------------------------------------------------------------------ 
function AssignStartingPlots:__MajorCivBuffer(plot, playerIndex)
	
	-- Checks to see if there are major civs in the given distance for this major civ
	local iMaxDistance = MapConfiguration.GetValue("StartDistanceMajorCivs") or (GlobalParameters.START_DISTANCE_MAJOR_CIVILIZATION - 2) or 10;
	
	local iSourceIndex = plot:GetIndex();
	local iPlayerPlotX = plot:GetX()
	local iPlayerPlotY = plot:GetY()
	
	for i, majorPlot in ipairs(self.majorStartPlots) do
		local iMajorPlotX = majorPlot:GetX()
		local iMajorPlotY = majorPlot:GetY()
		local Distance = Map.GetPlotDistance(iPlayerPlotX, iPlayerPlotY, iMajorPlotX, iMajorPlotY);
		--local Distance2 = self:__GetPlotDistance(plot, majorPlot)
		if (iSourceIndex == majorPlot:GetIndex() or (iPlayerPlotX == iMajorPlotX and iPlayerPlotY == iMajorPlotY)) then
			return false;
		elseif (Distance <= iMaxDistance) then
			return false;
		end
	end

	return true;
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasResourcesMajor(playerIndex, tier, minor, reroll)
	local playerId = minor and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
	local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
	local playerStart = self.playerStartsMajor[playerIndex];
	
	local numResource = 0;
	resources = {}
	local NumResReq = 2
	if reroll ~= nil and reroll == true then
		NumResReq = 1
	end
	
	local IsStrategic = false;
	-- Find the resouces in this tier
	for row in GameInfo.StartBiasResources() do
		if(row.CivilizationType == civilizationType) then
			if( row.Tier == tier) then
				table.insert(resources,  row.ResourceType);
				if row.ResourceType == "RESOURCE_HORSES" or row.ResourceType == "RESOURCE_IRON" or row.ResourceType == "RESOURCE_NITER" or row.ResourceType == "RESOURCE_COAL" or row.ResourceType == "RESOURCE_OIL" or row.ResourceType == "RESOURCE_ALUMINUM" or row.ResourceType == "RESOURCE_URANIUM" then
					IsStrategic = true;
				end
			end
		end
	end

	--Change the range if it is a minor civ
	local range = 2;
	if(minor == true) then
		range = 1;
	end

	resourcePlots = {};

	Resources = {};

	for row in GameInfo.Resources() do
		table.insert(Resources, row.ResourceType);
	end

	--Loop through all the starting plots
	for k, v in pairs(playerStart) do
		--Count the starting plots with the given resource(s) in this tier and add them to an array
		
		if(v ~= nil) then
			local plotX = v:GetX();
			local plotY = v:GetY();

			local hasResource = false;
			local numResourcesInRadius = 0;
			local numStrategicsInRadius = 1;
			--[[
			for dx = -range, range, 1 do
				for dy = -range,range, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(otherPlot:GetResourceCount() > 0) then
							for j, resource in ipairs(resources) do
								if(Resources[otherPlot:GetResourceType()+1] == resource) then
									--hasResource = true;
									numResourcesInRadius = numResourcesInRadius + 1
									if IsStrategic == true then
										if resource == "RESOURCE_HORSES" or resource == "RESOURCE_IRON" or resource == "RESOURCE_NITER" or resource == "RESOURCE_COAL" or resource == "RESOURCE_OIL" or resource == "RESOURCE_ALUMINUM" or resource == "RESOURCE_URANIUM" then
											numStrategicsInRadius = numStrategicsInRadius + 1
										end
									end
								end
							end
						end
					end
				end
			end
			]]--
			if numResourcesInRadius >= NumResReq and (IsStrategic == false) then
				hasResource = true;
			elseif numResourcesInRadius >= NumResReq and (IsStrategic == true) and numStrategicsInRadius >= NumResReq then
				hasResource = true;
			end

			if (hasResource == true) then
				numResource = numResource + 1;
				table.insert(resourcePlots, v);
			end
		end
	end 

	--If more than 1 has this resource(s) within 3
	if(numResource  > 1) then
		-- Remove all other starting plots from this civ's list.
		local resourceValue = table.fill(0, #resourcePlots);

		for i, resourcePlot in ipairs(resourcePlots) do
			local plotX = resourcePlot:GetX();
			local plotY = resourcePlot:GetY();
			
			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(resourcePlot:GetIndex() ~= otherPlot:GetIndex()) then
							if(otherPlot:GetResourceCount() > 0) then
								for j, resource in ipairs(resources) do
									if(Resources[otherPlot:GetResourceType()+1] == resource) then
										resourceValue[i] = resourceValue[i] + 1;
									end
									if IsStrategic == true then
										if resource == "RESOURCE_HORSES" or resource == "RESOURCE_IRON" or resource == "RESOURCE_NITER" or resource == "RESOURCE_COAL" or resource == "RESOURCE_OIL" or resource == "RESOURCE_ALUMINUM" or resource == "RESOURCE_URANIUM" then
											resourceValue[i] = resourceValue[i] + 1;
										end
									end
								end
							end
						end
					end
				end
			end
		end

		self.sortedArray = {};
		self:__SortByArray(resourcePlots, resourceValue);

		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		for i, resourcePlot in ipairs(self.sortedArray) do
			table.insert(playerStart, resourcePlot);
		end
		
	elseif (numResource  == 1) then
		local startPlot = resourcePlots[1];
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		playerStart[1] = startPlot;
	end
	
	if numResource == 0 and NumResReq == 2 then
		self:__StartBiasResourcesMajor(playerIndex, tier, false, true)
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasFeaturesMajor(playerIndex, tier, minor)
	local numFeature = 0;
	features = {}

	local playerId = minor and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
	local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
	local playerStart = self.playerStartsMajor[playerIndex];

	local IsGeothermalFissure = false;
	-- Find the features in this tier
	for row in GameInfo.StartBiasFeatures() do
		if(row.CivilizationType == civilizationType) then
			if( row.Tier == tier) then
				table.insert(features,  row.FeatureType);
				if row.FeatureType == "FEATURE_GEOTHERMAL_FISSURE" then
					IsGeothermalFissure = true;
				end
			end
		end
	end

	--Change the range if it is a minor civ
	local range = 3;
	if(minor == true) then
		range = 2;
	end

	featurePlots = {};

	Features = {};

	for row in GameInfo.Features() do
		table.insert(Features, row.FeatureType);
	end

	--Loop through all the starting plots
	for k, v in pairs(playerStart) do
		--Count the starting plots with the given feature(s) in this tier and add them to an array
		if(v ~= nil) then
			local plotX = v:GetX();
			local plotY = v:GetY();

			local hasFeature = false;
			local numFeaturesInRadius = 0;

			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(otherPlot:GetFeatureType() ~= g_FEATURE_NONE) then
							for j, feature in ipairs(features) do
								if(Features[otherPlot:GetFeatureType()+1] == feature) then
									numFeaturesInRadius = numFeaturesInRadius + 1
									--hasFeature = true;
								end
							end
						end
					end
				end
			end
			
			if numFeaturesInRadius > 3 then
				hasFeature = true;
			elseif IsGeothermalFissure and numFeaturesInRadius > 0 then
				hasFeature = true;
			end

			if (hasFeature == true) then
				numFeature = numFeature + 1;
				table.insert(featurePlots, v);
			end
		end
	end 
	
	--If more than 1 has this feature(s) within 3
	if(numFeature  > 1) then
		-- Remove all other starting plots from this civ’s list.
		local featureValue = table.fill(0, #featurePlots);

		for i, featurePlot in ipairs(featurePlots) do
			local plotX = featurePlot:GetX();
			local plotY = featurePlot:GetY();


			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(featurePlot:GetIndex() ~= otherPlot:GetIndex()) then
							if(otherPlot:GetFeatureType() ~= g_FEATURE_NONE) then
								for j, feature in ipairs(features) do
									if(Features[otherPlot:GetFeatureType()+1] == feature) then
										featureValue[i] = featureValue[i] + 1;
									end
								end
							end
						end
					end
				end
			end
		end

		self.sortedArray = {};
		self:__SortByArray(featurePlots, featureValue);

		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		for i, featurePlot in ipairs(self.sortedArray) do
			table.insert(playerStart, featurePlot);
		end
	elseif (numFeature  == 1) then
		local startPlot = featurePlots[1];
		-- Remove all other starting plots from this civ’s list.
		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		playerStart[1] = startPlot;
		
	end
	local PlotsLeft = #playerStart
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasTerrainsMajor(playerIndex, tier, minor)
	local numTerrain = 0;
	terrains = {}

	local playerId = minor and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
	local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
	local playerStart = self.playerStartsMajor[playerIndex];
	
	local IsCoast = false;
	local IsMountain = false;
	-- Find the terrains in this tier
	for row in GameInfo.StartBiasTerrains() do
		if(row.CivilizationType == civilizationType) then
			if( row.Tier == tier) then
				table.insert(terrains,  row.TerrainType);
				if row.TerrainType == "TERRAIN_COAST" then
					IsCoast = true;
				end
				for i in string.gmatch(row.TerrainType, "[^_]+") do
					if i == 'MOUNTAIN' then
						IsMountain = true;
					end
				end
			end
		end
	end

	--Change the range if it is a minor civ
	local range = 3;
	if(minor == true) then
		range = 2;
	end

	terrainPlots = {};

	Terrains = {};

	for row in GameInfo.Terrains() do
		table.insert(Terrains, row.TerrainType);
	end

	--Loop through all the starting plots
	for k, v in pairs(playerStart) do
		--Count the starting plots with the given terrain(s) in this tier and add them to an array
		if(v ~= nil) then
			local plotX = v:GetX();
			local plotY = v:GetY();

			local hasTerrain = false;
			local numTerrainsInRadius = 0

			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(v:GetIndex() ~= otherPlot:GetIndex()) then
							if(otherPlot:GetTerrainType() ~= g_TERRAIN_NONE) then
								for j, terrain in ipairs(terrains) do
									if (IsCoast == false) and (Terrains[otherPlot:GetTerrainType()+1] == terrain) then
										numTerrainsInRadius = numTerrainsInRadius + 1
										--hasTerrain = true;
									elseif (IsCoast == true) and (Terrains[otherPlot:GetTerrainType()+1] == terrain) and (otherPlot:IsLake() == false) and (v:IsCoastalLand() == true) then
										numTerrainsInRadius = numTerrainsInRadius + 1
									end
								end
							end
						end
					end
				end
			end
			local minReq = 4
			if tier == 1 then
				minReq = 8
			elseif tier == 2 then
				minReq = 7
			elseif tier == 3 then
				minReq = 6
			elseif tier == 4 then
				minReq = 5
			elseif tier == 5 then
				minReq = 4
			end
			if (IsMountain == true) then
				minReq = minReq - 2
			end
			if numTerrainsInRadius > minReq then
				hasTerrain = true;
			end
			
			if IsCoast then
				local adjacentCoast = 0;
				for direction = 0, DirectionTypes.NUM_DIRECTION_TYPES - 1, 1 do
					local adjacentPlot = Map.GetAdjacentPlot(v:GetX(), v:GetY(), direction);
					if (adjacentPlot ~= nil) then
						local terrainType = adjacentPlot:GetTerrainType();
						if(terrainType == g_TERRAIN_TYPE_COAST) then
							adjacentCoast = adjacentCoast + 1;
						end
					end
				end					
				if numTerrainsInRadius > 3 and adjacentCoast > 0 then
					hasTerrain = true;
				else
					hasTerrain = false;
				end
			end

			if (hasTerrain == true) then
				numTerrain = numTerrain + 1;
				table.insert(terrainPlots, v);
			end
		end
	end 

	--If more than 1 has this terrain(s) within 3
	if(numTerrain  > 1) then
		-- Remove all other starting plots from this civ’s list.
		local terrainValue = table.fill(0, #terrainPlots);

		for i, terrainPlot in ipairs(terrainPlots) do
			local plotX = terrainPlot:GetX();
			local plotY = terrainPlot:GetY();


			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(otherPlot:GetTerrainType() ~= g_TERRAIN_NONE) then
							for j, terrain in ipairs(terrains) do
								if(Terrains[otherPlot:GetTerrainType()+1] == terrain) then
									terrainValue[i] = terrainValue[i] + 1;
								end
								if(Terrains[terrainPlot:GetTerrainType()+1] == terrain) then
									terrainValue[i] = terrainValue[i] + 1;
								end
							end
						end
					end
				end
			end
		end

		self.sortedArray = {};
		self:__SortByArray(terrainPlots, terrainValue);

		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		for i, terrainPlot in ipairs(self.sortedArray) do
			table.insert(playerStart, terrainPlot);
		end
	elseif (numTerrain  == 1) then
		local startPlot = terrainPlots[1];
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		playerStart[1] = startPlot;
	end
	local PlotsLeft = #playerStart
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasRiversMajor(playerIndex, tier, minor)
	local numRiver = 0;

	--The range is 1 in the beginning
	local range = 1;

	riverPlots = {};

	local playerId = minor and self.minorList[playerIndex - self.iNumMajorCivs] or self.majorList[playerIndex];
	local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
	local playerStart = self.playerStartsMajor[playerIndex];

	--Loop through all the starting plots
	for k, v in pairs(playerStart) do
		--Count the starting plots with the given river(s) in this tier and add them to an array
		if(v ~= nil) then
			local plotX = v:GetX();
			local plotY = v:GetY();

			local hasRiver = false;
			local numRiversRadius = 0;

			for dx = -range, range - 1, 1 do
				for dy = -range,range -1, 1 do
					local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
					if(otherPlot) then
						if(otherPlot:IsRiver()) then
							hasRiver = true;
						end
					end
				end
			end

			if (hasRiver == true) then
				numRiver = numRiver + 1;
				table.insert(riverPlots, v);
			end
		end
	end 
	
	--If more than 1 has this river(s) within 3
	if(numRiver  > 1) then
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			playerStart[k] = nil;
		end
		for i, riverPlot in ipairs(riverPlots) do
			table.insert(playerStart, riverPlot);
		end
	elseif (numRiver  == 1) then
		local startPlot = riverPlots[1];
		-- Remove all other starting plots from this civ's list.
		for k, v in pairs(playerStart) do
			if(startPlot:GetIndex() == v:GetIndex()) then
				playerStart[k] = startPlot;
			else
				playerStart[k] = nil;
			end
		end
	elseif(minor == false) then
		--Change the range if no rivers within 3 and major
		local numRiver = 0;
		local range = 3;
		riverPlots = {};
		--Loop through all the starting plots
		for k, v in pairs(playerStart) do
			--Count the starting plots with the given river(s) in this tier and add them to an array
			if(v ~= nil) then
				local plotX = v:GetX();
				local plotY = v:GetY();

				local hasRiver = false;
				local numRiversRadius = 0;

				for dx = -range, range - 1, 1 do
					for dy = -range,range -1, 1 do
						local otherPlot = Map.GetPlotXY(plotX, plotY, dx, dy, range);
						if(otherPlot) then
							if(otherPlot:IsRiver()) then
								--hasRiver = true;
								numRiversRadius = numRiversRadius + 1
							end
						end
					end
				end
				
				if numRiversRadius > 2 then
					hasRiver = true;
				end

				if (hasRiver == true) then
					numRiver = numRiver + 1;
					table.insert(riverPlots, v);
				end
			end
		end 
		
		if(numRiver  > 1) then
			-- Remove all other starting plots from this civ's list.
			for k, v in pairs(playerStart) do
				playerStart[k] = nil;
			end
			for i, riverPlot in ipairs(riverPlots) do
				table.insert(playerStart, riverPlot);
			end
		elseif (numRiver  == 1) then
			local startPlot = riverPlots[1];
			-- Remove all other starting plots from this civ's list.
			for k, v in pairs(playerStart) do
				playerStart[k] = nil;
			end
			playerStart[1] = startPlot;
		end
	end
	local PlotsLeft = #playerStart
end

------------------------------------------------------------------------------
function AssignStartingPlots:__StartBiasPlotRemovalMajor(startPlot, minor, playerIndex)
	
	if(startPlot == nil) then
		print("Nil1 Starting Plot");
	end
 
	local start = 1;
	local finish = self.iNumMajorCivs; 

	if (minor == true) then
		start = self.iNumMajorCivs + 1;
		finish = self.iNumMajorCivs + self.iNumMinorCivs;
	end

	for i = start, finish do
		if(i ~= playerIndex) then
			local plotID  = -1;

			for k, v in pairs(self.playerStartsMajor[i]) do
				if(v~= nil and v:GetIndex() == startPlot:GetIndex()) then
					plotID = k;
				end
			end

			--If only one left remove it. And remove it from others...
			if(plotID > -1) then
				if(self:__ArraySize(self.playerStartsMajor, i) == 1) then
					--print("Deleting the last entry will have bad results. Minor is ", minor);
				end

				self.playerStartsMajor[i][plotID] = nil;

				if(self:__ArraySize(self.playerStartsMajor, i) == 1) then
					local hasPlot = false;
					for k, v in pairs(self.playerStartsMajor[i]) do
						if(v~= nil and hasPlot == false) then
							hasPlot = true;
							--Call Removal
							self:__StartBiasPlotRemovalMajor(v, minor, i)
						end
					end
				end
			end
		end
	end
end

------------------------------------------------------------------------------
function AssignStartingPlots:__GetPlotDistance(pPlot1, pPlot2)
    local X1,Y1 = pPlot1:GetX(), pPlot1:GetY()
    local X2,Y2 = pPlot2:GetX(), pPlot2:GetY()
	if Map:IsWrapX() then
		local HalfMapWidth = (self.g_iW / 2)
		if X2 > X1 then 
			if X2 >= HalfMapWidth and X1 < HalfMapWidth then
				if X1 < HalfMapWidth then
					local X11, X22 = X1,X2
					X3 = math.abs(self.g_iW - X2)
					X1 = 0
					X2 = X3 + X11
					if not (Y2 % 2 == 0) and (Y1 % 2 == 0) then
						X2 = X2 - 1
					elseif not (Y1 % 2 == 0) and (Y2 % 2 == 0) then
						X2 = X2 + 1
					end
					if (X22-X11) <= X2 then
						X2 = X22-X11
					end
				end
			end
		elseif X2 < X1 then
			if X1 >= HalfMapWidth and X2 < HalfMapWidth then
				if X2 < HalfMapWidth then
					local X11, X22 = X1,X2
					X3 = math.abs(X1 - self.g_iW )
					X1 = 0
					X2 = X22 + X3
					if (X11-X22) <= X2 then
						X2 = X11-X22
						if not (Y2 % 2 == 0) then
							X2 = X2 - 1
						end
						if not (Y1 % 2 == 0) then
							X2 = X2 + 1
						end
					end
				end
			end
		end
	else
		--print("Map Is Not WraparoundX")
	end
	
	distance = math.max(
		 math.abs(Y2 - Y1),     
		 math.abs(math.ceil(Y1 / -2) + X1 - math.ceil(Y2 / -2) - X2),
		 math.abs(-Y1 - math.ceil(Y1 / -2) - X1 + Y2  + math.ceil(Y2 / -2) + X2)
	)
	return math.floor(distance)
end

---------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------
-- reworked Function from AOM's Team Start Locations
------------------------------------------------------------------------------

function AssignStartingPlots:__SortPlayersByStartBiases(players)
	
	--local teamValues =  table.fill(0, #players);
	local allPlayers = {};
	for j, playerIndex in ipairs(players) do
		local playerIndex = playerIndex + 1
		local player = Players[self.majorList[playerIndex]];
		if (player~=nil) then
			local playerId = self.majorList[playerIndex];
			row = {};
			row.playerIndex = playerIndex;
			local val = 0;
			local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
			local iPlayerStartBiasValue = 0
			
			local bIsTierChecked = false;
			for row in GameInfo.StartBiasResources() do
				if(row.CivilizationType == civilizationType) and (bIsTierChecked == false) then
					bIsTierChecked = true;
					iPlayerStartBiasValue = iPlayerStartBiasValue + (5 / row.Tier)
				end
			end
			local bIsTierChecked = false;
			for row in GameInfo.StartBiasFeatures() do
				if(row.CivilizationType == civilizationType) and (bIsTierChecked == false) then
					bIsTierChecked = true;
					iPlayerStartBiasValue = iPlayerStartBiasValue + (5 / row.Tier)
				end
			end
			local bIsTierChecked = false;
			for row in GameInfo.StartBiasFeatures() do
				if(row.CivilizationType == civilizationType) and (bIsTierChecked == false) then
					if row.FeatureType == "FEATURE_GEOTHERMAL_FISSURE" then
						bIsTierChecked = true;
						iPlayerStartBiasValue = iPlayerStartBiasValue + 1
					end
				end
			end
			local bIsTierChecked = false;
			for row in GameInfo.StartBiasTerrains() do
				if(row.CivilizationType == civilizationType) and (bIsTierChecked == false) then
					bIsTierChecked = true;
					iPlayerStartBiasValue = iPlayerStartBiasValue + (5 / row.Tier)
				end
			end
			local bIsTierChecked = false;
			for row in GameInfo.StartBiasTerrains() do
				if(row.CivilizationType == civilizationType) and (bIsTierChecked == false) then
					for i in string.gmatch(row.TerrainType, "[^_]+") do
						if i == 'DESERT' then
							bIsTierChecked = true;
							iPlayerStartBiasValue = iPlayerStartBiasValue + 2.8
						elseif i == 'TUNDRA' or i == 'SNOW' then
							bIsTierChecked = true;
							iPlayerStartBiasValue = iPlayerStartBiasValue + 3
						elseif i == 'COAST' then
							bIsTierChecked = true;
							iPlayerStartBiasValue = iPlayerStartBiasValue + 2
						end
					end
				end
			end
			local bIsTierChecked = false;
			for row in GameInfo.StartBiasRivers() do
				if(row.CivilizationType == civilizationType) and (bIsTierChecked == false) then
					bIsTierChecked = true;
					iPlayerStartBiasValue = iPlayerStartBiasValue + (5 / row.Tier)
				end
			end
			
			print("-----------------------------")
			print(" - - - Player Id: ", playerId, " - and CivilizationType: ", civilizationType)

			--Players start with 10 points
			val = 10;
			-- Human Player is always first
			if playerId == 0 then
				val = val + 100
			end
			print("0000: ", val, 100)
			--sort individual Players based on Start Bias Value
			val = val + iPlayerStartBiasValue*2;
			print("1111: ", val, (iPlayerStartBiasValue*2))
			
			if (val < 1) then
				val = 1;
			end
			
			--teamValues[j] = val;
			row.Value = val;
			table.insert(allPlayers,row);
		end
	end
	
	local Players ={};
	table.sort (allPlayers, function(a, b) return a.Value > b.Value; end);
	for j, player in ipairs(allPlayers) do
		if player ~= nil then
			local playerIndex = player.playerIndex
			local value = player.Value
			local playerId = self.majorList[playerIndex];
			--local player = Players[playerId];
			local civilizationType = PlayerConfigurations[playerId]:GetCivilizationTypeName()
			print("Player with Id: ", playerId, " and Civ: ", civilizationType, ", has Value: ", value)
			table.insert(Players,playerIndex);
		end
	end
	
	return Players;
end

------------------------------------------------------------------------------
---YnAMP Team Start Locations
------------------------------------------------------------------------------

function GetPlotFertility(plot)
	-- Calculate the fertility of the starting plot
	local iRange = 3;
	local pPlot = plot;
	local plotX = pPlot:GetX();
	local plotY = pPlot:GetY();

	local gridWidth, gridHeight = Map.GetGridSize();
	local gridHeightMinus1 = gridHeight - 1;

	local iFertility = 0;
	
	--Rivers are awesome to start next to
	local terrainType = pPlot:GetTerrainType();
	if(pPlot:IsFreshWater() == true and terrainType ~= g_TERRAIN_TYPE_SNOW and terrainType ~= g_TERRAIN_TYPE_SNOW_HILLS and pPlot:IsImpassable() ~= true) then
		iFertility = iFertility + 50;
		if pPlot:IsRiver() == true then
			iFertility = iFertility + 50
		end
	end	
	
	for dx = -iRange, iRange do
		for dy = -iRange,iRange do
			local otherPlot = Map.GetPlotXYWithRangeCheck(plotX, plotY, dx, dy, iRange);

			-- Valid plot?  Also, skip plots along the top and bottom edge
			if(otherPlot) then
				local otherPlotY = otherPlot:GetY();
				if(otherPlotY > 0 and otherPlotY < gridHeightMinus1) then

					terrainType = otherPlot:GetTerrainType();
					featureType = otherPlot:GetFeatureType();

					-- Subtract one if there is snow and no resource. Do not count water plots unless there is a resource
					if((terrainType == g_TERRAIN_TYPE_SNOW or terrainType == g_TERRAIN_TYPE_SNOW_HILLS or terrainType == g_TERRAIN_TYPE_SNOW_MOUNTAIN) and otherPlot:GetResourceCount() == 0) then
						iFertility = iFertility - 10;
					elseif(featureType == g_FEATURE_ICE) then
						iFertility = iFertility - 20;
					elseif((otherPlot:IsWater() == false) or otherPlot:GetResourceCount() > 0) then
						iFertility = iFertility + (otherPlot:GetYield(g_YIELD_PRODUCTION)*3)
						iFertility = iFertility + (otherPlot:GetYield(g_YIELD_FOOD)*5)
					end
				
					-- Lower the Fertility if the plot is impassable
					if(iFertility > 5 and otherPlot:IsImpassable() == true) then
						iFertility = iFertility - 5;
					end

					-- Lower the Fertility if the plot has Features
					if(featureType ~= g_FEATURE_NONE) then
						iFertility = iFertility - 2
					end	

				else
					iFertility = iFertility - 20;
				end
			else
				iFertility = iFertility - 20;
			end
		end
	end 

	return iFertility;
end

function GetCustomStartingPlots()

	local potentialPlots 	= {}
	local g_iW, g_iH = Map.GetGridSize()

	for iX = 0, g_iW - 1 do
		for iY = 0, g_iH - 1 do
			local index = (iY * g_iW) + iX;
			pPlot = Map.GetPlotByIndex(index)
			if (pPlot:IsImpassable() == false) and (pPlot:IsWater() == false) then
				local fertility = GetPlotFertility(pPlot)
				table.insert(potentialPlots, { Plot = pPlot, Fertility = fertility} )
			end
		end
	end
	print("GetCustomStartingPlots returns "..tostring(#potentialPlots).." plots")
	
	table.sort (potentialPlots, function(a, b) return a.Fertility > b.Fertility; end);
	return potentialPlots
end
