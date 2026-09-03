AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_zombies/stalker.mdl"
ENT.StartHealth = 300
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 32
ENT.MeleeAttackDamageDistance = 65
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20
ENT.MeleeAttackPlayerSpeed = true
ENT.MeleeAttackBleedEnemy = true
ENT.DisableFootStepSoundTimer = true

ENT.SoundTbl_FootStep = {"npc/stalker/stalker_footstep_left1.wav", "npc/stalker/stalker_footstep_left2.wav", "npc/stalker/stalker_footstep_right1.wav", "npc/stalker/stalker_footstep_right2.wav"}
ENT.SoundTbl_Breath = "npc/stalker/breathing3.wav"
ENT.SoundTbl_Idle = {"vj_zombies/special/idle1.wav", "vj_zombies/special/idle2.wav", "vj_zombies/special/idle3.wav", "vj_zombies/special/idle4.wav", "vj_zombies/special/idle5.wav", "vj_zombies/special/idle6.wav"}
ENT.SoundTbl_Alert = "npc/stalker/go_alert2a.wav"
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav", "npc/zombie/claw_strike2.wav", "npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_zombies/miss1.wav", "vj_zombies/miss2.wav", "vj_zombies/miss3.wav", "vj_zombies/miss4.wav"}
//ENT.SoundTbl_Pain = {"vj_zombies/special/pain1.wav", "vj_zombies/special/pain2.wav", "vj_zombies/special/pain3.wav", "vj_zombies/special/pain4.wav", "vj_zombies/special/pain5.wav", "vj_zombies/special/pain6.wav"}
ENT.SoundTbl_Death = {"vj_zombies/special/die1.wav", "vj_zombies/special/die2.wav", "vj_zombies/special/die3.wav"}

//ENT.FootstepSoundLevel = 55 -- Used by the older footstep sound "physics/metal/metal_box_footstep3.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(9, 9, 65), Vector(-9, -9, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	//print(key)
	if key == "step" then
		self:PlayFootstepSound()
	elseif key == "melee" then
		self:ExecuteMeleeAttack()
	end
end