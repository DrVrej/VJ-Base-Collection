ENT.Base 			= "npc_vj_creature_base"
ENT.Type 			= "ai"
ENT.PrintName 		= "Enemy M2 Browning Emplacement"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "Military"

if (CLIENT) then
	local soldierMDLs = {"models/VJ_UNITEDSTATES/airbrone1.mdl", "models/VJ_UNITEDSTATES/airbrone2.mdl", "models/VJ_UNITEDSTATES/airbrone3.mdl", "models/VJ_UNITEDSTATES/airbrone4.mdl", "models/VJ_UNITEDSTATES/airbrone5.mdl", "models/VJ_UNITEDSTATES/airbrone6.mdl", "models/VJ_UNITEDSTATES/airbrone7.mdl", "models/VJ_UNITEDSTATES/airbrone8.mdl", "models/VJ_UNITEDSTATES/airbrone9.mdl"}
	--
	function ENT:Draw()
		self:DrawModel()
		if IsValid(self.NPCModel) then
			local npc = self.NPCModel
			npc:SetPos(self:GetPos() + self:GetForward()*-40 + self:GetUp()*-2)
			npc:SetAngles(self:GetAngles())
			npc:SetSequence("man_gun")
		else
			self.NPCModel = ClientsideModel(VJ.PICK(soldierMDLs))
		end
	end
	
	function ENT:OnRemove()
		self.NPCModel:Remove()
	end
end