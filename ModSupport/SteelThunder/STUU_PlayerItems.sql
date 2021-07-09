
-- Aztec
update PlayerItems set Description = 'LOC_UNIT_AZTEC_EAGLE_WARRIOR_STUU_DESCRIPTION'
where Domain = 'Players:Expansion2_Players' and CivilizationType = 'CIVILIZATION_AZTEC' and Type = 'UNIT_AZTEC_EAGLE_WARRIOR'
and exists (select Type from PlayerItems where Type = 'UNIT_AZTEC_JAGUAR');

-- Arabia
update Players set LeaderAbilityDescription = 'LOC_TRAIT_LEADER_RIGHTEOUSNESS_OF_FAITH_STUU_DESCRIPTION'
where Domain = 'Players:Expansion2_Players' and CivilizationType = 'CIVILIZATION_ARABIA' and LeaderType = 'LEADER_SALADIN'
and exists (select Type from PlayerItems where Type = 'UNIT_ARABIAN_GHAZI');
