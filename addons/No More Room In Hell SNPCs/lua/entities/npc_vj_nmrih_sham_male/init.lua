include("vj_base/extensions/nmrih_zombie.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 150

ENT.Zombie_Type = 0
ENT.Zombie_Gender = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
	local randModel = math.random(1, 24)
	if randModel == 1 then
		self.Model = "models/vj_nmrih/Runner.mdl"
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 2 then
		self.Model = "models/vj_nmrih/bateman_infected.mdl"
		self.Zombie_GibNumber = -1
	elseif randModel == 3 then
		self.Model = "models/vj_nmrih/berny.mdl"
		self:SetSkin(0)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 4 then
		self.Model = "models/vj_nmrih/berny.mdl"
		self:SetSkin(1)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 5 then
		self.Model = "models/vj_nmrih/butcher_infected.mdl"
		self.Zombie_GibNumber = VJ.SET(1, 1)
	elseif randModel == 6 then
		self.Model = "models/vj_nmrih/casual_02.mdl"
		self:SetSkin(0)
		self.Zombie_GibNumber = VJ.SET(0, math.random(1, 3))
	elseif randModel == 7 then
		self.Model = "models/vj_nmrih/casual_02.mdl"
		self:SetSkin(1)
		self.Zombie_GibNumber = VJ.SET(0, math.random(1, 3))
	elseif randModel == 8 then
		self.Model = "models/vj_nmrih/casual_02.mdl"
		self:SetSkin(2)
		self.Zombie_GibNumber = VJ.SET(0, math.random(1, 3))
	elseif randModel == 9 then
		self.Model = "models/vj_nmrih/herby.mdl"
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 10 then
		self.Model = "models/vj_nmrih/hunter_infected.mdl"
		self.Zombie_GibNumber = -1
	elseif randModel == 11 then
		self.Model = "models/vj_nmrih/jive_infected.mdl"
		self.Zombie_GibNumber = -1
	elseif randModel == 12 then
		self.Model = "models/vj_nmrih/jogger.mdl"
		self:SetSkin(0)
		self.Zombie_GibNumber = VJ.SET(0, 3)
	elseif randModel == 13 then
		self.Model = "models/vj_nmrih/jogger.mdl"
		self:SetSkin(1)
		self.Zombie_GibNumber = VJ.SET(0, 3)
	elseif randModel == 14 then
		self.Model = "models/vj_nmrih/jogger.mdl"
		self:SetSkin(2)
		self.Zombie_GibNumber = VJ.SET(0, 3)
	elseif randModel == 15 then
		self.Model = "models/vj_nmrih/jogger.mdl"
		self:SetSkin(3)
		self.Zombie_GibNumber = VJ.SET(0, 3)
	elseif randModel == 16 then
		self.Model = "models/vj_nmrih/maxx.mdl"
		self.Zombie_GibNumber = VJ.SET(0, math.random(1, 4))
	elseif randModel == 17 then
		self.Model = "models/vj_nmrih/molotov_infected.mdl"
		self.Zombie_GibNumber = -1
	elseif randModel == 18 then
		self.Model = "models/vj_nmrih/officezom.mdl"
		self:SetSkin(0)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 19 then
		self.Model = "models/vj_nmrih/officezom.mdl"
		self:SetSkin(1)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 20 then
		self.Model = "models/vj_nmrih/officezom.mdl"
		self:SetSkin(2)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 21 then
		self.Model = "models/vj_nmrih/officezom.mdl"
		self:SetSkin(3)
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 22 then
		self.Model = "models/vj_nmrih/roje_infected.mdl"
		self.Zombie_GibNumber = VJ.SET(1, 1)
	elseif randModel == 23 then
		self.Model = "models/vj_nmrih/toby.mdl"
		self.Zombie_GibNumber = VJ.SET(0, 1)
	elseif randModel == 24 then
		self.Model = "models/vj_nmrih/wally_infected.mdl"
		self.Zombie_GibNumber = -1
	end
end