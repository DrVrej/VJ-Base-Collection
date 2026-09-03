AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_Terrorist/chicleet.mdl"
ENT.StartHealth = 200
ENT.HullType = HULL_MEDIUM_TALL
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_TERRORIST"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 30
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 80
ENT.MeleeAttackDamageDistance = 120
ENT.TimeUntilMeleeAttackDamage = 0.6
ENT.NextAnyAttackTime_Melee = 0.4
ENT.HasDeathCorpse = false
ENT.GibOnDeathFilter = false

ENT.SoundTbl_Idle = {"vj_military/chicleet/idle1.wav", "vj_military/chicleet/idle2.wav", "vj_military/chicleet/idle3.wav", "vj_military/chicleet/idle4.wav", "vj_military/chicleet/idle5.wav"}
ENT.SoundTbl_Alert = {"vj_military/chicleet/alert1.wav", "vj_military/chicleet/alert2.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_military/chicleet/attack1.wav", "vj_military/chicleet/attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"npc/zombie/claw_miss1.wav", "npc/zombie/claw_miss2.wav"}
ENT.SoundTbl_Pain = {"vj_military/chicleet/pain1.wav", "vj_military/chicleet/pain2.wav", "vj_military/chicleet/pain3.wav"}
ENT.SoundTbl_Death = "vj_military/chicleet/death1.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(13, 13, 90), Vector(-13, -13, 0))
	self:CapabilitiesAdd(CAP_MOVE_CLIMB)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_CLIMB_UP or act == ACT_CLIMB_DOWN then
		return ACT_RUN_AIM_PISTOL
	elseif act == ACT_CLIMB_DISMOUNT then
		return ACT_LAND
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "PreDamage" then
		self:TakeDamage(self:GetMaxHealth(), self, self)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorRed = VJ.Color2Byte(Color(130, 19, 10))
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	local myPos = self:GetPos()
	util.BlastDamage(self, self, myPos, 300, 150)
	util.ScreenShake(myPos, 100, 200, 1, 2500)

	local spawnPos = myPos + self:OBBCenter()
	
	if self.HasGibOnDeathEffects then
		local effectData = EffectData()
		effectData:SetOrigin(spawnPos)
		util.Effect("Explosion", effectData)
		effectData:SetColor(colorRed)
		effectData:SetScale(150)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(8)
		effectData:SetFlags(3)
		effectData:SetColor(0)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
		
		ParticleEffect("vj_explosion2", spawnPos, self:GetAngles())
	end
	
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/brain.mdl", {Pos=spawnPos + self:GetUp() * 50})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=spawnPos + self:GetUp() * 48})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=spawnPos + self:GetUp() * 46})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/heart.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/lung.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/lung.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/liver.mdl", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=spawnPos + VectorRand(-25, 25)})
	return true
end