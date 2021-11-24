-- =================================================================================
-- Import base file
-- =================================================================================
local files = {
    "UnitPanel_ProjectHumankind.lua",
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

include("Common");
include("FarmsOnFreshHills_Common");
include("HD_UnitCommandDefs");
include "Hanyuu_CommandDefs";               --  Mod Furude Rika Support

Utils = ExposedMembers.DLHD.Utils;
GreatPersonUtils = ExposedMembers.DLHD.GreatPersonUtils;

-- =================================================================================
-- Cache base functions
-- =================================================================================
local BASE_BuildActionModHook = BuildActionModHook;
local BASE_LateInitialize = LateInitialize;
local BASE_OnUnitActionClicked = OnUnitActionClicked;
local BASE_AddActionButton = AddActionButton;
local BASE_GetUnitActionsTable = GetUnitActionsTable;

local m_ShouldUpdateBestImprovement = false;

-- ===========================================================================
--  OVERRIDE BASE FUNCTIONS
-- ===========================================================================

function GetUnitActionsTable(pUnit : object)
    local pBaseActionsTable : table = BASE_GetUnitActionsTable(pUnit);

    --  Unit Commands
    --  Test all custom commands in table defined in "HD_UnitCommands" to add
    --  to the selected unit's table.
    for sCommandKey, pCommandTable in pairs(m_HDUnitCommands) do
        
        --if UnitManager.CanStartCommand(pUnit, UnitCommandTypes.EXECUTE_SCRIPT) then
            local bVisible : boolean = true;
            if (pCommandTable.IsVisible ~= nil) then
                bVisible = pCommandTable.IsVisible(pUnit);
            end
            if (bVisible) then

                if (pCommandTable.CanUse ~= nil and pCommandTable.CanUse(pUnit) == true) then

                    local bIsDisabled : boolean = false;
                    if (pCommandTable.IsDisabled ~= nil) then
                        bIsDisabled = pCommandTable.IsDisabled(pUnit);
                    end
            
                    local sToolTipString : string = pCommandTable.ToolTipString or "Undefined Unit Command";

                    local pCallback : ifunction = function()
                        local pSelectedUnit = UI.GetHeadSelectedUnit();
                        if (pSelectedUnit == nil) then
                            return;
                        end

                        local tParameters = {};
                        tParameters[UnitCommandTypes.PARAM_NAME] = pCommandTable.EventName or "";
                        UnitManager.RequestCommand(pSelectedUnit, UnitCommandTypes.EXECUTE_SCRIPT, tParameters);
                        UnitManager.RequestCommand(pSelectedUnit, UnitCommandTypes.DELETE);
                    end

                    if (bIsDisabled and pCommandTable.DisabledToolTipString ~= nil) then
                        sToolTipString = sToolTipString .. "[NEWLINE][NEWLINE]" .. pCommandTable.DisabledToolTipString;
                    end

                    AddActionToTable(pBaseActionsTable, pCommandTable, bIsDisabled, sToolTipString, UnitCommandTypes.EXECUTE_SCRIPT, pCallback);
                end
            end
        end
    --end

    --  Mod Furude Rika Support
    if m_HanyuuUnitCommands then
        for sCommandKey, pCommandTable in pairs(m_HanyuuUnitCommands) do
		
		--if UnitManager.CanStartCommand(pUnit, UnitCommandTypes.EXECUTE_SCRIPT) then
			local bVisible : boolean = true;
			if (pCommandTable.IsVisible ~= nil) then
				bVisible = pCommandTable.IsVisible(pUnit);
			end
			if (bVisible) then

				if (pCommandTable.CanUse ~= nil and pCommandTable.CanUse(pUnit) == true) then

					local bIsDisabled : boolean = false;
					if (pCommandTable.IsDisabled ~= nil) then
						bIsDisabled = pCommandTable.IsDisabled(pUnit);
					end
			
					local sToolTipString : string = pCommandTable.ToolTipString or "Undefined Unit Command";

					local pCallback : ifunction = function()
						local pSelectedUnit = UI.GetHeadSelectedUnit();
						if (pSelectedUnit == nil) then
							return;
						end

						local tParameters = {};
						tParameters[UnitCommandTypes.PARAM_NAME] = pCommandTable.EventName or "";
						UnitManager.RequestCommand(pSelectedUnit, UnitCommandTypes.EXECUTE_SCRIPT, tParameters);
					end

					if (bIsDisabled and pCommandTable.DisabledToolTipString ~= nil) then
						sToolTipString = sToolTipString .. "[NEWLINE][NEWLINE]" .. pCommandTable.DisabledToolTipString;
					end

					AddActionToTable(pBaseActionsTable, pCommandTable, bIsDisabled, sToolTipString, UnitCommandTypes.EXECUTE_SCRIPT, pCallback);
				end
			end
		--end
	    end
    end

    return pBaseActionsTable;
end

-- ===========================================================================
-- Handle some app side Unit animation
-- ===========================================================================

local g_ActivateReason_Demolish = DB.MakeHash("DEMOLISH");

-- ===========================================================================
function OnUnitActivate(owner : number, unitID : number, x : number, y : number, eReason : number, bVisibleToLocalPlayer : boolean)

    if bVisibleToLocalPlayer then

        local pUnit = UnitManager.GetUnit(owner, unitID);
        if pUnit ~= nil then

            -- Trigger custom animations based on the Activate event.
            if eReason == g_ActivateReason_DEMOLISH then
                SimUnitSystem.SetAnimationState(pUnit, "ACTION_A", "IDLE");
            end
        end
    end
end
Events.UnitActivate.Add(OnUnitActivate);

-- =================================================================================
-- Overrides
-- =================================================================================
function BuildActionModHook(instance:table, action:table)
    -- Is the player and unit is valid?
    -- print('DEBUG', action.userTag, action.IconId)
    if g_selectedPlayerId ~= nil and g_selectedPlayerId ~= -1
            and g_UnitId ~= nil and g_UnitId ~= -1 then
        -- Is this the "build improvement" action
        if action.userTag == UnitOperationTypes.BUILD_IMPROVEMENT then
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
        -- Is this the "remove feature" action
        if action.userTag == UnitOperationTypes.REMOVE_FEATURE then
            local player = Players[g_selectedPlayerId];
            local unit =  player:GetUnits():FindID(g_UnitId);
            if unit ~= nil then
                local unitInfo = GameInfo.Units[unit:GetUnitType()]
                if unitInfo ~= nil then
                    if unitInfo.PromotionClass == 'PROMOTION_CLASS_RECON' then
                        action.Disabled = true;
                        action.helpString = Locale.Lookup("LOC_CANNOT_REMOVE_FEATURE_USING_RECONS");
                    end
                end
            end
        end
        -- local plant_forest_hash = GameInfo.UnitOperations.UNITOPERATION_PLANT_FOREST.Hash
        -- if action.userTag == plant_forest_hash then
        --     print('!!!')
        -- end
    end
    BASE_BuildActionModHook(instance, action);
end

local mGreatPersonActivateHash = GameInfo.Types['UNITCOMMAND_ACTIVATE_GREAT_PERSON'].Hash;
-- local mUnitoperationRemoveFeatureHash = GameInfo.Types['UNITOPERATION_REMOVE_FEATURE'].Hash;
-- local mMilitaryEngineer = GameInfo.Units['UNIT_MILITARY_ENGINEER'].Index;
-- -- =================================================================================
-- -- Overrides
-- -- =================================================================================
function OnUnitActionClicked( actionType:number, actionHash:number, currentMode:number )
--     -- print('OnUnitActionClicked', actionType, actionHash) -- OnUnitActionClicked -1572680103 374670040
    if g_isOkayToProcess then
        local pSelectedUnit :table = UI.GetHeadSelectedUnit();
        if (pSelectedUnit ~= nil) then
            if (actionType == UnitCommandTypes.TYPE) then
                if actionHash == mGreatPersonActivateHash then
                    local individual = pSelectedUnit:GetGreatPerson():GetIndividual();
                    GreatPersonUtils.HandleActivation(pSelectedUnit:GetOwner(), pSelectedUnit:GetID(), individual);
                end
--             else
--                 if (actionType == UnitOperationTypes.TYPE) then
--                     if actionHash == mUnitoperationRemoveFeatureHash then
--                         -- print(pSelectedUnit:GetUnitType());
--                         if (pSelectedUnit:GetUnitType() == mMilitaryEngineer) then
--                             print('removing')
--                             -- TODO: set the moves to zero.
--                             -- TODO: Remove the Features. (maybe need to refresh)
--                             -- pSelectedUnit
--                             -- Utils.SetMovesToZero()
--                             -- return
--                         end
--                     end
--                 end
            end
        end
    end
    BASE_OnUnitActionClicked(actionType, actionHash, currentMode)
end

function AddActionButton(instance:table, action:table)
    if action.IconId == 'ICON_UNITOPERATION_HARVEST_RESOURCE' then
        local pSelectedUnit = UI.GetHeadSelectedUnit();
        local owner = pSelectedUnit:GetOwner();
        local player = Players[owner];
        if pSelectedUnit:GetUnitType() == GameInfo.Units['UNIT_BUILDER'].Index then
            -- NOTE: GetX and GetY may not work in UI environment.
            -- local x = pSelectedUnit:GetX()
            -- local y = pSelectedUnit:GetY()
            local plotID = pSelectedUnit:GetPlotId();
            local plot = Map.GetPlotByIndex(plotID);
            local r = plot:GetResourceType();
            -- print(r, plot:GetX(), plot:GetY())
            if r ~= -1 then
                local resource = GameInfo.Resources[r];
                if resource ~= nil then
                    if ((resource.ResourceClassType == 'RESOURCECLASS_STRATEGIC') or (resource.ResourceClassType == 'RESOURCECLASS_ARTIFACT')) then
                        if not player:GetResources():IsResourceVisible(r) then
                            print('hide harvest resource: ', resource.ResourceType);
                            instance.UnitActionButton:SetHide(true);
                            return;
                        end
                    end
                end
            end
        end
    end
    if action.IconId == 'ICON_UNITCOMMAND_ACTIVATE_GREAT_PERSON' then
        local pSelectedUnit = UI.GetHeadSelectedUnit();
        local individual = pSelectedUnit:GetGreatPerson():GetIndividual();
        -- local playerID = pSelectedUnit:GetOwner();
        local playerID = Game.GetLocalPlayer();
        print('HD_DEBUG_2', pSelectedUnit:GetOwner(), playerID);
        local rawActivationPlots = GreatPersonUtils.GetActivationPlots(playerID, individual);
        if rawActivationPlots ~= nil then
            -- print('here')
            local validActivation = false;
            local selectedPlotId = pSelectedUnit:GetPlotId();
            for _, plotId in ipairs(rawActivationPlots) do
                print('HD_DEBUG', _, selectedPlotId, plotId)
            end
            for _, plotId in ipairs(rawActivationPlots) do
                if selectedPlotId == plotId then
                    validActivation = true;
                    break;
                end
            end
            if not validActivation then
                -- Not activatable plot.
                local errorHint = "[NEWLINE][COLOR_Red]" .. Locale.Lookup("LOC_GREATPERSON_MIMAR_SINAN_ACTIVATION_HINT") .. "[ENDCOLOR]";
                if not action.Disabled then
                    -- Not disabled, append additional newline.
                    errorHint = "[NEWLINE]" .. errorHint;
                    action.Disabled = true;
                end
                action.helpString = action.helpString .. errorHint;
            end
        end
    end
    BASE_AddActionButton(instance, action)
end

function OnGreatPersonActivated(unitOwner, unitID, greatPersonClassID, greatPersonIndividualID)
    local owner = Players[unitOwner];
    if owner:IsAI() then
        -- Only need to handle AI activation since player activation will be handled in OnUnitActionClicked.
        GreatPersonUtils.HandleActivation(unitOwner, unitID, greatPersonIndividualID);
    end
end

function LateInitialize()
    BASE_LateInitialize();
    Events.UnitGreatPersonActivated.Add(OnGreatPersonActivated);
end