/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Type 			= "anim"
ENT.Base 			= "obj_vj_projectile_base"
ENT.PrintName		= "Hornet"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"

ENT.PhysicsSolidMask = MASK_SHOT

if (CLIENT) then
	VJ.AddKillIcon("obj_vj_bms_hornet", ENT.PrintName, VJ.KILLICON_PROJECTILE)
end
------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Model = "models/weapons/w_hornet.mdl"
ENT.DoesDirectDamage = true
ENT.DirectDamage = 3.5
ENT.DirectDamageType = DMG_SLASH
ENT.CollisionBehavior = VJ.PROJ_COLLISION_PERSIST
ENT.CollisionDecal = "YellowBlood"
ENT.SoundTbl_Startup = "vj_bms_hornet/single.wav"
ENT.SoundTbl_Idle = "vj_bms_hornet/buzz.wav"
ENT.SoundTbl_OnCollide = "vj_bms_hornet/bug_impact.wav"

ENT.IdleSoundPitch = VJ.SET(100, 100)

-- Custom
ENT.MyEnemy = NULL
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	timer.Simple(5, function() if IsValid(self) then self:Remove() end end)
	
	util.SpriteTrail(self, 0, Color(255, math.random(50, 200), 0, 120), true, 12, 0, 1, 0.04, "sprites/vj_bms_hornettrail.vmt")

	local sprite = ents.Create( "env_sprite" )
	sprite:SetKeyValue( "rendercolor", "255 128 0" )
	sprite:SetKeyValue( "GlowProxySize", "2.0" )
	sprite:SetKeyValue( "HDRColorScale", "1.0" )
	sprite:SetKeyValue( "renderfx", "14" )
	sprite:SetKeyValue( "rendermode", "3" )
	sprite:SetKeyValue( "renderamt", "240" )
	sprite:SetKeyValue( "disablereceiveshadows", "0" )
	sprite:SetKeyValue( "mindxlevel", "0" )
	sprite:SetKeyValue( "maxdxlevel", "0" )
	sprite:SetKeyValue( "framerate", "10.0" )
	sprite:SetKeyValue( "model", "sprites/blueflare1.spr" )
	sprite:SetKeyValue( "spawnflags", "0" )
	sprite:SetKeyValue( "scale", "0.60" )
	sprite:SetPos( self:GetPos() )
	sprite:Spawn()
	sprite:SetParent(self)
	self:DeleteOnRemove(sprite)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	-- Homing Behavior
	if IsValid(self.MyEnemy) && self.MyEnemy:Alive() then
		local phys = self:GetPhysicsObject()
		if IsValid(phys) then
			phys:SetVelocity(VJ.CalculateTrajectory(self, self.MyEnemy, "Line", self:GetPos() + VectorRand(-50, 50), 1, 600))
			self:SetAngles(self:GetVelocity():GetNormal():Angle())
		end
	else
		local phys = self:GetPhysicsObject()
		if IsValid(phys) then
			phys:SetVelocity(VJ.CalculateTrajectory(self, NULL, "Line", self:GetPos(), self:GetPos() + VectorRand(-80, 80), 300))
			self:SetAngles(self:GetVelocity():GetNormal():Angle())
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCollision(data, phys)
	local lastvel = math.max(data.OurOldVelocity:Length(), data.Speed) -- Get the last velocity and speed
	local newvel = phys:GetVelocity():GetNormal()
	lastvel = math.max(newvel:Length(), lastvel)
	local setvel = newvel * lastvel * 0.3
	phys:SetVelocity(setvel)
	self:SetAngles(self:GetVelocity():GetNormal():Angle())
	
	-- Remove if it's a living being
	if data.HitEntity.VJ_ID_Living then
		self.CollisionBehavior = VJ.PROJ_COLLISION_REMOVE
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAng = Angle(0, 0, 0)
--
function ENT:OnDestroy(data, phys)
	local effectData = EffectData()
	effectData:SetOrigin(data.HitPos)
	effectData:SetScale(0.6)
	util.Effect("StriderBlood", effectData)
	ParticleEffect("vj_acid_impact3_floaters", data.HitPos, defAng)
end