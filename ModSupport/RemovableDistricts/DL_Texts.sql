-------------------------------------
--     Adaptation for the Mod      --
-------------------------------------

insert into LocalizedText ( Language, Tag, Text )
 select 'zh_Hans_CN', 'LOC_PROJECT_REMOVE'||substr(Tag, 4), '移除 '||Text 
from LocalizedText where Language = 'zh_Hans_CN' and Tag like 'LOC_DISTRICT%NAME';

insert or replace into LocalizedText ( Language, Tag, Text ) values
    ('en_US', 'LOC_REMOVE_DISTRICT_PROJECT_DESCRIPTION', 'Removes the district with all its buildings.'),
    ('zh_Hans_CN', 'LOC_REMOVE_DISTRICT_PROJECT_DESCRIPTION', '移除该区域和其内的所有建筑。');
