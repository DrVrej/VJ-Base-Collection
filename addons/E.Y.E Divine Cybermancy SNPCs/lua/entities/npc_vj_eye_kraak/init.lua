AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_eye/kraak.mdl"
ENT.StartHealth = 600
ENT.HullType = HULL_MEDIUM
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_METASTREUMONIC"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDistance = 95
ENT.MeleeAttackDamageDistance = 100

ENT.HasExtraMeleeAttackSounds = true
ENT.DisableFootStepSoundTimer = true

ENT.SoundTbl_FootStep = {"vj_eye/kraak/tank_walk01.wav", "vj_eye/kraak/tank_walk02.wav", "vj_eye/kraak/tank_walk03.wav", "vj_eye/kraak/tank_walk04.wav", "vj_eye/kraak/tank_walk05.wav", "vj_eye/kraak/tank_walk06.wav"} //"physics/plaster/ceiling_tile_step4.wav"
ENT.SoundTbl_Idle = {"vj_eye/kraak/kranagull_idle_1.wav", "vj_eye/kraak/kranagull_idle_2.wav"}
ENT.SoundTbl_Alert = {"vj_eye/kraak/kranagull_scream_3.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_eye/kraak/kranagull_scream_5.wav", "vj_eye/kraak/kranagull_scream_9.wav", "vj_eye/kraak/kranagull_scream_10.wav"}
ENT.SoundTbl_MeleeAttackExtra = "VJ.Impact.Metal_Crush"
ENT.SoundTbl_MeleeAttackMiss = {"vj_eye/swipe01.wav", "vj_eye/swipe02.wav", "vj_eye/swipe03.wav"}
ENT.SoundTbl_Pain = {"vj_eye/kraak/kranagull_scream_6.wav"}
ENT.SoundTbl_Death = {"vj_eye/kraak/kranagull_scream_7.wav", "vj_eye/kraak/kranagull_scream_8.wav"}

local sdAlertRegular = "vj_eye/kraak/kranagull_scream_4.wav"
local sdAlertAngry = "vj_eye/kraak/kranagull_scream_3.wav"
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(30, 30, 150), Vector(-30, -30, 0))
	self:SetStepHeight(90)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local getEventName = util.GetAnimEventNameByID
--
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	local eventName = getEventName(ev)
	if eventName == "AE_KRAAK_ATTACK_LEFT" or eventName == "AE_KRAAK_ATTACK_RIGHT" then
		self:ExecuteMeleeAttack()
	elseif ev == 2050 or ev == 2051 then -- Predefined by the engine, so IDs are always the same
		self:PlayFootstepSound()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnFootstepSound(moveType, sdFile)
	util.ScreenShake(self:GetPos(), 10, 100, 0.4, 500)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled then return end
	if math.random(1, 2) == 1 then
		self.SoundTbl_Alert = sdAlertAngry
		self:PlayAnim(ACT_ARM, true, false, true)
	else
		self.SoundTbl_Alert = sdAlertRegular
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "Init" then
		local curSeq = self:GetSequenceName(self:GetSequence())
		if curSeq == "Melee" or curSeq == "Melee2" then -- Smashes
			self.MeleeAttackDamage = 75
			self.HasMeleeAttackKnockBack = false
		else -- Slashes | "Melee3", "Melee4"
			self.MeleeAttackDamage = 60
			self.HasMeleeAttackKnockBack = true
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward()*math.random(200, 230) + self:GetUp()*math.random(300, 330)
end