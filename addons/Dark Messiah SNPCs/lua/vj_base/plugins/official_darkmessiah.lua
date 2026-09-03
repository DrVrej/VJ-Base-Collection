/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Dark Messiah SNPCs", "NPC")

local spawnCategory = "Dark Messiah"

VJ.AddNPC("Spider Queen", "npc_vj_dm_spider_queen", spawnCategory)
VJ.AddNPC("Spider", "npc_vj_dm_spider", spawnCategory)
VJ.AddNPC("Giant Worm", "npc_vj_dm_giant_worm", spawnCategory)
VJ.AddNPC("Facehugger", "npc_vj_dm_facehugger", spawnCategory)

-- ConVars --
VJ.AddConVar("vj_dm_nobabyspawn", 1, FCVAR_ARCHIVE)
VJ.AddConVar("vj_dm_nextbaby", 40, FCVAR_ARCHIVE)
VJ.AddConVar("vj_dm_babyspawnlimit", 9, FCVAR_ARCHIVE)

-- Menu --
if CLIENT then
	hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_DM", function()
		spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Dark Messiah", "Dark Messiah", "", "", function(panel)
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				panel:Help("#vjbase.menu.general.admin.not")
				panel:Help("#vjbase.menu.general.admin.only")
				return
			end
			panel:Help("#vjbase.menu.general.admin.only")
			panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "vj_dm_nobabyspawn 1\n vj_dm_nextbaby 40\n vj_dm_babyspawnlimit 9"})
			panel:CheckBox("Spider Queen Spawns Baby Spiders", "vj_dm_nobabyspawn")
			panel:NumSlider("Baby Spider Limit", "vj_dm_babyspawnlimit", 3, 99, 0)
			panel:ControlHelp("How many baby spiders are allowed per queen")
			panel:ControlHelp("Rounded to the nearest OR lowest multiple of 3!")
			panel:NumSlider("Next Baby Spider Spawn", "vj_dm_nextbaby", 0, 300, 0)
			panel:ControlHelp("How much time until Spider Queen can spawn Spiders again?")
			panel:ControlHelp("Total of 300 seconds (5 Minutes)")
		end)
	end)
end