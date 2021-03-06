function disableSounds()
    setAmbientSoundEnabled("gunfire",false)
    setWorldSoundEnabled(5,11,false)
    setWorldSoundEnabled(5,12,false)
    setWorldSoundEnabled(5,13,false)
    setWorldSoundEnabled(5,14,false)
    setWorldSoundEnabled(5,15,false)
    setWorldSoundEnabled(5,16,false)
    setWorldSoundEnabled(5,63,false)
    setWorldSoundEnabled(5,26,false)
    setWorldSoundEnabled(5,27,false)
    setWorldSoundEnabled(5,23,false)
    setWorldSoundEnabled(5,3,false)
    setWorldSoundEnabled(5,4,false)
    setWorldSoundEnabled(5,5,false)
    setWorldSoundEnabled(5,33,false)
    setWorldSoundEnabled(5,53,false)
    setWorldSoundEnabled(5,21,false)
    setWorldSoundEnabled(5,22,false)
    setWorldSoundEnabled(5,73,false)
    setWorldSoundEnabled(5,74,false)
    setWorldSoundEnabled(5,2,false)
    setWorldSoundEnabled(5,17,false)
    setWorldSoundEnabled(5,18,false)
    setWorldSoundEnabled(5,29,false)
    setWorldSoundEnabled(5,30,false)
    setWorldSoundEnabled(5,0,false)
    setWorldSoundEnabled(5,1,false)
    setWorldSoundEnabled(5,6,false)
    setWorldSoundEnabled(5,7,false)
    setWorldSoundEnabled(5,8,false)
    setWorldSoundEnabled(5,52,false)
    setWorldSoundEnabled(5,76,false)
    setWorldSoundEnabled(5,77,false)
    setWorldSoundEnabled(5,24,false)
end
addEventHandler("onClientResourceStart",getRootElement(),disableSounds)
 
function playGunfireSound()
    local x,y,z = getPedWeaponMuzzlePosition(getLocalPlayer())
    local weapon = getPedWeapon(getLocalPlayer())
        local current_1 = getElementData(getLocalPlayer(),"currentweapon_1")
        local current_2 = getElementData(getLocalPlayer(),"currentweapon_2")
    if weapon == 33 and current_1 == "Winchester 1866" then
        local sound = playSound3D("sounds/wav/weapon/shotgun.wav",x,y,z,false)
        setSoundMaxDistance(sound,30)
    elseif weapon == 30 and current_1 == "PKM" then
        local sound = playSound3D("sounds/wav/weapon/pkm.wav",x,y,z,false)
        setSoundMaxDistance(sound,30)
	elseif weapon == 30 and current_1 == "FN FAL" then
        local sound = playSound3D("sounds/wav/weapon/fn.wav",x,y,z,false)
        setSoundMaxDistance(sound,30)
	elseif weapon == 30 and current_1 == "AKS-74 Kobra" then
        local sound = playSound3D("sounds/wav/weapon/ak.wav",x,y,z,false)
        setSoundMaxDistance(sound,30)
	elseif weapon == 30 and current_1 == "AK-47" then
        local sound = playSound3D("sounds/wav/weapon/ak.wav",x,y,z,false)
        setSoundMaxDistance(sound,30)
	elseif weapon == 30 and current_1 == "AK-107" then
        local sound = playSound3D("sounds/wav/weapon/ak107.wav",x,y,z,false)
        setSoundMaxDistance(sound,30)
	elseif weapon == 31 and current_1 == "M4A1" then
        local sound = playSound3D("sounds/wav/weapon/m4a2.wav",x,y,z,false)
        setSoundMaxDistance(sound,30)
    elseif weapon == 33 and current_1 == "Lee Enfield" then
        local sound = playSound3D("sounds/wav/weapon/leeenfield.wav",x,y,z,false)
        setSoundMaxDistance(sound,40)
    elseif weapon == 34 and current_1 == "DMR" then
        local sound = playSound3D("sounds/wav/weapon/dmr.wav",x,y,z,false)
        setSoundMaxDistance(sound,50)
	elseif weapon == 34 and current_1 == "CZ550" then
        local sound = playSound3D("sounds/wav/weapon/dmr.wav",x,y,z,false)
        setSoundMaxDistance(sound,50)
    elseif weapon == 34 and current_1 == "M107" then
        local sound = playSound3D("sounds/wav/weapon/m107.wav",x,y,z,false)
        setSoundMaxDistance(sound,50)
    elseif weapon == 34 and current_1 == "SVD Camo" then
        local sound = playSound3D("sounds/wav/weapon/svd.wav",x,y,z,false)
        setSoundMaxDistance(sound,50)
    end
end

    addEventHandler("onClientPlayerWeaponFire",getRootElement(),playGunfireSound)
