function onClientPlayerWeaponFireFunc(weapon, ammo, ammoInClip, hitX, hitY, hitZ, hitElement)
    local x,y,z = getElementPosition( root )
    if (weapon == 30) then -- If the player shoots with a shotgun
        local sound = playSound3D("sounds/AK-47.mp3", x, y, z, false) 
		setSoundMaxDistance(sound, 50)
    end
	elseif (weapon == 34) then -- If the player shoots with a shotgun
        local sound = playSound3D("sounds/AWP.mp3", x, y, z, false) 
        setSoundMaxDistance(sound, 200)
		
    end
end
addEventHandler("onClientPlayerWeaponFire", root, onClientPlayerWeaponFireFunc)