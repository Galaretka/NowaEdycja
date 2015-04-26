local bx,by = wx/2, hy/2
selectedBox = 0
onBoxItem = false
boxesItems = {{},{},{},{},{},{},{},{},{},{}}
stillDrawing = false

function createBoxesLabels ()
	local start = -5*75
	for i = 1, 10 do
		local createdLabel = guiCreateLabel ( bx+start, hy-75, 70, 70, '', false )
		setElementData ( createdLabel, 'boxLabel', true )
		setElementData ( createdLabel, 'boxLabelID', i )
		addEventHandler( "onClientMouseLeave", createdLabel, boxLabelLeaved, false )
		addEventHandler( "onClientMouseEnter", createdLabel, boxLabelEntered, false )
		addEventHandler( "onClientGUIClick", createdLabel, boxLabelClicked, false )
		table.insert ( boxesLabels, createdLabel )
		start = start+75
	end
end

function boxLabelEntered ()
	if getElementData ( source, "boxLabel" ) then
		local id = getElementData ( source, "boxLabelID" ) 
		selectedBox = id
		onBoxItem = source
	end
end

function boxLabelClicked ()
	if getElementData ( source, "boxLabel" ) then
		local id = getElementData ( source, "boxLabelID" ) 
		boxesItems[id] = {}
		setElementData ( getLocalPlayer(), "fb"..id, "" )
	end
end

function boxLabelLeaved ()
	if getElementData ( source, "boxLabel" ) then
		--local id = getElementData ( source, "boxLabelID" ) 
		selectedBox = 0
		onBoxItem = false
	end
end

function drawFastBoxes ()
	local start = -5*75
	for i = 1, 10 do
		if i == selectedBox and #boxesItems[i] > 0 and stillDrawing then -- занято и выделено
			dxDrawLine(bx+start,hy-75,bx+start+70,hy-75,tocolor (200,200,200,100),1)
			dxDrawLine(bx+start+70,hy-75,bx+start+70,hy-5,tocolor (200,200,200,100),1)
			dxDrawLine(bx+start,hy-5,bx+start+70,hy-5,tocolor (200,200,200,100),1)
			dxDrawLine(bx+start,hy-75,bx+start,hy-5,tocolor (200,200,200,100),1)
			dxDrawRectangle ( bx+start, hy-75, 70, 70, tocolor ( 200, 200, 200, 150 ))
		elseif #boxesItems[i] > 0 and stillDrawing then -- занято
			dxDrawLine(bx+start,hy-75,bx+start+70,hy-75,tocolor (200,200,200,100),1)
			dxDrawLine(bx+start+70,hy-75,bx+start+70,hy-5,tocolor (200,200,200,100),1)
			dxDrawLine(bx+start,hy-5,bx+start+70,hy-5,tocolor (200,200,200,100),1)
			dxDrawLine(bx+start,hy-75,bx+start,hy-5,tocolor (200,200,200,100),1)
			dxDrawRectangle ( bx+start, hy-75, 70, 70, tocolor ( fbur, fbub, fbug, fbua ))
		elseif inventoryShowing then -- не занято
			dxDrawLine(bx+start,hy-75,bx+start+70,hy-75,tocolor (200,200,200,100),1)
			dxDrawLine(bx+start+70,hy-75,bx+start+70,hy-5,tocolor (200,200,200,100),1)
			dxDrawLine(bx+start,hy-5,bx+start+70,hy-5,tocolor (200,200,200,100),1)
			dxDrawLine(bx+start,hy-75,bx+start,hy-5,tocolor (200,200,200,100),1)
			dxDrawRectangle ( bx+start, hy-75, 70, 70, tocolor ( 0, 0, 0, 70 )) 
		end
		if #boxesItems[i] > 0 and stillDrawing then
			drawBoxItemInSlot ( i, start )
		end
		start = start+75
	end
end

function drawBoxItemInSlot ( num, coord )
	local quant = getElementData ( getLocalPlayer(), boxesItems[num][1] ) or 0
	if quant <= 0 then
		boxesItems[num] = {}
		setElementData ( getLocalPlayer(), "fb"..num, "" )
		return true
	end
	local xs, ys = boxesItems[num][3], boxesItems[num][4]
	local xsize, ysize = 64, 64
	local ystart, xstart = 0, 0 
	if xs > ys then
		ysize = 32
		ystart = 22
	elseif ys > xs then
		xsize = 32
		xstart = 22
		ystart = 0
	end
	dxDrawImage ( bx+coord+3+xstart,hy-67+ystart, xsize,ysize, "icons/"..boxesItems[num][2] )
	dxDrawText(boxesItems[num][1], bx+coord+3,hy-20, bx+coord+55, hy, tocolor(255,255,255,255), 0.8, "arial", "left", "top", true, false, false, false, false )
	dxDrawText(quant, bx+coord+58,hy-20, bx+coord+70, hy, tocolor(255,255,255,255), 0.8, "arial", "left", "top", true, false, false, false, false )
	if num == 10 then num = 0 end
	dxDrawText(num, bx+coord+3,hy-68, bx+coord+3, hy, tocolor(255,255,255,255), 0.8, "arial", "left", "top", false, false, false, false, false )
end

addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()), function(startedRes)
	bindKey("1","down",useBoxesItem,1)
	bindKey("2","down",useBoxesItem,2)
	bindKey("3","down",useBoxesItem,3)
	bindKey("4","down",useBoxesItem,4)
	bindKey("5","down",useBoxesItem,5)
	bindKey("6","down",useBoxesItem,6)
	bindKey("7","down",useBoxesItem,7)
	bindKey("8","down",useBoxesItem,8)
	bindKey("9","down",useBoxesItem,9)
	bindKey("0","down",useBoxesItem,10)
end)

function useBoxesItem ( key, state, num )
	if isTimer(cancelStillDrawing) then killTimer(cancelStillDrawing) end
	stillDrawing = true
	if #boxesItems[num] > 0 then
		local quant = getElementData ( getLocalPlayer(), boxesItems[num][1] ) or 0
		if quant <= 0 then
			boxesItems[num] = {}
			setElementData ( getLocalPlayer(), "fb"..i, "" )
			return true
		end
		local itemName,itemInfo = getInventoryInfosForRightClickMenu(boxesItems[num][1])
		if itemName and itemInfo then
			useBoxes(itemName,itemInfo)
		end
	end
	cancelStillDrawing = setTimer(function()
		stillDrawing = false
	end,panelBD,1)
end

function loadPlayerBoxesItems ()
	removeEventHandler("onClientRender",root,drawFastBoxes)
	addEventHandler("onClientRender",root,drawFastBoxes)
	for i = 1, 10 do
		local item = getElementData ( getLocalPlayer(), "fb"..i )
		if item then
			if ( getElementData ( getLocalPlayer(), item ) or 0 ) > 0 then
				local itemData = getItemData( item )
				if itemData then
					boxesItems[i] = {itemData[1], itemData[6], itemData[2], itemData[3]}
				end
			end
		end
	end
	calculateSlotsStats ()
	if placeItemsInInventory() then
		calculateItemsPositions ()
	end
end
addEventHandler( "onClientResourceStart", getResourceRootElement(getThisResource()),loadPlayerBoxesItems)