AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/faster/faster.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_faster_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 100
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.NextAnyAttackTime_Melee = 0.3
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_faster_d")
ENT.MeleeAttackBleedEnemy = true
ENT.FootstepSoundTimerRun = 0.25
ENT.FootstepSoundTimerWalk = 0.25
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 6

ENT.SoundTbl_FootStep = {"faster/faster_step.wav"}
ENT.SoundTbl_Alert = {"faster/faster_alert1.wav", "faster/faster_alert2.wav"}
ENT.SoundTbl_MeleeAttack = {"faster/faster_attack.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"faster/faster_miss.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"faster/faster_hit1.wav", "faster/faster_hit2.wav", "faster/faster_hit3.wav", "faster/faster_hit4.wav"}
ENT.SoundTbl_Pain = {"faster/faster_pain.wav"}
ENT.SoundTbl_Death = {"faster/faster_death.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	local randattack = math.random(1, 3)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1", "vjseq_attack2"}
		self.TimeUntilMeleeAttackDamage = 0.65
		self.NextAnyAttackTime_Melee = 0.02
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_faster_d")
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack3"}
		self.TimeUntilMeleeAttackDamage = 0.65
		self.NextAnyAttackTime_Melee = 0.24
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_faster_d_double")
	elseif randattack == 3 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack5"}
		self.TimeUntilMeleeAttackDamage = 0.85
		self.NextAnyAttackTime_Melee = 0.293
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_faster_d_jump")
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" then
		if self.HasSounds == false then return end
		timer.Simple(1.5, function()
			if IsValid(self) then
				VJ.EmitSound(self, "faster/faster_suicide.wav")
			end
		end)
	end
end