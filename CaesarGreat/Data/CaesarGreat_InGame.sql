-- =============================================================================
-- Caesar the Great - InGame Database (v2 Nerfed)
-- Based on working version structure (SceneLayers, DELETE cleanups)
-- =============================================================================

-- =====================
-- 1. TYPES
-- =====================
INSERT INTO Types (Type, Kind) VALUES
    ('LEADER_CAESAR_GREAT',         'KIND_LEADER'),
    ('TRAIT_LEADER_CAESAR_GREAT',   'KIND_TRAIT');

-- =====================
-- 2. LEADERS (SceneLayers, NOT SceneSortIndex)
-- =====================
INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) VALUES
    ('LEADER_CAESAR_GREAT', 'LOC_LEADER_CAESAR_GREAT_NAME', NULL, 4);

-- =====================
-- 3. LEADER <-> CIVILIZATION
-- =====================
INSERT INTO CivilizationLeaders (CivilizationType, LeaderType, CapitalName) VALUES
    ('CIVILIZATION_ROME', 'LEADER_CAESAR_GREAT', 'LOC_CITY_NAME_ROME');

-- =====================
-- 4. TRAITS
-- =====================
INSERT INTO Traits (TraitType, Name, Description) VALUES
    ('TRAIT_LEADER_CAESAR_GREAT', 'LOC_TRAIT_LEADER_CAESAR_GREAT_NAME', 'LOC_TRAIT_LEADER_CAESAR_GREAT_DESCRIPTION');

INSERT INTO LeaderTraits (LeaderType, TraitType) VALUES
    ('LEADER_CAESAR_GREAT', 'TRAIT_LEADER_CAESAR_GREAT');

-- =====================
-- 5. AGENDA
-- =====================
INSERT INTO Agendas (AgendaType, Name, Description) VALUES
    ('AGENDA_CAESAR_MILITARY_GLORY', 'LOC_AGENDA_CAESAR_MILITARY_GLORY_NAME', 'LOC_AGENDA_CAESAR_MILITARY_GLORY_DESCRIPTION');

INSERT INTO HistoricalAgendas (LeaderType, AgendaType) VALUES
    ('LEADER_CAESAR_GREAT', 'AGENDA_CAESAR_MILITARY_GLORY');

-- =====================
-- 6. TRAIT MODIFIERS
-- =====================
INSERT INTO TraitModifiers (TraitType, ModifierId) VALUES
    -- Eureka boosts
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_EUREKA_BRONZE_WORKING'),
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_EUREKA_IRON_WORKING'),
    -- Melee +3 (requires Political Philosophy)
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_MELEE_COMBAT_ATTACH'),
    -- Encampment free maintenance (gold offsets)
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_ENCAMPMENT_GOLD'),
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_BARRACKS_GOLD'),
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_STABLE_GOLD'),
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_ARMORY_GOLD'),
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_MILITARY_ACADEMY_GOLD'),
    -- Trade routes (Barracks/Stable in cities without Commercial Hub/Harbor)
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_BARRACKS_TRADE_OUTER'),
    ('TRAIT_LEADER_CAESAR_GREAT', 'CAESAR_STABLE_TRADE_OUTER');

-- =============================================================================
-- 7. MODIFIERS
-- =============================================================================

-- -------------------------------------------------------
-- 7A. EUREKA: Bronze Working & Iron Working
-- -------------------------------------------------------
INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('CAESAR_EUREKA_BRONZE_WORKING', 'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST'),
    ('CAESAR_EUREKA_IRON_WORKING',   'MODIFIER_PLAYER_GRANT_SPECIFIC_TECH_BOOST');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_EUREKA_BRONZE_WORKING', 'TechType', 'TECH_BRONZE_WORKING'),
    ('CAESAR_EUREKA_IRON_WORKING',   'TechType', 'TECH_IRON_WORKING');

-- -------------------------------------------------------
-- 7B. MELEE +3 COMBAT STRENGTH (requires Political Philosophy)
-- -------------------------------------------------------
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES
    ('CAESAR_MELEE_COMBAT_ATTACH', 'MODIFIER_PLAYER_UNITS_ATTACH_MODIFIER',
     'CAESAR_REQSET_IS_MELEE', 'CAESAR_REQSET_HAS_POLITICAL_PHILOSOPHY');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_MELEE_COMBAT_ATTACH', 'ModifierId', 'CAESAR_MELEE_COMBAT_MOD');

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('CAESAR_MELEE_COMBAT_MOD', 'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');

INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_MELEE_COMBAT_MOD', 'Amount', '3');

-- Requirement: unit is melee
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('CAESAR_REQSET_IS_MELEE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('CAESAR_REQSET_IS_MELEE', 'CAESAR_REQ_IS_MELEE');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('CAESAR_REQ_IS_MELEE', 'REQUIREMENT_UNIT_PROMOTION_CLASS_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_IS_MELEE', 'UnitPromotionClass', 'PROMOTION_CLASS_MELEE');

-- Requirement: player has Political Philosophy
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('CAESAR_REQSET_HAS_POLITICAL_PHILOSOPHY', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('CAESAR_REQSET_HAS_POLITICAL_PHILOSOPHY', 'CAESAR_REQ_HAS_POLITICAL_PHILOSOPHY');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('CAESAR_REQ_HAS_POLITICAL_PHILOSOPHY', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_HAS_POLITICAL_PHILOSOPHY', 'CivicType', 'CIVIC_POLITICAL_PHILOSOPHY');

-- -------------------------------------------------------
-- 7C. ENCAMPMENT FREE MAINTENANCE (gold offsets)
--     Encampment +1, Barracks +1, Stable +1, Armory +2, MilAcademy +2
-- -------------------------------------------------------

-- Encampment district +1 Gold
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('CAESAR_ENCAMPMENT_GOLD', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'CAESAR_REQSET_IS_ENCAMPMENT');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_ENCAMPMENT_GOLD', 'YieldType', 'YIELD_GOLD'),
    ('CAESAR_ENCAMPMENT_GOLD', 'Amount',    '1');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('CAESAR_REQSET_IS_ENCAMPMENT', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('CAESAR_REQSET_IS_ENCAMPMENT', 'CAESAR_REQ_IS_ENCAMPMENT');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('CAESAR_REQ_IS_ENCAMPMENT', 'REQUIREMENT_DISTRICT_TYPE_MATCHES');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_IS_ENCAMPMENT', 'DistrictType', 'DISTRICT_ENCAMPMENT');

-- Barracks +1 Gold
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('CAESAR_BARRACKS_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CAESAR_REQSET_HAS_BARRACKS');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_BARRACKS_GOLD', 'YieldType', 'YIELD_GOLD'),
    ('CAESAR_BARRACKS_GOLD', 'Amount',    '1');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('CAESAR_REQSET_HAS_BARRACKS', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('CAESAR_REQSET_HAS_BARRACKS', 'CAESAR_REQ_HAS_BARRACKS');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('CAESAR_REQ_HAS_BARRACKS', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_HAS_BARRACKS', 'BuildingType', 'BUILDING_BARRACKS');

-- Stable +1 Gold
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('CAESAR_STABLE_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CAESAR_REQSET_HAS_STABLE');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_STABLE_GOLD', 'YieldType', 'YIELD_GOLD'),
    ('CAESAR_STABLE_GOLD', 'Amount',    '1');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('CAESAR_REQSET_HAS_STABLE', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('CAESAR_REQSET_HAS_STABLE', 'CAESAR_REQ_HAS_STABLE');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('CAESAR_REQ_HAS_STABLE', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_HAS_STABLE', 'BuildingType', 'BUILDING_STABLE');

-- Armory +2 Gold
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('CAESAR_ARMORY_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CAESAR_REQSET_HAS_ARMORY');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_ARMORY_GOLD', 'YieldType', 'YIELD_GOLD'),
    ('CAESAR_ARMORY_GOLD', 'Amount',    '2');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('CAESAR_REQSET_HAS_ARMORY', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('CAESAR_REQSET_HAS_ARMORY', 'CAESAR_REQ_HAS_ARMORY');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('CAESAR_REQ_HAS_ARMORY', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_HAS_ARMORY', 'BuildingType', 'BUILDING_ARMORY');

-- Military Academy +2 Gold
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('CAESAR_MILITARY_ACADEMY_GOLD', 'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE', 'CAESAR_REQSET_HAS_MILITARY_ACADEMY');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_MILITARY_ACADEMY_GOLD', 'YieldType', 'YIELD_GOLD'),
    ('CAESAR_MILITARY_ACADEMY_GOLD', 'Amount',    '2');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('CAESAR_REQSET_HAS_MILITARY_ACADEMY', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('CAESAR_REQSET_HAS_MILITARY_ACADEMY', 'CAESAR_REQ_HAS_MILITARY_ACADEMY');
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('CAESAR_REQ_HAS_MILITARY_ACADEMY', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_HAS_MILITARY_ACADEMY', 'BuildingType', 'BUILDING_MILITARY_ACADEMY');

-- -------------------------------------------------------
-- 7D. TRADE ROUTES: Barracks/Stable +1 in cities without
--     Commercial Hub or Harbor (ATTACH pattern + Inverse)
-- -------------------------------------------------------

-- Shared inverted requirements
INSERT INTO Requirements (RequirementId, RequirementType, Inverse) VALUES
    ('CAESAR_REQ_NO_COMMERCIAL_HUB', 'REQUIREMENT_CITY_HAS_DISTRICT', 1);
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_NO_COMMERCIAL_HUB', 'DistrictType', 'DISTRICT_COMMERCIAL_HUB');

INSERT INTO Requirements (RequirementId, RequirementType, Inverse) VALUES
    ('CAESAR_REQ_NO_HARBOR', 'REQUIREMENT_CITY_HAS_DISTRICT', 1);
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_NO_HARBOR', 'DistrictType', 'DISTRICT_HARBOR');

-- ---- Barracks trade route path ----
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('CAESAR_REQ_CITY_BARRACKS_TRADE', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_CITY_BARRACKS_TRADE', 'BuildingType', 'BUILDING_BARRACKS');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('CAESAR_REQSET_BARRACKS_NO_COMM_HARBOR', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('CAESAR_REQSET_BARRACKS_NO_COMM_HARBOR', 'CAESAR_REQ_CITY_BARRACKS_TRADE'),
    ('CAESAR_REQSET_BARRACKS_NO_COMM_HARBOR', 'CAESAR_REQ_NO_COMMERCIAL_HUB'),
    ('CAESAR_REQSET_BARRACKS_NO_COMM_HARBOR', 'CAESAR_REQ_NO_HARBOR');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('CAESAR_BARRACKS_TRADE_OUTER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',
     'CAESAR_REQSET_BARRACKS_NO_COMM_HARBOR');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_BARRACKS_TRADE_OUTER', 'ModifierId', 'CAESAR_BARRACKS_TRADE_INNER');

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('CAESAR_BARRACKS_TRADE_INNER', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_BARRACKS_TRADE_INNER', 'Amount', '1');

-- ---- Stable trade route path ----
INSERT INTO Requirements (RequirementId, RequirementType) VALUES
    ('CAESAR_REQ_CITY_STABLE_TRADE', 'REQUIREMENT_CITY_HAS_BUILDING');
INSERT INTO RequirementArguments (RequirementId, Name, Value) VALUES
    ('CAESAR_REQ_CITY_STABLE_TRADE', 'BuildingType', 'BUILDING_STABLE');

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES
    ('CAESAR_REQSET_STABLE_NO_COMM_HARBOR', 'REQUIREMENTSET_TEST_ALL');
INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES
    ('CAESAR_REQSET_STABLE_NO_COMM_HARBOR', 'CAESAR_REQ_CITY_STABLE_TRADE'),
    ('CAESAR_REQSET_STABLE_NO_COMM_HARBOR', 'CAESAR_REQ_NO_COMMERCIAL_HUB'),
    ('CAESAR_REQSET_STABLE_NO_COMM_HARBOR', 'CAESAR_REQ_NO_HARBOR');

INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES
    ('CAESAR_STABLE_TRADE_OUTER', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER',
     'CAESAR_REQSET_STABLE_NO_COMM_HARBOR');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_STABLE_TRADE_OUTER', 'ModifierId', 'CAESAR_STABLE_TRADE_INNER');

INSERT INTO Modifiers (ModifierId, ModifierType) VALUES
    ('CAESAR_STABLE_TRADE_INNER', 'MODIFIER_PLAYER_ADJUST_TRADE_ROUTE_CAPACITY');
INSERT INTO ModifierArguments (ModifierId, Name, Value) VALUES
    ('CAESAR_STABLE_TRADE_INNER', 'Amount', '1');

-- =============================================================================
-- CLEANUP: Remove inherited traits/agendas from base game leaders
-- =============================================================================
DELETE FROM LeaderTraits 
WHERE LeaderType = 'LEADER_CAESAR_GREAT' 
  AND TraitType != 'TRAIT_LEADER_CAESAR_GREAT';

DELETE FROM HistoricalAgendas 
WHERE LeaderType = 'LEADER_CAESAR_GREAT' 
  AND AgendaType != 'AGENDA_CAESAR_MILITARY_GLORY';
