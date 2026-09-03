AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/psycho/psycho.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_phsycho_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 42
ENT.MeleeAttackDamageDistance = 95
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_phsycho_d")
ENT.FootstepSoundTimerRun = 0.2
ENT.FootstepSoundTimerWalk = 0.2
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"faster/faster_special.wav"}
ENT.SoundTbl_MeleeAttack = {"faceless/faceless_attack1.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"faster/faster_miss.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"faster/faster_hit1.wav", "faster/faster_hit2.wav", "faster/faster_hit3.wav", "faster/faster_hit4.wav"}
ENT.SoundTbl_Pain = {"faster/faster_headhit1.wav", "faster/faster_headhit2.wav", "faster/faster_headhit3.wav", "faster/faster_headhit4.wav"}
ENT.SoundTbl_Death = {"faster/faster_metalfall.wav"}

ENT.FootstepSoundLevel = 75
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	local randattack = math.random(1, 3)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1_1"}
		self.TimeUntilMeleeAttackDamage = 0.35
		self.NextAnyAttackTime_Melee = 0.19
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1_2"}
		self.TimeUntilMeleeAttackDamage = 0.35
		self.NextAnyAttackTime_Melee = 0.26
	elseif randattack == 3 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1_3"}
		self.TimeUntilMeleeAttackDamage = 0.35
		self.NextAnyAttackTime_Melee = 0.317
	end
end