/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Alien Swarm SNPCs", "NPC")

local spawnCategory = "Alien Swarm"

VJ.AddNPC("Buzzer", "npc_vj_as_buzzer", spawnCategory)
VJ.AddNPC("Drone", "npc_vj_as_drone", spawnCategory)
VJ.AddNPC("Shieldbug", "npc_vj_as_sbug", spawnCategory)
VJ.AddNPC("Beta Drone", "npc_vj_as_droneb", spawnCategory)
VJ.AddNPC("Beta Drone Elite", "npc_vj_as_droneb_elite", spawnCategory)
VJ.AddNPC("Large Beta Drone", "npc_vj_as_droneb_big", spawnCategory)
VJ.AddNPC("Large Beta Drone Elite", "npc_vj_as_droneb_big_elite", spawnCategory)
VJ.AddNPC("Boomer", "npc_vj_as_boomer", spawnCategory)
VJ.AddNPC("Beta Shieldbug", "npc_vj_as_sbugb", spawnCategory)
VJ.AddNPC("Beta Queen", "npc_vj_as_queenb", spawnCategory)

VJ.AddNPC("Drone Spawner", "sent_vj_as_dronesp", spawnCategory)
VJ.AddNPC("Random Beta Drone", "sent_vj_as_droneb", spawnCategory)
VJ.AddNPC("Random Beta Drone Spawner", "sent_vj_as_dronebsp", spawnCategory)

-- Precache Models --
util.PrecacheModel("models/aliens/boomer/boomerleg.mdl")
util.PrecacheModel("models/aliens/boomer/boomerlega.mdl")
util.PrecacheModel("models/aliens/boomer/boomerlegb.mdl")
util.PrecacheModel("models/aliens/boomer/boomerlegc.mdl")
util.PrecacheModel("models/aliens/boomer/boomerparts_lower_leg.mdl")
util.PrecacheModel("models/aliens/boomer/boomerparts_upper_leg.mdl")