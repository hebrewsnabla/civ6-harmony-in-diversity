-- =================================================================================
-- Import base file
-- =================================================================================
local files = {
    "UnitPanel_Expansion2.lua",
    "UnitPanel_Expansion1.lua",
    "UnitPanel.lua",
}

for _, file in ipairs(files) do
    include(file)
    if Initialize then
        print("DL Loading " .. file .. " as base file");
        break
    end
end

include("FarmsOnFreshHills_Common");

-- =================================================================================
-- Cache base functions
-- =================================================================================
local BASE_BuildActionModHook = BuildActionModHook;

local m_ShouldUpdateBestImprovement = false;

-- =================================================================================
-- Overrides
-- =================================================================================
function BuildActionModHook(instance:table, action:table)
    -- Is this the "build improvement" action and the player and unit is valid?
    if action.userTag == UnitOperationTypes.BUILD_IMPROVEMENT
        and g_selectedPlayerId ~= nil and g_selectedPlayerId ~= -1
        and g_UnitId ~= nil and g_UnitId ~= -1 then
            if action.IconId == "ICON_IMPROVEMENT_FARM" then
                local player = Players[g_selectedPlayerId];
                local unit =  player:GetUnits():FindID(g_UnitId);
                if unit ~= nil then
                    local unitPos:number = unit:GetPlotId();
                    if Map.IsPlot(unitPos) then
                        local plot:table = Map.GetPlotByIndex(unitPos);
                        if plot ~= nil then
                            if action.Disabled == false and ShouldDisableHillFarm(plot, player) then
                                action.Disabled = true;
                                action.IsBestImprovement = false;
                                m_ShouldUpdateBestImprovement = true;
                            end
                        end
                    end
                end
            elseif action.IconId == "ICON_IMPROVEMENT_MINE" and action.Disabled == false then
                -- Update best improvement to mine if the best improvement was cleared because hill farm couldn't be built.
                -- This logic can work because mine action is checked after farm.
                if m_ShouldUpdateBestImprovement then
                    action.IsBestImprovement = true;
                    m_ShouldUpdateBestImprovement = false;
                end
            end
    end

    BASE_BuildActionModHook(instance, action);
end

-- -- Temp for great person
-- local BASE_AddActionButton = AddActionButton
-- local BASE_OnUnitActionClicked = OnUnitActionClicked
-- local mGreatPersonActivateHash = GameInfo.Types['UNITCOMMAND_ACTIVATE_GREAT_PERSON'].Hash;
-- -- =================================================================================
-- -- Overrides
-- -- =================================================================================
-- function OnUnitActionClicked( actionType:number, actionHash:number, currentMode:number )
--     -- print('OnUnitActionClicked', actionType, actionHash) -- OnUnitActionClicked -1572680103 374670040
--     if g_isOkayToProcess then
--         local pSelectedUnit :table = UI.GetHeadSelectedUnit();
--         if (pSelectedUnit ~= nil) then
--             if (actionType == UnitCommandTypes.TYPE) then
--                 if actionHash == mGreatPersonActivateHash then
--                     -- pSelectedUnit
--                     UnitManager.RequestCommand( pSelectedUnit, actionHash );
--                 end
--             end
--         end
--     end
--     BASE_OnUnitActionClicked(actionType, actionHash, currentMode)
-- end

-- function AddActionButton( instance:table, action:table )
--     -- print('AddActionButton', action.IconId)
--     if action.IconId == 'ICON_UNITOPERATION_MOVE_TO' then
--         action.Disabled = true
--         local pSelectedUnit :table= UI.GetHeadSelectedUnit();
--         print(pSelectedUnit)
--     end
--     BASE_AddActionButton(instance, action)
-- end