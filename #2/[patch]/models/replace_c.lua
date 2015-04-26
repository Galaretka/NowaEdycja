local models = {
	{p="clothing/22",m=22},
	{p="clothing/56",m=56},
	{p="clothing/67",m=67},
	{p="clothing/68",m=68},
	{p="clothing/69",m=69},

	{p="clothing/standart",m=73},
	{p="clothing/child_briefcase",m=1866},
	{p="clothing/improvised_bag",m=1868},
	{p="clothing/improvised_backpack",m=1867},
	{p="clothing/taloon_backpack",m=1869},
	{p="clothing/hunting_backpack",m=1870},
	{p="clothing/mountainc_backpack",m=1871},
	{p="clothing/moto",m=2052},
	{p="clothing/rocketaviators",m=1851},
	{p="clothing/resperator",m=1853},
--	{p="clothing/vindeto",m=1854},
	{p="clothing/gasmask",m=1855},
	{p="clothing/mask1",m=1856},
	{p="clothing/mask2",m=1857},
	{p="clothing/mask3",m=1859},
	{p="clothing/mask4",m=1858},
	{p="clothing/ushanka",m=1930},
	{p="clothing/cowboy",m=1931},
	{p="clothing/cap",m=1932},
	{p="clothing/radarcap",m=1933},
	{p="clothing/flatcap",m=1934},
	{p="clothing/biret",m=1935},
	{p="clothing/helmet",m=1937},
	{p="clothing/panama",m=1936},
	{p="clothing/tacktvest",m=2705},
	{p="clothing/kevlar",m=2706},
	{p="clothing/headlight",m=1667},

	{p="weapon/camera",m=367},
	{p="weapon/katana",m=339},
	{p="weapon/axe",m=338},
	{p="weapon/lom",m=333},
	{p="weapon/machete",m=334},
	{p="weapon/canopen",m=321},
	{p="weapon/crossbow",m=1952},
	{p="weapon/arrow",m=1955},
	{p="weapon/default",m=357},
	{p="weapon/sks",m=2412},
	{p="weapon/mosin",m=2228},
	{p="weapon/sawnoff",m=350},
	{p="weapon/cuntgun",m=351},

	{p="items/flashlight",m=15060},
	{p="items/antidot",m=1563},
	{p="items/bandage",m=1578},
--	{p="items/matches",m=328},
	{p="items/tent_1",m=1279},
	{p="clothing/tent",m=3243},
	{p="items/tire",m=1073},
	{p="items/engine",m=929},
	{p="items/fireplace",m=2807},
	{p="items/fueltank",m=1008},
	{p="items/gps",m=2976},
	{p="items/mag_1",m=2041},
	{p="items/slug_1",m=1271},
	{p="items/map",m=1277},
	{p="items/googles",m=368},
	{p="items/googles",m=367},
--	{p="items/roadflare",m=324},
	{p="items/toolbox",m=2969},
	{p="items/watch",m=2710},
	{p="items/wirefence_1",m=933},
	{p="items/wood",m=1463},

	{p="items/can_bob",m=2601},
	{p="items/cola",m=2647},
	{p="items/pepsi",m=2856},
	{p="items/sprite",m=1486},
	{p="items/sprite",m=1487},

	{p="items/meat_1",m=2806},
	{p="items/meat_2",m=2804},
	{p="items/blood_bag",m=1580},
	{p="items/heat_pack",m=1576},
--	{p="items/morphine",m=1579},
	{p="items/painkiller",m=2709},
	{p="items/wirefence_2",m=983},
	{p="items/emptycan",m=2673},
	{p="items/emptysoda",m=2675},
	{p="items/spaggeti",m=2770},
	{p="items/sardins",m=2768},
	{p="items/flag",m=1664},
	{p="items/bacon",m=1546},
	{p="items/tent_2",m=1279},
	{p="items/first_aid_kit",m=2891},

--	{p="vehicle/422",m=422},
	{p="vehicle/468",m=468},
	{p="vehicle/422",m=422},
	{p="vehicle/433",m=433},
	{p="vehicle/468",m=468},
	{p="vehicle/470",m=470},
	{p="vehicle/471",m=471},
	{p="vehicle/487",m=487},
	{p="vehicle/497",m=497},
	{p="vehicle/525",m=525},
}

addEventHandler("onClientResourceStart", getResourceRootElement(), function()
    for _,models in pairs(models) do
		txd = engineLoadTXD (models.p..".txd")
		engineImportTXD (txd, models.m)
		dff = engineLoadDFF (models.p..".dff", models.m)
		engineReplaceModel (dff, models.m)
    end
	txd = engineLoadTXD ("weapon/bat.txd")
	engineImportTXD (txd, 336)
	txd = engineLoadTXD ("weapon/bat.txd")
	engineImportTXD (txd, 326)
	dff = engineLoadDFF ("weapon/bat.dff", 326)
	engineReplaceModel (dff, 326)
	dff = engineLoadDFF ("weapon/bat2.dff", 336)
	engineReplaceModel (dff, 336)
	col = engineLoadCOL("clothing/tent.col")
	engineReplaceCOL(col, 3243)
	engineSetModelLODDistance(3243, 60)

	txd = engineLoadTXD("clothing/standart.txd")
	engineImportTXD (txd, 75)
	dff = engineLoadDFF ("clothing/fps.dff", 75)
	engineReplaceModel (dff, 75)
end)