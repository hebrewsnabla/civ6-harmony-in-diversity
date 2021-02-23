Utils = ExposedMembers.DLHD.Utils;

-- Founder Belief

-- To the Glory of God:
-- 33% chance getting a relic when a GreatPerson is fully consumed.
function OnGreatPersonActivated(unitOwner, unitID, greatPersonClassID, greatPersonIndividualID)
    local owner = Players[unitOwner];
    if owner == nil then return end

    local unit = owner:GetUnits():FindID(unitID);

    if (unit ~= nil) and (unit:GetGreatPerson() ~= nil) and (unit:GetGreatPerson():GetActionCharges() == 0) then
        -- The great person unit has used up all the charges.
        -- Check if the owner has "To the Glory of God" belief.
        local religions = Game.GetReligion():GetReligions();
        for _, religion in ipairs(religions) do
            if (religion.Founder == unitOwner) then
                for _, beliefIndex in ipairs(religion.Beliefs) do
                    if GameInfo.Beliefs[beliefIndex].BeliefType == "BELIEF_TO_THE_GLORY_OF_GOD" then
                        -- The owner has "To the Glory of God" belief, give out a relic by 33% chance.
                        local rand = math.random(1, 100);
                        if (rand <= 33) then
                            Utils.GrantRelic(unitOwner);
                        end
                    end
                end
            end
        end
    end
end

Events.UnitGreatPersonActivated.Add(OnGreatPersonActivated)