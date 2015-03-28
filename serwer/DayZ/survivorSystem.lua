local vehicleDataTableForTent = {
{"Drewno opałowe"},
{"Montion Backpack"},
{"Crash Backpack"},
{"Army Backpack"},
{"Bandaż"},
{"Manierka"},
{"Makaron"},
{"Puszka fasoli"},
{"Hamburger"},
{"Zapałki"},
{"M911 Mag"},
{"Amunicja do M9 SD"},
{"Amunicja do Desert Eagle"},
{"M911"},
{"M9 SD"},
{"Winchester 1866"},
{"PDW"},
{"Nóż"},
{"Morfina"},
{"Topór"},
{"Pizza"},
{"Puszka z napojem"},
{"Pusty kalnister"},
{"Pełny kalnister"},
{"Ogień"},
{"Mleko"},
{"Amunicja do PDW"},
{"Amunicja do MP5A5"},

{"Spodnie: Kamuflaz-Zielony"},
{"Spodnie: Kamuflaz-Szary"},
{"Spodnie: Sport-Zielony"},
{"Spodnie: Sport-Niebieski"},
{"Spodnie: Spodnie-Czarne"},
{"Spodnie: Spodnie-Szary"},
{"Buty: Trampki-Biale"},
{"Buty: Trampki-Niebieskie"},
{"Buty: Buty"},
{"Bluza: Kamuflaz-Zielony"},
{"Bluza: Shirt-Czerwony"},
{"Bluza: Shirt-Bialy"},
{"Bluza: Shirt-Zielony"},
{"Bluza: Shirt-Pomaranczowa"},
{"Bluza: Bluza-Biala"},
{"Bluza: Bluza-Niebieski"},
{"Kurtka: Kurtka-Czarny"},
{"Okulary"},

{"7,62 mm PKM/PKS"},
{"30Rnd. AK"},
{"30Rnd. AKS"},
{"30Rnd. STANAG"},
{"SVD Mag"},
{"M107 Mag"},
{"DMR Mag"},
{"CZ550 Mag"},
{"AK-107 Mag"},
{"FN Mag"},


{"FN FAL"},
{"AK-107"},
{"M4A1"},
{"CZ550"},
{"AK-47"},
{"AKS-74 Kobra"},
{"PKM"},
{"SVD Camo"},
{"DMR"},
{"M107"},



{"Gas łzawiący"},
{"Оск. граната M67"},
{"Desert Eagle"},
{"Sawn-Off Shotgun"},
{"Granat"},
{"MP5A5"},
{"Zegarek"},
{"Apteczka"},
{"Ciepła paczka"},
{"Lee Enfield"},
{"TEC-9"},

{"Amunicja do M136 Launcher"},
{"Medyczna paczka"},
{"GPS"},
{"Mapa"},
{"Narzędzia"},
{"Drut kolczasty"},
{"Koło"},
{"Silnik"},
{"Bak"},
{"Amunicja do M136"},

{"Amunicja do Lee Enfield"},

{"Heat-Seeking RPG"},
{"Satchel"},
{"Gogle na podczerwień"},
{"Gogle noktowizyjne"},
{"Namiot"},
{"Pieczeń"},
{"Mięso"},
--{"Skin przetrwania"},
--{"Skin snajpera"},
--{"Skin bandyty"},
--{"Podstawowy skin"},
{"Środki przeciwbólowe"},
{"Lornetka"},
{"Pusta manierka"},
{"Pusta puszka po napoju"},
{"Pozostałości"},
{"1866 Slug"},
{"2Rnd. Slug"},
{"Amunicja do Granatnika"},
{"Assault Pack (ACU)"},
{"Alice Pack"},
{"Radio"},
{"Coyote Backpack"},
{"Czech Backpack"},
{"Kij bejsbolowy"},
{"Łopata"},
{"Kij golfowy"},
}

weaponAmmoTable = {

["Amunicja do M1911"] = {
{"M1911",22},
},

["Amunicja do M9 SD"] = {
{"M9 SD",23},
},

["Amunicja do Desert Eagle"] = {
{"Desert Eagle",24},
},

["Amunicja do PDW"] = {
{"PDW",28},
},

["Amunicja do MP5A5"] = {
{"MP5A5",29},
},


["30Rnd. AK"] = {
{"AK-47",30},
},

["30Rnd. AKS"] = {
{"AKS-74 Kobra",30},
},

["FN Mag"] = {
{"FN FAL",30},
},

["AK-107 Mag"] = {
{"AK-107",30},
},

["7,62 mm PKM/PKS"] = {
{"PKM",30},
},

["30Rnd. STANAG"] = {
{"M4A1",31},
},

["CZ550 Mag"] = {
{"CZ550",34},
},

["SVD Mag"] = {
{"SVD Camo",34},
},

["M107 Mag"] = {
{"M107",34},
},

["DMR Mag"] = {
{"DMR",34},
},


["1866 Slug"] = {
{"Winchester 1866",25},
},

["2Rnd. Slug"] = {
{"Sawn-Off Shotgun",26},
},

["Amunicja do Granatnika"] = {
{"Granat",27},
},

["Amunicja do CZ550"] = {
{"CZ550",34},
},

["Amunicja do Lee Enfield"] = {
{"Lee Enfield",33},
},

["Amunicja do M136"] = {
{"Heat-Seeking RPG",36},
{"Amunicja do M136 Launcher",35},
},


["others"] = {
{"Spadochron",46},
{"Satchel",39},
{"Gas łzawiący",17},
{"Оск. граната M67",16},
{"Nóż",4},
{"Topór",8},
{"Lornetka",43},
{"Kij bejsbolowy",5},
{"Łopata",6},
{"Kij golfowy",2},
{"Radio",1},
},
}

function getWeaponAmmoType (weaponName,notOthers)
	if not notOthers then
		for i,weaponData in ipairs(weaponAmmoTable["others"]) do
			if weaponName == weaponData[1] then
				return weaponData[1],weaponData[2]
			end
		end
	end	
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do M1911"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do M1911",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do M9 SD"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do M9 SD",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do Desert Eagle"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do Desert Eagle",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do PDW"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do PDW",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do MP5A5"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do MP5A5",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["30Rnd. AK"]) do
		if weaponName == weaponData[1] then
			return "30Rnd. AK",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["30Rnd. AKS"]) do
		if weaponName == weaponData[1] then
			return "30Rnd. AKS",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["AK-107 Mag"]) do
		if weaponName == weaponData[1] then
			return "AK-107 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["FN Mag"]) do
		if weaponName == weaponData[1] then
			return "FN Mag",weaponData[2]
		end
	end
    for i,weaponData in ipairs(weaponAmmoTable["30Rnd. STANAG"]) do
		if weaponName == weaponData[1] then
			return "30Rnd. STANAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["7,62 mm PKM/PKS"]) do
		if weaponName == weaponData[1] then
			return "7,62 mm PKM/PKS",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["SVD Mag"]) do
		if weaponName == weaponData[1] then
			return "SVD Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M107 Mag"]) do
		if weaponName == weaponData[1] then
			return "M107 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["DMR Mag"]) do
		if weaponName == weaponData[1] then
			return "DMR Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["CZ550 Mag"]) do
		if weaponName == weaponData[1] then
			return "CZ550 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["1866 Slug"]) do
		if weaponName == weaponData[1] then
			return "1866 Slug",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["2Rnd. Slug"]) do
		if weaponName == weaponData[1] then
			return "2Rnd. Slug",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do Granatnika"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do Granatnika",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do CZ550"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do CZ550",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do Lee Enfield"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do Lee Enfield",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do M136"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do M136",weaponData[2]
		end
	end
	return false
end

function rearmPlayerWeapon (weaponName,slot)
  takeAllWeapons (source)
  local ammoData,weapID = getWeaponAmmoType (weaponName)
  if getElementData(source,ammoData) <= 0 then
  triggerClientEvent (source, "displayClientInfo", source,"Rearm",shownInfos["nomag"],255,22,0)
  if elementWeaponRaplace[source] then
  detachElementFromBone(elementWeaponRaplace[source])
  destroyElement(elementWeaponRaplace[source])
  elementWeaponRaplace[source] = false
  end
  return
  end
  setElementData(source,"currentweapon_"..slot,weaponName)
  local weapon = getElementData(source, "currentweapon_1")
  if weapon then
  local ammoData, weapID = getWeaponAmmoType(weapon)
    giveWeapon(source, weapID, getElementData(source, ammoData), false)
  end
  local weapon = getElementData(source, "currentweapon_2")
  if weapon then
    local ammoData, weapID = getWeaponAmmoType(weapon)
    giveWeapon(source, weapID, getElementData(source, ammoData), false)
  end
  local weapon = getElementData(source, "currentweapon_3")
  if weapon then
    local ammoData, weapID = getWeaponAmmoType(weapon)
    giveWeapon(source, weapID, getElementData(source, ammoData), false)
  end
  if elementWeaponBack[source] then
    detachElementFromBone(elementWeaponBack[source])
    destroyElement(elementWeaponBack[source])
    elementWeaponBack[source] = false
  end
  setElementModel(source, getElementData(source, "skin"))
end
addEvent("onPlayerRearmWeapon", true)
addEventHandler("onPlayerRearmWeapon", getRootElement(), rearmPlayerWeapon)

weaponIDtoObjectID = {
{30,355},
{31,356},
{25,349},
{26,350},
{27,351},
{33,357},
{34,358},
{36,360},
{35,359},
{2,333},
{5,336},
{6,337},
}

function getWeaponObjectID (weaponID)
	for i,weaponData in ipairs(weaponIDtoObjectID) do
		if weaponID == weaponData[1] then
			return weaponData[2]
		end
	end
end	

--attaches
local elementBackpack = {}
function backPackBack (dataName,oldValue)
	if getElementType(source) == "player" and dataName =="MAX_Slots" then
		local newValue = getElementData(source,dataName)
		if elementBackpack[source] then
			detachElementFromBone(elementBackpack[source])
			destroyElement(elementBackpack[source])
			elementBackpack[source] = false
		end
		local x,y,z = getElementPosition(source)
		local rx,ry,rz = getElementRotation(source)
		if newValue == 12 then
			elementBackpack[source] = createObject(3026,x,y,z)
		elseif newValue == 16 then
			elementBackpack[source] = createObject(1248,x,y,z)
		elseif newValue == 26 then
			elementBackpack[source] = createObject(2406,x,y,z)
		elseif newValue == 85 then
			elementBackpack[source] = createObject(1550,x,y,z)
		elseif newValue == 69 then
			elementBackpack[source] = createObject(2410,x,y,z)
		elseif newValue == 47 then 
            elementBackpack[source] = createObject(2404,x,y,z)
		elseif newValue == 36 then
			elementBackpack[source] = createObject(2405,x,y,z)
		elseif newValue == 8 then
			return
		end
		if newValue == 12 then 
            attachElementToBone(elementBackpack[source],source,3,0,-0.225,0.05,90,0,0) 
        elseif newValue == 16 then 
            attachElementToBone(elementBackpack[source],source,3,0,-0.225,0.05,90,0,0) 
        elseif newValue == 26 then 
            attachElementToBone(elementBackpack[source],source,3,0,-0.21,0.05,270,0,180) 
        elseif newValue == 47 then 
            attachElementToBone(elementBackpack[source],source,3,0,-0.21,0.05,270,0,180) 
		elseif newValue == 85 then 
            attachElementToBone(elementBackpack[source],source,3,0,-0.225,0.05,90,0,0) 
		elseif newValue == 69 then 
            attachElementToBone(elementBackpack[source],source,3,0,-0.225,0.05,90,0,0) 
        elseif newValue == 36 then 
            attachElementToBone(elementBackpack[source],source,3,0,-0.225,0.05,90,0,0) 
        else 
            attachElementToBone(elementBackpack[source],source,3,0,-0.21,0.05,270,0,180) 
        end
	end	
end
addEventHandler ( "onElementDataChange", getRootElement(), backPackBack )

function backpackRemoveQuit ()
	if elementBackpack[source] then
		detachElementFromBone(elementBackpack[source])
		destroyElement(elementBackpack[source])
	end
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end	
	if elementWeaponRaplace[source] then
		detachElementFromBone(elementWeaponRaplace[source])
		destroyElement(elementWeaponRaplace[source])
		elementWeaponRaplace[source] = false
end
end
addEventHandler ( "onPlayerQuit", getRootElement(), backpackRemoveQuit )

elementWeaponBack = {}
function weaponSwitchBack(previousWeaponID, currentWeaponID)
  local weapon1 = getElementData(source, "currentweapon_1")
  if not weapon1 then
    return
  end
  local ammoData1, weapID1 = getWeaponAmmoType(weapon1)
  local x, y, z = getElementPosition(source)
  local rx, ry, rz = getElementRotation(source)
  if previousWeaponID == weapID1 then
    if elementWeaponBack[source] then
      setElementID(player, "elementWeaponBack[source]")
      detachElementFromBone(elementWeaponBack[source])
      destroyElement(elementWeaponBack[source])
      elementWeaponBack[source] = false
    end
	if weapon1 == "SVD Camo" then
	elementWeaponBack[source] = createObject(2916, x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	elseif weapon1 == "M107" then
	elementWeaponBack[source] = createObject(2917, x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	elseif weapon1 == "DMR" then
	elementWeaponBack[source] = createObject(2918, x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	elseif weapon1 == "PKM" then
	elementWeaponBack[source] = createObject(2915, x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	elseif weapon1 == "AKS-74 Kobra" then
	elementWeaponBack[source] = createObject(2919, x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	elseif weapon1 == "AK-47" then
	elementWeaponBack[source] = createObject(2912, x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	elseif weapon1 == "CZ550" then
	elementWeaponBack[source] = createObject(2913, x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	elseif weapon1 == "FN FAL" then
	elementWeaponBack[source] = createObject(2911, x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	elseif weapon1 == "AK-107" then
	elementWeaponBack[source] = createObject(2914, x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	else
    elementWeaponBack[source] = createObject(getWeaponObjectID(weapID1), x, y, z)
    setObjectScale(elementWeaponBack[source], 0.875)
	end
    if elementBackpack[source] then
      attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.31, -0.1, 0, 270, -90)
	 
    else
      attachElementToBone(elementWeaponBack[source], source, 3, 0.19, -0.11, -0.1, 0, 270, 10)
    end
  elseif currentWeaponID == weapID1 then
    setElementData(player, "elementWeaponBack[source]")
    detachElementFromBone(elementWeaponBack[source])
    destroyElement(elementWeaponBack[source])
    elementWeaponBack[source] = false
  end
end
addEventHandler("onPlayerWeaponSwitch", getRootElement(), weaponSwitchBack)


elementWeaponRaplace = {}
function weaponReplace ( previousWeaponID, currentWeaponID )
--local source = getRootElement()
local weapon1 = getElementData(source,"currentweapon_1")
if not weapon1 then return end
local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
local x,y,z = getElementPosition(source)
local rx,ry,rz = getElementRotation(source)
if currentWeaponID == weapID1 then
if elementWeaponRaplace[source] then
detachElementFromBone(elementWeaponRaplace[source])
destroyElement(elementWeaponRaplace[source])
elementWeaponRaplace[source] = false
end
if weapon1 == "SVD Camo" then
elementWeaponRaplace[source] = createObject(2916,x,y,z)
elseif weapon1 == "M107" then
elementWeaponRaplace[source] = createObject(2917,x,y,z)
elseif weapon1 == "DMR" then
elementWeaponRaplace[source] = createObject(2918,x,y,z)
elseif weapon1 == "PKM" then
elementWeaponRaplace[source] = createObject(2915,x,y,z)
elseif weapon1 == "AKS-74 Kobra" then
elementWeaponRaplace[source] = createObject(2919,x,y,z)
elseif weapon1 == "AK-47" then
elementWeaponRaplace[source] = createObject(2912,x,y,z)
elseif weapon1 == "CZ550" then
elementWeaponRaplace[source] = createObject(2913,x,y,z)
elseif weapon1 == "AK-107" then
elementWeaponRaplace[source] = createObject(2914,x,y,z)
elseif weapon1 == "FN FAL" then
elementWeaponRaplace[source] = createObject(2911,x,y,z)
end
if elementBackpack[source] then
attachElementToBone(elementWeaponRaplace[source],source,12,0,0,0,180,90,180)
else
attachElementToBone(elementWeaponRaplace[source],source,12,0,0,0,180,90,180)
end
elseif previousWeaponID == weapID1 then
detachElementFromBone(elementWeaponRaplace[source])
destroyElement(elementWeaponRaplace[source])
elementWeaponRaplace[source] = false
end
end
addEventHandler ( "onPlayerWeaponSwitch", getRootElement(), weaponReplace )

function removeBackWeaponOnDrop ()
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end
	if elementWeaponRaplace[source] then
	detachElementFromBone(elementWeaponRaplace[source])
	destroyElement(elementWeaponRaplace[source])
	elementWeaponRaplace[source] = false
end
end
addEvent("removeBackWeaponOnDrop",true)
addEventHandler("removeBackWeaponOnDrop",getRootElement(),removeBackWeaponOnDrop)

function removeAttachedOnDeath ()
	if elementBackpack[source] then
		detachElementFromBone(elementBackpack[source])
		destroyElement(elementBackpack[source])
	end
	if elementWeaponBack[source] then
		detachElementFromBone(elementWeaponBack[source])
		destroyElement(elementWeaponBack[source])	
		elementWeaponBack[source] = false
	end	
	if elementWeaponRaplace[source] then
	detachElementFromBone(elementWeaponRaplace[source])
	destroyElement(elementWeaponRaplace[source])
	elementWeaponRaplace[source] = false
  end
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),removeAttachedOnDeath)

function weaponDelete(dataName,oldValue)
	if getElementType(source) == "player" then -- check if the element is a player
		local weapon1 = getElementData(source,"currentweapon_1")
		local weapon2 = getElementData(source,"currentweapon_2")
		local weapon3 = getElementData(source,"currentweapon_3")
		if dataName == weapon1 or dataName == weapon2 or dataName == weapon3 then
			if getElementData (source,dataName) == 0 then
				local ammoData,weapID = getWeaponAmmoType(dataName)
				takeWeapon (source,weapID)
			end
		end
		local weapon1 = getElementData(source,"currentweapon_1")
		local weapon2 = getElementData(source,"currentweapon_2")
		local weapon3 = getElementData(source,"currentweapon_3")
		local ammoData1,weapID1 = getWeaponAmmoType(weapon1)
		local ammoData2,weapID2 = getWeaponAmmoType(weapon2)
		local ammoData3,weapID3 = getWeaponAmmoType(weapon3)
		if dataName == ammoData1 then
			if not oldValue then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID1,newammo) 
				if elementWeaponBack[source] then
					detachElementFromBone(elementWeaponBack[source])
					destroyElement(elementWeaponBack[source])	
					elementWeaponBack[source] = false
				end	
			elseif getElementData (source,dataName) > oldValue then
				giveWeapon(source,weapID1,getElementData (source,dataName)-oldValue,true)
			end
		end	
		if dataName == ammoData2 then
			if not oldValue then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID2,newammo) 
			elseif getElementData (source,dataName) > oldValue then
				giveWeapon(source,weapID2,getElementData (source,dataName)-oldValue,false)
			end
		end	
		if dataName == ammoData3 then
			if not oldValue then return end
			local newammo = oldValue - getElementData (source,dataName)
			if newammo == 1 then return end
			if getElementData (source,dataName) < oldValue then
				takeWeapon (source,weapID3,newammo) 
			elseif getElementData (source,dataName) > oldValue then
				giveWeapon(source,weapID3,getElementData (source,dataName)-oldValue,false)
			end	
		end
	end
end
addEventHandler("onElementDataChange",getRootElement(),weaponDelete)

function addPlayerStats (player,data,value)
	if data == "food" then
		local current = getElementData(player,data)
		if current + value > 100 then
			setElementData(player,data,100)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
			setElementData(player,"blood",getElementData(player,"blood")-math.random(50,120))
		else
			setElementData(player,data,current+value)
		end
	elseif data == "thirst" then
		local current = getElementData(player,data)
		if current + value > 100 then
			setElementData(player,data,100)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
			setElementData(player,"blood",getElementData(player,"blood")-math.random(50,120))
		else
			setElementData(player,data,current+value)
		end
	elseif data == "blood" then
		local current = getElementData(player,data)
		if current + value > 12000 then
			setElementData(player,data,12000)
		elseif 	current + value < 1 then
			setElementData(player,data,0)
		else
			setElementData(player,data,current+value)
		end
	elseif data == "temperature" then
		local current = getElementData(player,data)
		if current + value > 41 then
			setElementData(player,data,41)
		elseif 	current + value <= 31 then
			setElementData(player,data,31)
		else
			setElementData(player,data,current+value)
		end
	elseif data == "humanity" then
		local current = getElementData(player,data)
		if current + value > 5000 then
			setElementData(player,data,5000)
		else
			setElementData(player,data,current+value)
		end		
	end
end

function checkTemperature()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = 0
			if getWeather == 7 then
				value = -0.1
			elseif getWeather == 12 then
				value = 0
			elseif getWeather == 16 then
				value = -0.4
			elseif getWeather == 4 then
				value = -0.1
			end
			local hour, minutes = getTime()
			if hour >= 21 and hour <= 8 then
				value = value-0.05
			end
			addPlayerStats (player,"temperature",value)
		end
	end	
end
setTimer(checkTemperature,60000,0)

function checkTemperature2()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = 0
			if isElementInWater(player) then
				value = gameplayVariables["temperaturewater"]
			end	
			if getControlState (player,"sprint") then
				value = value+gameplayVariables["temperaturesprint"]
			end
			addPlayerStats (player,"temperature",value)
		end	
	end
end
setTimer(checkTemperature2,10000,0)

function setHunger()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = gameplayVariables["loseHunger"]
			addPlayerStats (player,"food",value)
		end	
	end
end
setTimer(setHunger,60000,0)

function setThirsty()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = gameplayVariables["loseThirst"]
			addPlayerStats (player,"thirst",value)
		end
	end
end
setTimer(setThirsty,60000,0)

function checkThirsty()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			value = 0
			if getControlState (player,"sprint") then
				value = gameplayVariables["sprintthirst"]
			end	
			addPlayerStats (player,"thirst",value)
		end
	end
end
setTimer(checkThirsty,10000,0)

function checkHumanity()
	for i,player in ipairs(getElementsByType("player")) do
		if getElementData(player,"logedin") then
			if getElementData(player,"humanity") < 2500 then
				addPlayerStats (player,"humanity",30)
				if getElementData(player,"humanity") > 2000 then
					setElementData(player,"bandit",false)
				end
			end
		end	
	end
end
setTimer(checkHumanity,60000,0)

function onPlayerRequestChangingStats(itemName,itemInfo,data)
	if data == "food" then
		if itemName == "Hamburger" then
			blood = 300
		elseif itemName == "Pizza" then
			blood = 300
		elseif itemName == "Mięso" then
			blood = 800
		elseif itemName == "Puszka fasoli" then
			blood = 200
		elseif itemName == "Makaron" then
			blood = 200
		end
		setPedAnimation (source,"FOOD","EAT_Burger",-1, false, false, false, false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
		addPlayerStats (source,"blood",blood)
		addPlayerStats (source,data,gameplayVariables["foodrestore"])
	elseif data == "thirst" then
		setElementData(source,itemName,getElementData(source,itemName)-1)
		addPlayerStats (source,data,gameplayVariables["thirstrestore"])
		setPedAnimation (source,"VENDING","VEND_Drink2_P",-1, false, false, false, false) 
		if itemName == "Manierka" then
			setElementData(source,"Pusta manierka",(getElementData(source,"Pusta manierka") or 0)+1)
		end
	end
	triggerClientEvent (source, "displayClientInfo", source,"Food",shownInfos["youconsumed"].." "..itemName,22,255,0)
	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerRequestChangingStats",true)
addEventHandler("onPlayerRequestChangingStats",getRootElement(),onPlayerRequestChangingStats)

function onPlayerUseMedicObject(itemName)
	local playersource = source
	setPedAnimation (playersource,"BOMBER","BOM_Plant",-1, false, false, false, false)
	setTimer( function ()
		if itemName == "Bandaż" then
			setElementData(playersource,"bleeding",0)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Apteczka" then
			addPlayerStats (playersource,"blood",7000)
			setElementData(playersource,"bleeding",0)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Ciepła paczka" then
			setElementData(playersource,"cold",false)
			setElementData(playersource,"temperature",37)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Środki przeciwbólowe" then
			setElementData(playersource,"pain",false)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Morfina" then
			setElementData(playersource,"brokenbone",false)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		elseif itemName == "Medyczna paczka" then
			addPlayerStats (playersource,"blood",12000)
			setElementData(playersource,itemName,getElementData(playersource,itemName)-1)
		end
	end,1500,1)	
	triggerClientEvent(playersource,"refreshInventoryManual",playersource)
end
addEvent("onPlayerUseMedicObject",true)
addEventHandler("onPlayerUseMedicObject",getRootElement(),onPlayerUseMedicObject)

function onPlayerGiveMedicObject(itemName,player)
	local playersource = source
	setPedAnimation (playersource,"BOMBER","BOM_Plant",-1, false, false, false, false)
	setTimer( function ()
		if itemName == "bandage" then
			setElementData(player,"bleeding",0)
			setElementData(playersource,"Bandaż",getElementData(playersource,"Bandaż")-1)
			addPlayerStats (playersource,humanity,40)
		elseif itemName == "giveblood" then
			addPlayerStats (player,"blood",12000)
			setElementData(playersource,"Medyczna paczka",getElementData(playersource,"Medyczna paczka")-1)
			addPlayerStats (playersource,humanity,250)
		end
	end,1500,1)	
end
addEvent("onPlayerGiveMedicObject",true)
addEventHandler("onPlayerGiveMedicObject",getRootElement(),onPlayerGiveMedicObject)


--[[skinTable = {
{"Skin przetrwania",179},
{"Skin snajpera",285},
{"Skin bandyty",180},
{"Podstawowy skin",73},
}

function getSkinIDFromName(name)
	for i,skin in ipairs(skinTable) do
		if name == skin[1] then
			return skin[2]
		end
	end
end

function getSkinNameFromID(id)
	for i,skin in ipairs(skinTable) do
		if id == skin[2] then
			return skin[1]
		end
	end
end]]--

function addPlayerSkin (skin)
	local current = getElementData(source,"skin")
	local name = getSkinNameFromID(current)
	setElementData(source,name,getElementData(source,name)+1)
	setElementData(source,skin,getElementData(source,skin)-1)
	local id = getSkinIDFromName(skin)
	setElementData(source,"skin",id)
	setElementModel(source,id)
	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeSkin",true)
addEventHandler("onPlayerChangeSkin",getRootElement(),addPlayerSkin)

function addPlayerGreenTrouses ()
removePedClothes( source, 2)
addPedClothes ( source, "worktrcamogrn", "worktr", 2 )
setElementData( source, "trousers", 1) --ИД
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerGreenChangeTrouses",true)
addEventHandler("onPlayerGreenChangeTrouses",getRootElement(),addPlayerGreenTrouses)

function addPlayerYellowTrouses ()
removePedClothes( source, 2)
addPedClothes ( source, "worktrcamogry", "worktr", 2 )
setElementData( source, "trousers", 2)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerYellowChangeTrouses",true)
addEventHandler("onPlayerYellowChangeTrouses",getRootElement(),addPlayerYellowTrouses)

function addPlayerTrousesSportGreen ()
removePedClothes( source, 2)
addPedClothes ( source, "tracktrgang", "tracktr", 2 )
setElementData( source, "trousers", 3)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeSportGreenTrouses",true)
addEventHandler("onPlayerChangeSportGreenTrouses",getRootElement(),addPlayerTrousesSportGreen)

function addPlayerTrousesSportBlue ()
removePedClothes( source, 2)
addPedClothes ( source, "tracktrblue", "tracktr", 2 )
setElementData( source, "trousers", 4)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeSportBlueTrouses",true)
addEventHandler("onPlayerChangeSportBlueTrouses",getRootElement(),addPlayerTrousesSportBlue)

function addPlayerTrousesSportGry ()
removePedClothes( source, 2)
addPedClothes ( source, "suit1trblk", "suit1tr", 2 )
setElementData( source, "trousers", 5)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeSuitblakTrouses",true)
addEventHandler("onPlayerChangeSuitblakTrouses",getRootElement(),addPlayerTrousesSportGry)

function addPlayerTrousesGrybridz ()
removePedClothes( source, 2)
addPedClothes ( source, "chongergrey", "chonger", 2 )
setElementData( source, "trousers", 6)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeGrybridzTrouses",true)
addEventHandler("onPlayerChangeGrybridzTrouses",getRootElement(),addPlayerTrousesGrybridz)

--Обувь
function addPlayerTrousesWhiteShoes ()
removePedClothes( source, 3)
addPedClothes ( source, "bask2heatwht", "bask1", 3 )
setElementData( source, "Shoes", 1)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeWhiteShoes",true)
addEventHandler("onPlayerChangeWhiteShoes",getRootElement(),addPlayerTrousesWhiteShoes)

function addPlayerTrousesBlueShoes ()
removePedClothes( source, 3)
addPedClothes ( source, "convproblu", "conv", 3 )
setElementData( source, "Shoes", 2)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeBlueShoes",true)
addEventHandler("onPlayerChangeBlueShoes",getRootElement(),addPlayerTrousesBlueShoes)

function addPlayerTrousesSuitShoes ()
removePedClothes( source, 3)
addPedClothes ( source, "shoedressblk", "shoe", 3 )
setElementData( source, "Shoes", 3)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeSuitShoes",true)
addEventHandler("onPlayerChangeSuitShoes",getRootElement(),addPlayerTrousesSuitShoes)

--Тело

function addPlayerGreenShirt ()
removePedClothes( source, 0)
addPedClothes ( source, "tshirtwhite", "tshirt", 0 )
setElementData( source, "Shirt", 8) --ИД
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerGreenChangeShirt",true)
addEventHandler("onPlayerGreenChangeShirt",getRootElement(),addPlayerGreenShirt)

function onPlayerChangeRedtShirt ()
removePedClothes( source, 0)
addPedClothes ( source, "shirtbplaid", "shirtb", 0 )
setElementData( source, "Shirt", 1)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeRedtShirt",true)
addEventHandler("onPlayerChangeRedtShirt",getRootElement(),onPlayerChangeRedtShirt)

function onPlayerChangeWhiteShirt ()
removePedClothes( source, 0)
addPedClothes ( source, "tshirtilovels", "tshirt", 0 )
setElementData( source, "Shirt", 2)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeWhiteShirt",true)
addEventHandler("onPlayerChangeWhiteShirt",getRootElement(),onPlayerChangeWhiteShirt)

function onPlayerChangeGreenShirt ()
removePedClothes( source, 0)
addPedClothes ( source, "tshirterisyell", "tshirt", 0 )
setElementData( source, "Shirt", 3)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeGreenShirt",true)
addEventHandler("onPlayerChangeGreenShirt",getRootElement(),onPlayerChangeGreenShirt)

function onPlayerChangeOrangeShirt ()
removePedClothes( source, 0)
addPedClothes ( source, "tshirterisorn", "tshirt", 0 )
setElementData( source, "Shirt", 4)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeOrangeShirt",true)
addEventHandler("onPlayerChangeOrangeShirt",getRootElement(),onPlayerChangeOrangeShirt)

function onPlayerChangeWhiteHoody ()
removePedClothes( source, 0)
addPedClothes ( source, "hoodyarockstar", "hoodya", 0 )
setElementData( source, "Shirt", 5)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeWhiteHoody",true)
addEventHandler("onPlayerChangeWhiteHoody",getRootElement(),onPlayerChangeWhiteHoody)

function onPlayerChangeBlueHoody ()
removePedClothes( source, 0)
addPedClothes ( source, "hoodyAblue", "hoodyA", 0 )
setElementData( source, "Shirt", 6)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeBlueHoody",true)
addEventHandler("onPlayerChangeBlueHoody",getRootElement(),onPlayerChangeBlueHoody)

function onPlayerChangeSuitBlack ()
removePedClothes( source, 0)
addPedClothes ( source, "tuxedo", "suit2", 0 )
setElementData( source, "Shirt", 7)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeSuitBlack",true)
addEventHandler("onPlayerChangeSuitBlack",getRootElement(),onPlayerChangeSuitBlack)
--Очки
function onPlayerChangeGlasses ()
removePedClothes( source, 15)
addPedClothes ( source, "glasses04dark", "glasses04", 15 )
setElementData( source, "glases", 1)
triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerChangeGlasses",true)
addEventHandler("onPlayerChangeGlasses",getRootElement(),onPlayerChangeGlasses) 

function onPlayerRefillWaterBottle (itemName)
	if isElementInWater(source) then
		setElementData(source,"Manierka",getElementData(source,"Manierka")+1)
		setElementData(source,itemName,getElementData(source,itemName)-1)
		triggerClientEvent(source,"refreshInventoryManual",source)
		triggerClientEvent (source, "displayClientInfo", source,"Manierka",shownInfos["filledup"],22,255,0)
	else
		triggerClientEvent (source, "displayClientInfo", source,"Manierka",shownInfos["needwatersource"],255,22,0)
	end	
end
addEvent("onPlayerRefillWaterBottle",true)
addEventHandler("onPlayerRefillWaterBottle",getRootElement(),onPlayerRefillWaterBottle)

function getPointFromDistanceRotation(x, y, dist, angle)
 
    local a = math.rad(90 - angle);
 
    local dx = math.cos(a) * dist;
    local dy = math.sin(a) * dist;
 
    return x+dx, y+dy;
 
end

function onPlayerPitchATent (itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	setPedAnimation (source,"BOMBER","BOM_Plant",-1, false, false, false, false)
	local source = source
	setTimer( function ()		
			local x,y,z = getElementPosition(source)
			local xr,yr,zr = getElementRotation(source)
			px, py, pz = getElementPosition(source)
			prot = getPedRotation(source)
			local offsetRot = math.rad(prot+90)
			local vx = px + 5 * math.cos(offsetRot)
			local vy = py + 5 * math.sin(offsetRot)
			local vz = pz + 2
			local vrot = prot+180
			tent = createObject(3243,vx,vy,z-1,0,0,vrot)
			setObjectScale(tent,1.3)
			tentCol = createColSphere(x,y,z,4)
			attachElements ( tentCol, tent, 0, 0, 0 )
			setElementData(tentCol,"parent",tent)
			setElementData(tent,"parent",tentCol)
			setElementData(tentCol,"tent",true)
			setElementData(tentCol,"vehicle",true)
			setElementData(tentCol,"MAX_Slots",100)
			triggerClientEvent(source,"refreshInventoryManual",source)
	end,1500,1)			
end
addEvent("onPlayerPitchATent",true)
addEventHandler("onPlayerPitchATent",getRootElement(),onPlayerPitchATent)

function onPlayerBuildAWireFence (itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	setPedAnimation (source,"BOMBER","BOM_Plant",-1, false, false, false, false)
	local source = source
	setTimer( function ()				
			local x,y,z = getElementPosition(source)
			local xr,yr,zr = getElementRotation(source)
			--outputChatBox(zr)
			px, py, pz = getElementPosition(source)
			prot = getPedRotation(source)
			local offsetRot = math.rad(prot+90)
			local vx = px + 1 * math.cos(offsetRot)
			local vy = py + 1 * math.sin(offsetRot)
			local vz = pz + 2
			local vrot = prot+90
			--local x,y = getPointFromDistanceRotation(x,y,5,0)
			tent = createObject(983,vx,vy,pz,xr,yr,vrot)
			setObjectScale(tent,1)
			tentCol = createColSphere(x,y,z,2)
			attachElements ( tentCol, tent, 0, 0, 0 )
			setElementData(tentCol,"parent",tent)
			setElementData(tent,"parent",tentCol)
			setElementData(tentCol,"wirefence",true)
			triggerClientEvent(source,"refreshInventoryManual",source)
	end,1500,1)			
end
addEvent("onPlayerBuildAWireFence",true)
addEventHandler("onPlayerBuildAWireFence",getRootElement(),onPlayerBuildAWireFence)

function removeWirefence (object)
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
end
addEvent("removeWirefence",true)
addEventHandler("removeWirefence",getRootElement(),removeWirefence)

function removeTent (object)
	local x,y,z = getElementPosition(getElementData(object,"parent"))
	local item,itemString = getItemTablePosition("Namiot")
	local itemPickup = createItemPickup(item,x,y,z+1,itemString)
	
	destroyElement(getElementData(object,"parent"))
	destroyElement(object)
end
addEvent("removeTent",true)
addEventHandler("removeTent",getRootElement(),removeTent)

function addPlayerCookMeat ()
	local playersource = source
	setPedAnimation (playersource,"BOMBER","BOM_Plant",-1, false, false, false, false)
	local meat = getElementData(playersource,"Pieczeń")
	setTimer(function()
			setElementData(playersource,"Pieczeń",0)
			setElementData(playersource,"Mięso",getElementData(playersource,"Mięso")+meat)
			triggerClientEvent (playersource, "displayClientInfo", playersource,"Ognisko","Smażysz "..meat.." surowe mięso.",22,255,0)
	end,5000,1)
end
addEvent("addPlayerCookMeat",true)
addEventHandler("addPlayerCookMeat",getRootElement(),addPlayerCookMeat)

function onPlayerMakeAFire (itemName)
	setElementData(source,"Drewno opałowe",getElementData(source,"Drewno opałowe")-1)
	local x,y,z = getElementPosition(source)
	local xr,yr,zr = getElementRotation(source)
	px, py, pz = getElementPosition(source)
	prot = getPedRotation(source)
	local offsetRot = math.rad(prot+90)
	local vx = px + 1 * math.cos(offsetRot)
	local vy = py + 1 * math.sin(offsetRot)
	local vz = pz + 2
	local vrot = prot+90
	--local x,y = getPointFromDistanceRotation(x,y,5,0)
	local wood = createObject(1463,vx,vy,pz-0.75,xr,yr,vrot)
	setObjectScale(wood,0.55)
	setElementCollisionsEnabled(wood, false)
	setElementFrozen (wood,true)
	local fire = createObject(3525,vx,vy,pz-0.75,xr,yr,vrot)
	setObjectScale(fire,0)
	local fireCol = createColSphere(x,y,z,2)
	setElementData(fireCol,"parent",wood)
	setElementData("Drewno opałowe","parent",fireCol)
	setElementData(fireCol,"fireplace",true)
	triggerClientEvent(source,"refreshInventoryManual",source)
	setPedAnimation (playersource,"BOMBER","BOM_Plant",-1, false, false, false, false)
	setTimer(function()
		destroyElement(fireCol)
		destroyElement(fire)
		destroyElement(wood)
	end,120000,1)
end
addEvent("onPlayerMakeAFire",true)
addEventHandler("onPlayerMakeAFire",getRootElement(),onPlayerMakeAFire)

function onPlayerPlaceRoadflare (itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	local x,y,z = getElementPosition(source)
	local object = createObject(354,x,y,z-0.6)
	setTimer(destroyElement,300000,1,object)
	triggerClientEvent(source,"refreshInventoryManual",source)
end
addEvent("onPlayerPlaceRoadflare",true)
addEventHandler("onPlayerPlaceRoadflare",getRootElement(),onPlayerPlaceRoadflare)

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

--------------------------------------------------------
--Chat Systeme					 					  --
--------------------------------------------------------

local chatRadius = 15
local chatEadioRadius = 250
 
function sendMessageToNearbyPlayers( message, messageType )
cancelEvent()
    if (messageType == 0) then
		local posX, posY, posZ = getElementPosition( source )
        local chatSphere = createColSphere( posX, posY, posZ, chatRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
        for index, nearbyPlayer in ipairs( nearbyPlayers ) do
            outputChatBox(""..string.gsub((getPlayerName(source).." : "..message), '#%x%x%x%x%x%x', ''),nearbyPlayer, 211,211,211,true ) -- Color changed from 60,200,40 to 211,211,211
        end
	end	
end
addEventHandler( "onPlayerChat", getRootElement(), sendMessageToNearbyPlayers )

function playerRadioChat(playersource,cmd,...)
	if cmd == "radiochat" then
		local msg2 = table.concat({...}, " ")
		if (getElementData(playersource,"Radio") or 0) <= 0 then outputChatBox(shownInfos["noradio"],playersource) return end
        local posX, posY, posZ = getElementPosition( playersource )
        local chatSphere = createColSphere( posX, posY, posZ, chatEadioRadius )
        local nearbyPlayers = getElementsWithinColShape( chatSphere, "player" )
        destroyElement( chatSphere )
        for index, nearbyPlayer in ipairs( nearbyPlayers ) do
			if getElementData(nearbyPlayer,"Radio") > 0 then
				outputChatBox(""..string.gsub((getPlayerName(playersource).." : "..msg2), '#%x%x%x%x%x%x', ''),nearbyPlayer, 238,238,0,true ) -- Color changed from 60,200,40 to 238,238,0
			end
        end
	end
end
addCommandHandler( "radiochat", playerRadioChat )
 
function blockChatMessage(m,mt)
    if mt == 1 then
		cancelEvent()
	end
end
addEventHandler( "onPlayerChat", getRootElement(), blockChatMessage )




local infoTimer = 240000

function outputInfo1 ()
	for i, player in ipairs(getElementsByType("player")) do
		triggerClientEvent (player, "displayClientInfo", player,"Informacja","Możesz użyć leków 'środkowym przyciskiem myszy' lub '-'.",30,0,255)
	end
	setTimer(outputInfo2,infoTimer,1)
end
setTimer(outputInfo1,infoTimer,1)

function outputInfo2 ()
	for i, player in ipairs(getElementsByType("player")) do
		triggerClientEvent (player, "displayClientInfo", player,"Informacja","Zapaszamy na nasz serwer TS3! 185.49.12.243",30,0,255)
	end
	setTimer(outputInfo3,infoTimer,1)
end

function outputInfo3 ()
	for i, player in ipairs(getElementsByType("player")) do
		triggerClientEvent (player, "displayClientInfo", player,"Informacja","Admini to Pietr i BAKSTER112",30,0,255)
	end
	setTimer(outputInfo4,infoTimer,1)
end

function outputInfo4 ()
	for i, player in ipairs(getElementsByType("player")) do
		triggerClientEvent (player, "displayClientInfo", player,"Informacja","Można włączyć i wyłączyć monitor diagnostyczny, naciskając klawisz F5",30,0,255)
	end
	setTimer(outputInfo5,infoTimer,1)
end

function outputInfo5 ()
	for i, player in ipairs(getElementsByType("player")) do
		triggerClientEvent (player, "displayClientInfo", player,"Informacja","Administracja OnLine: "..getTeamMemberOnline(),255,0,0)
	end
	setTimer(outputInfo1,infoTimer,1)
end

function getTeamMemberOnline ()
	theTableMembersOnline = ""
	for i,player in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(player)
		if not isGuestAccount(account) then
			if getElementData(player,"supporter") or getElementData(player,"Admin") then
				theTableMembersOnline = theTableMembersOnline..","..getPlayerName(player)
			end
		end
	end
	if theTableMembersOnline == "" then
		return " "
	else
		return theTableMembersOnline
	end
end

--player Wildcard
function getPlayerWildcard(namePart)
	namePart = string.lower(namePart)
	
	local bestaccuracy = 0
	local foundPlayer, b, e
	for _,player in ipairs(getElementsByType("player")) do
		b,e = string.find(string.lower(string.gsub(getPlayerName(player), "#%x%x%x%x%x%x", "")), namePart)
		if b and e then
			if e-b > bestaccuracy then
				bestaccuracy = e-b
				foundPlayer = player
			end
		end
	end
	
	if (foundPlayer) then
		return foundPlayer
	else
		return false
	end
end

---------------------Set Admin/Supporter--------------------------------------------------
function setGroup (playersource,command,teamName,targetString)
	if (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(playersource)), aclGetGroup("Admin")))  then
		local foundTargetPlayer = getPlayerWildcard(targetString)
		if (foundTargetPlayer) then
			--Team Strings Rework 
			if teamName == "admin" or teamName == "supporter" or teamName == "remove" then 
				--nüx
			else
				outputChatBox ("#FFFFFFCorrect names are admin, supporter and remove!",playersource,27, 89, 224,true)	
				return
			end
			--Set Player to Teams
			if teamName == "remove" then
				value = false
				account = getPlayerAccount(foundTargetPlayer)
				setAccountData(account,"admin",value)
				setAccountData(account,"supporter",value)
				setElementData(foundTargetPlayer,"admin",value)
				setElementData(foundTargetPlayer,"supporter",value)
			else
				value = true
			end
			account = getPlayerAccount(foundTargetPlayer)
			accountname = getAccountName(account)
			setAccountData(account,teamName,value)
			setElementData(foundTargetPlayer,teamName,value)
			if value == true then
				outputChatBox ("#FFFFFF"..getPlayerName (foundTargetPlayer).." #FF0000 has been promoted to "..teamName.."!",getRootElement(),27, 89, 224,true)
			else
				outputChatBox ("#FFFFFF"..getPlayerName (foundTargetPlayer).." #FF0000 lost his status...",getRootElement(),27, 89, 224,true)
			end
		else
			outputChatBox ("#FFFFFFCan't find player! Did you input the correct name?",playersource,27, 89, 224,true)		
		end
	else
		outputChatBox ("#FFFFFFYou are not an admin!",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("add",setGroup)

function banPLayer (playersource,command,targetString,banTime,reason)
	if getAccountData(getPlayerAccount(playersource),"admin") == true  then
		local foundTargetPlayer = getPlayerWildcard(targetString)
		local banTime = banTime or 0
		local reason = reason or "Unknown"
		if (foundTargetPlayer) then
			local account = getPlayerAccount()
			local ip = getPlayerIP(foundTargetPlayer)
			local serial = getPlayerSerial(foundTargetPlayer)
			local name = getPlayerName(foundTargetPlayer)
			kickPlayer(foundTargetPlayer,playersource,reason)
			addBan (ip,name,serial,playersource,reason,banTime*86400)
			outputChatBox ("#FFFFFF"..name.." #FF0000 был забанен "..banTime.." Day(Z)'s.",getRootElement(),27, 89, 224,true)
		else
			outputChatBox ("#FFFFFFCan't find player! Did you input the correct name?",playersource,27, 89, 224,true)		
		end
	else
		outputChatBox ("#FFFFFFYou are not an admin! ",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("playerban",banPLayer)

function pmsgAdmin (playersource,command,...)
	local msg = table.concat({...}, " ")
	if getAccountData(getPlayerAccount(playersource),"admin") == true  then
		outputChatBox ("[Админ]"..getPlayerName(playersource)..": "..msg,getRootElement(),255,0,0,true)	
	else
		outputChatBox ("#FFFFFFYou are not an admin! ",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("pmsg",pmsgAdmin)

	
botSupportTable = {
--Website
{"website","what","","The URL is: www.DayZ-Polska.pl.","","James"},
{"website","where","","The URL is: www.DayZ-Polska.pl.","","James"},
{"website","which","","The URL is: www.DayZ-Polska.pl.","","James"},
{"website","how","","The URL is: www.DayZ-Polska.pl.","","James"},
{"website","got","","The URL is: www.DayZ-Polska.pl.","","James"},
{"website","know","","The URL is: www.DayZ-Polska.pl.","","James"},
--Chat
{"hey","james","","Hey.","","James"},
{"hey","paul","","Yo!.","","Paul"},
{"hey","sandra","","Hello.","","Sandra"},
{"how are","you","james","I am fine, thank you.","","James"},
{"how are","you","paul","Feeling absolutely splendid today, why, thanks!","","Paul"},
{"how are","you","sandra","I am perfectly fine.","","Sandra"},
{"i love","you","sandra","ERROR: Can't access emotions.exe.","Thanks.","Sandra"},
{"thank","you","james","You are welcome.","","James"},
{"thank","paul","you","Hey, that's my job!","","Paul"},
{"thank","sandra","you","You are welcome.","","Sandra"},
--IngameHelp (james)
{"how","use","map","Press F11 to use the map.","","James"},
{"how","use","gps","The GPS activates automatically. You can see it at the lower left corner.","","James"},
{"how","take","items","Press 'J' to open your inventory. Alternatively, you can press the middle mouse button or '-' to pick items up.","","James"},
{"how","open","inven","By pressing 'J', you can open your inventory.","","James"},
--Cyxno
{"drop","item","","Press 'J' to open your inventory, select the item you want to drop and press the arrow pointing to the left.","","Paul"},
{"fuel","car","how","You need an 'Pusty kalnister'. You can fill it at a gas station.","","Sandra"},
{"pick","items","how","Press the middle mouse button (or '-') when the name of the item is written on the left of your screen.","","Sandra"},
{"fence","wire","destroy","You need a toolbox to destroy a wirefence.","","James"},
{"register","how","to","You need to fill in your name and password. Afterwards, press 'Register'. If it doesn't work, reconnect.","","James"},
{"bugged","stuck","help","Wait until an admin contacts and helps you.","","Sandra"},
--Marwin
{"radio","chat","","Press 'Z' to use the radio device.","","James"},
}



function botCheck (text,player)
	for i, data in ipairs(botSupportTable) do
		 if string.find(text:lower(), data[1]:lower(), 1, true) and string.find(text:lower(), data[2]:lower(), 1, true) and string.find(text:lower(), data[3]:lower(), 1, true) then
			answere = data[4]
			if data[5] ~= "" then
				local randomNumber = math.random(4,5)
				answere = data[randomNumber]
			end
			setTimer(onServerSupportChatMessage,math.random(3000,6000),1,data[6],string.gsub(getPlayerName ( player ), '#%x%x%x%x%x%x', '')..", "..answere)
		end
	end	
end

function onServerSupportChatMessage (player2,text)
	notGoOn = false
	mutedmessage = false
	for i, player in ipairs(getElementsByType("player")) do
		if player2 == "Sandra" or player2 == "James" or player2 == "Paul" then
			triggerClientEvent(player,"onSupportChatMessage",player,player2,text)
			notGoOn = true
		elseif getElementData(player,"supporter") or getElementData(player,"admin") then
			if not getElementData(player2,"admin") then
				if not getElementData(player2,"supporter") then
					if not isPlayerMuted(player2) then
						outputChatBox("#E01BBCНовое сообщение от "..getPlayerName(player2),player,255,255,255,true)
					end
				end
			end
		end
		if not notGoOn then
			if not isPlayerMuted(player2) then
				triggerClientEvent(player,"onSupportChatMessage",player,player2,text)
			else
				mutedmessage = true
			end
		end	
	end	
	if not notGoOn then
		botCheck(text,player2)
	end
	if mutedmessage then
		outputChatBox("#2200ddJesteś uciszony!",player2,255,255,255,true)
	end
end
addEvent("onServerSupportChatMessage",true)
addEventHandler("onServerSupportChatMessage", getRootElement(),onServerSupportChatMessage)

--Weapon Property

setWeaponProperty ("m4","poor","maximum_clip_ammo",30)
setWeaponProperty ("m4","std","maximum_clip_ammo",30)
setWeaponProperty ("m4","pro","maximum_clip_ammo",30)

function kickPLayer (playersource,command,targetString,banTime,reason)
	if getAccountData(getPlayerAccount(playersource),"admin") == true  then
		for i,player in ipairs(getElementsByType("player")) do
			if player ~= playersource then
				kickPlayer(player,"Server Script Restart, #Hotfix")
			end
		end
	else
		outputChatBox ("#FFFFFFYou are not an admin! ",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("kickplayer",banPLayer)

function kickAll (playersource,command,reason)
	if (isObjectInACLGroup("user." ..getAccountName(getPlayerAccount(playersource)), aclGetGroup("Admin")))  then
		for i, player in ipairs(getElementsByType("player")) do
			if player == playersource then break end 
			kickPlayer(player,reason)
		end
	else
		outputChatBox ("#FFFFFFYou are not an admin!",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("kickall",kickAll)


--Supportermode
local supporterMode = {}
local foodd = {}
local thirstt = {}

function Supportermode (playersource,command)
	if getAccountData(getPlayerAccount(playersource),"supporter") == true  then
		supporterMode[playersource] = not (supporterMode[playersource] or false)
		if supporterMode[playersource] then
			setElementAlpha(playersource,0)
			setElementFrozen(playersource,true)
			foodd[playersource] = getElementData(playersource,"food")
			thirstt[playersource] = getElementData(playersource,"thirst")
		else
			setElementAlpha(playersource,255)
			setElementFrozen(playersource,false)
		end
	else
		outputChatBox ("#FFFFFFYou are not a supporter, you can't use this command!",playersource,27, 89, 224,true)		
	end
end
addCommandHandler("supportmode",Supportermode)

function StatsSupportermode ()
	for i,player in ipairs(getElementsByType("player")) do
		if supporterMode[player] then
			setElementData (player,"food",foodd[player])
			setElementData (player,"thirst",thirstt[player])
		end
	end	
end
setTimer(StatsSupportermode,60000,0)

function preventCommandSpam(commandName)
	if commandName == "login" or commandName == "logout" then
		cancelEvent()
	end
end
addEventHandler("onPlayerCommand", root, preventCommandSpam)

--Pingkick

function kickPlayerOnHighPing ()
	outputChatBox (getPlayerName(source).." został wyrzucony za duży ping!",getRootElement(),27, 89, 224,true)	
	kickPlayer(source,"Duży ping.")
end
addEvent("kickPlayerOnHighPing",true)
addEventHandler("kickPlayerOnHighPing", getRootElement(),kickPlayerOnHighPing)

local handsUp = false
local siting = false
local lying = false
function funcBindHandsup ( player, key, keyState )
	if handsUp then
		setPedAnimation (player,false)
		handsUp = false
	else
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"BEACH","ParkSit_M_loop",nil,true,false,false,false)
		handsUp = true
	end	
end

function funcBindSit ( player, key, keyState )
	if siting then
		setPedAnimation (player,false)
		siting = false
	else
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"SHOP","SHP_Rob_HandsUp",nil,true,true,false,false)
		siting = true
	end	
end

function funcBindLie ( player, key, keyState )
	if lying then
		setPedAnimation (player,false)
		lying = false
	else
		if isPedInVehicle (player) then return end
		setPedAnimation (player,"WUZI","CS_Dead_Guy",nil,true,false,false,true)
		lying = true
		function setVisibility()
			value = 0
		end
	end
end
 
function bindTheKeys ()
  bindKey(source,",","down",funcBindHandsup)
  bindKey(source,".","down",funcBindSit)
  bindKey(source,"/","down",funcBindLie)
end
addEventHandler("onPlayerLogin", getRootElement(), bindTheKeys)


function makeRadioStayOff()
    setRadioChannel(0)
    cancelEvent()
end
addEventHandler("onClientPlayerVehicleEnter",getRootElement(),makeRadioStayOff)
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),makeRadioStayOff)
