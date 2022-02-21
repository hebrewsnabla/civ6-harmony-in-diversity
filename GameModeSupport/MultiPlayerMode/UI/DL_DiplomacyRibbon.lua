-- Copyright 2018-2019, Firaxis Games.

include("DiplomacyRibbon_Expansion2.lua");

-- ===========================================================================
-- OVERRIDES
-- ===========================================================================
BASE_UpdateStatValues_HD = UpdateStatValues;
print('DL_DiplomacyRibbon loaded')

-- ===========================================================================
-- FUNCTIONS
-- ===========================================================================
function MaskNonAllyStats(uiLeader)
    if uiLeader.Score:IsVisible() then 
        uiLeader.Score:SetText("[ICON_Capital] ?");
    end

    if uiLeader.Military:IsVisible() then   
        uiLeader.Military:SetText( "[ICON_Strength] ?");
    end

    if uiLeader.Science:IsVisible() then 
        uiLeader.Science:SetText( "[ICON_Science] ?");
    end

    if uiLeader.Culture:IsVisible() then 
        uiLeader.Culture:SetText( "[ICON_Culture] ?");
    end

    if uiLeader.Gold:IsVisible() then       
        uiLeader.Gold:SetText( "[ICON_Gold] ?");
    end
    
    if uiLeader.Faith:IsVisible() then
        uiLeader.Faith:SetText( "[ICON_Faith] ?");
    end

    if uiLeader.Favor:IsVisible() then
        uiLeader.Favor:SetText( " [ICON_Favor]  ?");
    end
end
-- ===========================================================================
--  OVERRIDE
-- ===========================================================================
function UpdateStatValues( playerID:number, uiLeader:table )    
    BASE_UpdateStatValues_HD( playerID, uiLeader );
    local pPlayer:table = Players[playerID];
    local localPlayerID:number = Game.GetLocalPlayer();
    local localPlayer = Players[localPlayerID]
    if localPlayerID == -1 or localPlayerID == 1000 or localPlayerID == playerID then
        return;
    end

    if (localPlayer:GetTeam() ~= pPlayer:GetTeam()) then
        MaskNonAllyStats(uiLeader);
    end
    
    -- local localPlayerDiplomacy:table = Players[localPlayerID]:GetDiplomacy();
    -- if localPlayerDiplomacy then
    --     -- local allianceType = localPlayerDiplomacy:GetAllianceType(playerID);
    --     -- print(allianceType)
    --     if allianceType == -1 then
    --         MaskNonAllyStats(uiLeader);
    --     end
    -- end
end
