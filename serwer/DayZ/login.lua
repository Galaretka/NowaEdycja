--[[
#---------------------------------------------------------------#
----*                   SUPRILOAD DAYZ 0.8.5                *----
----* CREDITOS :FUTZ
----* CRIADOR :FUTZ
----* SKYPE:gtacspest
----*
----*                                                       *----
#---------------------------------------------------------------#
]]

local spawnPositions = {
{902.3125,-1492.1103515625,13.538821220398},
{966.1748046875,-2150.470703125,13.09375},
{512.8349609375,-1898.9736328125,1.3703856468201},
{21.7275390625,-1126.27734375,1.8762073516846},
{-219.787109375,-795.671875,2.9512844085693},
{-371.0751953125,-394.6357421875,7.6121063232422},
{-326.55078125,-466.794921875,1.9922351837158},
{-374.4443359375,291.7421875,2.0757875442505},
{-211.5439453125,502.62890625,2.3015012741089},
{-722.3408203125,692.6171875,8.1016044616699},
{-720.08984375,890.5712890625,12.865586280823},
{-967.7109375,1077.095703125,25.033414840698},
{-1278.0537109375,1650.943359375,1.5826568603516},
{-1949.2509765625,2192.650390625,2.7079911231995},
{-2038.056640625,2361.8212890625,3.4432563781738},
{-2350.1513671875,2500.2568359375,1.7285346984863},
{-2677.82421875,1596.7861328125,3.2226257324219},
{-2811.9921875,1313.4111328125,7.1015625},
{-2946.7001953125,1199.36328125,2.2172622680664},
{-2976.6044921875,502.0849609375,2.4296875},
{-2922.3974609375,-7.40234375,1.3853785991669},
{-2863.2470703125,-421.8037109375,11.394373893738},
{-2537.658203125,-326.470703125,37.873321533203},
{-1737.8984375,-723.3603515625,18.194038391113},
{-1662.3046875,-1714.96875,4.1122455596924},
{-1412.67578125,-2036.2177734375,1.1549339294434},
{-1198.798828125,-2569.8955078125,3.6294479370117},
{-1356.197265625,-2961.5361328125,1.247499704361},
{-1865.197265625,-2764.0712890625,2.4442844390869},
{-2430.919921875,-2858.9375,3},
{1269.791015625,-2650.888671875,1.9811255931854},
{2784.7919921875,-2493.3515625,13.653935432434},
{2842.3291015625,-2221.7529296875,1.3113718032837},
{2936.6337890625,-751.876953125,4.3199844360352},
{2804.23828125,265.4501953125,4.6560802459717},
{833.4658203125,2912.7666015625,2.6094741821289},
{-894.361328125,2682.052734375,41.755664825439},
{-894.73046875,2680.48046875,41.946971893311},
{-1670.068359375,2577.337890625,83.077362060547},
}
local playerDataTable = {
  {"alivetime"},
  {"skin"},
  {"MAX_Slots"},
  {"bandit"},
  {"blood"},
  {"food"},
  {"thirst"},
  {
    "temperature"
  },
  {
    "currentweapon_1"
  },
  {
    "currentweapon_2"
  },
  {
    "currentweapon_3"
  },
  {"bleeding"},
  {"brokenbone"},
  {"pain"},
  {"cold"},
  {"infection"},
  {"humanity"},
  {
    "zombieskilled"
  },
  {"headshots"},
  {"murders"},
  {
    "banditskilled"
  },
  {"Wood Pile"},
  {"Bandage"},
  {
    "Water Bottle"
  },
  {"Pasta Can"},
  {"Beans Can"},
  {"Burger"},
  {
    "Box of Matches"
  },
  {"G17 Mag"},
  {"Makarov SD Mag"},
  {
    ".45 ACP"
  },
  {"G17"},
  {"Makarov SD"},
  {
    "Winchester 1866"
  },
  {"PDW"},
  {
    "Hunting Knife"
  },
  {"Hatchet"},
  {"Pizza"},
  {"Morphine"},
  {
    "Soda Bottle"
  },
  {
    "Empty Gas Canister"
  },
  {
    "Full Gas Canister"
  },
  {"Roadflare"},
  {"Milk"},
  {"PDW Mag"},
  {"MP5A5 Mag"},
  {"30Rnd. AKS"},
  {"STANAG Mag"},
  {"Tear Gas"},
  {"M67 Frag Grenade"},
  {
    "Revolver"
  },
  {
    "Sawn-Off Shotgun"
  },
  {
    "SPAZ-12 Combat Shotgun"
  },
  {"MP5A5"},
  {"Watch"},
  {"Medic Kit"},
  {"Heat Pack"},
  {
    "Lee Enfield"
  },
  {"PDW"},
  {"AKS-74 Kobra"},
  {"Blood Bag"},
  {"GPS"},
  {"Map"},
  {"Toolbox"},
  {"Wire Fence"},
  {"Tire"},
  {"Engine"},
  {"Tank Parts"},
  {
    "M136 Rocket"
  },
  {"DMR Mag"},
  {
    "Lee Enfield Mag"
  },
  {"M4A1 CCO"},
  {"DMR"},
  {"Satchel"},
  {
    "Infrared Goggles"
  },
  {
    "Night Vision Goggles"
  },
  {"Tent"},
  {"Raw Meat"},
  {
    "Cooked Meat"
  },
  {
    "Camouflage Clothing"
  },
  {
    "Sniper Clothing"
  },
  {
    "Sniper Clothing II"
  },
  {
    "Military Clothing"
  },
  {
    "Military Clothing II"
  },
  {
    "Military Clothing III"
  },
  {
    "Ghillie Suit"
  },
  {
    "Ghillie Suit II"
  },
  {
    "Ghillie Suit III"
  },
  {
    "Civilian Clothing"
  },
  {
    "Survivor Clothing"
  },
  {"Painkiller"},
  {"Binoculars"},
  {
    "Empty Water Bottle"
  },
  {
    "Empty Soda Cans"
  },
  {
    "Scruffy Burgers"
  },
  {"1866 Slug"},
  {"2Rnd. Slug"},
  {
    "SPAZ-12 Pellet"
  },
  {
    "Radio Device"
  },
  {
    "Machete"
  },
  {"Crowbar"},
  {"Golf Club"},
  {
    "Radio Device"
  },
  {"Parachute"}
}
function playerLogin(username, pass, player)
  local playerID = getAccountData(getPlayerAccount(player), "playerID")
  account = getPlayerAccount(player)
  local x, y, z = getAccountData(account, "last_x"), getAccountData(account, "last_y"), getAccountData(account, "last_z")
  local skin = getAccountData(account, "skin")
  createZombieTable(player)
  if getAccountData(account, "isDead") then
    spawnDayZPlayer(player)
    return
  end
  spawnPlayer(player, x, y, z, math.random(0, 360), skin, 0, 0)
  fadeCamera(player, true)
  setCameraTarget(player, player)
  playerCol = createColSphere(x, y, z, 1.5)
  setElementData(player, "playerCol", playerCol)
  attachElements(playerCol, player, 0, 0, 0)
  setElementData(playerCol, "parent", player)
  setElementData(playerCol, "player", true)
  for i, data in ipairs(playerDataTable) do
    local elementData = getAccountData(account, data[1])
    if not elementData and data[1] ~= "brokenbone" and data[1] ~= "pain" and data[1] ~= "cold" and data[1] ~= "infection" and data[1] ~= "currentweapon_1" and data[1] ~= "currentweapon_2" and data[1] ~= "currentweapon_3" then
      if data[1] == "bandit" then
      else
        elementData = 0
      end
    end
    setElementData(player, data[1], elementData)
  end
  setElementData(player, "logedin", true)
  local weapon = getElementData(player, "currentweapon_1")
  if weapon then
    local ammoData, weapID = getWeaponAmmoType(weapon)
    giveWeapon(player, weapID, getElementData(player, ammoData), true)
  end
  local weapon = getElementData(player, "currentweapon_2")
  if weapon then
    local ammoData, weapID = getWeaponAmmoType(weapon)
    giveWeapon(player, weapID, getElementData(player, ammoData), false)
  end
  local weapon = getElementData(player, "currentweapon_3")
  if weapon then
    local ammoData, weapID = getWeaponAmmoType(weapon)
    giveWeapon(player, weapID, getElementData(player, ammoData), false)
  end
  setElementModel(player, getElementData(player, "skin"))
  setElementData(player, "admin", getAccountData(account, "admin") or false)
  setElementData(player, "supporter", getAccountData(account, "supporter") or false)
  triggerClientEvent(player, "onClientPlayerDayZLogin", player)
end
addEvent("onPlayerDayZLogin", true)
addEventHandler("onPlayerDayZLogin", getRootElement(), playerLogin)
Skins = {}
function playerRegister(username, pass, player)
  triggerClientEvent(player, "sex", player)
  local number = math.random(table.size(spawnPositions))
  local x, y, z = spawnPositions[number][1], spawnPositions[number][2], spawnPositions[number][3]
  spawnPlayer(player, x, y, z, math.random(0, 360), 73, 0, 0)
  fadeCamera(player, true)
  setCameraTarget(player, player)
  playerCol = createColSphere(x, y, z, 1.5)
  attachElements(playerCol, player, 0, 0, 0)
  setElementData(playerCol, "parent", player)
  setElementData(playerCol, "player", true)
  for i, data in ipairs(playerDataTable) do
    if data[1] == "Bandage" then
      setElementData(player, data[1], 2)
    elseif data[1] == "Painkiller" then
      setElementData(player, data[1], 1)
	elseif data[1] == "Parachute" then
      setElementData(player, data[1], 1)
	elseif data[1] == "G17 Mag" then
      setElementData(player, data[1], 25)
	elseif data[1] == "G17" then
      setElementData(player, data[1], 1)
    elseif data[1] == "MAX_Slots" then
      setElementData(player, data[1], 8)
    elseif data[1] == "skin" then
      setElementData(player, data[1], 73)
    elseif data[1] == "blood" then
      setElementData(player, data[1], 12000)
    elseif data[1] == "temperature" then
      setElementData(player, data[1], 37)
    elseif data[1] == "brokenbone" then
      setElementData(player, data[1], false)
    elseif data[1] == "pain" then
      setElementData(player, data[1], false)
    elseif data[1] == "cold" then
      setElementData(player, data[1], false)
    elseif data[1] == "infection" then
      setElementData(player, data[1], false)
    elseif data[1] == "food" then
      setElementData(player, data[1], 100)
    elseif data[1] == "thirst" then
      setElementData(player, data[1], 100)
    elseif data[1] == "currentweapon_1" then
      setElementData(player, data[1], false)
    elseif data[1] == "currentweapon_2" then
      setElementData(player, data[1], false)
    elseif data[1] == "currentweapon_3" then
      setElementData(player, data[1], false)
    elseif data[1] == "bandit" then
      setElementData(player, data[1], false)
    elseif data[1] == "humanity" then
      setElementData(player, data[1], 2500)
    else
      setElementData(player, data[1], 0)
    end
  end
  account = getAccount(username)
  local value = getAccounts()
  local value = #value
  setElementData(player, "playerID", value + 1)
  setAccountData(account, "playerID", value + 1)
  setElementData(player, "logedin", true)
  createZombieTable(player)
end
addEvent("onPlayerDayZRegister", true)
addEventHandler("onPlayerDayZRegister", getRootElement(), playerRegister)
function saveAccounts()
  local account = getPlayerAccount(source)
  if account then
    for i, data in ipairs(playerDataTable) do
      setAccountData(account, data[1], getElementData(source, data[1]))
    end
    local x, y, z = getElementPosition(source)
    setAccountData(account, "last_x", x)
    setAccountData(account, "last_y", y)
    setAccountData(account, "last_z", z)
    destroyElement(getElementData(source, "playerCol"))
  end
  setElementData(source, "logedin", false)
end
addEventHandler("onPlayerQuit", getRootElement(), saveAccounts)
function saveAccounts2()
  for i, player in ipairs(getElementsByType("player")) do
    local account = getPlayerAccount(player)
    if account then
      for i, data in ipairs(playerDataTable) do
        setAccountData(account, data[1], getElementData(player, data[1]))
      end
      local x, y, z = getElementPosition(player)
      setAccountData(account, "last_x", x)
      setAccountData(account, "last_y", y)
      setAccountData(account, "last_z", z)
    end
  end
end
addEventHandler("onResourceStop", getRootElement(), saveAccounts2)
local vehicleDataTable = {
  {"MAX_Slots"},
  {
    "Tire_inVehicle"
  },
  {
    "Engine_inVehicle"
  },
  {
    "Parts_inVehicle"
  },
  {"fuel"},
  {"Wood Pile"},
  {"Bandage"},
  {
    "Water Bottle"
  },
  {"Pasta Can"},
  {"Beans Can"},
  {"Burger"},
  {
    "Box of Matches"
  },
  {"G17 Mag"},
  {"G17"},
  {"Makarov SD"},
  {
    ".45 ACP"
  },
  {
    "Winchester 1866"
  },
  {"PDW"},
  {
    "Hunting Knife"
  },
  {"Morphine"},
  {"Hatchet"},
  {"Pizza"},
  {
    "Soda Bottle"
  },
  {
    "Empty Gas Canister"
  },
  {
    "Full Gas Canister"
  },
  {"Roadflare"},
  {"Milk"},
  {"PDW Mag"},
  {"MP5A5 Mag"},
  {"30Rnd. AKS"},
  {"STANAG Mag"},
  {"Tear Gas"},
  {"M67 Frag Grenade"},
  {
    "Revolver"
  },
  {
    "Sawn-Off Shotgun"
  },
  {
    "SPAZ-12 Combat Shotgun"
  },
  {"MP5A5"},
  {"Watch"},
  {"Medic Kit"},
  {"Heat Pack"},
  {
    "Lee Enfield"
  },
  {"AKS-74 Kobra"},
  {"Blood Bag"},
  {"GPS"},
  {"Map"},
  {"Toolbox"},
  {"Wire Fence"},
  {"Tire"},
  {"Engine"},
  {"Tank Parts"},
  {
    "M136 Rocket"
  },
  {"DMR Mag"},
  {
    "Lee Enfield Mag"
  },
  {"M4A1 CCO"},
  {"DMR"},
  {"Satchel"},
  {
    "Infrared Goggles"
  },
  {
    "Night Vision Goggles"
  },
  {"Tent"},
  {"Raw Meat"},
  {
    "Cooked Meat"
  },
  {
    "Camouflage Clothing"
  },
  {
    "Sniper Clothing"
  },
  {
    "Sniper Clothing II"
  },
  {
    "Military Clothing"
  },
  {
    "Military Clothing II"
  },
  {
    "Military Clothing III"
  },
  {
    "Ghillie Suit"
  },
  {
    "Ghillie Suit II"
  },
  {
    "Ghillie Suit III"
  },
  {
    "Civilian Clothing"
  },
  {
    "Survivor Clothing"
  },
  {"Painkiller"},
  {"Binoculars"},
  {
    "Empty Water Bottle"
  },
  {
    "Empty Soda Cans"
  },
  {
    "Scruffy Burgers"
  },
  {"1866 Slug"},
  {"2Rnd. Slug"},
  {
    "SPAZ-12 Pellet"
  },
  {
    "Czech Vest Pouch"
  },
  {
    "Patrol Pack"
  },
  {
    "Assault Pack (ACU)"
  },
  {
    "Survival (ACU)"
  },
  {"Alice Pack"},
  {
    "British Assault Pack"
  },
  {
    "Czech Backpack"
  },
  {
    "Coyote Backpack"
  },
  {"Anarchy Backpack"}, 
  {"Camp Backpack"}, 
  {"Ghillie Backpack"}, 
  {"Military Backpack"}, 
  {"Kryss Backpack"}, 
  {"OSPack Backpack"}, 
  {
    "Radio Device"
  },
  {
    "Machete"
  },
  {"Crowbar"},
  {"Golf Club"},
  {"Parachute"}
}
function saveallvehicles(ps, command)
  counter = 0
  counterTent = 0
  local vehicleManager = getAccount("vehicleManager", "ds4f9$")
  for i, col in ipairs(getElementsByType("colshape")) do
    local veh = getElementData(col, "vehicle")
    local helicrash = getElementData(col, "helicrash")
    local hospitalbox = getElementData(col, "hospitalbox")
    local tent = getElementData(col, "tent")
    if veh and not helicrash or veh and not hospitalbox then
      if tent then
        counterTent = counterTent + 1
        account = getAccount("tent_number_" .. counterTent, "ds4f9$") or false
        if not account then
          account = addAccount("tent_number_" .. counterTent, "ds4f9$")
        end
        do
          local tent = getElementData(col, "parent")
          local x, y, z = getElementPosition(tent)
          local rx, ry, rz = getElementRotation(tent)
          setAccountData(account, "last_x", x)
          setAccountData(account, "last_y", y)
          setAccountData(account, "last_z", z)
          setAccountData(account, "last_rx", rx)
          setAccountData(account, "last_ry", ry)
          setAccountData(account, "last_rz", rz)
          for i, data in ipairs(vehicleDataTable) do
            setAccountData(account, data[1], getElementData(col, data[1]))
          end
        end
      else
        counter = counter + 1
        account = getAccount("vehicle_number_" .. counter, "ds4f9$") or false
        if not account then
          account = addAccount("vehicle_number_" .. counter, "ds4f9$")
        end
        setAccountData(account, "spawn_x", getElementData(col, "spawn")[2])
        setAccountData(account, "spawn_y", getElementData(col, "spawn")[3])
        setAccountData(account, "spawn_z", getElementData(col, "spawn")[4])
        for i, data in ipairs(vehicleDataTable) do
          setAccountData(account, data[1], getElementData(col, data[1]))
        end
        local vehicle = getElementData(col, "parent")
        local model = getElementModel(vehicle)
        local x, y, z = getElementPosition(vehicle)
        local rx, ry, rz = getElementRotation(vehicle)
        local health = getElementHealth(vehicle)
        setAccountData(account, "last_x", x)
        setAccountData(account, "last_y", y)
        setAccountData(account, "last_z", z)
        setAccountData(account, "last_rx", rx)
        setAccountData(account, "last_ry", ry)
        setAccountData(account, "last_rz", rz)
        setAccountData(account, "health", health)
        setAccountData(account, "model", model)
        setAccountData(account, "isExploded", getElementData(vehicle, "isExploded") or false)
      end
    end
    setAccountData(vehicleManager, "vehicleamount", counter)
    setAccountData(vehicleManager, "tentamount", counterTent)
  end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), saveallvehicles)
function doBackup()
  outputChatBox("Trwa robienie kopii zapasowej serwera! MOŻLIWY LAG!", getRootElement(), 27, 89, 224, true)
  saveallvehicles()
  outputChatBox("Gotowe!", getRootElement(), 27, 89, 224, true)
end
function doBackup2(ps)
    if isObjectInACLGroup ( "user." ..getAccountName(getPlayerAccount(ps)), aclGetGroup ( "Admin" ) ) then
		outputChatBox ("Trwa robienie kopii zapasowej serwera! MOŻLIWY LAG!",getRootElement(),27, 89, 224,true)
		saveallvehicles()
		outputChatBox("Gotowe!", getRootElement(), 27, 89, 224, true)
	end
end
addCommandHandler("backup",doBackup2)
function checkDoBackup()
  if gameplayVariables.backupenabled then
    setTimer(doBackup, gameplayVariables.backupinterval, 0)
  end
end
checkDoBackup()
function createVehicleOnServerStart()
  local vehicleManager = getAccount("vehicleManager", "ds4f9$")
  for i = 1, getAccountData(vehicleManager, "vehicleamount") or 0 do
    wastedVehicle = false
    vehicle = getAccount("vehicle_number_" .. i, "ds4f9$")
    if not vehicle then
      break
    end
    if getAccountData(vehicle, "isExploded") == true then
      setAccountData(vehicle, "health", 1000)
      wastedVehicle = true
    end
    local veh = createVehicle(getAccountData(vehicle, "model"), getAccountData(vehicle, "last_x"), getAccountData(vehicle, "last_y"), getAccountData(vehicle, "last_z"), getAccountData(vehicle, "last_rx"), getAccountData(vehicle, "last_ry"), getAccountData(vehicle, "last_rz"))
    vehCol = createColSphere(getAccountData(vehicle, "last_x"), getAccountData(vehicle, "last_y"), getAccountData(vehicle, "last_z"), 4)
    attachElements(vehCol, veh, 0, 0, 0)
    setElementData(vehCol, "parent", veh)
    setElementData(veh, "parent", vehCol)
    setElementData(vehCol, "vehicle", true)
    setElementData(vehCol, "MAX_Slots", getAccountData(vehicle, "MAX_Slots"))
    setElementHealth(veh, getAccountData(vehicle, "health"))
    xxx, yyy, zzz = getAccountData(vehicle, "spawn_x"), getAccountData(vehicle, "spawn_y"), getAccountData(vehicle, "spawn_z")
    setElementData(vehCol, "spawn", {
      getAccountData(vehicle, "model"),
      xxx,
      yyy,
      zzz
    })
    if wastedVehicle then
      if getAccountData(vehicle, "model") == 497 then
        item_id = math.random(table.size(hunterSpawns))
        xxx, yyy, zzz = hunterSpawns[item_id][1], hunterSpawns[item_id][2], hunterSpawns[item_id][3]
      end
      if getAccountData(vehicle, "model") == 487 then
        local item_id = math.random(table.size(maverikSpawns))
        x, y, z = maverikSpawns[item_id][1], maverikSpawns[item_id][2], maverikSpawns[item_id][3]
      end
      setElementPosition(veh, xxx, yyy, zzz + 1)
      setElementRotation(veh, 0, 0, 0)
      local tires, engine, parts = getVehicleAddonInfos(getElementModel(veh))
      setElementData(vehCol, "Tire_inVehicle", math.random(0, tires))
      setElementData(vehCol, "Engine_inVehicle", math.random(0, engine))
      setElementData(vehCol, "Parts_inVehicle", math.random(0, parts))
    end
    setElementData(vehCol, "fuel", getAccountData(vehicle, "fuel"))
    if not wastedVehicle then
      for i, data in ipairs(vehicleDataTable) do
        setElementData(vehCol, data[1], getAccountData(vehicle, data[1]))
      end
    else
      if getElementModel(veh) == 433 or getElementModel(veh) == 470 then
        for i, items in ipairs(lootItems.helicrashsides) do
          local randomNumber = math.random(1, 10)
          if randomNumber == 5 then
            setElementData(vehCol, items[1], math.random(1, 2))
          end
        end
      end
      setElementData(vehCol, "fuel", 10)
    end
  end
  for i = 1, getAccountData(vehicleManager, "tentamount") or 0 do
    tentData = getAccount("tent_number_" .. i, "ds4f9$")
    if not tentData then
      break
    end
    tent = createObject(3243, getAccountData(tentData, "last_x"), getAccountData(tentData, "last_y"), getAccountData(tentData, "last_z"), 0, 0, getAccountData(tentData, "last_rz") or 0)
    setObjectScale(tent, 1.3)
    tentCol = createColSphere(getAccountData(tentData, "last_x"), getAccountData(tentData, "last_y"), getAccountData(tentData, "last_z"), 4)
    attachElements(tentCol, tent, 0, 0, 0)
    setElementData(tentCol, "parent", tent)
    setElementData(tent, "parent", tentCol)
    setElementData(tentCol, "tent", true)
    setElementData(tentCol, "vehicle", true)
    setElementData(tentCol, "MAX_Slots", 100)
    for i, data in ipairs(vehicleDataTable) do
      setElementData(tentCol, data[1], getAccountData(tentData, data[1]))
    end
  end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), createVehicleOnServerStart)
