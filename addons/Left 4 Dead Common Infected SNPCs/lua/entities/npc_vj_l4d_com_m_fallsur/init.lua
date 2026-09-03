include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_fallen_survivor.mdl"
ENT.StartHealth = 150
ENT.CanGib = false
ENT.DeathLootChance = 1
ENT.DeathLoot = {
    "item_healthvial",
    "item_battery",
    "item_ammo_smg1_grenade",
    "item_ammo_crossbow",
	"weapon_vj_l4d_pipebomb",
}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_OnInit()
	self:SetBodygroup(1, math.random(0, 2))
end
---------------------------------------------------------------------------------------------------------------------------------------------
local orgDmgFunc = ENT.OnDamaged
--
function ENT:OnDamaged(dmginfo, hitgroup, status)
	if status == "PreDamage" && hitgroup == HITGROUP_HEAD then
		dmginfo:ScaleDamage(0.75)
	end
	orgDmgFunc(self, dmginfo, hitgroup, status)
end