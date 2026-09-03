AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_eye/forma.mdl"
ENT.StartHealth = 120
ENT.HullType = HULL_MEDIUM
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_METASTREUMONIC"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 45
ENT.MeleeAttackDamageDistance = 85
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 18
ENT.MeleeAttackBleedEnemy = true
ENT.MeleeAttackBleedEnemyChance = 1

ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = ACT_RANGE_ATTACK1
ENT.LeapAttackMaxDistance = 400
ENT.LeapAttackMinDistance = 200
ENT.TimeUntilLeapAttackDamage = 0.65
ENT.NextLeapAttackTime = 3
ENT.LeapAttackExtraTimers = {0.8, 1}
ENT.NextAnyAttackTime_Leap = 0.8
ENT.TimeUntilLeapAttackVelocity = 0.6
ENT.LeapAttackDamage = 25
ENT.LeapAttackDamageDistance = 150

ENT.DisableFootStepSoundTimer = true

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_BIG_FLINCH
ENT.FlinchHitGroupMap = {
	{HitGroup = HITGROUP_HEAD, Animation = "vjges_gesture_flinch_head"},
	{HitGroup = HITGROUP_CHEST, Animation = "vjges_gesture_flinch_chest"},
	{HitGroup = HITGROUP_STOMACH, Animation = "vjges_gesture_flinch_stomach"},
	{HitGroup = HITGROUP_LEFTARM, Animation = "vjges_gesture_flinch_leftArm"},
	{HitGroup = HITGROUP_RIGHTARM, Animation = "vjges_gesture_flinch_rightArm"},
	{HitGroup = HITGROUP_LEFTLEG, Animation = "vjges_gesture_flinch_leftleg"},
	{HitGroup = HITGROUP_RIGHTLEG, Animation = "vjges_gesture_flinch_rightleg"}
}

ENT.SoundTbl_FootStep = {"vj_eye/forma/foot1.wav", "vj_eye/forma/foot2.wav", "vj_eye/forma/foot3.wav", "vj_eye/forma/foot4.wav"}
//ENT.SoundTbl_Breath = {"vj_eye/forma/breathe_loop1.wav"}
ENT.SoundTbl_Idle = {"vj_eye/forma/idle1.wav", "vj_eye/forma/idle2.wav", "vj_eye/forma/idle3.wav", "vj_eye/forma/breathe_loop1.wav"}
ENT.SoundTbl_Alert = {"vj_eye/forma/alert1.wav", "vj_eye/forma/alert2.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_eye/forma/claw_strike1.wav", "vj_eye/forma/claw_strike2.wav", "vj_eye/forma/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = "vj_eye/forma/claw_miss1.wav"
ENT.SoundTbl_LeapAttackJump = "vj_eye/forma/leap1.wav"
ENT.SoundTbl_LeapAttackDamage = {"vj_eye/forma/claw_strike1.wav", "vj_eye/forma/claw_strike2.wav", "vj_eye/forma/claw_strike3.wav"}
ENT.SoundTbl_Pain = {"vj_eye/forma/pain1.wav", "vj_eye/forma/pain2.wav"}
ENT.SoundTbl_Death = "vj_eye/forma/die1.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(18, 18, 60), Vector(-18, -18, 0))
	if self:GetModel() == "models/vj_eye/forma.mdl" then
		self:SetSkin(math.random(0, 1))
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local getEventName = util.GetAnimEventNameByID
--
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	local eventName = getEventName(ev)
	if eventName == "AE_FORMA_ATTACK_LEFT" or eventName == "AE_FORMA_ATTACK_RIGHT" then
		self:ExecuteMeleeAttack()
	elseif eventName == "AE_FORMA_GALLOP_LEFT" or eventName == "AE_FORMA_GALLOP_RIGHT" then
		self:PlayFootstepSound()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if (act == ACT_IDLE or ACT_GLIDE) && !self:OnGround() then
		if self.AttackType == VJ.ATTACK_TYPE_LEAP then
			return ACT_RANGE_ATTACK2
		elseif !self:IsMoving() then
			return ACT_GLIDE
		end
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnLeapAttack(status, enemy)
	if status == "Jump" then
		return ((enemy:GetPos() + enemy:OBBCenter()) - (self:GetPos() + self:OBBCenter())):GetNormal() * 400 + self:GetForward() * 250 + self:GetUp() * 220
	end
end