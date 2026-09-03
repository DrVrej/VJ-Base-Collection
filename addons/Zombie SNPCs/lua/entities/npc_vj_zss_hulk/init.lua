AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_zombies/hulk.mdl"
ENT.StartHealth = 600
ENT.HullType = HULL_MEDIUM_TALL
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 95
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 65
ENT.MeleeAttackPlayerSpeed = true
ENT.MeleeAttackBleedEnemy = true
ENT.DisableFootStepSoundTimer = true
ENT.HasMeleeAttackKnockBack = true
ENT.PropInteraction_MaxScale = 2

ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav", "npc/zombie/foot2.wav", "npc/zombie/foot3.wav"}
ENT.SoundTbl_Breath = "npc/zombie_poison/pz_breathe_loop1.wav"
ENT.SoundTbl_Idle = {"npc/zombie_poison/pz_idle2.wav", "npc/zombie_poison/pz_idle3.wav", "npc/zombie_poison/pz_idle4.wav"}
ENT.SoundTbl_Alert = {"npc/zombie_poison/pz_alert1.wav", "npc/zombie_poison/pz_alert2.wav"}
ENT.SoundTbl_CallForHelp = "npc/zombie_poison/pz_call1.wav"
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie_poison/pz_warn1.wav", "npc/zombie_poison/pz_warn2.wav"}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav", "npc/zombie/claw_strike2.wav", "npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_zombies/miss1.wav", "vj_zombies/miss2.wav", "vj_zombies/miss3.wav", "vj_zombies/miss4.wav"}
ENT.SoundTbl_Pain = {"npc/zombie_poison/pz_pain1.wav", "npc/zombie_poison/pz_pain2.wav", "npc/zombie_poison/pz_pain3.wav"}
ENT.SoundTbl_Death = {"npc/zombie_poison/pz_die1.wav", "npc/zombie_poison/pz_die2.wav"}

ENT.MainSoundPitch = VJ.SET(75, 80)

ENT.FootstepSoundLevel = 80

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(18, 18, 90), Vector(-18, -18, 0))
	self:SetSkin(math.random(0, 3))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	if key == "step" then
		self:PlayFootstepSound()
	elseif key == "melee" then
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_RUN or act == ACT_WALK then
		if self:IsOnFire() then
			return ACT_WALK_ON_FIRE
		-- Run if we are half health
		elseif act == ACT_RUN && (self:GetMaxHealth() / 2) > self:Health() then
			return ACT_RUN
		end
		return ACT_WALK
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
	util.ScreenShake(self:GetPos(), 2, 5, 0.5, 250)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward() * math.random(100, 130) + self:GetUp() * math.random(250, 260)
end