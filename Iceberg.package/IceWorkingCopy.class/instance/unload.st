operations
unload
	
	"Unload all code loaded into the image that belong to this repository"
	self packages do: [ :each | each unload ]