/*--------------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
--------------------------------------------------*/
AddCSLuaFile()

ENT.Base 			= "base_ai"
ENT.Type 			= "ai"
ENT.PrintName		= "Snark Nest"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "Black Mesa"
ENT.AutomaticFrameAdvance = true

---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
	VJ.AddKillIcon("sent_vj_bms_snarknest", ENT.PrintName)

	function ENT:Draw()
		self:DrawModel()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
if !SERVER then return end

ENT.Dead = false

local defVec = Vector(0, 0, 0)
local defAng = Angle(0, 0, 0)
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Initialize()
	self:SetModel("models/VJ_BLACKMESA/snarknest.mdl")
	self:SetHealth(10)
	self:SetHullType(HULL_TINY)
	self:SetHullSizeNormal()
	self:SetMoveType(MOVETYPE_NONE)
	self:SetSolid(SOLID_BBOX)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnTakeDamage(dmginfo, data)
	self:SpawnBloodParticles(dmginfo)
	self:SpawnBloodDecals(dmginfo)
	self:EmitSound("vj_base/impact/flesh_alien.wav", 80, math.random(80, 100))
	
	self:SetHealth(self:Health() -dmginfo:GetDamage())
	if self:Health() <= 0 && !self.Dead then
		local myPos = self:GetPos()
		self.Dead = true
		self:SetHealth(self:GetMaxHealth())
		
		local effectData = EffectData()
		effectData:SetOrigin(myPos)
		effectData:SetScale(0.6)
		util.Effect("StriderBlood", effectData)
		util.Effect("StriderBlood", effectData)
		ParticleEffect("vj_acid_impact1", myPos, defAng)
		
		for _ = 1, 8 do
			local ent = ents.Create("npc_vj_bms_snark")
			ent:SetPos(myPos)
			ent:SetAngles(defAng)
			ent:SetVelocity(self:GetUp()*math.Rand(250, 350) + self:GetRight()*math.Rand(-100, 100) + self:GetForward()*math.Rand(-100, 100))
			ent:Spawn()
			ent:Activate()
		end
		self:Remove()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SpawnBloodParticles(dmginfo, hitgroup)
	local damagePos = dmginfo:GetDamagePosition()
	if damagePos == defVec then damagePos = self:GetPos() + self:OBBCenter() end

	local bloodParticle = ents.Create("info_particle_system")
	bloodParticle:SetKeyValue("effect_name", "blood_impact_yellow_01")
	bloodParticle:SetPos(damagePos)
	bloodParticle:Spawn()
	bloodParticle:Activate()
	bloodParticle:Fire("Start")
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