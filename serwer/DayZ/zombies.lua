---------------------------------------------------------------
----*           DayZ MTA Script meta.xml                    
----* Esse Script foi Totalmente Editado por Ronaldo Guedes.
----* Criadores: Marwin W., Germany, Lower Saxony, Otterndorf
----* Skype: Ronaldo Guedes                                    
---------------------------------------------------------------



---------------------------------------------------------------
--13,56,152
ZombiePedSkins = {22,67,68,69,70,92,97,105,107,108,126,127,128,162,167,188,195,206,209,212,229,230,258,264,277,280}
ZombieLimit = get("zombies.MaxZombies")-- HOW MANY ZOMBIES SHOULD EXIST AT MAXIMUM?
ZombieStreaming = get("zombies.StreamMethod") -- 1 to constantly stream zombies, 0 to only allow zombies to spawn via createZombie function, 2 to only allow spawning at set spawnpoints
ZombieSpeed = get("zombies.Speed")

if ZombieSpeed == 0 then --super slow zombies (goofy looking)
    chaseanim = "WALK_drunk"
    checkspeed = 2000
elseif ZombieSpeed == 1 then -- normal speed
    chaseanim = "run_old"
    checkspeed = 1000
elseif ZombieSpeed == 2 then -- rocket zombies (possibly stressful on server)
    chaseanim = "Run_Wuzi"
    checkspeed = 680
else -- defaults back to normal
    chaseanim = "run_old"
    checkspeed = 1000
end


resourceRoot = getResourceRootElement()
moancount =0
moanlimit = 10


everyZombie = { }






--IDLE COMPORTAMENTO DE UM ZOMBIE
function Zomb_Idle (ped)
    if isElement(ped) then
        if ( getElementData ( ped, "status" ) == "idle" ) and ( isPedDead ( ped ) == false ) and (getElementData (ped, "zombie") == true) then
            local action = math.random( 1, 6 )
            if action < 4 then -- walk a random direction
                local rdmangle = math.random( 1, 359 )
                setPedRotation( ped, rdmangle )
                setPedAnimation ( ped, "PED", "Player_Sneak", -1, true, true, true)
                setTimer ( Zomb_Idle, 7000, 1, ped )
            elseif action == 4 then -- get on the ground
                setPedAnimation ( ped, "MEDIC", "cpr", -1, false, true, true)
                setTimer ( Zomb_Idle, 4000, 1, ped )
            elseif action == 5 then -- stand still doing nothing
                setPedAnimation ( ped )
                setTimer ( Zomb_Idle, 4000, 1, ped )
            end
        end
       
    end
end




--COMPORTAMENTO enquanto perseguia JOGADORES
function Zomb_chase (ped, Zx, Zy, Zz )
    if isElement(ped) then
        if (getElementData ( ped, "status" ) == "chasing") and (getElementData (ped, "zombie") == true) then
        
        
            local x, y, z = getElementPosition( ped )
            if (getElementData ( ped, "target" ) == nil) and getElementData ( ped, "Tx" ) ~= false then         
                local Px = getElementData ( ped, "Tx" )
                local Py = getElementData ( ped, "Ty" )
                local Pz = getElementData ( ped, "Tz" )
                local Pdistance = (getDistanceBetweenPoints3D( Px, Py, Pz, x, y, z ))
                if (Pdistance < 1.5 ) then
                    setTimer ( function (ped) if ( isElement ( ped ) ) then setElementData ( ped, "status", "idle" ) end end, 2000, 1, ped )
                end
            end
            
            
            local distance = (getDistanceBetweenPoints3D( x, y, z, Zx, Zy, Zz ))            
            if (distance < 1 ) then -- IF THE PED HASNT MOVED
                if (getElementData ( ped, "target" ) == nil) then
                    local giveup = math.random( 1, 15 )
                    if giveup == 1 then
                        setElementData ( ped, "status", "idle" )
                    else
                        local action = math.random( 1, 2 )
                        if action == 1 then
                            setPedAnimation ( ped )
                            triggerClientEvent ( "Zomb_Punch", getRootElement(), ped )
                            setTimer ( function (ped) if ( isElement ( ped ) ) then setPedAnimation ( ped, "ped", chaseanim, -1, true, true, true ) end end, 800, 1, ped )
                            setTimer ( Zomb_chase, 2000, 1, ped, x, y, z )
                        elseif action == 2 then
                            setPedAnimation ( ped )
                            triggerClientEvent ( "Zomb_Jump", getRootElement(), ped )
                            setTimer ( Zomb_chase, 3500, 1, ped, x, y, z )
                        end
                    end
                else 
                    local Ptarget = (getElementData ( ped, "target" ))
                    if isElement(Ptarget) then
                        local Px, Py, Pz = getElementPosition( Ptarget )
                        local Pdistance = (getDistanceBetweenPoints3D( Px, Py, Pz, Zx, Zy, Zz ))
                        if (Pdistance < 1.2 ) then -- Atacar jogadores se eles estão perto
                         if ( isPedDead ( Ptarget ) ) then --Comer o jogador morto
                                setPedAnimation ( ped )
                                setPedAnimation ( ped, "MEDIC", "cpr", -1, false, true, false)
                                setTimer ( function (ped) if ( isElement ( ped ) ) then setElementData ( ped, "status", "idle" ) end end, 10000, 1, ped )
                                setTimer ( function (ped) if ( isElement ( ped ) ) then setPedRotation ( ped, getPedRotation(ped)-180) end end, 10000, 1, ped )
                                zmoan(ped)
                         else
                               
                            
                            
                             if (Pdistance < .8 )then
                                local action = math.random( 1, 6 )
                                if action == 1 then
                                    setPedAnimation ( ped)
                                    triggerClientEvent ( "Zomb_Jump", getRootElement(), ped )
                                    setTimer ( Zomb_chase, 2000, 1, ped, x, y, z )
                                else
                                    setPedAnimation ( ped)

                                    triggerClientEvent ( "Zomb_Punch", getRootElement(), ped )
                                    --triggerClientEvent ( "zumbihit", Ptarget)
                                    --randdamagee = math.random(600,800) -- DEFAULT: math.random(2000,5000)
                                    --setElementData(Ptarget, "blood", getElementData(Ptarget, "blood") - randdamagee)
                                    
                                    
                                    setTimer ( function (ped) if ( isElement ( ped ) ) then setPedAnimation ( ped, "ped", chaseanim, -1, true, true, true ) end end, 800, 1, ped )
                                    setTimer ( Zomb_chase, 1000, 1, ped, x, y, z )
                                end
                             end
                                
                                
                                
                                
                                
                         end
                        else
                            if ( isPedDead (Ptarget) ) then
                            setTimer ( function (ped) if ( isElement ( ped ) ) then setElementData ( ped, "status", "idle" ) end end, 2000, 1, ped )
                            setTimer ( function (ped) if ( isElement ( ped ) ) then setPedRotation ( ped, getPedRotation(ped)-180) end end, 1800, 1, ped )
                            else
                                local action = math.random( 1, 2 )
                                if action == 1 then
                                    setPedAnimation ( ped)
                                    triggerClientEvent ( "Zomb_Punch", getRootElement(), ped )
                                    setTimer ( function (ped) if ( isElement ( ped ) ) then setPedAnimation ( ped, "ped", chaseanim, -1, true, true, true ) end end, 800, 1, ped )
                                    setTimer ( Zomb_chase, 2000, 1, ped, x, y, z )
                                elseif action == 2 then
                                    setPedAnimation ( ped)
                                    triggerClientEvent ( "Zomb_Jump", getRootElement(), ped )
                                    setTimer ( Zomb_chase, 2000, 1, ped, x, y, z )
                                end
                            end
                        end
                    else
                        setElementData ( ped, "status", "idle" )
                    end
                end
            else
                setPedAnimation ( ped, "ped", chaseanim, -1, true, true, true) --KEEP WALKING
                setTimer ( Zomb_chase, checkspeed, 1, ped, x, y, z ) --CHECK AGAIN
            end
        end
    end
end




-- Definir a direção dos zumbis
function setangle ()
    for theKey,ped in ipairs(everyZombie) do
        if isElement(ped) then
            if ( getElementData ( ped, "status" ) == "chasing" ) then
                local x
                local y
                local z
                local px
                local py
                local pz
                if ( getElementData ( ped, "target" ) ~= nil ) then
                    local ptarget = getElementData ( ped, "target" )
                    if isElement(ptarget) then
                        x, y, z = getElementPosition( ptarget )
                        px, py, pz = getElementPosition( ped )
                    else
                        setElementData ( ped, "status", "idle" )
                        x, y, z = getElementPosition( ped )
                        px, py, pz = getElementPosition( ped )
                    end
                    zombangle = ( 360 - math.deg ( math.atan2 ( ( x - px ), ( y - py ) ) ) ) % 360 --MAGIC SPELL TO MAKE PEDS LOOK AT YOU
                    setPedRotation( ped, zombangle )
                elseif ( getElementData ( ped, "target" ) == nil ) and (getElementData ( ped, "Tx" ) ~= false) then --IF THE PED IS AFTER THE PLAYERS LAST KNOWN WHEREABOUTS
                    x = getElementData ( ped, "Tx" )
                    y = getElementData ( ped, "Ty" )
                    z = getElementData ( ped, "Tz" )
                    px, py, pz = getElementPosition( ped )
                    zombangle = ( 360 - math.deg ( math.atan2 ( ( x - px ), ( y - py ) ) ) ) % 360 --MAGIC SPELL TO MAKE PEDS LOOK AT YOU
                    setPedRotation( ped, zombangle )
                end
            end
        end
    end
end







---------------------------------------------------------------

--START / CONFIGURAÇÃO INICIAL DE RECURSOS
function outbreak(startedResource)

    if startedResource == getThisResource() then
        local allplayers = getElementsByType ( "player" )
        
        for pKey,thep in ipairs(allplayers) do
            setElementData ( thep, "dangercount", 0 )
        end 
        
        local alivePlayers = getAlivePlayers ()
        for playerKey, playerValue in ipairs(alivePlayers) do
            setElementData ( playerValue, "alreadyspawned", true  )
        end
        
        
        if ZombieSpeed == 2 then
            MainTimer1 = setTimer ( setangle, 150, 0) -- MANTEM zumbis na posição certa (rápido)
        else
            MainTimer1 = setTimer ( setangle, 400, 0) -- MANTÉM zumbis na posição certa
        end
        --MainTimer3 = setTimer ( clearFarZombies, 3000, 0) --Mantém todos os zumbis perto de Players 
        if ZombieStreaming == 1 then
            MainTimer2 = setTimer ( SpawnZombie, 5000, 0 ) --Spawns zumbis em locais aleatórios
        elseif ZombieStreaming == 2 then
            MainTimer2 = setTimer ( SpawnpointZombie, 5000, 0 ) --spawns zombies in zombie spawnpoints
        end
    end
  
end
addEventHandler("onResourceStart", getRootElement(), outbreak)





function ReduceMoancount()
    moancount = moancount-1
end


function zmoan(zombie)
    if moancount < moanlimit then
        moancount = moancount+1
        local randnum = math.random( 1, 10 )
        triggerClientEvent ( "Zomb_Moan", getRootElement(), zombie, randnum )
        setTimer ( ReduceMoancount, 800, 1 )
    end
end




--CLEARS A DEAD ZOMBIE

---------------------------------------------------------------



setElementData(getRootElement(),"zombiestotal",0)
setElementData(getRootElement(),"zombiesalive",0)
createTeam("Zombies")


itemTableZombies = {
  {"Box of Matches",328,0.4,90,5},
  {"Wood Pile",1463,0.4,0,5},
  {"M1911",346,1,90,0.4},
  {"M9 SD",347,1,90,0.4},
  {"Winchester 1866",349,1,90,0.4},
  {"PDW",352,1,90,0.3},
  {"Hunting Knife",335,1,90,7},
  {"Hatchet",339,1,90,7},
  {"Pizza",1582,1,0,7},
  {"Soda Bottle",2647,1,0,7},
  {"Empty Gas Canister",1650,1,0,5},
  {"Roadflare",324,1,90,9},
  {"Milk",2856,1,0,5},
  {"Assault Pack (ACU)",3026,0.5,0,6},
  {"Painkiller",2709,0.5,0,7},
  {"Empty Soda Cans",2673,0.5,0,6},
  {"Scruffy Burgers",2675,0.5,0,6},
  {"Grenade",342,1,0,0.5},
  {"Desert Eagle",348,1,90,0.3},
  {"Sawn-Off Shotgun",350,1,90,0.2},
  {"SPAZ-12 Combat Shotgun",351,1,90,0.2},
  {"MP5A5",353,1,90,0.1},
  {"Watch",2710,1,0,3},
  {"Heat Pack",1576,1,0,6  },
  {"Wire Fence",933,0.25,0,1},
  {"Crossbow",357,1,90,0.2},
  {"Alice Pack",3026,1,0,0.5},
  {"Tire",1073,1,0,1},
  {"Morphine",1579,1,0,2},
  {"Civilian Clothing",1577,1,0,12},
  {"Map",1277,0.8,90,4},
  {"GPS",2976,0.15,0,1},
  {"Pasta Can",2770,0.1,0,5},
  {"Beans Can",2601,1,0,5},
  {"Burger",2768,1,0,2},
  {"Radio Device",2966,0.5,0,3},
  {"Golf Club",333,1,90,0.5},
  {"Baseball Bat",336,1,90,0.5},
  {"Shovel",337,1,90,0.5}
}





function createZombieTable (player)
      --createtabel
      setElementData(player,"playerZombies",{"no","no","no","no","no","no","no","no","no"})
      setElementData(player,"spawnedzombies",0)
end




  zombiesaliveee = 0  -- Current Zombies alive


--------------------------------------------------------------------------------------------------------------------


function createZomieForPlayer (x,y,z)
   x,y,z = getElementPosition(source)
   counter = 0
   
   
   --outputChatBox ( "Zumbis Perto: " .. zombiesaliveee, player, 0, 238, 0, true ) 
   --outputChatBox ( "Zumbis Limite: " .. zombieslimite, player, 0, 238, 0, true ) 
   
   if getElementData(source,"lastzombiespawnposition") then
      local xL,yL,zL = getElementData(source,"lastzombiespawnposition")[1] or false,getElementData(source,"lastzombiespawnposition")[2] or false,getElementData(source,"lastzombiespawnposition")[3] or false
      if xL then
         if getDistanceBetweenPoints3D (x,y,z,xL,yL,zL) < 20 then
         --outputChatBox("Server: canceled zombie create (reason: is near old position)")
            return
         end
      end
   end  
  
   
   if getElementData(source, "spawnedzombies") + 3 <= gameplayVariables.playerzombies then -- If spawned zombies + 3 lower or equal to 9 -> Create zombies -> Increase digit (default: 9) to let more zombies spawn. WARNING: THE HIGHER THE VALUE, THE MORE LAG CAN OCCUR!
    for i = 1, gameplayVariables["amountzombies"] do --Amount of zombies to be spawned (default: 3) WARNING: THE HIGHER THE VALUE, THE MORE LAG CAN OCCUR!
      counter = counter+1
      
      local number1 = math.random(-49,40)
      local number2 = math.random(-38,42)

      
      randomZskin = math.random ( 1, table.getn ( ZombiePedSkins ) ) 
      local zombie = createPed ( tonumber( ZombiePedSkins[randomZskin] ),x+number1, y+number2,z, math.random(0, 360))
      local Zx, Zy, Zz = getElementPosition( zombie )
      
      setElementData(zombie,"zombie",true)
      setElementData(zombie,"blood",gameplayVariables["zombieblood"]) -- [ID:0000009 - Zombie menace] //L
      setElementData(zombie,"owner",source)
     
      --------------  
      if not rot then rot = math.random (1,359) end
      if not interior then interior = 0 end
      if not dimension then dimension = 0 end
      setTimer ( setElementInterior, 100, 1, zombie, tonumber(interior)) --sets interior
      setTimer ( setElementDimension, 100, 1, zombie, tonumber(dimension)) --sets dimension
      setElementData ( zombie, "zombie", true  )
      setElementData ( zombie, "forcedtoexist", true  )
      setTimer ( function (zombie, rot) if ( isElement ( zombie ) ) then setPedRotation ( zombie, rot ) end end, 500, 1, zombie, rot )
      setTimer ( function (zombie) if ( isElement ( zombie ) ) then setElementData ( zombie, "status", "idle" ) end end, 2000, 1, zombie )
      setTimer ( function (zombie) if ( isElement ( zombie ) ) then setElementData ( zombie, "forcedtoexist", true ) end end, 1000, 1, zombie )
      setTimer ( function (zombie) if ( isElement ( zombie ) ) then table.insert( everyZombie, zombie ) end end, 1000, 1, zombie )
      triggerClientEvent ( "Zomb_STFU", getRootElement(), zombie )
      -- ( "#ff0000[INFO]: #ffffffCriou Zumbi ", player, 0, 238, 0, true )  
      --------------  
      
    end
   setElementData(source,"lastzombiespawnposition",{x,y,z})
   setElementData(source,"spawnedzombies",getElementData(source,"spawnedzombies")+3)
   zombiesaliveee = zombiesaliveee + 3
   end
   

end
addEvent("createZomieForPlayer",true)
addEventHandler("createZomieForPlayer",getRootElement(),createZomieForPlayer)







--------------------------------------------------------------------------------------------------------------------






--Morte Via Player (SOCO) ou PED matando PED
function deanimated( ammo, attacker, weapon, bodypart )

   if getElementData(source, "blood") > 0 and not getElementData(source, "animal") then 
   -- ( "onpedwasted 1", player, 0, 238, 0, true ) 

   if (getElementData (source, "zombie") == true) then
   --outputChatBox ( "onpedwasted 2", player, 0, 238, 0, true )
   --outputChatBox ( "Zumbi Morreu de SOCO ou matou outro ou PED morreu", player, 255, 255, 0, true ) 
        
        if attacker and getElementType(attacker) == "player" then
        setElementData(attacker, "zombieskilled", getElementData(attacker, "zombieskilled") + 1)
        end
        
        zombiesaliveee = zombiesaliveee - 1 -- Anti LAG | Cria + Zumbis só depois de 60 Metros | HE HIGHER THIS VALUE, THE MORE LAG CAN OCCUR!
        zmoan(source) -- som quando zumbi morre
        setElementCollisionsEnabled(source, false)
  
  

        local x, y, z = getElementPosition(source)
        local pedCol = createColSphere(x, y, z, 1.5)
        setTimer(reviveDeadZombie, 360000, 1, ped, pedCol, source) -- 5 minutos  299900 | 1 minuto: 62900 | 360000 = original
  
  
  
        attachElements(pedCol, source)
        setElementData(pedCol, "parent", source)
        setElementData(pedCol, "playername", "Zombie")
        setElementData(pedCol, "deadman", true)
        setElementData(source, "deadzombie", true) --qualquer coisa mudo pra pedcol
        setElementData(pedCol, "deadman", true)
  
        local time = getRealTime()
        local hours = time.hour
        local minutes = time.minute
        setElementData(pedCol, "deadreason", "Foi morto as: " .. hours .. ":" .. minutes .. " | Motivo Desconhecido!.")

  
        for i, item in ipairs(itemTableZombies) do
        local value = math.percentChance(item[5] / 2.5, 1)
        setElementData(pedCol, item[1], value)
        local ammoData, weapID = getWeaponAmmoType(item[1], true)
          if ammoData and value > 0 then
                 setElementData(pedCol, ammoData, 1)
          end
        end
        
        local zombieCreator = getElementData(source, "owner")
        setElementData(zombieCreator, "spawnedzombies", getElementData(zombieCreator, "spawnedzombies") - 1)
        --setElementData(killer, "zombiesalive", getElementData(killer, "zombiesalive") - 1)
        --destroyElement(source)
   end
   end
   
  
    
end
addEventHandler("onPedWasted", root, deanimated)







function reviveDeadZombie(ped, pedCol, source)
   
 -- outputChatBox ( "Sumiu Corpo e Col do Zumbi que tinha morrido no soco...", player, 0, 238, 0, true ) 
  destroyElement(source)
  destroyElement(pedCol)

end







--------------------------------------------------------------------------------------------------------------------








--verificar se um ped é um zumbi ou não
function isPedZombie(ped)
    if (isElement(ped)) then
        if (getElementData (ped, "zombie") == true) then
            return true
        else
            return false
        end
    else
        return false
    end
end
addEvent( "onZombieLostPlayer", true )




function ZombieTargetCoords ( x,y,z )
    setElementData ( source, "Tx", x, false )
    setElementData ( source, "Ty", y, false )
    setElementData ( source, "Tz", z, false )
end
addEventHandler( "onZombieLostPlayer", getRootElement(), ZombieTargetCoords )









function zombieCheck1 ()
for i,ped in ipairs(getElementsByType("ped")) do
   if getElementData(ped,"zombie") then 
      goReturn = false
      local zombieCreator = getElementData(ped,"owner")
      if not isElement(zombieCreator) then 
      --outputDebugString("test")
            --outputChatBox ( "#ff0000[INFO]: #FFFF00Zombi Check", player, 0, 238, 0, true )
         
            
         if ( isPedDead ( ped ) == false ) then   
         if zombiesaliveee -1 >= 0 then
         zombiesaliveee = zombiesaliveee - 1

         end
         
         
         setElementData ( ped, "status", "dead" )   
         setElementData ( ped, "target", nil )
         setElementData ( ped, "leader", nil )
         destroyElement(ped)

         
         else
         --outputChatBox ( "Zumbi Morto, Não retirar o corpo", player, 0, 238, 0, true )
         end
         goReturn = true 
        
      end
      
      if not goReturn then
      local xZ,yZ,zZ = getElementPosition(getElementData(ped,"owner"))
      local x,y,z = getElementPosition(ped)
      if getDistanceBetweenPoints3D (x,y,z,xZ,yZ,zZ) > 60 then
      if ( isPedDead ( ped ) == false ) then
      --outputChatBox ( "#ff0000[INFO]: #FFFF00Zombi Check + de 60 Metros Longe do Ultimo. Remove Zumbi.", player, 0, 238, 0, true )
      --outputChatBox ( "#ff0000[INFO]: #FFFF00 Vivo ^^", player, 0, 238, 0, true ) 
      
         if zombiesaliveee -1 >= 0 then
         zombiesaliveee = zombiesaliveee - 1
         end
        
         if getElementData(zombieCreator,"spawnedzombies")-1 >= 0 then
            setElementData(zombieCreator,"spawnedzombies",getElementData(zombieCreator,"spawnedzombies")-1)
         end  
         setElementData ( ped, "status", "dead" )   
         setElementData ( ped, "target", nil )
         setElementData ( ped, "leader", nil )
         destroyElement(ped)
         
      else
      --outputChatBox ( "Zumbi Morto, Não retirar o corpo", player, 0, 238, 0, true )
      end
         
         
         
      end
      end
   end            
end      
end
setTimer(zombieCheck1,20000,0)





function outputChange(dataName,oldValue)
   if getElementType(source) == "player" then -- check if the element is a player
      if dataName == "spawnedzombies" then
         local newValue = getElementData(source,dataName) -- find the new value
         outputChatBox(oldValue.." to "..newValue) -- output the change for the affected player
      end
   end
end
--addEventHandler("onElementDataChange",getRootElement(),outputChange)








function destroyTable ()
for i,ped in ipairs(getElementsByType("ped")) do
   if getElementData(ped,"zombie") then 
      if getElementData(ped,"owner") == source then
         setElementData(getElementData(ped,"owner"),"spawnedzombies",getElementData(getElementData(ped,"owner"),"spawnedzombies")-1)
         --outputChatBox ( "#ff0000[INFO]: #FFFF00Destroi tabela de zumbis.", player, 0, 238, 0, true )
         zombiesaliveee = zombiesaliveee - 1
         setElementData ( ped, "status", "dead" )
         setElementData ( ped, "target", nil )
         setElementData ( ped, "leader", nil )
         destroyElement(ped)
      end
   end            
end
end
--
addEventHandler("onPlayerQuit",getRootElement(),destroyTable)





--function destroyDeadZombie(ped, pedCol)
function destroyDeadZombie(ped, pedCol, source)
  destroyElement(source)
  destroyElement(pedCol)
end



--function targetPlayerYead(player, targetPlayer, source)
--local targetPlayer = getElementData(ped, "zombie")
 --outputChatBox ( "target1111", player, 255, 255, 0 ) 
 -- if (targetPlayer) then  

 --outputChatBox ( "target", player, 255, 255, 0 ) 


 -- end
 -- end
 --setTimer(targetPlayerYead, 20000, 0)







function zombieKilled(killer, headshot, attacker, weapon, bodypart, loss )
  if killer then
    zombiesaliveee = zombiesaliveee - 1 -- Anti LAG | Cria + Zumbis só depois de 60 Metros | HE HIGHER THIS VALUE, THE MORE LAG CAN OCCUR!
    setElementData(killer, "zombieskilled", getElementData(killer, "zombieskilled") + 1)
  end

  zmoan(source) -- som quando zumbi morre
  killPed ( source, attacker, weapon, bodypart )
  setElementCollisionsEnabled(source, false)
  --tirar algumas variaveis pra ver se funfa.
  


  
   --if getElementType(source) == "ped" then
   --outputDebugString ( "Um Zumbi foi Morto" )
   -- end
  
  
  local x, y, z = getElementPosition(source)
  local pedCol = createColSphere(x, y, z, 1.5)
  setTimer(destroyDeadZombie, 360000, 1, ped, pedCol, source) -- 5 minutos  299900 | 1 minuto: 62900
  
  
  
  attachElements(pedCol, source)
  setElementData(pedCol, "parent", source)
  setElementData(pedCol, "playername", "Zombie")
  setElementData(pedCol, "deadman", true)
  setElementData(source, "deadzombie", true) --qualquer coisa mudo pra pedcol
  setElementData(pedCol, "deadman", true)
  
  local time = getRealTime()
  local hours = time.hour
  local minutes = time.minute
  setElementData(pedCol, "deadreason", "Foi morto as: " .. hours .. ":" .. minutes .. " | Alguem passou por aqui!.")

   if weapon == 33 then
   setElementData(pedCol, "Crossbow Mag", 1)
   else
  
   for i, item in ipairs(itemTableZombies) do
    local value = math.percentChance(item[5] / 2.5, 1)
    setElementData(pedCol, item[1], value)
    local ammoData, weapID = getWeaponAmmoType(item[1], true)
    if ammoData and value > 0 then
      setElementData(pedCol, ammoData, 1)
    end
  end
  
  end

  local zombieCreator = getElementData(source, "owner")
  setElementData(zombieCreator, "spawnedzombies", getElementData(zombieCreator, "spawnedzombies") - 1)
  --setElementData(killer, "zombiesalive", getElementData(killer, "zombiesalive") - 1)
  --destroyElement(source)
  if headshot == true then
    setElementData(killer, "headshots", getElementData(killer, "headshots") + 1)
  end

  


end
addEvent("onZombieGetsKilled", true)
addEventHandler("onZombieGetsKilled", getRootElement(), zombieKilled)





















--Define a atividade ZOMBIE QUANDO muda de estado
addEventHandler ( "onElementDataChange", getRootElement(),
function ( dataName )
    if getElementType ( source ) == "ped" and dataName == "status" then
        if (getElementData (source, "zombie") == true) then
            if ( isPedDead ( source ) == false ) then
                if (getElementData ( source, "status" ) ==  "chasing" ) then
                    local Zx, Zy, Zz = getElementPosition( source )
                    setTimer ( Zomb_chase, 1000, 1, source, Zx, Zy, Zz )
                    local newtarget = (getElementData ( source, "target" ))
                    if isElement (newtarget) then
                        if getElementType ( newtarget ) == "player" then
                            setElementSyncer ( source, newtarget )
                        end
                    end
                    zmoan(source)
                elseif (getElementData ( source, "status" ) ==  "idle" ) then
                    setTimer ( Zomb_Idle, 1000, 1, source)
                elseif (getElementData ( source, "status" ) ==  "throatslashing" ) then
                    local tx,ty,tz = getElementPosition( source )
                    local ptarget = getElementData ( source, "target" )
                    if isElement(ptarget) then
                        local vx,vy,vz = getElementPosition( ptarget )
                        local zombdistance = (getDistanceBetweenPoints3D (tx, ty, tz, vx, vy, vz))
                        
                        if (zombdistance < .8) then
                        
                        --if getElementData(ptarget, "Helmet") >= 1 then
                            --outputChatBox ( "Tem ocapacete, não leva Mordida", player, 0, 238, 0, true )  
                            --setElementData ( source, "status", "idle" )                          
                            --else
                            --outputChatBox ( "Não tem o capacete, entao leva Mordida", player, 0, 238, 0, true )
                            zmoan(source)
                            randdamagee = math.random(800,3000) -- DEFAULT: math.random(2000,5000)
                            setElementData(ptarget, "blood", getElementData(ptarget, "blood") - randdamagee)
                            setElementData(ptarget, "bleeding", 50)

                            

                            if randdamagee > 4800 then
                            setElementData(ptarget, "pain", true)
                            setPedAnimation ( source, "knife", "KILL_Knife_Player", -1, false, false, true)
                            setPedAnimation(ptarget, "knife", "KILL_Knife_Ped_Damage", 2000, false, false, nil, false)
                            --triggerClientEvent ( "zumbihit", ptarget)
                            setTimer ( Playerthroatbitten, 2300, 1, ptarget, source)
                            end
                                
                            if randdamagee < 4099 then
                            setPedAnimation ( source, "knife", "KILL_Knife_Player", -1, false, false, true)
                            setPedAnimation(ptarget, "knife", "KILL_Knife_Ped_Damage", 2000, false, false, nil, false) 
                            --triggerClientEvent ( "zumbihit", ptarget)
                            --setPedAnimation(ptarget, "BOMBER", "BOM_Plant", 2000, false, false, nil, false) 
                            setTimer ( Playerthroatbitten, 2300, 1, ptarget, source)
                            
                            end
                            
                            if getElementData(ptarget, "blood") <= 3000 and getElementData(ptarget, "blood") > 0 and not getElementData(ptarget, "isDead") == true then
                            --outputChatBox("Desmaiado por zumbi!", ptarget, 27, 89, 224, true)
                            timeinComa = "14000" -- 15 segundos
                            triggerEvent("putPlayerInComa", ptarget, timeinComa)
                            
                            zmoan(source)
                            end
                            
                            
                            if getElementData(ptarget, "blood") <= 0 and not getElementData(ptarget, "isDead") == true then 
                            --outputChatBox ( "Player Morreu", player, 0, 238, 0, true )
                            setTimer ( function (source) if ( isElement ( source ) ) then setElementData ( source, "status", "idle" ) end end, 5000, 1, source )
                            
                            else
                            --outputChatBox ( "Player Não Morre", player, 0, 238, 0, true )
                            setElementData ( source, "status", "idle" )  
                            --setElementData ( source, "status", "chasing" )
                            end
                            --end
                            
                            
                            
                        else
                            setElementData ( source, "status", "idle" )
                        end
                    else
                        setElementData ( source, "status", "idle" )
                    end
                end
            elseif (getElementData ( source, "status" ) ==  "dead" ) then
            --setTimer ( Zomb_delete, 10000, 1, source)
            end
        end
    end
end)




--MATA DE ATAQUE ZOMBIE
addEvent( "playereaten", true )
function Playerinfected ( player, attacker, weapon, bodypart)
--outputChatBox ( "Infected!", player, 255, 255, 0 ) 
--killPed ( player, attacker, weapon, bodypart )
end
addEventHandler( "playereaten", getRootElement(), Playerinfected )








--Verifica se zumbi agarrou por traz
function Playerthroatbitten ( player, attacker)
    local Zx, Zy, Zz = getElementPosition( attacker )
    local Px, Py, Pz = getElementPosition( player )
    local distance = (getDistanceBetweenPoints3D( Px, Py, Pz, Zx, Zy, Zz ))
    if (distance < 1) then

    
    --outputChatBox ( "Zumbi Mordeu!", player, 255, 255, 0 ) 
    

    else
        setPedAnimation (player)
    end
end







