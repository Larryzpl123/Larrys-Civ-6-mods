-- ============================================================
-- Planner_Buildings.sql v2
-- Building & Wonder yield bonuses: +2F/+2P/+2G per building
-- Pattern from LLR (鲁鲁人) mod.
-- FIX: Added OR IsWonder=1 for wonders with NULL PrereqDistrict
-- ============================================================

-- ============================================================
-- FOOD: +2 Food per building/wonder (non-city-center)
-- ============================================================
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) SELECT
	'TRAIT_CIVILIZATION_PLANNER_BLUEPRINT', 'PL_BLD_FOOD_'||BuildingType
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) SELECT
	'PL_BLD_FOOD_'||BuildingType, 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) SELECT
	'PL_BLD_FOOD_'||BuildingType, 'BuildingType', BuildingType
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1
UNION SELECT
	'PL_BLD_FOOD_'||BuildingType, 'YieldType', 'YIELD_FOOD'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1
UNION SELECT
	'PL_BLD_FOOD_'||BuildingType, 'Amount', '2'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1;

-- ============================================================
-- PRODUCTION: +2 Production per building/wonder (non-city-center)
-- ============================================================
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) SELECT
	'TRAIT_CIVILIZATION_PLANNER_BLUEPRINT', 'PL_BLD_PROD_'||BuildingType
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) SELECT
	'PL_BLD_PROD_'||BuildingType, 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) SELECT
	'PL_BLD_PROD_'||BuildingType, 'BuildingType', BuildingType
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1
UNION SELECT
	'PL_BLD_PROD_'||BuildingType, 'YieldType', 'YIELD_PRODUCTION'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1
UNION SELECT
	'PL_BLD_PROD_'||BuildingType, 'Amount', '2'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1;

-- ============================================================
-- GOLD: +2 Gold per building/wonder (non-city-center)
-- ============================================================
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) SELECT
	'TRAIT_CIVILIZATION_PLANNER_BLUEPRINT', 'PL_BLD_GOLD_'||BuildingType
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1;

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) SELECT
	'PL_BLD_GOLD_'||BuildingType, 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1;

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) SELECT
	'PL_BLD_GOLD_'||BuildingType, 'BuildingType', BuildingType
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1
UNION SELECT
	'PL_BLD_GOLD_'||BuildingType, 'YieldType', 'YIELD_GOLD'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1
UNION SELECT
	'PL_BLD_GOLD_'||BuildingType, 'Amount', '2'
FROM Buildings WHERE (PrereqDistrict IS NOT NULL AND PrereqDistrict != 'DISTRICT_CITY_CENTER') OR IsWonder = 1;

-- ============================================================
-- HOUSING: +2 per building via Lua (no ADJUST_BUILDING_HOUSING)
-- ============================================================
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) VALUES
	('PL_BLD_HOUSING_LUA', 'MODIFIER_PLAYER_CITIES_ADJUST_POLICY_HOUSING');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES
	('PL_BLD_HOUSING_LUA', 'Amount', '2');
