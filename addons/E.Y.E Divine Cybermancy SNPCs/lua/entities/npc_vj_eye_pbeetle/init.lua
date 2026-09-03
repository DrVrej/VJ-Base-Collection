AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_eye/bug.mdl"
ENT.StartHealth = 10
ENT.HullType = HULL_TINY
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.Behavior = VJ_BEHAVIOR_PASSIVE_NATURE
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW
ENT.GibOnDeathFilter = false

ENT.SoundTbl_Idle = "vj_eye/animals/bug_idle.wav"
ENT.SoundTbl_Alert = "vj_eye/animals/bug_fear.wav"
ENT.SoundTbl_Pain = "vj_eye/animals/bug_die3.wav"
ENT.SoundTbl_Death = {"vj_eye/animals/bug_die.wav", "vj_eye/animals/bug_die2.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(12, 12, 13), Vector(-12, -12, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorYellow = VJ.Color2Byte(Color(255, 221, 35))
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	if self.HasGibOnDeathEffects then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetPos() + self:OBBCenter())
		effectData:SetColor(colorYellow)
		effectData:SetScale(40)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(5)
		effectData:SetFlags(3)
		effectData:SetColor(1)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
		
		ParticleEffect("vj_acid_impact3_splat", self:GetPos(), self:GetAngles())
	end
	
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big", {Pos = self:LocalToWorld(Vector(-5, 0, 10)), Vel = Vector(0, math.Rand(-100, 100), 0)})
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big", {Pos = self:LocalToWorld(Vector(5, 0, 10)), Vel = Vector(0, math.Rand(-100, 100), 0)})
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big", {Pos = self:LocalToWorld(Vector(10, 0, 10)), Vel = Vector(0, math.Rand(-100, 100), 0)})
	return true
end