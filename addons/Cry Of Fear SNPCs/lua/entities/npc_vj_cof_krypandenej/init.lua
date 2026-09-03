AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/crawler2/krypandenej.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_krypandenej_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 100
ENT.TimeUntilMeleeAttackDamage = 1.4
ENT.NextAnyAttackTime_Melee = 0.434
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_krypandenej_d")
ENT.MeleeAttackBleedEnemy = true
ENT.MeleeAttackPlayerSpeed = true
ENT.HasMeleeAttackPlayerSpeedSounds = false
ENT.FootstepSoundTimerRun = 0.2
ENT.FootstepSoundTimerWalk = 0.2
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"slower/slower_alert10.wav", "slower/slower_alert20.wav", "slower/slower_alert30.wav"}
ENT.SoundTbl_MeleeAttack = {"slower/slower_attack1.wav", "slower/slower_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"slower/hammer_miss1.wav", "slower/hammer_miss2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"slower/hammer_strike1.wav", "slower/hammer_strike2.wav", "slower/hammer_strike3.wav"}
ENT.SoundTbl_Pain = {"slower/slower_pain1.wav", "slower/slower_pain2.wav"}
ENT.SoundTbl_Death = {"slower/scream1.wav"}

ENT.FootstepSoundLevel = 75

ENT.MainSoundPitch = 70
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(15, 15, 40), Vector(-15, -15, 0))
end