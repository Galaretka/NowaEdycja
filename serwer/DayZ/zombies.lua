ZombiePedSkins = {22,56,67,68,69,70,84} --ALTERNATE SKIN LISTS FOR ZOMBIES (SHORTER LIST IS TEXTURED ZOMBIES ONLY)

setElementData(getRootElement(),"zombiestotal",0)
setElementData(getRootElement(),"zombiesalive",0)
createTeam("Зомби")

itemTableZombies = {
{"Zapałki",328,0.4,90,5},
{"Drewno opałowe",1463,0.4,0,5},
{"M1911",346,1,90,0.4},
{"M9 SD",347,1,90,0.4},
{"Winchester 1866",349,1,90,0.4},
{"PDW",352,1,90,0.3},
{"Nóż",335,1,90,7},
{"Topór",339,1,90,7},
{"Pizza",1582,1,0,7},
{"Puszka z napojem",2647,1,0,7},
{"Pusty kanister",1650,1,0,5},
{"Flara",324,1,90,9},
{"Mleko",2856,1,0,5},
{"Assault Pack (ACU)",3026,0.5,0,6},
{"Środki przeciwbólowe",2709,0.5,0,7},
{"Pusta puszka po napoju",2673,0.5,0,6},
{"Pozostałości",2675,0.5,0,6},
--{"Granat",342,1,0,0.5},
{"Desert Eagle",348,1,90,0.3},
{"Sawn-Off Shotgun",350,1,90,0.2},
--{"Granatnik",351,1,90,0.2},
{"MP5A5",353,1,90,0.1},
{"Zegarek",2710,1,0,3},
{"Ciepła paczka",1576,1,0,6},
{"Drut kolczasty",933,0.25,0,1},
{"Lee Enfield",357,1,90,0.2},
{"Alice Pack",3026,1,0,0.5},
{"Koło",1073,1,0,1},
{"Morfina",1579,1,0,2},
{"Mapa",1277,0.8,90,4},
{"GPS",2976,0.15,0,1},
{"Makaron",2770,0.1,0,5},
{"Puszka fasoli",2601,1,0,5},
{"Hamburger",2768,1,0,2},
{"Radio",2966,0.5,0,3},
{"Kij golfowy",333,1,90,0.5},
{"Kij bejsbolowy",336,1,90,0.5},
{"Łopata",337,1,90,0.5},
}

function createZombieTable (player)
	--createtabel
	setElementData(player,"playerZombies",{"no","no","no","no","no","no","no","no","no"})
	setElementData(player,"spawnedzombies",0)
end

function createZomieForPlayer (x,y,z)
	x,y,z = getElementPosition(source)
	counter = 0
	if getElementData(source,"lastzombiespawnposition") then
		local xL,yL,zL = getElementData(source,"lastzombiespawnposition")[1] or false,getElementData(source,"lastzombiespawnposition")[2] or false,getElementData(source,"lastzombiespawnposition")[3] or false
		if xL then
			if getDistanceBetweenPoints3D (x,y,z,xL,yL,zL) < 50 then
				--outputChatBox("Server: canceled zombie create (reason: is near old position)")
				return
			end
		end
	end	
	if getElementData(source,"spawnedzombies")+3 <= gameplayVariables["playerzombies"] then
	for i = 1, gameplayVariables["amountzombies"] do
		counter = counter+1
		local number1 = math.random(-50,50)
		local number2 = math.random(-50,50)
		if number1 < 18 and number1 > -18 then
			number1 = 20
		end
		if number2 < 18 and number2 > -18 then
			number2 = -20
		end
		randomZskin = math.random ( 1, table.getn ( ZombiePedSkins ) )	
		zombie = call (getResourceFromName("slothbot"),"spawnBot",x+number1,y+number2,z,math.random(0,360),ZombiePedSkins[randomZskin],0,0,getTeamFromName("Зомби"))
		setElementData(zombie,"zombie",true)
		setElementData(zombie,"blood",gameplayVariables["zombieblood"])
		setElementData(zombie,"owner",source)
		call ( getResourceFromName ( "slothbot" ), "setBotGuard", zombie, x+number1,y+number2,z, false)
		--outputChatBox("Server: zombie created (reason: )")
		-------------------
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
	call ( getResourceFromName ( "slothbot" ), "setBotFollow", ped, source)
end
addEvent("botAttack",true)
addEventHandler("botAttack",getRootElement(),botAttack)

function botStopFollow (ped)
	local x,y,z = getElementPositon(ped)
	call ( getResourceFromName ( "slothbot" ), "setBotGuard", ped, x, y, z, false)
end
addEvent("botStopFollow",true)
addEventHandler("botStopFollow",getRootElement(),botStopFollow)

function outputChange(dataName,oldValue)
	if getElementType(source) == "player" then -- check if the element is a player
		if dataName == "spawnedzombies" then
			local newValue = getElementData(source,dataName) -- find the new value
			outputChatBox(oldValue.." to "..newValue) -- output the change for the affected player
		end
	end
end
--addEventHandler("onElementDataChange",getRootElement(),outputChange)

function destroyTable ()
	for i,ped in ipairs(getElementsByType("ped")) do
		if getElementData(ped,"zombie") then 
			if getElementData(ped,"owner") == source then
				setElementData(getElementData(ped,"owner"),"spawnedzombies",getElementData(getElementData(ped,"owner"),"spawnedzombies")-1)
				setElementData ( ped, "status", "dead" )
				setElementData ( ped, "target", nil )
				setElementData ( ped, "leader", nil )
				destroyElement(ped)
			end
		end				
	end
end
--addEventHandler("kilLDayZPlayer",getRootElement(),destroyTable)
--addEventHandler("onPlayerQuit",getRootElement(),destroyTable)

function destroyDeadZombie (ped,pedCol)
	destroyElement(ped)
	destroyElement(pedCol)
end

function zombieKilled (killer,headshot)
--outputChatBox("Server: destroyed zombie (reason: zombie died)")
	if killer then
		setElementData(killer,"zombieskilled",getElementData(killer,"zombieskilled")+1)
	end	
	local skin = getElementModel(source)
	local x,y,z = getElementPosition(source)
	local ped = createPed(skin,x,y,z)
	local pedCol = createColSphere(x,y,z,1.5)
	killPed(ped)
	setTimer(destroyDeadZombie,360000 ,1,ped,pedCol)
	attachElements (pedCol,ped,0,0,0)
	setElementData(pedCol,"parent",ped)
	setElementData(pedCol,"playername","zombiak")
	setElementData(pedCol,"deadman",true)
	setElementData(ped,"deadzombie",true)
	setElementData(pedCol,"deadman",true)
	local time = getRealTime()
	local hours = time.hour
	local minutes = time.minute
	setElementData(pedCol,"deadreason","Zginął o: "..hours..":"..minutes..".")
	for i, item in ipairs(itemTableZombies) do
		local value =  math.percentChance (item[5]/2.5,1)
			setElementData(pedCol,item[1],value)
		--weapon Ammo
		local ammoData,weapID = getWeaponAmmoType (item[1],true)
			if ammoData and value > 0 then
				setElementData(pedCol,ammoData,1)
			end
		end
	local zombieCreator = getElementData(source,"owner")
	setElementData(zombieCreator,"spawnedzombies",getElementData(zombieCreator,"spawnedzombies")-1)
	destroyElement(source)
	if headshot == true then
		setElementData(killer,"headshots",getElementData(killer,"headshots")+1)
	end	
end
addEvent("onZombieGetsKilled",true)
addEventHandler("onZombieGetsKilled",getRootElement(),zombieKilled)