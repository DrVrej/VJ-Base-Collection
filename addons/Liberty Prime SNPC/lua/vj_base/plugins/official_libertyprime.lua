/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Liberty Prime SNPC", "NPC")

-- Support for Cpt. Hazama's Fallout pack
local vCat = "Fallout"
	
VJ.AddNPC("Liberty Prime", "npc_vj_fo3bhs_libertyprime", vCat)
VJ.AddNPC("Liberty Prime (Hostile)", "npc_vj_fo3ene_libertyprime", vCat)

-- Particles --
VJ.AddParticle("particles/vj_mininuke.pcf", {
	"vj_mininuke_explosion_fix",
	"mininuke_explosion",
	"mininuke_explosion_generic_smokestreak_parent",
	"mininuke_explosion_child_firesmoke",
	"mininuke_explosion_child_flash",
	"mininuke_explosion_child_flash_mod",
	"mininuke_explosion_child_shrapnel",
	"mininuke_explosion_child_smoke",
	"mininuke_explosion_child_sparks",
	"mininuke_explosion_child_sparks2",
	"mininuke_explosion_shrapnel_fire_child",
	"mininuke_explosion_shrapnel_smoke_child",
})