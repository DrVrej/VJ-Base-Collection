AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_alienswarm/betadrone.mdl"
ENT.StartHealth = 80
ENT.HullType = HULL_MEDIUM
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ALIENSWARM"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 80
ENT.MeleeAttackDamageDistance = 100
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 15
ENT.MeleeAttackBleedEnemy = true

ENT.DeathCorpseSetBoneAngles = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationChance = 2
ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH

ENT.SoundTbl_FootStep = {"vj_alienswarm/drone/footstep1a.wav", "vj_alienswarm/drone/footstep1b.wav"}
ENT.SoundTbl_Idle = {"vj_alienswarm/drone/glide01.wav", "vj_alienswarm/drone/glide02.wav", "vj_alienswarm/drone/glide03.wav", "vj_alienswarm/drone/roar01.wav", "vj_alienswarm/drone/roar02.wav"}
ENT.SoundTbl_Alert = {"vj_alienswarm/drone/alert01.wav", "vj_alienswarm/drone/alert02.wav", "vj_alienswarm/drone/alert03.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_alienswarm/drone/attack01.wav", "vj_alienswarm/drone/attack02.wav", "vj_alienswarm/drone/attack03.wav", "vj_alienswarm/drone/attack04.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_alienswarm/drone/swipe01.wav", "vj_alienswarm/drone/swipe02.wav", "vj_alienswarm/drone/swipe03.wav"}
ENT.SoundTbl_Pain = {"vj_alienswarm/drone/pain01.wav", "vj_alienswarm/drone/pain02.wav", "vj_alienswarm/drone/pain03.wav", "vj_alienswarm/drone/pain04.wav", "vj_alienswarm/drone/pain05.wav", "vj_alienswarm/drone/pain06.wav"}
ENT.SoundTbl_Death = {"vj_alienswarm/drone/deathfire01.wav", "vj_alienswarm/drone/deathfire02.wav", "vj_alienswarm/drone/deathfire03.wav", "vj_alienswarm/drone/deathfire04.wav", "vj_alienswarm/drone/death01.wav"}

ENT.FootstepSoundLevel = 55
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetSurroundingBounds(Vector(60, 60, 100), Vector(-60, -60, 0))
	self:SetSkin((math.random(1, 2) == 1 and 0) or 2)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "move" then
		self:PlayFootstepSound()
	elseif key == "melee_hit" then
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFlinch(dmginfo, hitgroup, status)
	if status == "Init" then
		if dmginfo:GetDamage() > 20 then
			self.AnimTbl_Flinch = ACT_BIG_FLINCH
		else
			self.AnimTbl_Flinch = ACT_SMALL_FLINCH
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	-- High damage force, don't play death animation
	if status == "Init" && dmginfo:GetDamageForce():Length() > 10000 then
		self.HasDeathAnimation = false
	end
end