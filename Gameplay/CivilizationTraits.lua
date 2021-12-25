----CivilizationandLeaderHasTrait
function CivilizationHasTrait(sCiv, sTrait)
	for tRow in GameInfo.CivilizationTraits() do
		if (tRow.CivilizationType == sCiv and tRow.TraitType == sTrait) then
			return true
		end
	end
	return false
end

function LeaderHasTrait(sLeader, sTrait)
	for tRow in GameInfo.LeaderTraits() do
		if (tRow.LeaderType == sLeader and tRow.TraitType == sTrait) then return true end
	end
	return false
end

-- 老秦
function ChinaBuilderScience(playerID, unitID, newCharges, oldCharges)
	-- print(playerID, unitID, newCharges, oldCharges)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local amount = 6
	local sWisdonOfWorkingPeople = 'TRAIT_CIVILIZATION_DYNASTIC_CYCLE'
	if player:IsTurnActive() and CivilizationHasTrait(sCiv, sWisdonOfWorkingPeople) and (newCharges + 1 == oldCharges) then
		local unit = player:GetUnits():FindID(unitID)
		if unit ~= nil then
			-- print(unit:GetOwner(), unit:GetType(), unit:GetX(), unit:GetY())
			if unit:GetType() == GameInfo.Units['UNIT_BUILDER'].Index then
				player:GetTechs():ChangeCurrentResearchProgress(amount)
				if newCharges > 0 then
					-- 次数到0后会找不到单位(-9999, -9999)的原位置，无法显示浮动文本。
					local message = '[COLOR:ResScienceLabelCS]+' .. tostring(amount) .. '[ENDCOLOR][ICON_Science]'
					Game.AddWorldViewText(0, message, unit:GetX(), unit:GetY())
				end
			end
		end
	end
end

Events.UnitChargesChanged.Add(ChinaBuilderScience)

--Phoenicia Trigger Foreign Trade Boost
function DidoOnPlayerTurnActivated(playerID:number, bFirstTimeThisTurn:boolean)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local sMediterraneanColonies = 'TRAIT_CIVILIZATION_MEDITERRANEAN_COLONIES'
	local m_ForeignTrade = GameInfo.Civics['CIVIC_FOREIGN_TRADE'].Index
	if (not CivilizationHasTrait(sCiv, sMediterraneanColonies)) then return; end
	-- print(player, playerConfig, sCiv)
	player:GetCulture():TriggerBoost(m_ForeignTrade, 0.4)
end

Events.PlayerTurnActivated.Add(DidoOnPlayerTurnActivated)

--Brazil
function PedroGreatPersonFaith(playerID, unitID, greatPersonClassID, greatPersonIndividualID)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sLeader = playerConfig:GetLeaderTypeName()
	local sMagnanimous = 'TRAIT_LEADER_MAGNANIMOUS'
	local sModifierID = 'TRAIT_GREAT_PEOPLE_JUNGLE_FAITH'
	local PROP_KEY_NUMBER_GREAT_PEOPLE = 'NumberofGreatPeople'
	if LeaderHasTrait(sLeader, sMagnanimous) then
		local amount = player:GetProperty(PROP_KEY_NUMBER_GREAT_PEOPLE)
		if amount == nil then
			amount = 0
		end
		amount = amount + 1
		-- Every two greatperson add 1 faith to jungle.
		if amount == 2 then
			amount = 0
			player:AttachModifierByID(sModifierID)
		end
		player:SetProperty(PROP_KEY_NUMBER_GREAT_PEOPLE, amount)
	end
end

Events.UnitGreatPersonCreated.Add(PedroGreatPersonFaith)

--Mali EraScore +15 Gold
function MaliPlayerEraScoreChanged(playerID, amountAwarded)
	local player = Players[playerID]
	local playerConfig = PlayerConfigurations[playerID]
	local sLeader = playerConfig:GetLeaderTypeName()
	local sMaliGoldDesert = 'TRAIT_LEADER_SAHEL_MERCHANTS'
	if (not LeaderHasTrait(sLeader, sMaliGoldDesert)) then return; end
	player:GetTreasury():ChangeGoldBalance(amountAwarded * 15)
end

Events.PlayerEraScoreChanged.Add(MaliPlayerEraScoreChanged)

-- Aztec
-- ===========================================================================
--	Sacrifice
-- ===========================================================================
function HD_Aztec_Sacrifice(eOwner : number, iUnitID : number)
	local pPlayer = Players[eOwner];
	if (pPlayer == nil) then
		return;
	end

	local pUnit = pPlayer:GetUnits():FindID(iUnitID);
	if (pUnit == nil) then
		return;
	end

	local city = CityManager.GetCityAt(pUnit:GetX(), pUnit:GetY());

	if city == nil then
		return;
	end
	local amount = 10 * pUnit:GetBuildCharges();
	pPlayer:GetCulture():ChangeCurrentCulturalProgress(amount);
	pPlayer:GetReligion():ChangeFaithBalance(amount);

	-- Flyover text
	local message:string  = Locale.Lookup("LOC_FLYOVER_AZTEC_SACRIFICE", amount);
	Game.AddWorldViewText(0, message, pUnit:GetX(), pUnit:GetY());

	-- Report to the application side that we did something.  This helps with visualization
	-- UnitManager.ReportActivation(pUnit, "DEMOLISH");

end
GameEvents.HD_Aztec_Sacrifice.Add(HD_Aztec_Sacrifice)

-- France, Catherine De Medici
-- ===========================================================================
-- Double promotion for spy, cancelled, due to spy removed & added issue.
-- ===========================================================================

-- function OnUnitAddedToMap(playerID, unitID)
-- 	print('OnUnitAddedToMap', playerID, unitID)
-- 	local player = Players[playerID]
-- 	local playerConfig = PlayerConfigurations[playerID]
-- 	local sLeader = playerConfig:GetLeaderTypeName()
-- 	local sFlyingSquadronTrait = 'FLYING_SQUADRON_TRAIT'
-- 	if (not LeaderHasTrait(sLeader, sFlyingSquadronTrait)) then return; end
-- 	-- 
-- 	local unit = UnitManager.GetUnit(playerID, unitID)
-- 	local mSpyIndex = GameInfo.Units['UNIT_SPY'].Index
-- 	if (player == nil) or (unit == nil) then return; end
-- 	if unit:GetType() == mSpyIndex then
-- 		local unitExp = unit:GetExperience()
-- 		-- print(unitExp:CanPromote())
-- 		unitExp:ChangeStoredPromotions(1);
-- 		-- if (unitExp:CanPromote()) then
-- 		-- 	-- Have promotion ready, add a stored promotion so we don't lose the experience.
-- 		-- 	unitExp:ChangeStoredPromotions(1);
-- 		-- else
-- 		-- 	-- grant the experience for the next level.
-- 		-- 	local nextLevelExperience :number = unitExp:GetExperienceForNextLevel()
-- 		-- 	unitExp:SetExperienceLocked(false)
-- 		-- 	unitExp:ChangeExperience(nextLevelExperience)
-- 		-- end
-- 	end
-- end
-- Events.UnitAddedToMap.Add(OnUnitAddedToMap);

-- function OnSpyAdded(playerID, unitID)
-- 	print('OnSpyAdded',	playerID, unitID)
-- 	local player = Players[playerID]
-- 	local playerConfig = PlayerConfigurations[playerID]
-- 	local sLeader = playerConfig:GetLeaderTypeName()
-- 	local sFlyingSquadronTrait = 'FLYING_SQUADRON_TRAIT'
-- 	if (not LeaderHasTrait(sLeader, sFlyingSquadronTrait)) then return; end

-- 	local unit = UnitManager.GetUnit(playerID, unitID)
-- 	local unitExp = unit:GetExperience()
-- 	unitExp:ChangeStoredPromotions(-1);
-- end
-- Events.SpyAdded.Add(OnSpyAdded);

-- function OnUnitAbilityGained(playerID, unitID, eAbilityType)
-- 	print('OnUnitAbilityGained', playerID, unitID, eAbilityType)
-- end
-- Events.UnitAbilityGained.Add(OnUnitAbilityGained);

-- function OnUnitPromotionAvailable(playerID, unitID, promotionID)
-- 	print('OnUnitPromotionAvailable', playerID, unitID, promotionID)
-- end
-- Events.UnitPromotionAvailable.Add(OnUnitPromotionAvailable);

-- Poland
-- ===========================================================================
-- temple unlock military engineers
-- ===========================================================================
function PolandTempleUnlockMilitaryEngineers(playerID:number, cityID:number)
	local player = Players[playerID]
	local city = player:GetCities():FindID(cityID)
	local playerConfig = PlayerConfigurations[playerID]
	local sCiv = playerConfig:GetCivilizationTypeName()
	local sGoldenLiberty = 'TRAIT_CIVILIZATION_GOLDEN_LIBERTY'
	local m_Dummy_Poland = GameInfo.Buildings['BUILDING_DUMMY_POLAND'].Index
	local m_Temple = GameInfo.Buildings['BUILDING_TEMPLE'].Index
	if (not CivilizationHasTrait(sCiv, sGoldenLiberty)) then 
		return
	end
	print('Poland', player, city)
    if player ~= nil and city ~= nil then
		local cityHasDummy = city:GetBuildings():HasBuilding(m_Dummy_Poland)
		local cityHasTemple = city:GetBuildings():HasBuilding(m_Temple)
		local cityTemplePillaged = city:GetBuildings():IsPillaged(m_Temple)
		-- print('Poland', cityHasDummy, cityHasTemple, cityTemplePillaged)
		if cityHasTemple and not cityTemplePillaged then
			if not cityHasDummy then
				local buildingQueue = city:GetBuildQueue()
				buildingQueue:CreateBuilding(m_Dummy_Poland)
				-- print('Dummy Poland created', player:GetID(), city:GetID())
			end
		elseif cityHasDummy then -- no temple or temple is pillaged but city has Dummy
			city:GetBuildings():RemoveBuilding(m_Dummy_Poland)
			-- print('Dummy Poland removed', player:GetID(), city:GetID())
		end      
    end
end

-- Events.PlayerTurnActivated.Add(PolandTempleUnlockMilitaryEngineers)
GameEvents.BuildingConstructed.Add(PolandTempleUnlockMilitaryEngineers)
GameEvents.BuildingPillageStateChanged.Add(PolandTempleUnlockMilitaryEngineers)
Events.CityAddedToMap.Add(PolandTempleUnlockMilitaryEngineers)

-- Kublai 
-- ===========================================================================
-- Grant CivTraits On Conquer Original Capital -- part of Gameplay
-- ===========================================================================
function KublaiGrantCivTrait( playerID, iX, iY )
	local captureModifier = {}
    local captureTrait = {}
    local pPlayer = Players[playerID]
	local pCity = CityManager.GetCityAt(iX, iY)
	local originalOwnerID = pCity:GetOriginalOwner() 
    -- print('Kublai0',originalOwnerID,playerID) 
	if originalOwnerID ~= playerID and originalOwnerID ~= nil then
		local oPlayer = Players[originalOwnerID]
		local oPlayerConfig = PlayerConfigurations[originalOwnerID]
		local oCiv = oPlayerConfig:GetCivilizationTypeName()
		local have_captured = pPlayer:GetProperty('PROP_KEY_HAVE_CAPTURED_'..originalOwnerID)
		-- print('Kublai5', have_captured)
		if have_captured == nil then -- avoid repeating
			pPlayer:SetProperty('PROP_KEY_HAVE_CAPTURED_'..originalOwnerID, true)
			-- print('Kublai6', pPlayer:GetProperty('PROP_KEY_HAVE_CAPTURED_'..originalOwnerID))
			for tRow in GameInfo.CivilizationTraits() do
				if tRow.CivilizationType == oCiv then
					table.insert(captureTrait,tRow.TraitType)
				end
			end
			-- print('Kublai1',oCiv) 
			for _, traitType in ipairs(captureTrait) do
				for tRow in GameInfo.TraitModifiers() do
					if string.sub(tRow.TraitType,1,28) ~= 'TRAIT_CIVILIZATION_BUILDING_' and
					string.sub(tRow.TraitType,1,28) ~= 'TRAIT_CIVILIZATION_DISTRICT_' and
					tRow.TraitType == traitType then
						table.insert(captureModifier,tRow.ModifierId)
					end
				end
			end 
			for _, modifier in ipairs(captureModifier) do
				pPlayer:AttachModifierByID(modifier)  -- unable to be used in UI
				-- print('Kublai2',modifier)
			end
		end
	end
end

GameEvents.KublaiGrantCivTraitSwitch.Add(KublaiGrantCivTrait)

-- Eleanor
-- ===========================================================================
-- Judgement of Love -- part of Gameplay
-- ===========================================================================
function ProjectJudgementOfLove(iX, iY, dX, dY)
	local city = CityManager.GetCityAt(iX, iY)
	local pCity = CityManager.GetCityAt(dX, dY)
	local districtID = GameInfo.Districts['DISTRICT_THEATER'].Index
	local pCityDistricts : object = pCity:GetDistricts();
	if (pCityDistricts ~= nil) then
		local eX, eY = pCityDistricts:GetDistrictLocation(districtID)
		local distance = Map.GetPlotDistance(eX, eY, iX, iY)
		--print('PROJECT_CIRCUSES_AND_BREAD3',eX, eY, iX, iY, distance)
		if distance <= 9 then
			city:ChangeLoyalty(-200)
		end
	end
end
GameEvents.ProjectEnemyCitiesChangeLoyaltySwitch.Add(ProjectJudgementOfLove)

ExposedMembers.GameEvents = GameEvents

-- Hungary Conquer Envoy
function ConquerEnvoy(newPlayerID, oldPlayerID, newCityID, iCityX, iCityY)
    local pPlayer = Players[newPlayerID]
    if pPlayer ~= nil then
        local pPlayerConfig = PlayerConfigurations[newPlayerID]
        local sLeader = pPlayerConfig:GetLeaderTypeName()
        local sConquerEnvoy = 'TRAIT_LEADER_RAVEN_KING'
        if LeaderHasTrait(sLeader, sConquerEnvoy) then
            pPlayer:GetInfluence():ChangeTokensToGive(1)    
        end
    end
end
GameEvents.CityConquered.Add(ConquerEnvoy)

-- 刚果
function MBANZABoost(playerID, districtID, iX, iY)
    local pPlayer = Players[playerID]
    if pPlayer ~= nil then
    	local plot = Map.GetPlot(iX, iY)
        local districtType = plot:GetDistrictType()
        if ExposedMembers.DLHD.Utils.IsDistrictType(districtType, 'DISTRICT_MBANZA') then
            local m_THEOLOGY = GameInfo.Civics['CIVIC_THEOLOGY'].Index;
            local m_DIVINE_RIGHT = GameInfo.Civics['CIVIC_DIVINE_RIGHT'].Index;
            local m_REFORMED_CHURCH = GameInfo.Civics['CIVIC_REFORMED_CHURCH'].Index;

            local pPlayerConfig = PlayerConfigurations[playerID]
       		local sLeader = pPlayerConfig:GetLeaderTypeName()
            if LeaderHasTrait(sLeader, 'TRAIT_LEADER_RELIGIOUS_CONVERT') then
				pPlayer:GetCulture():TriggerBoost(m_THEOLOGY, 1);
				pPlayer:GetCulture():TriggerBoost(m_DIVINE_RIGHT, 1);
            	pPlayer:GetCulture():TriggerBoost(m_REFORMED_CHURCH, 1);
            end
        end
    end
end

GameEvents.OnDistrictConstructed.Add(MBANZABoost)
