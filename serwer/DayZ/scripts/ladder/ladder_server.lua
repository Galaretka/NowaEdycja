function playFinishClimbingS ()
	if launch_available then
		setPedAnimation ( source, "ped", "CLIMB_jump_B", -1, false, true, false, false)
		local x,y,z = getElementPosition ( source )
			   local _, _, rotation = getElementRotation(source)
		x = x - math.sin(math.rad(rotation)) * 0.3
		y = y + math.cos(math.rad(rotation)) * 0.3
		setTimer ( function ( player, px, py, pz ) setElementFrozen ( player, false); setElementPosition ( player, px, py, pz)end,900,1,source,x,y,z+0.5)
	end
end

addEvent( "playFinishClimbing", true )
addEventHandler( "playFinishClimbing", getRootElement(), playFinishClimbingS )

launch_available = true


function askLaunchAvail()
	triggerClientEvent ( source, "recieveLaunchAvail", source, launch_available )
end

addEvent( "askLaunchAvailC", true )
addEventHandler( "askLaunchAvailC", getRootElement(), askLaunchAvail )