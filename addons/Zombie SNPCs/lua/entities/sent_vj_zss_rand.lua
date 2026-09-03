/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Zombie"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "VJ Base Spawners"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.SingleSpawner = true
ENT.EntitiesToSpawn = {
	{Entities = {"npc_vj_zss_slow", "npc_vj_zss_panic:4", "npc_vj_zss_fast:8", "npc_vj_zss_crabless_fast:10", "npc_vj_zss_burnzie:10", "npc_vj_zss_crabless_poison:10", "npc_vj_zss_crabless_slow:10", "npc_vj_zss_crabless_torso:10", "npc_vj_zss_draggy:10", "npc_vj_zss_crabless_zombine:10", "npc_vj_zss_stalker:10", "npc_vj_zss_hulk:12", "npc_vj_zss_boss_mini:12", "npc_vj_zss_boss:18"}},
}