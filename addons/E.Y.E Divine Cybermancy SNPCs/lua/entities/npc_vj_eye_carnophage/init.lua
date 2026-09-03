AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_eye/carnophage.mdl"
ENT.StartHealth = 200
ENT.HullType = HULL_WIDE_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_METASTREUMONIC"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_melee"
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 18
ENT.MeleeAttackDistance = 55
ENT.MeleeAttackDamageDistance = 85
ENT.MeleeAttackBleedEnemy = true
ENT.MeleeAttackBleedEnemyChance = 1

ENT.HasExtraMeleeAttackSounds = true
ENT.FootstepSoundTimerRun = 0.4
ENT.FootstepSoundTimerWalk = 0.5

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_FLINCH_PHYSICS
ENT.FlinchHitGroupMap = {
	{HitGroup = HITGROUP_HEAD, Animation = "vjges_gesture_flinch_head"},
	{HitGroup = HITGROUP_CHEST, Animation = "vjges_gesture_flinch_chest"},
	{HitGroup = HITGROUP_STOMACH, Animation = "vjges_gesture_flinch_stomach"},
	{HitGroup = HITGROUP_LEFTARM, Animation = "vjges_gesture_flinch_leftArm"},
	{HitGroup = HITGROUP_RIGHTARM, Animation = "vjges_gesture_flinch_rightArm"},
	{HitGroup = HITGROUP_LEFTLEG, Animation = "vjges_gesture_flinch_leftleg"},
	{HitGroup = HITGROUP_RIGHTLEG, Animation = "vjges_gesture_flinch_rightleg"}
}

ENT.SoundTbl_FootStep = {"vj_eye/carnophage/carnofoot1.mp3", "vj_eye/carnophage/carnofoot2.mp3"}
ENT.SoundTbl_Idle = {"vj_eye/carnophage/idle1.wav", "vj_eye/carnophage/idle2.wav", "vj_eye/carnophage/idle3.wav"}
ENT.SoundTbl_Alert = {"vj_eye/carnophage/alert1.wav", "vj_eye/carnophage/alert3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_eye/carnophage/leap1.wav", "vj_eye/carnophage/leap2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_eye/swipe01.wav", "vj_eye/swipe02.wav", "vj_eye/swipe03.wav"}
ENT.SoundTbl_Pain = {"vj_eye/carnophage/pain1.wav", "vj_eye/carnophage/pain2.wav"}
ENT.SoundTbl_Death = {"vj_eye/carnophage/scream.wav", "vj_eye/carnophage/die2.wav"}

local sdAlertRegular = {"vj_eye/carnophage/alert1.wav", "vj_eye/carnophage/alert3.wav"}
local sdAlertAngry = "vj_eye/carnophage/gurgle_loop1.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(22, 22, 80), Vector(-22, -22, 0))
	self:SetSkin(math.random(0, 3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
local getEventName = util.GetAnimEventNameByID
--
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	local eventName = getEventName(ev)
	if eventName == "AE_CARNO_ATTACK_RIGHT" or eventName == "AE_CARNO_ATTACK_LEFT" then
		self:ExecuteMeleeAttack()
	//elseif eventName == "AE_CARNO_GALLOP_RIGHT" or eventName == "AE_CARNO_GALLOP_LEFT" then -- For some reason only running animation has it...
		//self:PlayFootstepSound()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled then return end
	if math.random(1, 2) == 1 then
		self.SoundTbl_Alert = sdAlertAngry
		self:PlayAnim(ACT_ARM, true, false, true)
	else
		self.SoundTbl_Alert = sdAlertRegular
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
/*
-- Why not use the other 2 attacks? Because this 1 attack is extremely dangerous & fast, while the others are too slow compared to it
function ENT:OnMeleeAttack(status, enemy)
	if status == "Init" then
		if math.random(1, 2) == 1 then
			self.AnimTbl_MeleeAttack = {"vjseq_melee2", "vjseq_melee3"}
			self.TimeUntilMeleeAttackDamage = 0.4
			self.MeleeAttackExtraTimers = {}
			self.MeleeAttackDamage = 30
		else
			self.AnimTbl_MeleeAttack = "vjseq_melee"
			self.TimeUntilMeleeAttackDamage = 0.32
			self.MeleeAttackExtraTimers = {0.6}
			self.MeleeAttackDamage = 18
		end
	end
end*/