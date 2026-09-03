/*--------------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "obj_vj_spawner_base"
ENT.Type 			= "anim"
ENT.PrintName 		= "Random Common Infected"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "Left 4 Dead"
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.SingleSpawner = true
ENT.EntitiesToSpawn = {
	{Entities = {
			"npc_vj_l4d_com_male",
			"npc_vj_l4d_com_female",
			"npc_vj_l4d_com_f_nurse:10",
			"npc_vj_l4d_com_m_hospital:10",
			"npc_vj_l4d_com_m_airport:10",
			"npc_vj_l4d_com_m_police:10",
			"npc_vj_l4d_com_m_soldier:10",
			"npc_vj_l4d_com_m_worker:13",
			"npc_vj_l4d_com_m_mudmen:13",
			"npc_vj_l4d_com_m_ceda:15",
			"npc_vj_l4d_com_m_fallsur:15",
			"npc_vj_l4d_com_m_clown:25",
			"npc_vj_l4d_com_m_riot:20",
			"npc_vj_l4d_com_m_jimmy:150"
		}
	}
}