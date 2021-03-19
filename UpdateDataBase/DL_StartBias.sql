-------------------------------------
--  xiaoyu10101  --
-------------------------------------
--start bias(camp and pasture resources) for cree
insert or replace into StartBiasResources 
	(CivilizationType,		ResourceType,			Tier)
values
	('CIVILIZATION_CREE',	'RESOURCE_SHEEP',		4),				
	('CIVILIZATION_CREE',	'RESOURCE_CATTLE',		4),				
	('CIVILIZATION_CREE',	'RESOURCE_HORSES',		4),				
	('CIVILIZATION_CREE',	'RESOURCE_TRUFFLES',	4),				
	('CIVILIZATION_CREE',	'RESOURCE_IVORY',		4),				
	('CIVILIZATION_CREE',	'RESOURCE_FURS',		4),				
	('CIVILIZATION_CREE',	'RESOURCE_DEER',		4),
	('CIVILIZATION_CREE',	'RESOURCE_HONEY',		4);				

--start bias for Australia
update StartBiasResources set
	Tier = 4
where CivilizationType = 'CIVILIZATION_AUSTRALIA' and ResourceType = 'RESOURCE_SHEEP';

update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_AUSTRALIA' and  ResourceType = 'RESOURCE_CATTLE';

update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_AUSTRALIA'and ResourceType = 'RESOURCE_HORSES';

----start bias for Mali
update StartBiasResources set
	Tier = 4
where CivilizationType = 'CIVILIZATION_MALI' and ResourceType = 'RESOURCE_COPPER';

update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_MALI'and ResourceType = 'RESOURCE_DIAMONDS';

update StartBiasResources set
	Tier = 4
where CivilizationType = 'CIVILIZATION_MALI'and ResourceType = 'RESOURCE_JADE';

update StartBiasResources set
	Tier = 4	
where ResourceType = 'RESOURCE_MERCURY'	and CivilizationType = 'CIVILIZATION_MALI';

update StartBiasResources set
	Tier = 4	
where CivilizationType = 'CIVILIZATION_MALI' and ResourceType = 'RESOURCE_SALT';

update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_MALI' and ResourceType = 'RESOURCE_SILVER';

----start bias for Nubia
update StartBiasResources set
	Tier = 4	
where CivilizationType = 'CIVILIZATION_NUBIA'and ResourceType = 'RESOURCE_SILVER';

update StartBiasResources set
	Tier = 4	
where CivilizationType = 'CIVILIZATION_NUBIA'and ResourceType = 'RESOURCE_SALT';

update StartBiasResources set
	Tier = 4	
where CivilizationType = 'CIVILIZATION_NUBIA' and  ResourceType = 'RESOURCE_MERCURY';

update StartBiasResources set
	Tier = 4
where CivilizationType = 'CIVILIZATION_NUBIA' and ResourceType = 'RESOURCE_JADE';

update StartBiasResources set
	Tier = 4
where CivilizationType = 'CIVILIZATION_NUBIA'and ResourceType = 'RESOURCE_COPPER';

update StartBiasResources set
	Tier = 4	
where CivilizationType = 'CIVILIZATION_NUBIA' and ResourceType = 'RESOURCE_DIAMONDS';

update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_NUBIA'and ResourceType = 'RESOURCE_IRON';

update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_NUBIA' and ResourceType = 'RESOURCE_URANIUM';

update StartBiasResources set
	Tier = 4
where CivilizationType = 'CIVILIZATION_NUBIA' and ResourceType = 'RESOURCE_COAL';

update StartBiasResources set
	Tier = 4	
where CivilizationType = 'CIVILIZATION_NUBIA'and ResourceType = 'RESOURCE_NITER';

update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_NUBIA'and ResourceType = 'RESOURCE_ALUMINUM';

--start bias for England
update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_ENGLAND' and ResourceType = 'RESOURCE_COAL';

update StartBiasResources set
	Tier = 4	
where CivilizationType = 'CIVILIZATION_ENGLAND' and ResourceType = 'RESOURCE_IRON';

--start bias for Persia
update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_PERSIA' and ResourceType = 'RESOURCE_IRON';

--start bias for Macedon
update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_MACEDON' and ResourceType = 'RESOURCE_IRON';

update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_MACEDON' and ResourceType = 'RESOURCE_HORSES';

--start bias for Rome
update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_ROME' and ResourceType = 'RESOURCE_IRON';

--start bias for Kongo
update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_KONGO' and ResourceType = 'RESOURCE_IRON';

--start bias for Japan
update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_JAPAN' and ResourceType = 'RESOURCE_IRON';

--start bias for Norway
update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_NORWAY' and ResourceType = 'RESOURCE_IRON';

--start bias for Georgia
update StartBiasResources set
	Tier = 4		
where CivilizationType = 'CIVILIZATION_GEORGIA' and ResourceType = 'RESOURCE_IRON';

--- inca  start bias ajustments
update StartBiasTerrains set Tier = 1 where CivilizationType = 'CIVILIZATION_INCA' and TerrainType = 'TERRAIN_PLAINS_MOUNTAIN';
update StartBiasTerrains set Tier = 1 where CivilizationType = 'CIVILIZATION_INCA' and TerrainType = 'TERRAIN_GRASS_MOUNTAIN';
update StartBiasTerrains set Tier = 1 where CivilizationType = 'CIVILIZATION_INCA' and TerrainType = 'TERRAIN_DESERT_MOUNTAIN';

insert or replace into StartBiasTerrains
	(CivilizationType,	TerrainType,	Tier)
values
	('CIVILIZATION_INCA','TERRAIN_GRASS_HILLS',		3),
	('CIVILIZATION_INCA','TERRAIN_PLAINS_HILLS',	3);