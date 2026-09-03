AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/sawcrazy/sawcrazy.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_sawcrazy_h")
ENT.HullType = HULL_MEDIUM_TALL
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 120
ENT.TimeUntilMeleeAttackDamage = 0.55
ENT.NextAnyAttackTime_Melee = 0.117
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_sawcrazy_d")
ENT.FootstepSoundTimerRun = 0.3
ENT.FootstepSoundTimerWalk = 0.3
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Breath = {"sawcrazy/dblsawloop.wav"}
ENT.SoundTbl_Alert = {"sawcrazy/random1.wav"}
ENT.SoundTbl_MeleeAttack = {"sawcrazy/random2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"faster/faster_miss.wav"}
ENT.SoundTbl_Death = {"sawcrazy/death.wav"}

ENT.FootstepSoundLevel = 75
ENT.BreathSoundLevel = 70
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(25, 25, 85), Vector(-25, -25, 0))
end