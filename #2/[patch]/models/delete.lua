deletefiles = {
	"clothing/standart.dff",
	"clothing/mask1.dff",
	"clothing/mask2.dff",
	"clothing/mask3.dff",
	"clothing/mask4.dff",
	"clothing/headlight.dff",
	"weapon/cuntgun.dff",
	"weapon/sawnoff.dff"
}

function onStartResourceDeleteFiles()
	for i=0, #deletefiles do
		fileDelete(deletefiles[i])
	end
end
addEventHandler("onClientResourceStart", getResourceRootElement(getThisResource()), onStartResourceDeleteFiles)