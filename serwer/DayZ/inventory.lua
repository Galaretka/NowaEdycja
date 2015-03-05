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

inventoryItems = {
["Weapons"] = {
["Primary Weapon"] = {
{"M4A1 CCO",3},
{"DMR",3},
{"SVD Camo",3},
{"SCAR-H",3},
{"AK-74U",3},
{"M16A2",3},
{"SIG50",3},
{"DSR",3},
{"Winchester 1866",3},
{"SPAZ-12 Combat Shotgun",3},
{"Sawn-Off Shotgun",3},
{"AKS-74 Kobra",3},
{"Lee Enfield",3},
},
["Secondary Weapon"] = {
{"G17",2},
{"Makarov SD",2},
{"PDW",2},
{"MP5A5",3},
{"Revolver",2},
{"Hunting Knife",1},
{"Hatchet", 2},
{"Machete",2},
{"Crowbar", 2},
{"Golf Club", 2},
},
["Specially Weapon"] = {
{"Parachute", 1},
{"Tear Gas", 1},
{"M67 Frag Grenade", 1},
{"Binoculars", 1},
}
},
["Ammo"] = {
{"G17 Mag",0.085},
{"Makarov SD Mag",0.085},
{".45 ACP",0.085},
{"PDW Mag",0.025},
{"MP5A5 Mag",0.025},
{"30Rnd. AKS",0.035},
{"STANAG Mag",0.035},
{"1866 Slug",0.067},
{"2Rnd. Slug",0.067},
{"SPAZ-12 Pellet",0.067},
{"DMR Mag", 0.1},
{"SVD Mag", 0.1},
{"Lee Enfield Mag",0.1},
{"30Rnd. SCAR",0.035},
{"30Rnd. 74U",0.035},
{"30Rnd. M16",0.035},
{"SIG50 Mag", 0.1},
{"DSR Mag", 0.1},
},
["Food"] = {
{"Water Bottle",1},
{"Pasta Can", 1},
{"Beans Can", 1},
{"Burger", 1},
{"Pizza", 1},
{"Soda Bottle",1 },
{"Milk", 1},
{"Cooked Meat",1},
},
["Items"] = {
{"Wood Pile", 2},
{"Bandage",1,"Uzyj Bandage"},
{"Roadflare",1,"Colocar Road Flare"},
{"Empty Gas Canister",2},
{"Full Gas Canister",2},
{"Medic Kit",2,"Uzyj"},
{"Heat Pack",1,"Uzyj"},
{"Painkiller",1,"Uzyj"},
{"Morphine",1,"Uzyj"},
{"Blood Bag",1,"Uzyj"},
{"Wire Fence",1,"Postaw drut kolczasty"},
{"Sandbag",3,"Postaw worki z piaskiem"},
{"Raw Meat", 1},
{"Tire", 2},
{"Engine", 5},
{"Tank Parts", 3},
{"Tent",3,"Montar Tenda"},
{"Military Clothing II",1,"Uzyj Skin"},
{"Sniper Clothing",1,"Uzyj Skin"},
{"Sniper Clothing II",1,"Uzyj Skin"},
{"Military Clothing",1,"Uzyj Skin"},
{"Military Clothing III",1,"Uzyj Skin"},
{"Civilian Clothing",1,"Uzyj Skin"},
{"Survivor Clothing",1,"Uzyj Skin"},
{"Ghillie Suit",1,"Uzyj Skin"},
{"Ghillie Suit II",1,"Uzyj Skin"},
{"Ghillie Suit III",1,"Uzyj Skin"},
{"Empty Water Bottle",1,"Você encheu a Garrafa de Water Boottle."},
{"Empty Soda Cans",1},
{"Scruffy Burgers",1},
{"Czech Vest Pouch",1},
{"Patrol Pack",1},
{"Assault Pack (ACU)",1},
{"Survival (ACU)",1},
{"Alice Pack", 1},
{"British Assault Pack",1},
{"Czech Backpack",1},
{"Coyote Backpack",1},
{"Anarchy Backpack",1}, 
{"Camp Backpack",1}, 
{"Ghillie Backpack",1}, 
{"Military Backpack",1}, 
{"Kryss Backpack",1}, 
{"OSPack Backpack",1}, 
},
["Toolbelt"] = {
{"Night Vision Goggles", 1},
{"Infrared Goggles",1},
{"Map",1},
{"Box of Matches",1,"Colocar Fogo"},
{"Watch",1},
{"GPS", 1},
{"Toolbox",1},
{"Radio Device",1},
},
}
------------------------------------------------------------------------------
--INVENTORY
local headline = {}
local gridlistItems = {}
local buttonItems = {}
local Inventario = {}

inventoryWindows = guiCreateWindow(0.15, 0.28, 0.72, 0.63, "", true)
headline.loot = guiCreateLabel(0.06, 0.05, 0.34, 0.09, "Gear", true, inventoryWindows)
guiLabelSetHorizontalAlign(headline.loot, "center")
guiSetFont(headline.loot, "default-bold-small")

headline.inventory = guiCreateLabel(0.6, 0.05, 0.34, 0.09, "INWENTARZ", true, inventoryWindows)
guiLabelSetHorizontalAlign(headline.inventory, "center")
guiSetFont(headline.inventory, "default-bold-small")
Inventario[1] = guiCreateStaticImage(0.01, 0.03, 1.99, 100, "images/inventory.png",true,inventoryWindows)
guiSetAlpha(Inventario[1],1)
guiSetProperty(Inventario[1],"Disabled","true")

gridlistItems.loot = guiCreateGridList(0.03, 0.1, 0.39, 0.83, true, inventoryWindows)
gridlistItems.loot_colum = guiGridListAddColumn(gridlistItems.loot, "Loot", 0.7)
gridlistItems.loot_colum_amount = guiGridListAddColumn(gridlistItems.loot, "", 0.2)

gridlistItems.inventory = guiCreateGridList(0.57, 0.11, 0.39, 0.83, true, inventoryWindows)
gridlistItems.inventory_colum = guiGridListAddColumn(gridlistItems.inventory, "INWENTARZ", 0.7)
gridlistItems.inventory_colum_amount = guiGridListAddColumn(gridlistItems.inventory, "", 0.2)

buttonItems.loot = guiCreateButton(0.42, 0.17, 0.04, 0.69, "->", true, inventoryWindows)
buttonItems.inventory = guiCreateButton(0.53, 0.17, 0.04, 0.69, "<-", true, inventoryWindows)

headline.slots = guiCreateLabel(0.62, 0.94, 0.29, 0.04, "Slotów:", true, inventoryWindows)
guiLabelSetHorizontalAlign(headline.slots, "center")
guiLabelSetVerticalAlign(headline.slots, "center")
guiSetFont(headline.slots, "default-bold-small")

headline.slots_loot = guiCreateLabel(0.07, 0.94, 0.29, 0.04, "Slotów:", true, inventoryWindows)
guiLabelSetHorizontalAlign(headline.slots_loot, "center")
guiLabelSetVerticalAlign(headline.slots_loot, "center")
guiSetFont(headline.slots_loot, "default-bold-small")

guiSetVisible(inventoryWindows, false)

function showInventory(key, keyState)
if getElementData(getLocalPlayer(), "logedin") and keyState == "down" then
    guiSetVisible(inventoryWindows, not guiGetVisible(inventoryWindows))
    showCursor(not isCursorShowing())
    refreshInventory()
    if guiGetVisible(inventoryWindows) == true then
      onClientOpenInventoryStopMenu()
    else
      hideRightClickInventoryMenu()
    end
    if isPlayerInLoot() then
      local col = getElementData(getLocalPlayer(), "currentCol")
      local gearName = getElementData(getLocalPlayer(), "lootname")
      refreshLoot(col, gearName)
    end
end
end
bindKey("j", "down", showInventory)
function showInventoryManual()
  guiSetVisible(inventoryWindows, not guiGetVisible(inventoryWindows))
  showCursor(not isCursorShowing())
  refreshInventory()
  if guiGetVisible(inventoryWindows) == true then
    onClientOpenInventoryStopMenu()
  end
end
function hideInventoryManual()
  guiSetVisible(inventoryWindows, false)
  showCursor(false)
  hideRightClickInventoryMenu()
end
addEvent("hideInventoryManual", true)
addEventHandler("hideInventoryManual", getLocalPlayer(), hideInventoryManual)
function refreshInventoryManual()
  refreshInventory()
end
addEvent("refreshInventoryManual", true)
addEventHandler("refreshInventoryManual", getLocalPlayer(), refreshInventoryManual)
function refreshLootManual(loot)
  refreshLoot(loot)
end
addEvent("refreshLootManual", true)
addEventHandler("refreshLootManual", getLocalPlayer(), refreshLootManual)






function refreshInventory()
if ( gridlistItems["inventory_colum"] ) then --If the column has been created, fill it with players
    row1,column1 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
    guiGridListClear(gridlistItems["inventory"])
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"Ekwipunek", true, false )
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"1. Pierwsza broń", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"2. Druga broń", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"3. Specjalna broń", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"4. Amunicja", true, false )
        for id, item in ipairs(inventoryItems["Ammo"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"5. Jedzenie i picie", true, false )
        for id, item in ipairs(inventoryItems["Food"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"6. Inne", true, false )
        for id, item in ipairs(inventoryItems["Items"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["inventory"] )
            guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"7. Narzędzia", true, false )
        for id, item in ipairs(inventoryItems["Toolbelt"]) do
            if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["inventory"] )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
            end
        end
        if row1 and column1 then
            guiGridListSetSelectedItem ( gridlistItems["inventory"], row1,column1)
        end
        guiSetText(headline["slots"],"Slotów: "..getPlayerCurrentSlots().." / "..getPlayerMaxAviableSlots())
    end
end

function refreshLoot(loot,gearName)
if loot == false then
    guiGridListClear(gridlistItems["loot"])
    guiSetText(headline["loot"],"Vazio")
    return
end
if ( gridlistItems["loot_colum"] ) then
    row2,column2 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
    guiGridListClear(gridlistItems["loot"])
    if gearName then
        guiSetText(headline["loot"],gearName)
    end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Ekwipunek", true, false )
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"1. Pierwsza broń", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
                local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"2. Druga broń", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"3. Specjalna broń", true, false )
        for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"4. Amunicja", true, false )
        for id, item in ipairs(inventoryItems["Ammo"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"5. Jedzenie i picie", true, false )
        for id, item in ipairs(inventoryItems["Food"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"7. Narzędzia", true, false )
        for id, item in ipairs(inventoryItems["Toolbelt"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
            local row = guiGridListAddRow ( gridlistItems["loot"] )
            guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"6. Inne", true, false )
        for id, item in ipairs(inventoryItems["Items"]) do
            if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
                local row = guiGridListAddRow ( gridlistItems["loot"] )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
                guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
            end
        end
        if row2 and column2 then
            --guiGridListSetSelectedItem ( gridlistItems["loot"], row2,column2)
        end
        guiSetText(headline["slots_loot"],"Slotów: "..getLootCurrentSlots(loot).." / "..(getLootMaxAviableSlots(loot)or 0))
    end
end


function getPlayerMaxAviableSlots()
return getElementData(getLocalPlayer(),"MAX_Slots")
end

function getLootMaxAviableSlots(loot)
return getElementData(loot,"MAX_Slots")
end

function getPlayerCurrentSlots()
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Ammo"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Food"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Items"]) do
        if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(getLocalPlayer(),item[1])
        end
    end
    return math.floor(current_SLOTS)
end


function getLootCurrentSlots(loot)
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Ammo"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Food"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    for id, item in ipairs(inventoryItems["Items"]) do
        if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
            current_SLOTS = current_SLOTS + item[2]*getElementData(loot,item[1])
        end
    end
    return math.floor(current_SLOTS)
end

function getItemSlots(itema)
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Ammo"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Food"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    for id, item in ipairs(inventoryItems["Items"]) do
        if itema == item[1] then
            return item[2]
        end
    end
    return false
end

function isToolbeltItem(itema)
local current_SLOTS = 0
    for id, item in ipairs(inventoryItems["Toolbelt"]) do
        if itema == item[1] then
            return true
        end
    end
    return false
end

vehicleAddonsInfo = {
-- VVVVVVVVVVVVVVVVVVVVVVVV
{471, 4, 1, 1},
{593, 3, 1, 1},
{483, 4, 1, 1},
{500, 4, 1, 1},
{510, 0, 0, 0},
{596, 4, 1, 1},
{531, 4, 1, 1},
{418, 4, 1, 1},
{603, 4, 1, 1},
-- ^^^^^^^^^^^^^^^^^^^^^^^^
{422,4,1,1},
{470,4,1,1},
{468,2,1,1},
{433,6,1,1},
{431,6,1,1},
{509,0,0,0},
{487,0,1,1},
{497,0,1,1},
{453,0,1,1},
}

function getVehicleAddonInfos (id)
    for i,veh in ipairs(vehicleAddonsInfo) do
        if veh[1] == id then
            return veh[2],veh[3],veh[4]
        end
    end
end

--OTHER ITEM STUFF
vehicleFuelTable = {
{471,30},
{531,80},
{483,80},
{593,60},
{500,60},
{490,80},
{510,0},
{418,60},
{603,60},

-- VVVVVVVVVVVVVVVVVVVVVVVVVVVVV
-- ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
{422,80},
{470,100},
{468,30},
{433,140},
{437,140},
{509,0},
{487,60},
{497,60},
{453,60},
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

function onPlayerMoveItemOutOfInventory ()
if playerMovedInInventory then startRollMessage2("Inventory", "Nie próbuj kopiowaćitemów!", 255, 22, 0 ) return end

local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
    if getElementData(getLocalPlayer(),itemName) and getElementData(getLocalPlayer(),itemName) >= 1 then
        if isPlayerInLoot() then
            local isVehicle = getElementData(isPlayerInLoot(),"vehicle")
            local isTent = getElementData(isPlayerInLoot(),"tent")
            if isVehicle and not isTent then
                local veh = getElementData(isPlayerInLoot(),"parent")
                local tires,engine,parts = getVehicleAddonInfos (getElementModel(veh))
                if itemName == "Tire" and (getElementData(isPlayerInLoot(),"Tire_inVehicle") or 0) < tires  or itemName == "Engine" and (getElementData(isPlayerInLoot(),"Engine_inVehicle") or 0)  < engine or itemName == "Parts" and (getElementData(isPlayerInLoot(),"Parts_inVehicle") or 0)  < parts or itemName == "Tank Parts" and (getElementData(isPlayerInLoot(),"Parts_inVehicle") or 0)  < parts then
                    if itemName == "Tank Parts" then
            itemName = "Parts"
          end
            triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName.."_inVehicle",isPlayerInLoot())
            playerMovedInInventory = true
            setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                elseif isToolbeltItem(itemName) then
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                else
                    startRollMessage2("Inventory", "Ekwipunek jest pełny!", 255, 22, 0 )
                    return
                end



                elseif isToolbeltItem(itemName) then
                    triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
            elseif getLootCurrentSlots(getElementData(getLocalPlayer(),"currentCol")) + getItemSlots(itemName) <= getLootMaxAviableSlots(isPlayerInLoot()) then
                triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                playerMovedInInventory = true
                    setTimer(function()
                    playerMovedInInventory = false
                end,700,1)
            else
                startRollMessage2("Inventory", "Ekwipunek jest pełny!", 255, 22, 0 )
                return
            end
        else
            triggerEvent("onPlayerMoveItemOutOFInventory",getLocalPlayer(),itemName,isPlayerInLoot())
            playerMovedInInventory = true
            setTimer(function()
                playerMovedInInventory = false
            end,700,1)
        end
    end
    local gearName = guiGetText(headline["loot"])
    local col = getElementData(getLocalPlayer(),"currentCol")
    setTimer(refreshInventory,200,2)
    if isPlayerInLoot() then
        setTimer(refreshLoot,200,2,col,gearName)
    end
end
addEventHandler ( "onClientGUIClick", buttonItems["inventory"], onPlayerMoveItemOutOfInventory )


function onPlayerMoveItemOutOFInventory(itemName, loot)
  local itemPlus = 1
  if itemName == "G17 Mag" then
    itemPlus = 7
  elseif itemName == "Makarov SD Mag" then
    itemPlus = 15
  elseif itemName == ".45 ACP" then
    itemPlus = 7
  elseif itemName == "30Rnd. SCAR" then
    itemPlus = 30
  elseif itemName == "30Rnd. 74U" then
    itemPlus = 30
  elseif itemName == "30Rnd. M16" then
    itemPlus = 30
  elseif itemName == "SIG50 Mag" then
    itemPlus = 9
  elseif itemName == "DSR Mag" then
    itemPlus = 7
  elseif itemName == "PDW Mag" then
    itemPlus = 30
  elseif itemName == "MP5A5 Mag" then
    itemPlus = 20
  elseif itemName == "30Rnd. AKS" then
    itemPlus = 30
  elseif itemName == "STANAG Mag" then
    itemPlus = 20
  elseif itemName == "1866 Slug" then
    itemPlus = 7
  elseif itemName == "2Rnd. Slug" then
    itemPlus = 2
  elseif itemName == "SPAZ-12 Pellet" then
    itemPlus = 7
  elseif itemName == "DMR Mag" then
    itemPlus = 5
  elseif itemName == "SVD Mag" then
    itemPlus = 5
  elseif itemName == "Lee Enfield Mag" then
    itemPlus = 10
  elseif itemName == "M136 Rocket" then
    itemPlus = 0
  elseif itemName == "M4A1 CCO" or itemName == "AKS-74 Kobra" or itemName == "SVD Camo" or itemName == "SCAR-H" or itemName == "AK-74U" or itemName == "M16A2" or itemName == "SIG50" or itemName == "DSR" or itemName == "DMR" or itemName == "Winchester 1866" or itemName == "SPAZ-12 Combat Shotgun" or itemName == "Sawn-Off Shotgun" or itemName == "Heat-Seeking RPG" or itemName == "M136 Rocket Launcher" or itemName == "Lee Enfield" then
    triggerServerEvent("removeBackWeaponOnDrop", getLocalPlayer())
  end







if loot and not getElementData(loot, "itemloot") and getElementType(getElementData(loot, "parent")) == "vehicle" and itemName == "Full Gas Canister" then
    if getElementData(loot, "fuel") + 20 < getVehicleMaxFuel(loot) then
      addingfuel = 20
    elseif getElementData(loot, "fuel") + 20 > getVehicleMaxFuel(loot) + 15 then
      triggerEvent("displayClientInfo", getLocalPlayer(), "Vehicle", "Zbiornik paliwa jest napełniony do pełna!", 255, 22, 0)
	  playSound("sounds/action_refuel.ogg")
      return
    else
      addingfuel = getVehicleMaxFuel(loot) - getElementData(loot, "fuel")
    end
    setElementData(loot, "fuel", getElementData(loot, "fuel") + addingfuel)
    setElementData(getLocalPlayer(), itemName, getElementData(getLocalPlayer(), itemName) - itemPlus)
    setElementData(getLocalPlayer(), "Empty Gas Canister", (getElementData(getLocalPlayer(), "Empty Gas Canister") or 0) + itemPlus)
    triggerEvent("displayClientInfo", getLocalPlayer(), "Vehicle", "Dolałeś paliwa do samochodu.", 22, 255, 0)
	playSound("sounds/action_refuel.ogg")
    return
  end
  itemName2 = itemName
  if itemName == "Tire_inVehicle" then
    itemName2 = "Tire"
  end
  if itemName == "Engine_inVehicle" then
    itemName2 = "Engine"
  end
  if itemName == "Parts_inVehicle" then
    itemName2 = "Tank Parts"
  end
  if 1 > (getElementData(getLocalPlayer(), itemName2) or 0) / itemPlus then
    triggerEvent("displayClientInfo", getLocalPlayer(), "Inventory", "Nie możesz opuścić tę pozycję!", 255, 22, 0)
    return
  end
  if loot then
    setElementData(loot, itemName, (getElementData(loot, itemName) or 0) + 1)
    do
      local players = getElementsWithinColShape(loot, "player")
      if #players > 1 then
        triggerServerEvent("onPlayerChangeLoot", getRootElement(), loot)
      end
    end
    if not getElementData(loot, "itemloot") and getElementType(getElementData(loot, "parent")) == "vehicle" then
    end
  else
    triggerServerEvent("playerDropAItem", getLocalPlayer(), itemName)
  end
  if itemName == "Tire_inVehicle" then
    itemName = "Tire"
  end
  if itemName == "Engine_inVehicle" then
    itemName = "Engine"
  end
  if itemName == "Parts_inVehicle" then
    itemName = "Tank Parts"
  end
  setElementData(getLocalPlayer(), itemName, getElementData(getLocalPlayer(), itemName) - itemPlus)
  if loot and getElementData(loot, "itemloot") then
    triggerServerEvent("refreshItemLoot", getRootElement(), loot, getElementData(loot, "parent"))
  end
end
addEvent("onPlayerMoveItemOutOFInventory", true)
addEventHandler("onPlayerMoveItemOutOFInventory", getRootElement(), onPlayerMoveItemOutOFInventory)

function onPlayerMoveItemInInventory ()
local itemName = guiGridListGetItemText ( gridlistItems["loot"], guiGridListGetSelectedItem ( gridlistItems["loot"] ), 1 )
if isPlayerInLoot() then
    if getElementData(isPlayerInLoot(),itemName) and getElementData(isPlayerInLoot(),itemName) >= 1 then
        if not isToolbeltItem(itemName) then
            if getPlayerCurrentSlots() + getItemSlots(itemName) <= getPlayerMaxAviableSlots() then
                if not playerMovedInInventory then
                    triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
                    playerMovedInInventory = true
                    setTimer(function()
                        playerMovedInInventory = false
                    end,700,1)
                else
                    startRollMessage2("Inventory", "Nie próbuj kopiować itemów!", 255, 22, 0 )
                    return
                end
            else
                startRollMessage2("Inventory", "Ekwipunek jest pełny!", 255, 22, 0 )
                return
            end
        else
            playerMovedInInventory = true
            setTimer(function()
                playerMovedInInventory = false
            end,700,1)
            triggerEvent("onPlayerMoveItemInInventory",getLocalPlayer(),itemName,isPlayerInLoot())
        end
    end
    if isPlayerInLoot() then
        local gearName = guiGetText(headline["loot"])
        local col = getElementData(getLocalPlayer(),"currentCol")
        setTimer(refreshInventory,200,2)
        setTimer(refreshLoot,200,2,col,gearName)
    end
end
end
addEventHandler ( "onClientGUIClick", buttonItems["loot"], onPlayerMoveItemInInventory )

function onPlayerMoveItemInInventory(itemName, loot)
  local itemPlus = 1
  if itemName == "G17 Mag" then
    itemPlus = 7
  elseif itemName == "Makarov SD Mag" then
    itemPlus = 15
  elseif itemName == ".45 ACP" then
    itemPlus = 7
  elseif itemName == "PDW Mag" then
    itemPlus = 30
  elseif itemName == "MP5A5 Mag" then
    itemPlus = 20
  elseif itemName == "30Rnd. AKS" then
    itemPlus = 30
  elseif itemName == "STANAG Mag" then
    itemPlus = 20
  elseif itemName == "1866 Slug" then
    itemPlus = 7
  elseif itemName == "2Rnd. Slug" then
    itemPlus = 2
  elseif itemName == "SPAZ-12 Pellet" then
    itemPlus = 7
  elseif itemName == "DMR Mag" then
    itemPlus = 5
  elseif itemName == "SVD Mag" then
    itemPlus = 5
  elseif itemName == "Lee Enfield Mag" then
    itemPlus = 10
  elseif itemName == "M136 Rocket" then
    itemPlus = 0





  elseif itemName == "Czech Vest Pouch" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 10 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 10 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 10)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Patrol Pack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 12 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 12 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 12)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Assault Pack (ACU)" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 14 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 14 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 14)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
   elseif itemName == "Survival (ACU)" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 16 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 16 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 16)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Alice Pack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 22 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 22 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 22)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
   elseif itemName == "British Assault Pack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 26 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 26 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 26)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Czech Backpack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 30 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 30 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 30)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Coyote Backpack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 43 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 43 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 43)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Anarchy Backpack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 52 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 52 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 52)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Military Backpack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 64 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 64 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 64)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Camp Backpack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 76 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 76 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 76)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Kryss Backpack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 88 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 88 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 88)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "Ghillie Backpack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 96 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz już ten plecak!", 255, 22, 0)
      return
    end
    if getElementData(getLocalPlayer(), "MAX_Slots") > 96 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Obecny plecak ma więcej miejsca!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 96)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  elseif itemName == "OSPack Backpack" then
    if getElementData(getLocalPlayer(), "MAX_Slots") == 110 then
      triggerEvent(getLocalPlayer(), "displayClientInfo", getLocalPlayer(), "Inventory", "Masz najlepszy plecak!", 255, 22, 0)
      return
    end
    setElementData(getLocalPlayer(), "MAX_Slots", 110)
    setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    itemPlus = 0
  end
  if loot then
    setElementData(getLocalPlayer(), itemName, (getElementData(getLocalPlayer(), itemName) or 0) + itemPlus)
    if itemPlus == 0 then
      setElementData(loot, itemName, getElementData(loot, itemName) - 0)
    else
      setElementData(loot, itemName, getElementData(loot, itemName) - 1)
    end
    local players = getElementsWithinColShape(loot, "player")
    if #players > 1 then
      triggerServerEvent("onPlayerChangeLoot", getRootElement(), loot)
    end
  end
  if getElementData(loot, "itemloot") then
    triggerServerEvent("refreshItemLoot", getRootElement(), loot, getElementData(loot, "parent"))
  end
end
addEvent("onPlayerMoveItemInInventory", true)
addEventHandler("onPlayerMoveItemInInventory", getRootElement(), onPlayerMoveItemInInventory)

function onClientOpenInventoryStopMenu()
  triggerEvent("disableMenu", getLocalPlayer())
end
function isPlayerInLoot()
  if getElementData(getLocalPlayer(), "loot") then
    return getElementData(getLocalPlayer(), "currentCol")
  end
  return false
end


------------------------------------------------------------------------------
--right-click menu
function onPlayerPressRightKeyInInventory()
  local itemName = guiGridListGetItemText(gridlistItems.inventory, guiGridListGetSelectedItem(gridlistItems.inventory), 1)
  local itemName, itemInfo = getInventoryInfosForRightClickMenu(itemName)
  if isCursorShowing() and guiGetVisible(inventoryWindows) and itemInfo then
    if itemName == "Box of Matches" and getElementData(getLocalPlayer(), "Wood Pile") == 0 then
      return
    end
    if itemName == "Bandage" and getElementData(getLocalPlayer(), "bleeding") == 0 then
      return
    end
    if itemName == "Medic Kit" and getElementData(getLocalPlayer(), "blood") > 10500 then
      return
    end
    if itemName == "Heat Pack" and getElementData(getLocalPlayer(), "temperature") > 35 then
      return
    end
    if itemName == "Painkiller" and not getElementData(getLocalPlayer(), "pain") then
      return
    end
    if itemName == "Morphine" and not getElementData(getLocalPlayer(), "brokenbone") then
      return
    end
    if itemName == "Blood Bag" then
      return
    end
    showRightClickInventoryMenu(itemName, itemInfo)
  end
end
bindKey("mouse2", "down", onPlayerPressRightKeyInInventory)


function getInventoryInfosForRightClickMenu(itemName)
  for i, itemInfo in ipairs(inventoryItems.Weapons["Primary Weapon"]) do
    if itemName == itemInfo[1] then
      return itemName, "Equipar Arma Primária"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Weapons["Secondary Weapon"]) do
    if itemName == itemInfo[1] then
      return itemName, "Equipar Arma Secundária"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Weapons["Specially Weapon"]) do
    if itemName == itemInfo[1] then
      return itemName, "Equipar Arma Especial"
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Ammo) do
    if itemName == itemInfo[1] then
      return itemName, false
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Food) do
    if itemName == itemInfo[1] then
      if itemInfo[1] == "Water Bottle" or itemInfo[1] == "Milk" or itemInfo[1] == "Soda Bottle" then
        info = "Beber"
      else
        info = "Comer"
      end
      return itemName, info
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Items) do
    if itemName == itemInfo[1] then
      return itemName, itemInfo[3] or false
    end
  end
  for i, itemInfo in ipairs(inventoryItems.Toolbelt) do
    if itemName == itemInfo[1] then
      return itemName, itemInfo[3] or false
    end
  end
end

rightclickWindow = guiCreateStaticImage(0, 0, 0.05, 0.0215, "images/scrollmenu_1.png", true)
headline.rightclickmenu = guiCreateLabel(0, 0, 1, 1, "", true, rightclickWindow)
guiLabelSetHorizontalAlign(headline.rightclickmenu, "center")
guiLabelSetVerticalAlign(headline.rightclickmenu, "center")
guiSetFont(headline.rightclickmenu, "default-bold-small")
guiSetVisible(rightclickWindow, false)

function showRightClickInventoryMenu(itemName, itemInfo)
  if itemInfo then
    local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
    guiSetVisible(rightclickWindow, true)
    guiSetText(headline.rightclickmenu, itemInfo)
    local whith = guiLabelGetTextExtent(headline.rightclickmenu)
    guiSetPosition(rightclickWindow, screenx, screeny, true)
    local x, y = guiGetSize(rightclickWindow, false)
    guiSetSize(rightclickWindow, whith, y, false)
    guiBringToFront(rightclickWindow)
    setElementData(rightclickWindow, "iteminfo", {itemName, itemInfo})
  end
end

function hideRightClickInventoryMenu()
  guiSetVisible(rightclickWindow, false)
end
function onPlayerClickOnRightClickMenu(button, state)
  if button == "left" then
    local itemName, itemInfo = getElementData(rightclickWindow, "iteminfo")[1], getElementData(rightclickWindow, "iteminfo")[2]
    hideRightClickInventoryMenu()
    playerUseItem(itemName, itemInfo)
  end
end
addEventHandler("onClientGUIClick", headline.rightclickmenu, onPlayerClickOnRightClickMenu, false)
local playerFire = {}
local fireCounter = 0
function playerUseItem(itemName, itemInfo)
  if itemInfo == "Beber" then
  playSound("sounds/bebendo.ogg") 
    triggerServerEvent("onPlayerRequestChangingStats", getLocalPlayer(), itemName, itemInfo, "thirst")
  elseif itemInfo == "Comer" then
  playSound("sounds/comendo.ogg") 
    triggerServerEvent("onPlayerRequestChangingStats", getLocalPlayer(), itemName, itemInfo, "food")
  elseif itemInfo == "Uzyj Skin" then
    triggerServerEvent("onPlayerChangeSkin", getLocalPlayer(), itemName)
  elseif itemName == "Empty Water Bottle" then
    triggerServerEvent("onPlayerRefillWaterBottle", getLocalPlayer(), itemName)
  elseif itemName == "Tent" then
  playSound("sounds/desmontartenda.ogg")
    triggerServerEvent("onPlayerPitchATent", getLocalPlayer(), itemName)
  elseif itemInfo == "Postaw drut kolczasty" then
    triggerServerEvent("onPlayerBuildAWireFence", getLocalPlayer(), itemName)
  elseif itemInfo == "Postaw worki z piaskiem" then
    triggerServerEvent("onPlayerBuildASandBag", getLocalPlayer(), itemName)
  elseif itemName == "Roadflare" then
    triggerServerEvent("onPlayerPlaceRoadflare", getLocalPlayer(), itemName)
  elseif itemInfo == "Colocar Fogo" then
    triggerServerEvent("onPlayerMakeAFire", getLocalPlayer(), itemName)
  elseif itemInfo == "Uzyj" then
    triggerServerEvent("onPlayerUseMedicObject", getLocalPlayer(), itemName)
  elseif itemName == "Bandage" then
    triggerServerEvent("onPlayerUseMedicObject", getLocalPlayer(), itemName)
  elseif itemInfo == "Use Googles" then
    triggerServerEvent("onPlayerChangeView", getLocalPlayer(), itemName)
  elseif itemInfo == "Equipar Arma Primária" then
    triggerServerEvent("onPlayerRearmWeapon", getLocalPlayer(), itemName, 1)
  elseif itemInfo == "Equipar Arma Secundária" then
    triggerServerEvent("onPlayerRearmWeapon", getLocalPlayer(), itemName, 2)
  elseif itemInfo == "Equipar Arma Especial" then
    triggerServerEvent("onPlayerRearmWeapon", getLocalPlayer(), itemName, 3)
  end
end


weaponAmmoTable = {
["30Rnd. STANAG"] = {{"M4A1", 31}},
["30Rnd. SCAR"] = {{"SCAR-H", 31}},
["30Rnd. 74U"] = {{"AK-74U", 31}},
["30Rnd. M16"] = {{"M16A2", 31}},
["SIG50 Mag"] = {{"SIG50", 34}},
["DSR Mag"] = {{"DSR", 34}},

["G17 Mag"] = {{"G17", 22}},
["Makarov SD Mag"] = {{"Makarov SD", 23}},
[".45 ACP"] = {{"Revolver", 24}},
["PDW Mag"] = {{"PDW", 28}},
["MP5A5 Mag"] = {{"MP5A5", 29}},
["30Rnd. AKS"] = {{"AKS-74 Kobra", 30}},
["STANAG Mag"] = {{"M4A1 CCO", 31}},
["1866 Slug"] = {{"Winchester 1866", 25}},
["2Rnd. Slug"] = {{"Sawn-Off Shotgun", 26}},
["SPAZ-12 Pellet"] = {{"SPAZ-12 Combat Shotgun", 27}},
["DMR Mag"] = {{"DMR", 34}},
["SVD Mag"] = {{"SVD Camo", 34}},
["Lee Enfield Mag"] = {{"Lee Enfield", 33}},
["M136 Rocket"] = {{"Heat-Seeking RPG", 36},{"M136 Rocket Launcher", 35}},
["others"] = {{"Parachute", 46},{"Satchel", 39},{"Tear Gas", 17},{"M67 Frag Grenade", 16},{"Hunting Knife", 4},{"Hatchet", 8},{"Binoculars", 43},{"Machete", 5},{"Crowbar", 6},{"Golf Club", 2}}
}

function getWeaponAmmoType2(weaponName)
  for i, weaponData in ipairs(weaponAmmoTable.others) do
    if weaponName == weaponData[2] then
      return weaponData[1], weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["30Rnd. SCAR"]) do
    if weaponName == weaponData[2] then
      return "30Rnd. SCAR", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["30Rnd. 74U"]) do
    if weaponName == weaponData[2] then
      return "30Rnd. 74U", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["30Rnd. M16"]) do
    if weaponName == weaponData[2] then
      return "30Rnd. M16", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["SIG50 Mag"]) do
    if weaponName == weaponData[2] then
      return "SIG50 Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["DSR Mag"]) do
    if weaponName == weaponData[2] then
      return "DSR Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["G17 Mag"]) do
    if weaponName == weaponData[2] then
      return "G17 Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Makarov SD Mag"]) do
    if weaponName == weaponData[2] then
      return "Makarov SD Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable[".45 ACP"]) do
    if weaponName == weaponData[2] then
      return ".45 ACP", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["PDW Mag"]) do
    if weaponName == weaponData[2] then
      return "PDW Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["MP5A5 Mag"]) do
    if weaponName == weaponData[2] then
      return "MP5A5 Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["30Rnd. AKS"]) do
    if weaponName == weaponData[2] then
      return "30Rnd. AKS", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["STANAG Mag"]) do
    if weaponName == weaponData[2] then
      return "STANAG Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["1866 Slug"]) do
    if weaponName == weaponData[2] then
      return "1866 Slug", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["SPAZ-12 Pellet"]) do
    if weaponName == weaponData[2] then
      return "SPAZ-12 Pellet", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["2Rnd. Slug"]) do
    if weaponName == weaponData[1] then
      return "2Rnd. Slug", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["DMR Mag"]) do
    if weaponName == weaponData[2] then
      return "DMR Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["SVD Mag"]) do
    if weaponName == weaponData[2] then
      return "SVD Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Lee Enfield Mag"]) do
    if weaponName == weaponData[2] then
      return "Lee Enfield Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["M136 Rocket"]) do
    if weaponName == weaponData[2] then
      return "M136 Rocket", weaponData[2]
    end
  end
end


function weaponSwitch(weapon)
    local current_1 = getElementData(getLocalPlayer(),"currentweapon_1")
    if source == getLocalPlayer() then
        if current_1 == "M4A1" then
            if getElementData(getLocalPlayer(),"30Rnd. STANAG") > 0 then
                setElementData(getLocalPlayer(),"30Rnd. STANAG",getElementData(getLocalPlayer(),"30Rnd. STANAG")-1)
            end
        elseif current_1 == "SCAR-H" then
            if getElementData(getLocalPlayer(),"30Rnd. SCAR") > 0 then
                setElementData(getLocalPlayer(),"30Rnd. SCAR",getElementData(getLocalPlayer(),"30Rnd. SCAR")-1)
            end
        elseif current_1 == "AK-74U" then
            if getElementData(getLocalPlayer(),"30Rnd. 74U") > 0 then
                setElementData(getLocalPlayer(),"30Rnd. 74U",getElementData(getLocalPlayer(),"30Rnd. 74U")-1)
            end
        elseif current_1 == "M16A2" then
            if getElementData(getLocalPlayer(),"30Rnd. M16") > 0 then
                setElementData(getLocalPlayer(),"30Rnd. M16",getElementData(getLocalPlayer(),"30Rnd. M16")-1)
            end
        elseif current_1 == "SIG50" then
            if getElementData(getLocalPlayer(),"SIG50 Mag") > 0 then
                setElementData(getLocalPlayer(),"SIG50 Mag",getElementData(getLocalPlayer(),"SIG50 Mag")-1)
            end
		elseif current_1 == "SVD Camo" then
            if getElementData(getLocalPlayer(),"SVD Mag") > 0 then
                setElementData(getLocalPlayer(),"SVD Mag",getElementData(getLocalPlayer(),"SVD Mag")-1)
            end
        elseif current_1 == "DSR" then
            if getElementData(getLocalPlayer(),"DSR Mag") > 0 then
                setElementData(getLocalPlayer(),"DSR Mag",getElementData(getLocalPlayer(),"DSR Mag")-1)
            end
        else
        local ammoName, _ = getWeaponAmmoType2(weapon)
            if getElementData(getLocalPlayer(), ammoName) > 0 then
                setElementData(getLocalPlayer(), ammoName, getElementData(getLocalPlayer(), ammoName) - 0)
            end
        end
    end
end
addEventHandler("onClientPlayerWeaponFire",getLocalPlayer(),weaponSwitch)
function makeRadioStayOff()
  setRadioChannel(0)
  cancelEvent()
end
addEventHandler("onClientPlayerVehicleEnter", getRootElement(), makeRadioStayOff)
addEventHandler("onClientPlayerRadioSwitch", getRootElement(), makeRadioStayOff)
