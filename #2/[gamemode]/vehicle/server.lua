function table.size(tab)
    local length = 0
    for _ in pairs(tab) do length = length + 1 end
    return length
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

vehicleFuelInfo = {
	{422,0.25},
	{470,0.1},
	{468,0.1},
	{433,0.5},
	{431,0.5},
	{471,0.1},
	{463,0.15},
	{525,0.25},
	{512,0.25},
	{484,0.25},--
	{486,0.3},--
	{460,0.25},--
	{530,0.1},--
	{537,0.3},--
	{509,0},
	{487,0.25},
	{497,0.25},
	{453,0.1},
}

function getVehicleMaxFuel(loot)
	local modelID = getElementModel(getElementData(loot,"parent"))
	for i,vehicle in ipairs(vehicleFuelTable) do
		if modelID == vehicle[1] then
			return vehicle[2]
		end
	end
	return false
end

function saveallvehicles(ps,command)
	counter = 0
	counterTent = 0
	local vehicleManager = getAccount("vehicleManager","bx96dk_i$")--bx96dk_i
	for i, col in ipairs (getElementsByType("colshape")) do
		local veh = getElementData(col,"vehicle")
		local helicrash = getElementData(col,"helicrash")
		local hospitalbox = getElementData(col,"hospitalbox")
		local tent = getElementData(col,"tent")
		if veh and not helicrash or veh and not hospitalbox then
			if tent then
				counterTent = counterTent +1
				account = getAccount("tent_number_"..counterTent,"bx96dk_i$") or false
				if not account then
					account = addAccount("tent_number_"..counterTent,"bx96dk_i$")
				end	
				local tent = getElementData(col,"parent")
				local x,y,z = getElementPosition(tent)
				local rx,ry,rz = getElementRotation(tent)
				setAccountData(account,"last_x",x)
				setAccountData(account,"last_y",y)
				setAccountData(account,"last_z",z)
				setAccountData(account,"last_rx",rx)
				setAccountData(account,"last_ry",ry)
				setAccountData(account,"last_rz",rz)
				for i, data in ipairs(vehicleDataTable) do 
					setAccountData(account,data[1],getElementData(col,data[1]))
				end
			else 
				counter = counter +1
				account = getAccount("vehicle_number_"..counter,"bx96dk_i$") or false
				if not account then
					account = addAccount("vehicle_number_"..counter,"bx96dk_i$")
				end	
				setAccountData(account,"spawn_x",getElementData(col,"spawn")[2])
				setAccountData(account,"spawn_y",getElementData(col,"spawn")[3])
				setAccountData(account,"spawn_z",getElementData(col,"spawn")[4])
				for i, data in ipairs(vehicleDataTable) do 
					setAccountData(account,data[1],getElementData(col,data[1]))
				end
				local vehicle = getElementData(col,"parent")
				local model = getElementModel(vehicle)
				local x,y,z = getElementPosition(vehicle)
				local rx,ry,rz = getElementRotation(vehicle)
				local health = getElementHealth(vehicle)
				setAccountData(account,"last_x",x)
				setAccountData(account,"last_y",y)
				setAccountData(account,"last_z",z)
				setAccountData(account,"last_rx",rx)
				setAccountData(account,"last_ry",ry)
				setAccountData(account,"last_rz",rz)
				setAccountData(account,"health",health)
				setAccountData(account,"model",model)
				setAccountData(account,"isExploded",getElementData(vehicle,"isExploded") or false)
			end
		end
		setAccountData(vehicleManager,"vehicleamount",counter)
		setAccountData(vehicleManager,"tentamount",counterTent)
	end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), saveallvehicles)

function doBackup ()
	outputChatBox ("Резервное копирование сервера.Просим не выходить с сервера во время NETWORK.",getRootElement(),235,215,5,true)
	saveallvehicles()
	outputChatBox ("Продолжайте!",getRootElement(),235,215,5,true)
end

function checkDoBackup ()
	setTimer(doBackup,86400000,0)
end
checkDoBackup()

function createVehicleOnServerStart()
	local vehicleManager = getAccount("vehicleManager","bx96dk_i$")
	for i = 1, (getAccountData(vehicleManager,"vehicleamount") or 0) do
		wastedVehicle = false
		vehicle = getAccount("vehicle_number_"..i,"bx96dk_i$")
		if not vehicle then break end
		if getAccountData(vehicle,"isExploded") == true then
			setAccountData(vehicle,"health",1000)
			wastedVehicle = true
		end
		local veh = createVehicle(getAccountData(vehicle,"model"),getAccountData(vehicle,"last_x"),getAccountData(vehicle,"last_y"),getAccountData(vehicle,"last_z"),getAccountData(vehicle,"last_rx"),getAccountData(vehicle,"last_ry"),getAccountData(vehicle,"last_rz"))
		vehCol = createColSphere(getAccountData(vehicle,"last_x"),getAccountData(vehicle,"last_y"),getAccountData(vehicle,"last_z"),4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",getAccountData(vehicle,"MAX_Slots"))
		setElementHealth(veh,getAccountData(vehicle,"health"))
		xxx,yyy,zzz = getAccountData(vehicle,"spawn_x"),getAccountData(vehicle,"spawn_y"),getAccountData(vehicle,"spawn_z")
		setElementData(vehCol,"spawn",{getAccountData(vehicle,"model"),xxx,yyy,zzz})
		if wastedVehicle then
			if getAccountData(vehicle,"model") == 497 then
				item_id = math.random(table.size(hunterSpawns))
				xxx,yyy,zzz = hunterSpawns[item_id][1],hunterSpawns[item_id][2],hunterSpawns[item_id][3]
			end
			if getAccountData(vehicle,"model") == 487 then
				local item_id = math.random(table.size(maverikSpawns))
				x,y,z = maverikSpawns[item_id][1],maverikSpawns[item_id][2],maverikSpawns[item_id][3]
			end
			setElementPosition(veh,xxx,yyy,zzz+1)
			setElementRotation(veh,0,0,0)
			-- @Части машин
			local tires,engine,parts,lamp = getVehicleAddonInfos (getElementModel(veh))
			setElementData(vehCol,"Tire_inVehicle",math.random(0,tires))
			setElementData(vehCol,"Engine_inVehicle",math.random(0,engine))
			setElementData(vehCol,"Parts_inVehicle",math.random(0,parts))
			setElementData(vehCol,"Lamp_inVehicle",math.random(0,lamp))
		end
		setElementData(vehCol,"fuel",getAccountData(vehicle,"fuel"))
		if not wastedVehicle then
			for i, data in ipairs(vehicleDataTable) do 
				setElementData(vehCol,data[1],getAccountData(vehicle,data[1]))
			end
		else
			if getElementModel(veh) == 433 or getElementModel(veh) == 470 then
				for i,items in ipairs(lootItems["helicrashsides"]) do
					local randomNumber = math.random(1,10)
					if randomNumber == 5 then
						setElementData(vehCol,items[1],math.random(1,2))
					end
				end
			end	
			setElementData(vehCol,"fuel",10)
		end
	end
	for i = 1, (getAccountData(vehicleManager,"tentamount") or 0) do
		tentData = getAccount("tent_number_"..i,"")
		if not tentData then break end
		tent = createObject(3243,getAccountData(tentData,"last_x"),getAccountData(tentData,"last_y"),getAccountData(tentData,"last_z"),0,0,(getAccountData(tentData,"last_rz") or 0))
		setObjectScale(tent,1.3)
		tentCol = createColSphere(getAccountData(tentData,"last_x"),getAccountData(tentData,"last_y"),getAccountData(tentData,"last_z"),4)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent)
		setElementData(tent,"parent",tentCol)
		setElementData(tentCol,"tent",true)
		setElementData(tentCol,"vehicle",true)
		setElementData(tentCol,"MAX_Slots",100)
		for i, data in ipairs(vehicleDataTable) do 
			setElementData(tentCol,data[1],getAccountData(tentData,data[1]))
		end
	end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), createVehicleOnServerStart)