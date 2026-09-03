AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_alienswarm/queen.mdl"
ENT.StartHealth = 8000
ENT.HullType = HULL_MEDIUM_TALL
ENT.VJ_ID_Boss = true
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ALIENSWARM"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK2}
ENT.MeleeAttackDamage = 90
ENT.MeleeAttackDistance = 260
ENT.MeleeAttackDamageDistance = 280
ENT.TimeUntilMeleeAttackDamage = false
ENT.HasMeleeAttackKnockBack = true

ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 8
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true

ENT.SoundTbl_FootStep = {"vj_alienswarm/boomer/footstep01.wav", "vj_alienswarm/boomer/footstep02.wav", "vj_alienswarm/boomer/footstep03.wav", "vj_alienswarm/boomer/footstep04.wav"}
ENT.SoundTbl_Idle = {"vj_alienswarm/shieldbug/idle01.wav", "vj_alienswarm/shieldbug/idle02.wav"}
ENT.SoundTbl_MeleeAttack = "vj_alienswarm/drone/jump.wav"
ENT.SoundTbl_MeleeAttackMiss = {"vj_alienswarm/boomer/attack01.wav", "vj_alienswarm/boomer/attack02.wav"}
ENT.SoundTbl_Pain = {"vj_alienswarm/shieldbug/pain01.wav", "vj_alienswarm/shieldbug/pain02.wav", "vj_alienswarm/shieldbug/move_voc03.wav"}
ENT.SoundTbl_Death = "vj_alienswarm/drone/die_fancy.wav"

ENT.MainSoundPitch = 50

ENT.FootstepSoundLevel = 100
ENT.AlertSoundLevel = 100
ENT.IdleSoundLevel = 100
ENT.MeleeAttackSoundLevel = 100
ENT.RangeAttackSoundLevel = 100
ENT.MeleeAttackMissSoundLevel = 150
ENT.BeforeLeapAttackSoundLevel = 100
ENT.PainSoundLevel = 100
ENT.DeathSoundLevel = 100
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(100, 100, 250), Vector(-100, -100, 5))
	self:SetStepHeight(78)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "move" then
		self:PlayFootstepSound()
	elseif key == "attack_melee" then
		self:ExecuteMeleeAttack()
	elseif key == "alert_scream" then
		self:PlaySoundSystem("Alert", "vj_alienswarm/shieldbug/roar.wav")
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled then return end
	self:PlayAnim("high_scream", true, false, true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward() * math.random(250, 300) + self:GetUp() * math.random(250, 300)
end