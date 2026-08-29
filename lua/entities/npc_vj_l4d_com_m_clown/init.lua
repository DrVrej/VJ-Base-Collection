include("vj_base/extensions/l4d_com_infected.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2026 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted,
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.Model = "models/cpthazama/l4d2/common/common_male_clown.mdl"
ENT.CanGib = false

ENT.SoundTbl_FootStep = {"vj_l4d_com/footstep/clown/concrete1.wav", "vj_l4d_com/footstep/clown/concrete2.wav", "vj_l4d_com/footstep/clown/concrete3.wav", "vj_l4d_com/footstep/clown/concrete4.wav", "vj_l4d_com/footstep/clown/concrete5.wav", "vj_l4d_com/footstep/clown/concrete6.wav", "vj_l4d_com/footstep/clown/concrete7.wav", "vj_l4d_com/footstep/clown/concrete8.wav"}

ENT.FootstepSoundLevel = 80

local defPos = Vector()
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:OnBleed(dmginfo, hitgroup)
	if math.random(1, 3) != 1 then return end
	local pos = dmginfo:GetDamagePosition()
	if pos == defPos then return end
	local clownBloodSpray = ents.Create("info_particle_system")
	clownBloodSpray:SetKeyValue("effect_name", "vj_l4d_blood_spray_clown")
	clownBloodSpray:SetPos(pos)
	clownBloodSpray:SetAngles(pos:Angle())
	clownBloodSpray:Spawn()
	clownBloodSpray:Activate()
	clownBloodSpray:Fire("Start")
	clownBloodSpray:Fire("Kill", nil, 0.2)
end