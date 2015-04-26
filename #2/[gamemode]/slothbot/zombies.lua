ZombiePedSkins = {22,56,67,68,69,70,92,97,105,107,108,126,127,128,152,162,--[[167,]]188,195,206,--[[209,212,229,230,258,264,277,280]]}

setElementData(getRootElement(),"zombiestotal",0)
setElementData(getRootElement(),"zombiesalive",0)
createTeam("Зомби")

itemTableZombies = {
--Одежда
	{"Plecak",1252,1,0,1.3},
--Огнестрельное оружие
	{"FNX45",346,1,90,0.4},
	{"CR75",347,1,90,0.4},
	{"PDW",352,1,90,0.3},
	{"Magnum",348,1,90,0.3},
--Холодное оружие
	{"Nóż myśliwski",335,1,90,7},
	{"Topór",339,1,90,7},
	{"Монтировка",333,1,90,0.5},
	{"Kij bejsbolowy z gwoździami",336,1,90,0.5},
	{"Łopata",337,1,90,0.5},
--Еда и вода
	{"Coca-cola",2647,1,0,7},
	{"Pepsi",2856,1,0,5},
	{"Tuńczyk",1582,1,0,7},
	{"Zamknięta puszka makaronu",2770,0.1,0,5},
	{"Zamknięta puszka fasoli",2601,1,0,5},
	{"Zamknięta puszka sardynek",2768,1,0,2},
--Медикаменты
	{"Środek przeciwbólowy",2709,0.5,0,7},
--Другое
	{"Zapałki",328,0.4,90,5},
	{"Flara",324,1,90,9},
	{"Pusta puszka",2673,1.8,0,6},
	{"Pusta puszka po napoju",2675,1.3,0,6},
	{"Zegarek",2710,1,0,3},
	{"Ciepła paczka",1576,1,0,6},
	{"Drut kolczasty",933,0.25,0,1},
	{"Morfina",1579,1,0,2},
	{"Mapa",1277,0.8,90,4},
	{"GPS",2976,0.15,0,1},
	{"Radio",2966,0.5,0,3},
}

function createZomieForPlayer (x,y,z)
	x,y,z = getElementPosition(source)
	counter = 0
	if getElementData(source,"lastzombiespawnposition") then
		local xL,yL,zL = getElementData(source,"lastzombiespawnposition")[1] or false,getElementData(source,"lastzombiespawnposition")[2] or false,getElementData(source,"lastzombiespawnposition")[3] or false
		if xL and getDistanceBetweenPoints3D (x,y,z,xL,yL,zL) < 60 then return end
	end	
	if getElementData(source,"spawnedzombies")+3 <= 5 then
		for i = 1, 4 do
			counter = counter+1
			local number1 = math.random(-50,50)
			local number2 = math.random(-50,50)
			if number1 < 18 and number1 > -18 then
				number1 = 20
			end
			if number2 < 18 and number2 > -18 then
				number2 = -20
			end
			zombie = exports.slothbot:spawnBot(x+number1,y+number2,z,math.random(0,360),ZombiePedSkins[math.random(1, #ZombiePedSkins)],0,0,getTeamFromName("Зомби"))
			setElementData(zombie,"zombie",true)
			setElementData(zombie,"blood",2500)
			setElementData(zombie,"owner",source)
			exports.slothbot:setBotGuard(zombie, x+number1,y+number2,z, false)
			setPedAnimation(zombie, "ped", "WALK_drunk")
		end
		setElementData(source,"lastzombiespawnposition",{x,y,z})
		setElementData(source,"spawnedzombies",getElementData(source,"spawnedzombies")+3)
	end
end
addEvent("createZomieForPlayer",true)
addEventHandler("createZomieForPlayer",getRootElement(),createZomieForPlayer)

function zombieCheck1 ()
	for i,ped in ipairs(getElementsByType("ped")) do
		if getElementData(ped,"zombie") then 
			goReturn = false
			local zombieCreator = getElementData(ped,"owner")
			if not isElement(zombieCreator) then 
				setElementData ( ped, "status", "dead" )	
				setElementData ( ped, "target", nil )
				setElementData ( ped, "leader", nil )
				destroyElement(ped)
				goReturn = true
			end
			if not goReturn then
				local xZ,yZ,zZ = getElementPosition(getElementData(ped,"owner"))
				local x,y,z = getElementPosition(ped)
				if getDistanceBetweenPoints3D (x,y,z,xZ,yZ,zZ) > 60 then
					if getElementData(zombieCreator,"spawnedzombies")-1 >= 0 then
						setElementData(zombieCreator,"spawnedzombies",getElementData(zombieCreator,"spawnedzombies")-1)
					end	
					setElementData ( ped, "status", "dead" )	
					setElementData ( ped, "target", nil )
					setElementData ( ped, "leader", nil )
					destroyElement(ped)
				end
			end
		end				
	end		
end
setTimer(zombieCheck1,20000,0)


function botAttack (ped)
	exports.slothbot:setBotFollow(ped, source)
end
addEvent("botAttack",true)
addEventHandler("botAttack",getRootElement(),botAttack)

function botStopFollow (ped)
	local x,y,z = getElementPositon(ped)
	exports.slothbot:setBotGuard(ped, x, y, z, false)
end
addEvent("botStopFollow",true)
addEventHandler("botStopFollow",getRootElement(),botStopFollow)

function outputChange(dataName,oldValue)
	if getElementType(source) == "player" then
		if dataName == "spawnedzombies" then
			local newValue = getElementData(source,dataName)
			outputChatBox(oldValue.." to "..newValue)
		end
	end
end

function destroyTable ()
	for i,ped in ipairs(getElementsByType("ped")) do
		if getElementData(ped,"zombie") then 
			if getElementData(ped,"owner") == source then
				setElementData(getElementData(ped,"owner"),"spawnedzombies",getElementData(getElementData(ped,"owner"),"spawnedzombies")-1)
				setElementData ( ped, "status", "dead" )
				setElementData ( ped, "target", nil )
				setElementData ( ped, "leader", nil )
				if isElement(ped) then
					destroyElement(ped)
				end
			end
		end				
	end
end

function destroyDeadZombie (ped,pedCol)
	if isElement(ped) then
		destroyElement(ped)
	end
	if isElement(ped) then
		destroyElement(pedCol)
	end
end

function zombieKilled (killer)
	if killer then
		setElementData(killer,"zombieskilled",getElementData(killer,"zombieskilled")+1)
	end	
	local skin = getElementModel(source)
	local x,y,z = getElementPosition(source)
	local ped = createPed(skin,x,y,z)
	local pedCol = createColSphere(x,y,z,1.5)
	attachElements (pedCol,ped,0,0,0)
	killPed(ped)
	setTimer(destroyDeadZombie,360000 ,1,ped,pedCol)
	setElementData(pedCol,"parent",ped)
	setElementData(pedCol,"playername","Зомби")
	setElementData(pedCol,"deadman",true)
	setElementData(pedCol,"hidebody",true)
	setElementData(pedCol,"MAX_Slots",20)
	setElementData(ped,"deadzombie",true)
--	setPedAnimation(ped, "ped", "KO_shot_stom", 7000, false, true, false)
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	setElementData(pedCol,"deadreason","Похоже он мёртв. Czas zgonu: "..hours..":"..minutes..".")
	for i, item in ipairs(itemTableZombies) do
		local value =  math.percentChance (item[5]/2.5,1)
		setElementData(pedCol,item[1],value)
		local ammoData,weapID = exports.weapon:getWeaponAmmoType (item[1],true)
			if ammoData and value > 0 then
				setElementData(pedCol,ammoData,1)
			end
		end
	local zombieCreator = getElementData(source,"owner")
	setElementData(zombieCreator,"spawnedzombies",getElementData(zombieCreator,"spawnedzombies")-1)
	destroyElement(source)
end
addEvent("onZombieGetsKilled",true)
addEventHandler("onZombieGetsKilled",getRootElement(),zombieKilled)