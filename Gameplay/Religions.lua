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

--Pantheon

-- Messenger of the Gods: 
-- Each time grants 20 great prophet points when recon units discover a natural wonder, double if first discover

-- function Scout_Find_Natural_Wonder( plotx:number, ploty:number, eFeature:number, isFirstToFind:boolean )
--     print('wonder!')
--     local pUnitList:table = Units.GetUnitsInPlotLayerID( plotX, plotY, MapLayers.ANY );
--     if pUnitList ~= nil then
--         for _,pUnit in ipairs(pUnitList) do
--         local eUnitID = pUnit:GetID();
--         local eOwner  = pUnit:GetOwner();
--         local scoutID = GameInfo.Units['UNIT_SCOUT'].Index
--         local greatPhoID = GameInfo.GreatPersonClasses['GREAT_PERSON_CLASS_PROPHET'].Index
--         local religions = player:GetReligion():GetPantheon();
--         print(eUnitID,eOwner)
--             for _, religion in ipairs(religions) do
--                 if (religion.Founder == eOwner) then
--                     for _, beliefIndex in ipairs(religion.Beliefs) do
--                         if GameInfo.Beliefs[beliefIndex].BeliefType == "BELIEF_MESSENGER_OF_THE_GODS" then
--                             if eUnitID == scoutID then
--                                 Utils.AddGreatPeoplePoints(eOwner, greatPhoID, 20)
--                                 if isFirstToFind then
--                                     Utils.AddGreatPeoplePoints(eOwner, greatPhoID, 20)
--                                 end
--                             end
--                         end
--                     end
--                 end
--             end
--         end
--     end
-- end
-- Events.NaturalWonderRevealed.Add(Scout_Find_Natural_Wonder)
-- --Follower Belief



