AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/slower3/slower3.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_slower3_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 100
ENT.TimeUntilMeleeAttackDamage = 0.9
ENT.NextAnyAttackTime_Melee = 0.8
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_slower3_d_reg")
ENT.FootstepSoundTimerRun = 0.2
ENT.FootstepSoundTimerWalk = 0.2
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIEBACKWARD}
ENT.DeathAnimationTime = 4

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"slower3/slower_alert10.wav", "slower3/slower_alert20.wav", "slower3/slower_alert30.wav"}
ENT.SoundTbl_MeleeAttack = {"slower3/slower_attack1.wav", "slower3/slower_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"slower/hammer_miss1.wav", "slower/hammer_miss2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"slower/hammer_strike1.wav", "slower/hammer_strike2.wav", "slower/hammer_strike3.wav"}
ENT.SoundTbl_Pain = {"slower3/slower_pain1.wav", "slower3/slower_pain2.wav"}
ENT.SoundTbl_Death = {"slower/scream1.wav"}

ENT.AlertSoundLevel = 90
ENT.FootstepSoundLevel = 75
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetBodygroup(0, math.random(0, 2))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	local randattack = math.random(1, 4)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
		self.TimeUntilMeleeAttackDamage = 0.7
		self.NextAnyAttackTime_Melee = 0.134
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_slower3_d_reg")
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
		self.TimeUntilMeleeAttackDamage = 0.85
		self.NextAnyAttackTime_Melee = 0.15
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_slower3_d_reg")
	elseif randattack == 3 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack3"}
		self.TimeUntilMeleeAttackDamage = 0.55
		self.NextAnyAttackTime_Melee = 0.3389
		self.MeleeAttackExtraTimers = {0.8}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_slower3_d_dual")
	elseif randattack == 4 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack5"}
		self.TimeUntilMeleeAttackDamage = 0.53
		self.NextAnyAttackTime_Melee = 0.09
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_slower3_d_reg")
	end
end