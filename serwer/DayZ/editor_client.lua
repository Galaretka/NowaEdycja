﻿--[[
#---------------------------------------------------------------#
----*			DayZ MTA Script editor_client.lua			*----
----* This Script is owned by Marwin, you are allowed to edit it.
----* Owner: Marwin W., Germany, Lower Saxony, Otterndorf
----* Skype: xxmavxx96
----* Перевод мода: by Lorenco								*----
#---------------------------------------------------------------#
]]

-- SCOREBOARD
shownText = {}
 
	shownText["name"] = "Nick"
	shownText["murders"] = "Morderstw"
	shownText["zombieskilled"] = "Zabitych zombi:"
	shownText["Czas życia"] = "Czas życia"
	shownText["headshots"] =  "HeadShoty"
	shownText["blood"] =  "Krew"
	shownText["temperature"] =  "Temperatura"
	shownText["humanity"] =  "Ludzkość"
	shownText["banditskilled"] =  "Zabitych bandytów:"
	shownText["players"] =  "Graczy:"


gameplayVariables = {}

-- PING CHECK	

	gameplayVariables["ping"] = 450 -- Checks if ping is over the set amount. DEFAULT: 600
	
-- ZOMBIE DAMAGE
	gameplayVariables["zombiedamage"] = math.random(400,900) -- Damage done by zombies - DEFAULT: math.random(400,900), for consistent damage, remove math.random(400,900) and insert value (EXAMPLE: 1000)
	
	gameplayVariables["enablenight"] = false -- Whether or not the night should be darker - DEFAULT: true - SET TO false to disable - remember you need to set it in editor_server.lua too.
	
-- WEAPON DAMAGE
damageTable = {
---{"WEAPON NAME",DAMAGE},
{"AK-47",3500},
{"AKS-74 Kobra",3600},
{"AK-107",3650},
{"M4A1",2722},
{"FN FAL",2750},
{"PKM",2900},


{"M107",13000},
{"CZ550",8200},
{"SVD Camo",13000},
{"DMR",8200},



{"Winchester 1866",4500},
{"MP5A5",889},
{"Granatnik",2000},

--[[{"Heat-Seeking RPG",0},
{"Amunicja do M136 Launcher",0},
{"Lee Enfield",8000},]]--
{"Nóż",1500},
{"Topór",1006},
{"M1911",889},
{"M9 SD",889},
{"PDW",889},
{"TEC-9",889},
{"Sawn-Off Shotgun",2000},
{"Desert Eagle",1389},
{"Granat",17998},
{"Kij bejsbolowy",953},
{"Łopata",953},
{"Kij golfowy",953},
}
