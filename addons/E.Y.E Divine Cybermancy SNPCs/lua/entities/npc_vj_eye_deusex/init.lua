AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_eye/deusex.mdl"
ENT.StartHealth = 6000
ENT.HullType = HULL_LARGE
ENT.VJ_ID_Boss = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_METASTREUMONIC"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDamageType = bit.bor(DMG_CRUSH, DMG_ALWAYSGIB)
ENT.MeleeAttackDistance = 200
ENT.MeleeAttackDamageDistance = 230
ENT.TimeUntilMeleeAttackDamage = 0.62
ENT.MeleeAttackDamage = 75
ENT.HasMeleeAttackKnockBack = true

ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = false
ENT.RangeAttackProjectiles = "obj_eye_deusex_rocket"
ENT.RangeAttackMaxDistance = 8000
ENT.RangeAttackMinDistance = 500
ENT.TimeUntilRangeAttackProjectileRelease = 0.4
ENT.NextRangeAttackTime = 5
ENT.NextAnyAttackTime_Range = 3
ENT.RangeAttackReps = 7

ENT.LimitChaseDistance = "OnlyRange"
ENT.LimitChaseDistance_Max = 4000
ENT.LimitChaseDistance_Min = "UseRangeDistance"

ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true

ENT.SoundTbl_FootStep = {"vj_eye/deusex/deus_footstep_01_mono.wav", "vj_eye/deusex/deus_footstep_02_mono.wav"}
ENT.SoundTbl_Idle = {"vj_eye/deusex/deus_idle_1.wav", "vj_eye/deusex/deus_idle_2.wav"}
ENT.SoundTbl_Alert = {"vj_eye/deusex/deus_scream_1.wav", "vj_eye/deusex/deus_scream_2.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_eye/deusex/deus_scream_3.wav", "vj_eye/deusex/deus_scream_4.wav"}
ENT.SoundTbl_MeleeAttackExtra = "VJ.Impact.Metal_Crush"
ENT.SoundTbl_MeleeAttackMiss = {"vj_eye/swipe01.wav", "vj_eye/swipe02.wav", "vj_eye/swipe03.wav"}
ENT.SoundTbl_RangeAttack = {"vj_eye/deusex/deus_walk_01_mono.wav", "vj_eye/deusex/deus_walk_02_mono.wav"}
ENT.SoundTbl_Pain = {"vj_eye/deusex/deus_scream_5.wav", "vj_eye/deusex/deus_scream_6.wav"}
ENT.SoundTbl_Death = {"vj_eye/deusex/deus_scream_7.wav", "vj_eye/deusex/deus_scream_8.wav", "vj_eye/deusex/deus_scream_9.wav"}

ENT.FootstepSoundLevel = 80
ENT.AlertSoundLevel = 95
ENT.IdleSoundLevel = 90
ENT.MeleeAttackSoundLevel = 95
ENT.ExtraMeleeAttackSoundLevel = 80
ENT.RangeAttackSoundLevel = 80
ENT.MeleeAttackMissSoundLevel = 90
ENT.BeforeLeapAttackSoundLevel = 95
ENT.PainSoundLevel = 95
ENT.DeathSoundLevel = 95

ENT.RangeAttackPitch = VJ.SET(100, 100)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetPhysicsDamageScale(0)
	self:SetCollisionBounds(Vector(90, 90, 420), Vector(-90, -90, 0))
	self:SetStepHeight(150)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	if ev == 2050 or ev == 2051 then -- Predefined by the engine, so IDs are always the same
		self:PlayFootstepSound()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_IDLE && (self:GetNPCState() == NPC_STATE_ALERT or self:GetNPCState() == NPC_STATE_COMBAT) then
		return ACT_IDLE_ANGRY
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
	util.ScreenShake(self:GetPos(), 10, 100, 0.4, 4000)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward()*math.random(580, 620) + self:GetUp()*math.random(580, 610)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
	self:RestartGesture(ACT_GESTURE_RANGE_ATTACK1)
	return self:GetAttachment(self:LookupAttachment("missile")).Pos + self:GetForward()*50 + self:GetUp()*-35
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
	return VJ.CalculateTrajectory(self, self:GetEnemy(), "Line", projectile:GetPos(), 1, 5000)
end