-- =================================================================================
-- Import base file
-- =================================================================================
local files = {
    "SelectedUnit_Expansion2.lua",
    "SelectedUnit.lua",
}

for _, file in ipairs(files) do
    include(file)
    if Initialize then
        print("DL Loading " .. file .. " as base file");
        break
    end
end

GreatPersonUtils = ExposedMembers.DLHD.GreatPersonUtils;
-- =================================================================================
-- Cache base functions
-- =================================================================================
BASE_RealizeGreatPersonLens = RealizeGreatPersonLens;

-- =================================================================================
-- Overrides
-- =================================================================================
function RealizeGreatPersonLens(kUnit:table)
    UILens.ClearLayerHexes(m_HexColoringGreatPeople);
    if UILens.IsLayerOn( m_HexColoringGreatPeople ) then
        UILens.ToggleLayerOff(m_HexColoringGreatPeople);
    end
    if kUnit ~= nil and ( not UI.IsGameCoreBusy() ) then
        local playerID:number = kUnit:GetOwner();
        if playerID == Game.GetLocalPlayer() then
            local kUnitGreatPerson:table = kUnit:GetGreatPerson();
            if kUnitGreatPerson ~= nil and kUnitGreatPerson:IsGreatPerson() then
                local rawActivationPlots = GreatPersonUtils.GetActivationPlots(playerID, kUnitGreatPerson:GetIndividual());
                if rawActivationPlots ~= nil then
                    local areaHighlightPlots:table = {};
                    local activationPlots:table = {};
                    for _, plotIndex in ipairs(rawActivationPlots) do
                        table.insert(activationPlots, {"Great_People", plotIndex});
                    end
                    UILens.SetLayerHexesArea(m_HexColoringGreatPeople, playerID, areaHighlightPlots, activationPlots);
                    UILens.ToggleLayerOn(m_HexColoringGreatPeople);
                    return;
                end
            end
        end
    end
    BASE_RealizeGreatPersonLens(kUnit);
end
