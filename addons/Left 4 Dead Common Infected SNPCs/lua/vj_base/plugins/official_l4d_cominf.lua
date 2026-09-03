/*--------------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Left 4 Dead Common Infected SNPCs", "NPC")

local spawnCategory = "Left 4 Dead"

-- Male
VJ.AddNPC("Male Infected", "npc_vj_l4d_com_male", spawnCategory)
VJ.AddNPC("Soldier Infected", "npc_vj_l4d_com_m_soldier", spawnCategory)
VJ.AddNPC("Police Infected", "npc_vj_l4d_com_m_police", spawnCategory)
VJ.AddNPC("Hospital Infected", "npc_vj_l4d_com_m_hospital", spawnCategory)
VJ.AddNPC("Airport Infected", "npc_vj_l4d_com_m_airport", spawnCategory)
	-- Uncommon
	VJ.AddNPC("CEDA Worker Infected", "npc_vj_l4d_com_m_ceda", spawnCategory)
	VJ.AddNPC("Jimmy Gibbs Junior", "npc_vj_l4d_com_m_jimmy", spawnCategory)
	VJ.AddNPC("Fallen Survivor Infected", "npc_vj_l4d_com_m_fallsur", spawnCategory)
	VJ.AddNPC("Clown Infected", "npc_vj_l4d_com_m_clown", spawnCategory)
	VJ.AddNPC("Mud Man Infected", "npc_vj_l4d_com_m_mudmen", spawnCategory)
	VJ.AddNPC("Worker Infected", "npc_vj_l4d_com_m_worker", spawnCategory)
	VJ.AddNPC("Riot Infected", "npc_vj_l4d_com_m_riot", spawnCategory)

-- Female
VJ.AddNPC("Female Infected", "npc_vj_l4d_com_female", spawnCategory)
VJ.AddNPC("Nurse Infected", "npc_vj_l4d_com_f_nurse", spawnCategory)

-- Spawners
VJ.AddNPC("Random Common Infected", "sent_vj_l4d_cominf", spawnCategory)
VJ.AddNPC("Random Common Infected Spawner", "sent_vj_l4d_cominf_sp", spawnCategory)
VJ.AddNPC("AI Director", "sent_vj_l4d_director", spawnCategory, true)

-- Entities
VJ.AddEntity("Pipe Bomb", "obj_vj_l4d_pipebomb", "DrVrej", false, 0, true, "VJ Base")

-- Weapons
VJ.AddNPCWeapon("VJ_L4D_Pipe_Bomb", "weapon_vj_l4d_pipebomb")
VJ.AddWeapon("Pipe Bomb", "weapon_vj_l4d_pipebomb", true, spawnCategory)

game.AddAmmoType({name = "pipebomb", dmgtype = DMG_BLAST})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Entity Tags ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
--[[
ent.IsVJL4DCommonInfected

ent.VJ_L4D_IsClown
ent.VJ_L4D_IsJimmy
ent.VJ_L4D_IsRiot
ent.VJ_L4D_IsCEDA
ent.VJ_L4D_IsMudMen
]]--

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Decals ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
game.AddDecal("VJ_L4D_Blood", {"vj_l4d/decals/blood1", "vj_l4d/decals/blood2", "vj_l4d/decals/blood3", "vj_l4d/decals/blood4", "vj_l4d/decals/blood5", "vj_l4d/decals/blood6", "vj_l4d/decals/blood7", "vj_l4d/decals/blood8"})
game.AddDecal("VJ_L4D_Puke", {"vj_l4d/decals/puke1", "vj_l4d/decals/puke2"})

-- Add to the paint tool
list.Add("PaintMaterials", "VJ_L4D_Blood")
list.Add("PaintMaterials", "VJ_L4D_Puke")

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Particles ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
VJ.AddParticle("particles/vj_l4d_common.pcf", {
	//"vj_l4d_balloon",
	//"vj_l4d_balloon_body",
	//"vj_l4d_balloon_string",
	"vj_l4d_blood_spray_clown",
	//"vj_l4d_door_attack_dust",
	//"vj_l4d_door_hit_metal",
	//"vj_l4d_door_hit_metal_b",
	//"vj_l4d_door_hit_wood",
	//"vj_l4d_door_slash_metal",
	//"vj_l4d_door_slash_wood",
	"vj_l4d_drool",
	"vj_l4d_froth",
	"vj_l4d_froth2",
	//"vj_l4d_froth_b",
	//"vj_l4d_froth_c",
	//"vj_l4d_froth_d",
	//"vj_l4d_mudman_hit_right",
	"vj_l4d_vomit",
	//"vj_l4d_vomit_refract",
	//"vj_l4d_vomit_stream",
})

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Precaches ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
util.PrecacheModel("models/cpthazama/l4d1/anim_common.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_male_pilot.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_male_rural01.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_male_suit.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_military_male01.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_patient_male01.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_police_male01.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_surgeon_male01.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_tsaagent_male01.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_female01.mdl")
util.PrecacheModel("models/cpthazama/l4d1/common/common_female_nurse01.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/cim_faceplate.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/cim_riot_faceplate.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/common_male_ceda.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/common_male_clown.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/common_male_fallen_survivor.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/common_male_jimmy.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/common_male_mud.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/common_male_riot.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/common_male_roadcrew.mdl")
util.PrecacheModel("models/cpthazama/l4d2/common/common_male_roadcrew_rain.mdl")

------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------ Convars & Menu ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
VJ.AddConVar("vj_l4d_alllowclimbing", 0, FCVAR_ARCHIVE)

VJ.AddConVar("vj_l4d_director_enabled", 1)
VJ.AddConVar("vj_l4d_director_maxci", 80)
VJ.AddConVar("vj_l4d_director_mobcount", 35)
VJ.AddConVar("vj_l4d_director_spawnmax", 2000)
VJ.AddConVar("vj_l4d_director_spawnmin", 650)
VJ.AddConVar("vj_l4d_director_mobchance", 100)
VJ.AddConVar("vj_l4d_director_mobcooldownmin", 120)
VJ.AddConVar("vj_l4d_director_mobcooldownmax", 180)
VJ.AddConVar("vj_l4d_director_delaymin", 0.85)
VJ.AddConVar("vj_l4d_director_delaymax", 3)
VJ.AddClientConVar("vj_l4d_director_music", 1)
VJ.AddClientConVar("vj_l4d_director_musicvolume", 0.1)

if CLIENT then
	hook.Add("PopulateToolMenu", "VJ_ADDTOMENU_L4D", function()
		spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Left 4 Dead - Director", "Left 4 Dead - Director", "", "", function(panel)
			panel:CheckBox("Enable Music?", "vj_l4d_director_music")
			panel:NumSlider("Music Volume", "vj_l4d_director_musicvolume", 0.1, 0.9, 2)
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				panel:Help("#vjbase.menu.general.admin.not")
				panel:Help("#vjbase.menu.general.admin.only")
				return
			end
			panel:Help("#vjbase.menu.general.admin.only")
			panel:CheckBox("Enable AI Director processing?", "vj_l4d_director_enabled")
			panel:NumSlider("Max Common Infected", "vj_l4d_director_maxci", 5, 400, 2)
			panel:NumSlider("Min Distance they can spawn from players", "vj_l4d_director_spawnmin", 150, 30000, 2)
			panel:NumSlider("Max Distance they can spawn from players", "vj_l4d_director_spawnmax", 150, 30000, 2)
			panel:NumSlider("Min time between spawns", "vj_l4d_director_delaymin", 0.1, 15, 2)
			panel:NumSlider("Max time between spawns", "vj_l4d_director_delaymax", 0.2, 15, 2)
			panel:NumSlider("Max Mob Common Infected", "vj_l4d_director_mobcount", 5, 400, 2)
			panel:NumSlider("Chance that a mob will appear", "vj_l4d_director_mobchance", 1, 500, 2)
			panel:NumSlider("Min cooldown time for mob spawns", "vj_l4d_director_mobcooldownmin", 1, 800, 2)
			panel:NumSlider("Max cooldown time for mob spawns", "vj_l4d_director_mobcooldownmax", 1, 800, 2)
		end)
	
		spawnmenu.AddToolMenuOption("DrVrej", "SNPC Configures", "Left 4 Dead", "Left 4 Dead", "", "", function(panel)
			if !game.SinglePlayer() && !LocalPlayer():IsAdmin() then
				panel:Help("#vjbase.menu.general.admin.not")
				panel:Help("#vjbase.menu.general.admin.only")
				return
			end
			panel:Help("#vjbase.menu.general.admin.only")
			panel:AddControl("Button", {Text = "#vjbase.menu.general.reset.everything", Command = "vj_l4d_alllowclimbing 0"})
			panel:CheckBox("Enable Climbing (Experimental)", "vj_l4d_alllowclimbing")
			panel:ControlHelp("WARNING: Enabling climbing can cause heavy performance drops!")
		end)
	end)
end

VJ_L4D_NODEPOS = {}
hook.Add("EntityRemoved", "VJ_AddNodes_L4D", function(ent)
	if ent:GetClass() == "info_node" then
		table.insert(VJ_L4D_NODEPOS, ent:GetPos())
	end
end)