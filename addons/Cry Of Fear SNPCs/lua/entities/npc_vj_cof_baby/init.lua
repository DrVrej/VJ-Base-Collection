AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/baby/baby.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_baby_h")
ENT.HullType = HULL_WIDE_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 90
ENT.TimeUntilMeleeAttackDamage = 0.4
ENT.NextAnyAttackTime_Melee = 0.556
ENT.MeleeAttackDamage = 100//GetConVarNumber("vj_cof_baby_d")
ENT.FootstepSoundTimerRun = 0.25
ENT.FootstepSoundTimerWalk = 0.25
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.DeathAnimationTime = 4
ENT.GibOnDeathFilter = false

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"baby/b_alert1.wav", "baby/b_alert2.wav", "baby/b_alert3.wav"}
ENT.SoundTbl_MeleeAttack = {"baby/b_attack1.wav", "baby/b_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"slower/hammer_miss1.wav", "slower/hammer_miss2.wav"}
ENT.SoundTbl_Pain = {"baby/b_pain1.wav", "baby/b_pain2.wav"}
ENT.SoundTbl_Death = {"baby/b_death1.wav", "baby/b_death2.wav"}

ENT.FootstepSoundLevel = 75

-- Custom
ENT.Baby_DeathFromMeleeAttack = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(15, 15, 50), Vector(-15, -15, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "Init" then
		if self.Dead or !IsValid(self:GetEnemy()) then return end
		self:SetGroundEntity(NULL)
		self:SetLocalVelocity(((self:GetEnemy():GetPos() + self:OBBCenter()) - (self:GetPos() + self:OBBCenter())):GetNormal()*200 + self:GetUp()*40 + self:GetForward()*20)
		self.Baby_DeathFromMeleeAttack = true
		self:TakeDamage(999999999999999, self, self)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" then
		if self.Baby_DeathFromMeleeAttack == false then
			self.AnimTbl_Death = ACT_DIESIMPLE
		end
		self:SetBodygroup(0, 1)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	if self.HasGibOnDeathEffects then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetAttachment(self:LookupAttachment(0)).Pos)
		bloodeffect:SetColor(VJ.Color2Byte(Color(130, 19, 10)))
		bloodeffect:SetScale(30)
		util.Effect("VJ_Blood1", bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetAttachment(self:LookupAttachment(0)).Pos)
		bloodspray:SetScale(4)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray", bloodspray)
		util.Effect("bloodspray", bloodspray)
	end
	
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/brain.mdl", {Pos=self:GetAttachment(self:LookupAttachment(0)).Pos, Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetForward()*math.Rand(20, 40)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:GetAttachment(self:LookupAttachment(0)).Pos, Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(50, 50)+self:GetForward()*math.Rand(20, 40)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:GetAttachment(self:LookupAttachment(0)).Pos, Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(-50, -50)+self:GetForward()*math.Rand(20, 40)})
	return true, {AllowAnim = true}
end