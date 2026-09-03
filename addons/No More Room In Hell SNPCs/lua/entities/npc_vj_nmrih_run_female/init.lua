include("vj_base/extensions/nmrih_zombie.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100

ENT.Zombie_Type = 1
ENT.Zombie_Gender = 1
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
	local randModel = math.random(1, 6)
	if randModel == 1 then
		self.Model = "models/vj_nmrih/badass_infected.mdl"
		self.Zombie_GibNumber = VJ.SET(1, 1)
	elseif randModel == 2 then
		self.Model = "models/vj_nmrih/julie.mdl"
		self.Zombie_GibNumber = VJ.SET(0, math.random(1, 4))
	elseif randModel == 3 then
		self.Model = "models/vj_nmrih/tammy.mdl"
		self:SetSkin(0)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 4 then
		self.Model = "models/vj_nmrih/tammy.mdl"
		self:SetSkin(1)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 5 then
		self.Model = "models/vj_nmrih/tammy.mdl"
		self:SetSkin(2)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 6 then
		self.Model = "models/vj_nmrih/tammy.mdl"
		self:SetSkin(3)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	end
end