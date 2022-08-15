
if ExposedMembers.DLHD == nil then
    ExposedMembers.DLHD = {}
end

Utils = ExposedMembers.DLHD.Utils

function CityHasDistrict(city, DistrictType)
    local district_index = Utils.GetDistrictIndex(DistrictType)
    if city:GetDistricts():HasDistrict(district_index) then return true end
    
    for row in GameInfo.DistrictReplaces() do
        if row.ReplacesDistrictType == DistrictType then
            district_index = Utils.GetDistrictIndex(row.CivUniqueDistrictType)
            if city:GetDistricts():HasDistrict(district_index) then
                return true
            end
        end
    end
end

function PlayerHasWonder (player, wonderId)
    if player == nil then return false; end
    for _, city in player:GetCities():Members() do
        if city:GetBuildings():HasBuilding(wonderId) then
            return true;
        end
    end
    return false;
end
Utils.PlayerHasWonder = PlayerHasWonder;

function PotalaPalaceIncreaseFaithAmount( playerID, cityID, buildingID, plotID, bOriginalConstruction)
    local m_Potala_table = GameInfo.Buildings['BUILDING_POTALA_PALACE']
    if  (m_Potala_table ~= nil) then
        local m_Potala = m_Potala_table.Index
        if playerID >= 0 and buildingID == m_Potala then 
            local player = Players[playerID] 
            if not player:IsBarbarian() then
                local amount = player:GetReligion():GetFaithBalance()
                player:GetReligion():ChangeFaithBalance(amount * 0.5)
            end
        end
    end
end

GameEvents.BuildingConstructed.Add(PotalaPalaceIncreaseFaithAmount)

-- 郑王庙: 招募伟人返还原始点数20%的信仰，每招募一名伟人+2影响力。
local WAT_ARUN = GameInfo.Buildings['BUILDING_SUK_WAT_ARUN'];
function UnitGreatPersonCreatedWatArun(playerId, unitId, greatPersonClassId, greatPersonIndividualId)
	local player = Players[playerId];
    player:AttachModifierByID('WAT_ARUN_INFLUNCE');
    if PlayerHasWonder (player, WAT_ARUN.Index) then
        local greatPerson = GameInfo.GreatPersonIndividuals[greatPersonIndividualId];
        local era = GameInfo.Eras[greatPerson.EraType];
        local cost = era.GreatPersonBaseCost;
        local percent = (GlobalParameters.WAT_ARUN_FAITH_PERCENTAGE or 0) / 100;
        player:GetReligion():ChangeFaithBalance(cost * percent);
    end
end

if WAT_ARUN ~= nil then
    Events.UnitGreatPersonCreated.Add(UnitGreatPersonCreatedWatArun);
end

-- 黄鹤楼: 使用大作家返还30%当前需要大作家的点数
function OnYellowCraneGreatWriterActived(playerID, unitID, greatpersonclassID)
    local pPlayer = Players[playerID];
    local pUnit = pPlayer:GetUnits():FindID(unitID);
    local iYellowCrane = GameInfo.Buildings["BUILDING_YELLOW_CRANE_HD"].Index;
    local tGreatpersonClass = GameInfo.GreatPersonClasses[greatpersonclassID].GreatPersonClassType; 
    if (pPlayer ~= nil) then
      local bHasYC = false;
      for i, pCity in pPlayer:GetCities():Members() do
        if (pCity:GetBuildings():HasBuilding(iYellowCrane)) then
          bHasYC = true;
          break;
        end
      end
      if (bHasYC) then
        if (tGreatpersonClass == "GREAT_PERSON_CLASS_WRITER") then
          local iGreatWriter = GameInfo.GreatPersonClasses["GREAT_PERSON_CLASS_WRITER"].Index;
          -- local nGPPTotal = pPlayer:GetGreatPeoplePoints():GetPointsTotal(iGreatWriter);
          -- local nGPPGained = nGPPTotal * 0.3;
          local timeline = Game.GetGreatPeople():GetTimeline();
          local cost = 0;
          for i, entry in ipairs(timeline) do
			if entry.Class == iGreatWriter then
            	cost = entry.Cost;
            end
          end
          local nGPPGained = cost * GlobalParameters.YELLOW_CRANE_TOWER_POINT_PERCENTAGE / 100;
          pPlayer:GetGreatPeoplePoints():ChangePointsTotal(greatpersonclassID, nGPPGained);
          local sGPPNotifier = tostring(nGPPGained)..Locale.Lookup("LOC_NOTIFIER_GREATWRITER_YELLOWCRANE_GPP");
          NotificationManager.SendNotification(playerID, "NOTIFICATION_RELIC_CREATED", sGPPNotifier);
        end
      end
    end
  end
  
  Events.UnitGreatPersonActivated.Add(OnYellowCraneGreatWriterActived);

-- local PROP_KEY_HAS_PLAYER_TURN_ACTIVATED = 'DLHasPlayerTurnActivated'
-- local PROP_KEY_HAS_ALHAMBRA_GRANTED = 'DLHasAlhambraGranted'
-- local PROP_KEY_HAS_BIG_BEN_GRANTED = 'DLHasBigBenGranted'
-- local PROP_KEY_HAS_POTALA_PALACE_GRANTED = 'DLHasPotalaPalaceGranted'
-- local PROP_KEY_HAS_FORBIDDEN_CITY_GRANTED = 'DLHasForbiddenCityGranted'
-- local m_AlhambraID = GameInfo.Buildings['BUILDING_ALHAMBRA'].Index
-- local m_BigBenID = GameInfo.Buildings['BUILDING_BIG_BEN'].Index
-- local m_PotalaPalaceID = GameInfo.Buildings['BUILDING_POTALA_PALACE'].Index
-- local m_ForbiddenCityID = GameInfo.Buildings['BUILDING_FORBIDDEN_CITY'].Index

-- function GrantGovermentSlotFromBuilding(player, buildingID)
--     if buildingID == m_AlhambraID then
--         player:AttachModifierByID('ALHAMBRA_MILITARY_GOVERNMENT_SLOT')
--         player:SetProperty(PROP_KEY_HAS_ALHAMBRA_GRANTED, true)
--     end
--     if buildingID == m_BigBenID then
--         player:AttachModifierByID('BIG_BEN_ECONOMIC_GOVERNMENT_SLOT')
--         player:SetProperty(PROP_KEY_HAS_BIG_BEN_GRANTED, true)
--     end
--     if buildingID == m_PotalaPalaceID then
--         player:AttachModifierByID('POTALA_PALACE_DIPLOMATIC_GOVERNMENT_SLOT')
--         player:SetProperty(PROP_KEY_HAS_POTALA_PALACE_GRANTED, true)
--     end
--     if buildingID == m_ForbiddenCityID then
--         player:AttachModifierByID('FORBIDDEN_CITY_WILDCARD_GOVERNMENT_SLOT')
--         player:SetProperty(PROP_KEY_HAS_FORBIDDEN_CITY_GRANTED, true)
--     end
-- end

-- function OnBuildingConstructed(playerID, cityID, buildingID, plotID, bOriginalConstruction)
--     local player = Players[playerID]
--     if player:GetProperty(PROP_KEY_HAS_PLAYER_TURN_ACTIVATED) then
--         GrantGovermentSlotFromBuilding(player, buildingID)
--     end
-- end

-- function OnPlayerTurnActivated(playerID, bIsFirstTime)
--     -- print('PlayerTurnActivated', playerID)
--     local player = Players[playerID]
--     player:SetProperty(PROP_KEY_HAS_PLAYER_TURN_ACTIVATED, true)

--     if not player:GetProperty(PROP_KEY_HAS_ALHAMBRA_GRANTED) then
--         if Utils.HasBuildingWithinCountry(playerID, m_AlhambraID) then
--             GrantGovermentSlotFromBuilding(player, m_AlhambraID)
--         end
--     end
--     if not player:GetProperty(PROP_KEY_HAS_BIG_BEN_GRANTED) then
--         if Utils.HasBuildingWithinCountry(playerID, m_BigBenID) then
--             GrantGovermentSlotFromBuilding(player, m_BigBenID)
--         end
--     end
--     if not player:GetProperty(PROP_KEY_HAS_POTALA_PALACE_GRANTED) then
--         if Utils.HasBuildingWithinCountry(playerID, m_PotalaPalaceID) then
--             GrantGovermentSlotFromBuilding(player, m_PotalaPalaceID)
--         end
--     end
--     if not player:GetProperty(PROP_KEY_HAS_FORBIDDEN_CITY_GRANTED) then
--         if Utils.HasBuildingWithinCountry(playerID, m_ForbiddenCityID) then
--             GrantGovermentSlotFromBuilding(player, m_ForbiddenCityID)
--         end
--     end
-- end

-- function OnPlayerTurnDeactivated(playerID)
--     -- print('OnPlayerTurnDeactivated', playerID)
--     local player = Players[playerID]
--     player:SetProperty(PROP_KEY_HAS_PLAYER_TURN_ACTIVATED, false)
-- end

-- GameEvents.BuildingConstructed.Add(OnBuildingConstructed)
-- Events.PlayerTurnActivated.Add(OnPlayerTurnActivated)
-- Events.PlayerTurnDeactivated.Add(OnPlayerTurnDeactivated)

