-- Temporary: Remove Preserve, city policy Builings
delete from Types where Type in (
	'BUILDING_JNR_ALTAR',
	'BUILDING_JNR_TARGET_RANGE'
);
delete from RequirementSetRequirements where RequirementId in (
	'REQUIRES_CITY_HAS_BUILDING_CITY_POLICY_FORGING_IRON',
	'REQUIRES_CITY_HAS_BUILDING_CITY_POLICY_FREIGHT',
	'REQUIRES_CITY_HAS_BUILDING_CITY_POLICY_JIMI'
);