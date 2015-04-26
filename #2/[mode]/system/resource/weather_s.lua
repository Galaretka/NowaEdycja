setFarClipDistance(1000)
setTrafficLightState(9)
setWeather(7)

function checkSetTime()
    local realtime = getRealTime()
    setTime(realtime.hour, realtime.minute)
    setMinuteDuration(60000)
	setTrafficLightState(9)
end
setTimer(checkSetTime,60000,0)
checkSetTime()

function setWeather2()
	local hour, minutes = getTime()
	local number = math.random(1,9)
	if hour < 21 and hour > 8 and number == 1 then
		setWeather(0)
	elseif hour < 21 and hour > 8 and number == 2 then
		setWeather(1)
	elseif hour < 21 and hour > 8 and number == 3 then
		setWeather(14)
	elseif hour < 21 and hour > 8 and number == 4 then
		setWeather(9)
	elseif hour < 21 and hour > 8 and number == 5 then
		setWeather(10)
	elseif hour < 21 and hour > 8 and number == 6 then
		setWeather(14)
	elseif hour < 21 and hour > 8 and number == 7 then
		setWeather(8)
	elseif hour >= 21 and hour < 7 and number > 0 then
		setWeather(7)
	end
end
setTimer(setWeather2,3500000,0)
setWeather2()