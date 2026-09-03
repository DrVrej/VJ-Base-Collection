AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.NextTouchSoundT = 0
ENT.Dead = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
	self:SetModel("models/vj_eye/limacue_egg.mdl")
	self:SetMaxHealth(10)
	self:SetHealth(10)
	self:PhysicsInit(SOLID_VPHYSICS)
	self:SetMoveType(MOVETYPE_VPHYSICS)
	self:SetSolid(SOLID_VPHYSICS)
	
	local phys = self:GetPhysicsObject()
	if IsValid(phys) then
		phys:Wake()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PhysicsCollide(data)
	if CurTime() > self.NextTouchSoundT then
		self:EmitSound("physics/flesh/flesh_squishy_impact_hard" .. math.random(1, 4) .. ".wav", 60)
		self.NextTouchSoundT = CurTime() + 1
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnTakeDamage(dmginfo, data)
	self:SpawnBloodParticles(dmginfo)
	self:SpawnBloodDecals(dmginfo)
	self:EmitSound("vj_base/impact/flesh_alien.wav", 80, math.random(80, 100))
	
	self:SetHealth(self:Health() -dmginfo:GetDamage())
	if self:Health() <= 0 && self.Dead == false then
		self:SetHealth(self:GetMaxHealth())
		self.Dead = true
	
		self:EmitSound("vj_base/gib/break1.wav", 75, math.random(80, 100))
		self:EmitSound("vj_base/gib/break2.wav", 75, math.random(80, 100))
		self:EmitSound("vj_base/gib/break3.wav", 75, math.random(80, 100))

		self:SpawnBloodParticles(dmginfo)
		self:SpawnBloodParticles(dmginfo)
		
		local ent = ents.Create("npc_vj_eye_turtle")
		ent:SetPos(self:GetPos())
		ent:Spawn()
		ent:Activate()
		self:Remove()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defVec = Vector(0, 0, 0)
--
function ENT:SpawnBloodParticles(dmginfo, hitgroup)
	local damagePos = dmginfo:GetDamagePosition()
	if damagePos == defVec then damagePos = self:GetPos() + self:OBBCenter() end

	local bloodParticle = ents.Create("info_particle_system")
	bloodParticle:SetKeyValue("effect_name", "blood_impact_red_01")
	bloodParticle:SetPos(damagePos)
	bloodParticle:Spawn()
	bloodParticle:Activate()
	bloodParticle:Fire("Start", "", 0)
	bloodParticle:Fire("Kill", "", 0.1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnBloodDecals(dmginfo, hitgroup)
	local force = dmginfo:GetDamageForce()
	local length = math.Clamp(force:Length() *10, 100, 300)
	local paint = tobool(math.random(0, math.Round(length *0.125)) <= 1000)
	if !paint then return end
	local posStart = dmginfo:GetDamagePosition()
	local posEnd = posStart +force:GetNormal() *length
	local tr = util.TraceLine({start = posStart, endpos = posEnd, filter = self})
	if !tr.HitWorld then return end
	util.Decal("VJ_Blood_Red", tr.HitPos +tr.HitNormal, tr.HitPos -tr.HitNormal)
end