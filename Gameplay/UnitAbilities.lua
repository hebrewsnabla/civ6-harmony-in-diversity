-- Units with Ability ABILITY_BLOCK_FIRST_NON_LETHAL_ATTACK_EACH_TURN ignores the first non-lethal combat (as defender) damage each turn. by xiaoxiao

function OnCombat (combatResult)
    local name = "ABILITY_BLOCK_FIRST_NON_LETHAL_ATTACK_EACH_TURN"
    local turn = Game.GetCurrentGameTurn()
    local defender = combatResult[CombatResultParameters.DEFENDER]
    local info = defender[CombatResultParameters.ID]
    local unit = UnitManager.GetUnit(info.player, info.id)
    local used = unit:GetProperty(name .. "_USED_ON_TURN" .. turn)
    if unit:GetAbility():HasAbility(name) and not used then
        local location = unit:GetLocation()
        Game.AddWorldViewText(0, Locale.Lookup("LOC_" .. name .. "_POP"), location.x, location.y)
        unit:ChangeDamage(-defender[CombatResultParameters.DAMAGE_TO])
        unit:SetProperty(name .. "_USED_ON_TURN" .. turn, true)
    end
end

Events.Combat.Add(OnCombat)