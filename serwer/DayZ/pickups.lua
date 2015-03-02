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

local itemTable = {
  farm = {
    {
      "Wood Pile",
      1463,
      0.4,
      0,
      13
    },
    {
      "Bandage",
      1578,
      0.5,
      0,
      4
    },
    {
      "Water Bottle",
      2683,
      1,
      0,
      6
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      6
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      6
    },
    {
      "Burger",
      2768,
      1,
      0,
      6
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      12
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      12
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      9
    },
    {
      "Empty Gas Canister",
      1650,
      1,
      0,
      10
    },
    {
      "Hunting Knife",
      335,
      1,
      90,
      4
    },
    {
      "Box of Matches",
      328,
      0.4,
      90,
      8
    },
    {
      "Revolver",
      348,
      1,
      90,
      0.2
    },
    {
      "Morphine",
      1579,
      1,
      0,
      4
    },
    {
      "Tent",
      1279,
      1,
      0,
      0.5
    },
    {
      "G17",
      346,
      1,
      90,
      4
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      3.5
    },
    {
      "Lee Enfield",
      357,
      1,
      90,
      0.3
    },
    {
      "Winchester 1866",
      349,
      1,
      90,
      0.3
    },
    {
      "Tire",
      1073,
      1,
      0,
      2
    },
    {
      "Tank Parts",
      1008,
      1,
      0.8,
      2
    },
    {
      "Civilian Clothing",
      1241,
      2,
      0,
      2.5
    },
    {
      "Map",
      1277,
      0.8,
      90,
      6
    },
	{"Anarchy Backpack",1239,1,0,2}, 
	{"Camp Backpack",1239,1,0,2}, 
	{"Ghillie Backpack",1239,1,0,2}, 
    {
      "GPS",
      2976,
      0.15,
      0,
      2
    }
  },
  residential = {
    {
      "Box of Matches",
      328,
      0.4,
      90,
      5
    },
    {
      "Wood Pile",
      1463,
      0.4,
      0,
      5
    },
    {
      "G17",
      346,
      1,
      90,
      1.5
    },
    {
      "Makarov SD",
      347,
      1,
      90,
      1.9
    },
    {
      "Winchester 1866",
      349,
      1,
      90,
      0.1
    },
    {
      "PDW",
      352,
      1,
      90,
      1
    },
    {
      "Hunting Knife",
      335,
      1,
      90,
      3
    },
    {
      "Hatchet",
      339,
      1,
      90,
      1
    },
    {
      "Pizza",
      1582,
      1,
      0,
      7
    },
	{"Military Backpack",1239,1,0,2}, 
	{"Kryss Backpack",1239,1,0,2}, 
	{"OSPack Backpack",1239,1,0,2}, 
    {
      "Soda Bottle",
      2647,
      1,
      0,
      7
    },
    {
      "Empty Gas Canister",
      1650,
      1,
      0,
      9
    },
    {
      "Roadflare",
      324,
      1,
      90,
      9
    },
    {
      "Milk",
      2856,
      1,
      0,
      7
    },
    {
      "Assault Pack (ACU)",
      3026,
      1,
      0,
      6
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      7
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      12
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      12
    },
    {
      "M67 Frag Grenade",
      342,
      1,
      0,
      0.01
    },
    {
      "Revolver",
      348,
      1,
      90,
      0.4
    },
    {
      "Sawn-Off Shotgun",
      350,
      1,
      90,
      0.3
    },
    {
      "SPAZ-12 Combat Shotgun",
      351,
      1,
      90,
      0.4
    },
    {
      "MP5A5",
      353,
      1,
      90,
      0.4
    },
    {
      "Watch",
      2710,
      1,
      0,
      3
    },
    {
      "Heat Pack",
      1576,
      5,
      0,
      6
    },
    {
      "Wire Fence",
      933,
      0.25,
      0,
      1
    },
	{
      "Sandbag",
      2060,
      0.25,
      0,
      1
    },
    {
      "Lee Enfield",
      357,
      1,
      90,
      0.3
    },
    {
      "Alice Pack",
      1248,
      1,
      0,
      1.5
    },
	{
      "Patrol Pack",
      2401,
      1,
      0,
      2
    },
    {
      "Tire",
      1073,
      1,
      0,
      1
    },
    {
      "Tank Parts",
      1008,
      0.8,
      0,
      1
    },
    {
      "Morphine",
      1579,
      1,
      0,
      2
    },
    {
      "Civilian Clothing",
      1241,
      2,
      0,
      9
    },
    {
      "Map",
      1277,
      0.8,
      90,
      10
    },
    {
      "GPS",
      2976,
      0.15,
      0,
      3
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      7
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      7
    },
    {
      "Burger",
      2768,
      1,
      0,
      7
    },
    {
      "Golf Club",
      333,
      1,
      90,
      3
    },
    {
      "Machete",
      336,
      1,
      90,
      3
    },
    {
      "Crowbar",
      337,
      1,
      90,
      3
    }
  },
  military = {
    {
      "Box of Matches",
      328,
      0.4,
      90,
      2
    },
    {
      "G17",
      346,
      1,
      90,
      5
    },
    {
      "Makarov SD",
      347,
      1,
      90,
      4
    },
    {
      "Winchester 1866",
      349,
      1,
      90,
      3
    },
    {
      "PDW",
      352,
      1,
      90,
      4
    },
    {
      "Hunting Knife",
      335,
      1,
      90,
      2.4
    },
    {
      "Hatchet",
      339,
      1,
      90,
      2.1
    },
    {
      "Pizza",
      1582,
      1,
      0,
      2
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      2
    },
    {
      "Empty Gas Canister",
      1650,
      1,
      0,
      4
    },
    {
      "Roadflare",
      324,
      1,
      90,
      4
    },
    {
      "Milk",
      2856,
      1,
      0,
      1
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      4
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      12
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      12
    },
    {
      "M67 Frag Grenade",
      342,
      1,
      0,
      0.5
    },
    {
      "Sawn-Off Shotgun",
      350,
      1,
      90,
      2.3
    },
    {
      "SPAZ-12 Combat Shotgun",
      351,
      1,
      90,
      2.3
    },
    {
      "MP5A5",
      353,
      1,
      90,
      2.8
    },
    {
      "Watch",
      2710,
      1,
      0,
      4
    },
    {
      "Heat Pack",
      1576,
      5,
      0,
      3
    },
    {
      "Wire Fence",
      933,
      0.25,
      0,
      1
    },
    {
      "Lee Enfield",
      357,
      1,
      90,
      3.5
    },
    {
      "Alice Pack",
      1248,
      1,
      0,
      4
    },
	{
      "Patrol Pack",
      2401,
      1,
      0,
      5
    },
    {
      "Night Vision Goggles",
      368,
      1,
      90,
      4
    },
    {
      "Binoculars",
      369,
      1,
      0,
      4
    },
    {
      "Tire",
      1073,
      1,
      0,
      2
    },
    {
      "Tank Parts",
      1008,
      0.8,
      0,
      2
    },
    {
      "Morphine",
      1579,
      1,
      0,
      4
    },
    {
      "Camouflage Clothing",
      1247,
      2,
      0,
      4.5
    },
	{
      "Sniper Clothing II",
      1247,
      2,
      0,
      4.5
    },
	{
      "Sniper Clothing",
      1247,
      2,
      0,
      4.5
    },
	{
      "Military Clothing",
      1247,
      2,
      0,
      4.5
    },
	{
      "Military Clothing II",
      1247,
      2,
      0,
      4.5
    },
	{
      "Military Clothing III",
      1247,
      2,
      0,
      4.5
    },
    {
      "Civilian Clothing",
      1241,
      2,
      0,
      3
    },
    {
      "AKS-74 Kobra",
      355,
      1,
      90,
      3.8
    },
    {
      "GPS",
      2976,
      0.15,
      0,
      3
    },
    {
      "Map",
      1277,
      0.8,
      90,
      7
    },
    {
      "Toolbox",
      2969,
      0.5,
      0,
      1
    },
    {
      "Engine",
      929,
      0.3,
      0,
      2
    },
    {
      "Tent",
      1279,
      1,
      0,
      4.5
    },
    {
      "Ghillie Suit",
      1213,
      2,
      0,
      0.3
    },
	{
      "Ghillie Suit II",
      1213,
      2,
      0,
      0.01
    },
	{
      "Ghillie Suit III",
      1213,
      2,
      0,
      0.01
    },
    {
      "M4A1 CCO",
      356,
      1,
      90,
      2.4
    },
    {
      "DMR",
      358,
      1,
      90,
      0.4
    },
	{
      "SVD Camo",
      2961,
      1,
      90,
      0.4
    },
    {
      "Infrared Goggles",
      369,
      1,
      90,
      3
    },
    {
      "Assault Pack (ACU)",
      3026,
      1,
      0,
      3
    },
	{
      "Czech Vest Pouch",
      2384,
      1,
      0,
      6
    },
    {
      "Czech Backpack",
      1239,
      1,
      0,
      2
    },
	{"Anarchy Backpack",1239,1,0,2}, 
	{"Camp Backpack",1239,1,0,2}, 
	{"Ghillie Backpack",1239,1,0,2}, 
	{
      "British Assault Pack",
      2399,
      1,
      0,
      3
    },
    {
      "Radio Device",
      330,
      1,
      0,
      6
    },
    {
      "Coyote Backpack",
      1252,
      1,
      0,
      0.9
    },
	{
      "British Assault Pack",
      2399,
      1,
      0,
      1
    },
	{
      "Survival (ACU)",
      2407,
      1,
      0,
      2
    },
    {
      "Crowbar",
      337,
      1,
      90,
      1
    }
  },
  industrial = {
    {
      "Wire Fence",
      933,
      0.25,
      0,
      7
    },
    {
      "Toolbox",
      2969,
      0.5,
      0,
      3
    },
	{"Anarchy Backpack",1239,1,0,2}, 
	{"Camp Backpack",1239,1,0,2}, 
	{"Ghillie Backpack",1239,1,0,2}, 
    {
      "Tire",
      1073,
      1,
      0,
      4
    },
    {
      "Engine",
      929,
      0.3,
      0,
      3.5
    },
    {
      "Tank Parts",
      1008,
      1,
      0.8,
      4
    },
    {
      "Winchester 1866",
      349,
      1,
      90,
      3
    },
    {
      "Water Bottle",
      2683,
      1,
      0,
      4
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      4
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      4
    },
    {
      "Burger",
      2768,
      1,
      0,
      4
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      12
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      10
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      4
    },
    {
      "Empty Gas Canister",
      1650,
      1,
      0,
      6
    },
    {
      "Full Gas Canister",
      1650,
      1,
      0,
      1.5
    },
    {
      "Map",
      1277,
      0.8,
      90,
      3
    },
    {
      "Watch",
      2710,
      1,
      0,
      2
    },
    {
      "Box of Matches",
      328,
      0.4,
      90,
      5
    },
    {
      "Wood Pile",
      1463,
      0.4,
      0,
      2
    },
    {
      "G17",
      346,
      1,
      90,
      1.5
    },
    {
      "PDW",
      352,
      1,
      90,
      2
    },
    {
      "Hunting Knife",
      335,
      1,
      90,
      2
    },
    {
      "Hatchet",
      339,
      1,
      90,
      1.5
    },
    {
      "Pizza",
      1582,
      1,
      0,
      4
    },
    {
      "Roadflare",
      324,
      1,
      90,
      5
    },
    {
      "Milk",
      2856,
      1,
      0,
      4
    },
    {
      "Assault Pack (ACU)",
      3026,
      1,
      0,
      3
    },
	{
      "Czech Vest Pouch",
      2384,
      1,
      0,
      5
    },
    {
      "Coyote Backpack",
      1252,
      1,
      0,
      0.5
    },
	{"Anarchy Backpack",1252,1,0,2}, 
	{"Camp Backpack",1252,1,0,2}, 
	{"Ghillie Backpack",1252,1,0,2}, 

	{"Military Backpack",1252,1,0,2}, 
	{"Kryss Backpack",1252,1,0,2}, 
	{"OSPack Backpack",1252,1,0,2}, 
	{
      "Survival (ACU)",
      2407,
      1,
      0,
      2
    },
    {
      "Radio Device",
      330,
      1,
      0,
      6
    },
    {
      "Golf Club",
      333,
      1,
      90,
      1.5
    },
    {
      "Machete",
      336,
      1,
      90,
      1.5
    },
    {
      "Crowbar",
      337,
      1,
      90,
      1.5
    },
    {
      "Night Vision Goggles",
      368,
      1,
      90,
      1.5
    }
  },
  supermarket = {
    {
      "Raw Meat",
      2804,
      0.5,
      90,
      8
    },
    {
      "Box of Matches",
      328,
      0.4,
      90,
      5
    },
    {
      "Wood Pile",
      1463,
      0.4,
      0,
      5
    },
	{"Anarchy Backpack",1239,1,0,2}, 
	{"Camp Backpack",1239,1,0,2}, 
	{"Ghillie Backpack",1239,1,0,2}, 
    {
      "G17",
      346,
      1,
      90,
      3.5
    },
    {
      "PDW",
      352,
      1,
      90,
      2
    },
    {
      "Hunting Knife",
      335,
      1,
      90,
      3
    },
    {
      "Hatchet",
      339,
      1,
      90,
      2.1
    },
    {
      "Pizza",
      1582,
      1,
      0,
      7
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      7
    },
    {
      "Empty Gas Canister",
      1650,
      1,
      0,
      5
    },
    {
      "Roadflare",
      324,
      1,
      90,
      6
    },
    {
      "Milk",
      2856,
      1,
      0,
      7
    },
    {
      "Assault Pack (ACU)",
      3026,
      1,
      0,
      6
    },
	{
      "Czech Vest Pouch",
      2384,
      1,
      0,
      6
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      7
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      7
    },
    {
      "Burger",
      2768,
      1,
      0,
      7
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      7
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      12
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      12
    },
    {
      "MP5A5",
      353,
      1,
      90,
      0.5
    },
    {
      "Watch",
      2710,
      1,
      0,
      3
    },
    {
      "Heat Pack",
      1576,
      5,
      0,
      6
    },
    {
      "Wire Fence",
      933,
      0.25,
      0,
      1
    },
    {
      "Lee Enfield",
      357,
      1,
      90,
      0.2
    },
    {
      "Alice Pack",
      1248,
      1,
      0,
      0.5
    },
	{
      "Survival (ACU)",
      2407,
      1,
      0,
      2
    },
	{
      "Patrol Pack",
      2401,
      1,
      0,
      1
    },
    {
      "Tire",
      1073,
      1,
      0,
      1
    },
    {
      "Tank Parts",
      1008,
      1,
      0.8,
      2
    },
    {
      "Morphine",
      1579,
      1,
      0,
      2
    },
    {
      "Civilian Clothing",
      1241,
      2,
      0,
      3.5
    },
    {
      "Map",
      1277,
      0.8,
      90,
      4
    },
    {
      "GPS",
      2976,
      0.15,
      0,
      1
    },
    {
      "Radio Device",
      330,
      1,
      0,
      6
    },
    {
      "Golf Club",
      333,
      1,
      90,
      1.9
    },
    {
      "Machete",
      336,
      1,
      90,
      1.4
    },
    {
      "Crowbar",
      337,
      1,
      90,
      0.3
    }
  },
  other = {
    {
      "Raw Meat",
      2804,
      0.5,
      90
    },
	
	{"Military Backpack",1239,1,0,2}, 
	{"Kryss Backpack",1239,1,0,2}, 
	{"OSPack Backpack",1239,1,0,2}, 
    {
      "Cooked Meat",
      2806,
      0.5,
      90
    },
    {
      "Full Gas Canister",
      1650,
      1,
      0
    },
    {
      "Empty Water Bottle",
      2683,
      1,
      0
    },
    {
      "Survivor Clothing",
      1577,
      2,
      0
    },
    {
      "Night Vision Goggles",
      368,
      1,
      90
    },
    {
      "Infrared Goggles",
      369,
      1,
      90
    },
    {
      "1866 Slug",
      2358,
      2,
      0
    },
    {
      "2Rnd. Slug",
      2358,
      2,
      0
    },
    {
      "SPAZ-12 Pellet",
      2358,
      2,
      0
    },
    {
      "MP5A5 Mag",
      2358,
      2,
      0
    },
    {
      "30Rnd. AKS",
      1271,
      2,
      0
    },
    {
      "STANAG Mag",
      1271,
      2,
      0
    },
    {
      "G17 Mag",
      3013,
      2,
      0
    },
    {
      "Makarov SD Mag",
      3013,
      2,
      0
    },
    {
      ".45 ACP",
      3013,
      2,
      0
    },
    {
      "DMR Mag",
      2358,
      2,
      0
    },
	{
      "SVD Mag",
      2358,
      2,
      0
    },
    {
      "Lee Enfield Mag",
      2358,
      2,
      0
    },
    {
      "PDW Mag",
      2041,
      2,
      0
    },
    {
      "MP5A5 Mag",
      2041,
      2,
      0
    },
    {
      "Box of Matches",
      328,
      0.4,
      90,
      5
    },
    {
      "Wood Pile",
      1463,
      0.4,
      0,
      5
    },
    {
      "G17",
      346,
      1,
      90,
      3.5
    },
    {
      "PDW",
      352,
      1,
      90,
      2
    },
    {
      "Hunting Knife",
      335,
      1,
      90,
      2.5
    },
    {
      "Hatchet",
      339,
      1,
      90,
      1.8
    },
    {
      "Pizza",
      1582,
      1,
      0,
      7
    },
    {
      "Soda Bottle",
      2647,
      1,
      0,
      7
    },
    {
      "Empty Gas Canister",
      1650,
      1,
      0,
      5
    },
    {
      "Roadflare",
      324,
      1,
      90,
      6
    },
    {
      "Milk",
      2856,
      1,
      0,
      5
    },
    {
      "Assault Pack (ACU)",
      3026,
      1,
      0,
      3
    },
	{
      "Czech Vest Pouch",
      2384,
      1,
      0,
      6
    },
    {
      "Painkiller",
      2709,
      3,
      0,
      7
    },
    {
      "Empty Soda Cans",
      2673,
      0.5,
      0,
      12
    },
    {
      "Scruffy Burgers",
      2675,
      0.5,
      0,
      12
    },
    {
      "MP5A5",
      353,
      1,
      90,
      1.5
    },
    {
      "Watch",
      2710,
      1,
      0,
      3
    },
    {
      "Heat Pack",
      1576,
      5,
      0,
      6
    },
    {
      "Wire Fence",
      933,
      0.25,
      0,
      1
    },
    {
      "Lee Enfield",
      357,
      1,
      90,
      1.5
    },
    {
      "Alice Pack",
      1248,
      1,
      0,
      1.5
    },
	{
      "Patrol Pack",
      2401,
      1,
      0,
      2
    },
    {
      "Coyote Backpack",
      1252,
      1,
      0,
      0.7
    },
	{
      "Survival (ACU)",
      2407,
      1,
      0,
      2
    },
    {
      "Tire",
      1073,
      1,
      0,
      1
    },
    {
      "Tank Parts",
      1008,
      1,
      0.8,
      4
    },
    {
      "Morphine",
      1579,
      1,
      0,
      2
    },
    {
      "Civilian Clothing",
      1241,
      2,
      0,
      3.5
    },
    {
      "Map",
      1277,
      0.8,
      90,
      4
    },
    {
      "Toolbox",
      2969,
      0.5,
      0,
      3
    },
    {
      "Engine",
      929,
      0.3,
      0,
      3.5
    },
    {
      "Winchester 1866",
      349,
      1,
      90,
      2
    },
    {
      "Water Bottle",
      2683,
      1,
      0,
      4
    },
    {
      "Makarov SD",
      347,
      1,
      90,
      5
    },
    {
      "M67 Frag Grenade",
      342,
      1,
      0,
      0.5
    },
    {
      "Sawn-Off Shotgun",
      350,
      1,
      90,
      2
    },
    {
      "SPAZ-12 Combat Shotgun",
      351,
      1,
      90,
      1.9
    },
    {
      "Binoculars",
      369,
      1,
      0,
      4
    },
    {
      "Camouflage Clothing",
      1247,
      2,
      0,
      4.5
    },
	{
      "Sniper Clothing",
      1247,
      2,
      0,
      4.5
    },
	{
      "Sniper Clothing II",
      1247,
      2,
      0,
      4.5
    },
	{
      "Military Clothing",
      1247,
      2,
      0,
      4.5
    },
	{
      "Military Clothing II",
      1247,
      2,
      0,
      4.5
    },
	{
      "Military Clothing III",
      1247,
      2,
      0,
      4.5
    },
    {
      "AKS-74 Kobra",
      355,
      1,
      90,
      0.9
    },
    {
      "M136 Rocket Launcher",
      359,
      1,
      90,
      0
    },
    {
      "Ghillie Suit",
      1213,
      2,
      0,
      0.01
    },
	{
      "Ghillie Suit II",
      1213,
      2,
      0,
      0.01
    },
	{
      "Ghillie Suit III",
      1213,
      2,
      0,
      0.01
    },
    {
      "M4A1 CCO",
      356,
      1,
      90,
      0.9
    },
    {
      "DMR",
      358,
      1,
      90,
      0.3
    },
	{
      "SVD Camo",
      2916,
      1,
      90,
      0.3
    },
    {
      "Heat-Seeking RPG",
      360,
      1,
      90,
      0
    },
    {
      "Bandage",
      1578,
      0.5,
      0,
      4
    },
    {
      "Pasta Can",
      2770,
      1,
      0,
      5
    },
    {
      "Beans Can",
      2601,
      1,
      0,
      6
    },
    {
      "Burger",
      2768,
      1,
      0,
      2
    },
    {
      "Tent",
      1279,
      1,
      0,
      0.5
    },
    {
      "G17",
      346,
      1,
      90,
      3
    },
    {
      "Revolver",
      348,
      1,
      90,
      3
    },
    {
      "GPS",
      2976,
      0.15,
      0,
      1
    },
    {
      "Medic Kit",
      2891,
      2.2,
      0
    },
    {
      "Blood Bag",
      1580,
      1,
      0
    },
    {
      "Radio Device",
      2966,
      0.5,
      0,
      5
    },
    {
      "Golf Club",
      333,
      1,
      90,
      1.9
    },
    {
      "Machete",
      336,
      1,
      90,
      1.4
    },
    {
      "Crowbar",
      337,
      1,
      90,
      1.5
    }
  }
}
weaponAmmoTable = {
  ["G17 Mag"] = {
    {"G17", 22}
  },
  ["Makarov SD Mag"] = {
    {"Makarov SD", 23}
  },
  [".45 ACP"] = {
    {
      "Revolver",
      24
    }
  },
  ["PDW Mag"] = {
    {"PDW", 28}
  },
  ["MP5A5 Mag"] = {
    {"MP5A5", 29}
  },
  ["30Rnd. AKS"] = {
    {"AKS-74 Kobra", 30}
  },
  ["STANAG Mag"] = {
    {"M4A1 CCO", 31}
  },
  ["1866 Slug"] = {
    {
      "Winchester 1866",
      25
    }
  },
  ["2Rnd. Slug"] = {
    {
      "Sawn-Off Shotgun",
      26
    }
  },
  ["SPAZ-12 Pellet"] = {
    {
      "SPAZ-12 Combat Shotgun",
      27
    }
  },
  ["DMR Mag"] = {
    {"DMR", 34}
  },
  ["SVD Mag"] = {
    {"SVD Camo", 34}
  },
  ["Lee Enfield Mag"] = {
    {
      "Lee Enfield",
      33
    }
  },
  ["M136 Rocket"] = {
    {
      "Heat-Seeking RPG",
      36
    },
    {
      "M136 Rocket Launcher",
      35
    }
  },
  ["others"] = {
    {"Parachute", 46},
    {"Satchel", 39},
    {"Tear Gas", 17},
    {"M67 Frag Grenade", 16},
    {
      "Hunting Knife",
      4
    },
    {"Hatchet", 8},
    {"Binoculars", 43},
    {
      "Machete",
      5
    },
    {"Golf Club", 2},
    {"Crowbar", 6},
    {
      "Radio Device",
      1
    }
  }
}
function getWeaponAmmoType(weaponName, notOthers)
  if not notOthers then
    for i, weaponData in ipairs(weaponAmmoTable.others) do
      if weaponName == weaponData[1] then
        return weaponData[1], weaponData[2]
      end
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["G17 Mag"]) do
    if weaponName == weaponData[1] then
      return "G17 Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Makarov SD Mag"]) do
    if weaponName == weaponData[1] then
      return "Makarov SD Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable[".45 ACP"]) do
    if weaponName == weaponData[1] then
      return ".45 ACP", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["PDW Mag"]) do
    if weaponName == weaponData[1] then
      return "PDW Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["MP5A5 Mag"]) do
    if weaponName == weaponData[1] then
      return "MP5A5 Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["30Rnd. AKS"]) do
    if weaponName == weaponData[1] then
      return "30Rnd. AKS", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["STANAG Mag"]) do
    if weaponName == weaponData[1] then
      return "STANAG Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["1866 Slug"]) do
    if weaponName == weaponData[1] then
      return "1866 Slug", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["2Rnd. Slug"]) do
    if weaponName == weaponData[1] then
      return "2Rnd. Slug", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["SPAZ-12 Pellet"]) do
    if weaponName == weaponData[1] then
      return "SPAZ-12 Pellet", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["DMR Mag"]) do
    if weaponName == weaponData[1] then
      return "DMR Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["SVD Mag"]) do
    if weaponName == weaponData[1] then
      return "SVD Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["Lee Enfield Mag"]) do
    if weaponName == weaponData[1] then
      return "Lee Enfield Mag", weaponData[2]
    end
  end
  for i, weaponData in ipairs(weaponAmmoTable["M136 Rocket"]) do
    if weaponName == weaponData[1] then
      return "M136 Rocket", weaponData[2]
    end
  end
  return false
end
function createItemPickup(item, x, y, z, tableStringName)
  if item and x and y and z then
    do
      local object = createObject(itemTable[tostring(tableStringName)][item][2], x, y, z - 0.875, itemTable[tostring(tableStringName)][item][4], 0, math.random(0, 360))
      setObjectScale(object, itemTable[tostring(tableStringName)][item][3])
      setElementCollisionsEnabled(object, false)
      setElementFrozen(object, true)
      local col = createColSphere(x, y, z, 0.75)
      setElementData(col, "item", itemTable[tostring(tableStringName)][item][1])
      setElementData(col, "parent", object)
      setTimer(function()
        if isElement(col) then
          destroyElement(col)
          destroyElement(object)
        end
      end, 900000, 1)
      return object
    end
  end
end
function table.size(tab)
  local length = 0
  for _ in pairs(tab) do
    length = length + 1
  end
  return length
end
function math.percentChance(percent, repeatTime)
  local hits = 0
  for i = 1, repeatTime do
    local number = math.random(0, 200) / 2
    if percent >= number then
      hits = hits + 1
    end
  end
  return hits
end
function createItemLoot(lootPlace, x, y, z, id)
  col = createColSphere(x, y, z, 1.25)
  setElementData(col, "itemloot", true)
  setElementData(col, "parent", lootPlace)
  setElementData(col, "MAX_Slots", 12)
  for i, item in ipairs(itemTable[lootPlace]) do
    local value = math.percentChance(item[5], math.random(1, 2))
    setElementData(col, item[1], value)
    local ammoData, weapID = getWeaponAmmoType(item[1], true)
    if ammoData and value > 0 then
      setElementData(col, ammoData, math.random(1, 2))
    end
  end
  refreshItemLoot(col, lootPlace)
  return col
end
function refreshItemLoot(col, place)
  local objects = getElementData(col, "objectsINloot")
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
  local counter = 0
  local obejctItem = {}
  for i, item in ipairs(itemTable.other) do
    if getElementData(col, item[1]) and getElementData(col, item[1]) > 0 then
      if counter == 3 then
        break
      end
      counter = counter + 1
      local x, y, z = getElementPosition(col)
      obejctItem[counter] = createObject(item[2], x + math.random(-1, 1), y + math.random(-1, 1), z - 0.875, item[4])
      setObjectScale(obejctItem[counter], item[3])
      setElementCollisionsEnabled(obejctItem[counter], false)
      setElementFrozen(obejctItem[counter], true)
    end
  end
  if obejctItem[1] == nil then
    local x, y, z = getElementPosition(col)
    obejctItem[1] = createObject(1463, x + math.random(-1, 1), y + math.random(-1, 1), z - 0.875, 0)
    setObjectScale(obejctItem[1], 0)
    setElementCollisionsEnabled(obejctItem[1], false)
    setElementFrozen(obejctItem[1], true)
  end
  if obejctItem[2] == nil then
    local x, y, z = getElementPosition(col)
    obejctItem[2] = createObject(1463, x + math.random(-1, 1), y + math.random(-1, 1), z - 0.875, 0)
    setObjectScale(obejctItem[2], 0)
    setElementCollisionsEnabled(obejctItem[2], false)
    setElementFrozen(obejctItem[2], true)
  end
  if obejctItem[3] == nil then
    local x, y, z = getElementPosition(col)
    obejctItem[3] = createObject(1463, x + math.random(-1, 1), y + math.random(-1, 1), z - 0.875, 0)
    setObjectScale(obejctItem[3], 0)
    setElementCollisionsEnabled(obejctItem[3], false)
    setElementFrozen(obejctItem[3], true)
  end
  setElementData(col, "objectsINloot", {
    obejctItem[1],
    obejctItem[2],
    obejctItem[3]
  })
end
addEvent("refreshItemLoot", true)
addEventHandler("refreshItemLoot", getRootElement(), refreshItemLoot)
function createPickupsOnServerStart()
  iPickup = 0
  for i, pos in ipairs(pickupPositions.residential) do
    iPickup = iPickup + 1
    createItemLoot("residential", pos[1], pos[2], pos[3], iPickup)
  end
  setTimer(createPickupsOnServerStart2, 5000, 1)
end
function createPickupsOnServerStart2()
  for i, pos in ipairs(pickupPositions.industrial) do
    iPickup = iPickup + 1
    createItemLoot("industrial", pos[1], pos[2], pos[3], iPickup)
  end
  setTimer(createPickupsOnServerStart3, 5000, 1)
end
function createPickupsOnServerStart3()
  for i, pos in ipairs(pickupPositions.farm) do
    iPickup = iPickup + 1
    createItemLoot("farm", pos[1], pos[2], pos[3], iPickup)
  end
  setTimer(createPickupsOnServerStart4, 5000, 1)
end
function createPickupsOnServerStart4()
  for i, pos in ipairs(pickupPositions.supermarket) do
    iPickup = iPickup + 1
    createItemLoot("supermarket", pos[1], pos[2], pos[3], iPickup)
  end
  setTimer(createPickupsOnServerStart5, 5000, 1)
end
function createPickupsOnServerStart5()
  for i, pos in ipairs(pickupPositions.military) do
    iPickup = iPickup + 1
    createItemLoot("military", pos[1], pos[2], pos[3], iPickup)
  end
end
createPickupsOnServerStart()
vehicleFuelTable = {
  {422, 80},
  {470, 100},
  {593, 60},
  {418, 60},
  {483, 80},
  {471, 30},
  {468, 30},
  {500, 60},
  {603, 60},
  {490, 80},
  {510, 0},
  {433, 140},
  {437, 140},
  {509, 0},
  {487, 60},
  {497, 60},
  {531, 80},
  {453, 60}
}
function getVehicleMaxFuel(loot)
  local modelID = getElementModel(getElementData(loot, "parent"))
  for i, vehicle in ipairs(vehicleFuelTable) do
    if modelID == vehicle[1] then
      return vehicle[2]
    end
  end
  return false
end
function onPlayerTakeItemFromGround(itemName, col)
  itemPlus = 1
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
  elseif itemName == "M4A1 CCO" or itemName == "AKS-74 Kobra" or itemName == "SVD Camo" or itemName == "DMR" or itemName == "Winchester 1866" or itemName == "SPAZ-12 Combat Shotgun" or itemName == "Sawn-Off Shotgun" or itemName == "Heat-Seeking RPG" or itemName == "M136 Rocket Launcher" or itemName == "Lee Enfield" then
    removeBackWeaponOnDrop()
  end
  local x, y, z = getElementPosition(source)
  local id, ItemType = getItemTablePosition(itemName)
  setElementData(source, itemName, (getElementData(source, itemName) or 0) + itemPlus)
  destroyElement(getElementData(col, "parent"))
  destroyElement(col)
end
addEvent("onPlayerTakeItemFromGround", true)
addEventHandler("onPlayerTakeItemFromGround", getRootElement(), onPlayerTakeItemFromGround)
function onPlayerChangeLoot(loot)
  local players = getElementsWithinColShape(loot, "player")
  for theKey, player in ipairs(players) do
    triggerClientEvent(player, "refreshLootManual", player, loot)
  end
end
addEvent("onPlayerChangeLoot", true)
addEventHandler("onPlayerChangeLoot", getRootElement(), onPlayerChangeLoot)
function playerDropAItem(itemName)
  local x, y, z = getElementPosition(source)
  local item, itemString = getItemTablePosition(itemName)
  local itemPickup = createItemPickup(item, x + math.random(-1.25, 1.25), y + math.random(-1.25, 1.25), z, itemString)
end
addEvent("playerDropAItem", true)
addEventHandler("playerDropAItem", getRootElement(), playerDropAItem)
function getItemTablePosition(itema)
  for id, item in ipairs(itemTable[tostring("other")]) do
    if itema == item[1] then
      return id, "other"
    end
  end
  return item, itemString
end
function refreshItemLoots()
  outputChatBox("#ffaa00UWAGA! #ffffff - RESETOWANIE RESPÓW ITEMÓW! !LAG!", getRootElement(), 255, 255, 255, true)
  for i, loots in ipairs(getElementsByType("colshape")) do
    local itemloot = getElementData(loots, "itemloot")
    if itemloot then
      local objects = getElementData(loots, "objectsINloot")
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
  setTimer(refreshItemLootPoints, gameplayVariables.itemrespawntimer, 1)
end
function refreshItemLootPoints()
  local time = getRealTime()
  local hour = time.hour
  outputChatBox("#ff2200UWAGA! #ffffff - ZA 1 MINUTE BĘDZIE RESPAWN ITEMÓW! BĘDZIE LAG!", getRootElement(), 255, 255, 255, true)
  setTimer(refreshItemLoots, 60000, 1)
end
setTimer(refreshItemLootPoints, gameplayVariables.itemrespawntimer, 1)
