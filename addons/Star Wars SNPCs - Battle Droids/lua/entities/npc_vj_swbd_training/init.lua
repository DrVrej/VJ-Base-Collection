AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vj_starwars/droid/trainingb1.mdl"
ENT.StartHealth = 50
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_STARWARS_CIS"}
ENT.HasMeleeAttack = true
ENT.MeleeAttackDamage = 10
ENT.HasGrenadeAttack = true -- Should the SNPC have a grenade attack?
ENT.GibOnDeathFilter = false

ENT.CanFlinch = true
ENT.AnimTbl_Flinch = ACT_FLINCH_PHYSICS

ENT.SoundTbl_FootStep = {"vj_battledroid/step1.wav", "vj_battledroid/step2.wav", "vj_battledroid/step3.wav", "vj_battledroid/step4.wav"}
ENT.SoundTbl_Idle = {"vj_battledroid/idle1.wav", "vj_battledroid/idle2.wav", "vj_battledroid/idle3.wav", "vj_battledroid/idle4.wav"}
ENT.SoundTbl_CombatIdle = {"vj_battledroid/talk2.wav", "vj_battledroid/talk6.wav", "vj_battledroid/talk8.wav"}
ENT.SoundTbl_Alert = {"vj_battledroid/alert1.wav", "vj_battledroid/alert2.wav", "vj_battledroid/alert3.wav", "vj_battledroid/alert4.wav"}
ENT.SoundTbl_ReceiveOrder = {"vj_battledroid/roger.wav"}
ENT.SoundTbl_WeaponReload = {"vj_battledroid/talk4.wav", "vj_battledroid/talk5.wav", "vj_battledroid/talk7.wav"}
ENT.SoundTbl_GrenadeSight = {"vj_battledroid/grenade1.wav", "vj_battledroid/grenade2.wav", "vj_battledroid/grenade3.wav", "vj_battledroid/grenade4.wav"}
ENT.SoundTbl_KilledEnemy = {"vj_battledroid/talk1.wav", "vj_battledroid/talk3.wav"}
ENT.SoundTbl_Pain = {"vj_battledroid/pain1.wav", "vj_battledroid/pain2.wav", "vj_battledroid/pain3.wav", "vj_battledroid/pain4.wav", "vj_battledroid/pain5.wav", "vj_battledroid/pain6.wav", "vj_battledroid/pain7.wav", "vj_battledroid/pain8.wav", "vj_battledroid/pain9.wav"}
ENT.SoundTbl_Impact = {"ambient/energy/spark1.wav", "ambient/energy/spark2.wav", "ambient/energy/spark3.wav", "ambient/energy/spark4.wav"}
ENT.SoundTbl_Death = {"vj_battledroid/death1.wav", "vj_battledroid/death2.wav", "vj_battledroid/death3.wav", "vj_battledroid/death4.wav", "vj_battledroid/death5.wav"}

-- Custom
ENT.SW_Droid_All = false
ENT.SW_Droid_Head = false
ENT.SW_Droid_RHand = false
ENT.SW_Droid_LHand = false
ENT.SW_Droid_RLeg = false
ENT.SW_Droid_LLeg = false
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnBleed(dmginfo, hitgroup)
	-- Absorb bullet damage
	if dmginfo:IsBulletDamage() then
		if self.HasSounds && self.HasImpactSounds then VJ.EmitSound(self, "VJ.Impact.Armor") end
		if math.random(1, 3) == 1 then
			dmginfo:ScaleDamage(0.50)
			local spark = ents.Create("env_spark")
			spark:SetKeyValue("Magnitude", "1")
			spark:SetKeyValue("Spark Trail Length", "1")
			spark:SetPos(dmginfo:GetDamagePosition())
			spark:SetAngles(self:GetAngles())
			spark:SetParent(self)
			spark:Spawn()
			spark:Activate()
			spark:Fire("StartSpark", "", 0)
			spark:Fire("StopSpark", "", 0.001)
			self:DeleteOnRemove(spark)
		else
			dmginfo:ScaleDamage(0.80)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:HandleGibOnDeath(dmginfo, hitgroup)
	local doGib = false
	self.DeathCorpseModel = {"models/hfg/starwars/droids/sw_bdroid_training/torso_bg.mdl"}
	if self:IsGibDamage(dmginfo:GetDamageType()) then
		doGib = true
		self.SW_Droid_All = true
		self.DeathCorpseModel = {"models/hfg/starwars/droids/sw_bdroid_training/torso.mdl"}
	end
	
	if hitgroup == HITGROUP_HEAD or self.SW_Droid_All then
		doGib = true
		self.SW_Droid_Head = true
		self:CreateGibEntity("prop_ragdoll", "models/hfg/starwars/droids/sw_bdroid_training/head.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) gib:GetPhysicsObject():SetMass(80) end)
	end
	if hitgroup == HITGROUP_RIGHTARM or self.SW_Droid_All then
		doGib = true
		self.SW_Droid_RHand = true
		self:CreateGibEntity("prop_ragdoll", "models/hfg/starwars/droids/sw_bdroid_training/right_arm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) gib:GetPhysicsObject():SetMass(80) end)
	end
	if hitgroup == HITGROUP_LEFTARM or self.SW_Droid_All then
		doGib = true
		self.SW_Droid_LHand = true
		self:CreateGibEntity("prop_ragdoll", "models/hfg/starwars/droids/sw_bdroid_training/left_arm.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) gib:GetPhysicsObject():SetMass(80) end)
	end
	if hitgroup == HITGROUP_RIGHTLEG or self.SW_Droid_All then
		doGib = true
		self.SW_Droid_RLeg = true
		self:CreateGibEntity("prop_ragdoll", "models/hfg/starwars/droids/sw_bdroid_training/right_leg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) gib:GetPhysicsObject():SetMass(80) end)
	end
	if hitgroup == HITGROUP_LEFTLEG or self.SW_Droid_All then
		doGib = true
		self.SW_Droid_LLeg = true
		self:CreateGibEntity("prop_ragdoll", "models/hfg/starwars/droids/sw_bdroid_training/left_leg.mdl", {Pos=self:GetPos(), Ang=self:GetAngles(), Vel="UseDamageForce", NoFade=true, RemoveOnCorpseDelete=true}, function(gib) gib:GetPhysicsObject():SetMass(80) end)
	end
	if doGib then
		self:PlaySoundSystem("Gib", "ambient/energy/weld2.wav")
		return doGib, {AllowCorpse = true, AllowSound = false}
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local defAng = Angle(0, 0, 0)
--
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	if self.SW_Droid_All then
		ParticleEffect("explosion_turret_break", self:GetPos() + self:OBBCenter(), defAng)
		ParticleEffectAttach("explosion_turret_fizzle", PATTACH_POINT_FOLLOW, corpse, 0)
		timer.Simple(math.Rand(3, 5), function() if IsValid(corpse) then corpse:StopParticles() end end)
	else
		if self.SW_Droid_Head == true then
			corpse:SetBodygroup(0, 1)
		end
		if self.SW_Droid_RHand == true then
			corpse:SetBodygroup(2, 1)
		end
		if self.SW_Droid_LHand == true then
			corpse:SetBodygroup(4, 1)
		end
		if self.SW_Droid_RLeg == true then
			corpse:SetBodygroup(3, 1)
		end
		if self.SW_Droid_LLeg == true then
			corpse:SetBodygroup(5, 1)
		end
	end
end