AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/zombies/zombie_sci.mdl"
ENT.StartHealth = 50
ENT.HullType = HULL_WIDE_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_ZOMBIE"}
ENT.BloodColor = VJ.BLOOD_COLOR_YELLOW

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 40
ENT.MeleeAttackDamageDistance = 60
ENT.TimeUntilMeleeAttackDamage = false

ENT.DisableFootStepSoundTimer = true
ENT.HasExtraMeleeAttackSounds = true

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_FLINCH_PHYSICS

ENT.SoundTbl_FootStep = {"vj_bms_zombies/foot1.wav", "vj_bms_zombies/foot2.wav", "vj_bms_zombies/foot3.wav"}
ENT.SoundTbl_Idle = {"vj_bms_zombies/idle1.wav", "vj_bms_zombies/idle2.wav", "vj_bms_zombies/idle3.wav", "vj_bms_zombies/idle4.wav", "vj_bms_zombies/idle5.wav", "vj_bms_zombies/idle6.wav"}
ENT.SoundTbl_Alert = {"vj_bms_zombies/alert1.wav", "vj_bms_zombies/alert2.wav", "vj_bms_zombies/alert3.wav", "vj_bms_zombies/alert4.wav", "vj_bms_zombies/alert5.wav", "vj_bms_zombies/alert6.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_bms_zombies/attack01.wav", "vj_bms_zombies/attack02.wav", "vj_bms_zombies/attack03.wav", "vj_bms_zombies/attack04.wav", "vj_bms_zombies/attack05.wav", "vj_bms_zombies/attack06.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_bms_zombies/claw_miss1.wav", "vj_bms_zombies/claw_miss2.wav"}
ENT.SoundTbl_Pain = {"vj_bms_zombies/pain1.wav", "vj_bms_zombies/pain2.wav", "vj_bms_zombies/pain3.wav", "vj_bms_zombies/pain4.wav", "vj_bms_zombies/pain5.wav", "vj_bms_zombies/pain7.wav", "vj_bms_zombies/pain8.wav", "vj_bms_zombies/pain9.wav", "vj_bms_zombies/pain10.wav"} /*, "vj_bms_zombies/pain6.wav"*/
ENT.SoundTbl_Death = {"vj_bms_zombies/die1.wav", "vj_bms_zombies/die2.wav", "vj_bms_zombies/die3.wav", "vj_bms_zombies/die4.wav", "vj_bms_zombies/die5.wav"}

local sdFootScuff = {"npc/zombie/foot_slide1.wav", "npc/zombie/foot_slide2.wav", "npc/zombie/foot_slide3.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
local getEventName = util.GetAnimEventNameByID
--
function ENT:OnAnimEvent(ev, evTime, evCycle, evType, evOptions)
	local eventName = getEventName(ev)
	if eventName == "AE_ZOMBIE_STEP_LEFT" or eventName == "AE_ZOMBIE_STEP_RIGHT" then
		self:PlayFootstepSound()
	elseif eventName == "AE_ZOMBIE_SCUFF_LEFT" or eventName == "AE_ZOMBIE_SCUFF_RIGHT" then
		self:PlayFootstepSound(sdFootScuff)
	elseif eventName == "AE_ZOMBIE_ATTACK_LEFT" then
		self.MeleeAttackDamage = 25
		self:ExecuteMeleeAttack()
	elseif eventName == "AE_ZOMBIE_ATTACK_BOTH" then
		self.MeleeAttackDamage = 35
		self:ExecuteMeleeAttack()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if self:IsOnFire() then
		if act == ACT_IDLE then
			return ACT_IDLE_ON_FIRE
		elseif act == ACT_WALK or act == ACT_RUN then
			return ACT_WALK_ON_FIRE
		end
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorYellow = VJ.Color2Byte(Color(255, 221, 35))
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibOnDeathEffects then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetPos() + self:OBBCenter())
		effectData:SetColor(colorYellow)
		effectData:SetScale(120)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(8)
		effectData:SetFlags(3)
		effectData:SetColor(1)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
	end
	
	self:CreateGibEntity("prop_ragdoll", "models/gibs/zombies/zombie_sci/torso.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 13)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-100, 100)+self:GetForward()*math.Rand(-100, 100)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/zombies/zombie_sci/legs.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-100, 100)+self:GetForward()*math.Rand(-50, 50)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/zombies/zombie_sci/right_arm.mdl", {Pos=self:LocalToWorld(Vector(0, 3, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(150, 250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/zombies/zombie_sci/left_arm.mdl", {Pos=self:LocalToWorld(Vector(0, -3, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-150, -250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Small")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	self:CreateGibEntity("obj_vj_gib", "UseAlien_Big")
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo,  hitgroup,  corpse)
	if self:GetBodygroup(1) == 1 then return false end -- Only continue if crab bodygroup is set
	local spawnType = math.random(1, 3)
	local dmgType = dmginfo:GetDamageType()
	if hitgroup == HITGROUP_HEAD then spawnType = math.random(1, 2) end
	if bit.band(dmgType, DMG_CLUB) != 0 or bit.band(dmgType, DMG_SLASH) != 0 then spawnType = 1 end -- Crab stays on if it's melee
	if spawnType == 1 then -- Crab stays on
		self:SetBodygroup(1, 0)
	elseif spawnType == 2 then -- Dead crab spawns
		self:CreateExtraDeathCorpse("prop_ragdoll", "models/VJ_BLACKMESA/headcrab.mdl", {Pos=self:GetAttachment(self:LookupAttachment("headcrab")).Pos})
		corpse:SetBodygroup(1, 1)
	elseif spawnType == 3 then -- Alive crab spawns
		corpse:SetBodygroup(1, 1)
		local crab = ents.Create("npc_headcrab")
		local enemy = self:GetEnemy()
		local pos = self:GetAttachment(self:LookupAttachment("headcrab")).Pos
		crab:SetPos(pos)
		crab:SetAngles(self:GetAngles())
		crab:SetVelocity(dmginfo:GetDamageForce() / 58)
		crab:Spawn()
		crab:Activate()
		if corpse:IsOnFire() then crab:Ignite(math.Rand(8, 10), 0) end
		timer.Simple(0.05, function()
			if IsValid(crab) then
				crab:SetPos(pos)
				if IsValid(enemy) then
					crab:SetEnemy(enemy)
					crab:SetSchedule(SCHED_CHASE_ENEMY)
				end
			end
		end)
	end
end