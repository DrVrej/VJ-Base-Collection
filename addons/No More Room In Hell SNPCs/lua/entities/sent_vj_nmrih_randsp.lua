/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Zombie Spawner"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "No More Room in Hell"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local entsList = {
	"npc_vj_nmrih_sham_male",
	"npc_vj_nmrih_sham_female:2",
	"npc_vj_nmrih_sham_guard:6",
	"npc_vj_nmrih_run_male:6",
	"npc_vj_nmrih_run_female:7",
	"npc_vj_nmrih_run_guard:9",
	"npc_vj_nmrih_child:9"
}
ENT.EntitiesToSpawn = {
	{SpawnPosition = Vector(0, 0, 0), Entities = entsList},
	{SpawnPosition = Vector(50, 50, 0), Entities = entsList},
	{SpawnPosition = Vector(50, -50, 0), Entities = entsList},
	{SpawnPosition = Vector(-50, 50, 0), Entities = entsList},
	{SpawnPosition = Vector(-50, -50, 0), Entities = entsList},
}