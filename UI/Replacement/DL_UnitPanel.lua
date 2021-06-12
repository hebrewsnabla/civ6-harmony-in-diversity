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

Utils = ExposedMembers.DLHD.Utils;
GreatPersonUtils = ExposedMembers.DLHD.GreatPersonUtils;

-- =================================================================================
-- Cache base functions
-- =================================================================================
local BASE_BuildActionModHook = BuildActionModHook;
local BASE_LateInitialize = LateInitialize;
local BASE_OnUnitActionClicked = OnUnitActionClicked;
local BASE_AddActionButton = AddActionButton;

local m_ShouldUpdateBestImprovement = false;

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
                    if (resource.ResourceClassType == 'RESOURCECLASS_STRATEGIC') then
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
        local rawActivationPlots = GreatPersonUtils.GetActivationPlots(pSelectedUnit:GetOwner(), individual);
        if rawActivationPlots ~= nil then
            local validActivation = false;
            local selectedPlotId = pSelectedUnit:GetPlotId();
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