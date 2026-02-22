-- ============================================================
-- FDR_Buildings.sql
-- Commercial Hub buildings: +3 Production, -3 Gold each
-- Pattern from LLR (鲁鲁人) / Planner mod
-- ============================================================

-- +3 Production per Commercial Hub building
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) SELECT
	'TRAIT_LEADER_FDR_NEW_DEAL', 'FDR_BLD_PROD_'||BuildingType
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) SELECT
	'FDR_BLD_PROD_'||BuildingType, 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB';

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) SELECT
	'FDR_BLD_PROD_'||BuildingType, 'BuildingType', BuildingType
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB'
UNION SELECT
	'FDR_BLD_PROD_'||BuildingType, 'YieldType', 'YIELD_PRODUCTION'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB'
UNION SELECT
	'FDR_BLD_PROD_'||BuildingType, 'Amount', '3'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB';

-- -3 Gold per Commercial Hub building
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) SELECT
	'TRAIT_LEADER_FDR_NEW_DEAL', 'FDR_BLD_GOLD_'||BuildingType
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB';

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType) SELECT
	'FDR_BLD_GOLD_'||BuildingType, 'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB';

INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) SELECT
	'FDR_BLD_GOLD_'||BuildingType, 'BuildingType', BuildingType
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB'
UNION SELECT
	'FDR_BLD_GOLD_'||BuildingType, 'YieldType', 'YIELD_GOLD'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB'
UNION SELECT
	'FDR_BLD_GOLD_'||BuildingType, 'Amount', '-3'
FROM Buildings WHERE PrereqDistrict = 'DISTRICT_COMMERCIAL_HUB';
