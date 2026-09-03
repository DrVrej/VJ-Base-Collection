/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Black Mesa SNPCs", "NPC")

local spawnCategory = "Black Mesa"

VJ.AddNPC("Alien Grunt", "npc_vj_bms_aliengrunt", spawnCategory)
VJ.AddNPC("BullSquid", "npc_vj_bms_bullsquid", spawnCategory)
VJ.AddNPC("Houndeye", "npc_vj_bms_houndeye", spawnCategory)
VJ.AddNPC("Snark", "npc_vj_bms_snark", spawnCategory)
VJ.AddNPC("Snark Nest", "sent_vj_bms_snarknest", spawnCategory)

-- Zombies
VJ.AddNPC("Zombie Marine", "npc_vj_bms_zhecu", spawnCategory)
VJ.AddNPC("Zombie Marine Torso", "npc_vj_bms_zhecuto", spawnCategory)
VJ.AddNPC("Crabless Zombie Marine", "npc_vj_bms_zhecu_nc", spawnCategory)
VJ.AddNPC("Crabless Zombie Marine Torso", "npc_vj_bms_zhecuto_nc", spawnCategory)

VJ.AddNPC("Zombie Guard", "npc_vj_bms_zsecurity", spawnCategory)
VJ.AddNPC("Zombie Guard Torso", "npc_vj_bms_zsecurityto", spawnCategory)
VJ.AddNPC("Crabless Zombie Guard", "npc_vj_bms_zsecurity_nc", spawnCategory)
VJ.AddNPC("Crabless Zombie Guard Torso", "npc_vj_bms_zsecurityto_nc", spawnCategory)

VJ.AddNPC("Zombie Scientist", "npc_vj_bms_zscientist", spawnCategory)
VJ.AddNPC("Zombie Scientist Torso", "npc_vj_bms_zscientistto", spawnCategory)
VJ.AddNPC("Crabless Zombie Scientist", "npc_vj_bms_zscientist_nc", spawnCategory)
VJ.AddNPC("Crabless Zombie Scientist Torso", "npc_vj_bms_zscientistto_nc", spawnCategory)

-- Humans
VJ.AddNPC_HUMAN("HECU Marine", "npc_vj_bms_hecugrunt", {"weapon_vj_bms_mp5", "weapon_vj_bms_mp5", "weapon_vj_bms_mp5", "weapon_vj_bms_spas12"}, spawnCategory)
VJ.AddNPC("HECU Ground Turret", "npc_vj_bms_hecuturret", spawnCategory)
VJ.AddNPC_HUMAN("Black Ops Assassin", "npc_vj_bms_assassin", {"weapon_vj_glock17"}, spawnCategory)
VJ.AddNPC_HUMAN("Security Guard", "npc_vj_bms_security", {"weapon_vj_glock17"}, spawnCategory)
VJ.AddNPC("Male Scientist", "npc_vj_bms_scientist", spawnCategory)
VJ.AddNPC("Female Scientist", "npc_vj_bms_scientistf", spawnCategory)

-- Spawners
VJ.AddNPC("Random Zombie", "sent_vj_bms_randzom", spawnCategory)
VJ.AddNPC("Random Crabless Zombie", "sent_vj_bms_randzom_nc", spawnCategory)
VJ.AddNPC("Random Scientist", "sent_vj_bms_randsci", spawnCategory)

-- Weapons
VJ.AddNPCWeapon("VJ_BMS_MP5",  "weapon_vj_bms_mp5",  spawnCategory)
VJ.AddNPCWeapon("VJ_BMS_SPAS-12",  "weapon_vj_bms_spas12",  spawnCategory)

-- Precache Models --
util.PrecacheModel("models/gibs/agrunt/gib_back_armor.mdl")
util.PrecacheModel("models/gibs/agrunt/gib_helmet.mdl")
util.PrecacheModel("models/gibs/agrunt/gib_shoulder_armor.mdl")
util.PrecacheModel("models/gibs/agrunt/left_arm_lower.mdl")
util.PrecacheModel("models/gibs/agrunt/right_leg.mdl")
util.PrecacheModel("models/gibs/agrunt/torso.mdl")
util.PrecacheModel("models/gibs/bullsquid/head.mdl")
util.PrecacheModel("models/gibs/bullsquid/left_leg.mdl")
util.PrecacheModel("models/gibs/bullsquid/right_leg.mdl")
util.PrecacheModel("models/gibs/bullsquid/tail.mdl")
util.PrecacheModel("models/gibs/bullsquid/torso.mdl")
util.PrecacheModel("models/gibs/houndeye/back_leg.mdl")
util.PrecacheModel("models/gibs/houndeye/left_leg.mdl")
util.PrecacheModel("models/gibs/houndeye/right_leg_lower.mdl")
util.PrecacheModel("models/gibs/houndeye/right_leg_upper.mdl")
util.PrecacheModel("models/gibs/houndeye/torso.mdl")
util.PrecacheModel("models/gibs/humans/fem_sci/torso.mdl")
util.PrecacheModel("models/gibs/humans/guard/left_arm.mdl")
util.PrecacheModel("models/gibs/humans/guard/right_arm.mdl")
util.PrecacheModel("models/gibs/humans/guard/right_leg.mdl")
util.PrecacheModel("models/gibs/humans/guard/torso.mdl")
util.PrecacheModel("models/gibs/humans/marines/left_arm.mdl")
util.PrecacheModel("models/gibs/humans/marines/left_leg.mdl")
util.PrecacheModel("models/gibs/humans/marines/legs.mdl")
util.PrecacheModel("models/gibs/humans/marines/right_arm.mdl")
util.PrecacheModel("models/gibs/humans/marines/right_leg.mdl")
util.PrecacheModel("models/gibs/humans/marines/torso.mdl")
util.PrecacheModel("models/gibs/humans/marines/right_leg.mdl")
util.PrecacheModel("models/gibs/humans/scientists/left_arm.mdl")
util.PrecacheModel("models/gibs/humans/scientists/left_leg.mdl")
util.PrecacheModel("models/gibs/humans/scientists/right_arm.mdl")
util.PrecacheModel("models/gibs/humans/scientists/torso.mdl")
util.PrecacheModel("models/gibs/humans/scientists/right_leg.mdl")
util.PrecacheModel("models/gibs/zombies/zombie_guard/legs.mdl")
util.PrecacheModel("models/gibs/zombies/zombie_sci/left_arm.mdl")
util.PrecacheModel("models/gibs/zombies/zombie_sci/legs.mdl")
util.PrecacheModel("models/gibs/zombies/zombie_sci/right_arm.mdl")
util.PrecacheModel("models/gibs/zombies/zombie_sci/torso.mdl")

-- ConVars --
VJ.AddConVar("vj_bms_snarkexplode", 1, FCVAR_ARCHIVE) -- Snark explodes?
VJ.AddConVar("vj_bms_snarkexplodetime", 1, FCVAR_ARCHIVE) -- Snark explode time
VJ.AddConVar("vj_bms_bullsquid_gib", 1, FCVAR_ARCHIVE) -- Enable Bullsquid gibs?
VJ.AddConVar("vj_bms_blackopsassassin_cloak", 1, FCVAR_ARCHIVE) -- Enable Bullsquid gibs?

-- Menu --
if CLIENT then
	local function VJ_BMSMENU_MAIN(panel)
		if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
			panel:Help("#vjbase.menu.general.admin.not")
			panel:Help("#vjbase.menu.general.admin.only")
			return
		end
		panel:Help("#vjbase.menu.general.admin.only")
		panel:AddControl("Button", {Text = "Reset Everything", Command = "vj_bms_snarkexplode 1\n vj_bms_snarkexplodetime 15\n vj_bms_bullsquid_gib 1\n vj_bms_blackopsassassin_cloak 1"})
		panel:CheckBox("Snark Explodes?", "vj_bms_snarkexplode")
		panel:ControlHelp("Should Snark explode after its time expires?")
		panel:NumSlider("Time Until Snark Explodes", "vj_bms_snarkexplodetime", 0, 300, 0)
		panel:ControlHelp("Total of 300 seconds (5 Minutes)")
		panel:CheckBox("Enable Bullsquid Gibs?", "vj_bms_bullsquid_gib")
		panel:ControlHelp("Disable this if you are experiencing crashes when Bullsquid gibs")
		panel:CheckBox("Can Black Ops Assassin Cloak?", "vj_bms_blackopsassassin_cloak")
	end
	hook.Add( "PopulateToolMenu", "VJ_ADDTOMENU_BMS", function()
		spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Black Mesa", "Black Mesa", "", "", VJ_BMSMENU_MAIN)
	end)
end