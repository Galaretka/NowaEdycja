--[[
#---------------------------------------------------------------#
----*			DayZ MTA Script inventory.lua				*----
----* This Script is owned by Marwin, you are not allowed to use or own it.
----* Owner: Marwin W., Germany, Lower Saxony, Otterndorf
----* Skype: xxmavxx96
----* Перевод мода: by Lorenco								*----
#---------------------------------------------------------------#
]]

inventoryItems = {
["Weapons"] = {
["Primary Weapon"] = {
{"M4",3},
{"Снайперская винтовка",3},
{"Винчестер 1866",3},
{"Гранатомёт",3},
{"Sawn-Off Shotgun",3},
{"AK-47",3},
{"Lee Enfield",3},
{"Heat-Seeking RPG",5},
{"M136 Rocket Launcher",5},
},

["Secondary Weapon"] = {
{"M1911",2},
{"M9 SD",2},
{"PDW",2},
{"TEC-9",2},
{"MP5A5",3},
{"Пустынный орёл",2},
{"Охотничий нож",1},
{"Топор",2},
{"Бейсбольная бита",2},
{"Лопата",2},
{"Клюшка для гольфа",2},
},

["Specially Weapon"] = {
{"Парашют",1},
{"Tear Gas",1},
{"Оск. граната M67",1},
{"Бинокль",1}
},

},
["Ammo"] = {
{"M1911 Mag",0.085},
{"M9 SD Mag",0.085},
{"Пустынный орёл Маг",0.085},
{"PDW Mag",0.025},
{"MP5A5 Mag",0.025},
{"AK Маг",0.035},
{"M4 Маг",0.035},
{"1866 Slug",0.067},
{"2Rnd. Slug",0.067},
{"Гранотомёт Маг",0.067},
{"Снайперская винтовка Маг",0.1},
{"Lee Enfield Mag",0.1},
{"M136 Rocket",2},
},

["Food"] = {
{"Фляга",1},
{"Банка макарон",1},
{"Банка бобов",1},
{"Гамбургер",1},
{"Пицца",1},
{"Банка соды",1},
{"Молоко",1},
{"Сырое мясо",1},
},

["Items"] = {
{"Montion Backpack",1,"Одеть"},
{"Дрова",2},
{"Бинт",1,"Перевязаться"},
{"Фаер",1,"Зажечь"},
{"Пустая канистра",2},
{"Наполненная канистра",2},
{"Аптечка",2,"Использовать."},
{"Грелка",1,"Использовать."},
{"Болеутоляющие",1,"Использовать."},
{"Морфий",1,"Использовать."},
{"Пакет крови",1,"Использовать."},
{"Колючая проволока",1,"Поставить проволоку"},
{"Жареное мясо",1},
{"Tire",2},
{"Engine",5},
{"Бензобак",3},
{"Палатка",3,"Разложить"},
{"Одежда Армейца",1,"Переодеться"},
{"Одежда выжившего",1,"Переодеться"},
{"Одежда снайпера",1,"Переодеться"},
{"Одежда Бандита",1,"Переодеться"},
{"Пустая фляга",1,"Наполнить"}, 
{"Пустая банка соды",1},
{"Объедки",1},
{"Assault Pack (ACU)",1},"Одеть",
{"Alice Pack",1},"Одеть",
{"Czech Backpack",1,"Одеть"},
{"Coyote Backpack",1,"Одеть"},
{"Crash Backpack",1,"Одеть"},
{"Army Backpack",1,"Одеть"},
},

["Toolbelt"] = {
{"Очки ночного видения",1},
{"Инфокрасные очки",1},
{"Карта",1},
{"Спички",1,"Поджечь"},
{"Часы",1},
{"GPS",1},
{"Инструменты",1},
{"Рация",1},
},
}


------------------------------------------------------------------------------
--Инвентарь
local headline = {}
local gridlistItems = {}
local buttonItems = {}


inventoryWindows = guiCreateWindow(0.15, 0.28, 0.72, 0.63, "", true) 
-- inventoryWindows = guiCreateStaticImage(0.25,0.25,0.5,0.5,"images/scrollmenu_1.png",true)


headline["loot"] = guiCreateLabel(0.06, 0.05, 0.34, 0.09,"Обыскать",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["loot"],"center")
guiSetFont (headline["loot"], "default-bold-small" )

headline["inventory"] = guiCreateLabel(0.60, 0.05, 0.34, 0.09,"Инвентарь",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["inventory"],"center")
guiSetFont (headline["inventory"], "default-bold-small" )

gridlistItems["loot"] = guiCreateGridList (0.03, 0.10, 0.39, 0.83,true,inventoryWindows)
gridlistItems["loot_colum"] = guiGridListAddColumn( gridlistItems["loot"], "Inventory", 0.7 )
gridlistItems["loot_colum_amount"] = guiGridListAddColumn( gridlistItems["loot"], "", 0.2 )

gridlistItems["inventory"] = guiCreateGridList (0.57, 0.11, 0.39, 0.83,true,inventoryWindows)
gridlistItems["inventory_colum"] = guiGridListAddColumn( gridlistItems["inventory"], "Inventory", 0.7 )
gridlistItems["inventory_colum_amount"] = guiGridListAddColumn( gridlistItems["inventory"], "", 0.2 )

buttonItems["loot"] = guiCreateButton(0.42, 0.17, 0.04, 0.69, "->", true,inventoryWindows)
buttonItems["inventory"] = guiCreateButton(0.53, 0.17, 0.04, 0.69, "<-", true,inventoryWindows)

headline["slots"] = guiCreateLabel(0.62, 0.94, 0.29, 0.04,"Слоты:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots"],"center")
guiLabelSetVerticalAlign (headline["slots"],"center")
guiSetFont (headline["slots"], "default-bold-small" )

headline["slots_loot"] = guiCreateLabel(0.07, 0.94, 0.29, 0.04,"Слоты:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots_loot"],"center")
guiLabelSetVerticalAlign (headline["slots_loot"],"center")
guiSetFont (headline["slots_loot"], "default-bold-small" )

guiSetVisible(inventoryWindows,false)

function showInventory (key,keyState)
if getElementData(getLocalPlayer(),"logedin") then
	if ( keyState == "down" ) then
		guiSetVisible(inventoryWindows,not guiGetVisible(inventoryWindows))
		showCursor(not isCursorShowing())
		refreshInventory()
		if guiGetVisible(inventoryWindows) == true then
			onClientOpenInventoryStopMenu ()
		else
			hideRightClickInventoryMenu ()
		end
		if isPlayerInLoot() then
			local col = getElementData(getLocalPlayer(),"currentCol")
			local gearName = getElementData(getLocalPlayer(),"lootname")
			refreshLoot(col,gearName)
		end
	end
end	
end
bindKey ( "j", "down", showInventory )

function showInventoryManual ()
		guiSetVisible(inventoryWindows,not guiGetVisible(inventoryWindows))
		showCursor(not isCursorShowing())
		refreshInventory()
		if guiGetVisible(inventoryWindows) == true then
			onClientOpenInventoryStopMenu ()
		end
end

function hideInventoryManual ()
		guiSetVisible(inventoryWindows,false)
		showCursor(false)
		hideRightClickInventoryMenu ()
end
addEvent("hideInventoryManual",true)
addEventHandler("hideInventoryManual",getLocalPlayer(),hideInventoryManual)

function refreshInventoryManual ()
		refreshInventory()
end
addEvent("refreshInventoryManual",true)
addEventHandler("refreshInventoryManual",getLocalPlayer(),refreshInventoryManual)

function refreshLootManual (loot)
		refreshLoot(loot)
end
addEvent("refreshLootManual",true)
addEventHandler("refreshLootManual",getLocalPlayer(),refreshLootManual)

function refreshInventory()
if ( gridlistItems["inventory_colum"] ) then --If the column has been created, fill it with players
	row1,column1 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
	guiGridListClear(gridlistItems["inventory"])
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			--guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"ITEMS", false, false )
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"Основное оружие", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"Дополнительное оружие", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"Специальное оружие", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"Боеприпасы", true, false )
		for id, item in ipairs(inventoryItems["Ammo"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"Еда и вода", true, false )
		for id, item in ipairs(inventoryItems["Food"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"Прочее", true, false )
		for id, item in ipairs(inventoryItems["Items"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"Инструменты", true, false )
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
		guiSetText(headline["slots"],"Слоты: "..getPlayerCurrentSlots().."/"..getPlayerMaxAviableSlots())
	end
end

function refreshLoot(loot,gearName)
if loot == false then
	guiGridListClear(gridlistItems["loot"])
	guiSetText(headline["loot"],"Пусто")
	return
end
if ( gridlistItems["loot_colum"] ) then
	row2,column2 = guiGridListGetSelectedItem ( gridlistItems["inventory"] )
	guiGridListClear(gridlistItems["loot"])
	if gearName then
		guiSetText(headline["loot"],gearName)
	end	
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			--guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Weapons", true, false )
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Основное оружие", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
				local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Дополнительное оружие", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Специальное оружие", true, false )
		for id, item in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Боеприпасы", true, false )
		for id, item in ipairs(inventoryItems["Ammo"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Еда и вода", true, false )
		for id, item in ipairs(inventoryItems["Food"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Прочее", true, false )
		for id, item in ipairs(inventoryItems["Items"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
			local row = guiGridListAddRow ( gridlistItems["loot"] )
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"Инструменты", true, false )
		for id, item in ipairs(inventoryItems["Toolbelt"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end

		if row2 and column2 then
			--guiGridListSetSelectedItem ( gridlistItems["loot"], row2,column2)
		end
		guiSetText(headline["slots_loot"],"Слоты: "..getLootCurrentSlots(loot).."/"..(getLootMaxAviableSlots(loot)or 0))
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
-- {Model ID, Tires, Engine, Бензобак}
{542,4,1,1},
{522,2,1,1},
{427,4,1,1},
{471,4,1,1},
{411,4,1,1},
{422,4,1,1},
{470,4,1,1},
{468,2,1,1},
{433,6,1,1},
{437,6,1,1},
{509,0,0,0},
{487,0,1,1},
{497,0,1,1},
{453,0,1,1},
}

function getVehicleAddonInfos (id)
	for i,veh in ipairs(vehicleAddonsInfo) do
		if veh[1] == id then
			return veh[2],veh[3], veh[4]
		end
	end
end

--OTHER ITEM STUFF
vehicleFuelTable = {
-- {Model ID, Max Бензин}
{542,140},
{522,140},
{427,140},
{411,80},
{500,80},
{471,30},
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
if playerMovedInInventory then startRollMessage2("Inventory", "Не торопись!", 255, 22, 0 ) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
	if getElementData(getLocalPlayer(),itemName) and getElementData(getLocalPlayer(),itemName) >= 1 then
		if isPlayerInLoot() then
			local isVehicle = getElementData(isPlayerInLoot(),"vehicle")
			local isTent = getElementData(isPlayerInLoot(),"tent")
			if isVehicle and not isTent then
				local veh = getElementData(isPlayerInLoot(),"parent")
				local tires,engine,parts = getVehicleAddonInfos (getElementModel(veh))
				if itemName == "Tire" and (getElementData(isPlayerInLoot(),"Tire_inVehicle") or 0) < tires  or itemName == "Engine" and (getElementData(isPlayerInLoot(),"Engine_inVehicle") or 0)  < engine or itemName == "Бензобак" and (getElementData(isPlayerInLoot(),"Parts_inVehicle") or 0) < parts then
					if itemName == "Бензобак" then itemName = "Parts" end
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
					startRollMessage2("Inventory", "Инвентарь полон!", 255, 22, 0 )
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
				startRollMessage2("Inventory", "Инвентарь полон!", 255, 22, 0 )
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


function onPlayerMoveItemOutOFInventory (itemName,loot)
local itemPlus = 1
if itemName == "M1911 Mag" then
	itemPlus = 7
elseif itemName == "M9 SD Mag" then
	itemPlus = 15
elseif itemName == "Пустынный орёл Маг" then
	itemPlus = 7
elseif itemName == "PDW Mag" then
	itemPlus = 30
elseif itemName == "MP5A5 Mag" then
	itemPlus = 20
elseif itemName == "AK Маг" then
	itemPlus = 30
elseif itemName == "M4 Маг" then
	itemPlus = 20
elseif itemName == "1866 Slug" then
	itemPlus = 7
elseif itemName == "2Rnd. Slug" then
	itemPlus = 2
elseif itemName == "Гранотомёт Маг" then
	itemPlus = 7
elseif itemName == "Снайперская винтовка Mag" then
	itemPlus = 5
elseif itemName == "Lee Enfield Mag" then
	itemPlus = 10
elseif itemName == "M136 Rocket" then
	itemPlus = 0
elseif itemName == "M4" or itemName == "AK-47" or itemName == "Снайперская винтовка" or itemName == "Винчестер 1866" or itemName == "Гранатомёт" or itemName == "Sawn-Off Shotgun" or itemName == "Heat-Seeking RPG" or itemName == "M136 Rocket Launcher" or itemName == "Lee Enfield" then
	triggerServerEvent("removeBackWeaponOnDrop",getLocalPlayer())
end
if loot then 
if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
	if itemName == "Наполненная канистра" then
		if getElementData(loot,"fuel")+20 < getVehicleMaxFuel(loot) then
			addingfuel = 20
		elseif getElementData(loot,"fuel")+20 > getVehicleMaxFuel(loot)+15 then
			triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Бензобак полон!",255,22,0)
			return
		else
			addingfuel = getVehicleMaxFuel(loot)-getElementData(loot,"fuel")
		end
		setElementData(loot,"fuel",getElementData(loot,"fuel")+addingfuel)
		setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
		setElementData(getLocalPlayer(),"Пустая канистра",(getElementData(getLocalPlayer(),"Пустая канистра") or 0)+itemPlus)
		triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Вы заправили транспорт на 20 литров!",22,255,0)
		return
	end
end
end
itemName2 = itemName
if itemName == "Tire_inVehicle" then itemName2 = "Tire" end
if itemName == "Engine_inVehicle" then itemName2 = "Engine" end
if itemName == "Parts_inVehicle" then itemName2 = "Бензобак" end
if (getElementData(getLocalPlayer(),itemName2) or 0)/itemPlus < 1 then
	triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Вы не можете использовать это!",255,22,0)
return
end
if itemName == "Assault Pack (ACU)" and          
    getElementData(getLocalPlayer(), "MAX_Slots") == 12 and          
    getElementData(getLocalPlayer(),"Assault Pack (ACU)") == 1 then
    triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Нельзя выбросить!!", 255, 22, 0) 
    return true 
end 
if itemName == "Alice Pack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 16 and          
getElementData(getLocalPlayer(),"Alice Pack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Нельзя выбросить!!", 255, 22, 0) 
return true 
end 
if itemName == "Czech Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 26 and          
getElementData(getLocalPlayer(),"Czech Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Нельзя выбросить!!", 255, 22, 0) 
return true 
end 
if itemName == "Montion Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 85 and          
getElementData(getLocalPlayer(),"Czech Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Нельзя выбросить!!", 255, 22, 0) 
return true 
end 
if itemName == "Army Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 69 and          
getElementData(getLocalPlayer(),"Czech Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Нельзя выбросить!!", 255, 22, 0) 
return true 
end 
if itemName == "Crash Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 47 and          
getElementData(getLocalPlayer(),"Czech Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Нельзя выбросить!!", 255, 22, 0) 
return true 
end 
if itemName == "Coyote Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 36 and          
getElementData(getLocalPlayer(),"Coyote Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Нельзя выбросить!!", 255, 22, 0) 
return true 
end
	if loot then
		setElementData(loot,itemName,(getElementData(loot,itemName) or 0)+1)
		local players = getElementsWithinColShape (loot,"player")
			if #players > 1 then
				triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
			end	
		if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
		end
	else
		triggerServerEvent("playerDropAItem",getLocalPlayer(),itemName)
	end
	if itemName == "Tire_inVehicle" then itemName = "Tire" end
	if itemName == "Engine_inVehicle" then itemName = "Engine" end
	if itemName == "Parts_inVehicle" then itemName = "Бензобак" end
	setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
	if loot and getElementData(loot,"itemloot") then
		triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemOutOFInventory", true )
addEventHandler( "onPlayerMoveItemOutOFInventory", getRootElement(), onPlayerMoveItemOutOFInventory )

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
					startRollMessage2("Inventory", "Не торопись!", 255, 22, 0 )
					return
				end	
			else
				startRollMessage2("Inventory", "Инвентарь полон!", 255, 22, 0 )
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


function onPlayerMoveItemInInventory (itemName,loot)
local itemPlus = 1
if itemName == "M1911 Mag" then
	itemPlus = 7
elseif itemName == "M9 SD Mag" then
	itemPlus = 15
elseif itemName == "Пустынный орёл Маг" then
	itemPlus = 7
elseif itemName == "PDW Mag" then
	itemPlus = 30
elseif itemName == "MP5A5 Mag" then
	itemPlus = 20
elseif itemName == "AK Маг" then
	itemPlus = 30
elseif itemName == "M4 Маг" then
	itemPlus = 20
elseif itemName == "1866 Slug" then
	itemPlus = 7
elseif itemName == "2Rnd. Slug" then
	itemPlus = 2
elseif itemName == "Гранотомёт Маг" then
	itemPlus = 7
elseif itemName == "Снайперская винтовка Mag" then
	itemPlus = 5
elseif itemName == "Lee Enfield Mag" then
	itemPlus = 10
elseif itemName == "M136 Rocket" then
	itemPlus = 0
end
	if loot then
		--if itemPlus > (getElementData(loot,itemName) or 0) then
			--itemPlus = getElementData(loot,itemName) 
		--end
			setElementData(getLocalPlayer(),itemName,(getElementData(getLocalPlayer(),itemName) or 0)+itemPlus) 
			if itemPlus == 0 then
				setElementData(loot,itemName,getElementData(loot,itemName)-0)
			else
				setElementData(loot,itemName,getElementData(loot,itemName)-1)
			end
			local players = getElementsWithinColShape (loot,"player")
			if #players > 1 then
				triggerServerEvent("onPlayerChangeLoot",getRootElement(),loot)
			end
	end
	if getElementData(loot,"itemloot") then
		triggerServerEvent("refreshItemLoot",getRootElement(),loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemInInventory", true )
addEventHandler( "onPlayerMoveItemInInventory", getRootElement(), onPlayerMoveItemInInventory )

function onClientOpenInventoryStopMenu ()
triggerEvent("disableMenu",getLocalPlayer())
end

function isPlayerInLoot()
if getElementData(getLocalPlayer(),"loot") then
	return getElementData(getLocalPlayer(),"currentCol")
end
return false
end


------------------------------------------------------------------------------
--right-click menu
function onPlayerPressRightKeyInInventory ()
local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
local itemName,itemInfo = getInventoryInfosForRightClickMenu(itemName)
	if isCursorShowing() and guiGetVisible(inventoryWindows) and itemInfo then
		if itemName == "Спички" then
			if getElementData(getLocalPlayer(),"Дрова") == 0 then
				return
			end
		end
		if itemName == "Бинт" then
			if getElementData(getLocalPlayer(),"bleeding") == 0 then
				return
			end
		end	
		if itemName == "Аптечка" then
			if getElementData(getLocalPlayer(),"blood") > 10500 then
				return
			end
		end	
		if itemName == "Грелка" then
			if getElementData(getLocalPlayer(),"temperature") > 35 then
				return
			end
		end	
		if itemName == "Болеутоляющие" then
			if not getElementData(getLocalPlayer(),"pain") then
				return
			end
		end	
		if itemName == "Морфий" then
			if not getElementData(getLocalPlayer(),"brokenbone") then
				return
			end
		end	
		if itemName == "Пакет крови" then
			--if getElementData(getLocalPlayer(),"blood") < 1150 then
				return
			--end
		end	
		showRightClickInventoryMenu (itemName,itemInfo)
	end
end
bindKey("mouse2","down",onPlayerPressRightKeyInInventory)

function getInventoryInfosForRightClickMenu(itemName)
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Primary Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Взять основное оружие"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Взять дополнительное оружие"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Взять специальное оружие"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Ammo"]) do
	if itemName == itemInfo[1] then
		return itemName,false
	end	
end
for i,itemInfo in ipairs(inventoryItems["Food"]) do
	if itemName == itemInfo[1] then
		if itemInfo[1] == "Фляга" or itemInfo[1] == "Молоко" or itemInfo[1] == "Банка соды" then
			info = "Выпить"
		else
			info = "Съесть"
		end
		return itemName,info
	end	
end
for i,itemInfo in ipairs(inventoryItems["Items"]) do
	if itemName == itemInfo[1] then
		return itemName,itemInfo[3] or false
	end	
end
for i,itemInfo in ipairs(inventoryItems["Toolbelt"]) do
	if itemName == itemInfo[1] then
		return itemName,itemInfo[3] or false
	end
end
end

rightclickWindow = guiCreateStaticImage(0,0,0.05,0.0215,"images/scrollmenu_1.png",true)
headline["rightclickmenu"] = guiCreateLabel(0,0,1,1,"",true,rightclickWindow)
guiLabelSetHorizontalAlign (headline["rightclickmenu"],"center")
guiLabelSetVerticalAlign (headline["rightclickmenu"],"center")
guiSetFont (headline["rightclickmenu"], "default-bold-small" )
guiSetVisible(rightclickWindow,false)

function showRightClickInventoryMenu (itemName,itemInfo)
	if itemInfo then
		local screenx, screeny, worldx, worldy, worldz = getCursorPosition()
		guiSetVisible(rightclickWindow,true)
		guiSetText(headline["rightclickmenu"],itemInfo)
		local whith = guiLabelGetTextExtent (headline["rightclickmenu"])
		guiSetPosition(rightclickWindow,screenx,screeny,true)
		local x,y = guiGetSize(rightclickWindow,false)
		guiSetSize(rightclickWindow,whith,y,false)
		guiBringToFront(rightclickWindow)
		setElementData(rightclickWindow,"iteminfo",{itemName,itemInfo})
	end
end

function hideRightClickInventoryMenu ()
	guiSetVisible(rightclickWindow,false)
end


function onPlayerClickOnRightClickMenu (button,state)
    if button == "left" then
        local itemName,itemInfo = getElementData(rightclickWindow,"iteminfo")[1],getElementData(rightclickWindow,"iteminfo")[2]
		hideRightClickInventoryMenu ()
		playerUseItem(itemName,itemInfo)
    end
end
addEventHandler("onClientGUIClick",headline["rightclickmenu"],onPlayerClickOnRightClickMenu,false)

local playerFire = {}
local fireCounter = 0
function playerUseItem(itemName,itemInfo)
	if itemInfo == "Выпить" then
		triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"thirst")
	elseif itemInfo == "Съесть" then
		triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"food")
	elseif itemInfo == "Переодеться" then
		triggerServerEvent("onPlayerChangeSkin",getLocalPlayer(),itemName)
	elseif itemName == "Пустая фляга" then
		triggerServerEvent("onPlayerRefillWaterBottle",getLocalPlayer(),itemName)		
	elseif itemName == "Палатка" then
		triggerServerEvent("onPlayerPitchATent",getLocalPlayer(),itemName)
	elseif itemInfo == "Поставить проволоку"	then
		triggerServerEvent("onPlayerBuildAWireFence",getLocalPlayer(),itemName)
	elseif itemName == "Фаер" then
		triggerServerEvent("onPlayerPlaceRoadflare",getLocalPlayer(),itemName)	
	elseif itemInfo == "Поджечь" then
		triggerServerEvent("onPlayerMakeAFire",getLocalPlayer(),itemName)	
	elseif itemInfo == "Использовать." then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)
	elseif itemName == "Бинт" then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)	
	elseif itemInfo == "Использовать. Googles" then
		triggerServerEvent("onPlayerChangeView",getLocalPlayer(),itemName)	
	elseif itemInfo == "Взять основное оружие" then
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,1)
	elseif itemInfo == "Взять дополнительное оружие" then
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,2)
	elseif itemInfo == "Взять специальное оружие" then
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,3)
	-------------------- 
    elseif itemName == "Assault Pack (ACU)" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 12 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "У вас уже одет этот рюкзак!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 12 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Ваш рюкзак больше этого!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",12) 
          refreshInventory() 
          itemPlus = 0 
-------------------- 
    elseif itemName == "Alice Pack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 16 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "У вас уже одет этот рюкзак!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 16 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Ваш рюкзак больше этого!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",16) 
          refreshInventory() 
          itemPlus = 0 
-------------------- 
    elseif itemName == "Czech Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 26 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "У вас уже одет этот рюкзак!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 26 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Ваш рюкзак больше этого!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",26) 
          refreshInventory() 
          itemPlus = 0 
---------------------
    elseif itemName == "Montion Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 85 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "У вас уже одет этот рюкзак!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 85 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Ваш рюкзак больше этого!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",85) 
          refreshInventory() 
          itemPlus = 0 
---------------------
    elseif itemName == "Army Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 69 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "У вас уже одет этот рюкзак!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 69 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Ваш рюкзак больше этого!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",69) 
          refreshInventory() 
          itemPlus = 0 
---------------------
    elseif itemName == "Crash Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 47 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "У вас уже одет этот рюкзак!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 47 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Ваш рюкзак больше этого!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",47) 
          refreshInventory() 
          itemPlus = 0 
--------------------- 
    elseif itemName == "Coyote Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 36 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "У вас уже одет этот рюкзак!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 36 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Инвентарь", "Ваш рюкзак больше этого!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",36) 
          refreshInventory() 
          itemPlus = 0
	end

end


weaponAmmoTable = {

["M1911 Mag"] = {
{"M1911",22},
},

["M9 SD Mag"] = {
{"M9 SD",23},
},

["Пустынный орёл Маг"] = {
{"Пустынный орёл",24},
},

["PDW Mag"] = {
{"PDW",28},
},

["MP5A5 Mag"] = {
{"MP5A5",29},
},

["AK Маг"] = {
{"AK-47",30},
},

["M4 Маг"] = {
{"M4",31},
},

["1866 Slug"] = {
{"Винчестер 1866",25},
},

["2Rnd. Slug"] = {
{"Sawn-Off Shotgun",26},
},

["Гранотомёт Маг"] = {
{"Гранатомёт",27},
},

["Снайперская винтовка Mag"] = {
{"Снайперская винтовка",34},
},

["Lee Enfield Mag"] = {
{"Lee Enfield",33},
},

["M136 Rocket"] = {
{"Heat-Seeking RPG",36},
{"M136 Rocket Launcher",35},
},

["others"] = {
{"Парашют",46},
{"Satchel",39},
{"Tear Gas",17},
{"Оск. граната M67",16},
{"Охотничий нож",4},
{"Топор",8},
{"Бинокль",43},
{"Бейсбольная бита",5},
{"Лопата",6},
{"Клюшка для гольфа",2},
},
}

function getWeaponAmmoType2 (weaponName)
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[2] then
			return weaponData[1],weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M1911 Mag"]) do
		if weaponName == weaponData[2] then
			return "M1911 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M9 SD Mag"]) do
		if weaponName == weaponData[2] then
			return "M9 SD Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Пустынный орёл Маг"]) do
		if weaponName == weaponData[2] then
			return "Пустынный орёл Маг",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["PDW Mag"]) do
		if weaponName == weaponData[2] then
			return "PDW Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["MP5A5 Mag"]) do
		if weaponName == weaponData[2] then
			return "MP5A5 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["AK Маг"]) do
		if weaponName == weaponData[2] then
			return "AK Маг",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M4 Маг"]) do
		if weaponName == weaponData[2] then
			return "M4 Маг",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["1866 Slug"]) do
		if weaponName == weaponData[2] then
			return "1866 Slug",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Гранотомёт Маг"]) do
		if weaponName == weaponData[2] then
			return "Гранотомёт Маг",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["2Rnd. Slug"]) do
		if weaponName == weaponData[2] then
			return "2Rnd. Slug",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Снайперская винтовка Mag"]) do
		if weaponName == weaponData[2] then
			return "Снайперская винтовка Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Lee Enfield Mag"]) do
		if weaponName == weaponData[2] then
			return "Lee Enfield Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M136 Rocket"]) do
		if weaponName == weaponData[2] then
			return "M136 Rocket",weaponData[2]
		end
	end
end


function weaponSwitch (weapon)
	if source == getLocalPlayer() then
		local ammoName,_ = getWeaponAmmoType2 (weapon)
		if getElementData(getLocalPlayer(),ammoName) > 0 then
			setElementData(getLocalPlayer(),ammoName,getElementData(getLocalPlayer(),ammoName)-1)
		end
	end
end
addEventHandler ( "onClientPlayerWeaponFire", getLocalPlayer(), weaponSwitch )

function makeRadioStayOff()
    setRadioChannel(0)
    cancelEvent()
end
addEventHandler("onClientPlayerVehicleEnter",getRootElement(),makeRadioStayOff)
addEventHandler("onClientPlayerRadioSwitch",getRootElement(),makeRadioStayOff)
