﻿local spawnPositions = {
{3039.6999511719,-263.60000610352,1},
{2488.8999023438,658.79998779297,10.5},
{-2023.3000488281,-971.5,31.799999237061},
}

local playerDataTable = {
{"trousers"},
{"Shirt"},
{"Shoes"},
{"head"},
{"hats"},
{"glases"},
{"alivetime"},
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
{"Radio"},
{"Kij bejsbolowy"},
{"Łopata"},
{"Kij golfowy"},
{"Radio"},
{"Spadochron"},
{"Alice Pack"},
{"Czech Backpack"},
{"Coyote Backpack"},
{"Crash Backpack"},
{"Army Backpack"},
{"Montion Backpack"},
}


function playerLogin(username, pass, player)
local playerID = getAccountData(getPlayerAccount(player),"playerID")
account = getPlayerAccount(player)
local x,y,z = getAccountData(account,"last_x"),getAccountData(account,"last_y"),getAccountData(account,"last_z")
--local skin = getAccountData(account,"skin")
createZombieTable (player)
if getAccountData(account,"isDead") then
spawnDayZPlayer(player)
return
end
spawnPlayer (player, x,y,z+0.5, math.random(0,360), 0, 0, 0)
removePedClothes(player,0)
removePedClothes(player,2)
removePedClothes(player,3)
setElementFrozen(player, true)
fadeCamera (player, true)
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
for i,data in ipairs(playerDataTable) do
local elementData = getAccountData(account,data[1])
if not elementData then
if data[1] == "brokenbone" or data[1] == "pain" or data[1] == "cold" or data[1] == "infection" or data[1] == "currentweapon_1" or data[1] == "currentweapon_2" or data[1] == "currentweapon_3" or data[1] == "bandit" then
elementData = elementData
else
elementData = 0
end
end
setElementData(player,data[1],elementData)
end
setElementData(player,"logedin",true)
-- 
local trousers = getElementData(player, "trousers")
local shoes = getElementData(player, "Shoes")
local Shirt = getElementData(player, "Shirt")
local glass = getElementData(player, "glases")
if trousers == 1 then
addPedClothes ( player, "worktrcamogrn", "worktr", 2 )
end
if trousers == 2 then
addPedClothes ( player, "worktrcamogry", "worktr", 2 )
end
if trousers == 3 then
addPedClothes ( player, "tracktrgang", "tracktr", 2 )
end
if trousers == 4 then
addPedClothes ( player, "tracktrblue", "tracktr", 2 )
end
if trousers == 5 then
addPedClothes ( player, "suit1trblk", "suit1tr", 2 )
end
if trousers == 6 then
addPedClothes ( player, "chongergrey", "chonger", 2 )
end
if trousers == 7 then
addPedClothes ( player, "worktrgrey", "worktr", 2 )
end
--Shoes
if shoes == 1 then
addPedClothes ( player, "bask2heatwht", "bask1", 3 )
end
if shoes == 2 then
addPedClothes ( player, "convproblu", "conv", 3 )
end
if shoes == 3 then
addPedClothes ( player, "shoedressblk", "shoe", 3 )
end
--Shirt
if Shirt == 1 then
addPedClothes ( player, "shirtbplaid", "shirtb", 0 )
end
if Shirt == 2 then
addPedClothes ( player, "tshirtilovels", "tshirt", 0 )
end
if Shirt == 3 then
addPedClothes ( player, "tshirterisyell", "tshirt", 0 )
end
if Shirt == 4 then
addPedClothes ( player, "tshirterisorn", "tshirt", 0 )
end
if Shirt == 5 then
addPedClothes ( player, "hoodyarockstar", "hoodya", 0 )
end
if Shirt == 6 then
addPedClothes ( player, "hoodyAblue", "hoodyA", 0 )
end
if Shirt == 7 then
addPedClothes ( player, "tuxedo", "suit2", 0 )
end
if Shirt == 8 then
addPedClothes ( player, "tshirtwhite", "tshirt", 0 )
end
if Shirt == 9 then
addPedClothes ( player, "denimfade", "denim", 0 )
end
--glass
if glass == 1 then
addPedClothes ( player, "glasses04dark", "glasses04", 15 )
end
if glass == 2 then
addPedClothes ( player, "hockey", "hockeymask", 16 )
end
--Weapons
--Old Weapons
local weapon = getElementData(player,"currentweapon_1")
if weapon then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(player,weapID,getElementData(player,ammoData), true )
end
local weapon = getElementData(player,"currentweapon_2")
if weapon then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(player,weapID,getElementData(player,ammoData), false )
end
local weapon = getElementData(player,"currentweapon_3")
if weapon then
local ammoData,weapID = getWeaponAmmoType (weapon)
giveWeapon(player,weapID,getElementData(player,ammoData), false )
end
setElementModel(player, getElementData(player,"skin"))

setElementData(player,"admin",getAccountData(account,"admin") or false)
setElementData(player,"supporter",getAccountData(account,"supporter") or false)
triggerClientEvent(player, "onClientPlayerDayZLogin", player)

end
addEvent("onPlayerDayZLogin", true)
addEventHandler("onPlayerDayZLogin", getRootElement(), playerLogin)


function playerRegister(username, pass, player)
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z, math.random(0,360), 0, 0, 0)

	fadeCamera (player, true)
	setCameraTarget (player, player)
	playerCol = createColSphere(x,y,z,1.5)
	attachElements ( playerCol, player, 0, 0, 0 )
	setElementData(playerCol,"parent",player)
	setElementData(playerCol,"player",true)
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
	account = getAccount(username)
	local value = getAccounts()
	local value = #value
	setElementData(player,"playerID",value+1)
	setAccountData(account,"playerID",value+1)
	setElementData(player,"logedin",true)
	createZombieTable (player)
end
addEvent("onPlayerDayZRegister", true)
addEventHandler("onPlayerDayZRegister", getRootElement(), playerRegister)

function saveAccounts () -- Save in the database
	local account = getPlayerAccount(source)
	if account then
	for i,data in ipairs(playerDataTable) do
		setAccountData(account,data[1],getElementData(source,data[1]))
	end
		local x,y,z =  getElementPosition(source)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		destroyElement(getElementData(source,"playerCol"))
	end	
	setElementData(source,"logedin",false)
end
addEventHandler ( "onPlayerQuit", getRootElement(), saveAccounts )

function saveAccounts2 () -- Save in the database
for i, player in ipairs(getElementsByType("player")) do
	local account = getPlayerAccount(player)
	if account then
	for i,data in ipairs(playerDataTable) do
		setAccountData(account,data[1],getElementData(player,data[1]))
	end
		local x,y,z =  getElementPosition(player)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
	end	
	--setElementData(player,"logedin",false)
end	
end
addEventHandler ( "onResourceStop", getRootElement(), saveAccounts2 )

--------------------------------------------------------------------------------------------------------------
--------------------------------------------------------------------------------------------------------------
local vehicleDataTable = {
{"Montion Backpack"},
{"Army Backpack"},
{"Crash Backpack"},
{"MAX_Slots"},
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

{"7,62 mm PKM/PKS"},
{"30Rnd. AK"},
{"30Rnd. STANAG"},
{"SVD Mag"},
{"M107 Mag"},
{"DMR Mag"},
{"CZ550 Mag"},

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
{"Gas łzawiący"},
--{"Granat"},
{"Desert Eagle"},
{"Sawn-Off Shotgun"},
{"Wyrzutnia"},
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
{"Amunicja do CZ550"},
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
{"Czech Backpack"},
{"Coyote Backpack"},
{"Army Backpack"},
{"Radio"},
{"Kij bejsbolowy"},
{"Łopata"},
{"Kij golfowy"},
{"Spadochron"},
}

--local vehicleManager = getAccount("vehicleManager","ds4f9$")
	--if not vehicleManager then
	--addAccount("vehicleManager","ds4f9$")
	--end

function saveallvehicles(ps,command)
	counter = 0
	counterTent = 0
	--delete Accounts 
	local vehicleManager = getAccount("vehicleManager","ds4f9$")
	--for i = 1, (getAccountData(vehicleManager,"vehicleamount") or 0) do
		--local account = getAccount("vehicle_number_"..i,"ds4f9$")
		--if not account then break end
		--removeAccount (account)
	--end
	--new Accounts + set
	for i, col in ipairs (getElementsByType("colshape")) do
		local veh = getElementData(col,"vehicle")
		local helicrash = getElementData(col,"helicrash")
		local hospitalbox = getElementData(col,"hospitalbox")
		local tent = getElementData(col,"tent")
		if veh and not helicrash or veh and not hospitalbox then
			if tent then
				counterTent = counterTent +1
				account = getAccount("tent_number_"..counterTent,"ds4f9$") or false
				if not account then
					account = addAccount("tent_number_"..counterTent,"ds4f9$")
				end	
				local tent = getElementData(col,"parent")
				local x,y,z = getElementPosition(tent)
				local rx,ry,rz = getElementRotation(tent)
				setAccountData(account,"last_x",x)
				setAccountData(account,"last_y",y)
				setAccountData(account,"last_z",z)
				setAccountData(account,"last_rx",rx)
				setAccountData(account,"last_ry",ry)
				setAccountData(account,"last_rz",rz)
				for i, data in ipairs(vehicleDataTable) do 
					setAccountData(account,data[1],getElementData(col,data[1]))
				end
			else 
				counter = counter +1
				account = getAccount("vehicle_number_"..counter,"ds4f9$") or false
				if not account then
					account = addAccount("vehicle_number_"..counter,"ds4f9$")
				end	
				setAccountData(account,"spawn_x",getElementData(col,"spawn")[2])
				setAccountData(account,"spawn_y",getElementData(col,"spawn")[3])
				setAccountData(account,"spawn_z",getElementData(col,"spawn")[4])
				for i, data in ipairs(vehicleDataTable) do 
					setAccountData(account,data[1],getElementData(col,data[1]))
				end
				local vehicle = getElementData(col,"parent")
				local model = getElementModel(vehicle)
				local x,y,z = getElementPosition(vehicle)
				local rx,ry,rz = getElementRotation(vehicle)
				local health = getElementHealth(vehicle)
				setAccountData(account,"last_x",x)
				setAccountData(account,"last_y",y)
				setAccountData(account,"last_z",z)
				setAccountData(account,"last_rx",rx)
				setAccountData(account,"last_ry",ry)
				setAccountData(account,"last_rz",rz)
				setAccountData(account,"health",health)
				setAccountData(account,"model",model)
				setAccountData(account,"isExploded",getElementData(vehicle,"isExploded") or false)
			end
		end
		setAccountData(vehicleManager,"vehicleamount",counter)
		setAccountData(vehicleManager,"tentamount",counterTent)
	end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), saveallvehicles)

function doBackup ()
	outputChatBox ("Trwa robienie kopii zapasowej serwera. MOŻLIWY LAG",getRootElement(),27, 89, 224,true)
	saveallvehicles()
	outputChatBox ("Gotowe!",getRootElement(),27, 89, 224,true)
end
function doBackup2(ps)
    if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(ps)), aclGetGroup ( "Admin" ) ) then
		outputChatBox ("Trwa robienie kopii zapasowej serwera! MOŻLIWY LAG!",getRootElement(),27, 89, 224,true)
		saveallvehicles()
		outputChatBox("Gotowe!", getRootElement(), 27, 89, 224, true)
	end
end
addCommandHandler("backup",doBackup2)
function checkDoBackup ()
	if gameplayVariables["backupenabled"] then
		setTimer(doBackup,gameplayVariables["backupinterval"],0)
	end
end
checkDoBackup()

function killplayer2(ps)
	setElementData(ps, "blood", -2000)
end
addCommandHandler("kill",killplayer2)

function createVehicleOnServerStart()
	local vehicleManager = getAccount("vehicleManager","ds4f9$")
	for i = 1, (getAccountData(vehicleManager,"vehicleamount") or 0) do
		wastedVehicle = false
		vehicle = getAccount("vehicle_number_"..i,"ds4f9$")
		if not vehicle then break end
		if getAccountData(vehicle,"isExploded") == true then
			setAccountData(vehicle,"health",1000)
			wastedVehicle = true
		end
		local veh = createVehicle(getAccountData(vehicle,"model"),getAccountData(vehicle,"last_x"),getAccountData(vehicle,"last_y"),getAccountData(vehicle,"last_z"),getAccountData(vehicle,"last_rx"),getAccountData(vehicle,"last_ry"),getAccountData(vehicle,"last_rz"))
		vehCol = createColSphere(getAccountData(vehicle,"last_x"),getAccountData(vehicle,"last_y"),getAccountData(vehicle,"last_z"),4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",getAccountData(vehicle,"MAX_Slots"))
		setElementHealth(veh,getAccountData(vehicle,"health"))
		--vehicle_indentifikation
		xxx,yyy,zzz = getAccountData(vehicle,"spawn_x"),getAccountData(vehicle,"spawn_y"),getAccountData(vehicle,"spawn_z")
		setElementData(vehCol,"spawn",{getAccountData(vehicle,"model"),xxx,yyy,zzz})
		if wastedVehicle then
			if getAccountData(vehicle,"model") == 497 then
				item_id = math.random(table.size(hunterSpawns))
				xxx,yyy,zzz = hunterSpawns[item_id][1],hunterSpawns[item_id][2],hunterSpawns[item_id][3]
			end
			if getAccountData(vehicle,"model") == 487 then
				local item_id = math.random(table.size(maverikSpawns))
				x,y,z = maverikSpawns[item_id][1],maverikSpawns[item_id][2],maverikSpawns[item_id][3]
			end
			setElementPosition(veh,xxx,yyy,zzz+1)
			setElementRotation(veh,0,0,0)
			--Engine + Tires + Бензобак
			local tires,engine,parts = getVehicleAddonInfos (getElementModel(veh))
			setElementData(vehCol,"Tire_inVehicle",math.random(0,tires))
			setElementData(vehCol,"Engine_inVehicle",math.random(0,engine))
			setElementData(vehCol,"Parts_inVehicle",math.random(0,parts))
		end
		--others
		setElementData(vehCol,"fuel",getAccountData(vehicle,"fuel"))
		if not wastedVehicle then
			for i, data in ipairs(vehicleDataTable) do 
				setElementData(vehCol,data[1],getAccountData(vehicle,data[1]))
			end
		else
			if getElementModel(veh) == 433 or getElementModel(veh) == 470 then
				for i,items in ipairs(lootItems["helicrashsides"]) do
					local randomNumber = math.random(1,10)
					if randomNumber == 5 then
						setElementData(vehCol,items[1],math.random(1,2))
					end
				end
			end	
			setElementData(vehCol,"fuel",10)
		end
	end
	for i = 1, (getAccountData(vehicleManager,"tentamount") or 0) do
		tentData = getAccount("tent_number_"..i,"ds4f9$")
		if not tentData then break end
		tent = createObject(3243,getAccountData(tentData,"last_x"),getAccountData(tentData,"last_y"),getAccountData(tentData,"last_z"),0,0,(getAccountData(tentData,"last_rz") or 0))
		setObjectScale(tent,1.3)
		tentCol = createColSphere(getAccountData(tentData,"last_x"),getAccountData(tentData,"last_y"),getAccountData(tentData,"last_z"),4)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent)
		setElementData(tent,"parent",tentCol)
		setElementData(tentCol,"tent",true)
		setElementData(tentCol,"vehicle",true)
		setElementData(tentCol,"MAX_Slots",100)
		for i, data in ipairs(vehicleDataTable) do 
			setElementData(tentCol,data[1],getAccountData(tentData,data[1]))
		end
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), createVehicleOnServerStart)

