AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/VJ_VEHICLES/m1abrams_chasis.mdl"
ENT.StartHealth = 500
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_UNITED_STATES"}

ENT.SoundTbl_Idle = {"vj_military/english_american/idle1.wav", "vj_military/english_american/idle2.wav", "vj_military/english_american/idle3.wav", "vj_military/english_american/idle4.wav", "vj_military/english_american/idle5.wav", "vj_military/english_american/idle6.wav", "vj_military/english_american/idle7.wav", "vj_military/english_american/idle8.wav", "vj_military/english_american/idle9.wav", "vj_military/english_american/idle10.wav", "vj_military/english_american/idle11.wav", "vj_military/english_american/idle12.wav"}
ENT.SoundTbl_ReceiveOrder = {"vj_military/english_american/yes1.wav", "vj_military/english_american/yes2.wav", "vj_military/english_american/yes3.wav", "vj_military/english_american/yes4.wav", "vj_military/english_american/yes5.wav", "vj_military/english_american/yes6.wav", "vj_military/english_american/yes7.wav", "vj_military/english_american/yes8.wav"}
ENT.SoundTbl_Alert = {"vj_military/english_american/alert1.wav", "vj_military/english_american/alert2.wav", "vj_military/english_american/alert3.wav", "vj_military/english_american/alert4.wav", "vj_military/english_american/alert5.wav", "vj_military/english_american/alert6.wav"}
ENT.SoundTbl_CallForHelp = {"vj_military/english_american/help1.wav", "vj_military/english_american/help2.wav", "vj_military/english_american/help3.wav", "vj_military/english_american/help4.wav", "vj_military/english_american/help5.wav", "vj_military/english_american/help6.wav", "vj_military/english_american/help7.wav", "vj_military/english_american/help8.wav"}
ENT.SoundTbl_CombatIdle = {"vj_military/english_american/attack1.wav", "vj_military/english_american/attack2.wav", "vj_military/english_american/attack3.wav", "vj_military/english_american/attack4.wav", "vj_military/english_american/attack5.wav", "vj_military/english_american/attack6.wav", "vj_military/english_american/attack7.wav", "vj_military/english_american/attack8.wav", "vj_military/english_american/attack9.wav"}

-- Tank Base
ENT.Tank_GunnerENT = "npc_vj_mili_m1a1abramsg"
ENT.Tank_AngleOffset = 180
ENT.Tank_CollisionBoundSize = 90
ENT.Tank_CollisionBoundUp = 100
ENT.Tank_DeathDriverCorpse = {"models/VJ_HGRUNT/hgrunt1.mdl", "models/VJ_HGRUNT/hgrunt2.mdl", "models/VJ_HGRUNT/hgrunt3.mdl", "models/VJ_HGRUNT/hgrunt4.mdl", "models/VJ_HGRUNT/hgrunt5.mdl"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_Init()
	if GetConVar("vj_npc_reduce_vfx"):GetInt() == 0 then
		self.WhiteLight1 = ents.Create("env_sprite")
		self.WhiteLight1:SetPos( self:GetPos() +self:GetForward()*-150 +self:GetRight()*33 +self:GetUp()*50 )
		self.WhiteLight1:SetKeyValue( "renderfx", "14" )
		self.WhiteLight1:SetKeyValue( "model", "sprites/glow1.vmt")
		self.WhiteLight1:SetKeyValue( "scale", "0.8")
		self.WhiteLight1:SetKeyValue( "spawnflags", "1")
		self.WhiteLight1:SetKeyValue( "angles", "0 0 0")
		self.WhiteLight1:SetKeyValue( "rendermode", "9")
		self.WhiteLight1:SetKeyValue( "renderamt", "255")
		self.WhiteLight1:SetKeyValue( "rendercolor", "255 255 255" )
		self.WhiteLight1:Spawn()
		self.WhiteLight1:SetParent(self)
		self.WhiteLight1:Activate()
		self:DeleteOnRemove(self.WhiteLight1)
		
		-- Right
		self.WhiteLight2 = ents.Create("env_sprite")
		self.WhiteLight2:SetPos( self:GetPos() +self:GetForward()*-150 +self:GetRight()*-33 +self:GetUp()*50 )
		self.WhiteLight2:SetKeyValue( "renderfx", "14" )
		self.WhiteLight2:SetKeyValue( "model", "sprites/glow1.vmt")
		self.WhiteLight2:SetKeyValue( "scale", "0.8")
		self.WhiteLight2:SetKeyValue( "spawnflags", "1")
		self.WhiteLight2:SetKeyValue( "angles", "0 0 0")
		self.WhiteLight2:SetKeyValue( "rendermode", "9")
		self.WhiteLight2:SetKeyValue( "renderamt", "255")
		self.WhiteLight2:SetKeyValue( "rendercolor", "255 255 255" )
		self.WhiteLight2:Spawn()
		self.WhiteLight2:SetParent(self)
		self.WhiteLight2:Activate()
		self:DeleteOnRemove(self.WhiteLight2)

		-- Left
		self.ActualLight1 = ents.Create("light_dynamic")
		self.ActualLight1:SetKeyValue("brightness", "2")
		self.ActualLight1:SetKeyValue("distance", "150")
		self.ActualLight1:SetLocalPos(self.WhiteLight1:GetPos())
		self.ActualLight1:SetLocalAngles( self:GetAngles() +Angle(0, 180, 0) )
		//self.ActualLight1:Fire("LightColor", "255 255 255")
		self.ActualLight1:SetParent(self)
		self.ActualLight1:Spawn()
		self.ActualLight1:Activate()
		self.ActualLight1:Fire("TurnOn", "", 0)
		self:DeleteOnRemove(self.ActualLight1)
		
		-- Right
		self.ActualLight2 = ents.Create("light_dynamic")
		self.ActualLight2:SetKeyValue("brightness", "2")
		self.ActualLight2:SetKeyValue("distance", "150")
		self.ActualLight2:SetLocalPos(self.WhiteLight2:GetPos())
		self.ActualLight2:SetLocalAngles( self:GetAngles() +Angle(0, 180, 0) )
		//self.ActualLight2:Fire("LightColor", "255 255 255")
		self.ActualLight2:SetParent(self)
		self.ActualLight2:Spawn()
		self.ActualLight2:Activate()
		self.ActualLight2:Fire("TurnOn", "", 0)
		self:DeleteOnRemove(self.ActualLight2)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_UpdateIdleParticles()
	local effectData = EffectData()
	effectData:SetScale(1)
	effectData:SetEntity(self)
	effectData:SetOrigin(self:GetPos() + self:GetForward() * 160 + self:GetRight() * -28 + self:GetUp() * 45)
	util.Effect("VJ_VehicleExhaust", effectData, true, true)
	effectData:SetOrigin(self:GetPos() + self:GetForward() * 160 + self:GetRight() * 28 + self:GetUp() * 45)
	util.Effect("VJ_VehicleExhaust", effectData, true, true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_UpdateMoveParticles()
	local effectData = EffectData()
	effectData:SetScale(1)
	effectData:SetEntity(self)
	effectData:SetOrigin(self:GetPos() + self:GetForward() * 87 + self:GetRight() * 58)
	util.Effect("VJ_VehicleMove", effectData, true, true)
	effectData:SetOrigin(self:GetPos() + self:GetForward() * 87 + self:GetRight() * -58)
	util.Effect("VJ_VehicleMove", effectData, true, true)
end
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:GetNearDeathSparkPositions()
	local randPos = math.random(1, 7)
	if randPos == 1 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*100 +self:GetUp()*60)
	elseif randPos == 2 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*30 +self:GetUp()*60)
	elseif randPos == 3 then self.Spark1:SetLocalPos(self.WhiteLight1:GetPos())
	elseif randPos == 4 then self.Spark1:SetLocalPos(self.WhiteLight2:GetPos())
	elseif randPos == 5 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*10 +self:GetUp()*60 +self:GetRight()*50)
	elseif randPos == 6 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*80 +self:GetUp()*60 +self:GetRight()*-50)
	elseif randPos == 7 then self.Spark1:SetLocalPos(self:GetPos() +self:GetForward()*-20 +self:GetUp()*60 +self:GetRight()*-30)
	end
end