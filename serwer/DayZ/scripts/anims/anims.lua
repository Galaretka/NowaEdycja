function funcBindLie(player, key, keyState)
if lying then
setPedAnimation(player, false)
lying = false
else
if isPedInVehicle(player) then
return
end
setPedAnimation(player, "ped", "cower", nil, true, false, false, true)
lying = true
function setVisibility()
value = 0
end
end
end
function funcBindLie(player, key, keyState)
if lying then
setPedAnimation(player, false)
lying = false
else
if isPedInVehicle(player) then
return
end
setPedAnimation(player, "ped", "fucku", nil, true, false, false, true)
lying = true
function setVisibility()
value = 0
end
end
end
function funcBindLie(player, key, keyState)
if lying then
setPedAnimation(player, false)
lying = false
else
if isPedInVehicle(player) then
return
end
setPedAnimation(player, "ped", "endchat_03", nil, true, false, false, true)
lying = true
function setVisibility()
value = 0
end
end
end
function bindTheKeys()
bindKey(source, "[", "down", funcBindLie)
end

addEventHandler("onPlayerLogin", getRootElement(), bindTheKeys)