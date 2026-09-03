include("vj_base/extensions/nmrih_zombie.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_nmrih/national_guard.mdl"
ENT.StartHealth = 200

ENT.Zombie_Type = 0
ENT.Zombie_Gender = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:NMRIH_Init()
	self:SetBodygroup(1, math.random(0, 1)) -- Helmet
	self:SetBodygroup(4, math.random(0, 3)) -- Patches
	
	local randSkin = math.random(0, 3)
	self:SetSkin(randSkin)
	if (randSkin == 1 or randSkin == 3) && math.random(1, 2) == 1 then -- Dark skin can have a unique head
		self:SetBodygroup(3, 1)
	end
	
	self.Zombie_GibNumber = VJ.SET(3, math.random(2, 3))
end