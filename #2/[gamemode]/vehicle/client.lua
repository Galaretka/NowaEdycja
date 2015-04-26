vehicleFuelTable = {
	{422,80},
	{470,100},
	{468,30},
	{433,140},
	{431,140},
	{471,30},
	{463,40},
	{512,90},
	{460,80},
	{484,120},
	{486,100},
	{530,30},
	{537,220},
	{509,0},
	{487,60},
	{497,60},
	{453,60},
	{525,60},
}

vehicleAddonsInfo = {
	{422,4,1,1,1},
	{470,4,1,1,1},
	{468,2,1,1,1},
	{433,6,1,1,1},
	{431,6,1,1,1},
	{471,4,1,1,1},
	{463,2,1,1,1},
	{525,4,2,1,1},
	{512,3,1,1,0},
	{460,0,1,1,0},
	{484,0,3,1,0},
	{486,4,2,1,1},
	{530,4,1,0,0},
	{537,12,4,1,0},
	{509,0,0,0,0},
	{487,0,1,1,0},
	{497,0,1,1,0},
	{453,0,1,1,0},
}

function getVehicleAddonInfos (id)
	for i,veh in ipairs(vehicleAddonsInfo) do
		if veh[1] == id then
			return veh[2], veh[3], veh[4], veh[5]
		end
	end
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

function updateIcons ()
	if getElementData(getLocalPlayer(),"logedin") and not getElementData(getLocalPlayer(), "inventoryShowing") then
--[[		local x,y,z = getElementPosition(getLocalPlayer())
		for i,veh in ipairs(getElementsByType("vehicle")) do
			local px,py,pz = getElementPosition (veh)
			local vehID = getElementModel(veh)
			local vehicle = getPedOccupiedVehicle(getLocalPlayer())
			if veh ~= vehicle then
				if vehID ~= 548 then
					local pdistance = getDistanceBetweenPoints3D ( x,y,z,px,py,pz )
					if pdistance <= 6 then
						local sx,sy = getScreenFromWorldPosition ( px, py, pz+0.95, 0.06 )
						if sx and sy then
							local w = dxGetTextWidth(getVehicleName(veh),1.02,"default-bold")
							dxDrawText ( getVehicleName(veh), sx-(w/2), sy, sx-(w/2), sy, tocolor ( 100, 255, 100, 200 ), 1.02, "default-bold" )	
						end
					end
				end
			end
		end--]]
		local veh = getPedOccupiedVehicle (getLocalPlayer())
		if veh then
			local wx,hy = guiGetScreenSize()
			local maxfuel = getElementData(veh,"maxfuel") or 0
			local fuel = getElementData(getElementData(veh,"parent"),"fuel") or 0
			local needengine = getElementData(veh,"needengines") or 0
			local needtires = getElementData(veh,"needtires") or 0
			local needparts = getElementData(veh,"needparts") or 0
			local needlamp = getElementData(veh,"needlamp") or 0
			local engine = getElementData(getElementData(veh,"parent"),"Engine_inVehicle") or 0
			local tires = getElementData(getElementData(veh,"parent"),"Tire_inVehicle") or 0
			local parts = getElementData(getElementData(veh,"parent"),"Parts_inVehicle") or 0
			local lamp = getElementData(getElementData(veh,"parent"),"Lamp_inVehicle") or 0
			local offset = dxGetFontHeight(1.02,"default-bold")
			local w = dxGetTextWidth(engine.."/"..needengine.." Silnik",1.02,"default-bold")
			if engine == needengine then
				r,g,b = 0,255,0
			else
				r,g,b = 255,0,0
			end
			dxDrawText (engine.."/"..needengine.." Silnik" ,wx*0.5-w/2 , hy*0,wx*0.5-w/2 , hy*0,tocolor ( r,g,b, 220 ), 1.02, "default-bold" )
			local w = dxGetTextWidth(tires.."/"..needtires.." Koło",1.02,"default-bold")
			if tires == needtires then
				r,g,b = 0,255,0
			else
				r,g,b = 255,0,0
			end
			dxDrawText (tires.."/"..needtires.." Koło",wx*0.5-w/2 , hy*0+offset,wx*0.5-w/2 , hy*0+offset,tocolor ( r,g,b, 220 ), 1.02, "default-bold" )
			local w = dxGetTextWidth(parts.."/"..needparts.." Bak",1.02,"default-bold")
			if parts == needparts then
				r,g,b = 0,255,0
			else
				r,g,b = 255,0,0
			end
			dxDrawText (parts.."/"..needparts.." Bak",wx*0.5-w/2 , hy*0+offset*2,wx*0.5-w/2 , hy*0+offset, tocolor (r,g,b, 220 ) , 1.02, "default-bold" )
			local w = dxGetTextWidth(lamp.."/"..needlamp.." Żarówki samochodowe",1.02,"default-bold")
			if lamp == needlamp then
				r,g,b = 0,255,0
			else
				r,g,b = 255,0,0
			end
			dxDrawText (lamp.."/"..needlamp.." Żarówki samochodowe",wx*0.5-w/2 , hy*0+offset*3,wx*0.5-w/2 , hy*0+offset, tocolor (r,g,b, 220 ) , 1.02, "default-bold" )
			local w = dxGetTextWidth("Бензин:"..math.floor(fuel).."/"..maxfuel,1.02,"default-bold")
			if fuel == maxfuel then
				r,g,b = 0,255,0
			elseif fuel < maxfuel/10 then
				r,g,b = 255,0,0	
			elseif fuel < maxfuel/4 then
				r,g,b = 255,50,0	
			elseif fuel < maxfuel/3 then
				r,g,b = 200,100,0
			elseif fuel < maxfuel/2 then
				r,g,b = 125,200,0		
			elseif fuel < maxfuel/1.5 then
				r,g,b = 50,200,0
			end
			dxDrawText ("Benzyna:"..math.floor(fuel).."/"..maxfuel,wx*0.5-w/2 , hy*0+offset*4,wx*0.5-w/2 , hy*0+offset*2,tocolor ( r,g,b, 220 ), 1.02, "default-bold" )
		end
	end	
end
addEventHandler("onClientRender", getRootElement(), updateIcons)

addEventHandler("onClientPlayerVehicleEnter",getRootElement(),function()
    setRadioChannel(0)
	addEventHandler("onClientPlayerRadioSwitch",getRootElement(),function()
		cancelEvent()
	end)
end)

addEvent("checkVehicleInWaterClient",true)
addEventHandler("checkVehicleInWaterClient",getRootElement(),function()
	vehiclesInWater = {}
	for i,veh in ipairs(getElementsByType("vehicle")) do
		if isElementInWater(veh) then
			table.insert(vehiclesInWater,veh)
		end
	end
	triggerServerEvent("respawnVehiclesInWater",getLocalPlayer(),vehiclesInWater)
end)