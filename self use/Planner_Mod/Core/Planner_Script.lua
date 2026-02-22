-- ==========================================================================
-- THE PLANNER - Lua Script v3
-- Capital yield doubling (every 15 turns)
-- Building housing bonus (+2 per non-CC building/wonder)
-- Unit granting is now handled by XML (Hippodrome pattern)
-- ==========================================================================
print("Planner v3: Loading script...")

local CIV_TYPE = "CIVILIZATION_PLANNER"
local INTERVAL = 15
local MAX_TIER = 12

-- Modifier IDs for Lua attachment (defined in XML with
-- MODIFIER_PLAYER_CITIES_ADJUST_CITY_YIELD_CHANGE + RS_PL_IS_CAPITAL)
local CAP_LUA_MODS = {
	"PL_CAP_LUA_FOOD",
	"PL_CAP_LUA_PROD",
	"PL_CAP_LUA_GOLD",
	"PL_CAP_LUA_SCI",
	"PL_CAP_LUA_CUL",
	"PL_CAP_LUA_FAITH",
}

-- ==========================================
-- Check if player is Planner civilization
-- ==========================================
function IsPlanner(iPlayer)
	local cfg = PlayerConfigurations[iPlayer]
	if not cfg then return false end
	return cfg:GetCivilizationTypeName() == CIV_TYPE
end

-- ==========================================
-- Capital Yield Doubling
-- Turn 0:  +2 base from XML TraitModifiers
-- Turn 15: Lua attaches 2^0 = 1 copy  -> total +4
-- Turn 30: Lua attaches 2^1 = 2 copies -> total +8
-- Turn 45: Lua attaches 2^2 = 4 copies -> total +16
-- Turn N*15: total = 2 * 2^N = 2^(N+1)
-- ==========================================
function CapitalDoubling(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer or not pPlayer:IsAlive() then return end

	local turn = Game.GetCurrentGameTurn()
	local targetTier = math.min(math.floor(turn / INTERVAL), MAX_TIER)
	local currentTier = pPlayer:GetProperty("PL_CAP_TIER") or 0

	print("Planner: Turn " .. turn .. ", targetTier=" .. targetTier .. ", currentTier=" .. currentTier)

	if targetTier > currentTier then
		for tier = currentTier + 1, targetTier do
			local copies = math.floor(2 ^ (tier - 1))
			print("Planner: Tier " .. tier .. " attaching " .. copies .. " copies of each yield modifier")
			for c = 1, copies do
				for _, modID in ipairs(CAP_LUA_MODS) do
					local ok = pPlayer:AttachModifierByID(modID)
					print("Planner:   AttachModifierByID(" .. modID .. ") = " .. tostring(ok))
				end
			end
		end
		pPlayer:SetProperty("PL_CAP_TIER", targetTier)
		print("Planner: Updated tier to " .. targetTier .. ", expected total = +" .. (2 * math.floor(2 ^ targetTier)))
	end
end

-- ==========================================
-- Building Housing Bonus
-- +2 housing per non-CC building/wonder
-- (Food/Production/Gold handled by SQL)
-- ==========================================
function BuildingHousingBonus(iPlayer)
	local pPlayer = Players[iPlayer]
	if not pPlayer or not pPlayer:IsAlive() then return end
	local pCities = pPlayer:GetCities()
	if not pCities then return end

	local totalBuildings = 0
	for i, pCity in pCities:Members() do
		local pBldg = pCity:GetBuildings()
		if pBldg then
			for row in GameInfo.Buildings() do
				if pBldg:HasBuilding(row.Index) then
					if row.IsWonder or (row.PrereqDistrict ~= nil and row.PrereqDistrict ~= "DISTRICT_CITY_CENTER") then
						totalBuildings = totalBuildings + 1
					end
				end
			end
		end
	end

	local prevCount = pPlayer:GetProperty("PL_BLD_HOUSING_COUNT") or 0
	if totalBuildings > prevCount then
		for j = 1, totalBuildings - prevCount do
			pPlayer:AttachModifierByID("PL_BLD_HOUSING_LUA")
		end
		pPlayer:SetProperty("PL_BLD_HOUSING_COUNT", totalBuildings)
		print("Planner: +" .. ((totalBuildings - prevCount) * 2) .. " housing from new buildings (total: " .. totalBuildings .. ")")
	end
end

-- ==========================================
-- HOOKS
-- ==========================================
function OnTurnStarted(iPlayer)
	if not IsPlanner(iPlayer) then return end
	print("Planner: OnTurnStarted for player " .. iPlayer)
	CapitalDoubling(iPlayer)
	BuildingHousingBonus(iPlayer)
end

-- Register with BOTH event systems for maximum compatibility
if Events and Events.PlayerTurnStarted then
	Events.PlayerTurnStarted.Add(OnTurnStarted)
	print("Planner v3: Registered Events.PlayerTurnStarted")
end
if GameEvents and GameEvents.PlayerTurnStarted then
	GameEvents.PlayerTurnStarted.Add(OnTurnStarted)
	print("Planner v3: Registered GameEvents.PlayerTurnStarted")
end

print("Planner v3: Script loaded OK!")
