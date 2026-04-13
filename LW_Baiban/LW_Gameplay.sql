-- ============================================================
-- 自用卤味白板合集 - Gameplay
-- 原作: 机动战士高俅 (1132) | 改编: Larry
-- ============================================================

-- ==================== REQUIREMENT SETS ====================

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_CC', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_CC', 'REQ_LW_IS_CC');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_IS_CC', 'REQUIREMENT_DISTRICT_TYPE_MATCHES');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_IS_CC', 'DistrictType', 'DISTRICT_CITY_CENTER');

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_IMPROVED', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_IMPROVED', 'REQ_LW_HAS_IMP');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_HAS_IMP', 'REQUIREMENT_PLOT_HAS_ANY_IMPROVEMENT');

INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_WRITING', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_WRITING', 'REQ_LW_WRITING');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_WRITING', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_WRITING', 'TechnologyType', 'TECH_WRITING');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_EDUCATION', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_EDUCATION', 'REQ_LW_EDUCATION');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_EDUCATION', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_EDUCATION', 'TechnologyType', 'TECH_EDUCATION');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_CHEMISTRY', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_CHEMISTRY', 'REQ_LW_CHEMISTRY');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_CHEMISTRY', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_CHEMISTRY', 'TechnologyType', 'TECH_CHEMISTRY');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_POLITICAL_PHILOSOPHY', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_POLITICAL_PHILOSOPHY', 'REQ_LW_POLITICAL_PHILOSOPHY');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_POLITICAL_PHILOSOPHY', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_POLITICAL_PHILOSOPHY', 'CivicType', 'CIVIC_POLITICAL_PHILOSOPHY');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_DRAMA_AND_POETRY', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_DRAMA_AND_POETRY', 'REQ_LW_DRAMA_AND_POETRY');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_DRAMA_AND_POETRY', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_DRAMA_AND_POETRY', 'CivicType', 'CIVIC_DRAMA_AND_POETRY');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_HUMANISM', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_HUMANISM', 'REQ_LW_HUMANISM');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_HUMANISM', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_HUMANISM', 'CivicType', 'CIVIC_HUMANISM');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_MASS_MEDIA', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_MASS_MEDIA', 'REQ_LW_MASS_MEDIA');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_MASS_MEDIA', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_MASS_MEDIA', 'CivicType', 'CIVIC_MASS_MEDIA');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_MYSTICISM', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_MYSTICISM', 'REQ_LW_MYSTICISM');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_MYSTICISM', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_MYSTICISM', 'CivicType', 'CIVIC_MYSTICISM');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_THEOLOGY', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_THEOLOGY', 'REQ_LW_THEOLOGY');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_THEOLOGY', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_THEOLOGY', 'CivicType', 'CIVIC_THEOLOGY');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_REFORMED_CHURCH', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_REFORMED_CHURCH', 'REQ_LW_REFORMED_CHURCH');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_REFORMED_CHURCH', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_REFORMED_CHURCH', 'CivicType', 'CIVIC_REFORMED_CHURCH');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_POTTERY', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_POTTERY', 'REQ_LW_POTTERY');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_POTTERY', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_POTTERY', 'TechnologyType', 'TECH_POTTERY');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_IRRIGATION', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_IRRIGATION', 'REQ_LW_IRRIGATION');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_IRRIGATION', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_IRRIGATION', 'TechnologyType', 'TECH_IRRIGATION');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_CODE_OF_LAWS', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_CODE_OF_LAWS', 'REQ_LW_CODE_OF_LAWS');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_CODE_OF_LAWS', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_CODE_OF_LAWS', 'CivicType', 'CIVIC_CODE_OF_LAWS');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_FEUDALISM', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_FEUDALISM', 'REQ_LW_FEUDALISM');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_FEUDALISM', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_FEUDALISM', 'CivicType', 'CIVIC_FEUDALISM');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_REPLACEABLE_PARTS', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_REPLACEABLE_PARTS', 'REQ_LW_REPLACEABLE_PARTS');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_REPLACEABLE_PARTS', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_REPLACEABLE_PARTS', 'TechnologyType', 'TECH_REPLACEABLE_PARTS');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_CRAFTSMANSHIP', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_CRAFTSMANSHIP', 'REQ_LW_CRAFTSMANSHIP');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_CRAFTSMANSHIP', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_CRAFTSMANSHIP', 'CivicType', 'CIVIC_CRAFTSMANSHIP');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_ELECTRICITY', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_ELECTRICITY', 'REQ_LW_ELECTRICITY');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_ELECTRICITY', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_ELECTRICITY', 'TechnologyType', 'TECH_ELECTRICITY');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_APPRENTICESHIP', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_APPRENTICESHIP', 'REQ_LW_APPRENTICESHIP');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_APPRENTICESHIP', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_APPRENTICESHIP', 'TechnologyType', 'TECH_APPRENTICESHIP');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_INDUSTRIALIZATION', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_INDUSTRIALIZATION', 'REQ_LW_INDUSTRIALIZATION');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_INDUSTRIALIZATION', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_INDUSTRIALIZATION', 'TechnologyType', 'TECH_INDUSTRIALIZATION');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_NUCLEAR_FISSION', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_NUCLEAR_FISSION', 'REQ_LW_NUCLEAR_FISSION');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_NUCLEAR_FISSION', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_NUCLEAR_FISSION', 'TechnologyType', 'TECH_NUCLEAR_FISSION');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_CURRENCY', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_CURRENCY', 'REQ_LW_CURRENCY');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_CURRENCY', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_CURRENCY', 'TechnologyType', 'TECH_CURRENCY');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_BANKING', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_BANKING', 'REQ_LW_BANKING');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_BANKING', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_BANKING', 'TechnologyType', 'TECH_BANKING');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_FOREIGN_TRADE', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_FOREIGN_TRADE', 'REQ_LW_FOREIGN_TRADE');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_FOREIGN_TRADE', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_FOREIGN_TRADE', 'CivicType', 'CIVIC_FOREIGN_TRADE');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_MERCANTILISM', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_MERCANTILISM', 'REQ_LW_MERCANTILISM');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_MERCANTILISM', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_MERCANTILISM', 'CivicType', 'CIVIC_MERCANTILISM');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_CAPITALISM', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_CAPITALISM', 'REQ_LW_CAPITALISM');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_CAPITALISM', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_CAPITALISM', 'CivicType', 'CIVIC_CAPITALISM');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_MILITARY_TRADITION', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_MILITARY_TRADITION', 'REQ_LW_MILITARY_TRADITION');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_MILITARY_TRADITION', 'REQUIREMENT_PLAYER_HAS_CIVIC');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_MILITARY_TRADITION', 'CivicType', 'CIVIC_MILITARY_TRADITION');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_BRONZE_WORKING', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_BRONZE_WORKING', 'REQ_LW_BRONZE_WORKING');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_BRONZE_WORKING', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_BRONZE_WORKING', 'TechnologyType', 'TECH_BRONZE_WORKING');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_IRON_WORKING', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_IRON_WORKING', 'REQ_LW_IRON_WORKING');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_IRON_WORKING', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_IRON_WORKING', 'TechnologyType', 'TECH_IRON_WORKING');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_MILITARY_ENGINEERING', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_MILITARY_ENGINEERING', 'REQ_LW_MILITARY_ENGINEERING');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_MILITARY_ENGINEERING', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_MILITARY_ENGINEERING', 'TechnologyType', 'TECH_MILITARY_ENGINEERING');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_TACTICS', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_TACTICS', 'REQ_LW_TACTICS');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_TACTICS', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_TACTICS', 'TechnologyType', 'TECH_TACTICS');
INSERT OR IGNORE INTO RequirementSets (RequirementSetId, RequirementSetType) VALUES ('REQSET_LW_MILITARY_SCIENCE', 'REQUIREMENTSET_TEST_ALL');
INSERT OR IGNORE INTO RequirementSetRequirements (RequirementSetId, RequirementId) VALUES ('REQSET_LW_MILITARY_SCIENCE', 'REQ_LW_MILITARY_SCIENCE');
INSERT OR IGNORE INTO Requirements (RequirementId, RequirementType) VALUES ('REQ_LW_MILITARY_SCIENCE', 'REQUIREMENT_PLAYER_HAS_TECHNOLOGY');
INSERT OR IGNORE INTO RequirementArguments (RequirementId, Name, Value) VALUES ('REQ_LW_MILITARY_SCIENCE', 'TechnologyType', 'TECH_MILITARY_SCIENCE');

-- ==================== MODIFIERS ====================

-- ===== SCIENCE =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW_CC_1', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_1', 'YieldType', 'YIELD_SCIENCE'), ('LW_CC_1', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_SCIENCE', 'LW_CC_1');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_2', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_WRITING');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_2', 'YieldType', 'YIELD_SCIENCE'), ('LW_IMP_2', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_SCIENCE', 'LW_IMP_2');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_3', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_EDUCATION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_3', 'YieldType', 'YIELD_SCIENCE'), ('LW_IMP_3', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_SCIENCE', 'LW_IMP_3');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_4', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_CHEMISTRY');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_4', 'YieldType', 'YIELD_SCIENCE'), ('LW_IMP_4', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_SCIENCE', 'LW_IMP_4');

-- ===== CULTURE =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW_CC_5', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_5', 'YieldType', 'YIELD_CULTURE'), ('LW_CC_5', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_CULTURE', 'LW_CC_5');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_CC_6', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC', 'REQSET_LW_POLITICAL_PHILOSOPHY');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_6', 'YieldType', 'YIELD_CULTURE'), ('LW_CC_6', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_CULTURE', 'LW_CC_6');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_7', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_DRAMA_AND_POETRY');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_7', 'YieldType', 'YIELD_CULTURE'), ('LW_IMP_7', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_CULTURE', 'LW_IMP_7');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_8', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_HUMANISM');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_8', 'YieldType', 'YIELD_CULTURE'), ('LW_IMP_8', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_CULTURE', 'LW_IMP_8');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_9', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_MASS_MEDIA');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_9', 'YieldType', 'YIELD_CULTURE'), ('LW_IMP_9', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_CULTURE', 'LW_IMP_9');

-- ===== THEOLOGY =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW_CC_10', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_10', 'YieldType', 'YIELD_FAITH'), ('LW_CC_10', 'Amount', '2');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_THEOLOGY', 'LW_CC_10');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_11', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_MYSTICISM');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_11', 'YieldType', 'YIELD_FAITH'), ('LW_IMP_11', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_THEOLOGY', 'LW_IMP_11');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_12', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_THEOLOGY');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_12', 'YieldType', 'YIELD_FAITH'), ('LW_IMP_12', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_THEOLOGY', 'LW_IMP_12');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_13', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_REFORMED_CHURCH');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_13', 'YieldType', 'YIELD_FAITH'), ('LW_IMP_13', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_THEOLOGY', 'LW_IMP_13');

-- ===== AGRICULTURE =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW_CC_14', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_14', 'YieldType', 'YIELD_FOOD'), ('LW_CC_14', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_AGRICULTURE', 'LW_CC_14');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW_HSG_15', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_HOUSING', 'REQSET_LW_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_HSG_15', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_AGRICULTURE', 'LW_HSG_15');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_CC_16', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC', 'REQSET_LW_POTTERY');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_16', 'YieldType', 'YIELD_FOOD'), ('LW_CC_16', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_AGRICULTURE', 'LW_CC_16');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_CC_17', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC', 'REQSET_LW_IRRIGATION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_17', 'YieldType', 'YIELD_FOOD'), ('LW_CC_17', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_AGRICULTURE', 'LW_CC_17');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_18', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_CODE_OF_LAWS');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_18', 'YieldType', 'YIELD_FOOD'), ('LW_IMP_18', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_AGRICULTURE', 'LW_IMP_18');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_19', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_FEUDALISM');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_19', 'YieldType', 'YIELD_FOOD'), ('LW_IMP_19', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_AGRICULTURE', 'LW_IMP_19');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_20', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_REPLACEABLE_PARTS');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_20', 'YieldType', 'YIELD_FOOD'), ('LW_IMP_20', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_AGRICULTURE', 'LW_IMP_20');

-- ===== INDUSTRY =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW_CC_21', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_21', 'YieldType', 'YIELD_PRODUCTION'), ('LW_CC_21', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_INDUSTRY', 'LW_CC_21');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_CC_22', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC', 'REQSET_LW_CRAFTSMANSHIP');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_22', 'YieldType', 'YIELD_PRODUCTION'), ('LW_CC_22', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_INDUSTRY', 'LW_CC_22');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_CC_23', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC', 'REQSET_LW_ELECTRICITY');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_23', 'YieldType', 'YIELD_PRODUCTION'), ('LW_CC_23', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_INDUSTRY', 'LW_CC_23');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_24', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_APPRENTICESHIP');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_24', 'YieldType', 'YIELD_PRODUCTION'), ('LW_IMP_24', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_INDUSTRY', 'LW_IMP_24');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_25', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_INDUSTRIALIZATION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_25', 'YieldType', 'YIELD_PRODUCTION'), ('LW_IMP_25', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_INDUSTRY', 'LW_IMP_25');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_26', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_NUCLEAR_FISSION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_26', 'YieldType', 'YIELD_PRODUCTION'), ('LW_IMP_26', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_INDUSTRY', 'LW_IMP_26');

-- ===== COMMERCE =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW_CC_27', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_27', 'YieldType', 'YIELD_GOLD'), ('LW_CC_27', 'Amount', '2');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_COMMERCE', 'LW_CC_27');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_CC_28', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC', 'REQSET_LW_CURRENCY');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_28', 'YieldType', 'YIELD_GOLD'), ('LW_CC_28', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_COMMERCE', 'LW_CC_28');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_CC_29', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC', 'REQSET_LW_BANKING');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_29', 'YieldType', 'YIELD_GOLD'), ('LW_CC_29', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_COMMERCE', 'LW_CC_29');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_30', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_FOREIGN_TRADE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_30', 'YieldType', 'YIELD_GOLD'), ('LW_IMP_30', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_COMMERCE', 'LW_IMP_30');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_31', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_MERCANTILISM');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_31', 'YieldType', 'YIELD_GOLD'), ('LW_IMP_31', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_COMMERCE', 'LW_IMP_31');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId, OwnerRequirementSetId) VALUES ('LW_IMP_32', 'MODIFIER_PLAYER_ADJUST_PLOT_YIELD', 'REQSET_LW_IMPROVED', 'REQSET_LW_CAPITALISM');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_IMP_32', 'YieldType', 'YIELD_GOLD'), ('LW_IMP_32', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_COMMERCE', 'LW_IMP_32');

-- ===== MILITARY =====
INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, SubjectRequirementSetId) VALUES ('LW_CC_33', 'MODIFIER_PLAYER_DISTRICTS_ADJUST_YIELD_CHANGE', 'REQSET_LW_CC');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CC_33', 'YieldType', 'YIELD_GOLD'), ('LW_CC_33', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_MILITARY', 'LW_CC_33');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW_CS_34', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'REQSET_LW_MILITARY_TRADITION');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CS_34', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_MILITARY', 'LW_CS_34');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW_CS_35', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'REQSET_LW_BRONZE_WORKING');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CS_35', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_MILITARY', 'LW_CS_35');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW_CS_36', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'REQSET_LW_IRON_WORKING');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CS_36', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_MILITARY', 'LW_CS_36');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW_CS_37', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'REQSET_LW_MILITARY_ENGINEERING');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CS_37', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_MILITARY', 'LW_CS_37');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW_CS_38', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'REQSET_LW_TACTICS');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CS_38', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_MILITARY', 'LW_CS_38');

INSERT OR IGNORE INTO Modifiers (ModifierId, ModifierType, OwnerRequirementSetId) VALUES ('LW_CS_39', 'MODIFIER_PLAYER_UNITS_ADJUST_COMBAT_STRENGTH', 'REQSET_LW_MILITARY_SCIENCE');
INSERT OR IGNORE INTO ModifierArguments (ModifierId, Name, Value) VALUES ('LW_CS_39', 'Amount', '1');
INSERT OR IGNORE INTO TraitModifiers (TraitType, ModifierId) VALUES ('TRAIT_LEADER_LW_MILITARY', 'LW_CS_39');
