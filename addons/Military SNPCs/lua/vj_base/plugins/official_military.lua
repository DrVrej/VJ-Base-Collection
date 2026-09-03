/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Military SNPCs", "NPC")

local spawnCategory = "Military"

-- Enemy
	-- United States of America
	VJ.AddNPC_HUMAN("U.S. Marine (Enemy)", "npc_vj_mili_marine", {"weapon_vj_m16a1"}, spawnCategory)
	VJ.AddNPC_HUMAN("U.S. Ranger (Enemy)", "npc_vj_mili_ranger", {"weapon_vj_m16a1", "weapon_vj_m16a1", "weapon_vj_m16a1", "weapon_vj_spas12"}, spawnCategory)
	VJ.AddNPC_HUMAN("U.S. Airborne (Enemy)", "npc_vj_mili_airborne", {"weapon_vj_us_thompson", "weapon_vj_us_m1garand", "weapon_vj_us_m1garand", "weapon_vj_us_m1garand"}, spawnCategory)
	VJ.AddNPC("M1 Abrams Woodland (Enemy)", "npc_vj_mili_m1a1abrams", spawnCategory)
	VJ.AddNPC("M1 Abrams Desert (Enemy)", "npc_vj_mili_m1a1abramsdes", spawnCategory)
	VJ.AddNPC("M2 Browning Emplacement (Enemy)", "npc_vj_mili_emp_m2b", spawnCategory)
	-- Germany
	VJ.AddNPC_HUMAN("Wehrmacht Infantry (Enemy)", "npc_vj_mili_wehrmacht", {"weapon_vj_mp40", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k"}, spawnCategory)
	VJ.AddNPC_HUMAN("German Infantry (Enemy)", "npc_vj_mili_german", {"weapon_vj_mp40", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k"}, spawnCategory)
	VJ.AddNPC_HUMAN("Panzergrenadier (Enemy)", "npc_vj_mili_pzgrenadier", {"weapon_vj_mp40", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k"}, spawnCategory)
	VJ.AddNPC_HUMAN("Waffen-SS (Enemy)", "npc_vj_mili_waffenss", {"weapon_vj_mp40"}, spawnCategory)
	VJ.AddNPC("Tiger (Enemy)", "npc_vj_mili_tiger_red", spawnCategory)
	VJ.AddNPC("MG 42 Emplacement (Enemy)", "npc_vj_mili_emp_mg42", spawnCategory)
	-- Soviet
	VJ.AddNPC_HUMAN("Soviet Infantry (Enemy)", "npc_vj_mili_soviet", {"weapon_vj_sov_mosinnagant", "weapon_vj_sov_mosinnagant", "weapon_vj_sov_mosinnagant", "weapon_vj_sov_ppsh41"}, spawnCategory)
	VJ.AddNPC_HUMAN("Soviet Spetsnaz (Enemy)", "npc_vj_mili_soviet_spetsnaz", {"weapon_vj_ak47", "weapon_vj_sov_ppsh41"}, spawnCategory)
	VJ.AddNPC("Soviet T-72 (Enemy)", "npc_vj_mili_t72_soviet", spawnCategory)
	-- Insurgents
	VJ.AddNPC_HUMAN("Terrorist (Enemy)", "npc_vj_mili_terrorist", {"weapon_vj_rpg", "weapon_vj_rpg", "weapon_vj_ak47", "weapon_vj_ak47", "weapon_vj_ak47", "weapon_vj_mp40", "weapon_vj_mp40", "weapon_vj_mp40", "weapon_vj_smg1", "weapon_vj_smg1", "weapon_vj_smg1", "weapon_vj_spas12", "weapon_vj_spas12", "weapon_vj_spas12"}, spawnCategory)
	VJ.AddNPC("ChicLeet (Enemy)", "npc_vj_mili_chicleet", spawnCategory)
	VJ.AddNPC("Terrorist T-72 (Enemy)", "npc_vj_mili_t72_terrorist", spawnCategory)
	VJ.AddNPC("Terrorism (Enemy)", "sent_vj_mili_terrorism", spawnCategory)
	
-- Friendly
	-- United States of America
	VJ.AddNPC_HUMAN("U.S. Marine (Friendly)", "npc_vj_milifri_marine", {"weapon_vj_m16a1"}, spawnCategory)
	VJ.AddNPC_HUMAN("U.S. Ranger (Friendly)", "npc_vj_milifri_ranger", {"weapon_vj_m16a1", "weapon_vj_m16a1", "weapon_vj_m16a1", "weapon_vj_spas12"}, spawnCategory)
	VJ.AddNPC_HUMAN("U.S. Airborne (Friendly)", "npc_vj_milifri_airborne", {"weapon_vj_us_thompson", "weapon_vj_us_m1garand", "weapon_vj_us_m1garand", "weapon_vj_us_m1garand"}, spawnCategory)
	VJ.AddNPC("M1 Abrams Woodland (Friendly)", "npc_vj_milifri_m1a1abrams", spawnCategory)
	VJ.AddNPC("M1 Abrams Desert (Friendly)", "npc_vj_milifri_m1a1abramsdes", spawnCategory)
	VJ.AddNPC("M2 Browning Emplacement (Friendly)", "npc_vj_milifri_emp_m2b", spawnCategory)
	-- Germany
	VJ.AddNPC_HUMAN("Wehrmacht Infantry (Friendly)", "npc_vj_milifri_wehrmacht", {"weapon_vj_mp40", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k"}, spawnCategory)
	VJ.AddNPC_HUMAN("German Infantry (Friendly)", "npc_vj_milifri_german", {"weapon_vj_mp40", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k"}, spawnCategory)
	VJ.AddNPC_HUMAN("Panzergrenadier (Friendly)", "npc_vj_milifri_pzgrenadier", {"weapon_vj_mp40", "weapon_vj_nz_karabiner98k", "weapon_vj_nz_karabiner98k"}, spawnCategory)
	VJ.AddNPC_HUMAN("Waffen-SS (Friendly)", "npc_vj_milifri_waffenss", {"weapon_vj_mp40", "weapon_vj_nz_karabiner98k"}, spawnCategory)
	VJ.AddNPC("Tiger (Friendly)", "npc_vj_milifri_tiger_red", spawnCategory)
	VJ.AddNPC("MG 42 Emplacement (Friendly)", "npc_vj_milifri_emp_mg42", spawnCategory)
	-- Soviet
	VJ.AddNPC_HUMAN("Soviet Infantry (Friendly)", "npc_vj_milifri_soviet", {"weapon_vj_sov_mosinnagant", "weapon_vj_sov_mosinnagant", "weapon_vj_sov_mosinnagant", "weapon_vj_sov_ppsh41"}, spawnCategory)
	VJ.AddNPC_HUMAN("Soviet Spetsnaz (Friendly)", "npc_vj_milifri_soviet_spetsnaz", {"weapon_vj_ak47", "weapon_vj_sov_ppsh41"}, spawnCategory)
	VJ.AddNPC("Soviet T-72 (Friendly)", "npc_vj_milifri_t72_soviet", spawnCategory)
	-- Insurgents
	VJ.AddNPC_HUMAN("Terrorist (Friendly)", "npc_vj_milifri_terrorist", {"weapon_vj_rpg", "weapon_vj_rpg", "weapon_vj_ak47", "weapon_vj_ak47", "weapon_vj_ak47", "weapon_vj_mp40", "weapon_vj_mp40", "weapon_vj_mp40", "weapon_vj_smg1", "weapon_vj_smg1", "weapon_vj_smg1", "weapon_vj_spas12", "weapon_vj_spas12", "weapon_vj_spas12"}, spawnCategory)
	VJ.AddNPC("ChicLeet (Friendly)", "npc_vj_milifri_chicleet", spawnCategory)
	VJ.AddNPC("Terrorist T-72 (Friendly)", "npc_vj_milifri_t72_terrorist", spawnCategory)
	VJ.AddNPC("Terrorism (Friendly)", "sent_vj_milifri_terrorism", spawnCategory)

-- Weapons
VJ.AddNPCWeapon("VJ_US_Thompson", "weapon_vj_us_thompson")
VJ.AddNPCWeapon("VJ_US_M1 Garand", "weapon_vj_us_m1garand")
VJ.AddNPCWeapon("VJ_NZ_Karabiner 98k", "weapon_vj_nz_karabiner98k")
VJ.AddNPCWeapon("VJ_Sov_Mosin-Nagant", "weapon_vj_sov_mosinnagant")
VJ.AddNPCWeapon("VJ_Sov_PSSh-41", "weapon_vj_sov_ppsh41")

-- Particles --
VJ.AddParticle("particles/vj_military_fx.pcf", {
	"vj_military_muzzle_bar",
	"vj_military_muzzle_bar_core1",
	"vj_military_muzzle_bar_core2",
	"vj_military_muzzle_bar_flame",
	"vj_military_muzzle_garand",
	"vj_military_muzzle_garand_core1",
	"vj_military_muzzle_garand_core2",
	"vj_military_muzzle_garand_flame",
	"vj_military_muzzle_smoke",
	"vj_military_muzzle_spark1",
	"vj_military_muzzle_spark2",
})

-- Precache Models --
util.PrecacheModel("models/VJ_HGRUNT/hgrunt1.mdl")
util.PrecacheModel("models/VJ_HGRUNT/hgrunt2.mdl")
util.PrecacheModel("models/VJ_HGRUNT/hgrunt3.mdl")
util.PrecacheModel("models/VJ_HGRUNT/hgrunt4.mdl")
util.PrecacheModel("models/VJ_HGRUNT/hgrunt5.mdl")
util.PrecacheModel("models/VJ_UNITEDSTATES/airbrone1.mdl")
util.PrecacheModel("models/VJ_UNITEDSTATES/airbrone2.mdl")
util.PrecacheModel("models/VJ_UNITEDSTATES/airbrone3.mdl")
util.PrecacheModel("models/VJ_UNITEDSTATES/airbrone4.mdl")
util.PrecacheModel("models/VJ_UNITEDSTATES/airbrone5.mdl")
util.PrecacheModel("models/VJ_UNITEDSTATES/airbrone6.mdl")
util.PrecacheModel("models/VJ_UNITEDSTATES/airbrone7.mdl")
util.PrecacheModel("models/VJ_UNITEDSTATES/airbrone8.mdl")
util.PrecacheModel("models/VJ_UNITEDSTATES/airbrone9.mdl")

util.PrecacheModel("models/VJ_DODGERMANS/german_soldier1.mdl")
util.PrecacheModel("models/VJ_DODGERMANS/german_soldier2.mdl")
util.PrecacheModel("models/VJ_DODGERMANS/german_soldier3.mdl")
util.PrecacheModel("models/VJ_DODGERMANS/german_soldier4.mdl")
util.PrecacheModel("models/VJ_DODGERMANS/german_soldier5.mdl")
util.PrecacheModel("models/VJ_DODGERMANS/german_soldier6.mdl")
util.PrecacheModel("models/VJ_WAFFEN/german_soldier1.mdl")
util.PrecacheModel("models/VJ_WAFFEN/german_soldier2.mdl")
util.PrecacheModel("models/VJ_WAFFEN/german_soldier3.mdl")
util.PrecacheModel("models/VJ_WAFFEN/german_soldier4.mdl")
util.PrecacheModel("models/VJ_WAFFEN/german_soldier5.mdl")
util.PrecacheModel("models/VJ_WAFFEN/german_soldier6.mdl")

util.PrecacheModel("models/soviet/soviet_soldier1.mdl")
util.PrecacheModel("models/soviet/soviet_soldier2.mdl")
util.PrecacheModel("models/soviet/soviet_soldier3.mdl")
util.PrecacheModel("models/soviet/soviet_soldier4.mdl")
util.PrecacheModel("models/soviet/soviet_soldier5.mdl")
util.PrecacheModel("models/soviet/soviet_soldier6.mdl")

util.PrecacheModel("models/VJ_Terrorist/2hemagh.mdl")
util.PrecacheModel("models/VJ_Terrorist/2kimasked.mdl")
util.PrecacheModel("models/VJ_Terrorist/3hemagh.mdl")
util.PrecacheModel("models/VJ_Terrorist/shemagh.mdl")
util.PrecacheModel("models/VJ_Terrorist/shemagh_helmet.mdl")
util.PrecacheModel("models/VJ_Terrorist/skimasked.mdl")
util.PrecacheModel("models/VJ_Terrorist/unmasked1.mdl")
util.PrecacheModel("models/VJ_Terrorist/unmasked2.mdl")