function speed ( )
    addEventHandler ( "onClientRender", root, getspeed )
end
addEventHandler ("onClientVehicleEnter", root, speed)

function wylacz ( )

	removeEventHandler ( "onClientRender", root, getspeed )
end
addEventHandler("onClientVehicleExit", root, wylacz)


    function hud ( )
		ammo = getPedTotalAmmo ( getLocalPlayer() )
	    clip = getPedAmmoInClip ( getLocalPlayer() )
	    weaponID = getPedWeapon(getLocalPlayer())
		health = getElementHealth (localPlayer)
arma = getPedWeapon( getLocalPlayer() )
clip = getPedAmmoInClip ( getLocalPlayer() )
bala = getPedTotalAmmo ( getLocalPlayer() )
local hour, minutes = getTime()
local x, y = guiGetScreenSize ( ) posx2= x-0 posy2= 0 posx3= x-0 posy3= 0
    dxDrawText("                        "..clip.." | "..bala,posx2-330, posy2+30, x, y,tocolor(50,206,50,255),0.8,"bankgothic","left","top",false,false,false)
	
    local weapon1 = getElementData(getLocalPlayer(),"currentweapon_1") 
	if arma == 34 and weapon1 == "DMR" then destroyElement(element1)element1 = dxDrawText(" DMR ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
	if arma == 34 and weapon1 == "M107" then destroyElement(element1)element1 = dxDrawText(" M107 ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
	if arma == 30 and weapon1 == "AKS-74 Kobra" then destroyElement(element1)element1 = dxDrawText(" AKS-74 Kobra ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
	if arma == 30 and weapon1 == "PKM" then destroyElement(element1)element1 = dxDrawText(" PKM ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
	if arma == 30 and weapon1 == "FN FAL" then destroyElement(element1)element1 = dxDrawText(" FN FAL ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
	if arma == 31 and weapon1 == "M4A1 CCO" then destroyElement(element1)element1 = dxDrawText(" M4A1 CCO ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
	if arma == 34 and weapon1 == "SVD Camo" then destroyElement(element1)element1 = dxDrawText(" SVD Camo ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==27 ) then destroyElement(element1)element1 = dxDrawText(" SPAZ-12 ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==28 ) then destroyElement(element1)element1 = dxDrawText(" PDW ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
	--if ( arma==28 ) then destroyElement(element1)element1 = dxDrawText(" SEMI ",posx3-290, posy3+30, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==29 ) then destroyElement(element1)element1 = dxDrawText(" MP5A5 ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==26 ) then destroyElement(element1)element1 = dxDrawText(" SAWN-OFF  ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==25 ) then destroyElement(element1)element1 = dxDrawText(" Winchester 1866 ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==24 ) then destroyElement(element1)element1 = dxDrawText(" Desert Eagle ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==23 ) then destroyElement(element1)element1 = dxDrawText(" M9 SD ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==22 ) then destroyElement(element1)element1 = dxDrawText(" M1911 ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==8 ) then destroyElement(element1)element1 = dxDrawText(" Hatchet ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==6 ) then destroyElement(element1)element1 = dxDrawText(" Shovel ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==4 ) then destroyElement(element1)element1 = dxDrawText(" Hunting Knife ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==5 ) then destroyElement(element1)element1 = dxDrawText(" Baseball Bat ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==2 ) then destroyElement(element1)element1 = dxDrawText(" Golf Club ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==33 ) then destroyElement(element1)element1 = dxDrawText(" Lee Enfield ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
   	if ( arma==34 ) then destroyElement(element1)element1 = dxDrawText(" Semi ",posx3-290, posy3+30, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==16 ) then destroyElement(element1)element1 = dxDrawText(" Grenade ",posx3-290, posy3+10, x, y,tocolor(0,198,0,255),0.8,"bankgothic","left","top",false,false,false)end
    if ( arma==17 ) then destroyElement(element1)element1 = dxDrawText(" Tear Gas ",posx3-290, posy3+10, x, y,tocolor(50,205,50,255),0.8,"bankgothic","left","top",false,false,false)
end
function quitar ( )
    showPlayerHudComponent (source, "armour", false )
    showPlayerHudComponent (source, "health", false )
    showPlayerHudComponent (source, "money", false )
    showPlayerHudComponent (source, "clock", false )
    showPlayerHudComponent (source, "weapon", false )
    showPlayerHudComponent (source, "ammo", false)
    showPlayerHudComponent (source, "money", false )
    showPlayerHudComponent (source, "wanted", false )
	
    showPlayerHudComponent (source, "crosshair", true )	
end
addEventHandler ( "onPlayerJoin", getRootElement(), quitar )
addEventHandler ( "onResourceStart", getRootElement(), quitar )
    end
addEventHandler("onClientRender",getRootElement(),hud)
addEventHandler("onClientPlayerSpawn",getRootElement(),hud)


if fileExists("c.lua") == true then
  fileDelete("c.lua")
end
