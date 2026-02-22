--==========================================================================================================================
-- OTTO VON BISMARCK (俾斯麦) - Alternate Leader for Germany
-- Leader Ability: "Iron and Blood" (铁血政策)
--   - City Center: +1 Production, +1 Gold
-- PvP mod - no AI agenda
--==========================================================================================================================

--==========================================================================================================================
-- TYPES
--==========================================================================================================================
INSERT INTO Types
		(Type,										Kind)
VALUES	('LEADER_BISMARCK',							'KIND_LEADER'),
		('TRAIT_LEADER_BISMARCK_ABILITY',			'KIND_TRAIT');

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
INSERT INTO Leaders
		(LeaderType,				Name,							InheritFrom)
VALUES	('LEADER_BISMARCK',			'LOC_LEADER_BISMARCK_NAME',		'LEADER_DEFAULT');

--==========================================================================================================================
-- LEADER TRAITS
--==========================================================================================================================
INSERT INTO Traits
		(TraitType,								Name,											Description)
VALUES	('TRAIT_LEADER_BISMARCK_ABILITY',		'LOC_TRAIT_LEADER_BISMARCK_ABILITY_NAME',		'LOC_TRAIT_LEADER_BISMARCK_ABILITY_DESCRIPTION');

INSERT INTO LeaderTraits
		(LeaderType,				TraitType)
VALUES	('LEADER_BISMARCK',			'TRAIT_LEADER_BISMARCK_ABILITY');

--==========================================================================================================================
-- LEADER -> CIVILIZATION
--==========================================================================================================================
INSERT INTO CivilizationLeaders
		(CivilizationType,			LeaderType,				CapitalName)
VALUES	('CIVILIZATION_GERMANY',	'LEADER_BISMARCK',		'LOC_CITY_NAME_BERLIN');

--==========================================================================================================================
-- MODIFIERS - City Center +1 Production, +1 Gold
-- Use MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE (per-city flat yield)
-- NOT MODIFIER_PLAYER_ADJUST_PLOT_YIELD which applies to ALL tiles
--==========================================================================================================================
INSERT INTO Modifiers
		(ModifierId,							ModifierType)
VALUES	('BISMARCK_CITY_CENTER_PRODUCTION',		'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE'),
		('BISMARCK_CITY_CENTER_GOLD',			'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE');

INSERT INTO ModifierArguments
		(ModifierId,							Name,			Value)
VALUES	('BISMARCK_CITY_CENTER_PRODUCTION',		'YieldType',	'YIELD_PRODUCTION'),
		('BISMARCK_CITY_CENTER_PRODUCTION',		'Amount',		'1'),
		('BISMARCK_CITY_CENTER_GOLD',			'YieldType',	'YIELD_GOLD'),
		('BISMARCK_CITY_CENTER_GOLD',			'Amount',		'1');

--==========================================================================================================================
-- TRAIT MODIFIERS
--==========================================================================================================================
INSERT INTO TraitModifiers
		(TraitType,								ModifierId)
VALUES	('TRAIT_LEADER_BISMARCK_ABILITY',		'BISMARCK_CITY_CENTER_PRODUCTION'),
		('TRAIT_LEADER_BISMARCK_ABILITY',		'BISMARCK_CITY_CENTER_GOLD');
