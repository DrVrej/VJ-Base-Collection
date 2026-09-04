/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("MLG SNPCs", "NPC")

local category = "Sample Text"

VJ.AddNPC_HUMAN("Sample Text", "npc_vj_sampletext", {"weapon_vj_mlg"}, category, true)

VJ.AddNPCWeapon("VJ_MLGGUN", "weapon_vj_mlg", category)
VJ.AddWeapon("MLG TACTICAL GUN", "weapon_vj_mlg" ,true, category)

-- Particles
game.AddParticles("particles/mlg.pcf")