-- ==========================================================================
-- Ambigatus - Alternate Leader for Gaul
-- Leader Ability: 沃矿兴邦 (Prosperous Mines)
--   Mines: -1 Production, +1 Food, +1 Gold
--   Mines: +1 Gold if the city has an Oppidum
--   Oppidum and its buildings: +1 Housing each
-- ==========================================================================

-- ============================================
-- TYPES & LEADER
-- ============================================
INSERT INTO Types (Type, Kind) VALUES
('LEADER_AMBIGATUS',       'KIND_LEADER'),
('TRAIT_LEADER_AMBIGATUS', 'KIND_TRAIT');

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) VALUES
('LEADER_AMBIGATUS', 'LOC_LEADER_AMBIGATUS_NAME', 'LEADER_DEFAULT', 4);

INSERT INTO CivilizationLeaders (CivilizationType, LeaderType, CapitalName) VALUES
('CIVILIZATION_GAUL', 'LEADER_AMBIGATUS', 'LOC_CITY_NAME_BIBRACTE');

INSERT INTO Traits (TraitType, Name, Description) VALUES
('TRAIT_LEADER_AMBIGATUS', 'LOC_TRAIT_LEADER_AMBIGATUS_NAME', 'LOC_TRAIT_LEADER_AMBIGATUS_DESCRIPTION');

INSERT INTO LeaderTraits (LeaderType, TraitType) VALUES
('LEADER_AMBIGATUS', 'TRAIT_LEADER_AMBIGATUS');

-- ==========================================================================
-- REQUIREMENTS (reusable)
-- ==========================================================================

-- Plot has Mine
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQ_AMBIGATUS_PLOT_IS_MINE', 'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQ_AMBIGATUS_PLOT_IS_MINE', 'ImprovementType', 'IMPROVEMENT_MINE');

-- District is Oppidum
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQ_AMBIGATUS_DIST_IS_OPPIDUM', 'REQUIREMENT_DISTRICT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQ_AMBIGATUS_DIST_IS_OPPIDUM', 'DistrictType', 'DISTRICT_OPPIDUM');

-- City has Oppidum
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQ_AMBIGATUS_CITY_HAS_OPPIDUM', 'REQUIREMENT_CITY_HAS_DISTRICT');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQ_AMBIGATUS_CITY_HAS_OPPIDUM', 'DistrictType', 'DISTRICT_OPPIDUM');

-- City has Workshop
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQ_AMBIGATUS_CITY_HAS_WORKSHOP', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQ_AMBIGATUS_CITY_HAS_WORKSHOP', 'BuildingType', 'BUILDING_WORKSHOP');

-- City has Factory
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQ_AMBIGATUS_CITY_HAS_FACTORY', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQ_AMBIGATUS_CITY_HAS_FACTORY', 'BuildingType', 'BUILDING_FACTORY');

-- City has Coal Power Plant
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQ_AMBIGATUS_CITY_HAS_COALPP', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQ_AMBIGATUS_CITY_HAS_COALPP', 'BuildingType', 'BUILDING_COAL_POWER_PLANT');

-- City has Oil Power Plant
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQ_AMBIGATUS_CITY_HAS_OILPP', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQ_AMBIGATUS_CITY_HAS_OILPP', 'BuildingType', 'BUILDING_FOSSIL_FUEL_POWER_PLANT');

-- City has Nuclear Power Plant
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
('REQ_AMBIGATUS_CITY_HAS_NUCLEARPP', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
('REQ_AMBIGATUS_CITY_HAS_NUCLEARPP', 'BuildingType', 'BUILDING_POWER_PLANT');

-- ==========================================================================
-- REQUIREMENT SETS
-- ==========================================================================

-- Plot has Mine (for flat mine yields)
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQSET_AMBIGATUS_PLOT_IS_MINE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQSET_AMBIGATUS_PLOT_IS_MINE', 'REQ_AMBIGATUS_PLOT_IS_MINE');

-- City has Oppidum (for ATTACH outer layer)
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQSET_AMBIGATUS_CITY_HAS_OPPIDUM', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQSET_AMBIGATUS_CITY_HAS_OPPIDUM', 'REQ_AMBIGATUS_CITY_HAS_OPPIDUM');

-- District is Oppidum (base housing)
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQSET_AMBIGATUS_IS_OPPIDUM', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQSET_AMBIGATUS_IS_OPPIDUM', 'REQ_AMBIGATUS_DIST_IS_OPPIDUM');

-- District is Oppidum AND city has Workshop
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQSET_AMBIGATUS_OPPIDUM_WORKSHOP', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQSET_AMBIGATUS_OPPIDUM_WORKSHOP', 'REQ_AMBIGATUS_DIST_IS_OPPIDUM'),
('REQSET_AMBIGATUS_OPPIDUM_WORKSHOP', 'REQ_AMBIGATUS_CITY_HAS_WORKSHOP');

-- District is Oppidum AND city has Factory
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQSET_AMBIGATUS_OPPIDUM_FACTORY', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQSET_AMBIGATUS_OPPIDUM_FACTORY', 'REQ_AMBIGATUS_DIST_IS_OPPIDUM'),
('REQSET_AMBIGATUS_OPPIDUM_FACTORY', 'REQ_AMBIGATUS_CITY_HAS_FACTORY');

-- District is Oppidum AND city has Coal PP
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQSET_AMBIGATUS_OPPIDUM_COALPP', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQSET_AMBIGATUS_OPPIDUM_COALPP', 'REQ_AMBIGATUS_DIST_IS_OPPIDUM'),
('REQSET_AMBIGATUS_OPPIDUM_COALPP', 'REQ_AMBIGATUS_CITY_HAS_COALPP');

-- District is Oppidum AND city has Oil PP
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQSET_AMBIGATUS_OPPIDUM_OILPP', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQSET_AMBIGATUS_OPPIDUM_OILPP', 'REQ_AMBIGATUS_DIST_IS_OPPIDUM'),
('REQSET_AMBIGATUS_OPPIDUM_OILPP', 'REQ_AMBIGATUS_CITY_HAS_OILPP');

-- District is Oppidum AND city has Nuclear PP
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
('REQSET_AMBIGATUS_OPPIDUM_NUCLEARPP', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
('REQSET_AMBIGATUS_OPPIDUM_NUCLEARPP', 'REQ_AMBIGATUS_DIST_IS_OPPIDUM'),
('REQSET_AMBIGATUS_OPPIDUM_NUCLEARPP', 'REQ_AMBIGATUS_CITY_HAS_NUCLEARPP');

-- ==========================================================================
-- PART 1: MINE YIELDS (flat)
-- MODIFIER_PLAYER_ADJUST_PLOT_YIELD (proven Lemonaide pattern)
-- ==========================================================================

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_MINE_MINUS_PROD', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_AMBIGATUS_PLOT_IS_MINE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_MINE_MINUS_PROD', 'YieldType', 'YIELD_PRODUCTION'),
('AMBIGATUS_MINE_MINUS_PROD', 'Amount',    '-1');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_MINE_PLUS_FOOD', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_AMBIGATUS_PLOT_IS_MINE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_MINE_PLUS_FOOD', 'YieldType', 'YIELD_FOOD'),
('AMBIGATUS_MINE_PLUS_FOOD', 'Amount',    '1');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_MINE_PLUS_GOLD', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_AMBIGATUS_PLOT_IS_MINE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_MINE_PLUS_GOLD', 'YieldType', 'YIELD_GOLD'),
('AMBIGATUS_MINE_PLUS_GOLD', 'Amount',    '1');

-- ==========================================================================
-- PART 2: MINE +1 GOLD conditional on Oppidum (proven ATTACH pattern)
-- ==========================================================================

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_ATTACH_OPP_MINE_GOLD', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 'REQSET_AMBIGATUS_CITY_HAS_OPPIDUM');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_ATTACH_OPP_MINE_GOLD', 'ModifierId', 'AMBIGATUS_INNER_OPP_MINE_GOLD');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_INNER_OPP_MINE_GOLD', 'MODIFIER_CITY_PLOT_YIELDS_ADJUST_PLOT_YIELD', 'REQSET_AMBIGATUS_PLOT_IS_MINE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_INNER_OPP_MINE_GOLD', 'YieldType', 'YIELD_GOLD'),
('AMBIGATUS_INNER_OPP_MINE_GOLD', 'Amount',    '1');

-- ==========================================================================
-- PART 3: OPPIDUM & BUILDING HOUSING
-- All use MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING (proven Planner pattern)
-- with compound SubjectRequirementSets stacking on the Oppidum district
-- ==========================================================================

-- Oppidum base: +1 Housing
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_OPP_HOUSING_BASE', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 'REQSET_AMBIGATUS_IS_OPPIDUM');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_OPP_HOUSING_BASE', 'Amount', '1');

-- Oppidum +1 Housing if city has Workshop
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_OPP_HOUSING_WORKSHOP', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 'REQSET_AMBIGATUS_OPPIDUM_WORKSHOP');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_OPP_HOUSING_WORKSHOP', 'Amount', '1');

-- Oppidum +1 Housing if city has Factory
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_OPP_HOUSING_FACTORY', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 'REQSET_AMBIGATUS_OPPIDUM_FACTORY');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_OPP_HOUSING_FACTORY', 'Amount', '1');

-- Oppidum +1 Housing if city has Coal Power Plant
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_OPP_HOUSING_COALPP', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 'REQSET_AMBIGATUS_OPPIDUM_COALPP');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_OPP_HOUSING_COALPP', 'Amount', '1');

-- Oppidum +1 Housing if city has Oil Power Plant
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_OPP_HOUSING_OILPP', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 'REQSET_AMBIGATUS_OPPIDUM_OILPP');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_OPP_HOUSING_OILPP', 'Amount', '1');

-- Oppidum +1 Housing if city has Nuclear Power Plant
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
('AMBIGATUS_OPP_HOUSING_NUCLEARPP', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 'REQSET_AMBIGATUS_OPPIDUM_NUCLEARPP');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
('AMBIGATUS_OPP_HOUSING_NUCLEARPP', 'Amount', '1');

-- ==========================================================================
-- BIND ALL TO TRAIT (only outer/top-level modifiers)
-- ==========================================================================
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_MINE_MINUS_PROD'),
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_MINE_PLUS_FOOD'),
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_MINE_PLUS_GOLD'),
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_ATTACH_OPP_MINE_GOLD'),
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_OPP_HOUSING_BASE'),
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_OPP_HOUSING_WORKSHOP'),
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_OPP_HOUSING_FACTORY'),
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_OPP_HOUSING_COALPP'),
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_OPP_HOUSING_OILPP'),
('TRAIT_LEADER_AMBIGATUS', 'AMBIGATUS_OPP_HOUSING_NUCLEARPP');
