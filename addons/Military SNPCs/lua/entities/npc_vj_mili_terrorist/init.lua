AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJ_Terrorist/2hemagh.mdl", "models/VJ_Terrorist/2kimasked.mdl", "models/VJ_Terrorist/3hemagh.mdl", "models/VJ_Terrorist/shemagh.mdl", "models/VJ_Terrorist/shemagh_helmet.mdl", "models/VJ_Terrorist/skimasked.mdl", "models/VJ_Terrorist/unmasked1.mdl", "models/VJ_Terrorist/unmasked2.mdl"}
ENT.StartHealth = 60
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_TERRORIST"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 10
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?

ENT.CanFlinch = true

ENT.SoundTbl_Idle = {"vj_military/arabic/idle1.wav", "vj_military/arabic/idle2.wav", "vj_military/arabic/idle3.wav", "vj_military/arabic/idle4.wav", "vj_military/arabic/idle5.wav", "vj_military/arabic/idle6.wav", "vj_military/arabic/idle7.wav", "vj_military/arabic/idle8.wav", "vj_military/arabic/idle9.wav", "vj_military/arabic/idle10.wav", "vj_military/arabic/idle11.wav", "vj_military/arabic/idle12.wav"}
ENT.SoundTbl_Alert = {"vj_military/arabic/alert1.wav", "vj_military/arabic/alert1.wav", "vj_military/arabic/attack1.wav", "vj_military/arabic/attack2.wav", "vj_military/arabic/attack3.wav", "vj_military/arabic/attack4.wav", "vj_military/arabic/attack7.wav"}
ENT.SoundTbl_CombatIdle = {"vj_military/arabic/attack1.wav", "vj_military/arabic/attack2.wav", "vj_military/arabic/attack3.wav", "vj_military/arabic/attack4.wav", "vj_military/arabic/attack5.wav", "vj_military/arabic/attack6.wav", "vj_military/arabic/attack7.wav", "vj_military/arabic/allahackbar1.wav", "vj_military/arabic/allahackbar2.wav", "vj_military/arabic/allahackbar3.wav", "vj_military/arabic/allahackbar1.wav", "vj_military/arabic/allahackbar2.wav", "vj_military/arabic/allahackbar3.wav"}
ENT.SoundTbl_GrenadeSight = {"vj_military/arabic/scared1.wav", "vj_military/arabic/scared2.wav", "vj_military/arabic/scared3.wav", "vj_military/arabic/scared4.wav"}
ENT.SoundTbl_Pain = {"vj_military/arabic/pain1.wav", "vj_military/arabic/pain2.wav", "vj_military/arabic/pain3.wav", "vj_military/arabic/pain4.wav", "vj_military/arabic/pain5.wav", "vj_military/arabic/pain6.wav"}
ENT.SoundTbl_Death = {"vj_military/arabic/death1.wav", "vj_military/arabic/death2.wav", "vj_military/arabic/death3.wav", "vj_military/arabic/death4.wav", "vj_military/arabic/death5.wav", "vj_military/arabic/death6.wav", "vj_military/arabic/death7.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	if math.random(1, 5) == 1 then self.IsMedic = true end
end