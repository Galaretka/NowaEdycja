local throwInMinute = 30  -- the maximum number of shots per minute
local change_fire_button = "G" -- button which will change the shooting mode

grenadesConfig = { -- ["The weapon's name"] = {grenadeName = "Name grenades"},
	["AKS-74 Kobra"] = { grenadeName = "M67 Frag Grenade" },
	["M4A1 CCO"] = { grenadeName = "M67 Frag Grenade" },
}


local throwAvail = true

function throwGrenade()
	if not throwAvail or not getControlState ( "aim_weapon" ) then return true end
	local weaponID = getPedWeapon ( localPlayer )
	local weapon2 = getElementData ( localPlayer, "currentweapon_1")
	local weapon3 = getElementData ( localPlayer, "currentweapon_2")
	local selectedWeapon = getElementData (localPlayer, "selectedWeapon")
	if weapon2 == getElementData ( localPlayer, "usingGrenadeThrower" ) then
		weapon = weapon2
	elseif weapon3 == getElementData ( localPlayer, "usingGrenadeThrower" ) then
		weapon = weapon3
	else
		unbindKey ( "mouse1", "down", throwGrenade )
		return true
	end
	if selectedWeapon ~= getElementData ( localPlayer, "usingGrenadeThrower" ) then return true end
	if weaponID == 0 then return true end
	if grenadesConfig[weapon] then
		if ( getElementData ( localPlayer, grenadesConfig[weapon].grenadeName ) or 0 ) > 0 then
			throwAvail = false
			setElementData ( localPlayer, grenadesConfig[weapon].grenadeName, ( getElementData ( localPlayer, grenadesConfig[weapon].grenadeName ) or 1 ) - 1 )
			local xm, ym, zm = getPedWeaponMuzzlePosition ( localPlayer )
			local infx,infy,infz = getPositionInfrontOfLP ()
			local x, y, z, lx, ly, lz, roll, dof = getCameraMatrix ()
			local velx, vely = (infx-x)*0.2, (infy-y)*0.2
			createProjectile(getLocalPlayer(),16,xm,ym,zm-0.05,0,nil,0,0,0,velx, vely,lz-z+0.1)
			local uSound = playSound3D( 'wpn_grenadelauncher_fire_3d_01.wav', x, y, z ) 
			setTimer ( function () throwAvail = true end, 60/throwInMinute*1000, 1)
			--setControlState ( "aim_weapon", false)
			--triggerServerEvent ('forceToReloadWeapon', localPlayer )
		else
			triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Niemasz granatow!",255,22,0)
		end
	end
end

function getPositionInfrontOfLP()
    local posX, posY, posZ = getElementPosition(localPlayer)
    local _, _, rotation = getElementRotation(localPlayer)
	rotation = rotation-15
    posX = ( posX - math.sin(math.rad(rotation)) ) 
    posY = ( posY + math.cos(math.rad(rotation)) ) 
    return posX, posY, posZ
end

function playerUsedGrenadeThrower ( player )
	if isElement ( player ) then
		if getElementData ( player, "usingGrenadeThrower" ) and ( getElementData ( player, "usingGrenadeThrower" ) == getElementData ( localPlayer, "currentweapon_1") or getElementData ( player, "usingGrenadeThrower" ) == getElementData ( localPlayer, "currentweapon_2") )then
			return true
		else
			return false
		end
	else
		return false
	end
end

function changeFiringMode ()
	if getControlState ( "aim_weapon" ) then
		if getElementData ( localPlayer, "usingGrenadeThrower" ) then
			setElementData ( localPlayer, "usingGrenadeThrower", false )
			unbindKey ( "mouse1", "down", throwGrenade )
			toggleControl ( "fire", true )
			playSound ("itm_grenade_up.wav")
		else
			local weapon = getElementData ( localPlayer, "selectedWeapon") or "no"
			if weapon and grenadesConfig[weapon] and ( getElementData ( localPlayer, grenadesConfig[weapon].grenadeName ) or 0 ) > 0 then 
				setElementData ( localPlayer, "usingGrenadeThrower", weapon )
				bindKey ( "mouse1", "down", throwGrenade )
				toggleControl ( "fire", false )
				playSound ("itm_grenade_up.wav")
			else
				triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","You do not have grenades!",255,22,0)
			end
		end
	end
end

bindKey ( change_fire_button, "up", changeFiringMode )
