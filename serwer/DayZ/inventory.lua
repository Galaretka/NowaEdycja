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
{"Winchester 1866",3},
{"Granatnik",3},
{"Sawn-Off Shotgun",3},
{"AK-47",3},
{"M4A1",3},
{"PKM",3},
{"CZ550",3},
{"M107",3},
{"SVD Camo",3},
{"DMR",3},
{"AKS-74 Kobra",3},
{"AK-107",3},
{"FN FAL",3},
{"Lee Enfield",3},
{"Heat-Seeking RPG",5},
{"Amunicja do M136 Launcher",5},
},

["Secondary Weapon"] = {
{"M1911",2},
{"M9 SD",2},
{"PDW",2},
{"TEC-9",2},
{"MP5A5",3},
{"Desert Eagle",2},
{"Nóż",1},
{"Topór",2},
{"Kij bejsbolowy",2},
{"Łopata",2},
{"Kij golfowy",2},
},

["Specially Weapon"] = {
{"Spadochron",1},
{"Gas łzawiący",1},
--{"Granat",1},
{"Lornetka",1}
},
},
["Ammo"] = {
{"Amunicja do M1911",0.085},
{"Amunicja do M9 SD",0.085},
{"Amunicja do Desert Eagle",0.085},
{"Amunicja do PDW",0.025},
{"Amunicja do MP5A5",0.025},
{"FN Mag",0.035},
{"AK-107 Mag",0.035},
{"30Rnd. AKS",0.035},
{"30Rnd. AK",0.035},
{"30Rnd. STANAG",0.035},
{"7,62 mm PKM/PKS",0.035},
{"CZ550 Mag",0.1},
{"M107 Mag",0.1},
{"DMR Mag",0.1},
{"SVD Mag",0.1},
{"1866 Slug",0.067},
{"2Rnd. Slug",0.067},
{"Amunicja do Granatnika",0.067},
{"Amunicja do Lee Enfield",0.1},
{"Amunicja do M136",2},
},

["Food"] = {
{"Pełna manierka",1},
{"Makaron",1},
{"Puszka fasoli",1},
{"Hamburger",1},
{"Pizza",1},
{"Puszka z napojem",1},
{"Mleko",1},
{"Mięso",1},
},

["Items"] = {
{"Montion Backpack",1,"Nałóż"},
{"Drewno opałowe",2},
{"Bandaż",1,"Zabandażuj"},
{"Flara",1,"Połóż"},
{"Pusty kanister",2},
{"Pełny kanister",2},
{"Apteczka",2,"Użyj leków."},
{"Ciepła paczka",1,"Użyj leków."},
{"Środki przeciwbólowe",1,"Użyj leków."},
{"Morfina",1,"Użyj leków."},
{"Medyczna paczka",1,"Użyj leków."},
{"Drut kolczasty",1,"Rozłóż"},
{"Pieczeń",1},
{"Koło",2},
{"Silnik",5},
{"Bak",3},
{"Namiot",3,"Rozłóż"},
--{"Skin przetrwania",1,"Ubierz się"},
--{"Podstawowy skin",1,"Ubierz się"},
--{"Skin snajpera",1,"Ubierz się"},
--{"Skin bandyty",1,"Ubierz się"},
{"Pusta manierka",1,"Napełnij"}, 
{"Pusta puszka po napoju",1},
{"Pozostałości",1},
{"Assault Pack (ACU)",1,"Nałóż"},
{"Alice Pack",1,"Nałóż"},
{"Czech Backpack",1,"Nałóż"},
{"Coyote Backpack",1,"Nałóż"},
{"Crash Backpack",1,"Nałóż"},
{"Army Backpack",1,"Nałóż"},
},

["Toolbelt"] = {
{"Gogle noktowizyjne",1},
{"Gogle na podczerwień",1},
{"Mapa",1},
{"Zapałki",1,"Podpal"},
{"Zegarek",1},
{"GPS",1},
{"Narzędzia",1},
{"Radio",1},
},

["Ubrania"] = {
{"Spodnie: Ghillie",1,"Zaloz Ghillie spodnie"},
{"Spodnie: Kamuflaz-Zielony",1,"Zaloz Zielone spodnie"},
{"Spodnie: Kamuflaz-Szary",1,"Zaloz Szare spodnie"},
{"Spodnie: Sport-Zielony",1,"Zaloz Sport-Zielony spodnie"},
{"Spodnie: Sport-Niebieski",1,"Zaloz Sport-Niebieski spodnie"},
{"Spodnie: Spodnie-Czarne",1,"Zaloz Spodnie-Czarne spodnie"},
{"Spodnie: Spodnie-Szary",1,"Zaloz Spodnie-Szary spodnie"},
{"Buty: Trampki-Biale",1,"Zaloz Trampki-Biale"},
{"Buty: Trampki-Niebieskie",1,"Zaloz Trampki-Niebieskie"},
{"Buty: Buty",1,"Zaloz buty"},
{"Bluza: Ghillie",1,"Zaloz Ghillie bluza"},
{"Bluza: Kamuflaz-Zielony",1,"Zaloz Zielona bluza"},
{"Bluza: Shirt-Czerwony",1,"Zaloz Shirt-Czerwony"},
{"Bluza: Shirt-Bialy",1,"Zaloz Shirt-Bialy"},
{"Bluza: Shirt-Zielony",1,"Zaloz Shirt-Zielony"},
{"Bluza: Shirt-Pomaranczowa",1,"Zaloz Shirt-Pomaranczowa"},
{"Bluza: Bluza-Biala",1,"Zaloz Bluza-Biala"},
{"Bluza: Bluza-Niebieski",1,"Zaloz Bluza-Niebieski"},
{"Kurtka: Garnitur",1,"Zaloz Kurtka-Czarny"},
{"Okulary",1,"Zaloz okulary"},
},
}
------------------------------------------------------------------------------
--Inwentarz
local headline = {}
local gridlistItems = {}
local buttonItems = {}


inventoryWindows = guiCreateWindow(0.15, 0.28, 0.72, 0.63, "", true) 
-- inventoryWindows = guiCreateStaticImage(0.25,0.25,0.5,0.5,"images/scrollmenu_1.png",true)


headline["loot"] = guiCreateLabel(0.06, 0.05, 0.34, 0.09,"Plądruj",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["loot"],"center")
guiSetFont (headline["loot"], "default-bold-small" )

headline["inventory"] = guiCreateLabel(0.60, 0.05, 0.34, 0.09,"Inwentarz",true,inventoryWindows)
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

headline["slots"] = guiCreateLabel(0.62, 0.94, 0.29, 0.04,"Slotów:",true,inventoryWindows)
guiLabelSetHorizontalAlign (headline["slots"],"center")
guiLabelSetVerticalAlign (headline["slots"],"center")
guiSetFont (headline["slots"], "default-bold-small" )

headline["slots_loot"] = guiCreateLabel(0.07, 0.94, 0.29, 0.04,"Slotów:",true,inventoryWindows)
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
			local row = guiGridListAddRow ( gridlistItems["inventory"] )
			guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],"8. Ubrania", true, false )
		for id, item in ipairs(inventoryItems["Ubrania"]) do
			if getElementData(getLocalPlayer(),item[1]) and getElementData(getLocalPlayer(),item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["inventory"] )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["inventory"], row, gridlistItems["inventory_colum_amount"],getElementData(getLocalPlayer(),item[1]), false, false )
			end
		end
		if row1 and column1 then
			guiGridListSetSelectedItem ( gridlistItems["inventory"], row1,column1)
		end
		guiSetText(headline["slots"],"Slotów: "..getPlayerCurrentSlots().."/"..getPlayerMaxAviableSlots())
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
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"6. Inne", true, false )
		for id, item in ipairs(inventoryItems["Items"]) do
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
			guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],"8. Ubrania", true, false )
		for id, item in ipairs(inventoryItems["Ubrania"]) do
			if getElementData(loot,item[1]) and getElementData(loot,item[1]) >= 1 then
				local row = guiGridListAddRow ( gridlistItems["loot"] )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum"],item[1], false, false )
				guiGridListSetItemText ( gridlistItems["loot"], row, gridlistItems["loot_colum_amount"],getElementData(loot,item[1]), false, false )
			end
		end
		if row2 and column2 then
			--guiGridListSetSelectedItem ( gridlistItems["loot"], row2,column2)
		end
		guiSetText(headline["slots_loot"],"Slotów: "..getLootCurrentSlots(loot).."/"..(getLootMaxAviableSlots(loot)or 0))
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
	for id, item in ipairs(inventoryItems["Ubrania"]) do
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
	for id, item in ipairs(inventoryItems["Ubrania"]) do
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
	for id, item in ipairs(inventoryItems["Ubrania"]) do
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
{463,2,1,1},
{433,6,1,1},
{431,6,1,1},
{509,0,0,0},
{487,0,1,1},
{497,0,1,1},
{453,0,1,1},
{548,0,1,1},
{563,0,1,1},
{601,6,1,1},
{528,4,1,1},
{603,4,1,1},
{531,4,1,1},
{500,4,1,1},
{510,0,0,0},
{596,4,1,1},
{593,3,1,1},
{483,4,1,1},
{418,4,1,1},
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
-- {MODEL ID, MAX. FUEL},
{542,140},
{522,140},
{427,140},
{471,30},
{411,80},
{422,80},
{470,100},
{468,30},
{603,80},
{531,100},
{500,80},
{510,0},
{596,120},
{593,80},
{483,80},
{463,30},
{433,200},
{601,140},
{548,60},
{563,60},
{528, 80},
{418,80},
{431,140},
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
if playerMovedInInventory then startRollMessage2("Inventory", "Nie śpiesz się!", 255, 22, 0 ) return end -- [ID:0000005 - Several grammar + spelling mistakes and typos] //L
local itemName = guiGridListGetItemText ( gridlistItems["inventory"], guiGridListGetSelectedItem ( gridlistItems["inventory"] ), 1 )
	if getElementData(getLocalPlayer(),itemName) and getElementData(getLocalPlayer(),itemName) >= 1 then
		if isPlayerInLoot() then
			local isVehicle = getElementData(isPlayerInLoot(),"vehicle")
			local isTent = getElementData(isPlayerInLoot(),"tent")
			if isVehicle and not isTent then
				local veh = getElementData(isPlayerInLoot(),"parent")
				local tires,engine,parts = getVehicleAddonInfos (getElementModel(veh))
				if itemName == "Koło" and (getElementData(isPlayerInLoot(),"Tire_inVehicle") or 0) < tires  or itemName == "Silnik" and (getElementData(isPlayerInLoot(),"Engine_inVehicle") or 0)  < engine or itemName == "Bak" and (getElementData(isPlayerInLoot(),"Parts_inVehicle") or 0) < parts then
					if itemName == "Bak" then itemName = "Parts" end
					if itemName == "Silnik" then itemName = "Engine" end
					if itemName == "Koło" then itemName = "Tire" end
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
					startRollMessage2("Inventory", "Inwentarz jest pełny!", 255, 22, 0 )
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
				startRollMessage2("Inventory", "Inwentarz jest pełny!", 255, 22, 0 )
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
	if itemName == "Amunicja do M1911" then
		itemPlus = 7
	elseif itemName == "Amunicja do M9 SD" then
		itemPlus = 15
	elseif itemName == "Amunicja do Desert Eagle" then
		itemPlus = 7
	elseif itemName == "Amunicja do PDW" then
		itemPlus = 30
	elseif itemName == "Amunicja do MP5A5" then
		itemPlus = 20
	elseif itemName == "1866 Slug" then
		itemPlus = 7
	elseif itemName == "2Rnd. Slug" then
		itemPlus = 2
	elseif itemName == "Amunicja do Granatnika" then
		itemPlus = 7
	elseif itemName == "Amunicja do Lee Enfield" then
		itemPlus = 10
	elseif itemName == "Amunicja do M136" then
		itemPlus = 0
	elseif itemName == "CZ550 Mag" then
		itemPlus = 10
	elseif itemName == "M107 Mag" then
		itemPlus = 10
	elseif itemName == "SVD Mag" then
		itemPlus = 10
	elseif itemName == "DMR Mag" then
		itemPlus = 10
	elseif itemName == "30Rnd. STANAG" then
		itemPlus = 30
	elseif itemName == "30Rnd. AK" then
		itemPlus = 30
	elseif itemName == "30Rnd. AKS" then
		itemPlus = 30
	elseif itemName == "7,62 mm PKM/PKS" then
		itemPlus = 30
	elseif itemName == "AK-107 Mag" then
		itemPlus = 30
	elseif itemName == "FN Mag" then
		itemPlus = 30
	
	elseif itemName == "M4A1" or itemName == "AK-47" or itemName == "AKS-74 Kobra" or itemName == "AK-107" or itemName == "FN FAL" or itemName == "PKM" or itemName == "CZ550" or itemName == "SVD Camo" or itemName == "M107" or itemName == "DMR" or itemName == "Shotgun" or itemName == "Granatnik" or itemName == "Sawn-Off Shotgun" or itemName == "Heat-Seeking RPG" or itemName == "Rocket Launcher" or itemName == "Country Rifle" then
	--removeBackWeaponOnDrop()	
	triggerServerEvent("removeBackWeaponOnDrop", getLocalPlayer())
end
if loot then 
if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
	if itemName == "Pełny kanister" then
		if getElementData(loot,"fuel")+20 < getVehicleMaxFuel(loot) then
			addingfuel = 20
		elseif getElementData(loot,"fuel")+20 > getVehicleMaxFuel(loot)+15 then
			triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Zbiornik z paliwem jest pełny!",255,22,0)
			return
		else
			addingfuel = getVehicleMaxFuel(loot)-getElementData(loot,"fuel")
		end
		setElementData(loot,"fuel",getElementData(loot,"fuel")+addingfuel)
		setElementData(getLocalPlayer(),itemName,getElementData(getLocalPlayer(),itemName)-itemPlus)
		setElementData(getLocalPlayer(),"Pusty kanister",(getElementData(getLocalPlayer(),"Pusty kanister") or 0)+itemPlus)
		triggerEvent ("displayClientInfo", getLocalPlayer(),"Vehicle","Wypełnia zbiornik o 20 litrów!",22,255,0)
		return
	end
end
end
itemName2 = itemName
if itemName == "Tire_inVehicle" then itemName2 = "Koło" end
if itemName == "Engine_inVehicle" then itemName2 = "Silnik" end
if itemName == "Parts_inVehicle" then itemName2 = "Bak" end
if (getElementData(getLocalPlayer(),itemName2) or 0)/itemPlus < 1 then
	triggerEvent ("displayClientInfo", getLocalPlayer(),"Inventory","Użyj narzędzi!",255,22,0)
return
end
if itemName == "Assault Pack (ACU)" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 12 and          
getElementData(getLocalPlayer(),"Assault Pack (ACU)") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz go wyrzucić!", 255, 22, 0) 
return true 
end 
if itemName == "Alice Pack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 16 and          
getElementData(getLocalPlayer(),"Alice Pack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz go wyrzucić!", 255, 22, 0) 
return true 
end 
if itemName == "Czech Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 26 and          
getElementData(getLocalPlayer(),"Czech Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz go wyrzucić!", 255, 22, 0) 
return true 
end 
if itemName == "Montion Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 85 and          
getElementData(getLocalPlayer(),"Montion Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz go wyrzucić!", 255, 22, 0) 
return true 
end 
if itemName == "Army Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 69 and          
getElementData(getLocalPlayer(),"Army Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz go wyrzucić!", 255, 22, 0) 
return true 
end 
if itemName == "Crash Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 47 and          
getElementData(getLocalPlayer(),"Crash Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz go wyrzucić!", 255, 22, 0) 
return true 
end 
if itemName == "Coyote Backpack" and          
getElementData(getLocalPlayer(), "MAX_Slots") == 36 and          
getElementData(getLocalPlayer(),"Coyote Backpack") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz go wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Spodnie: Ghillie" and          
getElementData(getLocalPlayer(), "trousers") == 7 and          
getElementData(getLocalPlayer(),"Spodnie: Ghillie") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te spodnie masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Spodnie: Kamuflaz-Zielony" and          
getElementData(getLocalPlayer(), "trousers") == 1 and          
getElementData(getLocalPlayer(),"Spodnie: Kamuflaz-Zielony") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te spodnie masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Spodnie: Kamuflaz-Szary" and          
getElementData(getLocalPlayer(), "trousers") == 2 and          
getElementData(getLocalPlayer(),"Spodnie: Kamuflaz-Szary") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te spodnie masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Spodnie: Sport-Zielony" and          
getElementData(getLocalPlayer(), "trousers") == 3 and          
getElementData(getLocalPlayer(),"Spodnie: Sport-Zielony") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te spodnie masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Spodnie: Sport-Niebieski" and          
getElementData(getLocalPlayer(), "trousers") == 4 and          
getElementData(getLocalPlayer(),"Spodnie: Sport-Niebieski") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te spodnie masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Spodnie: Spodnie-Czarne" and          
getElementData(getLocalPlayer(), "trousers") == 5 and          
getElementData(getLocalPlayer(),"Spodnie: Spodnie-Czarne") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te spodnie masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Spodnie: Spodnie-Szary" and          
getElementData(getLocalPlayer(), "trousers") == 6 and          
getElementData(getLocalPlayer(),"Spodnie: Spodnie-Szary") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te spodnie masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Buty: Trampki-Biale" and          
getElementData(getLocalPlayer(), "Shoes") == 1 and          
getElementData(getLocalPlayer(),"Buty: Trampki-Biale") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te buty masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Buty: Trampki-Niebieskie" and          
getElementData(getLocalPlayer(), "Shoes") == 2 and          
getElementData(getLocalPlayer(),"Buty: Trampki-Niebieskie") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te buty masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Buty: Buty" and          
getElementData(getLocalPlayer(), "Shoes") == 3 and          
getElementData(getLocalPlayer(),"Buty: Buty") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Te buty masz na nogach! Nie możesz je wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Bluza: Ghillie" and          
getElementData(getLocalPlayer(), "Shirt") == 9 and          
getElementData(getLocalPlayer(),"Bluza: Ghillie") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już tę bluzę na sobie! Nie możesz ją wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Bluza: Kamuflaz-Zielony" and          
getElementData(getLocalPlayer(), "Shirt") == 8 and          
getElementData(getLocalPlayer(),"Bluza: Kamuflaz-Zielony") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już tę bluzę na sobie! Nie możesz ją wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Bluza: Shirt-Czerwony" and          
getElementData(getLocalPlayer(), "Shirt") == 1 and          
getElementData(getLocalPlayer(),"Bluza: Shirt-Czerwony") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już tę bluzę na sobie! Nie możesz ją wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Bluza: Shirt-Bialy" and          
getElementData(getLocalPlayer(), "Shirt") == 2 and          
getElementData(getLocalPlayer(),"Bluza: Shirt-Bialy") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już tę bluzę na sobie! Nie możesz ją wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Bluza: Shirt-Zielony" and          
getElementData(getLocalPlayer(), "Shirt") == 3 and          
getElementData(getLocalPlayer(),"Bluza: Shirt-Zielony") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już tę bluzę na sobie! Nie możesz ją wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Bluza: Shirt-Pomaranczowa" and          
getElementData(getLocalPlayer(), "Shirt") == 4 and          
getElementData(getLocalPlayer(),"Bluza: Shirt-Pomaranczowa") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już tę bluzę na sobie! Nie możesz ją wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Bluza: Bluza-Biala" and          
getElementData(getLocalPlayer(), "Shirt") == 5 and          
getElementData(getLocalPlayer(),"Bluza: Bluza-Biala") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już tę bluzę na sobie! Nie możesz ją wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Bluza: Bluza-Niebieski" and          
getElementData(getLocalPlayer(), "Shirt") == 6 and          
getElementData(getLocalPlayer(),"Bluza: Bluza-Niebieski") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już tę bluzę na sobie! Nie możesz ją wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Kurtka: Garnitur" and          
getElementData(getLocalPlayer(), "Shirt") == 7 and          
getElementData(getLocalPlayer(),"Kurtka: Garnitur") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już tę bluzę na sobie! Nie możesz ją wyrzucić!", 255, 22, 0) 
return true 
end
if itemName == "Okulary" and          
getElementData(getLocalPlayer(), "glases") == 1 and          
getElementData(getLocalPlayer(),"Okulary") == 1 then 
triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Masz już te okulary na głowie! Nie możesz ją wyrzucić!", 255, 22, 0) 
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
	if itemName == "Tire_inVehicle" then itemName = "Koło" end
	if itemName == "Engine_inVehicle" then itemName = "Silnik" end
	if itemName == "Parts_inVehicle" then itemName = "Bak" end
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
					startRollMessage2("Inventory", "Nie śpiesz się!", 255, 22, 0 )
					return
				end	
			else
				startRollMessage2("Inventory", "Inwentarz jest pełny!", 255, 22, 0 )
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
if itemName == "Amunicja do M1911" then
	itemPlus = 7
elseif itemName == "Amunicja do M9 SD" then
	itemPlus = 15
elseif itemName == "Amunicja do Desert Eagle" then
	itemPlus = 7
elseif itemName == "Amunicja do PDW" then
	itemPlus = 30
elseif itemName == "Amunicja do MP5A5" then
	itemPlus = 20
elseif itemName == "CZ550 Mag" then
	itemPlus = 10
elseif itemName == "M107 Mag" then
	itemPlus = 10
elseif itemName == "SVD Mag" then
	itemPlus = 10
elseif itemName == "DMR Mag" then
	itemPlus = 10
elseif itemName == "30Rnd. STANAG" then
	itemPlus = 30
elseif itemName == "30Rnd. AK" then
	itemPlus = 30
elseif itemName == "30Rnd. AKS" then
	itemPlus = 30
elseif itemName == "AK-107 Mag" then
	itemPlus = 30
elseif itemName == "FN Mag" then
	itemPlus = 30
elseif itemName == "7,62 mm PKM/PKS" then
	itemPlus = 30
elseif itemName == "1866 Slug" then
	itemPlus = 7
elseif itemName == "2Rnd. Slug" then
	itemPlus = 2
elseif itemName == "Amunicja do Granatnika" then
	itemPlus = 7

elseif itemName == "Amunicja do Lee Enfield" then
	itemPlus = 10
elseif itemName == "Amunicja do M136" then
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
		if itemName == "Zapałki" then
			if getElementData(getLocalPlayer(),"Drewno opałowe") == 0 then
				return
			end
		end
		if itemName == "Bandaż" then
			if getElementData(getLocalPlayer(),"bleeding") == 0 then
				return
			end
		end	
		if itemName == "Apteczka" then
			if getElementData(getLocalPlayer(),"blood") > 10500 then
				return
			end
		end	
		if itemName == "Ciepła paczka" then
			if getElementData(getLocalPlayer(),"temperature") > 35 then
				return
			end
		end	
		if itemName == "Środki przeciwbólowe" then
			if not getElementData(getLocalPlayer(),"pain") then
				return
			end
		end	
		if itemName == "Morfina" then
			if not getElementData(getLocalPlayer(),"brokenbone") then
				return
			end
		end	
		if itemName == "Medyczna paczka" then
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
		return itemName,"Weź pierwszą broń"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Secondary Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Weź drugą broń"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Weapons"]["Specially Weapon"]) do
	if itemName == itemInfo[1] then
		return itemName,"Weź specjalną broń"
	end	
end
for i,itemInfo in ipairs(inventoryItems["Ammo"]) do
	if itemName == itemInfo[1] then
		return itemName,false
	end	
end
for i,itemInfo in ipairs(inventoryItems["Food"]) do
	if itemName == itemInfo[1] then
		if itemInfo[1] == "Pełna manierka" or itemInfo[1] == "Mleko" or itemInfo[1] == "Puszka z napojem" then
			info = "Wypij"
		else
			info = "Zjedz"
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
for i,itemInfo in ipairs(inventoryItems["Ubrania"]) do
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
	if itemInfo == "Wypij" then
		triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"thirst")
	elseif itemInfo == "Zjedz" then
		triggerServerEvent("onPlayerRequestChangingStats",getLocalPlayer(),itemName,itemInfo,"food")
	elseif itemInfo == "Ubierz się" then
		triggerServerEvent("onPlayerChangeSkin",getLocalPlayer(),itemName)
	elseif itemName == "Pusta manierka" then
		triggerServerEvent("onPlayerRefillWaterBottle",getLocalPlayer(),itemName)		
	elseif itemName == "Namiot" then
		triggerServerEvent("onPlayerPitchATent",getLocalPlayer(),itemName)
	elseif itemInfo == "Rozłóż"	then
		triggerServerEvent("onPlayerBuildAWireFence",getLocalPlayer(),itemName)
	elseif itemName == "Flara" then
		triggerServerEvent("onPlayerPlaceRoadflare",getLocalPlayer(),itemName)	
	elseif itemInfo == "Podpal" then
		triggerServerEvent("onPlayerMakeAFire",getLocalPlayer(),itemName)	
	elseif itemInfo == "Użyj leków." then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)
	elseif itemName == "Bandaż" then
		triggerServerEvent("onPlayerUseMedicObject",getLocalPlayer(),itemName)	
	elseif itemInfo == "Użyj leków. Googles" then
		triggerServerEvent("onPlayerChangeView",getLocalPlayer(),itemName)	
	elseif itemInfo == "Weź pierwszą broń" then
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,1)
	elseif itemInfo == "Weź drugą broń" then
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,2)
	elseif itemInfo == "Weź specjalną broń" then
		triggerServerEvent("onPlayerRearmWeapon",getLocalPlayer(),itemName,3)
	-------------------- 
	
	--Одежда
	--Trousers
	elseif itemInfo == "Zaloz Ghillie spodnie" then
	triggerServerEvent("onPlayerGhillieTrouses",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Zielone spodnie" then
	triggerServerEvent("onPlayerGreenChangeTrouses",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Szare spodnie" then
	triggerServerEvent("onPlayerYellowChangeTrouses",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Sport-Zielony spodnie" then
	triggerServerEvent("onPlayerChangeSportGreenTrouses",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Sport-Niebieski spodnie" then
	triggerServerEvent("onPlayerChangeSportBlueTrouses",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Spodnie-Czarne spodnie" then
	triggerServerEvent("onPlayerChangeSuitblakTrouses",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Spodnie-Szary spodnie" then
	triggerServerEvent("onPlayerChangeGrybridzTrouses",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	--Капцы
	elseif itemInfo == "Zaloz Trampki-Biale" then
	triggerServerEvent("onPlayerChangeWhiteShoes",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Trampki-Niebieskie" then
	triggerServerEvent("onPlayerChangeBlueShoes",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz buty" then
	triggerServerEvent("onPlayerChangeSuitShoes",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	--Тело
	elseif itemInfo == "Zaloz Ghillie bluza" then
	triggerServerEvent("onPlayerGhillieChangeShirt",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Zielona bluza" then
	triggerServerEvent("onPlayerGreenChangeShirt",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Shirt-Czerwony" then
	triggerServerEvent("onPlayerChangeRedtShirt",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Shirt-Bialy" then
	triggerServerEvent("onPlayerChangeWhiteShirt",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Shirt-Zielony" then
	triggerServerEvent("onPlayerChangeGreenShirt",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Shirt-Pomaranczowa" then
	triggerServerEvent("onPlayerChangeOrangeShirt",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Bluza-Biala" then
	triggerServerEvent("onPlayerChangeWhiteHoody",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Bluza-Niebieski" then
	triggerServerEvent("onPlayerChangeBlueHoody",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Kurtka-Czarny" then
	triggerServerEvent("onPlayerChangeSuitBlack",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	--Шляпы
	--Очки
	elseif itemInfo == "Zaloz okulary" then
	triggerServerEvent("onPlayerChangeGlasses",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
	elseif itemInfo == "Zaloz Maska gazowa" then
	triggerServerEvent("onPlayerChangeMaskaGazowa",getLocalPlayer(),itemName)
	playSound("sounds/cloth.ogg")
    elseif itemName == "Assault Pack (ACU)" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 12 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz założyć go drugi raz!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 12 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Twój plecak ma więcej slotów niż ten!!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",12) 
          refreshInventory() 
          itemPlus = 0 
-------------------- 
    elseif itemName == "Alice Pack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 16 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz założyć go drugi raz!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 16 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Twój plecak ma więcej slotów niż ten!!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",16) 
          refreshInventory() 
          itemPlus = 0 
-------------------- 
    elseif itemName == "Czech Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 26 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz założyć go drugi raz!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 26 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Twój plecak ma więcej slotów niż ten!!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",26) 
          refreshInventory() 
          itemPlus = 0 
---------------------
    elseif itemName == "Montion Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 85 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz założyć go drugi raz!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 85 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Twój plecak ma więcej slotów niż ten!!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",85) 
          refreshInventory() 
          itemPlus = 0 
---------------------
    elseif itemName == "Army Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 69 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz założyć go drugi raz!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 69 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Twój plecak ma więcej slotów niż ten!!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",69) 
          refreshInventory() 
          itemPlus = 0 
---------------------
    elseif itemName == "Crash Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 47 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz założyć go drugi raz!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 47 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Twój plecak ma więcej slotów niż ten!!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",47) 
          refreshInventory() 
          itemPlus = 0 
--------------------- 
    elseif itemName == "Coyote Backpack" then 
             if getElementData(getLocalPlayer(), "MAX_Slots") == 36 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Ten plecak masz na sobie! Nie możesz założyć go drugi raz!", 255, 22, 0) 
               return 
             end 
             if getElementData(getLocalPlayer(), "MAX_Slots") > 36 then 
               triggerEvent("displayClientInfo", getLocalPlayer(), "Inwentarz", "Twój plecak ma więcej slotów niż ten!!", 255, 22, 0) 
               return 
             end 
          setElementData(getLocalPlayer(),"MAX_Slots",36) 
          refreshInventory() 
          itemPlus = 0
	end

end


weaponAmmoTable = {

["Amunicja do M1911"] = {
{"M1911",22},
},

["Amunicja do M9 SD"] = {
{"M9 SD",23},
},

["Amunicja do Desert Eagle"] = {
{"Desert Eagle",24},
},

["Amunicja do PDW"] = {
{"PDW",28},
},

["Amunicja do MP5A5"] = {
{"MP5A5",29},
},

["30Rnd. AK"] = {
{"AK-47",30},
},

["30Rnd. AKS"] = {
{"AKS-74 Kobra",30},
},

["AK-107 Mag"] = {
{"AK-107",30},
},

["FN Mag"] = {
{"FN FAL",30},
},

["7,62 mm PKM/PKS"] = {
{"PKM",30},
},

["30Rnd. STANAG"] = {
{"M4A1",31},
},

["CZ550 Mag"] = {
{"CZ550",34},
},

["SVD Mag"] = {
{"SVD Camo",34},
},

["M107 Mag"] = {
{"M107",34},
},

["DMR Mag"] = {
{"DMR",34},
},


["1866 Slug"] = {
{"Winchester 1866",25},
},

["2Rnd. Slug"] = {
{"Sawn-Off Shotgun",26},
},

["Amunicja do Granatnika"] = {
{"Granatnik",27},
},


["Amunicja do Lee Enfield"] = {
{"Lee Enfield",33},
},

["Amunicja do M136"] = {
{"Heat-Seeking RPG",36},
{"Amunicja do M136 Launcher",35},
},

["others"] = {
{"Spadochron",46},
{"Satchel",39},
{"Gas łzawiący",17},
--{"Granat",16},
{"Nóż",4},
{"Topór",8},
{"Lornetka",43},
{"Kij bejsbolowy",5},
{"Łopata",6},
{"Kij golfowy",2},
},
}

function getWeaponAmmoType2 (weaponName)
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[2] then
			return weaponData[1],weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do M1911"]) do
		if weaponName == weaponData[2] then
			return "Amunicja do M1911",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do M9 SD"]) do
		if weaponName == weaponData[2] then
			return "Amunicja do M9 SD",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do Desert Eagle"]) do
		if weaponName == weaponData[2] then
			return "Amunicja do Desert Eagle",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do PDW"]) do
		if weaponName == weaponData[2] then
			return "Amunicja do PDW",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do MP5A5"]) do
		if weaponName == weaponData[2] then
			return "Amunicja do MP5A5",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["30Rnd. AK"]) do
		if weaponName == weaponData[1] then
			return "30Rnd. AK",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["30Rnd. AKS"]) do
		if weaponName == weaponData[1] then
			return "30Rnd. AKS",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["AK-107 Mag"]) do
		if weaponName == weaponData[1] then
			return "AK-107 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["FN FAL"]) do
		if weaponName == weaponData[1] then
			return "FN FAL",weaponData[2]
		end
	end
    for i,weaponData in ipairs(weaponAmmoTable["30Rnd. STANAG"]) do
		if weaponName == weaponData[1] then
			return "30Rnd. STANAG",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["7,62 mm PKM/PKS"]) do
		if weaponName == weaponData[1] then
			return "7,62 mm PKM/PKS",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["SVD Mag"]) do
		if weaponName == weaponData[1] then
			return "SVD Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["M107 Mag"]) do
		if weaponName == weaponData[1] then
			return "M107 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["DMR Mag"]) do
		if weaponName == weaponData[1] then
			return "DMR Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["CZ550"]) do
		if weaponName == weaponData[1] then
			return "CZ550 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["1866 Slug"]) do
		if weaponName == weaponData[2] then
			return "1866 Slug",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do Granatnika"]) do
		if weaponName == weaponData[2] then
			return "Amunicja do Granatnika",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["2Rnd. Slug"]) do
		if weaponName == weaponData[2] then
			return "2Rnd. Slug",weaponData[2]
		end
	end

	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do Lee Enfield"]) do
		if weaponName == weaponData[2] then
			return "Amunicja do Lee Enfield",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do M136"]) do
		if weaponName == weaponData[2] then
			return "Amunicja do M136",weaponData[2]
		end
	end
end


function weaponSwitch(weapon)
    local current_1 = getElementData(getLocalPlayer(),"currentweapon_1")
    if source == getLocalPlayer() then
            if current_1 == "M107" then
            if getElementData(getLocalPlayer(),"M107 Mag") > 0 then
                setElementData(getLocalPlayer(),"M107 Mag",getElementData(getLocalPlayer(),"M107 Mag")-1)
            end
      		elseif current_1 == "SVD Camo" then
            if getElementData(getLocalPlayer(),"SVD Mag") > 0 then
                setElementData(getLocalPlayer(),"SVD Mag",getElementData(getLocalPlayer(),"SVD Mag")-1)
            end
			elseif current_1 == "CZ550" then
            if getElementData(getLocalPlayer(),"CZ550 Mag") > 0 then
                setElementData(getLocalPlayer(),"CZ550 Mag",getElementData(getLocalPlayer(),"CZ550 Mag")-1)
            end
			elseif current_1 == "PKM" then
            if getElementData(getLocalPlayer(),"7,62 mm PKM/PKS") > 0 then
                setElementData(getLocalPlayer(),"7,62 mm PKM/PKS",getElementData(getLocalPlayer(),"7,62 mm PKM/PKS")-1)
            end
			elseif current_1 == "DMR" then
            if getElementData(getLocalPlayer(),"DMR Mag") > 0 then
                setElementData(getLocalPlayer(),"DMR Mag",getElementData(getLocalPlayer(),"DMR Mag")-1)
            end
			elseif current_1 == "AKS-74 Kobra" then
            if getElementData(getLocalPlayer(),"30Rnd. AKS") > 0 then
                setElementData(getLocalPlayer(),"30Rnd. AKS",getElementData(getLocalPlayer(),"30Rnd. AKS")-1)
            end
			elseif current_1 == "AK-47" then
            if getElementData(getLocalPlayer(),"30Rnd. AK") > 0 then
                setElementData(getLocalPlayer(),"30Rnd. AK",getElementData(getLocalPlayer(),"30Rnd. AK")-1)
            end
			elseif current_1 == "AK-107" then
            if getElementData(getLocalPlayer(),"AK-107 Mag") > 0 then
                setElementData(getLocalPlayer(),"AK-107 Mag",getElementData(getLocalPlayer(),"AK-107 Mag")-1)
            end
			elseif current_1 == "FN FAL" then
            if getElementData(getLocalPlayer(),"FN Mag") > 0 then
                setElementData(getLocalPlayer(),"FN Mag",getElementData(getLocalPlayer(),"FN Mag")-1)
            end
			elseif current_1 == "M4A1" then
            if getElementData(getLocalPlayer(),"30Rnd. STANAG") > 0 then
                setElementData(getLocalPlayer(),"30Rnd. STANAG",getElementData(getLocalPlayer(),"30Rnd. STANAG")-1)
            end
        else
        local ammoName, _ = getWeaponAmmoType2(weapon)
            if getElementData(getLocalPlayer(), ammoName) > 0 then
                setElementData(getLocalPlayer(), ammoName, getElementData(getLocalPlayer(), ammoName) - 1)
            end
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
