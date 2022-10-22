-- Temporary: Remove Preserve, city policy Builings
delete from Types where Type in
	(select BuildingType from Buildings where PrereqDistrict = 'DISTRICT_PRESERVE');
delete from Types where Type in (
	'DISTRICT_PRESERVE',
	'BUILDING_JNR_WAYSTATION',	
	'BUILDING_JNR_TOOLING_SHOP',
	'BUILDING_JNR_ALTAR',
	'BUILDING_JNR_TARGET_RANGE'
);
delete from RequirementSetRequirements where RequirementId in (
	'REQUIRES_CITY_HAS_BUILDING_CITY_POLICY_FORGING_IRON',
	'REQUIRES_CITY_HAS_BUILDING_CITY_POLICY_FREIGHT',
	'REQUIRES_CITY_HAS_BUILDING_CITY_POLICY_JIMI'
);