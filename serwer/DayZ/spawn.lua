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
{-472.31646728516,-2027.1087646484,48.604362487793},
{2835.5764160156,619.0185546875,25.28318977356},
{2959.6376953125,-707.39294433594,1.7367721796036},
{-2021.0450439453,-972.63500976563,32.171875},
{3050.6965332031,-725.43695068359,1.5140626430511},
{-2421.0698242188,-608.88677978516,132.5625},
{1482.2331542969,2952.6767578125,8.1399536132813},
{2992.1428222656,-576.81604003906,2.2391223907471},
{2992.1428222656,-576.81604003906,2.2391223907471},
{-2808.5197753906,-6.8173551559448,7.03125},
{264.17779541016,2904.7980957031,7.563850402832},
{2793.876953125,-1092.8310546875,30.71875},
{2808.0227050781,-1189.2462158203,25.349853515625},
{-1705.3624267578,15.839871406555,3.5546875},
{2461.279296875,1333.3784179688,10.8203125},
{-1756.9256591797,942.41412353516,24.890625},
{1450.6628417969,-2287.0241699219,13.546875},
{-689.39819335938,935.35614013672,13.6328125},
{2676.6889648438,-1954.2388916016,13.54687},
{-2487.7866210938,-1232.1921386719,227.71823120117},
{991.31036376953,-2155.91796875,13.09375},
{-1967.3095703125,1065.5167236328,55.5703125},
{-2186.6958007813,2415.0881347656,5.15625},
{429.23767089844,-729.41046142578,24.585699081421},
{-1399.4266357422,2646.4702148438,55.6875},
{-1246.0500488281,-1292.1514892578,145.42044067383},
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
    "Bouteille"
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
  {"DMR Mag"},
  {"SVD Mag"},
  {"M107 Mag"},
  {
    "Lee Enfield Mag"
  },
  {"M4A1 CCO"},
  {"DMR"},
  {"SVD Camo"},
  {"M107"},
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
    "Military Clothing II"
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
  {"Binoculars"},
  {
    "Machete"
  },
  {"Crowbar"},
  {"Golf Club"},
  {"Parachute"}
}
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
    "Bouteille"
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
  {"DMR Mag"},
  {"SVD Mag"},
  {"M107 Mag"},
  {
    "Lee Enfield Mag"
  },
  {"M4A1 CCO"},
  {"DMR"},
  {"SVD Camo"},
  {"M107"},
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
    "Military Clothing II"
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
  {"Alice Pack"},
  {
    "Radio Device"
  },
  {
    "Coyote Backpack"
  },
  {
    "British Assault Pack"
  },
  {
    "Czech Backpack"
  },
  {"Anarchy Backpack"}, 
  {"Camp Backpack"}, 
  {"Ghillie Backpack"}, 
  {"Military Backpack"}, 
  {"Kryss Backpack"}, 
  {"OSPack Backpack"}, 
  {
    "Machete"
  },
  {"Crowbar"},
  {"Golf Club"}
}
Skins = {}
function spawnDayZPlayer(player)
  local number = math.random(table.size(spawnPositions))
  local x, y, z = spawnPositions[number][1], spawnPositions[number][2], spawnPositions[number][3]
  spawnPlayer(player, x, y, z + 0.5, math.random(0, 360), 73, 0, 0)
  fadeCamera(player, true)
  setCameraTarget(player, player)
  playerCol = createColSphere(x, y, z, 1.5)
  setElementData(player, "playerCol", playerCol)
  attachElements(playerCol, player, 0, 0, 0)
  setElementData(playerCol, "parent", player)
  setElementData(playerCol, "player", true)
  local account = getPlayerAccount(player)
  setAccountData(account, "isDead", false)
  setElementData(player, "isDead", false)
  setElementData(player, "logedin", true)
  setElementData(player, "Admin", getAccountData(account, "Admin") or false)
  setElementData(player, "Moderator", getAccountData(account, "Mod-CHAT") or false)
  setElementData(player, "SuperModerator", getAccountData(account, "Moderator") or false)
  setElementData(player, "supporter", getAccountData(account, "supporter") or false)
  for i, data in ipairs(playerDataTable) do
    if data[1] == "Bandage" then
      setElementData(player, data[1], 2)
    elseif data[1] == "Painkiller" then
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
end
function checkBuggedAccount()
  for i, player in ipairs(getElementsByType("player")) do
    local account = getPlayerAccount(player)
    if not account then
      return
    end
    if getElementData(player, "logedin") and getElementModel(player) == 0 then
      spawnDayZPlayer(player)
      outputChatBox(getPlayerName(player) .. ", konto jest zbugowane! Następuje reset konta..", getRootElement(), 22, 255, 22, true)
    end
  end
end
setTimer(checkBuggedAccount, 90000, 0)
function notifyAboutExplosion2()
  for i, player in pairs(getVehicleOccupants(source)) do
    triggerEvent("kilLDayZPlayer", player)
  end
end
addEventHandler("onVehicleExplode", getRootElement(), notifyAboutExplosion2)
function destroyDeadPlayer(ped, pedCol)
  destroyElement(ped)
  destroyElement(pedCol)
end
function kilLDayZPlayer(killer, headshot, weapon)
  pedCol = false
  local account = getPlayerAccount(source)
  if not account then
    return
  end
  killPed(source)
  triggerClientEvent(source, "hideInventoryManual", source)
  if getElementData(source, "alivetime") > 10 and not isElementInWater(source) then
    local x, y, z = getElementPosition(source)
    if getDistanceBetweenPoints3D(x, y, z, 6000, 6000, 0) > 200 then
      local x, y, z = getElementPosition(source)
      local rotX, rotY, rotZ = getElementRotation(source)
      local skin = getElementModel(source)
      local ped = createPed(skin, x, y, z, rotZ)
      pedCol = createColSphere(x, y, z, 1.5)
      killPed(ped)
      setTimer(destroyDeadPlayer, 2700000, 1, ped, pedCol)
      attachElements(pedCol, ped, 0, 0, 0)
      setElementData(pedCol, "parent", ped)
      setElementData(pedCol, "playername", getPlayerName(source))
      setElementData(pedCol, "deadman", true)
      setElementData(pedCol, "MAX_Slots", getElementData(source, "MAX_Slots"))
      local time = getRealTime()
      local hours = time.hour
      local minutes = time.minute
      setElementData(pedCol, "deadreason", getPlayerName(source) .. " jest partwy. Przyczyna śmierci: " .. (weapon or "Unknown") .. ". Zmarł o: " .. hours .. ":" .. minutes .. ".")
    end
  end
  if killer then
    if not getElementData(source, "bandit") then
      addPlayerStats(killer, "humanity", math.random(-2500, -1000))
    else
      addPlayerStats(killer, "humanity", math.random(1000, 2500))
    end
    setElementData(killer, "murders", getElementData(killer, "murders") + 1)
    if 0 > getElementData(killer, "humanity") then
      setElementData(killer, "bandit", true)
    end
    if getElementData(source, "bandit") == true then
      setElementData(killer, "banditskilled", getElementData(killer, "banditskilled") + 1)
    end
    if headshot == true then
      setElementData(killer, "headshots", getElementData(killer, "headshots") + 1)
    end
  end
  if pedCol then
    for i, data in ipairs(playerDataTable) do
      local plusData = getElementData(source, data[1])
      if data[1] == "G17 Mag" then
        plusData = math.floor(getElementData(source, data[1]) / 7)
	

      elseif data[1] == "Makarov SD Mag" then
        plusData = math.floor(getElementData(source, data[1]) / 15)
      elseif data[1] == ".45 ACP" then
        plusData = math.floor(getElementData(source, data[1]) / 7)
      elseif data[1] == "PDW Mag" then
        plusData = math.floor(getElementData(source, data[1]) / 30)
      elseif data[1] == "MP5A5 Mag" then
        plusData = math.floor(getElementData(source, data[1]) / 20)
      elseif data[1] == "30Rnd. AKS" then
        plusData = math.floor(getElementData(source, data[1]) / 30)
      elseif data[1] == "STANAG Mag" then
        plusData = math.floor(getElementData(source, data[1]) / 20)
      elseif data[1] == "DMR Mag" then
        plusData = math.floor(getElementData(source, data[1]) / 5)
	  elseif data[1] == "SVD Mag" then
        plusData = math.floor(getElementData(source, data[1]) / 5)
	  elseif data[1] == "M107 Mag" then
        plusData = math.floor(getElementData(source, data[1]) / 5)
      elseif data[1] == "Lee Enfield Mag" then
        plusData = math.floor(getElementData(source, data[1]) / 10)
      elseif data[1] == "1866 Slug" then
        plusData = math.floor(getElementData(source, data[1]) / 7)
      elseif data[1] == "SPAZ-12 Pellet" then
        plusData = math.floor(getElementData(source, data[1]) / 7)
      elseif data[1] == "2Rnd. Slug" then
        plusData = math.floor(getElementData(source, data[1]) / 2)
      end
      setElementData(pedCol, data[1], plusData)
    end
    local skinID = getElementData(source, "skin")
    local skin = getSkinNameFromID(skinID)
    setElementData(pedCol, skin, 1)
    local backpackSlots = getElementData(source, "MAX_Slots")
    if backpackSlots == 14 then
      setElementData(pedCol, "Assault Pack (ACU)", 1)
	elseif backpackSlots == 10 then
      setElementData(pedCol, "Czech Vest Pouch", 1)
	elseif backpackSlots == 12 then
      setElementData(pedCol, "Patrol Pack", 1)
	elseif backpackSlots == 16 then
      setElementData(pedCol, "Survival (ACU) ", 1)
    elseif backpackSlots == 22 then
      setElementData(pedCol, "Alice Pack", 1)
	elseif backpackSlots == 26 then
      setElementData(pedCol, "British Assault Pack", 1)
    elseif backpackSlots == 30 then
      setElementData(pedCol, "Czech Backpack", 1)
    elseif backpackSlots == 43 then
      setElementData(pedCol, "Coyote Backpack", 1)
	elseif backpackSlots == 52 then
      setElementData(pedCol, "Anarchy Backpack", 1)
	elseif backpackSlots == 64 then
      setElementData(pedCol, "Military Backpack", 1)
	elseif backpackSlots == 76 then
      setElementData(pedCol, "Camp Backpack", 1)
	elseif backpackSlots == 88 then
      setElementData(pedCol, "Kryss Backpack", 1)
	elseif backpackSlots == 96 then
      setElementData(pedCol, "Ghillie Backpack", 1)
	elseif backpackSlots == 110 then
      setElementData(pedCol, "OSPack Backpack", 1)
    end
  end
  setTimer(setElementPosition, 500, 1, source, 6000, 6000, 0)
  triggerClientEvent(source, "onClientPlayerDeathInfo", source)
  setAccountData(account, "isDead", true)
  setElementData(source, "isDead", true)
  triggerClientEvent("onRollMessageStart", getRootElement(), "#FFFFFF" .. getPlayerName(source) .. " #FFFFFFumarł.", 0, 22, 255, "died")
  destroyElement(getElementData(source, "playerCol"))
  setTimer(spawnDayZPlayer, 5000, 1, source)
end
addEvent("kilLDayZPlayer", true)
addEventHandler("kilLDayZPlayer", getRootElement(), kilLDayZPlayer)
