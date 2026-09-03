/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Beta Drone Spawner"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "Alien Swarm"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

local entsList = {"npc_vj_as_droneb", "npc_vj_as_droneb_big:4", "npc_vj_as_droneb_elite:8", "npc_vj_as_droneb_big_elite:10"}
ENT.EntitiesToSpawn = {
	{SpawnPosition = Vector(0, 0, 0), Entities = entsList},
	{SpawnPosition = Vector(75, 75, 0), Entities = entsList},
	{SpawnPosition = Vector(75, -75, 0), Entities = entsList},
	{SpawnPosition = Vector(-75, 75, 0), Entities = entsList},
	{SpawnPosition = Vector(-75, -75, 0), Entities = entsList},
}