	AddCSLuaFile( "shared.lua" )
	SWEP.HoldType			= "ar2"

if (CLIENT) then
	
	SWEP.PrintName			= "ACF Anti-Tank Rifle"
	SWEP.Author				= "Bubbus"
	SWEP.Slot				= 3
	SWEP.SlotPos			= 3
	SWEP.IconLetter			= "f"
	SWEP.DrawCrosshair		= false
	SWEP.Purpose		= "Make tanks disappear."
	SWEP.Instructions       = "Reload at 37mm SA Ammo-boxes!"

end

util.PrecacheSound( "weapons/launcher_fire.wav" )

SWEP.Base				= "weapon_acf_base"

SWEP.Spawnable			= true
SWEP.AdminSpawnable		= false
SWEP.Category			= "ACF"
--SWEP.ViewModel 			= "models/weapons/v_sniper.mdl";
--SWEP.WorldModel 		= "models/weapons/w_sniper.mdl";
SWEP.ViewModel 			= "models/weapons/v_snip_awp.mdl";
SWEP.WorldModel 		= "models/weapons/w_snip_awp.mdl";
SWEP.ViewModelFlip		= true

SWEP.Weight				= 15
SWEP.AutoSwitchTo		= false
SWEP.AutoSwitchFrom		= false

SWEP.Primary.Recoil			= 15
SWEP.Primary.ClipSize		= 1
SWEP.Primary.Delay			= 1
SWEP.Primary.DefaultClip	= 10
SWEP.Primary.Automatic		= false
SWEP.Primary.Ammo			= "XBowBolt"
SWEP.Primary.Sound 			= "acf_extra/tankfx/gnomefather/40mm3.wav"

SWEP.ReloadTime				= 6

SWEP.Secondary.ClipSize		= -1
SWEP.Secondary.DefaultClip	= -1
SWEP.Secondary.Automatic	= false
SWEP.Secondary.Ammo			= "none"

SWEP.AimOffset = Vector(32, 8, -1)

SWEP.ScopeChopPos = Vector(0, 5, 0)
SWEP.ScopeChopAngle = Angle(0, 90, 0)
SWEP.WeaponBone = "v_weapon.sg550_Parent"

SWEP.MinInaccuracy = 3
SWEP.MaxInaccuracy = 16
SWEP.Inaccuracy = SWEP.MaxInaccuracy
SWEP.InaccuracyDecay = 0.04
SWEP.AccuracyDecay = 0.6
SWEP.InaccuracyPerShot = 16
SWEP.InaccuracyCrouchBonus = 1.7
SWEP.InaccuracyDuckPenalty = 8

SWEP.HasZoom = true
SWEP.HasScope = true
SWEP.ZoomInaccuracyMod = 0.01
SWEP.ZoomDecayMod = 1.6
SWEP.ZoomFOV = 25

SWEP.Stamina = 1
SWEP.StaminaDrain = 0.012 / 1
SWEP.StaminaJumpDrain = 0.1

SWEP.Class = "SA"
SWEP.FlashClass = "MO"
SWEP.Launcher = false


function SWEP:InitBulletData()

	self.BulletData = {}
	//*

	self.BulletData["Id"]			= "37mmSA"
	self.BulletData["Type"]			= "APHE"
	self.BulletData["InvalidateTraceback"]			= true
	self.BulletData["BlastRadius"]			= 14.601112934069
	self.BulletData["BoomPower"]			= 0.504114690816
	self.BulletData["Caliber"]			= 3.7
	self.BulletData["DragCoef"]			= 0.00086293556523756
	self.BulletData["FillerMass"]			= 0.023991
	self.BulletData["FillerVol"]			= 14.54
	self.BulletData["FrAera"]			= 10.752126
	self.BulletData["FragMass"]			= 0.04213803701331
	self.BulletData["FragVel"]			= 396.30816475479
	self.BulletData["Fragments"]			= 29
	self.BulletData["KETransfert"]			= 0.1
	self.BulletData["LimitVel"]			= 700
	self.BulletData["MaxFillerVol"]			= 54.501147955069
	self.BulletData["MaxPen"]			= 65.420190481561
	self.BulletData["MaxProjLength"]			= 15.738648648649
	self.BulletData["MaxPropLength"]			= 27.908648648649
	self.BulletData["MaxTotalLength"]			= 45
	self.BulletData["MinFillerVol"]			= 0
	self.BulletData["MinProjLength"]			= 5.55
	self.BulletData["MinPropLength"]			= 0.01
	self.BulletData["MuzzleVel"]			= 899.55604644015
	self.BulletData["PenAera"]			= 7.529570314926
	self.BulletData["ProjLength"]			= 15.738648648649
	self.BulletData["ProjMass"]			= 1.245994073386
	self.BulletData["ProjVolume"]			= 169.22393334
	self.BulletData["PropLength"]			= 27.908648648649
	self.BulletData["PropMass"]			= 0.480123690816
	self.BulletData["Ricochet"]			= 75
	self.BulletData["RoundVolume"]			= 469.3012401
	self.BulletData["ShovePower"]			= 0.1
	self.BulletData["Tracer"]			= 1.3513513513514
	self.BulletData["InvalidateTraceback"]			= true

	if SERVER then
		self.BulletData.CallbackEndFlight = self.CallbackEndFlight
	end
	
end