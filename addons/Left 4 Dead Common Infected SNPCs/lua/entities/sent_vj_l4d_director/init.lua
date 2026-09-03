AddCSLuaFile("shared.lua")
include("shared.lua")

local table_insert = table.insert
local table_remove = table.remove

ENT.Infected = { -- A small note to people poking their heads into my code, if you want to add your own NPCs to the director, just use a OnEntitySpawned hook or whatever and insert your data into this table
	{class="npc_vj_l4d_com_male",chance=1},
	{class="npc_vj_l4d_com_female",chance=1},
	{class="npc_vj_l4d_com_f_nurse",chance=2},
	{class="npc_vj_l4d_com_m_hospital",chance=2},
	{class="npc_vj_l4d_com_m_airport",chance=5},
	{class="npc_vj_l4d_com_m_police",chance=4},
	{class="npc_vj_l4d_com_m_soldier",chance=8},
	{class="npc_vj_l4d_com_m_ceda",chance=15},
	{class="npc_vj_l4d_com_m_clown",chance=20},
	{class="npc_vj_l4d_com_m_mudmen",chance=20},
	{class="npc_vj_l4d_com_m_worker",chance=10},
	{class="npc_vj_l4d_com_m_riot",chance=15},
	{class="npc_vj_l4d_com_m_fallsur",chance=70},
	{class="npc_vj_l4d_com_m_jimmy",chance=100},
}

ENT.SpecialInfected = {
	{class="npc_vj_l4d_boomer",max=1},
	{class="npc_vj_l4d_hunter",max=2},
	{class="npc_vj_l4d_smoker",max=2},
	{class="npc_vj_l4d2_boomer",max=1},
	{class="npc_vj_l4d2_boomette",max=1},
	{class="npc_vj_l4d2_charger",max=1},
	{class="npc_vj_l4d2_hunter",max=2},
	{class="npc_vj_l4d2_jockey",max=1},
	{class="npc_vj_l4d2_smoker",max=2},
	{class="npc_vj_l4d2_spitter",max=1},
}

ENT.Germs = {
	"vj_l4d_com/music/mob/germl1a.wav",
	"vj_l4d_com/music/mob/germl1b.wav",
	"vj_l4d_com/music/mob/germl2a.wav",
	"vj_l4d_com/music/mob/germl2b.wav",
	"vj_l4d_com/music/mob/germm1a.wav",
	"vj_l4d_com/music/mob/germm1b.wav",
	"vj_l4d_com/music/mob/germm2a.wav",
	"vj_l4d_com/music/mob/germm2b.wav",
	"vj_l4d_com/music/mob/germs1a.wav",
	"vj_l4d_com/music/mob/germs1b.wav",
	"vj_l4d_com/music/mob/germs2a.wav",
	"vj_l4d_com/music/mob/germs2b.wav",
	"vj_l4d_com/music/mob/germx1a.wav",
	"vj_l4d_com/music/mob/germx1b.wav",
	"vj_l4d_com/music/mob/germx2a.wav",
	"vj_l4d_com/music/mob/germx2b.wav",
}

if SERVER then
	util.AddNetworkString("vj_l4d_directormusic")
	util.AddNetworkString("vj_l4d_directormusic_simple")
end

function ENT:Initialize()
	local i = 0
	for _, v in ipairs(ents.GetAll()) do
		if v:GetClass() == "sent_vj_l4d_director" then
			i = i + 1
			if i > 1 then PrintMessage(HUD_PRINTTALK, "Only one A.I. Director can be present in the map.") self.SkipOnRemove = true self:Remove() return end
		end
	end

	self.nodePositions = {}
	self.navAreas = {}
	
	for _,pos in pairs(VJ_L4D_NODEPOS) do
		if pos then table_insert(self.nodePositions,{Position = pos, Time = 0}) end
	end

	for _,nav in pairs(navmesh.GetAllNavAreas()) do
		if nav then table_insert(self.navAreas,nav) end
	end

	local count = #self.nodePositions +#self.navAreas
	if count <= 50 then
		local msg = "Low node/nav-area count detected! The AI Director may find it difficult to process with such low nodes/nav-areas...removing..."
		if count <= 0 then
			msg = "No nodes or nav-mesh detected! The AI Director relies on nodes/nav-areas for many things. Without any, the AI Director will not work! The AI Director will now remove itself..."
		end
		MsgN(msg)
		if IsValid(self:GetCreator()) then
			self:GetCreator():ChatPrint(msg)
		end
		SafeRemoveEntity(self)
		return
	end

	self:SetCollisionGroup(COLLISION_GROUP_NONE)
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_NONE)
	self:SetPos(Vector())
	self:SetNoDraw(true)
	self:DrawShadow(false)
	
	self.IsActivated = tobool(GetConVarNumber("vj_l4d_director_enabled"))
	self.CI_SpawnDistance = GetConVarNumber("vj_l4d_director_spawnmax")
	self.CI_SpawnDistanceClose = GetConVarNumber("vj_l4d_director_spawnmin")
	self.CI_MobChance = GetConVarNumber("vj_l4d_director_mobchance")
	self.CI_MobCooldownMin = GetConVarNumber("vj_l4d_director_mobcooldownmin")
	self.CI_MobCooldownMax = GetConVarNumber("vj_l4d_director_mobcooldownmax")
	self.CI_MaxInfected = GetConVarNumber("vj_l4d_director_maxci")
	self.CI_MaxMobSpawn = GetConVarNumber("vj_l4d_director_mobcount")
	self.tbl_SpawnedNPCs = {}
	self.tbl_NPCsWithEnemies = {}
	self.tbl_SpawnedSpecialInfected = {}
	self.tbl_SpawnedBossSpecialInfected = {}
	self.NextAICheckTime = CurTime() +5
	self.NextInfectedSpawnTime = CurTime() +1
	self.NextSpecialInfectedSpawnTime = CurTime() +math.random(4,20)
	self.NextBossSpecialInfectedSpawnTime = CurTime() +math.random(20,60)
	self.NextMobSpawnTime = CurTime() +math.Rand(self.CI_MobCooldownMin,self.CI_MobCooldownMax)
	self.DidStartMusic = false
	self.NextMusicSwitchT = CurTime() +1
	self.NextAISpecialCheckTime = CurTime() +5
	self.MobSpawnRate = 0.19
	self.MaxSpecialInfected = 4
	self.CanSpawnSpecialInfected = file.Exists("autorun/vj_l4d2_si_spawn.lua","LUA")

	for _,v in ipairs(player.GetAll()) do
		v:ChatPrint("The horde is active in this area. Be careful...")
		if GetConVarNumber("vj_l4d_director_music") == 1 then
			v:EmitSound("vj_l4d_com/music/contagion/l4d_rabies_0" .. math.random(1,9) .. ".wav",GetConVarNumber("vj_l4d_director_musicvolume"),100)
		end
	end
end

function ENT:CheckVisibility(pos,ent,mdl)
	local check = ents.Create("prop_vj_animatable")
	check:SetModel(mdl or "models/cpthazama/l4d1/common/common_patient_male01.mdl")
	check:SetPos(pos)
	check:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	check:Spawn()
	check:SetNoDraw(true)
	check:DrawShadow(false)
	self:DeleteOnRemove(check)
	timer.Simple(0,function()
		SafeRemoveEntity(check)
	end)

	return ent:Visible(check)
end

function ENT:FindCenterNavPoint(ent)
	for _, v in RandomPairs(self.navAreas) do
		local testPos = v:GetCenter()
		local dist = testPos:Distance(ent:GetPos())
		if dist <= self.CI_SpawnDistance && dist >= self.CI_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
			return testPos
		end
	end
	return false
end

function ENT:FindHiddenNavPoint(ent)
	for _, v in RandomPairs(self.navAreas) do
		local hidingSpots = v:GetHidingSpots()
		if !hidingSpots then continue end
		if #hidingSpots <= 0 then continue end
		local testPos = VJ.PICK(hidingSpots)
		local dist = testPos:Distance(ent:GetPos())
		if dist <= self.CI_SpawnDistance && dist >= self.CI_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
			return testPos
		end
	end
	return false
end

function ENT:FindRandomNavPoint(ent)
	for _, v in RandomPairs(self.navAreas) do
		local testPos = v:GetRandomPoint()
		local dist = testPos:Distance(ent:GetPos())
		if dist <= self.CI_SpawnDistance && dist >= self.CI_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
			return testPos
		end
	end
	return false
end

function ENT:GetClosestNavPosition(ent, getHidden)
	local pos = false
	local closestDist = 999999999
	for _, v in pairs(self.navAreas) do
		local hidingSpots = getHidden && v:GetHidingSpots() or true
		if !hidingSpots then continue end
		if istable(hidingSpots) && #hidingSpots <= 0 then continue end
		local testPos = getHidden && VJ.PICK(v:GetHidingSpots()) or v:GetRandomPoint()
		local dist = ent:GetPos():Distance(testPos)
		if dist < closestDist && (dist <= self.CI_SpawnDistance && dist >= self.CI_SpawnDistanceClose && !self:CheckVisibility(testPos,ent)) then
			closestDist = dist
			pos = testPos
		end
	end
	return pos
end

function ENT:GetClosestNodePosition(ent)
	local pos = false
	local closestDist = 999999999
	for i,v in pairs(self.nodePositions) do
		if !self:IsNodeUsable(i) then continue end
		local testPos = self:GetNodePosition(i)
		local dist = ent:GetPos():Distance(testPos)
		if dist < closestDist && (dist <= self.CI_SpawnDistance && dist >= self.CI_SpawnDistanceClose && !self:CheckVisibility(testPos,ent)) then
			closestDist = dist
			pos = testPos
		end
	end
	return pos
end

function ENT:FindRandomNodePosition(ent)
	for i,v in RandomPairs(self.nodePositions) do
		if !self:IsNodeUsable(i) then continue end
		local testPos = self:GetNodePosition(i)
		local dist = ent && testPos:Distance(ent:GetPos()) or 0
		if ent then
			return testPos
		else
			if dist <= self.CI_SpawnDistance && dist >= self.CI_SpawnDistanceClose && !self:CheckVisibility(testPos,ent) then
				return testPos
			end
		end
	end
	return false
end

function ENT:FindSpawnPosition(getClosest,findHidden)
	local nodes = self.nodePositions
	local navareas = self.navAreas
	local useNav = (#nodes <= 0 && #navareas > 0) or (#navareas > 0 && #nodes > 0 && math.random(1,2) == 1) or false
	local pos = false
	local testEnt = self:GetRandomSurvivor()
	if IsValid(testEnt) then
		if useNav then
			local getHidden = findHidden or math.random(1,3) == 1
			pos = getClosest && self:GetClosestNavPosition(testEnt,getHidden) or getHidden && self:FindHiddenNavPoint(testEnt) or self:FindRandomNavPoint(testEnt)
		else
			pos = getClosest && self:GetClosestNodePosition(testEnt) or self:FindRandomNodePosition(testEnt)
		end
	end
	return pos
end

function ENT:GetNodePosition(i)
	return self.nodePositions[i].Position
end

function ENT:IsNodeUsable(i)
	return self.nodePositions[i].Time < CurTime()
end

function ENT:FindSurvivors()
	local tbl = {}
	for _,v in pairs(ents.GetAll()) do
		if (v:IsPlayer() && !VJ_CVAR_IGNOREPLAYERS || v:IsNPC()) && v:Health() > 0 && !v:IsFlagSet(65536) && (v.VJ_NPC_Class && !VJ.HasValue(v.VJ_NPC_Class,"CLASS_ZOMBIE") or true) then
			table_insert(tbl,v)
		end
	end
	return tbl
end

function ENT:GetRandomSurvivor()
	return VJ.PICK(self:FindSurvivors())
end

function ENT:GetClosestSurvivor(pos)
	local ent = NULL
	local closestDist = 999999999
	for _, v in pairs(self:FindSurvivors()) do
		local dist = v:GetPos():Distance(pos)
		if dist < closestDist then
			closestDist = dist
			ent = v
		end
	end
	return ent
end

function ENT:CheckSurvivorDistance(ent, remove)
	remove = remove or true
	local closestDist = 999999999
	local visible = false
	for _, v in pairs(self:FindSurvivors()) do
		local dist = v:GetPos():Distance(ent:GetPos())
		if dist < closestDist then
			closestDist = dist
		end
		if v:Visible(ent) then
			visible = true -- Visible to someone, don't bother removing
		end
	end
	if closestDist >= GetConVarNumber("vj_l4d_director_spawnmax") +1000 && !visible && !remove then
		SafeRemoveEntity(ent)
	end
end

function ENT:Think()
	self.IsActivated = GetConVar("vj_l4d_director_enabled")
	if self.IsActivated then -- Ready for cancer kidos?
		-- Manage ConVar data
		self.CI_SpawnDistance = GetConVarNumber("vj_l4d_director_spawnmax")
		self.CI_SpawnDistanceClose = GetConVarNumber("vj_l4d_director_spawnmin")
		self.CI_MobChance = GetConVarNumber("vj_l4d_director_mobchance")
		self.CI_MobCooldownMin = GetConVarNumber("vj_l4d_director_mobcooldownmin")
		self.CI_MobCooldownMax = GetConVarNumber("vj_l4d_director_mobcooldownmax")
		self.CI_MaxInfected = GetConVarNumber("vj_l4d_director_maxci")
		self.CI_MaxMobSpawn = GetConVarNumber("vj_l4d_director_mobcount")
		self.AI_RefreshTime = GetConVarNumber("vj_l4d_director_refreshrate") -- Oof yeah, fuck me am I right?
		
		-- Checks for inactive AI, this code is quite bulky and might be able to be optimized better
		if CurTime() > self.NextAICheckTime then
			if #self.tbl_SpawnedNPCs > 0 then
				for i,v in ipairs(self.tbl_SpawnedNPCs) do
					if IsValid(v) then
						local enemy = v:GetEnemy()
						self:CheckSurvivorDistance(v)
						if IsValid(enemy) && !VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
							table_insert(self.tbl_NPCsWithEnemies,v)
						elseif !IsValid(enemy) then
							if VJ.HasValue(self.tbl_NPCsWithEnemies,v) then
								table_remove(self.tbl_NPCsWithEnemies,i)
							end
						end
					else
						table_remove(self.tbl_SpawnedNPCs,i)
					end
				end
			end
			if #self.tbl_SpawnedSpecialInfected > 0 then
				for i,v in ipairs(self.tbl_SpawnedSpecialInfected) do
					if IsValid(v) then
						if !IsValid(v:GetEnemy()) then
							v:SetPos(self:GetRandomSurvivor():GetPos() +Vector(0,0,1))
							v:SetGhost(true)
						end
					else
						table_remove(self.tbl_SpawnedSpecialInfected, i)
					end
				end
			end
			if #self.tbl_SpawnedBossSpecialInfected > 0 then
				for i,v in ipairs(self.tbl_SpawnedBossSpecialInfected) do
					if IsValid(v) then
						if !IsValid(v:GetEnemy()) then
							self:CheckSurvivorDistance(v)
						end
					else
						table_remove(self.tbl_SpawnedBossSpecialInfected, i)
					end
				end
			end
			self.NextAICheckTime = CurTime() +5
		end
	
		-- Manages Music
		local enemyTblCount = #self.tbl_NPCsWithEnemies
		if enemyTblCount > 0 then
			if enemyTblCount > self.CI_MaxInfected * 0.5 then
				self:DoMusic(false)
			else
				if self.DidStartMusic && CurTime() > self.NextMusicSwitchT then
					self:DoMusic(true)
				end
			end
		end

		-- Spawns AI
		if CurTime() > self.NextInfectedSpawnTime then
			if #self.tbl_SpawnedNPCs >= self.CI_MaxInfected -self.CI_MaxMobSpawn then return end -- Makes sure that we can at least spawn a mob when it's time
			self:SpawnInfected(self:PickInfected(self.Infected),self:FindSpawnPosition(false))
			self.NextInfectedSpawnTime = CurTime() +math.Rand(GetConVarNumber("vj_l4d_director_delaymin"),GetConVarNumber("vj_l4d_director_delaymax"))
		end

		if self.CanSpawnSpecialInfected then
			if CurTime() > self.NextSpecialInfectedSpawnTime then
				self:SpawnSpecialInfected(self:PickInfected(self.SpecialInfected),self:FindSpawnPosition(true))
				self.NextSpecialInfectedSpawnTime = CurTime() +math.Rand(4,20)
			end

			if CurTime() > self.NextBossSpecialInfectedSpawnTime then
				self:SpawnBossInfected(self:FindSpawnPosition(false,true))
				self.NextBossSpecialInfectedSpawnTime = CurTime() +math.Rand(40,160)
			end
		end

		-- Spawns Mobs
		if CurTime() > self.NextMobSpawnTime && math.random(1,self.CI_MobChance) == 1 then
			for i = 1,self.CI_MaxMobSpawn do
				timer.Simple(self.MobSpawnRate *i,function() -- Help with lag when spawning
					if IsValid(self) then
						self:SpawnInfected(self:PickInfected(self.Infected),self:FindSpawnPosition(true,true),true)
					end
				end)
			end
			local germ = VJ.PICK(self.Germs)
			for _,v in ipairs(player.GetAll()) do
				v:ChatPrint("The horde is heading your way!")
				if GetConVarNumber("vj_l4d_director_music") == 1 then
					v:EmitSound(germ,GetConVarNumber("vj_l4d_director_musicvolume"),100)
				end
			end
			self.NextMobSpawnTime = CurTime() +math.Rand(self.CI_MobCooldownMin,self.CI_MobCooldownMax)
		end
	end
end

function ENT:PlaySong(ply, snd, stop)
	snd = snd or ""
	if stop == 2 then
		net.Start("vj_l4d_directormusic_simple")
			net.WriteEntity(ply)
			net.WriteString(snd)
		net.Send(ply)
	else
		net.Start("vj_l4d_directormusic")
			net.WriteEntity(ply)
			net.WriteString(snd)
			net.WriteBool(stop)
		net.Send(ply)
	end
end

function ENT:DoMusic(stop)
	for _,v in ipairs(player.GetAll()) do
		if stop == false then
			self.DidStartMusic = true
			self.NextMusicSwitchT = CurTime() +4
			if GetConVarNumber("vj_l4d_director_music") == 1 then
				v.L4D_HordeSoundT = v.L4D_HordeSoundT or 0
				if CurTime() > v.L4D_HordeSoundT then
					v.L4D_HordeSong = math.random(1,2) == 1 && "vj_l4d_com/music/zombat/horde_0" .. math.random(1,4) .. ".wav" or "vj_l4d_com/music/zombat/slayer/hordeslayer_0" .. math.random(1,4) .. ".wav"
					self:PlaySong(v,v.L4D_HordeSong,false)
					v.L4D_HordeSoundT = CurTime() +SoundDuration(v.L4D_HordeSong)
				end
				if math.random(1,300) == 1 then
					self:PlaySong(v,"vj_l4d_com/music/zombat/danger/hordedanger_0" .. math.random(1,4) .. ".wav",2)
				end
			end
		else
			self.DidStartMusic = false
			self.NextMusicSwitchT = CurTime() +1
			self:PlaySong(v, nil, true)
		end
	end
end

function ENT:GetSpecialCount(class)
	local count = 0
	for _, v in pairs(self.tbl_SpawnedSpecialInfected) do
		if IsValid(v) && v:GetClass() == class then
			count = count +1
		end
	end
	return count
end

function ENT:PickInfected(tbl)
	local useMax = tbl == self.SpecialInfected
	local ent = false
	for _, v in RandomPairs(tbl) do
		if !useMax then
			if math.random(1, v.chance) == 1 then
				ent = v.class
				break
			end
		else
			if self:GetSpecialCount(v.class) < v.max then
				ent = v.class
				break
			end
		end
	end
	return ent
end

function ENT:SpawnInfected(ent, pos, isMob)
	if ent == false then return end
	if pos == nil or pos == false then return end
	if #self.tbl_SpawnedNPCs >= self.CI_MaxInfected then return end
	local infected = ents.Create(ent)
	infected:SetPos(pos)
	infected:SetAngles(Angle(0, math.random(0, 360), 0))
	infected:Spawn()
	table_insert(self.tbl_SpawnedNPCs, infected)
	if isMob then
		infected.SightAngle = 360
		infected.EnemyXRayDetection = true
		infected:DrawShadow(false)
		timer.Simple(0, function() if IsValid(infected) then infected:DrawShadow(false) end end)
	end

	infected.AI_Director = self
	infected.EntitiesToNoCollide = {}
	for _, v in pairs(self.Infected) do
		table_insert(infected.EntitiesToNoCollide, v.class)
	end

	for _, v in pairs(self.SpecialInfected) do
		table_insert(infected.EntitiesToNoCollide, v.class)
	end
end

function ENT:SpawnSpecialInfected(ent, pos)
	if ent == false then return end
	if pos == nil or pos == false then return end
	if #self.tbl_SpawnedSpecialInfected >= self.MaxSpecialInfected then return end
	local infected = ents.Create(ent)
	infected:SetPos(pos)
	infected:SetAngles(Angle(0, math.random(0, 360), 0))
	infected:Spawn()
	infected:SetGhost(true)
	infected.SightAngle = 360
	infected.EnemyXRayDetection = true
	table_insert(self.tbl_SpawnedSpecialInfected, infected)
	infected.AI_Director = self
	infected.EntitiesToNoCollide = {}
	for _, v in pairs(self.Infected) do
		table_insert(infected.EntitiesToNoCollide, v.class)
	end
end

function ENT:SpawnBossInfected(pos)
	if pos == nil or pos == false then return end
	if #self.tbl_SpawnedBossSpecialInfected >= 3 then return end
	local ent = "npc_vj_l4d2_witch"
	if math.random(1, 5) == 1 then ent = "npc_vj_l4d2_tank" end
	local infected = ents.Create(ent)
	infected:SetPos(pos)
	infected:SetAngles(Angle(0, math.random(0, 360), 0))
	infected:Spawn()
	table_insert(self.tbl_SpawnedBossSpecialInfected, infected)
	infected.AI_Director = self
	infected.EntitiesToNoCollide = {}
	for _, v in pairs(self.Infected) do
		table_insert(infected.EntitiesToNoCollide, v.class)
	end
end

function ENT:OnRemove()
	self:DoMusic(true)
	for _, object in ipairs(self.tbl_SpawnedNPCs) do
		if IsValid(object) then object:Remove() end
	end

	for _, object in ipairs(self.tbl_SpawnedSpecialInfected) do
		if IsValid(object) then object:Remove() end
	end

	for _, object in ipairs(self.tbl_SpawnedBossSpecialInfected) do
		if IsValid(object) then object:Remove() end
	end
end