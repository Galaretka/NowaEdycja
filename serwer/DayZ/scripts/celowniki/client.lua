local textures = {};
local function render_crosshair ()
	local screenw, screenh = guiGetScreenSize (); 
	local s = screenw * 0.5; 
	local u,v = (screenw - s)*0.5, (screenh - s)*0.5;
	local black = tocolor (0, 0, 0, 255);
	dxDrawRectangle (0, 0, screenw, v, black);
	dxDrawRectangle (0, 0, u, screenh, black);
	dxDrawRectangle (0, screenh, screenw, -v, black);
	dxDrawRectangle (screenw, screenh, -u, -screenh, black);
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["crosshair_background"]);
	dxDrawImage (u, v, screenw-2*u, screenh-2*v, textures ["crosshair"]);
end;


function updatecrossfire(prevSlot, newSlot)
	local weapon1 = getElementData(source,"currentweapon_1")
	if getPedWeaponSlot ( localPlayer ) == 6 then 
		if weapon1 == "DMR" then
			textures ["crosshair"] = dxCreateTexture ("images/crossair_svd_camo.png", "argb", true, "wrap"); 
		elseif weapon1 == "CZ 550" then
			textures ["crosshair"] = dxCreateTexture ("images/crossair_cz_550.png", "argb", true, "wrap"); 
		end
	end
end
addEventHandler ( "onClientPlayerWeaponSwitch", getRootElement(), updatecrossfire )

local function on_weapon_aimed (key, state)
	local weapon_sniper_rifle = 34; 
	if getPedWeapon (getLocalPlayer ()) == weapon_sniper_rifle then 
		if state == "down" then 
			showPlayerHudComponent ("crosshair", false);
			addEventHandler ("onClientHUDRender", getRootElement (), render_crosshair);
		else 
			removeEventHandler ("onClientHUDRender", getRootElement (), render_crosshair); 
		end;
	end;
end; 


addEventHandler ("onClientResourceStart", getResourceRootElement (getThisResource ()),
	function () 
		-- load textures. 
	--	if not textures ["crosshair"] then 
		--	outputDebugString ("failed to load \"images/PKS-07_crosshair.png\" texture", 1); 
		--	return;
		--end;
		textures ["crosshair_background"] = dxCreateTexture ("images/PKS-07_crosshair_background.png", "argb", true, "wrap"); 
		if not textures ["crosshair_background"] then
			outputDebugString ("failed to load \"images/PKS-07_crosshair_background.png\" texture", 1); 
			return;		
		end;
	
		bindKey ("aim_weapon", "both", on_weapon_aimed);
		addEventHandler ("onClientPlayerWeaponSwitch", getRootElement (),
			function (previousWeaponSlot)
				local weaponslot_type_sniper = 6; 
				if previousWeaponSlot == weaponslot_type_sniper then 
					if not isPlayerHudComponentVisible ("crosshair") then 
						showPlayerHudComponent ("crosshair", true);
					end;
				end; 
			end);
	end); 
	
addEventHandler ("onClientResourceStop", getResourceRootElement (getThisResource ()),
	function ()
		unbindKey ("aim_weapon", "both", on_weapon_aimed); 
		if not isPlayerHudComponentVisible ("crosshair") then
			showPlayerHudComponent ("crosshair", true);
		end;
	end);