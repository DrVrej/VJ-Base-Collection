/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Acid"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"

if (CLIENT) then
	VJ.AddKillIcon("obj_vj_bms_acidspit", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = {"models/vj_base/projectiles/spit_acid_small.mdl", "models/vj_base/projectiles/spit_acid_medium.mdl"}
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 70
ENT.RadiusDamage = 3
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_ACID
ENT.CollisionDecal = "VJ_Splat_Acid"
ENT.SoundTbl_Idle = "vj_base/ambience/acid_idle.wav"
ENT.SoundTbl_OnCollide = "vj_base/ambience/acid_splat.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	ParticleEffectAttach("vj_acid_idle", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	ParticleEffectAttach("vj_acid_impact1", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAng = Angle(0, 0, 0)
--
function ENT:OnDestroy(data, phys)
	local effectData = EffectData()
	effectData:SetOrigin(data.HitPos)
	effectData:SetScale(1)
	util.Effect("StriderBlood", effectData)
	util.Effect("StriderBlood", effectData)
	util.Effect("StriderBlood", effectData)
	ParticleEffect("vj_acid_impact3_floaters", data.HitPos, defAng)
	ParticleEffect("vj_acid_impact2_juice", data.HitPos, defAng)
end