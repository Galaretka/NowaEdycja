damageTable = {
	{"М4А1",2700},
	{"CZ550",4600},
	{"IZH-43",1800},
	{"MP5-K",989},
	{"Blaze 95",2000},
	{"AKM",2800},
	{"Mosin 9130",4600},
	{"FNX45",689},
	{"CR75",689},
	{"PDW",689},
	{"TEC-9",689},
	{"Sawn-Off IZH-43",1500},
	{"Magnum",1190},
	{"Granat",7890},
	{"Granat dymny",90},
	{"Koktajl mołotowa",3500},
	{"Kij bejsbolowy z gwoździami",660},
	{"Kij bejsbolowy",500},
	{"Łopata",520},
	{"Монтировка",550},
	{"Nóż myśliwski",900},
	{"Topór strażacki",1400},
	{"Maczeta",596},
	{"Topór",1300},
	{"Otwieracz",89},
	{"Piła do metalu",94},
	{"Kusza",100},--2000
	{"SKS",3500},
	{"Sporter 22",2600},
}

weaponNoiseTable = {-- 0 none, 20 low, 40 moderate, 60 high
	{22,20},
	{23,0},
	{24,60},
	{28,40},
	{32,40},
	{29,40},
	{30,60},
	{31,60},
	{25,40},
	{26,60},
	{27,60},
	{33,40},
	{34,60},
	{36,60},
	{35,60},
}

function getWeaponAmmoType2 (weaponName)
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[2] then
			return weaponData[1],weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[".45ACP"]) do
		if weaponName == weaponData[2] then
			return ".45ACP",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["9mm"]) do
		if weaponName == weaponData[2] then
			return "9mm",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[".357"]) do
		if weaponName == weaponData[2] then
			return ".357",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["PDW Mag"]) do
		if weaponName == weaponData[2] then
			return "PDW Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["7.62x39mm"]) do
		if weaponName == weaponData[2] then
			return "7.62x39mm",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["5.56mm"]) do
		if weaponName == weaponData[2] then
			return "5.56mm",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["12 Gauge Buckshot"]) do
		if weaponName == weaponData[2] then
			return "12 Gauge Buckshot",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[".22"]) do
		if weaponName == weaponData[2] then
			return ".22",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["CZ550 Mag"]) do
		if weaponName == weaponData[2] then
			return "CZ550 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["7.62x51mm"]) do
		if weaponName == weaponData[2] then
			return "7.62x51mm",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Strzała"]) do
		if weaponName == weaponData[2] then
			return "Strzała",weaponData[2]
		end
	end
	return false
end

local podstvol = false

function podstvolTest(weapon,_,_,hitX,hitY,hitZ)
	if (weapon == 31) then
		local muzzleX,muzzleY,muzzleZ = getPedWeaponMuzzlePosition(weapon)
		createProjectile(source,16,muzzleX,muzzleY,muzzleZ)
	end
end

bindKey("m","down",function()
	if podstvol then
--		addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(), podstvolTest)
		podstvol = false
	else
--		removeEventHandler("onClientPlayerWeaponFire", getLocalPlayer(), podstvolTest)
		podstvol = true
	end
end)--]]

function weaponSwitch(weapon) 
	local wpn = getElementData(getLocalPlayer(), "currentweapon_1")
	local wpn3 = getElementData(getLocalPlayer(), "currentweapon_3")
	local wpn4 = getElementData(getLocalPlayer(), "currentweapon_4")
		if wpn == "Kusza" then
			if getElementData(getLocalPlayer(), "Strzała") > 0 then 
				setElementData(getLocalPlayer(), "Strzała", getElementData(getLocalPlayer(), "Strzała")-1) 
			end
		elseif wpn == "Mosin 9130" then
			if getElementData(getLocalPlayer(), "7.62x51mm") > 0 then 
				setElementData(getLocalPlayer(), "7.62x51mm", getElementData(getLocalPlayer(), "7.62x51mm")-1) 
			end
		elseif wpn == "Blaze 95" then
			if getElementData(getLocalPlayer(), "7.62x51mm") > 0 then 
				setElementData(getLocalPlayer(), "7.62x51mm", getElementData(getLocalPlayer(), "7.62x51mm")-1) 
			end
		elseif wpn == "SKS" then
			if getElementData(getLocalPlayer(), "7.62x39mm") > 0 then 
				setElementData(getLocalPlayer(), "7.62x39mm", getElementData(getLocalPlayer(), "7.62x39mm")-1) 
			end
		end
		if wpn3 == "FNX45" then
			if getElementData(getLocalPlayer(), ".45ACP") > 0 then 
				setElementData(getLocalPlayer(), ".45ACP", getElementData(getLocalPlayer(), ".45ACP")-1) 
			end
		end
		if wpn3 == "CR75" then
			if getElementData(getLocalPlayer(), "9mm") > 0 then 
				setElementData(getLocalPlayer(), "9mm", getElementData(getLocalPlayer(), "9mm")-1) 
			end
		end
		if wpn4 == "Koktajl mołotowa" then
			if getElementData(getLocalPlayer(), "Koktajl mołotowa") > 0 then 
				setElementData(getLocalPlayer(), "Koktajl mołotowa", getElementData(getLocalPlayer(), "Koktajl mołotowa")-1) 
			end
		end
        if wpn == "Sporter 22" then
			if getElementData(getLocalPlayer(), ".22") > 0 then 
				setElementData(getLocalPlayer(), ".22", getElementData(getLocalPlayer(), ".22")-1) 
			end
	    else 
		local ammoName, _ = getWeaponAmmoType2(weapon) 
		if getElementData(getLocalPlayer(), ammoName) > 0 then 
			setElementData(getLocalPlayer(), ammoName, getElementData(getLocalPlayer(), ammoName)-1) 
		end
	end
end
addEventHandler("onClientPlayerWeaponFire", getLocalPlayer(), weaponSwitch)

function getWeaponDamage (weapon)
	for i,weapon2 in ipairs(damageTable) do
		local t,weapon1 = getWeaponAmmoType(weapon2[1])
		if weapon1 == weapon then
			return weapon2[2]
		end
	end
end

function getWeaponNoise(weapon)
	for i,weapon2 in ipairs(weaponNoiseTable) do
		if weapon == weapon2[1] then
			return weapon2[2]
		end
	end
	return 0
end

function debugShooting()
	if getControlState("fire") then
		local weapon = getPedWeapon(getLocalPlayer())
		local noise = getWeaponNoise(weapon) or 0
		setElementData(getLocalPlayer(),"shooting",noise)
		if shootTimer then
			killTimer(shootTimer)
		end
		shootTimer = setTimer(debugShooting2,100,1)
	end
end
setTimer(debugShooting,100,0)

function debugShooting2()
	setElementData(getLocalPlayer(),"shooting",0)
	shootTimer = false
end