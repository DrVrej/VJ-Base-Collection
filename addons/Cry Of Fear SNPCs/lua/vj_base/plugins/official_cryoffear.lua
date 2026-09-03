/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
VJ.AddPlugin("Cry Of Fear SNPCs", "NPC")

local vCat = "Cry Of Fear"

VJ.AddNPC("Baby", "npc_vj_cof_baby", vCat)
VJ.AddNPC("Child", "npc_vj_cof_child", vCat)
VJ.AddNPC("Citalopram", "npc_vj_cof_citalopram", vCat)
VJ.AddNPC("Crawler", "npc_vj_cof_crawler", vCat)
VJ.AddNPC("Crazy Runner", "npc_vj_cof_crazyrunner", vCat)
VJ.AddNPC("Croucher", "npc_vj_cof_croucher", vCat)
VJ.AddNPC("Faceless 2", "npc_vj_cof_faceless2", vCat)
VJ.AddNPC("Faster", "npc_vj_cof_faster", vCat)
VJ.AddNPC("Krypandenej", "npc_vj_cof_krypandenej", vCat)
VJ.AddNPC("Mace (Boss)", "npc_vj_cof_mace", vCat)
VJ.AddNPC("Phsycho", "npc_vj_cof_phsycho", vCat)
VJ.AddNPC("Saw Crazy", "npc_vj_cof_sawcrazy", vCat)
VJ.AddNPC("Sawer (Boss)", "npc_vj_cof_sawer", vCat)
VJ.AddNPC("Saw Runner (Boss)", "npc_vj_cof_sawrunner", vCat)
VJ.AddNPC("Sewmo", "npc_vj_cof_sewmo", vCat)
VJ.AddNPC("Slower 1", "npc_vj_cof_slower1", vCat)
VJ.AddNPC("Slower 3", "npc_vj_cof_slower3", vCat)
VJ.AddNPC("Slowerno", "npc_vj_cof_slowerno", vCat)
VJ.AddNPC("Slower Stuck", "npc_vj_cof_slowerstuck", vCat)
VJ.AddNPC("Stranger", "npc_vj_cof_stranger", vCat)
VJ.AddNPC("Suicider", "npc_vj_cof_suicider", vCat)
VJ.AddNPC("Taller", "npc_vj_cof_taller", vCat)
VJ.AddNPC("Upper", "npc_vj_cof_upper", vCat)
VJ.AddNPC("Watro", "npc_vj_cof_watro", vCat)
VJ.AddNPC("Random Monster", "sent_vj_cof_allrand", vCat)
VJ.AddNPC("Random Monster Spawner", "sent_vj_cof_allrand_spawner", vCat)

-- ConVars --
VJ.AddConVar("vj_cof_baby_h", 60)
VJ.AddConVar("vj_cof_baby_d", 20)

VJ.AddConVar("vj_cof_child_h", 80)
VJ.AddConVar("vj_cof_child_d_stab", 40)
VJ.AddConVar("vj_cof_child_d_dual", 15)

VJ.AddConVar("vj_cof_citalopram_h", 85)
VJ.AddConVar("vj_cof_citalopram_d", 42)

VJ.AddConVar("vj_cof_crawler_h", 90)
VJ.AddConVar("vj_cof_crawler_d", 45)

VJ.AddConVar("vj_cof_crazyrunner_h", 60)
VJ.AddConVar("vj_cof_crazyrunner_d", 35)

VJ.AddConVar("vj_cof_croucher_h", 60)
VJ.AddConVar("vj_cof_croucher_d", 30)

VJ.AddConVar("vj_cof_faceless2_h", 80)
VJ.AddConVar("vj_cof_faceless2_d", 32)

VJ.AddConVar("vj_cof_faster_h", 100)
VJ.AddConVar("vj_cof_faster_d", 25)
VJ.AddConVar("vj_cof_faster_d_double", 35)
VJ.AddConVar("vj_cof_faster_d_jump", 40)

VJ.AddConVar("vj_cof_krypandenej_h", 120)
VJ.AddConVar("vj_cof_krypandenej_d", 50)

VJ.AddConVar("vj_cof_mace_h", 1000)
VJ.AddConVar("vj_cof_mace_d", 80)

VJ.AddConVar("vj_cof_phsycho_h", 120)
VJ.AddConVar("vj_cof_phsycho_d", 60)

VJ.AddConVar("vj_cof_sawcrazy_h", 230)
VJ.AddConVar("vj_cof_sawcrazy_d", 70)

VJ.AddConVar("vj_cof_sawer_h", 800)
VJ.AddConVar("vj_cof_sawer_d", 85)

VJ.AddConVar("vj_cof_sawrunner_h", 2000)
VJ.AddConVar("vj_cof_sawrunner_d", 100)

VJ.AddConVar("vj_cof_sewmo_h", 300)
VJ.AddConVar("vj_cof_sewmo_d_wired", 40)
VJ.AddConVar("vj_cof_sewmo_d_wirebroken", 62)

VJ.AddConVar("vj_cof_slower1_h", 80)
VJ.AddConVar("vj_cof_slower1_d_reg", 30)
VJ.AddConVar("vj_cof_slower1_d_dual", 19)
VJ.AddConVar("vj_cof_slower1_d_slow", 43)

VJ.AddConVar("vj_cof_slower3_h", 100)
VJ.AddConVar("vj_cof_slower3_d_reg", 40)
VJ.AddConVar("vj_cof_slower3_d_dual", 24)

VJ.AddConVar("vj_cof_slowerno_h", 120)
VJ.AddConVar("vj_cof_slowerno_d_reg", 45)
VJ.AddConVar("vj_cof_slowerno_d_dual", 27)

VJ.AddConVar("vj_cof_slowerstuck_h", 90)
VJ.AddConVar("vj_cof_slowerstuck_d_reg", 35)
VJ.AddConVar("vj_cof_slowerstuck_d_dual", 23)

VJ.AddConVar("vj_cof_stranger_h", 130)
VJ.AddConVar("vj_cof_stranger_d", 5)

VJ.AddConVar("vj_cof_suicider_h", 120)
VJ.AddConVar("vj_cof_suicider_d", 20)

VJ.AddConVar("vj_cof_taller_h", 1500)
VJ.AddConVar("vj_cof_taller_punch", 55)
VJ.AddConVar("vj_cof_taller_stomp", 75)

VJ.AddConVar("vj_cof_upper_h", 125)
VJ.AddConVar("vj_cof_upper_d_reg", 33)
VJ.AddConVar("vj_cof_upper_d_dual", 20)
VJ.AddConVar("vj_cof_upper_d_slow", 54)

VJ.AddConVar("vj_cof_watro_h", 250)
VJ.AddConVar("vj_cof_watro_d", 50)