INSERT INTO IconTextureAtlases	
		(Name,								    IconSize,	IconsPerRow,	IconsPerColumn,	Filename)
VALUES	('ICON_ATLAS_HD_WETLANDS_FEATURES',		50, 	 	1,				1,				'HD_Swamp_50.dds'),
		('ICON_ATLAS_HD_WETLANDS_FEATURES',		64,			1,				1,				'HD_Swamp_64.dds'),
		('ICON_ATLAS_HD_WETLANDS_FEATURES',		256, 		1,				1,				'HD_Swamp_256.dds');

INSERT INTO IconDefinitions	
		(Name,								Atlas, 										'Index')
VALUES 	('ICON_FEATURE_HD_SWAMP',	        'ICON_ATLAS_HD_WETLANDS_FEATURES',			0);