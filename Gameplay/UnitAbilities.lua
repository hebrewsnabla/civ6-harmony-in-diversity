-- Units with Ability ABILITY_BLOCK_FIRST_NON_LETHAL_ATTACK_EACH_TURN ignores the first non-lethal combat (as defender) damage each turn. by xiaoxiao

function OnCombat (combatResult)
    local name = "ABILITY_BLOCK_FIRST_NON_LETHAL_ATTACK_EACH_TURN"
    local turn = Game.GetCurrentGameTurn()
    local defender = combatResult[CombatResultParameters.DEFENDER]
    local info = defender[CombatResultParameters.ID]
    local unit = UnitManager.GetUnit(info.player, info.id)
    if unit then
        local used = unit:GetProperty(name .. "_USED_ON_TURN" .. turn)
        if unit:GetAbility():HasAbility(name) and not used then
            local location = unit:GetLocation()
            Game.AddWorldViewText(0, Locale.Lookup("LOC_" .. name .. "_POP"), location.x, location.y)
            unit:ChangeDamage(-defender[CombatResultParameters.DAMAGE_TO])
            unit:SetProperty(name .. "_USED_ON_TURN" .. turn, true)
        end
    end
end

Events.Combat.Add(OnCombat)

-- 垃圾回收中心, by xiaoxiao
function HDRecyclingPlantRecycle (playerId, unitId)
    local unit = UnitManager.GetUnit(playerId, unitId);
    local unitInfo = GameInfo.Units[unit:GetType()];
    local cost = unitInfo.Cost;
    local costRate = GlobalParameters.RECYCLING_PLANT_PRODUCTION_RATE or 0;
    local resourceCost = 0;
    for row in GameInfo.Units_XP2() do
        if row.UnitType == unitInfo.UnitType then
            resourceCost = row.ResourceCost;
        end
    end
    local resourceCostMultiplier = GlobalParameters.RECYCLING_PLANT_STRATEGIC_MULTIPLIER or 0;
    local production = costRate * cost / 100 + resourceCostMultiplier * resourceCost;
    
	local location = unit:GetLocation();
	local x = location.x;
	local y = location.y;
	local district = CityManager.GetDistrictAt(x, y);
	local city = district:GetCity();
    city:GetBuildQueue():AddProgress(production);
end
GameEvents.HDRecyclingPlantRecycle.Add(HDRecyclingPlantRecycle);