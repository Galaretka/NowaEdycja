﻿local spawnPositions = {
{-472.31646728516,-2027.1087646484,48.604362487793},
{2835.5764160156,619.0185546875,25.28318977356},
{2959.6376953125,-707.39294433594,1.7367721796036},
{-2021.0450439453,-972.63500976563,32.171875},
{3050.6965332031,-725.43695068359,1.5140626430511},
{-2421.0698242188,-608.88677978516,132.5625},
{1482.2331542969,2952.6767578125,8.1399536132813},
{2992.1428222656,-576.81604003906,2.2391223907471},
{2992.1428222656,-576.81604003906,2.2391223907471},
{-2808.5197753906,-6.8173551559448,7.03125},
{264.17779541016,2904.7980957031,7.563850402832},
{2793.876953125,-1092.8310546875,30.71875},
{2808.0227050781,-1189.2462158203,25.349853515625},
{-1705.3624267578,15.839871406555,3.5546875},
{2461.279296875,1333.3784179688,10.8203125},
{-1756.9256591797,942.41412353516,24.890625},
{1450.6628417969,-2287.0241699219,13.546875},
{-689.39819335938,935.35614013672,13.6328125},
{2676.6889648438,-1954.2388916016,13.54687},
{-2487.7866210938,-1232.1921386719,227.71823120117},
{991.31036376953,-2155.91796875,13.09375},
{-1967.3095703125,1065.5167236328,55.5703125},
{-2186.6958007813,2415.0881347656,5.15625},
{429.23767089844,-729.41046142578,24.585699081421},
{-1399.4266357422,2646.4702148438,55.6875},
{-1246.0500488281,-1292.1514892578,145.42044067383},
}

local playerDataTable = {
{"alivetime"},
{"Montion Backpack"},
{"Crash Backpack"},
{"Army Backpack"},
{"skin"},
{"MAX_Slots"},
{"bandit"},
{"blood"},
{"food"},
{"thirst"},
{"temperature"},
{"currentweapon_1"},
{"currentweapon_2"},
{"currentweapon_3"},
{"bleeding"},
{"brokenbone"},
{"pain"},
{"cold"},
{"infection"},
{"humanity"},
{"zombieskilled"},
{"headshots"},
{"murders"},
{"banditskilled"},
{"Drewno opałowe"},
{"Bandaż"},
{"Pełna manierka"},
{"Makaron"},
{"Puszka fasoli"},
{"Hamburger"},
{"Zapałki"},
{"Amunicja do M1911"},
{"Amunicja do M9 SD"},
{"Amunicja do Desert Eagle"},
{"M1911"},
{"M9 SD"},
{"Winchester 1866"},
{"PDW"},
{"Nóż"},
{"Topór"},
{"Pizza"},
{"Morfina"},
{"Puszka z napojem"},
{"Pusty kanister"},
{"Pełny kanister"},
{"Flara"},
{"Mleko"},
{"Amunicja do PDW"},
{"Amunicja do MP5A5"},



{"Spodnie: Ghillie"},
{"Spodnie: Kamuflaz-Zielony"},
{"Spodnie: Kamuflaz-Szary"},
{"Spodnie: Sport-Zielony"},
{"Spodnie: Sport-Niebieski"},
{"Spodnie: Spodnie-Czarne"},
{"Spodnie: Spodnie-Szary"},
{"Buty: Trampki-Biale"},
{"Buty: Trampki-Niebieskie"},
{"Buty: Buty"},
{"Bluza: Ghillie"},
{"Bluza: Kamuflaz-Zielony"},
{"Bluza: Shirt-Czerwony"},
{"Bluza: Shirt-Bialy"},
{"Bluza: Shirt-Zielony"},
{"Bluza: Shirt-Pomaranczowa"},
{"Bluza: Bluza-Biala"},
{"Bluza: Bluza-Niebieski"},
{"Kurtka: Garnitur"},
{"Okulary"},
{"Gas łzawiący"},
--{"Granat"},
{"Desert Eagle"},
{"Sawn-Off Shotgun"},
{"Granatnik"},
{"MP5A5"},
{"Zegarek"},
{"Apteczka"},
{"Ciepła paczka"},
{"Lee Enfield"},
{"PDW"},
{"TEC-9"},
{"7,62 mm PKM/PKS"},
{"30Rnd. AK"},
{"30Rnd. AKS"},
{"30Rnd. STANAG"},
{"SVD Mag"},
{"M107 Mag"},
{"DMR Mag"},
{"CZ550 Mag"},
{"FN Mag"},
{"AK-107 Mag"},


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
{"Pusta manierka"},
{"Pusta puszka po napoju"},
{"Pozostałości"},
{"1866 Slug"},
{"2Rnd. Slug"},
{"Amunicja do Granatnika"},
{"Radio"},
{"Lornetka"},
{"Kij bejsbolowy"},
{"Łopata"},
{"Kij golfowy"},
{"Spadochron"},
}

local vehicleDataTable = {

{"Montion Backpack"},
{"MAX_Slots"},
{"Crash Backpack"},
{"Army Backpack"},
{"Tire_inVehicle"},
{"Engine_inVehicle"},
{"Parts_inVehicle"},
{"fuel"},
{"Drewno opałowe"},
{"Bandaż"},
{"Pełna manierka"},
{"Makaron"},
{"Puszka fasoli"},
{"Hamburger"},
{"Zapałki"},
{"Amunicja do M1911"},
{"M1911"},
{"M9 SD"},
{"Amunicja do Desert Eagle"},
{"Winchester 1866"},
{"PDW"},
{"Nóż"},
{"Morfina"},
{"Topór"},
{"Pizza"},
{"Puszka z napojem"},
{"Pusty kanister"},
{"Pełny kanister"},
{"Flara"},
{"Mleko"},
{"Amunicja do PDW"},
{"Amunicja do MP5A5"},
{"Gas łzawiący"},
--{"Granat"},
{"Desert Eagle"},
{"Sawn-Off Shotgun"},
{"Granatnik"},
{"MP5A5"},
{"Zegarek"},
{"Apteczka"},
{"Ciepła paczka"},
{"Lee Enfield"},
{"TEC-9"},
{"7,62 mm PKM/PKS"},
{"30Rnd. AK"},
{"30Rnd. AKS"},
{"AK-107 Mag"},
{"FN Mag"},
{"30Rnd. STANAG"},
{"SVD Mag"},
{"M107 Mag"},
{"DMR Mag"},
{"CZ550 Mag"},


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

{"Spodnie: Ghillie"},
{"Spodnie: Kamuflaz-Zielony"},
{"Spodnie: Kamuflaz-Szary"},
{"Spodnie: Sport-Zielony"},
{"Spodnie: Sport-Niebieski"},
{"Spodnie: Spodnie-Czarne"},
{"Spodnie: Spodnie-Szary"},
{"Buty: Trampki-Biale"},
{"Buty: Trampki-Niebieskie"},
{"Buty: Buty"},
{"Bluza: Ghillie"},
{"Bluza: Kamuflaz-Zielony"},
{"Bluza: Shirt-Czerwony"},
{"Bluza: Shirt-Bialy"},
{"Bluza: Shirt-Zielony"},
{"Bluza: Shirt-Pomaranczowa"},
{"Bluza: Bluza-Biala"},
{"Bluza: Bluza-Niebieski"},
{"Kurtka: Garnitur"},
{"Okulary"},


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


function spawnDayZPlayer(player)
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z, math.random(0,360), 0, 0, 0)
	setElementFrozen(player, true)
	fadeCamera (player, true)
	triggerClientEvent(player, "sex", player)
	setCameraTarget (player, player)
	setTimer( function(player)
		if isElement(player) then
			setElementFrozen(player, false)
		end
	end,500,1,player)
	playerCol = createColSphere(x,y,z,1.5)
	setElementData(player,"playerCol",playerCol)
	attachElements ( playerCol, player, 0, 0, 0 )
	setElementData(playerCol,"parent",player)
	setElementData(playerCol,"player",true)
	local account = getPlayerAccount(player)
	setAccountData(account,"isDead",false)
	setElementData(player,"isDead",false)
	setElementData(player,"logedin",true)
	setElementData(player,"admin",getAccountData(account,"admin") or false)
	setElementData(player,"supporter",getAccountData(account,"supporter") or false)
	----------------------------------
	--Player Items on Start
	removePedClothes(player,0)
	removePedClothes(player,2)
	removePedClothes(player,3)
	
	local clothespack = math.random(1,2)
	if clothespack == 1 then
	addPedClothes (player, "tracktrgang", "tracktr", 2 )
	addPedClothes (player, "bask2heatwht", "bask1", 3 )
	addPedClothes (player, "shirtbplaid", "shirtb", 0)
	setElementData( player, "Shoes", 1)
	setElementData( player, "trousers", 3)
	setElementData( player, "Shirt", 1)
	end
	if clothespack == 2 then
	addPedClothes (player, "tracktrblue", "tracktr", 2 )
	addPedClothes (player, "bask2heatwht", "bask1", 3 )
	addPedClothes (player, "tshirtilovels", "tshirt", 0)
	setElementData( player, "Shoes", 1)
	setElementData( player, "trousers", 4)
	setElementData( player, "Shirt", 2)
	end
	for i,data in ipairs(playerDataTable) do
		if data[1] =="Bandaż" then
			setElementData(player,data[1],2)	
		elseif data[1] =="Środki przeciwbólowe" then
			setElementData(player,data[1],1)		
		elseif data[1] =="MAX_Slots" then
			setElementData(player,data[1],8)	
		elseif data[1] =="skin" then
			setElementData(player,data[1],0)
		elseif data[1] =="blood" then
			setElementData(player,data[1],12000)
		elseif data[1] =="temperature" then
			setElementData(player,data[1],37)
		elseif data[1] =="brokenbone" then
			setElementData(player,data[1],false)	
		elseif data[1] =="pain" then
			setElementData(player,data[1],false)
		elseif data[1] =="cold" then
			setElementData(player,data[1],false)
		elseif data[1] =="infection" then
			setElementData(player,data[1],false)
		elseif data[1] =="food" then
			setElementData(player,data[1],100)
		elseif data[1] =="thirst" then
			setElementData(player,data[1],100)
		elseif data[1] =="currentweapon_1" then
			setElementData(player,data[1],false)
		elseif data[1] =="currentweapon_2" then
			setElementData(player,data[1],false)	
		elseif data[1] =="currentweapon_3" then
			setElementData(player,data[1],false)	
		elseif data[1] =="bandit" then
			setElementData(player,data[1],false)	
		elseif data[1] =="humanity" then
			setElementData(player,data[1],2500)	
		else
			setElementData(player,data[1],0)
		end		
	end
	----------------------------------
end
--addEvent("onPlayerLoginToDayZ",true)
--addEventHandler("onPlayerLoginToDayZ",getRootElement(),spawnDayZPlayer)
--addEventHandler("onPlayerJoin",getRootElement(),spawnDayZPlayer)


function notifyAboutExplosion2()
	for i,player in pairs(getVehicleOccupants(source)) do
		triggerEvent("kilLDayZPlayer",player)
	end
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion2)

function destroyDeadPlayer (ped,pedCol)
	destroyElement(ped)
	destroyElement(pedCol)
end

function kilLDayZPlayer (killer,headshot,weapon)
	pedCol = false
	local account = getPlayerAccount(source)
	--if getElementData(source,"isInEvent") then removePlayerEvent(source) return end
	if not account then return end
	killPed(source)
	triggerClientEvent(source,"hideInventoryManual",source)
	if getElementData(source,"alivetime") > 10 then 
		if not isElementInWater(source) then
			local x,y,z = getElementPosition(source)
			if getDistanceBetweenPoints3D (x,y,z,6000,6000,0) > 200 then
				local x,y,z = getElementPosition(source)
				local rotX,rotY,rotZ = getElementRotation(source)
				local skin = getElementModel(source)
				local ped = createPed(skin,x,y,z,rotZ)
				pedCol = createColSphere(x,y,z,1.5)
				killPed(ped)
				setTimer(destroyDeadPlayer,3600000*0.75,1,ped,pedCol)	
				attachElements (pedCol,ped,0,0,0)
				setElementData(pedCol,"parent",ped)
				setElementData(pedCol,"playername",getPlayerName(source))
				setElementData(pedCol,"deadman",true)
				setElementData(pedCol,"MAX_Slots",getElementData(source,"MAX_Slots"))
				local time = getRealTime()
				local hours = time.hour
				local minutes = time.minute
				setElementData(pedCol,"deadreason",getPlayerName(source).." nie żyje. Przyczyna śmierci: "..(weapon or "nieznana")..". Zginął o: "..hours..":"..minutes.."")
			end	
		end
	end
	if killer then
		if not getElementData(source,"bandit") then
			addPlayerStats (killer,"humanity",math.random(-2500,-1000))
		else
			addPlayerStats (killer,"humanity",math.random(1000,2500))
		end
		setElementData(killer,"murders",getElementData(killer,"murders")+1)
		if getElementData(killer,"humanity") < 0 then
			setElementData(killer,"bandit",true)
		end
		if getElementData(source,"bandit") == true then
			setElementData(killer,"banditskilled",getElementData(killer,"banditskilled")+1)
		end
		if headshot == true then
			setElementData(killer,"headshots",getElementData(killer,"headshots")+1)
		end
	end
	--SetElementDatas
	if pedCol then
		for i,data in ipairs(playerDataTable) do
			local plusData = getElementData(source,data[1])
			if data[1] == "Amunicja do M1911" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "Amunicja do M9 SD" then
				plusData = math.floor(getElementData(source,data[1])/15)
			elseif data[1] == "Amunicja do Desert Eagle" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "Amunicja do PDW" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "Amunicja do MP5A5" then
				plusData = math.floor(getElementData(source,data[1])/20)
			elseif data[1] == "30Rnd. AK" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "30Rnd. AKS" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "AK-107 Mag" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "FN Mag" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "7,62 mm PKM/PKS" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "30Rnd. STANAG" then
				plusData = math.floor(getElementData(source,data[1])/20)
			elseif data[1] == "CZ550 Mag" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "SVD Mag" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "M107 Mag" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "DMR Mag" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "Amunicja do Lee Enfield" then
				plusData = math.floor(getElementData(source,data[1])/10)
			elseif data[1] == "1866 Slug" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "Amunicja do Granatnika" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "2Rnd. Slug" then
				plusData = math.floor(getElementData(source,data[1])/2)
			end
			setElementData(pedCol,data[1],plusData)
		end
		--Skin
		
		--Backpack
		local backpackSlots = getElementData(source,"MAX_Slots")
		if backpackSlots == 12 then
			setElementData(pedCol,"Assault Pack (ACU)",1)
		elseif backpackSlots == 16 then
			setElementData(pedCol,"Alice Pack",1)
		elseif backpackSlots == 26 then
			setElementData(pedCol,"Czech Backpack",1)
		elseif backpackSlots == 85 then
			setElementData(pedCol,"Montion Backpack",1)
		elseif backpackSlots == 69 then
			setElementData(pedCol,"Army Backpack",1)
	    elseif backpackSlots == 47 then 
            setElementData(pedCol,"Crash Backpack",1)
		elseif backpackSlots == 36 then
			setElementData(pedCol,"Coyote Backpack",1)
		end
	end
	setTimer(setElementPosition,500,1,source,6000,6000,0)
	triggerClientEvent(source,"onClientPlayerDeathInfo",source)
	setAccountData(account,"isDead",true)
	setElementData(source,"isDead",true)
	triggerClientEvent ( "onRollMessageStart", getRootElement(),"#FFFFFF"..getPlayerName(source).." #FF0000 umarł.",0,22,255, "died")
	destroyElement(getElementData(source,"playerCol"))
	setTimer(spawnDayZPlayer,5000,1,source)
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),kilLDayZPlayer)