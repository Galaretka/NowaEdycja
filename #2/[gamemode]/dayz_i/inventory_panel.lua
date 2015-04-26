wx, hy = guiGetScreenSize()
local x, y = wx/2, hy/2
local globalOff = 0

weight = 0
weightH = 0
itemmoving = 0
slots = 96
slotsH = 120
invLabelsTable = {}
dragitem = 0
infoitem = 0
infolabel = nil
descrname = false
descrtype = "Jedzenie"
descr = "Przywraca głód."
inventoryShowing = false
loot = false
--lootname = "Окружение"
boxesLabels = {}
invWeapLabelsTable = {}
colorRED = false
colorGREEN = false
colorBLUE = false
colorORANGE = false -- тут
closeInventoryWindowCrest = nil
removeWeapsWindowCrest = nil

currentAdditWeap = false
currentMainWeap = false
currentAddClothing  = false
currentLabelWeapAddit = false

function weapFitsInInventory ( curr, new )
	local xs, ys = getItemNewSlots ( curr ) or 1, 1
	local xs_new, ys_new = getItemNewSlots ( new ) or 1, 1
	local finx, finy = xs_new-xs, ys_new-ys
	if finx < 0 then finx = 0 end
	if finy < 0 then finy = 0 end
	if checkSpaceForItem ( finx, finy ) then
		return true
	end
	return false
end

function getCurrentWeaponImage()
	local weap = getPedWeapon(getLocalPlayer())
	if weap and weap > 0 then
		if weaponsTable[weap] then
			return weaponsTable[weap][1],weaponsTable[weap][2],weaponsTable[weap][3]
		end
	end
	return false
end

function startDraggingItem(key,state,source)
		if not dragging then
			dragging = true
			colorRED = false
			colorGREEN = false
			colorBLUE = false
			colorORANGE = false -- тут
			draggingMainWeap = false
			draggingAdditWeap = false
			if isElement(currentLabelSelf) then
				local row = getElementData ( currentLabelSelf, "row" )
				local column = getElementData ( currentLabelSelf, "column" )
				if inv[row][column] > 0 then
					dragitem = inv[row][column]
					if inventory[inv[row][column]][10] then
						draggingAdditWeap = inventory[inv[row][column]][1]
					end
					currentLabelOwner = 1
				end
			elseif isElement(currentLabelHim) then
				local row = getElementData ( currentLabelHim, "row" )
				local column = getElementData ( currentLabelHim, "column" )
				if invH[row][column] > 0 then
					dragitem = invH[row][column]
					if inventoryH[invH[row][column]][9] then
						draggingMainWeap = true
					end
					currentLabelOwner = 2
				end
			elseif isElement(currentLabelWeap) then
				dragitem = 1
				currentLabelOwner = 3
			elseif isElement(currentLabelWeapAddit) then
				dragitem = 1
				currentLabelOwner = 4
			end
			if not bindKey ( 'mouse1', 'up', finishDragging ) then
				bindKey ( 'mouse1', 'up', finishDragging ) 
			end
		end
end

function finishDragging ()
	if not dragging then return true end
	dragging = false
	if dragitem == 0 then
		return true
	end
	if onBoxItem and isElement ( onBoxItem ) then
		local id = getElementData ( onBoxItem, "boxLabelID" )
		if id then
			if currentLabelOwner == 2 then
				return true
			elseif currentLabelOwner == 1 then
				local xs, ys = inventory[dragitem][2], inventory[dragitem][3]
				if inventory[dragitem][8] then
					xs, ys = 1, 1
				end
				setElementData ( getLocalPlayer(), "fb"..id, inventory[dragitem][1] )
				boxesItems[id] = { inventory[dragitem][1], inventory[dragitem][4], xs, ys }
			elseif currentLabelOwner == 3 then
				local weap = getItemData (currentMainWeap)
				local xs, ys = weap[2], weap[3]
				setElementData ( getLocalPlayer(), "fb"..id, weap[1] )
				boxesItems[id] = { weap[1], weap[6], weap[2], weap[3] }
			elseif currentLabelOwner == 4 then
				local weap = getItemData (currentAdditWeap)
				local xs, ys = weap[2], weap[3]
				setElementData ( getLocalPlayer(), "fb"..id, weap[1] )
				boxesItems[id] = { weap[1], weap[6], weap[2], weap[3] }
			end
		end
		dragitem = 0
		return true
	end
	if onWeaponLabel then
		if currentLabelOwner == 2 then
			return true
		end
		for i,itemInfo in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			if inventory[dragitem][1] == itemInfo[1] then
				currentMainWeap = itemInfo[1]
				useItems(inventory[dragitem][1],"Weź pierwszą broń")
				setGlobalOff()
				dragitem = 0
				return true
			end	
		end
		for i,itemInfo in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			if inventory[dragitem][1] == itemInfo[1] then
				useItems(inventory[dragitem][1],"Weź drugą broń")
				currentAdditWeap = itemInfo[1]
				setGlobalOff()
				dragitem = 0
				return true
			end	
		end
		for i,itemInfo in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			if inventory[dragitem][1] == itemInfo[1] then
				useItems(inventory[dragitem][1],"Weź specjalną broń")
				dragitem = 0
				return true
			end	
		end
		for i,itemInfo in ipairs(inventoryItems["Weapons"]["Pistols"]) do
			if inventory[dragitem][1] == itemInfo[1] then
				useItems(inventory[dragitem][1],"Weź pistolet")
				dragitem = 0
				return true
			end	
		end
	end
	if isElement ( currentLabelSelf ) and currentLabelOwner == 2 then -- если перетаскиваем из лута в инвентарь
		local csx, csy = 1, 1
		if not inventoryH[dragitem][8] then
			csx, csy = inventoryH[dragitem][2], inventoryH[dragitem][3]
		end
		if not draggingMainWeap then
			if checkSpaceForItem ( csx, csy ) then
				moveItemInInventory ( inventoryH[dragitem][1] )
				setTimer ( refreshItemsInNewInventory, 500, 1, true )
			else
				triggerEvent("displayClientInfo",getLocalPlayer(),"inventory","Temat nie pasuje",22,255,0)
			end
		else
			if currentMainWeap then
				dropCurrentWeapon()
			end
			moveItemInInventory ( inventoryH[dragitem][1] )
		end
	elseif isElement ( currentLabelSelf ) and currentLabelOwner == 1 and colorORANGE and cur_craft_recipe then -- если крафт тут
		showRightClickCraftMenu ()
		draggingAdditWeap = false
		dragitem = 0
		return true
	elseif isElement ( currentLabelSelf ) and currentLabelOwner == 4 then -- если перетаскиваем из холодного оружия в инвентарь
		if colorGREEN then
			setElementData ( getLocalPlayer(), "currentweapon_2", "noweap" ) -- обнуляем текущее холодное оружие
			currentAdditWeap = false
			setGlobalOff()
			refreshItemsInNewInventory() -- обновляем список предметов
		end
	elseif isElement ( currentLabelWeapAddit ) and currentLabelOwner == 1 and draggingAdditWeap then -- если перетаскиваем из инвентаря в холодное оружие
		useItems(draggingAdditWeap,"Podjąć dodatkowe bronie")
	elseif isElement ( currentLabelWeap ) and currentLabelOwner == 2 then -- если перетаскиваем из лута в огнестрел
		if currentMainWeap then
			dropCurrentWeapon() -- выбрасываем текущее основное оружие
		end
		moveItemInInventory ( inventoryH[dragitem][1] )
	elseif isElement ( currentLabelHim ) and currentLabelOwner == 1 then -- если перетаскиваем из инвентаря в лут
		local csx, csy = 1, 1
		if not inventory[dragitem][8] then
			csx, csy = inventory[dragitem][2], inventory[dragitem][3]
		end
		if checkSpaceForItemH ( csx, csy ) then
			moveItemOutOfInventory ( inventory[dragitem][1] )
 			setTimer ( refreshItemsInNewInventory, 500, 1, true )
		else
			triggerEvent ("displayClientInfo",getLocalPlayer(),"inventory","Obiekt nie znajduje się w łup",22,255,0)
		end
	elseif isElement ( currentLabelHim ) and currentLabelOwner == 3 then -- если перетаскиваем из огнестрела в лут
		local weap = getItemData (currentMainWeap)
		if checkSpaceForItemH ( weap[2], weap[3] ) then
			moveItemOutOfInventory ( weap[1] )
 			setTimer ( refreshItemsInNewInventory, 500, 1, true )
		else
			triggerEvent ("displayClientInfo",getLocalPlayer(),"inventory","Obiekt nie znajduje się w łup",22,255,0)
		end
	elseif isElement ( currentLabelHim ) and currentLabelOwner == 4 then -- если перетаскиваем из огнестрела в лут
		local weap = getItemData (currentAdditWeap)
		if checkSpaceForItemH ( weap[2], weap[3] ) then
			moveItemOutOfInventory ( weap[1] )
 			setTimer ( refreshItemsInNewInventory, 500, 1, true )
		else
			triggerEvent ("displayClientInfo",getLocalPlayer(),"inventory","Obiekt nie znajduje się w łup",22,255,0)
		end
	end
	draggingAdditWeap = false
	dragitem = 0
end

function itemLabelLeaved ()
	currentLabelSelf = false
	currentLabelHim = false
	infoShowing = false
	currentLabelWeap = false
	onWeaponLabel = false
	currentLabelWeapAddit = false
	colorRED = false -- если тормозит при перемещении вещей, то убрать
	colorGREEN = false -- если тормозит при перемещении вещей, то убрать
	colorBLUE = false -- если тормозит при перемещении вещей, то убрать
	colorORANGE = false -- тут
	if isTimer ( infotimer ) then killTimer (infotimer) end
end

function checkCraftingRecipes ( items_given )
	for i, v in ipairs ( recipes ) do
		local items_passed = 0
		for b, c in ipairs ( v[1] ) do
			for d, e in ipairs ( items_given ) do
				if c[1] == e then
					items_passed = items_passed+1
				end
			end
		end
		if items_passed == #v[1] then
			colorORANGE = true
			--outputDebugString ("Рецепт "..i..": "..v[1][1].."+"..v[1][2])
			cur_craft_recipe = v
			return true
		end
	end 
end

function checkAndShowInfo ()
	if not guiGetVisible (rightclickInfoWindow) then
		infoShowing = true
	end
end

function checkDraggingColor ()
	if dragging and not colorRED and not colorGREEN and not colorBLUE then
		if currentLabelOwner == 2 and isElement ( currentLabelSelf ) then
			if draggingMainWeap and not currentMainWeap then
				colorGREEN = true
				return true
			elseif draggingMainWeap and currentMainWeap then
				colorBLUE = true
				return true
			end
			-- outputDebugString ( "DRAG INV: ")
			-- outputDebugString ( tostring(inventoryH[dragitem][1]) )
			-- outputDebugString ( tostring(fits) )
			local fits = itemFitsInInventory ( inventoryH[dragitem][1] )
			--outputDebugString ( tostring(fits) )
			if not fits then
				colorRED = true
				colorGREEN = false
				colorBLUE = false
			elseif fits then
				colorGREEN = true
				colorRED = false
				colorBLUE = false
			end
		elseif currentLabelOwner == 1 and isElement ( currentLabelHim ) then
			local fits = itemFitsInInventoryH ( inventory[dragitem][1] )
			-- outputDebugString ( "DRAG: ")
			-- outputDebugString ( tostring(inventory[dragitem][1]) )
			-- outputDebugString ( tostring(fits) )
			if not fits then
				colorRED = true
				colorGREEN = false
				colorBLUE = false
			elseif fits then
				colorGREEN = true
				colorRED = false
				colorBLUE = false
			end
		elseif currentLabelOwner == 2 and isElement ( currentLabelWeap ) and draggingMainWeap then
			colorBLUE = true
			colorRED = false
			colorGREEN = false
		elseif isElement ( currentLabelSelf ) and currentLabelOwner == 3 then
			colorRED = true
			colorBLUE = false
			colorGREEN = false
		elseif isElement ( currentLabelSelf ) and currentLabelOwner == 4 then
			local fits = itemFitsInInventoryH ( currentAdditWeap )
			if not fits then
				colorRED = true
				colorGREEN = false
				colorBLUE = false
			elseif fits then
				colorGREEN = true
				colorRED = false
				colorBLUE = false
			end
		end
	end
end

function itemLabelEntered ()
	if drawingWindowInfo then return true end
	unbindKey ( 'mouse1', 'down', startDraggingItem )
	if getElementData ( source, "weaponLabel" ) then
		onWeaponLabel = true
		return true
	elseif getElementData ( source, "weaponMainLabel" ) then
		currentLabelWeap = source
		currentLabelHim = false
		currentLabelSelf = false
		currentLabelWeapAddit = false
		checkDraggingColor()
		bindKey ( 'mouse1', 'down', startDraggingItem )
		return true
	elseif getElementData ( source, "weaponAdditLabel" ) then
		currentLabelWeap = false
		currentLabelWeapAddit = source
		currentLabelHim = false
		currentLabelSelf = false
		checkDraggingColor()
		bindKey ( 'mouse1', 'down', startDraggingItem )
		return true
	end	
	local row = getElementData ( source, "row" )
	local column = getElementData ( source, "column" )
	if getElementData ( source, "selfItemLabel" ) then
		currentLabelSelf = source
		currentLabelHim = false
		currentLabelWeap = false
		currentLabelWeapAddit = false
		if dragitem > 0 and dragitem ~= inv[row][column] and inventory[dragitem] and inventory[inv[row][column]] then
			checkCraftingRecipes({inventory[dragitem][1],inventory[inv[row][column]][1]})
		end
		checkDraggingColor()
		infotimer = setTimer ( checkAndShowInfo, 700, 1 )
		infoitem = inv[row][column]
		if infoitem > 0 then
			descrname2 = inventory[infoitem][1]
			descrtype2 = inventory[infoitem][5]
			descr2 = inventory[infoitem][6]
			descrimage2 = inventory[infoitem][4]
			descrxs2 = inventory[infoitem][2]
			descrys2 = inventory[infoitem][3]
			if inventory[infoitem][8] then
				descrxs2 = 1
				descrys2 = 1
			end
		end
	elseif getElementData ( source, "hisItemLabel" ) then	
		currentLabelHim = source
		currentLabelSelf = false
		currentLabelWeap = false
		currentLabelWeapAddit = false
		checkDraggingColor()
		infoitem = invH[row][column]
		infotimer = setTimer ( checkAndShowInfo, 700, 1 )
		if infoitem > 0 then
			descrname2 = inventoryH[infoitem][1]
			descrtype2 = inventoryH[infoitem][5]
			descr2 = inventoryH[infoitem][6]
			descrimage2 = inventoryH[infoitem][4]
			descrxs2 = inventoryH[infoitem][2]
			descrys2 = inventoryH[infoitem][3]
			if inventoryH[infoitem][8] then
				descrxs2 = 1
				descrys2 = 1
			end
		end
	end
	bindKey ( 'mouse1', 'down', startDraggingItem )
	--local row = getElementData ( source, "row" )
	--local column = getElementData ( source, "column" ) 2lximaew
end

function rightMenuLabelClicked ( key )
	if key == "right" and not drawingWindowInfo then
		if getElementData ( source, "weaponMainLabel" ) then
			local info = getItemData ( currentMainWeap )
			if info then
				descrname = info[1]
				descrtype = info[4]
				descr = info[5]
				descrimage = info[6]
				descrxs = info[2]
				descrys = info[3]
				showRightClickInfoMenu()
			end
			return true
		elseif getElementData ( source, "weaponAdditLabel" ) then
			local info = getItemData ( currentAdditWeap )
			if info then
				descrname = info[1]
				descrtype = info[4]
				descr = info[5]
				descrimage = info[6]
				descrxs = info[2]
				descrys = info[3]
				showRightClickInfoMenu()
			end
			return true
		end
		hideRightClickInventoryMenu()
		if isElement(currentLabelSelf) then
			local row = getElementData ( currentLabelSelf, "row" )
			local column = getElementData ( currentLabelSelf, "column" )
			if inv[row][column] == 0 or #inventory[inv[row][column]] == 0 then
				return true
			end
			descrname = inventory[inv[row][column]][1]
			descrtype = inventory[inv[row][column]][5]
			descr = inventory[inv[row][column]][6]
			descrimage = inventory[inv[row][column]][4]
			descrxs = inventory[inv[row][column]][2]
			descrys = inventory[inv[row][column]][3]
			if inventory[inv[row][column]][8] then
				descrxs = 1
				descrys = 1
			end
			local itemName,itemInfo = getInventoryInfosForRightClickMenu(inventory[inv[row][column]][1])
			if itemInfo then
				local no = false
				if not no then
					local xs,ys = inventory[inv[row][column]][2],inventory[inv[row][column]][3]
					if inventory[inv[row][column]][8] then
						xs,ys = 1, 1
					end
					showRightClickInventoryMenu (itemName,itemInfo,inventory[inv[row][column]][4],xs,ys)
				end
			end
		elseif isElement(currentLabelHim) then
			local row = getElementData ( currentLabelHim, "row" )
			local column = getElementData ( currentLabelHim, "column" )
			if invH[row][column] == 0 or #inventoryH[invH[row][column]] == 0 then
				return true
			end
			showRightClickTakeMenu()
			descrname = inventoryH[invH[row][column]][1]
			descrtype = inventoryH[invH[row][column]][5]
			descr = inventoryH[invH[row][column]][6]
			descrimage = inventoryH[invH[row][column]][4]
			descrxs = inventoryH[invH[row][column]][2]
			descrys = inventoryH[invH[row][column]][3]
			if inventoryH[invH[row][column]][8] then
				descrxs = 1 
				descrys = 1
			end
		end
		showRightClickInfoMenu()
	end
end

function createLabelsInventory ()
	if inv then
		for i = 1, #inv do 
			for b = 1, #inv[i] do
				local createdLabel = guiCreateLabel ( x+174+32*b, y-210+32*(i-1)+globalOff, 32, 32, '', false )
				setElementData ( createdLabel, 'selfItemLabel', true )
				setElementData ( createdLabel, 'row', i )
				setElementData ( createdLabel, 'column', b )
				addEventHandler( "onClientMouseLeave", createdLabel, itemLabelLeaved, false )
				addEventHandler( "onClientMouseEnter", createdLabel, itemLabelEntered, false )
				addEventHandler( "onClientGUIClick", createdLabel, rightMenuLabelClicked, false )
				table.insert ( invLabelsTable, createdLabel )
			end
		end
	end
	if invH then
		for i = 1, #invH do 
			for b = 1, #invH[i] do
				local createdLabel = guiCreateLabel ( x-582+32*b, y-270+32*(i-1), 32, 32, '', false )
				setElementData ( createdLabel, 'hisItemLabel', true )
				setElementData ( createdLabel, 'row', i )
				setElementData ( createdLabel, 'column', b )
				addEventHandler( "onClientMouseLeave", createdLabel, itemLabelLeaved, false )
				addEventHandler( "onClientMouseEnter", createdLabel, itemLabelEntered, false )
				addEventHandler( "onClientGUIClick", createdLabel, rightMenuLabelClicked, false )
				table.insert ( invLabelsTable, createdLabel )
			end
		end
	end
	local createdLabel = guiCreateLabel ( x-200, y+70, 395, 210, '', false )
	setElementData ( createdLabel, 'weaponLabel', true )
	addEventHandler( "onClientMouseLeave", createdLabel, itemLabelLeaved, false )
	addEventHandler( "onClientMouseEnter", createdLabel, itemLabelEntered, false )
	table.insert ( invLabelsTable, createdLabel )
	createWeapLabelsInventory()
end

function createWeapLabelsInventory ()
	if currentAdditWeap then
		local xs = 64+64*(math.floor(currentAdditWeapX/currentAdditWeapY)-1)
		local createdLabel = guiCreateLabel ( x+205, y-270, 340, 64, '', false )
		setElementData ( createdLabel, 'weaponAdditLabel', true )
		addEventHandler( "onClientMouseLeave", createdLabel, itemLabelLeaved, false )
		addEventHandler( "onClientMouseEnter", createdLabel, itemLabelEntered, false )
		addEventHandler( "onClientGUIClick", createdLabel, rightMenuLabelClicked, false )
		table.insert ( invWeapLabelsTable, createdLabel )
	end
	if currentMainWeap then
		local xs = 64+64*(math.floor(currentMainWeapX/currentMainWeapY)-1)
		local yoff = 0
		if currentAdditWeap then
			yoff = 80
		end
		local createdLabel = guiCreateLabel ( x+205, y-270+yoff, 340, 64, '', false )
		setElementData ( createdLabel, 'weaponMainLabel', true )
		addEventHandler( "onClientMouseLeave", createdLabel, itemLabelLeaved, false )
		addEventHandler( "onClientMouseEnter", createdLabel, itemLabelEntered, false )
		addEventHandler( "onClientGUIClick", createdLabel, rightMenuLabelClicked, false )
		table.insert ( invWeapLabelsTable, createdLabel )
	end
end

function moveItemInInventory(itemName)
	if isPlayerInLoot() then
		if getElementData(isPlayerInLoot(), itemName) and getElementData(isPlayerInLoot(), itemName) >= 1 then
			if not isToolbeltItem(itemName) then
				if not playerMovedInInventory then
					triggerEvent("onPlayerMoveItemInInventory", getLocalPlayer(), itemName, isPlayerInLoot())
					playerMovedInInventory = true
					setTimer(function()
						playerMovedInInventory = false
					end, 700, 1)
				else
					triggerEvent("displayClientInfo",getLocalPlayer(),"Inventory","Nadużywanie prowadzi do zakazu!",225,22,0)
					return true
				end
			else
				playerMovedInInventory = true
				 setTimer(function()
					 playerMovedInInventory = false
				end, 700, 1)
				triggerEvent("onPlayerMoveItemInInventory", getLocalPlayer(), itemName, isPlayerInLoot())
			end
		end
	end
	-- if isPlayerInLoot() then
		-- local col = getElementData(getLocalPlayer(), "currentCol")
		-- setTimer(refreshItemsInNewInventory, 200, 2)
	-- end
end

function itemFitsInInventory(itemName)
	local xs, ys = getItemNewSlots(itemName) or 1,1
	if xs and ys then
		if checkSpaceForItem ( xs, ys ) then
			return true
		end
		return false
	end	
	return false
end

function itemFitsInInventoryH ( itemName )
	local xs, ys = getItemNewSlots ( itemName ) 
	if xs and ys then
		if checkSpaceForItemH ( xs, ys ) then
			return true
		end
		return false
	end	
	return false
end



function checkSpaceForItem ( xs, ys )
	if ys > #inv then
		return false
	end
	if weight+xs*ys > slots then
		return false
	end
	for yt = 1, #inv do -- columns
		for xt = 1, #inv[yt] do
			nospace = false
			if not inv[yt][xt] then
				break
			end
			local tempnum = inv[yt][xt]
			for z = 1, ys do
				for p = 1, xs do
					if #inv < yt+z-1 or #inv[yt+z-1] < xt+p-1 then
						nospace = true
						break
					end
					if inv[yt+z-1][xt+p-1] then
						tempnum = tempnum+inv[yt+z-1][xt+p-1]
					else
						nospace = true
						break
					end
				end
				if nospace then
					break
				end
			end
			if tempnum == 0 then
				return true
			end
		end
	end
	return false
end

function checkSpaceForItemH ( xs, ys )
	if ys > #invH then
		return false
	end
	if weightH+xs*ys > slotsH then
		return false
	end
	for yt = 1, #invH do -- columns
		for xt = 1, #invH[yt] do
			local nospace = false
			local tempnum = invH[yt][xt]
			for z = 1, ys do
				if yt+z-1 > #invH then
					nospace = true
					break
				end
				for p = 1, xs do
					if invH[yt+z-1][xt+p-1] then
						tempnum = tempnum+invH[yt+z-1][xt+p-1]
					else
						nospace = true
						break
					end
				end
				if nospace then
					break
				end
			end
			if tempnum == 0 then
				return true
			end
		end
	end
	return false
end

function calculateItemsPositions ()
	itemsPositions = {}
	inv = {}
	for i = 1, columns do
		if i~= columns then
			local temptable = {}
			for b = 1, rows do
				table.insert ( temptable, 0 )
			end
			table.insert ( inv, temptable )
		else
			local temptable = {}
			for b = 1, rlr do
				table.insert ( temptable, 0 )
			end
			table.insert ( inv, temptable )
		end
	end
	for i = 1, #inventory do
		local xtemp, ytemp, yt = 1, 1, 1
		local xs, ys = inventory[i][2], inventory[i][3]
		if inventory[i][8] then
			xs, ys = 1, 1
		end
		local nospacefin = true
		local noneed = false
		if weight+xs*ys > slots then
			nospacefin = true
			noneed = true
		end
		if not noneed then
			if xs == 1 and ys == 1 then
				noneed = true
				for xt = 1, 10 do
					for yt = 1, #inv do
						if #inv[yt] >= xt then
							if inv[yt][xt] == 0 then
								xtemp = xt
								ytemp = yt
								nospacefin = false
								break
							end
						end
					end
					if not nospacefin then
						break
					end
				end
			end
		end
		if not noneed then
			for yt = 1, #inv do -- columns
				comeetToBreak = false
				for xt = 1, #inv[yt] do
					nospace = false
					if not inv[yt][xt] then
						nospace = true
						break
					end
					local tempnum = inv[yt][xt]
					for z = 1, ys do
						if yt+z-1 > #inv then
							--finNoSpace = true
							nospace = true
							break
						end
						for p = 1, xs do
							if xt+p-1 > #inv[yt+z-1] then
								nospace = true
								break
							end
							if inv[yt+z-1][xt+p-1] then
								tempnum = tempnum+inv[yt+z-1][xt+p-1]
							else
								nospace = true
								break
							end
						end
					end
					if tempnum == 0 and not nospace then
						xtemp = xt
						ytemp = yt
						nospacefin = false
						comeetToBreak = true
						break
					--elseif nospace then
						--break
					end
				end
				if comeetToBreak then
					break
				end
			end
		end
		if not nospacefin then
			for z = 1, ys do
				for p = 1, xs do
					inv[ytemp+z-1][xtemp+p-1] = i
				end
			end
			weight = weight+xs*ys
			--outputDebugString ( weight )
			table.insert ( itemsPositions, { i, xtemp, ytemp, xs, ys } )
		end
	end
end

function calculateItemsPositionsH ()
	itemsPositionsH = {}
	invH = {}
	for i = 1, columnsH do
		if i~= columnsH then
			local temptable = {}
			for b = 1, rowsH do
				table.insert ( temptable, 0 )
			end
			table.insert ( invH, temptable )
		else
			local temptable = {}
			for b = 1, rlrH do
				table.insert ( temptable, 0 )
			end
			table.insert ( invH, temptable )
		end
	end
	for i = 1, #inventoryH do
		local xtemp, ytemp, yt = 1, 1, 1
		local xs, ys = inventoryH[i][2], inventoryH[i][3]
		if inventoryH[i][8] then
			xs, ys = 1, 1
		end
		local nospacefin = true
		local noneed = false
		if weightH+xs*ys > slotsH then
			nospacefin = true
			noneed = true
		end
		if not noneed then
			if xs == 1 and ys == 1 then
				noneed = true
				for xt = 1, 10 do
					for yt = 1, #invH do
						if #invH[yt] >= xt then
							if invH[yt][xt] == 0 then
								xtemp = xt
								ytemp = yt
								nospacefin = false
								break
							end
						end
					end
					if not nospacefin then
						break
					end
				end
			end
		end
		if not noneed then
			for yt = 1, #invH do -- columns yt - количество строк (высота)
				comeetToBreak = false -- xt - количество столбцов (ширина)
				for xt = 1, #invH[yt] do
					local nospace = false
					local tempnum = invH[yt][xt]
					for z = 1, ys do
						if yt+z-1 > #invH then
							nospace = true
							break
						end
						for p = 1, xs do
							if invH[yt+z-1][xt+p-1] then
								tempnum = tempnum+invH[yt+z-1][xt+p-1]
							else
								nospace = true
								break
							end
						end
					end
					if tempnum == 0 and not nospace then
						xtemp = xt
						ytemp = yt
						nospacefin = false
						comeetToBreak = true
						break
					--elseif nospace then
					--	outputDebugString ( inventoryH[i][1]..": "..tempnum )
						--break
					end
				end
				if comeetToBreak then
					break
				end
			end
		end
		if not nospacefin then
			for z = 1, ys do
				for p = 1, xs do
					invH[ytemp+z-1][xtemp+p-1] = i
				end
			end
			weightH=weightH+xs*ys
			table.insert ( itemsPositionsH, { i, xtemp, ytemp, xs, ys } )
		end
	end
end

function drawItemsInSack()
	local weap3 = getElementData ( getLocalPlayer(), "currentweapon_3" ) or "nowear"
	local weap4 = getElementData ( getLocalPlayer(), "currentweapon_4" ) or "noweap"
	for i, item in ipairs ( itemsPositions ) do
		if inventory[item[1]][8] then
			dxDrawImage(x+173+32*item[2], y-242+32*item[3]+globalOff, 32, 32, "icons/"..inventory[item[1]][4])
			dxDrawText(inventory[item[1]][3], x+175+32*item[2], y-242+32*item[3]+globalOff, x-582+32*item[2]+32, y-242+32*item[3]+32, tocolor(255,255,255,255), 1, "default", "left", "top", false, false, false, false, false)
--		elseif inventory[item[2]][1] then
--			dxDrawImage(x+173+32*item[2], y-242+32*item[3]+globalOff, 32*item[4], 32*item[5], "icons/"..inventory[item[1]][4])
--			dxDrawText(inventory[item[1]][3], x+175+32*item[2], y-242+32*item[3]+globalOff, x-582+32*item[2]+32, y-242+32*item[3]+32, tocolor(255,255,255,255), 1, "default", "left", "top", false, false, false, false, false)
		else
			local using = false
			if weap3 == inventory[item[1]][1] then
				using = true
			elseif weap4 == inventory[item[1]][1] then
				using = true
			end--262
			if using then
				local xs, ys = 32, 32
				if item[4] == 2 and item[5] == 2 then
					xs, ys = 64, 64
				end
				dxDrawImage(x+173+32*item[2], y-242+32*item[3]+globalOff, xs, ys, "images/use.png")
			end
			dxDrawImage(x+173+32*item[2], y-242+32*item[3]+globalOff, 32*item[4], 32*item[5], "icons/"..inventory[item[1]][4])
		end
	end
	for i, item in ipairs ( itemsPositionsH ) do
		if inventoryH[item[1]][8] then
			dxDrawImage(x-582+32*item[2], y-262+32*item[3], 32, 32, "icons/"..inventoryH[item[1]][4])
			dxDrawText(inventoryH[item[1]][3], x-580+32*item[2], y-262+32*item[3], x-582+32*item[2]+32, y-262+32*item[3]+32, tocolor(255,255,255,255), 1, "default", "left", "top", false, false, false, false, false)
		else
			dxDrawImage(x-582+32*item[2], y-302+32*item[3], 32*item[4], 32*item[5], "icons/"..inventoryH[item[1]][4])
		end
	end
end

-- function drawWindowInfo ()
	-- dxDrawRectangle(x-250, y-175, 500, 350, tocolor(0,0,0,100)) 
-- end
	
drawingWindowInfo = false
	
function drawWindowInfo ()
	dxDrawRectangle(x-300, y-200, 600, 400, tocolor(0,0,0,180)) 
	dxDrawRectangle(x-300, y-200, 600, 20, tocolor(0,0,0,250)) 
	dxDrawText("Осмотр", x-295, y-197, 200, 20, tocolor(255,255,255,255), 1, "clear", "left", "top", false, false, true, false, false)
	local xsize, ysize = 64+64*descrxs, 64+64*descrys
	local ystart = -50
	if descrxs == 1 and descrys == 1 then
		xsize, ysize = xsize*2, ysize*2
	end
	if descrxs > descrys then
		ystart = 0
	elseif descrys > descrxs then
		ystart = 0
	end
	dxDrawImage ( x, y-70+ystart, xsize, ysize, "icons/"..descrimage )
	dxDrawText(descrname, x-290, y-170, x, y, tocolor(255,255,255,255), 2, "clear", "left", "top", false, false, true, false, false)
	dxDrawText(descrtype, x-290, y-140, x, y, tocolor(55,255,0,255), 1.2, "clear", "left", "top", false, false, true, false, false)
	dxDrawText(descr, x-290, y-100, x-100, y+200, tocolor(255,255,255,255), 1.4, "default", "left", "top", false, true, true, false, false)
end	
	
function mainDrawing()
	if drawingWindowInfo then
		drawWindowInfo()
		return true
	end
	dxDrawRectangle(0, 0, wx, hy, tocolor(0,0,0,50))

	dxDrawRectangle(x-550, y-290, 340, 20, tocolor(0,0,0,250))
	dxDrawRectangle(x-200, y-290, 395, 20, tocolor(0,0,0,250))

	dxDrawRectangle(x+205, y-290, 340, 20, tocolor(0,0,0,250))
	dxDrawRectangle(x-200, y+50, 395, 20, tocolor(0,0,0,250))

	dxDrawRectangle(x-550, y-270, 340, 550, tocolor(0,0,0,70))
	dxDrawRectangle(x-200, y-270, 395, 330, tocolor(0,0,0,190))

	dxDrawRectangle(x-200, y+70, 395, 210, tocolor(0,0,0,70))
	dxDrawRectangle(x+205, y-270, 340, 550, tocolor(0,0,0,70))
	
	dxDrawImage ( x-210, y-315, 410, 410, "icons/ped.png" )

	if draggingUseItem then
		local xsize, ysize = 128, 128
		local xstart = 30
		if draggingUseItemX > draggingUseItemY then
			xsize = 256
			xstart = 0
		elseif draggingUseItemY > draggingUseItemX then
			xsize = 64
		end
		dxDrawImage ( x-115+xstart, y+100, xsize, ysize, "icons/"..draggingUseItem )
	elseif getPedWeapon ( getLocalPlayer() ) >= 1 then
		local image, xs, ys = getCurrentWeaponImage()
		local xsize, ysize = 128, 128
		local xstart = 30
		if xs > ys then
			xsize = 256
			xstart = 0
		elseif ys > xs then
			xsize = 64
		end
		dxDrawImage ( x-115+xstart, y+100, xsize, ysize, "icons/"..getCurrentWeaponImage() )
	end
	
	
	--Plecak
	dxDrawRectangle(x+205, y-270+globalOff, 340, 60, tocolor(rblock,gblock,bblock,blockalpha))
	dxDrawLine(x+205, y-270+globalOff, x+545, y-270+globalOff, tocolor(150,150,150,35),1,false)
	dxDrawLine(x+205, y-211+globalOff, x+545, y-211+globalOff, tocolor(150,150,150,35),1,false)
	if sackImage then
		dxDrawImage ( x+213, y-263+globalOff, 48, 43, "icons/"..sackImage )
	end
	dxDrawText(sackName, x+275, y-250+globalOff, 200, 20, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, true, false, false)
	dxDrawText(weight.."/"..slots, x+500, y-268+globalOff, 200, 20, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, true, false, false)
	
	-- окружение
--	dxDrawRectangle(x-550, y-270, 340, 40, tocolor(50,50,50,255))
--	if isPlayerInLoot () then
--		dxDrawRectangle(x-550, y-270, 340, 40, tocolor(50,50,50,255))
--		dxDrawText(lootname, x-535, y-260, 200, 20, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, true, false, false)
--		dxDrawText(weightH.."/"..slotsH, x-285, y-268, 200, 20, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, true, false, false)
--	else
--		dxDrawText("ОКРУЖЕНИЕ", x-535, y-260, 200, 20, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, true, false, false)
--	end
	--dxDrawText(weight.."/"..slots, x+500, y-268, 200, 20, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, true, false, false)
	
	for i = 1, #inv do 
		for b = 1, #inv[i] do
			local rc,gc,bc,ac = rslot, gslot, bslot, aslot
			if not inv[i][b] or inv[i][b] == 0 then
				rc,gc,bc,ac = rslotf, gslotf, bslotf, aslotf
			end
			dxDrawRectangle(x+173+32*b, y-210+32*(i-1)+globalOff, 32, 32, tocolor(rc,gc,bc,ac))
		end
	end
	dxDrawLine(x+205,y-210,x+205,y-210+32*#inv,tocolor (0,0,0,80),1)
	for i = 1, #inv do 
		for b = 1, #inv[i] do
			if b == #inv[i] then
				dxDrawLine(x+205+32*b,y-210+32*(i-1)+globalOff,x+205+32*b,y-178+32*(i-1)+globalOff,tocolor (0,0,0,80),1)
			elseif inv[i][b] ~= inv[i][b+1] or inv[i][b+1] == 0 then
				dxDrawLine(x+205+32*b,y-210+32*(i-1)+globalOff,x+205+32*b,y-178+32*(i-1)+globalOff,tocolor (0,0,0,80),1)
			end
			if i~= #inv then
				if inv[i][b] ~= inv[i+1][b] or inv[i+1][b] == 0 then
					dxDrawLine(x+173+32*b,y-178+32*(i-1)+globalOff,x+205+32*b,y-178+32*(i-1)+globalOff,tocolor (0,0,0,80),1)
				end
			end
		end
	end
	-- ОтRyżовка клеток окружения
	if loot then
		for i = 1, #invH do 
			for b = 1, #invH[i] do
				local rc,gc,bc,ac = rslot, gslot, bslot, aslot
				if not invH[i][b] or invH[i][b] == 0 then
					rc,gc,bc,ac = rslotf, gslotf, bslotf, aslotf--0
				end
				dxDrawRectangle(x-582+32*b, y-270+32*(i-1), 32, 32, tocolor(rc,gc,bc,ac))
				--dxDrawLine(x-582+32*b,y-230+32*(i-1),x-550+32*b,y-230+32*(i-1),tocolor (0,0,0,80))
				--dxDrawLine(x-582+32*b,y-230+32*(i-1),x-582+32*b,y-198+32*(i-1),tocolor (0,0,0,80))
			end
		end
		for i = 1, #invH do 
			for b = 1, #invH[i] do
				if b == #invH[i] then
					dxDrawLine(x-550+32*b,y-270+32*(i-1),x-550+32*b,y-238+32*(i-1),tocolor (0,0,0,80),1)
				elseif invH[i][b] ~= invH[i][b+1] or invH[i][b+1] == 0 then
					dxDrawLine(x-550+32*b,y-270+32*(i-1),x-550+32*b,y-238+32*(i-1),tocolor (0,0,0,80),1)
				end
				if i~= #invH then
					if invH[i][b] ~= invH[i+1][b] or invH[i+1][b] == 0 then
						dxDrawLine(x-582+32*b,y-238+32*(i-1),x-550+32*b,y-238+32*(i-1),tocolor (0,0,0,80),1)
					end
				end
			end
		end
	end
	-- ОтRyżовка клеток окружения

	-- отRyżовка статсов dxGetTextWidth ( string text, [float scale=1, mixed font="default"] )
		local tmptable = {}
		local temperature = math.round(getElementData(getLocalPlayer(),"temperature"),2)
		if temperature < 36 then
			table.insert (tmptable,7)
		elseif temperature > 38 and temperature < 41 then
			table.insert (tmptable,8)
		end
		if getElementData(getLocalPlayer(),"bleeding") > 0 then
			table.insert (tmptable,6)
		end
		if getElementData(getLocalPlayer(), "sepsis") then
			table.insert (tmptable,5)
		end
		if getElementData(getLocalPlayer(),"liquid") < 400 then
			table.insert (tmptable,2)
		end
		if getElementData(getLocalPlayer(),"calories") < 400 then
			table.insert (tmptable,1)
		end
		if getElementData(getLocalPlayer(),"pain") then
			table.insert (tmptable,4)
		end
		if getElementData(getLocalPlayer(), "intoxicaiton") then
			table.insert (tmptable,3)
		end
		if getElementData(getLocalPlayer(), "brokenbone") then
			table.insert (tmptable,9)
		end
		for i = 1, #tmptable do 
			local textw = dxGetTextWidth(statsTable[tmptable[i]],1,"arial")+20
			dxDrawText(statsTable[tmptable[i]], x+(175-textw), y-275+30*i, x+175, y-250+30*i, tocolor(rstat, gstat, bstat, astat), 1, "arial", "center", "center", false, false, true, false, false)
			dxDrawRectangle(x+(175-textw), y-275+30*i, textw, 25, tocolor(rstatb, gstatb, bstatb, astatb))
		end
	-- отRyżовка статсов
	
	
	-- Оружие
	if currentAdditWeap then
		local xoff_w = math.floor(currentAdditWeapX/currentAdditWeapY)-1
		local xs = 64+64*xoff_w
		if xoff_w < 0 then
			xs = 64
		end
--		local xs =64+64*(math.floor(currentAdditWeapX/currentAdditWeapY)-1)
		dxDrawRectangle(x+205, y-270, xs, 64, tocolor(rblock,gblock,bblock,blockwalpha))
		dxDrawLine(x+205, y-207, x+205+xs, y-207, tocolor(150,150,150,35),1,false)
		dxDrawLine(x+205+xs, y-270, x+205+xs, y-207, tocolor(150,150,150,35),1,false)
		dxDrawImage(x+205, y-270,  xs, 64, "icons/"..currentAdditWeapImage)
	end
	if currentMainWeap then
		local xoff_w = math.floor(currentMainWeapX/currentMainWeapY)-1
		local xs = 22+22*xoff_w
		local yoff = 0
		if currentAdditWeap then
			yoff = 80
		end
		dxDrawRectangle(x+205, y-270+yoff, 340, 64, tocolor(rblock,gblock,bblock,blockwalpha))
		dxDrawLine(x+205, y-270+yoff, x+545, y-270+yoff, tocolor(150,150,150,35),1,false)
		dxDrawLine(x+205, y-207+yoff, x+545, y-207+yoff, tocolor(150,150,150,35),1,false)
		dxDrawImage(x+215, y-250+yoff,  xs, 22, "icons/"..currentMainWeapImage )
		dxDrawText(currentMainWeap, x+225+xs, y-270+yoff, x+315+xs, y-206+yoff, tocolor(255, 255, 255, 255), 1, "default-bold", "left", "center", false, false, true, false, false)
	end
	--
	drawItemsInSack()
	drawDraggingInfo()
	dxDrawText("Przeciwnik", x-545, y-287, 340, 20, tocolor(160,160,160,255), 1, "default", "left", "top", false, false, true, false, false)
	dxDrawLine(x-550, y-270, x-210, y-270, tocolor(150,150,150,80),1,false)
	dxDrawLine(x-550, y-270, x-550, y+280, tocolor(150,150,150,90),1,false)
	dxDrawLine(x-211, y-270, x-211, y+281, tocolor(150,150,150,90),1,false)
	dxDrawLine(x-550, y+280, x-210, y+280, tocolor(150,150,150,85),1,false)
	dxDrawText("Gracz", x-195, y-287, 340, 20, tocolor(160,160,160,255), 1, "default", "left", "top", false, false, true, false, false)
	dxDrawText("W rece", x-195, y+53, 340, 20, tocolor(160,160,160,255), 1, "default", "left", "top", false, false, true, false, false)
	dxDrawLine(x-200, y+70, x+195, y+70, tocolor(150,150,150,80),1,false)
	dxDrawLine(x-200, y+70, x-200, y+280, tocolor(150,150,150,90),1,false)
	dxDrawLine(x+194, y+70, x+194, y+280, tocolor(150,150,150,90),1,false)
	dxDrawLine(x-200, y+280, x+195, y+280, tocolor(150,150,150,85),1,false)
	dxDrawText("Inwentarz", x+210, y-287, 340, 20, tocolor(160,160,160,255), 1, "default", "left", "top", false, false, true, false, false)
	dxDrawLine(x+205, y-270, x+545, y-270, tocolor(150,150,150,80),1,false)
	dxDrawLine(x+205, y-270, x+205, y+280, tocolor(150,150,150,90),1,false)
	dxDrawLine(x+544, y-270, x+544, y+280, tocolor(150,150,150,90),1,false)
	dxDrawLine(x+205, y+280, x+545, y+280, tocolor(150,150,150,85),1,false)
end--)
-- infoShowing = true
-- infoitem = 1


function drawDraggingInfo ()
	if dragging then
		if dragitem > 0 then
			local xc,yc = getCursorPosition ()
			local xc,yc = xc*wx, yc*hy
			local xs, ys = 1, 1
			local image = false
			local name = false
			if currentLabelOwner == 1 then
				xs, ys = inventory[dragitem][2], inventory[dragitem][3]
				if inventory[dragitem][8] then
					xs, ys = 1, 1
				end
				image = inventory[dragitem][4]
				name = inventory[dragitem][1]
			elseif currentLabelOwner == 2 then
				xs, ys = inventoryH[dragitem][2], inventoryH[dragitem][3]
				if inventoryH[dragitem][8] then
					xs, ys = 1, 1
				end
				image = inventoryH[dragitem][4]
				name = inventoryH[dragitem][1]
			elseif currentLabelOwner == 3 then
				local weap = getItemData (currentMainWeap)
				xs, ys = weap[2], weap[3]
				image = weap[6]
				name = weap[1]
			elseif currentLabelOwner == 4 then
				local weap = getItemData (currentAdditWeap)
				xs, ys = weap[2], weap[3]
				image = weap[6]
				name = weap[1]
			end
			if image then
				local r,g,b,a = rgreen,ggreen,bgreen,agreen
				if colorRED then
					r,g,b,a = rred,gred,bred,ared
				elseif colorGREEN then
					r,g,b,a = rgreen,ggreen,bgreen,agreen
				elseif colorBLUE then
					r,g,b,a = rblue,gblue,bblue,ablue
				elseif colorORANGE then
					r,g,b,a = rorange,gorange,borange,aorange
				end
				dxDrawRectangle(xc, yc, 54*xs, 54*ys, tocolor(r,g,b,a))
				dxDrawImage(xc, yc, 54*xs, 54*ys, "icons/"..image)
				dxDrawText(name, xc, yc-15, xc+210, yc+135, tocolor(r,g,b,a), 1.1, "arial", "left", "top", false, true, true, false, false)
				dxDrawLine(xc,yc,xc+54*xs,yc,tocolor (0,0,0,175),1.5)
				dxDrawLine(xc,yc,xc,yc+54*ys,tocolor (0,0,0,175),1.5)
				dxDrawLine(xc,yc+54*ys,xc+54*xs,yc+54*ys,tocolor (0,0,0,175),1.5)
				dxDrawLine(xc+54*xs,yc,xc+54*xs,yc+54*ys,tocolor (0,0,0,175),1.5)
			end
		end
	elseif infoShowing then
		if infoitem > 0 then
			local xc,yc = getCursorPosition ()
			local xc,yc = xc*wx, yc*hy
			local xs, ys = 1, 1
			local image = false
			if isElement(currentLabelSelf) then
				xs, ys = inventory[infoitem][2], inventory[infoitem][3]
				image = inventory[infoitem][4]
			elseif isElement(currentLabelHim) then
				xs, ys = inventoryH[infoitem][2], inventoryH[infoitem][3]
				image = inventoryH[infoitem][4]
			end
			local xsize, ysize = 64, 64
			local ystart = 32
			if xs > ys then
				ysize = 32
				ystart = 50
			elseif ys > xs then
				ysize = 128
				ystart = 0
			end
			if image then
				dxDrawRectangle ( xc, yc, 215, 135, tocolor ( 0, 0, 0, 250 ))
				dxDrawLine(xc, yc, xc+215, yc, tocolor(250,250,250,250),1.99,false)
				dxDrawLine(xc, yc, xc, yc+135, tocolor(250,250,250,250),1.99,false)
				dxDrawLine(xc+214, yc, xc+214, yc+135, tocolor(250,250,250,250),1.99,false)
				dxDrawLine(xc, yc+135, xc+215, yc+135, tocolor(250,250,250,250),1.99,false)
				dxDrawImage( xc+4, yc+ystart, xsize-1, ysize-1, "icons/"..image)
				dxDrawText(descrname2, xc+75, yc+10, xc+190, yc+40, tocolor(255,255,255,255), 1, "default-bold", "left", "top", false, false, true, false, false)
				dxDrawText(descrtype2, xc+75, yc+25, xc+190, yc+115, tocolor(25,250,25,250), 0.8, "sans", "left", "top", false, false, true, false, false)
				dxDrawText(descr2, xc+75, yc+47, xc+210, yc+135, tocolor(255,255,255,250), 0.8, "sans", "left", "top", false, true, true, false, false)
			end
		end
	end
end


function showInventory ()
	if getElementData ( getLocalPlayer(), "logedin" ) then
		if not inventoryShowing then
			showNewInventory()
			triggerEvent("disableMenu", getRootElement())
			showChat(false)
			exports.gps:showGPS(false)
			setPedWeaponSlot(getLocalPlayer(), 0)
		else
			showChat ( true )
			unShowNewInventory()
			if getElementData(getLocalPlayer(),"GPS") > 0 then
				exports.gps:showGPS(not show)
			end
		end
	end
end
bindKey("j", "up", showInventory)

function showNewInventoryManual ()
	showNewInventory()
end

function removeAllWeaps()
	setPedWeaponSlot(getLocalPlayer(), 0)
end

function showNewInventory ()
	triggerServerEvent("backpackGroundOpen", getLocalPlayer())
	inventoryShowing = true 
	showChat(false)
	slots = getElementData ( getLocalPlayer(), "MAX_Slots" )
	inv = {}
	invH = {}
	weight = 0
	weightH = 0
	globalOff = 0
	sackName = "Карманы"
	sackImage = false
	if sacks[slots] then
		sackName = sacks[slots][1] 
		sackImage = sacks[slots][2] 
	end
	setElementData ( getLocalPlayer(), "inventoryShowing", true )
	stillDrawing = true
	if isTimer(cancelStillDrawing) then killTimer(cancelStillDrawing) end
	--currentMainWeap = getElementData ( getLocalPlayer(), "currentweapon_1" )
	-- currentAdditWeap = getElementData ( getLocalPlayer(), "currentweapon_2" )
	-- local temp = 0
	-- if currentAdditWeap then
		-- local weap = getItemData(currentAdditWeap)
		-- if weap then
			-- temp = 80
			-- currentAdditWeapX = weap[2]
			-- currentAdditWeapY = weap[3]
			-- currentAdditWeapImage = weap[6]
		-- end
	-- end
	-- if currentMainWeap then
		-- local weap = getItemData(currentMainWeap)
		-- if weap then
			-- temp = temp+80
			-- currentMainWeapX = weap[2]
			-- currentMainWeapY = weap[3]
			-- currentMainWeapImage = weap[6]
		-- end
	-- end
	--globalOff = temp
	createBoxesLabels()
	itemmoving = 0
	dragging = false
	currentLabelSelf = false
	currentLabelHim = false
	currentLabelOwner = 0
	itemsPositions = {}
	itemsPositionsH = {}
	loot = isPlayerInLoot ()
	closeInventoryWindowCrest = exports.design:standaloneCrest(x+525,y-290,20,20,false)
	removeWeapsWindowCrest = exports.design:standaloneCrest(x+175,y+50,20,20,false)
	addEventHandler("onClientGUIClick",closeInventoryWindowCrest,unShowNewInventory,false)
	addEventHandler("onClientGUIClick",removeWeapsWindowCrest,removeAllWeaps,false)
--	lootname = getElementData(getLocalPlayer(),"lootname") or "ОКРУЖЕНИЕ"
	if loot then
		slotsH = getElementData(loot, "MAX_Slots") or 100
	else
		slotsH = 100
--		lootname = "ОКРУЖЕНИЕ"
	end
	calculateSlotsStats ()
	if placeItemsInInventory() then
		calculateItemsPositions ()
		calculateItemsPositionsH ()
	end
	createLabelsInventory()
	addEventHandler("onClientRender", root,mainDrawing)
	showCursor ( true )
end

function unShowNewInventory ()
	showChat ( true )
	hideRightClickInventoryMenu()
	removeEventHandler("onClientRender", root,mainDrawing)
	for i = 1, #invLabelsTable do
		if isElement (invLabelsTable[i]) then
			destroyElement ( invLabelsTable[i] )
		end
	end
	for i = 1, #boxesLabels do
		if isElement (boxesLabels[i]) then
			destroyElement ( boxesLabels[i] )
		end
	end
	for i = 1, #invWeapLabelsTable do
		if isElement (invWeapLabelsTable[i]) then
			destroyElement ( invWeapLabelsTable[i] )
		end
	end
	selectedBox = 0
	setElementData ( getLocalPlayer(), "inventoryShowing", false )
	unbindKey ( 'mouse1', 'up', finishDragging )
	unShowInfoMenu()
	invLabelsTable = {}
	weightH = 0
	itemmoving = 0
	currentMainWeap = false
	currentAddClothing  = false
	currentAdditWeap = false
	dragging = false
	if isElement ( closeInventoryWindowCrest ) then
		destroyElement ( closeInventoryWindowCrest )
	end
	if isElement ( removeWeapsWindowCrest ) then
		destroyElement ( removeWeapsWindowCrest )
	end
	if isTimer(cancelStillDrawing) then killTimer(cancelStillDrawing) end
	cancelStillDrawing = setTimer(function()
		stillDrawing = false
	end,panelBD,1)
	currentLabelSelf = false
	currentLabelHim = false
	currentLabelOwner = 0
	showCursor ( false )
	inventoryShowing = false
	triggerServerEvent("backpackGroundClose", getLocalPlayer())
end

function calculateWeight ()
	for i = 1, 15 do
		local num = math.random(1,#items)
		table.insert ( inventory, num )
		weight = weight+items[num][2]*items[num][3]
	end
	for i = 1, 5 do
		local num = math.random(1,#items)
		table.insert ( inventoryH, num )
		--weight = weight+items[num][2]*items[num][3]
	end
end

function calculateSlotsStats ()
	if slots > 20 then
		rows = 10
		columns = math.ceil(slots/10)
		lastrow = 10-math.abs(slots-columns*10)
		rlr = lastrow
	else
		rows = math.ceil(slots/2)
		columns = 2
		lastrow = math.abs(slots-rows*2)
		rlr = rows-lastrow
	end
	if slotsH > 20 then
		rowsH = 10
		columnsH = math.ceil(slotsH/10)
		lastrowH = 10-math.abs(slotsH-columnsH*10)
		rlrH = lastrowH
	else
		rowsH = math.ceil(slotsH/2)
		columnsH = 2
		lastrowH = math.abs(slotsH-rowsH*2)
		rlrH = rowsH-lastrowH
	end
end

function createSlotsTables ()
	for i = 1, columns do
		if i~= columns then
			local temptable = {}
			for b = 1, rows do
				table.insert ( temptable, 0 )
			end
			table.insert ( inv, temptable )
		else
			local temptable = {}
			for b = 1, rlr do
				table.insert ( temptable, 0 )
			end
			table.insert ( inv, temptable )
		end
	end
	for i = 1, columnsH do
		if i~= columnsH then
			local temptable = {}
			for b = 1, rowsH do
				table.insert ( temptable, 0 )
			end
			table.insert ( invH, temptable )
		else
			local temptable = {}
			for b = 1, rlrH do
				table.insert ( temptable, 0 )
			end
			table.insert ( invH, temptable )
		end
	end
end

function placeItemsInTables (inLoot,inInventory, weap, main, addit)
	-- outputDebugString ( weap[2])
	-- outputDebugString ( weap[3])
	--weight = weight+weap[2]*weap[3]*inInventory
	--weightH = weightH+weap[2]*weap[3]*inLoot
	for i = 1, inLoot do
		table.insert ( inventoryH, {weap[1],weap[2],weap[3],weap[6],weap[4],weap[5],weap[7], false, main or false, false } )
	end
	for i = 1, inInventory do
		table.insert ( inventory, {weap[1],weap[2],weap[3],weap[6],weap[4],weap[5],weap[7], false, false, addit or false} )
	end
end

function refreshItemsInNewInventory ()
	if not inventoryShowing then return true end
	infoitem = 0
	descrname = false
	descrtype = false
	descr = false
	descrimage = false
	descrxs = 0
	descrys = 0
	if placeItemsInInventory() then
		calculateItemsPositions ()
		calculateItemsPositionsH ()
	end
end
addEvent("refreshInventoryManual",true)
addEventHandler("refreshInventoryManual",getLocalPlayer(),refreshItemsInNewInventory)
addEvent("refreshLootManual",true)
addEventHandler("refreshLootManual",getLocalPlayer(),refreshItemsInNewInventory)

-- addEventHandler ( "onClientElementDataChange", root,
-- function ( dataName )
	-- if dataName == "currentweapon_1" then
		-- outputDebugString ( 'testo' )
	-- end
	-- if source == getLocalPlayer() then
		-- if dataName == "currentweapon_1" then
			-- outputDebugString ('changed')
			-- local data = getElementData ( getLocalPlayer(), "currentweapon_1" )
			-- if data and data == "noweap" then
				-- data = false
			-- end
			-- currentMainWeap = data
			-- setGlobalOff()
		-- elseif dataName == "currentweapon_2" then
			-- local data = getElementData ( getLocalPlayer(), "currentweapon_2" )
			-- if data and data == "noweap" then
				-- data = false
			-- end
			-- currentAdditWeap = data
			-- setGlobalOff()
		-- end
	-- end
-- end )


function placeItemsInInventory()
	weight = 0
	weightH = 0
	inventory = {}
	inventoryH = {}
	for i, weap in ipairs ( inventoryItems["Weapons"]["Primary Weapon"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		placeItemsInTables (inLoot,0,weap,true,false)
		if inInventory > 0 then
			local weapold = getElementData ( getLocalPlayer(), "currentweapon_1" ) or "noweap"
			if weapold ~= weap[1] then
				useItems(weap[1],"Weź pierwszą broń")
			end
			setElementData ( getLocalPlayer(), "currentweapon_1", weap[1] )
			currentMainWeap = weap[1]
			setGlobalOff()
		end
	end
	local currentweap_2 = getElementData ( getLocalPlayer(), "currentweapon_2" ) or "noweap"
	for i, weap in ipairs ( inventoryItems["Weapons"]["Secondary Weapon"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		if currentweap_2 == weap[1] then
			inInventory = inInventory-1
			if inInventory < 0 then
				inInventory = 0
			end
			currentAdditWeap = weap[1]
			setGlobalOff()
		end
		placeItemsInTables (inLoot,inInventory,weap,false,true)
	end
	for i, weap in ipairs ( inventoryItems["Weapons"]["Pistols"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		placeItemsInTables (inLoot,inInventory,weap,false,false)
	end
	for i, weap in ipairs ( inventoryItems["Weapons"]["Specially Weapon"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		placeItemsInTables (inLoot,inInventory,weap,false,false)
	end
	for i, weap in ipairs ( inventoryItems["Food"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		placeItemsInTables (inLoot,inInventory,weap,false,false)
	end
	for i, weap in ipairs ( inventoryItems["Items"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		placeItemsInTables (inLoot,inInventory,weap,false,false)
	end
	for i, weap in ipairs ( inventoryItems["Toolbelt"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		placeItemsInTables (inLoot,inInventory,weap,false,false)
	end
	for i, weap in ipairs ( inventoryItems["Medic"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		placeItemsInTables (inLoot,inInventory,weap,false,false)
	end
	for i, weap in ipairs ( inventoryItems["Cloting"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		placeItemsInTables (inLoot,inInventory,weap,false,false)
	end
	for i, weap in ipairs ( inventoryItems["Parts"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		placeItemsInTables (inLoot,inInventory,weap,false,false)
	end
	for i, weap in ipairs ( inventoryItems["Ammo"] ) do
		local inLoot = getThisItemInLoot (weap[1])
		for i = 1, inLoot do
			table.insert ( inventoryH, {weap[1],1,1,weap[6],weap[4],weap[5],weap[7], false, false, false } )
		end
		--if inLoot > 0 then
			--local ceilLoot = math.floor (inLoot*weap[2])
			--for i = 1, ceilLoot do
			--	table.insert ( inventoryH, {weap[1],weap[2],math.floor(1/weap[2]),weap[6],weap[4],weap[5], nil, true, false,false} )
			--end
			--table.insert ( inventoryH, {weap[1],weap[2],math.floor(inLoot-ceilLoot*weap[2]),weap[6],weap[4],weap[5], nil, true, false,false} )	
		--end
		local inInventory = getElementData ( getLocalPlayer(), weap[1] ) or 0
		if inInventory > 0 then
			local ceilInv = math.floor (inInventory*weap[2])
			for i = 1, ceilInv do
				table.insert ( inventory, {weap[1],weap[2],math.floor(1/weap[2]),weap[6],weap[4],weap[5], nil, true, false,false} )
			end
			if math.floor(inInventory-ceilInv/weap[2]) > 0 then
				table.insert ( inventory, {weap[1],weap[2],math.floor(inInventory-ceilInv/weap[2]),weap[6],weap[4],weap[5], nil, true, false,false} )
			end
			--weight = weight+math.ceil(inInventory*weap[2])
		end
	end
	sortItemsInLoot()
	sortItemsInInventory()
	return true
end

function sortItemsInLoot ()
	table.sort (inventoryH, sortFunction)
end

function sortItemsInInventory ()
	table.sort (inventory, sortFunction)
end

function sortFunction (a,b)
	local xs1, ys1 = a[2], a[3]
	if a[8] then
		xs1, ys1 = 1, 1
	end
	local xs2, ys2 = b[2], b[3]
	if b[8] then
		xs2, ys2 = 1, 1
	end
	local size1, size2 = xs1*ys1, xs2*ys2
	return size1>size2
end

function getThisItemInLoot (name)
	local loot = isPlayerInLoot()
	if isElement(loot) then
		local item = getElementData ( loot, name )
		return item or 0
	else
		return 0
	end
end

function maxSlotsChanged ()
	unShowNewInventory()
	setTimer(showNewInventory, 100, 1)
end

function setGlobalOff ()
	if not inventoryShowing then return true end
	local temp = 0
	if currentAdditWeap then
		local weap = getItemData(currentAdditWeap)
		if weap then
			temp = 80
			currentAdditWeapX = weap[2]
			currentAdditWeapY = weap[3]
			currentAdditWeapImage = weap[6]
		else
			currentAdditWeap = false
		end
	end
	if currentMainWeap then
		local weap = getItemData(currentMainWeap)
		if weap then
			temp = temp+80
			currentMainWeapX = weap[2]
			currentMainWeapY = weap[3]
			currentMainWeapImage = weap[6]
		--	currentMainWeapLabel = 
		else
			currentMainWeap = false
		end
	end
	local old = globalOff
	globalOff = temp
	if old ~= temp then
		for i = 1, #invLabelsTable do
			if isElement (invLabelsTable[i]) then
				destroyElement ( invLabelsTable[i] )
			end
		end
		for i = 1, #invWeapLabelsTable do
			if isElement (invWeapLabelsTable[i]) then
				destroyElement ( invWeapLabelsTable[i] )
			end
		end
		invWeapLabelsTable={}
		createLabelsInventory()
	end
end