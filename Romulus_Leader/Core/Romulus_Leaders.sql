-- ==========================================================================
-- ROMULUS - Alternate Leader for Rome  (v4)
-- Leader Ability: "Father of Rome" (罗马之父)
--
--   1. Government Plaza & its buildings each grant melee units
--      +1 [ICON_Strength] Combat Strength (max +4: district +3 buildings)
--   2. Capital: each district (any) +1 Food, +1 Production
--   3. Domestic trade routes TO capital:
--      Per specialty district: +0.5 Food, +0.5 Production, +0.5 Gold
--
-- NO LUA. Multiplayer safe.
--
-- v4 CHANGES from v3:
--   - Melee CS: flat +3 → Gov Plaza scaling +1/+2/+3/+4
--   - Capital yields: +2F → +1F per district
--   - Trade gold: all districts +1 → specialty only +0.5
-- ==========================================================================

-- ==========================================================================
-- TYPES
-- ==========================================================================
INSERT INTO Types (Type, Kind)
VALUES	('LEADER_ROMULUS',        'KIND_LEADER'),
		('TRAIT_LEADER_ROMULUS',   'KIND_TRAIT');

INSERT INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers)
VALUES ('LEADER_ROMULUS', 'LOC_LEADER_ROMULUS_NAME', 'LEADER_DEFAULT', 4);

INSERT INTO LeaderTraits (LeaderType, TraitType)
VALUES ('LEADER_ROMULUS', 'TRAIT_LEADER_ROMULUS');

INSERT INTO Traits (TraitType, Name, Description)
VALUES ('TRAIT_LEADER_ROMULUS', 'LOC_TRAIT_LEADER_ROMULUS_NAME', 'LOC_TRAIT_LEADER_ROMULUS_DESCRIPTION');

INSERT INTO CivilizationLeaders (CivilizationType, LeaderType, CapitalName)
VALUES ('CIVILIZATION_ROME', 'LEADER_ROMULUS', 'LOC_CITY_NAME_ROME');

-- ==========================================================================
-- AGENDA
-- ==========================================================================
INSERT INTO Agendas (AgendaType, Name, Description)
VALUES ('AGENDA_ROMULUS', 'LOC_AGENDA_ROMULUS_NAME', 'LOC_AGENDA_ROMULUS_DESCRIPTION');

INSERT INTO Types  (Type, Kind) VALUES ('TRAIT_AGENDA_ROMULUS', 'KIND_TRAIT');
INSERT INTO Traits (TraitType)  VALUES ('TRAIT_AGENDA_ROMULUS');

INSERT INTO AgendaTraits      (AgendaType,  TraitType)  VALUES ('AGENDA_ROMULUS', 'TRAIT_AGENDA_ROMULUS');
INSERT INTO HistoricalAgendas (LeaderType,  AgendaType) VALUES ('LEADER_ROMULUS', 'AGENDA_ROMULUS');
INSERT INTO LeaderTraits      (LeaderType,  TraitType)  VALUES ('LEADER_ROMULUS', 'TRAIT_AGENDA_ROMULUS');

INSERT INTO LoadingInfo (LeaderType, ForegroundImage, BackgroundImage, LeaderText)
VALUES ('LEADER_ROMULUS', 'Romulus_Portrait', 'LEADER_TRAJAN_BACKGROUND', 'LOC_LOADING_INFO_LEADER_ROMULUS');

INSERT INTO FavoredReligions (LeaderType, ReligionType)
VALUES ('LEADER_ROMULUS', 'RELIGION_CATHOLICISM');

-- **************************************************************************
-- SHARED REQUIREMENT: Is Romulus (for BuildingModifiers scoping)
-- **************************************************************************
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES ('RS_ROM_IS_ROMULUS', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES ('REQ_ROM_IS_ROMULUS', 'REQUIREMENT_PLAYER_LEADER_TYPE_MATCHES');

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES ('REQ_ROM_IS_ROMULUS', 'LeaderType', 'LEADER_ROMULUS');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES ('RS_ROM_IS_ROMULUS', 'REQ_ROM_IS_ROMULUS');

-- **************************************************************************
-- ABILITY 1: Government Plaza & buildings → melee +1 CS each (max +4)
-- **************************************************************************

-- --------------------------------------------------------------------------
-- 1a. Government Plaza DISTRICT → +1 CS (ABILITY_ROMULUS_GOV_0)
--     Pattern: two-layer ATTACH (trait → city with Gov Plaza → grant ability)
-- --------------------------------------------------------------------------
INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
VALUES ('RS_ROM_CITY_HAS_GOV', 'REQUIREMENTSET_TEST_ALL');

INSERT INTO Requirements (RequirementId, RequirementType)
VALUES ('REQ_ROM_CITY_HAS_GOV', 'REQUIREMENT_CITY_HAS_DISTRICT');

INSERT INTO RequirementArguments (RequirementId, Name, Value)
VALUES ('REQ_ROM_CITY_HAS_GOV', 'DistrictType', 'DISTRICT_GOVERNMENT');

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
VALUES ('RS_ROM_CITY_HAS_GOV', 'REQ_ROM_CITY_HAS_GOV');

-- Outer: attach to cities with Government Plaza
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES ('ROM_GOV_PLAZA_ATTACH', 'MODIFIER_PLAYER_CITIES_ATTACH_MODIFIER', 'RS_ROM_CITY_HAS_GOV');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('ROM_GOV_PLAZA_ATTACH', 'ModifierId', 'ROM_GOV_PLAZA_INNER');

-- Inner: grant ability to melee units
INSERT INTO Modifiers (ModifierId, ModifierType)
VALUES ('ROM_GOV_PLAZA_INNER', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('ROM_GOV_PLAZA_INNER', 'AbilityType', 'ABILITY_ROMULUS_GOV_0');

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES ('TRAIT_LEADER_ROMULUS', 'ROM_GOV_PLAZA_ATTACH');

-- --------------------------------------------------------------------------
-- 1b. Government Plaza T1 BUILDINGS → +1 CS (ABILITY_ROMULUS_GOV_1)
--     Pattern: BuildingModifiers + OwnerRequirementSetId (Romulus only)
-- --------------------------------------------------------------------------
INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
VALUES ('ROM_GOV_T1_GRANT', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 'RS_ROM_IS_ROMULUS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('ROM_GOV_T1_GRANT', 'AbilityType', 'ABILITY_ROMULUS_GOV_1');

INSERT INTO BuildingModifiers (BuildingType, ModifierId)
VALUES	('BUILDING_GOV_TALL',      'ROM_GOV_T1_GRANT'),
		('BUILDING_GOV_WIDE',      'ROM_GOV_T1_GRANT'),
		('BUILDING_GOV_CONQUEST',  'ROM_GOV_T1_GRANT');

-- --------------------------------------------------------------------------
-- 1c. Government Plaza T2 BUILDINGS → +1 CS (ABILITY_ROMULUS_GOV_2)
-- --------------------------------------------------------------------------
INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
VALUES ('ROM_GOV_T2_GRANT', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 'RS_ROM_IS_ROMULUS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('ROM_GOV_T2_GRANT', 'AbilityType', 'ABILITY_ROMULUS_GOV_2');

INSERT INTO BuildingModifiers (BuildingType, ModifierId)
VALUES	('BUILDING_GOV_CITYSTATES',  'ROM_GOV_T2_GRANT'),
		('BUILDING_GOV_FAITH',       'ROM_GOV_T2_GRANT'),
		('BUILDING_GOV_SPIES',       'ROM_GOV_T2_GRANT');

-- --------------------------------------------------------------------------
-- 1d. Government Plaza T3 BUILDINGS → +1 CS (ABILITY_ROMULUS_GOV_3)
-- --------------------------------------------------------------------------
INSERT INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId)
VALUES ('ROM_GOV_T3_GRANT', 'MODIFIER_PLAYER_UNITS_GRANT_ABILITY', 'RS_ROM_IS_ROMULUS');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES ('ROM_GOV_T3_GRANT', 'AbilityType', 'ABILITY_ROMULUS_GOV_3');

INSERT INTO BuildingModifiers (BuildingType, ModifierId)
VALUES	('BUILDING_GOV_CULTURE',   'ROM_GOV_T3_GRANT'),
		('BUILDING_GOV_SCIENCE',   'ROM_GOV_T3_GRANT'),
		('BUILDING_GOV_MILITARY',  'ROM_GOV_T3_GRANT');

-- **************************************************************************
-- TWO CUSTOM DynamicModifiers (Nwflower pattern, unchanged from v3)
-- Both use COLLECTION_PLAYER_CAPITAL_CITY (proven)
-- **************************************************************************

-- 1) For capital city yields
INSERT INTO Types (Type, Kind)
VALUES ('MODIFIER_ROM_CAP_YIELD', 'KIND_MODIFIER');

INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES ('MODIFIER_ROM_CAP_YIELD', 'COLLECTION_PLAYER_CAPITAL_CITY', 'EFFECT_ADJUST_CITY_YIELD_CHANGE');

-- 2) For domestic trade routes to capital
INSERT INTO Types (Type, Kind)
VALUES ('MODIFIER_ROM_CAP_TRADE', 'KIND_MODIFIER');

INSERT INTO DynamicModifiers (ModifierType, CollectionType, EffectType)
VALUES ('MODIFIER_ROM_CAP_TRADE', 'COLLECTION_PLAYER_CAPITAL_CITY', 'EFFECT_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS');

-- **************************************************************************
-- TEMP TABLE: All districts
-- **************************************************************************
CREATE TEMP TABLE _RD (
	D TEXT NOT NULL,
	T TEXT NOT NULL,
	S INTEGER NOT NULL
);
INSERT INTO _RD (D, T, S) VALUES
('DISTRICT_CAMPUS',                      'CAMPUS',    1),
('DISTRICT_HOLY_SITE',                   'HOLY',      1),
('DISTRICT_THEATER',                     'THEATER',   1),
('DISTRICT_COMMERCIAL_HUB',              'COMHUB',    1),
('DISTRICT_HARBOR',                      'HARBOR',    1),
('DISTRICT_INDUSTRIAL_ZONE',             'INDZONE',   1),
('DISTRICT_ENTERTAINMENT_COMPLEX',       'ENTCPX',    1),
('DISTRICT_WATER_ENTERTAINMENT_COMPLEX', 'WATERENT',  1),
('DISTRICT_ENCAMPMENT',                  'ENCAMP',    1),
('DISTRICT_AERODROME',                   'AERO',      1),
('DISTRICT_DIPLOMATIC_QUARTER',          'DIPLO',     1),
('DISTRICT_PRESERVE',                    'PRESERVE',  1),
('DISTRICT_GOVERNMENT',                  'GOV',       1),
('DISTRICT_CITY_CENTER',                 'CENTER',    0),
('DISTRICT_AQUEDUCT',                    'AQUEDUCT',  0),
('DISTRICT_BATH',                        'BATH',      0),
('DISTRICT_DAM',                         'DAM',       0),
('DISTRICT_CANAL',                       'CANAL',     0),
('DISTRICT_NEIGHBORHOOD',               'NBHOOD',    0),
('DISTRICT_SPACEPORT',                   'SPACE',     0);

-- **************************************************************************
-- SHARED REQUIREMENTS: city has district X
-- (Subject = capital city from COLLECTION_PLAYER_CAPITAL_CITY)
-- **************************************************************************
INSERT INTO Requirements (RequirementId, RequirementType)
SELECT 'REQ_ROM_' || T, 'REQUIREMENT_CITY_HAS_DISTRICT'
FROM _RD;

INSERT INTO RequirementArguments (RequirementId, Name, Value)
SELECT 'REQ_ROM_' || T, 'DistrictType', D
FROM _RD;

INSERT INTO RequirementSets (RequirementSetId, RequirementSetType)
SELECT 'RS_ROM_' || T, 'REQUIREMENTSET_TEST_ALL'
FROM _RD;

INSERT INTO RequirementSetRequirements (RequirementSetId, RequirementId)
SELECT 'RS_ROM_' || T, 'REQ_ROM_' || T
FROM _RD;

-- **************************************************************************
-- ABILITY 2: Capital per-district +1 Food, +1 Production  (v4: was +2F)
-- Uses MODIFIER_ROM_CAP_YIELD (custom: COLLECTION_PLAYER_CAPITAL_CITY
--   + EFFECT_ADJUST_CITY_YIELD_CHANGE)
-- **************************************************************************

-- +1 Food per district (all types) — changed from +2 in v3
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'ROM_CY_' || T || '_F', 'MODIFIER_ROM_CAP_YIELD', 'RS_ROM_' || T
FROM _RD;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'ROM_CY_' || T || '_F', 'YieldType', 'YIELD_FOOD' FROM _RD
UNION ALL
SELECT 'ROM_CY_' || T || '_F', 'Amount', '1' FROM _RD;

-- +1 Production per district (all types) — unchanged
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'ROM_CY_' || T || '_P', 'MODIFIER_ROM_CAP_YIELD', 'RS_ROM_' || T
FROM _RD;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'ROM_CY_' || T || '_P', 'YieldType', 'YIELD_PRODUCTION' FROM _RD
UNION ALL
SELECT 'ROM_CY_' || T || '_P', 'Amount', '1' FROM _RD;

-- Link to trait
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_ROMULUS', 'ROM_CY_' || T || '_F' FROM _RD;

INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_ROMULUS', 'ROM_CY_' || T || '_P' FROM _RD;

-- **************************************************************************
-- ABILITY 3: Domestic trade routes TO capital
-- v4: SIMPLIFIED — specialty districts ONLY, all three yields at +0.5
-- Uses MODIFIER_ROM_CAP_TRADE (COLLECTION_PLAYER_CAPITAL_CITY
--   + EFFECT_ADJUST_TRADE_ROUTE_YIELD_TO_OTHERS)
-- **************************************************************************

-- Food: specialty only +0.5 (unchanged)
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'ROM_TR_' || T || '_F', 'MODIFIER_ROM_CAP_TRADE', 'RS_ROM_' || T
FROM _RD WHERE S = 1;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'ROM_TR_' || T || '_F', 'YieldType', 'YIELD_FOOD' FROM _RD WHERE S = 1
UNION ALL
SELECT 'ROM_TR_' || T || '_F', 'Amount', '0.5' FROM _RD WHERE S = 1
UNION ALL
SELECT 'ROM_TR_' || T || '_F', 'Domestic', '1' FROM _RD WHERE S = 1;

-- Production: specialty only +0.5 (unchanged)
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'ROM_TR_' || T || '_P', 'MODIFIER_ROM_CAP_TRADE', 'RS_ROM_' || T
FROM _RD WHERE S = 1;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'ROM_TR_' || T || '_P', 'YieldType', 'YIELD_PRODUCTION' FROM _RD WHERE S = 1
UNION ALL
SELECT 'ROM_TR_' || T || '_P', 'Amount', '0.5' FROM _RD WHERE S = 1
UNION ALL
SELECT 'ROM_TR_' || T || '_P', 'Domestic', '1' FROM _RD WHERE S = 1;

-- Gold: specialty only +0.5 (v4: was ALL districts +1)
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
SELECT 'ROM_TR_' || T || '_G', 'MODIFIER_ROM_CAP_TRADE', 'RS_ROM_' || T
FROM _RD WHERE S = 1;

INSERT INTO ModifierArguments (ModifierId, Name, Value)
SELECT 'ROM_TR_' || T || '_G', 'YieldType', 'YIELD_GOLD' FROM _RD WHERE S = 1
UNION ALL
SELECT 'ROM_TR_' || T || '_G', 'Amount', '0.5' FROM _RD WHERE S = 1
UNION ALL
SELECT 'ROM_TR_' || T || '_G', 'Domestic', '1' FROM _RD WHERE S = 1;

-- Link trade modifiers to trait (all specialty only now)
INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_ROMULUS', 'ROM_TR_' || T || '_F' FROM _RD WHERE S = 1;

INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_ROMULUS', 'ROM_TR_' || T || '_P' FROM _RD WHERE S = 1;

INSERT INTO TraitModifiers (TraitType, ModifierId)
SELECT 'TRAIT_LEADER_ROMULUS', 'ROM_TR_' || T || '_G' FROM _RD WHERE S = 1;

-- **************************************************************************
-- AGENDA (PVE)
-- **************************************************************************
INSERT INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId)
VALUES	('AGENDA_ROM_LIKE',    'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER', 'PLAYER_HAS_HIGH_STANDING_ARMY'),
		('AGENDA_ROM_DISLIKE', 'MODIFIER_PLAYER_DIPLOMACY_SIMPLE_MODIFIER', 'PLAYER_HAS_LOW_STANDING_ARMY');

INSERT INTO ModifierArguments (ModifierId, Name, Value)
VALUES	('AGENDA_ROM_LIKE',    'InitialValue',              '6'),
		('AGENDA_ROM_LIKE',    'StatementKey',              'LOC_DIPLO_KUDO_LEADER_ROMULUS_REASON_ANY'),
		('AGENDA_ROM_LIKE',    'SimpleModifierDescription', 'LOC_DIPLO_MODIFIER_ROMULUS_LIKES_MILITARY'),
		('AGENDA_ROM_DISLIKE', 'InitialValue',              '-6'),
		('AGENDA_ROM_DISLIKE', 'StatementKey',              'LOC_DIPLO_WARNING_LEADER_ROMULUS_REASON_ANY'),
		('AGENDA_ROM_DISLIKE', 'SimpleModifierDescription', 'LOC_DIPLO_MODIFIER_ROMULUS_DISLIKES_WEAK');

INSERT INTO TraitModifiers (TraitType, ModifierId)
VALUES	('TRAIT_AGENDA_ROMULUS', 'AGENDA_ROM_LIKE'),
		('TRAIT_AGENDA_ROMULUS', 'AGENDA_ROM_DISLIKE');

-- **************************************************************************
-- AI HINTS (PVE)
-- **************************************************************************
INSERT INTO AiListTypes (ListType) VALUES ('RomWonders'), ('RomCivics'), ('RomTechs');

INSERT INTO AiLists (ListType, LeaderType, System)
VALUES	('RomWonders', 'TRAIT_LEADER_ROMULUS', 'Buildings'),
		('RomCivics',  'TRAIT_LEADER_ROMULUS', 'Civics'),
		('RomTechs',   'TRAIT_LEADER_ROMULUS', 'Technologies');

INSERT INTO AiFavoredItems (ListType, Item, Favored)
VALUES	('RomWonders', 'BUILDING_COLOSSEUM',       'true'),
		('RomWonders', 'BUILDING_GREAT_ZIMBABWE',  'true'),
		('RomCivics',  'CIVIC_FOREIGN_TRADE',      'true'),
		('RomCivics',  'CIVIC_MILITARY_TRADITION', 'true'),
		('RomCivics',  'CIVIC_DRAMA_POETRY',       'true'),
		('RomTechs',   'TECH_BRONZE_WORKING',      'true'),
		('RomTechs',   'TECH_IRON_WORKING',        'true'),
		('RomTechs',   'TECH_CONSTRUCTION',        'true');
