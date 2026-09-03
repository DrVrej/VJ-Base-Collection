AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_BLACKMESA/houndeye.mdl"
ENT.StartHealth = 80
ENT.HullType = HULL_TINY
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_XEN"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.Immune_Sonic = true

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_RANGE_ATTACK1
ENT.MeleeAttackDistance = 164
ENT.MeleeAttackDamageDistance = 400
ENT.MeleeAttackDamageAngleRadius = 180
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 25
ENT.MeleeAttackDamageType = DMG_SONIC
ENT.MeleeAttackDSP = 34
ENT.MeleeAttackDSPLimit = false
ENT.DisableDefaultMeleeAttackDamageCode = true

ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationChance = 2
ENT.PropInteraction = false
ENT.FootstepSoundTimerRun = 0.3
ENT.FootstepSoundTimerWalk = 1

ENT.CanFlinch = "DamageTypes"
ENT.FlinchChance = 1
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH

ENT.SoundTbl_FootStep = {"vj_bms_houndeye/he_step1.wav", "vj_bms_houndeye/he_step2.wav", "vj_bms_houndeye/he_step3.wav"}
ENT.SoundTbl_Idle = {"vj_bms_houndeye/he_idle1.wav", "vj_bms_houndeye/he_idle2.wav", "vj_bms_houndeye/he_idle3.wav", "vj_bms_houndeye/he_idle4.wav", "vj_bms_houndeye/he_idle5.wav", "vj_bms_houndeye/he_idle6.wav", "vj_bms_houndeye/he_idle7.wav", "vj_bms_houndeye/he_idle8.wav", "vj_bms_houndeye/he_idle9.wav", "vj_bms_houndeye/he_idle10.wav"}
ENT.SoundTbl_Alert = {"vj_bms_houndeye/he_alert1.wav", "vj_bms_houndeye/he_alert2.wav", "vj_bms_houndeye/he_alert3.wav", "vj_bms_houndeye/he_alert4.wav", "vj_bms_houndeye/he_alert5.wav", "vj_bms_houndeye/he_alert6.wav", "vj_bms_houndeye/he_alert7.wav", "vj_bms_houndeye/he_alert8.wav", "vj_bms_houndeye/he_alert9.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_bms_houndeye/charge1.wav", "vj_bms_houndeye/charge2.wav", "vj_bms_houndeye/charge3.wav"}
//ENT.SoundTbl_MeleeAttack = {"vj_bms_houndeye/charge1.wav", "vj_bms_houndeye/charge2.wav", "vj_bms_houndeye/charge3.wav"}
ENT.SoundTbl_Pain = {"vj_bms_houndeye/pain1.wav", "vj_bms_houndeye/pain2.wav", "vj_bms_houndeye/pain3.wav"}
ENT.SoundTbl_Death = "vj_bms_houndeye/die1.wav"

local animAlert = {"vjseq_madidle", "vjseq_madidle3"} // ACT_IDLE_ANGRY - Don't use this because "madidle2"  looks weird

-- Custom
ENT.Houndeye_IdleAnims = ACT_IDLE
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(25, 25, 45), Vector(-25, -25, 0))
	self.Houndeye_IdleAnims = {ACT_IDLE, ACT_IDLE, ACT_IDLE, ACT_IDLE, ACT_IDLE, ACT_IDLE, VJ.SequenceToActivity(self, "leaderlook")}
end
---------------------------------------------------------------------------------------------------------------------------------------------
local getEventName = util.GetAnimEventNameByID
--
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	local eventName = getEventName(ev)
	if eventName == "AE_HOUND_RANGE_ATTACK1" then
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_IDLE && !IsValid(self:GetEnemy()) then
		return self:ResolveAnimation(self.Houndeye_IdleAnims)
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled then return end
	self:PlayAnim(animAlert, true, 1, true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "Init" then
		local myPos = self:GetPos()
		effects.BeamRingPoint(myPos, 0.3, 2, 400, 16, 0, Color(188, 220, 255), {material="sprites/vj_bms_shockwave", framerate=20})
		effects.BeamRingPoint(myPos, 0.3, 2, 200, 16, 0, Color(188, 220, 255), {material="sprites/vj_bms_shockwave", framerate=20})
		
		if self.HasSounds && self.HasMeleeAttackSounds then
			VJ.EmitSound(self, "vj_bms_houndeye/blast1.wav", 100, math.random(80, 100))
		end
		
		VJ.ApplyRadiusDamage(self, self, myPos, 400, 25, self.MeleeAttackDamageType, true, true, {DisableVisibilityCheck=true, Force=80})
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	-- Fix getting stuck in ground due to death anim
	if status == "DeathAnim" then
		local myPos = self:GetPos()
		self:SetLocalPos(Vector(myPos.x, myPos.y, myPos.z + 5))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorYellow = VJ.Color2Byte(Color(255, 221, 35))
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
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
	
	self:CreateGibEntity("prop_ragdoll", "models/gibs/houndeye/torso.mdl", {Pos=self:LocalToWorld(Vector(0, 0, -3)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-50, 50)+self:GetForward()*math.Rand(-50, 50)+self:GetUp()*math.Rand(30, 100)})
	self:CreateGibEntity("obj_vj_gib", "models/gibs/houndeye/right_leg_upper.mdl", {BloodType="Yellow", Pos=self:LocalToWorld(Vector(0, 0, -3)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(50, 50)+self:GetForward()*math.Rand(-50, 50)})
	self:CreateGibEntity("obj_vj_gib", "models/gibs/houndeye/right_leg_lower.mdl", {BloodType="Yellow", Pos=self:LocalToWorld(Vector(0, 0, -3)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(50, 50)+self:GetForward()*math.Rand(-50, 50)})
	self:CreateGibEntity("obj_vj_gib", "models/gibs/houndeye/left_leg.mdl", {BloodType="Yellow", Pos=self:LocalToWorld(Vector(0, 0, -3)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-50, -50)+self:GetForward()*math.Rand(-50, 50)})
	self:CreateGibEntity("obj_vj_gib", "models/gibs/houndeye/back_leg.mdl", {BloodType="Yellow", Pos=self:LocalToWorld(Vector(0, 0, -3)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-50, 50)+self:GetForward()*math.Rand(-50, -50)})
	return true
end