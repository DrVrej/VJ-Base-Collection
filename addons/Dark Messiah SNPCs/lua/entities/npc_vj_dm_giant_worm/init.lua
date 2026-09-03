AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_DARKMESSIAH/giantworm.mdl"
ENT.StartHealth = 8000
ENT.HullType = HULL_LARGE
ENT.VJ_ID_Boss = true
ENT.MovementType = VJ_MOVETYPE_STATIONARY
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_DARK_MESSIAH"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasBloodPool = false
ENT.Immune_Toxic = true

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_RELOAD
ENT.MeleeAttackDistance = 950
ENT.MeleeAttackDamageDistance = 1100
ENT.TimeUntilMeleeAttackDamage = 2.1
ENT.MeleeAttackDamage = 90
ENT.HasMeleeAttackKnockBack = true

ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = ACT_COWER
ENT.RangeAttackProjectiles = "obj_vj_dm_gas"
ENT.RangeAttackMaxDistance = 10000
ENT.RangeAttackMinDistance = 1000
ENT.NextRangeAttackTime = 0
ENT.TimeUntilRangeAttackProjectileRelease = 1.8

ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = "worm_die"
ENT.DeathAnimationTime = false
ENT.HasSoundTrack = true

ENT.CanFlinch = "DamageTypes"
ENT.FlinchChance = 7
ENT.AnimTbl_Flinch = {"worm_hit_back", "worm_hit_front"}

ENT.SoundTbl_Breath = "vj_darkmessiah/giantworm/worm_idleloop.wav"
ENT.SoundTbl_Idle = {"vj_darkmessiah/giantworm/worm_strafe0.wav", "vj_darkmessiah/giantworm/worm_strafe1.wav", "vj_darkmessiah/giantworm/worm_strafe2.wav", "vj_darkmessiah/giantworm/worm_strafe3.wav", "vj_darkmessiah/giantworm/worm_idle0.wav", "vj_darkmessiah/giantworm/worm_idle1.wav", "vj_darkmessiah/giantworm/worm_idle2.wav", "vj_darkmessiah/giantworm/worm_idlegrowl0.wav", "vj_darkmessiah/giantworm/worm_idlegrowl1.wav"}
ENT.SoundTbl_Alert = {"vj_darkmessiah/giantworm/worm_in_quick.wav", "vj_darkmessiah/giantworm/worm_idlegrowl2.wav", "vj_darkmessiah/giantworm/worm_idlegrowl3.wav"}
ENT.SoundTbl_MeleeAttack = {"vj_darkmessiah/giantworm/worm_striking0.wav", "vj_darkmessiah/giantworm/worm_striking1.wav", "vj_darkmessiah/giantworm/worm_striking2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"vj_darkmessiah/giantworm/worm_whoosh0.wav", "vj_darkmessiah/giantworm/worm_whoosh1.wav", "vj_darkmessiah/giantworm/worm_whoosh2.wav"}
ENT.SoundTbl_RangeAttack = {"vj_darkmessiah/giantworm/worm_strikingpoison0.wav", "vj_darkmessiah/giantworm/worm_strikingpoison1.wav", "vj_darkmessiah/giantworm/worm_strikingpoison2.wav"}
ENT.SoundTbl_Pain = {"vj_darkmessiah/giantworm/worm_ouch0.wav", "vj_darkmessiah/giantworm/worm_ouch1.wav", "vj_darkmessiah/giantworm/worm_ouch2.wav", "vj_darkmessiah/giantworm/worm_ouch3.wav"}
ENT.SoundTbl_Death = "vj_darkmessiah/giantworm/worm_dying.wav"
ENT.SoundTbl_SoundTrack = {"vj_darkmessiah/giantworm/Dark Messiah - The Worm From The Deep.mp3"}

ENT.AlertSoundLevel = 100
ENT.IdleSoundLevel = 100
ENT.MeleeAttackSoundLevel = 100
ENT.ExtraMeleeAttackSoundLevel = 100
ENT.MeleeAttackMissSoundLevel = 100
ENT.PainSoundLevel = 100
ENT.DeathSoundLevel = 100
ENT.RangeAttackSoundLevel = 100

-- Custom
ENT.Worm_IdleAngryAnim = ACT_IDLE
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetPhysicsDamageScale(0)
	self:SetCollisionBounds(Vector(185, 185, 1900), Vector(-185, -185, 0))
	self:SetSurroundingBounds(Vector(600, 600, 2200), Vector(-600, -600, 0))
	self.Worm_IdleAngryAnim = self:GetSequenceActivity(self:LookupSequence("combatidle"))
	self.Worm_CreateMouthEffect = GetConVar("vj_npc_reduce_vfx"):GetInt() == 0
	PrintMessage(HUD_PRINTCENTER, "A Giant Worm Has Been Summoned!")
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:TranslateActivity(act)
	if act == ACT_IDLE && IsValid(self:GetEnemy()) then
		return self.Worm_IdleAngryAnim
	end
	return self.BaseClass.TranslateActivity(self, act)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThink()
	if self.Worm_CreateMouthEffect then
		ParticleEffectAttach("vj_acid_impact3_gas", PATTACH_POINT_FOLLOW, self, 2)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local alertAnims = {"vjseq_worm_taunt_01", "vjseq_worm_taunt_02", "vjseq_worm_grunt"}
--
function ENT:OnAlert(ent)
	if self.VJ_IsBeingControlled then return end
	self:PlayAnim(alertAnims, true, false, true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:MeleeAttackKnockbackVelocity(ent)
	return self:GetForward() * math.random(700, 730) + self:GetUp() * math.random(500, 530)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnMeleeAttackExecute(status, ent, isProp)
	if status == "Miss" then
		util.ScreenShake(self:GetPos(), 16, 100, 1, 2500)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjPos(projectile)
	return self:GetAttachment(self:LookupAttachment("poison")).Pos
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:RangeAttackProjVel(projectile)
	return VJ.CalculateTrajectory(self, self:GetEnemy(), "Curve", projectile:GetPos(), 1, 10)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		PrintMessage(HUD_PRINTCENTER, "A Giant Worm Has Been Defeated!")
	elseif status == "DeathAnim" then
		util.ScreenShake(self:GetPos(), 100, 200, 5.5, 3000)
		timer.Simple(2.5, function()
			if IsValid(self) then
				local effectDust = EffectData()
				effectDust:SetOrigin(self:GetPos())
				util.Effect("VJ_Dust_Medium", effectDust)
				if self.HasSounds == true && self.HasDeathSounds == true then VJ.EmitSound(self, "vj_darkmessiah/building_rubble5.wav", 100) end
			end
		end)
	end
end