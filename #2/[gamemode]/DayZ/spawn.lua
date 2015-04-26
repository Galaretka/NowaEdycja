function spawnDayZPlayer(player)
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer(player, x,y,z, math.random(0,360), 73, 0, 0)
	setElementFrozen(player, true)
	fadeCamera (player, true)
	setCameraTarget (player, player)
	setTimer(function(player)
		if isElement(player) then
			setElementFrozen(player, false)
		end
	end,1000,1,player)
	playerCol = createColSphere(x,y,z,1.5)
	setElementData(player,"playerCol",playerCol)
	attachElements ( playerCol, player, 0, 0, 0 )
	setElementData(playerCol,"parent",player)
	setElementData(playerCol,"player",true)
	local account = getPlayerAccount(player)
	setAccountData(account,"isDead",false)
	setElementData(player,"isDead",false)
	setElementData(player,"logedin",true)
	triggerClientEvent(player,"hideInventoryManual",player)
	triggerClientEvent(player,"disableMenu",player)
	triggerClientEvent(player, "onPlayerFlashlightOff", player)
	for i,data in ipairs(playerDataTable) do
		if data[1] =="Bandaż" then
			setElementData(player,data[1],1)	
		elseif data[1] =="Latarka" then
			setElementData(player,data[1],1)	
		elseif data[1] =="Bateria" then
			setElementData(player,data[1],1)		
		elseif data[1] =="MAX_Slots" then
			setElementData(player,data[1],6)
		elseif (data[1] =="Helmets") then
			setElementData(player,data[1],0)
		elseif (data[1] =="Glasses") then
			setElementData(player,data[1],0)
		elseif (data[1] =="Masks") then
			setElementData(player,data[1],0)
		elseif (data[1] =="Hats") then
			setElementData(player,data[1],0)
		elseif (data[1] =="Vest") then
			setElementData(player,data[1],0)
		elseif data[1] =="skin" then
			setElementData(player,data[1],73)
		elseif data[1] =="blood" then
			setElementData(player,data[1],5000)
		elseif data[1] =="temperature" then
			setElementData(player,data[1],36.6)
		elseif data[1] =="brokenbone" then
			setElementData(player,data[1],false)	
		elseif data[1] =="pain" then
			setElementData(player,data[1],false)
		elseif data[1] =="cold" then
			setElementData(player,data[1],false)
		elseif data[1] =="sepsis" then
			setElementData(player,data[1],false)
		elseif data[1] =="grippe" then
			setElementData(player,data[1],false)
		elseif data[1] =="intoxication" then
			setElementData(player,data[1],false)
		elseif data[1] =="worm" then
			setElementData(player,data[1],false)
		elseif data[1] =="inComa" then
			setElementData(player,data[1],false)
		elseif data[1] =="inHandcuffs" then
			setElementData(player,data[1],false)
		elseif data[1] =="calories" then
			setElementData(player,data[1],880)
		elseif data[1] =="liquid" then
			setElementData(player,data[1],980)
		elseif data[1] =="currentweapon_1" then
			setElementData(player,data[1],false)
		elseif data[1] =="currentweapon_2" then
			setElementData(player,data[1],false)	
		elseif data[1] =="currentweapon_3" then
			setElementData(player,data[1],false)	
		elseif data[1] =="currentweapon_4" then
			setElementData(player,data[1],false)	
		else
			setElementData(player,data[1],0)
		end		
	end
end
addEvent("spawnDayZPlayer",true)
addEventHandler("spawnDayZPlayer",getRootElement(),spawnDayZPlayer)

function checkBuggedAccount()
	for i,player in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(player)
		if not account then return end
		if getElementData(player,"logedin") then
			if getElementModel(player) == 0 then
				spawnDayZPlayer(player)
				outputChatBox(getPlayerName(player).." jest zbugowany.",getRootElement(),22,255,22,true)
			end
		end
	end	
end
setTimer(checkBuggedAccount,90000,0)

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

function kilLDayZPlayer(killer,weapon)
	pedCol = false
	if not getPlayerAccount(source) then return end
	killPed(source)
	setElementData(source,"inComa",false)
	triggerClientEvent(source,"hideInventoryManual",source)
	triggerClientEvent(source,"disableMenu",source)
	if not isElementInWater(source) then
		local x,y,z = getElementPosition(source)
		if getDistanceBetweenPoints3D (x,y,z,6000,6000,0) > 100 then
			local x,y,z = getElementPosition(source)
			local skin = getElementModel(source)
			local ped = createPed(skin,x,y,z,rotZ)
			pedCol = createColSphere(x,y,z,1.5)
			setPedAnimation(ped,"ped","KO_shot_face",false,false,false,false)
			killPed(ped)
			attachElements (pedCol,ped,0,0,0)
			setElementData(pedCol,"parent",ped)
			setElementData(pedCol,"playername",getPlayerName(source))
			setElementData(pedCol,"deadman",true)
			setElementData(pedCol,"hidebody",true)
			setElementData(pedCol,"MAX_Slots",getElementData(source,"MAX_Slots"))
			setElementData(pedCol,"Helmets",getElementData(source,"Helmets"))
			setElementData(pedCol,"Glasses",getElementData(source,"Glasses"))
			setElementData(pedCol,"Masks",getElementData(source,"Masks"))
			setElementData(pedCol,"Hats",getElementData(source,"Hats"))
			setElementData(pedCol,"Vest",getElementData(source,"Vest"))
			setTimer(destroyDeadPlayer,3600000*0.75,1,ped,pedCol)
			local time = getRealTime()
			local hours = time.hour
			local minutes = time.minute
			setElementData(pedCol,"deadreason",getPlayerName(source).." jest martwy. Przyczyna śmierci: "..(weapon or "nieznana")..". Czas zgonu: "..hours..":"..minutes..".")
		end	
	end
	if pedCol then
		for i,data in ipairs(playerDataTable) do
			local plusData = getElementData(source,data[1])
			if data[1] == ".45ACP" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "9mm" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == ".357" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "PDW Mag" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "7.62x39mm" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "5.56mm" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "CZ550 Mag" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "7.62x51mm" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "12 Gauge Buckshot" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == ".22" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "Strzała" then
				plusData = math.floor(getElementData(source,data[1])/1)
			end
			setElementData(pedCol,data[1],plusData)
		end
--		local skinID = getElementData(source,"skin")
--		local skin = getSkinNameFromID(skinID)
--		setElementData(pedCol,skin,1)
		-- @Plecakи
		local backpackSlots = getElementData(source,"MAX_Slots")
		if (backpackSlots == 12 or backpackSlots == 16) then
			setElementData(pedCol,"Torba dziecięca",1)
		elseif (backpackSlots == 13 or backpackSlots == 17) then
			setElementData(pedCol,"Torba domowa",1)
		elseif (backpackSlots == 20 or backpackSlots == 24) then
			setElementData(pedCol,"Plecak domowej roboty",1)
		elseif (backpackSlots == 25 or backpackSlots == 29) then
			setElementData(pedCol,"Plecak",1)
		elseif (backpackSlots == 30 or backpackSlots == 34) then
			setElementData(pedCol,"Plecak na polowanie",1)
		elseif (backpackSlots == 35 or backpackSlots == 39) then
			setElementData(pedCol,"Plecak górski",1)
		end
		local glassID = getElementData(source,"Glasses")
		if (glassID == 10) then
			setElementData(pedCol,"Ракетные Авиаторы",1)
		end
		local helmID = getElementData(source,"Helmets")
		if (helmID == 10) then
			setElementData(pedCol,"Kask motocyklowy",1)
		end
		local maskID = getElementData(source,"Masks")
		if (maskID == 1) then
			setElementData(pedCol,"Respirator",1)
		elseif (maskID == 2) then
			setElementData(pedCol,"Maska gazowa",1)
		elseif (maskID == 3) then
			setElementData(pedCol,"Maska 'Hoxton'",1)
		elseif (maskID == 4) then
			setElementData(pedCol,"Maska 'Dallas'",1)
		elseif (maskID == 5) then
			setElementData(pedCol,"Maska 'Wilk'",1)
		end
		local hatsID = getElementData(source,"Hats")
		if (hatsID == 1) then
			setElementData(pedCol,"Nauszniki",1)
		elseif (hatsID == 2) then
			setElementData(pedCol,"Kowbojski kapelusz",1)
		elseif (hatsID == 3) then
			setElementData(pedCol,"Czapka",1)
		elseif (hatsID == 4) then
			setElementData(pedCol,"Okrągła czapka",1)
		elseif (hatsID == 5) then
			setElementData(pedCol,"Beret",1)
		elseif (hatsID == 6) then
			setElementData(pedCol,"Beret wojskowy",1)
		elseif (hatsID == 7) then
			setElementData(pedCol,"Panama",1)
		elseif (hatsID == 8) then
			setElementData(pedCol,"Hełm wojskowy",1)
		end
		local vestID = getElementData(source,"Vest")
		if (vestID == 1) then
			setElementData(pedCol,"Kamizelka taktyczna",1)
		end
	end
	setTimer(setElementPosition,100,1,source,6000,6000,0)
	--triggerClientEvent(source,"onClientPlayerDeathInfo",source)
	triggerClientEvent(source, "onPlayerFlashlightOff", source)
	setAccountData(account,"isDead",true)
	setElementData(source,"isDead",true)
	triggerClientEvent("onRollMessageStart", getRootElement(),"#FFFFFF"..getPlayerName(source).." #FF0000umarł!",0,22,255, "died")
	if isElement(getElementData(source,"playerCol")) then
		destroyElement(getElementData(source,"playerCol"))
	end
	setTimer(spawnDayZPlayer,7000,1,source)
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),kilLDayZPlayer)

function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
end

function math.percentChance (percent,repeatTime)
	local hits = 0
	for i = 1, repeatTime do
	local number = math.random(0,200)/2
		if number <= percent then
			hits = hits+1
		end
	end
	return hits
end

function getPointFromDistanceRotation(x, y, dist, angle)
    local a = math.rad(90 - angle)
    local dx = math.cos(a) * dist
    local dy = math.sin(a) * dist
    return x+dx, y+dy
end

skinTable = {
	{"standart0",73},
	{"firtsperson",75},
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
end

function addPlayerSkin(skin)
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