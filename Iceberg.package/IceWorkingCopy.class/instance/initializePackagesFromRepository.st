initialization
initializePackagesFromRepository
	
	| loadedPackages |
	loadedPackages := self repository packages select: [ :each | each isLoaded ].
	loadedPackages do: [ :each | self addPackage: each ]