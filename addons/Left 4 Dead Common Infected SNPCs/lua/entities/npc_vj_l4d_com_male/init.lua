include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cpthazama/l4d1/common/male_01.mdl", "models/cpthazama/l4d1/common/common_male_rural01.mdl", "models/cpthazama/l4d1/common/common_worker_male01_test.mdl", "models/cpthazama/l4d1/common/common_male_suit.mdl"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_OnInit()
	if self:GetModel() == "models/cpthazama/l4d1/common/common_male_rural01.mdl" then
		self:SetBodygroup(0, math.random(0, 4))
		self:SetBodygroup(1, math.random(0, 1))
		self:SetSkin(math.random(0, 15))
	else
		self:SetBodygroup(0, math.random(0, 3))
		self:SetBodygroup(1, math.random(0, 1))
		if self:GetModel() == "models/cpthazama/l4d1/common/common_worker_male01_test.mdl" or self:GetModel() == "models/cpthazama/l4d1/common/common_male_suit.mdl" then
			self:SetSkin(math.random(0, 15))
		else
			self:SetSkin(math.random(0, 31))
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_Gibs(gType)
	if gType == "h" then
		if self:GetModel() == "models/cpthazama/l4d1/common/common_male_rural01.mdl" then
			self:SetBodygroup(0, 5)
		else
			self:SetBodygroup(0, 4)
		end
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
		self:SetBodygroup(2, 2)
	elseif gType == "rl" then
		self:SetBodygroup(2, 1)
	end
end