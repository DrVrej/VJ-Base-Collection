AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_DARKMESSIAH/spider_queen.mdl"
ENT.StartHealth = 10000
ENT.HullType = HULL_LARGE
ENT.VJ_ID_Boss = true
ENT.EntitiesToNoCollide = {"npc_vj_dm_spider"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_DARK_MESSIAH"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.Immune_Toxic = true

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK2}
	-- Belly attack has 1 in 6 chance
ENT.MeleeAttackAnimationFaceEnemy = false
ENT.MeleeAttackDistance = 250
ENT.MeleeAttackDamageDistance = 350
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasMeleeAttackKnockBack = true

ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = ACT_RANGE_ATTACK1
ENT.RangeAttackProjectiles = "obj_vj_dm_gas"
ENT.RangeAttackMaxDistance = 9000
ENT.RangeAttackMinDistance = 800
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 4

ENT.CanFlinch = true
ENT.FlinchChance = 8
ENT.AnimTbl_Flinch = ACT_BIG_FLINCH
ENT.FlinchHitGroupMap = {
	{HitGroup={103}, Animation={ACT_SMALL_FLINCH}},
	{HitGroup={106}, Animation={ACT_FLINCH_LEFTLEG}},
	{HitGroup={107}, Animation={ACT_FLINCH_RIGHTLEG}}
}

ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true
ENT.HasSoundTrack = true

ENT.SoundTbl_FootStep = {"vj_darkmessiah/spiderqueen/hit1.wav", "vj_darkmessiah/spiderqueen/hit2.wav", "vj_darkmessiah/spiderqueen/hit3.wav"}
ENT.SoundTbl_Idle = {"vj_darkmessiah/spiderqueen/spidermonster_misc0.wav", "vj_darkmessiah/spiderqueen/spidermonster_misc1.wav", "vj_darkmessiah/spiderqueen/spidermonster_misc2.wav"}
ENT.SoundTbl_Alert = {"vj_darkmessiah/spiderqueen/spidermonster_entrance_end.wav", "vj_darkmessiah/spiderqueen/spidermonster_threat0.wav", "vj_darkmessiah/spiderqueen/spidermonster_threat1.wav", "vj_darkmessiah/spiderqueen/spidermonster_threat2.wav"}
ENT.SoundTbl_RangeAttack = {"vj_darkmessiah/spiderqueen/spidermonster_hail0.wav", "vj_darkmessiah/spiderqueen/spidermonster_hail1.wav", "vj_darkmessiah/spiderqueen/spidermonster_hail2.wav"}
ENT.SoundTbl_Pain = {"vj_darkmessiah/spiderqueen/spidermonster_ouch_strong0.wav", "vj_darkmessiah/spiderqueen/spidermonster_ouch_strong1.wav", "vj_darkmessiah/spiderqueen/spidermonster_ouch_strong2.wav", "vj_darkmessiah/spiderqueen/spidermonster_ouch0.wav", "vj_darkmessiah/spiderqueen/spidermonster_ouch1.wav", "vj_darkmessiah/spiderqueen/spidermonster_ouch2.wav"}
ENT.SoundTbl_Death = {"vj_darkmessiah/spiderqueen/spidermonster_dying0.wav", "vj_darkmessiah/spiderqueen/spidermonster_dying1.wav", "vj_darkmessiah/spiderqueen/spidermonster_dying2.wav"}
ENT.SoundTbl_SoundTrack = {"vj_darkmessiah/spiderqueen/Dark Messiah - Avatar of the Spider Goddess.wav"}

local sdOnMelee = {"vj_darkmessiah/spiderqueen/spidermonster_striking0.wav", "vj_darkmessiah/spiderqueen/spidermonster_striking1.wav", "vj_darkmessiah/spiderqueen/spidermonster_striking2.wav"}
local sdOnMeleeWind = {"vj_darkmessiah/spiderqueen/spidermonster_whoosh0.wav", "vj_darkmessiah/spiderqueen/spidermonster_whoosh1.wav", "vj_darkmessiah/spiderqueen/spidermonster_whoosh2.wav", "vj_darkmessiah/spiderqueen/spidermonster_whoosh3.wav", "vj_darkmessiah/spiderqueen/spidermonster_whoosh4.wav"}
local sdMeleeMissGround = {"vj_darkmessiah/spiderqueen/spidermonster_foothit0.wav", "vj_darkmessiah/spiderqueen/spidermonster_foothit1.wav", "vj_darkmessiah/spiderqueen/spidermonster_foothit2.wav", "vj_darkmessiah/spiderqueen/spidermonster_foothit3.wav"}
local sdSpawnBabies = {"vj_darkmessiah/spider/spider_victory0.wav", "vj_darkmessiah/spider/spider_victory1.wav"}

ENT.FootstepSoundLevel = 100
ENT.AlertSoundLevel = 100
ENT.IdleSoundLevel = 100
ENT.MeleeAttackSoundLevel = 100
ENT.RangeAttackSoundLevel = 100
ENT.MeleeAttackMissSoundLevel = 150
ENT.BeforeLeapAttackSoundLevel = 100
ENT.PainSoundLevel = 100
ENT.DeathSoundLevel = 100

-- Custom
ENT.SpiderQ_AllowSpawning = true
ENT.SpiderQ_NextBirthT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetPhysicsDamageScale(0)
	self:SetCollisionBounds(Vector(120, 120, 230), Vector(-120, -120, 0))
	self:SetSurroundingBounds(Vector(400, 400, 330), Vector(-400, -400, 0))
	self:SetStepHeight(200)
	self:CreateBoneFollowers()
	timer.Simple(0, function() if IsValid(self) then self:SetPos(self:GetPos() + self:GetUp()*90) end end) -- Fixes bone followers making it spawn underground
	if GetConVar("vj_dm_nobabyspawn"):GetInt() == 0 then self.SpiderQ_AllowSpawning = false end
	self.SpiderQ_NextBirthTime = GetConVar("vj_dm_nextbaby"):GetInt()
	self.SpiderQ_SpiderLimit = VJ.RoundToMultiple(GetConVar("vj_dm_babyspawnlimit"):GetInt(), 3)
	self.SpiderQ_BabySpidersTbl = {}
	PrintMessage(HUD_PRINTCENTER, "A Spider Queen Has Been Summoned!")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
	ply:ChatPrint("JUMP: Spawn Baby Spiders")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	//print(key)
	if key == "event_emit Foot" then
		self:PlayFootstepSound()
	elseif key == "event_mattack lefta" or key == "event_mattack leftb" or key == "event_mattack righta" or key == "event_mattack rightb" or key == "event_mattack leftc" or key == "event_mattack rightc" then
		self.MeleeAttackDamage = 85
		self.MeleeAttackDamageType = DMG_SLASH
		self.SoundTbl_MeleeAttackMiss = sdMeleeMissGround
		self:ExecuteMeleeAttack()
	elseif key == "event_mattack belly" then
		self.MeleeAttackDamage = 96
		self.MeleeAttackDamageType = DMG_POISON
		self.SoundTbl_MeleeAttackMiss = sdOnMeleeWind
		self:ExecuteMeleeAttack()
	elseif key == "event_rattack poisonstart" then
		self:ExecuteRangeAttack()
	elseif key == "event_play Striking" then
		self:PlaySoundSystem("BeforeMeleeAttack", sdOnMelee)
	elseif key == "event_emit Whoosh" then
		self:PlaySoundSystem("MeleeAttackMiss", sdOnMeleeWind)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
	util.ScreenShake(self:GetPos(), 10, 100, 0.4, 2000)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	if self.SpiderQ_AllowSpawning && IsValid(self:GetEnemy()) && CurTime() > self.SpiderQ_NextBirthT && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then
		local babyTbl = self.SpiderQ_BabySpidersTbl
		for k, v in pairs(babyTbl) do
			if !IsValid(v) then table.remove(babyTbl, k) continue end
		end
		babyTbl = self.SpiderQ_BabySpidersTbl
		if (#babyTbl % 3 == 0) && #babyTbl < self.SpiderQ_SpiderLimit then
			local myPos = self:GetPos()
			if self.VJ_IsBeingControlled then
				self.VJ_TheController:PrintMessage(HUD_PRINTCENTER, "Spawning Spiders! Cooldown: " .. self.SpiderQ_NextBirthTime .. " seconds!")
			end
			util.ScreenShake(myPos, 100, 200, 5, 3000)
			VJ.EmitSound(self, sdSpawnBabies, 100, math.random(80, 100))
			local effectDust = EffectData()
			effectDust:SetOrigin(myPos)
			effectDust:SetScale(1000)
			util.Effect("ThumperDust", effectDust)
			for i = 1, 3 do
				local baby = ents.Create("npc_vj_dm_spider")
				baby:SetPos(myPos + self:GetRight()*(i == 3 and -120 or (i == 2 and 120 or 1)))
				baby:SetAngles(self:GetAngles())
				baby.Spider_AlwaysBurrow = true
				baby:Spawn()
				baby:Activate()
				baby:SetOwner(self)
				self.SpiderQ_BabySpidersTbl[#self.SpiderQ_BabySpidersTbl + 1] = baby
			end
			self.SpiderQ_NextBirthT = CurTime() + self.SpiderQ_NextBirthTime
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled then return end
	self:PlayAnim(ACT_IDLE_ANGRY, true, false, true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward() * math.random(700, 730) + self:GetUp() * math.random(500, 530)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "Miss" && self:IsOnGround() && self:GetActivity() != ACT_MELEE_ATTACK2 then
		local spawnPos = self:GetPos() + self:GetForward()*200
		util.ScreenShake(spawnPos, 16, 100, 1, 2000)
		for _ = 1, 3 do
			local effectDust = EffectData()
			effectDust:SetOrigin(spawnPos)
			effectDust:SetScale(1000)
			util.Effect("ThumperDust", effectDust)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("mm_mouth")).Pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
	return VJ.CalculateTrajectory(self, self:GetEnemy(), "Curve", projectile:GetPos(), 1, 10)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local bAND = bit.band
--
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo, hitgroup, status)
	if status == "Init" then
		-- Can always flinch from DMB_BLAST or from any damage type as long as it does high damage
		if bAND(dmginfo:GetDamageType(), DMG_BLAST) != 0 or dmginfo:GetDamage() > 35 then
			return
		end
		return true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		PrintMessage(HUD_PRINTCENTER, "A Spider Queen Has Been Defeated!")
	elseif status == "DeathAnim" then
		util.ScreenShake(self:GetPos(), 100, 200, 5, 3000)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	if !self.Dead then
		for _, v in pairs(self.SpiderQ_BabySpidersTbl) do
			if IsValid(v) then
				v:Remove()
			end
		end
	end
end