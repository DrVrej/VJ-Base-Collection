/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Mini Nuke"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"

if (CLIENT) then
	VJ.AddKillIcon("obj_fo3_libertymininuke", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/VJ_FALLOUT3/libertyprime_mininuke.mdl"
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 800
ENT.RadiusDamage = 450
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_BLAST
ENT.RadiusDamageForce = 140
ENT.CollisionDecal = "Scorch"
ENT.SoundTbl_OnCollide = "ambient/explosions/explode_8.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
local defAngle = Angle(0, 0, 0)
--
function ENT:OnDestroy(data, phys)
	util.ScreenShake(data.HitPos, 16, 200, 1, 4000)
	
	local effectdata = EffectData()
	effectdata:SetOrigin(data.HitPos)
	util.Effect("Explosion", effectdata)
	util.Effect("VJ_Small_Explosion1", effectdata)
	ParticleEffect("vj_explosion3", data.HitPos, defAngle)
	ParticleEffect("vj_mininuke_explosion_fix", data.HitPos, defAngle)

	local explosionLight = ents.Create("light_dynamic")
	explosionLight:SetKeyValue("brightness", "4")
	explosionLight:SetKeyValue("distance", "300")
	explosionLight:SetLocalPos(data.HitPos)
	explosionLight:SetLocalAngles(self:GetAngles())
	explosionLight:Fire("Color", "255 150 0")
	explosionLight:SetParent(self)
	explosionLight:Spawn()
	explosionLight:Activate()
	explosionLight:Fire("TurnOn")
	self:DeleteOnRemove(explosionLight)
end