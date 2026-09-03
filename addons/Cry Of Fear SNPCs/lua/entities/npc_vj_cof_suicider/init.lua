AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cryoffear/suicider/suicider.mdl"
ENT.StartHealth = GetConVarNumber("vj_cof_suicider_h")
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_CRY_OF_FEAR"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED
ENT.HasMeleeAttack = false
ENT.HasRangeAttack = true
ENT.AnimTbl_RangeAttack = false
ENT.AnimTbl_RangeAttack = ACT_IDLE
ENT.RangeAttackMaxDistance = 2000
ENT.RangeAttackMinDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 0.5
ENT.NextRangeAttackTime = 3
ENT.NextAnyAttackTime_Range = 3
ENT.FootstepSoundTimerRun = 0.2
ENT.FootstepSoundTimerWalk = 0.2
ENT.HasDeathCorpse = false
ENT.HasDeathAnimation = true
ENT.AnimTbl_Death = ACT_DIESIMPLE
ENT.DeathAnimationTime = 4

ENT.SoundTbl_FootStep = {"vj_cof_common/npc_step1.wav"}
ENT.SoundTbl_Alert = {"slower/slower_alert10.wav", "slower/slower_alert20.wav", "slower/slower_alert30.wav"}
ENT.SoundTbl_RangeAttack = {"vj_cof_common/suicider_glock_fire.wav"}
ENT.SoundTbl_Pain = {"slower/slower_pain1.wav", "slower/slower_pain2.wav"}
ENT.SoundTbl_Death = {"slower/scream1.wav"}

ENT.FootstepSoundLevel = 75
ENT.RangeAttackSoundLevel = 100

-- Custom
ENT.Suicider_DeathSuicide = false
ENT.Suicider_FiredAtLeastOnce = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(15, 15, 80), Vector(-15, -15, 0))
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Suicider_DoFireEffects()
	local flash = ents.Create("env_muzzleflash")
	flash:SetPos(self:GetAttachment(self:LookupAttachment(1)).Pos)
	flash:SetKeyValue("scale", "1")
	flash:SetKeyValue("angles", tostring(self:GetForward():Angle()))
	flash:Fire("Fire", 0, 0)

	local FireLight1 = ents.Create("light_dynamic")
	FireLight1:SetKeyValue("brightness", "4")
	FireLight1:SetKeyValue("distance", "120")
	FireLight1:SetPos(self:GetAttachment(self:LookupAttachment(1)).Pos)
	FireLight1:SetLocalAngles(self:GetAngles())
	FireLight1:Fire("Color", "255 150 60")
	FireLight1:SetParent(self)
	FireLight1:Spawn()
	FireLight1:Activate()
	FireLight1:Fire("TurnOn", "", 0)
	FireLight1:Fire("Kill", "", 0.07)
	self:DeleteOnRemove(FireLight1)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	if self.Dead == true then return end
	if !IsValid(self:GetEnemy()) then return end
	local EnemyDistance = self:GetPos():Distance(self:GetEnemy():GetPos())
	if EnemyDistance <= 100 && self:GetEnemy():Visible(self) && self.Suicider_FiredAtLeastOnce == true then
		self.Suicider_DeathSuicide = true
		self.Bleeds = false
		self:TakeDamage(999999999999999, self, self)
		self.Bleeds = true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttackExecute(status, enemy, projectile)
	if status == "Init" then
		local bullet = {}
			bullet.Num = 1
			bullet.Src = self:GetPos()+self:OBBCenter() //self:GetAttachment(self:LookupAttachment(1)).Pos
			bullet.Dir = (enemy:GetPos()+enemy:OBBCenter()+enemy:GetUp()*-45) -self:GetPos()
			bullet.Spread = 0.001
			bullet.Tracer = 1
			bullet.TracerName = "Tracer"
			bullet.Force = 5
			bullet.Damage = GetConVarNumber("vj_cof_suicider_d")
			bullet.AmmoType = "SMG1"
		self:FireBullets(bullet)
		self.Suicider_FiredAtLeastOnce = true
		self:Suicider_DoFireEffects()
		return true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "DeathAnim" && self.Suicider_DeathSuicide then
		self.AnimTbl_Death = ACT_DIE_GUTSHOT
		timer.Simple(0.5, function()
			if IsValid(self) then
				self:Suicider_DoFireEffects()
				self:SetBodygroup(0, 1)
				VJ.EmitSound(self, "vj_cof_common/suicider_glock_fire.wav", 100)
				self:PlaySoundSystem("Gib")
				if self.HasGibOnDeathEffects then
					local bloodeffect = EffectData()
					bloodeffect:SetOrigin(self:GetAttachment(self:LookupAttachment(0)).Pos)
					bloodeffect:SetColor(VJ.Color2Byte(Color(130, 19, 10)))
					bloodeffect:SetScale(50)
					util.Effect("VJ_Blood1", bloodeffect)
				end
			end
		end)
	end
end