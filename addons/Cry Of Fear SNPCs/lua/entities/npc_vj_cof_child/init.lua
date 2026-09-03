AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/children/children.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_child_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 70
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.NextAnyAttackTime_Melee = 0.7
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_child_d_stab")
ENT.MeleeAttackBleedEnemy = true
ENT.MeleeAttackBleedEnemyChance = 1
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
ENT.SoundTbl_Alert = {"children/child_alert10.wav", "children/child_alert20.wav", "children/child_alert30.wav"}
ENT.SoundTbl_MeleeAttack = {"children/child_attack1.wav", "children/child_attack2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"children/child_slice.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"children/child_slash.wav"}
ENT.SoundTbl_Pain = {"children/child_pain1.wav", "children/child_pain2.wav"}
ENT.SoundTbl_Death = {"children/child_pain1.wav", "children/child_pain2.wav"}

ENT.FootstepSoundLevel = 75
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(13, 13, 60), Vector(-13, -13, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	local randattack = math.random(1, 2)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
		self.TimeUntilMeleeAttackDamage = 0.75
		self.NextAnyAttackTime_Melee = 0.25
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_child_d_stab")
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
		self.TimeUntilMeleeAttackDamage = 0.6
		self.NextAnyAttackTime_Melee = 0.4
		self.MeleeAttackExtraTimers = {0.8}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_child_d_dual")
	end
end