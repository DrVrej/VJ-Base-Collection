AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/VJ_WIC_SOVIET/soviet_01.mdl", "models/VJ_WIC_SOVIET/soviet_02.mdl", "models/VJ_WIC_SOVIET/soviet_03.mdl", "models/VJ_WIC_SOVIET/soviet_04.mdl", "models/VJ_WIC_SOVIET/soviet_05.mdl", "models/VJ_WIC_SOVIET/soviet_06.mdl"}
ENT.StartHealth = 80
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_RUSSIAN"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 15
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?

ENT.CanFlinch = true

ENT.SoundTbl_Idle = {"vj_military/russian/idle1.wav", "vj_military/russian/idle2.wav", "vj_military/russian/idle3.wav", "vj_military/russian/idle4.wav", "vj_military/russian/idle5.wav", "vj_military/russian/idle6.wav", "vj_military/russian/idle7.wav", "vj_military/russian/idle8.wav", "vj_military/russian/idle9.wav", "vj_military/russian/idle10.wav", "vj_military/russian/idle11.wav", "vj_military/russian/idle12.wav"}
ENT.SoundTbl_MedicBeforeHeal = {"vj_military/russian/medic1.wav", "vj_military/russian/medic2.wav", "vj_military/russian/medic3.wav", "vj_military/russian/medic4.wav", "vj_military/russian/medic5.wav", "vj_military/russian/medic6.wav", "vj_military/russian/medic7.wav", "vj_military/russian/medic8.wav", "vj_military/russian/medic9.wav", }
ENT.SoundTbl_Alert = {"vj_military/russian/alert1.wav", "vj_military/russian/alert2.wav", "vj_military/russian/alert3.wav", "vj_military/russian/alert4.wav", "vj_military/russian/alert5.wav", "vj_military/russian/alert6.wav"}
ENT.SoundTbl_CombatIdle = {"vj_military/russian/attack1.wav", "vj_military/russian/attack2.wav", "vj_military/russian/attack3.wav", "vj_military/russian/attack4.wav", "vj_military/russian/attack5.wav", "vj_military/russian/attack6.wav", "vj_military/russian/attack7.wav", "vj_military/russian/attack8.wav", "vj_military/russian/attack9.wav", "vj_military/russian/attack10.wav", "vj_military/russian/attack11.wav", "vj_military/russian/attack12.wav"}
ENT.SoundTbl_WeaponReload = {"vj_military/russian/reloading1.wav", "vj_military/russian/reloading2.wav", "vj_military/russian/reloading3.wav", "vj_military/russian/reloading4.wav", "vj_military/russian/reloading5.wav", "vj_military/russian/reloading6.wav"}
ENT.SoundTbl_GrenadeAttack = {"vj_military/russian/throwgrenade1.wav", "vj_military/russian/throwgrenade2.wav", "vj_military/russian/throwgrenade3.wav", "vj_military/russian/throwgrenade4.wav", "vj_military/russian/throwgrenade5.wav", "vj_military/russian/throwgrenade6.wav", "vj_military/russian/throwgrenade7.wav", "vj_military/russian/throwgrenade8.wav", "vj_military/russian/throwgrenade9.wav"}
ENT.SoundTbl_GrenadeSight = {"vj_military/russian/grenade1.wav", "vj_military/russian/grenade2.wav", "vj_military/russian/grenade3.wav", "vj_military/russian/grenade4.wav", "vj_military/russian/grenade5.wav", "vj_military/russian/grenade6.wav"}
ENT.SoundTbl_Pain = {"vj_military/russian/pain1.wav", "vj_military/russian/pain2.wav", "vj_military/russian/pain3.wav", "vj_military/russian/pain4.wav", "vj_military/russian/pain5.wav", "vj_military/russian/pain6.wav"}
ENT.SoundTbl_Death = {"vj_military/russian/die1.wav", "vj_military/russian/die2.wav", "vj_military/russian/die3.wav", "vj_military/russian/die4.wav", "vj_military/russian/die5.wav", "vj_military/russian/die6.wav"}

ENT.IdleSoundLevel = 85
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	if math.random(1, 5) == 1 then self.IsMedic = true end
	
	self:SetSkin(math.random(0, 2))
	self:SetBodygroup(1, math.random(0, 2))
	self:SetBodygroup(2, math.random(0, 2))
	if math.random(1, 4) == 1 then self:SetBodygroup(2, math.random(3, 5)) end
end