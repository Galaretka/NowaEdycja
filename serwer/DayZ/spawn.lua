local spawnPositions = {
{3039.6999511719,-263.60000610352,1},
{2488.8999023438,658.79998779297,10.5},
{-2023.3000488281,-971.5,31.799999237061},
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
{"Дрова"},
{"Бинт"},
{"Фляга"},
{"Банка макарон"},
{"Банка бобов"},
{"Гамбургер"},
{"Спички"},
{"M1911 Mag"},
{"M9 SD Mag"},
{"Пустынный орёл Маг"},
{"M1911"},
{"M9 SD"},
{"Винчестер 1866"},
{"PDW"},
{"Охотничий нож"},
{"Топор"},
{"Пицца"},
{"Морфий"},
{"Банка соды"},
{"Пустая канистра"},
{"Наполненная канистра"},
{"Фаер"},
{"Молоко"},
{"PDW Mag"},
{"MP5A5 Mag"},
{"AK Маг"},
{"M4 Маг"},
{"Tear Gas"},
{"Оск. граната M67"},
{"Пустынный орёл"},
{"Sawn-Off Shotgun"},
{"Гранатомёт"},
{"MP5A5"},
{"Часы"},
{"Аптечка"},
{"Грелка"},
{"Lee Enfield"},
{"PDW"},
{"TEC-9"},
{"AK-47"},
{"M136 Rocket Launcher"},
{"Пакет крови"},
{"GPS"},
{"Карта"},
{"Инструменты"},
{"Колючая проволока"},
{"Tire"},
{"Engine"},
{"Бензобак"},
{"M136 Rocket"},
{"Снайперская винтовка Mag"},
{"Lee Enfield Mag"},
{"M4"},
{"Снайперская винтовка"},
{"Heat-Seeking RPG"},
{"Satchel"},
{"Инфокрасные очки"},
{"Очки ночного видения"},
{"Палатка"},
{"Жареное мясо"},
{"Сырое мясо"},
{"Одежда Армейца"},
{"Одежда снайпера"},
{"Одежда Бандита"},
{"Одежда выжившего"},
{"Болеутоляющие"},
{"Пустая фляга"},
{"Пустая банка соды"},
{"Объедки"},
{"1866 Slug"},
{"2Rnd. Slug"},
{"Гранотомёт Маг"},
{"Рация"},
{"Бинокль"},
{"Бейсбольная бита"},
{"Лопата"},
{"Клюшка для гольфа"},
{"Парашют"},
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
{"Дрова"},
{"Бинт"},
{"Фляга"},
{"Банка макарон"},
{"Банка бобов"},
{"Гамбургер"},
{"Спички"},
{"M1911 Mag"},
{"M1911"},
{"M9 SD"},
{"Пустынный орёл Маг"},
{"Винчестер 1866"},
{"PDW"},
{"Охотничий нож"},
{"Морфий"},
{"Топор"},
{"Пицца"},
{"Банка соды"},
{"Пустая канистра"},
{"Наполненная канистра"},
{"Фаер"},
{"Молоко"},
{"PDW Mag"},
{"MP5A5 Mag"},
{"AK Маг"},
{"M4 Маг"},
{"Tear Gas"},
{"Оск. граната M67"},
{"Пустынный орёл"},
{"Sawn-Off Shotgun"},
{"Гранатомёт"},
{"MP5A5"},
{"Часы"},
{"Аптечка"},
{"Грелка"},
{"Lee Enfield"},
{"TEC-9"},
{"AK-47"},
{"M136 Rocket Launcher"},
{"Пакет крови"},
{"GPS"},
{"Карта"},
{"Инструменты"},
{"Колючая проволока"},
{"Tire"},
{"Engine"},
{"Бензобак"},
{"M136 Rocket"},
{"Снайперская винтовка Mag"},
{"Lee Enfield Mag"},
{"M4"},
{"Снайперская винтовка"},
{"Heat-Seeking RPG"},
{"Satchel"},
{"Инфокрасные очки"},
{"Очки ночного видения"},
{"Палатка"},
{"Жареное мясо"},
{"Сырое мясо"},
{"Одежда Армейца"},
{"Одежда снайпера"},
{"Одежда Бандита"},
{"Одежда выжившего"},
{"Болеутоляющие"},
{"Бинокль"},
{"Пустая фляга"},
{"Пустая банка соды"},
{"Объедки"},
{"1866 Slug"},
{"2Rnd. Slug"},
{"Гранотомёт Маг"},
{"Assault Pack (ACU)"},
{"Alice Pack"},
{"Рация"},
{"Coyote Backpack"},
{"Czech Backpack"},
{"Бейсбольная бита"},
{"Лопата"},
{"Клюшка для гольфа"},
}


function spawnDayZPlayer(player)
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z, math.random(0,360), 73, 0, 0)
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
	for i,data in ipairs(playerDataTable) do
		if data[1] =="Бинт" then
			setElementData(player,data[1],2)	
		elseif data[1] =="Болеутоляющие" then
			setElementData(player,data[1],1)		
		elseif data[1] =="MAX_Slots" then
			setElementData(player,data[1],8)	
		elseif data[1] =="skin" then
			setElementData(player,data[1],73)
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

function checkBuggedAccount()
	for i,player in ipairs(getElementsByType("player")) do
		local account = getPlayerAccount(player)
		if not account then return end
		if getElementData(player,"logedin") then
			if getElementModel(player) == 0 then
				spawnDayZPlayer(player)
				outputChatBox(getPlayerName(player).."s Аккаунт был сброшен.",getRootElement(),22,255,22,true)
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
				setElementData(pedCol,"deadreason",getPlayerName(source).." он мёртв. Причина смерти: "..(weapon or "Неизвестно")..". Время смерти: "..hours..":"..minutes.." часов.")
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
			if data[1] == "M1911 Mag" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "M9 SD Mag" then
				plusData = math.floor(getElementData(source,data[1])/15)
			elseif data[1] == "Пустынный орёл Маг" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "PDW Mag" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "MP5A5 Mag" then
				plusData = math.floor(getElementData(source,data[1])/20)
			elseif data[1] == "AK Маг" then
				plusData = math.floor(getElementData(source,data[1])/30)
			elseif data[1] == "M4 Маг" then
				plusData = math.floor(getElementData(source,data[1])/20)
			elseif data[1] == "Снайперская винтовка Mag" then
				plusData = math.floor(getElementData(source,data[1])/5)
			elseif data[1] == "Lee Enfield Mag" then
				plusData = math.floor(getElementData(source,data[1])/10)
			elseif data[1] == "1866 Slug" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "Гранотомёт Маг" then
				plusData = math.floor(getElementData(source,data[1])/7)
			elseif data[1] == "2Rnd. Slug" then
				plusData = math.floor(getElementData(source,data[1])/2)
			end
			setElementData(pedCol,data[1],plusData)
		end
		--Skin
		local skinID = getElementData(source,"skin")
		local skin = getSkinNameFromID(skinID)
		setElementData(pedCol,skin,1)
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
	triggerClientEvent ( "onRollMessageStart", getRootElement(),"#FFFFFF"..getPlayerName(source).." #FF0000был убит",0,22,255, "died")
	destroyElement(getElementData(source,"playerCol"))
	setTimer(spawnDayZPlayer,5000,1,source)
end
addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),kilLDayZPlayer)