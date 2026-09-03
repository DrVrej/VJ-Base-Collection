AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/gredwitch/mg81z/mg81z_tripod.mdl"
ENT.StartHealth = 200
ENT.HullType = HULL_HUMAN
ENT.SightDistance = 5000
ENT.MovementType = VJ_MOVETYPE_STATIONARY
ENT.CanTurnWhileStationary = false
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_GERMAN"}
ENT.HasMeleeAttack = false

ENT.HasRangeAttack = true
ENT.RangeAttackMaxDistance = 5000
ENT.RangeAttackMinDistance = 1
ENT.TimeUntilRangeAttackProjectileRelease = 0
ENT.NextRangeAttackTime = 0.06
ENT.AnimTbl_RangeAttack = false

//ENT.SoundTbl_RangeAttack = {"vj_weapons/m2browning/m2_tp.wav"}

ENT.RangeAttackPitch = VJ.SET(100, 100)
ENT.RangeAttackSoundLevel = 80

-- Custom
ENT.Emp_MaxAmmo = 250
ENT.Emp_CurrentAmmo = 0
ENT.Emp_Reloading = false

ENT.Emp_Lerp_Yaw = 0
ENT.Emp_Lerp_Ptich = 0
ENT.Emp_Lerp_Ptich_Previous = 0
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Init()
	self:SetCollisionBounds(Vector(20, 20, 60), Vector(-20, -20, 0))
	
	local gunModel = ents.Create("prop_vj_animatable")
	gunModel:SetModel("models/gredwitch/mg42/mg42_gun_fix.mdl")
	gunModel:SetLocalPos(self:GetPos() + self:GetUp()*43)
	gunModel:SetLocalAngles(Angle(self:GetAngles().p, self:GetAngles().y - 90, self:GetAngles().r))
	gunModel:SetOwner(self)
	gunModel:SetParent(self)
	gunModel:SetCollisionGroup(COLLISION_GROUP_IN_VEHICLE)
	gunModel:Spawn()
	gunModel:Activate()
	//gunModel:SetSolid(SOLID_NONE)
	//gunModel:AddEffects(EF_BONEMERGE)
	self.GunModel = gunModel
	
	self.Emp_CurrentAmmo = self.Emp_MaxAmmo
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnThinkActive()
	if IsValid(self.GunModel) then
		local ene = self:GetEnemy()
		local gunModel = self.GunModel
		if IsValid(ene) && (self:GetForward():Dot((ene:GetPos() -self:GetPos()):GetNormalized()) > math.cos(math.rad(self.RangeAttackAngleRadius))) then
			self.Emp_Lerp_Yaw = Lerp(25 * FrameTime(), self.Emp_Lerp_Yaw, (ene:GetPos() - gunModel:GetPos()):Angle().y - 90)
			local pitch = -((ene:GetPos() + ene:OBBCenter()) - (gunModel:GetPos()  + gunModel:OBBCenter())):Angle().p
			self.Emp_Lerp_Ptich = Lerp(25 * FrameTime(), self.Emp_Lerp_Ptich, pitch)
			local dist = math.Distance(self.Emp_Lerp_Ptich, 0, self.Emp_Lerp_Ptich_Previous, 0)
			-- Nayir inchab yergare arach-va yev himagva teve, yete 20-en vere, eselete zenke bidi tarna glorag  ...
			-- ...  Ador teme yeleloo hamar, ere vor zenke chi sharje, minche vor yergarootyoun-e 20 en vare
			if dist < 20 then
				gunModel:SetAngles(Angle(0, self.Emp_Lerp_Yaw, self.Emp_Lerp_Ptich))
			else
				self.Emp_Lerp_Ptich = pitch
			end
			self.Emp_Lerp_Ptich_Previous = self.Emp_Lerp_Ptich
		end
		if self.Emp_CurrentAmmo <= 0 && self.Emp_Reloading == false then
			self.Emp_Reloading = true
			gunModel:SetBodygroup(2, 1)
			VJ.EmitSound(self, "vj_weapons/mg42/mg42_reload.wav")
			gunModel:ResetSequence(gunModel:LookupSequence("reload"))
			gunModel:ResetSequenceInfo()
			gunModel:SetCycle(0)
			timer.Simple(0.6, function()
				if IsValid(self) then
					gunModel:SetBodygroup(1, 1)
					local reloadBox = self.ReloadAmmoBox
					if IsValid(reloadBox) then reloadBox:Remove() end -- Remove the ammo box if it already existed
					reloadBox = ents.Create("prop_physics")
					reloadBox:SetModel("models/gredwitch/mg42/mg42_belt.mdl")
					reloadBox:PhysicsInit(SOLID_VPHYSICS)
					reloadBox:SetMoveType(MOVETYPE_VPHYSICS)
					reloadBox:SetPos(gunModel:GetPos() + gunModel:GetForward()*-5 + gunModel:GetUp()*5)
					reloadBox:SetAngles(gunModel:GetAngles())
					reloadBox:SetCollisionGroup(COLLISION_GROUP_DEBRIS)
					reloadBox:Spawn()
					reloadBox:Activate()
					reloadBox:SetBodygroup(1, 1)
					local phys = reloadBox:GetPhysicsObject()
					if IsValid(phys) then
						phys:Wake()
						phys:ApplyForceCenter(reloadBox:GetForward() * -10000)
					end
					self.ReloadAmmoBox = reloadBox
					timer.Simple(5, function() if IsValid(reloadBox) then reloadBox:Remove() end end)
				end
			end)
			timer.Simple(1.8, function()
				if IsValid(self) && IsValid(gunModel) then
					gunModel:SetBodygroup(1, 0)
					gunModel:SetBodygroup(2, 0)
				end
			end)
			timer.Simple(2.84, function()
				if IsValid(self) then
					self.Emp_CurrentAmmo = self.Emp_MaxAmmo
					self.Emp_Reloading = false
				end
			end)
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnRangeAttack(status, enemy)
	if status == "PreInit" then
		return self.Emp_CurrentAmmo <= 0
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
//local angX90 = Angle(90, 0, 0)
--
function ENT:OnRangeAttackExecute(status, enemy, projectile)
	if status == "Init" then
		if !IsValid(self.GunModel) then return end
		self.Emp_CurrentAmmo = self.Emp_CurrentAmmo - 1
		
		local spawnPos = self.GunModel:GetPos() -- Do NOT use the gun's attachments because parenting breaks attachment positions!
		local aimPos = self:GetAimPosition(enemy, spawnPos, 0)
		local spread = self:GetAimSpread(enemy, aimPos, 1)
		local bullet = {}
			bullet.Attacker = self
			bullet.Src = spawnPos
			bullet.Dir = (aimPos - spawnPos):GetNormal()
			bullet.Spread = Vector(spread, spread, 0)
			bullet.TracerName = "Tracer"
			bullet.Force = 5
			bullet.Damage = math.random(5, 20)
			bullet.AmmoType = "SMG1"
			/*bullet.Callback = function(attacker, tr, dmginfo)
				local mat = "doi_impact_concrete"
				if tr.MatType == MAT_CONCRETE then
					mat = "doi_impact_concrete"
				elseif tr.MatType == MAT_DIRT then
					mat = "doi_impact_dirt"
				elseif tr.MatType == MAT_GLASS then
					mat = "doi_impact_glass"
				elseif tr.MatType == MAT_METAL or tr.MatType == MAT_VENT then
					mat = "doi_impact_metal"
				elseif tr.MatType == MAT_SAND then
					mat = "doi_impact_sand"
				elseif tr.MatType == MAT_SNOW then
					mat = "doi_impact_snow"
				elseif tr.MatType == MAT_WOOD then
					mat = "doi_impact_wood"
				elseif tr.MatType == MAT_GRASS then
					mat = "doi_impact_grass"
				elseif tr.MatType == MAT_TILE then
					mat = "doi_impact_tile"
				elseif tr.MatType == MAT_PLASTIC then
					mat = "doi_impact_plastic"
				elseif tr.MatType == MAT_COMPUTER then
					mat = "doi_impact_computer"
				elseif tr.MatType == MAT_FOLIAGE then
					mat = "doi_impact_leaves"
				elseif tr.MatType == MAT_ANTLION or tr.MatType == MAT_ALIENFLESH or tr.MatType == MAT_FLESH then
					mat = nil
				end
				if mat != nil then
					ParticleEffect(mat, tr.HitPos, tr.HitNormal:Angle() + angX90)
				end
			end*/
		self.GunModel:FireBullets(bullet)
		
		self:PlaySoundSystem("RangeAttack", "vj_weapons/mg42/mg42_tp.wav", VJ.EmitSound)
		VJ.EmitSound(self, "vj_weapons/mg42/mg42_dist.wav", 110)
		
		ParticleEffectAttach("vj_military_muzzle_bar", PATTACH_POINT, self.GunModel, 1)
		ParticleEffectAttach("vj_military_muzzle_garand", PATTACH_POINT, self.GunModel, 1)
		
		local bulletShell = EffectData()
		bulletShell:SetEntity(self.GunModel)
		bulletShell:SetOrigin(self.GunModel:GetPos() + self:GetForward()*-6.5 + self:GetRight()*3)
		bulletShell:SetAngles(self.GunModel:GetLocalAngles() + (self.GunModel:GetRight() * -90):Angle())
		util.Effect("RifleShellEject", bulletShell)
		
		local dynLight = ents.Create("light_dynamic")
		dynLight:SetKeyValue("brightness", "4")
		dynLight:SetKeyValue("distance", "120")
		dynLight:SetPos(spawnPos)
		dynLight:SetLocalAngles(self.GunModel:GetAngles())
		dynLight:Fire("Color", "255 150 60")
		dynLight:SetParent(self.GunModel)
		dynLight:Spawn()
		dynLight:Activate()
		dynLight:Fire("TurnOn", "", 0)
		dynLight:Fire("Kill", "", 0.07)
		self:DeleteOnRemove(dynLight)
		return true
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:CustomOnRemove()
	if IsValid(self.ReloadAmmoBox) then self.ReloadAmmoBox:Remove() end
	if IsValid(self.GunModel) then
		self:CreateExtraDeathCorpse("prop_physics", self.GunModel:GetModel(), {Pos=self.GunModel:GetPos(), Ang=self.GunModel:GetAngles(), HasVel=false})
		self.GunModel:Remove()
	end
end