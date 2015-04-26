inventoryItems = {
	["Weapons"] = {
		["Primary Weapon"] = {
			{"Kusza",3,1,"Pierwsza broń", "Kusza na strzały", 'crossbow.png' },
			{"SKS",3,1,"Pierwsza broń", " Odpowiednie naboje do tej broni to 7.62х39mm", 'sks.png' },
			{"Sporter 22",3,1,"Pierwsza broń", "Kaliber .22", 'sporter.png' },
			{"М4А1",3,1,"Pierwsza broń", "Karabin szturmowy wyprodukowany w USA. Odpowiednie naboje do tej broni to 5.56mm", 'm4a1.png' },
			{"CZ550",3,1,"Pierwsza broń", "Karabin myśliwski używany do polowania na zwierzynę ale nie tylko.", "sniper.png"},
			{"IZH-43",3,1,"Pierwsza broń", "-", "shotgun.png"},
			{"Blaze 95",3,1,"Pierwsza broń", "Kaliber 7.62х51mm", "blaze.png"},
			{"AKM",3,1,"Pierwsza broń", "Rosyjski karabin szturmowy. Ulepszona wersja AK. Odpowiednie naboje do tej broni to 7.62х39mm", "akm.png"},
			{"Mosin 9130",3,1,"Pierwsza broń", "'Wiejski' karabin. Był używany przez brytyjską armię do 1957r. Odpowiednie naboje do tej broni to 7.62х51mm", "mosin.png"},
		},
		["Secondary Weapon"] = {
			{"Topór strażacki",1,2,"Druga broń", "Topór strażacki aktualnie wykorzystywany przez strażaków podczas apokalipsy. Obecnie jest uważany za jeden z najpoważniejszych rodzaji noży.", "hatchet2.png"},
			{"Topór",1,2,"Druga broń", "Narzędzie jest używane głównie do cięcia drewna. Powoduje znaczne szkody u 'zombie'.", "axe.png"},
			{"Łopata",1,2,"Druga broń", "Narzędzie ręczne służące do kopania/czyszczenia/transportu ziemi.", "shovel.png"},
			{"Łom",2,1,"Druga broń", "Narzędzie służące do rozbijania/kruszenia/podważania ciężarów.", "crossbar.png"},
			{"Maczeta",1,2,"Druga broń", "Długi i szeroki nóż. Podobny do tasaka.", "machete.png"},
			{"Kij bejsbolowy",2,1,"Druga broń", "Broń przeznaczona do samoobrony.", "bat.png"},
			{"Kij bejsbolowy z gwoździami",2,1,"Druga broń", "Broń przeznaczona do samoobrony.", "bat.png"},
			{"Nóż myśliwski",1,1,"Druga broń", "Nóż służący do zabijania zwierząt.", "knife.png"},
		},
		["Pistols"] = {
			{"Sawn-Off IZH-43",2,1,"Pistolet", "Skrócona wersja rosyjskiego IZH-43", "sawedoff.png"},
			{"FNX45",2,2,"Pistolet", "Broń uzbrajała siły zbrojne USA w 1911r. Broń jest używana do tej pory.", "fnx45.png"},
			{"CR75",2,2,"Pistolet", "Półautomatyczny pistolet.", "cr75.png"},
			{"Magnum",2,2,"Pistolet", "Pistolet przeznaczony do walki 1vs1. Używany przez kowbojów.", "magnum.png"},	
			{"PDW",2,2,"Pistolet", "Broń do obrony osobistej stosowany w krajach zachodnich.", "pdw.png"},
			{"TEC-9",2,2,"Pistolet", "Półautomatyczna boń o lufie 9MM. Opracowana w Szwecji i jest używana głównie w wojnach grupowych.", "mp5.png"},
			{"MP5-K",3,2,"Pistolet", "Kaliber 9mm", "mp5.png"},		
		},
		["Specially Weapon"] = {
			{"Spadochron",1,1,"Specjalna broń", "Urządzenie wykonane z tkaniny. Używane do skoków z samolotów.", "parachute.png"},
			{"Koktajl mołotowa",1,2,"Specjalna broń", "-", "molotov.png"},
			{"Granat dymny",1,1,"Specjalna broń", "Pirotechniczne środki do wytwarzania szkodliwego dymu.", "gas.png"},
			{"Granat",1,1,"Specjalna broń", "Wybuchowy pocisk ręczny.", "grenade.png"},
			{"Lornetka",1,2,"Specjalna broń", "Urządzenie optyczne służące do przybliżania odległych obiektów.", "binocular.png"},
			{"Otwieracz",1,1,"Specjalna broń", "Otwiera wszystkie puszki.", "open_can.png"},
			{"Piła do metalu",1,1,"Specjalna broń", "-", "pila.png"},
		},
	},
	["Ammo"] = {
		{"Strzała",0.2, 1,"Amunicja", "Strzała do kuszy.", "bolt.png"},
		{".45ACP",0.04, 1,"Amunicja", "Amunicja do pistoletu FNX45", "45acp.png"},
		{"9mm",0.04, 1,"Amunicja", "Amunicja do pistoletu CR75", "9mm.png"},
		{".357",0.04, 1,"Amunicja", "Amunicja do pistoletu Magnum", ".357.png"},
		{"PDW Mag",0.04, 1,"Amunicja", "Amunicja do pistoletu-пулемёта PDW", "mag.png"},
		{"7.62x39mm",0.04, 1,"Amunicja", "Amunicja do broni АКM i karabinu SKS", "7_39.png"},
		{"5.56mm",0.04, 1,"Amunicja", "Amunicja do karabinu М4А1", "5_56.png"},
		{"12 Gauge Buckshot",0.04, 1,"Amunicja", "Amunicja do IZH-43", "slug.png"},
		{".22",0.04, 1,"Amunicja", "Naboje do strzelby Sporter 22", "22.png"},
		{"CZ550 Mag",0.04, 1,"Amunicja", "Naboje do karabinu snajperskiego CZ550", "mag.png"},
		{"7.62x51mm",0.04, 1,"Amunicja", "Naboje do strzelby Mosin 9130", "7_62.png"},
	},
	["Food"] = {
		{"Zamknięta puszka makaronu",1, 1,"Jedznie", "Zamknięta puszka. Potrzebny jest otwieracz.", "spaghetti.png"},
		{"Zamknięty pojemnik z boczkiem",1, 1,"Jedznie", "Zamknięta puszka. Potrzebny jest otwieracz.", "bacon.png"},
		{"Zamknięta puszka fasoli",1, 1,"Jedznie", "Zamknięta puszka. Potrzebny jest otwieracz.", "beans.png"},
		{"Zamknięta puszka sardynek",1, 1,"Jedznie", "Zamknięta puszka. Potrzebny jest otwieracz.", "sardins.png"},
		{"Otwarta puszka makaronu",1, 1,"Jedznie", "Przywraca 300 kcal. Jedna porcja zawiera 324 ml płynu.", "spaghetti.png"},
		{"Otwarty pojemnik z boczkiem",1, 1,"Jedznie", "Przywraca 107 kcal. Jedna porcja zawiera 30 ml płynu.", "bacon.png"},
		{"Otwarta puszka fasoli",1, 1,"Jedznie", "Przywraca 462 kcal. Jedna porcja zawiera 330 ml płynu", "beans.png"},
		{"Otwarta puszka sardynek",1, 1,"Jedznie", "Przywraca 475 kcal. Jedna porcja zawiera 96 ml płynu.", "sardins2.png"},
		{"Tuńczyk",1, 1,"Jedznie", "Przywraca 232 kcal. Jedna porcja zawiera 144 ml płynu.", "tuna.png"},
		{"Coca-cola",1, 1,"Picie", "Przywraca 141 kcal. Gasi pragnienie.", "cola.png"},
		{"Sprite",1, 1,"Picie", "Przywraca 141 kcal. Gasi pragnienie", "sprite.png"},
		{"Pepsi",1, 1,"Picie", "Przywraca 141 kcal. Gasi pragnienie", "pepsi.png"},
		{"Piwo",1, 1,"Picie", "Przywraca 141 kcal. Gasi pragnienie", "kvas.png"},
		{"Pieczone mięso",1, 1,"Jedznie", "Przywraca 343 kcal", "meat.png"},
		{"Surowe mięso",1, 1,"Jedznie", "Przywraca 233 kcal. Jedzenie surowego mięsa zwiększa ryzyko łapania robaków i zatrucia", "flesh.png"},
		{"Butelka wody",1, 2,"Picie", "Kilka kubków wody całkowicie ugasi pragnienie", "waterbottle.png"},
		{"Mleko w proszku",1, 1,"Picie", "Bardzo satysfakcjonujące. Dobrze przywraca energię. Zwiększa pragnienie ze względu na jego suchawość", "milk_pow.png"},
		{"Ryż",1, 2,"Jedznie", "Dobrze przywraca energię. Zwiększa pragnienie.", "rice.png"},
		{"Płatki",2, 2,"Jedznie", "Dobrze przywraca energię. Zwiększa pragnienie.", "chips.png"},
		{"Manierka",1, 2,"Picie", "Dobrze przywraca energię.", "flag.png"},
	},
	["Medic"] = {
		{"Bandaż",1,1,"Lek", "Używany to zatrzymywania krwawienia.", "bandage.png","Użyj przedmiotu z apteczki"},
		{"Apteczka",2,2,"Lek", "Stabilizuje poziom krwii.", "medic.png","Użyj przedmiotu z apteczki"},
		{"Ciepła paczka",1,1,"Lek", "Służy do zbijania temperatury.", "heater.png","Użyj przedmiotu z apteczki"},
		{"Środek przeciwbólowy",1,1,"Lek", "Niweluje ból.", "pain.png","Użyj przedmiotu z apteczki"},
		{"Wódka",1,2,"Lek", "Stężenie alkocholu zaćmiewa ból.", "vodka.png","Użyj przedmiotu z apteczki"},
		{"Morfina",1,1,"Lek", "Jest stosowana do leczenia złamań.", "morphine.png","Użyj przedmiotu z apteczki"},
		{"Szyna",3,1,"Lek", "Usztywnia złmania i je leczy.", "huna.png","Użyj przedmiotu z apteczki"},
		{"Pakiet krwi",1,2,"Lek", "Używane do transfuzji krwii u ludzi i do przywrócenia poprzedniego stanu.", "blood.png"},
		{"Tetracykliny",1,1,"Lek", "Antybiotyki. Pomaga w leczeniu chorób zakaźnych.", "tetrakcilin.png","Użyj przedmiotu z apteczki"},
		{"Albendazol",1,1,"Lek", "Niektóre tabletki brane z rzędu pomogą pozbyć się robaków.", "albendazol.png","Użyj przedmiotu z apteczki"},
		{"Ibuprofen",1,1,"Lek", "Obniża temperaturę. Pomaga przy grypie.", "ibuprof.png","Użyj przedmiotu z apteczki"},
		{"Węgiel aktywowany",1,1,"Lek", "Stosowany w przypadku zatrucia.", "ugol.png","Użyj przedmiotu z apteczki"},
		{"Termometr",1,1,"Lek", "Pomiar temp.", "gradus.png","Измерить температуру"},
	},
	["Cloting"] = {
		{"Torba domowa",2,2,"Prestiżowy", "Ma 13 slotów.", "courier.png","Одеть Plecak"},
		{"Plecak domowej roboty",2,2,"Prestiżowy", "Ma 20 slotów.", "improvised.png","Одеть Plecak"},
		{"Torba dziecięca",2,2,"Prestiżowy", "Ma 12 slotów.", "child.png"},
		{"Plecak",2,2,"Prestiżowy", "Ma 25 slotów.", "taloon.png"},
		{"Plecak na polowanie",2,2,"Prestiżowy", "Ma 30 slotów.", "hunting.png"},
		{"Plecak górski",2,2,"Prestiżowy", "MA 35 slotów.", "mountain.png"},

		{"Kask motocyklowy",1,1, "Kask", "Kask, który chroni przed wszystkimi zagrożeniami zadane w kierunku głowy.", "motobike.png", "Ubierz dodatek"},
		{"Respirator",1,1, "Maska", "Doskonała ochrona przed zagrożeniami biologicznymi, respirator oczyszcza powietrze, którym oddychamy.", "respirator.png", "Ubierz dodatek"},
		{"Maska gazowa",1,1, "Maska", "Najlepsza ochroną przed zagrożeniami biologicznymi, tylko trochę ochrania przed uszkodzeniami cięcia.", "gasmask.png", "Ubierz dodatek"},
		{"Maska 'Hoxton'",1,1, "Maska", "Maska z PayDay", "hoxton.png", "Ubierz dodatek"},
		{"Maska 'Dallas'",1,1, "Maska", "Maska z PayDay", "dallas.png", "Ubierz dodatek"},
		{"Maska 'Wilk'",1,1, "Maska", "Maska z PayDay", "wolf.png", "Ubierz dodatek"},
		{"Nauszniki",1,1, "Nauszniki", "Ciepłe nauszniki utrzymujące ciepło.", "ushanka.png", "Ubierz dodatek"},
		{"Kowbojski kapelusz",1,1, "Czapka", "Stary dobry kapelusz kowbojski, chroniący głowę przed słońcem.", "cowboy.png", "Ubierz dodatek"},
		{"Czapka",1,1, "Czapka", "Zwykła czapka na głowę", "cap.png", "Ubierz dodatek"},
		{"Okrągła czapka",1,1, "Czapka", "Okrągła czapka", "radarcap.png", "Ubierz dodatek"},
		{"Beret",1,1, "Czapka", "Beret starca o nazwisku Paździoch. ", "flatcap.png", "Ubierz dodatek"},
		{"Beret wojskowy",1,1, "Czapka", "Beret używany w wojsku", "beret.png", "Ubierz dodatek"},
		{"Panama",1,1, "Czapka", "Panama używana głównie przez rybaków", "camo.png", "Ubierz dodatek"},
		{"Hełm wojskowy",1,1, "Hełm", "Doskonała ochrona przed kulami wroga i dobrą ochronę przed uszkodzeniami cięcia, gdy trafia w głowę", "helmet.png", "Ubierz dodatek"},
		{"Kamizelka taktyczna",1,1, "Kamizelka", "Chroni przed średnimi uszkodzeniami ciała. Dodaje 4 sloty.", "tactvest.png"},
		{"Kamizelka z kevlaru",1,1, "Kamizelka", "Chroni przed średnimi uszkodzeniami ciała. Dodaje 4 sloty.", "kevlar.png"},
		{"Ракетные Авиаторы",1,1, "Prestiżowy", "Очки типа 'Авиаторы'", "rocketavia.png", "Ubierz dodatek"},
	},
	["Parts"] = {
		{"Koło",2,2,"Pojazd", "Jeden z najważniejszych części do pełnej sprawności auta.", "wheel.png"},
		{"Silnik",3,2,"Pojazd", "Jeden z najważniejszych części do pełnej sprawności auta.", "engine.png"},
		{"Bak",2,2,"Pojazd", "Służy do przetrzymywania paliwa w pojeździe", "engine_part.png"},
		{"Żarówki samochodowe",2,2,"Pojazd", "Żarówki do samochodu które oświetlają drogę", "engine_part.png"},
		{"Pusty kanister",1,2,"Benzyna", "Służy do przenoszenia paliwa.", "kan.png"},
		{"Pełny kanister",1,2,"Benzyna", "Możesz tym napełnić zbiornik paliwa w pojeździe.", "kan.png"},
	},
	["Items"] = {
		{"Koktajl Mołotowa",1,2,"Broń", "-", "vodka.png"},
		{"Domowej roboty koktajl mołotowa",1,2,"Broń", "-", "vodka.png"},
		{"Pusta puszka",1,1,"Zniszczone", "Śmieć", "emptycan.png"},
		{"Pusta puszka po napoju",1, 1,"Zniszczone", "Śmieć", "emptysoda.png"},
		{"Flara",1,1,"Prestiżowy", "Oświetla obszar w którym stoisz.", "faer.png","Postaw"},
		{"Pusta butelka po wodzie",1, 2,"Prestiżowy", "Pusta butelka po wodzie", "waterbottle.png","Napełnij"},
		{"Pusta butelka",1, 2,"Prestiżowy", "Pusta butelka po wódce. Możesz zrobić z tego koktajl mołotowa.", "vodka.png"},
		{"Pusta manierka",1, 2,"Prestiżowy", "Pusta manierka bez wody. Możesz ją napełnić w wodzie.", "flag.png","Napełnij"},
		{"Namiot",3,2,"Prestiżowy", "Służy do przechowywania itemków.", "tent.png","Rozbij namiot"},
		{"Drut kolczasty",1, 1,"Prestiżowy", "Postawione osłania obszar.", "wirefence.png","Rozłóż drut"},
		{"Drewno opałowe",2,2,"Prestiżowy", "Drewniane kłody, które możesz podpalić.", "wood.png"},
		{"Mina",1, 1,"Prestiżowy", "Mina przeciw pojazdowa.", "not.png", "Postaw minę"},
		{"12 Gauge 20 Rounds Buckshot",1, 1,"Prestiżowy", "Skrzynka z amunicją do broni myśliwskiej IZH-43", "buckshot.png", "Otwórz"},
		{".357 20 Rounds",1, 1,"Prestiżowy", "Skrzynka z amunicją do pistoletu Kalibera .357 i Magnum", "357p.png", "Otwórz"},
		{".22 20 Rounds",1, 1,"Prestiżowy", "Skrzynka z amunicją do karabinu Kalibera .22 i Sporter 22", "22round.png", "Otwórz"},
		{"7.62x39mm 20 Rounds",1, 1,"Prestiżowy", "Skrzynka z amunicją do karabinów maszynowych Kalibera 7.62x39, AKM i SKS ", "7_39p.png", "Otwórz"},
		{"7.62x51mm 20 Rounds",1, 1,"Prestiżowy", "Skrzynka z amunicją do Kaliberа 7.62х51 i Mosin 9130", "7_62p.png", "Otwórz"},
		{".45ACP 20 Rounds",1, 1,"Prestiżowy", "Skrzynka z amunicją do Kaliberа .45АСР i FNX45", "45acpp.png", "Otwórz"},
		{"5.56mm 20 Rounds",1, 1,"Prestiżowy", "Skrzynka z amunicją do Kaliberа 5.56 i М4А1", "5_56p.png", "Otwórz"},
		{"9mm 20 Rounds",1, 1,"Prestiżowy", "Skrzynka z amunicją do Kaliberа 9mm i CR75", "9mmp.png", "Otwórz"},
		{"Drewniany kij",1,2,"Prestiżowy", "Przedmiot potrzebny do skonstruowania broni.", "branch.png"},
		{"Nitrogliceryna",2,1,"Prestiżowy", "Przedmiot potrzebny do skonstruowania broni.", "not.png"},
		{"Lina",1,1,"Prestiżowy", "Przedmiot potrzebny do skonstruowania broni.", "rope.png"},
		{"Kamień",1,1,"Prestiżowy", "Przedmiot potrzebny do skonstruowania broni.", "stone.png"},
		{"Kijek",2,1,"Prestiżowy", "Przedmiot potrzebny do skonstruowania broni.", "paleno.png"},
		{"Kamienie",2,2,"Prestiżowy", "Przedmiot potrzebny do skonstruowania broni.", "stone.png"},
		{"Proch",1,1,"Prestiżowy", "Przedmiot potrzebny do skonstruowania broni.", "matchbox.png"},
		{"Torba",2,1,"Prestiżowy", "Przedmiot potrzebny do skonstruowania broni.", "burlap.png"},
		{"Gwoździe",1, 1,"Prestiżowy", "Przedmiot potrzebny do skonstruowania broni.", "not.png"},
		{"Latarka*",1,1,"Prestiżowy", "Oświetla drogę w ciemności. Aby użyć ustaw na pasek.", "flashlight.png", "Odłącz akumulator"},
		{"Latarka",1,1,"Prestiżowy", "Latarka bez baterii.", "flashlight.png"},
		{"Bateria",1,1,"Prestiżowy", "-", "battery.png", "Poliż"},
		{"GPS",1, 1,"Prestiżowy", "Sprawdź swą lokalizację na mapie.", "gps.png", "Показать/Скрыть"},
		{"Kajdanki",1, 1,"Prestiżowy", "-", "handcuffs.png"},
		{"Klucze",1, 1,"Prestiżowy", "-", "handcuff_key.png"},
		{"Adrenalina",1, 1,"Prestiżowy", "-", "epin.png"},
		{"Latarka na głowę",1, 1,"Prestiżowy", "Latarka bez baterii.", "headtroch.png"},
		{"Latarka na głowę*",1, 1,"Prestiżowy", "Wygodniejsze niż latarka w ręku. Aby użyć przenieś latarkę na pasek.", "headtroch.png","Wyciągnij baterię z latarki na głowie"},
		--{"М4А1",3,1,"Prestiżowy", "KArabin szturmowy wyprodukowany w USA.. Odpowiednie naboje do tej broni to 5.56mm", 'm4a1.png' },
	},
	["Toolbelt"] = {
		{"Gogle noktowizyjne",1, 1,"Prestiżowy", "-", "night.png"},
		{"Gogle na podczerwień",1, 1,"Prestiżowy", "-", "ir.png"},
		{"Mapa",1, 1,"Prestiżowy", "Sprawdź swą lokalizację. Służy do orientacji w terenie.", "map.png"},
		{"Zapałki",1, 1,"Prestiżowy", "-", "matchbox.png"},
		{"Zegarek",1, 1,"Prestiżowy", "Pokazuje aktualną godzinę", "watch.png"},
		{"Narzędzia",2, 2,"Prestiżowy", "Służy do naprawiania pojazdów itp...", "tool.png"},
		{"Radio",1, 1,"Prestiżowy", "Służy do komunikowania się z innymi w pobliżu.", "radio.png"},
	},
}

vehicleFuelTable = {
	{422,80},
	{470,100},
	{468,30},
	{433,140},
	{431,140},
	{471,30},
	{463,40},
	{512,90},
	{460,80},
	{484,120},
	{486,100},
	{530,30},
	{537,220},
	{509,0},
	{487,60},
	{497,60},
	{453,60},
	{525,60},
}

vehicleAddonsInfo = {
	{422,4,1,1,1},
	{470,4,1,1,1},
	{468,2,1,1,1},
	{433,6,1,1,1},
	{431,6,1,1,1},
	{471,4,1,1,1},
	{463,2,1,1,1},
	{525,4,2,1,1},
	{512,3,1,1,0},
	{460,0,1,1,0},
	{484,0,3,1,0},
	{486,4,2,1,1},
	{530,4,1,0,0},
	{537,12,4,1,0},
	{509,0,0,0,0},
	{487,0,1,1,0},
	{497,0,1,1,0},
	{453,0,1,1,0},
}

weaponsTable = {
	[1] = {"crossbar.png", 1, 1},
	[2] = {"crossbar.png", 2, 1},
	[3] = {"machete.png", 2, 1}, --Maczeta
	[4] = {"knife.png", 1, 1},
	[5] = {"bat.png", 2, 1 },
	[6] = {"shovel.png", 1, 2 },
	[7] = {"axe.png", 2, 1 },--Topór
	[8] = {"hatchet2.png", 1, 2 },
	[9] = {"hatchet.png", 1, 2 }, -- не используется
	[10] = {"open_can.png", 2, 1 }, --Otwieracz
	[11] = {"pila.png", 2, 1 }, --Piła do metalu
	[12] = {"hatchet.png", 2, 1 }, -- не используется
	[13] = {"hatchet.png", 2, 1 }, -- не используется
	[14] = {"hatchet.png", 2, 1 }, -- не используется
	[15] = {"bat.png", 2, 1 },
	[16] = {"hatchet.png", 2, 1 }, -- не используется
	[17] = {"hatchet.png", 2, 1 }, -- не используется
	[18] = {"molotov.png", 2, 1 },
	[19] = {"hatchet.png", 2, 1 }, -- не используется
	[20] = {"hatchet.png", 2, 1 }, -- не используется
	[21] = {"hatchet.png", 2, 1 }, -- не используется
	[22] = { "fnx45.png", 1, 1 },
	[23] = { "cr75.png", 2, 2 },
	[24] = { "magnum.png", 2, 2 },
	[25] = { "shotgun.png", 3,1 }, -- не используется
	[26] = { "sawedoff.png", 3,1 },
	[27] = { "shotgun.png", 3,1 },
	[28] = { "pdw.png", 2,1 },
	[29] = { "mp5.png", 2,1 },
	[30] = { "ak74.png", 3,1 },
	[31] = { "m4a1.png", 3,1 },
	[32] = { "mp5.png", 2,1 }, 
	[33] = { "mosin.png", 3,1 },
	[34] = { "sniper.png", 3,1 },
	[43] = { "binocular.png", 1, 1 },
	[46] = { "parachute.png", 1, 1 },
}

sacks = {
	[12] = { "Torba dziecięca", "child.png" },
	[16] = { "Torba dziecięca", "child.png" },
	[13] = { "Torba domowa", "courier.png" },
	[17] = { "Torba domowa", "courier.png" },
	[20] = { "Plecak domowej roboty", "improvised.png" },
	[24] = { "Plecak domowej roboty", "improvised.png" },
	[25] = { "Plecak", "taloon.png" },
	[29] = { "Plecak", "taloon.png" },
	[30] = { "Plecak na polowanie", "hunting.png" },
	[34] = { "Plecak na polowanie", "hunting.png" },
	[35] = { "Plecak górski", "mountain.png" },
	[39] = { "Plecak górski", "mountain.png" },
}
--[[
helmets = {
	[10] = { "Шлем мотоциклста", "child.png" },
}
glasses = {
	[10] = { "Ракетные Авиаторы", "child.png" },
}
masks = {
	[1] = { "Respirator", "child.png" },
	[2] = { "Maska gazowa", "child.png" },
	[3] = { "Maska 'Hoxton'", "child.png" },
	[4] = { "Maska 'Dallas'", "child.png" },
	[5] = { "Maska 'Wilk'", "child.png" },
}
hats = {
	[1] = { "Nauszniki", "child.png" },
	[2] = { "Kowbojski kapelusz", "child.png" },
	[3] = { "Czapka", "child.png" },
	[4] = { "Okrągła czapka", "child.png" },
	[5] = { "Beret", "child.png" },
	[6] = { "Beret wojskowy", "child.png" },
	[7] = { "Panama", "child.png" },
	[8] = { "Hełm wojskowy", "child.png" },
}
vests = {
	[1] = { "Kamizelka taktyczna", "child.png" },
}--]]

recipes = {
-- сначала идут ингридиенты, потом что будет написанно, потом результат
-- если в таблице результата 1 число равно 1, то будет дан указанный предмет
-- если в таблице результата 1 число равно 2, то будет использован данный playerUseItem
	{{{"Otwieracz",false},{"Zamknięta puszka makaronu",true}},"Otwórz",{1,"Otwarta puszka makaronu",1}},
	{{{"Otwieracz",false},{"Zamknięty pojemnik z boczkiem",true}},"Otwórz",{1,"Otwarty pojemnik z boczkiem",1}},
	{{{"Otwieracz",false},{"Zamknięta puszka fasoli",true}},"Otwórz",{1,"Otwarta puszka fasoli",1}},
	{{{"Otwieracz",false},{"Zamknięta puszka sardynek",true}},"Otwórz",{1,"Otwarta puszka sardynek",1}},
	{{{"Nóż myśliwski",false},{"Zamknięta puszka makaronu",true}},"Otwórz",{1,"Otwarta puszka makaronu",1}},
	{{{"Nóż myśliwski",false},{"Zamknięty pojemnik z boczkiem",true}},"Otwórz",{1,"Otwarty pojemnik z boczkiem",1}},
	{{{"Nóż myśliwski",false},{"Zamknięta puszka fasoli",true}},"Otwórz",{1,"Otwarta puszka fasoli",1}},
	{{{"Nóż myśliwski",false},{"Zamknięta puszka sardynek",true}},"Otwórz",{1,"Otwarta puszka sardynek",1}},
	{{{"Topór strażacki",false},{"Zamknięta puszka makaronu",true}},"Otwórz",{1,"Otwarta puszka makaronu",1}},
	{{{"Topór strażacki",false},{"Zamknięty pojemnik z boczkiem",true}},"Otwórz",{1,"Otwarty pojemnik z boczkiem",1}},
	{{{"Topór strażacki",false},{"Zamknięta puszka fasoli",true}},"Otwórz",{1,"Otwarta puszka fasoli",1}},
	{{{"Topór strażacki",false},{"Zamknięta puszka sardynek",true}},"Otwórz",{1,"Otwarta puszka sardynek",1}},
	{{{"Maczeta",false},{"Zamknięta puszka makaronu",true}},"Otwórz",{1,"Otwarta puszka makaronu",1}},
	{{{"Maczeta",false},{"Zamknięty pojemnik z boczkiem",true}},"Otwórz",{1,"Otwarty pojemnik z boczkiem",1}},
	{{{"Maczeta",false},{"Zamknięta puszka fasoli",true}},"Otwórz",{1,"Otwarta puszka fasoli",1}},
	{{{"Maczeta",false},{"Zamknięta puszka sardynek",true}},"Otwórz",{1,"Otwarta puszka sardynek",1}},
	{{{"Topór",false},{"Zamknięta puszka makaronu",true}},"Otwórz",{1,"Otwarta puszka makaronu",1}},
	{{{"Topór",false},{"Zamknięty pojemnik z boczkiem",true}},"Otwórz",{1,"Otwarty pojemnik z boczkiem",1}},
	{{{"Topór",false},{"Zamknięta puszka fasoli",true}},"Otwórz",{1,"Otwarta puszka fasoli",1}},
	{{{"Topór",false},{"Zamknięta puszka sardynek",true}},"Otwórz",{1,"Otwarta puszka sardynek",1}},
	{{{"Torba",true},{"Lina",true}},"Dodaj plecak",{1,"Torba domowa",1}},
	{{{"Torba domowa",true},{"Drewniany kij",true}},"Dodaj plecak",{1,"Plecak domowej roboty",1}},
	{{{"Bandaż",true},{"Drewniany kij",true}},"Zrób szynę",{1,"Szyna",1}},
	{{{"Bateria",true},{"Latarka",true}},"Włóż baterię do latarki",{1,"Latarka*",1}},
	{{{"Bateria",true},{"Latarka na głowę",true}},"Włóż baterię do latarki na głowę",{1,"Latarka na głowę*",1}},
	{{{"Zapałki",false},{"Drewno opałowe",true}},"Сделать костер",{2,"Drewno opałowe","Podpal"}},
	{{{"Pusta butelka",true},{"Pełny kanister",true}},"Napełnij",{2,"Koktajl Mołotowa","Koktajl Mołotowa"}},
	{{{"Koktajl Mołotowa",true},{"Lina",true}},"Połącz",{1,"Domowej roboty koktajl mołotowa",1}},
	{{{"Domowej roboty koktajl mołotowa",true},{"Zapałki",false}},"Podpal",{1,"Koktajl mołotowa",1}},
	{{{"Gwoździe",true},{"Kij bejsbolowy",true}},"Dodaj gwoździe do kija",{1,"Kij bejsbolowy z gwoździami",1}},
	{{{"IZH-43",true},{"Piła do metalu",false}},"Przystrzyj",{1,"Sawedoff-Off IZH-43",1}},

	{{{"Kamień",true},{"Kamień",true}},"Dodaj",{1,"Kamienie",1}},
	{{{"Kijek",true},{"Kijek",true}},"Dodaj",{1,"Drewno opałowe",1}},
--	{{{"Pusta puszka",true},{"Proch",true}},"Połącz",{1,"Банка с порохом",1}},
--	{{{"Банка с порохом",true},{"Nitrogliceryna",true}},"Сделать мину",{1,"Самодельная протевопехотная мина",1}},
--	{{{"Pusta butelka po wodzie",true},{"Proch",true}},"Połącz",{1,"Бутылка с порохом",1}},
--	{{{"Бутылка с порохом",true},{"Gwoździe",true}},"Połącz",{1,"Бутылка с порохом и гвоздями",1}},
--	{{{"Бутылка с порохом и гвоздями",true},{"Nitrogliceryna",true}},"Сделать гранату",{1,"Самодельная Granat",1}},

}

statsTable = {"Głód", "Pragnienie", "Zatrucie", "Ból", "сепсис", "Krwawienie", "Oziębienie", "Gorączka", "Złamanie",}
panelBD = 60000--таймер исчезновения панели бд
--- ЦВЕТА r g b альфа
rstat, gstat, bstat, astat = 205,205,205,225 -- цвета надписей хочу Wypij, потеря крови, голоден и тп 
rstatb, gstatb, bstatb, astatb = 200,175,55,205 -- цвета прямоугольника хочу Wypij, потеря крови, голоден и тп 

dragalpha = 180 -- альфа при перетаскивании
rred,gred,bred,ared = 250,30,30,180 -- красная подсветка при перетаскивании
rgreen,ggreen,bgreen,agreen = 30,250,30,180 -- зеленая подсветка при перетаскивании
rblue,gblue,bblue,ablue = 100,250,250,200 -- голубая подсветка при замене
rorange,gorange,borange,aorange = 255,153,0,190 -- ораньжевая подсветка при крафте
rblock,gblock,bblock,blockalpha = 50,50,50,235 -- отдельный слот (ячейка)
blockwalpha = 240 -- отдельный слот холодного оружия
rslotf, gslotf, bslotf, aslotf = 150, 150, 150, 220 -- свободный слот
rslot, gslot, bslot, aslot = 80, 80, 80, 225 -- занятый слот
fbur, fbub, fbug, fbua = 133, 133, 133, 120 -- цвет занятых квадартов быстрого доступа