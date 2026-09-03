AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/sawrunner/sawrunner.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_sawrunner_h")
ENT.HullType = HULL_WIDE_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 130
ENT.TimeUntilMeleeAttackDamage = 0.45
ENT.NextAnyAttackTime_Melee = 0.217
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_sawrunner_d")
ENT.FootstepSoundTimerRun = 0.3
ENT.FootstepSoundTimerWalk = 0.3
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_BIG_FLINCH

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Breath = {"boss/sawer/chainsaw_loop.wav"}
ENT.SoundTbl_Alert = {"sawrunner/sawrunnerhello.wav"}
ENT.SoundTbl_MeleeAttack = {"sawrunner/sawrunner_attack1.wav", "sawrunner/sawrunner_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"sawrunner/chainsaw_attack_miss.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"sawrunner/chainsaw_attack_hit.wav"}
ENT.SoundTbl_Pain = {"sawrunner/sawrunner_pain1.wav", "sawrunner/sawrunner_pain2.wav"}
ENT.SoundTbl_Death = {"sawrunner/sawrunner_pain1.wav", "sawrunner/sawrunner_pain2.wav"}

ENT.AlertSoundLevel = 100
ENT.FootstepSoundLevel = 75
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(20, 20, 80), Vector(-20, -20, 0))
end