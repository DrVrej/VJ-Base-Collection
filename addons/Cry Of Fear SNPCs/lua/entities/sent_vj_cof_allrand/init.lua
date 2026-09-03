AddCSLuaFile("shared.lua")
include("shared.lua")
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/
ENT.MonsterTable = {"npc_vj_cof_watro", "npc_vj_cof_upper", "npc_vj_cof_taller", "npc_vj_cof_suicider", "npc_vj_cof_stranger", "npc_vj_cof_slowerstuck", "npc_vj_cof_slowerno", "npc_vj_cof_slower3", "npc_vj_cof_slower1", "npc_vj_cof_sewmo", "npc_vj_cof_sawrunner", "npc_vj_cof_sawer", "npc_vj_cof_sawcrazy", "npc_vj_cof_phsycho", "npc_vj_cof_mace", "npc_vj_cof_krypandenej", "npc_vj_cof_faster", "npc_vj_cof_faceless2", "npc_vj_cof_croucher", "npc_vj_cof_crazyrunner", "npc_vj_cof_crawler", "npc_vj_cof_citalopram", "npc_vj_cof_child", "npc_vj_cof_baby"}

function ENT:SpawnFunction(ply, tr)
	if (!tr.Hit) then return end
	local SpawnPos = tr.HitPos + tr.HitNormal * 16
	local ent = ents.Create("sent_vj_zss_rand")
		ent:SetPos(SpawnPos)
		ent:Spawn()
	self.Owner = ply
end

function ENT:Initialize()
	//self.Entity:SetModel("models/blackout.mdl")
	self.randz1 = ents.Create(VJ.PICK(self.MonsterTable))
		self.randz1:SetPos(self:GetPos())
		self.randz1:SetAngles(self:GetAngles())
		self.randz1:Spawn()
		self.randz1:Activate()
	//end
	timer.Simple(0, function()
	cleanup.ReplaceEntity(self, self.randz1)
	undo.ReplaceEntity(self, self.randz1)

	/*undo.Create("Random Zombie")
		undo.AddEntity(self.randz1)
		undo.AddEntity(self.randz2)
		undo.SetCustomUndoText("Undone Random Zombie")
		undo.SetPlayer(self.Owner)
	undo.Finish()*/
	self:Remove()
	end)
end
/*-----------------------------------------------
	*** Copyright (c) 2012-2025 by DrVrej, All rights reserved. ***
	No parts of this code or any of its contents may be reproduced, copied, modified or adapted, 
	without the prior written consent of the author, unless otherwise indicated for stand-alone materials.
-----------------------------------------------*/