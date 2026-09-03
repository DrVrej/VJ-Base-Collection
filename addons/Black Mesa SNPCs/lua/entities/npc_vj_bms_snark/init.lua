AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_BLACKMESA/snark.mdl"
ENT.StartHealth = 10
ENT.SightAngle = 360
ENT.HullType = HULL_TINY
ENT.EntitiesToNoCollide = {"npc_vj_bms_snark"}
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_SNARK"}

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {}
ENT.MeleeAttackDistance = 20
ENT.MeleeAttackDamageDistance = 25
ENT.TimeUntilMeleeAttackDamage = 0.1
ENT.NextAnyAttackTime_Melee = 0.4
ENT.MeleeAttackDamage = 1

ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = ACT_GLIDE
ENT.LeapAttackMaxDistance = 200
ENT.LeapAttackMinDistance = 0
ENT.TimeUntilLeapAttackDamage = 0.4
ENT.NextLeapAttackTime = 0.4
ENT.NextAnyAttackTime_Leap = 0.4
ENT.LeapAttackExtraTimers = {0.2, 0.6}
ENT.LeapAttackDamage = 1
ENT.LeapAttackDamageDistance = 100

ENT.IdleAlwaysWander = true
ENT.HasDeathCorpse = false
ENT.PropInteraction = "OnlyDamage"

ENT.SoundTbl_Idle = {"vj_bms_snark/hunt1.wav", "vj_bms_snark/hunt2.wav", "vj_bms_snark/hunt3.wav", "vj_bms_snark/hunt4.wav"}
ENT.SoundTbl_Alert = {"vj_bms_snark/deploy1.wav", "vj_bms_snark/deploy2.wav", "vj_bms_snark/deploy3.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_bms_snark/bite01.wav", "vj_bms_snark/bite02.wav", "vj_bms_snark/bite03.wav", "vj_bms_snark/bite04.wav", "vj_bms_snark/bite05.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_bms_snark/hunt1.wav", "vj_bms_snark/hunt2.wav", "vj_bms_snark/hunt3.wav", "vj_bms_snark/hunt4.wav"}
ENT.SoundTbl_LeapAttackDamage = {"vj_bms_snark/bite01.wav", "vj_bms_snark/bite02.wav", "vj_bms_snark/bite03.wav", "vj_bms_snark/bite04.wav", "vj_bms_snark/bite05.wav"}
ENT.SoundTbl_LeapAttackDamageMiss = {"vj_bms_snark/hunt1.wav", "vj_bms_snark/hunt2.wav", "vj_bms_snark/hunt3.wav", "vj_bms_snark/hunt4.wav"}
ENT.SoundTbl_Pain = {"vj_bms_snark/die01.wav", "vj_bms_snark/die02.wav", "vj_bms_snark/die03.wav", "vj_bms_snark/die04.wav"}
ENT.SoundTbl_Death = {"vj_bms_snark/blast1.wav"}

-- Custom
ENT.Snark_CanExplode = true
ENT.Snark_NextJumpWalkT = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(5, 5, 10), Vector(-5, -5, 0))
	//self:PhysicsInitBox(self:GetModelBounds())
	//self.MeleeAttackDamage = math.random(3, 5)
	//self.LeapAttackDamage = math.random(3, 5)
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_CLIMB))
	self.Snark_EnergyTime = CurTime() + GetConVarNumber("vj_bms_snarkexplodetime")
	if GetConVarNumber("vj_bms_snarkexplode") == 0 then self.Snark_CanExplode = false end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	//PrintMessage(HUD_PRINTTALK, self.Snark_EnergyTime, " | CURTIME: " .. CurTime())
	local ene = self:GetEnemy()
	if IsValid(ene) && !self.VJ_IsBeingControlled && self:IsOnGround() && self:Visible(ene) && self.EnemyData.Distance > (self.LeapAttackMaxDistance + 10) && CurTime() > self.Snark_NextJumpWalkT then
		self:PlayAnim(ACT_GLIDE, false, 0.7, true)
		self:SetGroundEntity(NULL)
		self:SetLocalVelocity((ene:GetPos() - self:GetPos()):GetNormal()*500 + self:GetUp()*math.Rand(180, 220) + self:GetForward()*math.Rand(30, 50))
		self.Snark_NextJumpWalkT = CurTime() + math.Rand(0.4, 0.5)
	end
	if self.Snark_CanExplode && self.Snark_EnergyTime < CurTime() then
		self:TakeDamage(self:Health(), self, self)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "PreDamage" then
		self.Snark_EnergyTime = self.Snark_EnergyTime + 0.5
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnLeapAttack(status, enemy)
	if status == "Jump" then
		return VJ.CalculateTrajectory(self, enemy, "Curve", self:GetPos() + self:OBBCenter(), enemy:GetPos() + enemy:OBBCenter(), 10) + self:GetForward() * 200 + self:GetUp() * 50
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnLeapAttackExecute(status, ent)
	if status == "PreDamage" then
		self.Snark_EnergyTime = self.Snark_EnergyTime + 0.5
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorYellow = VJ.Color2Byte(Color(255, 221, 35))
--
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Finish" && self.HasGibOnDeathEffects then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetPos() + self:OBBCenter())
		effectData:SetColor(colorYellow)
		effectData:SetScale(40)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(6)
		effectData:SetFlags(3)
		effectData:SetColor(1)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
	end
end