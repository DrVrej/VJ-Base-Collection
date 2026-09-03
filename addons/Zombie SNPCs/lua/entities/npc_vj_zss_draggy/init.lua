AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_zombies/draggy.mdl"
ENT.StartHealth = 200
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 22
ENT.MeleeAttackDamageDistance = 65
ENT.TimeUntilMeleeAttackDamage = 0.2
ENT.NextAnyAttackTime_Melee = 0.2
ENT.MeleeAttackDamage = 20
ENT.PropInteraction = "OnlyDamage"

ENT.HasExtraMeleeAttackSounds = true

ENT.SoundTbl_Idle = {"vj_zombies/special/idle1.wav", "vj_zombies/special/idle2.wav", "vj_zombies/special/idle3.wav", "vj_zombies/special/idle4.wav", "vj_zombies/special/idle5.wav", "vj_zombies/special/idle6.wav"}
ENT.SoundTbl_Alert = {"vj_zombies/special/alert1.wav", "vj_zombies/special/alert2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"vj_zombies/special/bite1.wav", "vj_zombies/special/bite2.wav", "vj_zombies/special/bite3.wav", "vj_zombies/special/bite4.wav"}
ENT.SoundTbl_Pain = {"vj_zombies/special/pain1.wav", "vj_zombies/special/pain2.wav", "vj_zombies/special/pain3.wav", "vj_zombies/special/pain4.wav", "vj_zombies/special/pain5.wav", "vj_zombies/special/pain6.wav"}
ENT.SoundTbl_Death = {"vj_zombies/special/die1.wav", "vj_zombies/special/die2.wav", "vj_zombies/special/die3.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(12, 12, 60), Vector(-12, -12, 0))
	self:SetSkin(math.random(0, 3))
end