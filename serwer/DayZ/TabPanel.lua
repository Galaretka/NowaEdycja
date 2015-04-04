local sw, sh = guiGetScreenSize()
			
ColumnName = {{ name = "", width = 100, data = function (element) return getPlayerName ( element ) end },}
ColumnStats = {
{ name = "Ludzkość", width = 100, data = function (element) return getElementData ( element, "humanity" ) or 0 end }, 
{ name = "Zabójstw", width = 100, data = function (element) return ( getElementData ( element, "murders" ) or 0 ) end },
{ name = "Zabitych zombie", width = 100, data = function (element) return ( getElementData ( element, "zombieskilled" ) or 0 ) end },
{ name = "Czas życia", width = 100, data = function (element) return formatTimeFromMinutes(getElementData ( element, "alivetime" ) or 1 ) end },
{ name = "Kasa", width = 100, data = function (element) return getPlayerMoney ( element ) or 0 end },
{ name = "Grupa", width = 100, data = function (element) return getElementData ( element, "gang" ) or "BRAK" end },
}

local serverName = "DayZ  POLSKA" -- название сервера
local topsize = 60 -- величина шляпы
local playersize = topsize-30 -- высота одной строки
local panelsize = playersize*1 -- величина панели

function calculateWidth()
	local width = 0
	for key, value in ipairs( ColumnName ) do
		width = width + value.width
	end
	for key, value in ipairs( ColumnStats ) do
		width = width + value.width
	end	
	return width + 60
end 

local max_players = 60
local ploff = 0
local width = calculateWidth()
local baseX = sw/2-width/2
local baseY = sh/2-(panelsize+topsize)/0.5
 
addEventHandler( "onClientRender", root,
function()
	if getKeyState( "tab" ) == false then ploff = 0; return end
	if getElementData(getLocalPlayer(),"logedin") then
		dxDrawRectangle ( baseX, baseY-40, width, topsize+40, tocolor(32,32,32) )
		dxDrawText ( serverName, baseX+53, baseY-45, baseX+width, baseY+topsize, tocolor(249,41,0), 2.6, "bankgothic" )
		dxDrawRectangle ( baseX, baseY+topsize, width, panelsize, tocolor(112,112,112,0) )			
		dxDrawLine ( baseX, baseY+30, baseX+width, baseY+30, tocolor(100,100,100),0.8 )
		dxDrawLine ( baseX, baseY+30, baseX, baseY+panelsize+topsize, tocolor(100,100,100),0.8 )
		dxDrawLine ( baseX, baseY+panelsize+topsize, baseX+width, baseY+panelsize+topsize, tocolor(100,100,100),0.8 )			
		local xoff = 60
		for i, v in ipairs ( ColumnName ) do
			dxDrawLine ( baseX+xoff+v.width, baseY+30, baseX+xoff+v.width, baseY+panelsize, tocolor(100,100,100),0.9 )
			dxDrawText ( v.name, baseX+xoff, baseY+70, baseX+xoff+v.width+10, baseY+topsize-30, tocolor(255,255,255), 1, "default-bold", "center", "center" )
			xoff = xoff+v.width
		end			
		for i, v in ipairs ( ColumnStats ) do
			dxDrawLine ( baseX+xoff+v.width, baseY+30, baseX+xoff+v.width, baseY+panelsize, tocolor(100,100,100),0.9 )
			dxDrawText ( v.name, baseX+xoff, baseY+60, baseX+xoff+v.width, baseY+topsize-30, tocolor(255,255,255), 1, "default-bold", "center", "center" )
			xoff = xoff+v.width
		end
		local playersTable = getElementsByType ( "player" )
		dxDrawText ( "Graczy:  "..tostring(#playersTable).." | "..tostring(max_players), baseX-640, baseY+60, baseX+width, baseY+30, tocolor(255,255,255), 1, "default-bold", "center", "center" )	
		local maxNum = #playersTable
		if maxNum > 10 then
			maxNum = 10
		end
		for i = 1, maxNum do
			dxDrawLine ( baseX, baseY+topsize+playersize*i, baseX+width, baseY+topsize+playersize*i, tocolor(100,100,100),0.5 )
			dxDrawText ( i+ploff, baseX, baseY+topsize+playersize*(i-1), baseX+25, baseY+topsize+playersize*i, tocolor(255,255,255), 1, "default-bold", "center", "center" )
			if playersTable[i+ploff] == localPlayer then
				dxDrawRectangle ( baseX, baseY+topsize+playersize*(i-1), width, playersize, tocolor(112,112,112,80) )
				else
				dxDrawRectangle ( baseX, baseY+topsize+playersize*(i-1), width, playersize, tocolor(112,112,112,150) )					
			end
			local xoff = 60		
			for c, d in ipairs ( ColumnName ) do
				local data = d.data(playersTable[i+ploff])
				local r,g,b = 255,255,255
				dxDrawText ( data, baseX+xoff-40, baseY+topsize+playersize*(i-1), baseX+xoff+d.width-10, baseY+topsize+playersize*i, tocolor(r,g,b), 0.9, "default-bold", "center", "center" )
				xoff = xoff+d.width
			end
				for c, d in ipairs ( ColumnStats ) do
				local data = d.data(playersTable[i+ploff])
				local r,g,b = 255,255,255
				if d.name == "group" and data == "BRAK" then
					r,g,b = 0,255,0
					data = "Bez grupy"
				end
				dxDrawText ( data, baseX+xoff, baseY+topsize+playersize*(i-1), baseX+xoff+d.width-5, baseY+topsize+playersize*i, tocolor(r,g,b), 0.9, "default-bold", "center", "center" )
				xoff = xoff+d.width
			end
		end
	end
end
)

function PlayerScrollMenu (key,keyState,arg)
	if getElementData(localPlayer,"logedin") and getKeyState( "F4" ) then
		if ( keyState == "down" ) then
			if arg == "up" then
				if ploff > 0 then
					ploff=ploff-1
				end
			elseif arg == "down" then
				local playersTable = getElementsByType ( "player" )
				if ploff < #playersTable-10 then
					ploff = ploff+1
				end
			end
		end
	end
end
bindKey ( "mouse_wheel_up", "down", PlayerScrollMenu, "up" )
bindKey ( "mouse_wheel_down", "down", PlayerScrollMenu, "down" )

function formatTimeFromMinutes(value)
	if value then
		local hours = math.floor(value/60)
		local minutes = math.round(((value/60) - math.floor(value/60))*100/(100/60))
		if minutes < 10 then minutes = "0"..minutes end
		value = hours..":"..minutes
		return value
	end
	return false
end

function math.round(number, decimals, method)
    decimals = decimals or 0
    local factor = 10 ^ decimals
    if (method == "ceil" or method == "floor") then return math[method](number * factor) / factor
    else return tonumber(("%."..decimals.."f"):format(number)) end
end

function sendMaxPlayersOnServer (players)
	max_players = players
end
addEvent("sendMaxPlayersOnServer",true)
addEventHandler("sendMaxPlayersOnServer",getLocalPlayer(),sendMaxPlayersOnServer)