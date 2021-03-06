/**
	XCF Permission mode: Battle
		This mode enables safezones and battlefield.
		All things within safezones are protected from all registered ACF damage.
		All things in the battlefield are vulnerable to all ACF damage.
//*/


// the name for this mode used in commands and identification
local modename = "battle"

// a short description of what the mode does
local modedescription = "Enables safe-zones and battlefield.  No ACF damage can occur in a safe-zone."


// battle-mode specifics: how much hp/armour should the players have?
local MAX_HP = 100
local MAX_Armour = 50


/*
	Defines the behaviour of XCF damage protection under this protection mode.
	This function is called every time an entity can be affected by potential ACF damage.
	Args;
		owner		Player:	The owner of the potentially-damaged entity
		attacker	Player:	The initiator of the ACF damage event
		ent			Entity:	The entity which may be damaged.
	Return: boolean
		true if the entity should be damaged, false if the entity should be protected from the damage.
//*/
local function modepermission(owner, attacker, ent)
	local szs = XCF.Permissions.Safezones
	
	if szs then
		local entpos = ent:GetPos()
		local attpos = attacker:GetPos()
		
		if XCF.IsInSafezone(entpos) or XCF.IsInSafezone(attpos) then return false end
	end
	
	return true
end



function tellPlyAboutZones(ply, zone, oldzone)
	if XCF.DamagePermission ~= modepermission then return end
	ply:SendLua("chat.AddText(Color(" .. (zone and "0,255,0" or "255,0,0") .. "),\"You have entered the " .. (zone and zone .. " safezone." or "battlefield!") .. "\")") 
end
hook.Add("XCF_PlayerChangedZone", "XCF_TellPlyAboutSafezone", tellPlyAboutZones)



local function modethink()
	for k, ply in pairs(player.GetAll()) do
		--print(ply:GetPos(), XCF.IsInSafezone(ply:GetPos()))
		if not XCF.IsInSafezone(ply:GetPos()) then
			ply:GodDisable()
			local HP = ply:Health()
			local AR = ply:Armor()
			
			if HP > MAX_HP then
				ply:SetHealth(MAX_HP)
			end
			
			if AR > MAX_Armour then
				ply:SetArmor(MAX_Armour)
			end
		end
	end
	
	return 0.25
end


if not XCF or not XCF.Permissions or not XCF.Permissions.RegisterMode then error("XCF: Tried to load the " .. modename .. " permission-mode before the permission-core has loaded!") end
XCF.Permissions.RegisterMode(modepermission, modename, modedescription, false, modethink)