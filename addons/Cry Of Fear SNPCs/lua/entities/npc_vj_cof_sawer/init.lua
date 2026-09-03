AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = {"models/cryoffear/sawer/chainsawguy.mdl"}
ENT.StartHealth = GetConVarNumber("vj_cof_sawer_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDistance = 50
ENT.MeleeAttackDamageDistance = 130
ENT.TimeUntilMeleeAttackDamage = 1
ENT.NextAnyAttackTime_Melee = 0.85
ENT.MeleeAttackDamage = GetConVarNumber("vj_cof_sawer_d")
ENT.FootstepSoundTimerRun = 0.4
ENT.FootstepSoundTimerWalk = 0.4
ENT.HasExtraMeleeAttackSounds = true
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = {ACT_COWER}
ENT.DeathAnimationTime = 2

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_SMALL_FLINCH

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Breath = {"boss/sawer/chainsaw_loop.wav"}
ENT.SoundTbl_Alert = {"boss/sawer/sawer_alert10.wav", "boss/sawer/sawer_alert20.wav", "boss/sawer/sawer_alert30.wav"}
ENT.SoundTbl_MeleeAttack = {"boss/sawer/sawer_attack1.wav", "boss/sawer/sawer_attack2.wav"}
ENT.SoundTbl_MeleeAttackMiss = {"boss/sawer/chainsaw_attack.wav"}
ENT.SoundTbl_MeleeAttackExtra = {"boss/sawer/chainsawed_player.wav"}
ENT.SoundTbl_Pain = {"boss/sawer/sawer_pain1.wav", "boss/sawer/sawer_pain2.wav"}
ENT.SoundTbl_Death = {"boss/sawer/eye_open.wav"}

ENT.AlertSoundLevel = 100
ENT.FootstepSoundLevel = 75
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(20, 20, 110), Vector(-20, -20, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkAttack(isAttacking, enemy)
	if isAttacking then return end
	local randattack = math.random(1, 3)
	if randattack == 1 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack1"}
		self.TimeUntilMeleeAttackDamage = 1
		self.NextAnyAttackTime_Melee = 0.667
	elseif randattack == 2 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack2"}
		self.TimeUntilMeleeAttackDamage = 0.95
		self.NextAnyAttackTime_Melee = 0.629
	elseif randattack == 3 then
		self.AnimTbl_MeleeAttack = {"vjseq_attack3"}
		self.TimeUntilMeleeAttackDamage = 1
		self.NextAnyAttackTime_Melee = 0.48
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" then
		timer.Simple(2, function()
			if IsValid(self) then
				self.GibOnDeathFilter = false
				self:GibOnDeath(DamageInfo(), hitgroup) -- dmginfo is corrupt by now, declare a new one
				VJ.ApplyRadiusDamage(self, self, self:GetPos(), 100, 35, DMG_SLASH, true, true, {Force=50})
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	if self.DeathAnimationCodeRan == false then return false end
	
	if self.HasGibOnDeathEffects then
		local bloodeffect = EffectData()
		bloodeffect:SetOrigin(self:GetAttachment(self:LookupAttachment(0)).Pos)
		bloodeffect:SetColor(VJ.Color2Byte(Color(130, 19, 10)))
		bloodeffect:SetScale(150)
		util.Effect("VJ_Blood1", bloodeffect)
		
		local bloodspray = EffectData()
		bloodspray:SetOrigin(self:GetAttachment(self:LookupAttachment(0)).Pos)
		bloodspray:SetScale(8)
		bloodspray:SetFlags(3)
		bloodspray:SetColor(0)
		util.Effect("bloodspray", bloodspray)
		util.Effect("bloodspray", bloodspray)
	end
	
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/brain.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 60)), Ang=self:GetAngles()+Angle(0, -90, 0)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 55)), Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(150, 250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:LocalToWorld(Vector(0, 3, 55)), Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(-150, -250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/heart.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/lung.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/lung.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/liver.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 35))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 35))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 35))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 35))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 35))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	return true, {AllowAnim = true}
end