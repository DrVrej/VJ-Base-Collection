include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d1/common/common_female_nurse01.mdl"
ENT.Zombie_Gender = 1
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_OnInit()
	self:SetBodygroup(0, math.random(0, 2))
	self:SetSkin(math.random(0, 3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Gibs(gType)
	if gType == "h" then
		self:SetBodygroup(0, 3)
		self:SetBodygroup(1, 1)
	elseif gType == "la" then
		self:SetBodygroup(1, 3)
	elseif gType == "ra" then
		self:SetBodygroup(1, 2)
	elseif gType == "ll" then
		self:SetBodygroup(2, 2)
	elseif gType == "rl" then
		self:SetBodygroup(2, 1)
	end
end