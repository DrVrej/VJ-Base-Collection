AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/Faceless2/faceless2.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_faceless2_h")
ENT.HullType = HULL_TINY
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 95
ENT.TimeUntilMeleeAttackDamage = 0.32
ENT.NextAnyAttackTime_Melee = 0.055
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_faceless2_d")
ENT.FootstepSoundTimerRun = 0.2
ENT.FootstepSoundTimerWalk = 0.2
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"faceless/faceless_alert10.wav", "faceless/faceless_alert20.wav", "faceless/faceless_alert30.wav"}
ENT.SoundTbl_MeleeAttack = {"faceless/faceless_attack1.wav", "faceless/faceless_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"faceless/fist_miss1.wav", "faceless/fist_miss2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"faceless/fist_strike1.wav", "faceless/fist_strike2.wav"}
ENT.SoundTbl_Pain = {"faceless/faceless_pain1.wav", "faceless/faceless_pain2.wav"}
ENT.SoundTbl_Death = {"faceless/faceless_pain1.wav", "faceless/faceless_pain2.wav"}

ENT.FootstepSoundLevel = 75
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(25, 25, 15), Vector(-25, -25, 0))
end