local itens = {
  { "M4" },
  { "CZ 550" },
  { "AK-47" },
  { "PDW" },
  { "Grenade" },
  { "PDW Mag" },
  { "AK Mag" },
  { "M4 Mag" },
  { "CZ 550 Mag" },

}

function tamanho( tabela )
  local count = 0
  for a in pairs( tabela ) do
    count = count + 1
  end
  return count
end

function AmmoAndWeaponBox( source, comando, quantmax )
    if isObjectInACLGroup ( "user."..getAccountName(getPlayerAccount(source)), aclGetGroup (  "Admin" ) ) and quantmax ~= nil then
 
        local x, y, z = getElementPosition(source)
        local xr, yr, zr = getElementRotation(source)
        px, py, pz = getElementPosition(source)
        prot = getPedRotation(source)
        local offsetRot = math.rad(prot + 90)
        local vx = px + 5 * math.cos(offsetRot)
        local vy = py + 5 * math.sin(offsetRot)
        local vz = pz + 2
        local vrot = prot + 180
		createBlip ( px, py, pz, 5)
        tent = createObject(2359, vx, vy, z - 0.6, 0, 0, vrot)
        setObjectScale(tent, 1.3)
        tentCol = createColSphere(x, y, z, 4)
        attachElements(tentCol, tent, 0, 0, 0)
        setElementData(tentCol, "parent", tent)
        setElementData(tent, "parent", tentCol)
        setElementData(tentCol, "tent", true)
        setElementData(tentCol, "vehicle", true)
        setElementData(tentCol, "MAX_Slots", (tamanho(itens)*quantmax))
		
       outputChatBox ( "#FF0000Zostal wykonany zrzut skrzyni! Ikona samolotu na mapie ", getRootElement(), 255, 255, 255, true )
       local i = 1
      
       for mtaz in pairs( itens ) do    
         setElementData(tentCol, itens[i][1], tonumber(quantmax))
         i = i + 1
       end
   end
end
addCommandHandler("weaponbox", AmmoAndWeaponBox)