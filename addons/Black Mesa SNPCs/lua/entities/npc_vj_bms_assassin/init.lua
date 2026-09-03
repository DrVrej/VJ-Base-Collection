AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_BLACKMESA/hassassin.mdl"
ENT.StartHealth = 50
ENT.HullType = HULL_HUMAN
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_BLACKOPS"}
ENT.BloodColor = VJ.BLOOD_COLOR_RED

ENT.HasMeleeAttack = true
ENT.AnimTbl_MeleeAttack = ACT_MELEE_ATTACK1
ENT.MeleeAttackDamage = 10
ENT.MeleeAttackDistance = 35
ENT.MeleeAttackDamageDistance = 70
ENT.TimeUntilMeleeAttackDamage = 0.3
ENT.NextAnyAttackTime_Melee = 0.5

ENT.AnimTbl_WeaponAttack = ACT_RANGE_ATTACK_PISTOL
ENT.Weapon_CanCrouchAttack = false
ENT.Weapon_IgnoreSpawnMenu = true
ENT.Weapon_Accuracy = 0.9

ENT.DamageAllyResponse = false
ENT.CombatDamageResponse_Cooldown = VJ.SET(2, 2.5)
ENT.FootstepSoundTimerRun = 0.3
ENT.FootstepSoundTimerWalk = 0.3

ENT.SoundTbl_FootStep = {"vj_bms_assassin/step1.wav", "vj_bms_assassin/step2.wav"}
ENT.SoundTbl_BeforeMeleeAttack = {"vj_bms_assassin/kick1.wav", "vj_bms_assassin/kick2.wav", "vj_bms_assassin/kick3.wav", "vj_bms_assassin/kick4.wav", "vj_bms_assassin/kick5.wav", "vj_bms_assassin/kick6.wav"}
ENT.SoundTbl_Pain = {"vj_bms_assassin/pain1.wav", "vj_bms_assassin/pain2.wav", "vj_bms_assassin/pain3.wav", "vj_bms_assassin/pain4.wav", "vj_bms_assassin/pain5.wav", "vj_bms_assassin/pain6.wav", }
ENT.SoundTbl_Death = {"vj_bms_assassin/die1.wav", "vj_bms_assassin/die2.wav", "vj_bms_assassin/die3.wav", "vj_bms_assassin/die4.wav", "vj_bms_assassin/die5.wav", "vj_bms_assassin/die6.wav", }

-- Custom
ENT.Assassin_NextJumpT = 0
ENT.Assassin_NextCloakT = 0
ENT.Assassin_Cloaking = false
ENT.Assassin_ControllerCloakLevel = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:CapabilitiesAdd(bit.bor(CAP_MOVE_JUMP))
	//self:SetMaterial("models/effects/vol_ight001_")

	if GetConVarNumber("vj_npc_reduce_vfx") == 0 then
		local eyeglow1 = ents.Create("env_sprite")
		eyeglow1:SetKeyValue("model", "vj_base/sprites/glow.vmt")
		eyeglow1:SetKeyValue("scale", "0.04")
		eyeglow1:SetKeyValue("rendermode", "5")
		eyeglow1:SetKeyValue("rendercolor", "255 0 0")
		eyeglow1:SetKeyValue("spawnflags", "1") -- If animated
		eyeglow1:SetParent(self)
		eyeglow1:Fire("SetParentAttachment", "eye1", 0)
		eyeglow1:Spawn()
		eyeglow1:Activate()
		self:DeleteOnRemove(eyeglow1)
		
		local eyeglow2 = ents.Create("env_sprite")
		eyeglow2:SetKeyValue("model", "vj_base/sprites/glow.vmt")
		eyeglow2:SetKeyValue("scale", "0.04")
		eyeglow2:SetKeyValue("rendermode", "5")
		eyeglow2:SetKeyValue("rendercolor", "255 0 0")
		eyeglow2:SetKeyValue("spawnflags", "1") -- If animated
		eyeglow2:SetParent(self)
		eyeglow2:Fire("SetParentAttachment", "eye2", 0)
		eyeglow2:Spawn()
		eyeglow2:Activate()
		self:DeleteOnRemove(eyeglow2)
		
		util.SpriteTrail(self, 6, Color(200, 0, 0), true, 6, 6, 0.1, 0.04167, "VJ_Base/sprites/trail.vmt")
		util.SpriteTrail(self, 7, Color(200, 0, 0), true, 6, 6, 0.1, 0.04167, "VJ_Base/sprites/trail.vmt")
	end
	
	if self.Weapon_Disabled == false then
		self:Give("weapon_vj_glock17")
		local activeWep = self:GetActiveWeapon()
		if IsValid(activeWep) then
			activeWep.NPC_NextPrimaryFire = 0.15
			activeWep.Primary.Sound = "vj_bms_assassin/silentpistol.wav"
			activeWep.Primary.HasDistantSound = false
			activeWep.Primary.Damage = 10
			activeWep.Primary.ClipSize = activeWep.Primary.ClipSize * 2
			activeWep.PrimaryEffects_MuzzleFlash = false
			activeWep:SetClip1(activeWep.Primary.ClipSize)
			
			local secondGun = ents.Create("prop_physics")
			secondGun:SetModel("models/vj_weapons/w_glock_lh.mdl")
			secondGun:SetLocalPos(self:GetPos())
			//secondGun:SetPos(self:GetPos())
			secondGun:SetOwner(self)
			secondGun:SetParent(self)
			//secondGun:SetLocalAngles(Angle(-120, 0, 90))
			//secondGun:Fire("SetParentAttachmentMaintainOffset", "anim_attachment_LH")
			secondGun:Fire("SetParentAttachment", "anim_attachment_LH")
			secondGun:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
			secondGun:Spawn()
			secondGun:Activate()
			secondGun:SetSolid(SOLID_NONE)
			secondGun:AddEffects(EF_BONEMERGE)
			//secondGun:SetMaterial("models/effects/vol_light001.vmt")
			secondGun:SetRenderMode(RENDERMODE_TRANSALPHA)
			self.SecondGun = secondGun
		end
	end
	timer.Simple(0.1, function() if IsValid(self) then self:SetRenderMode(RENDERMODE_TRANSALPHA) end end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Controller_Initialize(ply)
	ply:ChatPrint("JUMP: Change Camouflage")
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorVis = Color(255, 255, 255, 255)
--
function ENT:BMSASSASSIN_RESETCLOAK()
	self.Assassin_Cloaking = false
	self:SetColor(colorVis)
	self:DrawShadow(true)
	self:RemoveFlags(FL_NOTARGET)
	local curWep = self:GetActiveWeapon()
	if IsValid(curWep) then
		if IsValid(self.SecondGun) then
			self.SecondGun:SetColor(colorVis)
			self.SecondGun:DrawShadow(true)
		end
		curWep:SetDrawWorldModel(true)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
local colorInv = Color(0, 0, 0, 10)
--
function ENT:BMSASSASSIN_DOCLOAK()
	self.Assassin_Cloaking = true
	self:AddFlags(FL_NOTARGET)
	self:SetColor(colorInv)
	self:DrawShadow(false)
	local curWep = self:GetActiveWeapon()
	if IsValid(curWep) then
		if IsValid(self.SecondGun) then
			self.SecondGun:SetColor(colorInv)
			self.SecondGun:DrawShadow(false)
		end
		curWep:SetDrawWorldModel(false)
	end
	if self.VJ_IsBeingControlled == false then
		timer.Simple(math.random(6, 9), function() if IsValid(self) then self:BMSASSASSIN_RESETCLOAK() end end)
	end
	self.Assassin_NextCloakT = CurTime() + math.random(13, 14)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	if self.VJ_IsBeingControlled && self.VJ_TheController:KeyDown(IN_JUMP) then
		self.VJ_TheController:PrintMessage(HUD_PRINTCENTER, "Changing Camouflage!")
		if self.Assassin_ControllerCloakLevel == 0 then
			self.Assassin_ControllerCloakLevel = 1
			self:BMSASSASSIN_DOCLOAK()
		elseif self.Assassin_ControllerCloakLevel == 1 then
			self.Assassin_ControllerCloakLevel = 0
			self:BMSASSASSIN_RESETCLOAK()
		end
	end
	if !self.VJ_IsBeingControlled then
		if GetConVarNumber("vj_bms_blackopsassassin_cloak") == 1 then
			if IsValid(self:GetEnemy()) then
				if CurTime() > self.Assassin_NextCloakT then
					self:BMSASSASSIN_DOCLOAK()
				end
			elseif self:GetNPCState() != NPC_STATE_ALERT && self:GetNPCState() != NPC_STATE_COMBAT then
				if self.Assassin_Cloaking == true then self:BMSASSASSIN_RESETCLOAK() end
			end
		end

		if IsValid(self:GetEnemy()) && self.WeaponAttackState == VJ.WEP_ATTACK_STATE_FIRE_STAND && CurTime() > self.Assassin_NextJumpT && self.EnemyData.Distance < 1400 then
			local trace = VJ.TraceDirections(self, "Quick", 150, true, true, 4, false, true, false, false)
			local anims = {}
			if trace.Forward then anims[#anims + 1] = "vjseq_flip_front" end
			if trace.Left then anims[#anims + 1] = "vjseq_flip_l" end
			if trace.Right then anims[#anims + 1] = "vjseq_flip_r" end
			self:PlayAnim(anims, true, 1, false)
			self.Assassin_NextJumpT = CurTime() + math.Rand(3.5, 6)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnAlert(ent)
	self.Assassin_NextJumpT = CurTime() + math.Rand(2, 3)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeath(dmginfo, hitgroup, status)
	if status == "Init" then
		self:BMSASSASSIN_RESETCLOAK()
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnCreateDeathCorpse(dmginfo, hitgroup, corpse)
	-- Create the second pistol to drop with the gun
	self:CreateExtraDeathCorpse("weapon_vj_glock17", "None", {HasVel=false}, function(extraent)
		local phys = extraent:GetPhysicsObject()
		if IsValid(phys) then
			phys:SetMass(60)
			phys:ApplyForceCenter(dmginfo:GetDamageForce())
		end
	end)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnDeathWeaponDrop(dmginfo, hitgroup, wepEnt)
	wepEnt:SetDrawWorldModel(true)
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
	
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/brain.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 60)), Ang=self:GetAngles()+Angle(0, -90, 0)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 55)), Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(150, 250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/eye.mdl", {Pos=self:LocalToWorld(Vector(0, 3, 55)), Ang=self:GetAngles()+Angle(0, -90, 0), Vel=self:GetRight()*math.Rand(-150, -250)+self:GetForward()*math.Rand(-200, 200)})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/heart.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/lung.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 41))})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/lung.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 42))})
	self:CreateGibEntity("obj_vj_gib", "models/vj_base/gibs/human/liver.mdl", {Pos=self:LocalToWorld(Vector(0, 0, 35))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 31))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Small", {Pos=self:LocalToWorld(Vector(0, 0, 32))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 36))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 37))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 38))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 1, 40))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(1, 0, 40))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(1, 1, 40))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 0, 34))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 1, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(1, 0, 30))})
	self:CreateGibEntity("obj_vj_gib", "UseHuman_Big", {Pos=self:LocalToWorld(Vector(0, 1, 31))})
	return true
end