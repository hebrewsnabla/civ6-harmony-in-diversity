GameEvents = ExposedMembers.GameEvents;
Utils = ExposedMembers.DLHD.Utils;

local MAGNUS_HASH = GameInfo.Governors['GOVERNOR_THE_RESOURCE_MANAGER'].Hash;
local VERTICAL_INTEGRATION_HASH = GameInfo.GovernorPromotions['GOVERNOR_PROMOTION_RESOURCE_MANAGER_VERTICAL_INTEGRATION'].Hash;
local CITY_CENTER_INDEX = GameInfo.Districts['DISTRICT_CITY_CENTER'].Index;
local NEIGHBORHOOD_INDEX = GameInfo.Districts['DISTRICT_NEIGHBORHOOD'].Index;
local MBANZA_INDEX = GameInfo.Districts['DISTRICT_MBANZA'].Index;
function RefreshRegionalYield (playerId)
	local player = Players[playerId];

	-- Initialize
	local cityCanRecieve = {};
	local cityCanGive = {};
	for _, city in player:GetCities():Members() do
		cityCanRecieve[city:GetID()] = {};
		cityCanGive[city:GetID()] = {};
	end

	-- Get building range info
	local buildingRange = {};
	for row in GameInfo.HD_BuildingRegionalRange() do
		local buildingInfo = GameInfo.Buildings[row.BuildingType];
		buildingRange[buildingInfo.Index] = {
			regionalRange = row.RegionalRange,
			buildingType = row.BuildingType,
			prereqDistrict = row.PrereqDistrict
		};
	end
	-- Get Magnus Location
	local magnusCity;
	local governors = player:GetGovernors();
    local governor = governors:GetGovernor(MAGNUS_HASH);
	if governor ~= nil and governor:HasPromotion(VERTICAL_INTEGRATION_HASH) and governor:IsEstablished() then
		magnusCity = governor:GetAssignedCity():GetID();
	end

	-- Policy Cards
	for row in GameInfo.HD_PolicyRegionalRange() do

	end

	-- todo: policy card & great engineer

	-- Check if city can recieve / give (to Magnus) bonus
	for _, city in player:GetCities():Members() do
		for index, info in pairs(buildingRange) do
			if city:GetBuildings():HasBuilding(index) and (not city:GetBuildings():IsPillaged(index)) then
				local location = Map.GetPlotByIndex(Utils.GetBuildingLocation(playerId, city:GetID(), index));
				local regionalRange = info.regionalRange;
				-- todo: forging iron
				for _, targetCity in player:GetCities():Members() do
					local inRange = false;
					for _, district in targetCity:GetDistricts():Members() do
						if (district:GetType() == CITY_CENTER_INDEX) or (district:GetType() == NEIGHBORHOOD_INDEX) or (district:GetType() == MBANZA_INDEX) then
							local targetLocation = district:GetLocation();
							local distance = Map.GetPlotDistance(location:GetX(), location:GetY(), targetLocation.x, targetLocation.y);
							if distance <= regionalRange then
								inRange = true;
								break;
							end
						end
					end
					if inRange then
						if (not targetCity:GetBuildings():HasBuilding(index)) or city:GetBuildings():IsPillaged(index) then
							cityCanRecieve[targetCity:GetID()][index] = 1;
						end
						if (magnusCity ~= nil) and (targetCity:GetID() == magnusCity) then
							cityCanGive[city:GetID()][index] = 1;
						end
					end
				end
			end
		end
	end

	-- Set Property
	for _, city in player:GetCities():Members() do
		for index, info in pairs(buildingRange) do
			local location = city:GetLocation();
			GameEvents.SetPlotPropertySwitch.Call(location.x, location.y, 'CITY_CAN_RECIEVE_' .. info.buildingType .. '_REGIONAL_BONUS', cityCanRecieve[city:GetID()][index] or 0);
			GameEvents.SetPlotPropertySwitch.Call(location.x, location.y, 'CITY_CAN_GIVE_' .. info.buildingType .. '_REGIONAL_BONUS_TO_MAGNUS', cityCanGive[city:GetID()][index] or 0);
		end
	end
end

function Initialize ()
	Events.BuildingAddedToMap.Add(function (x, y, buildingId, playerId, misc2, misc3)
		RefreshRegionalYield(playerId);
	end);
	GameEvents.BuildingPillageStateChanged.Add(function (playerId, cityId, buildingId, pillageState)
		RefreshRegionalYield(playerId);
	end);
	Events.DistrictAddedToMap.Add(function (playerId, districtId, cityId, x, y, districtType, percentComplete)
		RefreshRegionalYield(playerId);
	end);
	Events.DistrictRemovedFromMap.Add(function (playerId, districtId, cityId, x, y, districtType)
		RefreshRegionalYield(playerId);
	end);
	Events.CityAddedToMap.Add(function (playerId, cityId, x, y)
		RefreshRegionalYield(playerId);
	end);
	Events.GovernorEstablished.Add(function (cityOwner, cityId, governorOwner, governorId)
		RefreshRegionalYield(governorOwner);
	end);
	Events.GovernorPromoted.Add(function (playerId, governorId, promotionId)
		RefreshRegionalYield(playerId);
	end);
	Events.GovernorChanged.Add(function (playerId, governorId)
		RefreshRegionalYield(playerId);
	end);
	GameEvents.PolicyChanged.Add(function (playerId, policyId, enacted)
		RefreshRegionalYield(playerId);
	end);
end

Initialize();