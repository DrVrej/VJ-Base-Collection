ENT.Base 			= "npc_vj_creature_base"
ENT.Type 			= "ai"
ENT.PrintName 		= "Stranger"
ENT.Author 			= "DrVrej"
ENT.Contact 		= "http://steamcommunity.com/groups/vrejgaming"
ENT.Category		= "Cry Of Fear"

---------------------------------------------------------------------------------------------------------------------------------------------
if (CLIENT) then
	net.Receive("vj_stranger_dodamage", function(len)
		local selfEntity = net.ReadEntity()
		local selfEntityEnemy = net.ReadEntity()
		if GetConVarNumber("vj_npc_snd_range") == 1 then selfEntityEnemy:EmitSound("stranger/st_hearbeat.wav") end
		//hook.Add("RenderScreenspaceEffects", "vj)stranger_dodamgeeffect", function()
		//	DrawMaterialOverlay( "effects/tp_refract", -0.06 )
		//end)
		//timer.Simple(1, function()
		//hook.Remove("RenderScreenspaceEffects", "stranger_dodamgeeffect") DrawMaterialOverlay( "", 0 ) end)
	end)
end