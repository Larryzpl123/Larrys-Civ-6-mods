--==========================================================================================================================
-- LEMONAIDE LEADER FOR CANADA
-- Leader Ability: Cat and Gold (基米与金币)
-- - Scouts +4 Combat Strength
-- - Tundra (flat) +2 Production
-- - Tundra Hills +1 Food
-- - Tundra Improvements +2 Gold
--==========================================================================================================================

--==========================================================================================================================
-- TYPES
--==========================================================================================================================
INSERT INTO Types	
		(Type,								Kind)
VALUES	('LEADER_LEMONAIDE',				'KIND_LEADER'),
		('TRAIT_LEADER_LEMONAIDE_CAT_GOLD',	'KIND_TRAIT');

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
INSERT INTO Leaders	
		(LeaderType,			Name,							InheritFrom,		SceneLayers)
VALUES	('LEADER_LEMONAIDE',	'LOC_LEADER_LEMONAIDE_NAME',	'LEADER_DEFAULT',	4);

--==========================================================================================================================
-- LEADER TRAITS
--==========================================================================================================================
INSERT INTO LeaderTraits	
		(LeaderType,			TraitType)
VALUES	('LEADER_LEMONAIDE',	'TRAIT_LEADER_LEMONAIDE_CAT_GOLD');

INSERT INTO Traits				
		(TraitType,								Name,								Description)
VALUES	('TRAIT_LEADER_LEMONAIDE_CAT_GOLD',		'LOC_TRAIT_LEADER_LEMONAIDE_NAME',	'LOC_TRAIT_LEADER_LEMONAIDE_DESCRIPTION');

--==========================================================================================================================
-- CIVILIZATION LEADERS
--==========================================================================================================================
INSERT INTO CivilizationLeaders	
		(CivilizationType,			LeaderType,				CapitalName)
VALUES	('CIVILIZATION_CANADA',		'LEADER_LEMONAIDE',		'LOC_CITY_NAME_OTTAWA');

--==========================================================================================================================
-- TRAIT MODIFIERS
--==========================================================================================================================
INSERT INTO TraitModifiers	
		(TraitType,								ModifierId)
VALUES	('TRAIT_LEADER_LEMONAIDE_CAT_GOLD',		'LEMONAIDE_SCOUT_COMBAT_BONUS'),
		('TRAIT_LEADER_LEMONAIDE_CAT_GOLD',		'LEMONAIDE_TUNDRA_PRODUCTION'),
		('TRAIT_LEADER_LEMONAIDE_CAT_GOLD',		'LEMONAIDE_TUNDRA_HILLS_FOOD'),
		('TRAIT_LEADER_LEMONAIDE_CAT_GOLD',		'LEMONAIDE_TUNDRA_IMPROVED_GOLD'),
		('TRAIT_LEADER_LEMONAIDE_CAT_GOLD',		'LEMONAIDE_TUNDRA_HILLS_IMPROVED_GOLD');

--==========================================================================================================================
-- MODIFIERS
--==========================================================================================================================

-- 侦察兵 +4 战斗力
INSERT INTO Modifiers
		(ModifierId,						ModifierType,									SubjectRequirementSetId)
VALUES	('LEMONAIDE_SCOUT_COMBAT_BONUS',	'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH',	'LEMONAIDE_SCOUT_REQUIREMENTS');

INSERT INTO ModifierArguments
		(ModifierId,						Name,		Value)
VALUES	('LEMONAIDE_SCOUT_COMBAT_BONUS',	'Amount',	'4');

-- 冻土平原 +2 产能
INSERT INTO Modifiers
		(ModifierId,					ModifierType,							SubjectRequirementSetId)
VALUES	('LEMONAIDE_TUNDRA_PRODUCTION',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'LEMONAIDE_TUNDRA_REQS');

INSERT INTO ModifierArguments
		(ModifierId,					Name,			Value)
VALUES	('LEMONAIDE_TUNDRA_PRODUCTION',	'YieldType',	'YIELD_PRODUCTION'),
		('LEMONAIDE_TUNDRA_PRODUCTION',	'Amount',		'2');

-- 冻土丘陵 +1 粮食
INSERT INTO Modifiers
		(ModifierId,					ModifierType,							SubjectRequirementSetId)
VALUES	('LEMONAIDE_TUNDRA_HILLS_FOOD',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'LEMONAIDE_TUNDRA_HILLS_REQS');

INSERT INTO ModifierArguments
		(ModifierId,					Name,			Value)
VALUES	('LEMONAIDE_TUNDRA_HILLS_FOOD',	'YieldType',	'YIELD_FOOD'),
		('LEMONAIDE_TUNDRA_HILLS_FOOD',	'Amount',		'1');

-- 冻土平原改良 +1 金币
INSERT INTO Modifiers
		(ModifierId,						ModifierType,							SubjectRequirementSetId)
VALUES	('LEMONAIDE_TUNDRA_IMPROVED_GOLD',	'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'LEMONAIDE_TUNDRA_IMPROVED_REQS');

INSERT INTO ModifierArguments
		(ModifierId,						Name,			Value)
VALUES	('LEMONAIDE_TUNDRA_IMPROVED_GOLD',	'YieldType',	'YIELD_GOLD'),
		('LEMONAIDE_TUNDRA_IMPROVED_GOLD',	'Amount',		'2');

-- 冻土丘陵改良 +1 金币
INSERT INTO Modifiers
		(ModifierId,							ModifierType,							SubjectRequirementSetId)
VALUES	('LEMONAIDE_TUNDRA_HILLS_IMPROVED_GOLD','MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'LEMONAIDE_TUNDRA_HILLS_IMPROVED_REQS');

INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
VALUES	('LEMONAIDE_TUNDRA_HILLS_IMPROVED_GOLD',	'YieldType',	'YIELD_GOLD'),
		('LEMONAIDE_TUNDRA_HILLS_IMPROVED_GOLD',	'Amount',		'2');

--==========================================================================================================================
-- REQUIREMENT SETS
--==========================================================================================================================

-- 侦察兵要求
INSERT INTO RequirementSets
		(RequirementSetId,					RequirementSetType)
VALUES	('LEMONAIDE_SCOUT_REQUIREMENTS',	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,					RequirementId)
VALUES	('LEMONAIDE_SCOUT_REQUIREMENTS',	'LEMONAIDE_REQ_IS_SCOUT');

-- 冻土平原要求（无需改良）
INSERT INTO RequirementSets
		(RequirementSetId,			RequirementSetType)
VALUES	('LEMONAIDE_TUNDRA_REQS',	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,			RequirementId)
VALUES	('LEMONAIDE_TUNDRA_REQS',	'LEMONAIDE_REQ_IS_TUNDRA');

-- 冻土丘陵要求（无需改良）
INSERT INTO RequirementSets
		(RequirementSetId,				RequirementSetType)
VALUES	('LEMONAIDE_TUNDRA_HILLS_REQS',	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,				RequirementId)
VALUES	('LEMONAIDE_TUNDRA_HILLS_REQS',	'LEMONAIDE_REQ_IS_TUNDRA_HILLS');

-- 冻土平原+改良要求
INSERT INTO RequirementSets
		(RequirementSetId,					RequirementSetType)
VALUES	('LEMONAIDE_TUNDRA_IMPROVED_REQS',	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,					RequirementId)
VALUES	('LEMONAIDE_TUNDRA_IMPROVED_REQS',	'LEMONAIDE_REQ_IS_TUNDRA'),
		('LEMONAIDE_TUNDRA_IMPROVED_REQS',	'LEMONAIDE_REQ_HAS_IMPROVEMENT');

-- 冻土丘陵+改良要求
INSERT INTO RequirementSets
		(RequirementSetId,						RequirementSetType)
VALUES	('LEMONAIDE_TUNDRA_HILLS_IMPROVED_REQS',	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES	('LEMONAIDE_TUNDRA_HILLS_IMPROVED_REQS',	'LEMONAIDE_REQ_IS_TUNDRA_HILLS'),
		('LEMONAIDE_TUNDRA_HILLS_IMPROVED_REQS',	'LEMONAIDE_REQ_HAS_IMPROVEMENT');

--==========================================================================================================================
-- REQUIREMENTS
--==========================================================================================================================
INSERT INTO Requirements
		(RequirementId,						RequirementType)
VALUES	('LEMONAIDE_REQ_IS_SCOUT',			'REQUIREMENT_UNIT_TYPE_MATCHES'),
		('LEMONAIDE_REQ_IS_TUNDRA',			'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES'),
		('LEMONAIDE_REQ_IS_TUNDRA_HILLS',	'REQUIREMENT_PLOT_TERRAIN_TYPE_MATCHES'),
		('LEMONAIDE_REQ_HAS_IMPROVEMENT',	'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT');

--==========================================================================================================================
-- REQUIREMENT ARGUMENTS
--==========================================================================================================================
INSERT INTO RequirementArguments
		(RequirementId,						Name,			Value)
VALUES	('LEMONAIDE_REQ_IS_SCOUT',			'UnitType',		'UNIT_SCOUT'),
		('LEMONAIDE_REQ_IS_TUNDRA',			'TerrainType',	'TERRAIN_TUNDRA'),
		('LEMONAIDE_REQ_IS_TUNDRA_HILLS',	'TerrainType',	'TERRAIN_TUNDRA_HILLS');

--==========================================================================================================================
-- AI AGENDA
--==========================================================================================================================
INSERT INTO HistoricalAgendas
		(LeaderType,			AgendaType)
VALUES	('LEADER_LEMONAIDE',	'AGENDA_EXPLORER');
