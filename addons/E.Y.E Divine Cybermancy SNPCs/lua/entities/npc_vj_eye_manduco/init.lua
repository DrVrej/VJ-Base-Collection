AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_eye/manduco.mdl"
ENT.StartHealth = 160
ENT.HullType = HULL_WIDE_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_METASTREUMONIC"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.Immune_Fire = true

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK2}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 45
ENT.MeleeAttackDamageDistance = 65

ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = ACT_RANGE_ATTACK1
ENT.RangeAttackProjectiles = "obj_eye_fireball"
ENT.RangeAttackMaxDistance = 700
ENT.RangeAttackMinDistance = 200
ENT.TimeUntilRangeAttackProjectileRelease = false
ENT.NextRangeAttackTime = 5

ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_FLINCH_PHYSICS
ENT.FlinchHitGroupMap = {
	{HitGroup = HITGROUP_HEAD, Animation = "vjges_gesture_flinch_head"},
	{HitGroup = HITGROUP_CHEST, Animation = "vjges_gesture_flinch_chest"},
	{HitGroup = HITGROUP_STOMACH, Animation = "vjges_gesture_flinch_stomach"},
	{HitGroup = HITGROUP_LEFTARM, Animation = "vjges_gesture_flinch_leftArm"},
	{HitGroup = HITGROUP_RIGHTARM, Animation = "vjges_gesture_flinch_righttArm"}, -- Note: Manduco's anim has a typo!
	{HitGroup = HITGROUP_LEFTLEG, Animation = "vjges_gesture_flinch_leftleg"},
	{HitGroup = HITGROUP_RIGHTLEG, Animation = "vjges_gesture_flinch_rightleg"}
}

ENT.SoundTbl_FootStep = {"vj_eye/manduco/walk1.wav", "vj_eye/manduco/walk2.wav", "vj_eye/manduco/walk3.wav", "vj_eye/manduco/walk4.wav"}
ENT.SoundTbl_Idle = {"vj_eye/manduco/idle.wav", "vj_eye/manduco/idle2.wav", "vj_eye/manduco/idle3.wav", "vj_eye/manduco/gurgle.wav"}
ENT.SoundTbl_Alert = {"vj_eye/manduco/alert1.wav", "vj_eye/manduco/alert2.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_eye/manduco/leap1.wav", "vj_eye/manduco/scream1.wav", "vj_eye/manduco/breathe.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_eye/swipe01.wav", "vj_eye/swipe02.wav", "vj_eye/swipe03.wav"}
ENT.SoundTbl_RangeAttack = "vj_base/ambience/fireball_throw.wav"
ENT.SoundTbl_Pain = {"vj_eye/manduco/pain1.wav", "vj_eye/manduco/pain2.wav"}
ENT.SoundTbl_Death = {"vj_eye/manduco/die1.wav", "vj_eye/manduco/die2.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(18, 18, 65), Vector(-18, -18, 0))
	self:SetSkin(math.random(0, 2))
end
---------------------------------------------------------------------------------------------------------------------------------------------
local getEventName = util.GetAnimEventNameByID
--
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	local eventName = getEventName(ev)
	if eventName == "AE_MANDUCO_ATTACK_LEFT" or eventName == "AE_MANDUCO_ATTACK_RIGHT" then
		self:ExecuteMeleeAttack()
	elseif eventName == "AE_MANDUCO_FIREBALL" then
		self:ExecuteRangeAttack()
	elseif eventName == "AE_MANDUCO_GALLOP_LEFT" or eventName == "AE_MANDUCO_GALLOP_RIGHT" then
		self:PlayFootstepSound()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("fireball")).Pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
	return VJ.CalculateTrajectory(self, self:GetEnemy(), "Curve", projectile:GetPos(), 1, 50)
end