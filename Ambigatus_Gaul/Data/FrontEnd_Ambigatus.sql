-- ==========================================================================
-- Ambigatus - Alternate Leader for Gaul
-- FrontEnd: Players + PlayerLeaders ONLY
-- ==========================================================================

INSERT INTO Players (Domain, CivilizationType, LeaderType, CivilizationName, CivilizationIcon, LeaderName, LeaderIcon, CivilizationAbilityName, CivilizationAbilityDescription, CivilizationAbilityIcon, LeaderAbilityName, LeaderAbilityDescription, LeaderAbilityIcon) VALUES
(
	'Players:Expansion2_Players',
	'CIVILIZATION_GAUL',
	'LEADER_AMBIGATUS',
	'LOC_CIVILIZATION_GAUL_NAME',
	'ICON_CIVILIZATION_GAUL',
	'LOC_LEADER_AMBIGATUS_NAME',
	'ICON_LEADER_AMBIGATUS',
	'LOC_TRAIT_CIVILIZATION_HALLSTATT_CULTURE_NAME',
	'LOC_TRAIT_CIVILIZATION_HALLSTATT_CULTURE_DESCRIPTION',
	'ICON_CIVILIZATION_GAUL',
	'LOC_TRAIT_LEADER_AMBIGATUS_NAME',
	'LOC_TRAIT_LEADER_AMBIGATUS_DESCRIPTION',
	'ICON_LEADER_AMBIGATUS'
),
(
	'Players:StandardPlayers',
	'CIVILIZATION_GAUL',
	'LEADER_AMBIGATUS',
	'LOC_CIVILIZATION_GAUL_NAME',
	'ICON_CIVILIZATION_GAUL',
	'LOC_LEADER_AMBIGATUS_NAME',
	'ICON_LEADER_AMBIGATUS',
	'LOC_TRAIT_CIVILIZATION_HALLSTATT_CULTURE_NAME',
	'LOC_TRAIT_CIVILIZATION_HALLSTATT_CULTURE_DESCRIPTION',
	'ICON_CIVILIZATION_GAUL',
	'LOC_TRAIT_LEADER_AMBIGATUS_NAME',
	'LOC_TRAIT_LEADER_AMBIGATUS_DESCRIPTION',
	'ICON_LEADER_AMBIGATUS'
);

INSERT OR REPLACE INTO PlayerLeaders (LeaderType, CivilizationType) VALUES
('LEADER_AMBIGATUS', 'CIVILIZATION_GAUL');
