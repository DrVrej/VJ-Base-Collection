/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
VJ.AddPlugin("Zombie SNPCs", "NPC")

local spawnCategory = "Zombies"

-- Regular
VJ.AddNPC("Slow Zombie", "npc_vj_zss_slow", spawnCategory)
VJ.AddNPC("Zombie Panic", "npc_vj_zss_panic", spawnCategory)
VJ.AddNPC("Fast Zombie", "npc_vj_zss_fast", spawnCategory)

-- Crabless
VJ.AddNPC("Crabless Zombie", "npc_vj_zss_crabless_slow", spawnCategory)
VJ.AddNPC("Crabless Zombie Torso", "npc_vj_zss_crabless_torso", spawnCategory)
VJ.AddNPC("Crabless Zombine", "npc_vj_zss_crabless_zombine", spawnCategory)
VJ.AddNPC("Crabless Poison Zombie", "npc_vj_zss_crabless_poison", spawnCategory)
VJ.AddNPC("Crabless Fast Zombie", "npc_vj_zss_crabless_fast", spawnCategory)

-- Special
VJ.AddNPC("Burnzie", "npc_vj_zss_burnzie", spawnCategory)
VJ.AddNPC("Draggy", "npc_vj_zss_draggy", spawnCategory)
VJ.AddNPC("Zombie Stalker", "npc_vj_zss_stalker", spawnCategory)
VJ.AddNPC("Zombie Hulk", "npc_vj_zss_hulk", spawnCategory)
VJ.AddNPC("Zombie Boss", "npc_vj_zss_boss", spawnCategory)
VJ.AddNPC("Zombie Mini Boss", "npc_vj_zss_boss_mini", spawnCategory)

-- Spawners
VJ.AddNPC("Random Regular Zombie", "sent_vj_zss_rand_regular", spawnCategory)
VJ.AddNPC("Random Regular Zombie Spawner", "sent_vj_zss_rand_regular_sp", spawnCategory)
VJ.AddNPC("Random Zombie", "sent_vj_zss_rand", spawnCategory)
VJ.AddNPC("Random Zombie Spawner", "sent_vj_zss_rand_sp", spawnCategory)