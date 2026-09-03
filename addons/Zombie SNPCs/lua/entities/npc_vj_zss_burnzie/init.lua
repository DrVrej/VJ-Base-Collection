AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_zombies/burnzie.mdl"
ENT.StartHealth = 200
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.Immune_Fire = true

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 32
ENT.MeleeAttackDamageDistance = 85
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 20

ENT.DisableFootStepSoundTimer = true

ENT.SoundTbl_FootStep = {"npc/zombie/foot1.wav", "npc/zombie/foot2.wav", "npc/zombie/foot3.wav"}
ENT.SoundTbl_Idle = {"vj_zombies/special/idle1.wav", "vj_zombies/special/idle2.wav", "vj_zombies/special/idle3.wav", "vj_zombies/special/idle4.wav", "vj_zombies/special/idle5.wav", "vj_zombies/special/idle6.wav"}
ENT.SoundTbl_Alert = {"vj_zombies/special/alert1.wav", "vj_zombies/special/alert2.wav"}
ENT.SoundTbl_MeleeAttack = {"npc/zombie/claw_strike1.wav", "npc/zombie/claw_strike2.wav", "npc/zombie/claw_strike3.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_zombies/miss1.wav", "vj_zombies/miss2.wav", "vj_zombies/miss3.wav", "vj_zombies/miss4.wav"}
ENT.SoundTbl_Pain = {"vj_zombies/special/pain1.wav", "vj_zombies/special/pain2.wav", "vj_zombies/special/pain3.wav", "vj_zombies/special/pain4.wav", "vj_zombies/special/pain5.wav", "vj_zombies/special/pain6.wav"}
ENT.SoundTbl_Death = {"vj_zombies/special/die1.wav", "vj_zombies/special/die2.wav", "vj_zombies/special/die3.wav"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(13, 13, 60), Vector(-13, -13, 0))
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
function ENT:Controller_Initialize(ply, controlEnt)
	ply:ChatPrint("JUMP: Ignite or Extinguish the Fire")
	
	function controlEnt:OnKeyBindPressed(key)
		if key == IN_JUMP then
			local npc = self.VJCE_NPC
			if !npc:IsOnFire() then
				npc:Ignite(99999)
				self.VJCE_Player:PrintMessage(HUD_PRINTCENTER, "Igniting!")
			else
				npc:Extinguish()
				self.VJCE_Player:PrintMessage(HUD_PRINTCENTER, "Extinguishing!")
			end
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if self:IsOnFire() then
		if act == ACT_IDLE then
			return ACT_IDLE_ON_FIRE
		elseif act == ACT_RUN or act == ACT_WALK then
			return ACT_WALK_ON_FIRE
		end
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnStateChange(oldState, newState)
	-- Set fire when its been alerted or seen an enemy
	if !self.VJ_IsBeingControlled then
		if newState == NPC_STATE_ALERT or newState == NPC_STATE_COMBAT then
			self:Ignite(99999)
		else
			self:Extinguish()
		end
	end
	self.BaseClass.OnStateChange(self, oldState, newState)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "PreDamage" && self:IsOnFire() then
		ent:Ignite(math.Rand(3, 5))
	end
end