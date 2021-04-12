-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

update Projects set
    Cost = 30, CostProgressionModel = 'NO_PROGRESSION_MODEL', CostProgressionParam1 = 0,
    Description = 'LOC_REMOVE_DISTRICT_PROJECT_DESCRIPTION'
where ProjectType like 'PROJECT_REMOVE_DISTRICT_%';
