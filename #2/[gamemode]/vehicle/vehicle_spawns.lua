hunterSpawns = gameplayVariables["hunterspawns"]
pickupSpawns = gameplayVariables["pickupspawns"]
patriotSpawns = gameplayVariables["patriotspawns"]
sanchezSpanws = gameplayVariables["sanchezspawns"]
barracksSpawns = gameplayVariables["barracksspawns"]
coachSpawns = gameplayVariables["coachspawns"]
fisherBootSpawns = gameplayVariables["fisherboatspawns"]
bikeSpawns = gameplayVariables["bikespawns"]
maverikSpawns = gameplayVariables["maverickspawns"]
quadSpawns = gameplayVariables["quadspawns"]
chopperSpawns = gameplayVariables["chopperspawns"]
tagachSpawns = gameplayVariables["tagachspawns"]
rustlerSpawns = gameplayVariables["rustlerspawns"]
skimmerSpawns = gameplayVariables["skimmerspawns"]
marquisSpawns = gameplayVariables["marquisspawns"]
dozerSpawns = gameplayVariables["dozerspawns"]
forkitSpawns = gameplayVariables["forkitspawns"]
freightSpawns = gameplayVariables["freightspawns"]


tentSpawns = gameplayVariables["tentsspawns"]
heliCrashSites = gameplayVariables["helicrashsides"]

function getVehicleAddonInfos (id)
	for i,veh in ipairs(vehicleAddonsInfo) do
		if veh[1] == id then
			return veh[2], veh[3], veh[4], veh[5]
		end
	end
end

function createHeliCrashSite()
	if cargoCol then
		destroyElement(getElementData(cargoCol,"parent"))
		destroyElement(cargoCol)
	end
	local item_id = math.random(table.size(heliCrashSites))
	local x,y,z = heliCrashSites[item_id][1],heliCrashSites[item_id][2],heliCrashSites[item_id][3]
	cargobob = createVehicle(548,x,y,z,nil,nil,nil)
	setElementHealth(cargobob,0)
	setElementFrozen(cargobob,true)
	cargoCol = createColSphere(x,y,z,3)
	attachElements ( cargoCol, cargobob, 0, 0, 0 )
	setElementData(cargoCol,"parent",cargobob)
	setElementData(cargoCol,"helicrash",true)
	setElementData(cargoCol,"MAX_Slots",50)
	for i, item in ipairs(lootItems["helicrashsides"]) do
		local value =  math.percentChance (item[5]*3.5,math.random(1,2))
		setElementData(cargoCol,item[1],value)
		local ammoData,weapID = exports.weapon:getWeaponAmmoType(item[1],true)
		if ammoData and value > 0 then
			setElementData(cargoCol,ammoData,math.random(1,2))
		end
	end
	setTimer(createHeliCrashSite,3600000,1)
end
createHeliCrashSite()

dayzVehicles = {}
function spawnDayZVehicles()
	if getElementData(getRootElement(),"serverhasloadvehicles") then return end
	for i,veh in ipairs(pickupSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(422,x,y,z)
		vehCol = createColSphere(x,y,z,2)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",20)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{422,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(patriotSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(470,x,y,z)
		vehCol = createColSphere(x,y,z,2.5)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",38)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{470,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
		for i,items in ipairs(lootItems["helicrashsides"]) do
			local randomNumber = math.random(1,10)
			if randomNumber == 5 then
				setElementData(vehCol,items[1],1)
			end
		end
	end
	for i,veh in ipairs(sanchezSpanws) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(468,x,y,z)
		vehCol = createColSphere(x,y,z,1.5)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",6)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{468,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(barracksSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(433,x,y,z)
		vehCol = createColSphere(x,y,z,4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",64)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{433,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
		for i,items in ipairs(lootItems["helicrashsides"]) do
			local randomNumber = math.random(1,10)
			if randomNumber == 5 then
				setElementData(vehCol,items[1],math.random(1,2))
			end
		end
	end
	for i,veh in ipairs(coachSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(431,x,y,z)
		vehCol = createColSphere(x,y,z,4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",56)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{431,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(tagachSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(525,x,y,z)
		vehCol = createColSphere(x,y,z,4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",32)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{525,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(fisherBootSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(453,x,y,z)
		vehCol = createColSphere(x,y,z,4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",30)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{453,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(bikeSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(509,x,y,z)
		setVehicleDamageProof(veh, true)
		vehCol = createColSphere(x,y,z,2)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",0)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{509,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(quadSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(471,x,y,z)
		vehCol = createColSphere(x,y,z,1.5)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",8)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{471,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(chopperSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(463,x,y,z)
		vehCol = createColSphere(x,y,z,1.5)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",8)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{463,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(rustlerSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(512,x,y,z)
		vehCol = createColSphere(x,y,z,4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",15)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{512,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end

	for i,veh in ipairs(skimmerSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(460,x,y,z)
		vehCol = createColSphere(x,y,z,4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",12)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{460,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(marquisSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(484,x,y,z)
		vehCol = createColSphere(x,y,z,4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",64)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{484,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(dozerSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(486,x,y,z)
		vehCol = createColSphere(x,y,z,4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",35)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{486,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(forkitSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(530,x,y,z)
		vehCol = createColSphere(x,y,z,2)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",6)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{530,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end
	for i,veh in ipairs(freightSpawns) do
		local x,y,z = veh[1],veh[2],veh[3]
		veh = createVehicle(537,x,y,z)
		vehCol = createColSphere(x,y,z,4)
		attachElements ( vehCol, veh, 0, 0, 0 )
		setElementData(vehCol,"parent",veh)
		setElementData(veh,"parent",vehCol)
		setElementData(vehCol,"vehicle",true)
		setElementData(vehCol,"MAX_Slots",120)
		setElementData(vehCol,"Tire_inVehicle",0)
		setElementData(vehCol,"Engine_inVehicle",0)
		setElementData(vehCol,"Parts_inVehicle",0)
		setElementData(vehCol,"Lamp_inVehicle",0)
		setElementData(vehCol,"spawn",{537,x,y,z})
		setElementData(vehCol,"fuel",math.random(10,30))
	end

	for i,tent in ipairs(tentSpawns) do
		local x,y,z = tent[1],tent[2],tent[3]
		tent = createObject(3243,x,y,z-1)
		setObjectScale(tent,0.5)
		tentCol = createColSphere(x,y,z,4)
		attachElements ( tentCol, tent, 0, 0, 0 )
		setElementData(tentCol,"parent",tent)
		setElementData(tent,"parent",tentCol)
		setElementData(tentCol,"tent",true)
		setElementData(tentCol,"vehicle",true)
		setElementData(tentCol,"MAX_Slots",30)
	end
	local item_id = math.random(table.size(maverikSpawns))
	local x,y,z = maverikSpawns[item_id][1],maverikSpawns[item_id][2],maverikSpawns[item_id][3]
	hunter = createVehicle(487,x,y,z)
	vehCol = createColSphere(x,y,z,4)
	attachElements ( vehCol, hunter, 0, 0, 0 )
	setElementData(vehCol,"parent",hunter)
	setElementData(hunter,"parent",vehCol)
	setElementData(vehCol,"vehicle",true)
	setElementData(vehCol,"MAX_Slots",10)
	setElementData(vehCol,"Tire_inVehicle",0)
	setElementData(vehCol,"Engine_inVehicle",0)
	setElementData(vehCol,"Parts_inVehicle",0)
	setElementData(vehCol,"Lamp_inVehicle",0)
	setElementData(vehCol,"spawn",{487,x,y,z})
	setElementData(vehCol,"fuel",math.random(10,30))
	local item_id = math.random(table.size(hunterSpawns))
	local x,y,z = hunterSpawns[item_id][1],hunterSpawns[item_id][2],hunterSpawns[item_id][3]
	hunter = createVehicle(497,x,y,z)
	vehCol = createColSphere(x,y,z,4)
	attachElements ( vehCol, hunter, 0, 0, 0 )
	setElementData(vehCol,"parent",hunter)
	setElementData(hunter,"parent",vehCol)
	setElementData(vehCol,"vehicle",true)
	setElementData(vehCol,"MAX_Slots",10)
	setElementData(vehCol,"Tire_inVehicle",0)
	setElementData(vehCol,"Engine_inVehicle",0)
	setElementData(vehCol,"Parts_inVehicle",0)
	setElementData(vehCol,"Lamp_inVehicle",0)
	setElementData(vehCol,"spawn",{497,x,y,z})
	setElementData(vehCol,"fuel",math.random(10,30))
end

function spawnVehiclePack (panda,cmd)
	local accName = getAccountName(getPlayerAccount(panda))
	if isObjectInACLGroup ("user."..accName,aclGetGroup("Admin")) then
		spawnDayZVehicles()
		outputChatBox("Zrespawnowano pojazdy!",panda,255,0,0,true)
	end
end
addCommandHandler("svp",spawnVehiclePack)

function destroyVehiclePack(panda, cmd)
	local accName = getAccountName(getPlayerAccount(panda))
	if isObjectInACLGroup("user."..accName,aclGetGroup("Admin")) then
		for i,v in ipairs(getElementsByType("vehicle") ) do 
			local col = getElementData(v, "parent")
			if isElement(col) then
				destroyElement(col) 
			end
			if isElement(v) then
				destroyElement(v) 
			end
		end 
	end 
end 
addCommandHandler("dvp", destroyVehiclePack)

function notifyAboutExplosion()
	local col = getElementData(source,"parent")
	local x1,y1,z1 = getElementPosition(source)
	id,x,y,z  = getElementData(col,"spawn")[1],getElementData(col,"spawn")[2],getElementData(col,"spawn")[3],getElementData(col,"spawn")[4]
    setTimer(respawnDayZVehicle,1800000,1,id,x,y,z,source,col,getElementData(col,"MAX_Slots"))
	setElementData(col,"deadVehicle",true)
	setElementData(source,"isExploded",true)
--	createExplosion(x1+4,y1+1,z1,4)
--	createExplosion(x1+2,y1-4,z1,4)
--	createExplosion(x1-1,y1+5,z1,4)
--	createExplosion(x1-4,y1,z1-2,4)
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion)

function respawnVehiclesInWater (vehiclesInWater)
	for i,veh in ipairs(vehiclesInWater) do
		if getElementModel(veh) == 453 then break end
		local col = getElementData(veh,"parent")
		id,x,y,z  = getElementData(col,"spawn")[1],getElementData(col,"spawn")[2],getElementData(col,"spawn")[3],getElementData(col,"spawn")[4]
		respawnDayZVehicle(id,x,y,z,veh,col,getElementData(col,"MAX_Slots"))
	end
end
addEvent("respawnVehiclesInWater",true)
addEventHandler("respawnVehiclesInWater",getRootElement(),respawnVehiclesInWater)

function checkVehicleInWater ()
	local randomPlayer = getRandomPlayer()
	if randomPlayer then
		triggerClientEvent(randomPlayer,"checkVehicleInWaterClient",randomPlayer)
	end
end
setTimer(checkVehicleInWater,1800000,0)

function respawnDayZVehicle(id,x,y,z,veh,col,max_slots)
	if id == 497 then
		local item_id = math.random(table.size(hunterSpawns))
		x,y,z = hunterSpawns[item_id][1],hunterSpawns[item_id][2],hunterSpawns[item_id][3]
	end
	if id == 487 then
		local item_id = math.random(table.size(maverikSpawns))
		x,y,z = maverikSpawns[item_id][1],maverikSpawns[item_id][2],maverikSpawns[item_id][3]
	end
	if isElement(veh) then destroyElement(veh) end
	if isElement(col) then destroyElement(col) end
	veh = createVehicle(id,x,y,z+1)
	vehCol = createColSphere(x,y,z,4)
	attachElements ( vehCol, veh, 0, 0, 0 )
	setElementData(vehCol,"parent",veh)
	setElementData(veh,"parent",vehCol)
	setElementData(vehCol,"vehicle",true)
	setElementData(vehCol,"MAX_Slots",max_slots)
	setElementData(vehCol,"Tire_inVehicle",0)
	setElementData(vehCol,"Engine_inVehicle",0)
	setElementData(vehCol,"Parts_inVehicle",0)
	setElementData(vehCol,"Lamp_inVehicle",0)
	setElementData(vehCol,"spawn",{id,x,y,z})
	setElementData(vehCol,"fuel",math.random(10,30))
	if id == 433 then
		for i,items in ipairs(lootItems["helicrashsides"]) do
			local randomNumber = math.random(1,10)
			if randomNumber == 5 then
				setElementData(vehCol,items[1],math.random(1,2))
			end
		end
	elseif id == 470 then
		for i,items in ipairs(lootItems["helicrashsides"]) do
			local randomNumber = math.random(1,10)
			if randomNumber == 5 then
				setElementData(vehCol,items[1],math.random(1,2))
			end
		end	
	end
end

function getVehicleFuelRemove (id,col)
	for i,veh in ipairs(vehicleFuelInfo) do
		if veh[1] == id then
			if not getElementData(col,"Parts_inVehicle") == 1 then
				return veh[2]*1.3
			end
			return veh[2]
		end
	end
end

function onPlayerEnterDayzVehicle(veh,seat)
	local col = getElementData(veh,"parent")
	local id = getElementModel(veh)
	if not seat == 0 then return end
	local tires,engine,parts,lamp = getVehicleAddonInfos (id)
	setElementData(veh,"maxfuel",getVehicleMaxFuel(col))
	setElementData(veh,"needtires",tires)
	setElementData(veh,"needengines",engine)
	setElementData(veh,"needparts",parts)
	setElementData(veh,"needlamp",lamp)
	if ((getElementData(col,"Tire_inVehicle") or 0) < tonumber(tires)) then
		setVehicleEngineState(veh, false)
		return	
	end
	if ((getElementData(col,"Engine_inVehicle") or 0) < tonumber(engine)) then
		setVehicleEngineState(veh,false)
		return
	end
	if not getElementData(col,"Parts_inVehicle") then
		setElementData(col,"Parts_inVehicle",math.random(0,parts))
	end
	if getElementData(col,"Lamp_inVehicle") then
        setVehicleOverrideLights(veh, 2)
	end
	if (getElementData(col,"fuel") or 0) <= 1 and not (id == 509) then
		triggerClientEvent (source, "displayClientInfo", source,"Vehicle","Brak paliwa!",22,255,0)
		setVehicleEngineState(veh, false)
		return
	end
	if (id == 509) then
		setVehicleEngineState(veh, true)
	end
	bindKey(source,"k","down",setEngineStateByPlayer)
    bindKey(source,"l","down",setLampStateByPlayer)
	triggerClientEvent(source,"disableMenu",source)
	triggerClientEvent(source,"onPlayerFlashlightOff",source)
end
addEventHandler ( "onPlayerVehicleEnter", getRootElement(), onPlayerEnterDayzVehicle )

function onPlayerExitDayzVehicle(veh,seat)
	unbindKey(source,"k","down",setEngineStateByPlayer)
	unbindKey(source,"l","down",setLampStateByPlayer)
	setVehicleOverrideLights (veh, 1)
	triggerClientEvent(source,"disableMenu",source)
end
addEventHandler ( "onPlayerVehicleExit", getRootElement(), onPlayerExitDayzVehicle )

function setVehiclesFuelPerMinute ()
	for i,veh in ipairs(getElementsByType("vehicle")) do
		if getVehicleEngineState(veh) == true then
			if isElement(getElementData(veh,"parent")) then
				if getElementData(getElementData(veh,"parent"),"fuel") > 0 then
					setElementData(getElementData(veh,"parent"),"fuel",getElementData(getElementData(veh,"parent"),"fuel")-getVehicleFuelRemove(getElementModel(veh),getElementData(veh,"parent")))
				else
					if not getElementModel(veh) == 509 then
						setVehicleEngineState ( veh, false )
					end
				end
			end
		end
	end
end
setTimer(setVehiclesFuelPerMinute,19000,0)

function setVehiclesFuelPerMinute2 ()
	for i,veh in ipairs(getElementsByType("vehicle")) do
		if getVehicleEngineState(veh) == true then
			if isElement(getElementData(veh,"parent")) then
				if getElementData(getElementData(veh,"parent"),"fuel") < 0 then
					if not getElementModel(veh) == 509 then
						setVehicleEngineState ( veh, false )
					end
				end
			end
		end
	end
end
setTimer(setVehiclesFuelPerMinute2,1000,0)

function isVehicleReadyToStart2 (veh)
	if getElementData(getElementData(veh,"parent"),"fuel") > 0 then
		local tires,engine,parts,lamp = getVehicleAddonInfos (getElementModel(veh))
		if (getElementData(getElementData(veh,"parent"),"Tire_inVehicle") or 0) > tonumber(tires) and (getElementData(getElementData(veh,"parent"),"Engine_inVehicle") or 0) > tonumber(engine) then 
			setVehicleEngineState(veh, true)
		end
	end
	setTimer(isVehicleReadyToStart2,1000,1,veh)
end

repairTimer = {}
function repairVehicle (veh)
	local source = source
	if getElementData(veh, "deadVehicle") then return end
	if repairTimer[veh] then triggerClientEvent (source, "displayClientInfo", source,"Vehicle",getVehicleName(veh)..": nie potrzebuje naprawy!",255,22,0) return end
	local health = math.floor(getElementHealth(veh))
	repairTimer[veh] = setTimer(fixVehicleDayZ,(1200-health)*120,1,veh,source)
	setElementFrozen (veh,true)
	setElementFrozen (source,true)
	setElementData(veh,"repairer",source)
	setElementData(source,"repairingvehicle",veh)
	setPedAnimation (source,"SCRATCHING","sclng_r",nil,true,false)
	triggerClientEvent (source, "displayClientInfo", source,"Vehicle","Naprawiasz "..getVehicleName(veh),22,255,0)
	setVehicleDamageProof(veh, true) 
end
addEvent("repairVehicle",true)
addEventHandler("repairVehicle",getRootElement(),repairVehicle)

function fixVehicleDayZ(veh,player)
	if getElementData(veh, "deadVehicle") then return end
	setElementHealth(veh,1000)
	fixVehicle (veh)
	setPedAnimation(player,false)
	setElementFrozen(veh,false)
	setElementFrozen(player,false)
	repairTimer[veh] = nil
	if isTimer(repairTimer[veh]) then killTimer(repairTimer[veh]) end
	setElementData(veh,"repairer",nil)
	setElementData(player,"repairingvehicle",nil)
	triggerClientEvent (player, "displayClientInfo", player,"Vehicle","Zakońcyzłeś naprawę "..getVehicleName(veh),22,255,0)
	setVehicleDamageProof(veh, false)
end

function stopFixxingWhileMoving()
	local veh = getElementData(source,"repairingvehicle")
	setPedAnimation(source)
	setElementFrozen (veh,false)
	setElementFrozen(source,false)
	setElementData(veh,"repairer",nil)
	setElementData(source,"repairingvehicle",nil)
	triggerClientEvent (source, "displayClientInfo", source,"Vehicle","Przestałeś naprawiać "..getVehicleName(veh),255,22,0)
	killTimer(repairTimer[veh])
	repairTimer[veh] = nil
	setVehicleDamageProof(veh, false)
end
addEvent("onClientMovesWhileAnimation",true)
addEventHandler("onClientMovesWhileAnimation",getRootElement(),stopFixxingWhileMoving)

function debugFixxing()
	for i,veh in ipairs(getElementsByType("vehicle")) do
		if getElementData(veh,"repairer") == source then
			outputDebugString("Vehicle repairer disconnected - destroyed tables")
			killTimer(repairTimer[veh])
			setElementFrozen (veh,false)
			setElementFrozen(source,false)
			repairTimer[veh] = nil
			setElementData(veh,"repairer",nil)
			setVehicleDamageProof(veh, false)
		end	
	end
end
addEventHandler("onPlayerQuit",getRootElement(),debugFixxing)

function setEngineStateByPlayer (playersource)
	local veh = getPedOccupiedVehicle (playersource)
	if getElementModel(veh) == 509 then return end
	if getElementData(getElementData(veh,"parent"),"fuel") < 1 then return end
	setVehicleEngineState(veh, not getVehicleEngineState(veh))
	if getVehicleEngineState(veh) == true then
		triggerClientEvent (playersource, "displayClientInfo", playersource,"Vehicle","Silnik włączony!",22,255,0)
	else
		triggerClientEvent (playersource, "displayClientInfo", playersource,"Vehicle","Silnik wułączony!",255,22,0)
	end
end

function setLampStateByPlayer(playersource)
	local veh = getPedOccupiedVehicle(playersource)
    local col = getElementData(veh,"parent")
    if getElementData(col,"Lamp_inVehicle") then
	if (getVehicleOverrideLights(veh) == 2) then
		setVehicleOverrideLights(veh, 1)
		triggerClientEvent (playersource, "displayClientInfo", playersource,"Vehicle","Światła samochodowe wyłączone!",255,22,0)
	else
		setVehicleOverrideLights(veh, 2)
		triggerClientEvent (playersource, "displayClientInfo", playersource,"Vehicle","Światła samochodowe włączone!",22,255,0)
	end
	end
end