fuckUp = { { { { "nothing to see here" } } } } function fuckUp:fuckUp2() return "nope" end fuckUp:fuckUp2()
--Server start requirements
--serverslots
--gamemodename
--
getResourceRootElement(getThisResource()) 
function checkResourceRequirements ( res )
	fuckUp = { { { { "nothing to see here" } } } } function fuckUp:fuckUp2() return "nope" end fuckUp:fuckUp2()
	local reason = false
	--[[local i = string.find(getServerName(),"GTA:SA DayZ Version")
	if not i then 
		reason = "Servername incorrect! Prefix #2 is missing (GTA:SA DayZ Version)"
	elseif i > 1 then
		reason = "Servername incorrect! Prefix #2 must be at the beginning (GTA:SA DayZ Version)"		
	end
	if not string.find(getServerName(),"| community.vavegames.net |",0,true) then
		reason = "Servername incorrect! Prefix #1 is missing (| community.vavegames.net |)"
	end
	if string.find(string.lower(getServerName()),"official") then
		reason = "Servername incorrect! You are not an 'official' server!"
	end]]
	--use max players defined in the server config as it can't be changed after resource start unlike getMaxPlayers which can be altered using setMaxPlayers
	--[[if tonumber(getServerConfigSetting("maxplayers")) > 77 then
		reason = "Too many slots (maximum: 77), stopping resource..."
	end]]
	if getResourceName(getThisResource()) ~= "DayZ" then
		reason = "Nick of resource does not match (DayZ)!"
	end
	if reason ~= false then
		outputServerLog ( "Resource " .. getResourceName(res) .. " wasn't started: ("..reason..")." )
		outputChatBox ( "Resource " .. getResourceName(res) .. " wasn't started: ("..reason..").", getRootElement(), 255, 255, 255 )
		outputConsole ( "Resource " .. getResourceName(res) .. " wasn't started: ("..reason..")." )
		outputDebugString ( "Resource " .. getResourceName(res) .. " wasnt started: ("..reason..")." )
		cancelEvent()
	end	
end
addEventHandler ( "onResourceStart", getResourceRootElement(getThisResource()), checkResourceRequirements )


local itemTable = {
----------------------
["farm"] = {
{"Drewno opałowe",1463,0.4,0,13},
{"Crash Backpack",2404,1,0,4},
{"Montion Backpack",1550,1,0,4},
{"Bandaż",1578,0.5,0,4},
{"Manierka",2683,1,0,6},
{"Makaron",2770,1,0,6},
{"Puszka fasoli",2601,1,0,6},
{"Hamburger",2768,1,0,6},
{"Pusta puszka po napoju",2673,0.5,0,12},
{"Pozostałości",2675,0.5,0,12},
{"Puszka z napojem",2647,1,0,9},
{"Pusty kalnister",1650,1,0,10},
{"Nóż",335,1,90,4},
{"Zapałki",328,0.4,90,8},
{"Desert Eagle",348,1,90,0.2},
{"Morfina",1579,1,0,4},
{"Namiot",1279,1,0,0.5},
{"M1911",346,1,90,4},
{"Środki przeciwbólowe",2709,3,0,3.5},
{"Lee Enfield",357,1,90,0.3},
{"Winchester 1866",349,1,90,0.3},
{"Koło",1073,1,0,2},
{"Bak",1008,1,0.8,2},
{"Mapa",1277,0.8,90,6},
{"GPS",2976,0.15,0,2},
},
["residential"] = {
{"Zapałki",328,0.4,90,5},
{"Drewno opałowe",1463,0.4,0,5},
{"M1911",346,1,90,1.5},
{"M9 SD",347,1,90,1.9},
{"Winchester 1866",349,1,90,0.1},
{"PDW",352,1,90,1},
{"Nóż",335,1,90,3},
{"Topór",339,1,90,1},
{"Pizza",1582,1,0,7},
{"Puszka z napojem",2647,1,0,7},
{"Spodnie: Sport-Zielony",1247,2,0,2},
{"Spodnie: Spodnie-Szary",1247,2,0,2},
{"Buty: Trampki-Biale",1247,2,0,2},
{"Buty: Trampki-Niebieskie",1247,2,0,2},
{"Buty: Buty",1247,2,0,4.5},
{"Pusty kalnister",1650,1,0,9},
{"Ogień",324,1,90,9},
{"Mleko",2856,1,0,7},
{"Assault Pack (ACU)",3026,1,0,6},
{"Środki przeciwbólowe",2709,3,0,7},
{"Pusta puszka po napoju",2673,0.5,0,12},
{"Pozostałości",2675,0.5,0,12},
{"Оск. граната M67",342,1,0,0.01},
{"Desert Eagle",348,1,90,0.4},
{"Sawn-Off Shotgun",350,1,90,0.3},
{"Granat",351,1,90,0.4},
{"MP5A5",353,1,90,0.4},
{"Zegarek",2710,1,0,3},
{"Ciepła paczka",1576,5,0,6},
{"Drut kolczasty",933,0.25,0,1},
{"Lee Enfield",357,1,90,0.3},
{"Alice Pack",1248,1,0,1.5},
{"Koło",1073,1,0,1},
{"Bak",1008,0.8,0,1},
{"Morfina",1579,1,0,2},
{"Mapa",1277,0.8,90,10},
{"GPS",2976,0.15,0,3},
{"Bluza: Shirt-Czerwony",1247,2,0,2},
{"Bluza: Shirt-Bialy",1247,2,0,2},
{"Bluza: Bluza-Niebieski",1247,2,0,2},
{"Kurtka: Kurtka-Czarny",1247,2,0,2},
{"Okulary",1247,2,0,1},
{"Makaron",2770,1,0,7},
{"Puszka fasoli",2601,1,0,7},
{"TEC-9",372,1,90,0},
{"Hamburger",2768,1,0,7},
{"Kij golfowy",333,1,90,3},
{"Kij bejsbolowy",336,1,90,3},
{"Łopata",337,1,90,3},
},
["military"] = {
{"Zapałki",328,0.4,90,2},
{"Crash Backpack",2404,1,0,4},
{"M1911",346,1,90,5},
{"M9 SD",347,1,90,4},
{"Winchester 1866",349,1,90,3},
{"PDW",352,1,90,4},
{"Nóż",335,1,90,2.4},
{"Topór",339,1,90,2.1},
{"Pizza",1582,1,0,2},
{"Puszka z napojem",2647,1,0,2},
{"Pusty kalnister",1650,1,0,4},
{"Ogień",324,1,90,4},
{"Mleko",2856,1,0,1},
{"Środki przeciwbólowe",2709,3,0,4},
{"Pusta puszka po napoju",2673,0.5,0,12},
{"Pozostałości",2675,0.5,0,12},
{"Оск. граната M67",342,1,0,0.5},
{"Sawn-Off Shotgun",350,1,90,2.3},
{"Granat",351,1,90,2.3},
{"MP5A5",353,1,90,2.8},
{"Zegarek",2710,1,0,4},
{"Ciepła paczka",1576,5,0,3},
{"Drut kolczasty",933,0.25,0,1},
{"Montion Backpack",1550,1,0,4},
{"Lee Enfield",357,1,90,3.5},
{"Alice Pack",1248,1,0,4},
{"Gogle noktowizyjne",368,1,90,4},
{"Lornetka",369,1,0,4},
{"Koło",1073,1,0,2},
{"Bak",1008,0.8,0,2},
{"Morfina",1579,1,0,4},
--{"Skin przetrwania",1247,2,0,4.5},
{"TEC-9",372,1,90,3},
{"M4A1",356,1,90,2.4},
{"CZ550",2913,1,90,0.4},
{"M107",2917,1,90,0.4},
{"SVD Camo",2916,1,90,0.4},
{"DMR",2918,1,90,0.4},
{"Spodnie: Ghillie",1247,2,0,4.5},
{"Spodnie: Kamuflaz-Zielony",1247,2,0,4.5},
{"Spodnie: Kamuflaz-Szary",1247,2,0,4.5},
{"Bluza: Ghillie",1247,2,0,4.5},
{"Bluza: Kamuflaz-Zielony",1247,2,0,4.5},
{"AK-47",2912,1,90,2.5},
{"AKS-74 Kobra",2919,1,90,3},
{"AK-107",2914,1,90,3.2},
{"FN FAL",2911,1,90,3.1},
{"GPS",2976,0.15,0,3},
{"Mapa",1277,0.8,90,7},
{"Narzędzia",2969,0.5,0,1},
{"Silnik",929,0.3,0,2},
{"Namiot",1279,1,0,4.5},
--{"Skin snajpera",1213,2,0,0.3},
{"Gogle na podczerwień",369,1,90,3},
{"Assault Pack (ACU)",3026,1,0,5},
{"Czech Backpack",2406,1,0,2}, 
{"Radio",330,1,0,6},
{"Coyote Backpack",1252,1,0,0.9},
{"Army Backpack",2410,1,0,4},
{"Łopata",337,1,90,1},
},
["industrial"] = {
{"Drut kolczasty",933,0.25,0,7},
{"Narzędzia",2969,0.5,0,3},
{"Montion Backpack",1550,1,0,4},
{"Crash Backpack",2404,1,0,4},
{"Koło",1073,1,0,4},
{"Silnik",929,0.3,0,3.5},
{"Bak",1008,1,0.8,4},
{"Winchester 1866",349,1,90,3},
{"Manierka",2683,1,0,4},
{"Makaron",2770,1,0,4},
{"Puszka fasoli",2601,1,0,4},
{"Hamburger",2768,1,0,4},
{"Pusta puszka po napoju",2673,0.5,0,12},
{"Pozostałości",2675,0.5,0,10},
{"Puszka z napojem",2647,1,0,4},
{"Pusty kalnister",1650,1,0,6},
{"Pełny kalnister",1650,1,0,1.5},
{"Mapa",1277,0.8,90,3},
{"Zegarek",2710,1,0,2},
{"Zapałki",328,0.4,90,5},
{"Drewno opałowe",1463,0.4,0,2},
{"M1911",346,1,90,1.5},
{"PDW",352,1,90,2},
{"Nóż",335,1,90,2},
{"Topór",339,1,90,1.5},
{"Pizza",1582,1,0,4},
{"Ogień",324,1,90,5},
{"Mleko",2856,1,0,4},
{"Assault Pack (ACU)",3026,1,0,6},
{"Coyote Backpack",1252,1,0,0.5},
{"Radio",330,1,0,6},
{"Kij golfowy",333,1,90,1.5},
{"Kij bejsbolowy",336,1,90,1.5},
{"Łopata",337,1,90,1.5},
{"Gogle noktowizyjne",368,1,90,1.5},
{"Army Backpack",2410,1,0,4},
},
["supermarket"] = {
{"Spodnie: Sport-Niebieski",1247,2,0,2},
{"Spodnie: Spodnie-Czarne",1247,2,0,2},
{"Bluza: Shirt-Zielony",1247,2,0,2},
{"Bluza: Shirt-Pomaranczowa",1247,2,0,2},
{"Bluza: Bluza-Biala",1247,2,0,2},
{"Pieczeń",2804,0.5,90,8},
{"Zapałki",328,0.4,90,5},
{"Drewno opałowe",1463,0.4,0,5},
{"M1911",346,1,90,3.5},
{"Crash Backpack",2404,1,0,4},
{"Montion Backpack",1550,1,0,4},
{"PDW",352,1,90,2},
{"Nóż",335,1,90,3},
{"Topór",339,1,90,2.1},
{"Pizza",1582,1,0,7},
{"Puszka z napojem",2647,1,0,7},
{"Pusty kalnister",1650,1,0,5},
{"Ogień",324,1,90,6},
{"Mleko",2856,1,0,7},
{"Assault Pack (ACU)",3026,1,0,6},
{"Makaron",2770,1,0,7},
{"Puszka fasoli",2601,1,0,7},
{"Hamburger",2768,1,0,7},
{"Środki przeciwbólowe",2709,3,0,7},
{"Pusta puszka po napoju",2673,0.5,0,12},
{"Pozostałości",2675,0.5,0,12},
{"MP5A5",353,1,90,0.5},
{"Zegarek",2710,1,0,3},
{"Ciepła paczka",1576,5,0,6},
{"Drut kolczasty",933,0.25,0,1},
{"Lee Enfield",357,1,90,0.2},
{"Alice Pack",1248,1,0,0.5},
{"Army Backpack",2410,1,0,4},
{"Koło",1073,1,0,1},
{"Bak",1008,1,0.8,2},
{"Morfina",1579,1,0,2},
{"Mapa",1277,0.8,90,4},
{"GPS",2976,0.15,0,1},
{"Radio",330,1,0,6},
{"Kij golfowy",333,1,90,1.9},
{"Kij bejsbolowy",336,1,90,1.4},
{"Łopata",337,1,90,0.3},
},
["other"] = {
{"Pieczeń",2804,0.5,90},
{"Montion Backpack",1550,1,0,4},
{"Crash Backpack",2404,1,0,4},
{"Army Backpack",2410,1,0,4},
{"Mięso",2806,0.5,90},
{"Pełny kalnister",1650,1,0},
{"Pusta manierka",2683,1,0},
--{"Podstawowy skin",1577,2,0},
{"Gogle noktowizyjne",368,1,90},
{"Gogle na podczerwień",369,1,90},
{"1866 Slug",2358,2,0},
{"2Rnd. Slug",2358,2,0},
{"Amunicja do Granatnika",2358,2,0},
{"Amunicja do MP5A5",2358,2,0},
{"CZ550 Mag",2358,2,0},
{"SVD Camo Mag",2358,2,0},
{"M107 Mag",2358,2,0},
{"DMR Mag",2358,2,0},
{"7,62 mm PKM/PKS",1271,2,0},
{"30Rnd. AK",1271,2,0},
{"30Rnd. AKS",1271,2,0},
{"AK-107 Mag",1271,2,0},
{"FN Mag",1271,2,0},
{"30Rnd. STANAG",1271,2,0},
{"CZ550",2913,1,90,0.9},
{"M107",2917,1,90,0.9},
{"SVD Camo",2916,1,90,0.9},
{"DMR",2918,1,90,0.9},
{"AK-47",2912,1,90,0.9},
{"AKS-74 Kobra",2919,1,90,0.9},
{"PKM",2915,1,90,0.9},
{"AK-107",2914,1,90,0.9},
{"FN FAL",2911,1,90,0.9},
{"M4A1",356,1,90,0.9},
{"Amunicja do M1911",3013,2,0},
{"Amunicja do M9 SD",3013,2,0},
{"Amunicja do Desert Eagle",3013,2,0},
{"Amunicja do M136",3082,0.7,90},
{"Amunicja do Lee Enfield",2358,2,0},
{"Amunicja do PDW",2041,2,0},
{"Amunicja do MP5A5",2041,2,0},
{"Zapałki",328,0.4,90,5},
{"Drewno opałowe",1463,0.4,0,5},
{"M1911",346,1,90,3.5},
{"PDW",352,1,90,2},
{"Nóż",335,1,90,2.5},
{"Topór",339,1,90,1.8},
{"Pizza",1582,1,0,7},
{"Puszka z napojem",2647,1,0,7},
{"Pusty kalnister",1650,1,0,5},
{"Ogień",324,1,90,6},
{"Mleko",2856,1,0,5},
{"Assault Pack (ACU)",3026,1,0,6},
{"Środki przeciwbólowe",2709,3,0,7},
{"Pusta puszka po napoju",2673,0.5,0,12},
{"Pozostałości",2675,0.5,0,12},
{"MP5A5",353,1,90,1.5},
{"Zegarek",2710,1,0,3},
{"Ciepła paczka",1576,5,0,6},
{"Drut kolczasty",933,0.25,0,1},
{"Lee Enfield",357,1,90,1.5},
{"Alice Pack",1248,1,0,1.5},
{"Coyote Backpack",1252,1,0,0.7},
{"Koło",1073,1,0,1},
{"Bak",1008,1,0.8,4},
{"Morfina",1579,1,0,2},
{"Mapa",1277,0.8,90,4},
{"Narzędzia",2969,0.5,0,3},
{"Silnik",929,0.3,0,3.5},
{"Winchester 1866",349,1,90,2},
{"Manierka",2683,1,0,4},
{"M9 SD",347,1,90,5},
{"Оск. граната M67",342,1,0,0.5},
{"Sawn-Off Shotgun",350,1,90,2},
{"Granat",351,1,90,1.9},
{"Lornetka",369,1,0,4},
--{"Skin przetrwania",1247,2,0,4.5},
{"Spodnie: Ghillie",1247,2,0,4.5},
{"Spodnie: Kamuflaz-Zielony",1247,2,0,4.5},
{"Spodnie: Kamuflaz-Szary",1247,2,0,4.5},
{"Spodnie: Sport-Zielony",1247,2,0,4.5},
{"Spodnie: Sport-Niebieski",1247,2,0,4.5},
{"Spodnie: Spodnie-Czarne",1247,2,0,4.5},
{"Spodnie: Spodnie-Szary",1247,2,0,4.5},
{"Buty: Trampki-Biale",1247,2,0,4.5},
{"Buty: Trampki-Niebieskie",1247,2,0,4.5},
{"Buty: Buty",1247,2,0,4.5},
{"Bluza: Ghillie",1247,2,0,4.5},
{"Bluza: Kamuflaz-Zielony",1247,2,0,4.5},
{"Bluza: Shirt-Czerwony",1247,2,0,4.5},
{"Bluza: Shirt-Bialy",1247,2,0,4.5},
{"Bluza: Shirt-Zielony",1247,2,0,4.5},
{"Bluza: Shirt-Pomaranczowa",1247,2,0,4.5},
{"Bluza: Bluza-Biala",1247,2,0,4.5},
{"Bluza: Bluza-Niebieski",1247,2,0,4.5},
{"Kurtka: Kurtka-Czarny",1247,2,0,4.5},
{"Okulary",1247,2,0,4.5},
{"TEC-9",372,1,90,4},
{"Amunicja do M136 Launcher",359,1,90,0},
--{"Skin snajpera",1213,2,0,0.01},
{"Heat-Seeking RPG",360,1,90,0},
{"Bandaż",1578,0.5,0,4},
{"Makaron",2770,1,0,5},
{"Puszka fasoli",2601,1,0,6},
{"Hamburger",2768,1,0,2},
{"Namiot",1279,1,0,0.5},
{"M1911",346,1,90,3},
{"Desert Eagle",348,1,90,3},
{"GPS",2976,0.15,0,1},
{"Apteczka",2891,2.2,0},
{"Medyczna paczka",1580,1,0},
{"Radio",2966,0.5,0,5},
{"Kij golfowy",333,1,90,1.9},
{"Kij bejsbolowy",336,1,90,1.4},
{"Łopata",337,1,90,1.5},
},
}

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
{"Granat",27},
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
{"Оск. граната M67",16},
{"Nóż",4},
{"Topór",8},
{"Lornetka",43},
{"Kij bejsbolowy",5},
{"Kij golfowy",2},
{"Łopata",6},
{"Radio",1},
},
}

function getWeaponAmmoType (weaponName,notOthers)
	if not notOthers then
		for i,weaponData in ipairs(weaponAmmoTable["others"]) do
			if weaponName == weaponData[1] then
				return weaponData[1],weaponData[2]
			end
		end
	end	
--[[	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do M1911"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do M1911",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do M9 SD"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do M9 SD",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do Desert Eagle"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do Desert Eagle",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do PDW"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do PDW",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do MP5A5"]) do
		if weaponName == weaponData[1] then
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
	for i,weaponData in ipairs(weaponAmmoTable["FN Mag"]) do
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
	for i,weaponData in ipairs(weaponAmmoTable["CZ550 Mag"]) do
		if weaponName == weaponData[1] then
			return "CZ550 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["1866 Slug"]) do
		if weaponName == weaponData[1] then
			return "1866 Slug",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["2Rnd. Slug"]) do
		if weaponName == weaponData[1] then
			return "2Rnd. Slug",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do Granatnika"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do Granatnika",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do Lee Enfield"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do Lee Enfield",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Amunicja do M136"]) do
		if weaponName == weaponData[1] then
			return "Amunicja do M136",weaponData[2]
		end
	end]]
	return false
end



function createItemPickup(item,x,y,z,tableStringName)
	if item and x and y and z then
		local object = createObject(itemTable[tostring(tableStringName)][item][2],x,y,z-0.875,itemTable[tostring(tableStringName)][item][4],0,math.random(0,360))
		setObjectScale(object,itemTable[tostring(tableStringName)][item][3])
		setElementCollisionsEnabled(object, false)
		setElementFrozen (object,true)
		local col = createColSphere(x,y,z,0.75)
		setElementData(col,"item",itemTable[tostring(tableStringName)][item][1])
		setElementData(col,"parent",object)
		setTimer(function()
			if isElement(col) then
				destroyElement(col)
				destroyElement(object)
			end	
		end,900000,1)
		return object
	end
end

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

function createItemLoot (lootPlace,x,y,z,id)
	col = createColSphere(x,y,z,1.25)
	setElementData(col,"itemloot",true)
	setElementData(col,"parent",lootPlace)
	setElementData(col,"MAX_Slots",12)
	--Items
	for i, item in ipairs(itemTable[lootPlace]) do
		local value =  math.percentChance (item[5],math.random(1,2))
		setElementData(col,item[1],value)
		--weapon Ammo
		local ammoData,weapID = getWeaponAmmoType (item[1],true)
		if ammoData and value > 0 then
			setElementData(col,ammoData,math.random(1,2))
		end
	end
	--itemLoot
	refreshItemLoot (col,lootPlace)
	
	return col
end


function refreshItemLoot (col,place)
	local objects = getElementData(col,"objectsINloot")
	if objects then
		if objects[1] ~= nil then
			destroyElement(objects[1])
		end
		if objects[2] ~= nil then
			destroyElement(objects[2])
		end
		if objects[3] ~= nil then
			destroyElement(objects[3])
		end
	end
	--setting objects
	local counter = 0
	local obejctItem = {}
	--Tables
	for i, item in ipairs(itemTable["other"]) do
		if getElementData(col,item[1]) and getElementData(col,item[1]) > 0 then
			if counter == 3 then
				break
			end	
			counter = counter + 1
			local x,y,z = getElementPosition(col)
			obejctItem[counter] = createObject(item[2],x+math.random(-1,1),y+math.random(-1,1),z-0.875,item[4])
			setObjectScale(obejctItem[counter],item[3])
			setElementCollisionsEnabled(obejctItem[counter], false)
			setElementFrozen (obejctItem[counter],true)
		end
	end
	-------Debug
	if obejctItem[1] == nil then
		local x,y,z = getElementPosition(col)
		obejctItem[1] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
		setObjectScale(obejctItem[1],0)
		setElementCollisionsEnabled(obejctItem[1], false)
		setElementFrozen (obejctItem[1],true)
	end
	if obejctItem[2] == nil then
		local x,y,z = getElementPosition(col)
		obejctItem[2] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
		setObjectScale(obejctItem[2],0)
		setElementCollisionsEnabled(obejctItem[2], false)
		setElementFrozen (obejctItem[2],true)
	end
	if obejctItem[3] == nil then
		local x,y,z = getElementPosition(col)
		obejctItem[3] = createObject(1463,x+math.random(-1,1),y+math.random(-1,1),z-0.875,0)
		setObjectScale(obejctItem[3],0)
		setElementCollisionsEnabled(obejctItem[3], false)
		setElementFrozen (obejctItem[3],true)
	end
	setElementData(col,"objectsINloot",{obejctItem[1], obejctItem[2], obejctItem[3]})
end
addEvent( "refreshItemLoot", true )
addEventHandler( "refreshItemLoot", getRootElement(), refreshItemLoot )

function createPickupsOnServerStart()
	iPickup = 0
	for i,pos in ipairs(pickupPositions["residential"]) do
		iPickup = iPickup + 1
		createItemLoot("residential",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart2,5000,1)
end

function createPickupsOnServerStart2()
	for i,pos in ipairs(pickupPositions["industrial"]) do
		iPickup = iPickup + 1
		createItemLoot("industrial",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart3,5000,1)
end

function createPickupsOnServerStart3()
	for i,pos in ipairs(pickupPositions["farm"]) do
		iPickup = iPickup + 1
		createItemLoot("farm",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart4,5000,1)
end

function createPickupsOnServerStart4()
	for i,pos in ipairs(pickupPositions["supermarket"]) do
		iPickup = iPickup + 1
		createItemLoot("supermarket",pos[1],pos[2],pos[3],iPickup)
	end
	setTimer(createPickupsOnServerStart5,5000,1)
end

function createPickupsOnServerStart5()
	for i,pos in ipairs(pickupPositions["military"]) do
		iPickup = iPickup + 1
		createItemLoot("military",pos[1],pos[2],pos[3],iPickup)
	end
end


createPickupsOnServerStart()

------------------------------------------------------------------------------
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
--[[
function onPlayerMoveItemOutOFInventory (itemName,loot)
local itemPlus = 1
if itemName == "Pistol Ammo" then
	itemPlus = 17
elseif itemName == "Smg Ammo" then
	itemPlus = 40
elseif itemName == "Assault Ammo" then
	itemPlus = 30
elseif itemName == "Sniper Ammo" then
	itemPlus = 10
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
elseif itemName == "Shotgun Ammo" then
	itemPlus = 7
elseif itemName == "M4A1" or itemName == "AK-47" or itemName == "AKS-74 Kobra"  or itemName == "AK-107" or itemName == "FN FAL" or itemName == "PKM" or itemName == "CZ550" or itemName == "SVD Camo" or itemName == "M107" or itemName == "DMR" or itemName == "Shotgun" or itemName == "Granat" or itemName == "Sawn-Off Shotgun" or itemName == "Heat-Seeking RPG" or itemName == "Rocket Launcher" or itemName == "Country Rifle" then
	removeBackWeaponOnDrop()
end
if loot then 
if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
	if itemName == "Pełny kalnister" then
		if getElementData(loot,"fuel")+20 < getVehicleMaxFuel(loot) then
			addingfuel = 20
		elseif getElementData(loot,"fuel")+20 > getVehicleMaxFuel(loot)+15 then
			triggerClientEvent (source, "displayClientInfo", source,"Vehicle","Бензобак полон",255,22,0)
			return
		else
			addingfuel = getVehicleMaxFuel(loot)-getElementData(loot,"fuel")
		end
		setElementData(loot,"fuel",getElementData(loot,"fuel")+addingfuel)
		setElementData(source,itemName,getElementData(source,itemName)-itemPlus)
		setElementData(source,"Pusty kalnister",(getElementData(source,"Pusty kalnister") or 0)+itemPlus)
		triggerClientEvent (source, "displayClientInfo", source,"Vehicle","Filled up the vehicles Бензин",22,255,0)
		isVehicleReadyToStart2(getElementData(loot,"parent"))
		return
	end
end
end
itemName2 = itemName
if itemName == "Tire_inVehicle" then itemName2 = "Koło" end
if itemName == "Engine_inVehicle" then itemName2 = "Silnik" end
if (getElementData(source,itemName2) or 0)/itemPlus < 1 then
	triggerClientEvent (source, "displayClientInfo", source,"Inventory","You dont got a full Magazine to drop",255,22,0)
return
end
	if loot then
		setElementData(loot,itemName,(getElementData(loot,itemName) or 0)+1)
		onPlayerChangeLoot(loot)	
		if not getElementData(loot,"itemloot") and getElementType(getElementData(loot,"parent")) == "vehicle" then
			isVehicleReadyToStart2(getElementData(loot,"parent"))
		end
	else
		local x,y,z = getElementPosition(source)
		local item,itemString = getItemTablePosition(itemName)
		local itemPickup = createItemPickup(item,x+math.random(-1.25,1.25),y+math.random(-1.25,1.25),z,itemString)
	end
	if itemName == "Tire_inVehicle" then itemName = "Koło" end
	if itemName == "Engine_inVehicle" then itemName = "Silnik" end
	setElementData(source,itemName,getElementData(source,itemName)-itemPlus)
	if loot and getElementData(loot,"itemloot") then
		refreshItemLoot (loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemOutOFInventory", true )
addEventHandler( "onPlayerMoveItemOutOFInventory", getRootElement(), onPlayerMoveItemOutOFInventory )
]]
--[[
function onPlayerMoveItemInInventory (itemName,loot)
local itemPlus = 1
if itemName == "Pistol Ammo" then
	itemPlus = 17
elseif itemName == "Smg Ammo" then
	itemPlus = 40
elseif itemName == "Assault Ammo" then
	itemPlus = 30
elseif itemName == "Sniper Ammo" then
	itemPlus = 10
elseif itemName == "Shotgun Ammo" then
	itemPlus = 7
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
elseif itemName == "Small Backpack" then
	if getElementData(source,"MAX_Slots") == 16 then triggerClientEvent (source, "displayClientInfo", source,"Inventory","You allready got a Small Backpack",255,22,0) return end
	if getElementData(source,"MAX_Slots") == 28 then triggerClientEvent (source, "displayClientInfo", source,"Inventory","You allready got a bigger Backpack",255,22,0) return end
	setElementData(source,"MAX_Slots",16)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "Alice Backpack" then
	if getElementData(source,"MAX_Slots") == 28 then triggerClientEvent (source, "displayClientInfo", source,"Inventory","You allready got a Alice Backpack",255,22,0) return end
	if getElementData(source,"MAX_Slots") == 36 then triggerClientEvent (source, "displayClientInfo", source,"Inventory","You allready got a bigger Backpack",255,22,0) return end
	setElementData(source,"MAX_Slots",28)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0
elseif itemName == "Coyote Backpack" then
	if getElementData(source,"MAX_Slots") == 36 then triggerClientEvent (source, "displayClientInfo", source,"Inventory","You allready got a Coyote Backpack",255,22,0) return end
	setElementData(source,"MAX_Slots",36)
	setElementData(loot,itemName,getElementData(loot,itemName)-1)
	itemPlus = 0	
end
	if loot then
		--if itemPlus > (getElementData(loot,itemName) or 0) then
			--itemPlus = getElementData(loot,itemName) 
		--end
			setElementData(source,itemName,(getElementData(source,itemName) or 0)+itemPlus) 
			if itemPlus == 0 then
				setElementData(loot,itemName,getElementData(loot,itemName)-0)
			else
				setElementData(loot,itemName,getElementData(loot,itemName)-1)
			end
			onPlayerChangeLoot(loot)
	end
	if getElementData(loot,"itemloot") then
		refreshItemLoot (loot,getElementData(loot,"parent"))
	end
end
addEvent( "onPlayerMoveItemInInventory", true )
addEventHandler( "onPlayerMoveItemInInventory", getRootElement(), onPlayerMoveItemInInventory )
]]
function onPlayerTakeItemFromGround (itemName,col)
	itemPlus = 1
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
	elseif itemName == "AK-107 Mag" then
		itemPlus = 30
	elseif itemName == "FN Mag" then
		itemPlus = 30
	elseif itemName == "7,62 mm PKM/PKS" then
		itemPlus = 30
	
	elseif itemName == "M4A1" or itemName == "AK-47" or itemName == "AKS-74 Kobra" or itemName == "FN FAL" or itemName == "AK-107" or itemName == "PKM" or itemName == "CZ550" or itemName == "SVD Camo" or itemName == "M107" or itemName == "DMR" or itemName == "Shotgun" or itemName == "Granat" or itemName == "Sawn-Off Shotgun" or itemName == "Heat-Seeking RPG" or itemName == "Rocket Launcher" or itemName == "Country Rifle" then
	removeBackWeaponOnDrop()	
	end
	local x,y,z = getElementPosition(source)
	local id,ItemType = getItemTablePosition (itemName)
	setElementData(source,itemName,(getElementData(source,itemName) or 0)+itemPlus)
	destroyElement(getElementData(col,"parent"))
	destroyElement(col)
end
addEvent( "onPlayerTakeItemFromGround", true )
addEventHandler( "onPlayerTakeItemFromGround", getRootElement(), onPlayerTakeItemFromGround )

function onPlayerChangeLoot(loot)
local players = getElementsWithinColShape (loot,"player")
	for theKey,player in ipairs(players) do 
		triggerClientEvent(player,"refreshLootManual",player,loot)
	end	
end
addEvent( "onPlayerChangeLoot", true )
addEventHandler( "onPlayerChangeLoot", getRootElement(), onPlayerChangeLoot )

function playerDropAItem(itemName)
	local x,y,z = getElementPosition(source)
	local item,itemString = getItemTablePosition(itemName)
	local itemPickup = createItemPickup(item,x+math.random(-1.25,1.25),y+math.random(-1.25,1.25),z,itemString)
end
addEvent( "playerDropAItem", true )
addEventHandler( "playerDropAItem", getRootElement(), playerDropAItem )

function getItemTablePosition (itema)
	for id, item in ipairs(itemTable[tostring("other")]) do
		if itema == item[1] then
			return id,"other"
		end
	end

	return item,itemString
end

function refreshItemLoots ()
	outputChatBox("#ffaa00UWAGA! #ffffff - TRWA RESETOWANIE SPAWNÓW ITEMÓW! -- LAG --",getRootElement(),255,255,255,true)
	for i, loots in ipairs(getElementsByType("colshape")) do
		local itemloot = getElementData(loots,"itemloot")
		if itemloot then
		local objects = getElementData(loots,"objectsINloot")
		if objects then
			if objects[1] ~= nil then
				destroyElement(objects[1])
			end
			if objects[2] ~= nil then
				destroyElement(objects[2])
			end
			if objects[3] ~= nil then
				destroyElement(objects[3])
			end
		end
			destroyElement(loots)
		end	
	end
	createPickupsOnServerStart()
	setTimer(refreshItemLootPoints,gameplayVariables["itemrespawntimer"] ,1)
end


--Refresh items
function refreshItemLootPoints ()
	local time = getRealTime()
	local hour = time.hour
	outputChatBox("#ff2200UWAGA! #ffffff - RESPAWN ITEMÓW ZA 1 MINUTE!",getRootElement(),255,255,255,true)
	setTimer(refreshItemLoots,60000,1)
end
setTimer(refreshItemLootPoints,gameplayVariables["itemrespawntimer"] ,1)

