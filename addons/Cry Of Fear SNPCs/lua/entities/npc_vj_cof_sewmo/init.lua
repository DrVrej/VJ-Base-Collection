AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/sewmo/sewmo.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_sewmo_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 110
ENT.TimeUntilMeleeAttackDamage = 0.8
ENT.NextAnyAttackTime_Melee = 0.3
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_sewmo_d_wired")
ENT.MeleeAttackBleedEnemy = true
ENT.FootstepSoundTimerRun = 0.4
ENT.FootstepSoundTimerWalk = 0.4
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"sewmo/sewmo_alert10.wav", "sewmo/sewmo_alert20.wav", "sewmo/sewmo_alert30.wav"}
ENT.SoundTbl_MeleeAttack = {"sewmo/sewmo_attack1.wav", "sewmo/sewmo_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"sewmo/tunga_miss.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"sewmo/tunga_strike1.wav", "sewmo/tunga_strike2.wav"}
ENT.SoundTbl_Pain = {"sewmo/sewmo_pain1.wav", "sewmo/sewmo_pain2.wav"}
ENT.SoundTbl_Death = {"slower/scream1.wav"}

ENT.FootstepSoundLevel = 75

-- Custom
ENT.Sewmo_WireBroken = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	if self.Sewmo_WireBroken == false && self.Dead == false && (self.StartHealth *.50 > self:Health()) then
		self.Sewmo_WireBroken = true
		self:PlayAnim(ACT_SIGNAL1, true, 1, false)
		timer.Simple(0.3, function() if IsValid(self) then
			if self.HasSounds == true then VJ.EmitSound(self, "sewmo/break_free.wav") end end end)
			timer.Simple(1, function() if IsValid(self) then
				self:SetBodygroup(0, 1) 
				self:MaintainAlertBehavior()
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	if self:GetBodygroup(0) == 0 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1}
		self.SoundTbl_MeleeAttackMiss = {"sewmo/tunga_miss.wav"}
		self.SoundTbl_MeleeAttackExtra = {"sewmo/tunga_strike1.wav", "sewmo/tunga_strike2.wav"}
		self.TimeUntilMeleeAttackDamage = 0.65
		self.NextAnyAttackTime_Melee = 0.493
		self.MeleeAttackExtraTimers = {}
	elseif self:GetBodygroup(0) == 1 then
		self.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK2}
		self.SoundTbl_MeleeAttackMiss = {"sewmo/claw_miss1.wav", "sewmo/claw_miss2.wav", "sewmo/claw_miss3.wav"}
		self.SoundTbl_MeleeAttackExtra = {"sewmo/claw_strike1.wav", "sewmo/claw_strike2.wav", "sewmo/claw_strike3.wav"}
		self.TimeUntilMeleeAttackDamage = 0.55
		self.NextAnyAttackTime_Melee = 0.593
		self.MeleeAttackExtraTimers = {0.9}
	end
end