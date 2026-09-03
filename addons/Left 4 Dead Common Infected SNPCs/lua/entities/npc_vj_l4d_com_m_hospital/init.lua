include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/l4d1/common/common_surgeon_male01.mdl", "models/cpthazama/l4d1/common/common_patient_male01.mdl"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_OnInit()
	if self:GetModel() == "models/cpthazama/l4d1/common/common_surgeon_male01.mdl" then
		self:SetBodygroup(0, math.random(0, 4))
	else
		self:SetBodygroup(0, math.random(0, 3))
	end
	self:SetSkin(math.random(0, 15))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Gibs(gType)
	if gType == "h" then
		if self:GetModel() == "models/cpthazama/l4d1/common/common_surgeon_male01.mdl" then
			self:SetBodygroup(0, 5)
		else
			self:SetBodygroup(0, 4)
		end
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