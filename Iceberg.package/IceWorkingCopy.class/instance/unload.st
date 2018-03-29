API-loading
unload
	
	"Unload all code loaded into the image that belong to this repository"
	self packages do: [ :each | self unloadPackage: each ]