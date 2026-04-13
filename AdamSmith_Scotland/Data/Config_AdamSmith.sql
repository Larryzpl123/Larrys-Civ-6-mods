--------------------------------------------------------------------------------------------------------------------------------------------------------------
-- 亚当·斯密 - Gameplay 配置（Gameplay数据库）
-- 注意：Agenda 不走 Types 系统！不要往 Types 里插 KIND_AGENDA！
--------------------------------------------------------------------------------------------------------------------------------------------------------------

-- ============================== Types ==============================
-- 只注册 Leader 和 Trait，不注册 Agenda（KIND_AGENDA 不存在于 Kinds 表）
INSERT OR REPLACE INTO Types (Type, Kind) VALUES
('LEADER_ADAM_SMITH',                          'KIND_LEADER'),
('TRAIT_LEADER_ADAM_SMITH_INVISIBLE_HAND',     'KIND_TRAIT');

-- ============================== Leaders ==============================
INSERT OR REPLACE INTO Leaders (LeaderType, Name, InheritFrom, SceneLayers) VALUES
('LEADER_ADAM_SMITH', 'LOC_LEADER_ADAM_SMITH_NAME', 'LEADER_DEFAULT', 4);

-- ============================== LeaderQuotes ==============================
INSERT OR REPLACE INTO LeaderQuotes (LeaderType, Quote) VALUES
('LEADER_ADAM_SMITH', 'LOC_LEADER_ADAM_SMITH_QUOTE');

-- ============================== Traits ==============================
INSERT OR REPLACE INTO Traits (TraitType, Name, Description) VALUES
('TRAIT_LEADER_ADAM_SMITH_INVISIBLE_HAND', 'LOC_TRAIT_LEADER_ADAM_SMITH_INVISIBLE_HAND_NAME', 'LOC_TRAIT_LEADER_ADAM_SMITH_INVISIBLE_HAND_DESCRIPTION');

-- ============================== LeaderTraits ==============================
INSERT OR REPLACE INTO LeaderTraits (LeaderType, TraitType) VALUES
('LEADER_ADAM_SMITH', 'TRAIT_LEADER_ADAM_SMITH_INVISIBLE_HAND');

-- ============================== CivilizationLeaders ==============================
INSERT OR REPLACE INTO CivilizationLeaders (CivilizationType, LeaderType, CapitalName) VALUES
('CIVILIZATION_SCOTLAND', 'LEADER_ADAM_SMITH', 'LOC_CITY_NAME_EDINBURGH');

-- ============================== Agendas ==============================
-- Agenda 直接插 Agendas 表，不需要 Types 注册
INSERT OR REPLACE INTO Agendas (AgendaType, Name, Description) VALUES
('AGENDA_ADAM_SMITH_FREE_MARKET', 'LOC_AGENDA_ADAM_SMITH_FREE_MARKET_NAME', 'LOC_AGENDA_ADAM_SMITH_FREE_MARKET_DESCRIPTION');

INSERT OR REPLACE INTO HistoricalAgendas (LeaderType, AgendaType) VALUES
('LEADER_ADAM_SMITH', 'AGENDA_ADAM_SMITH_FREE_MARKET');

-- ============================== Agenda AI Behavior ==============================
INSERT OR REPLACE INTO AiListTypes (ListType) VALUES
('AGENDA_ADAM_SMITH_FREE_MARKET_DIPLOMACY');

INSERT OR REPLACE INTO AiLists (ListType, AgendaType, System) VALUES
('AGENDA_ADAM_SMITH_FREE_MARKET_DIPLOMACY', 'AGENDA_ADAM_SMITH_FREE_MARKET', 'DiplomaticAction');

INSERT OR REPLACE INTO AiFavoredItems (ListType, Item, Favored, Value) VALUES
('AGENDA_ADAM_SMITH_FREE_MARKET_DIPLOMACY', 'DIPLOACTION_DECLARE_FRIENDSHIP', 1, 0),
('AGENDA_ADAM_SMITH_FREE_MARKET_DIPLOMACY', 'DIPLOACTION_OPEN_BORDERS', 1, 0),
('AGENDA_ADAM_SMITH_FREE_MARKET_DIPLOMACY', 'DIPLOACTION_ALLIANCE', 1, 0);

INSERT OR REPLACE INTO AiListTypes (ListType) VALUES
('AGENDA_ADAM_SMITH_FREE_MARKET_YIELDS');

INSERT OR REPLACE INTO AiLists (ListType, AgendaType, System) VALUES
('AGENDA_ADAM_SMITH_FREE_MARKET_YIELDS', 'AGENDA_ADAM_SMITH_FREE_MARKET', 'Yields');

INSERT OR REPLACE INTO AiFavoredItems (ListType, Item, Favored, Value) VALUES
('AGENDA_ADAM_SMITH_FREE_MARKET_YIELDS', 'YIELD_GOLD', 1, 25);
