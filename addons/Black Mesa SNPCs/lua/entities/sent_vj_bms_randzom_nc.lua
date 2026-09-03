/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Crabless Zombie"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "VJ Base Spawners"
---------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.SingleSpawner = true
ENT.EntitiesToSpawn = {
	{Entities = {
			"npc_vj_bms_zscientist_nc",
			"npc_vj_bms_zsecurity_nc:3",
			"npc_vj_bms_zhecu_nc:4",
			"npc_vj_bms_zscientistto_nc:8",
			"npc_vj_bms_zsecurityto_nc:10",
			"npc_vj_bms_zhecuto_nc:12"
		}
	}
}