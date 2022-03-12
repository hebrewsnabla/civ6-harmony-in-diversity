-- Copyright 2018-2019, Firaxis Games.

-- ===========================================================================
-- Includes
-- ===========================================================================
include("WorldRankings_Expansion2.lua");

-- ===========================================================================
-- OVERRIDES
-- ===========================================================================
BASE_UpdateTeamTooltip_HD = UpdateTeamTooltip;
BASE_PopulateOverallPlayerIconInstance_HD = PopulateOverallPlayerIconInstance;
print('DL_WorldRankings loaded')

-- ===========================================================================
--  OVERRIDE
-- ===========================================================================
function UpdateTeamTooltip( control, teamData )
    -- print('Blocked UpdateTeamTooltip')
end


-- ===========================================================================
function PopulateOverallPlayerIconInstance(instance:table, victoryType:string, teamData:table, iconSize:number)
    -- Take the player ID from the first team member who should be the only team member
    local playerID:number = Teams[teamData.TeamID][1];
    local playerData:table = teamData.PlayerData[playerID];
    if(playerData ~= nil) then
        local civIconManager = CivilizationIcon:AttachInstance(instance);
        local details:string = playerData.FirstTiebreakSummary;
        if playerData.FirstTiebreakSummary ~= playerData.SecondTiebreakSummary then
            details = details .. "[NEWLINE]" .. playerData.SecondTiebreakSummary;
        end
        if playerData.AdditionalSummary and playerData.AdditionalSummary ~= "" then
            details = details .. "[NEWLINE]" .. playerData.AdditionalSummary;
        end
        details = "" -- invisible
        civIconManager:SetLeaderTooltip(playerID, details);
        civIconManager:UpdateIconFromPlayerID(playerID);

        local _, civIcon:string = GetCivNameAndIcon(playerID);
        instance.CivIconFaded:SetIcon(civIcon);
        instance.CivIcon:SetPercent(teamData.TeamScore);
        instance.CivIconBacking:SetPercent(teamData.TeamScore);
        instance.TeamRibbon:SetHide(true);
        return instance;
    end
end
