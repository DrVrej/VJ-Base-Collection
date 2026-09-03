include("entities/npc_vj_as_droneb/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_alienswarm/betadrone_big.mdl"
ENT.StartHealth = 220
ENT.HullType = HULL_LARGE

ENT.MeleeAttackDistance = 90
ENT.MeleeAttackDamageDistance = 100
ENT.MeleeAttackDamage = 25

ENT.MainSoundPitch = VJ.SET(60, 70)

ENT.FootstepSoundLevel = 60
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(30, 30, 70), Vector(-30, -30, 0))
	self:SetSurroundingBounds(Vector(70, 70, 100), Vector(-70, -70, 0))
	self:SetSkin((math.random(1, 2) == 1 and 0) or 2)
end