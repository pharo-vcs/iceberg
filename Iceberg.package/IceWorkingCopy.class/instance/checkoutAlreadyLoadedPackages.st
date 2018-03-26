API-loading
checkoutAlreadyLoadedPackages
	"Performs a checkout of packages that are already found in the image. 
	 while this strategy is questionable (and a better strategy would be checking out a 
	 project description (something that a metacello plugin should add_"
	self checkoutPackagesNamed: (self loadedPackages collect: #name)