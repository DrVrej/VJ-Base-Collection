AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/upper/upper.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_upper_h")
ENT.HullType = HULL_MEDIUM_TALL
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 100
ENT.TimeUntilMeleeAttackDamage = 0.9
ENT.NextAnyAttackTime_Melee = 0.8
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_upper_d_reg")
ENT.FootstepSoundTimerRun = 0.15
ENT.FootstepSoundTimerWalk = 0.15
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"upper/Sickscream.wav"}
ENT.SoundTbl_MeleeAttack = {"slower/slower_attack1.wav", "slower/slower_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"faceless/fist_miss1.wav", "faceless/fist_miss2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"faceless/fist_strike1.wav", "faceless/fist_strike2.wav"}
ENT.SoundTbl_Pain = {"slower/slower_pain1.wav", "slower/slower_pain2.wav"}
ENT.SoundTbl_Death = {"slower/scream1.wav"}

ENT.FootstepSoundLevel = 75
ENT.AlertSoundLevel = 80

-- Custom
ENT.Slower1_TypeOfBodyGroup = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(18, 18, 90), Vector(-18, -18, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	local randattack = math.random(1, 4)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
		self.TimeUntilMeleeAttackDamage = 0.8
		self.NextAnyAttackTime_Melee = 0.2
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_upper_d_reg")
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack3"}
		self.TimeUntilMeleeAttackDamage = 0.65
		self.NextAnyAttackTime_Melee = 0.6
		self.MeleeAttackExtraTimers = {1}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_upper_d_dual")
	elseif randattack == 3 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack4"}
		self.TimeUntilMeleeAttackDamage = 1.05
		self.NextAnyAttackTime_Melee = 0.274
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_upper_d_slow")
	elseif randattack == 4 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack5"}
		self.TimeUntilMeleeAttackDamage = 0.65
		self.NextAnyAttackTime_Melee = 0.262
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_upper_d_reg")
	end
end