weaponAmmoTable = {
	[".45ACP"] = {{"FNX45",22}},
	["9mm"] = {{"CR75",23},{"MP5-K",29}},
	[".357"] = {{"Magnum",24}},
	["PDW Mag"] = {{"PDW",28},{"TEC-9",32}},
	["7.62x39mm"] = {{"AKM",30},{"SKS",33}},
	[".22"] = {{"Sporter 22",33}},
	["5.56mm"] = {{"М4А1",31}},
	["12 Gauge Buckshot"] = {{"IZH-43",27},{"Sawn-Off IZH-43",26}},
	["CZ550 Mag"] = {{"CZ550",34}},
	["7.62x51mm"] = {{"Mosin 9130",33},{"Blaze 95",33}},
	["Strzała"] = {{"Kusza",33}},
	["others"] = {
		{"Spadochron",46},
		{"Granat dymny",17},
		{"Granat",16},
		{"Nóż myśliwski",4},
		{"Koktajl mołotowa",18},
		{"Topór strażacki",8},
		{"Lornetka",43},
		{"Kij bejsbolowy z gwoździami",5},
		{"Kij bejsbolowy",15},
		{"Łopata",6},
		{"Монтировка",2},
		{"Maczeta",3},
		{"Topór",7},
		{"Otwieracz",10},
		{"Piła do metalu",11},
	},
}

function getWeaponAmmoType (weaponName)
	for i,weaponData in ipairs(weaponAmmoTable["others"]) do
		if weaponName == weaponData[1] then
			return weaponData[1],weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[".45ACP"]) do
		if weaponName == weaponData[1] then
			return ".45ACP",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["9mm"]) do
		if weaponName == weaponData[1] then
			return "9mm",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[".357"]) do
		if weaponName == weaponData[1] then
			return ".357",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["PDW Mag"]) do
		if weaponName == weaponData[1] then
			return "PDW Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["7.62x39mm"]) do
		if weaponName == weaponData[1] then
			return "7.62x39mm",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["5.56mm"]) do
		if weaponName == weaponData[1] then
			return "5.56mm",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["12 Gauge Buckshot"]) do
		if weaponName == weaponData[1] then
			return "12 Gauge Buckshot",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable[".22"]) do
		if weaponName == weaponData[1] then
			return ".22",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["CZ550 Mag"]) do
		if weaponName == weaponData[1] then
			return "CZ550 Mag",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["7.62x51mm"]) do
		if weaponName == weaponData[1] then
			return "7.62x51mm",weaponData[2]
		end
	end
	for i,weaponData in ipairs(weaponAmmoTable["Strzała"]) do
		if weaponName == weaponData[1] then
			return "Strzała",weaponData[2]
		end
	end
end