update LocalizedText
set Text = replace(Text, "[NEWLINE][NEWLINE]Moving the [ICON_GREATWORK_PRODUCT] Product to another city or civilization grants this Corporation's tile +1 [ICON_GOLD] Gold. Consumes 2 [ICON_POWER] Power while produced.[NEWLINE]",
"[NEWLINE][NEWLINE]移动 [ICON_GREATWORK_PRODUCT] 产品到另一个城市或文明会给该公司所在单元格+1 [ICON_GOLD] 金币。在生产时消耗2点 [ICON_POWER] 电力。[NEWLINE]")
where Tag LIKE "LOC_PROJECT_CREATE_CORPORATION_PRODUCT_%_DESCRIPTION" and Language = 'zh_Hans_CN';

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                               Text)
values
    ("zh_Hans_CN",  "LOC_UNIT_LEU_TYCOON_NOMONOPOLY_DESCRIPTION",      "需要商业中心中的“市场”方可购买的高价平民单位。[NEWLINE][NEWLINE]大亨们可以创建铁路和火车站来改善你的领土上的贸易和[ICON_PRODUCTION]生产。");
