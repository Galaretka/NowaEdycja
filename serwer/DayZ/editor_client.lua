--[[
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
 
	shownText["name"] = "Игровой ник"
	shownText["murders"] = "Убито выживших"
	shownText["zombieskilled"] = "Убито зомби:"
	shownText["alivetime"] = "Alivetime"
	shownText["headshots"] =  "Убито в голову"
	shownText["blood"] =  "Кровь"
	shownText["temperature"] =  "Температура"
	shownText["humanity"] =  "Карма"
	shownText["banditskilled"] =  "Убито бандитов:"
	shownText["players"] =  "Игроки:"


gameplayVariables = {}

-- PING CHECK	

	gameplayVariables["ping"] = 600 -- Checks if ping is over the set amount. DEFAULT: 600
	
-- ZOMBIE DAMAGE
	gameplayVariables["zombiedamage"] = math.random(400,900) -- Damage done by zombies - DEFAULT: math.random(400,900), for consistent damage, remove math.random(400,900) and insert value (EXAMPLE: 1000)
	
	gameplayVariables["enablenight"] = false -- Whether or not the night should be darker - DEFAULT: true - SET TO false to disable - remember you need to set it in editor_server.lua too.
	
-- WEAPON DAMAGE
damageTable = {
---{"WEAPON NAME",DAMAGE},
{"M4",3500},
{"Снайперская винтовка",8000},
{"Винчестер 1866",4500},
{"MP5A5",889},
{"Гранатомёт",2000},
{"AK-47",2722},
{"Heat-Seeking RPG",0},
{"M136 Rocket Launcher",0},
{"Lee Enfield",8000},
{"Охотничий нож",1500},
{"Топор",1006},
{"M1911",889},
{"M9 SD",889},
{"PDW",889},
{"TEC-9",889},
{"Sawn-Off Shotgun",2000},
{"Пустынный орёл",1389},
{"Оск. граната M67",17998},
{"Бейсбольная бита",953},
{"Лопата",953},
{"Клюшка для гольфа",953},
}
