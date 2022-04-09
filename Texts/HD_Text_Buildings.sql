--------------------------------------------------------------------------------
-- Language: en_US
insert or replace into EnglishText
    (Tag,                                                         Text)
values
    -- City Center Buildings
    --市中心改动（训练营，图腾，集市降价65->55）（图腾法典解锁）（工官，凯旋，测量额外产出+1->+2）（坎儿井住房变为基础产出）By Kekeya
    ("LOC_BUILDING_MONUMENT_EXPANSION1_DESCRIPTION",              "Provides +1 Loyalty per turn in this city. If the city already has maximum Loyalty, also provides an additional +1 [ICON_Culture] Culture. After Calendar is researched, provides an additional +1 [ICON_CULTURE] Culture."),
    ("LOC_BUILDING_WALLS_EARLY_NAME",                             "Simple Ancient Wall"),
    ("LOC_BUILDING_WALLS_EARLY_DESCRIPTION",                      "A building unique to your original capital. A Simple Wall that provides 25 outer defense."),
    ("LOC_BUILDING_GRANARY_DESCRIPTION",                          "Plantations and Camps over bonus resources provide +1 [ICON_Food] Food. [ICON_Food] Food consumption of [ICON_Citizen] citizens is reduced by 0.5 after completing Calendar."),
    ("LOC_BUILDING_NILOMETER_HD_NAME",                            "Nilometer"),
    ("LOC_BUILDING_NILOMETER_HD_DESCRIPTION",                     "+2 [ICON_Science] Science if the City Center is on Flood Plains.[NEWLINE][NEWLINE]May not be built in cities that already have a Triumphal Arch."),
    ("LOC_BUILDING_TRIUMPHAL_ARCH_NAME",                          "Triumphal Arch"),
    ("LOC_BUILDING_TRIUMPHAL_ARCH_DESCRIPTION",                   "+2 [ICON_Culture] Culture if this city has World Wonders.[NEWLINE][NEWLINE]May not be built in cities that already have a Nilometer."),
    ("LOC_BUILDING_KAREZ_NAME",                                   "Karez"),
    ("LOC_BUILDING_KAREZ_DESCRIPTION",                            "+1 [ICON_Food] Food if the City Center is on Hills or is adjacent to Mountains.[NEWLINE][NEWLINE]May not be built in cities that already have an Artizan Plaza or a Boot Camp."),
    ("LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_NAME",                  "Artisan Plaza"),
    ("LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_DESCRIPTION",           "+2 [ICON_Production] Production towards Districts, Buildings and Wonders if this city owns Quarries or Mines over Luxury or Bonus resources.[NEWLINE][NEWLINE]May not be built in cities that already have a Karez or Boot Camp."),
    ("LOC_BUILDING_BOOTCAMP_NAME",                                "Boot Camp"),
    ("LOC_BUILDING_BOOTCAMP_DESCRIPTION",                         "+2 [ICON_Production] Production towards Units if the city owns Pastures or Camps over resources, or Improvements over strategic resources.[NEWLINE][NEWLINE]May not be built in cities that already have a Karez or an Artisan Plaza."),
    ("LOC_BUILDING_FAIR_NAME",                                    "Fair"),
    ("LOC_BUILDING_FAIR_DESCRIPTION",                             "+2 [ICON_Gold] Gold if the City Center is locate on or adjacent to at least one Luxury resource.[NEWLINE][NEWLINE]May not be built in cities that already have a Totem."),
    ("LOC_BUILDING_TOTEMS_NAME",                                  "Totem"),
    ("LOC_BUILDING_TOTEMS_DESCRIPTION",                           "+2 [ICON_FAITH] Faith if the City Center is adjacent to Mountains or Forests or Rainforest.[NEWLINE][NEWLINE]May not be built in cities that already have a Fair."),
    ("LOC_BUILDING_TSIKHE_DESCRIPTION_XP2",                       "A building unique to Georgia. Lower [ICON_Production] Production cost and higher outer defenses than Renaissance Walls. Provides +5 [ICON_TOURISM] Tourism after advancing to the Conservation Civic. Provides +4 [ICON_Faith] Faith. When in a Golden Age, +300% [ICON_TOURISM] Tourism and +300% [ICON_FAITH] Faith."),
    ("LOC_BUILDING_SEWER_DESCRIPTION",                            "+20% Growth rate in this city."),
    -- Campus
    ("LOC_BUILDING_LIBRARY_DESCRIPTION",                          "After Paper Making is researched, [ICON_Citizen] Citizens in this city provide +0.3 [ICON_SCIENCE] Science."),
    ("LOC_BUILDING_UNIVERSITY_DESCRIPTION",                       "[ICON_CITIZEN] Citizens in this city provide +0.5 [ICON_SCIENCE] Science. Campus districts get standard adjacency bonus from Rainforests. +5% [ICON_SCIENCE] Science in this city after completing Scientific Theory."),
    ("LOC_BUILDING_MADRASA_DESCRIPTION",                          "A building unique to Arabia. Bonus [ICON_Faith] Faith equal to the adjacency bonus of the Campus district. [ICON_CITIZEN] Citizens in this city provide +0.5 [ICON_SCIENCE] Science. Campus districts get standard adjacency bonus from Rainforests, desert and desert hills. +5% [ICON_SCIENCE] Science in this city after completing Scientific Theory."),
    ("LOC_BUILDING_NAVIGATION_SCHOOL_DESCRIPTION",                "A building unique to Portugal. +25% [ICON_PRODUCTION] Production towards naval units in this city. +1 [ICON_SCIENCE] Science for every two coast or lake tiles in this city. +2 [ICON_GreatAdmiral] Great Admiral points. [ICON_CITIZEN] Citizens in this city provide +0.5 [ICON_SCIENCE] Science. Campus districts get standard adjacency bonus from Rainforests. +5% [ICON_SCIENCE] Science in this city after completing Scientific Theory."),
    ("LOC_BUILDING_RESEARCH_LAB_DESCRIPTION",                     "+5% [ICON_SCIENCE] Science in this city. +10% [ICON_SCIENCE] Science if this city is fully powered. "),
    -- Theater
    ("LOC_BUILDING_MARAE_DESCRIPTION",                            "A building unique to the Māori. +2 [ICON_CULTURE] Culture and +2 [ICON_FAITH] Faith to all of this city's tiles with a passable feature or natural wonder. +1 [ICON_CULTURE] Culture for every three coast or lake tiles in this city. After Flight is researched, receive +1 [ICON_TOURISM] Tourism to all of this city's tiles with a feature or natural wonder. Has no Great Work slots."),
    ("LOC_BUILDING_MUSEUM_ARTIFACT_DESCRIPTION",                  "Holds [ICON_GreatWork_Artifact] Artifacts. May not be built in a Theater Square district that already has an Art Museum. +5% [ICON_CULTURE] Culture in this city."),
    ("LOC_BUILDING_MUSEUM_ART_DESCRIPTION",                       "Holds [ICON_GreatWork_Landscape] Great Works of Art. May not be built in a Theater Square district that already has an Archaeological Museum. +5% [ICON_CULTURE] Culture in this city."),
    ("LOC_BUILDING_FILM_STUDIO_EXPANSION2_DESCRIPTION",           "A building unique to America. +100% [ICON_Tourism] Tourism pressure from this city towards other civilizations in the Industrial era. +5% [ICON_CULTURE] Culture in this city. +5% [ICON_CULTURE] culture if this city is fully powered."),
    ("LOC_BUILDING_BROADCAST_CENTER_DESCRIPTION",                 "+5% [ICON_CULTURE] Culture in this city. +5% [ICON_CULTURE] Culture if this city is fully powered. "),
    -- Industrial Zone
    ("LOC_BUILDING_WORKSHOP_DESCRIPTION",                         "Mines in this city gain +1 [ICON_PRODUCTION] Production. +5% [ICON_Production] Production towards wonders, districts and buildings in this city."), -- , Quarries and Lumber Mills
    ("LOC_BUILDING_FACTORY_DL_DESCRIPTION",                       "+1 [ICON_Production] production for each [ICON_RESOURCE_COAL] Coal in this city. +10% [ICON_Production] Production towards wonders, districts and buildings in this city. All [ICON_Citizen] citizens in this city provide +0.5 [ICON_PRODUCTION] Production."),
    ("LOC_BUILDING_ELECTRONICS_FACTORY_EXPANSION2_DESCRIPTION",   "A building unique to Japan. Provides +4 [ICON_Culture] Culture to this city after researching the Electricity technology. +1 [ICON_Production] production for each [ICON_RESOURCE_COAL] Coal in this city. +10% [ICON_Production] Production towards wonders, districts and buildings in this city. All [ICON_Citizen] citizens in this city provide +0.5 [ICON_PRODUCTION] Production."),
    ("LOC_BUILDING_COAL_POWER_PLANT_DL_DESCRIPTION",              "Automatically converts any amount of [ICON_RESOURCE_COAL] Coal into [ICON_Power] Power for cities within 6 tiles that need it each turn, at the rate of:[NEWLINE][ICON_Bullet]1 [ICON_RESOURCE_COAL] Coal [ICON_PowerRight] 4 [ICON_Power] Power[NEWLINE][ICON_Bullet] Heavy CO2 into the atmosphere.[NEWLINE]+10% [ICON_Production] Production towards wonders, districts and buildings in this city."),
    ("LOC_BUILDING_FOSSIL_FUEL_POWER_PLANT_DL_DESCRIPTION",       "Automatically converts any amount of [ICON_RESOURCE_OIL] Oil into [ICON_Power] Power for cities within 6 tiles that need it each turn, at the rate of:[NEWLINE][ICON_Bullet]1 [ICON_RESOURCE_OIL] Oil [ICON_PowerRight] 4 [ICON_Power] Power[NEWLINE][ICON_Bullet] Moderate CO2 into the atmosphere[NEWLINE]Its [ICON_Production] Production bonus is extended to all City Centers within 6 tiles that do not already have a bonus from a Power Plant building.[NEWLINE]+10% [ICON_Production] Production towards wonders, districts and buildings in this city."),
    ("LOC_BUILDING_POWER_PLANT_DL_DESCRIPTION",                   "Automatically converts any amount of [ICON_RESOURCE_URANIUM] Uranium into [ICON_Power] Power for cities within 6 tiles that need it each turn, at the rate of:[NEWLINE][ICON_Bullet]1 [ICON_RESOURCE_URANIUM] Uranium [ICON_PowerRight] 16 [ICON_Power] Power[NEWLINE][ICON_Bullet]Miniscule CO2 into the atmosphere[NEWLINE]Once built, as a Nuclear Power Plant ages, there is an increased chance for a Nuclear Accident to occur. Its [ICON_Production] Production and [ICON_Science] Science bonus is extended to all City Centers within 6 tiles that do not already have a bonus from a Power Plant building.[NEWLINE]+10% [ICON_Production] Production towards wonders, districts and buildings in this city."),
    -- Holy Site
    ("LOC_BUILDING_SHRINE_DESCRIPTION",                           "Allows the purchasing of Builders using [ICON_Faith] Faith. Allows the purchasing of Missionaries (can only be purchased with [ICON_Faith] Faith)."),
    ("LOC_BUILDING_TEMPLE_DESCRIPTION",                           "Allows the purchasing of Settlers using [ICON_Faith] Faith. Allows the purchasing of Apostles, Gurus, Inquisitors, and with the proper belief, Warrior Monks (these units can only be purchased with [ICON_Faith] Faith). +5% [ICON_Faith] Faith in this city. "),
    -- ("LOC_BUILDING_PRASAT_EXPANSION2_DESCRIPTION",                "A building unique to Khmer. +6 [ICON_FAITH] Faith. Replaces the Temple. Allows the purchasing of Settlers using [ICON_Faith] Faith. Allows the purchasing of Apostles, Gurus, Inquisitors, and with the proper belief, Warrior Monks (these units can only be purchased with [ICON_Faith] Faith). [ICON_CITIZEN] Citizens in this is provide +0.5 [ICON_Culture] Culture. Once Flight is researched, receive +10 [ICON_Tourism] Tourism if the city [ICON_CITIZEN] population is 10 or higher, and +20 [ICON_Tourism] Tourism if the city [ICON_CITIZEN] population is 20 or higher. +5% [ICON_Faith] Faith in this city."),
    ("LOC_BUILDING_PRASAT_EXPANSION2_DESCRIPTION",                "A building unique to Khmer. Replaces the Temple. Allows the purchasing of Settlers using [ICON_Faith] Faith. Allows the purchasing of Apostles, Gurus, Inquisitors, and with the proper belief, Warrior Monks (these units can only be purchased with [ICON_Faith] Faith). [ICON_CITIZEN] Citizens in this is provide +0.5 [ICON_Culture] Culture. +5% [ICON_Faith] Faith in this city."),
    ("LOC_BUILDING_STAVE_CHURCH_DESCRIPTION",                     "A building unique to Norway. Allows the purchasing of Settlers using [ICON_Faith] Faith. Allows the purchasing of Apostles, Gurus, Inquisitors, and with the proper belief, Warrior Monks (these units can only be purchased with [ICON_Faith] Faith). Holy Site districts get an additional standard adjacency bonus from Woods. +1 [ICON_PRODUCTION] Production to each coastal Resource tile in this city. +1 [ICON_Food] Food to each Forest tile in this city. +5% [ICON_Faith] Faith in this city."), --+1 [ICON_TradeRoute] Trade Route capacity. 
    ("LOC_BUILDING_MOSQUE_DL_DESCRIPTION",                        "Missionary and Apostles created here have +1 spread. All Religious units created in this city receive +3 [ICON_Strength] Combat Strength in religious combats."),
    ("LOC_BUILDING_PAGODA_DL_DESCRIPTION",                        "+10% [ICON_CULTURE] Culture in this city."),
    ("LOC_BUILDING_WAT_DL_DESCRIPTION",                           "+10% [ICON_SCIENCE] Science in this city."),
    ("LOC_BUILDING_SYNAGOGUE_DL_DESCRIPTION",                     "+10% [ICON_FAITH] Faith in this city."),
    ("LOC_BUILDING_GURDWARA_DL_DESCRIPTION",                      "+10% [ICON_Food] Food in this city."),
    ("LOC_BUILDING_MEETING_HOUSE_DL_DESCRIPTION",                 "+10% [ICON_PRODUCTION] Production in this city."),
    ("LOC_BUILDING_STUPA_DL_DESCRIPTION",                         "+1 [ICON_AMENITIES] Amenity for every Luxury resource this city has improved."),
    ("LOC_BUILDING_CATHEDRAL_DL_DESCRIPTION",                     "Can hold a [ICON_GreatWork_Landscape] Great Work of Art.[NEWLINE] +100% [ICON_CULTURE] Culture and +100% [ICON_Tourism] Tourism for Great Works of Art in this city."),
    ("LOC_BUILDING_DAR_E_MEHR_DL_DESCRIPTION",                    "+2 additional [ICON_FAITH] Faith for each era since constructed or last repaired. Gain a Missionary unit after finishing construction."),
    -- Encampment
    ("LOC_BUILDING_BARRACKS_EXPANSION2_DESCRIPTION",              "+25% combat experience for all melee, anti-cavalry, ranged, and ranged cavalry land units trained in this city.[NEWLINE][NEWLINE]May not be built in an Encampment district that already has a Stable.[NEWLINE][NEWLINE]+2 [ICON_PRODUCTION] Production to each improved [ICON_RESOURCE_IRON] Iron in this city. +2 [ICON_Strength] Combat strength for all melee, ranged, anti-cavalry units trained in this city."),
    ("LOC_BUILDING_BASILIKOI_PAIDES_EXPANSION2_DESCRIPTION",      "A building unique to Macedon, replaces the Barracks building and is unlocked earlier. +25% combat experience for all melee, ranged land units, and Hetairoi trained in this city. Gain [ICON_SCIENCE] Science equal to 25% of the unit's cost when a non civilian unit is created in this city.[NEWLINE][NEWLINE]May not be built in an Encampment district that already has a Stable.[NEWLINE][NEWLINE]+2 [ICON_PRODUCTION] Production to each improved [ICON_RESOURCE_IRON] Iron in this city. +3 [ICON_Strength] Combat strength for all land combat, ranged and Hetairoi trained in this city."),
    ("LOC_BUILDING_STABLE_EXPANSION2_DESCRIPTION",                "+25% combat experience for all cavalry and siege class units trained in this city.[NEWLINE][NEWLINE]May not be built in an Encampment district that already has a Barracks.[NEWLINE][NEWLINE]+2 [ICON_PRODUCTION] Production to each improved [ICON_RESOURCE_HORSES] Horses in this city. +2 [ICON_Strength] Combat strength for all cavalry and siege units trained in this city."),
    ("LOC_BUILDING_ORDU_EXPANSION2_DESCRIPTION",                  "A building unique to Mongolia. Grants an ability that gives +1 [ICON_MOVEMENT] Movement to Heavy and Light Cavalry trained in this city. +25% combat experience for all cavalry and siege class units trained in this city.[NEWLINE][NEWLINE]May not be built in an Encampment district that already has a Barracks.[NEWLINE][NEWLINE]May not be built in an Encampment district that already has a Stable.[NEWLINE][NEWLINE]+2 [ICON_PRODUCTION] Production to each improved [ICON_RESOURCE_HORSES] Horses. +3 [ICON_Strength] Combat strength for all cavalry and siege units, and Keshig trained in this city."),
    ("LOC_BUILDING_ARMORY_EXPANSION2_DESCRIPTION",                "+25% combat experience for all land units trained in this city.[NEWLINE]Strategic Resource Stockpiles increased +30 (on Standard Speed). [NEWLINE][NEWLINE]+1 [ICON_Production] Production to all [ICON_Resource_Niter] Niter and [ICON_Resource_Oil] Oil in this city. Military units trained in this city start with a free promotion."),
    ("LOC_BUILDING_MILITARY_ACADEMY_EXPANSION2_DESCRIPTION",      "+25% combat experience for all land units trained in this city.[NEWLINE]Allows Corps and Armies to be trained directly. Corps and Army training costs reduced 25%. [NEWLINE][NEWLINE]+1 [ICON_Production] Production to all [ICON_Resource_Aluminum] Aluminum and [ICON_Resource_Uranium] Uranium in this city. +10% accumulation rate for [ICON_GREATGENERAL] Great General Points for player. +3 [ICON_STRENGTH] Combat Strength for all land units trained in this city."),
    -- Commercial Hub
    ("LOC_BUILDING_MARKET_EXPANSION1_DESCRIPTION",                "+1 [ICON_TradeRoute] Trade Route capacity."),
    --("LOC_BUILDING_SUKIENNICE_EXPANSION1_DESCRIPTION",            "A building unique to Poland. International [ICON_TradeRoute] Trade Routes from this city gain +2 [ICON_Production] Production. Domestic [ICON_TradeRoute] Trade Routes gain +4 [ICON_Gold] Gold. +1 [ICON_TradeRoute] Trade Route capacity. +2 [ICON_gold] Gold and +1 [Icon_production] Production to all luxuary within this city."),
    ("LOC_BUILDING_SUKIENNICE_EXPANSION1_DESCRIPTION",            "A building unique to Poland. International [ICON_TradeRoute] Trade Routes from this city gain +2 [ICON_Production] Production. Domestic [ICON_TradeRoute] Trade Routes gain +4 [ICON_Gold] Gold. +1 [ICON_TradeRoute] Trade Route capacity. +2 [ICON_gold] Gold to all Districts in this city."),
    ("LOC_BUILDING_GRAND_BAZAAR_DESCRIPTION",                     "A building unique to the Ottomans. Accumulate 1 extra Strategic resource for every different type of Strategic resource this city has improved. +1 [ICON_AMENITIES] Amenity for every Luxury resource this city has improved. +5% [ICON_gold] Gold yield in this city."),
    ("LOC_BUILDING_BANK_DESCRIPTION",                             "+5% [ICON_gold] Gold in this city."),
    ("LOC_BUILDING_STOCK_EXCHANGE_DESCRIPTION",                   "+5% [ICON_gold] Gold in this city. +5% [ICON_GOLD] Gold if the city is fully powered."),
    -- Harbor
    ("LOC_BUILDING_LIGHTHOUSE_EXPANSION2_DESCRIPTION",            "+25% combat experience for all naval units trained in this city. +1 [ICON_Food] Food on all Coast tiles for this city. +1 [ICON_TradeRoute] Trade Route capacity. +1 [ICON_Food] Food to each coastal resource in this city."), -- each [ICON_Resource_Fish] Fish, [ICON_Resource_Crabs] Crabs, [ICON_Resource_Whales] Whales, [ICON_Resource_Pearls] Pearls
    ("LOC_BUILDING_SHIPYARD_EXPANSION2_DESCRIPTION",              "+25% combat experience for all naval units trained in this city. Bonus [ICON_Production] Production equal to adjacency bonus of the Harbor district. +1 [ICON_Production] Production on all Coast and Lake tiles for this city. +25% [ICON_PRODUCTION] production towards all naval units."),
    ("LOC_BUILDING_SEAPORT_DESCRIPTION",                          "+25% combat experience for all naval units trained in this city. Allows Fleets and Armadas to be trained directly. Fleet and Armada training costs reduced by 25%. +2 [ICON_GOLD] Gold on all Coast tiles for this city. Bonus [ICON_FOOD] Food equal to adjacency bonus of the Harbor district.[NEWLINE]+10% accumulation rate for [ICON_GREATADMIRAL] Great Admiral Points. +3 [ICON_STRENGTH] Combat Strength for all navy units trained in this city."),
    -- Government
    ("LOC_BUILDING_GOV_TALL_DESCRIPTION",                         "+1 [ICON_Amenities] Amenity, +2 [ICON_Housing] Housing and +15% Growth rate in all cities.[NEWLINE]+15% [ICON_Production] Production towards wonders and buildings in this city.[NEWLINE]Awards +1 [ICON_Governor] Governor Title."),
    ("LOC_BUILDING_GOV_CONQUEST_DESCRIPTION",                     "Capturing an enemy City grants +15% [ICON_Production] Production in all Cities for 5 turns.[NEWLINE]+20% [ICON_Production] Production toward all military units in this city.[NEWLINE]+100% yields gained from pilaging and coastal raids.[NEWLINE]Awards +1 [ICON_Governor] Governor Title."),
    ("LOC_BUILDING_GOV_CITYSTATES_NAME",                          "Secretariat"),
    ("LOC_BUILDING_GOV_CITYSTATES_EXPANSION2_DESCRIPTION",        "All your cities on your original [ICON_Capital] Capital's continent gain +7% [ICON_Food] Food, +7% [ICON_Production] Production and +7% [ICON_Gold] Gold. These bonus double with a [ICON_Governor] Governor.[NEWLINE]Awards +1 [ICON_Governor] Governor Title."),
    ("LOC_BUILDING_GOV_FAITH_NAME",                               "Episcopal Church"),
    ("LOC_BUILDING_GOV_FAITH_DESCRIPTION",                        "Receive [ICON_Science] Science and [ICON_Culture] Culture equal to 10% of your [ICON_Faith] Faith generation in all cities.[NEWLINE]Religious units are 20% cheaper to purchase in all cities. +5 [ICON_Religion] Religious Combat in Theological Combat.[NEWLINE] +2 [ICON_Science] Science and [ICON_Culture] Culture for each foreign city following your Religion.[NEWLINE]Awards +1 [ICON_Governor] Governor Title."),
    ("LOC_BUILDING_GOV_SPIES_DESCRIPTION",                        "Receive one Spy and +1 Spy capacity. +1 [ICON_VisLimited] Visibility level on all other Civs. [NEWLINE]All Spy Operations have a higher chance of success. Spy mission time reduces by 25%. Your Spy units can choose from any possible promotion. [NEWLINE]+50% [ICON_Production] toward Spies in all Cities.[NEWLINE]Awards +1 [ICON_Governor] Governor Title."),
    -- ("LOC_BUILDING_GOV_SCIENCE_DESCRIPTION",                      "Campus Buildings provide [ICON_Production] Production equal to their intrinsic [ICON_Science] Science output.[NEWLINE]Industrial Zone Buildings provide [ICON_Science] Science equal to their intrinsic [ICON_Production] Production output.[NEWLINE]Awards +1 [ICON_Governor] Governor Title."),
    ("LOC_BUILDING_GOV_MILITARY_DESCRIPTION",                     "All military units gain +1 [ICON_Movement] Movement and +3 [ICON_Strength] Combat Strength.[NEWLINE]Unit maintenance cost reduced by 2 [ICON_Gold] Gold per turn, per unit.[NEWLINE]25% [ICON_Gold] Gold and Resource discount on all unit upgrades.[NEWLINE]Awards +1 [ICON_Governor] Governor Title."),
    ("LOC_BUILDING_GOV_CULTURE_DESCRIPTION",                      "Provides 4 slots for any Great Work. Themed when displaying objects from the same era. [NEWLINE]Awards +1 [Icon_Governor] Governor Title."),
    ("LOC_ABILITY_GOV_FAITH_COMBAT_STRENGTH_DESCRIPTION",         "+5 [ICON_Religion] Religious Combat Strength from Episcopal Church."),
    ("LOC_ABILITY_GOV_MILITARY_MOVEMENT_DESCRIPTION",             "+1 [ICON_Movement] Movement from War Department."),
    ("LOC_ABILITY_GOV_MILITARY_COMBAT_STRENGTH_DESCRIPTION",      "+3 [ICON_Strength] Movement from War Department."),
    -- Diplomatic Quarter
    ("LOC_BUILDING_CONSULATE_DESCRIPTION",                        "+2 Influence Points per turn. Enemy Spy's level is reduced by 1 when targeting this city or cities with Encampments. Leveraging City States costs 20% less [ICON_Gold] Gold. Gain +1 [ICON_ENVOY] Envoy."),
    ("LOC_BUILDING_CHANCERY_DESCRIPTION",                         "+3 Influence Points per turn.  When this civilization captures or kills an enemy Spy, receive 50 [ICON_Science] Science for every level of the enemy Spy. Alliance Points with all allies increase by an additional 0.5 per turn. Gain +1 [ICON_ENVOY] Envoy."),
    -- Entertainment Complex
    ("LOC_BUILDING_ARENA_EXPANSION1_DESCRIPTION",                 "Provides 1 [ICON_TOURISM] Tourism after advancing to the Conservation Civic. "),
    ("LOC_BUILDING_TLACHTLI_XP1_DESCRIPTION",                     "A building unique to the Aztecs. +1 [ICON_Amenities] Amenity, +2 [ICON_Culture] Culture, +2 [ICON_Faith] Faith. +1 [ICON_GreatGeneral] Great General Point per turn. +1 [ICON_TOURISM] Tourism after advancing to the Conservation Civic. "),
    ("LOC_BUILDING_STADIUM_DL_DESCRIPTION",                       "+2 [ICON_Tourism] Tourism if the city [ICON_CITIZEN] population is 10 or higher. +5 [ICON_Tourism] Tourism if the city [ICON_CITIZEN] population is 20 or higher."),
    ("LOC_BUILDING_ZOO_EXPANSION1_DESCRIPTION",                   "After Biology is researched, +1 [ICON_Food] Food, +1 [ICON_Culture] Culture and +3 [ICON_Gold] Gold from Camps and Pastures with resources in this city."),
    ("LOC_BUILDING_THERMAL_BATH_DESCRIPTION",                     "+2 [ICON_FAITH] Faith, +2 [ICON_CULTURE] Culture to Geothermal fissures in cities within 6 tiles. After Chemistry is researched, +2 [ICON_SCIENCE] Science additionally.[NEWLINE]+2 extra [ICON_AMENITIES] Amenity if cities within 6 tiles have any Geothermal fissure."),
    -- Water Entertainment Complex
    ("LOC_BUILDING_FERRIS_WHEEL_DESCRIPTION_HD",                  "+3 [ICON_Tourism] Tourism."),
    ("LOC_BUILDING_AQUATICS_CENTER_DL_DESCRIPTION",               "+2 [ICON_Tourism] Tourism for each Wonder built in this city on or adjacent to a Coast tile."),
    ("LOC_BUILDING_AQUARIUM_DL_DESCRIPTION",                      "After Biology is researched, +1 [ICON_Food] Food, +1 [ICON_PRODUCTION] Production and +3 [ICON_Gold] Gold from marine features or Fishing Boats with resources in this city."),
    -- Aerodrome
    ("LOC_BUILDING_HANGAR_DESCRIPTION",                           "+25% combat experience for air units trained in this city. +2 air unit slot in Aerodrome district. +50% [Icon_Production] Production towards Air Units."),
    ("LOC_BUILDING_AIRPORT_DESCRIPTION",                          "+100% [ICON_TOURISM] Tourism from Wonders, and +50% [ICON_TOURISM] Tourism from Improvements, Great Works in this city if is fully [ICON_POWER] Powered. This bonus is extended to all cities within 4 tiles that do not already have a bonus from another Airport. [NEWLINE] +50% combat experience for air units trained in this city. Allows the ability to airlift land units between Aerodrome districts with Airports after the Rapid Deployment civic is unlocked."),
    ("LOC_BUILDING_AIRPORT_DESCRIPTION_PRODUCT",                  "+100% [ICON_TOURISM] Tourism from Wonders, and +50% [ICON_TOURISM] Tourism from Improvements, Great Works, Products in this city if is fully [ICON_POWER] Powered. This bonus is extended to all cities within 4 tiles that do not already have a bonus from another Airport. [NEWLINE] +50% combat experience for air units trained in this city. Allows the ability to airlift land units between Aerodrome districts with Airports after the Rapid Deployment civic is unlocked."),
    -- Neighborhood
    ("LOC_BUILDING_FOOD_MARKET_DESCRIPTION",                      "+10% growth rate in the city. If the city has sufficient [ICON_Power] Power, +5% growth rate in the city."),
    ("LOC_BUILDING_SHOPPING_MALL_DESCRIPTION",                    "+10% [ICON_gold] Gold in the city. If the city has sufficient [ICON_Power] Power, +5% [ICON_gold] in the city."),
    ("LOC_BUILDING_FOOD_MARKET_DESCRIPTION_CORP",                 "+10% growth rate in the city. If the city has sufficient [ICON_Power] Power, +5% growth rate in the city. [NEWLINE] If the city has sufficient [ICON_Power] Power, all [ICON_GreatWork_Product] Products in the city yields twice as much [ICON_FOOD] Food and [ICON_PRODUCTION] Production. This bonus is extended to city centers within a six-tile radius from the Shopping Mall, as long as they do not have the same bonus from another Shopping Mall."),
    ("LOC_BUILDING_SHOPPING_MALL_DESCRIPTION_CORP",               "+10% [ICON_gold] Gold in the city. If the city has sufficient [ICON_Power] Power, +5% [ICON_gold] in the city. [NEWLINE] If they city has sufficient [ICON_Power] Power, all [ICON_GreatWork_Product] Products in the city yields twice as much [ICON_gold] Gold and 1.5 times as much [ICON_SCIENCE] Science and [ICON_CULTURE] Culture. This bonus is extended to city centers within a six-tile radius from the Shopping Mall, as long as they do not have the same bonus from another Shopping Mall."),
    -- Dam
    ("LOC_BUILDING_HYDROELECTRIC_DAM_DESCRIPTION",                "Provides the city +6 [ICON_Power] Power from renewable water sources. +1 [ICON_Production] Production to all tiles that are adjacent to river in this city. "),
    -- Governor Building
    ("LOC_BUILDING_GENERAL_SERVICE_NAME",                         "General Services Office"),
    ("LOC_BUILDING_GENERAL_SERVICE_DESCRIPTION",                  "When the Governor Magnus with the Promotion ""General Services Officer"" is estabilished in this city, the General Service Office can provide +4 [ICON_Food] Food, +4 [ICON_Production] Production, +4 [ICON_Science] Science and +4 [ICON_Culture] Culture to the cities within 8 tiles (this city included). Can only construct when Governor Magnus with General Services Officer Title is established within 8 tiles.");

--------------------------------------------------------------------------------
-- Language: zh_Hans_CN
insert or replace into LocalizedText
    (Language,      Tag,                                                         Text)
values
    -- 市中心建筑
    --市中心改动（训练营，图腾，集市降价65->55）（图腾法典解锁）（工官，凯旋，测量额外产出+1->+2）（坎儿井住房变为基础产出）By Kekeya
    ("zh_Hans_CN",  "LOC_BUILDING_MONUMENT_EXPANSION1_DESCRIPTION",              "使此城每回合的忠诚度+1。如城市忠诚度已达最高，则额外+1 [ICON_Culture] 文化值。研究“历法”科技后，额外+1 [ICON_Culture] 文化值。"),
    ("zh_Hans_CN",  "LOC_BUILDING_WALLS_EARLY_NAME",                             "简易远古城墙"),
    ("zh_Hans_CN",  "LOC_BUILDING_WALLS_EARLY_DESCRIPTION",                      "只提供25点外部防御的简易城墙，无法建造，只会被赠送在原始首都。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GRANARY_DESCRIPTION",                          "本城改良加成资源的种植园和营地+1 [ICON_Food] 食物。研究“历法”科技后，每 [ICON_Citizen] 市民消耗的 [ICON_Food] 食物减少0.5。"),
    ("zh_Hans_CN",  "LOC_BUILDING_NILOMETER_HD_NAME",                            "测量仪"),
    ("zh_Hans_CN",  "LOC_BUILDING_NILOMETER_HD_DESCRIPTION",                     "如果市中心位于泛滥平原上，则额外+2 [ICON_Science] 科技值。[NEWLINE][NEWLINE]无法建造在已有凯旋门的城市中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_TRIUMPHAL_ARCH_NAME",                          "凯旋门"),
    ("zh_Hans_CN",  "LOC_BUILDING_TRIUMPHAL_ARCH_DESCRIPTION",                   "如果城市中拥有至少1个世界奇观，则额外+2 [ICON_Culture] 文化值。[NEWLINE][NEWLINE]无法建造在已有测量仪的城市中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_KAREZ_NAME",                                   "坎儿井"),
    ("zh_Hans_CN",  "LOC_BUILDING_KAREZ_DESCRIPTION",                            "如果市中心位于丘陵之上或靠近山脉则额外+1 [ICON_Food] 食物。[NEWLINE][NEWLINE]无法建造在已有工官或训练营的城市中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_NAME",                  "工官"),
    ("zh_Hans_CN",  "LOC_BUILDING_OFFICIAL_RUN_HANDCRAFT_DESCRIPTION",           "如果城市拥有改良奢侈或加成资源的矿山或采石场，则额外建造区域、建筑和奇观时+2 [ICON_Production] 生产力。[NEWLINE][NEWLINE]无法建造在已有坎儿井或训练营的城市中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_BOOTCAMP_NAME",                                "训练营"),
    ("zh_Hans_CN",  "LOC_BUILDING_BOOTCAMP_DESCRIPTION",                         "如果城市拥有改良资源的牧场或营地，或是改良战略资源的改良设施，则建造单位时+2 [ICON_Production] 生产力。[NEWLINE][NEWLINE]无法建造在已有坎儿井或工官的城市中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_FAIR_NAME",                                    "集市"),
    ("zh_Hans_CN",  "LOC_BUILDING_FAIR_DESCRIPTION",                             "如果市中心拥有或与至少一个奢侈资源相邻，则额外+2 [ICON_Gold] 金币。[NEWLINE][NEWLINE]无法建造在已有图腾柱的城市中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_TOTEMS_NAME",                                  "图腾柱"),
    ("zh_Hans_CN",  "LOC_BUILDING_TOTEMS_DESCRIPTION",                           "如果市中心与山脉或森林或雨林相邻，则额外+2 [ICON_FAITH] 信仰值。[NEWLINE][NEWLINE]无法建造在已有集市的城市中。"),
    ("zh_Hans_CN",  "LOC_BUILDING_SEWER_DESCRIPTION",                            "本城的余粮+20%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_TSIKHE_DESCRIPTION_XP2",                       "格鲁吉亚特色建筑。[ICON_Production] 生产力花费低于比文艺复兴城墙，并拥有更强的外部防御力。获得“保护地球”市政后提供+5点 [ICON_TOURISM] 旅游业绩。提供+4 [ICON_Faith] 信仰值。进入黄金时代后 [ICON_TOURISM] 旅游业绩与 [ICON_FAITH] 信仰值均+300%。"),
    -- 学院
    ("zh_Hans_CN",  "LOC_BUILDING_LIBRARY_DESCRIPTION",                          "研究造纸术科技后，城市中每位 [ICON_Citizen] 公民 +0.3 [ICON_SCIENCE] 科技值产出。"),
    ("zh_Hans_CN",  "LOC_BUILDING_UNIVERSITY_DESCRIPTION",                       "每位 [ICON_CITIZEN] 市民+0.5 [ICON_Science] 科技值。本城的学院获得雨林的标准相邻加成。研究“科学理论”后本城 [ICON_SCIENCE] 科技值+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_MADRASA_DESCRIPTION",                          "阿拉伯特色建筑。提供与学院区的相邻加成等量的 [ICON_Faith] 信仰值。每位 [ICON_CITIZEN] 市民+0.5 [ICON_Science] 科技值。本城的学院获得雨林、沙漠和沙漠丘陵的标准相邻加成。研究“科学理论”后本城 [ICON_SCIENCE] 科技值+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_NAVIGATION_SCHOOL_DESCRIPTION",                "葡萄牙特色建筑。在此城中生产海军单位时+25%生产力。此城中每拥有2个海岸或湖泊单元格，则+1 [ICON_SCiENCE] 科技值。+2 [ICON_GreatAdmiral] 海军统帅点数。每位 [ICON_CITIZEN] 市民+0.5 [ICON_Science] 科技值。本城的学院获得雨林的标准相邻加成。研究“科学理论”后本城 [ICON_SCIENCE] 科技值+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_RESEARCH_LAB_DESCRIPTION",                     "本城 [ICON_SCIENCE] 科技值+5%。通电后额外为本城+10% [ICON_SCIENCE] 科技值。"),
    -- 剧院
    ("zh_Hans_CN",  "LOC_BUILDING_MARAE_DESCRIPTION",                            "毛利特色建筑。城市中所有包含可通行地貌或自然奇观的单元格+2 [ICON_CULTURE] 文化值与 [ICON_FAITH] 信仰值。此城中每拥有3个海岸或湖泊单元格，则+1 [ICON_CULTURE] 文化值。研究“飞行”科技后，城市中所有包含地貌或自然奇观的单元格+1 [ICON_TOURISM] 旅游业绩。无巨作槽位。"),
    ("zh_Hans_CN",  "LOC_BUILDING_MUSEUM_ARTIFACT_DESCRIPTION",                  "可存放 [ICON_GreatWork_Artifact] 文物。如果在剧院广场区域已经有一座艺术博物馆则无法修建。[NEWLINE]本城 [ICON_CULTURE] 文化值+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_MUSEUM_ART_DESCRIPTION",                       "可存放 [ICON_GreatWork_Landscape] 艺术巨作。如果在剧院广场区域已经有一座考古博物馆则无法修建。[NEWLINE]本城 [ICON_CULTURE] 文化值+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_BROADCAST_CENTER_DESCRIPTION",                 "本城 [ICON_CULTURE] 文化值+5%，通电后额外为本城+5% [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_BUILDING_FILM_STUDIO_EXPANSION2_DESCRIPTION",           "美国特色建筑。对进入工业时代的文明，本城+100% [ICON_Tourism] 旅游业绩。本城 [ICON_CULTURE] 文化值+5%，通电后额外为本城+5% [ICON_CULTURE] 文化值。"),
    -- 工业
    ("zh_Hans_CN",  "LOC_BUILDING_WORKSHOP_DESCRIPTION",                         "为本城的矿山+1 [ICON_PRODUCTION] 生产力。本城建造区域、建筑和奇观+5% [ICON_PRODUCTION] 生产力。"), -- 、采石场和伐木场
    ("zh_Hans_CN",  "LOC_BUILDING_FACTORY_DL_DESCRIPTION",                       "为本城的 [ICON_RESOURCE_COAL] 煤资源+1 [ICON_PRODUCTION] 生产力，本城建造区域、建筑和奇观+10% [ICON_PRODUCTION] 生产力。本城每位 [ICON_Citizen] 公民+0.5 [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_ELECTRONICS_FACTORY_EXPANSION2_DESCRIPTION",   "日本特色建筑。研究“电力”科技后为此城市提供+4 [ICON_Culture] 文化值。为本城的 [ICON_RESOURCE_COAL] 煤资源+1 [ICON_Production] 生产力，本城建造区域、建筑和奇观+10% [ICON_Production] 生产力。本城每个人口获得0.5 [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_COAL_POWER_PLANT_DL_DESCRIPTION",              "将任意数额的 [ICON_RESOURCE_COAL] 煤自动转换为 [ICON_Power] 电力，每回合可为周围6个单元格内的城市提供其所需电力：[NEWLINE][ICON_Bullet]1点 [ICON_RESOURCE_COAL] 煤 [ICON_PowerRight] 4点 [ICON_Power] 电力[NEWLINE][ICON_Bullet]会向大气层排放大量二氧化碳。[NEWLINE]本城建造区域、建筑和奇观+10% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_FOSSIL_FUEL_POWER_PLANT_DL_DESCRIPTION",       "将任意数额的 [ICON_RESOURCE_OIL] 石油自动转换为 [ICON_Power] 电力，每回合可为周围6个单元格内的城市提供其所需电力：[NEWLINE][ICON_Bullet]1点 [ICON_RESOURCE_OIL] 石油 [ICON_PowerRight] 4点 [ICON_Power] 电力[NEWLINE][ICON_Bullet]会向大气层排放中量二氧化碳[NEWLINE]其 [ICON_Production] 生产力加成延伸到6个单元格内的所有市中心（前提是其尚未从其他的“发电厂”建筑获得加成）。[NEWLINE]本城建造区域、建筑和奇观+10% [ICON_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_POWER_PLANT_DL_DESCRIPTION",                   "将任意数额的 [ICON_RESOURCE_URANIUM] 铀自动转换为 [ICON_Power] 电力，每回合可为周围6个单元格内的城市提供其所需电力：[NEWLINE][ICON_Bullet]1点 [ICON_RESOURCE_URANIUM] 铀 [ICON_PowerRight] 16点 [ICON_Power] 电力[NEWLINE][ICON_Bullet]会向大气层排放少量二氧化碳[NEWLINE]建成后发生核事故的概率会随着核电站老化而增加。其 [ICON_Production] 生产力和 [ICON_Science] 科技值加成延伸到6个单元格内的所有市中心（前提是其尚未从其他的“发电厂”建筑获得加成。）。[NEWLINE]本城建造区域、建筑和奇观+10% [ICON_Production] 生产力。"),
    -- 圣地
    ("zh_Hans_CN",  "LOC_BUILDING_SHRINE_DESCRIPTION",                           "允许使用 [ICON_Faith] 信仰值购买建造者。允许购买传教士（只能使用 [ICON_Faith] 信仰值进行购买）。"),
    ("zh_Hans_CN",  "LOC_BUILDING_TEMPLE_DESCRIPTION",                           "允许使用 [ICON_Faith] 信仰值购买开拓者。允许购买使徒、上师、审判官，拥有特定信仰还可购买武僧（这些宗教单位只能通过 [ICON_Faith] 信仰值购买）。本城的 [ICON_Faith] 信仰值+5%。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_PRASAT_EXPANSION2_DESCRIPTION",                "+6 [ICON_FAITH] 信仰值。高棉特色建筑。替代寺庙。允许使用 [ICON_Faith] 信仰值购买开拓者。允许购买使徒、上师、审判官，拥有特定信仰还可购买武僧（这些宗教单位只能通过 [ICON_Faith] 信仰值购买）。此城中每有1点 [ICON_CITIZEN] 人口，便+0.5 [ICON_Culture] 文化值。研究完“飞行”之后，如城市拥有10点或以上的 [ICON_CITIZEN] 人口，则+10 [ICON_Tourism] 旅游业绩；如城市拥有20点或以上的 [ICON_CITIZEN] 人口，则+20 [ICON_Tourism] 旅游业绩。本城的 [ICON_Faith] 信仰值+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_PRASAT_EXPANSION2_DESCRIPTION",                "高棉特色建筑。替代寺庙。允许使用 [ICON_Faith] 信仰值购买开拓者。允许购买使徒、上师、审判官，拥有特定信仰还可购买武僧（这些宗教单位只能通过 [ICON_Faith] 信仰值购买）。此城中每有1点 [ICON_CITIZEN] 人口，便+0.5 [ICON_Culture] 文化值。本城的 [ICON_Faith] 信仰值+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_STAVE_CHURCH_DESCRIPTION",                     "挪威特色建筑。取代寺庙。允许使用 [ICON_Faith] 信仰值购买开拓者。允许购买使徒、上师、审判官，拥有特定信仰还可购买武僧（这些宗教单位只能通过 [ICON_Faith] 信仰值购买）。圣地可从树林获得额外的标准相邻加成。城市中每个森林单元格+1 [ICON_Food] 食物，每个海岸资源单元格+1 [ICON_PRODUCTION] 生产力。本城的 [ICON_Faith] 信仰值+5%。"), --+1 [ICON_TradeRoute] 贸易路线容量。
    ("zh_Hans_CN",  "LOC_BUILDING_MOSQUE_DL_DESCRIPTION",                        "此处创建的传教士和使徒+1传教次数。所有从本城创建的宗教单位在宗教战争中+3力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_PAGODA_DL_DESCRIPTION",                        "本城+10% [ICON_CULTURE] 文化值。"),
    ("zh_Hans_CN",  "LOC_BUILDING_WAT_DL_DESCRIPTION",                           "本城+10% [ICON_SCIENCE] 科技值。"),
    ("zh_Hans_CN",  "LOC_BUILDING_SYNAGOGUE_DL_DESCRIPTION",                     "本城+10% [ICON_FAITH] 信仰值。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GURDWARA_DL_DESCRIPTION",                      "本城+10% [ICON_Food] 食物。"),
    ("zh_Hans_CN",  "LOC_BUILDING_MEETING_HOUSE_DL_DESCRIPTION",                 "本城+10% [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_STUPA_DL_DESCRIPTION",                         "本城每种已改良的奢侈品 +1 [ICON_AMENITIES] 宜居度。"),
    ("zh_Hans_CN",  "LOC_BUILDING_CATHEDRAL_DL_DESCRIPTION",                     "可放置1个 [ICON_GreatWork_Landscape] 艺术巨作。[NEWLINE] 本城 [ICON_GreatWork_Landscape] 艺术巨作产出的 [ICON_CULTURE] 文化值和 [ICON_TOURISM] 旅游业绩+100%"),
    ("zh_Hans_CN",  "LOC_BUILDING_DAR_E_MEHR_DL_DESCRIPTION",                    "建造或上次修复后的每个时代均额外+2 [ICON_FAITH] 信仰值。完成后，获得一个传教士。 "),
    -- 军营
    ("zh_Hans_CN",  "LOC_BUILDING_BARRACKS_EXPANSION2_DESCRIPTION",              "该城市中训练的所有近战、抗骑兵、远程和远程骑兵类陆地单位+25%战斗经验值。[NEWLINE][NEWLINE]无法建造在已有马厩的军营区域中。[NEWLINE][NEWLINE]本城的所有已开发的 [ICON_RESOURCE_IRON] 铁资源+2 [ICON_Production] 生产力。为在本城训练的近战、远程、抗骑兵单位提供永久+2 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_BASILIKOI_PAIDES_EXPANSION2_DESCRIPTION",      "马其顿特色建筑，取代兵营且解锁更早。该城中训练的陆地近战、远程单位和伙友骑兵+25%战斗经验值。非平民单位在此城中创建时，获得等同于单位花费25%的 [ICON_SCIENCE] 科技值。[NEWLINE][NEWLINE]无法建造在已拥有马厩的军营区域中。[NEWLINE][NEWLINE]本城的所有已开发的 [ICON_RESOURCE_IRON] 铁+2 [ICON_Production] 生产力。为在本城训练的近战、远程、抗骑兵、攻城单位和伙友骑兵提供永久+3 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_STABLE_EXPANSION2_DESCRIPTION",                "该城市中训练的所有骑兵类和攻城类单位+25%战斗经验值。[NEWLINE][NEWLINE]不能建造在已有兵营的军营区域中。[NEWLINE][NEWLINE]本城的所有已开发的 [ICON_RESOURCE_HORSES] 马+2 [ICON_Production] 生产力。为在本城训练的轻重骑兵和攻城类单位提供永久+2 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_ORDU_EXPANSION2_DESCRIPTION",                  "蒙古特色建筑。其所在城市中训练的轻重骑兵单位 [ICON_MOVEMENT] 移动力+1。其所在城市中训练的所有骑兵类和攻城类单位+25%战斗经验值。[NEWLINE][NEWLINE]无法建造在已拥有兵营的军营区域中。[NEWLINE][NEWLINE]本城的所有已开发的 [ICON_RESOURCE_HORSES] 马资源+2 [ICON_Production] 生产力。为在本城训练的轻重骑兵、攻城类单位、怯薛歹提供永久+3 [ICON_Strength] 战斗力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_ARMORY_EXPANSION2_DESCRIPTION",                "该城市中训练的所有陆地单位+25%战斗经验值。[NEWLINE]战略资源储备+30（标准速度下）。为本城所有的 [ICON_Resource_Niter] 硝石、 [ICON_Resource_Oil] 石油资源+1 [ICON_Production] 生产力。此城中生产的所有军事单位若初始未拥有免费晋升，则其初始可获得免费晋升。"),
    ("zh_Hans_CN",  "LOC_BUILDING_MILITARY_ACADEMY_EXPANSION2_DESCRIPTION",      "该城市中训练的所有陆地单位+25%战斗经验值。[NEWLINE]可直接训练军团和军队。军团和军队的训练费用降低25%。为本城的 [ICON_Resource_Aluminum] 铝、 [ICON_Resource_Uranium] 铀资源+1 [ICON_Production] 生产力。玩家的 [ICON_GREATGENERAL] 大将军点数积累速度+10%，且所有训练的陆地单位+3 [ICON_STRENGTH] 战斗力。"),
    -- 商业
    ("zh_Hans_CN",  "LOC_BUILDING_MARKET_EXPANSION1_DESCRIPTION",                "+1 [ICON_TradeRoute] 贸易路线容量。"),
    --("zh_Hans_CN",  "LOC_BUILDING_SUKIENNICE_EXPANSION1_DESCRIPTION",            "波兰特色建筑。从此城开始的国际 [ICON_TradeRoute] 贸易路线+2 [ICON_Production] 生产力；国内 [ICON_TradeRoute] 贸易路线+4 [ICON_Gold] 金币。+1 [ICON_TradeRoute] 贸易路线容量。本城的奢侈资源+2 [ICON_gold] 金币和+1 [Icon_production] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_SUKIENNICE_EXPANSION1_DESCRIPTION",            "波兰特色建筑。从此城开始的国际 [ICON_TradeRoute] 贸易路线+2 [ICON_Production] 生产力；国内 [ICON_TradeRoute] 贸易路线+4 [ICON_Gold] 金币。+1 [ICON_TradeRoute] 贸易路线容量。本城的所有区域+2 [ICON_gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BUILDING_BANK_DESCRIPTION",                             "本城 [ICON_GOLD] 金币产出+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GRAND_BAZAAR_DESCRIPTION",                     "奥斯曼特色建筑。城市中改良的每种不同战略资源均可额外增加1点。城市改良的每个奢侈品资源均可提供1点 [ICON_AMENITIES] 宜居度。本城 [ICON_GOLD] 金币产出+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_STOCK_EXCHANGE_DESCRIPTION",                   "本城 [ICON_GOLD] 金币+5%。通电后额外为本城+5% [ICON_GOLD] 金币。"),
    -- 港口
    ("zh_Hans_CN",  "LOC_BUILDING_LIGHTHOUSE_EXPANSION2_DESCRIPTION",            "此城生产的所有海军单位+25%战斗经验值。此城的所有海岸单元格+1 [ICON_Food] 食物。+1 [ICON_TradeRoute] 贸易路线容量。为本城的海洋资源地块+1 [ICON_Food] 食物。"), -- [ICON_Resource_Fish] 鱼、 [ICON_Resource_Crabs] 螃蟹、 [ICON_Resource_Whales] 鲸鱼、 [ICON_Resource_Pearls] 珍珠
    ("zh_Hans_CN",  "LOC_BUILDING_SHIPYARD_EXPANSION2_DESCRIPTION",              "此城中生产的所有海军单位+25%战斗经验值。[ICON_Production] 生产力加成等于港口区域的相邻加成。此城所有海岸和湖泊单元格提供的 [ICON_PRODUCTION] 生产力+1。对所有海军单位+25% [ICON_PRODUCTION] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_SEAPORT_DESCRIPTION",                          "此城中生产的所有海军单位+25%经验值。可直接生产舰队和无敌舰队。舰队和无敌舰队的生产费用降低25%。此城所有海岸单元格产出的 [ICON_GOLD] 金币+2。额外产出相当于港口相邻加成的 [ICON_FOOD] 食物。 [NEWLINE]玩家的 [ICON_GREATADMIRAL] 海军将领点数积累速度+10%，且所有训练的海军单位+3 [ICON_STRENGTH] 战斗力。"),
    -- 政府区
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_TALL_DESCRIPTION",                         "所有城市+1 [ICON_Amenities] 宜居度、+2 [ICON_Housing] 住房、+15%人口增长速度。[NEWLINE]本城建造奇观和建筑时+15% [ICON_Production] 生产力。[NEWLINE]奖励1个 [ICON_Governor] 总督头衔。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_CONQUEST_DESCRIPTION",                     "占领一座敌方城市后，所有城市将获得15%的 [ICON_Production] 生产力加成，效果持续5回合。[NEWLINE]本城建造军事单位时+20% [ICON_Production] 生产力。[NEWLINE]掠夺和海岸扫荡的收益+100%。[NEWLINE]奖励1个 [ICON_Governor] 总督头衔。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_CITYSTATES_NAME",                          "中书省"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_CITYSTATES_EXPANSION2_DESCRIPTION",        "与 [ICON_Capital] 首都处于同一大陆的城市+7% [ICON_Food] 食物、 [ICON_Production] 生产力和 [ICON_Gold] 金币。总督所在的城市这些效果翻倍。[NEWLINE]奖励1个 [ICON_Governor] 总督头衔。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_FAITH_NAME",                               "主教座堂"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_FAITH_DESCRIPTION",                        "所有城市获得等同于 [ICON_Faith] 信仰产出10%的 [ICON_Science] 科技值和 [ICON_Culture] 文化值。[NEWLINE]所有城市购买宗教单位的花费减少20%。宗教单位在神学战斗中+5 [ICON_Religion] 宗教力量。[NEWLINE]每座信奉玩家创立的宗教的外国城市+2 [ICON_Science] 科技值和+2 [ICON_Culture] 文化值。[NEWLINE]奖励1个 [ICON_Governor] 总督头衔。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_SPIES_DESCRIPTION",                        "获得一个间谍并+1间谍容量。对所有文明+1 [ICON_VisLimited] 外交能见度。[NEWLINE]所有间谍行动的成功率上升。间谍执行任务的时间缩短25%，您的间谍可以选择任何可用升级。[NEWLINE]所有城市训练间谍时+50% [ICON_Production] 生产力。[NEWLINE]奖励1个 [ICON_Governor] 总督头衔。"),
    -- ("zh_Hans_CN",  "LOC_BUILDING_GOV_SCIENCE_DESCRIPTION",                      "学院建筑提供等同于基础 [ICON_Science] 科技值产出的 [ICON_Production] 生产力。[NEWLINE]工业区建筑提供等同于基础 [ICON_Production] 生产力产出的 [ICON_Science] 科技值。[NEWLINE]奖励1个 [ICON_Governor] 总督头衔。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_MILITARY_DESCRIPTION",                     "所有军事单位+1 [ICON_Movement] 移动力和+3 [ICON_Strength] 战斗力。[NEWLINE]每个单位每回合维护费减少2 [ICON_Gold] 金币。[NEWLINE]升级单位所需的 [ICON_Gold] 金币和资源减少25%。[NEWLINE]奖励1个 [ICON_Governor] 总督头衔。"),
    ("zh_Hans_CN",  "LOC_BUILDING_GOV_CULTURE_DESCRIPTION",                      "提供任意4个巨作槽位。当展示来自相同时代的作品时获得主题化加成。[NEWLINE]奖励1个 [Icon_Governor] 总督头衔。"),
    ("zh_Hans_CN",  "LOC_ABILITY_GOV_FAITH_COMBAT_STRENGTH_DESCRIPTION",         "+5 [ICON_Religion] 宗教力量来自主教座堂。"),
    ("zh_Hans_CN",  "LOC_ABILITY_GOV_MILITARY_MOVEMENT_DESCRIPTION",             "+1 [ICON_Movement] 移动力来自作战部。"),
    ("zh_Hans_CN",  "LOC_ABILITY_GOV_MILITARY_COMBAT_STRENGTH_DESCRIPTION",      "+3 [ICON_Strength] 战斗力来自作战部。"),
    -- 外交区
    ("zh_Hans_CN",  "LOC_BUILDING_CONSULATE_DESCRIPTION",                        "每回合影响力点数+2。敌方间谍以此城市或拥有军营的城市为目标时，其效力降低一级。征兵花费的 [ICON_GOLD] 金币减少20%。获得1名 [ICON_Envoy] 使者。"),
    ("zh_Hans_CN",  "LOC_BUILDING_CHANCERY_DESCRIPTION",                         "每回合影响力点数+3。此文明俘获或杀死敌方间谍时，敌方间谍每拥有一级升级，文明便获得50点 [ICON_Science] 科技值。所有盟友的同盟点数每回合额外增加0.5点。获得1名 [ICON_Envoy] 使者。"),
    -- 娱乐区
    ("zh_Hans_CN",  "LOC_BUILDING_ARENA_EXPANSION1_DESCRIPTION",                 "拥有“保护地球”市政后提供1点 [ICON_TOURISM] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_BUILDING_TLACHTLI_XP1_DESCRIPTION",                     "阿兹特克特色建筑。提供1点 [ICON_Amenities] 宜居度、+2 [ICON_Culture] 文化值、+2 [ICON_Faith] 信仰值，并提供2点 [ICON_GreatGeneral] 大将军点数。拥有“保护地球”市政后提供1点 [ICON_TOURISM] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_BUILDING_STADIUM_DL_DESCRIPTION",                       "如城市 [ICON_CITIZEN] 人口大于等于10，则+2 [ICON_Tourism] 旅游业绩；如城市 [ICON_CITIZEN] 人口大于等于20，则+5 [ICON_Tourism] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_BUILDING_ZOO_EXPANSION1_DESCRIPTION",                   "研究“生物”科技后，此城中改良资源的营地和牧场+1 [ICON_Food] 食物，+1 [ICON_CULTURE] 文化值，+3 [ICON_Gold] 金币。"),
    ("zh_Hans_CN",  "LOC_BUILDING_THERMAL_BATH_DESCRIPTION",                     "6个单元格内的城市中地热裂缝+2 [ICON_FAITH] 信仰值，+2 [ICON_CULTURE] 文化值；研究“化学”科技后，额外获得+2 [ICON_SCIENCE] 科技值。[NEWLINE]6个单元格内的城市如果拥有地热裂缝，则提供+2额外 [ICON_AMENITIES] 宜居度。"),
    -- 水上娱乐
    ("zh_Hans_CN",  "LOC_BUILDING_FERRIS_WHEEL_DESCRIPTION_HD",                  "+3 [ICON_Tourism] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_BUILDING_AQUATICS_CENTER_DL_DESCRIPTION",               "此城中建在海岸单元格之上或周围的每座奇观+2 [ICON_Tourism] 旅游业绩。"),
    ("zh_Hans_CN",  "LOC_BUILDING_AQUARIUM_DL_DESCRIPTION",                      "研究“生物”科技后，此城中的海洋地貌和改良资源的渔船+1 [ICON_Food] 食物，+1 [ICON_PRODUCTION] 生产力，+3 [ICON_Gold] 金币。"),
    -- 航空港
    ("zh_Hans_CN",  "LOC_BUILDING_HANGAR_DESCRIPTION",                           "当前城市训练的空中单位+25%战斗经验值。航空港区域+2空中单位槽位。建造空中单位时，+50% [Icon_Production] 生产力。"),
    ("zh_Hans_CN",  "LOC_BUILDING_AIRPORT_DESCRIPTION",                          "若此城 [ICON_POWER] 供电充足，则城市中来自改良、巨作的 [ICON_Tourism] 旅游业绩+50%，来自奇观的 [ICON_Tourism] 旅游业绩+100%；该加成效果延伸到4个单元格内的所有城市（前提是其尚未从其他的“机场”建筑获得加成）。 [NEWLINE] 该城市训练的空中单位+50%战斗经验值。紧急部署市政解锁后，可以在带有机场的航空港之间空运陆地单位。"),
    ("zh_Hans_CN",  "LOC_BUILDING_AIRPORT_DESCRIPTION_PRODUCT",                  "若此城 [ICON_POWER] 供电充足，则城市中来自改良、巨作、 [ICON_GreatWork_Product] 产品的 [ICON_Tourism] 旅游业绩+50%，来自奇观的 [ICON_Tourism] 旅游业绩+100%；该加成效果延伸到4个单元格内的所有城市（前提是其尚未从其他的“机场”建筑获得加成）。 [NEWLINE] 该城市训练的空中单位+50%战斗经验值。紧急部署市政解锁后，可以在带有机场的航空港之间空运陆地单位。"),
    -- 社区
    ("zh_Hans_CN",  "LOC_BUILDING_FOOD_MARKET_DESCRIPTION",                      "本城的人口增长速度+10%，若 [Icon_Power] 供电充足，则人口增长速度额外+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_FOOD_MARKET_DESCRIPTION_CORP",                 "本城的人口增长速度+10%，若 [Icon_Power] 供电充足，则人口增长速度额外+5%。[NEWLINE]若此城 [Icon_Power] 供电充足，则城市中 [ICON_GreatWork_Product] 产品产出2倍的 [ICON_FOOD] 食物和 [ICON_PRODUCTION] 生产力；该加成效果延伸到6个单元格内的所有城市（前提是其尚未从其他的“食品市场”建筑获得加成）。"),
    ("zh_Hans_CN",  "LOC_BUILDING_SHOPPING_MALL_DESCRIPTION",                    "本城 [ICON_gold] 金币产出+10%，若 [Icon_Power] 供电充足，则 [ICON_gold] 金币产出额外+5%。"),
    ("zh_Hans_CN",  "LOC_BUILDING_SHOPPING_MALL_DESCRIPTION_CORP",               "本城 [ICON_gold] 金币产出+10%，若 [Icon_Power] 供电充足，则 [ICON_gold] 金币产出额外+5%。[NEWLINE]若此城 [Icon_Power] 供电充足，则城市中 [ICON_GreatWork_Product] 产品产出2倍的 [ICON_GOLD] 金币，产出1.5倍的 [ICON_SCIENCE] 科技值和 [ICON_CULTURE] 文化值；该加成效果延伸到6个单元格内的所有城市（前提是其尚未从其他的“购物商场”建筑获得加成）。"),
    -- 堤坝
    ("zh_Hans_CN",  "LOC_BUILDING_HYDROELECTRIC_DAM_DESCRIPTION",                "可再生水力发电向城市提供+6点 [ICON_Power] 电力。本城所有的沿河单元格+1 [ICON_Production] 生产力。"),
    -- 总督建筑
    ("zh_Hans_CN",  "LOC_BUILDING_GENERAL_SERVICE_NAME",                         "总务厅"),
    ("zh_Hans_CN",  "LOC_BUILDING_GENERAL_SERVICE_DESCRIPTION",                  "总督“马格努斯”（必须拥有“总务官”升级）在此城市就职时，总务厅为8个单元格之内的城市（包括该城市）提供+4 [ICON_Food] 食物、+4 [ICON_Production] 生产力、+4 [ICON_Science] 科技值和+4 [ICON_Culture] 文化值。只有当拥有总务官头衔的总督马格努斯在8个单元格以内的城市就职时方可建造。"),
    -- 保护区
    ("zh_Hans_CN",  "LOC_BUILDING_SANCTUARY_NAME",                               "生态研究所");