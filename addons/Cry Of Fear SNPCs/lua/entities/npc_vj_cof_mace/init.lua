AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/mace/sewer_boss.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_mace_h")
ENT.HullType = HULL_MEDIUM_TALL
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 120
ENT.TimeUntilMeleeAttackDamage = 1.45
ENT.NextAnyAttackTime_Melee = 0.836
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_mace_d")
ENT.MeleeAttackBleedEnemy = true
ENT.MeleeAttackPlayerSpeed = true
ENT.HasMeleeAttackPlayerSpeedSounds = false
ENT.FootstepSoundTimerRun = 0.6
ENT.FootstepSoundTimerWalk = 0.6
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 6

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"boss/sewer/mace_scream.wav"}
ENT.SoundTbl_MeleeAttack = {"boss/sewer/mace_hitwall.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"boss/sewer/mace_swing.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"boss/sewer/mace_hitflesh.wav"}
ENT.SoundTbl_Pain = {}
ENT.SoundTbl_Death = {"boss/sewer/mace_scream.wav"}

ENT.AlertSoundLevel = 90
ENT.DeathSoundLevel = 90
ENT.FootstepSoundLevel = 75
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/