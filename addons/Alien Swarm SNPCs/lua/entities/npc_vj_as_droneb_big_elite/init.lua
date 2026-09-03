include("entities/npc_vj_as_droneb_big/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 400
ENT.MeleeAttackDamage = 45
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(30, 30, 70), Vector(-30, -30, 0))
	self:SetSurroundingBounds(Vector(70, 70, 100), Vector(-70, -70, 0))
	self:SetSkin((math.random(1, 2) == 1 and 1) or 3)
end