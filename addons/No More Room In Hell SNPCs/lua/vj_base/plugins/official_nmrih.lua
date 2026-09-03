/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("No More Room In Hell SNPCs", "NPC")

local spawnCategory = "No More Room In Hell"

-- Running
VJ.AddNPC("Male Runner", "npc_vj_nmrih_run_male", spawnCategory)
VJ.AddNPC("Female Runner", "npc_vj_nmrih_run_female", spawnCategory)
VJ.AddNPC("National Guard Runnerd", "npc_vj_nmrih_run_guard", spawnCategory)
VJ.AddNPC("Random Runner", "sent_vj_nmrih_run_rand", spawnCategory)
VJ.AddNPC("Random Runner Spawner", "sent_vj_nmrih_run_randsp", spawnCategory)

-- Walking
VJ.AddNPC("Male Shambler", "npc_vj_nmrih_sham_male", spawnCategory)
VJ.AddNPC("Female Shambler", "npc_vj_nmrih_sham_female", spawnCategory)
VJ.AddNPC("National Guard Shambler", "npc_vj_nmrih_sham_guard", spawnCategory)
VJ.AddNPC("Random Shambler", "sent_vj_nmrih_sham_rand", spawnCategory)
VJ.AddNPC("Random Shambler Spawner", "sent_vj_nmrih_sham_randsp", spawnCategory)

-- Misc
VJ.AddNPC("Child Zombie", "npc_vj_nmrih_child", spawnCategory)
VJ.AddNPC("Random Zombie", "sent_vj_nmrih_rand", spawnCategory)
VJ.AddNPC("Random Zombie Spawner", "sent_vj_nmrih_randsp", spawnCategory)

-- Particles --
VJ.AddParticle("particles/vj_nmrih_blood.pcf", {
	"vj_nmrih_blood_drain",
	"vj_nmrih_blood_drain_big",
	"vj_nmrih_blood_drain_short",
	"vj_nmrih_blood_trails",
})