include("entities/npc_vj_zss_fast/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_zombies/fast_main.mdl"

ENT.SoundTbl_FootStep = {"npc/fast_zombie/foot1.wav", "npc/fast_zombie/foot2.wav", "npc/fast_zombie/foot3.wav", "npc/fast_zombie/foot4.wav"}
ENT.SoundTbl_Breath = "npc/fast_zombie/breathe_loop1.wav"
ENT.SoundTbl_Alert = {"npc/fast_zombie/fz_alert_close1.wav", "npc/fast_zombie/fz_alert_far1.wav"}
ENT.SoundTbl_MeleeAttack = false -- HL2 fast zombie does NOT have a melee attack sound!
ENT.SoundTbl_MeleeAttackExtra = {"npc/zombie/claw_strike1.wav", "npc/zombie/claw_strike2.wav", "npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_zombies/miss1.wav", "vj_zombies/miss2.wav", "vj_zombies/miss3.wav", "vj_zombies/miss4.wav"}
ENT.SoundTbl_LeapAttackJump = "npc/fast_zombie/fz_scream1.wav"
ENT.SoundTbl_LeapAttackDamage = {"npc/fast_zombie/claw_strike1.wav", "npc/fast_zombie/claw_strike2.wav", "npc/fast_zombie/claw_strike3.wav"}
ENT.SoundTbl_Pain = {"npc/fast_zombie/idle1.wav", "npc/fast_zombie/idle2.wav", "npc/fast_zombie/idle3.wav"}
ENT.SoundTbl_Death = "npc/fast_zombie/wake1.wav"

ENT.MainSoundPitch = 100