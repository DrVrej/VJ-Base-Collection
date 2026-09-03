ENT.Base 			= "npc_vj_creature_base"
ENT.Type 			= "ai"
ENT.PrintName 		= "Enemy MG 42 Emplacement"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "Military"

if (CLIENT) then
	local soldierMDLs = {"models/VJ_DODGERMANS/german_soldier1.mdl", "models/VJ_DODGERMANS/german_soldier2.mdl", "models/VJ_DODGERMANS/german_soldier3.mdl", "models/VJ_DODGERMANS/german_soldier4.mdl", "models/VJ_DODGERMANS/german_soldier5.mdl", "models/VJ_DODGERMANS/german_soldier6.mdl"}
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