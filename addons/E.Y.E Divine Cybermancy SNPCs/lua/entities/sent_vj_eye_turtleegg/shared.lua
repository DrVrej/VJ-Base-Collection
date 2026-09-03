ENT.Base 			= "base_anim"
ENT.Type 			= "anim"
ENT.PrintName		= "Turtle Egg"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "E.Y.E Divine Cybermancy"
ENT.AutomaticFrameAdvance = true

//ENT.PhysicsSounds = true
---------------------------------------------------------------------------------------------------------------------------------------------
function ENT:SetAutomaticFrameAdvance( bUsingAnim )
	self.AutomaticFrameAdvance = bUsingAnim
end
---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
	function ENT:Draw()
		self:DrawModel()
	end
end