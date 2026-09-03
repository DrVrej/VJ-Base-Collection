AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.StartHealth = 100
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 32
ENT.MeleeAttackDamageDistance = 85
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 5
ENT.MeleeAttackBleedEnemy = true

ENT.HasLeapAttack = true
ENT.AnimTbl_LeapAttack = ACT_JUMP
ENT.LeapAttackMaxDistance = 400
ENT.LeapAttackMinDistance = 150
ENT.TimeUntilLeapAttackDamage = 0.2
ENT.NextLeapAttackTime = 3
ENT.NextAnyAttackTime_Leap = 0.4
ENT.LeapAttackExtraTimers = {0.4, 0.6, 0.8, 1}
ENT.TimeUntilLeapAttackVelocity = 0.2
ENT.LeapAttackDamage = 15
ENT.LeapAttackDamageDistance = 100

ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true

ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav", "npc/zombie/foot2.wav", "npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {"vj_zombies/fast/idle1.wav", "vj_zombies/fast/idle2.wav", "vj_zombies/fast/idle3.wav", "vj_zombies/fast/idle4.wav", "vj_zombies/fast/idle5.wav"}
ENT.SoundTbl_Alert = {"vj_zombies/fast/alert1.wav", "vj_zombies/fast/alert2.wav", "vj_zombies/fast/alert3.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_zombies/fast/attack1.wav", "vj_zombies/fast/attack2.wav", "vj_zombies/fast/attack3.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"npc/zombie/claw_strike1.wav", "npc/zombie/claw_strike2.wav", "npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_zombies/miss1.wav", "vj_zombies/miss2.wav", "vj_zombies/miss3.wav", "vj_zombies/miss4.wav"}
ENT.SoundTbl_LeapAttackJump = {"vj_zombies/fast/leap1.wav", "vj_zombies/fast/leap2.wav", "vj_zombies/fast/leap3.wav"}
ENT.SoundTbl_LeapAttackDamage = {"npc/zombie/claw_strike1.wav", "npc/zombie/claw_strike2.wav", "npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_Pain = {"vj_zombies/fast/pain1.wav", "vj_zombies/fast/pain2.wav", "vj_zombies/fast/pain3.wav"}
ENT.SoundTbl_Death = {"vj_zombies/fast/die1.wav", "vj_zombies/fast/die2.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:PreInit()
	if !self.Model then
		-- Have to randomize it here soo all types spawn equally since some are only skins
		local randModel = math.random(1, 7)
		if randModel == 1 then
			self.Model = "models/vj_zombies/fast1.mdl"
		elseif randModel == 2 then
			self.Model = "models/vj_zombies/fast2.mdl"
		elseif randModel == 3 then
			self.Model = "models/vj_zombies/fast3.mdl"
		elseif randModel == 4 then
			self.Model = "models/vj_zombies/fast4.mdl"
			self:SetSkin(1)
		elseif randModel == 5 then
			self.Model = "models/vj_zombies/fast4.mdl"
			self:SetSkin(2)
		elseif randModel == 6 then
			self.Model = "models/vj_zombies/fast4.mdl"
			self:SetSkin(3)
		else
			self.Model = "models/vj_zombies/fast4.mdl"
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(13, 13, 50), Vector(-13, -13, 0))
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
	if act == ACT_IDLE then
		if !self:OnGround() && !self:IsMoving() then
			return ACT_GLIDE
		elseif self:IsOnFire() then
			return ACT_IDLE_ON_FIRE
		end
	elseif act == ACT_CLIMB_DOWN then -- Because there is no animation, so just use climb up!
		return ACT_CLIMB_UP
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnLeapAttack(status, enemy)
	if status == "Jump" then
		return VJ.CalculateTrajectory(self, enemy, "Curve", self:GetPos() + self:OBBCenter(), enemy:GetPos() + enemy:OBBCenter(), 25) + self:GetForward() * 80
	end
end