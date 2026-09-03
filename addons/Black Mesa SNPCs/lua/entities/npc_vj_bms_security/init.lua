AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/humans/guard.mdl"
ENT.StartHealth = 60
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_BLACK_MESA_PERSONNEL", "CLASS_PLAYER_ALLY"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.AlliedWithPlayerAllies = true
ENT.BecomeEnemyToPlayer = 2
ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = "vjseq_swing"
ENT.MeleeAttackDamage = 10
ENT.FootstepSoundTimerRun = 0.4
ENT.FootstepSoundTimerWalk = 0.5
ENT.HasOnPlayerSight = true
ENT.CanFlinch = true

ENT.SoundTbl_Idle = {"vj_bms_securityguard/Idle1.wav", "vj_bms_securityguard/Idle2.wav", "vj_bms_securityguard/Idle3.wav", "vj_bms_securityguard/Idle4.wav", "vj_bms_securityguard/Idle5.wav", "vj_bms_securityguard/Idle6.wav", "vj_bms_securityguard/Idle7.wav", "vj_bms_securityguard/Idle8.wav", "vj_bms_securityguard/Idle9.wav", "vj_bms_securityguard/Idle10.wav", "vj_bms_securityguard/Idle11.wav", "vj_bms_securityguard/Idle12.wav"}
ENT.SoundTbl_Alert = {"vj_bms_securityguard/alert1.wav", "vj_bms_securityguard/alert2.wav", "vj_bms_securityguard/alert3.wav", "vj_bms_securityguard/alert4.wav", "vj_bms_securityguard/alert5.wav", "vj_bms_securityguard/alert6.wav"}
ENT.SoundTbl_CombatIdle = {"vj_bms_securityguard/attack1.wav", "vj_bms_securityguard/attack2.wav", "vj_bms_securityguard/attack3.wav", "vj_bms_securityguard/attack4.wav", "vj_bms_securityguard/attack5.wav", "vj_bms_securityguard/attack6.wav", "vj_bms_securityguard/attack7.wav", "vj_bms_securityguard/attack8.wav", "vj_bms_securityguard/attack9.wav", "vj_bms_securityguard/attack10.wav", "vj_bms_securityguard/attack11.wav", "vj_bms_securityguard/attack12.wav", }
ENT.SoundTbl_GrenadeSight = {"vj_bms_securityguard/nade1.wav", "vj_bms_securityguard/nade2.wav", "vj_bms_securityguard/nade3.wav", "vj_bms_securityguard/nade4.wav", "vj_bms_securityguard/nade5.wav", "vj_bms_securityguard/nade6.wav"}
ENT.SoundTbl_Pain = {"vj_bms_securityguard/pain1.wav", "vj_bms_securityguard/pain2.wav", "vj_bms_securityguard/pain3.wav", "vj_bms_securityguard/pain4.wav", "vj_bms_securityguard/pain5.wav", "vj_bms_securityguard/pain6.wav"}
ENT.SoundTbl_Death = {"vj_bms_securityguard/die1.wav", "vj_bms_securityguard/die2.wav", "vj_bms_securityguard/die3.wav", "vj_bms_securityguard/die4.wav", "vj_bms_securityguard/die5.wav", "vj_bms_securityguard/die6.wav"}
ENT.SoundTbl_FollowPlayer = {"vj_bms_securityguard/startfollowing1.wav", "vj_bms_securityguard/startfollowing2.wav", "vj_bms_securityguard/startfollowing3.wav", "vj_bms_securityguard/startfollowing4.wav", "vj_bms_securityguard/startfollowing5.wav", "vj_bms_securityguard/startfollowing6.wav"}
ENT.SoundTbl_UnFollowPlayer = {"vj_bms_securityguard/stopfollowing1.wav", "vj_bms_securityguard/stopfollowing2.wav", "vj_bms_securityguard/stopfollowing3.wav", "vj_bms_securityguard/stopfollowing4.wav", "vj_bms_securityguard/stopfollowing5.wav", "vj_bms_securityguard/stopfollowing6.wav"}
ENT.SoundTbl_BecomeEnemyToPlayer = {"vj_bms_securityguard/hateplayer1.wav", "vj_bms_securityguard/hateplayer2.wav", "vj_bms_securityguard/hateplayer3.wav", "vj_bms_securityguard/hateplayer4.wav", "vj_bms_securityguard/hateplayer5.wav", "vj_bms_securityguard/hateplayer6.wav"}
ENT.SoundTbl_OnPlayerSight = {"vj_bms_securityguard/sawplayer1.wav", "vj_bms_securityguard/sawplayer2.wav", "vj_bms_securityguard/sawplayer3.wav", "vj_bms_securityguard/sawplayer4.wav", "vj_bms_securityguard/sawplayer5.wav", "vj_bms_securityguard/sawplayer6.wav", }
ENT.SoundTbl_DamageByPlayer = {"vj_bms_securityguard/stupidplayer1.wav", "vj_bms_securityguard/stupidplayer2.wav", "vj_bms_securityguard/stupidplayer3.wav", "vj_bms_securityguard/stupidplayer4.wav", "vj_bms_securityguard/stupidplayer5.wav", "vj_bms_securityguard/stupidplayer6.wav"}
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetSkin(math.random(0, 14))
	self:SetBodygroup(2, math.random(0, 1)) -- Helmet
	if math.random(0, 6) == 0 then -- Vest
		self:SetBodygroup(3, 0)
	else
		self:SetBodygroup(3, math.random(1, 2))
	end
	self:SetBodygroup(5, math.random(0, 1)) -- Flashlight
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Security_WeaponHolster(Type)
	local curWep = self:GetActiveWeapon()
	if !IsValid(curWep) or curWep:GetClass() != "weapon_vj_glock17" then self:SetBodygroup(4, 2) return end
	if Type == 0 then
		if self:GetWeaponState() != VJ.WEP_STATE_HOLSTERED then
			self:PlayAnim("drawpistol", true, 0.4, false)
		end
		VJ.EmitSound(self, "vj_bms_securityguard/pistol_holster.wav", 70)
		self:SetWeaponState(VJ.WEP_STATE_HOLSTERED)
		timer.Simple(0.25, function()
			if IsValid(self) then
				self:SetBodygroup(4, 1)
				curWep:SetDrawWorldModel(false)
			end
		end)
	elseif Type == 1 then
		self:PlayAnim("drawpistol", true, false, true)
		VJ.EmitSound(self, "vj_bms_securityguard/pistol_draw.wav", 70)
		self:SetWeaponState()
		timer.Simple(0.4, function()
			if IsValid(self) then
				self:SetBodygroup(4, 2)
				curWep:SetDrawWorldModel(true)
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnWeaponChange(newWeapon, oldWeapon, invSwitch)
	if !invSwitch && newWeapon:GetClass() == "weapon_vj_glock17" then
		self:SetWeaponState(VJ.WEP_STATE_HOLSTERED)
		self:SetBodygroup(4, 1)
		newWeapon:SetDrawWorldModel(false)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	if self.Dead or self:IsBusy("Activities") then return end
	if IsValid(self:GetEnemy()) then
		if self:GetWeaponState() == VJ.WEP_STATE_HOLSTERED then self:Security_WeaponHolster(1) end
	elseif self:GetWeaponState() == VJ.WEP_STATE_READY && (CurTime() - self.EnemyData.TimeSet) > 5 then
		self:Security_WeaponHolster(0)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorRed = VJ.Color2Byte(Color(130, 19, 10))
--
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	self.HasDeathSounds = false
	if self.HasGibOnDeathEffects then
		local effectData = EffectData()
		effectData:SetOrigin(self:GetPos() + self:OBBCenter())
		effectData:SetColor(colorRed)
		effectData:SetScale(120)
		util.Effect("VJ_Blood1", effectData)
		effectData:SetScale(8)
		effectData:SetFlags(3)
		effectData:SetColor(0)
		util.Effect("bloodspray", effectData)
		util.Effect("bloodspray", effectData)
	end
	
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/brain.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 68)), Ang=self:GetAngles()+Angle(0, -90, 0)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 65)), Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(150, 250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:LocalToWorld(Vector(0, 3, 65)), Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(-150, -250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/guard/torso.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-100, 100)+self:GetForward()*math.Rand(-100, 100)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/guard/right_leg.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(100, 250)+self:GetForward()*math.Rand(-300, 300)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/guard/right_leg.mdl", {Pos=self:LocalToWorld(Vector(0, 7, 0)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-100, -250)+self:GetForward()*math.Rand(-300, 300)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/guard/right_arm.mdl", {Pos=self:LocalToWorld(Vector(0, 4, 5)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(150, 250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("prop_ragdoll", "models/gibs/humans/guard/left_arm.mdl", {Pos=self:LocalToWorld(Vector(0, -5, 7)), Ang=self:GetAngles(), Vel=self:GetRight()*math.Rand(-150, -250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 31))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 32))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 35))})
	return true
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeathWeaponDrop(dmginfo, hitgroup, wepEnt)
	self:SetBodygroup(4, 2)
	if wepEnt.IsVJBaseWeapon then
		wepEnt:SetDrawWorldModel(true)
	end
end