AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/runningcrazy/runningcrazy.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_crazyrunner_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 45
ENT.MeleeAttackDamageDistance = 120
ENT.TimeUntilMeleeAttackDamage = 0.35
ENT.NextAnyAttackTime_Melee = 0.22
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_crazyrunner_d")
ENT.FootstepSoundTimerRun = 0.2
ENT.FootstepSoundTimerWalk = 0.2
ENT.MeleeAttackBleedEnemy = true
ENT.MeleeAttackPlayerSpeed = true
ENT.HasMeleeAttackPlayerSpeedSounds = false
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"crazylady/lady_alert10.wav", "crazylady/lady_alert20.wav", "crazylady/lady_alert30.wav"}
ENT.SoundTbl_MeleeAttack = {"crazylady/lady_attack1.wav", "crazylady/lady_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"crazylady/knife_swing.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"crazylady/knife_hitbody1.wav", "crazylady/knife_hitbody2.wav"}
ENT.SoundTbl_Pain = {"crazylady/lady_pain1.wav", "crazylady/lady_pain2.wav"}
ENT.SoundTbl_Death = {"crazylady/lady_pain1.wav", "crazylady/lady_pain2.wav"}

ENT.FootstepSoundLevel = 75
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/