function disableSounds()
	setAmbientSoundEnabled("gunfire",false)
end
addEventHandler("onClientResourceStart",getResourceRootElement(),disableSounds)

function playGunfireSound(weaponID)
	local muzzleX, muzzleY, muzzleZ = getPedWeaponMuzzlePosition(source)
	local weapon = getElementData(source,"currentweapon_1") 
	if weaponID == 33 then
		if weapon == "Kusza" then 
			local sound = playSound3D("sounds/weap/crossbow.wav",muzzleX,muzzleY,muzzleZ,false)
			setSoundMaxDistance(sound,80)
			setSoundVolume(sound, 0.8)
		elseif weapon == "Mosin 9130" then 
			local sound = playSound3D("sounds/weap/Rifle.wav",muzzleX,muzzleY,muzzleZ,false)
			setSoundMaxDistance(sound,150)
			setSoundVolume(sound, 0.8)
		elseif weapon == "SKS" then 
			local sound = playSound3D("sounds/weap/Rifle.wav",muzzleX,muzzleY,muzzleZ,false)
			setSoundMaxDistance(sound,150)
			setSoundVolume(sound, 0.8)
		end
	end
end
addEventHandler("onClientPlayerWeaponFire", getRootElement(), playGunfireSound)

function playGunfireSound(weaponID)
    local muzzleX, muzzleY, muzzleZ = getPedWeaponMuzzlePosition(source)
	if weaponID == 22 then --colt45
		local sound = playSound3D("sounds/weap/Colt45.wav",muzzleX,muzzleY,muzzleZ,false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 23 then
		local sound = playSound3D("sounds/weap/Silenced.wav",muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 24 then--deagle
		local sound = playSound3D("sounds/weap/Deagle.wav", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 25 then--shotgun
		local sound = playSound3D("sounds/weap/Shotgun.wav", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 26 then--sawn-off
		local sound = playSound3D("sounds/weap/Sawed-Off.wav", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 27 then--combat shotgun
		local sound = playSound3D("sounds/weap/Combat Shotgun.wav", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 28 then--uzi
		local sound = playSound3D("sounds/weap/UZI.wav", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 32 then--tec-9
		local sound = playSound3D("sounds/weap/tec9.mp3", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 29 then--mp5
		local sound = playSound3D("sounds/weap/MP5.wav", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 30 then--ak47
		local sound = playSound3D("sounds/weap/AK-47.wav", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 31 then--m4
		local sound = playSound3D("sounds/weap/M4.wav", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
	elseif weaponID == 34 then--sniper
		local sound = playSound3D("sounds/weap/Sniper.wav", muzzleX, muzzleY, muzzleZ, false)
		setSoundMaxDistance(sound, 150)
		setSoundVolume(sound, 0.8)
    end
end
addEventHandler("onClientPlayerWeaponFire", getRootElement(), playGunfireSound)


function shakeCamera(weapon)
	x,y,z = getPedBonePosition(getLocalPlayer(),26)
	if weapon == 22  then 
		createExplosion(x,y,z+10,12,false,0.1,false)
	elseif weapon == 24  then
		createExplosion(x,y,z+10,12,false,0.2,false)
	elseif weapon == 25  then
		createExplosion(x,y,z+10,12,false,0.4,false)
	elseif weapon == 26  then
		createExplosion(x,y,z+10,12,false,0.5,false)
	elseif weapon == 27  then
		createExplosion(x,y,z+10,12,false,0.3,false)
	elseif weapon == 28  then
		createExplosion(x,y,z+10,12,false,0.1,false)
	elseif weapon == 29  then
		createExplosion(x,y,z+10,12,false,0.1,false)
	elseif weapon == 30  then
		createExplosion(x,y,z+10,12,false,0.1,false)
	elseif weapon == 31  then
		createExplosion(x,y,z+10,12,false,0.1,false)
	elseif weapon == 22  then
		createExplosion(x,y,z+10,12,false,0.1,false)
	elseif weapon == 28  then
		createExplosion(x,y,z+10,12,false,0.1,false)
	elseif weapon == 32  then
		createExplosion(x,y,z+10,12,false,0.1,false)
	elseif weapon == 38  then
		createExplosion(x,y,z+10,12,false,0.4,false)
	end
end
addEventHandler("onClientPlayerWeaponFire",getLocalPlayer(),shakeCamera)