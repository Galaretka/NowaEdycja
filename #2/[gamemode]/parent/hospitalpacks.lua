function updateHospitals ()
	for i,box in pairs(hospitalCol) do
		for _,items in ipairs(lootItems["hospital"]) do
			setElementData(hospitalCol[i],items[1],math.random(1,5))
		end
	end
	setTimer(updateHospitals,3600000,1)
end

hospitalCol = {}
function createHospitalPacks()
	number1 = 0
	for i,box in ipairs(hospitalPacks) do
		number1 = number1+1
		local x,y,z = box[1],box[2],box[3]
		object = createObject(1558,x,y,z-0.3,nil,nil,nil)
		hospitalCol[i] = createColSphere(x,y,z,2)
		attachElements(hospitalCol[i],object,0,0,0)
		setElementData(hospitalCol[i],"parent",object)
		setElementData(hospitalCol[i],"hospitalbox",true)
		setElementData(hospitalCol[i],"MAX_Slots",40)
		for _,items in ipairs(lootItems["hospital"]) do
			setElementData(hospitalCol[i],items[1],math.random(1,3))
		end	
	end
	setTimer(updateHospitals,3600000,1)
end
createHospitalPacks()

for i,patrol in ipairs(patrolPoints) do
	local x,y,z = patrol[1],patrol[2],patrol[3]
	patrolCol = createColSphere(x,y,z,3)
	setElementData(patrolCol,"patrolstation",true)
	setElementData(patrolCol,"patrolbottle",true)
end