include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_ceda.mdl"
ENT.Immune_Fire = true
ENT.CanGib = false

local sdDeflate = {"vj_l4d_com/ceda/ceda_suit_deflate.wav", "vj_l4d_com/ceda/ceda_suit_deflate_02.wav", "vj_l4d_com/ceda/ceda_suit_deflate_03.wav"}

-- Custom
ENT.Zombie_CanPuke = false
ENT.Zombie_HazmatBroken = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_OnInit()
	self:SetBodygroup(1, math.random(0, 5))
	
	local mask = ents.Create("prop_vj_animatable")
	mask:SetModel("models/cpthazama/l4d2/common/cim_faceplate.mdl")
	mask:SetLocalPos(self:GetPos())
	mask:SetOwner(self)
	mask:SetParent(self)
	mask:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	mask:Spawn()
	mask:Activate()
	mask:SetSolid(SOLID_NONE)
	mask:AddEffects(EF_BONEMERGE)
	self.MaskModel = mask
end
---------------------------------------------------------------------------------------------------------------------------------------------
local orgDmgFunc = ENT.OnDamaged
--
function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PostDamage" && !self.Zombie_HazmatBroken then
		self.Zombie_HazmatBroken = true
		VJ.EmitSound(self, sdDeflate, self.PainSoundLevel, math.random(90, 100))
	end
	orgDmgFunc(self, dmginfo, hitgroup, status)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	local mask = self.MaskModel
	if IsValid(mask) then
		mask:SetOwner(corpse)
		mask:SetParent(corpse)
	end
end