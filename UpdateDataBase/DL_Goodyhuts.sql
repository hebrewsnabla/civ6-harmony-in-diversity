-------------------------------------
--      Goodyhuts Adjustments      --
-------------------------------------

update GoodyHutSubTypes set Turn = 30 where SubTypeGoodyHut = 'GOODYHUT_ONE_RELIC';
update GoodyHutSubTypes set Turn = 15 where SubTypeGoodyHut = 'GOODYHUT_GRANT_BUILDER';
update GoodyHutSubTypes set Turn = 50 where SubTypeGoodyHut = 'GOODYHUT_GOVERNOR_TITLE';
update GoodyHutSubTypes set Turn = 15 where SubTypeGoodyHut = 'GOODYHUT_FAVOR';
