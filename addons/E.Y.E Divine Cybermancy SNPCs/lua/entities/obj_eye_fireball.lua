/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "FireBall"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"

if (CLIENT) then
	VJ.AddKillIcon("obj_eye_fireball", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/dav0r/hoverball.mdl"
ENT.ProjectileType = VJ.PROJ_TYPE_GRAVITY
ENT.DoesRadiusDamage = true
ENT.RadiusDamageRadius = 110
ENT.RadiusDamage = 25
ENT.RadiusDamageUseRealisticRadius = true
ENT.RadiusDamageType = DMG_BLAST
ENT.RadiusDamageForce = 80
ENT.CollisionDecal = "Scorch"
ENT.SoundTbl_Idle = "ambient/fire/fire_small_loop1.wav"
ENT.SoundTbl_OnCollide = "vj_base/ambience/fireball_explode.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetMaterial("models/effect/vol_light001")
	self:SetNoDraw(true)

	//ParticleEffectAttach("smoke_burning_engine_01", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	//ParticleEffectAttach("fire_jet_01_flame", PATTACH_ABSORIGIN_FOLLOW, self, 0)
	ParticleEffectAttach("vj_fireball_idle", PATTACH_ABSORIGIN_FOLLOW, self, 0)

	//local spriteGlow = ents.Create("env_sprite")
	//spriteGlow:SetKeyValue("rendercolor", "255 128 0")
	//spriteGlow:SetKeyValue("GlowProxySize", "2.0")
	//spriteGlow:SetKeyValue("HDRColorScale", "1.0")
	//spriteGlow:SetKeyValue("renderfx", "14")
	//spriteGlow:SetKeyValue("rendermode", "3")
	//spriteGlow:SetKeyValue("renderamt", "255")
	//spriteGlow:SetKeyValue("disablereceiveshadows", "0")
	//spriteGlow:SetKeyValue("mindxlevel", "0")
	//spriteGlow:SetKeyValue("maxdxlevel", "0")
	//spriteGlow:SetKeyValue("framerate", "10.0")
	//spriteGlow:SetKeyValue("model", "sprites/blueflare1.spr")
	//spriteGlow:SetKeyValue("spawnflags", "0")
	//spriteGlow:SetKeyValue("scale", "0.75")
	//spriteGlow:SetPos(self:GetPos())
	//spriteGlow:Spawn()
	//spriteGlow:SetParent(self)
	//self:DeleteOnRemove(spriteGlow)

	local dynLight = ents.Create("light_dynamic")
	dynLight:SetKeyValue("brightness", "1")
	dynLight:SetKeyValue("distance", "200")
	dynLight:SetLocalPos(self:GetPos())
	dynLight:SetLocalAngles(self:GetAngles())
	dynLight:Fire("Color", "255 150 0")
	dynLight:SetParent(self)
	dynLight:Spawn()
	dynLight:Activate()
	dynLight:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(dynLight)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDestroy(data, phys)
	util.ScreenShake(data.HitPos, 16, 200, 1, 800)
	
	local effectData = EffectData()
	effectData:SetOrigin(data.HitPos)
	//effectData:SetScale(10)
	util.Effect("HelicopterMegaBomb", effectData)
	util.Effect("ThumperDust", effectData)
	util.Effect("Explosion", effectData)
	util.Effect("VJ_Small_Explosion1", effectData)

	local expLight = ents.Create("light_dynamic")
	expLight:SetKeyValue("brightness", "5")
	expLight:SetKeyValue("distance", "300")
	expLight:SetLocalPos(data.HitPos)
	expLight:SetLocalAngles(self:GetAngles())
	expLight:Fire("Color", "255 150 0")
	expLight:SetParent(self)
	expLight:Spawn()
	expLight:Activate()
	expLight:Fire("TurnOn", "", 0)
	self:DeleteOnRemove(expLight)
end