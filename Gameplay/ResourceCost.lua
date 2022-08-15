local FREIGHT_INDEX = GameInfo.Buildings['BUILDING_CITY_POLICY_FREIGHT'].Index;
local FORGING_IRON_INDEX = GameInfo.Buildings['BUILDING_CITY_POLICY_FORGING_IRON'].Index;
local JIMI_INDEX = GameInfo.Buildings['BUILDING_CITY_POLICY_JIMI'].Index;
local EMPORIUM_INDEX;
if GameInfo.Buildings['BUILDING_JNR_WAYSTATION'] ~= nil then
	EMPORIUM_INDEX = GameInfo.Buildings['BUILDING_JNR_WAYSTATION'].Index;
end
function GetResourceCost (playerId)
	local player = Players[playerId];
	local costs = {};
	for row in GameInfo.Resources() do
		if row.ResourceClassType == 'RESOURCECLASS_STRATEGIC' then
			local sum = 0;
			for _, city in player:GetCities():Members() do
				local buildings = city:GetBuildings();
				if (row.ResourceType == 'RESOURCE_HORSES' or row.ResourceType == 'RESOURCE_IRON') and (buildings:HasBuilding(JIMI_INDEX)) then
					sum = sum + 1;
				end
				if (row.ResourceType == 'RESOURCE_HORSES') and (buildings:HasBuilding(FREIGHT_INDEX)) then
					local freight = ExposedMembers.DLHD.Utils.GetFreightAmount(playerId, city:GetID()) or 0;
					if (EMPORIUM_INDEX ~= nil) and (buildings:HasBuilding(EMPORIUM_INDEX)) then
						sum = sum + freight * 3;
					else
						sum = sum + freight * 2;
					end
				end
				if (row.ResourceType == 'RESOURCE_IRON') and (buildings:HasBuilding(FORGING_IRON_INDEX)) then
					for row in GameInfo.HD_BuildingRegionalRange() do
						local info = GameInfo.Buildings[row.BuildingType];
						if (buildings:HasBuilding(info.Index)) and (info.PrereqDistrict == 'DISTRICT_INDUSTRIAL_ZONE' or info.PrereqDistrict == 'DISTRICT_COMMERCIAL_HUB') then
							sum = sum + row.RegionalRange;
						end
					end
				end
			end
			table.insert(costs, {
				id = row.Index,
				type = row.ResourceType,
				cost = sum
			});
			print(row.ResourceType .. ': ' .. sum);
		end
	end
	return costs;
end

local ENOUGH_RESOURCE_KEY = 'PLAYER_HAS_ENOUGH_';
function RefreshResourceCost (playerId, doReduce)
	local player = Players[playerId];
	if not player:IsMajor() then
		return;
	end
	local cost = GetResourceCost(playerId);
	for _, v in ipairs(cost) do
		local amount = player:GetResources():GetResourceAmount(v.id);
		if amount >= v.cost then
			player:SetProperty(ENOUGH_RESOURCE_KEY .. v.type, 1);
		else
			player:SetProperty(ENOUGH_RESOURCE_KEY .. v.type, 0);
		end
		for _, city in player:GetCities():Members() do
			local location = city:GetLocation();
			local cityPlot = Map.GetPlot(location.x, location.y);
			if amount >= v.cost then
				cityPlot:SetProperty(ENOUGH_RESOURCE_KEY .. v.type, 1);
			else
				cityPlot:SetProperty(ENOUGH_RESOURCE_KEY .. v.type, 0);
			end
		end
		if doReduce and (amount >= v.cost) and (v.cost > 0) then
			player:GetResources():ChangeResourceAmount(v.id, -v.cost);
		end
	end
	RefreshRegionalYield();
end

local sync = false;
function SyncRefreshResourceCost (playerId, doReduce)
	if sync then
		return;
	end
	sync = true;
	local error, msg = pcall(RefreshResourceCost, playerId, doReduce);
	if not error then
		print(msg);
	end
	sync = false;
end

function Initialize ()
	Events.PlayerResourceChanged.Add(function (playerId, resourceTypeId)
		SyncRefreshResourceCost(playerId, false);
	end);
	Events.BuildingAddedToMap.Add(function (x, y, buildingId, playerId, unknown1, unknown2)
		SyncRefreshResourceCost(playerId, false);
	end);
	GameEvents.PlayerTurnStartComplete.Add(function (playerId)
		SyncRefreshResourceCost(playerId, false);
	end);
	GameEvents.PlayerTurnStarted.Add(function (playerId)
		SyncRefreshResourceCost(playerId, true);
	end);
end
Initialize();