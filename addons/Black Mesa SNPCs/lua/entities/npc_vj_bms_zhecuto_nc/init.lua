include("entities/npc_vj_bms_zhecuto/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
function ENT:Init()
	self:SetCollisionBounds(Vector(20, 20 , 26), Vector(-20, -20, 0))
	self:SetBodygroup(1, 1)
end