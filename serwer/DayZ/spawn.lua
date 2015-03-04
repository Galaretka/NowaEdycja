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
  {
    "Lee Enfield Mag"
  },
  {"M4A1 CCO"},
  {"DMR"},
  {"SVD Camo"},
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
  {
    "Lee Enfield Mag"
  },
  {"M4A1 CCO"},
  {"DMR"},
  {"SVD Camo"},
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
