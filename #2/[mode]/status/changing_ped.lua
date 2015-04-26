elementFood = {}
elementWatter = {}

addEvent("onPlayerRequestChangingStats",true)
addEventHandler("onPlayerRequestChangingStats",getRootElement(),function(itemName,itemInfo,data)
	local source = source
	if isElementInWater(source) then return end
	local x,y,z = getElementPosition(source)
	if (data == "calories") then
		if elementFood[source] and isElement(elementFood[source]) then
			exports.bone_attach:detachElementFromBone(elementFood[source])
			destroyElement(elementFood[source])
		end
		setPedAnimation(source,"FOOD","EAT_Burger",false,false,false,false)
		if (itemName == "Pieczone mięso") then
			addPlayerStats(source,data,343)
			addPlayerStats(source,"liquid",-12)
			can_e = false
		elseif (itemName == "Otwarta puszka makaronu") then
			addPlayerStats(source,data,300)
			addPlayerStats(source,"liquid",324)
			elementFood[source] = createObject(2770,x,y,z)
			setObjectScale(elementFood[source], 1.5)
			exports.bone_attach:attachElementToBone(elementFood[source],source,12,0.02,0.06,0.11,0,90,90)
			can_e = true
		elseif (itemName == "Otwarta puszka fasoli") then
			addPlayerStats(source,data,462)
			addPlayerStats(source,"liquid",330)
			elementFood[source] = createObject(2601,x,y,z)
			setObjectScale(elementFood[source], 1.5)
			exports.bone_attach:attachElementToBone(elementFood[source],source,12,-0.02,0.06,0.1,0,90,0)
			can_e = true
		elseif (itemName == "Surowe mięso") then
			addPlayerStats(source,data,233)
			addPlayerStats(source,"liquid",12)
			can_e = false
		elseif (itemName == "Otwarta puszka sardynek") then
			addPlayerStats(source,data,475)
			addPlayerStats(source,"liquid",96)
			elementFood[source] = createObject(2768,x,y,z)
			setObjectScale(elementFood[source], 1.5)
			exports.bone_attach:attachElementToBone(elementFood[source],source,12,-0.01,0.05,0.08,0,90,0)
			can_e = true
		elseif (itemName == "Tuńczyk") then
			addPlayerStats(source,data,232)
			addPlayerStats(source,"liquid",144)
			can_e = false
		elseif (itemName == "Otwarty pojemnik z boczkiem") then
			addPlayerStats(source,data,107)
			addPlayerStats(source,"liquid",30)
			elementFood[source] = createObject(1546,x,y,z)
			setObjectScale(elementFood[source], 1.5)
			exports.bone_attach:attachElementToBone(elementFood[source],source,12,-0.01,0.07,0.08,0,90,90)
			can_e = true
		elseif (itemName == "Mleko w proszku") then
			addPlayerStats(source,data,728)
			addPlayerStats(source,"liquid",-292)
			elementFood[source] = createObject(2702,x,y,z)
			exports.bone_attach:attachElementToBone(elementFood[source],source,12,-0.02,0.06,0.1,0,90,0)
			can_e = false
		elseif (itemName == "Ryż") then
			addPlayerStats(source,data,743)
			addPlayerStats(source,"liquid",-333)
			elementFood[source] = createObject(2703,x,y,z)
			exports.bone_attach:attachElementToBone(elementFood[source],source,12,-0.02,0.06,0.1,0,90,0)
			can_e = false
		elseif (itemName == "Płatki") then
			addPlayerStats(source,data,806)
			addPlayerStats(source,"liquid",-180)
			elementFood[source] = createObject(2814,x,y,z)
			exports.bone_attach:attachElementToBone(elementFood[source],source,12,-0.02,0.06,0.1,0,90,0)
			can_e = false
		end
		anim = false
		setTimer(function()
			setElementData(source,itemName,getElementData(source,itemName)-1)
			if elementFood[source] and isElement(elementFood[source]) then
				exports.bone_attach:detachElementFromBone(elementFood[source])
				destroyElement(elementFood[source])
				elementFood[source] = false
			end
			if can_e then
				setElementData(source,"Pusta puszka",(getElementData(source,"Pusta puszka") or 0)+1)
			end
			triggerClientEvent(source,"refreshInventoryManual",source)
			setPedAnimation(source,false)
			anim = true
		end,3600,1)
	elseif (data == "liquid") then
		if elementWatter[source] and isElement(elementWatter[source]) then
			exports.bone_attach:detachElementFromBone(elementWatter[source])
			destroyElement(elementWatter[source])
		end
		setPedAnimation (source,"VENDING","VEND_Drink2_P",false,false,false,false)
		if (itemName == "Butelka wody") then
			addPlayerStats(source,data,450)
			elementWatter[source] = createObject(2683,x,y,z)
			exports.bone_attach:attachElementToBone(elementWatter[source],source,11,0.02,0.035,0.12,0,0,0)
			setTimer(setElementData, 3400, 1, source,"Pusta butelka po wodzie",(getElementData(source,"Pusta butelka po wodzie") or 0)+1)
			soda_e = false
		elseif (itemName == "Coca-cola") then
			addPlayerStats(source,data,330)
			addPlayerStats(source,"calories",162)
			elementWatter[source] = createObject(2647,x,y,z)
			exports.bone_attach:attachElementToBone(elementWatter[source],source,11,0.02,0.035,0.12,0,0,0)
			soda_e = true
		elseif (itemName == "Pepsi") then
			addPlayerStats(source,data,330)
			addPlayerStats(source,"calories",141)
			elementWatter[source] = createObject(2856,x,y,z)
			exports.bone_attach:attachElementToBone(elementWatter[source],source,11,0.02,0.035,0.12,0,0,0)
			soda_e = true
		elseif (itemName == "Sprite") then
			addPlayerStats(source,data,330)
			addPlayerStats(source,"calories",141)
			elementWatter[source] = createObject(1486,x,y,z)
			exports.bone_attach:attachElementToBone(elementWatter[source],source,11,0.02,0.035,0.12,0,0,0)
			soda_e = true
		elseif (itemName == "Piwo") then
			addPlayerStats(source,data,330)
			addPlayerStats(source,"calories",141)
			elementWatter[source] = createObject(1487,x,y,z)
			exports.bone_attach:attachElementToBone(elementWatter[source],source,11,0.02,0.035,0.12,0,0,0)
			soda_e = true
		elseif (itemName == "Manierka") then
			addPlayerStats(source,data,450)
			elementWatter[source] = createObject(1520,x,y,z)
			exports.bone_attach:attachElementToBone(elementWatter[source],source,11,0.02,0.06,0.1,45,180,0)
			setTimer(setElementData, 3600, 1, source,"Pusta manierka",(getElementData(source,"Pusta manierka") or 0)+1)
			soda_e = false
		end
		anim = false
		setTimer(function()
			setElementData(source,itemName,getElementData(source,itemName)-1)
			if elementWatter[source] and isElement(elementWatter[source]) then
				exports.bone_attach:detachElementFromBone(elementWatter[source])
				destroyElement(elementWatter[source])
				elementWatter[source] = false
			end
			if soda_e then
				setElementData(source,"Pusta puszka po napoju",(getElementData(source,"Pusta puszka po napoju") or 0)+1)
			end
			triggerClientEvent(source,"refreshInventoryManual",source)
			setPedAnimation(source,false)
			anim = true
		end,3600,1)
	end
	triggerClientEvent(source,"onPlayerUseLoot",source,itemName)
	local number = math.random(1,51)
	if number == 43 or number == 45 then
		setElementData(source, "intoxication", true)
	elseif number == 46 then
		setElementData(source, "worm", true)
	end
	setPedWeaponSlot(source, 0)
end)

addEvent("onPlayerUseMedicObject",true)
addEventHandler("onPlayerUseMedicObject",getRootElement(),function(itemName)
	local source = source
	if isElementInWater(source) then return end
	local x,y,z = getElementPosition(source)
	if (itemName == "Bandaż") then
		setElementData(source,"bleeding",0)
		setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	elseif (itemName == "Tetracykliny") then
		local number = math.random(1,3)
		if number == 2 then
			setElementData(source,"sepsis",false)
		end
		setPedAnimation (source,"FOOD","EAT_Burger",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	elseif (itemName == "Albendazol") then
		local number = math.random(1,3)
		if number == 2 then
			setElementData(source,"worm",false)
		end
		setPedAnimation (source,"FOOD","EAT_Burger",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	elseif (itemName == "Węgiel aktywowany") then
		local number = math.random(1,3)
			if number == 2 then
			setElementData(source,"intoxication",false)
		end
		setPedAnimation (source,"FOOD","EAT_Burger",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	elseif (itemName == "Ibuprofen") then
		local number = math.random(1,3)
		if number == 2 then
			setElementData(source,"grippe",false)
		end
		if getElementData(source,"temperature") > 37.5 then
			addPlayerStats(source,"temperature",-0.8)
		end
		setPedAnimation (source,"FOOD","EAT_Burger",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	elseif (itemName == "Apteczka") then
		local number = math.random(1,31)
		if number == 10 then
			setElementData(source,"sepsis",false)
		elseif number == 15 then
			setElementData(source,"worm",false)
		elseif number == 20 then
			setElementData(source,"intoxication",false)
		elseif number == 25 then
			setElementData(source,"grippe",false)
		end
		setElementData(source,"bleeding",0)
		addPlayerStats(source,"blood",1200)
		setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	elseif (itemName == "Ciepła paczka") then
		if getElementData(source,"temperature") < 36.7 then
			addPlayerStats(source,"temperature",0.6)
		end
		setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	elseif (itemName == "Środek przeciwbólowy") then
		setElementData(source,"pain",false)
		setPedAnimation (source,"FOOD","EAT_Burger",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	elseif (itemName == "Wódka") then
		setElementData(source,"pain",false)
		setPedAnimation (source,"VENDING","VEND_Drink2_P",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
		addPlayerStats(source,"liquid",100)
		setElementData(source,"Pusta butelka",(getElementData(source,"Pusta butelka") or 0)+1)
	elseif (itemName == "Morfina" or itemName == "Szyna") then
		setElementData(source,"brokenbone",false)
		setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	elseif (itemName == "Pakiet krwi") then
		addPlayerStats(source,"blood",5000)
		setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
		setElementData(source,itemName,getElementData(source,itemName)-1)
	end
	anim = false
	setTimer(function() anim = true end,2600,1)
	triggerClientEvent(source,"onPlayerUseLoot",source,itemName)
	triggerClientEvent(source,"refreshInventoryManual",source)
end)

addEvent("kilLDayZPlayer",true)
addEventHandler("kilLDayZPlayer",getRootElement(),function()
	if elementFood[source] and isElement(elementFood[source]) then
		exports.bone_attach:detachElementFromBone(elementFood[source])
		destroyElement(elementFood[source])
	end
	if elementWatter[source] and isElement(elementWatter[source]) then
		exports.bone_attach:detachElementFromBone(elementWatter[source])
		destroyElement(elementWatter[source])
	end
end)

addEventHandler("onPlayerQuit", getRootElement(), function()
	if elementFood[source] and isElement(elementFood[source]) then
		exports.bone_attach:detachElementFromBone(elementFood[source])
		destroyElement(elementFood[source])
	end
	if elementWatter[source] and isElement(elementWatter[source]) then
		exports.bone_attach:detachElementFromBone(elementWatter[source])
		destroyElement(elementWatter[source])
	end
end)