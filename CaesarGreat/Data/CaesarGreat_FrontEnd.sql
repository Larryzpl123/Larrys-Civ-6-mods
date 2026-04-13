-- =============================================================================
-- Caesar the Great - FrontEnd Database
-- Based on working version: includes CivilizationAbilityIcon, Portrait, PortraitBackground
-- =============================================================================

INSERT INTO Players 
(CivilizationType, LeaderType, LeaderName, CivilizationName, 
 CivilizationIcon, LeaderIcon, 
 CivilizationAbilityName, CivilizationAbilityDescription, CivilizationAbilityIcon,
 LeaderAbilityName, LeaderAbilityDescription, LeaderAbilityIcon, 
 Portrait, PortraitBackground, Domain)
VALUES (
    'CIVILIZATION_ROME',
    'LEADER_CAESAR_GREAT',
    'LOC_LEADER_CAESAR_GREAT_NAME',
    'LOC_CIVILIZATION_ROME_NAME',
    'ICON_CIVILIZATION_ROME',
    'ICON_LEADER_CAESAR_GREAT',                  -- custom portrait icon
    'LOC_TRAIT_CIVILIZATION_ROME_NAME',
    'LOC_TRAIT_CIVILIZATION_ROME_DESCRIPTION',
    'ICON_CIVILIZATION_ROME',                    -- CivilizationAbilityIcon (NOT NULL)
    'LOC_TRAIT_LEADER_CAESAR_GREAT_NAME',
    'LOC_TRAIT_LEADER_CAESAR_GREAT_DESCRIPTION',
    'ICON_LEADER_CAESAR_GREAT',                  -- LeaderAbilityIcon (NOT NULL)
    'LEADER_JULIUS_CAESAR_NEUTRAL',              -- Portrait (reuse JC DLC)
    'LEADER_JULIUS_CAESAR_BACKGROUND',           -- PortraitBackground
    'Players:Expansion2_Players'
);
