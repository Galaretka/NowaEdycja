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

-- SCOREBOARD
shownText = {}
 
	shownText["name"] = "Name"
	shownText["murders"] = "Murders"
	shownText["zombieskilled"] = "Zombies killed:"
	shownText["alivetime"] = "Alivetime"
	shownText["headshots"] =  "Headshots"
	shownText["blood"] =  "Blood"
	shownText["temperature"] =  "Temperature"
	shownText["humanity"] =  "Humanity"
	shownText["banditskilled"] =  "Bandits killed:"
	shownText["players"] =  "Players:"


gameplayVariables = {}

-- PING CHECK	

	gameplayVariables["ping"] = 800 -- Checks if ping is over the set amount. DEFAULT: 600
	
-- ZOMBIE DAMAGE
	gameplayVariables["zombiedamage"] = math.random(500,800) -- Damage done by zombies - DEFAULT: math.random(400,900), for consistent damage, remove math.random(400,900) and insert value (EXAMPLE: 1000)
	
	gameplayVariables["enablenight"] = true -- Whether or not the night should be darker - DEFAULT: true - SET TO false to disable - remember you need to set it in editor_server.lua too.
	
-- WEAPON DAMAGE
damageTable = {
-- {"WEAPON NAME",DAMAGE},
{"Lee Enfield",8000},
{"Hunting Knife",1500},
{"Hatchet",2300},
{"G17",889},
{"Makarov SD",1000},
{"PDW",889},
--{"TEC-9",889},
{"Sawn-Off Shotgun",2300},
{"Revolver",1389},
{"M67 Frag Grenade",17998},
--{"Baseball Bat",953},
{"Crowbar",953},
{"Machete",953},
{"M4A1 CCO",4555},
{"DMR",8000},
{"SVD Camo",13000},
{"PKM",3800},
{"M107",13000},
{"Winchester 1866",4500},
{"MP5A5",889},
{"SPAZ-12 Combat Shotgun",2300},
{"AKS-74 Kobra",3722},
--{"Heat-Seeking RPG",0},
--{"M136 Rocket Launcher",0},
}
