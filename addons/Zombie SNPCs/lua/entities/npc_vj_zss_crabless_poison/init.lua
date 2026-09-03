AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/zombie/poison.mdl"
ENT.StartHealth = 250
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = {"vjseq_melee_01", "vjseq_melee_03"} -- "melee_02" has unaligned animation event
ENT.MeleeAttackDistance = 32
ENT.MeleeAttackDamageDistance = 85
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 40
ENT.MeleeAttackBleedEnemy = true

ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true

ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav", "npc/zombie/foot2.wav", "npc/zombie/foot3.wav"}
ENT.SoundTbl_Breath = "npc/zombie_poison/pz_breathe_loop1.wav"
ENT.SoundTbl_Idle = {"npc/zombie_poison/pz_idle2.wav", "npc/zombie_poison/pz_idle3.wav", "npc/zombie_poison/pz_idle4.wav"}
ENT.SoundTbl_Alert = {"npc/zombie_poison/pz_alert1.wav", "npc/zombie_poison/pz_alert2.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombie_poison/pz_warn1.wav", "npc/zombie_poison/pz_warn2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_zombies/miss1.wav", "vj_zombies/miss2.wav", "vj_zombies/miss3.wav", "vj_zombies/miss4.wav"}
ENT.SoundTbl_Pain = {"npc/zombie_poison/pz_pain1.wav", "npc/zombie_poison/pz_pain2.wav", "npc/zombie_poison/pz_pain3.wav"}
ENT.SoundTbl_Death = {"npc/zombie_poison/pz_die1.wav", "npc/zombie_poison/pz_die2.wav"}

ENT.MainSoundPitch = 100

-- Custom
ENT.Zombie_ActFireWalk = -1 -- Uses an undefined animation
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(15, 15, 50), Vector(-15, -15, 0))
	self.Zombie_ActFireWalk = self:GetSequenceActivity(self:LookupSequence("FireWalk"))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if self:IsOnFire() && (act == ACT_RUN or act == ACT_WALK) then
		return self.Zombie_ActFireWalk
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local getEventName = util.GetAnimEventNameByID
--
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	local eventName = getEventName(ev)
	if eventName == "AE_ZOMBIE_STEP_LEFT" or eventName == "AE_ZOMBIE_STEP_RIGHT" then
		self:PlayFootstepSound()
	elseif eventName == "AE_ZOMBIE_ATTACK_RIGHT" or eventName == "AE_ZOMBIE_ATTACK_LEFT" or eventName == "AE_ZOMBIE_ATTACK_BOTH" then
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled then return end
	self:PlayAnim("throwwarning", true, false, true)
end