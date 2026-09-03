AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.VJ_ID_Boss = true
ENT.Model = "models/VJ_FO/libertyprime.mdl"
ENT.StartHealth = 30000
ENT.HullType = HULL_LARGE
ENT.TurningSpeed = 10
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES_FRIENDLY", "CLASS_PLAYER_ALLY"}
ENT.AlliedWithPlayerAllies = true
ENT.BecomeEnemyToPlayer = 6
ENT.ConstantlyFaceEnemy = true
ENT.ConstantlyFaceEnemy_IfAttacking = true
ENT.ConstantlyFaceEnemy_Postures = "Standing"
ENT.ConstantlyFaceEnemy_MinDistance = 2000
ENT.LimitChaseDistance = "OnlyRange"
ENT.LimitChaseDistance_Max = 1500
ENT.LimitChaseDistance_Min = 50

ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 250
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDamageType = DMG_ALWAYSGIB
ENT.MeleeAttackDistance = 230
ENT.MeleeAttackDamageDistance = 240
ENT.TimeUntilMeleeAttackDamage = false
ENT.NextAnyAttackTime_Melee = 3.6
ENT.HasExtraMeleeAttackSounds = true

ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = false
ENT.NextRangeAttackTime = 0

ENT.Immune_Toxic = true
ENT.HasDeathCorpse = false
ENT.GibOnDeathFilter = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = "vjseq_brace"
ENT.DeathAnimationTime = 6

ENT.IdleSoundsWhileAttacking = true
ENT.DisableFootStepSoundTimer = true
ENT.HasImpactSounds = false
ENT.HasSoundTrack = true

ENT.SoundTbl_FootStep = {"vj_fo3_libertyprime/foot1.mp3", "vj_fo3_libertyprime/foot2.mp3"}
ENT.SoundTbl_Breath = "vj_fo3_libertyprime/idle_loop.wav"
ENT.SoundTbl_Idle = {"vj_fo3_libertyprime/attack1.mp3", "vj_fo3_libertyprime/attack3.mp3", "vj_fo3_libertyprime/attack4.mp3", "vj_fo3_libertyprime/attack5.mp3", "vj_fo3_libertyprime/attack7.mp3", "vj_fo3_libertyprime/attack9.mp3", "vj_fo3_libertyprime/attack10.mp3", "vj_fo3_libertyprime/attack11.mp3", "vj_fo3_libertyprime/attack14.mp3", "vj_fo3_libertyprime/attack15.mp3", "vj_fo3_libertyprime/attack16.mp3", "vj_fo3_libertyprime/attack18.mp3", "vj_fo3_libertyprime/attack19.mp3", "vj_fo3_libertyprime/attack20.mp3", "vj_fo3_libertyprime/attack23.mp3"}
ENT.SoundTbl_CombatIdle = {"vj_fo3_libertyprime/startup1.mp3", "vj_fo3_libertyprime/attack1.mp3", "vj_fo3_libertyprime/attack3.mp3", "vj_fo3_libertyprime/attack4.mp3", "vj_fo3_libertyprime/attack5.mp3", "vj_fo3_libertyprime/attack7.mp3", "vj_fo3_libertyprime/attack9.mp3", "vj_fo3_libertyprime/attack10.mp3", "vj_fo3_libertyprime/attack11.mp3", "vj_fo3_libertyprime/attack14.mp3", "vj_fo3_libertyprime/attack15.mp3", "vj_fo3_libertyprime/attack16.mp3", "vj_fo3_libertyprime/attack18.mp3", "vj_fo3_libertyprime/attack19.mp3", "vj_fo3_libertyprime/attack20.mp3", "vj_fo3_libertyprime/attack23.mp3", "vj_fo3_libertyprime/attack2.mp3", "vj_fo3_libertyprime/attack6.mp3", "vj_fo3_libertyprime/attack8.mp3", "vj_fo3_libertyprime/attack12.mp3", "vj_fo3_libertyprime/attack13.mp3", "vj_fo3_libertyprime/attack17.mp3", "vj_fo3_libertyprime/attack21.mp3", "vj_fo3_libertyprime/attack22.mp3"}
ENT.SoundTbl_MeleeAttackExtra = "VJ.Impact.Metal_Crush"
ENT.SoundTbl_MeleeAttackMiss = "vj_fo3_libertyprime/foot2.mp3"
ENT.SoundTbl_Death = "vj_fo3_libertyprime/die.mp3"
ENT.SoundTbl_SoundTrack = "vj_fo3_libertyprime/agenda_usa.mp3"

ENT.SoundTrackChance = 4

ENT.AlertSoundLevel = 110
ENT.IdleSoundLevel = 120
ENT.CombatIdleSoundLevel = 120
ENT.MeleeAttackSoundLevel = 110
ENT.ExtraMeleeAttackSoundLevel = 90
ENT.MeleeAttackMissSoundLevel = 110
ENT.PainSoundLevel = 110
ENT.DeathSoundLevel = 110
ENT.ImpactSoundLevel = 110
ENT.FootstepSoundLevel = 110
ENT.BeforeRangeAttackSoundLevel = 110
ENT.RangeAttackSoundLevel = 110
ENT.BreathSoundLevel = 70

ENT.MainSoundPitch = 100

ENT.NextSoundTime_Idle = VJ.SET(4, 8)

-- Custom
ENT.LibertyPrime_PlayedAlert = false
ENT.LibertyPrime_DoingNukeAttack = false
ENT.LibertyPrime_NextNukeAttackT = 0

local defVector = Vector(0, 0, 0)
local defAngle = Angle(0, 0, 0)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
	self:SetPhysicsDamageScale(0)
	table.insert(self.TimersToRemove, "timer_range_finished_libertylaser")
	table.insert(self.TimersToRemove, "timer_range_start_libertylaser")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(100, 100, 490), Vector(-100, -100, 0))
	PrintMessage(HUD_PRINTCENTER, "A Liberty Prime is now Online!")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply, controlEnt)
	ply:ChatPrint("MOUSE2 + JUMP: Throw Mininuke")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:LibertyPrime_DoFootstep(at)
	self:PlayFootstepSound()
	VJ.EmitSound(self, "vj_fo3_libertyprime/foot" .. math.random(1, 2) .. "_move.mp3", 100, 100)
	local attach = self:GetAttachment(self:LookupAttachment(at)).Pos
	util.ScreenShake(attach, 10, 100, 0.4, 7000)
	local dustEffect = EffectData()
	dustEffect:SetOrigin(attach)
	dustEffect:SetScale(1000)
	util.Effect("ThumperDust", dustEffect)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "event_lfoot" then
		self:LibertyPrime_DoFootstep("lfoot")
	elseif key == "event_rfoot" then
		self:LibertyPrime_DoFootstep("rfoot")
	elseif key == "event_mattack stomp" then
		self:ExecuteMeleeAttack()
	elseif key == "event_bodygroup 1 1" then
		self:SetBodygroup(1, 1)
		self:PlaySoundSystem("BeforeRangeAttack", "vj_fo3_libertyprime/range_equip.mp3")
	elseif key == "event_rattack range" then
		local anim, animDur = self:PlayAnim(ACT_RANGE_ATTACK1, "LetAttacks", false, true)
		self.AttackAnim = anim
		self.AttackAnimDuration = animDur
		self.AttackAnimTime = CurTime() + animDur
	elseif key == "event_bodygroup 1 0" then
		self:SetBodygroup(1, 0)
	elseif key == "event_rattack throw" then
		self:ExecuteRangeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	if self.AttackType != VJ.ATTACK_TYPE_RANGE then
		self:SetBodygroup(1, 0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if !self.LibertyPrime_PlayedAlert then
		self.LibertyPrime_AlertSound = VJ.CreateSound(self, "vj_fo3_libertyprime/alert.mp3", self.AlertSoundLevel, self:GetSoundPitch())
		self.NextIdleSoundT = CurTime() + 13
		self.LibertyPrime_PlayedAlert = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	if self.EnemyData.Distance > 600 && CurTime() > self.LibertyPrime_NextNukeAttackT && ((!self.VJ_IsBeingControlled) or (self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP))) then
		self.LibertyPrime_DoingNukeAttack = true
		self.RangeAttackProjectiles = "obj_fo3_libertymininuke"
		self.RangeAttackMaxDistance = 2700
		self.RangeAttackMinDistance = 600
		self.TimeUntilRangeAttackProjectileRelease = false
		self.NextAnyAttackTime_Range = 3.4667
		self.RangeAttackAnimationFaceEnemy = true
	else
		self.LibertyPrime_DoingNukeAttack = false
		self.RangeAttackMaxDistance = 6000
		self.RangeAttackMinDistance = 200
		self.TimeUntilRangeAttackProjectileRelease = 0.01
		self.NextAnyAttackTime_Range = 0.35
		self.RangeAttackAnimationFaceEnemy = false
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "Miss" then
		local attachPos = self:GetAttachment(self:LookupAttachment("rfoot")).Pos
		local dustEffect = EffectData()
		dustEffect:SetOrigin(attachPos)
		dustEffect:SetScale(1000)
		util.Effect("ThumperDust", dustEffect)
		util.ScreenShake(attachPos, 30, 100, 1, 5000)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttack(status, enemy)
	if status == "Init" then
		if self.LibertyPrime_DoingNukeAttack then
			local curTime = CurTime()
			local anim, animDur = self:PlayAnim(ACT_ARM, "LetAttacks", false, true)
			self.AttackAnim = anim
			self.AttackAnimDuration = animDur
			self.AttackAnimTime = curTime + animDur
			self.LibertyPrime_NextNukeAttackT = curTime + 20
		else
			self:RestartGesture(ACT_GESTURE_RANGE_ATTACK1)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
	if status == "Init" then
		if self.LibertyPrime_DoingNukeAttack then
			self:SetBodygroup(1, 0)
		else
			local attachPos = self:GetAttachment(self:LookupAttachment("eye")).Pos
			local tr = util.TraceLine({
				start = attachPos,
				endpos = enemy:GetPos() + enemy:OBBCenter(),
				filter = self,
			})
			local trPos = tr.HitPos
			VJ.EmitSound(self, "vj_fo3_libertyprime/laser.wav", 110, 100)
			util.ScreenShake(trPos, 100, 200, 0.4, 3000)
			util.ParticleTracerEx("Weapon_Combine_Ion_Cannon_Beam", attachPos, trPos, false, self:EntIndex(), 1)
			if enemy:IsOnGround() then
				ParticleEffect("vj_aurora_shockwave", trPos, defAngle)
			end
			ParticleEffect("Weapon_Combine_Ion_Cannon_Exlposion_c", trPos, defAngle)
			VJ.ApplyRadiusDamage(self, self, trPos, 80, 40, DMG_ENERGYBEAM, true, false, {Force=90})
			return true
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("bomb")).Pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
	return VJ.CalculateTrajectory(self, self:GetEnemy(), "Line", projectile:GetPos(), 1, 5000)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnBleed(dmginfo, hitgroup)
	local dmgPos = dmginfo:GetDamagePosition()
	if dmgPos == defVector then return end
	if math.random(1, 3) == 1 then
		local dmgSpark = ents.Create("env_spark")
		dmgSpark:SetKeyValue("Magnitude", "3")
		dmgSpark:SetKeyValue("Spark Trail Length", "3")
		dmgSpark:SetPos(dmgPos)
		dmgSpark:SetAngles(self:GetAngles())
		//dmgSpark:Fire("LightColor", "255 255 255")
		dmgSpark:SetParent(self)
		dmgSpark:Spawn()
		dmgSpark:Activate()
		dmgSpark:Fire("StartSpark", "", 0)
		dmgSpark:Fire("StopSpark", "", 0.001)
		self:DeleteOnRemove(dmgSpark)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local gibMdls = {"models/props_debris/metal_panelchunk01a.mdl", "models/props_debris/metal_panelchunk01b.mdl", "models/props_debris/metal_panelchunk01d.mdl", "models/props_debris/metal_panelchunk01e.mdl", "models/props_debris/metal_panelchunk01f.mdl", "models/props_debris/metal_panelchunk01g.mdl", "models/props_debris/metal_panelchunk02d.mdl", "models/props_debris/metal_panelchunk02e.mdl"}
local gibColor = Color(50, 50, 50)
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	if !self.DeathAnimationCodeRan then return false end
	VJ.STOPSOUND(self.CurrentDeathSound)
	for i = 0, self:GetBoneCount() -15 do
		self:CreateGibEntity("prop_physics", gibMdls, {Pos=self:GetBonePosition(i), Vel=self:GetForward()*math.Rand(-200, 200) + self:GetRight()*math.Rand(-200, 200) + self:GetUp()*math.Rand(350, 600)}, function(gib)
			gib:Ignite(math.Rand(20, 30), 0)
			gib:SetColor(gibColor)
		end)
	end
	return true, {AllowAnim = true, AllowSound = false}
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" then
		timer.Simple(0.5, function()
			if IsValid(self) then
				util.ScreenShake(self:GetPos(), 100, 200, 1, 3000)
				if self.HasGibOnDeathEffects then ParticleEffect("vj_explosion2", self:GetPos() + self:GetUp()*360 + self:GetRight() *-50, defAngle) end
				local effectdata = EffectData()
				effectdata:SetOrigin(self:GetPos() + self:GetUp()*360 + self:GetRight() *-50) -- the vector of were you want the effect to spawn
				util.Effect("Explosion", effectdata)
			end
		end)
		timer.Simple(2, function()
			if IsValid(self) then
				util.ScreenShake(self:GetPos(), 100, 200, 1, 3000)
				if self.HasGibOnDeathEffects then ParticleEffect("vj_explosion2", self:GetPos() + self:GetUp()*300, defAngle) end
				local effectdata = EffectData()
				effectdata:SetOrigin(self:GetPos() + self:GetUp()*460) -- the vector of were you want the effect to spawn
				util.Effect("Explosion", effectdata)
			end
		end)
		timer.Simple(3.5, function()
			if IsValid(self) then
				util.ScreenShake(self:GetPos(), 100, 200, 1, 3000)
				if self.HasGibOnDeathEffects then ParticleEffect("vj_explosion2", self:GetPos() + self:GetUp()*460, defAngle) end
				local effectdata = EffectData()
				effectdata:SetOrigin(self:GetPos() + self:GetUp()*460) -- the vector of were you want the effect to spawn
				util.Effect("Explosion", effectdata)
			end
		end)
		timer.Simple(5.05, function()
			if IsValid(self) then
				util.ScreenShake(self:GetPos(), 100, 200, 1, 3000)
				if self.HasGibOnDeathEffects then ParticleEffect("vj_explosion2", self:GetBonePosition(self:LookupBone("Bip01 R Clavicle")), defAngle) end
				local effectdata = EffectData()
				effectdata:SetOrigin(self:GetBonePosition(self:LookupBone("Bip01 R Clavicle"))) -- the vector of were you want the effect to spawn
				util.Effect("Explosion", effectdata)
			end
		end)
	elseif status == "Finish" then
		util.BlastDamage(self, self, self:GetPos() + self:GetUp()*360, 200, 40)
		util.BlastDamage(self, self, self:GetPos(), 400, 40)
		util.ScreenShake(self:GetPos(), 100, 200, 1, 3000)
		if self.HasGibOnDeathEffects then
			for i = 0, self:GetBoneCount() -62 do
				ParticleEffect("vj_explosion2", self:GetBonePosition(i), defAngle)
			end
			local pos = self:GetPos() + self:GetUp()*260
			local effectdata = EffectData()
			effectdata:SetOrigin(pos) -- the vector of were you want the effect to spawn
			util.Effect("Explosion", effectdata)
			ParticleEffect("mininuke_explosion_child_flash", pos, defAngle)
			ParticleEffect("mininuke_explosion_child_flash_mod", pos, defAngle)
			ParticleEffect("mininuke_explosion_child_shrapnel", pos, defAngle)
			ParticleEffect("mininuke_explosion_child_smoke", pos, defAngle)
			ParticleEffect("mininuke_explosion_child_sparks", pos, defAngle)
			ParticleEffect("mininuke_explosion_child_sparks2", pos, defAngle)
			ParticleEffect("mininuke_explosion_shrapnel_fire_child", pos, defAngle)
			ParticleEffect("mininuke_explosion_shrapnel_smoke_child", pos, defAngle)
		end
		self:GibOnDeath(DamageInfo(), hitgroup) -- Declare a new DamageInfo because by this time, it's NULL!
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	VJ.STOPSOUND(self.CurrentDeathSound)
	VJ.STOPSOUND(self.LibertyPrime_AlertSound)
end