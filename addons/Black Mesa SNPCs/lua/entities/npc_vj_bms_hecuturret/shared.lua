ENT.Base 			= "npc_vj_creature_base"
ENT.Type 			= "ai"
ENT.PrintName 		= "HECU Ground Turret"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "Hazardous Environment Combat Unit"

ENT.VJ_ID_Turret = true

if (CLIENT) then
	local matLaser = Material("sprites/rollermine_shock")
	local matGlow = Material("sprites/redglow1")
	local colorRed = Color(255, 0, 0, 255)
	function ENT:Draw()
		self:DrawModel()
		if self:GetSequence() == self:LookupSequence("fire") or self:GetSequence() == self:LookupSequence("idl") then
			local attach = self:GetAttachment(self:LookupAttachment("laser"))
			local tr = util.TraceLine({
				start = attach.Pos,
				endpos = attach.Pos + attach.Ang:Forward()*10000,
				filter = self,
			})
			render.SetMaterial(matLaser)
			render.DrawBeam(attach.Pos, tr.HitPos, 1, 0, 1, colorRed)
			if tr.Hit == true then
				render.SetMaterial(matGlow)
				render.DrawSprite(tr.HitPos, 4, 4, colorRed)
			end
		end
	end
end