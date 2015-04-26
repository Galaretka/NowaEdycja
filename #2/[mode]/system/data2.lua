local eat = {"data/eat_0.ogg","data/eat_1.ogg","data/eat_2.ogg","data/eat_3.ogg"}
local bandage = {"data/bandage_0.ogg","data/bandage_01.ogg","data/bandage_01.ogg"}
local painkiller = {"data/painkiller_01.ogg","data/painkiller_02.ogg","data/painkiller_03.ogg","data/painkiller_04.ogg"}
--local fire = {"data/fire.ogg"}
local morphine = {"data/morphine_01.ogg"}

addEvent("onPlayerUseLoot",true)
addEventHandler("onPlayerUseLoot",getRootElement(),function(itemName)
	x,y,z = getElementPosition(source)
	if (itemName == "Otwarta puszka makaronu") or (itemName == "Pieczone mięso")
	or (itemName == "Otwarta puszka fasoli") or (itemName == "Surowe mięso")
	or (itemName == "Otwarta puszka sardynek") or (itemName == "Tuńczyk (open)")
	or (itemName == "Otwarty pojemnik z boczkiem") or (itemName == "Mleko w proszku")
	or (itemName == "Ryż") or (itemName == "Płatki") then
		local useSound = playSound3D(eat[math.random(1, #eat)],x,y,z,false)
		setSoundMaxDistance(useSound, 8)
	elseif (itemName == "Butelka wody" or itemName == "Manierka" or itemName == "Wódka") then
		local useSound = playSound3D("data/drink_0.ogg",x,y,z,false)
		setSoundMaxDistance(useSound, 8)
	elseif (itemName == "Coca-cola") or (itemName == "Pepsi") or (itemName == "Piwo") or (itemName == "Sprite") then
		local useSound = playSound3D("data/soda_0.ogg",x,y,z,false)
		setSoundMaxDistance(useSound, 8)
	elseif (itemName == "Pusta butelka po wodzie") then
		local useSound = playSound3D("data/fillwater_0.ogg",x,y,z,false)
		setSoundMaxDistance(useSound, 8)
	elseif (itemName == "Namiot") then
		local useSound = playSound3D("data/tentunpack_0.ogg",x,y,z,false)
		setSoundMaxDistance(useSound, 8)
	elseif (itemName == "Bandaż") then
		local useSound = playSound3D(bandage[math.random(1, #bandage)],x,y,z,false)
		setSoundMaxDistance(useSound, 8)
	elseif (itemName == "Środek przeciwbólowy") or (itemName == "Tetracykliny") or (itemName == "Albendazol") or (itemName == "Ibuprofen") or (itemName == "Węgiel aktywowany") then
		local useSound = playSound3D(painkiller[math.random(1, #painkiller)],x,y,z,false)
		setSoundMaxDistance(useSound, 8)
	elseif (itemName == "Morfina") then
		local useSound = playSound3D(morphine[math.random(1, #morphine)],x,y,z,false)
		setSoundMaxDistance(useSound, 8)
	end
end)

addEvent("fireplaceSound",true)
addEventHandler("fireplaceSound",getRootElement(),function(x,y,z)
	fireSound = playSound3D("data/fire.mp3",x,y,z,true)
	setSoundMaxDistance(fireSound, 15)
end)

addEvent("fireplaceStop",true)
addEventHandler("fireplaceStop",getRootElement(),function()
	stopSound(fireSound)
	if isElement(fireSound) then
		destroyElement(fireSound)
	end
end)