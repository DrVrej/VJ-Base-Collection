/*--------------------------------------------------
	*** Copyright (c) 2012-2021 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Toxic Gas"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"

ENT.PhysicsSolidMask = MASK_SHOT

if CLIENT then
	VJ.AddKillIcon("obj_vj_dm_gas", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/vj_base/projectiles/spit_acid_medium.mdl"
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 200
ENT.RadiusDamage = 30
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_POISON
ENT.SoundTbl_Idle = "vj_base/ambience/acid_idle.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetNoDraw(true)
	ParticleEffectAttach("vj_acid_idle", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	ParticleEffectAttach("vj_acid_impact3_gas", PATTACH_ABSORIGIN_FOLLOW, self, 0)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAng = Angle(0, 0, 0)
--
function ENT:OnDestroy(data, phys)
	ParticleEffect("vj_acid_impact3_gas", data.HitPos, defAng)
	ParticleEffect("vj_acid_impact3_gas", data.HitPos, defAng)
	ParticleEffect("vj_acid_impact3_gas", data.HitPos, defAng)
end