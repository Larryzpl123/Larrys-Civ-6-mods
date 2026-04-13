-- ==========================================================================
-- 营地文明 (Camp Civilization) — Leader: Larry
-- 领袖能力 "精铺" — same as HappyCiv
-- 文明能力 "营地！"
--   营地改良 +1 生产力, +1 金币 (Lemonaide improvement pattern)
--   每城 +1 粮食, +1 金币 (ForestFish city pattern)
-- ==========================================================================

-- ============================================
-- TYPES
-- ============================================
INSERT INTO Types (Type, Kind) VALUES
('CIVILIZATION_LARRY_CAMP',           'KIND_CIVILIZATION'),
('LEADER_LARRY_CAMP',                 'KIND_LEADER'),
('TRAIT_LEADER_LARRY_CAMP',           'KIND_TRAIT'),
('TRAIT_CIVILIZATION_LARRY_CAMP',     'KIND_TRAIT');

-- ============================================
-- CIVILIZATIONS
-- ============================================
INSERT INTO Civilizations
		(CivilizationType,           Name,                                  Description,                                  Adjective,                                  StartingCivilizationLevelType, RandomCityNameDepth)
VALUES	('CIVILIZATION_LARRY_CAMP', 'LOC_CIVILIZATION_LARRY_CAMP_NAME',    'LOC_CIVILIZATION_LARRY_CAMP_DESCRIPTION',    'LOC_CIVILIZATION_LARRY_CAMP_ADJECTIVE',    'CIVILIZATION_LEVEL_FULL_CIV', 10);

-- ============================================
-- LEADERS
-- ============================================
INSERT INTO Leaders
		(LeaderType,          Name,                           InheritFrom,      SceneLayers)
VALUES	('LEADER_LARRY_CAMP', 'LOC_LEADER_LARRY_CAMP_NAME',  'LEADER_DEFAULT', 4);

INSERT INTO LeaderQuotes
		(LeaderType,          Quote)
VALUES	('LEADER_LARRY_CAMP', 'LOC_LEADER_LARRY_CAMP_QUOTE');

INSERT INTO CivilizationLeaders
		(CivilizationType,          LeaderType,          CapitalName)
VALUES	('CIVILIZATION_LARRY_CAMP', 'LEADER_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_1');

-- ============================================
-- TRAITS
-- ============================================
INSERT INTO Traits (TraitType, Name, Description) VALUES
('TRAIT_LEADER_LARRY_CAMP',        'LOC_TRAIT_LEADER_LARRY_CAMP_NAME',        'LOC_TRAIT_LEADER_LARRY_CAMP_DESCRIPTION'),
('TRAIT_CIVILIZATION_LARRY_CAMP',  'LOC_TRAIT_CIVILIZATION_LARRY_CAMP_NAME',  'LOC_TRAIT_CIVILIZATION_LARRY_CAMP_DESCRIPTION');

INSERT INTO LeaderTraits (LeaderType, TraitType) VALUES
('LEADER_LARRY_CAMP', 'TRAIT_LEADER_LARRY_CAMP');

INSERT INTO CivilizationTraits (CivilizationType, TraitType) VALUES
('CIVILIZATION_LARRY_CAMP', 'TRAIT_CIVILIZATION_LARRY_CAMP');

-- ============================================
-- AGENDA
-- ============================================
INSERT INTO HistoricalAgendas (LeaderType, AgendaType) VALUES
('LEADER_LARRY_CAMP', 'AGENDA_STANDING_ARMY');

-- ============================================
-- CITY NAMES
-- ============================================
INSERT INTO CityNames (CivilizationType, CityName) VALUES
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_1'),
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_2'),
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_3'),
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_4'),
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_5'),
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_6'),
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_7'),
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_8'),
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_9'),
('CIVILIZATION_LARRY_CAMP', 'LOC_CITY_NAME_LARRY_CAMP_10');

-- ==========================================================================
-- LEADER ABILITY: 精铺
-- ==========================================================================

INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQ_CAMP_CITY_10POP', 'REQUIREMENT_CITY_HAS_X_POPULATION'),
('REQ_CAMP_CITY_20POP', 'REQUIREMENT_CITY_HAS_X_POPULATION'),
('REQ_CAMP_CITY_30POP', 'REQUIREMENT_CITY_HAS_X_POPULATION'),
('REQ_CAMP_CITY_40POP', 'REQUIREMENT_CITY_HAS_X_POPULATION'),
('REQ_CAMP_CITY_50POP', 'REQUIREMENT_CITY_HAS_X_POPULATION');

INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQ_CAMP_CITY_10POP', 'Amount', '10'),
('REQ_CAMP_CITY_20POP', 'Amount', '20'),
('REQ_CAMP_CITY_30POP', 'Amount', '30'),
('REQ_CAMP_CITY_40POP', 'Amount', '40'),
('REQ_CAMP_CITY_50POP', 'Amount', '50');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQSET_CAMP_10POP', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_CAMP_20POP', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_CAMP_30POP', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_CAMP_40POP', 'REQUIREMENTSET_TEST_ALL'),
('REQSET_CAMP_50POP', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQSET_CAMP_10POP', 'REQ_CAMP_CITY_10POP'),
('REQSET_CAMP_20POP', 'REQ_CAMP_CITY_20POP'),
('REQSET_CAMP_30POP', 'REQ_CAMP_CITY_30POP'),
('REQSET_CAMP_40POP', 'REQ_CAMP_CITY_40POP'),
('REQSET_CAMP_50POP', 'REQ_CAMP_CITY_50POP');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('CAMP_NEARBY_YIELD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 'OBJECT_IS_FOUNDED_6_TILES_FROM_CAPITAL_NOT_CAPITAL_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('CAMP_NEARBY_YIELD', 'YieldType', 'YIELD_FOOD, YIELD_PRODUCTION, YIELD_GOLD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_FAITH'),
('CAMP_NEARBY_YIELD', 'Amount', '10,10,10,10,10,10');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('CAMP_10POP_YIELD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 'REQSET_CAMP_10POP'),
('CAMP_20POP_YIELD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 'REQSET_CAMP_20POP'),
('CAMP_30POP_YIELD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 'REQSET_CAMP_30POP'),
('CAMP_40POP_YIELD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 'REQSET_CAMP_40POP'),
('CAMP_50POP_YIELD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 'REQSET_CAMP_50POP');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('CAMP_10POP_YIELD', 'YieldType', 'YIELD_FOOD, YIELD_PRODUCTION, YIELD_GOLD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_FAITH'),
('CAMP_10POP_YIELD', 'Amount', '10,10,10,10,10,10'),
('CAMP_20POP_YIELD', 'YieldType', 'YIELD_FOOD, YIELD_PRODUCTION, YIELD_GOLD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_FAITH'),
('CAMP_20POP_YIELD', 'Amount', '10,10,10,10,10,10'),
('CAMP_30POP_YIELD', 'YieldType', 'YIELD_FOOD, YIELD_PRODUCTION, YIELD_GOLD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_FAITH'),
('CAMP_30POP_YIELD', 'Amount', '10,10,10,10,10,10'),
('CAMP_40POP_YIELD', 'YieldType', 'YIELD_FOOD, YIELD_PRODUCTION, YIELD_GOLD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_FAITH'),
('CAMP_40POP_YIELD', 'Amount', '10,10,10,10,10,10'),
('CAMP_50POP_YIELD', 'YieldType', 'YIELD_FOOD, YIELD_PRODUCTION, YIELD_GOLD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_FAITH'),
('CAMP_50POP_YIELD', 'Amount', '10,10,10,10,10,10');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('CAMP_FAR_PENALTY', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_MODIFIER_GRANCOLOMBIA_MAYA', 'OBJECT_IS_7_OR_MORE_TILES_FROM_CAPITAL_REQUIREMENTS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('CAMP_FAR_PENALTY', 'YieldType', 'YIELD_FOOD, YIELD_PRODUCTION, YIELD_GOLD, YIELD_SCIENCE, YIELD_CULTURE, YIELD_FAITH'),
('CAMP_FAR_PENALTY', 'Amount', '-100,-100,-100,-100,-100,-100');

-- Settler movement
INSERT OR IGNORE INTO Types (Type, Kind) VALUES
('AB_CAMP_SETTLER_ADD_MOVE', 'KIND_ABILITY');
INSERT OR IGNORE INTO Tags (Tag, Vocabulary) VALUES
('CAMP_CLASS_AB_SETTLER_MOVE', 'ABILITY_CLASS');
INSERT OR IGNORE INTO TypeTags (Type, Tag) VALUES
('AB_CAMP_SETTLER_ADD_MOVE', 'CAMP_CLASS_AB_SETTLER_MOVE'),
('UNIT_SETTLER',             'CAMP_CLASS_AB_SETTLER_MOVE');
INSERT OR IGNORE INTO UnitAbilities (UnitAbilityType, Inactive, Name, Description) VALUES
('AB_CAMP_SETTLER_ADD_MOVE', 1, 'LOC_AB_CAMP_SETTLER_ADD_MOVE_NAME', 'LOC_AB_CAMP_SETTLER_ADD_MOVE_NAME');

INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
('TRAIT_LEADER_LARRY_CAMP', 'CAMP_SETTLER_GRANT_MOVE_AB');
INSERT INTO Modifiers (ModifierId, ModifierType, RunOnce, Permanent, NewOnly, OwnerRequirementSetId, SubjectRequirementSetId) VALUES
('CAMP_SETTLER_GRANT_MOVE_AB', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 0, 1, 0, NULL, NULL);
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('CAMP_SETTLER_GRANT_MOVE_AB', 'AbilityType', 'AB_CAMP_SETTLER_ADD_MOVE');

INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES
('AB_CAMP_SETTLER_ADD_MOVE', 'CAMP_SETTLER_MOVE_FLAT');
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
('CAMP_SETTLER_MOVE_FLAT', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('CAMP_SETTLER_MOVE_FLAT', 'Amount', '1');

INSERT INTO UnitAbilityModifiers (UnitAbilityType, ModifierId) VALUES
('AB_CAMP_SETTLER_ADD_MOVE', 'CAMP_SETTLER_MOVE_ATTACH');
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('CAMP_SETTLER_MOVE_ATTACH', 'MODIFIER_SINGLE_UNIT_ATTACH_MODIFIER', 'ON_TURN_STARTED');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('CAMP_SETTLER_MOVE_ATTACH', 'ModifierId', 'CAMP_SETTLER_MOVE_STACK');
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
('CAMP_SETTLER_MOVE_STACK', 'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('CAMP_SETTLER_MOVE_STACK', 'Amount', '1');

-- ==========================================================================
-- CIV ABILITY: 营地！
--
-- 营地改良 (IMPROVEMENT_CAMP) +1 生产力, +1 金币
--   → Lemonaide pattern: MODIFIER_PLAYER_ADJUST_PLOT_YIELD
--     + REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES (rule 5)
--
-- 每城 +1 粮食, +1 金币
--   → ForestFish pattern: MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE
-- ==========================================================================

-- ---- Requirement: plot has Camp improvement ----
INSERT INTO Requirements
		(RequirementId,					RequirementType)
VALUES	('REQ_CAMP_HAS_CAMP_IMP',		'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');

INSERT INTO RequirementArguments
		(RequirementId,					Name,				Value)
VALUES	('REQ_CAMP_HAS_CAMP_IMP',		'ImprovementType',	'IMPROVEMENT_CAMP');

INSERT INTO RequirementSets
		(RequirementSetId,				RequirementSetType)
VALUES	('REQSET_CAMP_HAS_CAMP_IMP',	'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,				RequirementId)
VALUES	('REQSET_CAMP_HAS_CAMP_IMP',	'REQ_CAMP_HAS_CAMP_IMP');

-- ---- 营地改良 +1 生产力 (= Lemonaide tundra improved gold) ----
INSERT INTO Modifiers
		(ModifierId,					ModifierType,							SubjectRequirementSetId)
VALUES	('CAMP_IMP_PRODUCTION',			'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'REQSET_CAMP_HAS_CAMP_IMP');

INSERT INTO ModifierArguments
		(ModifierId,					Name,			Value)
VALUES	('CAMP_IMP_PRODUCTION',			'YieldType',	'YIELD_PRODUCTION'),
		('CAMP_IMP_PRODUCTION',			'Amount',		'1');

-- ---- 营地改良 +1 金币 (= Lemonaide tundra improved gold) ----
INSERT INTO Modifiers
		(ModifierId,					ModifierType,							SubjectRequirementSetId)
VALUES	('CAMP_IMP_GOLD',				'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'REQSET_CAMP_HAS_CAMP_IMP');

INSERT INTO ModifierArguments
		(ModifierId,					Name,			Value)
VALUES	('CAMP_IMP_GOLD',				'YieldType',	'YIELD_GOLD'),
		('CAMP_IMP_GOLD',				'Amount',		'1');

-- ---- 每城 +1 粮食 (= ForestFish city center gold) ----
INSERT INTO Modifiers
		(ModifierId,					ModifierType)
VALUES	('CAMP_CITY_FOOD',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE');

INSERT INTO ModifierArguments
		(ModifierId,					Name,			Value)
VALUES	('CAMP_CITY_FOOD',				'YieldType',	'YIELD_FOOD'),
		('CAMP_CITY_FOOD',				'Amount',		'1');

-- ---- 每城 +1 金币 (= ForestFish city center gold) ----
INSERT INTO Modifiers
		(ModifierId,					ModifierType)
VALUES	('CAMP_CITY_GOLD',				'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE');

INSERT INTO ModifierArguments
		(ModifierId,					Name,			Value)
VALUES	('CAMP_CITY_GOLD',				'YieldType',	'YIELD_GOLD'),
		('CAMP_CITY_GOLD',				'Amount',		'1');

-- ==========================================================================
-- BIND TO TRAITS
-- ==========================================================================

-- Leader: 精铺
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
('TRAIT_LEADER_LARRY_CAMP', 'CAMP_NEARBY_YIELD'),
('TRAIT_LEADER_LARRY_CAMP', 'CAMP_10POP_YIELD'),
('TRAIT_LEADER_LARRY_CAMP', 'CAMP_20POP_YIELD'),
('TRAIT_LEADER_LARRY_CAMP', 'CAMP_30POP_YIELD'),
('TRAIT_LEADER_LARRY_CAMP', 'CAMP_40POP_YIELD'),
('TRAIT_LEADER_LARRY_CAMP', 'CAMP_50POP_YIELD'),
('TRAIT_LEADER_LARRY_CAMP', 'CAMP_FAR_PENALTY');

-- Civ: 营地！
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
('TRAIT_CIVILIZATION_LARRY_CAMP', 'CAMP_IMP_PRODUCTION'),
('TRAIT_CIVILIZATION_LARRY_CAMP', 'CAMP_IMP_GOLD'),
('TRAIT_CIVILIZATION_LARRY_CAMP', 'CAMP_CITY_FOOD'),
('TRAIT_CIVILIZATION_LARRY_CAMP', 'CAMP_CITY_GOLD');
