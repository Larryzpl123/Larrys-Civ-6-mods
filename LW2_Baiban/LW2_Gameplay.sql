-- 自用卤味白板合集（二）- Gameplay
-- 原作: 机动战士高俅 (1132) | 改编: Larry

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW2_CC', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW2_CC', 'REQ_LW2_IS_CC');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW2_IS_CC', 'REQUIREMENT_DISTRICT_TYPE_MATCHES');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW2_IS_CC', 'DistrictType', 'DISTRICT_CITY_CENTER');

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW2_ENCAMP', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW2_ENCAMP', 'REQ_LW2_IS_ENCAMP');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW2_IS_ENCAMP', 'REQUIREMENT_DISTRICT_TYPE_MATCHES');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW2_IS_ENCAMP', 'DistrictType', 'DISTRICT_ENCAMPMENT');

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW2_CLASSICAL', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW2_CLASSICAL', 'REQ_LW2_CLASSICAL');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW2_CLASSICAL', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW2_CLASSICAL', 'CivicType', 'CIVIC_POLITICAL_PHILOSOPHY');

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW2_DRAMA', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW2_DRAMA', 'REQ_LW2_DRAMA');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW2_DRAMA', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW2_DRAMA', 'CivicType', 'CIVIC_DRAMA_AND_POETRY');

-- ===== SCIENCE =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW2_CC_1', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_CC_1', 'YieldType', 'YIELD_SCIENCE'), ('LW2_CC_1', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_SCIENCE', 'LW2_CC_1');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW2_PL_2', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_PL_2', 'YieldType', 'YIELD_SCIENCE'), ('LW2_PL_2', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_SCIENCE', 'LW2_PL_2');

-- ===== CULTURE =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW2_CC_3', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_CC_3', 'YieldType', 'YIELD_CULTURE'), ('LW2_CC_3', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_CULTURE', 'LW2_CC_3');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW2_PL_4', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW2_DRAMA');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_PL_4', 'YieldType', 'YIELD_CULTURE'), ('LW2_PL_4', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_CULTURE', 'LW2_PL_4');

-- ===== THEOLOGY =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW2_CC_5', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_CC_5', 'YieldType', 'YIELD_FAITH'), ('LW2_CC_5', 'Amount', '2');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_THEOLOGY', 'LW2_CC_5');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW2_PL_6', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_PL_6', 'YieldType', 'YIELD_FAITH'), ('LW2_PL_6', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_THEOLOGY', 'LW2_PL_6');

-- ===== AGRICULTURE =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW2_CC_7', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_CC_7', 'YieldType', 'YIELD_FOOD'), ('LW2_CC_7', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_AGRICULTURE', 'LW2_CC_7');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW2_HSG_8', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 'REQSET_LW2_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_HSG_8', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_AGRICULTURE', 'LW2_HSG_8');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW2_PL_9', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_PL_9', 'YieldType', 'YIELD_FOOD'), ('LW2_PL_9', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_AGRICULTURE', 'LW2_PL_9');

-- ===== INDUSTRY =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW2_CC_10', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_CC_10', 'YieldType', 'YIELD_PRODUCTION'), ('LW2_CC_10', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_INDUSTRY', 'LW2_CC_10');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW2_PL_11', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_PL_11', 'YieldType', 'YIELD_PRODUCTION'), ('LW2_PL_11', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_INDUSTRY', 'LW2_PL_11');

-- ===== COMMERCE =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW2_CC_12', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_CC_12', 'YieldType', 'YIELD_GOLD'), ('LW2_CC_12', 'Amount', '2');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_COMMERCE', 'LW2_CC_12');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW2_PL_13', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_PL_13', 'YieldType', 'YIELD_GOLD'), ('LW2_PL_13', 'Amount', '3');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_COMMERCE', 'LW2_PL_13');

-- ===== MILITARY =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW2_EC_14', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_ENCAMP', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_EC_14', 'YieldType', 'YIELD_FOOD'), ('LW2_EC_14', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_MILITARY', 'LW2_EC_14');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW2_EC_15', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_ENCAMP', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_EC_15', 'YieldType', 'YIELD_PRODUCTION'), ('LW2_EC_15', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_MILITARY', 'LW2_EC_15');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW2_EC_16', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_ENCAMP', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_EC_16', 'YieldType', 'YIELD_GOLD'), ('LW2_EC_16', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_MILITARY', 'LW2_EC_16');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW2_EC_17', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_ENCAMP', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_EC_17', 'YieldType', 'YIELD_SCIENCE'), ('LW2_EC_17', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_MILITARY', 'LW2_EC_17');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW2_EC_18', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_ENCAMP', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_EC_18', 'YieldType', 'YIELD_CULTURE'), ('LW2_EC_18', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_MILITARY', 'LW2_EC_18');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW2_EC_19', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW2_ENCAMP', 'REQSET_LW2_CLASSICAL');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW2_EC_19', 'YieldType', 'YIELD_FAITH'), ('LW2_EC_19', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW2_MILITARY', 'LW2_EC_19');
