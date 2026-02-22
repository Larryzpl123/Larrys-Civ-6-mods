--==========================================================================================================================
-- FOREST FISH (森林·鱼) V2 - Alternate Leader for Inca
-- Leader Ability: "Grain, Hammer, Gold" (粮锤金)
--   - Commercial Hub: +1 Production
--   - Industrial Zone: +2 Food
--   - City Center: +3 Gold (flat per-city)
-- PvP mod - no AI agenda
--==========================================================================================================================

--==========================================================================================================================
-- TYPES
--==========================================================================================================================
INSERT INTO Types
		(Type,										Kind)
VALUES	('LEADER_FOREST_FISH',						'KIND_LEADER'),
		('TRAIT_LEADER_FOREST_FISH_ABILITY',		'KIND_TRAIT');

--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
INSERT INTO Leaders
		(LeaderType,				Name,								InheritFrom)
VALUES	('LEADER_FOREST_FISH',		'LOC_LEADER_FOREST_FISH_NAME',		'LEADER_DEFAULT');

--==========================================================================================================================
-- LEADER TRAITS
--==========================================================================================================================
INSERT INTO Traits
		(TraitType,									Name,													Description)
VALUES	('TRAIT_LEADER_FOREST_FISH_ABILITY',		'LOC_TRAIT_LEADER_FOREST_FISH_ABILITY_NAME',			'LOC_TRAIT_LEADER_FOREST_FISH_ABILITY_DESCRIPTION');

INSERT INTO LeaderTraits
		(LeaderType,				TraitType)
VALUES	('LEADER_FOREST_FISH',		'TRAIT_LEADER_FOREST_FISH_ABILITY');

--==========================================================================================================================
-- LEADER -> CIVILIZATION
--==========================================================================================================================
INSERT INTO CivilizationLeaders
		(CivilizationType,			LeaderType,				CapitalName)
VALUES	('CIVILIZATION_INCA',		'LEADER_FOREST_FISH',	'Cusco');

--==========================================================================================================================
-- MODIFIERS
-- Commercial Hub +1 Production: MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE
-- Industrial Zone +2 Food: MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE
-- City Center +3 Gold: MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE
--==========================================================================================================================

-- Commercial Hub +1 Production
INSERT INTO Modifiers
		(ModifierId,								ModifierType,												SubjectRequirementSetId)
VALUES	('FF2_COMMERCIAL_PRODUCTION',				'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',			'REQSET_FF2_IS_COMMERCIAL');

INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
VALUES	('FF2_COMMERCIAL_PRODUCTION',				'YieldType',	'YIELD_PRODUCTION'),
		('FF2_COMMERCIAL_PRODUCTION',				'Amount',		'1');

-- Industrial Zone +2 Food
INSERT INTO Modifiers
		(ModifierId,								ModifierType,												SubjectRequirementSetId)
VALUES	('FF2_INDUSTRIAL_FOOD',						'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE',			'REQSET_FF2_IS_INDUSTRIAL');

INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
VALUES	('FF2_INDUSTRIAL_FOOD',						'YieldType',	'YIELD_FOOD'),
		('FF2_INDUSTRIAL_FOOD',						'Amount',		'2');

-- City Center +3 Gold (flat per-city)
INSERT INTO Modifiers
		(ModifierId,								ModifierType)
VALUES	('FF2_CITY_CENTER_GOLD',					'MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE');

INSERT INTO ModifierArguments
		(ModifierId,								Name,			Value)
VALUES	('FF2_CITY_CENTER_GOLD',					'YieldType',	'YIELD_GOLD'),
		('FF2_CITY_CENTER_GOLD',					'Amount',		'3');

--==========================================================================================================================
-- REQUIREMENT SETS - District type checks
--==========================================================================================================================
INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
VALUES	('REQSET_FF2_IS_COMMERCIAL',				'REQUIREMENTSET_TEST_ALL'),
		('REQSET_FF2_IS_INDUSTRIAL',				'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES	('REQSET_FF2_IS_COMMERCIAL',				'REQ_FF2_IS_COMMERCIAL'),
		('REQSET_FF2_IS_INDUSTRIAL',				'REQ_FF2_IS_INDUSTRIAL');

INSERT INTO Requirements
		(RequirementId,								RequirementType)
VALUES	('REQ_FF2_IS_COMMERCIAL',					'REQUIREMENT_DISTRICT_TYPE_MATCHES'),
		('REQ_FF2_IS_INDUSTRIAL',					'REQUIREMENT_DISTRICT_TYPE_MATCHES');

INSERT INTO RequirementArguments
		(RequirementId,								Name,				Value)
VALUES	('REQ_FF2_IS_COMMERCIAL',					'DistrictType',		'DISTRICT_COMMERCIAL_HUB'),
		('REQ_FF2_IS_INDUSTRIAL',					'DistrictType',		'DISTRICT_INDUSTRIAL_ZONE');

--==========================================================================================================================
-- TRAIT MODIFIERS
--==========================================================================================================================
INSERT INTO TraitModifiers
		(TraitType,									ModifierId)
VALUES	('TRAIT_LEADER_FOREST_FISH_ABILITY',		'FF2_COMMERCIAL_PRODUCTION'),
		('TRAIT_LEADER_FOREST_FISH_ABILITY',		'FF2_INDUSTRIAL_FOOD'),
		('TRAIT_LEADER_FOREST_FISH_ABILITY',		'FF2_CITY_CENTER_GOLD');
