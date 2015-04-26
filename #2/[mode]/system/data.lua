addEvent("onPlayerPutMine",true)
addEventHandler("onPlayerPutMine",getRootElement(),function(itemName)
	local source = source
	if isPedInVehicle(source) then return end
	if isElementInWater(source) then return end
	setElementData(source,itemName,getElementData(source,itemName)-1)
	local x,y,z = getElementPosition(source)
	local mine = createObject(1510,x,y,z-0.7,0,0,3.18)
	local mineCol = createColSphere(x,y,z,1.5)
	attachElements ( mineCol, mine, 0, 0, 0 )
	setElementData(mineCol,"parent",mine)
	setElementData(mine,"parent",mineCol)
	setElementFrozen(mine, true)
	setElementData(mineCol,"mine",mine)
	setPedWeaponSlot(source, 0)
	triggerClientEvent(source,"refreshInventoryManual",source)
    setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
	setTimer(function()
		destroyElement(mineCol)
		destroyElement(mine)
	end,1000000,1)
	addEventHandler("onColShapeHit", mineCol, boomMine)
end)

function boomMine(player)
	local mine = getElementData(source, "mine")
	local x,y,z = getElementPosition(source)
	setTimer(function()
		local px,py,pz = getElementPosition(player)
		local mx,my,mz = getElementPosition(mine)
		if getDistanceBetweenPoints3D(px,py,pz,mx,my,mz) < 4 then
			createExplosion(x,y,z,8)
			destroyElement(mine)
			destroyElement(source)
		end
	end,350,1)
end
---------------------------------------------------------------------------------------------------------------------------------------------*
addEvent("onPlayerBuildAWireFence",true)
addEventHandler("onPlayerBuildAWireFence",getRootElement(),function(itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
	local source = source
	if isPedInVehicle(source) then return end
	if isElementInWater(source) then return end
	setTimer(function()
		local x,y,z = getElementPosition(source)
		local xr,yr,zr = getElementRotation(source)
		px, py, pz = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = px + 1 * math.cos(offsetRot)
		local vy = py + 1 * math.sin(offsetRot)
		local vz = pz + 2
		local vrot = prot+90
		tent = createObject(983,vx,vy,pz,xr,yr,vrot)
		setObjectScale(tent,1)
		tentCol = createColSphere(x,y,z,2)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent)
		setElementData(tent,"parent",tentCol)
		setElementData(tentCol,"wirefence",true)
		setPedWeaponSlot(source, 0)
		triggerClientEvent(source,"refreshInventoryManual",source)
	end,1500,1)			
end)
---------------------------------------------------------------------------------------------------------------------------------------------*
local fire = false
local maker = false

addEvent("onPlayerMakeAFire",true)
addEventHandler("onPlayerMakeAFire",getRootElement(),function(itemName)
	local source = source
	if isPedInVehicle(source) then return end
	if isElementInWater(source) then return end
	setElementData(source,"Drewno opałowe",getElementData(source,"Drewno opałowe")-1)
	local xr,yr,_ = getElementRotation(source)
	px, py, pz = getElementPosition(source)
	prot = getPedRotation(source)
	local offsetRot = math.rad(prot+90)
	local vx = px+1*math.cos(offsetRot)
	local vy = py+1*math.sin(offsetRot)
	local vz = pz+2
	local vrot = prot+90
	local wood = createObject(2807,vx,vy,pz-0.87,xr,yr,vrot)
	setObjectScale(wood,2.9)
	setElementFrozen(wood,true)
	local fireCol = createColSphere(vx,vy,pz-0.75,2.5)
--	if getWeather() == 16 or getWeather() == 8 then
--		triggerClientEvent(source,"displayClientInfo",source,"fireplace","Пламя не будет гореть во время дождя!",255,22,0)
--	end
	fire = createObject(3525,vx,vy,pz-0.8,xr,yr,vrot)
	setObjectScale(fire,0)
	maker = createMarker(vx,vy,pz+0.2,"corona",3,240,220,130,50)
	attachElements ( fireCol, wood, 0, 0, 0 )
	setElementData(fireCol,"parent",wood)
	setElementData(fireCol,"fireplace",true)
	setPedWeaponSlot(source, 0)
	x43,y43,z43 = getElementPosition(fire)
	triggerClientEvent(source,"fireplaceSound",source,x43,y43,z43)
	triggerClientEvent(source,"refreshInventoryManual",source)
	setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
	setTimer(function()
		if fire then
			destroyElement(fire)
			triggerClientEvent(source,"fireplaceStop",source)
			destroyElement(maker)
		end
		destroyElement(fireCol)
		destroyElement(wood)
	end,720000,1)
end)
--[[
function checkWeatherForFireplace()
	if getWeather() == 16 or getWeather() == 8 then
		if fire then
			destroyElement(fire)
			destroyElement(maker)
			triggerClientEvent(source,"fireplaceStop",source)
			setElementData(fireCol,"fireplace",false)
		end
	end
end
setTimer(checkWeatherForFireplace,2800,0)--]]
---------------------------------------------------------------------------------------------------------------------------------------------*
addEvent("onPlayerPitchATent",true)
addEventHandler("onPlayerPitchATent",getRootElement(),function(itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	triggerClientEvent(source,"onPlayerUseLoot",source,itemName)
	setPedAnimation (source,"BOMBER","BOM_Plant",false,false,false,false)
	local source = source
	if isPedInVehicle(source) then return end
	if isElementInWater(source) then return end
	setTimer(function()
		local x,y,z = getElementPosition(source)
		prot = getPedRotation(source)
		local offsetRot = math.rad(prot+90)
		local vx = x + 3 * math.cos(offsetRot)
		local vy = y + 3 * math.sin(offsetRot)
		local vz = z + 2
		local vrot = prot+180
		tent = createObject(3243,vx,vy,z-1,0,0,vrot)
		setObjectScale(tent,1.3)
		tentCol = createColSphere(x,y,z,4)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent)
		setElementData(tent,"parent",tentCol)
		setElementData(tentCol,"tent",true)
		setElementData(tentCol,"vehicle",true)
		setElementData(tentCol,"MAX_Slots",100)
		setPedWeaponSlot(source, 0)
		triggerClientEvent(source,"refreshInventoryManual",source)
	end,1500,1)			
end)
---------------------------------------------------------------------------------------------------------------------------------------------*
addEvent("hideBodyClient",true) 
addEventHandler("hideBodyClient", getRootElement(),function()
	local col = getElementData(source,"currentCol") 
	if isElement(col) then 
		if getElementData(col, "deadman") then 
			setPedAnimation ( source, "BOMBER", "BOM_Plant", -1, false,false,false,false ) 
			setElementData(source,"loot",false) 
			setElementData(source,"currentCol",false)
			setPedWeaponSlot(source, 0)
			setTimer(function(colision)
				if isElement(getElementData(colision, "parent")) then 
					destroyElement(getElementData(colision, "parent")) 
				end
				if isElement(getElementData(colision, "playerCol")) then 
					destroyElement(getElementData(colision, "playerCol")) 
				end
				destroyElement(colision) 
			end,2000,1,col) 
		end  
	end 
end)
---------------------------------------------------------------------------------------------------------------------------------------------*
addEvent("onPlayerPlaceRoadflare",true)
addEventHandler("onPlayerPlaceRoadflare",getRootElement(),function(itemName)
	setElementData(source,itemName,getElementData(source,itemName)-1)
	local source = source
	if isPedInVehicle(source) then return end
	if isElementInWater(source) then return end
	setPedAnimation (source,"BOMBER","BOM_Plant",false,false,false,false)
	setTimer(function()
		local x,y,z = getElementPosition(source)
		local object = createObject(354,x,y,z-0.6)
		local maker = createMarker (x,y,z-0.3,"corona",7,250,5,5)
		setTimer(destroyElement,300000,1,object)
		setTimer(destroyElement,300000,1,maker)
		setPedWeaponSlot(source,0)
		triggerClientEvent(source,"refreshInventoryManual",source)
	end,800,1)		
end)
---------------------------------------------------------------------------------------------------------------------------------------------*
addEvent("addPlayerCookMeat",true)
addEventHandler("addPlayerCookMeat",getRootElement(),function()
	local source = source
	if isPedInVehicle(source) then return end
	if isElementInWater(source) then return end
	setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
	setTimer(function()
		setElementData(source,"Surowe mięso",getElementData(source,"Surowe mięso")-1)
		setElementData(source,"Pieczone mięso",getElementData(source,"Pieczone mięso")+1)
		triggerClientEvent (source, "displayClientInfo", source,"ognisko","Smażysz surowe mięso.",22,255,0)
		setPedWeaponSlot(source, 0)
		triggerClientEvent(source,"refreshInventoryManual",source)
	end,3000,1)
end)
---------------------------------------------------------------------------------------------------------------------------------------------*
addEvent("onPlayerGiveMedicObject",true)
addEventHandler("onPlayerGiveMedicObject",getRootElement(),function(itemName,player)
	setPedAnimation(source,"BOMBER","BOM_Plant",false,false,false,false)
	local source = source
	if isElementInWater(source) then return end
	setTimer(function ()
		if itemName == "bandage" then
			setElementData(player,"bleeding",0)
			setElementData(source,"Bandaż",getElementData(source,"Bandaż")-1)
		elseif itemName == "giveblood" then
			exports.status:addPlayerStats (player,"blood",5000)
			setElementData(source,"Pakiet krwi",getElementData(source,"Pakiet krwi")-1)
		elseif itemName == "handcuffed" then
			setElementData(player,"inHandcuffs",true)
			setTimer(function()
				setElementData(getLocalPlayer(),"inHandcuffs",false)
			end,math.random(300000,600000),1)
		end
		setPedWeaponSlot(source, 0)
	end,1500,1)
end)
---------------------------------------------------------------------------------------------------------------------------------------------*
addEvent("onPlayerRefillWaterBottle",true)
addEventHandler("onPlayerRefillWaterBottle",getRootElement(),function(itemName)
	local source = source
	if isPedInVehicle(source) then return end
	if isElementInWater(source) then
		if (itemName == "Pusta butelka po wodzie") then
			setElementData(source,"Butelka wody",getElementData(source,"Butelka wody")+1)
			setElementData(source,itemName,getElementData(source,itemName)-1)
			triggerClientEvent(source,"refreshInventoryManual",source)
			triggerClientEvent (source, "displayClientInfo", source,"Butelka wody","Wypełniasz butelkę wodą.",22,255,0)
		elseif (itemName == "Pusta manierka") then
			setElementData(source,"Manierka",getElementData(source,"Manierka")+1)
			setElementData(source,itemName,getElementData(source,itemName)-1)
			triggerClientEvent(source,"refreshInventoryManual",source)
			triggerClientEvent (source, "displayClientInfo", source,"Manierka","Wypełniasz manierkę wodą.",22,255,0)
		end
	else
		triggerClientEvent (source, "displayClientInfo", source,"Butelka wody","Musisz być w wodzie!",255,22,0)
	end
	setPedWeaponSlot(source, 0)
end)
---------------------------------------------------------------------------------------------------------------------------------------------*
addEvent("onPlayerAmmoOpen",true)
addEventHandler("onPlayerAmmoOpen",getRootElement(),function(itemName)
	local source = source
	if isElementInWater(source) then return end
	if (itemName == ".357 20 Rounds") then
		setElementData(source,".357",(getElementData(source,".357") or 0)+20)
	elseif (itemName == "12 Gauge 20 Rounds Buckshot") then
		setElementData(source,"12 Gauge Buckshot",(getElementData(source,"12 Gauge Buckshot") or 0)+20)
	elseif (itemName == ".22 20 Rounds") then
		setElementData(source,".22",(getElementData(source,".22") or 0)+20)
	elseif (itemName == "7.62x39mm 20 Rounds") then
		setElementData(source,"7.62x39mm",(getElementData(source,"7.62x39mm") or 0)+20)
	elseif (itemName == "7.62x51mm 20 Rounds") then
		setElementData(source,"7.62x51mm",(getElementData(source,"7.62x51mm") or 0)+20)
	elseif (itemName == ".45ACP 20 Rounds") then
		setElementData(source,".45ACP",(getElementData(source,".45ACP") or 0)+20)
	elseif (itemName == "5.56mm 20 Rounds") then
		setElementData(source,"5.56mm",(getElementData(source,"5.56mm") or 0)+20)
	elseif (itemName == "9mm 20 Rounds") then
		setElementData(source,"9mm",(getElementData(source,"9mm") or 0)+20)
	end
	setElementData(source,itemName,getElementData(source,itemName)-1)
	triggerClientEvent(source,"refreshInventoryManual",source)
end)