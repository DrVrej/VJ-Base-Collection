AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/vehicles/t72_turret.mdl"
ENT.StartHealth = 0
---------------------------------------------------------------------------------------------------------------------------------------------
ENT.VJ_NPC_Class = {"CLASS_TERRORIST"}

-- Tank Base
ENT.Tank_AngleOffset = 180
ENT.Tank_Shell_SpawnPos = Vector(-170, 0, 65)
ENT.Tank_Shell_MuzzleFlashPos = Vector(-300, 0, 64)
ENT.Tank_Shell_ParticlePos = Vector(-226, 00, 65)

---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:Tank_Init()
	self:SetSkin(1)
end