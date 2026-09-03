AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vehicles/t72_chasis.mdl"
ENT.StartHealth = 500
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_TERRORIST"}

ENT.SoundTbl_Idle = {"vj_military/arabic/idle1.wav", "vj_military/arabic/idle2.wav", "vj_military/arabic/idle3.wav", "vj_military/arabic/idle4.wav", "vj_military/arabic/idle5.wav", "vj_military/arabic/idle6.wav", "vj_military/arabic/idle7.wav", "vj_military/arabic/idle8.wav", "vj_military/arabic/idle9.wav", "vj_military/arabic/idle10.wav", "vj_military/arabic/idle11.wav", "vj_military/arabic/idle12.wav"}
ENT.SoundTbl_Alert = {"vj_military/arabic/alert1.wav", "vj_military/arabic/alert1.wav", "vj_military/arabic/attack1.wav", "vj_military/arabic/attack2.wav", "vj_military/arabic/attack3.wav", "vj_military/arabic/attack4.wav", "vj_military/arabic/attack7.wav"}
ENT.SoundTbl_CombatIdle = {"vj_military/arabic/attack1.wav", "vj_military/arabic/attack2.wav", "vj_military/arabic/attack3.wav", "vj_military/arabic/attack4.wav", "vj_military/arabic/attack5.wav", "vj_military/arabic/attack6.wav", "vj_military/arabic/attack7.wav", "vj_military/arabic/allahackbar1.wav", "vj_military/arabic/allahackbar2.wav", "vj_military/arabic/allahackbar3.wav", "vj_military/arabic/allahackbar1.wav", "vj_military/arabic/allahackbar2.wav", "vj_military/arabic/allahackbar3.wav"}

-- Tank Base
ENT.Tank_GunnerENT = "npc_vj_mili_t72_terroristg"
ENT.Tank_AngleOffset = 180
ENT.Tank_CollisionBoundSize = 90
ENT.Tank_CollisionBoundUp = 100
ENT.Tank_DeathDriverCorpse = {"models/VJ_Terrorist/2hemagh.mdl", "models/VJ_Terrorist/2kimasked.mdl", "models/VJ_Terrorist/3hemagh.mdl", "models/VJ_Terrorist/shemagh.mdl", "models/VJ_Terrorist/shemagh_helmet.mdl", "models/VJ_Terrorist/skimasked.mdl", "models/VJ_Terrorist/unmasked1.mdl", "models/VJ_Terrorist/unmasked2.mdl"}

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_Init()
	self:SetSkin(1)
	if GetConVar("vj_npc_reduce_vfx"):GetInt() == 0 then
		self.WhiteLight1 = ents.Create("env_sprite")
		self.WhiteLight1:SetPos( self:GetPos() +self:GetForward()*-105 +self:GetRight()*35 +self:GetUp()*45 )
		self.WhiteLight1:SetKeyValue( "renderfx", "14" )
		self.WhiteLight1:SetKeyValue( "model", "sprites/glow1.vmt")
		self.WhiteLight1:SetKeyValue( "scale", "0.4")
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
		self.WhiteLight2:SetPos( self:GetPos() +self:GetForward()*-105 +self:GetRight()*-30 +self:GetUp()*45 )
		self.WhiteLight2:SetKeyValue( "renderfx", "14" )
		self.WhiteLight2:SetKeyValue( "model", "sprites/glow1.vmt")
		self.WhiteLight2:SetKeyValue( "scale", "0.4")
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
	effectData:SetOrigin(self:GetPos() + self:GetForward() * 110 + self:GetRight() * -20 + self:GetUp() * 55)
	util.Effect("VJ_VehicleExhaust", effectData, true, true)
	effectData:SetOrigin(self:GetPos() + self:GetForward() * 110 + self:GetRight() * 20 + self:GetUp() * 55)
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