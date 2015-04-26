function createItemPickup(item,x,y,z,tableStringName,vz,col)
	if item and x and y and z then
		local object = createObject(itemTable[tostring(tableStringName)][item][2],x,y,z-0.875,itemTable[tostring(tableStringName)][item][4],0,vz or 0)
		setObjectScale(object,itemTable[tostring(tableStringName)][item][3])
		setElementCollisionsEnabled(object, false)
		setElementFrozen(object,true)
		local col = createColSphere(x,y,z,col or 0.75)
		setElementData(col,"item",itemTable[tostring(tableStringName)][item][1])
		setElementData(col,"parent",object)
		setTimer(function()
			destroyElement(col)
			destroyElement(object)
		end,900000,1)
		return object
	end
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

function createItemLoot (lootPlace,x,y,z,id)
	col = createColSphere(x,y,z,2.25)
	setElementData(col,"itemloot",true)
	setElementData(col,"parent",lootPlace)
	setElementData(col,"MAX_Slots",20)
	for i, item in ipairs(itemTable[lootPlace]) do
		local value =  math.percentChance(item[5],math.random(1,2))
		setElementData(col,item[1],value)
		local ammoData,weapID = exports.weapon:getWeaponAmmoType(item[1],true)
		if ammoData and value > 0 then
			setElementData(col,ammoData,math.random(1,2))
		end
	end
	refreshItemLoot(col,lootPlace)
	return col
end


function refreshItemLoot(col,place)
	local objects = getElementData(col,"objectsINloot")
	if objects then
		if objects[1] ~= nil then
			destroyElement(objects[1])
		end
		if objects[2] ~= nil then
			destroyElement(objects[2])
		end
		if objects[3] ~= nil then
			destroyElement(objects[3])
		end
	end
	local counter = 0
	local obejctItem = {}
	for i, item in ipairs(itemTable["other"]) do
		if getElementData(col,item[1]) and getElementData(col,item[1]) > 0 then
			if counter == 3 then
				break
			end	
			counter = counter + 1
			local x,y,z = getElementPosition(col)
			obejctItem[counter] = createObject(item[2],x+math.random(-1,1),y+math.random(-1,1),z-0.875,item[4])
			setObjectScale(obejctItem[counter],item[3])
			setElementCollisionsEnabled(obejctItem[counter], false)
			setElementFrozen (obejctItem[counter],true)
		end
	end
	if obejctItem[1] == nil then
		local x,y,z = getElementPosition(col)
		obejctItem[1] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
		setObjectScale(obejctItem[1],0)
		setElementCollisionsEnabled(obejctItem[1], false)
		setElementFrozen (obejctItem[1],true)
	end
	if obejctItem[2] == nil then
		local x,y,z = getElementPosition(col)
		obejctItem[2] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
		setObjectScale(obejctItem[2],0)
		setElementCollisionsEnabled(obejctItem[2], false)
		setElementFrozen (obejctItem[2],true)
	end
	if obejctItem[3] == nil then
		local x,y,z = getElementPosition(col)
		obejctItem[3] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
		setObjectScale(obejctItem[3],0)
		setElementCollisionsEnabled(obejctItem[3], false)
		setElementFrozen (obejctItem[3],true)
	end
	setElementData(col,"objectsINloot",{obejctItem[1], obejctItem[2], obejctItem[3]})
end
addEvent( "refreshItemLoot", true )
addEventHandler( "refreshItemLoot", getRootElement(), refreshItemLoot )

function createPickupsOnServerStart()
	iPickup = 0
	for i,pos in ipairs(pickupPositions["residential"]) do
		iPickup = iPickup + 1
		createItemLoot("residential",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart2,5000,1)
--	setServerPassword("170828")
end

function createPickupsOnServerStart2()
	for i,pos in ipairs(pickupPositions["industrial"]) do
		iPickup = iPickup + 1
		createItemLoot("industrial",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart3,5000,1)
end

function createPickupsOnServerStart3()
	for i,pos in ipairs(pickupPositions["farm"]) do
		iPickup = iPickup + 1
		createItemLoot("farm",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart4,5000,1)
end

function createPickupsOnServerStart4()
	for i,pos in ipairs(pickupPositions["supermarket"]) do
		iPickup = iPickup + 1
		createItemLoot("supermarket",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart5,5000,1)
end

function createPickupsOnServerStart5()
	for i,pos in ipairs(pickupPositions["military"]) do
		iPickup = iPickup + 1
		createItemLoot("military",pos[1],pos[2],pos[3],iPickup)
	end
end
createPickupsOnServerStart()

function onPlayerTakeItemFromGround(itemName,col,mainweap)
	local itemPlus = 1
	if (itemName == ".45ACP")
	or (itemName == "9mm")
	or (itemName == ".357")
	or (itemName == "PDW Mag")
	or (itemName == "7.62x39mm")
	or (itemName == "5.56mm")
	or (itemName == "12 Gauge Buckshot")
	or (itemName == ".22")
	or (itemName == "CZ550 Mag")
	or (itemName == "7.62x51mm") then
		itemPlus = 5
	elseif (itemName == "Strzała") then
		itemPlus = 1
	elseif (itemName == "М4А1" or itemName == "AKM" or itemName == "SKS" or itemName == "Sporter 22" or itemName == "Kusza" or itemName == "CZ550" or itemName == "IZH-43" or itemName == "Blaze 95" or itemName == "Mosin 9130") then
		triggerEvent("removeBackWeaponOnDrop", source)
	end
	if (itemName == "Kamizelka taktyczna") then
		setElementData(source, "Vest", 1)
		if getElementData(source,"Kamizelka z kevlaru") > 0 then
			setElementData(source,"Kamizelka z kevlaru",0)
			local x,y,z = getElementPosition(source)
			local item,itemString = getItemTablePosition("Kamizelka z kevlaru")
			local itemPickup = createItemPickup(item,x,y,z,itemString)
		else
			setElementData(source,"MAX_Slots",getElementData(source, "MAX_Slots")+4)
		end
		itemPlus = 1
	elseif (itemName == "Kamizelka z kevlaru") then
		setElementData(source, "Vest", 2)
		if getElementData(source,"Kamizelka taktyczna") > 0 then
			setElementData(source,"Kamizelka taktyczna",0)
			local x,y,z = getElementPosition(source)
			local item,itemString = getItemTablePosition("Kamizelka taktyczna")
			local itemPickup = createItemPickup(item,x,y,z,itemString)
		else
			setElementData(source,"MAX_Slots",getElementData(source, "MAX_Slots")+4)
		end
		itemPlus = 1
	end
	local x,y,z = getElementPosition(source)
	local id,ItemType = getItemTablePosition (itemName)
	setElementData(source,itemName,(getElementData(source,itemName) or 0)+itemPlus)
	if mainweap then -- тут
		setElementData(source, "currentweapon_1", itemName)
	end
	setElementData(source, "notReadyToTakeFromGround", false)
	destroyElement(getElementData(col,"parent"))
	destroyElement(col)
end
addEvent( "onPlayerTakeItemFromGround", true )
addEventHandler( "onPlayerTakeItemFromGround", getRootElement(), onPlayerTakeItemFromGround )

function onPlayerChangeLoot(loot)
	local players = getElementsWithinColShape (loot,"player")
	for theKey,player in ipairs(players) do 
		triggerClientEvent(player,"refreshLootManual",player,loot)
	end	
end
addEvent( "onPlayerChangeLoot", true )
addEventHandler( "onPlayerChangeLoot", getRootElement(), onPlayerChangeLoot )

function playerDropAItem(itemName,num)
	local x,y,z = getElementPosition(source)
	local item,itemString = getItemTablePosition(itemName)
	if not num then
		num = 1
	end
	for i = 1, num do
		local itemPickup = createItemPickup(item,x+math.random(-1.25,1.25),y+math.random(-1.25,1.25),z,itemString,math.random(0,360))
	end
end
addEvent("playerDropAItem", true)
addEventHandler("playerDropAItem", getRootElement(), playerDropAItem)

function getItemTablePosition (itema)
	for id, item in ipairs(itemTable[tostring("other")]) do
		if itema == item[1] then
			return id,"other"
		end
	end
	return item,itemString
end

function refreshItemLoots ()
	for i, loots in ipairs(getElementsByType("colshape")) do
		local itemloot = getElementData(loots,"itemloot")
		if itemloot then
			local objects = getElementData(loots,"objectsINloot")
			if objects then
				if objects[1] ~= nil then
					destroyElement(objects[1])
				end
				if objects[2] ~= nil then
					destroyElement(objects[2])
				end
				if objects[3] ~= nil then
					destroyElement(objects[3])
				end
			end
			destroyElement(loots)
		end	
	end
	createPickupsOnServerStart()
	setTimer(refreshItemLootPoints1,10800000,1)
	setServerPassword(nil)
end

function refreshItemLootPoints ()
	local time = getRealTime()
	local hour = time.hour
	setServerPassword("huyvzopu228mamke")
	for i,player in ipairs(getElementsByType("player")) do
		kickPlayer(player, "Респавн лута. Пожалуйста, подождите...")
	end
	setTimer(refreshItemLoots,3000,1)
end

function refreshItemLootPoints1 ()
	outputChatBox("Респавн лута через 1 минуту!",getRootElement(),250,5,5)
	outputChatBox("Все игроки на сервере будут кикнуты.",getRootElement(),250,5,5)
	setTimer(refreshItemLootPoints,60000,1)
end
setTimer(refreshItemLootPoints1,10800000,1)