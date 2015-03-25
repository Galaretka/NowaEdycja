function playerQuit()
    local playerAcc = getPlayerAccount(source)
    if ( playerAcc  ) then -- You we're checking if (playeraccount == true) then, but your variable name is "playeracc".
        local playerCash = getPlayerMoney(source)
        setAccountData(playerAcc, "cash", playerCash)
        setPlayerMoney(source, 0)
    end
end
addEventHandler("onPlayerQuit", getRootElement(), playerQuit)
addEventHandler("onPlayerLogout", getRootElement(), playerQuit)
 
function playerLogin()
    local playerAcc = getPlayerAccount(source)
    if (playerAcc) then
        local playerBank = getAccountData(playerAcc, "cash")
        if (playerBank) then
            setPlayerMoney(source, tonumber(playerBank))
        else
            outputChatBox("You are broke.", source, 255, 0, 0)
        end
    end
end
addEventHandler("onPlayerLogin", getRootElement(), playerLogin)              