include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d1/common/common_female01.mdl"
ENT.Zombie_Gender = 1
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_OnInit()
	self:SetBodygroup(0, math.random(0, 2))
	self:SetBodygroup(1, math.random(0, 1))
	self:SetBodygroup(2, math.random(0, 1))
	self:SetSkin(math.random(0, 3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Gibs(gType)
	if gType == "h" then
		self:SetBodygroup(0, 3)
		if self:GetBodygroup(1) == 0 then
			self:SetBodygroup(1, 2)
		else
			self:SetBodygroup(1, 5)
		end
	elseif gType == "la" then
		if self:GetBodygroup(1) == 0 then
			self:SetBodygroup(1, 4)
		else
			self:SetBodygroup(1, 7)
		end
	elseif gType == "ra" then
		if self:GetBodygroup(1) == 0 then
			self:SetBodygroup(1, 3)
		else
			self:SetBodygroup(1, 6)
		end
	elseif gType == "ll" then
		if self:GetBodygroup(2) == 0 then
			self:SetBodygroup(2, 3)
		else
			self:SetBodygroup(2, 5)
		end
	elseif gType == "rl" then
		if self:GetBodygroup(2) == 0 then
			self:SetBodygroup(2, 2)
		else
			self:SetBodygroup(2, 4)
		end
	end
end