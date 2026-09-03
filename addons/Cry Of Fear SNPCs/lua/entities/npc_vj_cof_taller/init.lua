AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/taller/taller.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_taller_h")
ENT.HullType = HULL_MEDIUM_TALL
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamageDistance = 180
ENT.TimeUntilMeleeAttackDamage = 0.5
ENT.NextAnyAttackTime_Melee = 0.8
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_taller_punch")
ENT.HasMeleeAttackKnockBack = true
ENT.FootstepSoundTimerRun = 0.7
ENT.FootstepSoundTimerWalk = 0.7
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.CanFlinch = true
ENT.FlinchChance = 18
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH

ENT.SoundTbl_FootStep = {"taller/taller_step.wav"}
ENT.SoundTbl_Alert = {"taller/taller_alert.wav"}
ENT.SoundTbl_MeleeAttack = {"taller/taller_player_punch.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"taller/taller_swing.wav"}
ENT.SoundTbl_Pain = {"taller/taller_pain.wav"}
ENT.SoundTbl_Death = {"taller/taller_die.wav"}

ENT.AlertSoundLevel = 90
ENT.FootstepSoundLevel = 80
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(30, 30, 170), Vector(-30, -30, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
	util.ScreenShake(self:GetPos(), 10, 100, 0.4, 1000)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	if math.random(1, 2) == 1 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
		self.MeleeAttackDistance = 70
		self.MeleeAttackDamageDistance = 150
		self.TimeUntilMeleeAttackDamage = 0.45
		self.NextAnyAttackTime_Melee = 1.217
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_taller_punch")
		self.SoundTbl_MeleeAttack = {"taller/taller_player_punch.wav"}
		self.SoundTbl_MeleeAttackMiss = {"taller/taller_swing.wav"}
	else
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
		self.MeleeAttackDistance = 50
		self.MeleeAttackDamageDistance = 120
		self.TimeUntilMeleeAttackDamage = 1.25
		self.NextAnyAttackTime_Melee = 0.75
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_taller_stomp")
		self.SoundTbl_MeleeAttack = {"taller/taller_stamp.wav"}
		self.SoundTbl_MeleeAttackMiss = {"taller/taller_player_impact.wav"}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	if self:GetActivity() == ACT_MELEE_ATTACK2 then
		return self:GetForward() * 50
	else
		return self:GetForward() * 150 + self:GetUp() * math.random(350, 360)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "Miss" && self:GetActivity() == ACT_MELEE_ATTACK2 then
		util.ScreenShake(self:GetPos(), 5, 100, 0.7, 800)
	end
end