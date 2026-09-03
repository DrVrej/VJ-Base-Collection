AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_alienswarm/drone.mdl"
ENT.StartHealth = 80
ENT.HullType = HULL_MEDIUM
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ALIENSWARM"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {ACT_MELEE_ATTACK1, ACT_MELEE_ATTACK2, "lunge_attack03"}
ENT.MeleeAttackDistance = 70
ENT.MeleeAttackDamageDistance = 80
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 15
ENT.MeleeAttackBleedEnemy = true

ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true
ENT.AnimTbl_CallForHelp = ACT_ARM
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {"vjseq_death01", "vjseq_death_fire_02", "vjseq_death_fire_04", "vjseq_death_fire_05", "vjseq_death_fire_07", "vjseq_death_fire_08"}
ENT.DeathAnimationChance = 2

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = "flinch_small"

ENT.SoundTbl_FootStep = {"vj_alienswarm/drone/footstep1a.wav", "vj_alienswarm/drone/footstep1b.wav"}
ENT.SoundTbl_Idle = {"vj_alienswarm/drone/glide01.wav", "vj_alienswarm/drone/glide02.wav", "vj_alienswarm/drone/glide03.wav", "vj_alienswarm/drone/roar01.wav", "vj_alienswarm/drone/roar02.wav"}
ENT.SoundTbl_Alert = {"vj_alienswarm/drone/alert01.wav", "vj_alienswarm/drone/alert02.wav", "vj_alienswarm/drone/alert03.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_alienswarm/drone/attack01.wav", "vj_alienswarm/drone/attack02.wav", "vj_alienswarm/drone/attack03.wav", "vj_alienswarm/drone/attack04.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_alienswarm/drone/swipe01.wav", "vj_alienswarm/drone/swipe02.wav", "vj_alienswarm/drone/swipe03.wav"}
ENT.SoundTbl_Pain = {"vj_alienswarm/drone/pain01.wav", "vj_alienswarm/drone/pain02.wav", "vj_alienswarm/drone/pain03.wav", "vj_alienswarm/drone/pain04.wav", "vj_alienswarm/drone/pain05.wav", "vj_alienswarm/drone/pain06.wav", "vj_alienswarm/drone/pain07.wav"}
ENT.SoundTbl_Death = {"vj_alienswarm/drone/deathfire01.wav", "vj_alienswarm/drone/deathfire02.wav", "vj_alienswarm/drone/deathfire03.wav", "vj_alienswarm/drone/deathfire04.wav", "vj_alienswarm/drone/death01.wav"}
local sdBurrow = {"vj_alienswarm/drone/burrow01.wav", "vj_alienswarm/drone/burrow02.wav", "vj_alienswarm/drone/burrow03.wav", "vj_alienswarm/drone/burrow04.wav"}

ENT.FootstepSoundLevel = 55
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(20, 20, 60), Vector(-20, -20, 0))
	self:SetSurroundingBounds(Vector(70, 70, 100), Vector(-70, -70, 0))
	
	-- Handle bodygroups & attributes that are randomly selected on spawn:
		-- Extra reinforced bones granting 40% health boost
		-- Slimmer body decreasing health by 30%
		-- Each 4 arms can be: Short (No change), long (+2 melee damage), reinforced (+4 melee damage)
	self:SetBodygroup(1, math.random(0, 2))
	self:SetBodygroup(2, math.random(0, 2))
	self:SetBodygroup(3, math.random(0, 2))
	self:SetBodygroup(4, math.random(0, 2))
	self.MeleeAttackDamage = self.MeleeAttackDamage + (2 * self:GetBodygroup(1)) + (2 * self:GetBodygroup(2)) + (2 * self:GetBodygroup(3)) + (2 * self:GetBodygroup(4))
	if math.random(1, 6) == 1 then -- Slimmer body
		self:SetBodygroup(0, 1)
		self:SetHealth(self:Health() * 0.7)
	elseif math.random(1, 6) == 1 then -- Extra reinforced bones
		self:SetBodygroup(5, 1)
		self:SetHealth(self:Health() * 1.4)
	end
	
	-- Burrow out animation
	if VJ_CVAR_AI_ENABLED && math.random(1, 2) == 1 then
		self:SetNoDraw(true)
		self:SetState(VJ_STATE_FREEZE)
		timer.Simple(0.05, function()
			if IsValid(self) then
				self:PlayAnim("burrow_out", true, false)
				VJ.EmitSound(self, sdBurrow, 70, math.random(80, 100))
				timer.Simple(0.12, function()
					if IsValid(self) then
						self:SetNoDraw(false)
						self:SetState()
					end
				end)
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "ASW_Drone.Footstep" then
		self:PlayFootstepSound()
	elseif key == "ASW_Drone.Hit" then
		self:ExecuteMeleeAttack()
	//elseif key == "ASW_Drone.Burrow" then -- Plays at the initial frame, so it's useless
		//self:SetNoDraw(false)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCallForHelp(ally, isFirst)
	if !isFirst then return end
	timer.Simple(1, function()
		if IsValid(self) then
			ParticleEffectAttach("vj_acid_impact3_gas", PATTACH_POINT_FOLLOW, self, 6)
			ParticleEffectAttach("vj_acid_impact3_floaters", PATTACH_POINT_FOLLOW, self, 6)
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo, hitgroup, status)
	if status == "Init" then
		local dmgAmt = dmginfo:GetDamage()
		if dmgAmt > 25 then
			self.AnimTbl_Flinch = "flinch_big"
		elseif dmgAmt > 15 then
			self.AnimTbl_Flinch = "flinch_medium"
		else
			self.AnimTbl_Flinch = "flinch_small"
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		-- High damage force, don't play death animation
		if dmginfo:GetDamageForce():Length() > 10000 then
			self.HasDeathAnimation = false
		end
		
		-- Certain damage types cause it to use gibbed bodygroup AND not play death animation
		if self:GetBodygroup(0) != 1 && self:IsGibDamage(dmginfo:GetDamageType()) then
			self:SetBodygroup(0, 2)
			self.HasDeathAnimation = false
		end
	end
end