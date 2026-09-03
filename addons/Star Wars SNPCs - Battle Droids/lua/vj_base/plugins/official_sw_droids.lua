/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Star Wars SNPCs - Battle Droids", "NPC")

local vCat = "Star Wars"

-- Droids
VJ.AddNPC_HUMAN("Standard Battle Droid", "npc_vj_swbd_standard", {"weapon_vj_blaster"}, vCat)
VJ.AddNPC_HUMAN("Geonosis Battle Droid", "npc_vj_swbd_genosis", {"weapon_vj_blaster"}, vCat)
VJ.AddNPC_HUMAN("Training Battle Droid", "npc_vj_swbd_training", {"weapon_vj_blaster"}, vCat)
VJ.AddNPC_HUMAN("Commander Battle Droid", "npc_vj_swbd_commander", {"weapon_vj_blaster"}, vCat)
VJ.AddNPC_HUMAN("Tactical Droid", "npc_vj_swbd_tactical", {"weapon_vj_blaster"}, vCat)
VJ.AddNPC_HUMAN("Commando Droid", "npc_vj_swbd_commando", {"weapon_vj_blaster"}, vCat)

-- Precache Models --
util.PrecacheModel("models/hfg/starwars/droids/commandodroid/head.mdl")
util.PrecacheModel("models/hfg/starwars/droids/commandodroid/left_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/commandodroid/left_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/commandodroid/right_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/commandodroid/right_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/commandodroid/torso.mdl")

util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_commander/head.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_commander/left_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_commander/left_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_commander/right_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_commander/right_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_commander/torso.mdl")

util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_geo/head.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_geo/left_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_geo/left_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_geo/right_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_geo/right_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_geo/torso.mdl")

util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_infantry/head.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_infantry/left_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_infantry/left_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_infantry/right_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_infantry/right_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_infantry/torso.mdl")

util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_training/head.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_training/left_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_training/left_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_training/right_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_training/right_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_bdroid_training/torso.mdl")

util.PrecacheModel("models/hfg/starwars/droids/sw_droid_tactical/head.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_droid_tactical/left_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_droid_tactical/left_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_droid_tactical/right_arm.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_droid_tactical/right_leg.mdl")
util.PrecacheModel("models/hfg/starwars/droids/sw_droid_tactical/torso.mdl")