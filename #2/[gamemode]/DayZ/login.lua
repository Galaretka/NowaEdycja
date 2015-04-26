function playerLogin(username, pass, player)
	local playerID = getAccountData(getPlayerAccount(player),"playerID")
	account = getPlayerAccount(player)
	local x,y,z = getAccountData(account,"last_x"),getAccountData(account,"last_y"),getAccountData(account,"last_z")
	local skin = getAccountData(account,"skin")
	createZombieTable (player)
	if getAccountData(account,"isDead") then
		spawnDayZPlayer(player)
		return
	end
	if getAccountData(account,"inComa") then
		spawnDayZPlayer(player)
		return
	end
	spawnPlayer (player, x,y,z+0.7, math.random(0,360), skin, 0, 0)
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
	for i,data in ipairs(playerDataTable) do
		local elementData = getAccountData(account,data[1])
		if not elementData then
			if data[1] == "currentweapon_1"
			or data[1] == "currentweapon_2"
			or data[1] == "currentweapon_3"
			or data[1] == "currentweapon_4"
			or data[1] == "intoxication"
			or data[1] == "brokenbone"
			or data[1] == "sepsis"
			or data[1] == "grippe"
			or data[1] == "worm"
			or data[1] == "pain"
			or data[1] == "cold"
			or data[1] == "inComa"
			or data[1] == "inHandcuffs"
			then
				elementData = elementData
			else
				elementData = 0
			end
		end
		setElementData(player,data[1],elementData)
	end
	setElementData(player,"logedin",true)
	local weapon = getElementData(player,"currentweapon_1")
	if weapon then
		local ammoData,weapID = exports.weapon:getWeaponAmmoType (weapon)
		giveWeapon(player,weapID,getElementData(player,ammoData), false )
	end
	local weapon = getElementData(player,"currentweapon_2")
	if weapon then
		local ammoData,weapID = exports.weapon:getWeaponAmmoType (weapon)
		giveWeapon(player,weapID,getElementData(player,ammoData), false )
	end
	local weapon = getElementData(player,"currentweapon_3")
	if weapon then
		local ammoData,weapID = exports.weapon:getWeaponAmmoType (weapon)
		giveWeapon(player,weapID,getElementData(player,ammoData), false )
	end
	local weapon = getElementData(player,"currentweapon_4")
	if weapon then
		local ammoData,weapID = exports.weapon:getWeaponAmmoType (weapon)
		giveWeapon(player,weapID,getElementData(player,ammoData), false )
	end
	setElementData(player,"skin",73)
	setElementModel(player, getElementData(player,"skin"))
	triggerClientEvent(player, "onClientPlayerDayZLogin", player)
	triggerClientEvent(player, "onPlayerFlashlightOff", player)
	triggerEvent("removeNewWeapon", player)
	setPedWeaponSlot(player, 0)
end
addEvent("onPlayerDayZLogin", true)
addEventHandler("onPlayerDayZLogin", getRootElement(), playerLogin)

function createZombieTable (player)
	setElementData(player,"playerZombies",{"no","no","no","no","no","no","no","no","no"})
	setElementData(player,"spawnedzombies",0)
end

function playerRegister(username, pass, player)
	local number = math.random(table.size(spawnPositions))
	local x,y,z = spawnPositions[number][1],spawnPositions[number][2],spawnPositions[number][3]
	spawnPlayer (player, x,y,z, math.random(0,360), 73, 0, 0)
	fadeCamera (player, true)
	setCameraTarget (player, player)
	playerCol = createColSphere(x,y,z,1.5)
	attachElements ( playerCol, player, 0, 0, 0 )
	setElementData(playerCol,"parent",player)
	setElementData(playerCol,"player",true)
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

function saveAccounts ()
	local account = getPlayerAccount(source)
	if account then
		for i,data in ipairs(playerDataTable) do
			setAccountData(account,data[1],getElementData(source,data[1]))
		end
		local x,y,z =  getElementPosition(source)
		setAccountData(account,"last_x",x)
		setAccountData(account,"last_y",y)
		setAccountData(account,"last_z",z)
		if isElement(getElementData(source,"playerCol")) then
			destroyElement(getElementData(source,"playerCol"))
		end
	end	
	setElementData(source,"logedin",false)
end
addEventHandler ( "onPlayerQuit", getRootElement(), saveAccounts )

function saveAccounts2()
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
	end	
end
addEventHandler("onResourceStop", getRootElement(), saveAccounts2)