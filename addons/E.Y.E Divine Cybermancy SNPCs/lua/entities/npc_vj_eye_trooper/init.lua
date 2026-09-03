AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_eye/troopers.mdl"
ENT.StartHealth = 200
ENT.HullType = HULL_MEDIUM
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_FEDERALISTS"}
ENT.BloodColor = VJ.BLOOD_COLOR_OIL

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1, "melee2"}
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 100

ENT.FootstepSoundTimerRun = 0.3
ENT.FootstepSoundTimerWalk = 0.5
ENT.HasExtraMeleeAttackSounds = true

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

ENT.SoundTbl_FootStep = "physics/plaster/ceiling_tile_step4.wav"
ENT.SoundTbl_Idle = {"vj_eye/trooper/pass_temple_activate.wav", "vj_eye/trooper/scream.wav"}
//ENT.SoundTbl_CombatIdle = "vj_eye/trooper/alarm.wav" -- Avoid using, its a looping wav file!
ENT.SoundTbl_Alert = "vj_eye/trooper/active.wav"
ENT.SoundTbl_MeleeAttack = {"vj_eye/trooper/attack1.wav", "vj_eye/trooper/attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_eye/swipe01.wav", "vj_eye/swipe02.wav", "vj_eye/swipe03.wav"}
ENT.SoundTbl_Pain = {"vj_eye/trooper/pain1.wav", "vj_eye/trooper/pain2.wav"}
ENT.SoundTbl_Impact = {"ambient/energy/spark1.wav", "ambient/energy/spark2.wav", "ambient/energy/spark3.wav", "ambient/energy/spark4.wav"}
ENT.SoundTbl_Death = "vj_eye/trooper/die.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(25, 25, 80), Vector(-25, -25, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
local getEventName = util.GetAnimEventNameByID
--
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	local eventName = getEventName(ev)
	if eventName == "AE_TROOPERS_ATTACK_LEFT" or eventName == "AE_TROOPERS_ATTACK_RIGHT" then
		self:ExecuteMeleeAttack()
	//elseif eventName == "AE_TROOPERS_GALLOP_LEFT" or eventName == "AE_TROOPERS_GALLOP_RIGHT" then -- For some reason only running animation has it...
		//self:PlayFootstepSound()
	end
end