function hideInventoryManual ()
	triggerEvent("hideInventoryManual", root)
end

addEvent("showInventoryManual",true)
addEventHandler("showInventoryManual",getLocalPlayer(),function()
	showNewInventoryManual()
end)

addEvent("hideInventoryManual",true)
addEventHandler("hideInventoryManual",getLocalPlayer(),function()
	unShowNewInventory()
end)

addEvent("onClientPlayerDayZLogin",true)
addEventHandler("onClientPlayerDayZLogin",getLocalPlayer(),function()
	loadPlayerBoxesItems()
end)

function onClientOpenInventoryStopMenu ()
	triggerEvent("disableMenu",getLocalPlayer())
end

function getPlayerMaxAviableSlots()
	return getElementData(getLocalPlayer(),"MAX_Slots")
end

function getLootMaxAviableSlots(loot)
	return getElementData(loot,"MAX_Slots")
end

function getPlayerCurrentSlots()
	local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Pistols"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Medic"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Cloting"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Parts"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
		end
	end
	return math.floor(current_SLOTS)
end


function getLootCurrentSlots(loot)
	local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Medic"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Cloting"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Parts"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
			current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
		end
	end
	return math.floor(current_SLOTS)
end

function getItemSlots(itema)
	local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Pistols"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end	
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end
	for id, item in ipairs(inventoryItems["Medic"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end
	for id, item in ipairs(inventoryItems["Cloting"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end
	for id, item in ipairs(inventoryItems["Parts"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if itema == item[1] then 
			return item[2]*item[3]
		end
	end
	return false
end


function getItemNewSlots(itema)
	local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end	
	for id, item in ipairs(inventoryItems["Weapons"]["Pistols"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end	
	for id, item in ipairs(inventoryItems["Ammo"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end
	for id, item in ipairs(inventoryItems["Food"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end
	for id, item in ipairs(inventoryItems["Medic"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end

	for id, item in ipairs(inventoryItems["Cloting"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end

	for id, item in ipairs(inventoryItems["Parts"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end
	for id, item in ipairs(inventoryItems["Items"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end
	for id, item in ipairs(inventoryItems["Toolbelt"]) do
		if itema == item[1] then 
			return item[2],item[3]
		end
	end	
	return false
end


function isToolbeltItem(itema)
	local current_SLOTS = 0
	for id, item in ipairs(inventoryItems["Toolbelt"]) do
		if itema == item[1] then 
			return true
		end
	end
	for id, item in ipairs(inventoryItems["Cloting"]) do
		if itema == item[1] then 
			return true
		end
	end
	return false
end

function getVehicleMaxFuel(loot)
	local modelID = getElementModel(getElementData(loot,"parent"))
	for i,vehicle in ipairs(vehicleFuelTable) do
		if modelID == vehicle[1] then
			 return vehicle[2]
		end
	end
	return false
end

function isPlayerInLoot()
	if getElementData(getLocalPlayer(),"loot") then
		return getElementData(getLocalPlayer(),"currentCol")
	end
	return false
end

function moveItemOutOfInventory (itemName)
	if getElementData(getLocalPlayer(),itemName) and getElementData(getLocalPlayer(),itemName) >= 1 then
		if isPlayerInLoot() then
			local isVehicle = getElementData(isPlayerInLoot(),"vehicle")
			local isTent = getElementData(isPlayerInLoot(),"tent")
			if isVehicle and not isTent then
				local veh = getElementData(isPlayerInLoot(),"parent")
				local tires,engine,parts,lamp = getVehicleAddonInfos (getElementModel(veh))
				if itemName == "Koło" and (getElementData(isPlayerInLoot(),"Tire_inVehicle") or 0) < tires or itemName == "Silnik" and (getElementData(isPlayerInLoot(),"Engine_inVehicle") or 0)  < engine or itemName == "Bak" and (getElementData(isPlayerInLoot(),"Parts_inVehicle") or 0) < parts or itemName == "Żarówki samochodowe" and (getElementData(isPlayerInLoot(),"Lamp_inVehicle") or 0) < lamp then
					if itemName == "Koło" then itemName = "Tire" end
					if itemName == "Silnik" then itemName = "Engine" end
					if itemName == "Bak" then itemName = "Parts" end
					if itemName == "Żarówki samochodowe" then itemName = "Lamp" end
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName.."_inVehicle",isPlayerInLoot())
				elseif isToolbeltItem(itemName) then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
				elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
				else
					triggerEvent("displayClientInfo",getLocalPlayer(),"Inventory","Inwentarz jest pełny!",225,22,0)
					return
				end
			elseif isToolbeltItem(itemName) then
					triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
			elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
				triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
			else
				triggerEvent("displayClientInfo",getLocalPlayer(),"Inventory","Inwentarz jest pełny!",225,22,0)
				return
			end	
		else
			triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
		end	
	end
end

--перетаскивание предметов из инвентаря
function onPlayerMoveItemOutOFInventory (itemName,loot)
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
	elseif (itemName == "Latarka*") then
		triggerEvent("onPlayerFlashlightOff",getLocalPlayer())
	elseif (itemName == "Latarka na głowę*") then
		triggerEvent("onPlayerFlashlightOff",getLocalPlayer())
	elseif (itemName == "М4А1" or itemName == "AKM" or itemName == "SKS" or itemName == "Sporter 22" or itemName == "Kusza" or itemName == "CZ550" or itemName == "IZH-43" or itemName == "Blaze 95" or itemName == "Mosin 9130") then
		triggerServerEvent("removeBackWeaponOnDrop",getLocalPlayer())
	elseif (itemName == "Nóż myśliwski" or itemName == "Topór strażacki" or itemName == "Kij bejsbolowy z gwoździami"or itemName == "Kij bejsbolowy" or itemName == "Łopata" or itemName == "Монтировка" or itemName == "Maczeta" or itemName == "Topór") then
		triggerServerEvent("removeBackWeaponOnDropCold",getLocalPlayer())
	elseif (itemName == "GPS") then
		setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName)-1))
		setElementData(loot,itemName,(getElementData(loot,itemName)+1))
		if getElementData(getLocalPlayer(),itemName) < 1 then
			exports.gps:showGPS(false)
		end
	end
	if (itemName == "Kask motocyklowy") then
		setElementData(getLocalPlayer(), "Helmets", 0)
		itemPlus = 1
	elseif (itemName == "Ракетные Авиаторы") then
		setElementData(getLocalPlayer(), "Glasses", 0)
		itemPlus = 1
	elseif (itemName == "Respirator") or (itemName == "Маска 'Виндетто'") or (itemName == "Maska gazowa") or (itemName == "Maska 'Hoxton'") or (itemName == "Maska 'Dallas'") or (itemName == "Maska 'Wilk'") then
		setElementData(getLocalPlayer(), "Masks", 0)
		itemPlus = 1
	elseif (itemName == "Nauszniki") or (itemName == "Kowbojski kapelusz") or (itemName == "Czapka") or (itemName == "Okrągła czapka") or (itemName == "Beret") or (itemName == "Beret wojskowy") or (itemName == "Panama") or (itemName == "Hełm wojskowy") then
		setElementData(getLocalPlayer(), "Hats", 0)
		itemPlus = 1
	end
	if (itemName == "Kamizelka taktyczna") or (itemName == "Kamizelka z kevlaru") then
		setElementData(getLocalPlayer(),"Vest",0)
		setElementData(getLocalPlayer(),"MAX_Slots",getElementData(getLocalPlayer(), "MAX_Slots")-4)
		maxSlotsChanged()
		itemPlus = 1
	end
	if loot then 
		if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
			if itemName == "Pełny kanister" then
				if getElementData(loot,"fuel")+20 < getVehicleMaxFuel(loot) then
					addingfuel = 20
				elseif getElementData(loot,"fuel")+20 > getVehicleMaxFuel(loot)+15 then
					triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Bak полон",255,22,0)
					return
				else
					addingfuel = getVehicleMaxFuel(loot)-getElementData(loot,"fuel")
				end
				setElementData(loot,"fuel",getElementData(loot,"fuel")+addingfuel)
				setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
				setElementData(getLocalPlayer(),"Pusty kanister",(getElementData(getLocalPlayer(),"Pusty kanister") or 0)+itemPlus)
				triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Wypełnieniu transportu",22,255,0)
				local x,y,z = getElementPosition(getLocalPlayer())
				playSound3D("sounds/action_refuel_0.ogg",x,y,z,false)
				return
			end
		end
	end
	itemName2 = itemName
	if itemName == "Tire_inVehicle" then itemName2 = "Koło" end
	if itemName == "Engine_inVehicle" then itemName2 = "Silnik" end
	if itemName == "Parts_inVehicle" then itemName2 = "Bak" end
	if itemName == "Lamp_inVehicle" then itemName2 = "Żarówki samochodowe" end
	if (getElementData(getLocalPlayer(),itemName2) or 0)/itemPlus < 1 then
		triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Nie można go używać!",255,22,0)
		return
	end
	if loot then
		setElementData(loot,itemName,(getElementData(loot,itemName) or 0)+1)
		local players = getElementsWithinColShape(loot,"player")
		if #players > 1 then
			triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
		end	
		if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then end
	else
		triggerServerEvent("playerDropAItem",getLocalPlayer(),itemName)
	end
	if itemName == "Tire_inVehicle" then itemName = "Koło" end
	if itemName == "Engine_inVehicle" then itemName = "Silnik" end
	if itemName == "Parts_inVehicle" then itemName = "Bak" end
	if itemName == "Lamp_inVehicle" then itemName = "Żarówki samochodowe" end
	setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
	if loot and getElementData(loot,"itemloot") then
		triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemOutOFInventory", true )
addEventHandler( "onPlayerMoveItemOutOFInventory", getRootElement(), onPlayerMoveItemOutOFInventory )

function dropCurrentWeapon()
	local weap = currentMainWeap 
	triggerServerEvent("playerDropAItem",getLocalPlayer(),weap)
	setElementData (getLocalPlayer(), weap, 0)
end

function onPlayerMoveItemInInventory ()
	local itemName = guiGridListGetItemText ( gridlistItems["loot"], guiGridListGetSelectedItem ( gridlistItems["loot"] ), 1 )
	if isPlayerInLoot() then
		if getElementData(isPlayerInLoot(),itemName) and getElementData(isPlayerInLoot(),itemName) >= 1 then
			if not isToolbeltItem(itemName) then
				if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then
					if not playerMovedInInventory then
						triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
						playerMovedInInventory = true
						setTimer(function()
							playerMovedInInventory = false
						end,700,1)
					else
						triggerEvent("displayClientInfo",getLocalPlayer(),"Inventory","Nie śpiesz się!",225,22,0)
						return
					end	
				else
					triggerEvent("displayClientInfo",getLocalPlayer(),"Inventory","Inwentarz jest pełny!",225,22,0)
					return
				end
			else
				playerMovedInInventory = true
				setTimer(function()
					playerMovedInInventory = false
				end,700,1)
				triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
			end
		end
		if isPlayerInLoot() then
			local gearName = guiGetText(headline["loot"])
			local col = getElementData(getLocalPlayer(),"currentCol")
			setTimer(refreshInventory,100,2)
			setTimer(refreshLoot,200,2,col,gearName)
		end
	end	
end

--перетаскивание предметов в инвентарь
local bj = 0

function onPlayerMoveItemInInventory (itemName,loot)
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
	elseif (itemName == "Nóż myśliwski" or itemName == "Topór strażacki" or itemName == "Kij bejsbolowy z gwoździami" or itemName == "Kij bejsbolowy" or itemName == "Łopata" or itemName == "Монтировка" or itemName == "Maczeta" or itemName == "Topór") then
		local curweap = getElementData(getLocalPlayer(), "currentweapon_2")
		if curweap and curweap ~= "noweap" then
			if not weapFitsInInventory(curweap,itemName) then
				triggerEvent ("displayClientInfo",getLocalPlayer(),"inventory","Aktualna broń nie mieści się w plecaku!",22,255,0)
				return true
			end
		end
		setElementData(getLocalPlayer(),"currentweapon_2",itemName)
		triggerEvent ("playerCurrentWeapChanged",getLocalPlayer())
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,2,false,true)
		triggerServerEvent("removeNewWeapon",getLocalPlayer())
	end
	if (itemName == "Kamizelka taktyczna") then
		setElementData(getLocalPlayer(), "Vest", 1)
		if getElementData(getLocalPlayer(),"Kamizelka z kevlaru") > 0 then
			setElementData(getLocalPlayer(),"Kamizelka z kevlaru",0)
			setElementData(loot,"Kamizelka z kevlaru",getElementData(loot,"Kamizelka z kevlaru")+1)
		else
			setElementData(getLocalPlayer(),"MAX_Slots",getElementData(getLocalPlayer(), "MAX_Slots")+4)
		end
		maxSlotsChanged()
		itemPlus = 1
	elseif (itemName == "Kamizelka z kevlaru") then
		setElementData(getLocalPlayer(), "Vest", 2)
		if getElementData(getLocalPlayer(),"Kamizelka taktyczna") > 0 then
			setElementData(getLocalPlayer(),"Kamizelka taktyczna",0)
			setElementData(loot,"Kamizelka taktyczna",getElementData(loot,"Kamizelka taktyczna")+1)
		else
			setElementData(getLocalPlayer(),"MAX_Slots",getElementData(getLocalPlayer(), "MAX_Slots")+4)
		end
		maxSlotsChanged()
		itemPlus = 1
	end
	local slots = getElementData(getLocalPlayer(), "MAX_Slots")
	if sacks[slots] then
		sackLoot = sacks[slots][1] 
	end
	if (getElementData(getLocalPlayer(),"Kamizelka taktyczna") > 0) or (getElementData(getLocalPlayer(),"Kamizelka z kevlaru") > 0) then
		bj = 4
	else
		bj = 0
	end
	if (itemName == "Torba dziecięca") then
		setElementData(getLocalPlayer(),"MAX_Slots",12+bj)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		if slots > 10 then
			setElementData(loot,sackLoot,getElementData(loot,sackLoot)+1)
		end
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Torba domowa") then
		setElementData(getLocalPlayer(),"MAX_Slots",13+bj)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		if slots > 10 then
			setElementData(loot,sackLoot,getElementData(loot,sackLoot)+1)
		end
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Plecak domowej roboty") then
		setElementData(getLocalPlayer(),"MAX_Slots",20+bj)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		if slots > 10 then
			setElementData(loot,sackLoot,getElementData(loot,sackLoot)+1)
		end
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Plecak") then
		setElementData(getLocalPlayer(),"MAX_Slots",25+bj)
		if slots > 10 then
			setElementData(loot,sackLoot,getElementData(loot,sackLoot)+1)
		end
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Plecak na polowanie") then
		setElementData(getLocalPlayer(),"MAX_Slots",30+bj)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		if slots > 10 then
			setElementData(loot,sackLoot,getElementData(loot,sackLoot)+1)
		end
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Plecak górski") then
		setElementData(getLocalPlayer(),"MAX_Slots",50+bj)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		if slots > 10 then
			setElementData(loot,sackLoot,getElementData(loot,sackLoot)+1)
		end
		maxSlotsChanged()
		itemPlus = 0
	end
--[[	local helm = getElementData(getLocalPlayer(), "Helmets")
	if helmets[helm] then
		helmLoot = helmets[helm][1] 
	end
	local glass = getElementData(getLocalPlayer(), "Glasses")
	if glasses[glass] then
		glassLoot = glasses[glass][1] 
	end
	local mask = getElementData(getLocalPlayer(), "Masks")
	if masks[mask] then
		maskLoot = masks[mask][1] 
	end
	local hat = getElementData(getLocalPlayer(), "Hats")
	if hats[hat] then
		hatLoot = hats[hat][1] 
	end
	local vest = getElementData(getLocalPlayer(), "Vest")
	if vests[vest] then
		vestLoot = vests[vest][1] 
	end
	if (itemName == "Kask motocyklowy") then
		setElementData(getLocalPlayer(), "Helmets", 10)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,helmLoot,getElementData(loot,helmLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Ракетные Авиаторы") then
		setElementData(getLocalPlayer(), "Glasses", 10)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,glassLoot,getElementData(loot,glassLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Respirator") then
		setElementData(getLocalPlayer(), "Masks", 1)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,maskLoot,getElementData(loot,maskLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Maska gazowa") then
		setElementData(getLocalPlayer(), "Masks", 2)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,maskLoot,getElementData(loot,maskLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Maska 'Hoxton'") then
		setElementData(getLocalPlayer(), "Masks", 3)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,maskLoot,getElementData(loot,maskLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Maska 'Dallas'") then
		setElementData(getLocalPlayer(), "Masks", 4)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,maskLoot,getElementData(loot,maskLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Maska 'Wilk'") then
		setElementData(getLocalPlayer(), "Masks", 5)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,maskLoot,getElementData(loot,maskLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Nauszniki") then
		setElementData(getLocalPlayer(), "Hats", 1)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,hatLoot,getElementData(loot,hatLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Kowbojski kapelusz") then
		setElementData(getLocalPlayer(), "Hats", 2)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,hatLoot,getElementData(loot,hatLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Czapka") then
		setElementData(getLocalPlayer(), "Hats", 3)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,hatLoot,getElementData(loot,hatLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Okrągła czapka") then
		setElementData(getLocalPlayer(), "Hats", 4)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,hatLoot,getElementData(loot,hatLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Beret") then
		setElementData(getLocalPlayer(), "Hats", 5)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,hatLoot,getElementData(loot,hatLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Beret wojskowy") then
		setElementData(getLocalPlayer(), "Hats", 6)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,hatLoot,getElementData(loot,hatLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Panama") then
		setElementData(getLocalPlayer(), "Hats", 7)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,hatLoot,getElementData(loot,hatLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Hełm wojskowy") then
		setElementData(getLocalPlayer(), "Hats", 8)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,hatLoot,getElementData(loot,hatLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	elseif (itemName == "Kamizelka taktyczna") then
		setElementData(getLocalPlayer(), "Vest", 1)
		setElementData(loot,itemName,getElementData(loot,itemName)-1)
		setElementData(loot,vestLoot,getElementData(loot,vestLoot)+1)
		maxSlotsChanged()
		itemPlus = 0
	end--]]
	if loot then
		setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName) or 0)+itemPlus) 
		if itemPlus == 0 then
			setElementData(loot,itemName,getElementData(loot,itemName)-0)
		else
			setElementData(loot,itemName,getElementData(loot,itemName)-1)
		end
		local players = getElementsWithinColShape (loot,"player")
		if #players > 1 then
			triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
		end
	end
	setTimer(refreshItemsInNewInventory, 200, 2)
	if getElementData(loot,"itemloot") then
		triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemInInventory", true )
addEventHandler( "onPlayerMoveItemInInventory", getRootElement(), onPlayerMoveItemInInventory )

function playerDroppedWeaponC(weap)
	if weap == currentAdditWeap then
		currentAdditWeap = false
		setGlobalOff()
	elseif weap == currentMainWeap then
		currentMainWeap = false
		setGlobalOff()
	end
end
addEvent( "playerDroppedWeapon", true )
addEventHandler( "playerDroppedWeapon", getRootElement(), playerDroppedWeaponC )


function playerCurrentWeapChangedC ()
	local weap1 = getElementData ( getLocalPlayer(), "currentweapon_1" )
	if weap1 == "noweap" then
		weap1 = false
	end
	currentMainWeap = weap1
	local weap2 = getElementData ( getLocalPlayer(), "currentweapon_2" )
	if weap2 == "noweap" then
		weap2 = false
	end
	currentAdditWeap = weap2
	setGlobalOff()
end

addEvent( "playerCurrentWeapChanged", true )
addEventHandler( "playerCurrentWeapChanged", getRootElement(), playerCurrentWeapChangedC )

function onPlayerPressRightKeyInInventory ()
	local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
	local itemName,itemInfo = getInventoryInfosForRightClickMenu(itemName)
	if isCursorShowing() and guiGetVisible(inventoryWindows) and itemInfo then
		showRightClickInventoryMenu (itemName,itemInfo)
	end
end
--bindKey("mouse2","down",onPlayerPressRightKeyInInventory)

function getInventoryInfosForRightClickMenu(itemName)
	for i,itemInfo in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if itemName == itemInfo[1] then
			return itemName,"Weź pierwszą broń"
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if itemName == itemInfo[1] then
			return itemName,"Weź drugą broń"
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Weapons"]["Pistols"]) do
		if itemName == itemInfo[1] then
			return itemName,"Weź pistolet"
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if itemName == itemInfo[1] then
			return itemName,"Weź specjalną broń"
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Ammo"]) do
		if itemName == itemInfo[1] then
			return itemName,false
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Food"]) do
		if itemName == itemInfo[1] then
			if itemInfo[1] == "Butelka wody"
			or itemInfo[1] == "Coca-cola"
			or itemInfo[1] == "Sprite"
			or itemInfo[1] == "Pepsi"
			or itemInfo[1] == "Piwo"
			or itemInfo[1] == "Manierka"
			then
				info = "Wypij"
			elseif itemInfo[1] == "Otwarta puszka makaronu"
			or itemInfo[1] == "Otwarty pojemnik z boczkiem"
			or itemInfo[1] == "Otwarta puszka fasoli"
			or itemInfo[1] == "Otwarta puszka sardynek"
			or itemInfo[1] == "Tuńczyk"
			or itemInfo[1] == "Pieczone mięso"
			or itemInfo[1] == "Surowe mięso"
			or itemInfo[1] == "Mleko w proszku"
			or itemInfo[1] == "Ryż"
			or itemInfo[1] == "Płatki"
			then
				info = "Zjedz"
			else
				info = nil
			end
			return itemName,info
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Medic"]) do
		if itemName == itemInfo[1] then
			return itemName,itemInfo[7] or false
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Cloting"]) do
		if itemName == itemInfo[1] then
			return itemName,itemInfo[7] or false
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Parts"]) do
		if itemName == itemInfo[1] then
			return itemName,itemInfo[7] or false
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Items"]) do
		if itemName == itemInfo[1] then
			return itemName,itemInfo[7] or false
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Toolbelt"]) do
		if itemName == itemInfo[1] then
			return itemName,itemInfo[7] or false
		end
	end
	return false, false
end
local headline = {}
rightclickWindow = guiCreateStaticImage(0,0,0.5,0.021,"images/red.png",true)
headline["rightclickmenu"] = guiCreateLabel(0,0,1,1,"",true,rightclickWindow)
guiLabelSetHorizontalAlign (headline["rightclickmenu"],"center")
guiLabelSetVerticalAlign (headline["rightclickmenu"],"center")
guiSetFont (headline["rightclickmenu"], "default-bold-small" )
guiSetVisible(rightclickWindow,false)

rightclicktakeWindow = guiCreateStaticImage(0,0,0.5,0.021,"images/red.png",true)
headline["rightclicktake"] = guiCreateLabel(0,0,1,1,"Plądrujesz",true,rightclicktakeWindow)
guiLabelSetHorizontalAlign (headline["rightclicktake"],"center")
guiLabelSetVerticalAlign (headline["rightclicktake"],"center")
guiSetFont (headline["rightclicktake"], "default-bold-small" )
guiSetVisible(rightclicktakeWindow,false)

rightclickInfoWindow = guiCreateStaticImage(0,0,0.5,0.021,"images/red.png",true)
headline["rightclickinfo"] = guiCreateLabel(0,0,1,1,"Plądruj",true,rightclickInfoWindow)
guiLabelSetHorizontalAlign (headline["rightclickinfo"],"center")
guiLabelSetVerticalAlign (headline["rightclickinfo"],"center")
guiSetFont (headline["rightclickinfo"], "default-bold-small" )
guiSetVisible(rightclickInfoWindow,false)

function showRightClickInventoryMenu (itemName,itemInfo,itemImage,itemImageXS,itemImageYS)
	if itemInfo then
		local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
		guiSetVisible(rightclickWindow,true)
		guiSetText(headline["rightclickmenu"],itemInfo)
		local whith = guiLabelGetTextExtent (headline["rightclickmenu"])
		guiSetPosition(rightclickWindow,screenx,screeny,true)
		local x,y = guiGetSize(rightclickWindow,false)
		guiSetSize(rightclickWindow,whith,y,false)
		guiBringToFront(rightclickWindow)
		setElementData(rightclickWindow,"iteminfo",{itemName,itemInfo,itemImage,itemImageXS,itemImageYS})
	end
end

function showRightClickInfoMenu ()
	local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
	guiSetVisible(rightclickInfoWindow,true)
	local whith = guiLabelGetTextExtent (headline["rightclickinfo"])
	guiSetPosition(rightclickInfoWindow,screenx,screeny+0.0215,true)
	local x,y = guiGetSize(rightclickInfoWindow,false)
	guiSetSize(rightclickInfoWindow,whith,y,false)
	guiBringToFront(rightclickInfoWindow)
	infoShowing = false
end

function showRightClickTakeMenu ()
	local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
	guiSetVisible(rightclicktakeWindow,true)
	local whith = guiLabelGetTextExtent (headline["rightclicktake"])
	guiSetPosition(rightclicktakeWindow,screenx,screeny,true)
	local x,y = guiGetSize(rightclicktakeWindow,false)
	guiSetSize(rightclicktakeWindow,whith,y,false)
	guiBringToFront(rightclicktakeWindow)
end

function onPlayerClickOnRightInfoMenu ()
	if descrname then
		drawingWindowInfo = true
		closeInfoWindowCrest = exports.design:standaloneCrest(wx/2+280,hy/2-200,20,20,false)
		hideRightClickInventoryMenu ()
		guiSetVisible (closeInventoryWindowCrest, false)
		guiSetVisible (removeWeapsWindowCrest, false)
		addEventHandler("onClientGUIClick",closeInfoWindowCrest,unShowInfoMenu,false)
	end
end

function onPlayerClickOnRightTakeMenu ()
	if descrname then
		hideRightClickInventoryMenu ()
		if checkSpaceForItem ( descrxs, descrys ) then
			moveItemInInventory(descrname)
		end
	end
end

function unShowInfoMenu ()
	--outputDebugString ( tostring (closeInfoWindowCrest))
	if isElement ( closeInfoWindowCrest ) then
		destroyElement ( closeInfoWindowCrest )
	end
	if isElement ( closeInventoryWindowCrest ) or isElement ( removeWeapsWindowCrest ) then
	guiSetVisible (closeInventoryWindowCrest, true)
	guiSetVisible (removeWeapsWindowCrest, true)
	end
	drawingWindowInfo = false
	--outputDebugString ( tostring (drawingWindowInfo))
end

function hideRightClickInventoryMenu ()
	guiSetVisible(rightclickWindow,false)
	guiSetVisible(rightclickInfoWindow,false)
	guiSetVisible(rightclicktakeWindow,false)
	guiSetVisible(rightclickCraftWindow,false) -- тут
end

function onPlayerClickOnRightClickMenu (button,state)
    if button == "left" then
        local itemName,itemInfo,itemImage,itemImageXS,itemImageYS = getElementData(rightclickWindow,"iteminfo")[1],getElementData(rightclickWindow,"iteminfo")[2],getElementData(rightclickWindow,"iteminfo")[3],getElementData(rightclickWindow,"iteminfo")[4],getElementData(rightclickWindow,"iteminfo")[5]
		hideRightClickInventoryMenu ()
		useItems(itemName,itemInfo)
		if itemInfo == "Weź pierwszą broń" then
			currentMainWeap = itemName
			setGlobalOff()
		elseif itemInfo == "Weź drugą broń" then
			currentAdditWeap = itemName
			setGlobalOff()
		end
		draggingUseItem = itemImage
		draggingUseItemX = itemImageXS
		draggingUseItemY = itemImageYS
		setTimer ( function () draggingUseItem = false end, 3800, 1 )
		setTimer ( refreshItemsInNewInventory, 500, 1 )
    end
end
addEventHandler("onClientGUIClick",headline["rightclickmenu"],onPlayerClickOnRightClickMenu,false)
addEventHandler("onClientGUIClick",headline["rightclickinfo"],onPlayerClickOnRightInfoMenu,false)
addEventHandler("onClientGUIClick",headline["rightclicktake"],onPlayerClickOnRightTakeMenu,false)

function getItemData(itemName)
	for i,itemInfo in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Weapons"]["Pistols"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Ammo"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Food"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Medic"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Cloting"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Parts"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Items"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end	
	end
	for i,itemInfo in ipairs(inventoryItems["Toolbelt"]) do
		if itemName == itemInfo[1] then
			return itemInfo
		end
	end
	return false
end

function getVehicleAddonInfos (id)
	for i,veh in ipairs(vehicleAddonsInfo) do
		if veh[1] == id then
			return veh[2], veh[3], veh[4], veh[5]
		end
	end
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function checkIfMainWeap (name)
	if name == "noweap" then
		return false
	end
	for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
		if item[1] == name then
			return true
		end
	end
	return false
end

rightclickCraftWindow = guiCreateStaticImage(0,0,0.05,0.0215,"images/red.png",true) -- тут
headline["rightclickcraftmenu"] = guiCreateLabel(0,0,1,1,"",true,rightclickCraftWindow)
guiLabelSetHorizontalAlign (headline["rightclickcraftmenu"],"center")
guiLabelSetVerticalAlign (headline["rightclickcraftmenu"],"center")
guiSetFont (headline["rightclickcraftmenu"], "default-bold-small" )
guiSetVisible(rightclickCraftWindow,false)

function showRightClickCraftMenu () -- тут
	craftButtonShowed = true
	if cur_craft_recipe then
		local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
		guiSetVisible(rightclickCraftWindow,true)
		guiSetText(headline["rightclickcraftmenu"],cur_craft_recipe[2])
		local whith = guiLabelGetTextExtent (headline["rightclickcraftmenu"])
		guiSetPosition(rightclickCraftWindow,screenx,screeny,true)
		local x,y = guiGetSize(rightclickCraftWindow,false)
		guiSetSize(rightclickCraftWindow,whith,y,false)
		guiBringToFront(rightclickCraftWindow)
	end
end

function onPlayerClickOnRightCraftMenu () -- тут
	if cur_craft_recipe then
		if cur_craft_recipe[3][1] == 1 then
			if checkCraftItemFits () then
				for i, v in ipairs ( cur_craft_recipe[1] ) do
					if v[2] then
--						setElementData ( getLocalPlayer(), v, ( getElementData ( getLocalPlayer(), v ) or 0 ) - 1 )
						setElementData ( getLocalPlayer(), v[1], ( getElementData ( getLocalPlayer(), v[1] ) or 0 ) - 1 )
						setTimer(refreshItemsInNewInventory,200,2)
					end
				end 
				setElementData ( getLocalPlayer(), cur_craft_recipe[3][2], ( getElementData ( getLocalPlayer(), cur_craft_recipe[3][2] ) or 0 ) + cur_craft_recipe[3][3])
				setTimer(refreshItemsInNewInventory,200,2)
			else
				triggerEvent("displayClientInfo",getLocalPlayer(),"Inventory","Coś nie pasuje!",225,22,0)
			end
		else
			useItems(cur_craft_recipe[3][2],cur_craft_recipe[3][3])
			setTimer(refreshItemsInNewInventory,700,2)
		end
	end
	cur_craft_recipe = nil
	hideRightClickInventoryMenu ()
end
addEventHandler("onClientGUIClick",headline["rightclickcraftmenu"],onPlayerClickOnRightCraftMenu,false) -- тут

function checkCraftItemFits () -- тут
	if cur_craft_recipe then
		local totalx, totaly = 0, 0
		for i, v in ipairs ( cur_craft_recipe[1] ) do
			if v[2] then
				local xs, ys = getItemNewSlots ( v[1] ) or 1, 1
				totalx, totaly = totalx+xs, totaly+ys
			end
		end
		local xs, ys = 0,0
		local xs, ys = getItemNewSlots ( cur_craft_recipe[3][2] ) or 1, 1
		if xs <= totalx and ys <= totaly then
			return true
		elseif checkSpaceForItem ( xs-totalx, ys-totaly ) then
			return true
		else
			return false
		end
	else
		return false
	end
end
