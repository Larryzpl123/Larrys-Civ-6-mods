--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 亚当·斯密 - 无形的大手 - 游戏逻辑
-- The Invisible Hand
-- 描述效果：每个区域和建筑+1金币
--------------------------------------------------------------------------------------------------------------------------------------------------------------

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 1. 每个区域+1金币（含市中心，因为市中心也是区域）
--------------------------------------------------------------------------------------------------------------------------------------------------------------
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
('TRAIT_LEADER_ADAM_SMITH_INVISIBLE_HAND', 'MODIFIER_ADAM_SMITH_DISTRICT_GOLD');

INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
('MODIFIER_ADAM_SMITH_DISTRICT_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_PER_DISTRICT', 0, 0, 0, NULL, NULL);

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('MODIFIER_ADAM_SMITH_DISTRICT_GOLD', 'Amount', '1'),
('MODIFIER_ADAM_SMITH_DISTRICT_GOLD', 'YieldType', 'YIELD_GOLD');

--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 2. 每个建筑+1金币（遍历所有建筑，含市中心建筑，不含奇观）
--------------------------------------------------------------------------------------------------------------------------------------------------------------

INSERT OR REPLACE INTO Modifiers
	(ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId)
SELECT
	'MODIFIER_ADAM_SMITH_BUILDING_GOLD_'||BuildingType,
	'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE',
	0, 0, 0, NULL, NULL
FROM Buildings WHERE IsWonder != 1;

INSERT OR REPLACE INTO ModifierArguments
	(ModifierId, Name, Value)
SELECT
	'MODIFIER_ADAM_SMITH_BUILDING_GOLD_'||BuildingType,
	'BuildingType',
	BuildingType
FROM Buildings WHERE IsWonder != 1;

INSERT OR REPLACE INTO ModifierArguments
	(ModifierId, Name, Value)
SELECT
	'MODIFIER_ADAM_SMITH_BUILDING_GOLD_'||BuildingType,
	'YieldType',
	'YIELD_GOLD'
FROM Buildings WHERE IsWonder != 1;

INSERT OR REPLACE INTO ModifierArguments
	(ModifierId, Name, Value)
SELECT
	'MODIFIER_ADAM_SMITH_BUILDING_GOLD_'||BuildingType,
	'Amount',
	'1'
FROM Buildings WHERE IsWonder != 1;

INSERT OR REPLACE INTO TraitModifiers
	(TraitType, ModifierId)
SELECT
	'TRAIT_LEADER_ADAM_SMITH_INVISIBLE_HAND',
	'MODIFIER_ADAM_SMITH_BUILDING_GOLD_'||BuildingType
FROM Buildings WHERE IsWonder != 1;
