AddCSLuaFile()

SWEP.Base = "weapon_vj_base"
SWEP.PrintName = "Pipe Bomb"
SWEP.Author = "DrVrej"
SWEP.Contact = "http://steamcommunity.com/groups/vrejgaming"
SWEP.Category = "Left 4 Dead"
SWEP.Spawnable = true
SWEP.AdminOnly = true

SWEP.ViewModel = "models/cpthazama/l4d1/weapons/v_pipebomb.mdl"
SWEP.WorldModel = "models/cpthazama/l4d1/weapons/pipebomb.mdl"
SWEP.WorldModelOffsetParams = {
	Enabled = true,
	Pos = Vector(3, -1.5, -2),
	Ang = Angle(0, 0, -180)
}
SWEP.HoldType = "grenade"
SWEP.ViewModelFOV = 90
SWEP.Slot = 4
SWEP.SlotPos = 4
SWEP.SwayScale = 2
SWEP.UseHands = true

SWEP.NPC_NextPrimaryFire = 10

SWEP.Primary.DisableBulletCode = true
SWEP.Primary.ClipSize = 1
SWEP.Primary.Recoil = 2
SWEP.Primary.Delay = 10
SWEP.Primary.Automatic = false
SWEP.Primary.Ammo = "pipebomb"
SWEP.AnimTbl_PrimaryFire = ACT_VM_PRIMARYATTACK
SWEP.PrimaryEffects_MuzzleFlash = false
SWEP.PrimaryEffects_SpawnDynamicLight = false
SWEP.PrimaryEffects_SpawnShells = false

SWEP.AnimTbl_Reload = ACT_VM_DRAW
SWEP.Reload_TimeUntilAmmoIsSet = 1

-- Custom
SWEP.L4D_ViewModelAdjust = {
	Pos = {Right = 0, Forward = 0, Up = -6},
	Ang = {Right = 0, Up = 0, Forward = 0}
}
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:Init()
	if CLIENT then
		local owner = self:GetOwner()
		if IsValid(owner) && owner:IsPlayer() then
			owner:ChatPrint("NOTE: Pipe bomb has a 10 second cooldown between throws!")
		end
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
function SWEP:OnPrimaryAttack(status, statusData)
	if status == "Init" then
		if CLIENT then return end
		timer.Simple(1.3, function()
			local owner = self:GetOwner()
			if IsValid(self) && IsValid(owner) && owner:GetActiveWeapon() == self then
				local pipeBomb = ents.Create("obj_vj_l4d_pipebomb")
				pipeBomb:SetPos(owner:GetShootPos())
				pipeBomb:SetAngles(owner:GetAngles())
				pipeBomb:SetOwner(owner)
				pipeBomb:Activate()
				pipeBomb:Spawn()

				local phys = pipeBomb:GetPhysicsObject()
				if IsValid(phys) then
					phys:ApplyForceCenter(owner:GetAimVector()*5000 + owner:GetUp()*1500)
					phys:SetAngleVelocity(Vector(math.Rand(-160, 160), math.Rand(-160, 160), math.Rand(-160, 160)))
				end
			end
		end)
	end
end
---------------------------------------------------------------------------------------------------------------------------------------------
if CLIENT then
	function SWEP:GetViewModelPosition(pos, ang)
		local vModelAdjust = self.L4D_ViewModelAdjust
		pos:Add(ang:Right() * vModelAdjust.Pos.Right)
		pos:Add(ang:Forward() * vModelAdjust.Pos.Forward)
		pos:Add(ang:Up() * vModelAdjust.Pos.Up)
		ang:RotateAroundAxis(ang:Right(), vModelAdjust.Ang.Right)
		ang:RotateAroundAxis(ang:Up(), vModelAdjust.Ang.Up)
		ang:RotateAroundAxis(ang:Forward(), vModelAdjust.Ang.Forward)
		return pos, ang
	end
end