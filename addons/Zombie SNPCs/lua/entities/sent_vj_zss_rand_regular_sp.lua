/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Regular Zombie Spawner"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "VJ Base Spawners"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local entsList = {"npc_vj_zss_slow", "npc_vj_zss_fast:4", "npc_vj_zss_panic:3"}
ENT.EntitiesToSpawn = {
	{SpawnPosition = Vector(0, 0, 0), Entities = entsList},
	{SpawnPosition = Vector(50, 50, 0), Entities = entsList},
	{SpawnPosition = Vector(50, -50, 0), Entities = entsList},
	{SpawnPosition = Vector(-50, 50, 0), Entities = entsList},
	{SpawnPosition = Vector(-50, -50, 0), Entities = entsList},
}