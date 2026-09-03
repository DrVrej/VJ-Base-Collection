AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/slower1/slower.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_slower1_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 90
ENT.TimeUntilMeleeAttackDamage = 0.9
ENT.NextAnyAttackTime_Melee = 0.8
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_slower1_d_reg")
ENT.FootstepSoundTimerRun = 0.25
ENT.FootstepSoundTimerWalk = 0.25
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_DIEBACKWARD}
ENT.DeathAnimationTime = 4

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"slower/slower_alert10.wav", "slower/slower_alert20.wav", "slower/slower_alert30.wav"}
ENT.SoundTbl_MeleeAttack = {"slower/slower_attack1.wav", "slower/slower_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"slower/hammer_miss1.wav", "slower/hammer_miss2.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"slower/hammer_strike1.wav", "slower/hammer_strike2.wav", "slower/hammer_strike3.wav"}
ENT.SoundTbl_Pain = {"slower/slower_pain1.wav", "slower/slower_pain2.wav"}
ENT.SoundTbl_Death = {"slower/scream1.wav"}

ENT.FootstepSoundLevel = 75

-- Custom
ENT.Slower1_TypeOfBodyGroup = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	local orionisblack = math.random(0, 2)
	if orionisblack == 0 then self:SetBodygroup(0, 0) self.Slower1_TypeOfBodyGroup = 0
	elseif orionisblack == 1 then self:SetBodygroup(0, 1) self.Slower1_TypeOfBodyGroup = 1
	elseif orionisblack == 2 then self:SetBodygroup(0, 2) self.Slower1_TypeOfBodyGroup = 2
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	local randattack = math.random(1, 5)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
		self.TimeUntilMeleeAttackDamage = 0.8
		self.NextAnyAttackTime_Melee = 0.2
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_slower1_d_reg")
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
		self.TimeUntilMeleeAttackDamage = 0.95
		self.NextAnyAttackTime_Melee = 0.251
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_slower1_d_reg")
	elseif randattack == 3 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack3"}
		self.TimeUntilMeleeAttackDamage = 0.65
		self.NextAnyAttackTime_Melee = 0.6
		self.MeleeAttackExtraTimers = {1.05}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_slower1_d_dual")
	elseif randattack == 4 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack4"}
		self.TimeUntilMeleeAttackDamage = 1.05
		self.NextAnyAttackTime_Melee = 0.274
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_slower1_d_slow")
	elseif randattack == 5 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack5"}
		self.TimeUntilMeleeAttackDamage = 0.67
		self.NextAnyAttackTime_Melee = 0.242
		self.MeleeAttackExtraTimers = {}
		self.MeleeAttackDamage = GetConVarNumber("vj_cof_slower1_d_reg")
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" then
		local buzzisstupid = math.random(1, 3)
		if buzzisstupid == 1 then
			self.AnimTbl_Death = ACT_DIEVIOLENT
			timer.Simple(1, function()
				if IsValid(self) then
					self.GibOnDeathFilter = false
					self:GibOnDeath(DamageInfo(), hitgroup) -- dmginfo is corrupt by now, declare a new one
				end
			end)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	if self.DeathAnimationCodeRan == false then return false end
	
	if self.Slower1_TypeOfBodyGroup == 0 then self:SetBodygroup(0, 3) end
	if self.Slower1_TypeOfBodyGroup == 1 then self:SetBodygroup(0, 4) end
	if self.Slower1_TypeOfBodyGroup == 2 then self:SetBodygroup(0, 5) end
	
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