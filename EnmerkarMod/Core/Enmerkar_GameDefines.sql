--==========================================================================================================================
-- LEADERS
--==========================================================================================================================
INSERT INTO Types	
		(Type,									Kind)
VALUES	('LEADER_ENMERKAR',						'KIND_LEADER'),
		('TRAIT_LEADER_ENMERKAR_CUNEIFORM',		'KIND_TRAIT');

INSERT INTO Leaders	
		(LeaderType,			Name,							InheritFrom,		SceneLayers)
VALUES	('LEADER_ENMERKAR',		'LOC_LEADER_ENMERKAR_NAME',		'LEADER_DEFAULT',	4);

INSERT INTO LeaderQuotes	
		(LeaderType,			Quote)
VALUES	('LEADER_ENMERKAR',		'LOC_PEDIA_LEADERS_PAGE_LEADER_ENMERKAR_QUOTE');

INSERT INTO LeaderTraits	
		(LeaderType,			TraitType)
VALUES	('LEADER_ENMERKAR',		'TRAIT_LEADER_ENMERKAR_CUNEIFORM');

INSERT INTO Traits				
		(TraitType,								Name,											Description)
VALUES	('TRAIT_LEADER_ENMERKAR_CUNEIFORM',		'LOC_TRAIT_LEADER_ENMERKAR_CUNEIFORM_NAME',		'LOC_TRAIT_LEADER_ENMERKAR_CUNEIFORM_DESCRIPTION');

--==========================================================================================================================
-- TRAIT MODIFIERS
--==========================================================================================================================
INSERT INTO TraitModifiers	
		(TraitType,								ModifierId)
VALUES	('TRAIT_LEADER_ENMERKAR_CUNEIFORM',		'MODIFIER_ENMERKAR_MONUMENT_CULTURE'),
		('TRAIT_LEADER_ENMERKAR_CUNEIFORM',		'MODIFIER_ENMERKAR_ZIGGURAT_CULTURE'),
		('TRAIT_LEADER_ENMERKAR_CUNEIFORM',		'MODIFIER_ENMERKAR_ZIGGURAT_HOUSING');

--==========================================================================================================================
-- MODIFIERS
--==========================================================================================================================
-- Monument +1 Culture
INSERT INTO Modifiers
		(ModifierId,								ModifierType)
VALUES	('MODIFIER_ENMERKAR_MONUMENT_CULTURE',		'MODIFIER_PLAYER_CITIES_ADJUST_BUILDING_YIELD_CHANGE');

INSERT INTO ModifierArguments
		(ModifierId,								Name,				Value)
VALUES	('MODIFIER_ENMERKAR_MONUMENT_CULTURE',		'BuildingType',		'BUILDING_MONUMENT'),
		('MODIFIER_ENMERKAR_MONUMENT_CULTURE',		'YieldType',		'YIELD_CULTURE'),
		('MODIFIER_ENMERKAR_MONUMENT_CULTURE',		'Amount',			1);

-- Ziggurat +1 Culture (no civic requirement, just like Liyue mod)
INSERT INTO Modifiers
		(ModifierId,								ModifierType,						SubjectRequirementSetId)
VALUES	('MODIFIER_ENMERKAR_ZIGGURAT_CULTURE',		'MODIFIER_PLAYER_ADJUST_PLOT_YIELD',	'ENMERKAR_PLOT_HAS_ZIGGURAT');

INSERT INTO ModifierArguments
		(ModifierId,								Name,				Value)
VALUES	('MODIFIER_ENMERKAR_ZIGGURAT_CULTURE',		'YieldType',		'YIELD_CULTURE'),
		('MODIFIER_ENMERKAR_ZIGGURAT_CULTURE',		'Amount',			1);

-- Ziggurat +1 Housing (changed from 0.5 to 1)
INSERT INTO Modifiers
		(ModifierId,								ModifierType)
VALUES	('MODIFIER_ENMERKAR_ZIGGURAT_HOUSING',		'MODIFIER_PLAYER_ADJUST_EXTRA_HOUSING_PER_IMPROVEMENT');

INSERT INTO ModifierArguments
		(ModifierId,								Name,				Value)
VALUES	('MODIFIER_ENMERKAR_ZIGGURAT_HOUSING',		'ImprovementType',	'IMPROVEMENT_ZIGGURAT'),
		('MODIFIER_ENMERKAR_ZIGGURAT_HOUSING',		'Amount',			1);

--==========================================================================================================================
-- REQUIREMENTS
--==========================================================================================================================
INSERT INTO RequirementSets
		(RequirementSetId,							RequirementSetType)
VALUES	('ENMERKAR_PLOT_HAS_ZIGGURAT',				'REQUIREMENTSET_TEST_ALL');

INSERT INTO RequirementSetRequirements
		(RequirementSetId,							RequirementId)
VALUES	('ENMERKAR_PLOT_HAS_ZIGGURAT',				'ENMERKAR_REQ_PLOT_HAS_ZIGGURAT');

INSERT INTO Requirements
		(RequirementId,							RequirementType)
VALUES	('ENMERKAR_REQ_PLOT_HAS_ZIGGURAT',		'REQUIREMENT_PLOT_IMPROVEMENT_TYPE_MATCHES');

INSERT INTO RequirementArguments
		(RequirementId,							Name,				Value)
VALUES	('ENMERKAR_REQ_PLOT_HAS_ZIGGURAT',		'ImprovementType',	'IMPROVEMENT_ZIGGURAT');

--==========================================================================================================================
-- CIVILIZATIONS
--==========================================================================================================================
INSERT INTO CivilizationLeaders	
		(CivilizationType,			LeaderType,				CapitalName)
VALUES	('CIVILIZATION_SUMERIA',	'LEADER_ENMERKAR',		'LOC_CITY_NAME_URUK');
