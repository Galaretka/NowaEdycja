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

addons = "DayZ: "
function addAddonInfo(name, description)
  addons = addons .. name .. " | "
  setGameType(addons)
end
function nightAddon1()
  if gameplayVariables.enablenight then
    addAddonInfo("night", "Pora nocna.")
  end
end
function nightAddon()
  setTimer(nightAddon1, 10000, 1)
end
nightAddon()
function loadAddons(res)
  for resourceKey, resourceValue in ipairs(getResources()) do
    local name = getResourceName(resourceValue)
    if string.find(name, "addon_") then
      startResource(resourceValue)
    end
  end
end
addEventHandler("onResourceStart", getResourceRootElement(getThisResource()), loadAddons)
function unloadAddons(res)
  for resourceKey, resourceValue in ipairs(getResources()) do
    local name = getResourceName(resourceValue)
    if string.find(name, "addon_") then
      stopResource(resourceValue)
    end
  end
end
addEventHandler("onResourceStop", getResourceRootElement(getThisResource()), unloadAddons)
