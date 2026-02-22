--==========================================================================================================================
-- FORESTFISH (森林鱼) V1 - Alternate Leader for Inca
-- Leader Ability: "Grain, Hammer, Gold" (粮锤金)
--   - All cities: +2 Production, +2 Food, +4 Gold (flat modifier)
-- PvP mod - no AI agenda
--==========================================================================================================================

--==========================================================================================================================
-- TYPES
--==========================================================================================================================
INSERT INTO Types
		(Type,										Kind)
VALUES	('LEADER_FORESTFISH',						'KIND_LEADER'),
		('TRAIT_LEADER_FORESTFISH_ABILITY',			'KIND_TRAIT');

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
INSERT INTO Leaders
		(LeaderType,				Name,								InheritFrom)
VALUES	('LEADER_FORESTFISH',		'LOC_LEADER_FORESTFISH_NAME',		'LEADER_DEFAULT');

--==========================================================================================================================
-- LEADER TRAITS
--==========================================================================================================================
INSERT INTO Traits
		(TraitType,								Name,												Description)
VALUES	('TRAIT_LEADER_FORESTFISH_ABILITY',		'LOC_TRAIT_LEADER_FORESTFISH_ABILITY_NAME',			'LOC_TRAIT_LEADER_FORESTFISH_ABILITY_DESCRIPTION');

INSERT INTO LeaderTraits
		(LeaderType,				TraitType)
VALUES	('LEADER_FORESTFISH',		'TRAIT_LEADER_FORESTFISH_ABILITY');

--==========================================================================================================================
-- LEADER -> CIVILIZATION
--==========================================================================================================================
INSERT INTO CivilizationLeaders
		(CivilizationType,			LeaderType,				CapitalName)
VALUES	('CIVILIZATION_INCA',		'LEADER_FORESTFISH',	'Cusco');

--==========================================================================================================================
-- MODIFIERS - All cities: +2 Production, +2 Food, +4 Gold
--==========================================================================================================================
INSERT INTO Modifiers
		(ModifierId,							ModifierType)
VALUES	('FF1_CITY_PRODUCTION',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE'),
		('FF1_CITY_FOOD',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE'),
		('FF1_CITY_GOLD',						'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE');

INSERT INTO ModifierArguments
		(ModifierId,							Name,			Value)
VALUES	('FF1_CITY_PRODUCTION',					'YieldType',	'YIELD_PRODUCTION'),
		('FF1_CITY_PRODUCTION',					'Amount',		'2'),
		('FF1_CITY_FOOD',						'YieldType',	'YIELD_FOOD'),
		('FF1_CITY_FOOD',						'Amount',		'2'),
		('FF1_CITY_GOLD',						'YieldType',	'YIELD_GOLD'),
		('FF1_CITY_GOLD',						'Amount',		'4');

--==========================================================================================================================
-- TRAIT MODIFIERS
--==========================================================================================================================
INSERT INTO TraitModifiers
		(TraitType,								ModifierId)
VALUES	('TRAIT_LEADER_FORESTFISH_ABILITY',		'FF1_CITY_PRODUCTION'),
		('TRAIT_LEADER_FORESTFISH_ABILITY',		'FF1_CITY_FOOD'),
		('TRAIT_LEADER_FORESTFISH_ABILITY',		'FF1_CITY_GOLD');
