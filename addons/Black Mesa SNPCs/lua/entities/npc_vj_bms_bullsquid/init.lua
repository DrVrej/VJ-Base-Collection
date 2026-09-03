AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_BLACKMESA/bullsquid.mdl"
ENT.StartHealth = 120
ENT.HullType = HULL_WIDE_SHORT
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_XEN"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.Immune_Toxic = true

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK2}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 75
ENT.MeleeAttackDamageDistance = 100
ENT.HasMeleeAttackKnockBack = true

ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = ACT_RANGE_ATTACK1
ENT.RangeAttackProjectiles = "obj_vj_bms_acidspit"
ENT.RangeAttackMaxDistance = 2000
ENT.RangeAttackMinDistance = 300
ENT.TimeUntilRangeAttackProjectileRelease = 0.6
ENT.NextRangeAttackTime = 1.2
ENT.RangeAttackExtraTimers = {0.65, 0.65, 0.7, 0.75, 0.8}

ENT.ConstantlyFaceEnemy = true
ENT.ConstantlyFaceEnemy_IfAttacking = true
ENT.ConstantlyFaceEnemy_Postures = "Standing"
ENT.ConstantlyFaceEnemy_MinDistance = 2000
ENT.LimitChaseDistance = "OnlyRange"
ENT.LimitChaseDistance_Max = "UseRangeDistance"
ENT.LimitChaseDistance_Min = "UseRangeDistance"
ENT.FootstepSoundTimerRun = 0.25
ENT.FootstepSoundTimerWalk = 0.6
ENT.HasExtraMeleeAttackSounds = true

ENT.SoundTbl_FootStep = {"vj_bms_bullsquid/step1.wav", "vj_bms_bullsquid/step2.wav"}
ENT.SoundTbl_Idle = {"vj_bms_bullsquid/Idle1.wav", "vj_bms_bullsquid/Idle2.wav", "vj_bms_bullsquid/Idle3.wav", "vj_bms_bullsquid/Idle4.wav"}
ENT.SoundTbl_Alert = {"vj_bms_bullsquid/detect1.wav", "vj_bms_bullsquid/detect2.wav", "vj_bms_bullsquid/detect3.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_bms_bullsquid/attack1.wav", "vj_bms_bullsquid/attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_bms_zombies/claw_miss1.wav", "vj_bms_zombies/claw_miss2.wav"}
ENT.SoundTbl_RangeAttack = {"vj_bms_bullsquid/goo_attack1.wav", "vj_bms_bullsquid/goo_attack2.wav", "vj_bms_bullsquid/goo_attack3.wav"}
ENT.SoundTbl_Pain = {"vj_bms_bullsquid/pain1.wav", "vj_bms_bullsquid/pain2.wav", "vj_bms_bullsquid/pain3.wav", "vj_bms_bullsquid/pain4.wav", "vj_bms_bullsquid/pain5.wav"}
ENT.SoundTbl_Death = {"vj_bms_bullsquid/die1.wav", "vj_bms_bullsquid/die2.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(45, 45 , 50), Vector(-45, -45, 0))
	self:SetSkin(1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local getEventName = util.GetAnimEventNameByID
--
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	local eventName = getEventName(ev)
	if eventName == "AE_SQUID_MELEE_ATTACK1" then -- Tail attack
		self.MeleeAttackDamageAngleRadius = 180 -- Because its eyes turn
		self.MeleeAttackDamage = 40
		self:ExecuteMeleeAttack()
	elseif eventName == "AE_SQUID_MELEE_ATTACK2" then
		self.MeleeAttackDamageAngleRadius = 100
		self.MeleeAttackDamage = 50
		self:ExecuteMeleeAttack()
	//elseif eventName == "AE_SQUID_RANGE_ATTACK1" then
		//self:ExecuteRangeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward()*55 + self:GetUp()*255
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("Mouth")).Pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
	return VJ.CalculateTrajectory(self, self:GetEnemy(), "Curve", projectile:GetPos() + VectorRand(-15, 15), 1, 50)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorYellow = VJ.Color2Byte(Color(255, 221, 35))
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	if GetConVarNumber("vj_bms_bullsquid_gib") == 0 then return false end -- Because sometimes it crashes!
	self.HasDeathSounds = false
	if self.HasGibOnDeathEffects then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetPos() + self:OBBCenter())
		effectData:SetColor(colorYellow)
		effectData:SetScale(120)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(8)
		effectData:SetFlags(3)
		effectData:SetColor(1)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
	end
	
	self:CreateGibEntity("prop_ragdoll", "models/gibs/bullsquid/torso.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-50, 50)+self:GetForward()*math.Rand(-50, 50)+self:GetUp()*math.Rand(30, 100)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/bullsquid/tail.mdl", {Pos=self:LocalToWorld(Vector(4, 0, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-50, 50)+self:GetForward()*math.Rand(-50, -50)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/bullsquid/right_leg.mdl", {Pos=self:LocalToWorld(Vector(0, 0.1, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(100, 100)+self:GetForward()*math.Rand(-50, 50)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/bullsquid/left_leg.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 0.1)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-100, -100)+self:GetForward()*math.Rand(-50, 50)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/bullsquid/head.mdl", {Pos=self:LocalToWorld(Vector(4, 0.1, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-50, 50)+self:GetForward()*math.Rand(50, 50)})
	return true
end