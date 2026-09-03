AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_zombies/zombine.mdl"
ENT.StartHealth = 200
ENT.HullType = HULL_WIDE_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK2
ENT.TimeUntilMeleeAttackDamage = false
ENT.MeleeAttackDamage = 35
ENT.MeleeAttackDistance = 30
ENT.MeleeAttackDamageDistance = 70
ENT.MeleeAttackPlayerSpeed = true
ENT.MeleeAttackBleedEnemy = true

ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_FLINCH_PHYSICS
ENT.FlinchHitGroupMap = {
	{HitGroup = HITGROUP_HEAD, Animation = ACT_FLINCH_HEAD},
	{HitGroup = HITGROUP_LEFTARM, Animation = ACT_FLINCH_LEFTARM},
	{HitGroup = HITGROUP_RIGHTARM, Animation = ACT_FLINCH_RIGHTARM},
	{HitGroup = HITGROUP_LEFTLEG, Animation = ACT_FLINCH_LEFTLEG},
	{HitGroup = HITGROUP_RIGHTLEG, Animation = ACT_FLINCH_RIGHTLEG}
}

ENT.SoundTbl_FootStep = {"npc/zombine/gear1.wav", "npc/zombine/gear2.wav", "npc/zombine/gear3.wav"}
ENT.SoundTbl_Idle = {"npc/zombine/zombine_idle1.wav", "npc/zombine/zombine_idle2.wav", "npc/zombine/zombine_idle3.wav", "npc/zombine/zombine_idle4.wav"}
ENT.SoundTbl_Alert = {"npc/zombine/zombine_alert1.wav", "npc/zombine/zombine_alert2.wav", "npc/zombine/zombine_alert3.wav", "npc/zombine/zombine_alert5.wav", "npc/zombine/zombine_alert6.wav", "npc/zombine/zombine_alert7.wav"} -- "npc/zombine/zombine_alert4.wav" is broken so skip
ENT.SoundTbl_BeforeMeleeAttack = {"npc/zombine/zombine_charge1.wav", "npc/zombine/zombine_charge2.wav", "npc/zombine/zombine_readygrenade1.wav", "npc/zombine/zombine_readygrenade2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_zombies/miss1.wav", "vj_zombies/miss2.wav", "vj_zombies/miss3.wav", "vj_zombies/miss4.wav"}
ENT.SoundTbl_Pain = {"npc/zombine/zombine_pain1.wav", "npc/zombine/zombine_pain2.wav", "npc/zombine/zombine_pain3.wav", "npc/zombine/zombine_pain4.wav"}
ENT.SoundTbl_Death = {"npc/zombine/zombine_die1.wav", "npc/zombine/zombine_die2.wav"}

ENT.MainSoundPitch = 100

-- Custom
ENT.Zombie_GrenadeOut = false -- Can only do it once!
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(13, 13, 60), Vector(-13, -13, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnInput(key, activator, caller, data)
	//print(key)
	if key == "step" then
		self:PlayFootstepSound()
	elseif key == "melee" then
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply)
	ply:ChatPrint("JUMP: To Pull Grenade (One time event!)")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	-- We have an active grenade
	if IsValid(self.Zombie_Grenade) then
		if act == ACT_IDLE then
			return ACT_HANDGRENADE_THROW1
		elseif (act == ACT_WALK or act == ACT_RUN) && IsValid(self:GetEnemy()) then
			if self.EnemyData.Distance < 1024 then -- Make it run when close to the enemy
				return ACT_HANDGRENADE_THROW3
			else
				return ACT_HANDGRENADE_THROW2
			end
		end
	elseif (act == ACT_WALK or act == ACT_RUN) then
		if self:IsOnFire() then
			return ACT_WALK_ON_FIRE
		elseif  IsValid(self:GetEnemy()) then
			if self.EnemyData.Distance < 1024 then -- Make it run when close to the enemy
				return ACT_RUN
			else
				return ACT_WALK
			end
		end
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	-- Pull out the grenade
	if !self.Zombie_GrenadeOut then
		if self.VJ_IsBeingControlled then
			if self.VJ_TheController:KeyDown(IN_JUMP) then
				self.VJ_TheController:PrintMessage(HUD_PRINTCENTER, "Pulling Grenade Out!")
				self:Zombie_CreateGrenade()
			end
		elseif IsValid(self:GetEnemy()) && self.EnemyData.Distance <= 256 && self:Health() <= 40 then
			self:Zombie_CreateGrenade()
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackTraceDirection()
	return self:GetForward()
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Zombie_CreateGrenade()
	self.Zombie_GrenadeOut = true
	self:PlayAnim(ACT_SLAM_DETONATOR_DRAW, true, false, true)
	timer.Simple(0.6, function()
		if IsValid(self) then
			local grenade = ents.Create("npc_grenade_frag")
			grenade:SetOwner(self)
			grenade:SetParent(self)
			grenade:Fire("SetParentAttachment", "grenade_attachment")
			grenade:Spawn()
			grenade:Activate()
			grenade:Input("SetTimer", self, self, 3)
			grenade.VJ_ID_Grabbable = false -- So humans won't pick it up
			self.Zombie_Grenade = grenade
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Finish" then
		local grenade = self.Zombie_Grenade
		if IsValid(grenade) then
			local att = self:GetAttachment(self:LookupAttachment("grenade_attachment"))
			grenade:SetOwner(NULL)
			grenade:SetParent(NULL)
			grenade:Fire("ClearParent")
			grenade:SetMoveType(MOVETYPE_VPHYSICS)
			grenade:SetPos(att.Pos)
			grenade:SetAngles(att.Ang)
			local phys = grenade:GetPhysicsObject()
			if IsValid(phys) then
				phys:EnableGravity(true)
				phys:Wake()
			end
		end
	end
end