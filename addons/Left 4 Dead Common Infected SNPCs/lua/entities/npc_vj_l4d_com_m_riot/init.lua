include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_riot.mdl"
ENT.StartHealth = 250
ENT.CanGib = false

ENT.SoundTbl_FootStep = {"vj_l4d_com/footstep/riot/tile1.wav", "vj_l4d_com/footstep/riot/tile2.wav", "vj_l4d_com/footstep/riot/tile3.wav", "vj_l4d_com/footstep/riot/tile4.wav"}

-- Custom
ENT.ZombieRiot_MaskHP = 80
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_OnInit()
	self:SetBodygroup(1, math.random(0, 3))
	
	local mask = ents.Create("prop_vj_animatable")
	mask:SetModel("models/cpthazama/l4d2/common/cim_riot_faceplate.mdl")
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
	if status == "PreDamage" then
		-- Break the mask if it takes too much damage
		if hitgroup == HITGROUP_HEAD && IsValid(self.MaskModel) then
			self.ZombieRiot_MaskHP = self.ZombieRiot_MaskHP - dmginfo:GetDamage()
			if self.ZombieRiot_MaskHP <= 0 then -- Mask broke!
				self.MaskModel:Remove()
				VJ.EmitSound(self, "physics/glass/glass_impact_bullet" .. math.random(1, 4) .. ".wav", 80)
			end
		end
		
		-- Only take FULL damage from the back side otherwise only 25%
		if hitgroup != 20 then
			dmginfo:ScaleDamage(0.25)
		end
		
		//local spark = EffectData()
		//spark:SetOrigin(dmginfo:GetDamagePosition())
		//spark:SetAngles(dmginfo:GetDamagePosition():Angle())
		//spark:SetScale(0.1)
		//util.Effect("StunstickImpact", spark)
		if self.HasSounds && self.HasImpactSounds then VJ.EmitSound(self, "VJ.Impact.Armor") end
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
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	-- If no corpse spawned, make sure to remove the mask!
	if !IsValid(self.Corpse) && IsValid(self.MaskModel) then
		self.MaskModel:Remove()
	end
end