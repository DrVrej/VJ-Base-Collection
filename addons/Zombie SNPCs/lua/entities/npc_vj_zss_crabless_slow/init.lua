include("entities/npc_vj_zss_slow/init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_zombies/slow_main.mdl"
ENT.MeleeAttackPlayerSpeed = false
ENT.HasExtraMeleeAttackSounds = true

ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav", "npc/zombie/foot2.wav", "npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {"npc/zombie/zombie_voice_idle1.wav", "npc/zombie/zombie_voice_idle2.wav", "npc/zombie/zombie_voice_idle3.wav", "npc/zombie/zombie_voice_idle4.wav", "npc/zombie/zombie_voice_idle5.wav", "npc/zombie/zombie_voice_idle6.wav", "npc/zombie/zombie_voice_idle7.wav", "npc/zombie/zombie_voice_idle8.wav", "npc/zombie/zombie_voice_idle9.wav", "npc/zombie/zombie_voice_idle10.wav", "npc/zombie/zombie_voice_idle11.wav", "npc/zombie/zombie_voice_idle12.wav", "npc/zombie/zombie_voice_idle13.wav", "npc/zombie/zombie_voice_idle14.wav"}
ENT.SoundTbl_Alert = {"npc/zombie/zombie_alert1.wav", "npc/zombie/zombie_alert2.wav", "npc/zombie/zombie_alert3.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie/zo_attack1.wav", "npc/zombie/zo_attack2.wav"}
ENT.SoundTbl_MeleeAttack = false -- Don't play any for HL2 Zombie
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav", "npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Pain = {"npc/zombie/zombie_pain1.wav", "npc/zombie/zombie_pain2.wav", "npc/zombie/zombie_pain3.wav", "npc/zombie/zombie_pain4.wav", "npc/zombie/zombie_pain5.wav", "npc/zombie/zombie_pain6.wav"}
ENT.SoundTbl_Death = {"npc/zombie/zombie_die1.wav", "npc/zombie/zombie_die2.wav", "npc/zombie/zombie_die3.wav"}

ENT.MainSoundPitch = 100