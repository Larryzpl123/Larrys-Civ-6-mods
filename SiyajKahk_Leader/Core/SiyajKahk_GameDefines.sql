-- ==========================================================================
-- SIYAJ K'AHK' (Fire is Born) - Alternate Leader for Maya
-- Leader Ability: Celestial Fire
--   1. Ranged units +1 Movement
--   2. Ranged units +3 Combat Strength
-- ==========================================================================

--==========================================================================================================================
-- TYPES
--==========================================================================================================================
INSERT INTO Types
		(Type,						Kind)
VALUES	('LEADER_SIYAJ_KAHK',		'KIND_LEADER'),
		('TRAIT_LEADER_SIYAJ_KAHK',	'KIND_TRAIT');

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
INSERT INTO Leaders
		(LeaderType,			Name,							InheritFrom,		SceneLayers)
VALUES	('LEADER_SIYAJ_KAHK',	'LOC_LEADER_SIYAJ_KAHK_NAME',	'LEADER_DEFAULT',	4);

--==========================================================================================================================
-- LEADER TRAITS
--==========================================================================================================================
INSERT INTO LeaderTraits
		(LeaderType,			TraitType)
VALUES	('LEADER_SIYAJ_KAHK',	'TRAIT_LEADER_SIYAJ_KAHK');

INSERT INTO Traits
		(TraitType,					Name,									Description)
VALUES	('TRAIT_LEADER_SIYAJ_KAHK',	'LOC_TRAIT_LEADER_SIYAJ_KAHK_NAME',	'LOC_TRAIT_LEADER_SIYAJ_KAHK_DESCRIPTION');

--==========================================================================================================================
-- CIVILIZATION LEADERS
--==========================================================================================================================
INSERT INTO CivilizationLeaders
		(CivilizationType,		LeaderType,				CapitalName)
VALUES	('CIVILIZATION_MAYA',	'LEADER_SIYAJ_KAHK',	'LOC_CITY_NAME_TIKAL_SIYAJ');

INSERT OR IGNORE INTO CityNames
		(CivilizationType,		CityName)
VALUES	('CIVILIZATION_MAYA',	'LOC_CITY_NAME_TIKAL_SIYAJ');

--==========================================================================================================================
-- AI AGENDA
--==========================================================================================================================
INSERT INTO HistoricalAgendas
		(LeaderType,			AgendaType)
VALUES	('LEADER_SIYAJ_KAHK',	'AGENDA_PARANOID');

--==========================================================================================================================
-- TRAIT MODIFIERS - grant both abilities
--==========================================================================================================================
INSERT INTO TraitModifiers
		(TraitType,					ModifierId)
VALUES	('TRAIT_LEADER_SIYAJ_KAHK',	'SIYAJ_GRANT_RANGED_MOVEMENT'),
		('TRAIT_LEADER_SIYAJ_KAHK',	'SIYAJ_GRANT_RANGED_STRENGTH');

-- Grant +1 Movement ability
INSERT INTO Modifiers
		(ModifierId,						ModifierType)
VALUES	('SIYAJ_GRANT_RANGED_MOVEMENT',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

INSERT INTO ModifierArguments
		(ModifierId,						Name,			Value)
VALUES	('SIYAJ_GRANT_RANGED_MOVEMENT',		'AbilityType',	'ABILITY_SIYAJ_RANGED_MOVEMENT');

-- Grant +3 Strength ability
INSERT INTO Modifiers
		(ModifierId,						ModifierType)
VALUES	('SIYAJ_GRANT_RANGED_STRENGTH',		'MODIFIER_PLAYER_UNITS_GRANT_ABILITY');

INSERT INTO ModifierArguments
		(ModifierId,						Name,			Value)
VALUES	('SIYAJ_GRANT_RANGED_STRENGTH',		'AbilityType',	'ABILITY_SIYAJ_RANGED_STRENGTH');

-- Ability effect: +1 Movement
INSERT INTO Modifiers
		(ModifierId,									ModifierType)
VALUES	('ABILITY_SIYAJ_RANGED_MOVEMENT_MODIFIER',		'MODIFIER_PLAYER_UNIT_ADJUST_MOVEMENT');

INSERT INTO ModifierArguments
		(ModifierId,									Name,		Value)
VALUES	('ABILITY_SIYAJ_RANGED_MOVEMENT_MODIFIER',		'Amount',	'1');

-- Ability effect: +3 Combat Strength
INSERT INTO Modifiers
		(ModifierId,									ModifierType)
VALUES	('ABILITY_SIYAJ_RANGED_STRENGTH_MODIFIER',		'MODIFIER_UNIT_ADJUST_COMBAT_STRENGTH');

INSERT INTO ModifierArguments
		(ModifierId,									Name,		Value)
VALUES	('ABILITY_SIYAJ_RANGED_STRENGTH_MODIFIER',		'Amount',	'3');
